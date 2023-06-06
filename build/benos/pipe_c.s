	.file	"pipe.c"
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
	.string	"pipe fd alloc failed!\n"
	.align	3
.LC1:
	.string	"pipe kalloc failed!\n"
	.text
	.align	2
	.globl	new_pipe
	.type	new_pipe, @function
new_pipe:
.LFB0:
	.file 1 "src/pipe.c"
	.loc 1 6 1
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
	sd	a1,-48(s0)
	.loc 1 7 15
	sd	zero,-24(s0)
	.loc 1 9 8
	call	file_alloc
	mv	a4,a0
	.loc 1 9 6
	ld	a5,-40(s0)
	sd	a4,0(a5)
	.loc 1 10 8
	call	file_alloc
	mv	a4,a0
	.loc 1 10 6
	ld	a5,-48(s0)
	sd	a4,0(a5)
	.loc 1 11 4
	ld	a5,-40(s0)
	beqz	a5,.L2
	.loc 1 11 9 discriminator 1
	ld	a5,-48(s0)
	bnez	a5,.L3
.L2:
	.loc 1 13 3
	lla	a0,.LC0
	call	printf
	.loc 1 14 10
	li	a5,-1
	j	.L4
.L3:
	.loc 1 17 13
	call	kalloc
	sd	a0,-24(s0)
	.loc 1 18 2
	li	a2,4096
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	.loc 1 19 4
	ld	a5,-24(s0)
	bnez	a5,.L5
	.loc 1 21 3
	lla	a0,.LC1
	call	printf
	.loc 1 22 10
	li	a5,-1
	j	.L4
.L5:
	.loc 1 25 15
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,112(a5)
	.loc 1 26 15
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,116(a5)
	.loc 1 27 16
	ld	a5,-24(s0)
	sw	zero,104(a5)
	.loc 1 28 16
	ld	a5,-24(s0)
	sw	zero,108(a5)
	.loc 1 30 3
	ld	a5,-40(s0)
	ld	a5,0(a5)
	.loc 1 30 14
	li	a4,1
	sw	a4,0(a5)
	.loc 1 31 3
	ld	a5,-40(s0)
	ld	a5,0(a5)
	.loc 1 31 18
	li	a4,1
	sb	a4,8(a5)
	.loc 1 32 3
	ld	a5,-40(s0)
	ld	a5,0(a5)
	.loc 1 32 18
	sb	zero,9(a5)
	.loc 1 33 3
	ld	a5,-40(s0)
	ld	a5,0(a5)
	.loc 1 33 14
	ld	a4,-24(s0)
	sd	a4,24(a5)
	.loc 1 34 3
	ld	a5,-48(s0)
	ld	a5,0(a5)
	.loc 1 34 14
	li	a4,1
	sw	a4,0(a5)
	.loc 1 35 3
	ld	a5,-48(s0)
	ld	a5,0(a5)
	.loc 1 35 18
	sb	zero,8(a5)
	.loc 1 36 3
	ld	a5,-48(s0)
	ld	a5,0(a5)
	.loc 1 36 18
	li	a4,1
	sb	a4,9(a5)
	.loc 1 37 3
	ld	a5,-48(s0)
	ld	a5,0(a5)
	.loc 1 37 14
	ld	a4,-24(s0)
	sd	a4,24(a5)
	.loc 1 39 9
	li	a5,0
.L4:
	.loc 1 40 1
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
	.size	new_pipe, .-new_pipe
	.align	2
	.globl	pipe_wr
	.type	pipe_wr, @function
pipe_wr:
.LFB1:
	.loc 1 43 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	mv	a5,a2
	sw	a5,-52(s0)
	.loc 1 44 6
	sw	zero,-20(s0)
	.loc 1 45 2
	ld	a5,-40(s0)
	mv	a0,a5
	call	acquire
