#ifndef __PIPE_H
#define __PIPE_H

#include "fs.h"
#include "fd.h"
#include "def.h"
#include "proc.h"
#include "locks.h"

#define PIPESIZE 100

struct pipe
{
	struct spinlock lock;
	char data[PIPESIZE];
	int nrd;
	int nwr;
	int rd;
	int wr;
};

int new_pipe(struct file **f0, struct file **f1);
int pipe_rd();
int pipe_wr(struct pipe *pipe, unsigned long addr, int len);



#endif
