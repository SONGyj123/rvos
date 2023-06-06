	.file	"fs.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	sb,32,8
	.align	2
	.globl	inode_which_block
	.type	inode_which_block, @function
inode_which_block:
.LFB0:
	.file 1 "src/fs.c"
	.loc 1 13 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	sd	s1,32(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	mv	s1,a1
	sw	a5,-36(s0)
	.loc 1 16 51
	lw	a4,-36(s0)
	li	a5,12
	divuw	a5,a4,a5
	sext.w	a4,a5
	.loc 1 16 55
	lw	a5,24(s1)
	.loc 1 16 14
	addw	a5,a4,a5
	sw	a5,-20(s0)
	.loc 1 18 9
	lw	a5,-20(s0)
	.loc 1 19 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	ld	s1,32(sp)
	.cfi_restore 9
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	inode_which_block, .-inode_which_block
	.align	2
	.globl	rd_inode
	.type	rd_inode, @function
rd_inode:
.LFB1:
	.loc 1 23 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-48(s0)
	sw	a5,-36(s0)
	.loc 1 24 20
	call	kalloc
	sd	a0,-24(s0)
	.loc 1 27 11
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,8(a5)
	.loc 1 28 17
	lla	a5,sb
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	a2,16(a5)
	lw	a3,20(a5)
	lw	a4,24(a5)
	lw	a5,28(a5)
	sw	a7,-80(s0)
	sw	a6,-76(s0)
	sw	a0,-72(s0)
	sw	a1,-68(s0)
	sw	a2,-64(s0)
	sw	a3,-60(s0)
	sw	a4,-56(s0)
	sw	a5,-52(s0)
	addi	a4,s0,-80
	lw	a5,-36(s0)
	mv	a1,a4
	mv	a0,a5
	call	inode_which_block
	mv	a5,a0
	sext.w	a4,a5
	.loc 1 28 15
	ld	a5,-24(s0)
	sw	a4,12(a5)
	.loc 1 29 13
	ld	a5,-24(s0)
	sw	zero,0(a5)
	.loc 1 30 14
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,16(a5)
	.loc 1 32 2
	li	a1,0
	ld	a0,-24(s0)
	call	virtio_disk_rw
	.loc 1 34 25
	ld	a5,-24(s0)
	addi	a4,a5,40
	.loc 1 34 45
	lw	a3,-36(s0)
	li	a5,12
	remuw	a5,a3,a5
	sext.w	a5,a5
	slli	a5,a5,32
	srli	a5,a5,32
	.loc 1 34 39
	slli	a5,a5,6
	.loc 1 34 4
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 35 18
	ld	a5,-48(s0)
	li	a4,1
	sw	a4,0(a5)
	.loc 1 36 20
	ld	a5,-48(s0)
	lw	a4,-36(s0)
	sw	a4,4(a5)
	.loc 1 37 21
	ld	a5,-48(s0)
	ld	a4,-32(s0)
	addi	a5,a5,16
	mv	a3,a4
	li	a4,64
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	.loc 1 39 2
	ld	a0,-24(s0)
	call	kfree
	.loc 1 40 1
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	rd_inode, .-rd_inode
	.section	.rodata
	.align	3
.LC0:
	.string	"blk_buf is NULL"
	.text
	.align	2
	.type	read_sb, @function
read_sb:
.LFB2:
	.loc 1 44 1
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
	.loc 1 45 24
	call	kalloc
	sd	a0,-24(s0)
	.loc 1 46 4
	ld	a5,-24(s0)
	bnez	a5,.L5
	.loc 1 48 3
	lla	a0,.LC0
	call	panic
.L5:
	.loc 1 51 15
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,8(a5)
	.loc 1 52 19
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,12(a5)
	.loc 1 53 17
	ld	a5,-24(s0)
	sw	zero,0(a5)
	.loc 1 54 18
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,16(a5)
	.loc 1 55 2
	li	a1,0
	ld	a0,-24(s0)
	call	virtio_disk_rw
	.loc 1 56 21
	ld	a5,-24(s0)
	addi	a5,a5,40
	.loc 1 56 2
	li	a2,32
	mv	a1,a5
	ld	a0,-40(s0)
	call	memmove
	.loc 1 58 2
	ld	a0,-24(s0)
	call	kfree
	.loc 1 59 1
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
.LFE2:
	.size	read_sb, .-read_sb
	.section	.rodata
	.align	3
.LC1:
	.string	"------------------wrong superblock\n"
	.align	3
.LC2:
	.string	"s_inode_blk: %d\n"
	.align	3
.LC3:
	.string	"s_data_blk: %d\n"
	.text
	.align	2
	.globl	fs_init
	.type	fs_init, @function
fs_init:
.LFB3:
	.loc 1 62 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 63 2
	lla	a0,sb
	call	read_sb
	.loc 1 64 7
	lla	a5,sb
	lw	a5,0(a5)
	.loc 1 64 4
	mv	a4,a5
	li	a5,1076895744
	addi	a5,a5,16
	beq	a4,a5,.L7
	.loc 1 66 3
	lla	a0,.LC1
	call	printf
	.loc 1 73 1
	j	.L9
.L7:
	.loc 1 70 3
	lla	a5,sb
	lw	a5,24(a5)
	mv	a1,a5
	lla	a0,.LC2
	call	printf
	.loc 1 71 3
	lla	a5,sb
	lw	a5,20(a5)
	mv	a1,a5
	lla	a0,.LC3
	call	printf
.L9:
	.loc 1 73 1
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
.LFE3:
	.size	fs_init, .-fs_init
	.align	2
	.globl	get_nxt_name
	.type	get_nxt_name, @function
get_nxt_name:
.LFB4:
	.loc 1 76 1
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
	.loc 1 78 6
	sw	zero,-24(s0)
.LBB2:
	.loc 1 79 10
	sw	zero,-20(s0)
	.loc 1 79 2
	j	.L11
.L12:
	.loc 1 81 7 discriminator 3
	lw	a5,-20(s0)
	ld	a4,-48(s0)
	add	a5,a4,a5
	.loc 1 81 11 discriminator 3
	sb	zero,0(a5)
	.loc 1 79 22 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L11:
	.loc 1 79 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,13
	ble	a4,a5,.L12
.LBE2:
	.loc 1 85 5
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 85 4
	bnez	a5,.L13
	.loc 1 87 10
	li	a5,0
	j	.L14
.L13:
	.loc 1 89 5
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 89 4
	mv	a4,a5
	li	a5,47
	bne	a4,a5,.L15
	.loc 1 91 7
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
	.loc 1 98 4
	ld	a5,-40(s0)
	sd	a5,-32(s0)
	.loc 1 100 7
	j	.L17
.L15:
	.loc 1 95 10
	li	a5,0
	j	.L14
.L19:
	.loc 1 102 7
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
.L17:
	.loc 1 100 8
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 100 7
	mv	a4,a5
	li	a5,47
	beq	a4,a5,.L18
	.loc 1 100 24 discriminator 1
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 100 21 discriminator 1
	bnez	a5,.L19
.L18:
	.loc 1 105 13
	ld	a4,-40(s0)
	ld	a5,-32(s0)
	sub	a5,a4,a5
	.loc 1 105 6
	sw	a5,-24(s0)
	.loc 1 106 2
	lw	a5,-24(s0)
	mv	a2,a5
	ld	a1,-32(s0)
	ld	a0,-48(s0)
	call	memmove
	.loc 1 108 9
	ld	a5,-40(s0)
.L14:
	.loc 1 109 1
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
.LFE4:
	.size	get_nxt_name, .-get_nxt_name
	.section	.rodata
	.align	3
.LC4:
	.string	"bad path\n"
	.align	3
.LC5:
	.string	"get_inode() failed!\n"
	.align	3
.LC6:
	.string	"nothing found!\n"
	.text
	.align	2
	.globl	get_inode
	.type	get_inode, @function
get_inode:
.LFB5:
	.loc 1 113 1
	.cfi_startproc
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sd	ra,152(sp)
	sd	s0,144(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,160
	.cfi_def_cfa 8, 0
	sd	a0,-152(s0)
	sd	a1,-160(s0)
	.loc 1 114 8
	ld	a5,-152(s0)
	sd	a5,-24(s0)
	.loc 1 116 6
	sw	zero,-32(s0)
	.loc 1 120 4
	ld	a5,-24(s0)
	bnez	a5,.L23
	.loc 1 122 3
	lla	a0,.LC4
	call	printf
	.loc 1 123 10
	li	a5,0
	j	.L29
.L28:
	.loc 1 128 9
	addi	a5,s0,-64
	mv	a1,a5
	ld	a0,-24(s0)
	call	get_nxt_name
	sd	a0,-24(s0)
	.loc 1 130 3
	lw	a5,-32(s0)
	addi	a4,s0,-144
	mv	a1,a4
	mv	a0,a5
	call	rd_inode
.LBB3:
	.loc 1 133 11
	sw	zero,-28(s0)
	.loc 1 133 3
	j	.L24
.L27:
.LBB4:
	.loc 1 135 26
	call	kalloc
	sd	a0,-40(s0)
	.loc 1 136 17
	ld	a5,-40(s0)
	li	a4,1
	sw	a4,8(a5)
	.loc 1 137 61
	lw	a5,-28(s0)
	sraiw	a4,a5,31
	srliw	a4,a4,22
	addw	a5,a4,a5
	sraiw	a5,a5,10
	sext.w	a5,a5
	.loc 1 137 53
	addi	a5,a5,4
	slli	a5,a5,2
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a4,-116(a5)
	.loc 1 137 21
	ld	a5,-40(s0)
	sw	a4,12(a5)
	.loc 1 138 19
	ld	a5,-40(s0)
	sw	zero,0(a5)
	.loc 1 139 20
	ld	a5,-40(s0)
	li	a4,1
	sw	a4,16(a5)
	.loc 1 141 4
	li	a1,0
	ld	a0,-40(s0)
	call	virtio_disk_rw
	.loc 1 144 54
	lw	a4,-28(s0)
	sraiw	a5,a4,31
	srliw	a5,a5,22
	addw	a4,a4,a5
	andi	a4,a4,1023
	subw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 144 11
	addi	a5,a5,32
	ld	a4,-40(s0)
	add	a5,a4,a5
	addi	a5,a5,8
	sd	a5,-48(s0)
	.loc 1 145 21
	ld	a5,-48(s0)
	addi	a5,a5,2
	.loc 1 145 7
	addi	a4,s0,-64
	li	a2,14
	mv	a1,a4
	mv	a0,a5
	call	strncmp
	mv	a5,a0
	.loc 1 145 6
	bnez	a5,.L25
	.loc 1 148 20
	ld	a5,-48(s0)
	lhu	a5,0(a5)
	.loc 1 148 5
	sext.w	a5,a5
	ld	a1,-160(s0)
	mv	a0,a5
	call	rd_inode
	.loc 1 149 5
	ld	a0,-40(s0)
	call	kfree
	.loc 1 150 5
	nop
.L26:
.LBE4:
.LBE3:
	.loc 1 162 9
	li	a5,1
	j	.L29
.L25:
.LBB6:
.LBB5:
	.loc 1 153 4 discriminator 2
	ld	a0,-40(s0)
	call	kfree
.LBE5:
	.loc 1 133 59 discriminator 2
	lw	a5,-28(s0)
	addiw	a5,a5,16
	sext.w	a5,a5
	sw	a5,-28(s0)
.L24:
	.loc 1 133 45 discriminator 1
	lw	a4,-120(s0)
	.loc 1 133 27 discriminator 1
	lw	a5,-28(s0)
	.loc 1 133 3 discriminator 1
	bgtu	a4,a5,.L27
.L23:
.LBE6:
	.loc 1 126 7
	ld	a5,-24(s0)
	bnez	a5,.L28
	.loc 1 157 2
	lla	a0,.LC5
	call	printf
	.loc 1 158 2
	lla	a0,.LC6
	call	printf
	.loc 1 159 9
	li	a5,0
.L29:
	.loc 1 163 1 discriminator 1
	mv	a0,a5
	ld	ra,152(sp)
	.cfi_restore 1
	ld	s0,144(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 160
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	get_inode, .-get_inode
	.section	.rodata
	.align	3
.LC7:
	.string	"out of range"
	.text
	.align	2
	.globl	blknum_to_addr
	.type	blknum_to_addr, @function
blknum_to_addr:
.LFB6:
	.loc 1 167 1
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
	.loc 1 168 15
	sw	zero,-20(s0)
	.loc 1 170 4
	lw	a5,-60(s0)
	sext.w	a4,a5
	li	a5,11
	bgtu	a4,a5,.L31
	.loc 1 172 8
	ld	a4,-56(s0)
	lwu	a5,-60(s0)
	addi	a5,a5,4
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,12(a5)
	sw	a5,-20(s0)
	.loc 1 173 10
	lw	a5,-20(s0)
	j	.L32
.L31:
	.loc 1 177 35
	call	kalloc
	sd	a0,-32(s0)
	.loc 1 179 9
	lw	a5,-60(s0)
	addiw	a5,a5,-12
	sw	a5,-60(s0)
	.loc 1 181 4
	lw	a5,-60(s0)
	sext.w	a4,a5
	li	a5,255
	bgtu	a4,a5,.L33
	.loc 1 184 8
	ld	a5,-56(s0)
	lw	a5,76(a5)
	sw	a5,-20(s0)
	.loc 1 186 27
	ld	a5,-32(s0)
	li	a4,1
	sw	a4,8(a5)
	.loc 1 187 31
	ld	a5,-32(s0)
	lw	a4,-20(s0)
	sw	a4,12(a5)
	.loc 1 188 29
	ld	a5,-32(s0)
	sw	zero,0(a5)
	.loc 1 189 30
	ld	a5,-32(s0)
	li	a4,1
	sw	a4,16(a5)
	.loc 1 191 3
	li	a1,0
	ld	a0,-32(s0)
	call	virtio_disk_rw
	.loc 1 193 12
	ld	a5,-32(s0)
	addi	a5,a5,40
	sd	a5,-40(s0)
	.loc 1 194 18
	lwu	a5,-60(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	.loc 1 194 8
	lw	a5,0(a5)
	sw	a5,-20(s0)
	.loc 1 196 3
	ld	a0,-32(s0)
	call	kfree
	.loc 1 197 10
	lw	a5,-20(s0)
	j	.L32
.L33:
	.loc 1 200 2
	lla	a0,.LC7
	call	panic
	.loc 1 202 9
	li	a5,0
.L32:
	.loc 1 203 1
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
.LFE6:
	.size	blknum_to_addr, .-blknum_to_addr
	.section	.rodata
	.align	3
.LC8:
	.string	"bad elf\n"
	.text
	.align	2
	.globl	read_elfhr
	.type	read_elfhr, @function
read_elfhr:
.LFB7:
	.loc 1 206 1
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
	sd	a2,-56(s0)
	.loc 1 207 24
	call	kalloc
	sd	a0,-24(s0)
	.loc 1 208 4
	ld	a5,-24(s0)
	bnez	a5,.L35
	.loc 1 210 3
	lla	a0,.LC0
	call	panic
.L35:
	.loc 1 213 15
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,8(a5)
	.loc 1 214 50
	ld	a5,-56(s0)
	lw	a4,28(a5)
	.loc 1 214 19
	ld	a5,-24(s0)
	sw	a4,12(a5)
	.loc 1 215 17
	ld	a5,-24(s0)
	sw	zero,0(a5)
	.loc 1 216 18
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,16(a5)
	.loc 1 218 2
	li	a1,0
	ld	a0,-24(s0)
	call	virtio_disk_rw
	.loc 1 220 18
	ld	a5,-24(s0)
	lbu	a5,40(a5)
	.loc 1 220 4
	mv	a4,a5
	li	a5,127
	bne	a4,a5,.L36
	.loc 1 220 46 discriminator 1
	ld	a5,-24(s0)
	lbu	a5,41(a5)
	.loc 1 220 30 discriminator 1
	mv	a4,a5
	li	a5,69
	bne	a4,a5,.L36
	.loc 1 220 73 discriminator 2
	ld	a5,-24(s0)
	lbu	a5,42(a5)
	.loc 1 220 57 discriminator 2
	mv	a4,a5
	li	a5,76
	bne	a4,a5,.L36
	.loc 1 220 100 discriminator 3
	ld	a5,-24(s0)
	lbu	a5,43(a5)
	.loc 1 220 84 discriminator 3
	mv	a4,a5
	li	a5,70
	beq	a4,a5,.L37
.L36:
	.loc 1 222 3
	lla	a0,.LC8
	call	printf
	.loc 1 223 3
	j	.L38
.L37:
	.loc 1 227 27
	ld	a5,-24(s0)
	addi	a4,a5,40
	.loc 1 227 7
	ld	a5,-40(s0)
	ld	t1,0(a4)
	ld	a7,8(a4)
	ld	a6,16(a4)
	ld	a0,24(a4)
	ld	a1,32(a4)
	ld	a2,40(a4)
	ld	a3,48(a4)
	ld	a4,56(a4)
	sd	t1,0(a5)
	sd	a7,8(a5)
	sd	a6,16(a5)
	sd	a0,24(a5)
	sd	a1,32(a5)
	sd	a2,40(a5)
	sd	a3,48(a5)
	sd	a4,56(a5)
	.loc 1 228 49
	ld	a5,-24(s0)
	addi	a5,a5,40
	.loc 1 228 13
	addi	a4,a5,64
	.loc 1 228 10
	ld	a5,-48(s0)
	ld	a7,0(a4)
	ld	a6,8(a4)
	ld	a0,16(a4)
	ld	a1,24(a4)
	ld	a2,32(a4)
	ld	a3,40(a4)
	ld	a4,48(a4)
	sd	a7,0(a5)
	sd	a6,8(a5)
	sd	a0,16(a5)
	sd	a1,24(a5)
	sd	a2,32(a5)
	sd	a3,40(a5)
	sd	a4,48(a5)
	.loc 1 229 32
	ld	a5,-24(s0)
	addi	a5,a5,40
	.loc 1 229 13
	addi	a4,a5,120
	.loc 1 229 6
	ld	a5,-48(s0)
	addi	a5,a5,56
	.loc 1 229 10
	ld	a7,0(a4)
	ld	a6,8(a4)
	ld	a0,16(a4)
	ld	a1,24(a4)
	ld	a2,32(a4)
	ld	a3,40(a4)
	ld	a4,48(a4)
	sd	a7,0(a5)
	sd	a6,8(a5)
	sd	a0,16(a5)
	sd	a1,24(a5)
	sd	a2,32(a5)
	sd	a3,40(a5)
	sd	a4,48(a5)
.L38:
	.loc 1 232 2
	ld	a0,-24(s0)
	call	kfree
	.loc 1 233 1
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
.LFE7:
	.size	read_elfhr, .-read_elfhr
	.align	2
	.globl	read_from_inode
	.type	read_from_inode, @function
read_from_inode:
.LFB8:
	.loc 1 238 1
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
	mv	a5,a3
	sw	a5,-76(s0)
	mv	a5,a4
	sw	a5,-80(s0)
	.loc 1 239 15
	sw	zero,-20(s0)
	.loc 1 240 36
	ld	a5,-72(s0)
	srli	a5,a5,10
	.loc 1 240 15
	sw	a5,-24(s0)
	.loc 1 241 34
	ld	a5,-72(s0)
	sext.w	a5,a5
	.loc 1 241 15
	andi	a5,a5,1023
	sw	a5,-28(s0)
	.loc 1 242 15
	sw	zero,-32(s0)
	.loc 1 244 24
	call	kalloc
	sd	a0,-40(s0)
	.loc 1 246 14
	sw	zero,-20(s0)
	.loc 1 246 2
	j	.L40
.L44:
	.loc 1 248 24
	ld	a5,-72(s0)
	srli	a5,a5,10
	.loc 1 248 16
	sw	a5,-24(s0)
	.loc 1 249 16
	ld	a5,-40(s0)
	li	a4,1
	sw	a4,8(a5)
	.loc 1 250 22
	lw	a5,-24(s0)
	mv	a1,a5
	ld	a0,-56(s0)
	call	blknum_to_addr
	mv	a5,a0
	sext.w	a4,a5
	.loc 1 250 20
	ld	a5,-40(s0)
	sw	a4,12(a5)
	.loc 1 251 18
	ld	a5,-40(s0)
	sw	zero,0(a5)
	.loc 1 252 19
	ld	a5,-40(s0)
	li	a4,1
	sw	a4,16(a5)
	.loc 1 254 3
	li	a1,0
	ld	a0,-40(s0)
	call	virtio_disk_rw
	.loc 1 255 29
	li	a4,1024
	lw	a5,-28(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 255 17
	mv	a2,a5
	lw	a5,-76(s0)
	sext.w	a3,a5
	sext.w	a4,a2
	bleu	a3,a4,.L41
	mv	a5,a2
.L41:
	sw	a5,-32(s0)
	.loc 1 257 5
	lw	a5,-80(s0)
	sext.w	a5,a5
	bnez	a5,.L42
	.loc 1 259 4
	ld	a4,-64(s0)
	.loc 1 259 24
	ld	a5,-40(s0)
	addi	a5,a5,40
	.loc 1 259 4
	lw	a3,-32(s0)
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	memmove
	j	.L43
.L42:
	.loc 1 263 25
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 1 263 4
	ld	a0,8(a5)
	ld	a1,-64(s0)
	.loc 1 263 48
	ld	a5,-40(s0)
	addi	a4,a5,40
	.loc 1 263 4
	lwu	a5,-28(s0)
	add	a5,a4,a5
	lwu	a4,-32(s0)
	mv	a3,a4
	mv	a2,a5
	call	copy_to_user
.L43:
	.loc 1 246 40 discriminator 2
	lw	a4,-20(s0)
	lw	a5,-32(s0)
	addw	a5,a4,a5
	sw	a5,-20(s0)
	.loc 1 246 63 discriminator 2
	lwu	a5,-32(s0)
	ld	a4,-72(s0)
	add	a5,a4,a5
	sd	a5,-72(s0)
	.loc 1 246 83 discriminator 2
	lwu	a5,-32(s0)
	ld	a4,-64(s0)
	add	a5,a4,a5
	sd	a5,-64(s0)
.L40:
	.loc 1 246 2 discriminator 1
	lw	a4,-20(s0)
	lw	a5,-76(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L44
	.loc 1 267 2
	ld	a0,-40(s0)
	call	kfree
	.loc 1 269 9
	li	a5,0
	.loc 1 270 1
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
	.size	read_from_inode, .-read_from_inode
	.align	2
	.globl	write_to_inode
	.type	write_to_inode, @function
write_to_inode:
.LFB9:
	.loc 1 273 1
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
	mv	a5,a3
	sw	a5,-76(s0)
	mv	a5,a4
	sw	a5,-80(s0)
	.loc 1 278 24
	call	kalloc
	sd	a0,-24(s0)
.LBB7:
	.loc 1 280 10
	sw	zero,-28(s0)
	.loc 1 280 2
	j	.L47
.L50:
	.loc 1 283 24
	ld	a5,-72(s0)
	srli	a5,a5,10
	.loc 1 283 16
	sw	a5,-32(s0)
	.loc 1 284 14
	ld	a5,-72(s0)
	sext.w	a5,a5
	.loc 1 284 6
	andi	a5,a5,1023
	sw	a5,-36(s0)
	.loc 1 287 16
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,8(a5)
	.loc 1 288 22
	lw	a5,-32(s0)
	mv	a1,a5
	ld	a0,-56(s0)
	call	blknum_to_addr
	mv	a5,a0
	sext.w	a4,a5
	.loc 1 288 20
	ld	a5,-24(s0)
	sw	a4,12(a5)
	.loc 1 289 18
	ld	a5,-24(s0)
	sw	zero,0(a5)
	.loc 1 290 19
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,16(a5)
	.loc 1 292 3
	li	a1,0
	ld	a0,-24(s0)
	call	virtio_disk_rw
	.loc 1 295 15
	li	a4,1024
	lw	a5,-36(s0)
	subw	a5,a4,a5
	sw	a5,-40(s0)
	.loc 1 296 17
	lw	a2,-76(s0)
	lw	a5,-40(s0)
	sext.w	a3,a5
	sext.w	a4,a2
	bleu	a3,a4,.L48
	mv	a5,a2
.L48:
	sw	a5,-44(s0)
	.loc 1 298 5
	lw	a5,-80(s0)
	sext.w	a5,a5
	bnez	a5,.L49
	.loc 1 300 27
	lla	a5,proc_ptr
	ld	a5,0(a5)
	.loc 1 300 4
	ld	a0,8(a5)
	.loc 1 300 45
	ld	a5,-24(s0)
	addi	a4,a5,40
	.loc 1 300 4
	lwu	a5,-36(s0)
	add	a5,a4,a5
	ld	a4,-64(s0)
	lwu	a3,-44(s0)
	mv	a2,a4
	mv	a1,a5
	call	copy_from_user
.L49:
	.loc 1 307 3
	li	a1,1
	ld	a0,-24(s0)
	call	virtio_disk_rw
	.loc 1 310 10
	lwu	a5,-44(s0)
	ld	a4,-72(s0)
	add	a5,a4,a5
	sd	a5,-72(s0)
	.loc 1 311 7
	lw	a4,-76(s0)
	lw	a5,-44(s0)
	subw	a5,a4,a5
	sw	a5,-76(s0)
	.loc 1 312 7
	lwu	a5,-44(s0)
	ld	a4,-64(s0)
	add	a5,a4,a5
	sd	a5,-64(s0)
.L47:
	.loc 1 280 2 discriminator 1
	lw	a5,-76(s0)
	sext.w	a5,a5
	bnez	a5,.L50
.LBE7:
	.loc 1 315 2
	ld	a0,-24(s0)
	call	kfree
	.loc 1 317 9
	li	a5,0
	.loc 1 318 1
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
	.size	write_to_inode, .-write_to_inode
	.align	2
	.globl	loadsec
	.type	loadsec, @function
loadsec:
.LFB10:
	.loc 1 321 1
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
	mv	a5,a3
	sw	a5,-76(s0)
	mv	a5,a4
	sw	a5,-80(s0)
	.loc 1 323 6
	sw	zero,-24(s0)
	.loc 1 324 6
	sw	zero,-28(s0)
	.loc 1 325 6
	sw	zero,-32(s0)
.LBB8:
	.loc 1 327 10
	sw	zero,-20(s0)
	.loc 1 327 2
	j	.L53
.L54:
	.loc 1 329 8 discriminator 3
	lw	a4,-20(s0)
	ld	a5,-72(s0)
	add	a5,a4,a5
	mv	a1,a5
	ld	a0,-56(s0)
	call	va_to_pa
	sd	a0,-40(s0)
	.loc 1 331 4 discriminator 3
	lwu	a5,-76(s0)
	li	a4,0
	li	a3,4096
	mv	a2,a5
	ld	a1,-40(s0)
	ld	a0,-64(s0)
	call	read_from_inode
	.loc 1 327 22 discriminator 3
	lw	a4,-20(s0)
	li	a5,4096
	addw	a5,a4,a5
	sw	a5,-20(s0)
	.loc 1 327 36 discriminator 3
	lw	a4,-76(s0)
	li	a5,4096
	addw	a5,a4,a5
	sw	a5,-76(s0)
.L53:
	.loc 1 327 16 discriminator 1
	lw	a4,-20(s0)
	.loc 1 327 2 discriminator 1
	lw	a5,-80(s0)
	sext.w	a5,a5
	bgtu	a5,a4,.L54
.LBE8:
	.loc 1 348 1
	nop
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	loadsec, .-loadsec
.Letext0:
	.file 2 "src/fs.h"
	.file 3 "src/virt_disk.h"
	.file 4 "src/fd.h"
	.file 5 "src/proc.h"
	.file 6 "include/def.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd8a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF111
	.byte	0xc
	.4byte	.LASF112
	.4byte	.LASF113
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF8
	.byte	0x20
	.byte	0x2
	.byte	0xe
	.byte	0x8
	.4byte	0xa3
	.byte	0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x10
	.byte	0xf
	.4byte	0xa3
	.byte	0
	.byte	0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x11
	.byte	0xf
	.4byte	0xa3
	.byte	0x4
	.byte	0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x12
	.byte	0xf
	.4byte	0xa3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x13
	.byte	0xf
	.4byte	0xa3
	.byte	0xc
	.byte	0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x14
	.byte	0xf
	.4byte	0xa3
	.byte	0x10
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x15
	.byte	0xf
	.4byte	0xa3
	.byte	0x14
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x16
	.byte	0xf
	.4byte	0xa3
	.byte	0x18
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x17
	.byte	0xf
	.4byte	0xa3
	.byte	0x1c
	.byte	0
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.byte	0x2
	.4byte	.LASF9
	.byte	0x40
	.byte	0x2
	.byte	0x1b
	.byte	0x8
	.4byte	0x106
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x1d
	.byte	0x8
	.4byte	0x106
	.byte	0
	.byte	0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1e
	.byte	0x8
	.4byte	0x106
	.byte	0x2
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1f
	.byte	0x8
	.4byte	0x106
	.byte	0x4
	.byte	0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x20
	.byte	0x8
	.4byte	0x106
	.byte	0x6
	.byte	0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x21
	.byte	0xf
	.4byte	0xa3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x22
	.byte	0xf
	.4byte	0x10d
	.byte	0xc
	.byte	0
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF16
	.byte	0x5
	.4byte	0xa3
	.4byte	0x11d
	.byte	0x6
	.4byte	0x11d
	.byte	0xc
	.byte	0
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF17
	.byte	0x2
	.4byte	.LASF18
	.byte	0x50
	.byte	0x2
	.byte	0x26
	.byte	0x8
	.4byte	0x173
	.byte	0x3
	.4byte	.LASF19
	.byte	0x2
	.byte	0x28
	.byte	0xf
	.4byte	0xa3
	.byte	0
	.byte	0x3
	.4byte	.LASF20
	.byte	0x2
	.byte	0x29
	.byte	0xf
	.4byte	0xa3
	.byte	0x4
	.byte	0x7
	.string	"ref"
	.byte	0x2
	.byte	0x2a
	.byte	0x6
	.4byte	0x173
	.byte	0x8
	.byte	0x3
	.4byte	.LASF21
	.byte	0x2
	.byte	0x2b
	.byte	0x6
	.4byte	0x173
	.byte	0xc
	.byte	0x3
	.4byte	.LASF22
	.byte	0x2
	.byte	0x2d
	.byte	0x10
	.4byte	0xaa
	.byte	0x10
	.byte	0
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	.LASF23
	.byte	0x10
	.byte	0x2
	.byte	0x31
	.byte	0x8
	.4byte	0x1a2
	.byte	0x3
	.4byte	.LASF24
	.byte	0x2
	.byte	0x33
	.byte	0x11
	.4byte	0x1a2
	.byte	0
	.byte	0x3
	.4byte	.LASF25
	.byte	0x2
	.byte	0x34
	.byte	0x7
	.4byte	0x1a9
	.byte	0x2
	.byte	0
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF26
	.byte	0x5
	.4byte	0x1b9
	.4byte	0x1b9
	.byte	0x6
	.4byte	0x11d
	.byte	0xd
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF27
	.byte	0x2
	.4byte	.LASF28
	.byte	0x40
	.byte	0x2
	.byte	0x38
	.byte	0x8
	.4byte	0x291
	.byte	0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x3a
	.byte	0xf
	.4byte	0xa3
	.byte	0
	.byte	0x7
	.string	"elf"
	.byte	0x2
	.byte	0x3b
	.byte	0x10
	.4byte	0x291
	.byte	0x4
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x3c
	.byte	0x11
	.4byte	0x1a2
	.byte	0x10
	.byte	0x3
	.4byte	.LASF29
	.byte	0x2
	.byte	0x3d
	.byte	0x11
	.4byte	0x1a2
	.byte	0x12
	.byte	0x3
	.4byte	.LASF30
	.byte	0x2
	.byte	0x3e
	.byte	0xf
	.4byte	0xa3
	.byte	0x14
	.byte	0x3
	.4byte	.LASF31
	.byte	0x2
	.byte	0x3f
	.byte	0x10
	.4byte	0x11d
	.byte	0x18
	.byte	0x3
	.4byte	.LASF32
	.byte	0x2
	.byte	0x40
	.byte	0x10
	.4byte	0x11d
	.byte	0x20
	.byte	0x3
	.4byte	.LASF33
	.byte	0x2
	.byte	0x41
	.byte	0x10
	.4byte	0x11d
	.byte	0x28
	.byte	0x3
	.4byte	.LASF34
	.byte	0x2
	.byte	0x42
	.byte	0xf
	.4byte	0xa3
	.byte	0x30
	.byte	0x3
	.4byte	.LASF35
	.byte	0x2
	.byte	0x43
	.byte	0x11
	.4byte	0x1a2
	.byte	0x34
	.byte	0x3
	.4byte	.LASF36
	.byte	0x2
	.byte	0x44
	.byte	0x11
	.4byte	0x1a2
	.byte	0x36
	.byte	0x3
	.4byte	.LASF37
	.byte	0x2
	.byte	0x45
	.byte	0x11
	.4byte	0x1a2
	.byte	0x38
	.byte	0x3
	.4byte	.LASF38
	.byte	0x2
	.byte	0x46
	.byte	0x11
	.4byte	0x1a2
	.byte	0x3a
	.byte	0x3
	.4byte	.LASF39
	.byte	0x2
	.byte	0x47
	.byte	0x11
	.4byte	0x1a2
	.byte	0x3c
	.byte	0x3
	.4byte	.LASF40
	.byte	0x2
	.byte	0x48
	.byte	0x11
	.4byte	0x1a2
	.byte	0x3e
	.byte	0
	.byte	0x5
	.4byte	0x2a1
	.4byte	0x2a1
	.byte	0x6
	.4byte	0x11d
	.byte	0xb
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF41
	.byte	0x2
	.4byte	.LASF42
	.byte	0x38
	.byte	0x2
	.byte	0x4c
	.byte	0x8
	.4byte	0x31e
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x4e
	.byte	0xf
	.4byte	0xa3
	.byte	0
	.byte	0x3
	.4byte	.LASF43
	.byte	0x2
	.byte	0x4f
	.byte	0xf
	.4byte	0xa3
	.byte	0x4
	.byte	0x7
	.string	"off"
	.byte	0x2
	.byte	0x50
	.byte	0x10
	.4byte	0x11d
	.byte	0x8
	.byte	0x3
	.4byte	.LASF44
	.byte	0x2
	.byte	0x51
	.byte	0x10
	.4byte	0x11d
	.byte	0x10
	.byte	0x3
	.4byte	.LASF45
	.byte	0x2
	.byte	0x52
	.byte	0x10
	.4byte	0x11d
	.byte	0x18
	.byte	0x3
	.4byte	.LASF46
	.byte	0x2
	.byte	0x53
	.byte	0x10
	.4byte	0x11d
	.byte	0x20
	.byte	0x3
	.4byte	.LASF47
	.byte	0x2
	.byte	0x54
	.byte	0x10
	.4byte	0x11d
	.byte	0x28
	.byte	0x3
	.4byte	.LASF48
	.byte	0x2
	.byte	0x55
	.byte	0x10
	.4byte	0x11d
	.byte	0x30
	.byte	0
	.byte	0x9
	.string	"buf"
	.2byte	0x428
	.byte	0x3
	.byte	0x5e
	.byte	0x8
	.4byte	0x395
	.byte	0x3
	.4byte	.LASF21
	.byte	0x3
	.byte	0x60
	.byte	0x6
	.4byte	0x173
	.byte	0
	.byte	0x3
	.4byte	.LASF49
	.byte	0x3
	.byte	0x61
	.byte	0x6
	.4byte	0x173
	.byte	0x4
	.byte	0x7
	.string	"dev"
	.byte	0x3
	.byte	0x62
	.byte	0xf
	.4byte	0xa3
	.byte	0x8
	.byte	0x3
	.4byte	.LASF50
	.byte	0x3
	.byte	0x63
	.byte	0xf
	.4byte	0xa3
	.byte	0xc
	.byte	0x3
	.4byte	.LASF51
	.byte	0x3
	.byte	0x64
	.byte	0xf
	.4byte	0xa3
	.byte	0x10
	.byte	0x7
	.string	"pre"
	.byte	0x3
	.byte	0x65
	.byte	0xe
	.4byte	0x395
	.byte	0x18
	.byte	0x7
	.string	"nxt"
	.byte	0x3
	.byte	0x66
	.byte	0xe
	.4byte	0x395
	.byte	0x20
	.byte	0x3
	.4byte	.LASF52
	.byte	0x3
	.byte	0x67
	.byte	0x10
	.4byte	0x39b
	.byte	0x28
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x31e
	.byte	0x5
	.4byte	0x2a1
	.4byte	0x3ac
	.byte	0xb
	.4byte	0x11d
	.2byte	0x3ff
	.byte	0
	.byte	0xc
	.4byte	.LASF114
	.byte	0x6
	.byte	0x1a
	.byte	0x18
	.4byte	0x3b8
	.byte	0xa
	.byte	0x8
	.4byte	0x11d
	.byte	0xd
	.byte	0x7
	.byte	0x4
	.4byte	0xa3
	.byte	0x4
	.byte	0xc
	.byte	0x7
	.4byte	0x3e5
	.byte	0xe
	.4byte	.LASF53
	.byte	0
	.byte	0xe
	.4byte	.LASF54
	.byte	0x1
	.byte	0xe
	.4byte	.LASF55
	.byte	0x2
	.byte	0xe
	.4byte	.LASF56
	.byte	0x3
	.byte	0
	.byte	0x2
	.4byte	.LASF57
	.byte	0x28
	.byte	0x4
	.byte	0xa
	.byte	0x8
	.4byte	0x45a
	.byte	0x3
	.4byte	.LASF10
	.byte	0x4
	.byte	0xc
	.byte	0x2f
	.4byte	0x3be
	.byte	0
	.byte	0x3
	.4byte	.LASF58
	.byte	0x4
	.byte	0xd
	.byte	0x6
	.4byte	0x173
	.byte	0x4
	.byte	0x3
	.4byte	.LASF59
	.byte	0x4
	.byte	0xe
	.byte	0x7
	.4byte	0x1b9
	.byte	0x8
	.byte	0x3
	.4byte	.LASF60
	.byte	0x4
	.byte	0xf
	.byte	0x7
	.4byte	0x1b9
	.byte	0x9
	.byte	0x7
	.string	"ip"
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.4byte	0x45a
	.byte	0x10
	.byte	0x3
	.4byte	.LASF61
	.byte	0x4
	.byte	0x11
	.byte	0xf
	.4byte	0x465
	.byte	0x18
	.byte	0x7
	.string	"off"
	.byte	0x4
	.byte	0x12
	.byte	0xf
	.4byte	0xa3
	.byte	0x20
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x13
	.byte	0x8
	.4byte	0x106
	.byte	0x24
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x124
	.byte	0xf
	.4byte	.LASF61
	.byte	0xa
	.byte	0x8
	.4byte	0x460
	.byte	0x10
	.4byte	.LASF62
	.2byte	0x120
	.byte	0x5
	.byte	0x11
	.byte	0x8
	.4byte	0x635
	.byte	0x3
	.4byte	.LASF63
	.byte	0x5
	.byte	0x12
	.byte	0x1b
	.4byte	0x11d
	.byte	0
	.byte	0x3
	.4byte	.LASF64
	.byte	0x5
	.byte	0x13
	.byte	0x1b
	.4byte	0x11d
	.byte	0x8
	.byte	0x3
	.4byte	.LASF65
	.byte	0x5
	.byte	0x14
	.byte	0x1b
	.4byte	0x11d
	.byte	0x10
	.byte	0x7
	.string	"epc"
	.byte	0x5
	.byte	0x15
	.byte	0x1b
	.4byte	0x11d
	.byte	0x18
	.byte	0x3
	.4byte	.LASF66
	.byte	0x5
	.byte	0x16
	.byte	0x1b
	.4byte	0x11d
	.byte	0x20
	.byte	0x7
	.string	"ra"
	.byte	0x5
	.byte	0x17
	.byte	0x1b
	.4byte	0x11d
	.byte	0x28
	.byte	0x7
	.string	"sp"
	.byte	0x5
	.byte	0x18
	.byte	0x1b
	.4byte	0x11d
	.byte	0x30
	.byte	0x7
	.string	"gp"
	.byte	0x5
	.byte	0x19
	.byte	0x1b
	.4byte	0x11d
	.byte	0x38
	.byte	0x7
	.string	"tp"
	.byte	0x5
	.byte	0x1a
	.byte	0x1b
	.4byte	0x11d
	.byte	0x40
	.byte	0x7
	.string	"t0"
	.byte	0x5
	.byte	0x1b
	.byte	0x1b
	.4byte	0x11d
	.byte	0x48
	.byte	0x7
	.string	"t1"
	.byte	0x5
	.byte	0x1c
	.byte	0x1b
	.4byte	0x11d
	.byte	0x50
	.byte	0x7
	.string	"t2"
	.byte	0x5
	.byte	0x1d
	.byte	0x1b
	.4byte	0x11d
	.byte	0x58
	.byte	0x7
	.string	"s0"
	.byte	0x5
	.byte	0x1e
	.byte	0x1b
	.4byte	0x11d
	.byte	0x60
	.byte	0x7
	.string	"s1"
	.byte	0x5
	.byte	0x1f
	.byte	0x1b
	.4byte	0x11d
	.byte	0x68
	.byte	0x7
	.string	"a0"
	.byte	0x5
	.byte	0x20
	.byte	0x1b
	.4byte	0x11d
	.byte	0x70
	.byte	0x7
	.string	"a1"
	.byte	0x5
	.byte	0x21
	.byte	0x1b
	.4byte	0x11d
	.byte	0x78
	.byte	0x7
	.string	"a2"
	.byte	0x5
	.byte	0x22
	.byte	0x1b
	.4byte	0x11d
	.byte	0x80
	.byte	0x7
	.string	"a3"
	.byte	0x5
	.byte	0x23
	.byte	0x1b
	.4byte	0x11d
	.byte	0x88
	.byte	0x7
	.string	"a4"
	.byte	0x5
	.byte	0x24
	.byte	0x1b
	.4byte	0x11d
	.byte	0x90
	.byte	0x7
	.string	"a5"
	.byte	0x5
	.byte	0x25
	.byte	0x1b
	.4byte	0x11d
	.byte	0x98
	.byte	0x7
	.string	"a6"
	.byte	0x5
	.byte	0x26
	.byte	0x1b
	.4byte	0x11d
	.byte	0xa0
	.byte	0x7
	.string	"a7"
	.byte	0x5
	.byte	0x27
	.byte	0x1b
	.4byte	0x11d
	.byte	0xa8
	.byte	0x7
	.string	"s2"
	.byte	0x5
	.byte	0x28
	.byte	0x1b
	.4byte	0x11d
	.byte	0xb0
	.byte	0x7
	.string	"s3"
	.byte	0x5
	.byte	0x29
	.byte	0x1b
	.4byte	0x11d
	.byte	0xb8
	.byte	0x7
	.string	"s4"
	.byte	0x5
	.byte	0x2a
	.byte	0x1b
	.4byte	0x11d
	.byte	0xc0
	.byte	0x7
	.string	"s5"
	.byte	0x5
	.byte	0x2b
	.byte	0x1b
	.4byte	0x11d
	.byte	0xc8
	.byte	0x7
	.string	"s6"
	.byte	0x5
	.byte	0x2c
	.byte	0x1b
	.4byte	0x11d
	.byte	0xd0
	.byte	0x7
	.string	"s7"
	.byte	0x5
	.byte	0x2d
	.byte	0x1b
	.4byte	0x11d
	.byte	0xd8
	.byte	0x7
	.string	"s8"
	.byte	0x5
	.byte	0x2e
	.byte	0x1b
	.4byte	0x11d
	.byte	0xe0
	.byte	0x7
	.string	"s9"
	.byte	0x5
	.byte	0x2f
	.byte	0x1b
	.4byte	0x11d
	.byte	0xe8
	.byte	0x7
	.string	"s10"
	.byte	0x5
	.byte	0x30
	.byte	0x1b
	.4byte	0x11d
	.byte	0xf0
	.byte	0x7
	.string	"s11"
	.byte	0x5
	.byte	0x31
	.byte	0x1b
	.4byte	0x11d
	.byte	0xf8
	.byte	0x11
	.string	"t3"
	.byte	0x5
	.byte	0x32
	.byte	0x1b
	.4byte	0x11d
	.2byte	0x100
	.byte	0x11
	.string	"t4"
	.byte	0x5
	.byte	0x33
	.byte	0x1b
	.4byte	0x11d
	.2byte	0x108
	.byte	0x11
	.string	"t5"
	.byte	0x5
	.byte	0x34
	.byte	0x1b
	.4byte	0x11d
	.2byte	0x110
	.byte	0x11
	.string	"t6"
	.byte	0x5
	.byte	0x35
	.byte	0x1b
	.4byte	0x11d
	.2byte	0x118
	.byte	0
	.byte	0x2
	.4byte	.LASF67
	.byte	0x68
	.byte	0x5
	.byte	0x38
	.byte	0x8
	.4byte	0x6e1
	.byte	0x7
	.string	"ra"
	.byte	0x5
	.byte	0x3a
	.byte	0x10
	.4byte	0x11d
	.byte	0
	.byte	0x7
	.string	"sp"
	.byte	0x5
	.byte	0x3b
	.byte	0x10
	.4byte	0x11d
	.byte	0x8
	.byte	0x7
	.string	"s0"
	.byte	0x5
	.byte	0x3c
	.byte	0x10
	.4byte	0x11d
	.byte	0x10
	.byte	0x7
	.string	"s1"
	.byte	0x5
	.byte	0x3d
	.byte	0x10
	.4byte	0x11d
	.byte	0x18
	.byte	0x7
	.string	"s2"
	.byte	0x5
	.byte	0x3e
	.byte	0x10
	.4byte	0x11d
	.byte	0x20
	.byte	0x7
	.string	"s3"
	.byte	0x5
	.byte	0x3f
	.byte	0x10
	.4byte	0x11d
	.byte	0x28
	.byte	0x7
	.string	"s4"
	.byte	0x5
	.byte	0x40
	.byte	0x10
	.4byte	0x11d
	.byte	0x30
	.byte	0x7
	.string	"s5"
	.byte	0x5
	.byte	0x41
	.byte	0x10
	.4byte	0x11d
	.byte	0x38
	.byte	0x7
	.string	"s7"
	.byte	0x5
	.byte	0x42
	.byte	0x10
	.4byte	0x11d
	.byte	0x40
	.byte	0x7
	.string	"s8"
	.byte	0x5
	.byte	0x43
	.byte	0x10
	.4byte	0x11d
	.byte	0x48
	.byte	0x7
	.string	"s9"
	.byte	0x5
	.byte	0x44
	.byte	0x10
	.4byte	0x11d
	.byte	0x50
	.byte	0x7
	.string	"s10"
	.byte	0x5
	.byte	0x45
	.byte	0x10
	.4byte	0x11d
	.byte	0x58
	.byte	0x7
	.string	"s11"
	.byte	0x5
	.byte	0x46
	.byte	0x10
	.4byte	0x11d
	.byte	0x60
	.byte	0
	.byte	0x10
	.4byte	.LASF68
	.2byte	0x100
	.byte	0x5
	.byte	0x49
	.byte	0x8
	.4byte	0x78c
	.byte	0x3
	.4byte	.LASF69
	.byte	0x5
	.byte	0x4b
	.byte	0x11
	.4byte	0x3b8
	.byte	0
	.byte	0x3
	.4byte	.LASF70
	.byte	0x5
	.byte	0x4c
	.byte	0x8
	.4byte	0x3ac
	.byte	0x8
	.byte	0x3
	.4byte	.LASF62
	.byte	0x5
	.byte	0x4d
	.byte	0x14
	.4byte	0x78c
	.byte	0x10
	.byte	0x3
	.4byte	.LASF67
	.byte	0x5
	.byte	0x4e
	.byte	0x11
	.4byte	0x635
	.byte	0x18
	.byte	0x3
	.4byte	.LASF71
	.byte	0x5
	.byte	0x4f
	.byte	0x10
	.4byte	0x11d
	.byte	0x80
	.byte	0x3
	.4byte	.LASF25
	.byte	0x5
	.byte	0x50
	.byte	0x7
	.4byte	0x792
	.byte	0x88
	.byte	0x3
	.4byte	.LASF72
	.byte	0x5
	.byte	0x51
	.byte	0x6
	.4byte	0x173
	.byte	0x94
	.byte	0x7
	.string	"pid"
	.byte	0x5
	.byte	0x52
	.byte	0x6
	.4byte	0x173
	.byte	0x98
	.byte	0x3
	.4byte	.LASF73
	.byte	0x5
	.byte	0x53
	.byte	0x6
	.4byte	0x173
	.byte	0x9c
	.byte	0x3
	.4byte	.LASF74
	.byte	0x5
	.byte	0x54
	.byte	0x10
	.4byte	0x11d
	.byte	0xa0
	.byte	0x3
	.4byte	.LASF75
	.byte	0x5
	.byte	0x55
	.byte	0xf
	.4byte	0x7a2
	.byte	0xa8
	.byte	0x3
	.4byte	.LASF76
	.byte	0x5
	.byte	0x57
	.byte	0xf
	.4byte	0x7a8
	.byte	0xb0
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x46b
	.byte	0x5
	.4byte	0x1b9
	.4byte	0x7a2
	.byte	0x6
	.4byte	0x11d
	.byte	0x9
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x6e1
	.byte	0x5
	.4byte	0x7b8
	.4byte	0x7b8
	.byte	0x6
	.4byte	0x11d
	.byte	0x9
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x3e5
	.byte	0x12
	.4byte	.LASF77
	.byte	0x1
	.byte	0x7
	.byte	0x15
	.4byte	0x7a2
	.byte	0x13
	.string	"sb"
	.byte	0x1
	.byte	0x9
	.byte	0x13
	.4byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	sb
	.byte	0x14
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x140
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x8ac
	.byte	0x15
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x140
	.byte	0x14
	.4byte	0x3ac
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x16
	.string	"ip"
	.byte	0x1
	.2byte	0x140
	.byte	0x2d
	.4byte	0x45a
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x16
	.string	"va"
	.byte	0x1
	.2byte	0x140
	.byte	0x3f
	.4byte	0x11d
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x15
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x140
	.byte	0x50
	.4byte	0xa3
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x16
	.string	"sz"
	.byte	0x1
	.2byte	0x140
	.byte	0x65
	.4byte	0xa3
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x17
	.string	"pa"
	.byte	0x1
	.2byte	0x142
	.byte	0x10
	.4byte	0x11d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x17
	.string	"i"
	.byte	0x1
	.2byte	0x143
	.byte	0x6
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x144
	.byte	0x6
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x18
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x145
	.byte	0x6
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x19
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x17
	.string	"n"
	.byte	0x1
	.2byte	0x147
	.byte	0xa
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x110
	.byte	0x5
	.4byte	0x173
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x991
	.byte	0x16
	.string	"ip"
	.byte	0x1
	.2byte	0x110
	.byte	0x22
	.4byte	0x45a
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x16
	.string	"src"
	.byte	0x1
	.2byte	0x110
	.byte	0x34
	.4byte	0x11d
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x15
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x110
	.byte	0x47
	.4byte	0x11d
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x16
	.string	"len"
	.byte	0x1
	.2byte	0x110
	.byte	0x5c
	.4byte	0xa3
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x15
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x110
	.byte	0x65
	.4byte	0x173
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x18
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x112
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x17
	.string	"st"
	.byte	0x1
	.2byte	0x113
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x18
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x114
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x18
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x115
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x18
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x116
	.byte	0xe
	.4byte	0x395
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x19
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x17
	.string	"n"
	.byte	0x1
	.2byte	0x118
	.byte	0xa
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LASF88
	.byte	0x1
	.byte	0xed
	.byte	0x5
	.4byte	0x173
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xa4c
	.byte	0x1c
	.string	"ip"
	.byte	0x1
	.byte	0xed
	.byte	0x23
	.4byte	0x45a
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1c
	.string	"dst"
	.byte	0x1
	.byte	0xed
	.byte	0x35
	.4byte	0x11d
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x1d
	.4byte	.LASF79
	.byte	0x1
	.byte	0xed
	.byte	0x48
	.4byte	0x11d
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x1c
	.string	"len"
	.byte	0x1
	.byte	0xed
	.byte	0x5d
	.4byte	0xa3
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x1d
	.4byte	.LASF82
	.byte	0x1
	.byte	0xed
	.byte	0x66
	.4byte	0x173
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x1e
	.4byte	.LASF89
	.byte	0x1
	.byte	0xef
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x1e
	.4byte	.LASF83
	.byte	0x1
	.byte	0xf0
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1e
	.4byte	.LASF90
	.byte	0x1
	.byte	0xf1
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1e
	.4byte	.LASF91
	.byte	0x1
	.byte	0xf2
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1e
	.4byte	.LASF86
	.byte	0x1
	.byte	0xf4
	.byte	0xe
	.4byte	0x395
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x1f
	.4byte	.LASF93
	.byte	0x1
	.byte	0xcd
	.byte	0x6
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0xab7
	.byte	0x1c
	.string	"hdr"
	.byte	0x1
	.byte	0xcd
	.byte	0x20
	.4byte	0xab7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1d
	.4byte	.LASF94
	.byte	0x1
	.byte	0xcd
	.byte	0x35
	.4byte	0xabd
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1d
	.4byte	.LASF95
	.byte	0x1
	.byte	0xcd
	.byte	0x49
	.4byte	0x45a
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1e
	.4byte	.LASF86
	.byte	0x1
	.byte	0xcf
	.byte	0xe
	.4byte	0x395
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x20
	.string	"end"
	.byte	0x1
	.byte	0xe7
	.byte	0x1
	.8byte	.L38
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x1c0
	.byte	0xa
	.byte	0x8
	.4byte	0x2a8
	.byte	0x1b
	.4byte	.LASF96
	.byte	0x1
	.byte	0xa6
	.byte	0xe
	.4byte	0xa3
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0xb30
	.byte	0x1c
	.string	"ip"
	.byte	0x1
	.byte	0xa6
	.byte	0x2b
	.4byte	0x45a
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1d
	.4byte	.LASF97
	.byte	0x1
	.byte	0xa6
	.byte	0x3c
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x1e
	.4byte	.LASF98
	.byte	0x1
	.byte	0xa8
	.byte	0xf
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x1e
	.4byte	.LASF99
	.byte	0x1
	.byte	0xb1
	.byte	0xe
	.4byte	0x395
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1e
	.4byte	.LASF100
	.byte	0x1
	.byte	0xb2
	.byte	0x10
	.4byte	0xb30
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0xa3
	.byte	0x1b
	.4byte	.LASF101
	.byte	0x1
	.byte	0x70
	.byte	0x5
	.4byte	0x173
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0xbff
	.byte	0x1d
	.4byte	.LASF102
	.byte	0x1
	.byte	0x70
	.byte	0x15
	.4byte	0xbff
	.byte	0x3
	.byte	0x91
	.byte	0xe8,0x7e
	.byte	0x1c
	.string	"ino"
	.byte	0x1
	.byte	0x70
	.byte	0x29
	.4byte	0x45a
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x7e
	.byte	0x21
	.string	"ptr"
	.byte	0x1
	.byte	0x72
	.byte	0x8
	.4byte	0xbff
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1e
	.4byte	.LASF25
	.byte	0x1
	.byte	0x73
	.byte	0x7
	.4byte	0x1a9
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x1e
	.4byte	.LASF24
	.byte	0x1
	.byte	0x74
	.byte	0x6
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1e
	.4byte	.LASF103
	.byte	0x1
	.byte	0x75
	.byte	0xf
	.4byte	0x124
	.byte	0x3
	.byte	0x91
	.byte	0xf0,0x7e
	.byte	0x1e
	.4byte	.LASF104
	.byte	0x1
	.byte	0x76
	.byte	0x11
	.4byte	0xc05
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x22
	.4byte	.LASF105
	.byte	0x1
	.byte	0xa1
	.byte	0x1
	.8byte	.L26
	.byte	0x23
	.4byte	.Ldebug_ranges0+0
	.byte	0x1e
	.4byte	.LASF79
	.byte	0x1
	.byte	0x85
	.byte	0xb
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x23
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1e
	.4byte	.LASF86
	.byte	0x1
	.byte	0x87
	.byte	0x10
	.4byte	0x395
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x1b9
	.byte	0xa
	.byte	0x8
	.4byte	0x17a
	.byte	0x1b
	.4byte	.LASF106
	.byte	0x1
	.byte	0x4b
	.byte	0x7
	.4byte	0xbff
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0xc87
	.byte	0x1d
	.4byte	.LASF102
	.byte	0x1
	.byte	0x4b
	.byte	0x1a
	.4byte	0xbff
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1d
	.4byte	.LASF25
	.byte	0x1
	.byte	0x4b
	.byte	0x26
	.4byte	0xbff
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x21
	.string	"s"
	.byte	0x1
	.byte	0x4d
	.byte	0x8
	.4byte	0xbff
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x21
	.string	"len"
	.byte	0x1
	.byte	0x4e
	.byte	0x6
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x19
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x21
	.string	"n"
	.byte	0x1
	.byte	0x4f
	.byte	0xa
	.4byte	0x173
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	.LASF115
	.byte	0x1
	.byte	0x3d
	.byte	0x6
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.byte	0x25
	.4byte	.LASF116
	.byte	0x1
	.byte	0x2b
	.byte	0xd
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xcdd
	.byte	0x1c
	.string	"sb"
	.byte	0x1
	.byte	0x2b
	.byte	0x28
	.4byte	0xcdd
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1e
	.4byte	.LASF86
	.byte	0x1
	.byte	0x2d
	.byte	0xe
	.4byte	0x395
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x2d
	.byte	0x1f
	.4byte	.LASF107
	.byte	0x1
	.byte	0x16
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xd3c
	.byte	0x1d
	.4byte	.LASF24
	.byte	0x1
	.byte	0x16
	.byte	0x1c
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1d
	.4byte	.LASF108
	.byte	0x1
	.byte	0x16
	.byte	0x30
	.4byte	0x45a
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x21
	.string	"buf"
	.byte	0x1
	.byte	0x18
	.byte	0xe
	.4byte	0x395
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x21
	.string	"p"
	.byte	0x1
	.byte	0x19
	.byte	0x11
	.4byte	0xd3c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0xaa
	.byte	0x26
	.4byte	.LASF109
	.byte	0x1
	.byte	0xc
	.byte	0xe
	.4byte	0xa3
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x1d
	.4byte	.LASF24
	.byte	0x1
	.byte	0xc
	.byte	0x2d
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1c
	.string	"sb"
	.byte	0x1
	.byte	0xc
	.byte	0x45
	.4byte	0x2d
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1e
	.4byte	.LASF110
	.byte	0x1
	.byte	0xe
	.byte	0xf
	.4byte	0xa3
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
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
	.byte	0x5
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0x5
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
	.byte	0x96,0x42
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
	.byte	0x1e
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
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0x8
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
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
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
	.8byte	.LBB6-.Ltext0
	.8byte	.LBE6-.Ltext0
	.8byte	0
	.8byte	0
	.8byte	.LBB4-.Ltext0
	.8byte	.LBE4-.Ltext0
	.8byte	.LBB5-.Ltext0
	.8byte	.LBE5-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF77:
	.string	"proc_ptr"
.LASF58:
	.string	"ref_cnt"
.LASF35:
	.string	"ehsize"
.LASF10:
	.string	"type"
.LASF63:
	.string	"kernel_satp"
.LASF113:
	.string	"/home/songyj/embedded_proj/rvos"
.LASF3:
	.string	"inode_num"
.LASF31:
	.string	"entry"
.LASF84:
	.string	"blk_res_len"
.LASF82:
	.string	"to_where"
.LASF61:
	.string	"pipe"
.LASF37:
	.string	"phnum"
.LASF48:
	.string	"align"
.LASF90:
	.string	"blk_offset"
.LASF103:
	.string	"cur_inode"
.LASF33:
	.string	"shoff"
.LASF71:
	.string	"prog_size"
.LASF29:
	.string	"mach"
.LASF98:
	.string	"addr"
.LASF8:
	.string	"superblock"
.LASF72:
	.string	"state"
.LASF7:
	.string	"s_bmap"
.LASF44:
	.string	"vaddr"
.LASF51:
	.string	"refcnt"
.LASF112:
	.string	"src/fs.c"
.LASF75:
	.string	"parent"
.LASF95:
	.string	"ino_ptr"
.LASF106:
	.string	"get_nxt_name"
.LASF53:
	.string	"FD_NONE"
.LASF97:
	.string	"blknum"
.LASF108:
	.string	"inode_buf"
.LASF55:
	.string	"FD_INODE"
.LASF20:
	.string	"ninode"
.LASF114:
	.string	"pgt_t"
.LASF101:
	.string	"get_inode"
.LASF39:
	.string	"shnum"
.LASF28:
	.string	"elfhdr"
.LASF88:
	.string	"read_from_inode"
.LASF15:
	.string	"unsigned int"
.LASF68:
	.string	"proc"
.LASF115:
	.string	"fs_init"
.LASF12:
	.string	"minor"
.LASF17:
	.string	"long unsigned int"
.LASF54:
	.string	"FD_PIPE"
.LASF70:
	.string	"proc_pagetable"
.LASF42:
	.string	"proghdr"
.LASF25:
	.string	"name"
.LASF59:
	.string	"readable"
.LASF52:
	.string	"data"
.LASF67:
	.string	"context"
.LASF1:
	.string	"size"
.LASF26:
	.string	"short unsigned int"
.LASF65:
	.string	"kernel_trap"
.LASF36:
	.string	"phentsize"
.LASF13:
	.string	"nlink"
.LASF76:
	.string	"ofile"
.LASF111:
	.string	"GNU C17 9.3.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-builtin -fno-PIE -fno-omit-frame-pointer"
.LASF46:
	.string	"filesz"
.LASF74:
	.string	"sleep_chan"
.LASF14:
	.string	"data_address"
.LASF45:
	.string	"paddr"
.LASF73:
	.string	"killed"
.LASF30:
	.string	"version"
.LASF56:
	.string	"FD_DEVICE"
.LASF109:
	.string	"inode_which_block"
.LASF6:
	.string	"s_inode_blk"
.LASF64:
	.string	"kernel_sp"
.LASF62:
	.string	"trapframe"
.LASF47:
	.string	"memsz"
.LASF22:
	.string	"content"
.LASF23:
	.string	"dirent"
.LASF0:
	.string	"magic_num"
.LASF89:
	.string	"total_rd"
.LASF107:
	.string	"rd_inode"
.LASF18:
	.string	"inode"
.LASF40:
	.string	"shstrndx"
.LASF69:
	.string	"kstack"
.LASF4:
	.string	"log_num"
.LASF93:
	.string	"read_elfhr"
.LASF24:
	.string	"inum"
.LASF78:
	.string	"pagetable"
.LASF41:
	.string	"unsigned char"
.LASF16:
	.string	"short int"
.LASF2:
	.string	"data_blk_num"
.LASF57:
	.string	"file"
.LASF110:
	.string	"which_block"
.LASF34:
	.string	"flag"
.LASF116:
	.string	"read_sb"
.LASF94:
	.string	"phdr"
.LASF21:
	.string	"valid"
.LASF50:
	.string	"blockno"
.LASF5:
	.string	"s_data_blk"
.LASF91:
	.string	"single_rd_len"
.LASF99:
	.string	"indirect_index_buf"
.LASF27:
	.string	"char"
.LASF83:
	.string	"inode_blknum"
.LASF60:
	.string	"writable"
.LASF19:
	.string	"ndev"
.LASF79:
	.string	"offset"
.LASF49:
	.string	"disk"
.LASF9:
	.string	"dinode"
.LASF100:
	.string	"indirect"
.LASF102:
	.string	"path"
.LASF38:
	.string	"shentsize"
.LASF105:
	.string	"found"
.LASF81:
	.string	"wr_off"
.LASF85:
	.string	"actual_wr_len"
.LASF87:
	.string	"write_to_inode"
.LASF43:
	.string	"flags"
.LASF104:
	.string	"de_ptr"
.LASF66:
	.string	"kernel_hartid"
.LASF32:
	.string	"phyoff"
.LASF11:
	.string	"major"
.LASF80:
	.string	"wr_len"
.LASF96:
	.string	"blknum_to_addr"
.LASF92:
	.string	"loadsec"
.LASF86:
	.string	"blk_buf"
	.ident	"GCC: () 9.3.0"
