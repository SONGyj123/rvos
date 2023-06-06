	.file	"sbi_trap.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	r_mcause, @function
r_mcause:
.LFB2:
	.file 1 "include/riscv.h"
	.loc 1 49 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 51 2
 #APP
# 51 "include/riscv.h" 1
	csrr a5, mcause
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 55 9
	ld	a5,-24(s0)
	.loc 1 56 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	r_mcause, .-r_mcause
	.align	2
	.type	w_mtvec, @function
w_mtvec:
.LFB12:
	.loc 1 135 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 136 2
	ld	a5,-24(s0)
 #APP
# 136 "include/riscv.h" 1
	csrw mtvec, a5
# 0 "" 2
	.loc 1 140 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	w_mtvec, .-w_mtvec
	.align	2
	.type	w_mie, @function
w_mie:
.LFB13:
	.loc 1 143 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 144 2
	ld	a5,-24(s0)
 #APP
# 144 "include/riscv.h" 1
	csrw mie, a5
# 0 "" 2
	.loc 1 148 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	w_mie, .-w_mie
	.align	2
	.type	w_sip, @function
w_sip:
.LFB15:
	.loc 1 159 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 160 2
	ld	a5,-24(s0)
 #APP
# 160 "include/riscv.h" 1
	csrw sip, a5
# 0 "" 2
	.loc 1 164 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	w_sip, .-w_sip
	.align	2
	.type	r_mhartid, @function
r_mhartid:
.LFB19:
	.loc 1 200 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 202 2
 #APP
# 202 "include/riscv.h" 1
	csrr a5, mhartid
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 206 9
	ld	a5,-24(s0)
	.loc 1 207 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	r_mhartid, .-r_mhartid
	.align	2
	.globl	sbi_trap_init
	.type	sbi_trap_init, @function
sbi_trap_init:
.LFB28:
	.file 2 "sbi/sbi_trap.c"
	.loc 2 16 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 17 2
	lla	a5,sbi_exception_vec
	mv	a0,a5
	call	w_mtvec
	.loc 2 18 2
	li	a0,0
	call	w_mie
	.loc 2 19 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	sbi_trap_init, .-sbi_trap_init
	.align	2
	.globl	sbi_ecall_handler
	.type	sbi_ecall_handler, @function
sbi_ecall_handler:
.LFB29:
	.loc 2 22 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-32(s0)
	sw	a5,-20(s0)
	.loc 2 23 2
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,3
	beq	a4,a5,.L10
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,3
	bgt	a4,a5,.L15
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L12
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	beq	a4,a5,.L13
	.loc 2 44 4
	j	.L15
.L12:
	.loc 2 27 23
	ld	a5,-32(s0)
	ld	a5,80(a5)
	.loc 2 27 5
	andi	a5,a5,0xff
	mv	a0,a5
	call	uart_send_char
	.loc 2 28 5
	j	.L14
.L13:
	.loc 2 33 33
	ld	a5,-32(s0)
	ld	a5,80(a5)
	.loc 2 33 5
	mv	a0,a5
	call	uart_send_string
	.loc 2 34 5
	j	.L14
.L10:
	.loc 2 39 15
	call	r_mhartid
	mv	a4,a0
	.loc 2 39 13
	ld	a5,-32(s0)
	sd	a4,80(a5)
	.loc 2 40 5
	j	.L14
.L15:
	.loc 2 44 4
	nop
.L14:
	.loc 2 47 12
	ld	a5,-32(s0)
	ld	a5,0(a5)
	addi	a4,a5,4
	ld	a5,-32(s0)
	sd	a4,0(a5)
	.loc 2 48 1
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
.LFE29:
	.size	sbi_ecall_handler, .-sbi_ecall_handler
	.align	2
	.globl	sbi_trap_handler
	.type	sbi_trap_handler, @function
sbi_trap_handler:
.LFB30:
	.loc 2 51 1
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
	.loc 2 55 6
	call	r_mcause
	sd	a0,-24(s0)
	.loc 2 56 5
	ld	a5,-40(s0)
	ld	a5,136(a5)
	sd	a5,-32(s0)
	.loc 2 58 4
	ld	a4,-24(s0)
	li	a5,-1
	slli	a5,a5,63
	bleu	a4,a5,.L17
	.loc 2 60 5
	ld	a4,-24(s0)
	li	a5,-1
	slli	a5,a5,63
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 61 3
	ld	a4,-24(s0)
	li	a5,7
	bne	a4,a5,.L22
	.loc 2 66 6
	ld	a0,-40(s0)
	call	timer_int_handler
	.loc 2 69 6
	j	.L20
