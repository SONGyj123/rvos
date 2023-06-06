#ifndef __TIMER_H
#define __TIMER_H

#include "riscv.h"

#define CLINT 0x2000000L
#define CLINT_MTIME (CLINT+(0xBFF8))
#define CLINT_TIMECMP(id) (CLINT+(0x4000+8*(id)))

#define INTERVAL 1000000

#define MIE_MTIE (1L << 7)
#define MIE_SSIE (1L << 1)

void timer_init();

#endif
