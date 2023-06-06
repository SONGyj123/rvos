
.section ".text.boot"
.globl _start
_start:
	csrw mie, zero

	la sp, stack0
	csrr t0, mhartid
	addi t0, t0, 1
	li t1, 4096
	mul t0, t0, t1
	add	sp, sp, t0

	csrw mscratch, sp

	j sbi_main

.section .data
.align 12

.global stack0
stack0:
	.skip 4096
.global stack1
stack1:
	.skip 4096
.global stack2
stack2:
	.skip 4096
.global stack3
stack3:
	.skip 4096
