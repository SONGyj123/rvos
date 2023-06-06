	.file	"src_trap.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	r_sstatus, @function
r_sstatus:
.LFB0:
	.file 1 "include/riscv.h"
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 31 2
 #APP
# 31 "include/riscv.h" 1
	csrr a5, sstatus
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 35 9
	ld	a5,-24(s0)
	.loc 1 36 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	r_sstatus, .-r_sstatus
	.align	2
	.type	r_scause, @function
r_scause:
.LFB3:
	.loc 1 59 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 61 2
 #APP
# 61 "include/riscv.h" 1
	csrr a5, scause
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 65 9
	ld	a5,-24(s0)
	.loc 1 66 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	r_scause, .-r_scause
	.align	2
	.type	w_sepc, @function
w_sepc:
.LFB5:
	.loc 1 77 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 78 2
	ld	a5,-24(s0)
 #APP
# 78 "include/riscv.h" 1
	csrw sepc, a5
# 0 "" 2
	.loc 1 82 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	w_sepc, .-w_sepc
	.align	2
	.type	r_sepc, @function
r_sepc:
.LFB6:
	.loc 1 85 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 87 2
 #APP
# 87 "include/riscv.h" 1
	csrr a5, sepc
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 91 9
	ld	a5,-24(s0)
	.loc 1 92 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	r_sepc, .-r_sepc
	.align	2
	.type	w_sstatus, @function
w_sstatus:
.LFB8:
	.loc 1 103 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 104 2
	ld	a5,-24(s0)
 #APP
# 104 "include/riscv.h" 1
	csrw sstatus, a5
# 0 "" 2
	.loc 1 108 1
 #NO_APP
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	w_sstatus, .-w_sstatus
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
	.type	r_sip, @function
r_sip:
.LFB18:
	.loc 1 189 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 192 2
 #APP
# 192 "include/riscv.h" 1
	csrr a5, sip
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	.loc 1 196 9
	ld	a5,-24(s0)
	.loc 1 197 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	r_sip, .-r_sip
	.align	2
	.type	intr_off, @function
intr_off:
.LFB26:
	.loc 1 250 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 251 12
	call	r_sstatus
	mv	a5,a0
	.loc 1 251 2
	andi	a5,a5,-3
	mv	a0,a5
	call	w_sstatus
	.loc 1 252 1
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
.LFE26:
	.size	intr_off, .-intr_off
	.align	2
	.type	intr_on, @function
intr_on:
.LFB27:
	.loc 1 255 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 256 12
	call	r_sstatus
	mv	a5,a0
	.loc 1 256 2
	ori	a5,a5,2
	mv	a0,a5
	call	w_sstatus
	.loc 1 257 1
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
.LFE27:
	.size	intr_on, .-intr_on
	.globl	systicks
	.section	.sbss,"aw",@nobits
	.align	3
	.type	systicks, @object
	.size	systicks, 8
systicks:
	.zero	8
	.globl	systicks_lock
	.align	3
	.type	systicks_lock, @object
	.size	systicks_lock, 4
systicks_lock:
	.zero	4
	.section	.rodata
	.align	3
.LC0:
	.string	"instruction not aligned\n"
	.align	3
.LC1:
	.string	"instruction access fault\n"
	.align	3
.LC2:
	.string	"illegal instruction\n"
	.align	3
.LC3:
	.string	"break point\n"
	.align	3
.LC4:
	.string	"load address not aligned\n"
	.align	3
.LC5:
	.string	"load address access fault\n"
	.align	3
.LC6:
	.string	"store/amo address not aligned\n"
	.align	3
.LC7:
	.string	"store/amo address access fault\n"
	.align	3
.LC8:
	.string	"syscall from U\n"
	.align	3
.LC9:
	.string	"syscall from S\n"
	.align	3
.LC10:
	.string	"unknown 10\n"
	.align	3
.LC11:
	.string	"unknown 11\n"
	.align	3
.LC12:
	.string	"instruction page fault\n"
	.align	3
.LC13:
	.string	"load page fault\n"
	.align	3
.LC14:
	.string	"unknown 14\n"
	.align	3
.LC15:
	.string	"store/amo page fault\n"
	.align	3
	.type	fault_info, @object
	.size	fault_info, 256
fault_info:
	.dword	smode_exeception_handler
	.dword	.LC0
	.dword	smode_exeception_handler
	.dword	.LC1
	.dword	smode_exeception_handler
	.dword	.LC2
	.dword	smode_exeception_handler
	.dword	.LC3
	.dword	smode_exeception_handler
	.dword	.LC4
	.dword	smode_exeception_handler
	.dword	.LC5
	.dword	smode_exeception_handler
	.dword	.LC6
	.dword	smode_exeception_handler
	.dword	.LC7
	.dword	smode_exeception_handler
	.dword	.LC8
	.dword	smode_exeception_handler
	.dword	.LC9
	.dword	smode_exeception_handler
	.dword	.LC10
	.dword	smode_exeception_handler
	.dword	.LC11
	.dword	smode_exeception_handler
	.dword	.LC12
	.dword	smode_exeception_handler
	.dword	.LC13
	.dword	smode_exeception_handler
	.dword	.LC14
	.dword	smode_exeception_handler
	.dword	.LC15
	.data
	.align	3
	.type	syscall, @object
	.size	syscall, 264
syscall:
	.zero	8
	.dword	sys_fork
	.dword	sys_exec
	.dword	sys_sleep
	.dword	sys_pipe
	.dword	sys_read
	.dword	sys_write
	.dword	sys_open
	.zero	192
	.dword	sys_print
	.text
	.align	2
	.globl	src_trap_init
	.type	src_trap_init, @function
src_trap_init:
.LFB28:
	.file 2 "src/src_trap.c"
	.loc 2 72 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 73 2
	lla	a5,smode_exeception_vec
	mv	a0,a5
	call	w_stvec
	.loc 2 76 2
	li	a0,2
	call	w_sie
	.loc 2 78 8
	call	r_sie
	mv	a5,a0
	.loc 2 78 2
	ori	a5,a5,512
	mv	a0,a5
	call	w_sie
	.loc 2 79 2
	li	a0,2
	call	w_sstatus
	.loc 2 80 1
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
	.size	src_trap_init, .-src_trap_init
	.section	.rodata
	.align	3
.LC16:
	.string	"Trap!!! scause: %p\n"
	.align	3
.LC17:
	.string	"\n"
	.align	3
.LC18:
	.string	"smode uart int\n"
	.align	3
.LC19:
	.string	"smode damn\n"
	.align	3
.LC20:
	.string	"default case\n"
	.text
	.align	2
	.globl	smode_exeception_handler
	.type	smode_exeception_handler, @function
