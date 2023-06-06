#ifndef __VIRT_DISK
#define __VIRT_DISK

#define BSIZE 1024

#define VIRT_IO_BASE 0x10001000
#define NUM 8

#define VIRTIO_MMIO_MAGIC_VALUE 0x000
#define VIRTIO_MMIO_VERSION		0x004
#define VIRTIO_MMIO_DEVICE_ID		0x008
#define VIRTIO_MMIO_VENDOR_ID		0x00c
#define VIRTIO_MMIO_DEVICE_FEATURES 0x010
#define VIRTIO_MMIO_DRIVER_FEATURES 0x020
#define VIRTIO_MMIO_QUEUE_SEL 0x030        // select queue, write-only
#define VIRTIO_MMIO_QUEUE_NUM_MAX 0x034    // max size of current queue, read-only
#define VIRTIO_MMIO_QUEUE_NUM 0x038        // size of current queue, write-only
#define VIRTIO_MMIO_QUEUE_READY 0x044      // ready bit
#define VIRTIO_MMIO_QUEUE_NOTIFY 0x050     // write-only
#define VIRTIO_MMIO_INTERRUPT_STATUS 0x060 // read-only
#define VIRTIO_MMIO_INTERRUPT_ACK 0x064    // write-only
#define VIRTIO_MMIO_STATUS 0x070           // read/write
#define VIRTIO_MMIO_QUEUE_DESC_LOW 0x080   // physical address for descriptor table, write-only
#define VIRTIO_MMIO_QUEUE_DESC_HIGH 0x084
#define VIRTIO_MMIO_DRIVER_DESC_LOW 0x090 // physical address for available ring, write-only
#define VIRTIO_MMIO_DRIVER_DESC_HIGH 0x094
#define VIRTIO_MMIO_DEVICE_DESC_LOW 0x0a0 // physical address for used ring, write-only
#define VIRTIO_MMIO_DEVICE_DESC_HIGH 0x0a4

// status register bits, from qemu virtio_config.h
#define VIRTIO_CONFIG_S_ACKNOWLEDGE 1
#define VIRTIO_CONFIG_S_DRIVER 2
#define VIRTIO_CONFIG_S_DRIVER_OK 4
#define VIRTIO_CONFIG_S_FEATURES_OK 8

// device feature bits
#define VIRTIO_BLK_F_RO 5          /* Disk is read-only */
#define VIRTIO_BLK_F_SCSI 7        /* Supports scsi command passthru */
#define VIRTIO_BLK_F_CONFIG_WCE 11 /* Writeback mode available in config */
#define VIRTIO_BLK_F_MQ 12         /* support more than one vq */
#define VIRTIO_F_ANY_LAYOUT 27
#define VIRTIO_RING_F_INDIRECT_DESC 28
#define VIRTIO_RING_F_EVENT_IDX 29

#define VIRTIO_BLK_T_IN 0  // read the disk
#define VIRTIO_BLK_T_OUT 1 // write the disk

#define R_VIRTIO_REG(reg) (*(unsigned int *)(VIRT_IO_BASE+reg))
#define W_VIRTIO_REG(reg, val) ((*(unsigned int *)(VIRT_IO_BASE+reg)) = val)

// a single descriptor, from the spec.
struct virtq_desc
{
  unsigned long addr;
  unsigned int len;
  unsigned short flags;
  unsigned short next;
};
#define VRING_DESC_F_NEXT 1  // chained with another descriptor
#define VRING_DESC_F_WRITE 2 // device writes (vs read)

// the (entire) avail ring, from the spec.
struct virtq_avail
{
  unsigned short flags;     // always zero
  unsigned short idx;       // driver will write ring[idx] next
  unsigned short ring[NUM]; // descriptor numbers of chain heads
  unsigned short unused;
};

// one entry in the "used" ring, with which the
// device tells the driver about completed requests.
struct virtq_used_elem
{
  unsigned int id; // index of start of completed descriptor chain
  unsigned int len;
};

struct virtq_used
{
  unsigned short flags; // always zero
  unsigned short idx;   // device increments when it adds a ring[] entry
  struct virtq_used_elem ring[NUM];
};

struct virtio_blk_req
{
  unsigned int type; // VIRTIO_BLK_T_IN or ..._OUT
  unsigned int reserved;
  unsigned long sector;
};

//buff cache就是这一个
struct buf
{
	int valid;
	int disk;
	unsigned int dev;
	unsigned int blockno;
	unsigned int refcnt;
	struct buf *pre;
	struct buf *nxt;
	unsigned char data[BSIZE];
};

//declaration
void virt_disk_init();
void virtio_disk_rw(struct buf* b, int write);

#endif
