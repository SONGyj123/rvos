# 1 "src/src_trap.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/src_trap.c"
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
# 2 "src/src_trap.c" 2
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
# 3 "src/src_trap.c" 2
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
# 4 "src/src_trap.c" 2
# 1 "src/plic.h" 1
# 17 "src/plic.h"
void plicinit();
void plicinithart();
int plic_claim();
void plic_complete(int irq);
# 5 "src/src_trap.c" 2
# 1 "src/pipe.h" 1
# 12 "src/pipe.h"
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
# 6 "src/src_trap.c" 2

extern void smode_exeception_vec();
extern void swtch();
extern void back_trace();
extern struct proc proc_list[10];
extern struct proc kernel_ctxt;
extern struct proc *proc_ptr;

extern void trampoline();
extern void uservec();
extern void userret();
extern void virtio_intr();
extern unsigned long _pgt_start[];

extern int exec(char *path, char **argv);

struct fault_info {
 void (*fault_handler)(struct pt_regs *, unsigned long);
 char *fault_name;
};


unsigned long sys_print();
int sys_fork();
int sys_exec();
int sys_sleep();
int sys_pipe();
int sys_write();
int sys_read();
int sys_open();

unsigned long systicks = 0;
struct spinlock systicks_lock = {0};

static const struct fault_info fault_info[] = {
 {smode_exeception_handler, "instruction not aligned\n"},
 {smode_exeception_handler, "instruction access fault\n"},
 {smode_exeception_handler, "illegal instruction\n"},
 {smode_exeception_handler, "break point\n"},
 {smode_exeception_handler, "load address not aligned\n"},
 {smode_exeception_handler, "load address access fault\n"},
 {smode_exeception_handler, "store/amo address not aligned\n"},
 {smode_exeception_handler, "store/amo address access fault\n"},
 {smode_exeception_handler, "syscall from U\n"},
 {smode_exeception_handler, "syscall from S\n"},
 {smode_exeception_handler, "unknown 10\n"},
 {smode_exeception_handler, "unknown 11\n"},
 {smode_exeception_handler, "instruction page fault\n"},
 {smode_exeception_handler, "load page fault\n"},
 {smode_exeception_handler, "unknown 14\n"},
 {smode_exeception_handler, "store/amo page fault\n"},
};

static unsigned long (*syscall[])(void) = {
 [0x01] sys_fork,
 [0x02] sys_exec,
 [0x03] sys_sleep,
 [0x04] sys_pipe,
 [0x05] sys_read,
 [0x06] sys_write,
 [0x07] sys_open,
 [0x20] sys_print,
};


void src_trap_init()
{
 w_stvec((unsigned long)smode_exeception_vec);


 w_sie(0x02);

 w_sie(r_sie() | (0x01<<9));
 w_sstatus(0x02);
}


void smode_exeception_handler(struct pt_regs *reg_ptr, unsigned long s_cause)
{
 int ex_int_irq = 0;

 if(((s_cause>>63) & 0x01) == 0)
 {
  printf("Trap!!! scause: %p\n", s_cause);
  printf(fault_info[s_cause].fault_name);
  show_regs(reg_ptr);
  back_trace();
  panic("\n");
 }
 else
 {
  switch(s_cause-0x8000000000000000)
  {
   case 0x01:
    {


     w_sip(r_sip() & ~2);
     acquire(&systicks_lock);
     systicks++;
     release(&systicks_lock);
     wakeup(&systicks);
     back_to_kernel();


     break;
    }
   case 0x09:
    {
     ex_int_irq = plic_claim();
     if(ex_int_irq == 10)
     {
      uart_rd_char();
      printf("smode uart int\n");
     }
     else if(ex_int_irq == 1)
     {

      virtio_intr();
     }

     if(ex_int_irq)
     {
      plic_complete(ex_int_irq);
     }
     else
     {
      panic("smode damn\n");
     }
     break;
    }
   default:
    {
     printf("default case\n");
     break;
    }
  }
 }
}


void show_regs(struct pt_regs *reg_ptr)
{
 printf("sepc: %p ra: %p sp: %p\n", reg_ptr->sepc, reg_ptr->ra, reg_ptr->sp);
 printf("  gp: %p tp: %p t0: %p\n", reg_ptr->gp, reg_ptr->tp, reg_ptr->t0);
 printf("  t1: %p t2: %p s0: %p\n", reg_ptr->t1, reg_ptr->t2, reg_ptr->s2);
 printf("  gp: %p tp: %p t0: %p\n", reg_ptr->gp, reg_ptr->tp, reg_ptr->t0);

}


