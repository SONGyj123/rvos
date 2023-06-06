# 1 "src/exec.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/exec.c"

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
# 3 "src/exec.c" 2
# 1 "src/proc.h" 1




# 1 "src/fd.h" 1





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
# 7 "src/fd.h" 2
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
# 4 "src/exec.c" 2
# 1 "include/riscv.h" 1
# 28 "include/riscv.h"
static inline unsigned long r_sstatus()
{
 unsigned long x;
 asm volatile("csrr %0, sstatus"
          : "=r" (x)
          :
       );
 return x;
}

static inline unsigned long r_mstatus()
{
 unsigned long x;
 asm volatile("csrr %0, mstatus"
          : "=r" (x)
          :
       );
 return x;
}

static inline unsigned long r_mcause()
{
 unsigned long x;
 asm volatile("csrr %0, mcause"
          : "=r" (x)
          :
       );
 return x;
}

static inline unsigned long r_scause()
{
 unsigned long x;
 asm volatile("csrr %0, scause"
          : "=r" (x)
          :
       );
 return x;
}

static inline void w_mepc(unsigned long x)
{
 asm volatile("csrw mepc, %0"
          :
          : "r" (x)
       );
}

static inline void w_sepc(unsigned long x)
{
 asm volatile("csrw sepc, %0"
          :
          : "r" (x)
       );
}

static inline unsigned long r_sepc()
{
 unsigned long x;
 asm volatile("csrr %0, sepc"
          : "=r" (x)
          :
       );
 return x;
}

static inline void w_mstatus(unsigned long x)
{
 asm volatile("csrw mstatus, %0"
          :
          : "r" (x)
       );
}

static inline void w_sstatus(unsigned long x)
{
 asm volatile("csrw sstatus, %0"
          :
          : "r" (x)
       );
}

static inline void w_stvec(unsigned long x)
{
 asm volatile("csrw stvec, %0"
          :
          : "r" (x)
       );
}

static inline void w_sie(unsigned long x)
{
 asm volatile("csrw sie, %0"
          :
          : "r" (x)
       );
}

static inline void w_satp(unsigned long x)
{
 asm volatile("csrw satp, %0"
          :
          : "r" (x)
       );
}

static inline void w_mtvec(unsigned long x)
{
 asm volatile("csrw mtvec, %0"
          :
          : "r" (x)
       );
}

static inline void w_mie(unsigned long x)
{
 asm volatile("csrw mie, %0"
          :
          : "r" (x)
       );
}

static inline void w_mip(unsigned long x)
{
 asm volatile("csrw mip, %0"
          :
          : "r" (x)
       );
}

static inline void w_sip(unsigned long x)
{
 asm volatile("csrw sip, %0"
          :
          : "r" (x)
       );
}

static inline unsigned long r_mie()
{
 unsigned long x;

 asm volatile("csrr %0, mie"
          : "=r" (x)
          :
       );
 return x;
}

static inline unsigned long r_sie()
{
 unsigned long x;

 asm volatile("csrr %0, sie"
          : "=r" (x)
          :
       );
 return x;
}

static inline unsigned long r_sip()
{
 unsigned long x;

 asm volatile("csrr %0, sip"
          : "=r" (x)
          :
       );
 return x;
}

static inline unsigned long r_mhartid()
{
 unsigned long x;
 asm volatile("csrr %0, mhartid"
          : "=r" (x)
          :
       );
 return x;
}

static inline void sfence_vma()
{
 asm volatile("sfence.vma zero, zero"
       );
}

static inline void w_medeleg(unsigned long x)
{
 asm volatile("csrw medeleg, %0" : : "r" (x));
}

static inline void w_mideleg(unsigned long x)
{
 asm volatile("csrw mideleg, %0" : : "r" (x));
}

static inline void w_pmpcfg0(unsigned long x)
{
 asm volatile("csrw pmpcfg0, %0" : : "r" (x));
}

static inline void w_pmpaddr0(unsigned long x)
{
 asm volatile("csrw pmpaddr0, %0" : : "r" (x));
}

static inline unsigned long r_cpuid()
{
 unsigned long x;

 asm volatile("csrr %0, mharid"
     : "=r" (x)
     :
     :
     );

 return x;
}


static inline void intr_off()
{
 w_sstatus(r_sstatus() & ~(1L << 1));
}

static inline void intr_on()
{
 w_sstatus(r_sstatus() | (1L << 1));
}
# 5 "src/exec.c" 2


extern unsigned long _trampoline[];

extern struct proc *proc_ptr;

int exec(char *path, char **argv)
{
 struct inode proc_inode;
 struct elfhdr proc_elfhdr;
 struct proghdr proc_proghdr[2];
 unsigned long *mem;
 pgt_t user_pagetable = proc_pagetable();

 map_page(user_pagetable, (unsigned long)_trampoline, (unsigned long)((1L << (9 + 9 + 9 + 12 - 1)) - 4096), 1, (1L << 1) | (1L << 3));
 map_page(user_pagetable, (unsigned long)proc_ptr->trapframe, (unsigned long)((1L << (9 + 9 + 9 + 12 - 1)) - 4096)-0x1000, 1, (1L << 1) | (1L << 2));

 int flag = get_inode(path, &proc_inode);

 if(!flag)
 {
  printf("no such inode found!\n");
  return -1;
 }

 read_elfhr(&proc_elfhdr, proc_proghdr, &proc_inode);

 uvmalloc(user_pagetable, 0, proc_proghdr[0].memsz+proc_proghdr[1].memsz, 0);

 loadsec(user_pagetable, &proc_inode, proc_proghdr[0].vaddr, proc_proghdr[0].off, proc_proghdr[0].memsz+proc_proghdr[1].memsz);

 mem = kalloc();
 if(!mem)
 {
  panic("dame\n");
 }
 map_page(user_pagetable, (unsigned long)mem, (unsigned long)4096+4096, 1, (1L << 1) | (1L << 2) | (1L << 4));

 proc_ptr->proc_pagetable = user_pagetable;
 proc_ptr->prog_size = 4096+4096+4096;
 proc_ptr->trapframe->epc = proc_elfhdr.entry;
 proc_ptr->trapframe->sp = 4096+4096+4096;



 return 0;
}
