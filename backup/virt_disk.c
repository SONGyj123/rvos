#include "virt_disk.h"
#include "def.h"

static struct disk {
  // a set (not a ring) of DMA descriptors, with which the
  // driver tells the device where to read and write individual
  // disk operations. there are NUM descriptors.
  // most commands consist of a "chain" (a linked list) of a couple of
  // these descriptors.
  struct virtq_desc *desc;

  // a ring in which the driver writes descriptor numbers
  // that the driver would like the device to process.  it only
  // includes the head descriptor of each chain. the ring has
  // NUM elements.
  struct virtq_avail *avail;

  // a ring in which the device writes descriptor numbers that
  // the device has finished processing (just the head of each chain).
  // there are NUM used ring entries.
  struct virtq_used *used;

  // our own book-keeping.
  char free[NUM];  // is a descriptor free?
  unsigned short used_idx; // we've looked this far in used[2..NUM].

  // track info about in-flight operations,
  // for use when completion interrupt arrives.
  // indexed by first descriptor index of chain.
  struct {
    struct buf *b;
    char status;
  } info[NUM];

  // disk command headers.
  // one-for-one with descriptors, for convenience.
  struct virtio_blk_req ops[NUM];

  //struct spinlock vdisk_lock;

} disk;

// mark a descriptor as free.
static void
free_desc(int i)
{
  if(i >= NUM)
    panic("free_desc 1");
  if(disk.free[i])
    panic("free_desc 2");
  disk.desc[i].addr = 0;
  disk.desc[i].len = 0;
  disk.desc[i].flags = 0;
  disk.desc[i].next = 0;
  disk.free[i] = 1;
  //wakeup(&disk.free[0]);
}

static int alloc_desc()
{
  for(int i = 0; i < NUM; i++){
    if(disk.free[i]){
      disk.free[i] = 0;
      return i;
    }
  }
  return -1;
}

static int
alloc3_desc(int *idx)
{
  for(int i = 0; i < 3; i++){
    idx[i] = alloc_desc();
    if(idx[i] < 0){
      for(int j = 0; j < i; j++)
        free_desc(idx[j]);
      return -1;
    }
  }
  return 0;
}

// free a chain of descriptors.
static void
free_chain(int i)
{
  while(1){
    int flag = disk.desc[i].flags;
    int nxt = disk.desc[i].next;
    free_desc(i);
    if(flag & VRING_DESC_F_NEXT)
      i = nxt;
    else
      break;
  }
}

