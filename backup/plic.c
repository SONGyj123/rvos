#include "riscv.h"
#include "def.h"
#include "plic.h"

void
plicinit(void)
{
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(unsigned int*)(PLIC + UART0_IRQ*4) = 1;
  *(unsigned int*)(PLIC + VIRTIO0_IRQ*4) = 1;
}

void
plicinithart(void)
{
  int hart = 0;//cpuid();
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(unsigned int*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);

  // set this hart's S-mode priority threshold to 0.
  *(unsigned int*)PLIC_SPRIORITY(hart) = 0;
}

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
  int hart = 0;//cpuid();
  int irq = *(unsigned int*)PLIC_SCLAIM(hart);
  return irq;
}

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
  int hart = 0;//cpuid();
  *(unsigned int*)PLIC_SCLAIM(hart) = irq;
}

