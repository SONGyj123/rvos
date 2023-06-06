	.file	"sbi_main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	r_mstatus, @function
r_mstatus:
.LFB1:
	.file 1 "include/riscv.h"
	.loc 1 39 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 41 2
 #APP
# 41 "include/riscv.h" 1
	csrr a5, mstatus
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 45 9
	ld	a5,-24(s0)
	.loc 1 46 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	r_mstatus, .-r_mstatus
	.align	2
	.type	w_mepc, @function
w_mepc:
.LFB4:
	.loc 1 69 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 70 2
	ld	a5,-24(s0)
 #APP
# 70 "include/riscv.h" 1
	csrw mepc, a5
# 0 "" 2
	.loc 1 74 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	w_mepc, .-w_mepc
	.align	2
	.type	w_mstatus, @function
w_mstatus:
.LFB7:
	.loc 1 95 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 96 2
	ld	a5,-24(s0)
 #APP
# 96 "include/riscv.h" 1
	csrw mstatus, a5
# 0 "" 2
	.loc 1 100 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	w_mstatus, .-w_mstatus
	.align	2
	.type	w_stvec, @function
w_stvec:
.LFB9:
	.loc 1 111 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 112 2
	ld	a5,-24(s0)
 #APP
# 112 "include/riscv.h" 1
	csrw stvec, a5
# 0 "" 2
	.loc 1 116 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	w_stvec, .-w_stvec
	.align	2
	.type	w_sie, @function
w_sie:
.LFB10:
	.loc 1 119 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 120 2
	ld	a5,-24(s0)
 #APP
# 120 "include/riscv.h" 1
	csrw sie, a5
# 0 "" 2
	.loc 1 124 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	w_sie, .-w_sie
	.align	2
	.type	w_satp, @function
w_satp:
.LFB11:
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
	.type	r_sie, @function
r_sie:
.LFB17:
	.loc 1 178 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 181 2
 #APP
# 181 "include/riscv.h" 1
	csrr a5, sie
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 185 9
	ld	a5,-24(s0)
	.loc 1 186 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	r_sie, .-r_sie
	.align	2
	.type	w_medeleg, @function
w_medeleg:
.LFB21:
	.loc 1 216 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 217 2
	ld	a5,-24(s0)
 #APP
# 217 "include/riscv.h" 1
	csrw medeleg, a5
# 0 "" 2
	.loc 1 218 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	w_medeleg, .-w_medeleg
	.align	2
	.type	w_mideleg, @function
w_mideleg:
.LFB22:
	.loc 1 221 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 222 2
	ld	a5,-24(s0)
 #APP
# 222 "include/riscv.h" 1
	csrw mideleg, a5
# 0 "" 2
	.loc 1 223 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	w_mideleg, .-w_mideleg
	.align	2
	.type	w_pmpcfg0, @function
w_pmpcfg0:
.LFB23:
	.loc 1 226 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 227 2
	ld	a5,-24(s0)
 #APP
# 227 "include/riscv.h" 1
	csrw pmpcfg0, a5
# 0 "" 2
	.loc 1 228 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	w_pmpcfg0, .-w_pmpcfg0
	.align	2
	.type	w_pmpaddr0, @function
w_pmpaddr0:
.LFB24:
	.loc 1 231 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 232 2
	ld	a5,-24(s0)
 #APP
# 232 "include/riscv.h" 1
	csrw pmpaddr0, a5
# 0 "" 2
	.loc 1 233 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	w_pmpaddr0, .-w_pmpaddr0
	.section	.rodata
	.align	3
.LC0:
	.string	"sbi_main here\r\n"
	.text
	.align	2
	.globl	sbi_main
	.type	sbi_main, @function
