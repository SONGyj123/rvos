	.file	"vm.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	mem_ll,8,8
	.globl	ori_ptr
	.section	.sdata,"aw"
	.align	3
	.type	ori_ptr, @object
	.size	ori_ptr, 8
ori_ptr:
	.dword	mem_ll
	.text
	.align	2
	.globl	kfree
	.type	kfree, @function
kfree:
.LFB0:
	.file 1 "src/vm.c"
	.loc 1 12 1
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
	.loc 1 17 2
	li	a2,4096
	li	a1,0
	ld	a0,-40(s0)
	call	memset
	.loc 1 19 10
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	.loc 1 20 15
	lla	a5,ori_ptr
	ld	a4,0(a5)
	ld	a5,-24(s0)
	sd	a4,0(a5)
	.loc 1 22 10
	lla	a5,ori_ptr
	ld	a4,-24(s0)
	sd	a4,0(a5)
	.loc 1 23 1
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
	.size	kfree, .-kfree
	.section	.rodata
	.align	3
.LC0:
	.string	"%p->\n"
	.align	3
.LC1:
	.string	"print out: %d\n"
	.text
	.align	2
	.globl	kp_free_mem
	.type	kp_free_mem, @function
kp_free_mem:
.LFB1:
	.loc 1 27 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 28 26
	lla	a5,ori_ptr
	ld	a5,0(a5)
	sd	a5,-24(s0)
	.loc 1 30 7
	j	.L3
.L4:
	.loc 1 32 3
	ld	a1,-24(s0)
	lla	a0,.LC0
	call	printf
	.loc 1 33 7
	ld	a5,-24(s0)
	ld	a5,0(a5)
	sd	a5,-24(s0)
.L3:
	.loc 1 30 7
	ld	a5,-24(s0)
	bnez	a5,.L4
	.loc 1 36 2
	li	a1,1
	lla	a0,.LC1
	call	printf
	.loc 1 37 1
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
.LFE1:
	.size	kp_free_mem, .-kp_free_mem
	.align	2
	.globl	kalloc
	.type	kalloc, @function
kalloc:
.LFB2:
	.loc 1 41 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 42 26
	lla	a5,ori_ptr
	ld	a5,0(a5)
	sd	a5,-24(s0)
	.loc 1 44 5
	lla	a5,ori_ptr
	ld	a5,0(a5)
	.loc 1 44 4
	beqz	a5,.L6
	.loc 1 46 20
	lla	a5,ori_ptr
	ld	a5,0(a5)
	ld	a4,0(a5)
	.loc 1 46 11
	lla	a5,ori_ptr
	sd	a4,0(a5)
.L6:
	.loc 1 49 9
	ld	a5,-24(s0)
	.loc 1 50 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	kalloc, .-kalloc
	.align	2
	.globl	walk
	.type	walk, @function
walk:
.LFB3:
	.loc 1 53 1
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
.LBB2:
	.loc 1 55 10
	li	a5,2
	sw	a5,-20(s0)
	.loc 1 55 2
	j	.L9
