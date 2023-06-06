#include "timer.h"

void timer_init()
{
	int interval = INTERVAL;

	*(unsigned long *)(CLINT_TIMECMP(0x00)) = *(unsigned long *)CLINT_MTIME + interval;

	w_mie(r_mie() | MIE_MTIE | MIE_SSIE);
}



