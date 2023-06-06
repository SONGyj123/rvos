#ifndef __RISCV_H
#define __RISCV_H

#define read_reg(addr) (*(volatile unsigned char*)(addr))
#define write_reg(addr, x) ((*(volatile unsigned char*)(addr)) = x)

#define INSERT_FIELD(val, which, fieldval) \
	(((val) & ~(which)) | ((fieldval) * ((which) & ~((which)-1))))

#define PRV_U				(0UL)
#define PRV_S				(1UL)
#define PRV_M				(3UL)

#define MSTATUS_MPP_SHIFT	11
#define MSTATUS_MPP	(3UL << MSTATUS_MPP_SHIFT)
#define MSTATUS_MPIE	0x00000080UL
#define MSTATUS_SIE	0x00000002UL

#define DDR_START 0x80000000
#define DDR_END	(DDR_START+128*1024*1024)

#define SSTATUS_SPP (1L << 8)  // Previous mode, 1=Supervisor, 0=User
#define SSTATUS_SPIE (1L << 5) // Supervisor Previous Interrupt Enable

#define MAXVA (1L << (9 + 9 + 9 + 12 - 1))
#define TRAMPOLINE (MAXVA - 4096)

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
					: "=r" (x)	//输出
					:			//输入
					:			//损坏
					);

	return x;
}

#define SSTATUS_SIE (1L << 1)  // Supervisor Interrupt Enable
static inline void intr_off()
{
	w_sstatus(r_sstatus() & ~SSTATUS_SIE);
}

static inline void intr_on()
{
	w_sstatus(r_sstatus() | SSTATUS_SIE);
}

#define SBI_CALL(which, arg0, arg1, arg2) ({			\
	register unsigned long a0 asm ("a0") = (unsigned long)(arg0);	\
	register unsigned long a1 asm ("a1") = (unsigned long)(arg1);	\
	register unsigned long a2 asm ("a2") = (unsigned long)(arg2);	\
	register unsigned long a7 asm ("a7") = (unsigned long)(which);	\
	asm volatile ("ecall"					\
		      : "+r" (a0)				\
		      : "r" (a1), "r" (a2), "r" (a7)		\
		      : "memory");				\
	a0;							\
})

#endif
