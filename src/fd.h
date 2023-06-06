#ifndef __FILE_DESCRIPTOR_H
#define __FILE_DESCRIPTOR_H

#define MAX_FILE 20

#include "fs.h"
#include "proc.h"

//file descriptor layer
struct file
{
	enum {FD_NONE, FD_PIPE, FD_INODE, FD_DEVICE} type;
	int ref_cnt;
	char readable;
	char writable;
	struct inode *ip;
	struct pipe *pipe;
	unsigned int off;
	short major;
};

//file related func declarations
struct file *file_alloc();
struct file *file_dup(struct file *file);
void file_close(struct file *file);
int fd_alloc(struct file *file_t_addr);



#endif
