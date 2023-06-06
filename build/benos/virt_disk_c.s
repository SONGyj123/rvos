	.file	"virt_disk.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.local	disk
	.comm	disk,296,8
	.section	.rodata
	.align	3
.LC0:
	.string	"could not find virtio disk"
	.align	3
.LC1:
	.string	"virtio disk FEATURES_OK unset"
	.align	3
.LC2:
	.string	"virtio disk should not be ready"
	.align	3
.LC3:
	.string	"virtio disk has no queue 0"
	.align	3
.LC4:
	.string	"virtio disk max queue too short"
	.align	3
.LC5:
	.string	"virtio disk kalloc"
	.align	3
.LC6:
	.string	"virt_disk initialize ok"
	.text
	.align	2
	.globl	virt_disk_init
	.type	virt_disk_init, @function
virt_disk_init:
.LFB0:
	.file 1 "src/virt_disk.c"
	.loc 1 49 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 50 16
	sw	zero,-24(s0)
	.loc 1 54 7
	li	a5,268439552
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 54 6
	mv	a4,a5
	li	a5,1953656832
	addi	a5,a5,-1674
	bne	a4,a5,.L2
	.loc 1 55 7 discriminator 1
	li	a5,268439552
	addi	a5,a5,4
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 54 72 discriminator 1
	mv	a4,a5
	li	a5,2
	bne	a4,a5,.L2
	.loc 1 56 7
	li	a5,268439552
	addi	a5,a5,8
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 55 63
	mv	a4,a5
	li	a5,2
	bne	a4,a5,.L2
	.loc 1 57 7
	li	a5,268439552
	addi	a5,a5,12
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 56 63
	mv	a4,a5
	li	a5,1431126016
	addi	a5,a5,1361
	beq	a4,a5,.L3
.L2:
	.loc 1 59 5
	lla	a0,.LC0
	call	panic
.L3:
	.loc 1 63 3
	li	a5,268439552
	addi	a5,a5,112
	.loc 1 63 54
	lw	a4,-24(s0)
	sw	a4,0(a5)
	.loc 1 66 10
	lw	a5,-24(s0)
	ori	a5,a5,1
	sw	a5,-24(s0)
	.loc 1 67 3
	li	a5,268439552
	addi	a5,a5,112
	.loc 1 67 54
	lw	a4,-24(s0)
	sw	a4,0(a5)
	.loc 1 70 10
	lw	a5,-24(s0)
	ori	a5,a5,2
	sw	a5,-24(s0)
	.loc 1 71 3
	li	a5,268439552
	addi	a5,a5,112
	.loc 1 71 54
	lw	a4,-24(s0)
	sw	a4,0(a5)
	.loc 1 74 28
	li	a5,268439552
	addi	a5,a5,16
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 74 17
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,-32(s0)
	.loc 1 75 12
	ld	a5,-32(s0)
	andi	a5,a5,-33
	sd	a5,-32(s0)
	.loc 1 76 12
	ld	a5,-32(s0)
	andi	a5,a5,-129
	sd	a5,-32(s0)
	.loc 1 77 12
	ld	a4,-32(s0)
	li	a5,-4096
	addi	a5,a5,2047
	and	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 78 12
	ld	a4,-32(s0)
	li	a5,-4096
	addi	a5,a5,-1
	and	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 79 12
	ld	a4,-32(s0)
	li	a5,-134217728
	addi	a5,a5,-1
	and	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 80 12
	ld	a4,-32(s0)
	li	a5,-536870912
	addi	a5,a5,-1
	and	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 81 12
	ld	a4,-32(s0)
	li	a5,-268435456
	addi	a5,a5,-1
	and	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 82 3
	li	a5,268439552
	addi	a5,a5,32
	.loc 1 82 54
	ld	a4,-32(s0)
	sext.w	a4,a4
	sw	a4,0(a5)
	.loc 1 85 10
	lw	a5,-24(s0)
	ori	a5,a5,8
	sw	a5,-24(s0)
	.loc 1 86 3
	li	a5,268439552
	addi	a5,a5,112
	.loc 1 86 54
	lw	a4,-24(s0)
	sw	a4,0(a5)
	.loc 1 89 12
	li	a5,268439552
	addi	a5,a5,112
	.loc 1 89 10
	lw	a5,0(a5)
	sw	a5,-24(s0)
	.loc 1 90 16
	lw	a5,-24(s0)
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 1 90 6
	bnez	a5,.L4
	.loc 1 91 5
	lla	a0,.LC1
	call	panic
.L4:
	.loc 1 94 3
	li	a5,268439552
	addi	a5,a5,48
	.loc 1 94 54
	sw	zero,0(a5)
	.loc 1 97 7
	li	a5,268439552
	addi	a5,a5,68
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 97 6
	beqz	a5,.L5
	.loc 1 98 5
	lla	a0,.LC2
	call	panic
