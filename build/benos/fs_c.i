# 1 "src/fs.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/fs.c"
# 1 "src/fs.h" 1
# 14 "src/fs.h"
struct superblock
{
 unsigned int magic_num;
 unsigned int size;
 unsigned int data_blk_num;
 unsigned int inode_num;
 unsigned int log_num;
 unsigned int s_data_blk;
 unsigned int s_inode_blk;
 unsigned int s_bmap;
};


struct dinode
{
 short type;
 short major;
 short minor;
 short nlink;
 unsigned int size;
 unsigned int data_address[12 +1];
};


struct inode
{
 unsigned int ndev;
 unsigned int ninode;
 int ref;
 int valid;

 struct dinode content;
};


struct dirent
{
 unsigned short inum;
 char name[14];
};


struct elfhdr
{
 unsigned int magic_num;
 unsigned char elf[12];
 unsigned short type;
 unsigned short mach;
 unsigned int version;
 unsigned long entry;
 unsigned long phyoff;
 unsigned long shoff;
 unsigned int flag;
 unsigned short ehsize;
 unsigned short phentsize;
 unsigned short phnum;
 unsigned short shentsize;
 unsigned short shnum;
 unsigned short shstrndx;
};


struct proghdr
{
 unsigned int type;
 unsigned int flags;
 unsigned long off;
 unsigned long vaddr;
 unsigned long paddr;
 unsigned long filesz;
 unsigned long memsz;
 unsigned long align;
};





void fs_init();
char *get_nxt_name(char *path, char *name);
int get_inode(char *path, struct inode *ino);
void read_elfhr(struct elfhdr* hdr, struct proghdr* phdr, struct inode *ino_ptr);
int read_from_inode(struct inode *ip, unsigned long dst, unsigned long offset, unsigned int len, int to_where);
int write_to_inode(struct inode *ip, unsigned long src, unsigned long offset, unsigned int len, int to_where);


struct file *new_file_st();
# 2 "src/fs.c" 2

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
# 4 "src/fs.c" 2
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
# 5 "src/fs.c" 2
# 1 "src/proc.h" 1




# 1 "src/fd.h" 1






# 1 "src/proc.h" 1
# 8 "src/fd.h" 2


struct file
{
 enum {FD_NONE, FD_PIPE, FD_INODE, FD_DEVICE} type;
 int ref_cnt;
 char readable;
 char writable;
 struct inode *ip;
 struct pipe *pipe;
 unsigned int off;
 short major;
};


struct file *file_alloc();
struct file *file_dup(struct file *file);
void file_close(struct file *file);
int fd_alloc(struct file *file_t_addr);
# 6 "src/proc.h" 2
# 1 "src/locks.h" 1



struct spinlock
{
 unsigned int locked;
};

void acquire(struct spinlock *lk);
void release(struct spinlock *lk);
# 7 "src/proc.h" 2
# 17 "src/proc.h"
struct trapframe {
            unsigned long kernel_satp;
            unsigned long kernel_sp;
            unsigned long kernel_trap;
            unsigned long epc;
            unsigned long kernel_hartid;
            unsigned long ra;
            unsigned long sp;
            unsigned long gp;
            unsigned long tp;
            unsigned long t0;
            unsigned long t1;
            unsigned long t2;
            unsigned long s0;
            unsigned long s1;
            unsigned long a0;
            unsigned long a1;
            unsigned long a2;
            unsigned long a3;
            unsigned long a4;
            unsigned long a5;
            unsigned long a6;
            unsigned long a7;
            unsigned long s2;
            unsigned long s3;
            unsigned long s4;
            unsigned long s5;
            unsigned long s6;
            unsigned long s7;
            unsigned long s8;
            unsigned long s9;
            unsigned long s10;
            unsigned long s11;
            unsigned long t3;
            unsigned long t4;
            unsigned long t5;
            unsigned long t6;
};

struct context
{
 unsigned long ra;
 unsigned long sp;
 unsigned long s0;
 unsigned long s1;
 unsigned long s2;
 unsigned long s3;
 unsigned long s4;
 unsigned long s5;
 unsigned long s7;
 unsigned long s8;
 unsigned long s9;
 unsigned long s10;
 unsigned long s11;
};

