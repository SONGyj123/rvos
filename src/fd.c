#include "fd.h"
#include "locks.h"
#include "def.h"

struct file ftable[MAX_FILE];

extern struct proc *proc_ptr;

struct file *file_alloc()
{
	for(int n=0; n<MAX_FILE; n++)
	{
		if(ftable[n].ref_cnt == 0)
		{
			ftable[n].ref_cnt = 1;
			return ftable+n;
		}
	}

	return 0;
}

struct file *file_dup(struct file *file)
{
	if(file->ref_cnt < 1)
	{
		panic("file's ref_cnt is less than 1");
	}

	file->ref_cnt++;

	return file;
}

void file_close(struct file *file)
{
	file->ref_cnt = -1;
	file->type = FD_NONE;
	//Todo
}

int fd_alloc(struct file *file_t_addr)
{
	for(int n=0; n<MAX_FILE; n++)
	{
		if(proc_ptr->ofile[n] == 0)
		{
			proc_ptr->ofile[n] = file_t_addr;
			return n;
		}
	}

	return -1;
}

