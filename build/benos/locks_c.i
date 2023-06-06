# 1 "src/locks.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/locks.c"
# 1 "src/locks.h" 1



struct spinlock
{
 unsigned int locked;
};

void acquire(struct spinlock *lk);
void release(struct spinlock *lk);
# 2 "src/locks.c" 2

void acquire(struct spinlock *lk)
{
 while(__sync_lock_test_and_set(&lk->locked, 1) != 0);

 __sync_synchronize();
}

void release(struct spinlock *lk)
{
 __sync_synchronize();

 __sync_lock_release(&lk->locked);
}
