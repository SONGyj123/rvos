# 1 "src/virt_disk.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/virt_disk.c"
# 1 "src/virt_disk.h" 1
# 52 "src/virt_disk.h"
struct virtq_desc
{
  unsigned long addr;
  unsigned int len;
  unsigned short flags;
  unsigned short next;
};




struct virtq_avail
{
  unsigned short flags;
  unsigned short idx;
  unsigned short ring[8];
  unsigned short unused;
};



struct virtq_used_elem
{
  unsigned int id;
  unsigned int len;
};

struct virtq_used
{
  unsigned short flags;
  unsigned short idx;
  struct virtq_used_elem ring[8];
};

struct virtio_blk_req
{
  unsigned int type;
  unsigned int reserved;
  unsigned long sector;
};


struct buf
{
 int valid;
 int disk;
 unsigned int dev;
 unsigned int blockno;
 unsigned int refcnt;
 struct buf *pre;
 struct buf *nxt;
 unsigned char data[1024];
};


void virt_disk_init();
void virtio_disk_rw(struct buf* b, int write);
# 2 "src/virt_disk.c" 2
# 1 "include/def.h" 1
# 26 "include/def.h"
typedef unsigned long *pgt_t;
typedef unsigned long pte_t;

void *memset(void *s, int val, unsigned int count);

int free_mem_in_page(void *pa_s, void *pa_e);
void kfree(void *p);
void kp_free_mem();
void *kalloc(void);
unsigned long uvmalloc(pgt_t pagetable, unsigned long oldsz, unsigned newsz, int perm);

pte_t *walk(pgt_t pagetable, unsigned long va, int alloc);
unsigned long va_to_pa(pgt_t pagetable, unsigned long va);
int map_page(pgt_t pagetable, unsigned long pa, unsigned long va,unsigned long size, int perm);
int copy_from_user(pgt_t user_pgt, void *dst, const void *src, unsigned long len);
int copy_to_user(pgt_t user_pgt, void *dst, const void *src, unsigned long len);

void loadsec(pgt_t pagetable, struct inode *ip, unsigned long va, unsigned int offset, unsigned int sz);


void printf(char *fmt, ...);
void panic(char *s);


void uart_send_c(char c);
void uart_send_str(char *s);
char uart_rd_char();


void *memset(void *s, int val, unsigned int count);
void *memmove(char *dst, const char *src, int n);
void *memcpy(void *dst, const void *src, int n);
int strncmp(const char *p, const char *q, unsigned int n);
# 3 "src/virt_disk.c" 2




static struct disk
{





  struct virtq_desc *desc;





  struct virtq_avail *avail;




  struct virtq_used *used;


  char free[8];
  unsigned short used_idx;




  struct
  {
    struct buf *b;
    char status;
  } info[8];



  struct virtio_blk_req ops[8];



} disk;

void virt_disk_init(void)
{
  unsigned int status = 0;



  if (*((volatile unsigned int *)(0x10001000 + (0x000))) != 0x74726976 ||
      *((volatile unsigned int *)(0x10001000 + (0x004))) != 2 ||
      *((volatile unsigned int *)(0x10001000 + (0x008))) != 2 ||
      *((volatile unsigned int *)(0x10001000 + (0x00c))) != 0x554d4551)
  {
    panic("could not find virtio disk");
  }


  *((volatile unsigned int *)(0x10001000 + (0x070))) = status;


  status |= 1;
  *((volatile unsigned int *)(0x10001000 + (0x070))) = status;


  status |= 2;
  *((volatile unsigned int *)(0x10001000 + (0x070))) = status;


  unsigned long features = *((volatile unsigned int *)(0x10001000 + (0x010)));
  features &= ~(1 << 5);
  features &= ~(1 << 7);
  features &= ~(1 << 11);
  features &= ~(1 << 12);
  features &= ~(1 << 27);
  features &= ~(1 << 29);
  features &= ~(1 << 28);
  *((volatile unsigned int *)(0x10001000 + (0x020))) = features;


  status |= 8;
  *((volatile unsigned int *)(0x10001000 + (0x070))) = status;


  status = *((volatile unsigned int *)(0x10001000 + (0x070)));
  if (!(status & 8))
    panic("virtio disk FEATURES_OK unset");


  *((volatile unsigned int *)(0x10001000 + (0x030))) = 0;


  if (*((volatile unsigned int *)(0x10001000 + (0x044))))
    panic("virtio disk should not be ready");


  unsigned int max = *((volatile unsigned int *)(0x10001000 + (0x034)));
  if (max == 0)
    panic("virtio disk has no queue 0");
  if (max < 8)
    panic("virtio disk max queue too short");


  disk.desc = kalloc();
  disk.avail = kalloc();
  disk.used = kalloc();
  if (!disk.desc || !disk.avail || !disk.used)
    panic("virtio disk kalloc");
  memset(disk.desc, 0, 4096);
  memset(disk.avail, 0, 4096);
  memset(disk.used, 0, 4096);


  *((volatile unsigned int *)(0x10001000 + (0x038))) = 8;


  *((volatile unsigned int *)(0x10001000 + (0x080))) = (unsigned long)disk.desc;
  *((volatile unsigned int *)(0x10001000 + (0x084))) = (unsigned long)disk.desc >> 32;
  *((volatile unsigned int *)(0x10001000 + (0x090))) = (unsigned long)disk.avail;
  *((volatile unsigned int *)(0x10001000 + (0x094))) = (unsigned long)disk.avail >> 32;
  *((volatile unsigned int *)(0x10001000 + (0x0a0))) = (unsigned long)disk.used;
  *((volatile unsigned int *)(0x10001000 + (0x0a4))) = (unsigned long)disk.used >> 32;


  *((volatile unsigned int *)(0x10001000 + (0x044))) = 0x1;


  for (int i = 0; i < 8; i++)
    disk.free[i] = 1;


  status |= 4;
  *((volatile unsigned int *)(0x10001000 + (0x070))) = status;
printf("virt_disk initialize ok");

}