sbi_main:
.LFB28:
	.file 2 "sbi/sbi_main.c"
	.loc 2 9 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 12 2
	call	uart_init
	.loc 2 13 2
	lla	a0,.LC0
	call	uart_send_string
	.loc 2 15 2
	call	sbi_trap_init
	.loc 2 16 2
	call	timer_init
	.loc 2 17 2
	li	a5,65536
	addi	a0,a5,-513
	call	w_medeleg
	.loc 2 18 2
	li	a5,65536
	addi	a0,a5,-1
	call	w_mideleg
	.loc 2 20 8
	call	r_mstatus
	sd	a0,-24(s0)
	.loc 2 21 16
	ld	a4,-24(s0)
	li	a5,-8192
	addi	a5,a5,2047
	and	a4,a4,a5
	.loc 2 21 6
	li	a5,4096
	addi	a5,a5,-2048
	or	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 23 6
	ld	a5,-24(s0)
	andi	a5,a5,-129
	sd	a5,-24(s0)
	.loc 2 25 2
	ld	a0,-24(s0)
	call	w_mstatus
	.loc 2 26 2
	li	a5,1025
	slli	a0,a5,21
	call	w_mepc
	.loc 2 27 2
	li	a5,1025
	slli	a0,a5,21
	call	w_stvec
	.loc 2 29 8
	call	r_sie
	mv	a5,a0
	.loc 2 29 2
	ori	a5,a5,2
	mv	a0,a5
	call	w_sie
	.loc 2 30 8
	call	r_sie
	mv	a5,a0
	.loc 2 30 2
	ori	a5,a5,512
	mv	a0,a5
	call	w_sie
	.loc 2 31 2
	li	a0,0
	call	w_satp
	.loc 2 33 2
	li	a5,-1
	srli	a0,a5,10
	call	w_pmpaddr0
	.loc 2 34 2
	li	a0,15
	call	w_pmpcfg0
	.loc 2 36 2
 #APP
# 36 "sbi/sbi_main.c" 1
	mret
# 0 "" 2
	.loc 2 37 1
 #NO_APP
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
.LFE28:
	.size	sbi_main, .-sbi_main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x247
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
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x8
	.byte	0x6
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x62
	.byte	0x4
	.string	"val"
	.byte	0x2
	.byte	0xa
	.byte	0x10
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF0
	.byte	0x1
	.byte	0xe6
	.byte	0x14
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x8e
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0xe6
	.byte	0x2d
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF1
	.byte	0x1
	.byte	0xe1
	.byte	0x14
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0xba
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0xe1
	.byte	0x2c
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF2
	.byte	0x1
	.byte	0xdc
	.byte	0x14
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0xe6
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0xdc
	.byte	0x2c
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0xd7
	.byte	0x14
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x112
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0xd7
	.byte	0x2c
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x7
	.4byte	.LASF4
	.byte	0x1
	.byte	0xb1
	.byte	0x1d
	.4byte	0x2d
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x142
	.byte	0x4
	.string	"x"
	.byte	0x1
	.byte	0xb3
	.byte	0x10
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x7e
	.byte	0x14
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x16e
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0x7e
	.byte	0x29
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x76
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x19a
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0x76
	.byte	0x28
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x6e
	.byte	0x14
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x1c6
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0x6e
	.byte	0x2a
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x5e
	.byte	0x14
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f2
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0x5e
	.byte	0x2c
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0x44
	.byte	0x14
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x21e
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0x44
	.byte	0x29
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x8
	.4byte	.LASF15
	.byte	0x1
	.byte	0x26
	.byte	0x1d
	.4byte	0x2d
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x4
	.string	"x"
	.byte	0x1
	.byte	0x28
	.byte	0x10
	.4byte	0x2d
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
.LASF6:
	.string	"w_sie"
.LASF5:
	.string	"w_satp"
.LASF11:
	.string	"sbi/sbi_main.c"
.LASF10:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF7:
	.string	"w_stvec"
.LASF13:
	.string	"long unsigned int"
.LASF8:
	.string	"w_mstatus"
.LASF15:
	.string	"r_mstatus"
.LASF1:
	.string	"w_pmpcfg0"
.LASF12:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF0:
	.string	"w_pmpaddr0"
.LASF4:
	.string	"r_sie"
.LASF3:
	.string	"w_medeleg"
.LASF14:
	.string	"sbi_main"
.LASF9:
	.string	"w_mepc"
.LASF2:
	.string	"w_mideleg"
	.ident	"GCC: () 9.3.0"
