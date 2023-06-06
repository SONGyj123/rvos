#include "def.h"


struct stack_frame
{
	unsigned long sf_fp;
	unsigned long sf_ra;
};

void back_trace()
{
	unsigned long func_position;
	struct stack_frame *sf_ptr;
	//const register unsigned long cur_fp __asm__ ("s0");
	
	unsigned long cur_fp = (unsigned long)__builtin_frame_address(0);

	sf_ptr = (struct stack_frame *)(cur_fp - 16);

	//printf("\n");
	//printf("call frame:\n");

	while(sf_ptr->sf_fp>0x80200000)
	{
		func_position = sf_ptr->sf_ra - 4;
		printf("pc: %p\n", func_position);
		sf_ptr = (struct stack_frame *)(sf_ptr->sf_fp - 16);
	}

}




