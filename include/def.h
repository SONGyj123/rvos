#ifndef __DEF_H
#define __DEF_H

#define PAGE_SIZE 4096

#define PTE_V (1L << 0)
#define PTE_R (1L << 1)
#define PTE_W (1L << 2)
#define PTE_X (1L << 3)
#define PTE_U (1L << 4)


#define ADDR_OFFSET 12
#define MASK 0x1ff
#define ADDR_MASK 0xFFF
#define GET_PPN(level, va) ((((va)>>ADDR_OFFSET)>>(9*level))&MASK)
#define GET_PAGETABLE(pte) (((unsigned long)pte>>10)<<ADDR_OFFSET)
#define GET_ADDR_OFFSET(va) (va&ADDR_MASK)

#define SATP_SV39 (8L << 60)
#define MAKE_SATP(pagetable) (SATP_SV39 | (((unsigned long)pagetable) >> 12))

//process related
#define MAX_PROC 10

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

//-------------printf.c---------------
void printf(char *fmt, ...);
void panic(char *s);

//-------------uart.c--------------------
void uart_send_c(char c);
void uart_send_str(char *s);
char uart_rd_char();

//-------------string.c------------------
void *memset(void *s, int val, unsigned int count);
void *memmove(char *dst, const char *src, int n);
void *memcpy(void *dst, const void *src, int n);
int strncmp(const char *p, const char *q, unsigned int n);

#endif
