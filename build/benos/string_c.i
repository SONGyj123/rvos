# 1 "src/string.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/string.c"
# 1 "include/def.h" 1
# 26 "include/def.h"
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


void printf(char *fmt, ...);
void panic(char *s);


void uart_send_c(char c);
void uart_send_str(char *s);
char uart_rd_char();


void *memset(void *s, int val, unsigned int count);
void *memmove(char *dst, const char *src, int n);
void *memcpy(void *dst, const void *src, int n);
int strncmp(const char *p, const char *q, unsigned int n);
# 2 "src/string.c" 2

void *memset(void *s, int val, unsigned int count)
{
 char *start = (char *)s;

 if(start == 0)
 {
  panic("NULL ptr\n");
 }

 while(count--)
 {
  *start++ = val;
 }

 return s;
}

void *memmove(char *dst, const char *src, int n)
{
 const char *s;
 char *d;

 if(n == 0)
 return dst;

 s = src;
 d = dst;
 if(s < d && s + n > d){
  s += n;
  d += n;
  while(n-- > 0)
  *--d = *--s;
 } else
 while(n-- > 0)
  *d++ = *s++;

 return dst;
}

void *memcpy(void *dst, const void *src, int n)
{
 return memmove(dst, src, n);
}

int strncmp(const char *p, const char *q, unsigned int n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (unsigned char)*p - (unsigned char)*q;
}
