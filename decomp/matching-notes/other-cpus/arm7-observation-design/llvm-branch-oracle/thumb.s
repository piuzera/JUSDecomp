.syntax unified
.thumb
.global _start
.type _start,%function
.thumb_func
_start:
 b short_target
 bne conditional_target
 bl long_target
.size _start, .-_start
.section .short_target,"ax"
.thumb_func
short_target:
 nop
.section .conditional_target,"ax"
.thumb_func
conditional_target:
 nop
.section .long_target,"ax"
.thumb_func
long_target:
 nop
