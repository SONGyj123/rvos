#include "proc.h"
#include "riscv.h"
#include "src_trap.h"
#include "fs.h"

int pid = 0;
//程序列表
struct proc proc_list[MAX_PROC];
//kernel程序
struct proc kernel_ctxt;
//当前运行的程序
struct proc *proc_ptr = &kernel_ctxt;

extern unsigned long _sec_pgt_start[]; 
extern unsigned long _trampoline[]; 

extern void swtch();
extern struct superblock sb;
extern int systicks;

unsigned char initcode[] = {
	//02000893
	0x13, 0x05, 0x10, 0x03, //03100513
	0x93, 0x08, 0x00, 0x02,	//02000893
	0x73, 0x00, 0x00, 0x00,	//00000073

	0x13, 0x05, 0x02, 0x00, //00020513
	0x93, 0x08, 0x20, 0x00, //00200893
	0x73, 0x00, 0x00, 0x00,	//00000073
};

//init proc kstack
void init_proc_kstack(pgt_t pagetable)
{
	struct proc *proc_ptr = proc_list;
	unsigned long *kstack_ptr;
	int n = 0;

	for(n=0; n<MAX_PROC; n++)
	{
		kstack_ptr = kalloc();
		if(kstack_ptr)
		{
			map_page(pagetable, (unsigned long)kstack_ptr, 0x300000000-n*2*4096, 1, PTE_R | PTE_W | PTE_X);
			proc_ptr->kstack = (unsigned long *)(0x300000000-n*2*4096 + 4096);
			proc_ptr->state = UNUSED;
		}
		else
		{
			panic("kalloc");
		}

		proc_ptr++;
	}
}

//
pgt_t proc_pagetable()
{
	pgt_t pagetable;

	pagetable = kalloc();

	if(pagetable == 0)
	{
		return 0;
	}

	return pagetable;
}


void fork_ret()
{
	static int flag = 0;
	if(!flag)
	{
		fs_init();
		flag = 1;
	}
	user_trap_ret();
}

//1st
void user_init()
{
	char *mem;

	proc_ptr = &proc_list[0];

	//分配空pagetable
	proc_ptr->proc_pagetable = _sec_pgt_start;//proc_pagetable(proc_ptr);
	proc_ptr->pid = pid;
	proc_ptr->state = RUNNABLE;

	memset(&proc_ptr->context, 0, sizeof(proc_ptr->context));
	//*(unsigned long *)(proc_ptr->context) = 0x00;

	proc_ptr->context.ra = (unsigned long)fork_ret;
	proc_ptr->context.sp = (unsigned long)proc_ptr->kstack;
	proc_ptr->prog_size = 1;

	mem = kalloc();

	map_page(proc_ptr->proc_pagetable, (unsigned long)_trampoline, (unsigned long)0x3ffffff000, 1, PTE_R | PTE_W | PTE_X);
	map_page(proc_ptr->proc_pagetable, (unsigned long)mem, 0x0000, 1, PTE_U | PTE_R | PTE_W | PTE_X);
	memmove(mem, initcode, sizeof(initcode));

	struct trapframe *trap_frame = kalloc();
	proc_ptr->trapframe = trap_frame;
	proc_ptr->trapframe->epc = 0x00;
	proc_ptr->trapframe->sp = 0x1000;
	//w_sepc(proc_list[0].trapframe->epc);
	map_page(proc_ptr->proc_pagetable, (unsigned long)proc_ptr->trapframe, (unsigned long)TRAMPOLINE-0x1000, 1, PTE_R | PTE_W | PTE_X);
}


void scheduler()
{
	struct proc *kernel_ptr = &kernel_ctxt;

	while(1)
	{
		intr_on();
		proc_ptr = &proc_list[0];
		for(int n=0; n<MAX_PROC; n++)
		{
			if(proc_ptr->state == RUNNABLE)
			{
				proc_ptr->state = RUNNING;
				swtch(&kernel_ptr->context, &proc_ptr->context);
			}

			proc_ptr++;
		}
	}
}

