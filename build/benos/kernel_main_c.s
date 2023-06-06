	.file	"kernel_main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	w_satp, @function
w_satp:
.LFB11:
	.file 1 "include/riscv.h"
	.loc 1 127 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 128 2
	ld	a5,-24(s0)
 #APP
# 128 "include/riscv.h" 1
	csrw satp, a5
# 0 "" 2
	.loc 1 132 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	w_satp, .-w_satp
	.align	2
	.type	sfence_vma, @function
sfence_vma:
.LFB20:
	.loc 1 210 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 211 2
 #APP
# 211 "include/riscv.h" 1
	sfence.vma zero, zero
# 0 "" 2
	.loc 1 213 1
 #NO_APP
	nop
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	sfence_vma, .-sfence_vma
	.globl	test_num
	.section	.sbss,"aw",@nobits
	.align	2
	.type	test_num, @object
	.size	test_num, 4
test_num:
	.zero	4
	.comm	print_lock,4,8
	.section	.rodata
	.align	3
.LC0:
	.string	"hello kernel!\n"
	.align	3
.LC1:
	.string	"%d\n"
	.align	3
.LC2:
	.string	"free_mem_start: %p free_mem_end: %p\n"
	.align	3
.LC3:
	.string	"page num: %d\n"
	.align	3
.LC4:
	.string	"matched\n"
	.align	3
.LC5:
	.string	"not matched! n: %d\n"
	.align	3
.LC6:
	.string	"init proc kstack\n"
	.align	3
.LC7:
	.string	"paging before\n"
	.align	3
.LC8:
	.string	"paging after\n"
	.align	3
.LC9:
	.string	"/first_test.out"
	.align	3
