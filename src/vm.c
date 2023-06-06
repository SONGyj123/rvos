#include "def.h"

struct mem_linked_list
{
	struct mem_linked_list *nxt;
}mem_ll;

struct mem_linked_list *ori_ptr = &mem_ll;

//clear 4k and add to linked list
void kfree(void *p)
{
	struct mem_linked_list *new_ptr;

//	printf("free mem = %p\n", p);

	memset(p, 0, PAGE_SIZE);

	new_ptr = (struct mem_linked_list *)p;
	new_ptr->nxt = ori_ptr;

	ori_ptr = new_ptr;
}

//print all free mem
void kp_free_mem()
{
	struct mem_linked_list *ptr = ori_ptr;

	while(ptr!=0)
	{
		printf("%p->\n", ptr);
		ptr = ptr->nxt;
	}

	printf("print out: %d\n", 1);
}

//return free 4k addr
void *kalloc(void)
{
	struct mem_linked_list *ptr = ori_ptr;

	if(ori_ptr)
	{
		ori_ptr = ori_ptr->nxt;
	}

	return (void *)ptr;
}

pte_t *walk(pgt_t pagetable, unsigned long va, int alloc)
{
	pte_t *pte;
	for(int level=2; level>0; level--)
	{
		pte = &pagetable[GET_PPN(level, va)];

		if(*pte & PTE_V)
		{
			pagetable = (pgt_t)GET_PAGETABLE(*pte);
		}
		else
		{
			if(!alloc || ((pagetable=kalloc())==0))
			{
				return 0;
			}
			
			memset(pagetable, 0, PAGE_SIZE);
			//回填
			*pte = ((unsigned long)pagetable>>12<<10) | PTE_V;
		}
	}

	pte = &pagetable[GET_PPN(0, va)];
	return pte;
}

unsigned long va_to_pa(pgt_t pagetable, unsigned long va)
{
	unsigned long pa;

	for(int level=2; level>0; level--)
	{
		pte_t pte = pagetable[GET_PPN(level, va)];

		if((pte & PTE_V) != PTE_V)
		{
			panic("pte invalid\n");
		}
		
		pagetable = (pgt_t)GET_PAGETABLE(pte);
	}
	
	pa = (pagetable[GET_PPN(0, va)]>>10)<<12;

	return pa;
}

int free_mem_in_page(void *pa_s, void *pa_e)
{
	int cnt = 0;
	char *p = (char *)pa_s;

	while(p+PAGE_SIZE <= (char *)pa_e)
	{
		kfree(p);
		cnt++;
		p = p + PAGE_SIZE;
	}

	return cnt;
}

int map_page(pgt_t pagetable, unsigned long pa, unsigned long va,unsigned long size, int perm)
{
	pte_t *pte_ptr;
	for(int n=0; n<size; n++)
	{
		pte_ptr = walk(pagetable, va, 1);
		if(pte_ptr != 0)
		{
			if(*pte_ptr & PTE_V)
			{
				panic("remap!\n");
			}
			else
			{
				//*pte_ptr = set_pte(ppn, perm);
				*pte_ptr = (((unsigned long)pa>>12)<<10) | perm | PTE_V;
			}
		}
		else
		{
			return 1;
		}

		va += 4096;
		pa += 4096;
	}

	return 0;
}

unsigned long uvmalloc(pgt_t pagetable, unsigned long oldsz, unsigned newsz, int perm)
{
	unsigned long *mem;
	
	if(oldsz%4096 != 0)
	{
		oldsz = oldsz - oldsz%4096 + 4096;
	}

	for(unsigned long n=oldsz; n<newsz; n+=4096)
	{
		mem = kalloc();
		if(!mem)
		{
			return 0;
		}

		memset(mem, 0, 4096);
		map_page(pagetable, (unsigned long)mem, n, 1, PTE_R | PTE_U | PTE_X | perm);
	}

	return newsz;
}

int copy_from_user(pgt_t user_pgt, void *dst, const void *src, unsigned long len)
{
	unsigned long src_pa = 0;
	unsigned long src_va_align = 0;
	unsigned long offset = 0;
	unsigned long act_n = 0;

	while(len > 0)
	{
		//src地址不一定是page align的，需要向上取整
		src_va_align = (unsigned long)src & (~0xfff);
		src_pa = va_to_pa(user_pgt, src_va_align);
		offset = (unsigned long)src - src_va_align;
		src_pa += offset;

		if(4096 > offset+len)
		{
			act_n = len;
		}
		else
		{
			act_n = 4096-offset;
		}
		
		memmove(dst, (char *)(src_pa), len);

		len -= act_n;
		src_pa += act_n;
		src += act_n;
	}

	return 0;
}

int copy_to_user(pgt_t user_pgt, void *dst, const void *src, unsigned long len)
{
	unsigned long dst_pa = 0;
	unsigned long dst_va_align = 0;
	unsigned long offset = 0;
	unsigned long act_n = 0;

	while(len > 0)
	{
		//dst地址不一定是page align的，需要向上取整
		dst_va_align = (unsigned long)dst & (~0xfff);
		dst_pa = va_to_pa(user_pgt, dst_va_align);
		offset = (unsigned long)dst - dst_va_align;
		dst_pa += offset;

		if(4096 > offset+len)
		{
			act_n = len;
		}
		else
		{
			act_n = 4096-offset;
		}
		
		memmove((char *)dst_pa, src, len);

		len -= act_n;
		dst_pa += act_n;
		src += act_n;
	}

	return 0;
}

























