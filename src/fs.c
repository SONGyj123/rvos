#include "fs.h"
//#include "elf.h"
#include "virt_disk.h"
#include "def.h"
#include "proc.h"

extern struct proc *proc_ptr;

struct superblock sb;

//根据inode num找到这个inode在那一个block
unsigned int inode_which_block(unsigned int inum, struct superblock sb)
{
	unsigned int which_block;

	which_block = inum/INODES_PER_BLK + sb.s_inode_blk;

	return which_block;
}

//根据inode num将inode信息读入结构提
void rd_inode(unsigned int inum, struct inode *inode_buf)
{
	struct buf *buf = kalloc();
	struct dinode *p;

	buf->dev = 0x01;
	buf->blockno = inode_which_block(inum, sb);
	buf->valid = 0x00;
	buf->refcnt = 0x01;

	virtio_disk_rw(buf, 0);

	p = ((struct dinode *)(&(buf->data)))+(inum%INODES_PER_BLK);
	inode_buf->ndev = 0x01;
	inode_buf->ninode = inum;
	inode_buf->content = *p;

	kfree(buf);
}

//读取超级块
static void read_sb(struct superblock *sb)
{
	struct buf *blk_buf = kalloc();
	if(blk_buf == 0)
	{
		panic("blk_buf is NULL");
	}

	blk_buf->dev = 0x01;
	blk_buf->blockno = 0x01;
	blk_buf->valid = 0x00;
	blk_buf->refcnt = 0x01;
	virtio_disk_rw(blk_buf, 0);	
	memmove(sb, blk_buf->data, sizeof(struct superblock));

	kfree(blk_buf);
}

void fs_init()
{
	read_sb(&sb);
	if(sb.magic_num != 0x40302010)
	{
		printf("------------------wrong superblock\n");
	}
	else
	{
		printf("s_inode_blk: %d\n", sb.s_inode_blk);
		printf("s_data_blk: %d\n", sb.s_data_blk);
	}
}

char *get_nxt_name(char *path, char *name)
{
	char *s;
	int len = 0;
	for(int n=0; n<14; n++)
	{
		name[n] = 0;
	}
	
	//跳过第一个“/”
	if(*path == 0)
	{
		return 0;
	}
	if(*path == '/')
	{
		path++;
	}
	else
	{
		return 0;
	}

	s = path;
	
	while(*path != '/' && *path != '\0')
	{
		path++;
	}

	len = path - s;	
	memmove(name, s, len);
	
	return path;
}

//根据path来读取inode信息
int get_inode(char *path, struct inode *ino)
{
	char *ptr = path;
	char name[14];
	int inum = 0;
	struct inode cur_inode;
	struct dirent *de_ptr;

	if(ptr == 0)
	{
		printf("bad path\n");
		return 0;
	}

	while(ptr != 0)
	{
		ptr = get_nxt_name(ptr, name);
		//读取当前的inode对应的内容到cur_inode
		rd_inode(inum, &cur_inode);

		//根据文件的大小来遍历里面的内容
		for(int offset=0; offset<cur_inode.content.size; offset += sizeof(struct dirent))
		{
			struct buf *blk_buf = kalloc();	
			blk_buf->dev = 0x01;
			blk_buf->blockno = cur_inode.content.data_address[offset / BSIZE];
			blk_buf->valid = 0x00;
			blk_buf->refcnt = 0x01;

			virtio_disk_rw(blk_buf, 0);	

			//注意跳过blk前面的标志位
			de_ptr = (struct dirent *)(&(blk_buf->data[offset % BSIZE]));
			if(strncmp(de_ptr->name, name, 14) == 0)
			{
				//printf("find! inum = %d\n", de_ptr->inum);
				rd_inode(de_ptr->inum, ino);			
				kfree(blk_buf);
				goto found;
			}

			kfree(blk_buf);
		}
	}

	printf("get_inode() failed!\n");
	printf("nothing found!\n");
	return 0;

found:
	return 1;
}

//输入inode的第n block 输出在磁盘上的地址(即实际块号)
unsigned int blknum_to_addr(struct inode *ip, unsigned int blknum)
{
	unsigned int addr = 0;
	//如果这个num依然属于直接块
	if(blknum < NDIRECT)
	{
		addr = ip->content.data_address[blknum];
		return addr;
	}

	//间接块索引缓冲
	struct buf *indirect_index_buf = kalloc();
	unsigned int *indirect;
	blknum -= NDIRECT;

	if(blknum < NINDRIRECT)
	{
		//取得存储间接块索引的block num
		addr = ip->content.data_address[NDIRECT];
		//读取这个索引块
		indirect_index_buf->dev = 0x01;
		indirect_index_buf->blockno = addr;
		indirect_index_buf->valid = 0x00;
		indirect_index_buf->refcnt = 0x01;

		virtio_disk_rw(indirect_index_buf, 0);	

		indirect = (unsigned int *)indirect_index_buf->data;
		addr = indirect[blknum];
		
		kfree(indirect_index_buf);
		return addr;
	}

	panic("out of range");
	//never get here
	return 0;
}