struct proc
{
 unsigned long *kstack;
 pgt_t proc_pagetable;
 struct trapframe *trapframe;
 struct context context;
 unsigned long prog_size;
 char name[10];
 int state;
 int pid;
 int killed;
 unsigned long sleep_chan;
 struct proc *parent;

 struct file *ofile[10];
};


void init_proc_kstack(pgt_t pagetable);
void user_init();
pgt_t proc_pagetable();
void scheduler();
void back_to_kernel();

int fork();
void exit(int code);
int wait();
void sleep(unsigned long *chan, struct spinlock *lock);
void wakeup(unsigned long *chan);
# 6 "src/fs.c" 2

extern struct proc *proc_ptr;

struct superblock sb;


unsigned int inode_which_block(unsigned int inum, struct superblock sb)
{
 unsigned int which_block;

 which_block = inum/(1024/(sizeof(struct inode))) + sb.s_inode_blk;

 return which_block;
}


void rd_inode(unsigned int inum, struct inode *inode_buf)
{
 struct buf *buf = kalloc();
 struct dinode *p;

 buf->dev = 0x01;
 buf->blockno = inode_which_block(inum, sb);
 buf->valid = 0x00;
 buf->refcnt = 0x01;

 virtio_disk_rw(buf, 0);

 p = ((struct dinode *)(&(buf->data)))+(inum%(1024/(sizeof(struct inode))));
 inode_buf->ndev = 0x01;
 inode_buf->ninode = inum;
 inode_buf->content = *p;

 kfree(buf);
}


static void read_sb(struct superblock *sb)
{
 struct buf *blk_buf = kalloc();
 if(blk_buf == 0)
 {
  panic("blk_buf is NULL");
 }

 blk_buf->dev = 0x01;
 blk_buf->blockno = 0x01;
 blk_buf->valid = 0x00;
 blk_buf->refcnt = 0x01;
 virtio_disk_rw(blk_buf, 0);
 memmove(sb, blk_buf->data, sizeof(struct superblock));

 kfree(blk_buf);
}

void fs_init()
{
 read_sb(&sb);
 if(sb.magic_num != 0x40302010)
 {
  printf("------------------wrong superblock\n");
 }
 else
 {
  printf("s_inode_blk: %d\n", sb.s_inode_blk);
  printf("s_data_blk: %d\n", sb.s_data_blk);
 }
}

char *get_nxt_name(char *path, char *name)
{
 char *s;
 int len = 0;
 for(int n=0; n<14; n++)
 {
  name[n] = 0;
 }


 if(*path == 0)
 {
  return 0;
 }
 if(*path == '/')
 {
  path++;
 }
 else
 {
  return 0;
 }

 s = path;

 while(*path != '/' && *path != '\0')
 {
  path++;
 }

 len = path - s;
 memmove(name, s, len);

 return path;
}


int get_inode(char *path, struct inode *ino)
{
 char *ptr = path;
 char name[14];
 int inum = 0;
 struct inode cur_inode;
 struct dirent *de_ptr;

 if(ptr == 0)
 {
  printf("bad path\n");
  return 0;
 }

 while(ptr != 0)
 {
  ptr = get_nxt_name(ptr, name);

  rd_inode(inum, &cur_inode);


  for(int offset=0; offset<cur_inode.content.size; offset += sizeof(struct dirent))
  {
   struct buf *blk_buf = kalloc();
   blk_buf->dev = 0x01;
   blk_buf->blockno = cur_inode.content.data_address[offset / 1024];
   blk_buf->valid = 0x00;
   blk_buf->refcnt = 0x01;

   virtio_disk_rw(blk_buf, 0);


   de_ptr = (struct dirent *)(&(blk_buf->data[offset % 1024]));
   if(strncmp(de_ptr->name, name, 14) == 0)
   {

    rd_inode(de_ptr->inum, ino);
    kfree(blk_buf);
    goto found;
   }

   kfree(blk_buf);
  }
 }

 printf("get_inode() failed!\n");
 printf("nothing found!\n");
 return 0;

found:
 return 1;
}


