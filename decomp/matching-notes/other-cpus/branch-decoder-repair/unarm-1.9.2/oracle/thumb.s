.syntax unified
.arch armv5te
.thumb
.global _start
.thumb_func
_start:
bl_positive_pc_boundary_even:
 .inst.w 0xf3fffffe
bl_positive_pc_boundary_halfword:
 .inst.w 0xf3ffffff
bl_min_negative:
 .inst.w 0xf400f800
bl_negative_near:
 .inst.w 0xf7ffffff
bl_zero:
 .inst.w 0xf000f800
blx_positive_pc_boundary:
 .inst.w 0xf3ffeffe
blx_min_negative:
 .inst.w 0xf400e800
blx_negative_near:
 .inst.w 0xf7ffeffe
blx_zero:
 .inst.w 0xf000e800
b_short_max:
 .inst.n 0xe3ff
b_short_min:
 .inst.n 0xe400
b_cond_max:
 .inst.n 0xd17f
b_cond_min:
 .inst.n 0xd180