.L15:
	.loc 1 57 27
	ld	a5,-48(s0)
	srli	a3,a5,12
	.loc 1 57 36
	lw	a4,-20(s0)
	mv	a5,a4
	slliw	a5,a5,3
	addw	a5,a5,a4
	sext.w	a5,a5
	.loc 1 57 32
	srl	a5,a3,a5
	.loc 1 57 44
	andi	a5,a5,511
	.loc 1 57 19
	slli	a5,a5,3
	.loc 1 57 7
	ld	a4,-40(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 59 6
	ld	a5,-32(s0)
	ld	a5,0(a5)
	.loc 1 59 11
	andi	a5,a5,1
	.loc 1 59 5
	beqz	a5,.L10
	.loc 1 61 25
	ld	a5,-32(s0)
	ld	a5,0(a5)
	.loc 1 61 44
	srli	a5,a5,10
	.loc 1 61 49
	slli	a5,a5,12
	.loc 1 61 14
	sd	a5,-40(s0)
	j	.L11
.L10:
	.loc 1 65 6
	lw	a5,-52(s0)
	sext.w	a5,a5
	beqz	a5,.L12
	.loc 1 65 29 discriminator 1
	call	kalloc
	sd	a0,-40(s0)
	.loc 1 65 14 discriminator 1
	ld	a5,-40(s0)
	bnez	a5,.L13
.L12:
	.loc 1 67 12
	li	a5,0
	j	.L14
.L13:
	.loc 1 70 4
	li	a2,4096
	li	a1,0
	ld	a0,-40(s0)
	call	memset
	.loc 1 72 12
	ld	a5,-40(s0)
	.loc 1 72 36
	srli	a5,a5,12
	.loc 1 72 40
	slli	a5,a5,10
	.loc 1 72 46
	ori	a4,a5,1
	.loc 1 72 9
	ld	a5,-32(s0)
	sd	a4,0(a5)
.L11:
	.loc 1 55 33 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L9:
	.loc 1 55 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a5,a5
	bgtz	a5,.L15
.LBE2:
	.loc 1 76 31
	ld	a5,-48(s0)
	srli	a5,a5,12
	.loc 1 76 39
	andi	a5,a5,511
	.loc 1 76 18
	slli	a5,a5,3
	.loc 1 76 6
	ld	a4,-40(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 77 9
	ld	a5,-32(s0)
.L14:
	.loc 1 78 1
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
.LFE3:
	.size	walk, .-walk
	.section	.rodata
	.align	3
.LC2:
	.string	"pte invalid\n"
	.text
	.align	2
	.globl	va_to_pa
	.type	va_to_pa, @function
va_to_pa:
.LFB4:
	.loc 1 81 1
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
	sd	a1,-64(s0)
.LBB3:
	.loc 1 84 10
	li	a5,2
	sw	a5,-20(s0)
	.loc 1 84 2
	j	.L17
.L19:
.LBB4:
	.loc 1 86 32
	ld	a5,-64(s0)
	srli	a3,a5,12
	.loc 1 86 41
	lw	a4,-20(s0)
	mv	a5,a4
	slliw	a5,a5,3
	addw	a5,a5,a4
	sext.w	a5,a5
	.loc 1 86 37
	srl	a5,a3,a5
	.loc 1 86 49
	andi	a5,a5,511
	.loc 1 86 24
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	a5,a4,a5
	.loc 1 86 9
	ld	a5,0(a5)
	sd	a5,-40(s0)
	.loc 1 88 11
	ld	a5,-40(s0)
	andi	a5,a5,1
	.loc 1 88 5
	bnez	a5,.L18
	.loc 1 90 4
	lla	a0,.LC2
	call	panic
.L18:
	.loc 1 93 42 discriminator 2
	ld	a5,-40(s0)
	srli	a5,a5,10
	.loc 1 93 47 discriminator 2
	slli	a5,a5,12
	.loc 1 93 13 discriminator 2
	sd	a5,-56(s0)
.LBE4:
	.loc 1 84 33 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L17:
	.loc 1 84 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a5,a5
	bgtz	a5,.L19
.LBE3:
	.loc 1 96 30
	ld	a5,-64(s0)
	srli	a5,a5,12
	.loc 1 96 38
	andi	a5,a5,511
	.loc 1 96 17
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 96 46
	srli	a5,a5,10
	.loc 1 96 5
	slli	a5,a5,12
	sd	a5,-32(s0)
	.loc 1 98 9
	ld	a5,-32(s0)
	.loc 1 99 1
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
.LFE4:
	.size	va_to_pa, .-va_to_pa
	.align	2
	.globl	free_mem_in_page
	.type	free_mem_in_page, @function
free_mem_in_page:
.LFB5:
	.loc 1 102 1
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
	.loc 1 103 6
	sw	zero,-20(s0)
	.loc 1 104 8
	ld	a5,-40(s0)
	sd	a5,-32(s0)
	.loc 1 106 7
	j	.L22
.L23:
	.loc 1 108 3
	ld	a0,-32(s0)
	call	kfree
	.loc 1 109 6
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	.loc 1 110 5
	ld	a4,-32(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-32(s0)
.L22:
	.loc 1 106 9
	ld	a4,-32(s0)
	li	a5,4096
	add	a5,a4,a5
	.loc 1 106 7
	ld	a4,-48(s0)
	bgeu	a4,a5,.L23
	.loc 1 113 9
	lw	a5,-20(s0)
	.loc 1 114 1
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
.LFE5:
	.size	free_mem_in_page, .-free_mem_in_page
	.section	.rodata
	.align	3
.LC3:
	.string	"remap!\n"
	.text
	.align	2
	.globl	map_page
	.type	map_page, @function
map_page:
.LFB6:
	.loc 1 117 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	sd	a3,-64(s0)
	mv	a5,a4
	sw	a5,-68(s0)
.LBB5:
	.loc 1 119 10
	sw	zero,-20(s0)
	.loc 1 119 2
	j	.L26
.L31:
	.loc 1 121 13
	li	a2,1
	ld	a1,-56(s0)
	ld	a0,-40(s0)
	call	walk
	sd	a0,-32(s0)
	.loc 1 122 5
	ld	a5,-32(s0)
	beqz	a5,.L27
	.loc 1 124 7
	ld	a5,-32(s0)
	ld	a5,0(a5)
	.loc 1 124 16
	andi	a5,a5,1
	.loc 1 124 6
	beqz	a5,.L28
	.loc 1 126 5
	lla	a0,.LC3
	call	panic
	j	.L29
.L28:
	.loc 1 131 35
	ld	a5,-48(s0)
	srli	a5,a5,12
	.loc 1 131 40
	slli	a4,a5,10
	.loc 1 131 46
	lw	a5,-68(s0)
	or	a5,a4,a5
	.loc 1 131 53
	ori	a4,a5,1
	.loc 1 131 14
	ld	a5,-32(s0)
	sd	a4,0(a5)
	j	.L29
.L27:
	.loc 1 136 11
	li	a5,1
	j	.L30
.L29:
	.loc 1 139 6 discriminator 2
	ld	a4,-56(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-56(s0)
	.loc 1 140 6 discriminator 2
	ld	a4,-48(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-48(s0)
	.loc 1 119 24 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L26:
	.loc 1 119 16 discriminator 1
	lw	a5,-20(s0)
	.loc 1 119 2 discriminator 1
	ld	a4,-64(s0)
	bgtu	a4,a5,.L31
.LBE5:
	.loc 1 143 9
	li	a5,0
.L30:
	.loc 1 144 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	map_page, .-map_page
	.align	2
	.globl	uvmalloc
	.type	uvmalloc, @function
uvmalloc:
.LFB7:
	.loc 1 147 1
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
	mv	a4,a3
	sw	a5,-52(s0)
	mv	a5,a4
	sw	a5,-56(s0)
	.loc 1 150 10
	ld	a4,-48(s0)
	li	a5,4096
	addi	a5,a5,-1
	and	a5,a4,a5
	.loc 1 150 4
	beqz	a5,.L33
	.loc 1 152 17
	ld	a4,-48(s0)
	li	a5,-4096
	and	a4,a4,a5
	.loc 1 152 9
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-48(s0)
.L33:
.LBB6:
	.loc 1 155 20
	ld	a5,-48(s0)
	sd	a5,-24(s0)
	.loc 1 155 2
	j	.L34
.L37:
	.loc 1 157 9
	call	kalloc
	sd	a0,-32(s0)
	.loc 1 158 5
	ld	a5,-32(s0)
	bnez	a5,.L35
	.loc 1 160 11
	li	a5,0
	j	.L36
.L35:
	.loc 1 163 3 discriminator 2
	li	a2,4096
	li	a1,0
	ld	a0,-32(s0)
	call	memset
	.loc 1 164 3 discriminator 2
	ld	a1,-32(s0)
	lw	a5,-56(s0)
	ori	a5,a5,26
	sext.w	a5,a5
	mv	a4,a5
	li	a3,1
	ld	a2,-24(s0)
	ld	a0,-40(s0)
	call	map_page
	.loc 1 155 39 discriminator 2
	ld	a4,-24(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-24(s0)
.L34:
	.loc 1 155 30 discriminator 1
	lwu	a5,-52(s0)
	.loc 1 155 2 discriminator 1
	ld	a4,-24(s0)
	bltu	a4,a5,.L37
.LBE6:
	.loc 1 167 9
	lwu	a5,-52(s0)
.L36:
	.loc 1 168 1
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
.LFE7:
	.size	uvmalloc, .-uvmalloc
	.align	2
	.globl	copy_from_user
	.type	copy_from_user, @function
copy_from_user:
.LFB8:
	.loc 1 171 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	sd	a3,-80(s0)
	.loc 1 172 16
	sd	zero,-32(s0)
	.loc 1 173 16
	sd	zero,-40(s0)
	.loc 1 174 16
	sd	zero,-48(s0)
	.loc 1 175 16
	sd	zero,-24(s0)
	.loc 1 177 7
	j	.L39
.L42:
	.loc 1 180 18
	ld	a4,-72(s0)
	.loc 1 180 16
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-40(s0)
	.loc 1 181 12
	ld	a1,-40(s0)
	ld	a0,-56(s0)
	call	va_to_pa
	sd	a0,-32(s0)
	.loc 1 182 12
	ld	a4,-72(s0)
	.loc 1 182 10
	ld	a5,-40(s0)
	sub	a5,a4,a5
	sd	a5,-48(s0)
	.loc 1 183 10
	ld	a4,-32(s0)
	ld	a5,-48(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 185 19
	ld	a4,-48(s0)
	ld	a5,-80(s0)
	add	a4,a4,a5
	.loc 1 185 5
	li	a5,4096
	bgeu	a4,a5,.L40
	.loc 1 187 10
	ld	a5,-80(s0)
	sd	a5,-24(s0)
	j	.L41
.L40:
	.loc 1 191 10
	li	a4,4096
	ld	a5,-48(s0)
	sub	a5,a4,a5
	sd	a5,-24(s0)
.L41:
	.loc 1 194 3
	ld	a5,-32(s0)
	ld	a4,-80(s0)
	sext.w	a4,a4
	mv	a2,a4
	mv	a1,a5
	ld	a0,-64(s0)
	call	memmove
	.loc 1 196 7
	ld	a4,-80(s0)
	ld	a5,-24(s0)
	sub	a5,a4,a5
	sd	a5,-80(s0)
	.loc 1 197 10
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 198 7
	ld	a4,-72(s0)
	ld	a5,-24(s0)
	add	a5,a4,a5
	sd	a5,-72(s0)
.L39:
	.loc 1 177 7
	ld	a5,-80(s0)
	bnez	a5,.L42
	.loc 1 201 9
	li	a5,0
	.loc 1 202 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	copy_from_user, .-copy_from_user
	.align	2
	.globl	copy_to_user
	.type	copy_to_user, @function
copy_to_user:
.LFB9:
	.loc 1 205 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	sd	a3,-80(s0)
	.loc 1 206 16
	sd	zero,-32(s0)
	.loc 1 207 16
	sd	zero,-40(s0)
	.loc 1 208 16
	sd	zero,-48(s0)
	.loc 1 209 16
	sd	zero,-24(s0)
	.loc 1 211 7
	j	.L45
.L48:
	.loc 1 214 18
	ld	a4,-64(s0)
	.loc 1 214 16
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-40(s0)
	.loc 1 215 12
	ld	a1,-40(s0)
	ld	a0,-56(s0)
	call	va_to_pa
	sd	a0,-32(s0)
	.loc 1 216 12
	ld	a4,-64(s0)
	.loc 1 216 10
	ld	a5,-40(s0)
	sub	a5,a4,a5
	sd	a5,-48(s0)
	.loc 1 217 10
	ld	a4,-32(s0)
	ld	a5,-48(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 219 19
	ld	a4,-48(s0)
	ld	a5,-80(s0)
	add	a4,a4,a5
	.loc 1 219 5
	li	a5,4096
	bgeu	a4,a5,.L46
	.loc 1 221 10
	ld	a5,-80(s0)
	sd	a5,-24(s0)
	j	.L47
.L46:
	.loc 1 225 10
	li	a4,4096
	ld	a5,-48(s0)
	sub	a5,a4,a5
	sd	a5,-24(s0)
.L47:
	.loc 1 228 3
	ld	a5,-32(s0)
	ld	a4,-80(s0)
	sext.w	a4,a4
	mv	a2,a4
	ld	a1,-72(s0)
	mv	a0,a5
	call	memmove
	.loc 1 230 7
	ld	a4,-80(s0)
	ld	a5,-24(s0)
	sub	a5,a4,a5
	sd	a5,-80(s0)
	.loc 1 231 10
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 232 7
	ld	a4,-72(s0)
	ld	a5,-24(s0)
	add	a5,a4,a5
	sd	a5,-72(s0)
.L45:
	.loc 1 211 7
	ld	a5,-80(s0)
	bnez	a5,.L48
	.loc 1 235 9
	li	a5,0
	.loc 1 236 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	copy_to_user, .-copy_to_user
.Letext0:
	.file 2 "include/def.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x52b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF35
	.byte	0xc
	.4byte	.LASF36
	.4byte	.LASF37
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1a
	.byte	0x18
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	0x3f
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1b
	.byte	0x17
	.4byte	0x3f
	.byte	0x5
	.4byte	.LASF38
	.byte	0x8
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.4byte	0x6d
	.byte	0x6
	.string	"nxt"
	.byte	0x1
	.byte	0x5
	.byte	0x1a
	.4byte	0x6d
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x52
	.byte	0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.4byte	0x52
	.byte	0x9
	.byte	0x3
	.8byte	mem_ll
	.byte	0x7
	.4byte	.LASF3
	.byte	0x1
	.byte	0x8
	.byte	0x19
	.4byte	0x6d
	.byte	0x9
	.byte	0x3
	.8byte	ori_ptr
	.byte	0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0xcc
	.byte	0x5
	.4byte	0x13c
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x13c
	.byte	0x9
	.4byte	.LASF4
	.byte	0x1
	.byte	0xcc
	.byte	0x18
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xa
	.string	"dst"
	.byte	0x1
	.byte	0xcc
	.byte	0x28
	.4byte	0x143
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0xa
	.string	"src"
	.byte	0x1
	.byte	0xcc
	.byte	0x39
	.4byte	0x145
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0xa
	.string	"len"
	.byte	0x1
	.byte	0xcc
	.byte	0x4c
	.4byte	0x3f
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0xb
	.4byte	.LASF5
	.byte	0x1
	.byte	0xce
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xb
	.4byte	.LASF6
	.byte	0x1
	.byte	0xcf
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0xd0
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0xd1
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xd
	.byte	0x8
	.byte	0x3
	.byte	0x8
	.4byte	0x14b
	.byte	0xe
	.byte	0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0xaa
	.byte	0x5
	.4byte	0x13c
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e9
	.byte	0x9
	.4byte	.LASF4
	.byte	0x1
	.byte	0xaa
	.byte	0x1a
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xa
	.string	"dst"
	.byte	0x1
	.byte	0xaa
	.byte	0x2a
	.4byte	0x143
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0xa
	.string	"src"
	.byte	0x1
	.byte	0xaa
	.byte	0x3b
	.4byte	0x145
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0xa
	.string	"len"
	.byte	0x1
	.byte	0xaa
	.byte	0x4e
	.4byte	0x3f
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0xb
	.4byte	.LASF12
	.byte	0x1
	.byte	0xac
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xb
	.4byte	.LASF13
	.byte	0x1
	.byte	0xad
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0xae
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0xaf
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x92
	.byte	0xf
	.4byte	0x3f
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x276
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x92
	.byte	0x1e
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x92
	.byte	0x37
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x9
	.4byte	.LASF17
	.byte	0x1
	.byte	0x92
	.byte	0x47
	.4byte	0x276
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x92
	.byte	0x52
	.4byte	0x13c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.string	"mem"
	.byte	0x1
	.byte	0x94
	.byte	0x11
	.4byte	0x39
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x10
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0xf
	.string	"n"
	.byte	0x1
	.byte	0x9b
	.byte	0x14
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF19
	.byte	0x8
	.4byte	.LASF20
	.byte	0x1
	.byte	0x74
	.byte	0x5
	.4byte	0x13c
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x318
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x74
	.byte	0x14
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.string	"pa"
	.byte	0x1
	.byte	0x74
	.byte	0x2d
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xa
	.string	"va"
	.byte	0x1
	.byte	0x74
	.byte	0x3f
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x9
	.4byte	.LASF21
	.byte	0x1
	.byte	0x74
	.byte	0x50
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x74
	.byte	0x5a
	.4byte	0x13c
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0xb
	.4byte	.LASF22
	.byte	0x1
	.byte	0x76
	.byte	0x9
	.4byte	0x318
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x10
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0xf
	.string	"n"
	.byte	0x1
	.byte	0x77
	.byte	0xa
	.4byte	0x13c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x46
	.byte	0x8
	.4byte	.LASF23
	.byte	0x1
	.byte	0x65
	.byte	0x5
	.4byte	0x13c
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x37b
	.byte	0x9
	.4byte	.LASF24
	.byte	0x1
	.byte	0x65
	.byte	0x1c
	.4byte	0x143
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0x65
	.byte	0x28
	.4byte	0x143
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.string	"cnt"
	.byte	0x1
	.byte	0x67
	.byte	0x6
	.4byte	0x13c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xf
	.string	"p"
	.byte	0x1
	.byte	0x68
	.byte	0x8
	.4byte	0x37b
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x3
	.byte	0x8
	.4byte	0x381
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF26
	.byte	0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0x50
	.byte	0xf
	.4byte	0x3f
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x418
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x50
	.byte	0x1e
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xa
	.string	"va"
	.byte	0x1
	.byte	0x50
	.byte	0x37
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0xf
	.string	"pa"
	.byte	0x1
	.byte	0x52
	.byte	0x10
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x10
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0xb
	.4byte	.LASF28
	.byte	0x1
	.byte	0x54
	.byte	0xa
	.4byte	0x13c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x10
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0xf
	.string	"pte"
	.byte	0x1
	.byte	0x56
	.byte	0x9
	.4byte	0x46
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF29
	.byte	0x1
	.byte	0x34
	.byte	0x8
	.4byte	0x318
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x497
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x34
	.byte	0x13
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.string	"va"
	.byte	0x1
	.byte	0x34
	.byte	0x2c
	.4byte	0x3f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x9
	.4byte	.LASF30
	.byte	0x1
	.byte	0x34
	.byte	0x34
	.4byte	0x13c
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0xf
	.string	"pte"
	.byte	0x1
	.byte	0x36
	.byte	0x9
	.4byte	0x318
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x10
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xb
	.4byte	.LASF28
	.byte	0x1
	.byte	0x37
	.byte	0xa
	.4byte	0x13c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0x28
	.byte	0x7
	.4byte	0x143
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c9
	.byte	0xf
	.string	"ptr"
	.byte	0x1
	.byte	0x2a
	.byte	0x1a
	.4byte	0x6d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0x1a
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x4f7
	.byte	0xf
	.string	"ptr"
	.byte	0x1
	.byte	0x1c
	.byte	0x1a
	.4byte	0x6d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x13
	.4byte	.LASF33
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.string	"p"
	.byte	0x1
	.byte	0xb
	.byte	0x12
	.4byte	0x143
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xb
	.4byte	.LASF34
	.byte	0x1
	.byte	0xd
	.byte	0x1a
	.4byte	0x6d
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
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
	.byte	0x2
	.byte	0x18
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
.LASF27:
	.string	"va_to_pa"
.LASF17:
	.string	"newsz"
.LASF12:
	.string	"src_pa"
.LASF5:
	.string	"dst_pa"
.LASF2:
	.string	"mem_ll"
.LASF19:
	.string	"unsigned int"
.LASF16:
	.string	"oldsz"
.LASF33:
	.string	"kfree"
.LASF18:
	.string	"perm"
.LASF38:
	.string	"mem_linked_list"
.LASF21:
	.string	"size"
.LASF0:
	.string	"pgt_t"
.LASF30:
	.string	"alloc"
.LASF35:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF9:
	.string	"long unsigned int"
.LASF15:
	.string	"pagetable"
.LASF23:
	.string	"free_mem_in_page"
.LASF36:
	.string	"src/vm.c"
.LASF25:
	.string	"pa_e"
.LASF20:
	.string	"map_page"
.LASF4:
	.string	"user_pgt"
.LASF10:
	.string	"copy_to_user"
.LASF6:
	.string	"dst_va_align"
.LASF13:
	.string	"src_va_align"
.LASF14:
	.string	"uvmalloc"
.LASF3:
	.string	"ori_ptr"
.LASF29:
	.string	"walk"
.LASF37:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF11:
	.string	"copy_from_user"
.LASF32:
	.string	"kp_free_mem"
.LASF26:
	.string	"char"
.LASF8:
	.string	"act_n"
.LASF7:
	.string	"offset"
.LASF22:
	.string	"pte_ptr"
.LASF28:
	.string	"level"
.LASF34:
	.string	"new_ptr"
.LASF1:
	.string	"pte_t"
.LASF24:
	.string	"pa_s"
.LASF31:
	.string	"kalloc"
	.ident	"GCC: () 9.3.0"
