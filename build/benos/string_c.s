	.file	"string.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	3
.LC0:
	.string	"NULL ptr\n"
	.text
	.align	2
	.globl	memset
	.type	memset, @function
memset:
.LFB0:
	.file 1 "src/string.c"
	.loc 1 4 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	mv	a5,a1
	mv	a4,a2
	sw	a5,-44(s0)
	mv	a5,a4
	sw	a5,-48(s0)
	.loc 1 5 8
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	.loc 1 7 4
	ld	a5,-24(s0)
	bnez	a5,.L3
	.loc 1 9 3
	lla	a0,.LC0
	call	panic
	.loc 1 12 7
	j	.L3
.L4:
	.loc 1 14 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 14 12
	lw	a4,-44(s0)
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L3:
	.loc 1 12 13
	lw	a5,-48(s0)
	addiw	a4,a5,-1
	sw	a4,-48(s0)
	.loc 1 12 7
	bnez	a5,.L4
	.loc 1 17 9
	ld	a5,-40(s0)
	.loc 1 18 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	memset, .-memset
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
.LFB1:
	.loc 1 21 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	mv	a5,a2
	sw	a5,-52(s0)
	.loc 1 25 4
	lw	a5,-52(s0)
	sext.w	a5,a5
	bnez	a5,.L7
	.loc 1 26 9
	ld	a5,-40(s0)
	j	.L8
