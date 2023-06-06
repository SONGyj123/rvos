	.file	"proc.c"
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
	.globl	pid
	.section	.sbss,"aw",@nobits
	.align	2
	.type	pid, @object
	.size	pid, 4
pid:
	.zero	4
	.comm	proc_list,2560,8
	.comm	kernel_ctxt,256,8
	.globl	proc_ptr
	.section	.sdata,"aw"
	.align	3
	.type	proc_ptr, @object
	.size	proc_ptr, 8
proc_ptr:
	.dword	kernel_ctxt
	.globl	initcode
	.data
	.align	3
	.type	initcode, @object
	.size	initcode, 24
initcode:
	.string	"\023\005\020\003\223\b"
	.string	"\002s"
	.string	""
	.string	""
	.string	"\023\005\002"
	.string	"\223\b "
	.string	"s"
	.string	""
	.string	""
	.section	.rodata
	.align	3
.LC0:
	.string	"kalloc"
	.text
	.align	2
	.globl	init_proc_kstack
	.type	init_proc_kstack, @function
init_proc_kstack:
.LFB28:
	.file 2 "src/proc.c"
	.loc 2 34 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	.loc 2 35 15
	lla	a5,proc_list
	sd	a5,-24(s0)
	.loc 2 37 6
	sw	zero,-28(s0)
	.loc 2 39 7
	sw	zero,-28(s0)
	.loc 2 39 2
	j	.L6
.L9:
	.loc 2 41 16
	call	kalloc
	sd	a0,-40(s0)
	.loc 2 42 5
	ld	a5,-40(s0)
	beqz	a5,.L7
	.loc 2 44 4
	ld	a1,-40(s0)
	.loc 2 44 66
	lw	a5,-28(s0)
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 2 44 62
	li	a5,3
	slli	a5,a5,32
	sub	a5,a5,a4
	.loc 2 44 4
	li	a4,14
	li	a3,1
	mv	a2,a5
	ld	a0,-56(s0)
	call	map_page
	.loc 2 45 56
	lw	a5,-28(s0)
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 2 45 62
	li	a5,3145728
	addi	a5,a5,1
	slli	a5,a5,12
	sub	a5,a5,a4
	.loc 2 45 23
	mv	a4,a5
	.loc 2 45 21
	ld	a5,-24(s0)
	sd	a4,0(a5)
	.loc 2 46 20
	ld	a5,-24(s0)
	sw	zero,148(a5)
	j	.L8
.L7:
	.loc 2 50 4
	lla	a0,.LC0
	call	panic
.L8:
	.loc 2 53 11 discriminator 2
	ld	a5,-24(s0)
	addi	a5,a5,256
	sd	a5,-24(s0)
	.loc 2 39 18 discriminator 2
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L6:
	.loc 2 39 2 discriminator 1
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L9
	.loc 2 55 1
	nop
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	init_proc_kstack, .-init_proc_kstack
	.align	2
	.globl	proc_pagetable
	.type	proc_pagetable, @function
proc_pagetable:
.LFB29:
	.loc 2 59 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 62 14
	call	kalloc
	sd	a0,-24(s0)
	.loc 2 64 4
	ld	a5,-24(s0)
	bnez	a5,.L11
	.loc 2 66 10
	li	a5,0
	j	.L12
.L11:
	.loc 2 69 9
	ld	a5,-24(s0)
.L12:
	.loc 2 70 1
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
.LFE29:
	.size	proc_pagetable, .-proc_pagetable
	.align	2
	.globl	fork_ret
	.type	fork_ret, @function
fork_ret:
.LFB30:
	.loc 2 74 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 76 5
	lla	a5,flag.1379
	lw	a5,0(a5)
	.loc 2 76 4
	bnez	a5,.L14
	.loc 2 78 3
	call	fs_init
	.loc 2 79 8
	lla	a5,flag.1379
	li	a4,1
	sw	a4,0(a5)
.L14:
	.loc 2 81 2
	call	user_trap_ret
	.loc 2 82 1
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
.LFE30:
	.size	fork_ret, .-fork_ret
	.align	2
	.globl	user_init
	.type	user_init, @function
user_init:
.LFB31:
	.loc 2 86 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 89 11
	lla	a5,proc_ptr
	lla	a4,proc_list
	sd	a4,0(a5)
	.loc 2 92 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 92 27
	lla	a4,_sec_pgt_start
	sd	a4,8(a5)
	.loc 2 93 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 93 16
	lla	a4,pid
	lw	a4,0(a4)
	sw	a4,152(a5)
	.loc 2 94 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 94 18
	li	a4,2
	sw	a4,148(a5)
	.loc 2 96 18
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 96 9
	addi	a5,a5,24
	.loc 2 96 2
	li	a2,104
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 99 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 99 25
	lla	a4,fork_ret
	.loc 2 99 23
	sd	a4,24(a5)
	.loc 2 100 48
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a4,0(a5)
	.loc 2 100 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 100 23
	sd	a4,32(a5)
	.loc 2 101 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 101 22
	li	a4,1
	sd	a4,128(a5)
	.loc 2 103 8
	call	kalloc
	sd	a0,-24(s0)
	.loc 2 105 19
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 105 2
	ld	a0,8(a5)
	lla	a1,_trampoline
	li	a4,14
	li	a3,1
	li	a5,67108864
	addi	a5,a5,-1
	slli	a2,a5,12
	call	map_page
	.loc 2 106 19
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 106 2
	ld	a5,8(a5)
	ld	a1,-24(s0)
	li	a4,30
	li	a3,1
	li	a2,0
	mv	a0,a5
	call	map_page
	.loc 2 107 2
	li	a2,24
	lla	a1,initcode
	ld	a0,-24(s0)
	call	memmove
	.loc 2 109 33
	call	kalloc
	sd	a0,-32(s0)
	.loc 2 110 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 110 22
	ld	a4,-32(s0)
	sd	a4,16(a5)
	.loc 2 111 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 111 27
	sd	zero,24(a5)
	.loc 2 112 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 112 26
	li	a4,4096
	sd	a4,48(a5)
	.loc 2 114 19
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 114 2
	ld	a0,8(a5)
	.loc 2 114 60
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,16(a5)
	.loc 2 114 2
	mv	a1,a5
	li	a4,14
	li	a3,1
	li	a5,33554432
	addi	a5,a5,-1
	slli	a2,a5,13
	call	map_page
	.loc 2 115 1
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
	.size	user_init, .-user_init
	.align	2
	.globl	scheduler
	.type	scheduler, @function