smode_exeception_handler:
.LFB29:
	.loc 2 84 1
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
	.loc 2 85 6
	sw	zero,-20(s0)
	.loc 2 87 28
	ld	a5,-48(s0)
	.loc 2 87 4
	bltz	a5,.L20
	.loc 2 89 3
	ld	a1,-48(s0)
	lla	a0,.LC16
	call	printf
	.loc 2 90 3
	lla	a4,fault_info
	ld	a5,-48(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	ld	a5,8(a5)
	mv	a0,a5
	call	printf
	.loc 2 91 3
	ld	a0,-40(s0)
	call	show_regs
	.loc 2 92 3
	call	back_trace
	.loc 2 93 3
	lla	a0,.LC17
	call	panic
	.loc 2 144 1
	j	.L30
.L20:
	.loc 2 97 17
	ld	a4,-48(s0)
	li	a5,-1
	slli	a5,a5,63
	add	a5,a4,a5
	.loc 2 97 3
	li	a4,1
	beq	a5,a4,.L22
	li	a4,9
	beq	a5,a4,.L23
	j	.L29
.L22:
	.loc 2 103 12
	call	r_sip
	mv	a5,a0
	.loc 2 103 6
	andi	a5,a5,-3
	mv	a0,a5
	call	w_sip
	.loc 2 104 6
	lla	a0,systicks_lock
	call	acquire
	.loc 2 105 14
	lla	a5,systicks
	ld	a5,0(a5)
	addi	a4,a5,1
	lla	a5,systicks
	sd	a4,0(a5)
	.loc 2 106 6
	lla	a0,systicks_lock
	call	release
	.loc 2 107 6
	lla	a0,systicks
	call	wakeup
	.loc 2 108 6
	call	back_to_kernel
	.loc 2 111 6
	j	.L21
.L23:
	.loc 2 115 19
	call	plic_claim
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 116 8
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,10
	bne	a4,a5,.L25
	.loc 2 118 7
	call	uart_rd_char
	.loc 2 119 7
	lla	a0,.LC18
	call	printf
	j	.L26
.L25:
	.loc 2 121 13
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,1
	bne	a4,a5,.L26
	.loc 2 124 7
	call	virtio_intr
.L26:
	.loc 2 127 8
	lw	a5,-20(s0)
	sext.w	a5,a5
	beqz	a5,.L27
	.loc 2 129 7
	lw	a5,-20(s0)
	mv	a0,a5
	call	plic_complete
	.loc 2 135 6
	j	.L21
.L27:
	.loc 2 133 7
	lla	a0,.LC19
	call	panic
	.loc 2 135 6
	j	.L21
.L29:
	.loc 2 139 6
	lla	a0,.LC20
	call	printf
	.loc 2 140 6
	nop
.L21:
.L30:
	.loc 2 144 1
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
.LFE29:
	.size	smode_exeception_handler, .-smode_exeception_handler
	.section	.rodata
	.align	3
.LC21:
	.string	"sepc: %p ra: %p sp: %p\n"
	.align	3
.LC22:
	.string	"  gp: %p tp: %p t0: %p\n"
	.align	3
.LC23:
	.string	"  t1: %p t2: %p s0: %p\n"
	.text
	.align	2
	.globl	show_regs
	.type	show_regs, @function
show_regs:
.LFB30:
	.loc 2 148 1
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
	.loc 2 149 2
	ld	a5,-24(s0)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	ld	a2,8(a5)
	ld	a5,-24(s0)
	ld	a5,16(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC21
	call	printf
	.loc 2 150 2
	ld	a5,-24(s0)
	ld	a4,24(a5)
	ld	a5,-24(s0)
	ld	a2,32(a5)
	ld	a5,-24(s0)
	ld	a5,40(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC22
	call	printf
	.loc 2 151 2
	ld	a5,-24(s0)
	ld	a4,48(a5)
	ld	a5,-24(s0)
	ld	a2,56(a5)
	ld	a5,-24(s0)
	ld	a5,144(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC23
	call	printf
	.loc 2 152 2
	ld	a5,-24(s0)
	ld	a4,24(a5)
	ld	a5,-24(s0)
	ld	a2,32(a5)
	ld	a5,-24(s0)
	ld	a5,40(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC22
	call	printf
	.loc 2 154 1
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
	.size	show_regs, .-show_regs
	.section	.rodata
	.align	3
.LC24:
	.string	"user_trap(): unexpected scause %p \n"
	.align	3
.LC25:
	.string	"r_sepc----pc = %p \n"
	.align	3
.LC26:
	.string	"ra = %p \n"
	.align	3
.LC27:
	.string	"sp = %p \n"
	.align	3
.LC28:
	.string	"proc_ptr = %p \n"
	.align	3
.LC29:
	.string	"proc_list = %p \n"
	.align	3
.LC30:
	.string	"panic/n"
	.text
	.align	2
	.globl	user_trap
	.type	user_trap, @function
user_trap:
.LFB31:
	.loc 2 158 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	.loc 2 160 6
	sw	zero,-36(s0)
	.loc 2 161 28
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 161 39
	ld	a5,168(a5)
	.loc 2 161 6
	sw	a5,-40(s0)
	.loc 2 162 29
	call	r_scause
	sd	a0,-48(s0)
	.loc 2 164 2
	lla	a5,smode_exeception_vec
	mv	a0,a5
	call	w_stvec
	.loc 2 166 4
	ld	a4,-48(s0)
	li	a5,8
	bne	a4,a5,.L33
	.loc 2 168 30
	call	r_sepc
	mv	a4,a0
	.loc 2 168 11
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 168 39
	addi	a4,a4,4
	.loc 2 168 28
	sd	a4,24(a5)
	.loc 2 170 3
	call	intr_on
	.loc 2 171 36
	lla	a4,syscall
	lw	a5,-40(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,0(a5)
	.loc 2 171 11
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	s1,16(a5)
	.loc 2 171 29
	jalr	a4
.LVL0:
	mv	a5,a0
	.loc 2 171 27
	sd	a5,112(s1)
	j	.L34
.L33:
	.loc 2 174 9
	ld	a4,-48(s0)
	li	a5,-1
	slli	a5,a5,63
	addi	a5,a5,1
	bne	a4,a5,.L35
	.loc 2 176 11
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	s1,16(a5)
	.loc 2 176 30
	call	r_sepc
	mv	a5,a0
	.loc 2 176 28
	sd	a5,24(s1)
	.loc 2 177 9
	call	r_sip
	mv	a5,a0
	.loc 2 177 3
	andi	a5,a5,-3
	mv	a0,a5
	call	w_sip
	.loc 2 178 3
	lla	a0,systicks_lock
	call	acquire
	.loc 2 179 11
	lla	a5,systicks
	ld	a5,0(a5)
	addi	a4,a5,1
	lla	a5,systicks
	sd	a4,0(a5)
	.loc 2 180 3
	lla	a0,systicks_lock
	call	release
	.loc 2 181 3
	lla	a0,systicks
	call	wakeup
	.loc 2 182 3
	call	back_to_kernel
	j	.L34
.L35:
	.loc 2 184 9
	ld	a4,-48(s0)
	li	a5,-1
	slli	a5,a5,63
	addi	a5,a5,9
	bne	a4,a5,.L36
	.loc 2 186 11
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	s1,16(a5)
	.loc 2 186 30
	call	r_sepc
	mv	a5,a0
	.loc 2 186 28
	sd	a5,24(s1)
	.loc 2 187 16
	call	plic_claim
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 2 188 5
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,10
	bne	a4,a5,.L37
	.loc 2 190 17
	call	uart_rd_char
	mv	a5,a0
	sb	a5,-49(s0)
	.loc 2 199 5
	lbu	a5,-49(s0)
	mv	a0,a5
	call	uart_send_c
.L37:
	.loc 2 202 5
	lw	a5,-36(s0)
	sext.w	a5,a5
	beqz	a5,.L34
	.loc 2 204 4
	lw	a5,-36(s0)
	mv	a0,a5
	call	plic_complete
	j	.L34
.L36:
	.loc 2 209 3
	ld	a1,-48(s0)
	lla	a0,.LC24
	call	printf
	.loc 2 210 3
	call	r_sepc
	mv	a5,a0
	mv	a1,a5
	lla	a0,.LC25
	call	printf
	.loc 2 211 32
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 211 3
	ld	a5,40(a5)
	mv	a1,a5
	lla	a0,.LC26
	call	printf
	.loc 2 212 32
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 212 3
	ld	a5,48(a5)
	mv	a1,a5
	lla	a0,.LC27
	call	printf
	.loc 2 213 3
	lla	a5,proc_ptr
	ld	a5,0(a5)
	mv	a1,a5
	lla	a0,.LC28
	call	printf
	.loc 2 214 3
	lla	a1,proc_list
	lla	a0,.LC29
	call	printf
	.loc 2 215 21
	call	r_scause
	mv	a5,a0
	.loc 2 215 3
	lla	a4,fault_info
	slli	a5,a5,4
	add	a5,a4,a5
	ld	a5,8(a5)
	mv	a0,a5
	call	printf
	.loc 2 216 3
	lla	a0,.LC30
	call	panic
.L34:
	.loc 2 219 2
	call	user_trap_ret
	.loc 2 220 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	ld	s1,40(sp)
	.cfi_restore 9
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE31:
	.size	user_trap, .-user_trap
	.align	2
	.globl	user_trap_ret
	.type	user_trap_ret, @function
user_trap_ret:
.LFB32:
	.loc 2 224 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 225 2
	call	intr_off
	.loc 2 227 86
	lla	a4,uservec
	lla	a5,trampoline
	sub	a4,a4,a5
	.loc 2 227 75
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	add	a5,a4,a5
	.loc 2 227 16
	sd	a5,-24(s0)
	.loc 2 229 2
	ld	a0,-24(s0)
	call	w_stvec
	.loc 2 231 20
	call	r_sstatus
	sd	a0,-32(s0)
	.loc 2 232 4
	ld	a5,-32(s0)
	andi	a5,a5,-257
	sd	a5,-32(s0)
	.loc 2 234 4
	ld	a5,-32(s0)
	ori	a5,a5,32
	sd	a5,-32(s0)
	.loc 2 237 53
	lla	a5,_pgt_start
	.loc 2 237 80
	srli	a3,a5,12
	.loc 2 237 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 237 49
	li	a4,-1
	slli	a4,a4,63
	or	a4,a3,a4
	.loc 2 237 35
	sd	a4,0(a5)
	.loc 2 238 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 238 37
	lla	a4,user_trap
	.loc 2 238 35
	sd	a4,16(a5)
	.loc 2 239 58
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a4,0(a5)
	.loc 2 239 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 239 33
	sd	a4,8(a5)
	.loc 2 242 2
	ld	a0,-32(s0)
	call	w_sstatus
	.loc 2 244 17
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 244 2
	ld	a5,24(a5)
	mv	a0,a5
	call	w_sepc
	.loc 2 245 62
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,8(a5)
	.loc 2 245 80
	srli	a4,a5,12
	.loc 2 245 16
	li	a5,-1
	slli	a5,a5,63
	or	a5,a4,a5
	sd	a5,-40(s0)
	.loc 2 246 86
	lla	a4,userret
	lla	a5,trampoline
	sub	a4,a4,a5
	.loc 2 246 75
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	add	a5,a4,a5
	.loc 2 246 16
	sd	a5,-48(s0)
	.loc 2 247 3
	ld	a5,-48(s0)
	ld	a0,-40(s0)
	jalr	a5
.LVL1:
	.loc 2 248 1
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
.LFE32:
	.size	user_trap_ret, .-user_trap_ret
	.align	2
	.globl	back_to_kernel
	.type	back_to_kernel, @function
back_to_kernel:
.LFB33:
	.loc 2 251 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 252 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 252 18
	li	a4,2
	sw	a4,148(a5)
	.loc 2 253 17
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 253 2
	addi	a5,a5,24
	lla	a1,kernel_ctxt+24
	mv	a0,a5
	call	swtch
	.loc 2 254 1
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
.LFE33:
	.size	back_to_kernel, .-back_to_kernel
	.align	2
	.globl	sys_print
	.type	sys_print, @function
sys_print:
.LFB34:
	.loc 2 257 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 258 19
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 258 30
	ld	a5,112(a5)
	.loc 2 258 7
	sb	a5,-17(s0)
	.loc 2 260 2
	lbu	a5,-17(s0)
	mv	a0,a5
	call	uart_send_c
	.loc 2 262 9
	li	a5,0
	.loc 2 263 1
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
.LFE34:
	.size	sys_print, .-sys_print
	.align	2
	.globl	sys_fork
	.type	sys_fork, @function
sys_fork:
.LFB35:
	.loc 2 266 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 267 9
	call	fork
	mv	a5,a0
	.loc 2 268 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE35:
	.size	sys_fork, .-sys_fork
	.section	.rodata
	.align	3
.LC31:
	.string	"/first_test.out"
	.text
	.align	2
	.globl	sys_exec
	.type	sys_exec, @function
sys_exec:
.LFB36:
	.loc 2 271 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 272 8
	lla	a5,.LC31
	sd	a5,-24(s0)
	.loc 2 273 9
	li	a1,0
	ld	a0,-24(s0)
	call	exec
	mv	a5,a0
	.loc 2 274 1
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
.LFE36:
	.size	sys_exec, .-sys_exec
	.align	2
	.globl	sys_sleep
	.type	sys_sleep, @function
sys_sleep:
.LFB37:
	.loc 2 277 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 278 25
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 278 36
	ld	a5,112(a5)
	.loc 2 278 6
	sw	a5,-20(s0)
	.loc 2 279 2
	lla	a0,systicks_lock
	call	acquire
	.loc 2 280 16
	lla	a5,systicks
	ld	a5,0(a5)
	sd	a5,-32(s0)
	.loc 2 281 7
	j	.L47
.L48:
	.loc 2 283 3
	lla	a1,systicks_lock
	lla	a0,systicks
	call	sleep
.L47:
	.loc 2 281 16
	lla	a5,systicks
	ld	a4,0(a5)
	ld	a5,-32(s0)
	sub	a4,a4,a5
	.loc 2 281 25
	lw	a5,-20(s0)
	.loc 2 281 7
	bltu	a4,a5,.L48
	.loc 2 285 2
	lla	a0,systicks_lock
	call	release
	.loc 2 286 9
	li	a5,0
	.loc 2 287 1
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
.LFE37:
	.size	sys_sleep, .-sys_sleep
	.align	2
	.globl	sys_pipe
	.type	sys_pipe, @function
sys_pipe:
.LFB38:
	.loc 2 290 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 291 33
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 291 16
	ld	a5,112(a5)
	sd	a5,-24(s0)
	.loc 2 295 2
	addi	a4,s0,-40
	addi	a5,s0,-32
	mv	a1,a4
	mv	a0,a5
	call	new_pipe
	.loc 2 297 6
	sd	zero,-48(s0)
	.loc 2 298 10
	ld	a5,-32(s0)
	mv	a0,a5
	call	fd_alloc
	mv	a5,a0
	.loc 2 298 8
	sw	a5,-48(s0)
	.loc 2 299 10
	ld	a5,-40(s0)
	mv	a0,a5
	call	fd_alloc
	mv	a5,a0
	.loc 2 299 8
	sw	a5,-44(s0)
	.loc 2 300 7
	lw	a5,-48(s0)
	.loc 2 300 4
	mv	a4,a5
	li	a5,-1
	beq	a4,a5,.L51
	.loc 2 300 22 discriminator 1
	lw	a5,-44(s0)
	.loc 2 300 17 discriminator 1
	mv	a4,a5
	li	a5,-1
	bne	a4,a5,.L52
.L51:
	.loc 2 302 10
	li	a5,-1
	j	.L54
.L52:
	.loc 2 305 23
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 305 2
	ld	a5,8(a5)
	ld	a4,-24(s0)
	addi	a2,s0,-48
	li	a3,8
	mv	a1,a4
	mv	a0,a5
	call	copy_to_user
	.loc 2 307 9
	li	a5,0
.L54:
	.loc 2 308 1 discriminator 1
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
.LFE38:
	.size	sys_pipe, .-sys_pipe
	.align	2
	.globl	sys_write
	.type	sys_write, @function
sys_write:
.LFB39:
	.loc 2 311 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 312 19
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 312 30
	ld	a5,112(a5)
	.loc 2 312 6
	sw	a5,-20(s0)
	.loc 2 313 34
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 313 16
	ld	a5,120(a5)
	sd	a5,-32(s0)
	.loc 2 314 20
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 314 31
	ld	a5,128(a5)
	.loc 2 314 6
	sw	a5,-36(s0)
	.loc 2 316 36
	lla	a5,proc_ptr
	ld	a4,0(a5)
	.loc 2 316 15
	lw	a5,-20(s0)
	addi	a5,a5,22
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	sd	a5,-48(s0)
	.loc 2 318 15
	ld	a5,-48(s0)
	lw	a5,0(a5)
	.loc 2 318 4
	mv	a4,a5
	li	a5,1
	bne	a4,a5,.L56
	.loc 2 320 3
	ld	a5,-48(s0)
	ld	a5,24(a5)
	lw	a4,-36(s0)
	mv	a2,a4
	ld	a1,-32(s0)
	mv	a0,a5
	call	pipe_wr
	j	.L57
.L56:
	.loc 2 324 3
	ld	a5,-48(s0)
	ld	a0,16(a5)
	.loc 2 324 53
	ld	a5,-48(s0)
	lw	a5,32(a5)
	.loc 2 324 3
	slli	a5,a5,32
	srli	a5,a5,32
	lw	a3,-36(s0)
	li	a4,0
	mv	a2,a5
	ld	a1,-32(s0)
	call	write_to_inode
	.loc 2 325 19
	ld	a5,-48(s0)
	lw	a4,32(a5)
	lw	a5,-36(s0)
	addw	a5,a4,a5
	sext.w	a4,a5
	ld	a5,-48(s0)
	sw	a4,32(a5)
.L57:
	.loc 2 328 9
	li	a5,0
	.loc 2 329 1
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
.LFE39:
	.size	sys_write, .-sys_write
	.align	2
	.globl	sys_read
	.type	sys_read, @function
sys_read:
.LFB40:
	.loc 2 333 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 334 19
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 334 30
	ld	a5,112(a5)
	.loc 2 334 6
	sw	a5,-20(s0)
	.loc 2 335 34
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 335 16
	ld	a5,120(a5)
	sd	a5,-32(s0)
	.loc 2 336 20
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 336 31
	ld	a5,128(a5)
	.loc 2 336 6
	sw	a5,-36(s0)
	.loc 2 338 36
	lla	a5,proc_ptr
	ld	a4,0(a5)
	.loc 2 338 15
	lw	a5,-20(s0)
	addi	a5,a5,22
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	sd	a5,-48(s0)
	.loc 2 340 15
	ld	a5,-48(s0)
	lw	a5,0(a5)
	.loc 2 340 4
	mv	a4,a5
	li	a5,1
	bne	a4,a5,.L60
	.loc 2 342 3
	ld	a5,-48(s0)
	ld	a5,24(a5)
	lw	a4,-36(s0)
	mv	a2,a4
	ld	a1,-32(s0)
	mv	a0,a5
	call	pipe_rd
	j	.L61
.L60:
	.loc 2 344 20
	ld	a5,-48(s0)
	lw	a5,0(a5)
	.loc 2 344 9
	mv	a4,a5
	li	a5,2
	bne	a4,a5,.L61
	.loc 2 346 3
	ld	a5,-48(s0)
	ld	a0,16(a5)
	.loc 2 346 54
	ld	a5,-48(s0)
	lw	a5,32(a5)
	.loc 2 346 3
	slli	a5,a5,32
	srli	a5,a5,32
	lw	a3,-36(s0)
	li	a4,1
	mv	a2,a5
	ld	a1,-32(s0)
	call	read_from_inode
	.loc 2 347 19
	ld	a5,-48(s0)
	lw	a4,32(a5)
	lw	a5,-36(s0)
	addw	a5,a4,a5
	sext.w	a4,a5
	ld	a5,-48(s0)
	sw	a4,32(a5)
.L61:
	.loc 2 349 9
	li	a5,0
	.loc 2 350 1
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
.LFE40:
	.size	sys_read, .-sys_read
	.align	2
	.globl	sys_open
	.type	sys_open, @function
sys_open:
.LFB41:
	.loc 2 354 1
	.cfi_startproc
	addi	sp,sp,-464
	.cfi_def_cfa_offset 464
	sd	ra,456(sp)
	sd	s0,448(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,464
	.cfi_def_cfa 8, 0
	.loc 2 355 33
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 355 44
	ld	a5,112(a5)
	.loc 2 355 14
	sd	a5,-24(s0)
	.loc 2 356 22
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 356 33
	ld	a5,120(a5)
	.loc 2 356 6
	sw	a5,-28(s0)
	.loc 2 358 29
	call	kalloc
	sd	a0,-40(s0)
	.loc 2 362 8
	addi	a5,s0,-456
	li	a4,400
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 363 25
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 363 2
	ld	a5,8(a5)
	addi	a4,s0,-456
	li	a3,13
	ld	a2,-24(s0)
	mv	a1,a4
	mv	a0,a5
	call	copy_from_user
	.loc 2 365 2
	addi	a5,s0,-456
	ld	a1,-40(s0)
	mv	a0,a5
	call	get_inode
	.loc 2 367 14
	call	file_alloc
	sd	a0,-48(s0)
	.loc 2 368 7
	ld	a0,-48(s0)
	call	fd_alloc
	mv	a5,a0
	sw	a5,-52(s0)
	.loc 2 370 24
	ld	a5,-40(s0)
	lh	a5,16(a5)
	.loc 2 370 4
	sext.w	a4,a5
	li	a5,2
	bne	a4,a5,.L64
	.loc 2 372 19
	ld	a5,-48(s0)
	li	a4,2
	sw	a4,0(a5)
	.loc 2 373 18
	ld	a5,-48(s0)
	sw	zero,32(a5)
.L64:
	.loc 2 376 16
	ld	a5,-48(s0)
	ld	a4,-40(s0)
	sd	a4,16(a5)
	.loc 2 378 9
	lw	a5,-52(s0)
	.loc 2 379 1
	mv	a0,a5
	ld	ra,456(sp)
	.cfi_restore 1
	ld	s0,448(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 464
	addi	sp,sp,464
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE41:
	.size	sys_open, .-sys_open
.Letext0:
	.file 3 "include/asm/ptregs.h"
	.file 4 "src/fs.h"
	.file 5 "src/fd.h"
	.file 6 "src/pipe.h"
	.file 7 "src/locks.h"
	.file 8 "src/proc.h"
	.file 9 "include/def.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xe91
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF106
	.byte	0xc
	.4byte	.LASF107
	.4byte	.LASF108
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF7
	.2byte	0x120
	.byte	0x3
	.byte	0xd
	.byte	0x8
	.4byte	0x1f7
	.byte	0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0xf
	.byte	0x10
	.4byte	0x1f7
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x3
	.byte	0x10
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0x4
	.string	"sp"
	.byte	0x3
	.byte	0x11
	.byte	0x10
	.4byte	0x1f7
	.byte	0x10
	.byte	0x4
	.string	"gp"
	.byte	0x3
	.byte	0x12
	.byte	0x10
	.4byte	0x1f7
	.byte	0x18
	.byte	0x4
	.string	"tp"
	.byte	0x3
	.byte	0x13
	.byte	0x10
	.4byte	0x1f7
	.byte	0x20
	.byte	0x4
	.string	"t0"
	.byte	0x3
	.byte	0x14
	.byte	0x10
	.4byte	0x1f7
	.byte	0x28
	.byte	0x4
	.string	"t1"
	.byte	0x3
	.byte	0x15
	.byte	0x10
	.4byte	0x1f7
	.byte	0x30
	.byte	0x4
	.string	"t2"
	.byte	0x3
	.byte	0x16
	.byte	0x10
	.4byte	0x1f7
	.byte	0x38
	.byte	0x4
	.string	"s0"
	.byte	0x3
	.byte	0x17
	.byte	0x10
	.4byte	0x1f7
	.byte	0x40
	.byte	0x4
	.string	"s1"
	.byte	0x3
	.byte	0x18
	.byte	0x10
	.4byte	0x1f7
	.byte	0x48
	.byte	0x4
	.string	"a0"
	.byte	0x3
	.byte	0x19
	.byte	0x10
	.4byte	0x1f7
	.byte	0x50
	.byte	0x4
	.string	"a1"
	.byte	0x3
	.byte	0x1a
	.byte	0x10
	.4byte	0x1f7
	.byte	0x58
	.byte	0x4
	.string	"a2"
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0x1f7
	.byte	0x60
	.byte	0x4
	.string	"a3"
	.byte	0x3
	.byte	0x1c
	.byte	0x10
	.4byte	0x1f7
	.byte	0x68
	.byte	0x4
	.string	"a4"
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x1f7
	.byte	0x70
	.byte	0x4
	.string	"a5"
	.byte	0x3
	.byte	0x1e
	.byte	0x10
	.4byte	0x1f7
	.byte	0x78
	.byte	0x4
	.string	"a6"
	.byte	0x3
	.byte	0x1f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x80
	.byte	0x4
	.string	"a7"
	.byte	0x3
	.byte	0x20
	.byte	0x10
	.4byte	0x1f7
	.byte	0x88
	.byte	0x4
	.string	"s2"
	.byte	0x3
	.byte	0x21
	.byte	0x10
	.4byte	0x1f7
	.byte	0x90
	.byte	0x4
	.string	"s3"
	.byte	0x3
	.byte	0x22
	.byte	0x10
	.4byte	0x1f7
	.byte	0x98
	.byte	0x4
	.string	"s4"
	.byte	0x3
	.byte	0x23
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa0
	.byte	0x4
	.string	"s5"
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa8
	.byte	0x4
	.string	"s6"
	.byte	0x3
	.byte	0x25
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb0
	.byte	0x4
	.string	"s7"
	.byte	0x3
	.byte	0x26
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb8
	.byte	0x4
	.string	"s8"
	.byte	0x3
	.byte	0x27
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc0
	.byte	0x4
	.string	"s9"
	.byte	0x3
	.byte	0x28
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc8
	.byte	0x4
	.string	"s10"
	.byte	0x3
	.byte	0x29
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd0
	.byte	0x4
	.string	"s11"
	.byte	0x3
	.byte	0x2a
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd8
	.byte	0x4
	.string	"t3"
	.byte	0x3
	.byte	0x2b
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe0
	.byte	0x4
	.string	"t4"
	.byte	0x3
	.byte	0x2c
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe8
	.byte	0x4
	.string	"t5"
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf0
	.byte	0x4
	.string	"t6"
	.byte	0x3
	.byte	0x2e
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x3
	.byte	0x30
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x100
	.byte	0x5
	.4byte	.LASF2
	.byte	0x3
	.byte	0x31
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x108
	.byte	0x5
	.4byte	.LASF3
	.byte	0x3
	.byte	0x32
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x110
	.byte	0x5
	.4byte	.LASF4
	.byte	0x3
	.byte	0x34
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x118
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x7
	.4byte	.LASF109
	.byte	0x9
	.byte	0x1a
	.byte	0x18
	.4byte	0x20a
	.byte	0x8
	.byte	0x8
	.4byte	0x1f7
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x9
	.4byte	.LASF8
	.byte	0x40
	.byte	0x4
	.byte	0x1b
	.byte	0x8
	.4byte	0x273
	.byte	0x3
	.4byte	.LASF9
	.byte	0x4
	.byte	0x1d
	.byte	0x8
	.4byte	0x273
	.byte	0
	.byte	0x3
	.4byte	.LASF10
	.byte	0x4
	.byte	0x1e
	.byte	0x8
	.4byte	0x273
	.byte	0x2
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x1f
	.byte	0x8
	.4byte	0x273
	.byte	0x4
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x20
	.byte	0x8
	.4byte	0x273
	.byte	0x6
	.byte	0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x21
	.byte	0xf
	.4byte	0x210
	.byte	0x8
	.byte	0x3
	.4byte	.LASF14
	.byte	0x4
	.byte	0x22
	.byte	0xf
	.4byte	0x27a
	.byte	0xc
	.byte	0
	.byte	0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF15
	.byte	0xa
	.4byte	0x210
	.4byte	0x28a
	.byte	0xb
	.4byte	0x1f7
	.byte	0xc
	.byte	0
	.byte	0x9
	.4byte	.LASF16
	.byte	0x50
	.byte	0x4
	.byte	0x26
	.byte	0x8
	.4byte	0x2d9
	.byte	0x3
	.4byte	.LASF17
	.byte	0x4
	.byte	0x28
	.byte	0xf
	.4byte	0x210
	.byte	0
	.byte	0x3
	.4byte	.LASF18
	.byte	0x4
	.byte	0x29
	.byte	0xf
	.4byte	0x210
	.byte	0x4
	.byte	0x4
	.string	"ref"
	.byte	0x4
	.byte	0x2a
	.byte	0x6
	.4byte	0x2d9
	.byte	0x8
	.byte	0x3
	.4byte	.LASF19
	.byte	0x4
	.byte	0x2b
	.byte	0x6
	.4byte	0x2d9
	.byte	0xc
	.byte	0x3
	.4byte	.LASF20
	.byte	0x4
	.byte	0x2d
	.byte	0x10
	.4byte	0x217
	.byte	0x10
	.byte	0
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF21
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF22
	.byte	0xd
	.4byte	0x2e7
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF23
	.byte	0xe
	.byte	0x7
	.byte	0x4
	.4byte	0x210
	.byte	0x5
	.byte	0xc
	.byte	0x7
	.4byte	0x321
	.byte	0xf
	.4byte	.LASF24
	.byte	0
	.byte	0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0xf
	.4byte	.LASF26
	.byte	0x2
	.byte	0xf
	.4byte	.LASF27
	.byte	0x3
	.byte	0
	.byte	0x9
	.4byte	.LASF28
	.byte	0x28
	.byte	0x5
	.byte	0xa
	.byte	0x8
	.4byte	0x396
	.byte	0x3
	.4byte	.LASF9
	.byte	0x5
	.byte	0xc
	.byte	0x2f
	.4byte	0x2fa
	.byte	0
	.byte	0x3
	.4byte	.LASF29
	.byte	0x5
	.byte	0xd
	.byte	0x6
	.4byte	0x2d9
	.byte	0x4
	.byte	0x3
	.4byte	.LASF30
	.byte	0x5
	.byte	0xe
	.byte	0x7
	.4byte	0x2e7
	.byte	0x8
	.byte	0x3
	.4byte	.LASF31
	.byte	0x5
	.byte	0xf
	.byte	0x7
	.4byte	0x2e7
	.byte	0x9
	.byte	0x4
	.string	"ip"
	.byte	0x5
	.byte	0x10
	.byte	0x10
	.4byte	0x396
	.byte	0x10
	.byte	0x3
	.4byte	.LASF32
	.byte	0x5
	.byte	0x11
	.byte	0xf
	.4byte	0x3f6
	.byte	0x18
	.byte	0x4
	.string	"off"
	.byte	0x5
	.byte	0x12
	.byte	0xf
	.4byte	0x210
	.byte	0x20
	.byte	0x3
	.4byte	.LASF10
	.byte	0x5
	.byte	0x13
	.byte	0x8
	.4byte	0x273
	.byte	0x24
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x28a
	.byte	0x9
	.4byte	.LASF32
	.byte	0x78
	.byte	0x6
	.byte	0xc
	.byte	0x8
	.4byte	0x3f6
	.byte	0x3
	.4byte	.LASF33
	.byte	0x6
	.byte	0xe
	.byte	0x12
	.4byte	0x3fc
	.byte	0
	.byte	0x3
	.4byte	.LASF34
	.byte	0x6
	.byte	0xf
	.byte	0x7
	.4byte	0x76a
	.byte	0x4
	.byte	0x4
	.string	"nrd"
	.byte	0x6
	.byte	0x10
	.byte	0x6
	.4byte	0x2d9
	.byte	0x68
	.byte	0x4
	.string	"nwr"
	.byte	0x6
	.byte	0x11
	.byte	0x6
	.4byte	0x2d9
	.byte	0x6c
	.byte	0x4
	.string	"rd"
	.byte	0x6
	.byte	0x12
	.byte	0x6
	.4byte	0x2d9
	.byte	0x70
	.byte	0x4
	.string	"wr"
	.byte	0x6
	.byte	0x13
	.byte	0x6
	.4byte	0x2d9
	.byte	0x74
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x39c
	.byte	0x9
	.4byte	.LASF35
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.byte	0x8
	.4byte	0x417
	.byte	0x3
	.4byte	.LASF36
	.byte	0x7
	.byte	0x6
	.byte	0xf
	.4byte	0x210
	.byte	0
	.byte	0
	.byte	0x2
	.4byte	.LASF37
	.2byte	0x120
	.byte	0x8
	.byte	0x11
	.byte	0x8
	.4byte	0x5e1
	.byte	0x3
	.4byte	.LASF38
	.byte	0x8
	.byte	0x12
	.byte	0x1b
	.4byte	0x1f7
	.byte	0
	.byte	0x3
	.4byte	.LASF39
	.byte	0x8
	.byte	0x13
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x8
	.byte	0x3
	.4byte	.LASF40
	.byte	0x8
	.byte	0x14
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x10
	.byte	0x4
	.string	"epc"
	.byte	0x8
	.byte	0x15
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x18
	.byte	0x3
	.4byte	.LASF41
	.byte	0x8
	.byte	0x16
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x20
	.byte	0x4
	.string	"ra"
	.byte	0x8
	.byte	0x17
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x28
	.byte	0x4
	.string	"sp"
	.byte	0x8
	.byte	0x18
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x30
	.byte	0x4
	.string	"gp"
	.byte	0x8
	.byte	0x19
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x38
	.byte	0x4
	.string	"tp"
	.byte	0x8
	.byte	0x1a
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x40
	.byte	0x4
	.string	"t0"
	.byte	0x8
	.byte	0x1b
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x48
	.byte	0x4
	.string	"t1"
	.byte	0x8
	.byte	0x1c
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x50
	.byte	0x4
	.string	"t2"
	.byte	0x8
	.byte	0x1d
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x58
	.byte	0x4
	.string	"s0"
	.byte	0x8
	.byte	0x1e
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x60
	.byte	0x4
	.string	"s1"
	.byte	0x8
	.byte	0x1f
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x68
	.byte	0x4
	.string	"a0"
	.byte	0x8
	.byte	0x20
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x70
	.byte	0x4
	.string	"a1"
	.byte	0x8
	.byte	0x21
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x78
	.byte	0x4
	.string	"a2"
	.byte	0x8
	.byte	0x22
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x80
	.byte	0x4
	.string	"a3"
	.byte	0x8
	.byte	0x23
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x88
	.byte	0x4
	.string	"a4"
	.byte	0x8
	.byte	0x24
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x90
	.byte	0x4
	.string	"a5"
	.byte	0x8
	.byte	0x25
	.byte	0x1b
	.4byte	0x1f7
	.byte	0x98
	.byte	0x4
	.string	"a6"
	.byte	0x8
	.byte	0x26
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xa0
	.byte	0x4
	.string	"a7"
	.byte	0x8
	.byte	0x27
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xa8
	.byte	0x4
	.string	"s2"
	.byte	0x8
	.byte	0x28
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xb0
	.byte	0x4
	.string	"s3"
	.byte	0x8
	.byte	0x29
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xb8
	.byte	0x4
	.string	"s4"
	.byte	0x8
	.byte	0x2a
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xc0
	.byte	0x4
	.string	"s5"
	.byte	0x8
	.byte	0x2b
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xc8
	.byte	0x4
	.string	"s6"
	.byte	0x8
	.byte	0x2c
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xd0
	.byte	0x4
	.string	"s7"
	.byte	0x8
	.byte	0x2d
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xd8
	.byte	0x4
	.string	"s8"
	.byte	0x8
	.byte	0x2e
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xe0
	.byte	0x4
	.string	"s9"
	.byte	0x8
	.byte	0x2f
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xe8
	.byte	0x4
	.string	"s10"
	.byte	0x8
	.byte	0x30
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xf0
	.byte	0x4
	.string	"s11"
	.byte	0x8
	.byte	0x31
	.byte	0x1b
	.4byte	0x1f7
	.byte	0xf8
	.byte	0x10
	.string	"t3"
	.byte	0x8
	.byte	0x32
	.byte	0x1b
	.4byte	0x1f7
	.2byte	0x100
	.byte	0x10
	.string	"t4"
	.byte	0x8
	.byte	0x33
	.byte	0x1b
	.4byte	0x1f7
	.2byte	0x108
	.byte	0x10
	.string	"t5"
	.byte	0x8
	.byte	0x34
	.byte	0x1b
	.4byte	0x1f7
	.2byte	0x110
	.byte	0x10
	.string	"t6"
	.byte	0x8
	.byte	0x35
	.byte	0x1b
	.4byte	0x1f7
	.2byte	0x118
	.byte	0
	.byte	0x9
	.4byte	.LASF42
	.byte	0x68
	.byte	0x8
	.byte	0x38
	.byte	0x8
	.4byte	0x68d
	.byte	0x4
	.string	"ra"
	.byte	0x8
	.byte	0x3a
	.byte	0x10
	.4byte	0x1f7
	.byte	0
	.byte	0x4
	.string	"sp"
	.byte	0x8
	.byte	0x3b
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0x4
	.string	"s0"
	.byte	0x8
	.byte	0x3c
	.byte	0x10
	.4byte	0x1f7
	.byte	0x10
	.byte	0x4
	.string	"s1"
	.byte	0x8
	.byte	0x3d
	.byte	0x10
	.4byte	0x1f7
	.byte	0x18
	.byte	0x4
	.string	"s2"
	.byte	0x8
	.byte	0x3e
	.byte	0x10
	.4byte	0x1f7
	.byte	0x20
	.byte	0x4
	.string	"s3"
	.byte	0x8
	.byte	0x3f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x28
	.byte	0x4
	.string	"s4"
	.byte	0x8
	.byte	0x40
	.byte	0x10
	.4byte	0x1f7
	.byte	0x30
	.byte	0x4
	.string	"s5"
	.byte	0x8
	.byte	0x41
	.byte	0x10
	.4byte	0x1f7
	.byte	0x38
	.byte	0x4
	.string	"s7"
	.byte	0x8
	.byte	0x42
	.byte	0x10
	.4byte	0x1f7
	.byte	0x40
	.byte	0x4
	.string	"s8"
	.byte	0x8
	.byte	0x43
	.byte	0x10
	.4byte	0x1f7
	.byte	0x48
	.byte	0x4
	.string	"s9"
	.byte	0x8
	.byte	0x44
	.byte	0x10
	.4byte	0x1f7
	.byte	0x50
	.byte	0x4
	.string	"s10"
	.byte	0x8
	.byte	0x45
	.byte	0x10
	.4byte	0x1f7
	.byte	0x58
	.byte	0x4
	.string	"s11"
	.byte	0x8
	.byte	0x46
	.byte	0x10
	.4byte	0x1f7
	.byte	0x60
	.byte	0
	.byte	0x2
	.4byte	.LASF43
	.2byte	0x100
	.byte	0x8
	.byte	0x49
	.byte	0x8
	.4byte	0x738
	.byte	0x3
	.4byte	.LASF44
	.byte	0x8
	.byte	0x4b
	.byte	0x11
	.4byte	0x20a
	.byte	0
	.byte	0x3
	.4byte	.LASF45
	.byte	0x8
	.byte	0x4c
	.byte	0x8
	.4byte	0x1fe
	.byte	0x8
	.byte	0x3
	.4byte	.LASF37
	.byte	0x8
	.byte	0x4d
	.byte	0x14
	.4byte	0x738
	.byte	0x10
	.byte	0x3
	.4byte	.LASF42
	.byte	0x8
	.byte	0x4e
	.byte	0x11
	.4byte	0x5e1
	.byte	0x18
	.byte	0x3
	.4byte	.LASF46
	.byte	0x8
	.byte	0x4f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x80
	.byte	0x3
	.4byte	.LASF47
	.byte	0x8
	.byte	0x50
	.byte	0x7
	.4byte	0x73e
	.byte	0x88
	.byte	0x3
	.4byte	.LASF48
	.byte	0x8
	.byte	0x51
	.byte	0x6
	.4byte	0x2d9
	.byte	0x94
	.byte	0x4
	.string	"pid"
	.byte	0x8
	.byte	0x52
	.byte	0x6
	.4byte	0x2d9
	.byte	0x98
	.byte	0x3
	.4byte	.LASF49
	.byte	0x8
	.byte	0x53
	.byte	0x6
	.4byte	0x2d9
	.byte	0x9c
	.byte	0x3
	.4byte	.LASF50
	.byte	0x8
	.byte	0x54
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa0
	.byte	0x3
	.4byte	.LASF51
	.byte	0x8
	.byte	0x55
	.byte	0xf
	.4byte	0x74e
	.byte	0xa8
	.byte	0x3
	.4byte	.LASF52
	.byte	0x8
	.byte	0x57
	.byte	0xf
	.4byte	0x754
	.byte	0xb0
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x417
	.byte	0xa
	.4byte	0x2e7
	.4byte	0x74e
	.byte	0xb
	.4byte	0x1f7
	.byte	0x9
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x68d
	.byte	0xa
	.4byte	0x764
	.4byte	0x764
	.byte	0xb
	.4byte	0x1f7
	.byte	0x9
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x321
	.byte	0xa
	.4byte	0x2e7
	.4byte	0x77a
	.byte	0xb
	.4byte	0x1f7
	.byte	0x63
	.byte	0
	.byte	0xa
	.4byte	0x68d
	.4byte	0x78a
	.byte	0xb
	.4byte	0x1f7
	.byte	0x9
	.byte	0
	.byte	0x11
	.4byte	.LASF53
	.byte	0x2
	.byte	0xa
	.byte	0x14
	.4byte	0x77a
	.byte	0x11
	.4byte	.LASF54
	.byte	0x2
	.byte	0xb
	.byte	0x14
	.4byte	0x68d
	.byte	0x11
	.4byte	.LASF55
	.byte	0x2
	.byte	0xc
	.byte	0x15
	.4byte	0x74e
	.byte	0xa
	.4byte	0x1f7
	.4byte	0x7b9
	.byte	0x12
	.byte	0
	.byte	0x11
	.4byte	.LASF56
	.byte	0x2
	.byte	0x12
	.byte	0x16
	.4byte	0x7ae
	.byte	0x9
	.4byte	.LASF57
	.byte	0x10
	.byte	0x2
	.byte	0x16
	.byte	0x8
	.4byte	0x7ed
	.byte	0x3
	.4byte	.LASF58
	.byte	0x2
	.byte	0x17
	.byte	0x9
	.4byte	0x808
	.byte	0
	.byte	0x3
	.4byte	.LASF59
	.byte	0x2
	.byte	0x18
	.byte	0x8
	.4byte	0x80e
	.byte	0x8
	.byte	0
	.byte	0xd
	.4byte	0x7c5
	.byte	0x13
	.4byte	0x802
	.byte	0x14
	.4byte	0x802
	.byte	0x14
	.4byte	0x1f7
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x2d
	.byte	0x8
	.byte	0x8
	.4byte	0x7f2
	.byte	0x8
	.byte	0x8
	.4byte	0x2e7
	.byte	0x15
	.4byte	.LASF60
	.byte	0x2
	.byte	0x25
	.byte	0xf
	.4byte	0x1f7
	.byte	0x9
	.byte	0x3
	.8byte	systicks
	.byte	0x15
	.4byte	.LASF61
	.byte	0x2
	.byte	0x26
	.byte	0x11
	.4byte	0x3fc
	.byte	0x9
	.byte	0x3
	.8byte	systicks_lock
	.byte	0xa
	.4byte	0x7ed
	.4byte	0x850
	.byte	0xb
	.4byte	0x1f7
	.byte	0xf
	.byte	0
	.byte	0xd
	.4byte	0x840
	.byte	0x16
	.4byte	.LASF57
	.byte	0x2
	.byte	0x28
	.byte	0x20
	.4byte	0x850
	.byte	0x9
	.byte	0x3
	.8byte	fault_info
	.byte	0xa
	.4byte	0x87b
	.4byte	0x87b
	.byte	0xb
	.4byte	0x1f7
	.byte	0x20
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x881
	.byte	0x17
	.4byte	0x1f7
	.byte	0x16
	.4byte	.LASF62
	.byte	0x2
	.byte	0x3b
	.byte	0x18
	.4byte	0x86b
	.byte	0x9
	.byte	0x3
	.8byte	syscall
	.byte	0x18
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x161
	.byte	0x5
	.4byte	0x2d9
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x920
	.byte	0x19
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x163
	.byte	0xe
	.4byte	0x920
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x19
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x164
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x19
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x166
	.byte	0x10
	.4byte	0x396
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x167
	.byte	0xf
	.4byte	0x764
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1a
	.string	"fd"
	.byte	0x2
	.2byte	0x168
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x19
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x16a
	.byte	0x8
	.4byte	0x926
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7c
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x2ee
	.byte	0xa
	.4byte	0x80e
	.4byte	0x936
	.byte	0xb
	.4byte	0x1f7
	.byte	0x31
	.byte	0
	.byte	0x18
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x14c
	.byte	0x5
	.4byte	0x2d9
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0x999
	.byte	0x1a
	.string	"fd"
	.byte	0x2
	.2byte	0x14e
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x19
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x14f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1a
	.string	"len"
	.byte	0x2
	.2byte	0x150
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x19
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x152
	.byte	0xf
	.4byte	0x764
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x18
	.4byte	.LASF72
	.byte	0x2
	.2byte	0x136
	.byte	0x5
	.4byte	0x2d9
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x9fc
	.byte	0x1a
	.string	"fd"
	.byte	0x2
	.2byte	0x138
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x19
	.4byte	.LASF70
	.byte	0x2
	.2byte	0x139
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1a
	.string	"len"
	.byte	0x2
	.2byte	0x13a
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x19
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x13c
	.byte	0xf
	.4byte	0x764
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x18
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x121
	.byte	0x5
	.4byte	0x2d9
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0xa5d
	.byte	0x19
	.4byte	.LASF74
	.byte	0x2
	.2byte	0x123
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.string	"f0"
	.byte	0x2
	.2byte	0x125
	.byte	0xf
	.4byte	0x764
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1a
	.string	"f1"
	.byte	0x2
	.2byte	0x126
	.byte	0xf
	.4byte	0x764
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1a
	.string	"fd"
	.byte	0x2
	.2byte	0x129
	.byte	0x6
	.4byte	0xa5d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0xa
	.4byte	0x2d9
	.4byte	0xa6d
	.byte	0xb
	.4byte	0x1f7
	.byte	0x1
	.byte	0
	.byte	0x18
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x114
	.byte	0x5
	.4byte	0x2d9
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0xab1
	.byte	0x19
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x116
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x19
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x118
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x18
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x10e
	.byte	0x5
	.4byte	0x2d9
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0xae5
	.byte	0x19
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x110
	.byte	0x8
	.4byte	0x80e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1b
	.4byte	.LASF110
	.byte	0x2
	.2byte	0x109
	.byte	0x5
	.4byte	0x2d9
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.byte	0x18
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x100
	.byte	0xf
	.4byte	0x1f7
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0xb36
	.byte	0x1a
	.string	"c"
	.byte	0x2
	.2byte	0x102
	.byte	0x7
	.4byte	0x2e7
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x1c
	.4byte	.LASF93
	.byte	0x2
	.byte	0xfa
	.byte	0x6
	.8byte	.LFB33
	.8byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.byte	0x1d
	.4byte	.LASF83
	.byte	0x2
	.byte	0xdf
	.byte	0x6
	.8byte	.LFB32
	.8byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.4byte	0xba9
	.byte	0x16
	.4byte	.LASF80
	.byte	0x2
	.byte	0xe3
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1e
	.string	"x"
	.byte	0x2
	.byte	0xe7
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x16
	.4byte	.LASF81
	.byte	0x2
	.byte	0xf5
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x16
	.4byte	.LASF82
	.byte	0x2
	.byte	0xf6
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x1d
	.4byte	.LASF84
	.byte	0x2
	.byte	0x9d
	.byte	0x6
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0xc04
	.byte	0x16
	.4byte	.LASF85
	.byte	0x2
	.byte	0x9f
	.byte	0x7
	.4byte	0x2e7
	.byte	0x2
	.byte	0x91
	.byte	0x4f
	.byte	0x16
	.4byte	.LASF86
	.byte	0x2
	.byte	0xa0
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x16
	.4byte	.LASF87
	.byte	0x2
	.byte	0xa1
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x16
	.4byte	.LASF88
	.byte	0x2
	.byte	0xa2
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x1f
	.4byte	.LASF89
	.byte	0x2
	.byte	0x93
	.byte	0x6
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0xc32
	.byte	0x20
	.4byte	.LASF91
	.byte	0x2
	.byte	0x93
	.byte	0x20
	.4byte	0x802
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1f
	.4byte	.LASF90
	.byte	0x2
	.byte	0x53
	.byte	0x6
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0xc7e
	.byte	0x20
	.4byte	.LASF91
	.byte	0x2
	.byte	0x53
	.byte	0x2f
	.4byte	0x802
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x20
	.4byte	.LASF92
	.byte	0x2
	.byte	0x53
	.byte	0x46
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x16
	.4byte	.LASF86
	.byte	0x2
	.byte	0x55
	.byte	0x6
	.4byte	0x2d9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x1c
	.4byte	.LASF94
	.byte	0x2
	.byte	0x47
	.byte	0x6
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.4byte	.LASF95
	.byte	0x1
	.byte	0xfe
	.byte	0x14
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.4byte	.LASF96
	.byte	0x1
	.byte	0xf9
	.byte	0x14
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.byte	0x22
	.4byte	.LASF97
	.byte	0x1
	.byte	0xbc
	.byte	0x1d
	.4byte	0x1f7
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0xcfc
	.byte	0x1e
	.string	"x"
	.byte	0x1
	.byte	0xbe
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF98
	.byte	0x1
	.byte	0xb1
	.byte	0x1d
	.4byte	0x1f7
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0xd2c
	.byte	0x1e
	.string	"x"
	.byte	0x1
	.byte	0xb3
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x23
	.4byte	.LASF99
	.byte	0x1
	.byte	0x9e
	.byte	0x14
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xd58
	.byte	0x24
	.string	"x"
	.byte	0x1
	.byte	0x9e
	.byte	0x28
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x23
	.4byte	.LASF100
	.byte	0x1
	.byte	0x76
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xd84
	.byte	0x24
	.string	"x"
	.byte	0x1
	.byte	0x76
	.byte	0x28
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x23
	.4byte	.LASF101
	.byte	0x1
	.byte	0x6e
	.byte	0x14
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xdb0
	.byte	0x24
	.string	"x"
	.byte	0x1
	.byte	0x6e
	.byte	0x2a
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x23
	.4byte	.LASF102
	.byte	0x1
	.byte	0x66
	.byte	0x14
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xddc
	.byte	0x24
	.string	"x"
	.byte	0x1
	.byte	0x66
	.byte	0x2c
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF103
	.byte	0x1
	.byte	0x54
	.byte	0x1d
	.4byte	0x1f7
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0xe0c
	.byte	0x1e
	.string	"x"
	.byte	0x1
	.byte	0x56
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x23
	.4byte	.LASF104
	.byte	0x1
	.byte	0x4c
	.byte	0x14
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0xe38
	.byte	0x24
	.string	"x"
	.byte	0x1
	.byte	0x4c
	.byte	0x29
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF105
	.byte	0x1
	.byte	0x3a
	.byte	0x1d
	.4byte	0x1f7
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0xe68
	.byte	0x1e
	.string	"x"
	.byte	0x1
	.byte	0x3c
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x25
	.4byte	.LASF111
	.byte	0x1
	.byte	0x1c
	.byte	0x1d
	.4byte	0x1f7
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x1e
	.string	"x"
	.byte	0x1
	.byte	0x1e
	.byte	0x10
	.4byte	0x1f7
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
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
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
.LASF61:
	.string	"systicks_lock"
.LASF55:
	.string	"proc_ptr"
.LASF77:
	.string	"tick_st"
.LASF29:
	.string	"ref_cnt"
.LASF58:
	.string	"fault_handler"
.LASF81:
	.string	"satp"
.LASF9:
	.string	"type"
.LASF38:
	.string	"kernel_satp"
.LASF108:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF32:
	.string	"pipe"
.LASF91:
	.string	"reg_ptr"
.LASF92:
	.string	"s_cause"
.LASF59:
	.string	"fault_name"
.LASF94:
	.string	"src_trap_init"
.LASF46:
	.string	"prog_size"
.LASF35:
	.string	"spinlock"
.LASF98:
	.string	"r_sie"
.LASF4:
	.string	"orig_a0"
.LASF51:
	.string	"parent"
.LASF48:
	.string	"state"
.LASF97:
	.string	"r_sip"
.LASF70:
	.string	"va_addr"
.LASF24:
	.string	"FD_NONE"
.LASF101:
	.string	"w_stvec"
.LASF53:
	.string	"proc_list"
.LASF26:
	.string	"FD_INODE"
.LASF18:
	.string	"ninode"
.LASF109:
	.string	"pgt_t"
.LASF76:
	.string	"interval"
.LASF7:
	.string	"pt_regs"
.LASF74:
	.string	"fd_arr"
.LASF85:
	.string	"input_char"
.LASF56:
	.string	"_pgt_start"
.LASF100:
	.string	"w_sie"
.LASF6:
	.string	"unsigned int"
.LASF90:
	.string	"smode_exeception_handler"
.LASF43:
	.string	"proc"
.LASF11:
	.string	"minor"
.LASF88:
	.string	"trap_cause"
.LASF5:
	.string	"long unsigned int"
.LASF25:
	.string	"FD_PIPE"
.LASF45:
	.string	"proc_pagetable"
.LASF47:
	.string	"name"
.LASF82:
	.string	"trampoline_userret"
.LASF30:
	.string	"readable"
.LASF89:
	.string	"show_regs"
.LASF34:
	.string	"data"
.LASF13:
	.string	"size"
.LASF21:
	.string	"short unsigned int"
.LASF40:
	.string	"kernel_trap"
.LASF12:
	.string	"nlink"
.LASF52:
	.string	"ofile"
.LASF106:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF50:
	.string	"sleep_chan"
.LASF107:
	.string	"src/src_trap.c"
.LASF110:
	.string	"sys_fork"
.LASF96:
	.string	"intr_off"
.LASF14:
	.string	"data_address"
.LASF49:
	.string	"killed"
.LASF27:
	.string	"FD_DEVICE"
.LASF39:
	.string	"kernel_sp"
.LASF37:
	.string	"trapframe"
.LASF73:
	.string	"sys_pipe"
.LASF104:
	.string	"w_sepc"
.LASF20:
	.string	"content"
.LASF66:
	.string	"open_file"
.LASF79:
	.string	"sys_print"
.LASF57:
	.string	"fault_info"
.LASF36:
	.string	"locked"
.LASF68:
	.string	"sys_open"
.LASF60:
	.string	"systicks"
.LASF103:
	.string	"r_sepc"
.LASF75:
	.string	"sys_sleep"
.LASF93:
	.string	"back_to_kernel"
.LASF80:
	.string	"trampoline_uservec"
.LASF16:
	.string	"inode"
.LASF44:
	.string	"kstack"
.LASF62:
	.string	"syscall"
.LASF65:
	.string	"file_inode"
.LASF63:
	.string	"pathname"
.LASF71:
	.string	"which_file"
.LASF23:
	.string	"unsigned char"
.LASF15:
	.string	"short int"
.LASF69:
	.string	"sys_read"
.LASF28:
	.string	"file"
.LASF72:
	.string	"sys_write"
.LASF84:
	.string	"user_trap"
.LASF2:
	.string	"sbadaddr"
.LASF3:
	.string	"scause"
.LASF19:
	.string	"valid"
.LASF78:
	.string	"sys_exec"
.LASF22:
	.string	"char"
.LASF0:
	.string	"sepc"
.LASF31:
	.string	"writable"
.LASF17:
	.string	"ndev"
.LASF99:
	.string	"w_sip"
.LASF42:
	.string	"context"
.LASF8:
	.string	"dinode"
.LASF67:
	.string	"path"
.LASF105:
	.string	"r_scause"
.LASF87:
	.string	"syscall_num"
.LASF83:
	.string	"user_trap_ret"
.LASF86:
	.string	"ex_int_irq"
.LASF102:
	.string	"w_sstatus"
.LASF111:
	.string	"r_sstatus"
.LASF1:
	.string	"sstatus"
.LASF64:
	.string	"flags"
.LASF41:
	.string	"kernel_hartid"
.LASF54:
	.string	"kernel_ctxt"
.LASF10:
	.string	"major"
.LASF33:
	.string	"lock"
.LASF95:
	.string	"intr_on"
	.ident	"GCC: () 9.3.0"
