# 1 "user/usys.S"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "user/usys.S"
# generated by usys.pl - do not edit
# 1 "user/../src/syscall.h" 1
# 3 "user/usys.S" 2
.global fork
fork:
 li a7, 0x01
 ecall
 ret
.global print
print:
 li a7, 0x20
 ecall
 ret
.global sleep
sleep:
 li a7, 0x03
 ecall
 ret
.global pipe
pipe:
 li a7, 0x04
 ecall
 ret
.global write
write:
 li a7, 0x06
 ecall
 ret
.global read
read:
 li a7, 0x05
 ecall
 ret
.global open
open:
 li a7, 0x07
 ecall
 ret
