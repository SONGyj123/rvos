# 1 "sbi/uart.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sbi/uart.c"
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
# 2 "sbi/uart.c" 2
# 1 "include/uart.h" 1
# 25 "include/uart.h"
void uart_init();
void uart_send_char(char c);
void uart_send_string(char *s);
# 3 "sbi/uart.c" 2


static unsigned int uart_clk = 1843200;

void uart_init()
{
 unsigned int divisor = uart_clk/(16*115200);
 ((*(volatile unsigned char*)(0x10000000L +1)) = 0);

 ((*(volatile unsigned char*)(0x10000000L +3)) = 0x80);
 ((*(volatile unsigned char*)(0x10000000L +0)) = (unsigned char)divisor);
 ((*(volatile unsigned char*)(0x10000000L +1)) = (unsigned char)(divisor>>8));

 ((*(volatile unsigned char*)(0x10000000L +3)) = 0x03);
 ((*(volatile unsigned char*)(0x10000000L +2)) = 0xc7);
 ((*(volatile unsigned char*)(0x10000000L +1)) = (1<<0));
}

void uart_send_char(char c)
{
 while(((*(volatile unsigned char*)(0x10000000L +5)) & (1 << 5)) == 0);

 ((*(volatile unsigned char*)(0x10000000L +0)) = c);
}

void uart_send_string(char *s)
{
 while(*s != 0)
 {
  uart_send_char(*s);

  s++;
 }
}
