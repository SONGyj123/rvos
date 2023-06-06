#include <stdarg.h>

extern void uart_send_c(char c);

char *digit = "0123456789abcdef";

void print_int(unsigned int num, int base)
{
	char buf[16];
	int i = 0;

	for(; num/base != 0; i++)
	{
		buf[i] = digit[num%base];
		num /= base;
	}

	buf[i] = digit[num];

	while(i>-1)
	{
		uart_send_c(buf[i]);
		i--;
	}

	i = 0;
}

void printf(char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);

	for(; *fmt!=0;)
	{
		if(*fmt == '%')
		{
			switch(*++fmt)
			{
				case 'd':
					{
						print_int(va_arg(args, int), 10);
						break;
					}

				case 'x':
					{
						uart_send_c('0');
						uart_send_c('x');
						print_int(va_arg(args, int), 16);
						break;
					}

				case 'p':
				{
					uart_send_c('0');
					uart_send_c('x');
					print_int(va_arg(args, int), 16);
					break;
				}

				default:
					{
						uart_send_c('%');
						uart_send_c(*fmt);
						break;
					}
			}
		}
		else
		{
			uart_send_c(*fmt);
		}

		fmt++;
	}

	va_end(args);
}

void panic(char *s)
{
	printf("panic: ");
	printf(s);
	printf("\n");
	while(1);
}