unsigned int blknum_to_addr(struct inode *ip, unsigned int blknum)
{
 unsigned int addr = 0;

 if(blknum < 12)
 {
  addr = ip->content.data_address[blknum];
  return addr;
 }


 struct buf *indirect_index_buf = kalloc();
 unsigned int *indirect;
 blknum -= 12;

 if(blknum < (1024/(sizeof(unsigned int))))
 {

  addr = ip->content.data_address[12];

  indirect_index_buf->dev = 0x01;
  indirect_index_buf->blockno = addr;
  indirect_index_buf->valid = 0x00;
  indirect_index_buf->refcnt = 0x01;

  virtio_disk_rw(indirect_index_buf, 0);

  indirect = (unsigned int *)indirect_index_buf->data;
  addr = indirect[blknum];

  kfree(indirect_index_buf);
  return addr;
 }

 panic("out of range");

 return 0;
}

void read_elfhr(struct elfhdr* hdr, struct proghdr *phdr, struct inode *ino_ptr)
{
 struct buf *blk_buf = kalloc();
 if(blk_buf == 0)
 {
  panic("blk_buf is NULL");
 }

 blk_buf->dev = 0x01;
 blk_buf->blockno = ino_ptr->content.data_address[0];
 blk_buf->valid = 0x00;
 blk_buf->refcnt = 0x01;

 virtio_disk_rw(blk_buf, 0);

 if(blk_buf->data[0] != 0x7f || blk_buf->data[1] != 'E' || blk_buf->data[2] != 'L' || blk_buf->data[3] != 'F')
 {
  printf("bad elf\n");
  goto end;
 }


 *hdr = *(struct elfhdr *)(blk_buf->data);
 phdr[0] = *(struct proghdr *)((struct elfhdr *)(blk_buf->data)+1);
 phdr[1] = *(struct proghdr *)((blk_buf->data)+sizeof(struct elfhdr)+sizeof(struct proghdr));

end:
 kfree(blk_buf);
}



int read_from_inode(struct inode *ip, unsigned long dst, unsigned long offset, unsigned int len, int to_where)
{
 unsigned int total_rd = 0;
 unsigned int inode_blknum = offset/1024;
 unsigned int blk_offset = offset%1024;
 unsigned int single_rd_len = 0;

 struct buf *blk_buf = kalloc();

 for(total_rd=0; total_rd<len; total_rd+=single_rd_len, offset+=single_rd_len, dst+=single_rd_len)
 {
  inode_blknum = offset/1024;
  blk_buf->dev = 0x01;
  blk_buf->blockno = blknum_to_addr(ip, inode_blknum);
  blk_buf->valid = 0x00;
  blk_buf->refcnt = 0x01;

  virtio_disk_rw(blk_buf, 0);
  single_rd_len = (len>1024 -blk_offset)?(1024 -blk_offset):(len);

  if(to_where == 0)
  {
   memmove(dst, blk_buf->data, single_rd_len);
  }
  else
  {
   copy_to_user(proc_ptr->proc_pagetable, dst, blk_buf->data+blk_offset, single_rd_len);
  }

 }
 kfree(blk_buf);

 return 0;
}

int write_to_inode(struct inode *ip, unsigned long src, unsigned long offset, unsigned int len, int to_where)
{
 unsigned int inode_blknum;
 unsigned int st;
 unsigned int blk_res_len;
 unsigned int actual_wr_len;
 struct buf *blk_buf = kalloc();

 for(int n=0; 0<len;)
 {

  inode_blknum = offset/1024;
  st = offset%1024;


  blk_buf->dev = 0x01;
  blk_buf->blockno = blknum_to_addr(ip, inode_blknum);
  blk_buf->valid = 0x00;
  blk_buf->refcnt = 0x01;

  virtio_disk_rw(blk_buf, 0);


  blk_res_len = 1024 - st;
  actual_wr_len = (len<blk_res_len)?(len):(blk_res_len);

  if(to_where == 0)
  {
   copy_from_user(proc_ptr->proc_pagetable, blk_buf->data+st, src, actual_wr_len);
  }
  else
  {
  }


  virtio_disk_rw(blk_buf, 1);


  offset += actual_wr_len;
  len -= actual_wr_len;
  src += actual_wr_len;
 }

 kfree(blk_buf);

 return 0;
}

void loadsec(pgt_t pagetable, struct inode *ip, unsigned long va, unsigned int offset, unsigned int sz)
{
 unsigned long pa;
 int i = 0;
 int wr_len = 0;
 int wr_off = 0;

 for(int n=0; n<sz; n+=4096, offset+=4096)
 {
  pa = va_to_pa(pagetable, va+n);
  {
   read_from_inode(ip, pa, offset, 4096, 0);
# 346 "src/fs.c"
  }
 }
}