void sched()
{
	struct proc *kern_ptr = &kernel_ctxt;
	//切换到scheduler进程重新选择
	swtch(&proc_ptr->context, &kern_ptr->context);
}


int fork()
{
	struct proc *new_proc_ptr;
//	unsigned long new_pgt = proc_pagetable();
	pte_t *pte;
	unsigned long *proc_mem;
	unsigned long pa;

	for(int n=0; n<MAX_PROC; n++)
	{
		if(proc_list[n].state == UNUSED)
		{
			new_proc_ptr = &proc_list[n];
			goto found;	
		}
	}

	return -1;

found:	
	new_proc_ptr->pid = ++pid;	
	new_proc_ptr->state = USED;

	new_proc_ptr->proc_pagetable = proc_pagetable();
	new_proc_ptr->trapframe = kalloc();
	map_page(new_proc_ptr->proc_pagetable, (unsigned long)_trampoline, (unsigned long)TRAMPOLINE, 1, PTE_R | PTE_W | PTE_X);
	map_page(new_proc_ptr->proc_pagetable, new_proc_ptr->trapframe, 0x3fffffe000, 1, PTE_R|PTE_W);

	new_proc_ptr->context.ra = (unsigned long)fork_ret;
	new_proc_ptr->context.sp = (unsigned long)new_proc_ptr->kstack;

	*(new_proc_ptr->trapframe) = *(proc_ptr->trapframe);
	new_proc_ptr->trapframe->a0 = 0;
	new_proc_ptr->prog_size = proc_ptr->prog_size;

	//根据程序的长度
	for(int n=0; n<proc_ptr->prog_size; n+=4096)
	{
		pte = walk(proc_ptr->proc_pagetable, n, 0);
		if(*pte == 0)
		{
			panic("pte == 0\n");
		}
		pa = (unsigned long)(*pte)>>10<<12;
		proc_mem = kalloc();	
		memmove(proc_mem, pa, 4096);
		map_page(new_proc_ptr->proc_pagetable, proc_mem, n, 1, PTE_R|PTE_W|PTE_U|PTE_X);
	}

	for(int n=0; n<MAX_OFILE; n++)
	{
		new_proc_ptr->ofile[n] = proc_ptr->ofile[n];
	}

	new_proc_ptr->parent = proc_ptr;
	new_proc_ptr->state = RUNNABLE;

	return pid;
}

void exit(int code)
{
	//关闭文件
	for(int fd=0; fd<MAX_OFILE; fd++)
	{
		if(proc_ptr->ofile[fd] != 0)
		{
			//先关闭打开的file再将ofile[]清零 不然会找不到 内存泄漏发生
			file_close(proc_ptr->ofile[fd]);
			proc_ptr->ofile[fd] = 0;
		}
	}

	//唤醒可能在等待的父进程
	wakeup(proc_ptr->parent);

	//设置自己为僵尸
	proc_ptr->state = ZOMBIE;

	//吧自己切走
	sched();

}

int wait()
{
	return 0;
}

int kill(int pid)
{
	struct proc *ptr;

	for(ptr=proc_list; ptr<&proc_list[MAX_PROC]; ptr++)
	{
		if(ptr->pid == pid)
		{
			ptr->killed = 1;
			return 0;
		}
	}

	return -1;
}

void sleep(unsigned long *chan, struct spinlock *lock)
{
	proc_ptr->state = SLEEPING;
	proc_ptr->sleep_chan = (unsigned long)chan;
	release(lock);
	sched();
	acquire(lock);
}

void wakeup(unsigned long *chan)
{
	for(int n=0; n<MAX_PROC; n++)
	{
		if((proc_list[n].state == SLEEPING) && (proc_list[n].sleep_chan == (unsigned long)chan))
		{
			proc_list[n].state = RUNNABLE;
			proc_list[n].sleep_chan = 0;
		}
	}
}
