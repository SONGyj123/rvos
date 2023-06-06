# 1 "sbi/sbi_main.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sbi/sbi_main.c"
# 1 "include/uart.h" 1
# 25 "include/uart.h"
void uart_init();
void uart_send_char(char c);
void uart_send_string(char *s);
# 2 "sbi/sbi_main.c" 2
# 1 "include/timer.h" 1



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
# 5 "include/timer.h" 2
# 15 "include/timer.h"
void timer_init();
# 3 "sbi/sbi_main.c" 2
# 1 "include/riscv.h" 1
# 4 "sbi/sbi_main.c" 2
# 1 "sbi/sbi_trap.h" 1



# 1 "sbi/sbi_trap_reg.h" 1



struct sbi_context_str {

 unsigned long mepc;
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

 unsigned long mstatus;
};
# 5 "sbi/sbi_trap.h" 2

void sbi_trap_init();
void sbi_trap_handler(struct sbi_context_str *ptr);
void sbi_ecall_handler(int id, struct sbi_context_str *ptr);

void timer_int_handler(struct sbi_context_str *ptr);
# 5 "sbi/sbi_main.c" 2



void sbi_main()
{
 unsigned long val;

 uart_init();
 uart_send_string("sbi_main here\r\n");

 sbi_trap_init();
 timer_init();
 w_medeleg(0xfdff);
 w_mideleg(0xffff);

 val = r_mstatus();
 val = (((val) & ~((3UL << 11))) | (((1UL)) * (((3UL << 11)) & ~(((3UL << 11))-1))));

 val = (((val) & ~(0x00000080UL)) | ((0) * ((0x00000080UL) & ~((0x00000080UL)-1))));

 w_mstatus(val);
 w_mepc(0x80200000);
 w_stvec(0x80200000);

 w_sie(r_sie() | 0x02);
 w_sie(r_sie() | (0x01<<9));
 w_satp(0);

 w_pmpaddr0(0x3fffffffffffffull);
 w_pmpcfg0(0xf);

 asm volatile("mret");
}