void virt_disk_init()
{
	unsigned int magic_value = R_VIRTIO_REG(VIRTIO_MMIO_MAGIC_VALUE);
	unsigned int version = R_VIRTIO_REG(VIRTIO_MMIO_VERSION);
	unsigned int device_id = R_VIRTIO_REG(VIRTIO_MMIO_DEVICE_ID);
	unsigned int vendor_id = R_VIRTIO_REG(VIRTIO_MMIO_VENDOR_ID);

	if( magic_value != 0x74726976 ||
		version != 0x02 ||
		device_id != 0x02 ||
		vendor_id != 0x554d4551)
	{
		panic("virtio disk init failed!");
	}

	//写0到STATUS寄存器reset device
	W_VIRTIO_REG(VIRTIO_MMIO_STATUS, 0);

	//置位ACKNOWLEDGE status bit
	W_VIRTIO_REG(VIRTIO_MMIO_STATUS, R_VIRTIO_REG(VIRTIO_MMIO_INTERRUPT_STATUS)|VIRTIO_CONFIG_S_ACKNOWLEDGE);

	//置位driver status bit
	W_VIRTIO_REG(VIRTIO_MMIO_STATUS, R_VIRTIO_REG(VIRTIO_MMIO_INTERRUPT_STATUS)|VIRTIO_CONFIG_S_DRIVER);

	//feature
	unsigned long features = R_VIRTIO_REG(VIRTIO_MMIO_DEVICE_FEATURES);
	features &= ~(1 << VIRTIO_BLK_F_RO);
	features &= ~(1 << VIRTIO_BLK_F_SCSI);
	features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
	features &= ~(1 << VIRTIO_BLK_F_MQ);
	features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
	features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
	features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);

	//complete
	W_VIRTIO_REG(VIRTIO_MMIO_STATUS, R_VIRTIO_REG(VIRTIO_MMIO_INTERRUPT_STATUS)|VIRTIO_CONFIG_S_FEATURES_OK);

	//reread
	if(!(R_VIRTIO_REG(VIRTIO_MMIO_STATUS)&VIRTIO_CONFIG_S_FEATURES_OK))
	{
		panic("reread failed!");
	}

	//init queue 0
	W_VIRTIO_REG(VIRTIO_MMIO_QUEUE_SEL, 0);

	//make sure queue 0 not used
	if(R_VIRTIO_REG(VIRTIO_MMIO_QUEUE_READY))
	{
		panic("queue 0 is not ready");
	}

	//check size
	unsigned int max = R_VIRTIO_REG(VIRTIO_MMIO_QUEUE_NUM_MAX);
	if(max == 0)
	{
		panic("max = 0 ==> no queue 0");
	}
	else if(max < NUM)
	{
		panic("max < NUM ==> queue too short");
	}

	disk.desc = kalloc();	
	disk.avail = kalloc();	
	disk.used = kalloc();	

	if(!disk.desc || !disk.avail || !disk.used)
	{
		panic("disk kalloc");
	}

	memset(disk.desc, 0, 4096);
	memset(disk.avail, 0, 4096);
	memset(disk.used, 0, 4096);

	//set queue size
	W_VIRTIO_REG(VIRTIO_MMIO_QUEUE_NUM, NUM);

	W_VIRTIO_REG(VIRTIO_MMIO_DEVICE_DESC_LOW, (unsigned long)disk.desc);
	W_VIRTIO_REG(VIRTIO_MMIO_DEVICE_DESC_HIGH, (unsigned long)disk.desc>>32);
	W_VIRTIO_REG(VIRTIO_MMIO_DEVICE_DESC_LOW, (unsigned long)disk.avail);
	W_VIRTIO_REG(VIRTIO_MMIO_DEVICE_DESC_HIGH, (unsigned long)disk.avail>>32);
	W_VIRTIO_REG(VIRTIO_MMIO_DEVICE_DESC_LOW, (unsigned long)disk.used);
	W_VIRTIO_REG(VIRTIO_MMIO_DEVICE_DESC_HIGH, (unsigned long)disk.used>>32);

	//queue ready
	W_VIRTIO_REG(VIRTIO_MMIO_QUEUE_READY, 1);

	for(int n=0; n<NUM; n++)
	{
		disk.free[n] = 1;
	}

	//write ready
	W_VIRTIO_REG(VIRTIO_MMIO_STATUS, R_VIRTIO_REG(VIRTIO_MMIO_STATUS)|VIRTIO_CONFIG_S_DRIVER_OK);
	printf("virtio disk ready!\n");
}

void virtio_disk_rw(struct buf *b, int write)
{
	unsigned long sector = b->blockno * (BSIZE / 512);

	int idx[3];
	while(1)
	{
		if(alloc3_desc(idx) == 0)
		{
			break;
		}
	}

	struct virtio_blk_req *buf0 = &disk.ops[idx[0]];

	if(write)
	{
		buf0->type = VIRTIO_BLK_T_OUT; // write the disk
	}
	else
	{
		buf0->type = VIRTIO_BLK_T_IN; // read the disk
	}
	buf0->reserved = 0;
	buf0->sector = sector;

	disk.desc[idx[0]].addr = (unsigned long) buf0;
	disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
	disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
	disk.desc[idx[0]].next = idx[1];

	disk.desc[idx[1]].addr = (unsigned long) b->data;
	disk.desc[idx[1]].len = BSIZE;
	if(write)
	disk.desc[idx[1]].flags = 0; // device reads b->data
	else
	disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
	disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
	disk.desc[idx[1]].next = idx[2];

	disk.info[idx[0]].status = 0xff; // device writes 0 on success
	disk.desc[idx[2]].addr = (unsigned long) &disk.info[idx[0]].status;
	disk.desc[idx[2]].len = 1;
	disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
	disk.desc[idx[2]].next = 0;

	// record struct buf for virtio_disk_intr().
	b->disk = 1;
	disk.info[idx[0]].b = b;

	// tell the device the first index in our chain of descriptors.
	disk.avail->ring[disk.avail->idx % NUM] = idx[0];

	__sync_synchronize();

	// tell the device another avail ring entry is available.
	disk.avail->idx += 1; // not % NUM ...

	__sync_synchronize();

	W_VIRTIO_REG(VIRTIO_MMIO_QUEUE_NOTIFY, 0);
	//*R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number

	// Wait for virtio_disk_intr() to say request has finished.
	while(b->disk == 1) {
	}

	disk.info[idx[0]].b = 0;
	free_chain(idx[0]);
}










