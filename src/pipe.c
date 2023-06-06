#include "pipe.h"

extern struct proc *proc_ptr;

int new_pipe(struct file **f0, struct file **f1)
{
	struct pipe *new_pipe = 0;

	*f0 = file_alloc();
	*f1 = file_alloc();
	if(!f0 || !f1)
	{
		printf("pipe fd alloc failed!\n");
		return -1;
	}

	new_pipe = kalloc();
	memset(new_pipe, 0, 4096);
	if(!new_pipe)
	{
		printf("pipe kalloc failed!\n");
		return -1;
	}

	new_pipe->rd = 1;
	new_pipe->wr = 1;
	new_pipe->nrd = 0;
	new_pipe->nwr = 0;

	(*f0)->type = FD_PIPE;
	(*f0)->readable = 1;
	(*f0)->writable = 0;
	(*f0)->pipe = new_pipe;
	(*f1)->type = FD_PIPE;
	(*f1)->readable = 0;
	(*f1)->writable = 1;
	(*f1)->pipe = new_pipe;

	return 0;
}

int pipe_wr(struct pipe *pipe, unsigned long addr, int len)
{
	int flag = 0;
	acquire(&(pipe->lock));
	while(1)
	{
		if(pipe->nwr == 0)
		{
			//printf("write\n");
			copy_from_user(proc_ptr->proc_pagetable, pipe->data, (unsigned long *)addr, len);	
			pipe->nwr = len;
			//printf("wakeup read\n");
			wakeup(&(pipe->nrd));
			release(&(pipe->lock));
			break;
		}
		else
		{
			//printf("write sleep\n");
			sleep(&(pipe->nwr), &(pipe->lock));
			flag = 1;
		}
	}

	if(flag)
	{
		release(&(pipe->lock));
	}

	return 0;
}

int pipe_rd(struct pipe *pipe, unsigned long addr, int len)
{
	int flag = 0;
	acquire(&(pipe->lock));

	while(1)
	{
		if(pipe->nwr != 0)
		{
			//printf("read\n");
			copy_to_user(proc_ptr->proc_pagetable, (unsigned long *)addr, pipe->data, len);	
			pipe->nwr = 0;
			//printf("wakeup write\n");
			wakeup(&(pipe->nwr));
			release(&(pipe->lock));
			break;
		}
		else
		{
			//printf("read sleep\n");
			sleep(&(pipe->nrd), &(pipe->lock));
			flag = 1;
		}
	}

	if(flag)
	{
		release(&(pipe->lock));
	}

	return 0;
}