scheduler:
.LFB32:
	.loc 2 119 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 120 15
	lla	a5,kernel_ctxt
	sd	a5,-32(s0)
.L20:
	.loc 2 124 3
	call	intr_on
	.loc 2 125 12
	lla	a5,proc_ptr
	lla	a4,proc_list
	sd	a4,0(a5)
.LBB2:
	.loc 2 126 11
	sw	zero,-20(s0)
	.loc 2 126 3
	j	.L17
.L19:
	.loc 2 128 15
	lla	a5,proc_ptr
	ld	a5,0(a5)
	lw	a5,148(a5)
	.loc 2 128 6
	mv	a4,a5
	li	a5,2
	bne	a4,a5,.L18
	.loc 2 130 13
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 130 21
	li	a4,3
	sw	a4,148(a5)
	.loc 2 131 5
	ld	a5,-32(s0)
	addi	a4,a5,24
	.loc 2 131 42
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 131 5
	addi	a5,a5,24
	mv	a1,a5
	mv	a0,a4
	call	swtch
.L18:
	.loc 2 134 12 discriminator 2
	lla	a5,proc_ptr
	ld	a5,0(a5)
	addi	a4,a5,256
	lla	a5,proc_ptr
	sd	a4,0(a5)
	.loc 2 126 23 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L17:
	.loc 2 126 3 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L19
.LBE2:
	.loc 2 124 3
	j	.L20
	.cfi_endproc
.LFE32:
	.size	scheduler, .-scheduler
	.align	2
	.globl	sched
	.type	sched, @function
sched:
.LFB33:
	.loc 2 140 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 141 15
	lla	a5,kernel_ctxt
	sd	a5,-24(s0)
	.loc 2 143 17
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 143 2
	addi	a4,a5,24
	ld	a5,-24(s0)
	addi	a5,a5,24
	mv	a1,a5
	mv	a0,a4
	call	swtch
	.loc 2 144 1
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
.LFE33:
	.size	sched, .-sched
	.section	.rodata
	.align	3
.LC1:
	.string	"pte == 0\n"
	.text
	.align	2
	.globl	fork
	.type	fork, @function
fork:
.LFB34:
	.loc 2 148 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
.LBB3:
	.loc 2 155 10
	sw	zero,-20(s0)
	.loc 2 155 2
	j	.L23
.L26:
	.loc 2 157 18
	lla	a4,proc_list
	lw	a5,-20(s0)
	slli	a5,a5,8
	add	a5,a4,a5
	lw	a5,148(a5)
	.loc 2 157 5
	bnez	a5,.L24
	.loc 2 159 17
	lw	a5,-20(s0)
	slli	a4,a5,8
	lla	a5,proc_list
	add	a5,a4,a5
	sd	a5,-40(s0)
	.loc 2 160 4
	nop
.L25:
.LBE3:
	.loc 2 167 22
	lla	a5,pid
	lw	a5,0(a5)
	addiw	a5,a5,1
	sext.w	a4,a5
	.loc 2 167 20
	lla	a5,pid
	sw	a4,0(a5)
	lla	a5,pid
	lw	a4,0(a5)
	ld	a5,-40(s0)
	sw	a4,152(a5)
	.loc 2 168 22
	ld	a5,-40(s0)
	li	a4,1
	sw	a4,148(a5)
	.loc 2 170 33
	call	proc_pagetable
	mv	a4,a0
	.loc 2 170 31
	ld	a5,-40(s0)
	sd	a4,8(a5)
	.loc 2 171 28
	call	kalloc
	mv	a4,a0
	.loc 2 171 26
	ld	a5,-40(s0)
	sd	a4,16(a5)
	.loc 2 172 2
	ld	a5,-40(s0)
	ld	a0,8(a5)
	lla	a1,_trampoline
	li	a4,14
	li	a3,1
	li	a5,67108864
	addi	a5,a5,-1
	slli	a2,a5,12
	call	map_page
	.loc 2 173 2
	ld	a5,-40(s0)
	ld	a0,8(a5)
	.loc 2 173 53
	ld	a5,-40(s0)
	ld	a5,16(a5)
	.loc 2 173 2
	mv	a1,a5
	li	a4,6
	li	a3,1
	li	a5,33554432
	addi	a5,a5,-1
	slli	a2,a5,13
	call	map_page
	.loc 2 175 29
	lla	a4,fork_ret
	.loc 2 175 27
	ld	a5,-40(s0)
	sd	a4,24(a5)
	.loc 2 176 56
	ld	a5,-40(s0)
	ld	a5,0(a5)
	.loc 2 176 29
	mv	a4,a5
	.loc 2 176 27
	ld	a5,-40(s0)
	sd	a4,32(a5)
	.loc 2 178 41
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a4,16(a5)
	.loc 2 178 16
	ld	a5,-40(s0)
	ld	a5,16(a5)
	.loc 2 178 29
	mv	a3,a5
	li	a5,288
	mv	a2,a5
	mv	a1,a4
	mv	a0,a3
	call	memcpy
	.loc 2 179 14
	ld	a5,-40(s0)
	ld	a5,16(a5)
	.loc 2 179 30
	sd	zero,112(a5)
	.loc 2 180 36
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a4,128(a5)
	.loc 2 180 26
	ld	a5,-40(s0)
	sd	a4,128(a5)
.LBB4:
	.loc 2 183 10
	sw	zero,-24(s0)
	.loc 2 183 2
	j	.L28
.L24:
.LBE4:
.LBB5:
	.loc 2 155 22 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L23:
	.loc 2 155 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L26
.LBE5:
	.loc 2 164 9
	li	a5,-1
	j	.L27
.L30:
.LBB6:
	.loc 2 185 22
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 185 9
	ld	a5,8(a5)
	lw	a4,-24(s0)
	li	a2,0
	mv	a1,a4
	mv	a0,a5
	call	walk
	sd	a0,-48(s0)
	.loc 2 186 6
	ld	a5,-48(s0)
	ld	a5,0(a5)
	.loc 2 186 5
	bnez	a5,.L29
	.loc 2 188 4
	lla	a0,.LC1
	call	panic
