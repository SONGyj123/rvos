# 1 "src/proc.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/proc.c"
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
# 2 "src/proc.c" 2
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
# 3 "src/proc.c" 2
# 1 "src/src_trap.h" 1



# 1 "include/asm/ptregs.h" 1
# 13 "include/asm/ptregs.h"
struct pt_regs {

 unsigned long sepc;
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

 unsigned long sstatus;
 unsigned long sbadaddr;
 unsigned long scause;

 unsigned long orig_a0;
};
# 5 "src/src_trap.h" 2




void src_trap_init();
void smode_exeception_handler(struct pt_regs *reg_ptr, unsigned long s_cause);
void show_regs(struct pt_regs *reg_ptr);


void user_trap();
void user_trap_ret();
# 4 "src/proc.c" 2


int pid = 0;

struct proc proc_list[10];

struct proc kernel_ctxt;

struct proc *proc_ptr = &kernel_ctxt;

extern unsigned long _sec_pgt_start[];
extern unsigned long _trampoline[];

extern void swtch();
extern struct superblock sb;
extern int systicks;

unsigned char initcode[] = {

 0x13, 0x05, 0x10, 0x03,
 0x93, 0x08, 0x00, 0x02,
 0x73, 0x00, 0x00, 0x00,

 0x13, 0x05, 0x02, 0x00,
 0x93, 0x08, 0x20, 0x00,
 0x73, 0x00, 0x00, 0x00,
};


void init_proc_kstack(pgt_t pagetable)
{
 struct proc *proc_ptr = proc_list;
 unsigned long *kstack_ptr;
 int n = 0;

 for(n=0; n<10; n++)
 {
  kstack_ptr = kalloc();
  if(kstack_ptr)
  {
   map_page(pagetable, (unsigned long)kstack_ptr, 0x300000000-n*2*4096, 1, (1L << 1) | (1L << 2) | (1L << 3));
   proc_ptr->kstack = (unsigned long *)(0x300000000-n*2*4096 + 4096);
   proc_ptr->state = 0;
  }
  else
  {
   panic("kalloc");
  }

  proc_ptr++;
 }
}


pgt_t proc_pagetable()
{
 pgt_t pagetable;

 pagetable = kalloc();

 if(pagetable == 0)
 {
  return 0;
 }

 return pagetable;
}


void fork_ret()
{
 static int flag = 0;
 if(!flag)
 {
  fs_init();
  flag = 1;
 }
 user_trap_ret();
}


void user_init()
{
 char *mem;

 proc_ptr = &proc_list[0];


 proc_ptr->proc_pagetable = _sec_pgt_start;
 proc_ptr->pid = pid;
 proc_ptr->state = 2;

 memset(&proc_ptr->context, 0, sizeof(proc_ptr->context));


 proc_ptr->context.ra = (unsigned long)fork_ret;
 proc_ptr->context.sp = (unsigned long)proc_ptr->kstack;
 proc_ptr->prog_size = 1;

 mem = kalloc();

 map_page(proc_ptr->proc_pagetable, (unsigned long)_trampoline, (unsigned long)0x3ffffff000, 1, (1L << 1) | (1L << 2) | (1L << 3));
 map_page(proc_ptr->proc_pagetable, (unsigned long)mem, 0x0000, 1, (1L << 4) | (1L << 1) | (1L << 2) | (1L << 3));
 memmove(mem, initcode, sizeof(initcode));

 struct trapframe *trap_frame = kalloc();
 proc_ptr->trapframe = trap_frame;
 proc_ptr->trapframe->epc = 0x00;
 proc_ptr->trapframe->sp = 0x1000;

 map_page(proc_ptr->proc_pagetable, (unsigned long)proc_ptr->trapframe, (unsigned long)((1L << (9 + 9 + 9 + 12 - 1)) - 4096)-0x1000, 1, (1L << 1) | (1L << 2) | (1L << 3));
}


