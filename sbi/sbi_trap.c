#include "riscv.h"
#include "uart.h"
#include "timer.h"
#include "sbi_trap.h"

#define SYS_CALL 0x09
#define SYS_CALL_UART_SEND_CHAR 0x01
#define SYS_CALL_UART_SEND_STRING 0x02
#define SYS_CALL_RD_HARID 0x03

#define TIMER_INT 0x07

extern void sbi_exception_vec();

void sbi_trap_init()
{
	w_mtvec((unsigned long)sbi_exception_vec);
	w_mie(0);
}

void sbi_ecall_handler(int id, struct sbi_context_str *ptr)
{
	switch(id)
	{
		case SYS_CALL_UART_SEND_CHAR:
			{
				uart_send_char(ptr->a0);
				break;
			}

		case SYS_CALL_UART_SEND_STRING:
			{
				uart_send_string((char *)ptr->a0);
				break;
			}

		case SYS_CALL_RD_HARID:
			{
				ptr->a0 = r_mhartid();
				break;
			}

		default:
			break;
	}

	ptr->mepc += 4;
}

void sbi_trap_handler(struct sbi_context_str *ptr)
{
	unsigned long x;
	unsigned long id;

	x = r_mcause();
	id = ptr->a7;

	if(x > 0x8000000000000000)
	{
		x -= 0x8000000000000000;
		switch(x)
		{
			case TIMER_INT:
				{
					//w_mie(0x0);
					timer_int_handler(ptr);
//					uart_send_string("time up!\n");
					
					break;
				}
			default:
				break;
		}
	}
	else
	{
		switch(x)
		{
			case SYS_CALL:
				{
					sbi_ecall_handler(id, ptr);
					break;
				}

			default:
				{
					break;
				}
		}
	}
}

void timer_int_handler(struct sbi_context_str *ptr)
{
	//填入新值的同时清零flag
	*(unsigned long *)CLINT_TIMECMP(r_mhartid()) += INTERVAL;

	//flag s模式软件中断
	w_sip(0x02);
}