.L29:
	.loc 2 190 8 discriminator 2
	ld	a5,-48(s0)
	ld	a5,0(a5)
	.loc 2 190 29 discriminator 2
	srli	a5,a5,10
	.loc 2 190 6 discriminator 2
	slli	a5,a5,12
	sd	a5,-56(s0)
	.loc 2 191 14 discriminator 2
	call	kalloc
	sd	a0,-64(s0)
	.loc 2 192 3 discriminator 2
	ld	a5,-56(s0)
	li	a2,4096
	mv	a1,a5
	ld	a0,-64(s0)
	call	memmove
	.loc 2 193 3 discriminator 2
	ld	a5,-40(s0)
	ld	a5,8(a5)
	ld	a1,-64(s0)
	lw	a2,-24(s0)
	li	a4,30
	li	a3,1
	mv	a0,a5
	call	map_page
	.loc 2 183 39 discriminator 2
	lw	a4,-24(s0)
	li	a5,4096
	addw	a5,a4,a5
	sw	a5,-24(s0)
.L28:
	.loc 2 183 16 discriminator 1
	lw	a4,-24(s0)
	.loc 2 183 25 discriminator 1
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,128(a5)
	.loc 2 183 2 discriminator 1
	bltu	a4,a5,.L30
.LBE6:
.LBB7:
	.loc 2 196 10
	sw	zero,-28(s0)
	.loc 2 196 2
	j	.L31
.L32:
	.loc 2 198 36 discriminator 3
	lla	a5,proc_ptr
	ld	a4,0(a5)
	.loc 2 198 43 discriminator 3
	lw	a5,-28(s0)
	addi	a5,a5,22
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,0(a5)
	.loc 2 198 26 discriminator 3
	ld	a3,-40(s0)
	lw	a5,-28(s0)
	addi	a5,a5,22
	slli	a5,a5,3
	add	a5,a3,a5
	sd	a4,0(a5)
	.loc 2 196 22 discriminator 3
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L31:
	.loc 2 196 2 discriminator 1
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L32
.LBE7:
	.loc 2 201 23
	lla	a5,proc_ptr
	ld	a4,0(a5)
	ld	a5,-40(s0)
	sd	a4,168(a5)
	.loc 2 202 22
	ld	a5,-40(s0)
	li	a4,2
	sw	a4,148(a5)
	.loc 2 204 9
	lla	a5,pid
	lw	a5,0(a5)
.L27:
	.loc 2 205 1
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
.LFE34:
	.size	fork, .-fork
	.align	2
	.globl	exit
	.type	exit, @function
exit:
.LFB35:
	.loc 2 208 1
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
.LBB8:
	.loc 2 210 10
	sw	zero,-20(s0)
	.loc 2 210 2
	j	.L34
.L36:
	.loc 2 212 14
	lla	a5,proc_ptr
	ld	a4,0(a5)
	.loc 2 212 21
	lw	a5,-20(s0)
	addi	a5,a5,22
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 2 212 5
	beqz	a5,.L35
	.loc 2 215 23
	lla	a5,proc_ptr
	ld	a4,0(a5)
	.loc 2 215 4
	lw	a5,-20(s0)
	addi	a5,a5,22
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	mv	a0,a5
	call	file_close
	.loc 2 216 12
	lla	a5,proc_ptr
	ld	a4,0(a5)
	.loc 2 216 24
	lw	a5,-20(s0)
	addi	a5,a5,22
	slli	a5,a5,3
	add	a5,a4,a5
	sd	zero,0(a5)
.L35:
	.loc 2 210 25 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L34:
	.loc 2 210 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L36
.LBE8:
	.loc 2 221 17
	lla	a5,proc_ptr
	ld	a5,0(a5)
	ld	a5,168(a5)
	.loc 2 221 2
	mv	a0,a5
	call	wakeup
	.loc 2 224 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 224 18
	li	a4,5
	sw	a4,148(a5)
	.loc 2 227 2
	call	sched
	.loc 2 229 1
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
.LFE35:
	.size	exit, .-exit
	.align	2
	.globl	wait
	.type	wait, @function
wait:
.LFB36:
	.loc 2 232 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 233 9
	li	a5,0
	.loc 2 234 1
	mv	a0,a5
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE36:
	.size	wait, .-wait
	.align	2
	.globl	kill
	.type	kill, @function
kill:
.LFB37:
	.loc 2 237 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 2 240 9
	lla	a5,proc_list
	sd	a5,-24(s0)
	.loc 2 240 2
	j	.L40
.L43:
	.loc 2 242 9
	ld	a5,-24(s0)
	lw	a4,152(a5)
	.loc 2 242 5
	lw	a5,-36(s0)
	sext.w	a5,a5
	bne	a5,a4,.L41
	.loc 2 244 16
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,156(a5)
	.loc 2 245 11
	li	a5,0
	j	.L42
.L41:
	.loc 2 240 44 discriminator 2
	ld	a5,-24(s0)
	addi	a5,a5,256
	sd	a5,-24(s0)
.L40:
	.loc 2 240 2 discriminator 1
	ld	a4,-24(s0)
	lla	a5,proc_list+2560
	bltu	a4,a5,.L43
	.loc 2 249 9
	li	a5,-1
.L42:
	.loc 2 250 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE37:
	.size	kill, .-kill
	.align	2
	.globl	sleep
	.type	sleep, @function
sleep:
.LFB38:
	.loc 2 253 1
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
	sd	a1,-32(s0)
	.loc 2 254 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 254 18
	li	a4,4
	sw	a4,148(a5)
	.loc 2 255 10
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 2 255 25
	ld	a4,-24(s0)
	.loc 2 255 23
	sd	a4,160(a5)
	.loc 2 256 2
	ld	a0,-32(s0)
	call	release
	.loc 2 257 2
	call	sched
	.loc 2 258 2
	ld	a0,-32(s0)
	call	acquire
	.loc 2 259 1
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
.LFE38:
	.size	sleep, .-sleep
	.align	2
	.globl	wakeup
	.type	wakeup, @function
wakeup:
.LFB39:
	.loc 2 262 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
.LBB9:
	.loc 2 263 10
	sw	zero,-20(s0)
	.loc 2 263 2
	j	.L46
