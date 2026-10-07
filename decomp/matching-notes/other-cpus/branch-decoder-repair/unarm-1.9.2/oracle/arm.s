.syntax unified
.arch armv5te
.arm
.global _start
_start:
b_large_positive:
 .inst 0xea51e118
bl_large_positive:
 .inst 0xeb51e117
b_large_negative:
 .inst 0xeabffffc
bl_large_negative:
 .inst 0xebbffffb
b_max_positive:
 .inst 0xea7fffff
bl_max_positive:
 .inst 0xeb7fffff
b_min_negative:
 .inst 0xea800000
bl_min_negative:
 .inst 0xeb800000
b_minus_one_word:
 .inst 0xeaffffff
bl_zero_displacement:
 .inst 0xeb000000
blx_max_h0:
 .inst 0xfa7fffff
blx_max_h1:
 .inst 0xfb7fffff
blx_min_h0:
 .inst 0xfa800000
blx_min_h1:
 .inst 0xfb800000
