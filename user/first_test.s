	.file	"first_test.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	test_str
	.data
	.align	3
	.type	test_str, @object
	.size	test_str, 21
test_str:
	.string	"This is a load test\n"
	.globl	test1
	.section	.sdata,"aw"
	.align	3
	.type	test1, @object
	.size	test1, 5
test1:
	.string	"QWER"
	.globl	test2
	.align	3
	.type	test2, @object
	.size	test2, 5
test2:
	.string	"ASDF"
	.globl	test3
	.align	3
	.type	test3, @object
	.size	test3, 5
test3:
	.string	"ZXCV"
	.globl	test4
	.align	3
	.type	test4, @object
	.size	test4, 5
test4:
	.string	"!@#$"
	.text
	.align	2
	.globl	delay
	.type	delay, @function
delay:
.LFB0:
	.file 1 "user/first_test.c"
	.loc 1 9 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
.LBB2:
	.loc 1 10 10
	sw	zero,-20(s0)
	.loc 1 10 2
	j	.L2
.L5:
.LBB3:
	.loc 1 12 11
	sw	zero,-24(s0)
	.loc 1 12 3
	j	.L3
.L4:
	.loc 1 12 25 discriminator 3
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L3:
	.loc 1 12 3 discriminator 1
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,999
	ble	a4,a5,.L4
.LBE3:
	.loc 1 10 24 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 10 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,999
	ble	a4,a5,.L5
.LBE2:
	.loc 1 17 1
	nop
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	delay, .-delay
	.section	.rodata
	.align	3
.LC0:
	.string	"/test_rd.txt"
	.align	3
.LC2:
	.string	"QWER"
	.align	3
.LC3:
	.string	"ASDF"
	.align	3
.LC4:
	.string	"ZXCV"
	.align	3
.LC5:
	.string	"!@#$"
	.align	3
.LC1:
	.string	"WRITE_TEST_STR"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 20 1
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,96
	.cfi_def_cfa 8, 0
	.loc 1 21 16
	sd	zero,-32(s0)
.LBB4:
	.loc 1 22 10
	sw	zero,-20(s0)
	.loc 1 22 2
	j	.L7
.L8:
.LBB5:
	.loc 1 24 17 discriminator 3
	lla	a4,test_str
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 24 3 discriminator 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
.LBE5:
	.loc 1 22 22 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L7:
	.loc 1 22 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,19
	ble	a4,a5,.L8
.LBE4:
	.loc 1 27 16
	li	a1,0
	lla	a0,.LC0
	call	open
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 1 28 2
	li	a0,95
	call	print
	.loc 1 29 2
	lw	a5,-36(s0)
	addiw	a5,a5,48
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 30 2
	li	a0,95
	call	print
	.loc 1 32 7
	sd	zero,-48(s0)
	sh	zero,-40(s0)
	.loc 1 33 7
	lla	a5,.LC1
	ld	a4,0(a5)
	sd	a4,-64(s0)
	lw	a4,8(a5)
	sw	a4,-56(s0)
	lhu	a4,12(a5)
	sh	a4,-52(s0)
	lbu	a5,14(a5)
	sb	a5,-50(s0)
	.loc 1 34 2
	addi	a4,s0,-48
	lw	a5,-36(s0)
	li	a2,5
	mv	a1,a4
	mv	a0,a5
	call	read
	.loc 1 35 2
	addi	a4,s0,-64
	lw	a5,-36(s0)
	li	a2,5
	mv	a1,a4
	mv	a0,a5
	call	write
.LBB6:
	.loc 1 36 10
	sw	zero,-24(s0)
	.loc 1 36 2
	j	.L9
.L10:
	.loc 1 38 15 discriminator 3
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-32(a5)
	.loc 1 38 3 discriminator 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 36 21 discriminator 3
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L9:
	.loc 1 36 2 discriminator 1
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,4
	ble	a4,a5,.L10