.L48:
	.loc 2 265 19
	lla	a4,proc_list
	lw	a5,-20(s0)
	slli	a5,a5,8
	add	a5,a4,a5
	lw	a5,148(a5)
	.loc 2 265 5
	mv	a4,a5
	li	a5,4
	bne	a4,a5,.L47
	.loc 2 265 48 discriminator 1
	lla	a4,proc_list
	lw	a5,-20(s0)
	slli	a5,a5,8
	add	a5,a4,a5
	ld	a4,160(a5)
	.loc 2 265 63 discriminator 1
	ld	a5,-40(s0)
	.loc 2 265 32 discriminator 1
	bne	a4,a5,.L47
	.loc 2 267 23
	lla	a4,proc_list
	lw	a5,-20(s0)
	slli	a5,a5,8
	add	a5,a4,a5
	li	a4,2
	sw	a4,148(a5)
	.loc 2 268 28
	lla	a4,proc_list
	lw	a5,-20(s0)
	slli	a5,a5,8
	add	a5,a4,a5
	sd	zero,160(a5)
.L47:
	.loc 2 263 22 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L46:
	.loc 2 263 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L48
.LBE9:
	.loc 2 271 1
	nop
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE39:
	.size	wakeup, .-wakeup
	.local	flag.1379
	.comm	flag.1379,4,4
