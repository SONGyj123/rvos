# 1 "src/pipe.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/pipe.c"
# 1 "src/pipe.h" 1



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
# 5 "src/pipe.h" 2
# 1 "src/fd.h" 1






# 1 "src/proc.h" 1



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
# 5 "src/proc.h" 2
# 1 "src/fd.h" 1
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
# 6 "src/pipe.h" 2






struct pipe
{
 struct spinlock lock;
 char data[100];
 int nrd;
 int nwr;
 int rd;
 int wr;
};

int new_pipe(struct file **f0, struct file **f1);
int pipe_rd();
int pipe_wr(struct pipe *pipe, unsigned long addr, int len);
# 2 "src/pipe.c" 2

extern struct proc *proc_ptr;

int new_pipe(struct file **f0, struct file **f1)
{
 struct pipe *new_pipe = 0;

 *f0 = file_alloc();
 *f1 = file_alloc();
 if(!f0 || !f1)
 {
  printf("pipe fd alloc failed!\n");
  return -1;
 }

 new_pipe = kalloc();
 memset(new_pipe, 0, 4096);
 if(!new_pipe)
 {
  printf("pipe kalloc failed!\n");
  return -1;
 }

 new_pipe->rd = 1;
 new_pipe->wr = 1;
 new_pipe->nrd = 0;
 new_pipe->nwr = 0;

 (*f0)->type = FD_PIPE;
 (*f0)->readable = 1;
 (*f0)->writable = 0;
 (*f0)->pipe = new_pipe;
 (*f1)->type = FD_PIPE;
 (*f1)->readable = 0;
 (*f1)->writable = 1;
 (*f1)->pipe = new_pipe;

 return 0;
}

int pipe_wr(struct pipe *pipe, unsigned long addr, int len)
{
 int flag = 0;
 acquire(&(pipe->lock));
 while(1)
 {
  if(pipe->nwr == 0)
  {

   copy_from_user(proc_ptr->proc_pagetable, pipe->data, (unsigned long *)addr, len);
   pipe->nwr = len;

   wakeup(&(pipe->nrd));
   release(&(pipe->lock));
   break;
  }
  else
  {

   sleep(&(pipe->nwr), &(pipe->lock));
   flag = 1;
  }
 }

 if(flag)
 {
  release(&(pipe->lock));
 }

 return 0;
}

int pipe_rd(struct pipe *pipe, unsigned long addr, int len)
{
 int flag = 0;
 acquire(&(pipe->lock));

 while(1)
 {
  if(pipe->nwr != 0)
  {

   copy_to_user(proc_ptr->proc_pagetable, (unsigned long *)addr, pipe->data, len);
   pipe->nwr = 0;

   wakeup(&(pipe->nwr));
   release(&(pipe->lock));
   break;
  }
  else
  {

   sleep(&(pipe->nrd), &(pipe->lock));
   flag = 1;
  }
 }

 if(flag)
 {
  release(&(pipe->lock));
 }

 return 0;
}