.LBE6:
	.loc 1 41 7
	sd	zero,-80(s0)
	sh	zero,-72(s0)
	.loc 1 42 6
	sd	zero,-88(s0)
	.loc 1 43 2
	addi	a5,s0,-88
	mv	a0,a5
	call	pipe
	.loc 1 45 8
	call	fork
	mv	a5,a0
	.loc 1 45 6
	sd	a5,-32(s0)
	.loc 1 47 4
	ld	a5,-32(s0)
	beqz	a5,.L11
	.loc 1 49 3
	li	a0,112
	call	print
	.loc 1 50 3
	li	a0,10
	call	print
	.loc 1 51 3
	lw	a5,-88(s0)
	li	a2,4
	lla	a1,.LC2
	mv	a0,a5
	call	write
	.loc 1 52 3
	lw	a5,-88(s0)
	li	a2,4
	lla	a1,.LC3
	mv	a0,a5
	call	write
	.loc 1 53 3
	lw	a5,-88(s0)
	li	a2,4
	lla	a1,.LC4
	mv	a0,a5
	call	write
	.loc 1 54 3
	lw	a5,-88(s0)
	li	a2,4
	lla	a1,.LC5
	mv	a0,a5
	call	write
	.loc 1 55 3
	li	a0,111
	call	print
	.loc 1 56 3
	li	a0,118
	call	print
	.loc 1 57 3
	li	a0,101
	call	print
	.loc 1 58 3
	li	a0,114
	call	print
	.loc 1 59 3
	li	a0,10
	call	print
	j	.L12
.L11:
.LBB7:
	.loc 1 63 3
	li	a0,99
	call	print
	.loc 1 64 3
	li	a0,10
	call	print
	.loc 1 65 3
	lw	a5,-84(s0)
	addi	a4,s0,-80
	li	a2,4
	mv	a1,a4
	mv	a0,a5
	call	read
	.loc 1 66 3
	li	a0,49
	call	print
	.loc 1 67 12
	lbu	a5,-80(s0)
	.loc 1 67 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 68 12
	lbu	a5,-79(s0)
	.loc 1 68 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 69 12
	lbu	a5,-78(s0)
	.loc 1 69 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 70 12
	lbu	a5,-77(s0)
	.loc 1 70 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 71 3
	li	a0,10
	call	print
	.loc 1 72 3
	lw	a5,-84(s0)
	addi	a4,s0,-80
	li	a2,4
	mv	a1,a4
	mv	a0,a5
	call	read
	.loc 1 73 3
	li	a0,50
	call	print
	.loc 1 74 12
	lbu	a5,-80(s0)
	.loc 1 74 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 75 12
	lbu	a5,-79(s0)
	.loc 1 75 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 76 12
	lbu	a5,-78(s0)
	.loc 1 76 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 77 12
	lbu	a5,-77(s0)
	.loc 1 77 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 78 3
	li	a0,10
	call	print
	.loc 1 79 3
	lw	a5,-84(s0)
	addi	a4,s0,-80
	li	a2,4
	mv	a1,a4
	mv	a0,a5
	call	read
	.loc 1 80 3
	li	a0,51
	call	print
	.loc 1 81 12
	lbu	a5,-80(s0)
	.loc 1 81 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 82 12
	lbu	a5,-79(s0)
	.loc 1 82 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 83 12
	lbu	a5,-78(s0)
	.loc 1 83 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 84 12
	lbu	a5,-77(s0)
	.loc 1 84 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 85 3
	li	a0,10
	call	print
	.loc 1 86 3
	li	a0,50
	call	sleep
	.loc 1 87 3
	lw	a5,-84(s0)
	addi	a4,s0,-80
	li	a2,4
	mv	a1,a4
	mv	a0,a5
	call	read
	.loc 1 88 3
	li	a0,52
	call	print
	.loc 1 89 12
	lbu	a5,-80(s0)
	.loc 1 89 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 90 12
	lbu	a5,-79(s0)
	.loc 1 90 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 91 12
	lbu	a5,-78(s0)
	.loc 1 91 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 92 12
	lbu	a5,-77(s0)
	.loc 1 92 3
	sext.w	a5,a5
	mv	a0,a5
	call	print
	.loc 1 93 3
	li	a0,10
	call	print
	.loc 1 94 3
	li	a0,111
	call	print
	.loc 1 95 3
	li	a0,118
	call	print
	.loc 1 96 3
	li	a0,101
	call	print
	.loc 1 97 3
	li	a0,114
	call	print
	.loc 1 98 3
	li	a0,10
	call	print
.L12:
.LBE7:
	.loc 1 101 4
	ld	a5,-32(s0)
	beqz	a5,.L16
	.loc 1 104 3
	li	a0,97
	call	print
.L16:
	.loc 1 109 5
	ld	a5,-32(s0)
	beqz	a5,.L14
	.loc 1 111 4
	li	a0,49
	call	print
	.loc 1 112 4
	li	a5,8192
	addi	a0,a5,1808
	call	delay
	j	.L16