.Letext0:
	.file 3 "include/def.h"
	.file 4 "src/fs.h"
	.file 5 "src/fd.h"
	.file 6 "src/locks.h"
	.file 7 "src/proc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xa7e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF82
	.byte	0xc
	.4byte	.LASF83
	.4byte	.LASF84
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF0
	.byte	0x3
	.byte	0x1a
	.byte	0x18
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	0x3f
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.4byte	.LASF1
	.byte	0x3
	.byte	0x1b
	.byte	0x17
	.4byte	0x3f
	.byte	0x5
	.4byte	.LASF12
	.byte	0x20
	.byte	0x4
	.byte	0xe
	.byte	0x8
	.4byte	0xc8
	.byte	0x6
	.4byte	.LASF2
	.byte	0x4
	.byte	0x10
	.byte	0xf
	.4byte	0xc8
	.byte	0
	.byte	0x6
	.4byte	.LASF3
	.byte	0x4
	.byte	0x11
	.byte	0xf
	.4byte	0xc8
	.byte	0x4
	.byte	0x6
	.4byte	.LASF4
	.byte	0x4
	.byte	0x12
	.byte	0xf
	.4byte	0xc8
	.byte	0x8
	.byte	0x6
	.4byte	.LASF5
	.byte	0x4
	.byte	0x13
	.byte	0xf
	.4byte	0xc8
	.byte	0xc
	.byte	0x6
	.4byte	.LASF6
	.byte	0x4
	.byte	0x14
	.byte	0xf
	.4byte	0xc8
	.byte	0x10
	.byte	0x6
	.4byte	.LASF7
	.byte	0x4
	.byte	0x15
	.byte	0xf
	.4byte	0xc8
	.byte	0x14
	.byte	0x6
	.4byte	.LASF8
	.byte	0x4
	.byte	0x16
	.byte	0xf
	.4byte	0xc8
	.byte	0x18
	.byte	0x6
	.4byte	.LASF9
	.byte	0x4
	.byte	0x17
	.byte	0xf
	.4byte	0xc8
	.byte	0x1c
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.byte	0x5
	.4byte	.LASF13
	.byte	0x40
	.byte	0x4
	.byte	0x1b
	.byte	0x8
	.4byte	0x12b
	.byte	0x6
	.4byte	.LASF14
	.byte	0x4
	.byte	0x1d
	.byte	0x8
	.4byte	0x12b
	.byte	0
	.byte	0x6
	.4byte	.LASF15
	.byte	0x4
	.byte	0x1e
	.byte	0x8
	.4byte	0x12b
	.byte	0x2
	.byte	0x6
	.4byte	.LASF16
	.byte	0x4
	.byte	0x1f
	.byte	0x8
	.4byte	0x12b
	.byte	0x4
	.byte	0x6
	.4byte	.LASF17
	.byte	0x4
	.byte	0x20
	.byte	0x8
	.4byte	0x12b
	.byte	0x6
	.byte	0x6
	.4byte	.LASF3
	.byte	0x4
	.byte	0x21
	.byte	0xf
	.4byte	0xc8
	.byte	0x8
	.byte	0x6
	.4byte	.LASF18
	.byte	0x4
	.byte	0x22
	.byte	0xf
	.4byte	0x132
	.byte	0xc
	.byte	0
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF19
	.byte	0x7
	.4byte	0xc8
	.4byte	0x142
	.byte	0x8
	.4byte	0x3f
	.byte	0xc
	.byte	0
	.byte	0x5
	.4byte	.LASF20
	.byte	0x50
	.byte	0x4
	.byte	0x26
	.byte	0x8
	.4byte	0x191
	.byte	0x6
	.4byte	.LASF21
	.byte	0x4
	.byte	0x28
	.byte	0xf
	.4byte	0xc8
	.byte	0
	.byte	0x6
	.4byte	.LASF22
	.byte	0x4
	.byte	0x29
	.byte	0xf
	.4byte	0xc8
	.byte	0x4
	.byte	0x9
	.string	"ref"
	.byte	0x4
	.byte	0x2a
	.byte	0x6
	.4byte	0x191
	.byte	0x8
	.byte	0x6
	.4byte	.LASF23
	.byte	0x4
	.byte	0x2b
	.byte	0x6
	.4byte	0x191
	.byte	0xc
	.byte	0x6
	.4byte	.LASF24
	.byte	0x4
	.byte	0x2d
	.byte	0x10
	.4byte	0xcf
	.byte	0x10
	.byte	0
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF25
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF26
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF27
	.byte	0xb
	.byte	0x7
	.byte	0x4
	.4byte	0xc8
	.byte	0x5
	.byte	0xc
	.byte	0x7
	.4byte	0x1d4
	.byte	0xc
	.4byte	.LASF28
	.byte	0
	.byte	0xc
	.4byte	.LASF29
	.byte	0x1
	.byte	0xc
	.4byte	.LASF30
	.byte	0x2
	.byte	0xc
	.4byte	.LASF31
	.byte	0x3
	.byte	0
	.byte	0x5
	.4byte	.LASF32
	.byte	0x28
	.byte	0x5
	.byte	0xa
	.byte	0x8
	.4byte	0x249
	.byte	0x6
	.4byte	.LASF14
	.byte	0x5
	.byte	0xc
	.byte	0x2f
	.4byte	0x1ad
	.byte	0
	.byte	0x6
	.4byte	.LASF33
	.byte	0x5
	.byte	0xd
	.byte	0x6
	.4byte	0x191
	.byte	0x4
	.byte	0x6
	.4byte	.LASF34
	.byte	0x5
	.byte	0xe
	.byte	0x7
	.4byte	0x19f
	.byte	0x8
	.byte	0x6
	.4byte	.LASF35
	.byte	0x5
	.byte	0xf
	.byte	0x7
	.4byte	0x19f
	.byte	0x9
	.byte	0x9
	.string	"ip"
	.byte	0x5
	.byte	0x10
	.byte	0x10
	.4byte	0x249
	.byte	0x10
	.byte	0x6
	.4byte	.LASF36
	.byte	0x5
	.byte	0x11
	.byte	0xf
	.4byte	0x254
	.byte	0x18
	.byte	0x9
	.string	"off"
	.byte	0x5
	.byte	0x12
	.byte	0xf
	.4byte	0xc8
	.byte	0x20
	.byte	0x6
	.4byte	.LASF15
	.byte	0x5
	.byte	0x13
	.byte	0x8
	.4byte	0x12b
	.byte	0x24
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x142
	.byte	0xd
	.4byte	.LASF36
	.byte	0x3
	.byte	0x8
	.4byte	0x24f
	.byte	0x5
	.4byte	.LASF37
	.byte	0x4
	.byte	0x6
	.byte	0x4
	.byte	0x8
	.4byte	0x275
	.byte	0x6
	.4byte	.LASF38
	.byte	0x6
	.byte	0x6
	.byte	0xf
	.4byte	0xc8
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF39
	.2byte	0x120
	.byte	0x7
	.byte	0x11
	.byte	0x8
	.4byte	0x43f
	.byte	0x6
	.4byte	.LASF40
	.byte	0x7
	.byte	0x12
	.byte	0x1b
	.4byte	0x3f
	.byte	0
	.byte	0x6
	.4byte	.LASF41
	.byte	0x7
	.byte	0x13
	.byte	0x1b
	.4byte	0x3f
	.byte	0x8
	.byte	0x6
	.4byte	.LASF42
	.byte	0x7
	.byte	0x14
	.byte	0x1b
	.4byte	0x3f
	.byte	0x10
	.byte	0x9
	.string	"epc"
	.byte	0x7
	.byte	0x15
	.byte	0x1b
	.4byte	0x3f
	.byte	0x18
	.byte	0x6
	.4byte	.LASF43
	.byte	0x7
	.byte	0x16
	.byte	0x1b
	.4byte	0x3f
	.byte	0x20
	.byte	0x9
	.string	"ra"
	.byte	0x7
	.byte	0x17
	.byte	0x1b
	.4byte	0x3f
	.byte	0x28
	.byte	0x9
	.string	"sp"
	.byte	0x7
	.byte	0x18
	.byte	0x1b
	.4byte	0x3f
	.byte	0x30
	.byte	0x9
	.string	"gp"
	.byte	0x7
	.byte	0x19
	.byte	0x1b
	.4byte	0x3f
	.byte	0x38
	.byte	0x9
	.string	"tp"
	.byte	0x7
	.byte	0x1a
	.byte	0x1b
	.4byte	0x3f
	.byte	0x40
	.byte	0x9
	.string	"t0"
	.byte	0x7
	.byte	0x1b
	.byte	0x1b
	.4byte	0x3f
	.byte	0x48
	.byte	0x9
	.string	"t1"
	.byte	0x7
	.byte	0x1c
	.byte	0x1b
	.4byte	0x3f
	.byte	0x50
	.byte	0x9
	.string	"t2"
	.byte	0x7
	.byte	0x1d
	.byte	0x1b
	.4byte	0x3f
	.byte	0x58
	.byte	0x9
	.string	"s0"
	.byte	0x7
	.byte	0x1e
	.byte	0x1b
	.4byte	0x3f
	.byte	0x60
	.byte	0x9
	.string	"s1"
	.byte	0x7
	.byte	0x1f
	.byte	0x1b
	.4byte	0x3f
	.byte	0x68
	.byte	0x9
	.string	"a0"
	.byte	0x7
	.byte	0x20
	.byte	0x1b
	.4byte	0x3f
	.byte	0x70
	.byte	0x9
	.string	"a1"
	.byte	0x7
	.byte	0x21
	.byte	0x1b
	.4byte	0x3f
	.byte	0x78
	.byte	0x9
	.string	"a2"
	.byte	0x7
	.byte	0x22
	.byte	0x1b
	.4byte	0x3f
	.byte	0x80
	.byte	0x9
	.string	"a3"
	.byte	0x7
	.byte	0x23
	.byte	0x1b
	.4byte	0x3f
	.byte	0x88
	.byte	0x9
	.string	"a4"
	.byte	0x7
	.byte	0x24
	.byte	0x1b
	.4byte	0x3f
	.byte	0x90
	.byte	0x9
	.string	"a5"
	.byte	0x7
	.byte	0x25
	.byte	0x1b
	.4byte	0x3f
	.byte	0x98
	.byte	0x9
	.string	"a6"
	.byte	0x7
	.byte	0x26
	.byte	0x1b
	.4byte	0x3f
	.byte	0xa0
	.byte	0x9
	.string	"a7"
	.byte	0x7
	.byte	0x27
	.byte	0x1b
	.4byte	0x3f
	.byte	0xa8
	.byte	0x9
	.string	"s2"
	.byte	0x7
	.byte	0x28
	.byte	0x1b
	.4byte	0x3f
	.byte	0xb0
	.byte	0x9
	.string	"s3"
	.byte	0x7
	.byte	0x29
	.byte	0x1b
	.4byte	0x3f
	.byte	0xb8
	.byte	0x9
	.string	"s4"
	.byte	0x7
	.byte	0x2a
	.byte	0x1b
	.4byte	0x3f
	.byte	0xc0
	.byte	0x9
	.string	"s5"
	.byte	0x7
	.byte	0x2b
	.byte	0x1b
	.4byte	0x3f
	.byte	0xc8
	.byte	0x9
	.string	"s6"
	.byte	0x7
	.byte	0x2c
	.byte	0x1b
	.4byte	0x3f
	.byte	0xd0
	.byte	0x9
	.string	"s7"
	.byte	0x7
	.byte	0x2d
	.byte	0x1b
	.4byte	0x3f
	.byte	0xd8
	.byte	0x9
	.string	"s8"
	.byte	0x7
	.byte	0x2e
	.byte	0x1b
	.4byte	0x3f
	.byte	0xe0
	.byte	0x9
	.string	"s9"
	.byte	0x7
	.byte	0x2f
	.byte	0x1b
	.4byte	0x3f
	.byte	0xe8
	.byte	0x9
	.string	"s10"
	.byte	0x7
	.byte	0x30
	.byte	0x1b
	.4byte	0x3f
	.byte	0xf0
	.byte	0x9
	.string	"s11"
	.byte	0x7
	.byte	0x31
	.byte	0x1b
	.4byte	0x3f
	.byte	0xf8
	.byte	0xf
	.string	"t3"
	.byte	0x7
	.byte	0x32
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x100
	.byte	0xf
	.string	"t4"
	.byte	0x7
	.byte	0x33
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x108
	.byte	0xf
	.string	"t5"
	.byte	0x7
	.byte	0x34
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x110
	.byte	0xf
	.string	"t6"
	.byte	0x7
	.byte	0x35
	.byte	0x1b
	.4byte	0x3f
	.2byte	0x118
	.byte	0
	.byte	0x5
	.4byte	.LASF44
	.byte	0x68
	.byte	0x7
	.byte	0x38
	.byte	0x8
	.4byte	0x4eb
	.byte	0x9
	.string	"ra"
	.byte	0x7
	.byte	0x3a
	.byte	0x10
	.4byte	0x3f
	.byte	0
	.byte	0x9
	.string	"sp"
	.byte	0x7
	.byte	0x3b
	.byte	0x10
	.4byte	0x3f
	.byte	0x8
	.byte	0x9
	.string	"s0"
	.byte	0x7
	.byte	0x3c
	.byte	0x10
	.4byte	0x3f
	.byte	0x10
	.byte	0x9
	.string	"s1"
	.byte	0x7
	.byte	0x3d
	.byte	0x10
	.4byte	0x3f
	.byte	0x18
	.byte	0x9
	.string	"s2"
	.byte	0x7
	.byte	0x3e
	.byte	0x10
	.4byte	0x3f
	.byte	0x20
	.byte	0x9
	.string	"s3"
	.byte	0x7
	.byte	0x3f
	.byte	0x10
	.4byte	0x3f
	.byte	0x28
	.byte	0x9
	.string	"s4"
	.byte	0x7
	.byte	0x40
	.byte	0x10
	.4byte	0x3f
	.byte	0x30
	.byte	0x9
	.string	"s5"
	.byte	0x7
	.byte	0x41
	.byte	0x10
	.4byte	0x3f
	.byte	0x38
	.byte	0x9
	.string	"s7"
	.byte	0x7
	.byte	0x42
	.byte	0x10
	.4byte	0x3f
	.byte	0x40
	.byte	0x9
	.string	"s8"
	.byte	0x7
	.byte	0x43
	.byte	0x10
	.4byte	0x3f
	.byte	0x48
	.byte	0x9
	.string	"s9"
	.byte	0x7
	.byte	0x44
	.byte	0x10
	.4byte	0x3f
	.byte	0x50
	.byte	0x9
	.string	"s10"
	.byte	0x7
	.byte	0x45
	.byte	0x10
	.4byte	0x3f
	.byte	0x58
	.byte	0x9
	.string	"s11"
	.byte	0x7
	.byte	0x46
	.byte	0x10
	.4byte	0x3f
	.byte	0x60
	.byte	0
	.byte	0xe
	.4byte	.LASF45
	.2byte	0x100
	.byte	0x7
	.byte	0x49
	.byte	0x8
	.4byte	0x596
	.byte	0x6
	.4byte	.LASF46
	.byte	0x7
	.byte	0x4b
	.byte	0x11
	.4byte	0x39
	.byte	0
	.byte	0x6
	.4byte	.LASF47
	.byte	0x7
	.byte	0x4c
	.byte	0x8
	.4byte	0x2d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF39
	.byte	0x7
	.byte	0x4d
	.byte	0x14
	.4byte	0x596
	.byte	0x10
	.byte	0x6
	.4byte	.LASF44
	.byte	0x7
	.byte	0x4e
	.byte	0x11
	.4byte	0x43f
	.byte	0x18
	.byte	0x6
	.4byte	.LASF48
	.byte	0x7
	.byte	0x4f
	.byte	0x10
	.4byte	0x3f
	.byte	0x80
	.byte	0x6
	.4byte	.LASF49
	.byte	0x7
	.byte	0x50
	.byte	0x7
	.4byte	0x59c
	.byte	0x88
	.byte	0x6
	.4byte	.LASF50
	.byte	0x7
	.byte	0x51
	.byte	0x6
	.4byte	0x191
	.byte	0x94
	.byte	0x9
	.string	"pid"
	.byte	0x7
	.byte	0x52
	.byte	0x6
	.4byte	0x191
	.byte	0x98
	.byte	0x6
	.4byte	.LASF51
	.byte	0x7
	.byte	0x53
	.byte	0x6
	.4byte	0x191
	.byte	0x9c
	.byte	0x6
	.4byte	.LASF52
	.byte	0x7
	.byte	0x54
	.byte	0x10
	.4byte	0x3f
	.byte	0xa0
	.byte	0x6
	.4byte	.LASF53
	.byte	0x7
	.byte	0x55
	.byte	0xf
	.4byte	0x5ac
	.byte	0xa8
	.byte	0x6
	.4byte	.LASF54
	.byte	0x7
	.byte	0x57
	.byte	0xf
	.4byte	0x5b2
	.byte	0xb0
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x275
	.byte	0x7
	.4byte	0x19f
	.4byte	0x5ac
	.byte	0x8
	.4byte	0x3f
	.byte	0x9
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x4eb
	.byte	0x7
	.4byte	0x5c2
	.4byte	0x5c2
	.byte	0x8
	.4byte	0x3f
	.byte	0x9
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x1d4
	.byte	0x10
	.string	"pid"
	.byte	0x2
	.byte	0x6
	.byte	0x5
	.4byte	0x191
	.byte	0x9
	.byte	0x3
	.8byte	pid
	.byte	0x7
	.4byte	0x4eb
	.4byte	0x5ee
	.byte	0x8
	.4byte	0x3f
	.byte	0x9
	.byte	0
	.byte	0x11
	.4byte	.LASF55
	.byte	0x2
	.byte	0x8
	.byte	0xd
	.4byte	0x5de
	.byte	0x9
	.byte	0x3
	.8byte	proc_list
	.byte	0x11
	.4byte	.LASF56
	.byte	0x2
	.byte	0xa
	.byte	0xd
	.4byte	0x4eb
	.byte	0x9
	.byte	0x3
	.8byte	kernel_ctxt
	.byte	0x11
	.4byte	.LASF57
	.byte	0x2
	.byte	0xc
	.byte	0xe
	.4byte	0x5ac
	.byte	0x9
	.byte	0x3
	.8byte	proc_ptr
	.byte	0x7
	.4byte	0x3f
	.4byte	0x63b
	.byte	0x12
	.byte	0
	.byte	0x13
	.4byte	.LASF58
	.byte	0x2
	.byte	0xe
	.byte	0x16
	.4byte	0x630
	.byte	0x13
	.4byte	.LASF59
	.byte	0x2
	.byte	0xf
	.byte	0x16
	.4byte	0x630
	.byte	0x14
	.string	"sb"
	.byte	0x2
	.byte	0x12
	.byte	0x1a
	.4byte	0x52
	.byte	0x13
	.4byte	.LASF60
	.byte	0x2
	.byte	0x13
	.byte	0xc
	.4byte	0x191
	.byte	0x7
	.4byte	0x1a6
	.4byte	0x67a
	.byte	0x8
	.4byte	0x3f
	.byte	0x17
	.byte	0
	.byte	0x11
	.4byte	.LASF61
	.byte	0x2
	.byte	0x15
	.byte	0xf
	.4byte	0x66a
	.byte	0x9
	.byte	0x3
	.8byte	initcode
	.byte	0x15
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x105
	.byte	0x6
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x6e0
	.byte	0x16
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x105
	.byte	0x1c
	.4byte	0x39
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x17
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0x18
	.string	"n"
	.byte	0x2
	.2byte	0x107
	.byte	0xa
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF63
	.byte	0x2
	.byte	0xfc
	.byte	0x6
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x71d
	.byte	0x1a
	.4byte	.LASF64
	.byte	0x2
	.byte	0xfc
	.byte	0x1b
	.4byte	0x39
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF65
	.byte	0x2
	.byte	0xfc
	.byte	0x32
	.4byte	0x71d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x25a
	.byte	0x1b
	.4byte	.LASF85
	.byte	0x2
	.byte	0xec
	.byte	0x5
	.4byte	0x191
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x764
	.byte	0x1c
	.string	"pid"
	.byte	0x2
	.byte	0xec
	.byte	0xe
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1d
	.string	"ptr"
	.byte	0x2
	.byte	0xee
	.byte	0xf
	.4byte	0x5ac
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1e
	.4byte	.LASF86
	.byte	0x2
	.byte	0xe7
	.byte	0x5
	.4byte	0x191
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF66
	.byte	0x2
	.byte	0xcf
	.byte	0x6
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.4byte	0x7d0
	.byte	0x1a
	.4byte	.LASF67
	.byte	0x2
	.byte	0xcf
	.byte	0xf
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x17
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x1d
	.string	"fd"
	.byte	0x2
	.byte	0xd2
	.byte	0xa
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x1f
	.4byte	.LASF68
	.byte	0x2
	.byte	0x93
	.byte	0x5
	.4byte	0x191
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x88b
	.byte	0x20
	.4byte	.LASF69
	.byte	0x2
	.byte	0x95
	.byte	0xf
	.4byte	0x5ac
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1d
	.string	"pte"
	.byte	0x2
	.byte	0x97
	.byte	0x9
	.4byte	0x88b
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x20
	.4byte	.LASF70
	.byte	0x2
	.byte	0x98
	.byte	0x11
	.4byte	0x39
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x1d
	.string	"pa"
	.byte	0x2
	.byte	0x99
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x21
	.4byte	.LASF87
	.byte	0x2
	.byte	0xa6
	.byte	0x1
	.8byte	.L25
	.byte	0x22
	.4byte	.Ldebug_ranges0+0
	.4byte	0x854
	.byte	0x1d
	.string	"n"
	.byte	0x2
	.byte	0x9b
	.byte	0xa
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x22
	.4byte	.Ldebug_ranges0+0x30
	.4byte	0x86b
	.byte	0x1d
	.string	"n"
	.byte	0x2
	.byte	0xb7
	.byte	0xa
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x1d
	.string	"n"
	.byte	0x2
	.byte	0xc4
	.byte	0xa
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x46
	.byte	0x23
	.4byte	.LASF72
	.byte	0x2
	.byte	0x8b
	.byte	0x6
	.8byte	.LFB33
	.8byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.4byte	0x8bf
	.byte	0x20
	.4byte	.LASF71
	.byte	0x2
	.byte	0x8d
	.byte	0xf
	.4byte	0x5ac
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x23
	.4byte	.LASF73
	.byte	0x2
	.byte	0x76
	.byte	0x6
	.8byte	.LFB32
	.8byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.4byte	0x90c
	.byte	0x20
	.4byte	.LASF74
	.byte	0x2
	.byte	0x78
	.byte	0xf
	.4byte	0x5ac
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x17
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x1d
	.string	"n"
	.byte	0x2
	.byte	0x7e
	.byte	0xb
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LASF75
	.byte	0x2
	.byte	0x55
	.byte	0x6
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x949
	.byte	0x1d
	.string	"mem"
	.byte	0x2
	.byte	0x57
	.byte	0x8
	.4byte	0x949
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x20
	.4byte	.LASF76
	.byte	0x2
	.byte	0x6d
	.byte	0x14
	.4byte	0x596
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x19f
	.byte	0x23
	.4byte	.LASF77
	.byte	0x2
	.byte	0x49
	.byte	0x6
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0x984
	.byte	0x20
	.4byte	.LASF78
	.byte	0x2
	.byte	0x4b
	.byte	0xd
	.4byte	0x191
	.byte	0x9
	.byte	0x3
	.8byte	flag.1379
	.byte	0
	.byte	0x1f
	.4byte	.LASF47
	.byte	0x2
	.byte	0x3a
	.byte	0x7
	.4byte	0x2d
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x9b6
	.byte	0x20
	.4byte	.LASF79
	.byte	0x2
	.byte	0x3c
	.byte	0x8
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x19
	.4byte	.LASF80
	.byte	0x2
	.byte	0x21
	.byte	0x6
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0xa0f
	.byte	0x1a
	.4byte	.LASF79
	.byte	0x2
	.byte	0x21
	.byte	0x1d
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x20
	.4byte	.LASF57
	.byte	0x2
	.byte	0x23
	.byte	0xf
	.4byte	0x5ac
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x20
	.4byte	.LASF81
	.byte	0x2
	.byte	0x24
	.byte	0x11
	.4byte	0x39
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1d
	.string	"n"
	.byte	0x2
	.byte	0x25
	.byte	0x6
	.4byte	0x191
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x24
	.4byte	.LASF88
	.byte	0x1
	.byte	0xfe
	.byte	0x14
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.byte	0x25
	.4byte	.LASF89
	.byte	0x1
	.byte	0x66
	.byte	0x14
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xa55
	.byte	0x1c
	.string	"x"
	.byte	0x1
	.byte	0x66
	.byte	0x2c
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x26
	.4byte	.LASF90
	.byte	0x1
	.byte	0x1c
	.byte	0x1d
	.4byte	0x3f
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x1d
	.string	"x"
	.byte	0x1
	.byte	0x1e
	.byte	0x10
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x21
	.byte	0
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
	.byte	0x5
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x20
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
	.byte	0x21
	.byte	0xa
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
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x26
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LBB3-.Ltext0
	.8byte	.LBE3-.Ltext0
	.8byte	.LBB5-.Ltext0
	.8byte	.LBE5-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB4-.Ltext0
	.8byte	.LBE4-.Ltext0
	.8byte	.LBB6-.Ltext0
	.8byte	.LBE6-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF12:
	.string	"superblock"
