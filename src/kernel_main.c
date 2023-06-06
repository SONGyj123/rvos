#include "uart.h"
#include "riscv.h"
#include "def.h"
#include "src_trap.h"
#include "proc.h"
#include "virt_disk.h"
#include "plic.h"
#include "fs.h"
#include "locks.h"
#include "buddy.h"

extern unsigned long _pgt_start[]; 
extern unsigned long _free_mem_start[]; 
extern unsigned long _etext[]; 
extern unsigned long _trampoline[]; 
extern struct mem_linked_list
{
	struct mem_linked_list *nxt;
}mem_ll;
extern struct proc proc_list[MAX_PROC];

extern void swtch();

int test_num = 0;

struct spinlock print_lock;


void kernel_main()
{
	int freed_page_num;
	unsigned int n;
	char *str = "hello kernel!\n";
	print_lock.locked = 0;

	//测试printf
	for(int n=0; n<50; n++)
	{
		acquire(&print_lock);
		test_num++;
		release(&print_lock);
	}
	printf("%d\n", test_num);
	
	SBI_CALL(0x2, (unsigned long)str, 0, 0);

	//初始化空闲的内存
	//4kb一个块用链表链接起来
	freed_page_num = free_mem_in_page(&_free_mem_start, (unsigned long *)DDR_END);

	printf("free_mem_start: %p free_mem_end: %p\n", &_free_mem_start, DDR_END);
	printf("page num: %d\n", freed_page_num);

	n = ((unsigned long)DDR_END- (unsigned long)&_free_mem_start)/4096;

	if(n == freed_page_num)
	{
		uart_send_str("matched\n");
	}
	else
	{
		printf("not matched! n: %d\n", n);
	}

	//映射各外设 代码段 trampoline 空闲内存 
	//map text to 0x80000000
	map_page((pgt_t)&_pgt_start, (unsigned long)0x80000000, (unsigned long)0x80000000, ((unsigned long)_trampoline-(unsigned long)0x80000000)/4096, PTE_R | PTE_W | PTE_X);
	//map trampoline to 0x300001000
	map_page((pgt_t)&_pgt_start, (unsigned long)_trampoline, (unsigned long)TRAMPOLINE, ((unsigned long)_etext-(unsigned long)_trampoline)/4096, PTE_R | PTE_W | PTE_X);
	//map DDR to DDR
	map_page((pgt_t)&_pgt_start, (unsigned long)_etext, (unsigned long)_etext, ((unsigned long)DDR_END-(unsigned long)_etext)/4096, PTE_R | PTE_W | PTE_X);
	//map uart to 0x10000000
	map_page((pgt_t)&_pgt_start, UART0, UART0, 1, PTE_R | PTE_W | PTE_X);
	map_page((pgt_t)&_pgt_start, PLIC, PLIC, 0x1000, PTE_R | PTE_W | PTE_X);
	map_page((pgt_t)&_pgt_start, VIRT_IO_BASE, VIRT_IO_BASE, 1, PTE_R | PTE_W | PTE_X);


	//初始化每个内核栈
	init_proc_kstack(_pgt_start);
	uart_send_str("init proc kstack\n");


	//开启mmu映射
	uart_send_str("paging before\n");
	sfence_vma();
	w_satp(MAKE_SATP(&_pgt_start));
	sfence_vma();
	uart_send_str("paging after\n");

	//初始化trap
	//包括设置stvec：stvec存放的是异常入口地址
	//设置sie： 使能中断软件和外部中断
	//设置sstatus： 使能s模式下总中断
	src_trap_init();
	//while(1);

	//初始化虚拟硬盘
	virt_disk_init();

	//初始化plic
	plicinit();
	plicinithart();
	fs_init();

	struct inode test;
	struct elfhdr test1;
	struct proghdr test2;
	int flag = get_inode("/first_test.out", &test);	
	read_elfhr(&test1, &test2,  &test);

	//初始化第一个进程
	user_init();
	uart_send_str("init first process\n");

	__sync_synchronize();

	//调用swtch从kernel切换到user
	scheduler();

	while(1);
}