.L5:
	.loc 1 101 22
	li	a5,268439552
	addi	a5,a5,52
	.loc 1 101 16
	lw	a5,0(a5)
	sw	a5,-36(s0)
	.loc 1 102 6
	lw	a5,-36(s0)
	sext.w	a5,a5
	bnez	a5,.L6
	.loc 1 103 5
	lla	a0,.LC3
	call	panic
.L6:
	.loc 1 104 6
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,7
	bgtu	a4,a5,.L7
	.loc 1 105 5
	lla	a0,.LC4
	call	panic
.L7:
	.loc 1 108 15
	call	kalloc
	mv	a4,a0
	.loc 1 108 13
	lla	a5,disk
	sd	a4,0(a5)
	.loc 1 109 16
	call	kalloc
	mv	a4,a0
	.loc 1 109 14
	lla	a5,disk
	sd	a4,8(a5)
	.loc 1 110 15
	call	kalloc
	mv	a4,a0
	.loc 1 110 13
	lla	a5,disk
	sd	a4,16(a5)
	.loc 1 111 12
	lla	a5,disk
	ld	a5,0(a5)
	.loc 1 111 6
	beqz	a5,.L8
	.loc 1 111 26 discriminator 1
	lla	a5,disk
	ld	a5,8(a5)
	.loc 1 111 18 discriminator 1
	beqz	a5,.L8
	.loc 1 111 41 discriminator 2
	lla	a5,disk
	ld	a5,16(a5)
	.loc 1 111 33 discriminator 2
	bnez	a5,.L9
.L8:
	.loc 1 112 5
	lla	a0,.LC5
	call	panic
.L9:
	.loc 1 113 14
	lla	a5,disk
	ld	a5,0(a5)
	.loc 1 113 3
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 114 14
	lla	a5,disk
	ld	a5,8(a5)
	.loc 1 114 3
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 115 14
	lla	a5,disk
	ld	a5,16(a5)
	.loc 1 115 3
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 118 3
	li	a5,268439552
	addi	a5,a5,56
	.loc 1 118 54
	li	a4,8
	sw	a4,0(a5)
	.loc 1 121 75
	lla	a5,disk
	ld	a5,0(a5)
	.loc 1 121 54
	mv	a4,a5
	.loc 1 121 3
	li	a5,268439552
	addi	a5,a5,128
	.loc 1 121 54
	sext.w	a4,a4
	sw	a4,0(a5)
	.loc 1 122 75
	lla	a5,disk
	ld	a5,0(a5)
	.loc 1 122 81
	srli	a4,a5,32
	.loc 1 122 3
	li	a5,268439552
	addi	a5,a5,132
	.loc 1 122 54
	sext.w	a4,a4
	sw	a4,0(a5)
	.loc 1 123 75
	lla	a5,disk
	ld	a5,8(a5)
	.loc 1 123 54
	mv	a4,a5
	.loc 1 123 3
	li	a5,268439552
	addi	a5,a5,144
	.loc 1 123 54
	sext.w	a4,a4
	sw	a4,0(a5)
	.loc 1 124 75
	lla	a5,disk
	ld	a5,8(a5)
	.loc 1 124 82
	srli	a4,a5,32
	.loc 1 124 3
	li	a5,268439552
	addi	a5,a5,148
	.loc 1 124 54
	sext.w	a4,a4
	sw	a4,0(a5)
	.loc 1 125 75
	lla	a5,disk
	ld	a5,16(a5)
	.loc 1 125 54
	mv	a4,a5
	.loc 1 125 3
	li	a5,268439552
	addi	a5,a5,160
	.loc 1 125 54
	sext.w	a4,a4
	sw	a4,0(a5)
	.loc 1 126 75
	lla	a5,disk
	ld	a5,16(a5)
	.loc 1 126 81
	srli	a4,a5,32
	.loc 1 126 3
	li	a5,268439552
	addi	a5,a5,164
	.loc 1 126 54
	sext.w	a4,a4
	sw	a4,0(a5)
	.loc 1 129 3
	li	a5,268439552
	addi	a5,a5,68
	.loc 1 129 54
	li	a4,1
	sw	a4,0(a5)
.LBB2:
	.loc 1 132 12
	sw	zero,-20(s0)
	.loc 1 132 3
	j	.L10
.L11:
	.loc 1 133 18 discriminator 3
	lla	a4,disk
	lw	a5,-20(s0)
	add	a5,a4,a5
	li	a4,1
	sb	a4,24(a5)
	.loc 1 132 27 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L10:
	.loc 1 132 3 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,7
	ble	a4,a5,.L11