.LASF23:
	.string	"valid"
.LASF28:
	.string	"FD_NONE"
.LASF64:
	.string	"chan"
.LASF6:
	.string	"log_num"
.LASF57:
	.string	"proc_ptr"
.LASF50:
	.string	"state"
.LASF18:
	.string	"data_address"
.LASF19:
	.string	"short int"
.LASF56:
	.string	"kernel_ctxt"
.LASF68:
	.string	"fork"
.LASF71:
	.string	"kern_ptr"
.LASF75:
	.string	"user_init"
.LASF22:
	.string	"ninode"
.LASF32:
	.string	"file"
.LASF88:
	.string	"intr_on"
.LASF13:
	.string	"dinode"
.LASF5:
	.string	"inode_num"
.LASF15:
	.string	"major"
.LASF62:
	.string	"wakeup"
.LASF17:
	.string	"nlink"
.LASF53:
	.string	"parent"
.LASF67:
	.string	"code"
.LASF51:
	.string	"killed"
.LASF31:
	.string	"FD_DEVICE"
.LASF73:
	.string	"scheduler"
.LASF80:
	.string	"init_proc_kstack"
.LASF41:
	.string	"kernel_sp"
.LASF79:
	.string	"pagetable"
.LASF72:
	.string	"sched"
.LASF47:
	.string	"proc_pagetable"