.L7:
	.loc 1 28 4
	ld	a5,-48(s0)
	sd	a5,-24(s0)
	.loc 1 29 4
	ld	a5,-40(s0)
	sd	a5,-32(s0)
	.loc 1 30 4
	ld	a4,-24(s0)
	ld	a5,-32(s0)
	bgeu	a4,a5,.L13
	.loc 1 30 16 discriminator 1
	lw	a5,-52(s0)
	ld	a4,-24(s0)
	add	a5,a4,a5
	.loc 1 30 11 discriminator 1
	ld	a4,-32(s0)
	bgeu	a4,a5,.L13
	.loc 1 31 5
	lw	a5,-52(s0)
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 1 32 5
	lw	a5,-52(s0)
	ld	a4,-32(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 33 8
	j	.L10
.L11:
	.loc 1 34 8
	ld	a5,-24(s0)
	addi	a5,a5,-1
	sd	a5,-24(s0)
	ld	a5,-32(s0)
	addi	a5,a5,-1
	sd	a5,-32(s0)
	.loc 1 34 10
	ld	a5,-24(s0)
	lbu	a4,0(a5)
	.loc 1 34 8
	ld	a5,-32(s0)
	sb	a4,0(a5)
.L10:
	.loc 1 33 10
	lw	a5,-52(s0)
	addiw	a4,a5,-1
	sw	a4,-52(s0)
	.loc 1 33 8
	bgtz	a5,.L11
	.loc 1 30 4
	j	.L12
.L14:
	.loc 1 37 12
	ld	a4,-24(s0)
	addi	a5,a4,1
	sd	a5,-24(s0)
	.loc 1 37 5
	ld	a5,-32(s0)
	addi	a3,a5,1
	sd	a3,-32(s0)
	.loc 1 37 10
	lbu	a4,0(a4)
	.loc 1 37 8
	sb	a4,0(a5)
.L13:
	.loc 1 36 9
	lw	a5,-52(s0)
	addiw	a4,a5,-1
	sw	a4,-52(s0)
	.loc 1 36 7
	bgtz	a5,.L14
.L12:
	.loc 1 39 9
	ld	a5,-40(s0)
.L8:
	.loc 1 40 1
	mv	a0,a5
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	memmove, .-memmove
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB2:
	.loc 1 43 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	mv	a5,a2
	sw	a5,-36(s0)
	.loc 1 44 9
	lw	a5,-36(s0)
	mv	a2,a5
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	memmove
	mv	a5,a0
	.loc 1 45 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	memcpy, .-memcpy
	.align	2
	.globl	strncmp
	.type	strncmp, @function
strncmp:
.LFB3:
	.loc 1 48 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	mv	a5,a2
	sw	a5,-36(s0)
	.loc 1 49 8
	j	.L18
.L20:
	.loc 1 50 6
	lw	a5,-36(s0)
	addiw	a5,a5,-1
	sw	a5,-36(s0)
	.loc 1 50 11
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	.loc 1 50 16
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
.L18:
	.loc 1 49 8
	lw	a5,-36(s0)
	sext.w	a5,a5
	beqz	a5,.L19
	.loc 1 49 18 discriminator 1
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 1 49 15 discriminator 1
	beqz	a5,.L19
	.loc 1 49 24 discriminator 2
	ld	a5,-24(s0)
	lbu	a4,0(a5)
	.loc 1 49 30 discriminator 2
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 1 49 21 discriminator 2
	beq	a4,a5,.L20
.L19:
	.loc 1 51 5
	lw	a5,-36(s0)
	sext.w	a5,a5
	bnez	a5,.L21
	.loc 1 52 12
	li	a5,0
	j	.L22
.L21:
	.loc 1 53 25
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 1 53 10
	sext.w	a4,a5
	.loc 1 53 45
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 1 53 30
	sext.w	a5,a5
	.loc 1 53 28
	subw	a5,a4,a5
	sext.w	a5,a5
.L22:
	.loc 1 54 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	strncmp, .-strncmp
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1b9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF8
	.byte	0xc
	.4byte	.LASF9
	.4byte	.LASF10
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2f
	.byte	0x5
	.4byte	0x7e
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x7e
	.byte	0x4
	.string	"p"
	.byte	0x1
	.byte	0x2f
	.byte	0x19
	.4byte	0x85
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.string	"q"
	.byte	0x1
	.byte	0x2f
	.byte	0x28
	.4byte	0x85
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.string	"n"
	.byte	0x1
	.byte	0x2f
	.byte	0x38
	.4byte	0x97
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x6
	.byte	0x8
	.4byte	0x92
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x7
	.4byte	0x8b
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x8
	.4byte	.LASF4
	.byte	0x1
	.byte	0x2a
	.byte	0x7
	.4byte	0xec
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xec
	.byte	0x4
	.string	"dst"
	.byte	0x1
	.byte	0x2a
	.byte	0x14
	.4byte	0xec
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.string	"src"
	.byte	0x1
	.byte	0x2a
	.byte	0x25
	.4byte	0xee
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.string	"n"
	.byte	0x1
	.byte	0x2a
	.byte	0x2e
	.4byte	0x7e
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x9
	.byte	0x8
	.byte	0x6
	.byte	0x8
	.4byte	0xf4
	.byte	0xa
	.byte	0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0x14
	.byte	0x7
	.4byte	0xec
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x15d
	.byte	0x4
	.string	"dst"
	.byte	0x1
	.byte	0x14
	.byte	0x15
	.4byte	0x15d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.string	"src"
	.byte	0x1
	.byte	0x14
	.byte	0x26
	.4byte	0x85
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x4
	.string	"n"
	.byte	0x1
	.byte	0x14
	.byte	0x2f
	.4byte	0x7e
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0xb
	.string	"s"
	.byte	0x1
	.byte	0x16
	.byte	0xe
	.4byte	0x85
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.string	"d"
	.byte	0x1
	.byte	0x17
	.byte	0x8
	.4byte	0x15d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x8b
	.byte	0xc
	.4byte	.LASF11
	.byte	0x1
	.byte	0x3
	.byte	0x7
	.4byte	0xec
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x4
	.string	"s"
	.byte	0x1
	.byte	0x3
	.byte	0x14
	.4byte	0xec
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.string	"val"
	.byte	0x1
	.byte	0x3
	.byte	0x1b
	.4byte	0x7e
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0xd
	.4byte	.LASF6
	.byte	0x1
	.byte	0x3
	.byte	0x2d
	.4byte	0x97
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xe
	.4byte	.LASF7
	.byte	0x1
	.byte	0x5
	.byte	0x8
	.4byte	0x15d
	.byte	0x2
	.byte	0x91
	.byte	0x68
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
	.byte	0x3
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
	.byte	0x49
	.byte	0x13
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x26
	.byte	0
	.byte	0x49
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
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
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
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
.LASF9:
	.string	"src/string.c"
.LASF3:
	.string	"strncmp"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"unsigned int"
.LASF8:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF7:
	.string	"start"
.LASF6:
	.string	"count"
.LASF11:
	.string	"memset"
.LASF5:
	.string	"memmove"
.LASF10:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF4:
	.string	"memcpy"
.LASF1:
	.string	"char"
	.ident	"GCC: () 9.3.0"
