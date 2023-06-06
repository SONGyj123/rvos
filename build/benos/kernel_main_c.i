# 1 "src/kernel_main.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/kernel_main.c"
# 1 "include/uart.h" 1
# 25 "include/uart.h"
void uart_init();
void uart_send_char(char c);
void uart_send_string(char *s);
# 2 "src/kernel_main.c" 2
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
# 3 "src/kernel_main.c" 2
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
# 4 "src/kernel_main.c" 2
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
# 5 "src/kernel_main.c" 2
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
# 6 "src/kernel_main.c" 2
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
# 7 "src/kernel_main.c" 2
# 1 "src/plic.h" 1
# 17 "src/plic.h"
void plicinit();
void plicinithart();
int plic_claim();
void plic_complete(int irq);
# 8 "src/kernel_main.c" 2


# 1 "src/buddy.h" 1





enum State
{
 _SPLIT,
 _USED,
 _FREE
};

struct buddy_blk{
 enum State state;
 int order;
 unsigned long staddr;
 struct buddy_blk *left;
 struct buddy_blk *right;
};

unsigned long init_bin_tree_mem();
unsigned long buddy_alloc(int sz);
# 11 "src/kernel_main.c" 2

extern unsigned long _pgt_start[];
extern unsigned long _free_mem_start[];
extern unsigned long _etext[];
extern unsigned long _trampoline[];
extern struct mem_linked_list
{
 struct mem_linked_list *nxt;
}mem_ll;
extern struct proc proc_list[10];

extern void swtch();

int test_num = 0;

struct spinlock print_lock;


void kernel_main()
{
 int freed_page_num;
 unsigned int n;
 char *str = "hello kernel!\n";
 print_lock.locked = 0;


 for(int n=0; n<50; n++)
 {
  acquire(&print_lock);
  test_num++;
  release(&print_lock);
 }
 printf("%d\n", test_num);

 ({ register unsigned long a0 asm ("a0") = (unsigned long)((unsigned long)str); register unsigned long a1 asm ("a1") = (unsigned long)(0); register unsigned long a2 asm ("a2") = (unsigned long)(0); register unsigned long a7 asm ("a7") = (unsigned long)(0x2); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });



 freed_page_num = free_mem_in_page(&_free_mem_start, (unsigned long *)(0x80000000 +128*1024*1024));

 printf("free_mem_start: %p free_mem_end: %p\n", &_free_mem_start, (0x80000000 +128*1024*1024));
 printf("page num: %d\n", freed_page_num);

 n = ((unsigned long)(0x80000000 +128*1024*1024)- (unsigned long)&_free_mem_start)/4096;

 if(n == freed_page_num)
 {
  uart_send_str("matched\n");
 }
 else
 {
  printf("not matched! n: %d\n", n);
 }



 map_page((pgt_t)&_pgt_start, (unsigned long)0x80000000, (unsigned long)0x80000000, ((unsigned long)_trampoline-(unsigned long)0x80000000)/4096, (1L << 1) | (1L << 2) | (1L << 3));

 map_page((pgt_t)&_pgt_start, (unsigned long)_trampoline, (unsigned long)((1L << (9 + 9 + 9 + 12 - 1)) - 4096), ((unsigned long)_etext-(unsigned long)_trampoline)/4096, (1L << 1) | (1L << 2) | (1L << 3));

 map_page((pgt_t)&_pgt_start, (unsigned long)_etext, (unsigned long)_etext, ((unsigned long)(0x80000000 +128*1024*1024)-(unsigned long)_etext)/4096, (1L << 1) | (1L << 2) | (1L << 3));

 map_page((pgt_t)&_pgt_start, 0x10000000L, 0x10000000L, 1, (1L << 1) | (1L << 2) | (1L << 3));
 map_page((pgt_t)&_pgt_start, 0x0c000000L, 0x0c000000L, 0x1000, (1L << 1) | (1L << 2) | (1L << 3));
 map_page((pgt_t)&_pgt_start, 0x10001000, 0x10001000, 1, (1L << 1) | (1L << 2) | (1L << 3));



 init_proc_kstack(_pgt_start);
 uart_send_str("init proc kstack\n");



 uart_send_str("paging before\n");
 sfence_vma();
 w_satp(((8L << 60) | (((unsigned long)&_pgt_start) >> 12)));
 sfence_vma();
 uart_send_str("paging after\n");





 src_trap_init();




 virt_disk_init();


 plicinit();
 plicinithart();
 fs_init();

 struct inode test;
 struct elfhdr test1;
 struct proghdr test2;
 int flag = get_inode("/first_test.out", &test);
 read_elfhr(&test1, &test2, &test);


 user_init();
 uart_send_str("init first process\n");

 __sync_synchronize();


 scheduler();

 while(1);
}
