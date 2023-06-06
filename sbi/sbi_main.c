#include "uart.h"
#include "timer.h"
#include "riscv.h"
#include "sbi_trap.h"

#define FW_JUMP_ADDR 0x80200000

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
	val = INSERT_FIELD(val, MSTATUS_MPP, PRV_S);
	//val = INSERT_FIELD(val, MSTATUS_SIE, 1);
	val = INSERT_FIELD(val, MSTATUS_MPIE, 0);

	w_mstatus(val);
	w_mepc(FW_JUMP_ADDR);
	w_stvec(FW_JUMP_ADDR);
	//在这里设置意义不大 因为在kernel_main一开始会把这个寄存器清零
	w_sie(r_sie() | 0x02);
	w_sie(r_sie() | (0x01<<9));
	w_satp(0);

	w_pmpaddr0(0x3fffffffffffffull);
	w_pmpcfg0(0xf);

	asm volatile("mret");
}