.L14:
	.loc 1 116 4
	li	a0,50
	call	print
	.loc 1 117 4
	li	a5,8192
	addi	a0,a5,1808
	call	delay
	.loc 1 109 5
	j	.L16
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2d5
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
	.4byte	0x44
	.4byte	0x3d
	.byte	0x3
	.4byte	0x3d
	.byte	0x14
	.byte	0
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x5
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x6
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	test_str
	.byte	0x2
	.4byte	0x44
	.4byte	0x71
	.byte	0x3
	.4byte	0x3d
	.byte	0x4
	.byte	0
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x3
	.byte	0x6
	.4byte	0x61
	.byte	0x9
	.byte	0x3
	.8byte	test1
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.4byte	0x61
	.byte	0x9
	.byte	0x3
	.8byte	test2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x5
	.byte	0x6
	.4byte	0x61
	.byte	0x9
	.byte	0x3
	.8byte	test3
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.4byte	0x61
	.byte	0x9
	.byte	0x3
	.8byte	test4
	.byte	0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0x13
	.byte	0x5
	.4byte	0x239
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x239
	.byte	0x7
	.string	"pid"
	.byte	0x1
	.byte	0x15
	.byte	0x10
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0x1b
	.byte	0x6
	.4byte	0x239
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x9
	.4byte	.LASF8
	.byte	0x1
	.byte	0x1b
	.byte	0x10
	.4byte	0x239
	.4byte	0x11b
	.byte	0xa
	.byte	0
	.byte	0x9
	.4byte	.LASF9
	.byte	0x1
	.byte	0x18
	.byte	0x3
	.4byte	0x239
	.4byte	0x12d
	.byte	0xa
	.byte	0
	.byte	0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x20
	.byte	0x7
	.4byte	0x240
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x21
	.byte	0x7
	.4byte	0x250
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x22
	.byte	0x2
	.4byte	0x239
	.4byte	0x15d
	.byte	0xa
	.byte	0
	.byte	0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x23
	.byte	0x2
	.4byte	0x239
	.4byte	0x16f
	.byte	0xa
	.byte	0
	.byte	0x7
	.string	"buf"
	.byte	0x1
	.byte	0x29
	.byte	0x7
	.4byte	0x240
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x7
	.string	"fd"
	.byte	0x1
	.byte	0x2a
	.byte	0x6
	.4byte	0x260
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x2b
	.byte	0x2
	.4byte	0x239
	.4byte	0x1a0
	.byte	0xa
	.byte	0
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x2d
	.byte	0x8
	.4byte	0x239
	.4byte	0x1b2
	.byte	0xa
	.byte	0
	.byte	0xb
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x1f5
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x16
	.byte	0xa
	.4byte	0x239
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xc
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0xd
	.4byte	.LASF9
	.byte	0x1
	.byte	0x18
	.byte	0x3
	.4byte	0x239
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x218
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x24
	.byte	0xa
	.4byte	0x239
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xc
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x56
	.byte	0x3
	.4byte	0x239
	.byte	0xa
	.byte	0
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	0x44
	.4byte	0x250
	.byte	0x3
	.4byte	0x3d
	.byte	0x9
	.byte	0
	.byte	0x2
	.4byte	0x44
	.4byte	0x260
	.byte	0x3
	.4byte	0x3d
	.byte	0xe
	.byte	0
	.byte	0x2
	.4byte	0x239
	.4byte	0x270
	.byte	0x3
	.4byte	0x3d
	.byte	0x1
	.byte	0
	.byte	0xf
	.4byte	.LASF21
	.byte	0x1
	.byte	0x8
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.string	"val"
	.byte	0x1
	.byte	0x8
	.byte	0x10
	.4byte	0x239
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xc
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0xa
	.byte	0xa
	.4byte	0x239
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xc
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x7
	.string	"i"
	.byte	0x1
	.byte	0xc
	.byte	0xb
	.4byte	0x239
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
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
	.byte	0x6
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0
	.byte	0
	.byte	0x10
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
	.string	"open"
.LASF16:
	.string	"sleep"
.LASF20:
	.string	"main"
.LASF0:
	.string	"long unsigned int"
.LASF3:
	.string	"test1"
.LASF17:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF5:
	.string	"test3"
.LASF14:
	.string	"pipe"
.LASF13:
	.string	"write"
.LASF9:
	.string	"print"
.LASF1:
	.string	"char"
.LASF7:
	.string	"open_fd"
.LASF2:
	.string	"test_str"
.LASF18:
	.string	"user/first_test.c"
.LASF4:
	.string	"test2"
.LASF19:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF6:
	.string	"test4"
.LASF11:
	.string	"wr_buf"
.LASF15:
	.string	"fork"
.LASF21:
	.string	"delay"
.LASF10:
	.string	"rd_buf"
.LASF12:
	.string	"read"
	.ident	"GCC: () 9.3.0"
