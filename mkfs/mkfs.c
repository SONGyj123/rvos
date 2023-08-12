#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <assert.h>

#include "../src/virt_disk.h"
#include "../src/fs.h"
//#include "../include/def.h"

#define TYPE_DIR 1
#define TYPE_FILE 2

#define FSSIZE 1000
#define BSIZE 1024
#define INODE_PER_BLOCK (BSIZE/64)
#define IBLOCK(i, sb) ((i)/INODE_PER_BLOCK + sb.inodestart)
#define min(a, b) ((a) < (b) ? (a) : (b))

unsigned int freeinode = 0;
unsigned int freeblock = 4;
int f_img;
char zero_blk[BSIZE];
struct superblock sb;

//转换为little endian
unsigned int xint(unsigned int val)
{
	unsigned int y;	
	unsigned char *cptr = (unsigned char *)(&y);

	cptr[0] = val;
	cptr[1] = val>>8;
	cptr[2] = val>>16;
	cptr[3] = val>>24;

	return y;
}

unsigned short xshort(unsigned short val)
{
	unsigned short y;
	unsigned char *cptr = (unsigned char *)(&y);
	
	cptr[0] = val;
	cptr[1] = val>>8;

	return y;
}

unsigned int inode_which_block(unsigned int inum, struct superblock sb)
{
	unsigned int which_block;

	which_block = inum/INODE_PER_BLOCK + sb.s_inode_blk;

	return which_block;
}

//根据block number n写一个sector
void wr_sec(unsigned int n, void *buf)
{
	lseek(f_img, n*BSIZE, SEEK_SET);
	write(f_img, buf, BSIZE);
}

//根据block number n读一个sector
void rd_sec(unsigned int n, void *buf)
{
	lseek(f_img, n*BSIZE, SEEK_SET);
	read(f_img, buf, BSIZE);
}

void wr_inode(unsigned int inum, struct dinode *dinode_buf)
{
	char buf[BSIZE];
	unsigned int block_num; 
	struct dinode *p;
	
	block_num = inode_which_block(inum, sb);
	//读取指定inode所在的block到缓冲区
	rd_sec(block_num, buf);

	//修改inode的内容
	p = ((struct dinode *)(buf))+(inum%INODE_PER_BLOCK);
	*p = *dinode_buf;	
	
	//回写
	wr_sec(block_num, buf);

}

void rd_inode(unsigned int inum, struct dinode *dinode_buf)
{
	char buf[BSIZE];
	unsigned int block_num = inode_which_block(inum, sb);
	struct dinode *p;

	rd_sec(block_num, buf);

	p = ((struct dinode *)(buf))+(inum%INODE_PER_BLOCK);
	*dinode_buf = *p;
}

unsigned int ialloc(unsigned short type)
{
	unsigned int inum = freeinode++;
	struct dinode new_dinode;

	//一定要清零结构提
	memset((char *)(&new_dinode), 0, 64);
	new_dinode.type = xshort(type);
	new_dinode.major = xshort(0);
	new_dinode.minor = xshort(0);
	new_dinode.nlink = xshort(1);
	new_dinode.size = xshort(0);

	wr_inode(inum, &new_dinode);

	return inum;
}

