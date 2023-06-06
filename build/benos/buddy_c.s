	.file	"buddy.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	free_list_arr,88,8
	.globl	root_node
	.section	.sdata,"aw"
	.align	3
	.type	root_node, @object
	.size	root_node, 8
root_node:
	.dword	_free_mem_start
	.globl	nxt_unused_node
	.align	3
	.type	nxt_unused_node, @object
	.size	nxt_unused_node, 8
nxt_unused_node:
	.dword	_free_mem_start+1024
	.section	.rodata
	.align	3
.LC0:
	.string	"need %d pages\n"
	.text
	.align	2
	.globl	init_bin_tree_mem
	.type	init_bin_tree_mem, @function
init_bin_tree_mem:
.LFB0:
	.file 1 "src/buddy.c"
	.loc 1 11 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 12 6
	li	a5,128
	sw	a5,-20(s0)
	.loc 1 13 2
	lw	a5,-20(s0)
	mv	a1,a5
	lla	a0,.LC0
	call	printf
	.loc 1 15 11
	lla	a5,root_node
	ld	a5,0(a5)
	.loc 1 15 19
	li	a4,2
	sw	a4,0(a5)
	.loc 1 16 11
	lla	a5,root_node
	ld	a5,0(a5)
	.loc 1 16 19
	li	a4,11
	sw	a4,4(a5)
	.loc 1 17 22
	lla	a3,_free_mem_start
	.loc 1 17 11
	lla	a5,root_node
	ld	a5,0(a5)
	.loc 1 17 54
	li	a4,131072
	add	a4,a3,a4
	.loc 1 17 20
	sd	a4,8(a5)
	.loc 1 18 11
	lla	a5,root_node
	ld	a5,0(a5)
	.loc 1 18 18
	sd	zero,16(a5)
	.loc 1 19 11
	lla	a5,root_node
	ld	a5,0(a5)
	.loc 1 19 19
	sd	zero,24(a5)
	.loc 1 21 18
	lla	a5,root_node
	ld	a5,0(a5)
	ld	a5,8(a5)
	.loc 1 22 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	init_bin_tree_mem, .-init_bin_tree_mem
	.align	2
	.type	unused_buddy_mem, @function
unused_buddy_mem:
.LFB1:
	.loc 1 25 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 18
	lla	a5,nxt_unused_node
	ld	a5,0(a5)
	addi	a4,a5,1024
	lla	a5,nxt_unused_node
	sd	a4,0(a5)
	.loc 1 27 9
	lla	a5,nxt_unused_node
	ld	a5,0(a5)
	.loc 1 28 1
	mv	a0,a5
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	unused_buddy_mem, .-unused_buddy_mem
	.align	2
	.type	round_size, @function
round_size:
.LFB2:
	.loc 1 32 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 1 33 6
	sw	zero,-20(s0)
	.loc 1 34 4
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bne	a4,a5,.L8
	.loc 1 36 10
	lw	a5,-36(s0)
	j	.L7
.L9:
	.loc 1 40 6
	lw	a5,-36(s0)
	srliw	a5,a5,1
	sw	a5,-36(s0)
	.loc 1 41 6
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L8:
	.loc 1 38 7
	lw	a5,-36(s0)
	sext.w	a5,a5
	bnez	a5,.L9
	.loc 1 43 11
	lw	a5,-20(s0)
	li	a4,1
	sllw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 43 5
	sw	a5,-36(s0)
	.loc 1 44 9
	lw	a5,-36(s0)
.L7:
	.loc 1 45 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	round_size, .-round_size
	.section	.rodata
	.align	3
.LC1:
	.string	"-----------round to size %d\n"
	.align	3
.LC2:
	.string	"-----------total mem %d\n"
	.text
	.align	2
	.globl	buddy_alloc
	.type	buddy_alloc, @function
buddy_alloc:
.LFB3:
	.loc 1 48 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 1 49 16
	li	a5,-1
	sd	a5,-24(s0)
	.loc 1 51 4
	lw	a5,-36(s0)
	sext.w	a5,a5
	bnez	a5,.L11
	.loc 1 53 10
	li	a5,0
	j	.L12
.L11:
	.loc 1 56 7
	lw	a5,-36(s0)
	mv	a0,a5
	call	round_size
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 1 57 2
	lw	a5,-36(s0)
	mv	a1,a5
	lla	a0,.LC1
	call	printf
	.loc 1 59 33
	lla	a5,root_node
	ld	a5,0(a5)
	lw	a5,4(a5)
	.loc 1 59 6
	li	a4,1
	sllw	a5,a4,a5
	sw	a5,-28(s0)
	.loc 1 60 2
	lw	a5,-28(s0)
	mv	a1,a5
	lla	a0,.LC2
	call	printf
	.loc 1 63 4
	lw	a4,-28(s0)
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L13
	.loc 1 65 10
	li	a5,-1
	j	.L12
.L13:
	.loc 1 80 9
	ld	a5,-24(s0)
.L12:
	.loc 1 81 1
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
.LFE3:
	.size	buddy_alloc, .-buddy_alloc