.LBE2:
	.loc 1 136 10
	lw	a5,-24(s0)
	ori	a5,a5,4
	sw	a5,-24(s0)
	.loc 1 137 3
	li	a5,268439552
	addi	a5,a5,112
	.loc 1 137 54
	lw	a4,-24(s0)
	sw	a4,0(a5)
	.loc 1 138 1
	lla	a0,.LC6
	call	printf
	.loc 1 140 1
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
	.size	virt_disk_init, .-virt_disk_init
	.align	2
	.type	alloc_desc, @function
alloc_desc:
.LFB1:
	.loc 1 145 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB3:
	.loc 1 146 12
	sw	zero,-20(s0)
	.loc 1 146 3
	j	.L13
.L16:
	.loc 1 148 18
	lla	a4,disk
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,24(a5)
	.loc 1 148 8
	beqz	a5,.L14
	.loc 1 150 20
	lla	a4,disk
	lw	a5,-20(s0)
	add	a5,a4,a5
	sb	zero,24(a5)
	.loc 1 151 14
	lw	a5,-20(s0)
	j	.L15
.L14:
	.loc 1 146 27 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L13:
	.loc 1 146 3 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,7
	ble	a4,a5,.L16
.LBE3:
	.loc 1 154 10
	li	a5,-1
.L15:
	.loc 1 155 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	alloc_desc, .-alloc_desc
	.section	.rodata
	.align	3
.LC7:
	.string	"free_desc 1"
	.align	3
.LC8:
	.string	"free_desc 2"
	.text
	.align	2
	.type	free_desc, @function
free_desc:
.LFB2:
	.loc 1 160 1
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
	sw	a5,-20(s0)
	.loc 1 161 6
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,7
	ble	a4,a5,.L18
	.loc 1 162 5
	lla	a0,.LC7
	call	panic
.L18:
	.loc 1 163 16
	lla	a4,disk
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,24(a5)
	.loc 1 163 6
	beqz	a5,.L19
	.loc 1 164 5
	lla	a0,.LC8
	call	panic
