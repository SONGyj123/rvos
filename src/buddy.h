#ifndef __BUDDY_H
#define __BUDDY_H

#define MAX_ORDER 11
#define ROUND_4K(val) (((val)+0xfff)&(0xf000))

enum State
{
	_SPLIT,
	_UNUSED,
	_DARK,
	_USED
};

struct buddy_blk{
	enum State state;
	int order;
	unsigned long staddr;
	struct buddy_blk *left;
	struct buddy_blk *right;
	struct buddy_blk *parent;
};

unsigned long init_bin_tree_mem();
unsigned long *buddy_alloc(unsigned long sz);
void print_bin_tree(struct buddy_blk *node);
void buddy_free(unsigned long *node_addr);

#endif