.LASF26:
	.string	"char"
.LASF82:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF40:
	.string	"kernel_satp"
.LASF59:
	.string	"_trampoline"
.LASF39:
	.string	"trapframe"
.LASF0:
	.string	"pgt_t"
.LASF34:
	.string	"readable"
.LASF49:
	.string	"name"
.LASF21:
	.string	"ndev"
.LASF43:
	.string	"kernel_hartid"
.LASF74:
	.string	"kernel_ptr"
.LASF54:
	.string	"ofile"
.LASF27:
	.string	"unsigned char"
.LASF84:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF85:
	.string	"kill"
.LASF1:
	.string	"pte_t"
.LASF60:
	.string	"systicks"
.LASF45:
	.string	"proc"
.LASF14:
	.string	"type"
.LASF11:
	.string	"unsigned int"
.LASF4:
	.string	"data_blk_num"
.LASF44:
	.string	"context"
.LASF30:
	.string	"FD_INODE"
.LASF63:
	.string	"sleep"
.LASF7:
	.string	"s_data_blk"
.LASF46:
	.string	"kstack"
.LASF25:
	.string	"short unsigned int"
.LASF20:
	.string	"inode"
.LASF38:
	.string	"locked"
.LASF66:
	.string	"exit"
.LASF65:
	.string	"lock"
