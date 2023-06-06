	.file	"back_trace.c"
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
	.string	"pc: %p\n"
	.text
	.align	2
	.globl	back_trace
	.type	back_trace, @function
back_trace:
.LFB0:
	.file 1 "src/back_trace.c"
	.loc 1 11 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 16 40
	mv	a5,s0
	.loc 1 16 16
	sd	a5,-32(s0)
	.loc 1 18 41
	ld	a5,-32(s0)
	addi	a5,a5,-16
	.loc 1 18 9
	sd	a5,-24(s0)
	.loc 1 23 7
	j	.L2
.L3:
	.loc 1 25 25
	ld	a5,-24(s0)
	ld	a5,8(a5)
	.loc 1 25 17
	addi	a5,a5,-4
	sd	a5,-40(s0)
	.loc 1 26 3
	ld	a1,-40(s0)
	lla	a0,.LC0
	call	printf
	.loc 1 27 41
	ld	a5,-24(s0)
	ld	a5,0(a5)
	.loc 1 27 49
	addi	a5,a5,-16
	.loc 1 27 10
	sd	a5,-24(s0)
.L2:
	.loc 1 23 14
	ld	a5,-24(s0)
	ld	a4,0(a5)
	.loc 1 23 7
	li	a5,1025
	slli	a5,a5,21
	bgtu	a4,a5,.L3
	.loc 1 30 1
	nop
	nop
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
	.size	back_trace, .-back_trace
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xab
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF5
	.byte	0xc
	.4byte	.LASF6
	.4byte	.LASF7
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF9
	.byte	0x10
	.byte	0x1
	.byte	0x4
	.byte	0x8
	.4byte	0x5c
	.byte	0x4
	.4byte	.LASF0
	.byte	0x1
	.byte	0x6
	.byte	0x10
	.4byte	0x2d
	.byte	0
	.byte	0x4
	.4byte	.LASF1
	.byte	0x1
	.byte	0x7
	.byte	0x10
	.4byte	0x2d
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0xa
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xa8
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0xc
	.byte	0x10
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0xd
	.byte	0x16
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x10
	.byte	0x10
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x7
	.byte	0x8
	.4byte	0x34
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
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"sf_ptr"
.LASF9:
	.string	"stack_frame"
.LASF5:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF6:
	.string	"src/back_trace.c"
.LASF2:
	.string	"func_position"
.LASF1:
	.string	"sf_ra"
.LASF0:
	.string	"sf_fp"
.LASF4:
	.string	"cur_fp"
.LASF7:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF10:
	.string	"back_trace"
	.ident	"GCC: () 9.3.0"
