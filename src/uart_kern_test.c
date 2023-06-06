#include "uart.h"
#include "riscv.h"

void uart_send_c(char c)
{
	while((read_reg(UART0+LSR) & LSR_TX_IDLE) == 0);

	write_reg(UART0+THR, c);
}

void uart_send_str(char *s)
{
	while(*s != 0)
	{
		uart_send_c(*s);

		s++;
	}
}

char uart_rd_char()
{
	if(read_reg(UART0+LSR) & 0x01)
	{
		return read_reg(UART0+RHR);
	}
	else
	{
		return -1;
	}
}

