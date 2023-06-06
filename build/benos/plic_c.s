	.file	"plic.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	plicinit
	.type	plicinit, @function
plicinit:
.LFB28:
	.file 1 "src/plic.c"
	.loc 1 7 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 9 3
	li	a5,201326592
	addi	a5,a5,40
	.loc 1 9 40
	li	a4,1
	sw	a4,0(a5)
	.loc 1 10 3
	li	a5,201326592
	addi	a5,a5,4
	.loc 1 10 39
	li	a4,1
	sw	a4,0(a5)
	.loc 1 11 1
	nop
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	plicinit, .-plicinit
	.align	2
	.globl	plicinithart
	.type	plicinithart, @function
plicinithart:
.LFB29:
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 16 7
	sw	zero,-20(s0)
	.loc 1 20 49
	lw	a5,-20(s0)
	slliw	a5,a5,8
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 20 41
	li	a5,201334784
	addi	a5,a5,128
	add	a5,a4,a5
	.loc 1 20 4
	mv	a4,a5
	.loc 1 20 57
	li	a5,1026
	sw	a5,0(a4)
	.loc 1 23 51
	lw	a5,-20(s0)
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 23 43
	li	a5,203427840
	add	a5,a4,a5
	.loc 1 23 60
	sw	zero,0(a5)
	.loc 1 24 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE29:
	.size	plicinithart, .-plicinithart
	.align	2
	.globl	plic_claim
	.type	plic_claim, @function
plic_claim:
.LFB30:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 30 7
	sw	zero,-20(s0)
	.loc 1 31 61
	lw	a5,-20(s0)
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 31 53
	li	a5,203427840
	addi	a5,a5,4
	add	a5,a4,a5
	.loc 1 31 13
	lw	a5,0(a5)
	.loc 1 31 7
	sw	a5,-24(s0)
	.loc 1 32 10
	lw	a5,-24(s0)
	.loc 1 33 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE30:
	.size	plic_claim, .-plic_claim
	.align	2
	.globl	plic_complete
	.type	plic_complete, @function
plic_complete:
.LFB31:
	.loc 1 38 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 1 39 7
	sw	zero,-20(s0)
	.loc 1 40 51
	lw	a5,-20(s0)
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 40 43
	li	a5,203427840
	addi	a5,a5,4
	add	a5,a4,a5
	.loc 1 40 4
	mv	a4,a5
	.loc 1 40 60
	lw	a5,-36(s0)
	sw	a5,0(a4)
	.loc 1 41 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE31:
	.size	plic_complete, .-plic_complete
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xfe
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF4
	.byte	0xc
	.4byte	.LASF5
	.4byte	.LASF6
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x25
	.byte	0x1
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x71
	.byte	0x4
	.string	"irq"
	.byte	0x1
	.byte	0x25
	.byte	0x13
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x5
	.4byte	.LASF1
	.byte	0x1
	.byte	0x27
	.byte	0x7
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	.LASF7
	.byte	0x1
	.byte	0x1c
	.byte	0x1
	.4byte	0x71
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0xb9
	.byte	0x5
	.4byte	.LASF1
	.byte	0x1
	.byte	0x1e
	.byte	0x7
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"irq"
	.byte	0x1
	.byte	0x1f
	.byte	0x7
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0xe
	.byte	0x1
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0xe7
	.byte	0x5
	.4byte	.LASF1
	.byte	0x1
	.byte	0x10
	.byte	0x7
	.4byte	0x71
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x9
	.4byte	.LASF8
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
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
	.byte	0x6
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
	.byte	0x8
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
	.byte	0x9
	.byte	0x2e
	.byte	0
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
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"plic_complete"
.LASF8:
	.string	"plicinit"
.LASF1:
	.string	"hart"
.LASF4:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF3:
	.string	"plicinithart"
.LASF6:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF5:
	.string	"src/plic.c"
.LASF7:
	.string	"plic_claim"
	.ident	"GCC: () 9.3.0"