void scheduler()
{
 struct proc *kernel_ptr = &kernel_ctxt;

 while(1)
 {
  intr_on();
  proc_ptr = &proc_list[0];
  for(int n=0; n<10; n++)
  {
   if(proc_ptr->state == 2)
   {
    proc_ptr->state = 3;
    swtch(&kernel_ptr->context, &proc_ptr->context);
   }

   proc_ptr++;
  }
 }
}

void sched()
{
 struct proc *kern_ptr = &kernel_ctxt;

 swtch(&proc_ptr->context, &kern_ptr->context);
}


int fork()
{
 struct proc *new_proc_ptr;

 pte_t *pte;
 unsigned long *proc_mem;
 unsigned long pa;

 for(int n=0; n<10; n++)
 {
  if(proc_list[n].state == 0)
  {
   new_proc_ptr = &proc_list[n];
   goto found;
  }
 }

 return -1;

found:
 new_proc_ptr->pid = ++pid;
 new_proc_ptr->state = 1;

 new_proc_ptr->proc_pagetable = proc_pagetable();
 new_proc_ptr->trapframe = kalloc();
 map_page(new_proc_ptr->proc_pagetable, (unsigned long)_trampoline, (unsigned long)((1L << (9 + 9 + 9 + 12 - 1)) - 4096), 1, (1L << 1) | (1L << 2) | (1L << 3));
 map_page(new_proc_ptr->proc_pagetable, new_proc_ptr->trapframe, 0x3fffffe000, 1, (1L << 1)|(1L << 2));

 new_proc_ptr->context.ra = (unsigned long)fork_ret;
 new_proc_ptr->context.sp = (unsigned long)new_proc_ptr->kstack;

 *(new_proc_ptr->trapframe) = *(proc_ptr->trapframe);
 new_proc_ptr->trapframe->a0 = 0;
 new_proc_ptr->prog_size = proc_ptr->prog_size;


 for(int n=0; n<proc_ptr->prog_size; n+=4096)
 {
  pte = walk(proc_ptr->proc_pagetable, n, 0);
  if(*pte == 0)
  {
   panic("pte == 0\n");
  }
  pa = (unsigned long)(*pte)>>10<<12;
  proc_mem = kalloc();
  memmove(proc_mem, pa, 4096);
  map_page(new_proc_ptr->proc_pagetable, proc_mem, n, 1, (1L << 1)|(1L << 2)|(1L << 4)|(1L << 3));
 }

 for(int n=0; n<10; n++)
 {
  new_proc_ptr->ofile[n] = proc_ptr->ofile[n];
 }

 new_proc_ptr->parent = proc_ptr;
 new_proc_ptr->state = 2;

 return pid;
}

void exit(int code)
{

 for(int fd=0; fd<10; fd++)
 {
  if(proc_ptr->ofile[fd] != 0)
  {

   file_close(proc_ptr->ofile[fd]);
   proc_ptr->ofile[fd] = 0;
  }
 }


 wakeup(proc_ptr->parent);


 proc_ptr->state = 5;


 sched();

}

int wait()
{
 return 0;
}

int kill(int pid)
{
 struct proc *ptr;

 for(ptr=proc_list; ptr<&proc_list[10]; ptr++)
 {
  if(ptr->pid == pid)
  {
   ptr->killed = 1;
   return 0;
  }
 }

 return -1;
}

void sleep(unsigned long *chan, struct spinlock *lock)
{
 proc_ptr->state = 4;
 proc_ptr->sleep_chan = (unsigned long)chan;
 release(lock);
 sched();
 acquire(lock);
}

void wakeup(unsigned long *chan)
{
 for(int n=0; n<10; n++)
 {
  if((proc_list[n].state == 4) && (proc_list[n].sleep_chan == (unsigned long)chan))
  {
   proc_list[n].state = 2;
   proc_list[n].sleep_chan = 0;
  }
 }
}