.LC10:
	.string	"init first process\n"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB28:
	.file 2 "src/kernel_main.c"
	.loc 2 30 1
	.cfi_startproc
	addi	sp,sp,-256
	.cfi_def_cfa_offset 256
	sd	ra,248(sp)
	sd	s0,240(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,256
	.cfi_def_cfa 8, 0
	.loc 2 33 8
	lla	a5,.LC0
	sd	a5,-32(s0)
	.loc 2 34 20
	lla	a5,print_lock
	sw	zero,0(a5)
.LBB2:
	.loc 2 37 10
	sw	zero,-20(s0)
	.loc 2 37 2
	j	.L4
.L5:
	.loc 2 39 3 discriminator 3
	lla	a0,print_lock
	call	acquire
	.loc 2 40 11 discriminator 3
	lla	a5,test_num
	lw	a5,0(a5)
	addiw	a5,a5,1
	sext.w	a4,a5
	lla	a5,test_num
	sw	a4,0(a5)
	.loc 2 41 3 discriminator 3
	lla	a0,print_lock
	call	release
	.loc 2 37 22 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L4:
	.loc 2 37 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,49
	ble	a4,a5,.L5
.LBE2:
	.loc 2 43 2
	lla	a5,test_num
	lw	a5,0(a5)
	mv	a1,a5
	lla	a0,.LC1
	call	printf
.LBB3:
	.loc 2 45 44
	ld	a5,-32(s0)
	.loc 2 45 28
	mv	a0,a5
	.loc 2 45 104
	li	a1,0
	.loc 2 45 163
	li	a2,0
	.loc 2 45 222
	li	a7,2
	.loc 2 45 260
 #APP
# 45 "src/kernel_main.c" 1
	ecall
# 0 "" 2
 #NO_APP
.LBE3:
	.loc 2 49 19
	li	a5,17
	slli	a1,a5,27
	lla	a0,_free_mem_start
	call	free_mem_in_page
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 2 51 2
	li	a2,-2013265920
	lla	a1,_free_mem_start
	lla	a0,.LC2
	call	printf
	.loc 2 52 2
	lw	a5,-36(s0)
	mv	a1,a5
	lla	a0,.LC3
	call	printf
	.loc 2 54 51
	lla	a5,_free_mem_start
	.loc 2 54 49
	li	a4,17
	slli	a4,a4,27
	sub	a5,a4,a5
	.loc 2 54 83
	srli	a5,a5,12
	.loc 2 54 4
	sw	a5,-40(s0)
	.loc 2 56 7
	lw	a4,-36(s0)
	.loc 2 56 4
	lw	a5,-40(s0)
	sext.w	a5,a5
	bne	a5,a4,.L6
	.loc 2 58 3
	lla	a0,.LC4
	call	uart_send_str
	j	.L7
.L6:
	.loc 2 62 3
	lw	a5,-40(s0)
	mv	a1,a5
	lla	a0,.LC5
	call	printf
.L7:
	.loc 2 67 86
	lla	a4,_trampoline
	.loc 2 67 112
	li	a5,-2147483648
	add	a5,a4,a5
	.loc 2 67 2
	srli	a5,a5,12
	li	a4,14
	mv	a3,a5
	li	a5,1
	slli	a2,a5,31
	li	a5,1
	slli	a1,a5,31
	lla	a0,_pgt_start
	call	map_page
	.loc 2 69 2
	lla	a1,_trampoline
	.loc 2 69 114
	lla	a4,_etext
	.loc 2 69 136
	lla	a5,_trampoline
	.loc 2 69 135
	sub	a5,a4,a5
	.loc 2 69 2
	srli	a5,a5,12
	li	a4,14
	mv	a3,a5
	li	a5,67108864
	addi	a5,a5,-1
	slli	a2,a5,12
	lla	a0,_pgt_start
	call	map_page
	.loc 2 71 2
	lla	a1,_etext
	lla	a2,_etext
	.loc 2 71 121
	lla	a5,_etext
	.loc 2 71 120
	li	a4,17
	slli	a4,a4,27
	sub	a5,a4,a5
	.loc 2 71 2
	srli	a5,a5,12
	li	a4,14
	mv	a3,a5
	lla	a0,_pgt_start
	call	map_page
	.loc 2 73 2
	li	a4,14
	li	a3,1
	li	a2,268435456
	li	a1,268435456
	lla	a0,_pgt_start
	call	map_page
	.loc 2 74 2
	li	a4,14
	li	a3,4096
	li	a2,201326592
	li	a1,201326592
	lla	a0,_pgt_start
	call	map_page
	.loc 2 75 2
	li	a4,14
	li	a3,1
	li	a2,268439552
	li	a1,268439552
	lla	a0,_pgt_start
	call	map_page
	.loc 2 79 2
	lla	a0,_pgt_start
	call	init_proc_kstack
	.loc 2 80 2
	lla	a0,.LC6
	call	uart_send_str
	.loc 2 84 2
	lla	a0,.LC7
	call	uart_send_str
	.loc 2 85 2
	call	sfence_vma
	.loc 2 86 25
	lla	a5,_pgt_start
	.loc 2 86 53
	srli	a4,a5,12
	.loc 2 86 2
	li	a5,-1
	slli	a5,a5,63
	or	a5,a4,a5
	mv	a0,a5
	call	w_satp
	.loc 2 87 2
	call	sfence_vma
	.loc 2 88 2
	lla	a0,.LC8
	call	uart_send_str
	.loc 2 94 2
	call	src_trap_init
	.loc 2 99 2
	call	virt_disk_init
	.loc 2 102 2
	call	plicinit
	.loc 2 103 2
	call	plicinithart
	.loc 2 104 2
	call	fs_init
	.loc 2 109 13
	addi	a5,s0,-128
	mv	a1,a5
	lla	a0,.LC9
	call	get_inode
	mv	a5,a0
	sw	a5,-44(s0)
	.loc 2 110 2
	addi	a3,s0,-128
	addi	a4,s0,-248
	addi	a5,s0,-192
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	read_elfhr
	.loc 2 113 2
	call	user_init
	.loc 2 114 2
	lla	a0,.LC10
	call	uart_send_str
	.loc 2 116 2
	fence	iorw,iorw
	.loc 2 119 2
	call	scheduler
.L8:
	.loc 2 121 7 discriminator 1
	j	.L8
	.cfi_endproc
.LFE28:
	.size	kernel_main, .-kernel_main
.Letext0:
	.file 3 "src/fs.h"
	.file 4 "src/fd.h"
	.file 5 "src/locks.h"
	.file 6 "src/proc.h"
	.file 7 "include/def.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x884
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF79
	.byte	0xc
	.4byte	.LASF80
	.4byte	.LASF81
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF82
	.byte	0x7
	.byte	0x1a
	.byte	0x18
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	0x3f
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.byte	0x5
	.4byte	.LASF9
	.byte	0x40
	.byte	0x3
	.byte	0x1b
	.byte	0x8
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF2
	.byte	0x3
	.byte	0x1d
	.byte	0x8
	.4byte	0xa9
	.byte	0
	.byte	0x6
	.4byte	.LASF3
	.byte	0x3
	.byte	0x1e
	.byte	0x8
	.4byte	0xa9
	.byte	0x2
	.byte	0x6
	.4byte	.LASF4
	.byte	0x3
	.byte	0x1f
	.byte	0x8
	.4byte	0xa9
	.byte	0x4
	.byte	0x6
	.4byte	.LASF5
	.byte	0x3
	.byte	0x20
	.byte	0x8
	.4byte	0xa9
	.byte	0x6
	.byte	0x6
	.4byte	.LASF6
	.byte	0x3
	.byte	0x21
	.byte	0xf
	.4byte	0x46
	.byte	0x8
	.byte	0x6
	.4byte	.LASF7
	.byte	0x3
	.byte	0x22
	.byte	0xf
	.4byte	0xb0
	.byte	0xc
	.byte	0
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF8
	.byte	0x7
	.4byte	0x46
	.4byte	0xc0
	.byte	0x8
	.4byte	0x3f
	.byte	0xc
	.byte	0
	.byte	0x5
	.4byte	.LASF10
	.byte	0x50
	.byte	0x3
	.byte	0x26
	.byte	0x8
	.4byte	0x10f
	.byte	0x6
	.4byte	.LASF11
	.byte	0x3
	.byte	0x28
	.byte	0xf
	.4byte	0x46
	.byte	0
	.byte	0x6
	.4byte	.LASF12
	.byte	0x3
	.byte	0x29
	.byte	0xf
	.4byte	0x46
	.byte	0x4
	.byte	0x9
	.string	"ref"
	.byte	0x3
	.byte	0x2a
	.byte	0x6
	.4byte	0x10f
	.byte	0x8
	.byte	0x6
	.4byte	.LASF13
	.byte	0x3
	.byte	0x2b
	.byte	0x6
	.4byte	0x10f
	.byte	0xc
	.byte	0x6
	.4byte	.LASF14
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x4d
	.byte	0x10
	.byte	0
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.byte	0x5
	.4byte	.LASF17
	.byte	0x40
	.byte	0x3
	.byte	0x38
	.byte	0x8
	.4byte	0x1f5
	.byte	0x6
	.4byte	.LASF18
	.byte	0x3
	.byte	0x3a
	.byte	0xf
	.4byte	0x46
	.byte	0
	.byte	0x9
	.string	"elf"
	.byte	0x3
	.byte	0x3b
	.byte	0x10
	.4byte	0x1f5
	.byte	0x4
	.byte	0x6
	.4byte	.LASF2
	.byte	0x3
	.byte	0x3c
	.byte	0x11
	.4byte	0x116
	.byte	0x10
	.byte	0x6
	.4byte	.LASF19
	.byte	0x3
	.byte	0x3d
	.byte	0x11
	.4byte	0x116
	.byte	0x12
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.byte	0x3e
	.byte	0xf
	.4byte	0x46
	.byte	0x14
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
	.byte	0x3f
	.byte	0x10
	.4byte	0x3f
	.byte	0x18
	.byte	0x6
	.4byte	.LASF22
	.byte	0x3
	.byte	0x40
	.byte	0x10
	.4byte	0x3f
	.byte	0x20
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.byte	0x41
	.byte	0x10
	.4byte	0x3f
	.byte	0x28
	.byte	0x6
	.4byte	.LASF24
	.byte	0x3
	.byte	0x42
	.byte	0xf
	.4byte	0x46
	.byte	0x30
	.byte	0x6
	.4byte	.LASF25
	.byte	0x3
	.byte	0x43
	.byte	0x11
	.4byte	0x116
	.byte	0x34
	.byte	0x6
	.4byte	.LASF26
	.byte	0x3
	.byte	0x44
	.byte	0x11
	.4byte	0x116
	.byte	0x36
	.byte	0x6
	.4byte	.LASF27
	.byte	0x3
	.byte	0x45
	.byte	0x11
	.4byte	0x116
	.byte	0x38
	.byte	0x6
	.4byte	.LASF28
	.byte	0x3
	.byte	0x46
	.byte	0x11
	.4byte	0x116
	.byte	0x3a
	.byte	0x6
	.4byte	.LASF29
	.byte	0x3
	.byte	0x47
	.byte	0x11
	.4byte	0x116
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF30
	.byte	0x3
	.byte	0x48
	.byte	0x11
	.4byte	0x116
	.byte	0x3e
	.byte	0
	.byte	0x7
	.4byte	0x205
	.4byte	0x205
	.byte	0x8
	.4byte	0x3f
	.byte	0xb
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF31
	.byte	0x5
	.4byte	.LASF32
	.byte	0x38
	.byte	0x3
	.byte	0x4c
	.byte	0x8
	.4byte	0x282
	.byte	0x6
	.4byte	.LASF2
	.byte	0x3
	.byte	0x4e
	.byte	0xf
	.4byte	0x46
	.byte	0
	.byte	0x6
	.4byte	.LASF33
	.byte	0x3
	.byte	0x4f
	.byte	0xf
	.4byte	0x46
	.byte	0x4
	.byte	0x9
	.string	"off"
	.byte	0x3
	.byte	0x50
	.byte	0x10
	.4byte	0x3f
	.byte	0x8
	.byte	0x6
	.4byte	.LASF34
	.byte	0x3
	.byte	0x51
	.byte	0x10
	.4byte	0x3f
	.byte	0x10
	.byte	0x6
	.4byte	.LASF35
	.byte	0x3
	.byte	0x52
	.byte	0x10
	.4byte	0x3f
	.byte	0x18
	.byte	0x6
	.4byte	.LASF36
	.byte	0x3
	.byte	0x53
	.byte	0x10
	.4byte	0x3f
	.byte	0x20
	.byte	0x6
	.4byte	.LASF37
	.byte	0x3
	.byte	0x54
	.byte	0x10
	.4byte	0x3f
	.byte	0x28
	.byte	0x6
	.4byte	.LASF38
	.byte	0x3
	.byte	0x55
	.byte	0x10
	.4byte	0x3f
	.byte	0x30
	.byte	0
	.byte	0xb
	.byte	0x7
	.byte	0x4
	.4byte	0x46
	.byte	0x4
	.byte	0xc
	.byte	0x7
	.4byte	0x2a9
	.byte	0xc
	.4byte	.LASF39
	.byte	0
	.byte	0xc
	.4byte	.LASF40
	.byte	0x1
	.byte	0xc
	.4byte	.LASF41
	.byte	0x2
	.byte	0xc
	.4byte	.LASF42
	.byte	0x3
	.byte	0
	.byte	0x5
	.4byte	.LASF43
	.byte	0x28
	.byte	0x4
	.byte	0xa
	.byte	0x8
	.4byte	0x31e
	.byte	0x6
	.4byte	.LASF2
	.byte	0x4
	.byte	0xc
	.byte	0x2f
	.4byte	0x282
	.byte	0
	.byte	0x6
	.4byte	.LASF44
	.byte	0x4
	.byte	0xd
	.byte	0x6
	.4byte	0x10f
	.byte	0x4
	.byte	0x6
	.4byte	.LASF45
	.byte	0x4
	.byte	0xe
	.byte	0x7
	.4byte	0x11d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF46
	.byte	0x4
	.byte	0xf
	.byte	0x7
	.4byte	0x11d
	.byte	0x9
	.byte	0x9
	.string	"ip"
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.4byte	0x31e
	.byte	0x10
	.byte	0x6
	.4byte	.LASF47
	.byte	0x4
	.byte	0x11
	.byte	0xf
	.4byte	0x329
	.byte	0x18
	.byte	0x9
	.string	"off"
	.byte	0x4
	.byte	0x12
	.byte	0xf
	.4byte	0x46
	.byte	0x20
	.byte	0x6
	.4byte	.LASF3
	.byte	0x4
	.byte	0x13
	.byte	0x8
	.4byte	0xa9
	.byte	0x24
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0xc0
	.byte	0xd
	.4byte	.LASF47
	.byte	0x3
	.byte	0x8
	.4byte	0x324
	.byte	0x5
	.4byte	.LASF48
	.byte	0x4
	.byte	0x5
	.byte	0x4
	.byte	0x8
	.4byte	0x34a
	.byte	0x6
	.4byte	.LASF49
	.byte	0x5
	.byte	0x6
	.byte	0xf
	.4byte	0x46
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF50
	.2byte	0x120
	.byte	0x6
	.byte	0x11
	.byte	0x8
	.4byte	0x514
	.byte	0x6
	.4byte	.LASF51
	.byte	0x6
	.byte	0x12
	.byte	0x1b
	.4byte	0x3f
	.byte	0
	.byte	0x6
	.4byte	.LASF52
	.byte	0x6
	.byte	0x13
	.byte	0x1b
	.4byte	0x3f
	.byte	0x8
	.byte	0x6
	.4byte	.LASF53
	.byte	0x6
	.byte	0x14
	.byte	0x1b
	.4byte	0x3f
	.byte	0x10
	.byte	0x9
	.string	"epc"
	.byte	0x6
	.byte	0x15
	.byte	0x1b
	.4byte	0x3f
	.byte	0x18
	.byte	0x6
	.4byte	.LASF54
	.byte	0x6
	.byte	0x16
	.byte	0x1b
	.4byte	0x3f
	.byte	0x20
	.byte	0x9
	.string	"ra"
	.byte	0x6
	.byte	0x17
	.byte	0x1b
	.4byte	0x3f
	.byte	0x28
	.byte	0x9
	.string	"sp"
	.byte	0x6
	.byte	0x18
	.byte	0x1b
	.4byte	0x3f
	.byte	0x30
	.byte	0x9
	.string	"gp"
	.byte	0x6
	.byte	0x19
	.byte	0x1b
	.4byte	0x3f
	.byte	0x38
	.byte	0x9
	.string	"tp"
	.byte	0x6
	.byte	0x1a
	.byte	0x1b
	.4byte	0x3f
	.byte	0x40
	.byte	0x9
	.string	"t0"
	.byte	0x6
	.byte	0x1b
	.byte	0x1b
	.4byte	0x3f
	.byte	0x48
	.byte	0x9
	.string	"t1"
	.byte	0x6
	.byte	0x1c
	.byte	0x1b
	.4byte	0x3f
	.byte	0x50
	.byte	0x9
	.string	"t2"
	.byte	0x6
	.byte	0x1d
	.byte	0x1b
	.4byte	0x3f
	.byte	0x58
	.byte	0x9
	.string	"s0"
	.byte	0x6
	.byte	0x1e
	.byte	0x1b
	.4byte	0x3f
	.byte	0x60
	.byte	0x9
	.string	"s1"
	.byte	0x6
	.byte	0x1f
	.byte	0x1b
	.4byte	0x3f
	.byte	0x68
	.byte	0x9
	.string	"a0"
	.byte	0x6
	.byte	0x20
	.byte	0x1b
	.4byte	0x3f
	.byte	0x70
	.byte	0x9
	.string	"a1"
	.byte	0x6
	.byte	0x21
	.byte	0x1b
	.4byte	0x3f
	.byte	0x78
	.byte	0x9
	.string	"a2"
	.byte	0x6
	.byte	0x22
	.byte	0x1b
	.4byte	0x3f
	.byte	0x80
	.byte	0x9
	.string	"a3"
	.byte	0x6
	.byte	0x23
	.byte	0x1b
	.4byte	0x3f
	.byte	0x88
	.byte	0x9
	.string	"a4"
	.byte	0x6
	.byte	0x24
	.byte	0x1b
	.4byte	0x3f
	.byte	0x90
	.byte	0x9
	.string	"a5"
	.byte	0x6
	.byte	0x25
	.byte	0x1b
	.4byte	0x3f
	.byte	0x98
	.byte	0x9
	.string	"a6"
	.byte	0x6
	.byte	0x26
	.byte	0x1b
	.4byte	0x3f
	.byte	0xa0
	.byte	0x9
	.string	"a7"
	.byte	0x6
	.byte	0x27
	.byte	0x1b
	.4byte	0x3f
	.byte	0xa8
	.byte	0x9
	.string	"s2"
	.byte	0x6
	.byte	0x28
	.byte	0x1b
	.4byte	0x3f
	.byte	0xb0
	.byte	0x9
	.string	"s3"
	.byte	0x6
	.byte	0x29
	.byte	0x1b
	.4byte	0x3f
	.byte	0xb8
	.byte	0x9
	.string	"s4"
	.byte	0x6
	.byte	0x2a
	.byte	0x1b
	.4byte	0x3f
	.byte	0xc0
	.byte	0x9
	.string	"s5"
	.byte	0x6
	.byte	0x2b
	.byte	0x1b
	.4byte	0x3f
	.byte	0xc8
	.byte	0x9
	.string	"s6"
	.byte	0x6
	.byte	0x2c
	.byte	0x1b
	.4byte	0x3f
	.byte	0xd0
	.byte	0x9
	.string	"s7"
	.byte	0x6
	.byte	0x2d
	.byte	0x1b
	.4byte	0x3f
	.byte	0xd8
	.byte	0x9
	.string	"s8"
	.byte	0x6
	.byte	0x2e
	.byte	0x1b
	.4byte	0x3f
	.byte	0xe0
	.byte	0x9
	.string	"s9"
	.byte	0x6
	.byte	0x2f
	.byte	0x1b
	.4byte	0x3f
	.byte	0xe8
	.byte	0x9
	.string	"s10"
	.byte	0x6
	.byte	0x30
	.byte	0x1b
	.4byte	0x3f
	.byte	0xf0
	.byte	0x9
	.string	"s11"
	.byte	0x6
	.byte	0x31
	.byte	0x1b
	.4byte	0x3f
	.byte	0xf8
	.byte	0xf
	.string	"t3"
	.byte	0x6
	.byte	0x32
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x100
	.byte	0xf
	.string	"t4"
	.byte	0x6
	.byte	0x33
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x108
	.byte	0xf
	.string	"t5"
	.byte	0x6
	.byte	0x34
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x110
	.byte	0xf
	.string	"t6"
	.byte	0x6
	.byte	0x35
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x118
	.byte	0
	.byte	0x5
	.4byte	.LASF55
	.byte	0x68
	.byte	0x6
	.byte	0x38
	.byte	0x8
	.4byte	0x5c0
	.byte	0x9
	.string	"ra"
	.byte	0x6
	.byte	0x3a
	.byte	0x10
	.4byte	0x3f
	.byte	0
	.byte	0x9
	.string	"sp"
	.byte	0x6
	.byte	0x3b
	.byte	0x10
	.4byte	0x3f
	.byte	0x8
	.byte	0x9
	.string	"s0"
	.byte	0x6
	.byte	0x3c
	.byte	0x10
	.4byte	0x3f
	.byte	0x10
	.byte	0x9
	.string	"s1"
	.byte	0x6
	.byte	0x3d
	.byte	0x10
	.4byte	0x3f
	.byte	0x18
	.byte	0x9
	.string	"s2"
	.byte	0x6
	.byte	0x3e
	.byte	0x10
	.4byte	0x3f
	.byte	0x20
	.byte	0x9
	.string	"s3"
	.byte	0x6
	.byte	0x3f
	.byte	0x10
	.4byte	0x3f
	.byte	0x28
	.byte	0x9
	.string	"s4"
	.byte	0x6
	.byte	0x40
	.byte	0x10
	.4byte	0x3f
	.byte	0x30
	.byte	0x9
	.string	"s5"
	.byte	0x6
	.byte	0x41
	.byte	0x10
	.4byte	0x3f
	.byte	0x38
	.byte	0x9
	.string	"s7"
	.byte	0x6
	.byte	0x42
	.byte	0x10
	.4byte	0x3f
	.byte	0x40
	.byte	0x9
	.string	"s8"
	.byte	0x6
	.byte	0x43
	.byte	0x10
	.4byte	0x3f
	.byte	0x48
	.byte	0x9
	.string	"s9"
	.byte	0x6
	.byte	0x44
	.byte	0x10
	.4byte	0x3f
	.byte	0x50
	.byte	0x9
	.string	"s10"
	.byte	0x6
	.byte	0x45
	.byte	0x10
	.4byte	0x3f
	.byte	0x58
	.byte	0x9
	.string	"s11"
	.byte	0x6
	.byte	0x46
	.byte	0x10
	.4byte	0x3f
	.byte	0x60
	.byte	0
	.byte	0xe
	.4byte	.LASF56
	.2byte	0x100
	.byte	0x6
	.byte	0x49
	.byte	0x8
	.4byte	0x66b
	.byte	0x6
	.4byte	.LASF57
	.byte	0x6
	.byte	0x4b
	.byte	0x11
	.4byte	0x39
	.byte	0
	.byte	0x6
	.4byte	.LASF58
	.byte	0x6
	.byte	0x4c
	.byte	0x8
	.4byte	0x2d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF50
	.byte	0x6
	.byte	0x4d
	.byte	0x14
	.4byte	0x66b
	.byte	0x10
	.byte	0x6
	.4byte	.LASF55
	.byte	0x6
	.byte	0x4e
	.byte	0x11
	.4byte	0x514
	.byte	0x18
	.byte	0x6
	.4byte	.LASF59
	.byte	0x6
	.byte	0x4f
	.byte	0x10
	.4byte	0x3f
	.byte	0x80
	.byte	0x6
	.4byte	.LASF60
	.byte	0x6
	.byte	0x50
	.byte	0x7
	.4byte	0x671
	.byte	0x88
	.byte	0x6
	.4byte	.LASF61
	.byte	0x6
	.byte	0x51
	.byte	0x6
	.4byte	0x10f
	.byte	0x94
	.byte	0x9
	.string	"pid"
	.byte	0x6
	.byte	0x52
	.byte	0x6
	.4byte	0x10f
	.byte	0x98
	.byte	0x6
	.4byte	.LASF62
	.byte	0x6
	.byte	0x53
	.byte	0x6
	.4byte	0x10f
	.byte	0x9c
	.byte	0x6
	.4byte	.LASF63
	.byte	0x6
	.byte	0x54
	.byte	0x10
	.4byte	0x3f
	.byte	0xa0
	.byte	0x6
	.4byte	.LASF64
	.byte	0x6
	.byte	0x55
	.byte	0xf
	.4byte	0x681
	.byte	0xa8
	.byte	0x6
	.4byte	.LASF65
	.byte	0x6
	.byte	0x57
	.byte	0xf
	.4byte	0x687
	.byte	0xb0
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x34a
	.byte	0x7
	.4byte	0x11d
	.4byte	0x681
	.byte	0x8
	.4byte	0x3f
	.byte	0x9
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x5c0
	.byte	0x7
	.4byte	0x697
	.4byte	0x697
	.byte	0x8
	.4byte	0x3f
	.byte	0x9
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x2a9
	.byte	0x7
	.4byte	0x3f
	.4byte	0x6a8
	.byte	0x10
	.byte	0
	.byte	0x11
	.4byte	.LASF66
	.byte	0x2
	.byte	0xc
	.byte	0x16
	.4byte	0x69d
	.byte	0x11
	.4byte	.LASF67
	.byte	0x2
	.byte	0xd
	.byte	0x16
	.4byte	0x69d
	.byte	0x11
	.4byte	.LASF68
	.byte	0x2
	.byte	0xe
	.byte	0x16
	.4byte	0x69d
	.byte	0x11
	.4byte	.LASF69
	.byte	0x2
	.byte	0xf
	.byte	0x16
	.4byte	0x69d
	.byte	0x5
	.4byte	.LASF70
	.byte	0x8
	.byte	0x2
	.byte	0x10
	.byte	0xf
	.4byte	0x6f3
	.byte	0x9
	.string	"nxt"
	.byte	0x2
	.byte	0x12
	.byte	0x1a
	.4byte	0x6f3
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x6d8
	.byte	0x11
	.4byte	.LASF71
	.byte	0x2
	.byte	0x13
	.byte	0x2
	.4byte	0x6d8
	.byte	0x7
	.4byte	0x5c0
	.4byte	0x715
	.byte	0x8
	.4byte	0x3f
	.byte	0x9
	.byte	0
	.byte	0x11
	.4byte	.LASF72
	.byte	0x2
	.byte	0x14
	.byte	0x14
	.4byte	0x705
	.byte	0x12
	.4byte	.LASF73
	.byte	0x2
	.byte	0x18
	.byte	0x5
	.4byte	0x10f
	.byte	0x9
	.byte	0x3
	.8byte	test_num
	.byte	0x12
	.4byte	.LASF74
	.byte	0x2
	.byte	0x1a
	.byte	0x11
	.4byte	0x32f
	.byte	0x9
	.byte	0x3
	.8byte	print_lock
	.byte	0x13
	.4byte	.LASF83
	.byte	0x2
	.byte	0x1d
	.byte	0x6
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x83f
	.byte	0x14
	.4byte	.LASF75
	.byte	0x2
	.byte	0x1f
	.byte	0x6
	.4byte	0x10f
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x15
	.string	"n"
	.byte	0x2
	.byte	0x20
	.byte	0xf
	.4byte	0x46
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x15
	.string	"str"
	.byte	0x2
	.byte	0x21
	.byte	0x8
	.4byte	0x83f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x14
	.4byte	.LASF76
	.byte	0x2
	.byte	0x6a
	.byte	0xf
	.4byte	0xc0
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0x14
	.4byte	.LASF77
	.byte	0x2
	.byte	0x6b
	.byte	0x10
	.4byte	0x124
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7e
	.byte	0x14
	.4byte	.LASF78
	.byte	0x2
	.byte	0x6c
	.byte	0x11
	.4byte	0x20c
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7e
	.byte	0x14
	.4byte	.LASF24
	.byte	0x2
	.byte	0x6d
	.byte	0x6
	.4byte	0x10f
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x16
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x7f8
	.byte	0x15
	.string	"n"
	.byte	0x2
	.byte	0x25
	.byte	0xa
	.4byte	0x10f
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x17
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x15
	.string	"a0"
	.byte	0x2
	.byte	0x2d
	.byte	0x1c
	.4byte	0x3f
	.byte	0x1
	.byte	0x5a
	.byte	0x15
	.string	"a1"
	.byte	0x2
	.byte	0x2d
	.byte	0x68
	.4byte	0x3f
	.byte	0x1
	.byte	0x5b
	.byte	0x15
	.string	"a2"
	.byte	0x2
	.byte	0x2d
	.byte	0xa3
	.4byte	0x3f
	.byte	0x1
	.byte	0x5c
	.byte	0x15
	.string	"a7"
	.byte	0x2
	.byte	0x2d
	.byte	0xde
	.4byte	0x3f
	.byte	0x1
	.byte	0x61
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x11d
	.byte	0x18
	.4byte	.LASF84
	.byte	0x1
	.byte	0xd1
	.byte	0x14
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF85
	.byte	0x1
	.byte	0x7e
	.byte	0x14
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.byte	0x1a
	.string	"x"
	.byte	0x1
	.byte	0x7e
	.byte	0x29
	.4byte	0x3f
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
	.byte	0x49
	.byte	0x13
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
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
.LASF13:
	.string	"valid"
.LASF23:
	.string	"shoff"
.LASF37:
	.string	"memsz"
.LASF39:
	.string	"FD_NONE"
.LASF11:
	.string	"ndev"
.LASF20:
	.string	"version"
.LASF17:
	.string	"elfhdr"
.LASF71:
	.string	"mem_ll"
.LASF55:
	.string	"context"
.LASF61:
	.string	"state"
.LASF7:
	.string	"data_address"
.LASF67:
	.string	"_free_mem_start"
.LASF74:
	.string	"print_lock"
.LASF8:
	.string	"short int"
.LASF83:
	.string	"kernel_main"
.LASF12:
	.string	"ninode"
.LASF73:
	.string	"test_num"
.LASF22:
	.string	"phyoff"
.LASF66:
	.string	"_pgt_start"
.LASF43:
	.string	"file"
.LASF27:
	.string	"phnum"
.LASF9:
	.string	"dinode"
.LASF3:
	.string	"major"
.LASF26:
	.string	"phentsize"
.LASF32:
	.string	"proghdr"
.LASF5:
	.string	"nlink"
.LASF64:
	.string	"parent"
.LASF77:
	.string	"test1"
.LASF62:
	.string	"killed"
.LASF42:
	.string	"FD_DEVICE"
.LASF52:
	.string	"kernel_sp"
.LASF75:
	.string	"freed_page_num"
.LASF28:
	.string	"shentsize"
.LASF58:
	.string	"proc_pagetable"
.LASF16:
	.string	"char"
.LASF79:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF51:
	.string	"kernel_satp"
.LASF69:
	.string	"_trampoline"
.LASF65:
	.string	"ofile"
.LASF85:
	.string	"w_satp"
.LASF50:
	.string	"trapframe"
.LASF82:
	.string	"pgt_t"
.LASF36:
	.string	"filesz"
.LASF60:
	.string	"name"
.LASF54:
	.string	"kernel_hartid"
.LASF21:
	.string	"entry"
.LASF35:
	.string	"paddr"
.LASF31:
	.string	"unsigned char"
.LASF81:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF33:
	.string	"flags"
.LASF19:
	.string	"mach"
.LASF2:
	.string	"type"
.LASF1:
	.string	"unsigned int"
.LASF41:
	.string	"FD_INODE"
.LASF45:
	.string	"readable"
.LASF30:
	.string	"shstrndx"
.LASF57:
	.string	"kstack"
.LASF15:
	.string	"short unsigned int"
.LASF10:
	.string	"inode"
.LASF49:
	.string	"locked"
.LASF34:
	.string	"vaddr"
.LASF78:
	.string	"test2"
.LASF84:
	.string	"sfence_vma"
.LASF72:
	.string	"proc_list"
.LASF14:
	.string	"content"
.LASF56:
	.string	"proc"
.LASF76:
	.string	"test"
.LASF25:
	.string	"ehsize"
.LASF80:
	.string	"src/kernel_main.c"
.LASF0:
	.string	"long unsigned int"
.LASF40:
	.string	"FD_PIPE"
.LASF29:
	.string	"shnum"
.LASF6:
	.string	"size"
.LASF18:
	.string	"magic_num"
.LASF63:
	.string	"sleep_chan"
.LASF48:
	.string	"spinlock"
.LASF38:
	.string	"align"
.LASF4:
	.string	"minor"
.LASF47:
	.string	"pipe"
.LASF70:
	.string	"mem_linked_list"
.LASF53:
	.string	"kernel_trap"
.LASF59:
	.string	"prog_size"
.LASF24:
	.string	"flag"
.LASF46:
	.string	"writable"
.LASF44:
	.string	"ref_cnt"
.LASF68:
	.string	"_etext"
	.ident	"GCC: () 9.3.0"
