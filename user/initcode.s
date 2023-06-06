# 1 "./user/initcode.S"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./user/initcode.S"
.globl start
start:
 li a0, 0x31
 li a7, 0x20
 ecall

 li a0, 0x01
 li a7, 0x02
 ecall

loop:
 j loop
