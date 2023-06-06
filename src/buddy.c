#include "buddy.h"
#include "def.h"

extern unsigned long _free_mem_start[]; 

struct buddy_blk *free_list_arr[MAX_ORDER];
struct buddy_blk *root_node = (struct buddy_blk *)(&_free_mem_start);
struct buddy_blk *nxt_unused_node = (struct buddy_blk *)(&_free_mem_start) + sizeof(struct buddy_blk);

unsigned long init_bin_tree_mem()
{
	int page_num = (0x01<<(MAX_ORDER+1))/sizeof(struct buddy_blk);
	printf("need %d pages\n", page_num);

	root_node->state = _FREE;
	root_node->order = MAX_ORDER;
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

//round to 2power
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

	//alloc failed due to...
	if(total_mem < sz)
	{
		return -1;
	}
/*
	while()
	{
		if(sz == total_mem)
		{
			if()
		}
		else
		{

		}
	}
*/	
	return st_addr;
}