.L9:
	.loc 1 48 10
	ld	a5,-40(s0)
	lw	a5,108(a5)
	.loc 1 48 5
	bnez	a5,.L7
	.loc 1 51 27
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 1 51 4
	ld	a4,8(a5)
	.loc 1 51 49
	ld	a5,-40(s0)
	addi	a5,a5,4
	.loc 1 51 4
	ld	a2,-48(s0)
	lw	a3,-52(s0)
	mv	a1,a5
	mv	a0,a4
	call	copy_from_user
	.loc 1 52 14
	ld	a5,-40(s0)
	lw	a4,-52(s0)
	sw	a4,108(a5)
	.loc 1 54 11
	ld	a5,-40(s0)
	addi	a5,a5,104
	.loc 1 54 4
	mv	a0,a5
	call	wakeup
	.loc 1 55 4
	ld	a5,-40(s0)
	mv	a0,a5
	call	release
	.loc 1 56 4
	nop
	.loc 1 66 4
	lw	a5,-20(s0)
	sext.w	a5,a5
	beqz	a5,.L10
	j	.L12
.L7:
	.loc 1 61 10
	ld	a5,-40(s0)
	addi	a5,a5,108
	.loc 1 61 4
	ld	a4,-40(s0)
	mv	a1,a4
	mv	a0,a5
	call	sleep
	.loc 1 62 9
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 48 5
	j	.L9
.L12:
	.loc 1 68 3
	ld	a5,-40(s0)
	mv	a0,a5
	call	release
.L10:
	.loc 1 71 9
	li	a5,0
	.loc 1 72 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	pipe_wr, .-pipe_wr
	.align	2
	.globl	pipe_rd
	.type	pipe_rd, @function
pipe_rd:
.LFB2:
	.loc 1 75 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	mv	a5,a2
	sw	a5,-52(s0)
	.loc 1 76 6
	sw	zero,-20(s0)
	.loc 1 77 2
	ld	a5,-40(s0)
	mv	a0,a5
	call	acquire
.L16:
	.loc 1 81 10
	ld	a5,-40(s0)
	lw	a5,108(a5)
	.loc 1 81 5
	beqz	a5,.L14
	.loc 1 84 25
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 1 84 4
	ld	a4,8(a5)
	ld	a1,-48(s0)
	.loc 1 84 70
	ld	a5,-40(s0)
	addi	a5,a5,4
	.loc 1 84 4
	lw	a3,-52(s0)
	mv	a2,a5
	mv	a0,a4
	call	copy_to_user
	.loc 1 85 14
	ld	a5,-40(s0)
	sw	zero,108(a5)
	.loc 1 87 11
	ld	a5,-40(s0)
	addi	a5,a5,108
	.loc 1 87 4
	mv	a0,a5
	call	wakeup
	.loc 1 88 4
	ld	a5,-40(s0)
	mv	a0,a5
	call	release
	.loc 1 89 4
	nop
	.loc 1 99 4
	lw	a5,-20(s0)
	sext.w	a5,a5
	beqz	a5,.L17
	j	.L19
.L14:
	.loc 1 94 10
	ld	a5,-40(s0)
	addi	a5,a5,104
	.loc 1 94 4
	ld	a4,-40(s0)
	mv	a1,a4
	mv	a0,a5
	call	sleep
	.loc 1 95 9
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 81 5
	j	.L16
.L19:
	.loc 1 101 3
	ld	a5,-40(s0)
	mv	a0,a5
	call	release
.L17:
	.loc 1 104 9
	li	a5,0
	.loc 1 105 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	pipe_rd, .-pipe_rd