.L17:
	.loc 2 77 3
	ld	a4,-24(s0)
	li	a5,9
	bne	a4,a5,.L23
	.loc 2 81 6
	ld	a5,-32(s0)
	sext.w	a5,a5
	ld	a1,-40(s0)
	mv	a0,a5
	call	sbi_ecall_handler
	.loc 2 82 6
	j	.L20
.L22:
	.loc 2 72 5
	nop
	j	.L24
.L23:
	.loc 2 87 6
	nop
.L20:
.L24:
	.loc 2 91 1
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
.LFE30:
	.size	sbi_trap_handler, .-sbi_trap_handler
	.align	2
	.globl	timer_int_handler
	.type	timer_int_handler, @function
timer_int_handler:
.LFB31:
	.loc 2 94 1
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
	.loc 2 96 44
	call	r_mhartid
	mv	a5,a0
	.loc 2 96 59
	li	a4,4198400
	addi	a4,a4,-2048
	add	a4,a5,a4
	slli	a4,a4,3
	ld	a4,0(a4)
	li	a3,4198400
	addi	a3,a3,-2048
	add	a5,a5,a3
	slli	a5,a5,3
	mv	a3,a5
	li	a5,999424
	addi	a5,a5,576
	add	a5,a4,a5
	sd	a5,0(a3)
	.loc 2 99 2
	li	a0,2
	call	w_sip
	.loc 2 100 1
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
.LFE31:
	.size	timer_int_handler, .-timer_int_handler
