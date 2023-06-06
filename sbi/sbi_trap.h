#ifndef __SBI_TRAP_H
#define __SBI_TRAP_H

#include "sbi_trap_reg.h"

void sbi_trap_init();
void sbi_trap_handler(struct sbi_context_str *ptr);
void sbi_ecall_handler(int id, struct sbi_context_str *ptr);

void timer_int_handler(struct sbi_context_str *ptr);

#endif