.LASF55:
	.string	"proc_list"
.LASF81:
	.string	"kstack_ptr"
.LASF86:
	.string	"wait"
.LASF89:
	.string	"w_sstatus"
.LASF83:
	.string	"src/proc.c"
.LASF24:
	.string	"content"
.LASF10:
	.string	"long unsigned int"
.LASF29:
	.string	"FD_PIPE"
.LASF8:
	.string	"s_inode_blk"
.LASF48:
	.string	"prog_size"
.LASF77:
	.string	"fork_ret"
.LASF3:
	.string	"size"
.LASF87:
	.string	"found"
.LASF2:
	.string	"magic_num"
.LASF52:
	.string	"sleep_chan"
.LASF37:
	.string	"spinlock"
.LASF76:
	.string	"trap_frame"
.LASF16:
	.string	"minor"
.LASF36:
	.string	"pipe"
.LASF42:
	.string	"kernel_trap"
.LASF61:
	.string	"initcode"
.LASF58:
	.string	"_sec_pgt_start"
.LASF69:
	.string	"new_proc_ptr"
.LASF70:
	.string	"proc_mem"
.LASF78:
	.string	"flag"
.LASF35:
	.string	"writable"
.LASF33:
	.string	"ref_cnt"
.LASF90:
	.string	"r_sstatus"
.LASF9:
	.string	"s_bmap"
	.ident	"GCC: () 9.3.0"
