//#include "elf.h"
#include "def.h"
#include "proc.h"
#include "riscv.h"
#include "fs.h"

extern unsigned long _trampoline[]; 

extern struct proc *proc_ptr;

int exec(char *path, char **argv)
{
	struct inode proc_inode;
	struct elfhdr proc_elfhdr;
	struct proghdr proc_proghdr[2];
	unsigned long *user_stack;
	pgt_t user_pagetable = proc_pagetable();
	unsigned long file_memsz = 0;

	map_page(user_pagetable, (unsigned long)_trampoline, (unsigned long)TRAMPOLINE, 1, PTE_R | PTE_X);
	map_page(user_pagetable, (unsigned long)proc_ptr->trapframe, (unsigned long)TRAMPOLINE-0x1000, 1, PTE_R | PTE_W);

	int flag = get_inode(path, &proc_inode);

	if(!flag)
	{
		printf("no such inode found!\n");
		return -1;
	}

	read_elfhr(&proc_elfhdr, proc_proghdr, &proc_inode);
	file_memsz = ((proc_proghdr[0].memsz+proc_proghdr[1].memsz)/4096+1)*4096;

	uvmalloc(user_pagetable, 0, proc_proghdr[0].memsz+proc_proghdr[1].memsz, 0);

	loadsec(user_pagetable, &proc_inode, proc_proghdr[0].vaddr, proc_proghdr[0].off, proc_proghdr[0].memsz+proc_proghdr[1].memsz);

	//分配用户栈空间
	user_stack = kalloc();
	if(!user_stack)
	{
		panic("dame\n");
	}
	else
	{
		memset(user_stack, 0, 4096);
	}

	map_page(user_pagetable, (unsigned long)user_stack, (unsigned long)file_memsz, 1, PTE_R | PTE_W | PTE_U);

	proc_ptr->proc_pagetable = user_pagetable;
	proc_ptr->prog_size = file_memsz+4096;
	proc_ptr->trapframe->epc = proc_elfhdr.entry;
	proc_ptr->trapframe->sp = file_memsz+4096;

	return 0;
}