.Letext0:
	.file 2 "src/fs.h"
	.file 3 "src/locks.h"
	.file 4 "src/proc.h"
	.file 5 "src/fd.h"
	.file 6 "src/pipe.h"
	.file 7 "include/def.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x6c6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF52
	.byte	0xc
	.4byte	.LASF53
	.4byte	.LASF54
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF9
	.byte	0x40
	.byte	0x2
	.byte	0x1b
	.byte	0x8
	.4byte	0x90
	.byte	0x4
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1d
	.byte	0x8
	.4byte	0x90
	.byte	0
	.byte	0x4
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1e
	.byte	0x8
	.4byte	0x90
	.byte	0x2
	.byte	0x4
	.4byte	.LASF2
	.byte	0x2
	.byte	0x1f
	.byte	0x8
	.4byte	0x90
	.byte	0x4
	.byte	0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x20
	.byte	0x8
	.4byte	0x90
	.byte	0x6
	.byte	0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x21
	.byte	0xf
	.4byte	0x2d
	.byte	0x8
	.byte	0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x22
	.byte	0xf
	.4byte	0x97
	.byte	0xc
	.byte	0
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x5
	.4byte	0x2d
	.4byte	0xa7
	.byte	0x6
	.4byte	0xa7
	.byte	0xc
	.byte	0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF10
	.byte	0x50
	.byte	0x2
	.byte	0x26
	.byte	0x8
	.4byte	0xfd
	.byte	0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x28
	.byte	0xf
	.4byte	0x2d
	.byte	0
	.byte	0x4
	.4byte	.LASF12
	.byte	0x2
	.byte	0x29
	.byte	0xf
	.4byte	0x2d
	.byte	0x4
	.byte	0x7
	.string	"ref"
	.byte	0x2
	.byte	0x2a
	.byte	0x6
	.4byte	0xfd
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.byte	0x2
	.byte	0x2b
	.byte	0x6
	.4byte	0xfd
	.byte	0xc
	.byte	0x4
	.4byte	.LASF14
	.byte	0x2
	.byte	0x2d
	.byte	0x10
	.4byte	0x34
	.byte	0x10
	.byte	0
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF15
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF17
	.byte	0x9
	.4byte	.LASF55
	.byte	0x7
	.byte	0x1a
	.byte	0x18
	.4byte	0x125
	.byte	0xa
	.byte	0x8
	.4byte	0xa7
	.byte	0x3
	.4byte	.LASF18
	.byte	0x4
	.byte	0x3
	.byte	0x4
	.byte	0x8
	.4byte	0x146
	.byte	0x4
	.4byte	.LASF19
	.byte	0x3
	.byte	0x6
	.byte	0xf
	.4byte	0x2d
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LASF20
	.2byte	0x120
	.byte	0x4
	.byte	0x11
	.byte	0x8
	.4byte	0x310
	.byte	0x4
	.4byte	.LASF21
	.byte	0x4
	.byte	0x12
	.byte	0x1b
	.4byte	0xa7
	.byte	0
	.byte	0x4
	.4byte	.LASF22
	.byte	0x4
	.byte	0x13
	.byte	0x1b
	.4byte	0xa7
	.byte	0x8
	.byte	0x4
	.4byte	.LASF23
	.byte	0x4
	.byte	0x14
	.byte	0x1b
	.4byte	0xa7
	.byte	0x10
	.byte	0x7
	.string	"epc"
	.byte	0x4
	.byte	0x15
	.byte	0x1b
	.4byte	0xa7
	.byte	0x18
	.byte	0x4
	.4byte	.LASF24
	.byte	0x4
	.byte	0x16
	.byte	0x1b
	.4byte	0xa7
	.byte	0x20
	.byte	0x7
	.string	"ra"
	.byte	0x4
	.byte	0x17
	.byte	0x1b
	.4byte	0xa7
	.byte	0x28
	.byte	0x7
	.string	"sp"
	.byte	0x4
	.byte	0x18
	.byte	0x1b
	.4byte	0xa7
	.byte	0x30
	.byte	0x7
	.string	"gp"
	.byte	0x4
	.byte	0x19
	.byte	0x1b
	.4byte	0xa7
	.byte	0x38
	.byte	0x7
	.string	"tp"
	.byte	0x4
	.byte	0x1a
	.byte	0x1b
	.4byte	0xa7
	.byte	0x40
	.byte	0x7
	.string	"t0"
	.byte	0x4
	.byte	0x1b
	.byte	0x1b
	.4byte	0xa7
	.byte	0x48
	.byte	0x7
	.string	"t1"
	.byte	0x4
	.byte	0x1c
	.byte	0x1b
	.4byte	0xa7
	.byte	0x50
	.byte	0x7
	.string	"t2"
	.byte	0x4
	.byte	0x1d
	.byte	0x1b
	.4byte	0xa7
	.byte	0x58
	.byte	0x7
	.string	"s0"
	.byte	0x4
	.byte	0x1e
	.byte	0x1b
	.4byte	0xa7
	.byte	0x60
	.byte	0x7
	.string	"s1"
	.byte	0x4
	.byte	0x1f
	.byte	0x1b
	.4byte	0xa7
	.byte	0x68
	.byte	0x7
	.string	"a0"
	.byte	0x4
	.byte	0x20
	.byte	0x1b
	.4byte	0xa7
	.byte	0x70
	.byte	0x7
	.string	"a1"
	.byte	0x4
	.byte	0x21
	.byte	0x1b
	.4byte	0xa7
	.byte	0x78
	.byte	0x7
	.string	"a2"
	.byte	0x4
	.byte	0x22
	.byte	0x1b
	.4byte	0xa7
	.byte	0x80
	.byte	0x7
	.string	"a3"
	.byte	0x4
	.byte	0x23
	.byte	0x1b
	.4byte	0xa7
	.byte	0x88
	.byte	0x7
	.string	"a4"
	.byte	0x4
	.byte	0x24
	.byte	0x1b
	.4byte	0xa7
	.byte	0x90
	.byte	0x7
	.string	"a5"
	.byte	0x4
	.byte	0x25
	.byte	0x1b
	.4byte	0xa7
	.byte	0x98
	.byte	0x7
	.string	"a6"
	.byte	0x4
	.byte	0x26
	.byte	0x1b
	.4byte	0xa7
	.byte	0xa0
	.byte	0x7
	.string	"a7"
	.byte	0x4
	.byte	0x27
	.byte	0x1b
	.4byte	0xa7
	.byte	0xa8
	.byte	0x7
	.string	"s2"
	.byte	0x4
	.byte	0x28
	.byte	0x1b
	.4byte	0xa7
	.byte	0xb0
	.byte	0x7
	.string	"s3"
	.byte	0x4
	.byte	0x29
	.byte	0x1b
	.4byte	0xa7
	.byte	0xb8
	.byte	0x7
	.string	"s4"
	.byte	0x4
	.byte	0x2a
	.byte	0x1b
	.4byte	0xa7
	.byte	0xc0
	.byte	0x7
	.string	"s5"
	.byte	0x4
	.byte	0x2b
	.byte	0x1b
	.4byte	0xa7
	.byte	0xc8
	.byte	0x7
	.string	"s6"
	.byte	0x4
	.byte	0x2c
	.byte	0x1b
	.4byte	0xa7
	.byte	0xd0
	.byte	0x7
	.string	"s7"
	.byte	0x4
	.byte	0x2d
	.byte	0x1b
	.4byte	0xa7
	.byte	0xd8
	.byte	0x7
	.string	"s8"
	.byte	0x4
	.byte	0x2e
	.byte	0x1b
	.4byte	0xa7
	.byte	0xe0
	.byte	0x7
	.string	"s9"
	.byte	0x4
	.byte	0x2f
	.byte	0x1b
	.4byte	0xa7
	.byte	0xe8
	.byte	0x7
	.string	"s10"
	.byte	0x4
	.byte	0x30
	.byte	0x1b
	.4byte	0xa7
	.byte	0xf0
	.byte	0x7
	.string	"s11"
	.byte	0x4
	.byte	0x31
	.byte	0x1b
	.4byte	0xa7
	.byte	0xf8
	.byte	0xc
	.string	"t3"
	.byte	0x4
	.byte	0x32
	.byte	0x1b
	.4byte	0xa7
	.2byte	0x100
	.byte	0xc
	.string	"t4"
	.byte	0x4
	.byte	0x33
	.byte	0x1b
	.4byte	0xa7
	.2byte	0x108
	.byte	0xc
	.string	"t5"
	.byte	0x4
	.byte	0x34
	.byte	0x1b
	.4byte	0xa7
	.2byte	0x110
	.byte	0xc
	.string	"t6"
	.byte	0x4
	.byte	0x35
	.byte	0x1b
	.4byte	0xa7
	.2byte	0x118
	.byte	0
	.byte	0x3
	.4byte	.LASF25
	.byte	0x68
	.byte	0x4
	.byte	0x38
	.byte	0x8
	.4byte	0x3bc
	.byte	0x7
	.string	"ra"
	.byte	0x4
	.byte	0x3a
	.byte	0x10
	.4byte	0xa7
	.byte	0
	.byte	0x7
	.string	"sp"
	.byte	0x4
	.byte	0x3b
	.byte	0x10
	.4byte	0xa7
	.byte	0x8
	.byte	0x7
	.string	"s0"
	.byte	0x4
	.byte	0x3c
	.byte	0x10
	.4byte	0xa7
	.byte	0x10
	.byte	0x7
	.string	"s1"
	.byte	0x4
	.byte	0x3d
	.byte	0x10
	.4byte	0xa7
	.byte	0x18
	.byte	0x7
	.string	"s2"
	.byte	0x4
	.byte	0x3e
	.byte	0x10
	.4byte	0xa7
	.byte	0x20
	.byte	0x7
	.string	"s3"
	.byte	0x4
	.byte	0x3f
	.byte	0x10
	.4byte	0xa7
	.byte	0x28
	.byte	0x7
	.string	"s4"
	.byte	0x4
	.byte	0x40
	.byte	0x10
	.4byte	0xa7
	.byte	0x30
	.byte	0x7
	.string	"s5"
	.byte	0x4
	.byte	0x41
	.byte	0x10
	.4byte	0xa7
	.byte	0x38
	.byte	0x7
	.string	"s7"
	.byte	0x4
	.byte	0x42
	.byte	0x10
	.4byte	0xa7
	.byte	0x40
	.byte	0x7
	.string	"s8"
	.byte	0x4
	.byte	0x43
	.byte	0x10
	.4byte	0xa7
	.byte	0x48
	.byte	0x7
	.string	"s9"
	.byte	0x4
	.byte	0x44
	.byte	0x10
	.4byte	0xa7
	.byte	0x50
	.byte	0x7
	.string	"s10"
	.byte	0x4
	.byte	0x45
	.byte	0x10
	.4byte	0xa7
	.byte	0x58
	.byte	0x7
	.string	"s11"
	.byte	0x4
	.byte	0x46
	.byte	0x10
	.4byte	0xa7
	.byte	0x60
	.byte	0
	.byte	0xb
	.4byte	.LASF26
	.2byte	0x100
	.byte	0x4
	.byte	0x49
	.byte	0x8
	.4byte	0x467
	.byte	0x4
	.4byte	.LASF27
	.byte	0x4
	.byte	0x4b
	.byte	0x11
	.4byte	0x125
	.byte	0
	.byte	0x4
	.4byte	.LASF28
	.byte	0x4
	.byte	0x4c
	.byte	0x8
	.4byte	0x119
	.byte	0x8
	.byte	0x4
	.4byte	.LASF20
	.byte	0x4
	.byte	0x4d
	.byte	0x14
	.4byte	0x467
	.byte	0x10
	.byte	0x4
	.4byte	.LASF25
	.byte	0x4
	.byte	0x4e
	.byte	0x11
	.4byte	0x310
	.byte	0x18
	.byte	0x4
	.4byte	.LASF29
	.byte	0x4
	.byte	0x4f
	.byte	0x10
	.4byte	0xa7
	.byte	0x80
	.byte	0x4
	.4byte	.LASF30
	.byte	0x4
	.byte	0x50
	.byte	0x7
	.4byte	0x46d
	.byte	0x88
	.byte	0x4
	.4byte	.LASF31
	.byte	0x4
	.byte	0x51
	.byte	0x6
	.4byte	0xfd
	.byte	0x94
	.byte	0x7
	.string	"pid"
	.byte	0x4
	.byte	0x52
	.byte	0x6
	.4byte	0xfd
	.byte	0x98
	.byte	0x4
	.4byte	.LASF32
	.byte	0x4
	.byte	0x53
	.byte	0x6
	.4byte	0xfd
	.byte	0x9c
	.byte	0x4
	.4byte	.LASF33
	.byte	0x4
	.byte	0x54
	.byte	0x10
	.4byte	0xa7
	.byte	0xa0
	.byte	0x4
	.4byte	.LASF34
	.byte	0x4
	.byte	0x55
	.byte	0xf
	.4byte	0x47d
	.byte	0xa8
	.byte	0x4
	.4byte	.LASF35
	.byte	0x4
	.byte	0x57
	.byte	0xf
	.4byte	0x483
	.byte	0xb0
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x146
	.byte	0x5
	.4byte	0x10b
	.4byte	0x47d
	.byte	0x6
	.4byte	0xa7
	.byte	0x9
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x3bc
	.byte	0x5
	.4byte	0x493
	.4byte	0x493
	.byte	0x6
	.4byte	0xa7
	.byte	0x9
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x499
	.byte	0x3
	.4byte	.LASF36
	.byte	0x28
	.byte	0x5
	.byte	0xa
	.byte	0x8
	.4byte	0x50e
	.byte	0x4
	.4byte	.LASF0
	.byte	0x5
	.byte	0xc
	.byte	0x2f
	.4byte	0x50e
	.byte	0
	.byte	0x4
	.4byte	.LASF37
	.byte	0x5
	.byte	0xd
	.byte	0x6
	.4byte	0xfd
	.byte	0x4
	.byte	0x4
	.4byte	.LASF38
	.byte	0x5
	.byte	0xe
	.byte	0x7
	.4byte	0x10b
	.byte	0x8
	.byte	0x4
	.4byte	.LASF39
	.byte	0x5
	.byte	0xf
	.byte	0x7
	.4byte	0x10b
	.byte	0x9
	.byte	0x7
	.string	"ip"
	.byte	0x5
	.byte	0x10
	.byte	0x10
	.4byte	0x535
	.byte	0x10
	.byte	0x4
	.4byte	.LASF40
	.byte	0x5
	.byte	0x11
	.byte	0xf
	.4byte	0x595
	.byte	0x18
	.byte	0x7
	.string	"off"
	.byte	0x5
	.byte	0x12
	.byte	0xf
	.4byte	0x2d
	.byte	0x20
	.byte	0x4
	.4byte	.LASF1
	.byte	0x5
	.byte	0x13
	.byte	0x8
	.4byte	0x90
	.byte	0x24
	.byte	0
	.byte	0xd
	.byte	0x7
	.byte	0x4
	.4byte	0x2d
	.byte	0x5
	.byte	0xc
	.byte	0x7
	.4byte	0x535
	.byte	0xe
	.4byte	.LASF41
	.byte	0
	.byte	0xe
	.4byte	.LASF42
	.byte	0x1
	.byte	0xe
	.4byte	.LASF43
	.byte	0x2
	.byte	0xe
	.4byte	.LASF44
	.byte	0x3
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0xae
	.byte	0x3
	.4byte	.LASF40
	.byte	0x78
	.byte	0x6
	.byte	0xc
	.byte	0x8
	.4byte	0x595
	.byte	0x4
	.4byte	.LASF45
	.byte	0x6
	.byte	0xe
	.byte	0x12
	.4byte	0x12b
	.byte	0
	.byte	0x4
	.4byte	.LASF46
	.byte	0x6
	.byte	0xf
	.byte	0x7
	.4byte	0x59b
	.byte	0x4
	.byte	0x7
	.string	"nrd"
	.byte	0x6
	.byte	0x10
	.byte	0x6
	.4byte	0xfd
	.byte	0x68
	.byte	0x7
	.string	"nwr"
	.byte	0x6
	.byte	0x11
	.byte	0x6
	.4byte	0xfd
	.byte	0x6c
	.byte	0x7
	.string	"rd"
	.byte	0x6
	.byte	0x12
	.byte	0x6
	.4byte	0xfd
	.byte	0x70
	.byte	0x7
	.string	"wr"
	.byte	0x6
	.byte	0x13
	.byte	0x6
	.4byte	0xfd
	.byte	0x74
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x53b
	.byte	0x5
	.4byte	0x10b
	.4byte	0x5ab
	.byte	0x6
	.4byte	0xa7
	.byte	0x63
	.byte	0
	.byte	0xf
	.4byte	.LASF56
	.byte	0x1
	.byte	0x3
	.byte	0x15
	.4byte	0x47d
	.byte	0x10
	.4byte	.LASF48
	.byte	0x1
	.byte	0x4a
	.byte	0x5
	.4byte	0xfd
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x616
	.byte	0x11
	.4byte	.LASF40
	.byte	0x1
	.byte	0x4a
	.byte	0x1a
	.4byte	0x595
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.4byte	.LASF47
	.byte	0x1
	.byte	0x4a
	.byte	0x2e
	.4byte	0xa7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x12
	.string	"len"
	.byte	0x1
	.byte	0x4a
	.byte	0x38
	.4byte	0xfd
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0x4c
	.byte	0x6
	.4byte	0xfd
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x10
	.4byte	.LASF49
	.byte	0x1
	.byte	0x2a
	.byte	0x5
	.4byte	0xfd
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x675
	.byte	0x11
	.4byte	.LASF40
	.byte	0x1
	.byte	0x2a
	.byte	0x1a
	.4byte	0x595
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.4byte	.LASF47
	.byte	0x1
	.byte	0x2a
	.byte	0x2e
	.4byte	0xa7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x12
	.string	"len"
	.byte	0x1
	.byte	0x2a
	.byte	0x38
	.4byte	0xfd
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.4byte	0xfd
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x10
	.4byte	.LASF51
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.4byte	0xfd
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x6c3
	.byte	0x12
	.string	"f0"
	.byte	0x1
	.byte	0x5
	.byte	0x1c
	.4byte	0x6c3
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"f1"
	.byte	0x1
	.byte	0x5
	.byte	0x2e
	.4byte	0x6c3
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x13
	.4byte	.LASF51
	.byte	0x1
	.byte	0x7
	.byte	0xf
	.4byte	0x595
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x493
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
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
	.byte	0xc
	.byte	0xd
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
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x4
	.byte	0x1
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
	.byte	0xe
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
.LASF13:
	.string	"valid"