.L19:
	.loc 1 165 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 165 12
	lw	a5,-20(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 165 21
	sd	zero,0(a5)
	.loc 1 166 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 166 12
	lw	a5,-20(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 166 20
	sw	zero,8(a5)
	.loc 1 167 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 167 12
	lw	a5,-20(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 167 22
	sh	zero,12(a5)
	.loc 1 168 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 168 12
	lw	a5,-20(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 168 21
	sh	zero,14(a5)
	.loc 1 169 16
	lla	a4,disk
	lw	a5,-20(s0)
	add	a5,a4,a5
	li	a4,1
	sb	a4,24(a5)
	.loc 1 171 1
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
.LFE2:
	.size	free_desc, .-free_desc
	.align	2
	.type	free_chain, @function
free_chain:
.LFB3:
	.loc 1 176 1
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
.L24:
.LBB4:
	.loc 1 179 20
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 179 25
	lw	a5,-36(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 179 28
	lhu	a5,12(a5)
	.loc 1 179 9
	sw	a5,-20(s0)
	.loc 1 180 19
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 180 24
	lw	a5,-36(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 180 27
	lhu	a5,14(a5)
	.loc 1 180 9
	sw	a5,-24(s0)
	.loc 1 181 5
	lw	a5,-36(s0)
	mv	a0,a5
	call	free_desc
	.loc 1 182 14
	lw	a5,-20(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 1 182 8
	beqz	a5,.L25
	.loc 1 183 9
	lw	a5,-24(s0)
	sw	a5,-36(s0)
.LBE4:
	.loc 1 178 3
	j	.L24
.L25:
.LBB5:
	.loc 1 185 7
	nop
.LBE5:
	.loc 1 187 1
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
.LFE3:
	.size	free_chain, .-free_chain
	.align	2
	.type	alloc3_desc, @function
alloc3_desc:
.LFB4:
	.loc 1 193 1
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
	sd	a0,-56(s0)
.LBB6:
	.loc 1 194 12
	sw	zero,-36(s0)
	.loc 1 194 3
	j	.L27
.L32:
	.loc 1 196 8
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	s1,a4,a5
	.loc 1 196 14
	call	alloc_desc
	mv	a5,a0
	.loc 1 196 12
	sw	a5,0(s1)
	.loc 1 197 12
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 1 197 8
	bgez	a5,.L28
.LBB7:
	.loc 1 199 16
	sw	zero,-40(s0)
	.loc 1 199 7
	j	.L29
.L30:
	.loc 1 200 22 discriminator 3
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	.loc 1 200 9 discriminator 3
	lw	a5,0(a5)
	mv	a0,a5
	call	free_desc
	.loc 1 199 31 discriminator 3
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L29:
	.loc 1 199 7 discriminator 1
	lw	a4,-40(s0)
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L30
.LBE7:
	.loc 1 201 14
	li	a5,-1
	j	.L31
.L28:
	.loc 1 194 27 discriminator 2
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L27:
	.loc 1 194 3 discriminator 1
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L32
.LBE6:
	.loc 1 204 10
	li	a5,0
.L31:
	.loc 1 205 1
	mv	a0,a5
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
.LFE4:
	.size	alloc3_desc, .-alloc3_desc
	.align	2
	.globl	virtio_disk_rw
	.type	virtio_disk_rw, @function
virtio_disk_rw:
.LFB5:
	.loc 1 208 1
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
	mv	a5,a1
	sw	a5,-60(s0)
	.loc 1 209 27
	ld	a5,-56(s0)
	lw	a5,12(a5)
	.loc 1 209 37
	slliw	a5,a5,1
	sext.w	a5,a5
	.loc 1 209 17
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,-24(s0)
.L36:
	.loc 1 221 9
	addi	a5,s0,-48
	mv	a0,a5
	call	alloc3_desc
	mv	a5,a0
	.loc 1 221 8
	beqz	a5,.L43
	j	.L36
.L43:
	.loc 1 223 7
	nop
	.loc 1 231 46
	lw	a5,-48(s0)
	.loc 1 231 26
	addi	a5,a5,10
	slli	a4,a5,4
	lla	a5,disk
	add	a5,a4,a5
	addi	a5,a5,8
	sd	a5,-32(s0)
	.loc 1 233 6
	lw	a5,-60(s0)
	sext.w	a5,a5
	beqz	a5,.L37
	.loc 1 234 16
	ld	a5,-32(s0)
	li	a4,1
	sw	a4,0(a5)
	j	.L38
.L37:
	.loc 1 236 16
	ld	a5,-32(s0)
	sw	zero,0(a5)
.L38:
	.loc 1 237 18
	ld	a5,-32(s0)
	sw	zero,4(a5)
	.loc 1 238 16
	ld	a5,-32(s0)
	ld	a4,-24(s0)
	sd	a4,8(a5)
	.loc 1 240 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 240 16
	lw	a5,-48(s0)
	.loc 1 240 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 240 28
	ld	a4,-32(s0)
	.loc 1 240 26
	sd	a4,0(a5)
	.loc 1 241 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 241 16
	lw	a5,-48(s0)
	.loc 1 241 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 241 25
	li	a4,16
	sw	a4,8(a5)
	.loc 1 242 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 242 16
	lw	a5,-48(s0)
	.loc 1 242 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 242 27
	li	a4,1
	sh	a4,12(a5)
	.loc 1 243 31
	lw	a3,-44(s0)
	.loc 1 243 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 243 16
	lw	a5,-48(s0)
	.loc 1 243 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 243 26
	slli	a4,a3,48
	srli	a4,a4,48
	sh	a4,14(a5)
	.loc 1 245 43
	ld	a5,-56(s0)
	addi	a3,a5,40
	.loc 1 245 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 245 16
	lw	a5,-44(s0)
	.loc 1 245 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 245 28
	mv	a4,a3
	.loc 1 245 26
	sd	a4,0(a5)
	.loc 1 246 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 246 16
	lw	a5,-44(s0)
	.loc 1 246 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 246 25
	li	a4,1024
	sw	a4,8(a5)
	.loc 1 247 6
	lw	a5,-60(s0)
	sext.w	a5,a5
	beqz	a5,.L39
	.loc 1 248 9
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 248 18
	lw	a5,-44(s0)
	.loc 1 248 14
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 248 29
	sh	zero,12(a5)
	j	.L40
.L39:
	.loc 1 250 9
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 250 18
	lw	a5,-44(s0)
	.loc 1 250 14
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 250 29
	li	a4,2
	sh	a4,12(a5)
.L40:
	.loc 1 251 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 251 16
	lw	a5,-44(s0)
	.loc 1 251 27
	slli	a5,a5,4
	add	a5,a4,a5
	lhu	a4,12(a5)
	.loc 1 251 7
	lla	a5,disk
	ld	a3,0(a5)
	.loc 1 251 16
	lw	a5,-44(s0)
	.loc 1 251 27
	slli	a5,a5,4
	add	a5,a3,a5
	ori	a4,a4,1
	slli	a4,a4,48
	srli	a4,a4,48
	sh	a4,12(a5)
	.loc 1 252 31
	lw	a3,-40(s0)
	.loc 1 252 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 252 16
	lw	a5,-44(s0)
	.loc 1 252 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 252 26
	slli	a4,a3,48
	srli	a4,a4,48
	sh	a4,14(a5)
	.loc 1 254 16
	lw	a5,-48(s0)
	.loc 1 254 28
	lla	a4,disk
	addi	a5,a5,2
	slli	a5,a5,4
	add	a5,a4,a5
	li	a4,-1
	sb	a4,16(a5)
	.loc 1 255 57
	lw	a5,-48(s0)
	.loc 1 255 43
	addi	a5,a5,2
	slli	a4,a5,4
	lla	a5,disk
	add	a5,a4,a5
	addi	a3,a5,16
	.loc 1 255 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 255 16
	lw	a5,-40(s0)
	.loc 1 255 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 255 28
	mv	a4,a3
	.loc 1 255 26
	sd	a4,0(a5)
	.loc 1 256 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 256 16
	lw	a5,-40(s0)
	.loc 1 256 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 256 25
	li	a4,1
	sw	a4,8(a5)
	.loc 1 257 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 257 16
	lw	a5,-40(s0)
	.loc 1 257 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 257 27
	li	a4,2
	sh	a4,12(a5)
	.loc 1 258 7
	lla	a5,disk
	ld	a4,0(a5)
	.loc 1 258 16
	lw	a5,-40(s0)
	.loc 1 258 12
	slli	a5,a5,4
	add	a5,a4,a5
	.loc 1 258 26
	sh	zero,14(a5)
	.loc 1 261 11
	ld	a5,-56(s0)
	li	a4,1
	sw	a4,4(a5)
	.loc 1 262 16
	lw	a5,-48(s0)
	.loc 1 262 23
	lla	a4,disk
	addi	a5,a5,2
	slli	a5,a5,4
	add	a5,a4,a5
	ld	a4,-56(s0)
	sd	a4,8(a5)
	.loc 1 265 46
	lw	a4,-48(s0)
	.loc 1 265 7
	lla	a5,disk
	ld	a3,8(a5)
	.loc 1 265 24
	lla	a5,disk
	ld	a5,8(a5)
	.loc 1 265 30
	lhu	a5,2(a5)
	.loc 1 265 36
	sext.w	a5,a5
	andi	a5,a5,7
	sext.w	a5,a5
	.loc 1 265 41
	slli	a4,a4,48
	srli	a4,a4,48
	slli	a5,a5,1
	add	a5,a3,a5
	sh	a4,4(a5)
	.loc 1 267 3
	fence	iorw,iorw
	.loc 1 270 7
	lla	a5,disk
	ld	a5,8(a5)
	.loc 1 270 19
	lhu	a4,2(a5)
	.loc 1 270 7
	lla	a5,disk
	ld	a5,8(a5)
	.loc 1 270 19
	addiw	a4,a4,1
	slli	a4,a4,48
	srli	a4,a4,48
	sh	a4,2(a5)
	.loc 1 272 3
	fence	iorw,iorw
	.loc 1 274 3
	li	a5,268439552
	addi	a5,a5,80
	.loc 1 274 54
	sw	zero,0(a5)
	.loc 1 278 9
	nop
.L41:
	.loc 1 278 11 discriminator 1
	ld	a5,-56(s0)
	lw	a5,4(a5)
	.loc 1 278 9 discriminator 1
	mv	a4,a5
	li	a5,1
	beq	a4,a5,.L41
	.loc 1 283 16
	lw	a5,-48(s0)
	.loc 1 283 23
	lla	a4,disk
	addi	a5,a5,2
	slli	a5,a5,4
	add	a5,a4,a5
	sd	zero,8(a5)
	.loc 1 284 3
	lw	a5,-48(s0)
	mv	a0,a5
	call	free_chain
	.loc 1 287 1
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
.LFE5:
	.size	virtio_disk_rw, .-virtio_disk_rw
	.section	.rodata
	.align	3
.LC9:
	.string	"virtio_disk_intr status"
	.text
	.align	2
	.globl	virtio_intr
	.type	virtio_intr, @function
virtio_intr:
.LFB6:
	.loc 1 290 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 291 55
	li	a5,268439552
	addi	a5,a5,96
	lw	a5,0(a5)
	sext.w	a4,a5
	.loc 1 291 2
	li	a5,268439552
	addi	a5,a5,100
	.loc 1 291 106
	andi	a4,a4,3
	sext.w	a4,a4
	.loc 1 291 53
	sw	a4,0(a5)
	.loc 1 293 8
	j	.L45
.L47:
.LBB8:
	.loc 1 295 3
	fence	iorw,iorw
	.loc 1 296 16
	lla	a5,disk
	ld	a4,16(a5)
	.loc 1 296 32
	lla	a5,disk
	lhu	a5,32(a5)
	.loc 1 296 42
	sext.w	a5,a5
	andi	a5,a5,7
	sext.w	a5,a5
	.loc 1 296 46
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a5,4(a5)
	.loc 1 296 7
	sw	a5,-20(s0)
	.loc 1 298 20
	lla	a4,disk
	lw	a5,-20(s0)
	addi	a5,a5,2
	slli	a5,a5,4
	add	a5,a4,a5
	lbu	a5,16(a5)
	.loc 1 298 6
	beqz	a5,.L46
	.loc 1 299 5
	lla	a0,.LC9
	call	panic
.L46:
	.loc 1 301 15
	lla	a4,disk
	lw	a5,-20(s0)
	addi	a5,a5,2
	slli	a5,a5,4
	add	a5,a4,a5
	ld	a5,8(a5)
	sd	a5,-32(s0)
	.loc 1 302 11
	ld	a5,-32(s0)
	sw	zero,4(a5)
	.loc 1 305 17
	lla	a5,disk
	lhu	a5,32(a5)
	addiw	a5,a5,1
	slli	a4,a5,48
	srli	a4,a4,48
	lla	a5,disk
	sh	a4,32(a5)
.L45:
.LBE8:
	.loc 1 293 13
	lla	a5,disk
	lhu	a4,32(a5)
	.loc 1 293 30
	lla	a5,disk
	ld	a5,16(a5)
	.loc 1 293 35
	lhu	a5,2(a5)
	.loc 1 293 8
	sext.w	a4,a4
	sext.w	a5,a5
	bne	a4,a5,.L47
	.loc 1 308 1
	nop
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
.LFE6:
	.size	virtio_intr, .-virtio_intr
.Letext0:
	.file 2 "src/virt_disk.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x563
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF39
	.byte	0xc
	.4byte	.LASF40
	.4byte	.LASF41
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF6
	.byte	0x10
	.byte	0x2
	.byte	0x34
	.byte	0x8
	.4byte	0x6f
	.byte	0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x36
	.byte	0x11
	.4byte	0x6f
	.byte	0
	.byte	0x4
	.string	"len"
	.byte	0x2
	.byte	0x37
	.byte	0x10
	.4byte	0x76
	.byte	0x8
	.byte	0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x38
	.byte	0x12
	.4byte	0x7d
	.byte	0xc
	.byte	0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x39
	.byte	0x12
	.4byte	0x7d
	.byte	0xe
	.byte	0
	.byte	0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.4byte	.LASF7
	.byte	0x16
	.byte	0x2
	.byte	0x3f
	.byte	0x8
	.4byte	0xc6
	.byte	0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x41
	.byte	0x12
	.4byte	0x7d
	.byte	0
	.byte	0x4
	.string	"idx"
	.byte	0x2
	.byte	0x42
	.byte	0x12
	.4byte	0x7d
	.byte	0x2
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x43
	.byte	0x12
	.4byte	0xc6
	.byte	0x4
	.byte	0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x44
	.byte	0x12
	.4byte	0x7d
	.byte	0x14
	.byte	0
	.byte	0x6
	.4byte	0x7d
	.4byte	0xd6
	.byte	0x7
	.4byte	0x6f
	.byte	0x7
	.byte	0
	.byte	0x2
	.4byte	.LASF10
	.byte	0x8
	.byte	0x2
	.byte	0x49
	.byte	0x8
	.4byte	0xfd
	.byte	0x4
	.string	"id"
	.byte	0x2
	.byte	0x4b
	.byte	0x10
	.4byte	0x76
	.byte	0
	.byte	0x4
	.string	"len"
	.byte	0x2
	.byte	0x4c
	.byte	0x10
	.4byte	0x76
	.byte	0x4
	.byte	0
	.byte	0x2
	.4byte	.LASF11
	.byte	0x44
	.byte	0x2
	.byte	0x4f
	.byte	0x8
	.4byte	0x132
	.byte	0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x51
	.byte	0x12
	.4byte	0x7d
	.byte	0
	.byte	0x4
	.string	"idx"
	.byte	0x2
	.byte	0x52
	.byte	0x12
	.4byte	0x7d
	.byte	0x2
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x53
	.byte	0x1a
	.4byte	0x132
	.byte	0x4
	.byte	0
	.byte	0x6
	.4byte	0xd6
	.4byte	0x142
	.byte	0x7
	.4byte	0x6f
	.byte	0x7
	.byte	0
	.byte	0x2
	.4byte	.LASF12
	.byte	0x10
	.byte	0x2
	.byte	0x56
	.byte	0x8
	.4byte	0x177
	.byte	0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x58
	.byte	0x10
	.4byte	0x76
	.byte	0
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x59
	.byte	0x10
	.4byte	0x76
	.byte	0x4
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x5a
	.byte	0x11
	.4byte	0x6f
	.byte	0x8
	.byte	0
	.byte	0x8
	.string	"buf"
	.2byte	0x428
	.byte	0x2
	.byte	0x5e
	.byte	0x8
	.4byte	0x1ee
	.byte	0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x60
	.byte	0x6
	.4byte	0x1ee
	.byte	0
	.byte	0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0x61
	.byte	0x6
	.4byte	0x1ee
	.byte	0x4
	.byte	0x4
	.string	"dev"
	.byte	0x2
	.byte	0x62
	.byte	0xf
	.4byte	0x76
	.byte	0x8
	.byte	0x3
	.4byte	.LASF18
	.byte	0x2
	.byte	0x63
	.byte	0xf
	.4byte	0x76
	.byte	0xc
	.byte	0x3
	.4byte	.LASF19
	.byte	0x2
	.byte	0x64
	.byte	0xf
	.4byte	0x76
	.byte	0x10
	.byte	0x4
	.string	"pre"
	.byte	0x2
	.byte	0x65
	.byte	0xe
	.4byte	0x1f5
	.byte	0x18
	.byte	0x4
	.string	"nxt"
	.byte	0x2
	.byte	0x66
	.byte	0xe
	.4byte	0x1f5
	.byte	0x20
	.byte	0x3
	.4byte	.LASF20
	.byte	0x2
	.byte	0x67
	.byte	0x10
	.4byte	0x1fb
	.byte	0x28
	.byte	0
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xa
	.byte	0x8
	.4byte	0x177
	.byte	0x6
	.4byte	0x20c
	.4byte	0x20c
	.byte	0xb
	.4byte	0x6f
	.2byte	0x3ff
	.byte	0
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF21
	.byte	0xc
	.byte	0x10
	.byte	0x1
	.byte	0x22
	.byte	0x3
	.4byte	0x235
	.byte	0x4
	.string	"b"
	.byte	0x1
	.byte	0x24
	.byte	0x11
	.4byte	0x1f5
	.byte	0
	.byte	0x3
	.4byte	.LASF22
	.byte	0x1
	.byte	0x25
	.byte	0xa
	.4byte	0x235
	.byte	0x8
	.byte	0
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF23
	.byte	0xd
	.4byte	.LASF17
	.2byte	0x128
	.byte	0x1
	.byte	0x7
	.byte	0xf
	.4byte	0x2a6
	.byte	0x3
	.4byte	.LASF24
	.byte	0x1
	.byte	0xe
	.byte	0x16
	.4byte	0x2a6
	.byte	0
	.byte	0x3
	.4byte	.LASF25
	.byte	0x1
	.byte	0x14
	.byte	0x17
	.4byte	0x2ac
	.byte	0x8
	.byte	0x3
	.4byte	.LASF26
	.byte	0x1
	.byte	0x19
	.byte	0x16
	.4byte	0x2b2
	.byte	0x10
	.byte	0x3
	.4byte	.LASF27
	.byte	0x1
	.byte	0x1c
	.byte	0x8
	.4byte	0x2b8
	.byte	0x18
	.byte	0x3
	.4byte	.LASF28
	.byte	0x1
	.byte	0x1d
	.byte	0x12
	.4byte	0x7d
	.byte	0x20
	.byte	0x3
	.4byte	.LASF29
	.byte	0x1
	.byte	0x26
	.byte	0x5
	.4byte	0x2c8
	.byte	0x28
	.byte	0x4
	.string	"ops"
	.byte	0x1
	.byte	0x2a
	.byte	0x19
	.4byte	0x2d8
	.byte	0xa8
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x2d
	.byte	0xa
	.byte	0x8
	.4byte	0x84
	.byte	0xa
	.byte	0x8
	.4byte	0xfd
	.byte	0x6
	.4byte	0x235
	.4byte	0x2c8
	.byte	0x7
	.4byte	0x6f
	.byte	0x7
	.byte	0
	.byte	0x6
	.4byte	0x213
	.4byte	0x2d8
	.byte	0x7
	.4byte	0x6f
	.byte	0x7
	.byte	0
	.byte	0x6
	.4byte	0x142
	.4byte	0x2e8
	.byte	0x7
	.4byte	0x6f
	.byte	0x7
	.byte	0
	.byte	0xe
	.4byte	.LASF17
	.byte	0x1
	.byte	0x2e
	.byte	0x3
	.4byte	0x23c
	.byte	0x9
	.byte	0x3
	.8byte	disk
	.byte	0xf
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x121
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x34d
	.byte	0x10
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x11
	.string	"id"
	.byte	0x1
	.2byte	0x128
	.byte	0x7
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x11
	.string	"b"
	.byte	0x1
	.2byte	0x12d
	.byte	0xf
	.4byte	0x1f5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x12
	.4byte	.LASF42
	.byte	0x1
	.byte	0xcf
	.byte	0x6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b5
	.byte	0x13
	.string	"b"
	.byte	0x1
	.byte	0xcf
	.byte	0x21
	.4byte	0x1f5
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x14
	.4byte	.LASF30
	.byte	0x1
	.byte	0xcf
	.byte	0x28
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0xe
	.4byte	.LASF15
	.byte	0x1
	.byte	0xd1
	.byte	0x11
	.4byte	0x6f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x15
	.string	"idx"
	.byte	0x1
	.byte	0xda
	.byte	0x7
	.4byte	0x3b5
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xe
	.4byte	.LASF31
	.byte	0x1
	.byte	0xe7
	.byte	0x1a
	.4byte	0x3c5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x6
	.4byte	0x1ee
	.4byte	0x3c5
	.byte	0x7
	.4byte	0x6f
	.byte	0x2
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x142
	.byte	0x16
	.4byte	.LASF43
	.byte	0x1
	.byte	0xc0
	.byte	0x1
	.4byte	0x1ee
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x43b
	.byte	0x13
	.string	"idx"
	.byte	0x1
	.byte	0xc0
	.byte	0x12
	.4byte	0x43b
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x10
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0x15
	.string	"i"
	.byte	0x1
	.byte	0xc2
	.byte	0xc
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x10
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x15
	.string	"j"
	.byte	0x1
	.byte	0xc7
	.byte	0x10
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x1ee
	.byte	0x17
	.4byte	.LASF33
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x491
	.byte	0x13
	.string	"i"
	.byte	0x1
	.byte	0xaf
	.byte	0x10
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x18
	.4byte	.Ldebug_ranges0+0
	.byte	0xe
	.4byte	.LASF32
	.byte	0x1
	.byte	0xb3
	.byte	0x9
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x15
	.string	"nxt"
	.byte	0x1
	.byte	0xb4
	.byte	0x9
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LASF34
	.byte	0x1
	.byte	0x9f
	.byte	0x1
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x4bd
	.byte	0x13
	.string	"i"
	.byte	0x1
	.byte	0x9f
	.byte	0xf
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x19
	.4byte	.LASF35
	.byte	0x1
	.byte	0x90
	.byte	0x1
	.4byte	0x1ee
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x4ff
	.byte	0x10
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x15
	.string	"i"
	.byte	0x1
	.byte	0x92
	.byte	0xc
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF37
	.byte	0x1
	.byte	0x30
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0x32
	.byte	0x10
	.4byte	0x76
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xe
	.4byte	.LASF38
	.byte	0x1
	.byte	0x4a
	.byte	0x11
	.4byte	0x6f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x15
	.string	"max"
	.byte	0x1
	.byte	0x65
	.byte	0x10
	.4byte	0x76
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x10
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x15
	.string	"i"
	.byte	0x1
	.byte	0x84
	.byte	0xc
	.4byte	0x1ee
	.byte	0x2
	.byte	0x91
	.byte	0x6c
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
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
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
	.byte	0x9
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
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x13
	.byte	0x1
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
	.byte	0xd
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
	.byte	0xe
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
	.byte	0x5
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
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
	.byte	0x1a
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LBB4-.Ltext0
	.8byte	.LBE4-.Ltext0
	.8byte	.LBB5-.Ltext0
	.8byte	.LBE5-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"blockno"
.LASF6:
	.string	"virtq_desc"
.LASF2:
	.string	"next"
.LASF31:
	.string	"buf0"
.LASF43:
	.string	"alloc3_desc"
.LASF14:
	.string	"reserved"
.LASF11:
	.string	"virtq_used"
.LASF5:
	.string	"short unsigned int"
.LASF28:
	.string	"used_idx"
.LASF24:
	.string	"desc"
.LASF7:
	.string	"virtq_avail"
.LASF10:
	.string	"virtq_used_elem"
.LASF20:
	.string	"data"
.LASF21:
	.string	"unsigned char"
.LASF35:
	.string	"alloc_desc"
.LASF39:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF33:
	.string	"free_chain"
.LASF0:
	.string	"addr"
.LASF42:
	.string	"virtio_disk_rw"
.LASF30:
	.string	"write"
.LASF19:
	.string	"refcnt"
.LASF29:
	.string	"info"
.LASF3:
	.string	"long unsigned int"
.LASF12:
	.string	"virtio_blk_req"
.LASF25:
	.string	"avail"
.LASF40:
	.string	"src/virt_disk.c"
.LASF37:
	.string	"virt_disk_init"
.LASF4:
	.string	"unsigned int"
.LASF1:
	.string	"flags"
.LASF32:
	.string	"flag"
.LASF36:
	.string	"virtio_intr"
.LASF17:
	.string	"disk"
.LASF9:
	.string	"unused"
.LASF41:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF27:
	.string	"free"
.LASF38:
	.string	"features"
.LASF23:
	.string	"char"
.LASF16:
	.string	"valid"
.LASF8:
	.string	"ring"
.LASF13:
	.string	"type"
.LASF15:
	.string	"sector"
.LASF26:
	.string	"used"
.LASF34:
	.string	"free_desc"
.LASF22:
	.string	"status"
	.ident	"GCC: () 9.3.0"