void read_elfhr(struct elfhdr* hdr, struct proghdr *phdr, struct inode *ino_ptr)
{
	struct buf *blk_buf = kalloc();
	if(blk_buf == 0)
	{
		panic("blk_buf is NULL");
	}

	blk_buf->dev = 0x01;
	blk_buf->blockno = ino_ptr->content.data_address[0];
	blk_buf->valid = 0x00;
	blk_buf->refcnt = 0x01;

	virtio_disk_rw(blk_buf, 0);	

	if(blk_buf->data[0] != 0x7f || blk_buf->data[1] != 'E' || blk_buf->data[2] != 'L' || blk_buf->data[3] != 'F')
	{
		printf("bad elf\n");
		goto end;
	}	
	
	//elf header和program header是最开始的两个结构提
	*hdr = *(struct elfhdr *)(blk_buf->data);
	phdr[0] = *(struct proghdr *)((struct elfhdr *)(blk_buf->data)+1);
	phdr[1] = *(struct proghdr *)((blk_buf->data)+sizeof(struct elfhdr)+sizeof(struct proghdr));

end:
	kfree(blk_buf);
}


//从inode中读取数据到一个地方
int read_from_inode(struct inode *ip, unsigned long dst, unsigned long offset, unsigned int len, int to_where)
{
	unsigned int total_rd = 0;
	unsigned int inode_blknum = offset/BLK_SIZE;
	unsigned int blk_offset = offset%BLK_SIZE;
	unsigned int single_rd_len = 0;

	struct buf *blk_buf = kalloc();

	for(total_rd=0; total_rd<len; total_rd+=single_rd_len, offset+=single_rd_len, dst+=single_rd_len)
	{
		inode_blknum = offset/BLK_SIZE;
		blk_buf->dev = 0x01;
		blk_buf->blockno = blknum_to_addr(ip, inode_blknum);
		blk_buf->valid = 0x00;
		blk_buf->refcnt = 0x01;

		virtio_disk_rw(blk_buf, 0);	
		single_rd_len = (len>BLK_SIZE-blk_offset)?(BLK_SIZE-blk_offset):(len);

		if(to_where == TO_KERNEL)
		{
			memmove(dst, blk_buf->data, single_rd_len);
		}
		else
		{
			copy_to_user(proc_ptr->proc_pagetable, dst, blk_buf->data+blk_offset, single_rd_len);
		}

	}
	kfree(blk_buf);

	return 0;
}

int write_to_inode(struct inode *ip, unsigned long src, unsigned long offset, unsigned int len, int to_where)
{
	unsigned int inode_blknum;
	unsigned int st;
	unsigned int blk_res_len;
	unsigned int actual_wr_len;
	struct buf *blk_buf = kalloc();	

	for(int n=0; 0<len;)
	{
		//计算新的block号码和起始位置
		inode_blknum = offset/BLK_SIZE;
		st = offset%BLK_SIZE;

		//读入block
		blk_buf->dev = 0x01;
		blk_buf->blockno = blknum_to_addr(ip, inode_blknum);
		blk_buf->valid = 0x00;
		blk_buf->refcnt = 0x01;

		virtio_disk_rw(blk_buf, 0);	

		//修改block
		blk_res_len = BLK_SIZE - st;
		actual_wr_len = (len<blk_res_len)?(len):(blk_res_len);

		if(to_where == TO_KERNEL)
		{
			copy_from_user(proc_ptr->proc_pagetable, blk_buf->data+st, src, actual_wr_len);
		}
		else
		{
		}

		//回写block
		virtio_disk_rw(blk_buf, 1);	

		//更新新的位置
		offset += actual_wr_len;
		len -= actual_wr_len;
		src += actual_wr_len;
	}

	kfree(blk_buf);

	return 0;
}

void loadsec(pgt_t pagetable, struct inode *ip, unsigned long va, unsigned int offset, unsigned int sz)
{
	unsigned long pa;
	int i = 0;
	int wr_len = 0;
	int wr_off = 0;

	for(int n=0; n<sz; n+=4096, offset+=4096)
	{
		pa = va_to_pa(pagetable, va+n);
		{
			read_from_inode(ip, pa, offset, 4096, TO_KERNEL);
			/*
			struct buf *blk_buf = kalloc();
			blk_buf->dev = 0x01;
			blk_buf->blockno = ip->content.data_address[i];
			blk_buf->valid = 0x00;
			blk_buf->refcnt = 0x01;

			virtio_disk_rw(blk_buf, 0);
			//wr_len = wr_len<res_sz ? wr_len : res_sz;
			wr_len = sz;

			memmove(pa, blk_buf->data+wr_off, wr_len);
			kfree(blk_buf);
			*/
		}
	}
}




