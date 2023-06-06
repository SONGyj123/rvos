.global _start
_start:
	li a0, 0x73
	li a7, 0x20
	ecall

	li a0, 0x6c
	li a7, 0x20
	ecall

	li a0, 0x65
	li a7, 0x20
	ecall

	li a0, 0x65
	li a7, 0x20
	ecall

	li a0, 0x70
	li a7, 0x20
	ecall

	li a0, 50
	li a7, 0x03
	ecall

	li a0, 0x6f
	li a7, 0x20
	ecall
	
	li a0, 0x6b
	li a7, 0x20
	ecall

loop:
	j loop
