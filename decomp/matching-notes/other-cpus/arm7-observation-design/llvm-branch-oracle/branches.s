.syntax unified
.arm
.global _start
.type _start,%function
_start:
 b target
 bl target
 b back_target
 bl back_target
.size _start, .-_start
