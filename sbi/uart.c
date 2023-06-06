#include "riscv.h"
#include "uart.h"


static unsigned int uart_clk = 1843200;

void uart_init()
{
	unsigned int divisor = uart_clk/(16*BAUD);
	write_reg(UART0+IER, 0);

	write_reg(UART0+LCR, 0x80);
	write_reg(UART0+DLL, (unsigned char)divisor);
	write_reg(UART0+DLM, (unsigned char)(divisor>>8));

	write_reg(UART0+LCR, 0x03);
	write_reg(UART0+FCR, 0xc7);
	write_reg(UART0+IER, IER_RX_ENABLE);//|IER_TX_ENABLE);
}

void uart_send_char(char c)
{
	while((read_reg(UART0+LSR) & LSR_TX_IDLE) == 0);

	write_reg(UART0+THR, c);
}

void uart_send_string(char *s)
{
	while(*s != 0)
	{
		uart_send_char(*s);

		s++;
	}
}



