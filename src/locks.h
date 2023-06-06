#ifndef __LOCKS_H
#define __LOCKS_H

struct spinlock
{
	unsigned int locked;
};

void acquire(struct spinlock *lk);
void release(struct spinlock *lk);

#endif
