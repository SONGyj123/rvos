.section ".text.boot"
.globl _start
_start:
	csrw sie, zero

	la sp, stack0
	li a7, 0x03
	ecall
	addi a0, a0, 1
	li t2, 4096
	mul a0, a0, t2
	add	sp, sp, a0

	j kernel_main

.section .data
.align 12

//这些是放在data段的
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
