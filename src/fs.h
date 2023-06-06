#ifndef __FS_H
#define __FS_H

#define BLK_SIZE 1024	//block size
#define NDIRECT 12	//number of direct block address
#define NINDRIRECT (BLK_SIZE/(sizeof(unsigned int)))	//number of indirect block address

#define TYPE_DIR 1
#define TYPE_FILE 2

#define TO_KERNEL	0
#define TO_USER		1

struct superblock
{
	unsigned int magic_num;
	unsigned int size;
	unsigned int data_blk_num;
	unsigned int inode_num;
	unsigned int log_num;
	unsigned int s_data_blk;
	unsigned int s_inode_blk;
	unsigned int s_bmap;
};

//on disk inode structure
struct dinode
{
	short type;		//file directory device
	short major;	//what kind of device? eg. serial port
	short minor;	//which one? COM5
	short nlink;	//number of link to the inode
	unsigned int size;
	unsigned int data_address[NDIRECT+1];	//data block address 12direct + 1indirect
};

//in RAM inode structure
struct inode
{
	unsigned int ndev;		//device number
	unsigned int ninode;	//inode number
	int ref;
	int valid;

	struct dinode content;	//copy of dinode
};

//directory entry
struct dirent
{
	unsigned short inum;
	char name[14];
};

//elf header
struct elfhdr
{
	unsigned int magic_num;
	unsigned char elf[12];
	unsigned short type;
	unsigned short mach;
	unsigned int version;
	unsigned long entry;
	unsigned long phyoff;
	unsigned long shoff;
	unsigned int flag;
	unsigned short ehsize;
	unsigned short phentsize;	//每个program header的长度
	unsigned short phnum;		//表示有几个program header
	unsigned short shentsize;
	unsigned short shnum;
	unsigned short shstrndx;
};

//program header
struct proghdr
{
	unsigned int type;
	unsigned int flags;
	unsigned long off;
	unsigned long vaddr;
	unsigned long paddr;
	unsigned long filesz;
	unsigned long memsz;
	unsigned long align;
};

//每个block有多少个inode
#define INODES_PER_BLK (BLK_SIZE/(sizeof(struct inode)))
#define MAX_FILE 20

void fs_init();
char *get_nxt_name(char *path, char *name);
int get_inode(char *path, struct inode *ino);
void read_elfhr(struct elfhdr* hdr, struct proghdr* phdr, struct inode *ino_ptr);
int read_from_inode(struct inode *ip, unsigned long dst, unsigned long offset, unsigned int len, int to_where);
int write_to_inode(struct inode *ip, unsigned long src, unsigned long offset, unsigned int len, int to_where);


struct file *new_file_st();


#endif