.Letext0:
	.file 2 "src/buddy.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1fd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF17
	.byte	0xc
	.4byte	.LASF18
	.4byte	.LASF19
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF20
	.byte	0x7
	.byte	0x4
	.4byte	0x52
	.byte	0x2
	.byte	0x6
	.byte	0x6
	.4byte	0x52
	.byte	0x3
	.4byte	.LASF0
	.byte	0
	.byte	0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x5
	.4byte	.LASF21
	.byte	0x20
	.byte	0x2
	.byte	0xd
	.byte	0x8
	.4byte	0xa8
	.byte	0x6
	.4byte	.LASF3
	.byte	0x2
	.byte	0xe
	.byte	0xd
	.4byte	0x2d
	.byte	0
	.byte	0x6
	.4byte	.LASF4
	.byte	0x2
	.byte	0xf
	.byte	0x6
	.4byte	0xa8
	.byte	0x4
	.byte	0x6
	.4byte	.LASF5
	.byte	0x2
	.byte	0x10
	.byte	0x10
	.4byte	0xaf
	.byte	0x8
	.byte	0x6
	.4byte	.LASF6
	.byte	0x2
	.byte	0x11
	.byte	0x14
	.4byte	0xb6
	.byte	0x10
	.byte	0x6
	.4byte	.LASF7
	.byte	0x2
	.byte	0x12
	.byte	0x14
	.4byte	0xb6
	.byte	0x18
	.byte	0
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x8
	.byte	0x8
	.4byte	0x59
	.byte	0x9
	.4byte	0xaf
	.4byte	0xc7
	.byte	0xa
	.byte	0
	.byte	0xb
	.4byte	.LASF10
	.byte	0x1
	.byte	0x4
	.byte	0x16
	.4byte	0xbc
	.byte	0x9
	.4byte	0xb6
	.4byte	0xe3
	.byte	0xc
	.4byte	0xaf
	.byte	0xa
	.byte	0
	.byte	0xd
	.4byte	.LASF11
	.byte	0x1
	.byte	0x6
	.byte	0x13
	.4byte	0xd3
	.byte	0x9
	.byte	0x3
	.8byte	free_list_arr
	.byte	0xd
	.4byte	.LASF12
	.byte	0x1
	.byte	0x7
	.byte	0x13
	.4byte	0xb6
	.byte	0x9
	.byte	0x3
	.8byte	root_node
	.byte	0xd
	.4byte	.LASF13
	.byte	0x1
	.byte	0x8
	.byte	0x13
	.4byte	0xb6
	.byte	0x9
	.byte	0x3
	.8byte	nxt_unused_node
	.byte	0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0x2f
	.byte	0xf
	.4byte	0xaf
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x174
	.byte	0xf
	.string	"sz"
	.byte	0x1
	.byte	0x2f
	.byte	0x1f
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x31
	.byte	0x10
	.4byte	0xaf
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x10
	.4byte	.LASF15
	.byte	0x1
	.byte	0x3b
	.byte	0x6
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x11
	.4byte	.LASF23
	.byte	0x1
	.byte	0x1f
	.byte	0xc
	.4byte	0xa8
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x1b4
	.byte	0xf
	.string	"sz"
	.byte	0x1
	.byte	0x1f
	.byte	0x24
	.4byte	0x52
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x12
	.string	"cnt"
	.byte	0x1
	.byte	0x21
	.byte	0x6
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x13
	.4byte	.LASF24
	.byte	0x1
	.byte	0x18
	.byte	0x1a
	.4byte	0xb6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x14
	.4byte	.LASF25
	.byte	0x1
	.byte	0xa
	.byte	0xf
	.4byte	0xaf
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.4byte	.LASF16
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.4byte	0xa8
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
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x3
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
	.byte	0x2e
	.byte	0x1
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x2e
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
	.byte	0x14
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
	.string	"unsigned int"
.LASF5:
	.string	"staddr"
.LASF6:
	.string	"left"
.LASF4:
	.string	"order"
.LASF7:
	.string	"right"
.LASF9:
	.string	"long unsigned int"
.LASF22:
	.string	"buddy_alloc"
.LASF17:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF12:
	.string	"root_node"
.LASF25:
	.string	"init_bin_tree_mem"
.LASF21:
	.string	"buddy_blk"
.LASF16:
	.string	"page_num"
.LASF19:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF13:
	.string	"nxt_unused_node"
.LASF0:
	.string	"_SPLIT"
.LASF1:
	.string	"_USED"
.LASF24:
	.string	"unused_buddy_mem"
.LASF23:
	.string	"round_size"
.LASF18:
	.string	"src/buddy.c"
.LASF3:
	.string	"state"
.LASF20:
	.string	"State"
.LASF10:
	.string	"_free_mem_start"
.LASF14:
	.string	"st_addr"
.LASF2:
	.string	"_FREE"
.LASF15:
	.string	"total_mem"
.LASF11:
	.string	"free_list_arr"
	.ident	"GCC: () 9.3.0"