//往对应inode文件添加内容
//*xp对应待添加数据的首地址
//n对应数据长度
void iappend(unsigned int inum, void *xp, int n)
{
	char *p = (char *)xp;
	struct dinode dinode_buf;
	unsigned int offset, fbn, actual_wr_len;
	unsigned int indirect[BSIZE / sizeof(unsigned int)];
	unsigned int blk_num;
	char data_buf[BSIZE];

	printf("----------------n = %d\n", n);
	
	//读取inode到buf里面
	rd_inode(inum, &dinode_buf);

	offset = xint(dinode_buf.size);

	printf("offset = 0x%x\n", offset);
	//循环条件 如果添加的内容还没有添加完
	while(n > 0)
	{
		printf("length = 0x%x\n", n);
		//完整块的数量
		fbn = offset / BSIZE;
		printf("fbn = %u\n", n);

		//如果这个文件数据块的数量小于直接块的数量
		if(fbn < NDIRECT)
		{
			//对应还没有分配的情况 或者刚刚好文件大小是BSIZE的整数倍
			if(xint(dinode_buf.data_address[fbn] == 0))
			{
				dinode_buf.data_address[fbn] = xint(freeblock++);
			}

			blk_num = xint(dinode_buf.data_address[fbn]);
		}
		//如果超过了直接快
		else
		{
			//看看间接块的地址有没有分配
			if(xint(dinode_buf.data_address[NDIRECT]) == 0)
			{
				dinode_buf.data_address[NDIRECT] = freeblock++;
			}
			//读取间接块
			rd_sec(dinode_buf.data_address[NDIRECT], (char *)indirect);
			//查看有没有分配
			if(indirect[fbn-NDIRECT] == 0)
			{
				indirect[fbn-NDIRECT] = freeblock++;
				wr_sec(dinode_buf.data_address[NDIRECT], (char *)indirect);
			}
			blk_num = indirect[fbn-NDIRECT];
		}

		//读取这一块的内容到缓存
		rd_sec(blk_num, data_buf);

		//等待添加的内容可能比当前块剩余的空间少或者多
		//我们只写入最少的
		//如果直接按照剩余空间长度来写 可能会造成segment fault
		actual_wr_len = min(n, (fbn+1)*BSIZE-offset);
		printf("actual_wr_len = %d\n", actual_wr_len);
		memcpy(data_buf+offset-(fbn*BSIZE), p, actual_wr_len);

		//回写
		wr_sec(blk_num, data_buf);

		n -= actual_wr_len;
		offset += actual_wr_len;
		p += actual_wr_len;
	}		

	printf("-----------------offset = %d\n", offset);
	dinode_buf.size = offset;
	wr_inode(inum, &dinode_buf);
}

int main(int argc, char **argv)
{
	char buf[BSIZE];
	unsigned int root_inode;
	struct dirent dir_entry;
	unsigned int inum;
	int rd_cnt;
	int user_fd;

	if(argc < 2)
	{
		fprintf(stderr, "mkfs fs.img files\n");
		exit(1);
	}

	//创建img文件
	//O_RDWR 表示以可读可写的方式打开文件
	//O_CREAT 表示如果文件不存在则创建一个新文件
	//O_TRUNC 表示如果文件存在则将其清空
	//0666 是文件访问权限 表示该文件可读可写但不能执行
	f_img = open(argv[1], O_RDWR|O_CREAT|O_TRUNC, 0666);

	if(!f_img)
	{
		fprintf(stderr, "f_img = 0\n");
		exit(1);
	}

	//初始化img
	for(int n=0; n<FSSIZE; n++)
	{
		lseek(f_img, n*BSIZE, SEEK_SET);
		write(f_img, zero_blk, BSIZE);
	}

	//       0        1         2           3            100
	// [ boot blk | sb blk | inode blk | bitmap blk | data blk ]
	sb.magic_num = 0x40302010;
	sb.size = FSSIZE;
	sb.data_blk_num = xint(FSSIZE);
	sb.inode_num = xint(128);
	sb.s_inode_blk = xint(0x02);
	sb.s_data_blk = xint(0x04);
	sb.s_bmap = xint(0x03);

	//写超级块
	memmove(buf, &sb, BSIZE);
	wr_sec(1, buf);

	//为根目录分配inode
	root_inode = ialloc(TYPE_DIR);
	printf("root_inode: %d\n", root_inode);
	
	//打开user文件夹 准备写入其中的文件
	for(int n=2; n<argc; n++)
	{
		char *shortname;
		if(strncmp(argv[n], "./user/", 7) == 0)
		{
		  shortname = argv[n] + 7;
		  printf(shortname);
		  printf("\n");
		}
		else
		{
		  shortname = argv[n];
		}

		if((user_fd = open(argv[n], 0)) < 0)
		{
			printf("user file open failed\n");
		}

		//为这个新文件分配inode
		inum = ialloc(TYPE_FILE);
		printf("inode number %d\n", inum);

		dir_entry.inum = xshort(inum);
		strncpy(dir_entry.name, shortname, 14);
		iappend(root_inode, &dir_entry, sizeof(dir_entry));

		while((rd_cnt = read(user_fd, buf, sizeof(buf))) > 0)
		{
			printf("begin writing file data");
			iappend(inum, buf, rd_cnt);
		}

		if(close(user_fd) == -1)
		{
			printf("close failed\n");
		}
		else
		{
			printf("close success\n");
		}
	}

	printf("freeblock %d\n", freeblock);

	return 0;
}




