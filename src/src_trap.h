#ifndef __SRC_TRAP_H
#define __SRC_TRAP_H

#include "asm/ptregs.h"

#define TIMER_INT 0x01
#define PLIC_INT 0x09

void src_trap_init();
void smode_exeception_handler(struct pt_regs *reg_ptr, unsigned long s_cause);
void show_regs(struct pt_regs *reg_ptr);

//user mode trap
void user_trap();
void user_trap_ret();

#endif
