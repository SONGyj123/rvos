#ifndef __BUDDY_H
#define __BUDDY_H

#define MAX_ORDER 11

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

#endif
