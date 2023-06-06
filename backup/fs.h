#ifndef __FS_H
#define __FS_H

#define BLK_SIZE 1024	//block size
#define NDIRECT 12	//number of direct block address
#define NINDRIRECT (BLK_SIZE/(sizeof(unsigned int)))	//number of indirect block address

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

//每个block有多少个inode
#define INODES_PER_BLK (BLK_SIZE/(sizeof(struct inode)))

#endif
