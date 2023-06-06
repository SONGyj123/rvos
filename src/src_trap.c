#include "riscv.h"
#include "src_trap.h"
#include "proc.h"
#include "plic.h"
#include "pipe.h"

extern void smode_exeception_vec();
extern void swtch();
extern void back_trace();
extern struct proc proc_list[MAX_PROC];
extern struct proc kernel_ctxt;
extern struct proc *proc_ptr;

extern void trampoline();
extern void uservec();
extern void userret();
extern void virtio_intr();
extern unsigned long _pgt_start[];

extern int exec(char *path, char **argv);

struct fault_info {
	void (*fault_handler)(struct pt_regs *, unsigned long);
	char *fault_name;
};


unsigned long sys_print();
int sys_fork();
int sys_exec();
int sys_sleep();
int sys_pipe();
int sys_write();
int sys_read();
int sys_open();
int sys_mmap();

unsigned long systicks = 0;
struct spinlock systicks_lock = {0};

static const struct fault_info fault_info[] = {
	{smode_exeception_handler, "instruction not aligned\n"},
	{smode_exeception_handler, "instruction access fault\n"},
	{smode_exeception_handler, "illegal instruction\n"},
	{smode_exeception_handler, "break point\n"},
	{smode_exeception_handler, "load address not aligned\n"},
	{smode_exeception_handler, "load address access fault\n"},
	{smode_exeception_handler, "store/amo address not aligned\n"},
	{smode_exeception_handler, "store/amo address access fault\n"},
	{smode_exeception_handler, "syscall from U\n"},
	{smode_exeception_handler, "syscall from S\n"},
	{smode_exeception_handler, "unknown 10\n"},
	{smode_exeception_handler, "unknown 11\n"},
	{smode_exeception_handler, "instruction page fault\n"},
	{smode_exeception_handler, "load page fault\n"},
	{smode_exeception_handler, "unknown 14\n"},
	{smode_exeception_handler, "store/amo page fault\n"},
};

static unsigned long (*syscall[])(void) = {
	[0x01] sys_fork,
	[0x02] sys_exec,
	[0x03] sys_sleep,
	[0x04] sys_pipe,
	[0x05] sys_read,
	[0x06] sys_write,
	[0x07] sys_open,
	[0x08] sys_mmap,
	[0x20] sys_print,
};

//初始化S模式trap vec
void src_trap_init()
{
	w_stvec((unsigned long)smode_exeception_vec);

	//开启软件中断
	w_sie(0x02);
	//开启外部中断
	w_sie(r_sie() | (0x01<<9));
	w_sstatus(0x02);
}

//S模式trap处理函数
void smode_exeception_handler(struct pt_regs *reg_ptr, unsigned long s_cause)
{
	int ex_int_irq = 0;

	if(((s_cause>>63) & 0x01) == 0)
	{
		printf("Trap!!! scause: %p\n", s_cause);
		printf(fault_info[s_cause].fault_name);
		show_regs(reg_ptr);
		back_trace();
		panic("\n");
	}
	else
	{
		switch(s_cause-0x8000000000000000)
		{
			case TIMER_INT:
				{
					//printf("soft interrupt from M level --------- timer interrupt %d\n", 123);
					//w_sip(1);
					w_sip(r_sip() & ~2);
					acquire(&systicks_lock);
					systicks++;
					release(&systicks_lock);
					wakeup(&systicks);
					back_to_kernel();

					//reg_ptr->sepc += 0x04;
					break;
				}
			case PLIC_INT:
				{
					ex_int_irq = plic_claim();
					if(ex_int_irq == UART0_IRQ)
					{
						uart_rd_char();
						printf("smode uart int\n");
					}
					else if(ex_int_irq == VIRTIO0_IRQ)
					{
						//printf("virtio int\n");
						virtio_intr();
					}

					if(ex_int_irq)
					{
						plic_complete(ex_int_irq);
					}
					else
					{
						panic("smode damn\n");
					}
					break;
				}
			default:
				{
					printf("default case\n");
					break;
				}
		}	
	}
}

//S模式trap处理函数
void show_regs(struct pt_regs *reg_ptr)
{
	printf("sepc: %p ra: %p sp: %p\n", reg_ptr->sepc, reg_ptr->ra, reg_ptr->sp);
	printf("  gp: %p tp: %p t0: %p\n", reg_ptr->gp, reg_ptr->tp, reg_ptr->t0);
	printf("  t1: %p t2: %p s0: %p\n", reg_ptr->t1, reg_ptr->t2, reg_ptr->s2);
	printf("  gp: %p tp: %p t0: %p\n", reg_ptr->gp, reg_ptr->tp, reg_ptr->t0);

}

