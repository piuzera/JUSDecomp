.syntax unified
.arch armv5te
.thumb
.global _start
.thumb_func
_start:
 nop
 .inst.w 0xf000e800
 .inst.w 0xf3ffeffe
 .inst.w 0xf400e800
 .inst.w 0xf7ffeffe
 .inst.w 0xf000f800