void user_trap()
{
 char input_char;
 int ex_int_irq = 0;
 int syscall_num = proc_ptr->trapframe->a7;
 unsigned long trap_cause = r_scause();

 w_stvec((unsigned long)smode_exeception_vec);

 if(trap_cause == 8)
 {
  proc_ptr->trapframe->epc = r_sepc() + 4;

  intr_on();
  proc_ptr->trapframe->a0 = syscall[syscall_num]();
 }

 else if(trap_cause == 0x8000000000000001)
 {
  proc_ptr->trapframe->epc = r_sepc();
  w_sip(r_sip() & ~2);
  acquire(&systicks_lock);
  systicks++;
  release(&systicks_lock);
  wakeup(&systicks);
  back_to_kernel();
 }
 else if(trap_cause == 0x8000000000000009)
 {
  proc_ptr->trapframe->epc = r_sepc();
  ex_int_irq = plic_claim();
  if(ex_int_irq == 10)
  {
   input_char = uart_rd_char();
   if(input_char == 0x100)
   {
    uart_send_c('\b');
    uart_send_c(' ');
    uart_send_c('\b');
   }
   else
   {
    uart_send_c(input_char);
   }
  }
  if(ex_int_irq)
  {
   plic_complete(ex_int_irq);
  }
 }
 else
 {
  printf("user_trap(): unexpected scause %p \n", trap_cause);
  printf("r_sepc----pc = %p \n", r_sepc());
  printf("ra = %p \n", proc_ptr->trapframe->ra);
  printf("sp = %p \n", proc_ptr->trapframe->sp);
  printf("proc_ptr = %p \n", proc_ptr);
  printf("proc_list = %p \n", proc_list);
  printf(fault_info[r_scause()].fault_name);
  panic("panic/n");
 }

 user_trap_ret();
}


void user_trap_ret()
{
 intr_off();

 unsigned long trampoline_uservec = ((1L << (9 + 9 + 9 + 12 - 1)) - 4096) + (uservec - trampoline);

 w_stvec(trampoline_uservec);

 unsigned long x = r_sstatus();
 x &= ~(1L << 8);

 x |= (1L << 5);


 proc_ptr->trapframe->kernel_satp = ((8L << 60) | (((unsigned long)_pgt_start) >> 12));
 proc_ptr->trapframe->kernel_trap = (unsigned long)user_trap;
 proc_ptr->trapframe->kernel_sp = (unsigned long)proc_ptr->kstack;


 w_sstatus(x);

 w_sepc(proc_ptr->trapframe->epc);
 unsigned long satp = ((8L << 60) | (((unsigned long)proc_ptr->proc_pagetable) >> 12));
 unsigned long trampoline_userret = ((1L << (9 + 9 + 9 + 12 - 1)) - 4096) + (userret - trampoline);
 ((void (*)(unsigned long))trampoline_userret)(satp);
}

void back_to_kernel()
{
 proc_ptr->state = 2;
 swtch(&proc_ptr->context, &kernel_ctxt.context);
}

unsigned long sys_print()
{
 char c = proc_ptr->trapframe->a0;

 uart_send_c(c);

 return 0;
}

int sys_fork()
{
 return fork();
}

int sys_exec()
{
 char *path = "/first_test.out";
 return exec(path, 0);
}

int sys_sleep()
{
 int interval = proc_ptr->trapframe->a0;
 acquire(&systicks_lock);
 unsigned long tick_st = systicks;
 while(systicks-tick_st < interval)
 {
  sleep(&systicks, &systicks_lock);
 }
 release(&systicks_lock);
 return 0;
}

int sys_pipe()
{
 unsigned long fd_arr = proc_ptr->trapframe->a0;

 struct file *f0;
 struct file *f1;
 new_pipe(&f0, &f1);

 int fd[2] = {0};
 fd[0] = fd_alloc(f0);
 fd[1] = fd_alloc(f1);
 if(fd[0] == -1 || fd[1] == -1)
 {
  return -1;
 }

 copy_to_user(proc_ptr->proc_pagetable, fd_arr, &fd[0], sizeof(fd));

 return 0;
}

int sys_write()
{
 int fd = proc_ptr->trapframe->a0;
 unsigned long va_addr = proc_ptr->trapframe->a1;
 int len = proc_ptr->trapframe->a2;

 struct file *which_file = proc_ptr->ofile[fd];

 if(which_file->type == FD_PIPE)
 {
  pipe_wr(which_file->pipe, va_addr, len);
 }
 else
 {
  write_to_inode(which_file->ip, va_addr, which_file->off, len, 0);
  which_file->off += len;
 }

 return 0;
}


int sys_read()
{
 int fd = proc_ptr->trapframe->a0;
 unsigned long va_addr = proc_ptr->trapframe->a1;
 int len = proc_ptr->trapframe->a2;

 struct file *which_file = proc_ptr->ofile[fd];

 if(which_file->type == FD_PIPE)
 {
  pipe_rd(which_file->pipe, va_addr, len);
 }
 else if(which_file->type == FD_INODE)
 {
  read_from_inode(which_file->ip, va_addr, which_file->off, len, 1);
  which_file->off += len;
 }
 return 0;
}


int sys_open()
{
 const char *pathname = proc_ptr->trapframe->a0;
 int flags = proc_ptr->trapframe->a1;

 struct inode *file_inode = kalloc();
 struct file *open_file;
 int fd;

 char *path[50] = {0};
 copy_from_user(proc_ptr->proc_pagetable, path, pathname, 13);

 get_inode(path, file_inode);

 open_file = file_alloc();
 fd = fd_alloc(open_file);

 if(file_inode->content.type == 2)
 {
  open_file->type = FD_INODE;
  open_file->off = 0;
 }

 open_file->ip = file_inode;

 return fd;
}