//U模式trap处理函数
void user_trap()
{
	char input_char;
	int ex_int_irq = 0;
	int syscall_num = proc_ptr->trapframe->a7;
	unsigned long trap_cause = r_scause();

	w_stvec((unsigned long)smode_exeception_vec);

	if(trap_cause == 8)
	{
		proc_ptr->trapframe->epc = r_sepc() + 4; 

		intr_on();
		proc_ptr->trapframe->a0 = syscall[syscall_num]();
	}
	//S模式软件中断
	else if(trap_cause == 0x8000000000000001)
	{
		proc_ptr->trapframe->epc = r_sepc();
		w_sip(r_sip() & ~2);
		acquire(&systicks_lock);
		systicks++;
		release(&systicks_lock);
		wakeup(&systicks);
		back_to_kernel();
	}
	else if(trap_cause == 0x8000000000000009)
	{
		proc_ptr->trapframe->epc = r_sepc();
		ex_int_irq = plic_claim();
		if(ex_int_irq == UART0_IRQ)
		{
			input_char = uart_rd_char();
			if(input_char == 0x100)
			{
				uart_send_c('\b');
				uart_send_c(' ');
				uart_send_c('\b');
			}
			else
			{
				uart_send_c(input_char);
			}
		}
		if(ex_int_irq)
		{
			plic_complete(ex_int_irq);
		}
	}
	else
	{
		printf("user_trap(): unexpected scause %p \n", trap_cause);
		printf("r_sepc----pc = %p \n", r_sepc());
		printf("ra = %p \n", proc_ptr->trapframe->ra);
		printf("sp = %p \n", proc_ptr->trapframe->sp);
		printf("proc_ptr = %p \n", proc_ptr);
		printf("proc_list = %p \n", proc_list);
		printf(fault_info[r_scause()].fault_name);
		panic("panic/n");
	}

	user_trap_ret();
}

//U模式trap返回
void user_trap_ret()
{
	intr_off();	

	unsigned long trampoline_uservec = TRAMPOLINE + (uservec - trampoline);

	w_stvec(trampoline_uservec);

	unsigned long x = r_sstatus();
	x &= ~SSTATUS_SPP;
	//这里允许了中断！！！
	x |= SSTATUS_SPIE;

	//之前在全局变量里面 在用户模式下不能访问 看不到
	proc_ptr->trapframe->kernel_satp = MAKE_SATP(_pgt_start);
	proc_ptr->trapframe->kernel_trap = (unsigned long)user_trap;
	proc_ptr->trapframe->kernel_sp = (unsigned long)proc_ptr->kstack;


	w_sstatus(x);

	w_sepc(proc_ptr->trapframe->epc);
	unsigned long satp = MAKE_SATP(proc_ptr->proc_pagetable);
	unsigned long trampoline_userret = TRAMPOLINE + (userret - trampoline);
	((void (*)(unsigned long))trampoline_userret)(satp);
}

void back_to_kernel()
{
	proc_ptr->state = RUNNABLE;
	swtch(&proc_ptr->context, &kernel_ctxt.context);
}

unsigned long sys_print()
{
	char c = proc_ptr->trapframe->a0;

	uart_send_c(c);

	return 0;
}

int sys_fork()
{
	return fork();
}

int sys_exec()
{
	char *path = "/first_test.out";
	return exec(path, 0);
}

int sys_sleep()
{
	int interval = proc_ptr->trapframe->a0;
	acquire(&systicks_lock);
	unsigned long tick_st = systicks;
	while(systicks-tick_st < interval)
	{
		sleep(&systicks, &systicks_lock);
	}
	release(&systicks_lock);
	return 0;
}

int sys_pipe()
{
	unsigned long fd_arr = proc_ptr->trapframe->a0;

	struct file *f0;
	struct file *f1;
	new_pipe(&f0, &f1);
	
	int fd[2] = {0};
	fd[0] = fd_alloc(f0);
	fd[1] = fd_alloc(f1);
	if(fd[0] == -1 || fd[1] == -1)
	{
		return -1;
	}

	copy_to_user(proc_ptr->proc_pagetable, fd_arr, &fd[0], sizeof(fd));

	return 0;
}

int sys_write()
{
	int fd = proc_ptr->trapframe->a0;
	unsigned long va_addr = proc_ptr->trapframe->a1;
	int len = proc_ptr->trapframe->a2;

	struct file *which_file = proc_ptr->ofile[fd];

	if(which_file->type == FD_PIPE)
	{
		pipe_wr(which_file->pipe, va_addr, len);
	}
	else
	{
		write_to_inode(which_file->ip, va_addr, which_file->off, len, TO_KERNEL);
		which_file->off += len;
	}

	return 0;
}

//ssize_t read(int fd, void *buf, size_t count);
int sys_read()
{
	int fd = proc_ptr->trapframe->a0;
	unsigned long va_addr = proc_ptr->trapframe->a1;
	int len = proc_ptr->trapframe->a2;

	struct file *which_file = proc_ptr->ofile[fd];

	if(which_file->type == FD_PIPE)
	{
		pipe_rd(which_file->pipe, va_addr, len);
	}
	else if(which_file->type == FD_INODE)
	{
		read_from_inode(which_file->ip, va_addr, which_file->off, len, TO_USER);
		which_file->off += len;
	}
	return 0;
}

//int open(const char *pathname, int flags);
int sys_open()
{
	const char *pathname = proc_ptr->trapframe->a0;
	int flags = proc_ptr->trapframe->a1;

	struct inode *file_inode = kalloc();
	struct file *open_file;
	int fd;

	char *path[50] = {0};
	copy_from_user(proc_ptr->proc_pagetable, path, pathname, 13);
	
	get_inode(path, file_inode);		 

	open_file = file_alloc();
	fd = fd_alloc(open_file);

	if(file_inode->content.type == TYPE_FILE)
	{
		open_file->type = FD_INODE;
		open_file->off = 0;
	}

	open_file->ip = file_inode;

	return fd;
}

//void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
int sys_mmap()
{
	return 0;
}
