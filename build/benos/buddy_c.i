# 1 "src/buddy.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/buddy.c"
# 1 "src/buddy.h" 1





enum State
{
 _SPLIT,
 _USED,
 _FREE
};

struct buddy_blk{
 enum State state;
 int order;
 unsigned long staddr;
 struct buddy_blk *left;
 struct buddy_blk *right;
};

unsigned long init_bin_tree_mem();
unsigned long buddy_alloc(int sz);
# 2 "src/buddy.c" 2
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
# 3 "src/buddy.c" 2

extern unsigned long _free_mem_start[];

struct buddy_blk *free_list_arr[11];
struct buddy_blk *root_node = (struct buddy_blk *)(&_free_mem_start);
struct buddy_blk *nxt_unused_node = (struct buddy_blk *)(&_free_mem_start) + sizeof(struct buddy_blk);

unsigned long init_bin_tree_mem()
{
 int page_num = (0x01<<(11 +1))/sizeof(struct buddy_blk);
 printf("need %d pages\n", page_num);

 root_node->state = _FREE;
 root_node->order = 11;
 root_node->staddr = (unsigned long)&_free_mem_start + 32*0x1000;
 root_node->left = 0;
 root_node->right = 0;

 return root_node->staddr;
}

static struct buddy_blk *unused_buddy_mem()
{
 nxt_unused_node += sizeof(struct buddy_blk);
 return nxt_unused_node;
}


static int round_size(unsigned int sz)
{
 int cnt = 0;
 if(sz == 1)
 {
  return sz;
 }
 while(sz!=0)
 {
  sz = sz>>1;
  cnt++;
 }
 sz = 0x01<<cnt;
 return sz;
}

unsigned long buddy_alloc(int sz)
{
 unsigned long st_addr = -1;

 if(sz == 0)
 {
  return 0;
 }

 sz = round_size(sz);
 printf("-----------round to size %d\n", sz);

 int total_mem = 0x01<<root_node->order;
 printf("-----------total mem %d\n", total_mem);


 if(total_mem < sz)
 {
  return -1;
 }
# 80 "src/buddy.c"
 return st_addr;
}
