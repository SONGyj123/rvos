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
	unsigned long *mem;
	pgt_t user_pagetable = proc_pagetable();

	map_page(user_pagetable, (unsigned long)_trampoline, (unsigned long)TRAMPOLINE, 1, PTE_R | PTE_X);
	map_page(user_pagetable, (unsigned long)proc_ptr->trapframe, (unsigned long)TRAMPOLINE-0x1000, 1, PTE_R | PTE_W);

	int flag = get_inode(path, &proc_inode);

	if(!flag)
	{
		printf("no such inode found!\n");
		return -1;
	}

	read_elfhr(&proc_elfhdr, proc_proghdr, &proc_inode);

	uvmalloc(user_pagetable, 0, proc_proghdr[0].memsz+proc_proghdr[1].memsz, 0);

	loadsec(user_pagetable, &proc_inode, proc_proghdr[0].vaddr, proc_proghdr[0].off, proc_proghdr[0].memsz+proc_proghdr[1].memsz);

	mem = kalloc();
	if(!mem)
	{
		panic("dame\n");
	}
	map_page(user_pagetable, (unsigned long)mem, (unsigned long)4096+4096, 1, PTE_R | PTE_W | PTE_U);

	proc_ptr->proc_pagetable = user_pagetable;
	proc_ptr->prog_size = 4096+4096+4096;
	proc_ptr->trapframe->epc = proc_elfhdr.entry;
	proc_ptr->trapframe->sp = 4096+4096+4096;



	return 0;
}



