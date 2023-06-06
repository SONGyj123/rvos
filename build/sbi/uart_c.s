	.file	"uart.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.sdata,"aw"
	.align	2
	.type	uart_clk, @object
	.size	uart_clk, 4
uart_clk:
	.word	1843200
	.text
	.align	2
	.globl	uart_init
	.type	uart_init, @function
uart_init:
.LFB28:
	.file 1 "sbi/uart.c"
	.loc 1 8 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 9 33
	lla	a5,uart_clk
	lw	a5,0(a5)
	.loc 1 9 15
	mv	a4,a5
	li	a5,1843200
	divuw	a5,a4,a5
	sw	a5,-20(s0)
	.loc 1 10 4
	li	a5,268435456
	addi	a5,a5,1
	.loc 1 10 48
	sb	zero,0(a5)
	.loc 1 12 4
	li	a5,268435456
	addi	a5,a5,3
	.loc 1 12 48
	li	a4,-128
	sb	a4,0(a5)
	.loc 1 13 4
	li	a5,268435456
	.loc 1 13 50
	lw	a4,-20(s0)
	andi	a4,a4,0xff
	.loc 1 13 48
	sb	a4,0(a5)
	.loc 1 14 73
	lw	a5,-20(s0)
	srliw	a5,a5,8
	sext.w	a4,a5
	.loc 1 14 4
	li	a5,268435456
	addi	a5,a5,1
	.loc 1 14 50
	andi	a4,a4,0xff
	.loc 1 14 48
	sb	a4,0(a5)
	.loc 1 16 4
	li	a5,268435456
	addi	a5,a5,3
	.loc 1 16 48
	li	a4,3
	sb	a4,0(a5)
	.loc 1 17 4
	li	a5,268435456
	addi	a5,a5,2
	.loc 1 17 48
	li	a4,-57
	sb	a4,0(a5)
	.loc 1 18 4
	li	a5,268435456
	addi	a5,a5,1
	.loc 1 18 48
	li	a4,1
	sb	a4,0(a5)
	.loc 1 19 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	uart_init, .-uart_init
	.align	2
	.globl	uart_send_char
	.type	uart_send_char, @function
uart_send_char:
.LFB29:
	.loc 1 22 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 1 23 7
	nop
.L3:
	.loc 1 23 10 discriminator 1
	li	a5,268435456
	addi	a5,a5,5
	lbu	a5,0(a5)
	andi	a5,a5,0xff
	.loc 1 23 54 discriminator 1
	sext.w	a5,a5
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 23 7 discriminator 1
	beqz	a5,.L3
	.loc 1 25 4
	li	a5,268435456
	.loc 1 25 48
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	.loc 1 26 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE29:
	.size	uart_send_char, .-uart_send_char
	.align	2
	.globl	uart_send_string
	.type	uart_send_string, @function
uart_send_string:
.LFB30:
	.loc 1 29 1
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
	.loc 1 30 7
	j	.L5
.L6:
	.loc 1 32 3
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send_char
	.loc 1 34 4
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L5:
	.loc 1 30 8
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 1 30 7
	bnez	a5,.L6
	.loc 1 36 1
	nop
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE30:
	.size	uart_send_string, .-uart_send_string
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF6
	.byte	0xc
	.4byte	.LASF7
	.4byte	.LASF8
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x5
	.byte	0x15
	.4byte	0x43
	.byte	0x9
	.byte	0x3
	.8byte	uart_clk
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.byte	0x4
	.4byte	.LASF2
	.byte	0x1
	.byte	0x1c
	.byte	0x6
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0x76
	.byte	0x5
	.string	"s"
	.byte	0x1
	.byte	0x1c
	.byte	0x1d
	.4byte	0x76
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x7c
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x7
	.4byte	.LASF3
	.byte	0x1
	.byte	0x15
	.byte	0x6
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0xaf
	.byte	0x5
	.string	"c"
	.byte	0x1
	.byte	0x15
	.byte	0x1a
	.4byte	0x7c
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0x7
	.byte	0x6
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.byte	0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x9
	.byte	0xf
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
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
.LASF7:
	.string	"sbi/uart.c"
.LASF0:
	.string	"unsigned int"
.LASF5:
	.string	"divisor"
.LASF6:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF9:
	.string	"uart_init"
.LASF8:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF4:
	.string	"uart_clk"
.LASF3:
	.string	"uart_send_char"
.LASF1:
	.string	"char"
.LASF2:
	.string	"uart_send_string"
	.ident	"GCC: () 9.3.0"