.LASF41:
	.string	"FD_NONE"
.LASF47:
	.string	"addr"
.LASF11:
	.string	"ndev"
.LASF56:
	.string	"proc_ptr"
.LASF31:
	.string	"state"
.LASF5:
	.string	"data_address"
.LASF7:
	.string	"short int"
.LASF12:
	.string	"ninode"
.LASF44:
	.string	"FD_DEVICE"
.LASF36:
	.string	"file"
.LASF9:
	.string	"dinode"
.LASF1:
	.string	"major"
.LASF49:
	.string	"pipe_wr"
.LASF3:
	.string	"nlink"
.LASF34:
	.string	"parent"
.LASF32:
	.string	"killed"
.LASF22:
	.string	"kernel_sp"
.LASF28:
	.string	"proc_pagetable"
.LASF16:
	.string	"char"
.LASF52:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF21:
	.string	"kernel_satp"
.LASF20:
	.string	"trapframe"
.LASF55:
	.string	"pgt_t"
.LASF30:
	.string	"name"
.LASF51:
	.string	"new_pipe"
.LASF24:
	.string	"kernel_hartid"
.LASF35:
	.string	"ofile"
.LASF17:
	.string	"unsigned char"
.LASF42:
	.string	"FD_PIPE"
.LASF54:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF26:
	.string	"proc"
.LASF0:
	.string	"type"
.LASF6:
	.string	"unsigned int"
.LASF25:
	.string	"context"
.LASF43:
	.string	"FD_INODE"
.LASF27:
	.string	"kstack"
.LASF38:
	.string	"readable"
.LASF53:
	.string	"src/pipe.c"
.LASF15:
	.string	"short unsigned int"
.LASF10:
	.string	"inode"
.LASF19:
	.string	"locked"
.LASF45:
	.string	"lock"
.LASF46:
	.string	"data"
.LASF14:
	.string	"content"
.LASF8:
	.string	"long unsigned int"
.LASF29:
	.string	"prog_size"
.LASF4:
	.string	"size"
.LASF33:
	.string	"sleep_chan"
.LASF18:
	.string	"spinlock"
.LASF2:
	.string	"minor"
.LASF40:
	.string	"pipe"
.LASF48:
	.string	"pipe_rd"
.LASF23:
	.string	"kernel_trap"
.LASF50:
	.string	"flag"
.LASF39:
	.string	"writable"
.LASF37:
	.string	"ref_cnt"
	.ident	"GCC: () 9.3.0"
