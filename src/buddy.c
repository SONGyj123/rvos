#include "buddy.h"
#include "def.h"

#define SHIFT ((unsigned long)(_free_mem_start)+0x4000)
#define MEMSZ(val) (0x1000<<(val-1))
#define BASE_ADDR	(0x100000)
#define BUDDY_MEM_ALLOC_LEN (0x100000)

extern unsigned long _free_mem_start[]; 

struct buddy_blk *start = (struct buddy_blk *)_free_mem_start;

static struct buddy_blk *create_bin_tree(int depth, unsigned long addr, struct buddy_blk *parent)
{
	if(depth == 0)
	{
		return 0;
	}

	struct buddy_blk *node = start;
	start++;
	node->staddr = (unsigned long)(0+addr);
	node->state = _DARK;
	node->order = depth;
	node->parent = parent;

	node->left = create_bin_tree(depth-1, addr, node);
	node->right = create_bin_tree(depth-1, addr+(1 << (depth-2)) * 4096, node);

	return node;
}


/*
 *	初始化9层完全二叉树
 *	最下面是4k
 *	return: 整个buddy分配器包括页面和二叉树结构体的大小
 */
unsigned long init_bin_tree_mem()
{
	unsigned int total_nodes = (BUDDY_MEM_ALLOC_LEN>>12)*2-1;
	unsigned int depth = 0;
	unsigned long struct_mem_len = ROUND_4K(total_nodes*sizeof(struct buddy_blk));

	printf("total nodes %d\r\n", total_nodes);
	printf("binary tree require %x byte\r\n", total_nodes*sizeof(struct buddy_blk));
	printf("binary tree require actually %xbyte\r\n", struct_mem_len);

	while(total_nodes >>= 1)
	{
		depth++;
	}

	printf("depth = %d\r\n", depth+1);

	create_bin_tree(depth+1, (unsigned long)(struct_mem_len+_free_mem_start), 0);

	//设置root节点状态_UNUSED
	((struct buddy_blk *)_free_mem_start)->state = _UNUSED;

	return BUDDY_MEM_ALLOC_LEN+struct_mem_len+(unsigned long)_free_mem_start;
}

/*
 * 迭代遍历
 */
void print_bin_tree(struct buddy_blk *node)
{
	if(node == 0)
	{
		return;
	}	

	print_bin_tree(node->left);
	print_bin_tree(node->right);

	//printf("%x\r\n", node->staddr);
}

/*
 *	对齐要分配的内存大小
 */
static unsigned long nxt_pwr_of_two(unsigned long sz)
{
	if(sz == 0)
	{
		return sz;
	}

	sz--;
	sz |= sz >> 1;
	sz |= sz >> 2;
	sz |= sz >> 4;
	sz |= sz >> 8;
	sz |= sz >> 16;
	sz |= sz >> 32;
	sz++;

	return sz; 
}

/*
 *	寻找合适的内存
 */
static unsigned long find_mem(struct buddy_blk* node, unsigned long sz)
{
	unsigned long addr = 0;
	if(node->state == _USED)
	{
		return 0;
	}

	if((node->state == _UNUSED || node->state == _SPLIT) && MEMSZ(node->order)>=sz)
	{
		//如果正好符合大小 且这个节点是空闲节点
		//如果是split节点会重复分配
		if(MEMSZ(node->order) == sz && node->state == _UNUSED)
		{
			//printf("-------------------------node is %x\r\n", node);
			node->state = _USED;
			return node->staddr;
		}
		//如果大小大了
		else
		{
			//分裂开当前节点
			//注意：已经分开的不用在分
			if(node->state == _UNUSED)
			{
				if(node->left!=0 && node->right!=0)
				{
					node->state = _SPLIT;
					node->left->state = _UNUSED;
					node->right->state = _UNUSED;
				}
			}
			
			//搜索左节点
			addr = find_mem(node->left, sz);
			if(addr != 0)
			{
				return addr;
			}
			//左节点没有 搜索右节点
			else
			{
				return find_mem(node->right, sz);
			}
		}
	}

	return 0;
}

/*
 *	分配
 */
unsigned long *buddy_alloc(unsigned long sz)
{
	unsigned long addr = 0;
	sz = nxt_pwr_of_two(sz);	
	//printf("alloc %x bytes\r\n", sz);

	addr = find_mem((struct buddy_blk *)_free_mem_start, sz);
		
	return (unsigned long *)addr;
}

/*
 *	node位置
 */
static struct buddy_blk *node_locate(struct buddy_blk *node, unsigned long *node_addr)
{
	unsigned long addr = (unsigned long)node_addr;
	struct buddy_blk *node_ptr = 0;

	if(node == 0)
	{
		//printf("not found\r\n");
		return 0;
	}

	if(node->staddr==addr && node->state==_USED)
	{
		//printf("found\r\n");
		return node;
	}
	
	//比较时要用node->staddr 不是BASE_ADDR
	if(addr < MEMSZ(node->order)/2+node->staddr)
	{
		node_ptr = node_locate(node->left, node_addr);
	}
	else
	{
		node_ptr = node_locate(node->right, node_addr);
	}

	return node_ptr;
}

/*
 *	合并节点
 */
static void buddy_merge(struct buddy_blk *node)
{
	if(node->parent == 0)
	{
		return;
	}

	struct buddy_blk *bro = (node->parent->left==node)?node->parent->right:node->parent->left;
	
	if(bro->state == _UNUSED)
	{
		bro->state = _DARK;
		node->state = _DARK;
		node->parent->state = _UNUSED;
		buddy_merge(node->parent);
	}
}

/*
 *	回收buddy节点
 */
void buddy_free(unsigned long *node_addr)
{
	struct buddy_blk *node = node_locate((struct buddy_blk *)_free_mem_start, node_addr);

	if(node == 0)
	{
		//printf("cannot find\r\n");
		return;
	}

	node->state = _UNUSED;
	buddy_merge(node);

}


