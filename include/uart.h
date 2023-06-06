#ifndef __UART_H
#define __UART_H

#define UART0 0x10000000L
#define BAUD 115200

#define RHR 0 // Receive Holding Register (read mode)
#define THR 0 // Transmit Holding Register (write mode)
#define DLL 0 // LSB of Divisor Latch (write mode)
#define IER 1 // Interrupt Enable Register (write mode)
#define DLM 1 // MSB of Divisor Latch (write mode)
#define FCR 2 // FIFO Control Register (write mode)
#define ISR 2 // Interrupt Status Register (read mode)
#define LCR 3 // Line Control Register
#define MCR 4 // Modem Control Register
#define LSR 5 // Line Status Register
#define MSR 6 // Modem Status Register
#define SPR 7 // ScratchPad Register

#define LSR_TX_IDLE  (1 << 5)
#define IER_RX_ENABLE (1<<0)
#define IER_TX_ENABLE (1<<1)


void uart_init();
void uart_send_char(char c);
void uart_send_string(char *s);

#endif