static int
alloc_desc()
{
  for (int i = 0; i < 8; i++)
  {
    if (disk.free[i])
    {
      disk.free[i] = 0;
      return i;
    }
  }
  return -1;
}


static void
free_desc(int i)
{
  if (i >= 8)
    panic("free_desc 1");
  if (disk.free[i])
    panic("free_desc 2");
  disk.desc[i].addr = 0;
  disk.desc[i].len = 0;
  disk.desc[i].flags = 0;
  disk.desc[i].next = 0;
  disk.free[i] = 1;

}


static void
free_chain(int i)
{
  while (1)
  {
    int flag = disk.desc[i].flags;
    int nxt = disk.desc[i].next;
    free_desc(i);
    if (flag & 1)
      i = nxt;
    else
      break;
  }
}



static int
alloc3_desc(int *idx)
{
  for (int i = 0; i < 3; i++)
  {
    idx[i] = alloc_desc();
    if (idx[i] < 0)
    {
      for (int j = 0; j < i; j++)
        free_desc(idx[j]);
      return -1;
    }
  }
  return 0;
}

void virtio_disk_rw(struct buf *b, int write)
{
  unsigned long sector = b->blockno * (1024 / 512);
# 218 "src/virt_disk.c"
  int idx[3];
  while (1)
  {
    if (alloc3_desc(idx) == 0)
    {
      break;
    }

  }




  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];

  if (write)
    buf0->type = 1;
  else
    buf0->type = 0;
  buf0->reserved = 0;
  buf0->sector = sector;

  disk.desc[idx[0]].addr = (unsigned long)buf0;
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
  disk.desc[idx[0]].flags = 1;
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (unsigned long)b->data;
  disk.desc[idx[1]].len = 1024;
  if (write)
    disk.desc[idx[1]].flags = 0;
  else
    disk.desc[idx[1]].flags = 2;
  disk.desc[idx[1]].flags |= 1;
  disk.desc[idx[1]].next = idx[2];

  disk.info[idx[0]].status = 0xff;
  disk.desc[idx[2]].addr = (unsigned long)&disk.info[idx[0]].status;
  disk.desc[idx[2]].len = 1;
  disk.desc[idx[2]].flags = 2;
  disk.desc[idx[2]].next = 0;


  b->disk = 1;
  disk.info[idx[0]].b = b;


  disk.avail->ring[disk.avail->idx % 8] = idx[0];

  __sync_synchronize();


  disk.avail->idx += 1;

  __sync_synchronize();

  *((volatile unsigned int *)(0x10001000 + (0x050))) = 0;



  while (b->disk == 1)
  {

  }

  disk.info[idx[0]].b = 0;
  free_chain(idx[0]);


}

void virtio_intr()
{
 *((volatile unsigned int *)(0x10001000 + (0x064))) = *((volatile unsigned int *)(0x10001000 + (0x060))) & 0x3;

 while (disk.used_idx != disk.used->idx)
 {
  __sync_synchronize();
  int id = disk.used->ring[disk.used_idx % 8].id;

  if (disk.info[id].status != 0)
    panic("virtio_disk_intr status");

  struct buf *b = disk.info[id].b;
  b->disk = 0;


  disk.used_idx += 1;
 }

}
