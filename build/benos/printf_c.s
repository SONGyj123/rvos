	.file	"printf.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	digit
	.section	.rodata
	.align	3
.LC0:
	.string	"0123456789abcdef"
	.section	.sdata,"aw"
	.align	3
	.type	digit, @object
	.size	digit, 8
digit:
	.dword	.LC0
	.text
	.align	2
	.globl	print_int
	.type	print_int, @function
print_int:
.LFB0:
	.file 1 "src/printf.c"
	.loc 1 8 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	mv	a5,a0
	mv	a4,a1
	sw	a5,-52(s0)
	mv	a5,a4
	sw	a5,-56(s0)
	.loc 1 10 6
	sw	zero,-20(s0)
	.loc 1 12 2
	j	.L2
.L3:
	.loc 1 14 17 discriminator 2
	lla	a5,digit
	ld	a4,0(a5)
	.loc 1 14 21 discriminator 2
	lw	a5,-56(s0)
	lw	a3,-52(s0)
	remuw	a5,a3,a5
	sext.w	a5,a5
	slli	a5,a5,32
	srli	a5,a5,32
	.loc 1 14 17 discriminator 2
	add	a5,a4,a5
	lbu	a4,0(a5)
	.loc 1 14 10 discriminator 2
	lw	a5,-20(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-24(a5)
	.loc 1 15 7 discriminator 2
	lw	a5,-56(s0)
	lw	a4,-52(s0)
	divuw	a5,a4,a5
	sw	a5,-52(s0)
	.loc 1 12 24 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 12 17 discriminator 1
	lw	a4,-56(s0)
	.loc 1 12 2 discriminator 1
	lw	a5,-52(s0)
	sext.w	a5,a5
	bgeu	a5,a4,.L3
	.loc 1 18 16
	lla	a5,digit
	ld	a4,0(a5)
	lwu	a5,-52(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	.loc 1 18 9
	lw	a5,-20(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-24(a5)
	.loc 1 20 7
	j	.L4
.L5:
	.loc 1 22 3
	lw	a5,-20(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-24(a5)
	mv	a0,a5
	call	uart_send_c
	.loc 1 23 4
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L4:
	.loc 1 20 7
	lw	a5,-20(s0)
	sext.w	a5,a5
	bgez	a5,.L5
	.loc 1 26 4
	sw	zero,-20(s0)
	.loc 1 27 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	print_int, .-print_int
	.align	2
	.globl	printf
	.type	printf, @function
printf:
.LFB1:
	.loc 1 30 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -72
	.cfi_offset 8, -80
	addi	s0,sp,48
	.cfi_def_cfa 8, 64
	sd	a0,-40(s0)
	sd	a1,8(s0)
	sd	a2,16(s0)
	sd	a3,24(s0)
	sd	a4,32(s0)
	sd	a5,40(s0)
	sd	a6,48(s0)
	sd	a7,56(s0)
	.loc 1 32 1
	addi	a5,s0,64
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	addi	a5,a5,-56
	sd	a5,-24(s0)
	.loc 1 34 2
	j	.L7
.L15:
	.loc 1 36 6
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 36 5
	mv	a4,a5
	li	a5,37
	bne	a4,a5,.L8
	.loc 1 38 4
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
	.loc 1 38 11
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 38 4
	mv	a3,a5
	li	a4,120
	beq	a3,a4,.L9
	mv	a3,a5
	li	a4,120
	bgt	a3,a4,.L10
	mv	a3,a5
	li	a4,100
	beq	a3,a4,.L11
	mv	a4,a5
	li	a5,112
	beq	a4,a5,.L12
	j	.L10
.L11:
	.loc 1 42 16
	ld	a5,-24(s0)
	addi	a4,a5,8
	sd	a4,-24(s0)
	lw	a5,0(a5)
	.loc 1 42 7
	sext.w	a5,a5
	li	a1,10
	mv	a0,a5
	call	print_int
	.loc 1 43 7
	j	.L14
.L9:
	.loc 1 48 7
	li	a0,48
	call	uart_send_c
	.loc 1 49 7
	li	a0,120
	call	uart_send_c
	.loc 1 50 16
	ld	a5,-24(s0)
	addi	a4,a5,8
	sd	a4,-24(s0)
	lw	a5,0(a5)
	.loc 1 50 7
	sext.w	a5,a5
	li	a1,16
	mv	a0,a5
	call	print_int
	.loc 1 51 7
	j	.L14
.L12:
	.loc 1 56 6
	li	a0,48
	call	uart_send_c
	.loc 1 57 6
	li	a0,120
	call	uart_send_c
	.loc 1 58 15
	ld	a5,-24(s0)
	addi	a4,a5,8
	sd	a4,-24(s0)
	lw	a5,0(a5)
	.loc 1 58 6
	sext.w	a5,a5
	li	a1,16
	mv	a0,a5
	call	print_int
	.loc 1 59 6
	j	.L14
.L10:
	.loc 1 64 7
	li	a0,37
	call	uart_send_c
	.loc 1 65 7
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send_c
	.loc 1 66 7
	j	.L14
.L8:
	.loc 1 72 4
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send_c
.L14:
	.loc 1 75 6
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
.L7:
	.loc 1 34 8
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 34 2
	bnez	a5,.L15
	.loc 1 79 1
	nop
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	printf, .-printf
	.section	.rodata
	.align	3
.LC1:
	.string	"panic: "
	.align	3
.LC2:
	.string	"\n"
	.text
	.align	2
	.globl	panic
	.type	panic, @function
panic:
.LFB2:
	.loc 1 82 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 83 2
	lla	a0,.LC1
	call	printf
	.loc 1 84 2
	ld	a0,-24(s0)
	call	printf
	.loc 1 85 2
	lla	a0,.LC2
	call	printf
.L17:
	.loc 1 86 7 discriminator 1
	j	.L17
	.cfi_endproc
.LFE2:
	.size	panic, .-panic
.Letext0:
	.file 2 "/usr/lib/gcc/riscv64-unknown-elf/9.3.0/include/stdarg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x155
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF11
	.4byte	.LASF12
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x28
	.byte	0x1b
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	.LASF13
	.byte	0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x63
	.byte	0x18
	.4byte	0x2d
	.byte	0x4
	.4byte	.LASF14
	.byte	0x1
	.byte	0x5
	.byte	0x7
	.4byte	0x61
	.byte	0x9
	.byte	0x3
	.8byte	digit
	.byte	0x5
	.byte	0x8
	.4byte	0x67
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x51
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x9a
	.byte	0x8
	.string	"s"
	.byte	0x1
	.byte	0x51
	.byte	0x12
	.4byte	0x61
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x7
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1d
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xda
	.byte	0x8
	.string	"fmt"
	.byte	0x1
	.byte	0x1d
	.byte	0x13
	.4byte	0x61
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x9
	.byte	0xa
	.4byte	.LASF6
	.byte	0x1
	.byte	0x1f
	.byte	0xa
	.4byte	0x3f
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0
	.byte	0x7
	.4byte	.LASF4
	.byte	0x1
	.byte	0x7
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x133
	.byte	0x8
	.string	"num"
	.byte	0x1
	.byte	0x7
	.byte	0x1d
	.4byte	0x133
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0xb
	.4byte	.LASF5
	.byte	0x1
	.byte	0x7
	.byte	0x26
	.4byte	0x13a
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xc
	.string	"buf"
	.byte	0x1
	.byte	0x9
	.byte	0x7
	.4byte	0x141
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xc
	.string	"i"
	.byte	0x1
	.byte	0xa
	.byte	0x6
	.4byte	0x13a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xe
	.4byte	0x67
	.4byte	0x151
	.byte	0xf
	.4byte	0x151
	.byte	0xf
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF6:
	.string	"args"
.LASF8:
	.string	"unsigned int"
.LASF0:
	.string	"__gnuc_va_list"
.LASF13:
	.string	"__builtin_va_list"
.LASF2:
	.string	"panic"
.LASF10:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF11:
	.string	"src/printf.c"
.LASF1:
	.string	"va_list"
.LASF14:
	.string	"digit"
.LASF5:
	.string	"base"
.LASF12:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF7:
	.string	"char"
.LASF9:
	.string	"long unsigned int"
.LASF3:
	.string	"printf"
.LASF4:
	.string	"print_int"
	.ident	"GCC: () 9.3.0"