.Letext0:
	.file 3 "sbi/sbi_trap_reg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x38b
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
	.4byte	.LASF13
	.2byte	0x108
	.byte	0x3
	.byte	0x4
	.byte	0x8
	.4byte	0x1cd
	.byte	0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0x6
	.byte	0x10
	.4byte	0x1cd
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x3
	.byte	0x7
	.byte	0x10
	.4byte	0x1cd
	.byte	0x8
	.byte	0x4
	.string	"sp"
	.byte	0x3
	.byte	0x8
	.byte	0x10
	.4byte	0x1cd
	.byte	0x10
	.byte	0x4
	.string	"gp"
	.byte	0x3
	.byte	0x9
	.byte	0x10
	.4byte	0x1cd
	.byte	0x18
	.byte	0x4
	.string	"tp"
	.byte	0x3
	.byte	0xa
	.byte	0x10
	.4byte	0x1cd
	.byte	0x20
	.byte	0x4
	.string	"t0"
	.byte	0x3
	.byte	0xb
	.byte	0x10
	.4byte	0x1cd
	.byte	0x28
	.byte	0x4
	.string	"t1"
	.byte	0x3
	.byte	0xc
	.byte	0x10
	.4byte	0x1cd
	.byte	0x30
	.byte	0x4
	.string	"t2"
	.byte	0x3
	.byte	0xd
	.byte	0x10
	.4byte	0x1cd
	.byte	0x38
	.byte	0x4
	.string	"s0"
	.byte	0x3
	.byte	0xe
	.byte	0x10
	.4byte	0x1cd
	.byte	0x40
	.byte	0x4
	.string	"s1"
	.byte	0x3
	.byte	0xf
	.byte	0x10
	.4byte	0x1cd
	.byte	0x48
	.byte	0x4
	.string	"a0"
	.byte	0x3
	.byte	0x10
	.byte	0x10
	.4byte	0x1cd
	.byte	0x50
	.byte	0x4
	.string	"a1"
	.byte	0x3
	.byte	0x11
	.byte	0x10
	.4byte	0x1cd
	.byte	0x58
	.byte	0x4
	.string	"a2"
	.byte	0x3
	.byte	0x12
	.byte	0x10
	.4byte	0x1cd
	.byte	0x60
	.byte	0x4
	.string	"a3"
	.byte	0x3
	.byte	0x13
	.byte	0x10
	.4byte	0x1cd
	.byte	0x68
	.byte	0x4
	.string	"a4"
	.byte	0x3
	.byte	0x14
	.byte	0x10
	.4byte	0x1cd
	.byte	0x70
	.byte	0x4
	.string	"a5"
	.byte	0x3
	.byte	0x15
	.byte	0x10
	.4byte	0x1cd
	.byte	0x78
	.byte	0x4
	.string	"a6"
	.byte	0x3
	.byte	0x16
	.byte	0x10
	.4byte	0x1cd
	.byte	0x80
	.byte	0x4
	.string	"a7"
	.byte	0x3
	.byte	0x17
	.byte	0x10
	.4byte	0x1cd
	.byte	0x88
	.byte	0x4
	.string	"s2"
	.byte	0x3
	.byte	0x18
	.byte	0x10
	.4byte	0x1cd
	.byte	0x90
	.byte	0x4
	.string	"s3"
	.byte	0x3
	.byte	0x19
	.byte	0x10
	.4byte	0x1cd
	.byte	0x98
	.byte	0x4
	.string	"s4"
	.byte	0x3
	.byte	0x1a
	.byte	0x10
	.4byte	0x1cd
	.byte	0xa0
	.byte	0x4
	.string	"s5"
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0x1cd
	.byte	0xa8
	.byte	0x4
	.string	"s6"
	.byte	0x3
	.byte	0x1c
	.byte	0x10
	.4byte	0x1cd
	.byte	0xb0
	.byte	0x4
	.string	"s7"
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x1cd
	.byte	0xb8
	.byte	0x4
	.string	"s8"
	.byte	0x3
	.byte	0x1e
	.byte	0x10
	.4byte	0x1cd
	.byte	0xc0
	.byte	0x4
	.string	"s9"
	.byte	0x3
	.byte	0x1f
	.byte	0x10
	.4byte	0x1cd
	.byte	0xc8
	.byte	0x4
	.string	"s10"
	.byte	0x3
	.byte	0x20
	.byte	0x10
	.4byte	0x1cd
	.byte	0xd0
	.byte	0x4
	.string	"s11"
	.byte	0x3
	.byte	0x21
	.byte	0x10
	.4byte	0x1cd
	.byte	0xd8
	.byte	0x4
	.string	"t3"
	.byte	0x3
	.byte	0x22
	.byte	0x10
	.4byte	0x1cd
	.byte	0xe0
	.byte	0x4
	.string	"t4"
	.byte	0x3
	.byte	0x23
	.byte	0x10
	.4byte	0x1cd
	.byte	0xe8
	.byte	0x4
	.string	"t5"
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x1cd
	.byte	0xf0
	.byte	0x4
	.string	"t6"
	.byte	0x3
	.byte	0x25
	.byte	0x10
	.4byte	0x1cd
	.byte	0xf8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x3
	.byte	0x27
	.byte	0x10
	.4byte	0x1cd
	.2byte	0x100
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x7
	.4byte	.LASF2
	.byte	0x2
	.byte	0x5d
	.byte	0x6
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x202
	.byte	0x8
	.string	"ptr"
	.byte	0x2
	.byte	0x5d
	.byte	0x30
	.4byte	0x202
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x2d
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x32
	.byte	0x6
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0x251
	.byte	0x8
	.string	"ptr"
	.byte	0x2
	.byte	0x32
	.byte	0x2f
	.4byte	0x202
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.string	"x"
	.byte	0x2
	.byte	0x34
	.byte	0x10
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.string	"id"
	.byte	0x2
	.byte	0x35
	.byte	0x10
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x15
	.byte	0x6
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x28d
	.byte	0x8
	.string	"id"
	.byte	0x2
	.byte	0x15
	.byte	0x1c
	.4byte	0x28d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"ptr"
	.byte	0x2
	.byte	0x15
	.byte	0x38
	.4byte	0x202
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xc
	.4byte	.LASF14
	.byte	0x2
	.byte	0xf
	.byte	0x6
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.byte	0xd
	.4byte	.LASF6
	.byte	0x1
	.byte	0xc7
	.byte	0x1d
	.4byte	0x1cd
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x2de
	.byte	0xa
	.string	"x"
	.byte	0x1
	.byte	0xc9
	.byte	0x10
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF7
	.byte	0x1
	.byte	0x9e
	.byte	0x14
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x30a
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x9e
	.byte	0x28
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8e
	.byte	0x14
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x336
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x8e
	.byte	0x28
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF9
	.byte	0x1
	.byte	0x86
	.byte	0x14
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x362
	.byte	0x8
	.string	"x"
	.byte	0x1
	.byte	0x86
	.byte	0x2a
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xf
	.4byte	.LASF15
	.byte	0x1
	.byte	0x30
	.byte	0x1d
	.4byte	0x1cd
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.string	"x"
	.byte	0x1
	.byte	0x32
	.byte	0x10
	.4byte	0x1cd
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xe
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
.LASF2:
	.string	"timer_int_handler"
.LASF7:
	.string	"w_sip"
.LASF10:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF5:
	.string	"long unsigned int"
.LASF11:
	.string	"sbi/sbi_trap.c"
.LASF0:
	.string	"mepc"
.LASF12:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF14:
	.string	"sbi_trap_init"
.LASF6:
	.string	"r_mhartid"
.LASF4:
	.string	"sbi_ecall_handler"
.LASF13:
	.string	"sbi_context_str"
.LASF3:
	.string	"sbi_trap_handler"
.LASF15:
	.string	"r_mcause"
.LASF1:
	.string	"mstatus"
.LASF9:
	.string	"w_mtvec"
.LASF8:
	.string	"w_mie"
	.ident	"GCC: () 9.3.0"
