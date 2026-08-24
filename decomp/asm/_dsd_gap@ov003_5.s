    .include "macros/function.inc"

    .text
    .global func_ov003_0214cd20
    arm_func_start func_ov003_0214cd20
func_ov003_0214cd20: ; 0x0214cd20
    ldr ip, .L_0214cd28
    bx ip
.L_0214cd28: .word func_ov003_0214cd5c
    arm_func_end func_ov003_0214cd20

    .global func_ov003_0214cd2c
    arm_func_start func_ov003_0214cd2c
func_ov003_0214cd2c: ; 0x0214cd2c
    ldr ip, .L_0214cd34
    bx ip
.L_0214cd34: .word func_ov003_0214cd5c
    arm_func_end func_ov003_0214cd2c

    .global func_ov003_0214cd38
    arm_func_start func_ov003_0214cd38
func_ov003_0214cd38: ; 0x0214cd38
    ldr ip, .L_0214cd40
    bx ip
.L_0214cd40: .word func_ov003_0214cd5c
    arm_func_end func_ov003_0214cd38

    .global func_ov003_0214cd44
    arm_func_start func_ov003_0214cd44
func_ov003_0214cd44: ; 0x0214cd44
    ldr ip, .L_0214cd4c
    bx ip
.L_0214cd4c: .word func_ov003_0214cd5c
    arm_func_end func_ov003_0214cd44

    .global func_ov003_0214cd50
    arm_func_start func_ov003_0214cd50
func_ov003_0214cd50: ; 0x0214cd50
    ldr ip, .L_0214cd58
    bx ip
.L_0214cd58: .word func_ov003_0214cd5c
    arm_func_end func_ov003_0214cd50

    .global func_ov003_0214cd5c
    arm_func_start func_ov003_0214cd5c
func_ov003_0214cd5c: ; 0x0214cd5c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0xb0
    ldr r1, .L_0214cf38
    ldr r2, .L_0214cf3c
    add r3, r0, #0xa2
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0xb0
    bl func_020517fc
    bl func_020310f4
    str r0, [r4, #0x0]
    and r0, r5, #0xff00
    strb r5, [r4, #0x1c]
    mov r0, r0, lsr #0x8
    strb r0, [r4, #0x1d]
    ldr r1, .L_0214cf40
    ldr r0, .L_0214cf44
    ldr r2, [r1, #0x0]
    ldr r5, [r4, #0x0]
    sub r3, r2, #0x1
    ldr r2, [r0, #0x0]
    ldr r0, .L_0214cf48
    str r3, [r1, #0x0]
    str r2, [r0, r3, lsl #0x2]
    ldr r0, [r5, #0x4]
    bl func_020314a0
    ldrb r0, [r4, #0x1c]
    add r0, r0, #0xfb
    and r0, r0, #0xff
    cmp r0, #0x3
    bhi .L_0214cde8
    mov r0, #0x8
    bl func_0207367c
.L_0214cde8:
    ldrb r1, [r4, #0x1c]
    ldr r0, .L_0214cf4c
    ldr r0, [r0, r1, lsl #0x3]
    cmp r0, #0x0
    blt .L_0214ce14
    bl func_020734e0
    ldrb r2, [r4, #0x1c]
    ldr r0, .L_0214cf50
    mov r1, #0x0
    ldr r0, [r0, r2, lsl #0x3]
    bl func_0207361c
.L_0214ce14:
    bl func_02020d90
    mov r1, #0x80000
    str r1, [sp, #0x0]
    mov r5, r0
    ldr r0, [r5, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0214cf54
    bl func_02028384
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    str r5, [r4, #0x4]
    mov r1, #0x0
    ldr r0, .L_0214cf58
    str r1, [r4, #0x14]
    ldr r0, [r0, #0x8d8]
    tst r0, #0x40
    ldrne r0, [r4, #0x18]
    orrne r0, r0, #0x1
    strne r0, [r4, #0x18]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    mov r1, #0x0
    ldr r0, .L_0214cf5c
    mov r2, r1
    blx func_ov012_021caa0c
    str r0, [r4, #0xc]
    bl func_ov003_0214cfc8
    ldr r0, .L_0214cf60
    mov r1, #0x0
    blx func_020101f4
    str r0, [r4, #0x10]
    mov r0, r4
    bl func_ov003_0214d1dc
    ldr r2, .L_0214cf64
    ldr r1, .L_0214cf68
    mov r0, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_0214cf6c
    blx func_ov012_021b7260
    ldr r1, .L_0214cf6c
    mov r0, #0x2
    blx func_ov012_021b7260
    ldr r1, .L_0214cf6c
    mov r0, #0x8
    blx func_ov012_021b7260
    ldr r1, .L_0214cf6c
    mov r0, #0x4
    blx func_ov012_021b7260
    ldr r1, .L_0214cf6c
    mov r0, #0x10000
    blx func_ov012_021b7260
    mov r0, #0x10
    sub r1, r0, #0x11
    blx func_ov012_021b7260
    ldr r1, .L_0214cf70
    mov r0, #0x20
    blx func_ov012_021b7260
    ldr r1, .L_0214cf6c
    mov r0, #0x10000
    blx func_ov012_021b7260
    mov r0, #0x20000
    mvn r1, #0x0
    blx func_ov012_021b7260
    ldr r0, [r4, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
.L_0214cf38: .word data_ov003_0215dae8
.L_0214cf3c: .word data_ov003_0215daa0
.L_0214cf40: .word data_02093c04
.L_0214cf44: .word data_020a0e80
.L_0214cf48: .word data_020a16c0
.L_0214cf4c: .word data_ov003_0215d334
.L_0214cf50: .word data_ov003_0215d338
.L_0214cf54: .word func_ov003_0214cff8
.L_0214cf58: .word data_020b02b8
.L_0214cf5c: .word data_ov003_0215daf4
.L_0214cf60: .word data_ov003_0215db08
.L_0214cf64: .word func_ov003_0214d1b0
.L_0214cf68: .word data_ov012_021d514c
.L_0214cf6c: .word 0x30078
.L_0214cf70: .word 0x10078
    arm_func_end func_ov003_0214cd5c

    .global func_ov003_0214cf74
    arm_func_start func_ov003_0214cf74
func_ov003_0214cf74: ; 0x0214cf74
    ldr r1, [r1, #0x0]
    mov r1, r1, asr #0x4
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov003_0214cf74

    .global func_ov003_0214cf84
    arm_func_start func_ov003_0214cf84
func_ov003_0214cf84: ; 0x0214cf84
    str r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov003_0214cf84

    .global func_ov003_0214cf8c
    arm_func_start func_ov003_0214cf8c
func_ov003_0214cf8c: ; 0x0214cf8c
    stmdb sp!, {r3, lr}
    ldr r2, .L_0214cfbc
    ldr r1, .L_0214cfc0
    ldr ip, [r2, #0x0]
    ldr lr, [r0, #0x4]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r0, .L_0214cfc4
    str ip, [r2, #0x0]
    str r3, [r0, ip, lsl #0x2]
    str lr, [r1, #0x0]
    ldmia sp!, {r3, pc}
.L_0214cfbc: .word data_02093c08
.L_0214cfc0: .word data_020a0dd0
.L_0214cfc4: .word data_020a16d0
    arm_func_end func_ov003_0214cf8c

    .global func_ov003_0214cfc8
    arm_func_start func_ov003_0214cfc8
func_ov003_0214cfc8: ; 0x0214cfc8
    ldr r1, .L_0214cfec
    ldr r2, .L_0214cff0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214cff4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bx lr
.L_0214cfec: .word data_02093c08
.L_0214cff0: .word data_020a16d0
.L_0214cff4: .word data_020a0dd0
    arm_func_end func_ov003_0214cfc8

    .global func_ov003_0214cff8
    arm_func_start func_ov003_0214cff8
func_ov003_0214cff8: ; 0x0214cff8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    ldr r4, [r1, #0x10]
    bl func_02043264
    ldr r0, .L_0214d190
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    ldrb r1, [r4, #0x1c]
    ldr r0, .L_0214d194
    ldr r1, [r0, r1, lsl #0x2]
    cmp r1, #0x0
    beq .L_0214d05c
    ldrb r0, [r4, #0x1f]
    cmp r0, #0x0
    bne .L_0214d05c
    mov r0, r5
    blx r1
    str r0, [r4, #0x8]
    ldr r0, [r5, #0x4]
    ldr r1, .L_0214d198
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d05c:
    ldr r0, [r4, #0x18]
    tst r0, #0x4
    bne .L_0214d07c
    mov r0, #0x8
    bl func_0207367c
    mov r0, #0x8
    bl func_0207372c
    bl func_020735e4
.L_0214d07c:
    ldr r1, .L_0214d19c
    ldr r2, .L_0214d1a0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214d1a4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214d0bc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x10]
.L_0214d0bc:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214d0e0
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_0214d0e0:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0214d100
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_0214d100:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0214d124
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_0214d124:
    mov r0, r4
    bl func_0201b244
    ldr r2, .L_0214d1a8
    mov r1, #0x0
    mov r0, #0x1
    str r1, [r2, #0x0]
    blx func_ov012_021b7260
    mov r0, #0x2
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x8
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x4
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x10000
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x20
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x10000
    mov r1, #0x0
    blx func_ov012_021b7260
    blx func_ov012_021b65cc
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d190: .word data_020a0f64
.L_0214d194: .word data_ov003_0215d2ac
.L_0214d198: .word func_ov003_0214d1ac
.L_0214d19c: .word data_02093c04
.L_0214d1a0: .word data_020a16c0
.L_0214d1a4: .word data_020a0e80
.L_0214d1a8: .word data_ov012_021d514c
    arm_func_end func_ov003_0214cff8

    .global func_ov003_0214d1ac
    arm_func_start func_ov003_0214d1ac
func_ov003_0214d1ac: ; 0x0214d1ac
    bx lr
    arm_func_end func_ov003_0214d1ac

    .global func_ov003_0214d1b0
    arm_func_start func_ov003_0214d1b0
func_ov003_0214d1b0: ; 0x0214d1b0
    stmdb sp!, {r3, lr}
    mvn r0, #0x0
    cmp r1, r0
    ldmeqia sp!, {r3, pc}
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x78
    ldmneia sp!, {r3, pc}
    mov r1, r1, lsr #0x10
    bl func_0207342c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214d1b0

    .global func_ov003_0214d1dc
    arm_func_start func_ov003_0214d1dc
func_ov003_0214d1dc: ; 0x0214d1dc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r11, r0
    mov r7, #0x0
.L_0214d1ec:
    mov r0, #0x14
    mla r10, r7, r0, r11
    mov r6, #0x0
    ldr r0, .L_0214d288
    and r4, r7, #0xff
    ldrb r0, [r0, r4]
    mov r8, r6
    str r0, [sp, #0x0]
.L_0214d20c:
    ldr r0, [sp, #0x0]
    mov r1, r8
    blx func_02072244
    str r0, [sp, #0x4]
    mov r5, #0x0
    add r9, r8, #0x1
    b .L_0214d24c
.L_0214d228:
    ldr r0, .L_0214d288
    mov r1, r9
    ldrb r0, [r0, r4]
    blx func_02072244
    ldr r1, [sp, #0x4]
    add r9, r9, #0x1
    cmp r1, r0
    addeq r0, r5, #0x1
    andeq r5, r0, #0xff
.L_0214d24c:
    cmp r9, #0x14
    blt .L_0214d228
    add r0, r10, r8
    strb r6, [r0, #0x24]
    cmp r5, #0x0
    addeq r0, r8, #0x1
    add r8, r8, #0x1
    andeq r6, r0, #0xff
    cmp r8, #0x14
    blt .L_0214d20c
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0214d1ec
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0214d288: .word data_ov003_0215d298
    arm_func_end func_ov003_0214d1dc

    .global func_ov003_0214d28c
    arm_func_start func_ov003_0214d28c
func_ov003_0214d28c: ; 0x0214d28c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, [r0, #0x4]
    mov r5, #0x0
    ldr ip, [r4, #0x10]
    mov r6, r5
    strb r2, [ip, #0x1c]
    ldr lr, .L_0214d394
    b .L_0214d2c0
.L_0214d2ac:
    and r4, r4, #0xff
    cmp r2, r4
    moveq r5, #0x1
    beq .L_0214d2cc
    add r6, r6, #0x1
.L_0214d2c0:
    ldrsb r4, [lr, r6]
    cmp r4, #0x0
    bge .L_0214d2ac
.L_0214d2cc:
    cmp r5, #0x0
    ldreqb lr, [ip, #0x1f]
    cmpeq lr, #0x0
    beq .L_0214d338
    cmp r2, #0x2
    cmpne r2, #0x18
    cmpne r2, #0x10
    ldreq lr, [ip, #0x18]
    orreq lr, lr, #0x4
    streq lr, [ip, #0x18]
    ldrb r4, [ip, #0x1f]
    cmp r4, #0x0
    beq .L_0214d310
    cmp r2, #0x21
    moveq r2, #0x0
    cmp r3, #0x0
    movlt r3, #0x0
.L_0214d310:
    mov ip, #0x0
    orr ip, ip, r4, lsl #0x18
    mov r3, r3, lsl #0x8
    orr ip, ip, r2, lsl #0x10
    and r2, r3, #0xff00
    orr r3, ip, r2
    ldr r2, .L_0214d398
    orr r1, r3, r1
    str r1, [r2, #0x8]
    b .L_0214d384
.L_0214d338:
    cmp r3, #0x0
    bge .L_0214d374
    cmp r2, #0x0
    bne .L_0214d360
    cmp r1, #0x1
    moveq r3, #0x0
    streqb r3, [ip, #0x1d]
    cmp r1, #0x2
    moveq r3, #0x1
    streqb r3, [ip, #0x1d]
.L_0214d360:
    cmp r2, #0x1
    cmpeq r1, #0x18
    moveq r1, #0x4
    streqb r1, [ip, #0x1d]
    b .L_0214d378
.L_0214d374:
    strb r3, [ip, #0x1d]
.L_0214d378:
    ldr r2, .L_0214d39c
    ldr r1, .L_0214d3a0
    str r2, [r1, #0x0]
.L_0214d384:
    ldr r0, [r0, #0x4]
    ldr r1, .L_0214d3a4
    bl func_02028384
    ldmia sp!, {r4, r5, r6, pc}
.L_0214d394: .word data_ov003_0215d29c
.L_0214d398: .word data_020afcb0
.L_0214d39c: .word func_ov003_0214d1b0
.L_0214d3a0: .word data_ov012_021d514c
.L_0214d3a4: .word func_ov003_0214cff8
    arm_func_end func_ov003_0214d28c

    .global func_ov003_0214d3a8
    arm_func_start func_ov003_0214d3a8
func_ov003_0214d3a8: ; 0x0214d3a8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    mov r0, r2
    bl func_ov003_0214cf8c
    mov r0, r4
    bl func_ov003_0214d450
    mov r4, r0
    bl func_02036ab8
    bl func_ov003_0214d47c
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_0214d410
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_0214d428
.L_0214d410:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_0214d428:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    bl func_ov003_0214cfc8
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov003_0214d3a8

    .global func_ov003_0214d450
    arm_func_start func_ov003_0214d450
func_ov003_0214d450: ; 0x0214d450
    stmdb sp!, {r4, lr}
    bl func_02035c90
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0214d474
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d474:
    ldr r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0214d450

    .global func_ov003_0214d47c
    arm_func_start func_ov003_0214d47c
func_ov003_0214d47c: ; 0x0214d47c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214d49c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d49c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0214d47c

    .global func_ov003_0214d4a4
    arm_func_start func_ov003_0214d4a4
func_ov003_0214d4a4: ; 0x0214d4a4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov003_0214cf8c
    mov r0, r7
    bl func_020329ec
    bl func_ov003_0214d47c
    mov r4, r0
    ldr ip, .L_0214d528
    ldr r3, [r4, #0x4]
    mov r2, r5, lsl #0xc
    str ip, [r3, #0x54]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    bl func_ov003_0214d52c
    ldr r0, [r4, #0x4]
    orr r1, r6, r7
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov003_0214cfc8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d528: .word 0x31305053
    arm_func_end func_ov003_0214d4a4

    .global func_ov003_0214d52c
    arm_func_start func_ov003_0214d52c
func_ov003_0214d52c: ; 0x0214d52c
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214d52c

    .global func_ov003_0214d554
    arm_func_start func_ov003_0214d554
func_ov003_0214d554: ; 0x0214d554
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    mov r7, r2
    ldr r4, .L_0214d64c
    mov r6, r3
    ldr r9, [r0, #0x4]
    ldr r1, .L_0214d650
    ldr r2, .L_0214d654
    mov r0, #0x134
    mov r3, #0x3e
    ldr r5, [sp, #0x24]
    ldr r4, [r4, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214d5a0
    ldr r3, .L_0214d658
    mov r1, r9
    mov r2, r4
    blx func_ov012_021af0f8
.L_0214d5a0:
    bl func_ov003_0214d47c
    mov r4, r0
    ldr r3, [sp, #0x20]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov003_0214d4a4
    ldr r6, [r0, #0x4]
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r1, [sp, #0x20]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    add r1, sp, #0x0
    bl func_ov003_0214d52c
    ldmia r5, {r0, r1}
    mov r2, r1, lsl #0xc
    ldr r1, [r4, #0x4]
    mov r0, r0, lsl #0xc
    ldr r5, [r1, #0x50]
    str r0, [r5, #0xc]
    str r2, [r5, #0x10]
    ldrb r0, [r5, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_0214d638
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0214d638:
    ldrb r1, [r5, #0x24]
    mov r0, r4
    orr r1, r1, #0x31
    strb r1, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0214d64c: .word data_ov012_021d5154
.L_0214d650: .word data_ov003_0215da90
.L_0214d654: .word data_ov003_0215da80
.L_0214d658: .word func_ov003_0214d65c
    arm_func_end func_ov003_0214d554

    .global func_ov003_0214d65c
    arm_func_start func_ov003_0214d65c
func_ov003_0214d65c: ; 0x0214d65c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x44
    ldr r1, .L_0214d6a4
    ldr r2, .L_0214d6a8
    add r3, r0, #0xc1
    bl func_0201a21c
    movs r4, r0
    beq .L_0214d69c
    mov r1, r5
    mov r2, #0x0
    bl func_02014604
    ldr r1, .L_0214d6ac
    mov r0, #0x1
    str r1, [r4, #0x0]
    strb r0, [r4, #0x40]
.L_0214d69c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d6a4: .word data_ov003_0215dac0
.L_0214d6a8: .word data_ov003_0215dab0
.L_0214d6ac: .word data_ov012_021d2a24
    arm_func_end func_ov003_0214d65c

    .global func_ov003_0214d6b0
    arm_func_start func_ov003_0214d6b0
func_ov003_0214d6b0: ; 0x0214d6b0
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, .L_0214d760
    mov r5, r0
    ldr r1, .L_0214d764
    ldr r2, .L_0214d768
    ldr r3, .L_0214d76c
    mov r0, #0x14c
    ldr r4, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214d6ec
    ldr r3, .L_0214d770
    mov r2, r4
    mov r1, #0x0
    blx func_ov012_021b7950
.L_0214d6ec:
    bl func_ov003_0214d47c
    mov r4, r0
    movs r1, #0x0
    bne .L_0214d708
    ldr r0, [r4, #0x4]
    blx func_ov012_021b5898
    b .L_0214d718
.L_0214d708:
    mov r1, #0x4
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_0214d718:
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b7744
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d760: .word data_ov012_021d5154
.L_0214d764: .word data_ov003_0215dad4
.L_0214d768: .word data_ov003_0215da88
.L_0214d76c: .word 0x2a6
.L_0214d770: .word func_ov003_0214d65c
    arm_func_end func_ov003_0214d6b0

    .global func_ov003_0214d774
    arm_func_start func_ov003_0214d774
func_ov003_0214d774: ; 0x0214d774
    ldr r1, .L_0214d780
    ldrb r0, [r1, r0]
    bx lr
.L_0214d780: .word data_ov003_0215d298
    arm_func_end func_ov003_0214d774

    .global func_ov003_0214d784
    arm_func_start func_ov003_0214d784
func_ov003_0214d784: ; 0x0214d784
    ldr r2, .L_0214d794
    ldr ip, .L_0214d798
    ldrb r0, [r2, r0]
    bx ip
.L_0214d794: .word data_ov003_0215d298
.L_0214d798: .word func_0207216c
    arm_func_end func_ov003_0214d784

    .global func_ov003_0214d79c
    arm_func_start func_ov003_0214d79c
func_ov003_0214d79c: ; 0x0214d79c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, .L_0214d7d0
    mov r5, r0
    ldrb r0, [r3, r1]
    mov r1, r2
    blx func_0207216c
    ldrb r4, [r0, #0x34]
    mov r0, r5
    bl func_02075780
    mov r0, r5
    mov r1, r4
    bl func_02075788
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d7d0: .word data_ov003_0215d298
    arm_func_end func_ov003_0214d79c

    .global func_ov003_0214d7d4
    arm_func_start func_ov003_0214d7d4
func_ov003_0214d7d4: ; 0x0214d7d4
    stmdb sp!, {r3, lr}
    ldr r2, .L_0214d7ec
    ldrb r0, [r2, r0]
    blx func_0207216c
    ldrb r0, [r0, #0x36]
    ldmia sp!, {r3, pc}
.L_0214d7ec: .word data_ov003_0215d298
    arm_func_end func_ov003_0214d7d4

    .global func_ov003_0214d7f0
    arm_func_start func_ov003_0214d7f0
func_ov003_0214d7f0: ; 0x0214d7f0
    ldr r2, .L_0214d800
    ldr ip, .L_0214d804
    ldrb r0, [r2, r0]
    bx ip
.L_0214d800: .word data_ov003_0215d298
.L_0214d804: .word func_02072244
    arm_func_end func_ov003_0214d7f0

    .global func_ov003_0214d808
    arm_func_start func_ov003_0214d808
func_ov003_0214d808: ; 0x0214d808
    ldr r2, .L_0214d818
    ldr ip, .L_0214d81c
    ldrb r0, [r2, r0]
    bx ip
.L_0214d818: .word data_ov003_0215d298
.L_0214d81c: .word func_02072258
    arm_func_end func_ov003_0214d808

    .global func_ov003_0214d820
    arm_func_start func_ov003_0214d820
func_ov003_0214d820: ; 0x0214d820
    ldr r1, .L_0214d830
    ldr ip, .L_0214d834
    ldrb r0, [r1, r0]
    bx ip
.L_0214d830: .word data_ov003_0215d298
.L_0214d834: .word func_020721c8
    arm_func_end func_ov003_0214d820

    .global func_ov003_0214d838
    arm_func_start func_ov003_0214d838
func_ov003_0214d838: ; 0x0214d838
    ldr r1, .L_0214d848
    ldr ip, .L_0214d84c
    ldrb r0, [r1, r0]
    bx ip
.L_0214d848: .word data_ov003_0215d298
.L_0214d84c: .word func_020721ec
    arm_func_end func_ov003_0214d838

    .global func_ov003_0214d850
    arm_func_start func_ov003_0214d850
func_ov003_0214d850: ; 0x0214d850
    ldr r2, .L_0214d860
    ldr ip, .L_0214d864
    ldrb r0, [r2, r0]
    bx ip
.L_0214d860: .word data_ov003_0215d298
.L_0214d864: .word func_02072210
    arm_func_end func_ov003_0214d850

    .global func_ov003_0214d868
    arm_func_start func_ov003_0214d868
func_ov003_0214d868: ; 0x0214d868
    ldr r0, .L_0214d880
    ldr r0, [r0, #0x8d8]
    tst r0, #0x1000
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0214d880: .word data_020b02b8
    arm_func_end func_ov003_0214d868

    .global func_ov003_0214d884
    arm_func_start func_ov003_0214d884
func_ov003_0214d884: ; 0x0214d884
    ldr r0, .L_0214d89c
    ldr r0, [r0, #0x8d8]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0214d89c: .word data_020b02b8
    arm_func_end func_ov003_0214d884

    .global func_ov003_0214d8a0
    arm_func_start func_ov003_0214d8a0
func_ov003_0214d8a0: ; 0x0214d8a0
    ldr r0, .L_0214d8b8
    ldr r0, [r0, #0x8d8]
    tst r0, #0x4000
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0214d8b8: .word data_020b02b8
    arm_func_end func_ov003_0214d8a0

    .global func_ov003_0214d8bc
    arm_func_start func_ov003_0214d8bc
func_ov003_0214d8bc: ; 0x0214d8bc
    ldr r0, .L_0214d8d4
    ldr r0, [r0, #0x8d8]
    tst r0, #0x8000
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0214d8d4: .word data_020b02b8
    arm_func_end func_ov003_0214d8bc

    .global func_ov003_0214d8d8
    arm_func_start func_ov003_0214d8d8
func_ov003_0214d8d8: ; 0x0214d8d8
    stmdb sp!, {r3, lr}
    ldr r1, .L_0214d8f4
    ldrb r0, [r1, r0]
    bl func_020703b8
    add r0, r0, #0x1
    and r0, r0, #0xff
    ldmia sp!, {r3, pc}
.L_0214d8f4: .word data_ov003_0215d298
    arm_func_end func_ov003_0214d8d8

    .global func_ov003_0214d8f8
    arm_func_start func_ov003_0214d8f8
func_ov003_0214d8f8: ; 0x0214d8f8
    stmdb sp!, {r3, lr}
    mov r0, #0x0
    bl func_020703b8
    add r0, r0, #0x1
    and r0, r0, #0xff
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214d8f8

    .global func_ov003_0214d910
    arm_func_start func_ov003_0214d910
func_ov003_0214d910: ; 0x0214d910
    stmdb sp!, {r3, lr}
    mov r0, #0x1
    bl func_020703b8
    add r0, r0, #0x1
    and r0, r0, #0xff
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214d910

    .global func_ov003_0214d928
    arm_func_start func_ov003_0214d928
func_ov003_0214d928: ; 0x0214d928
    stmdb sp!, {r3, lr}
    mov r0, #0x2
    bl func_020703b8
    add r0, r0, #0x1
    and r0, r0, #0xff
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214d928

    .global func_ov003_0214d940
    arm_func_start func_ov003_0214d940
func_ov003_0214d940: ; 0x0214d940
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_020703b8
    add r0, r0, #0x1
    and r0, r0, #0xff
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214d940

    .global func_ov003_0214d958
    arm_func_start func_ov003_0214d958
func_ov003_0214d958: ; 0x0214d958
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x78
    ldr r1, .L_0214e63c
    mov r5, r0
    ldr r2, .L_0214e640
    mov r0, #0x6c
    mov r3, #0x90
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x6c
    mov r10, r0
    bl func_020517fc
    bl func_02020d90
    mov r1, #0x85000
    str r1, [sp, #0x74]
    mov r4, r0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x74
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e644
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    cmp r5, #0x0
    ldr r0, [r4, #0x4]
    bne .L_0214d9ec
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_0214d9fc
.L_0214d9ec:
    ldr r2, [r0, #0x0]
    ldr r1, [r5, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_0214d9fc:
    str r4, [r10, #0x4]
    ldr r0, [r5, #0x4]
    mov r1, #0x21
    ldr r2, [r0, #0x10]
    mov r0, #0x0
    ldrb r2, [r2, #0x1d]
    strb r2, [r10, #0x1]
    strb r1, [r10, #0x0]
    bl func_02028920
    str r0, [r10, #0x8]
    mov r0, #0x1
    bl func_02043264
    mov r0, #0x0
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x60]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x60
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x64]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x64
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x68]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x68
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x6c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x6c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r9, #0x0
    mov r8, #0x1
    mov r7, #0x4
    mov r6, r9
    mov r5, r9
    add r4, sp, #0x70
.L_0214dc60:
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r8
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r6
    ldr r0, [r0, #0x4]
    mov r2, r6
    bl func_0203cfbc
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r9
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, r9, lsl #0xc
    str r0, [sp, #0x70]
    ldr r0, [r1, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_0214dc60
    ldr r5, .L_0214e648
    ldr r4, .L_0214e64c
    mov r6, #0x0
.L_0214dd0c:
    add r0, r6, #0x1
    bl func_0203b414
    mov r2, r0
    ldr r0, [r5, r6, lsl #0x2]
    ldr r1, [r4, r6, lsl #0x2]
    ldr r2, [r2, #0x88]
    bl func_ov003_0214d3a8
    add r1, r10, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x18]
    cmp r6, #0x2
    blt .L_0214dd0c
    mov r6, #0x0
    ldr r5, .L_0214e650
    mov r4, r6
.L_0214dd48:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r10, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0xc]
    cmp r6, #0x3
    blt .L_0214dd48
    ldr r1, .L_0214e654
    ldr r2, .L_0214e658
    ldr r3, .L_0214e65c
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_0214dd98
    ldr r1, .L_0214e660
    ldr r2, .L_0214e664
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r4, r0
.L_0214dd98:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214ddb4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214ddb4:
    ldr r4, [r4, #0x18]
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x1
    blx func_ov012_021b3b7c
    ldr r0, .L_0214e668
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e66c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0214ddfc
    bl func_ov003_0214d47c
.L_0214ddfc:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_0214de1c
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_0214de1c:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0214de38
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214de38:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x21
    mov r2, #0x2
    mov r3, #0x5
    bl func_0206ad90
    str r0, [r10, #0x60]
    cmp r0, #0x0
    beq .L_0214de84
    mov r2, #0x0
    ldr r1, .L_0214e670
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
.L_0214de84:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r4, #0x4]
    mov r2, #0x100
    str r2, [r1, #0x124]
    str r4, [r10, #0x20]
    mov r0, #0xc0
    str r2, [sp, #0x58]
    str r0, [sp, #0x5c]
    bl func_0203b3e4
    mov r1, #0xa0
    str r1, [sp, #0x0]
    add r1, sp, #0x58
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r0, [r10, #0x20]
    mov r2, #0x510000
    mov r3, #0x0
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0xab]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_0214e674
    ldr r2, .L_0214e678
    mov r0, #0x0
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e67c
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e680
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e684
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    str r1, [r0, #0x124]
    str r4, [r10, #0x40]
    mov r1, #0x80
    mov r0, #0x0
    str r1, [sp, #0x58]
    str r0, [sp, #0x5c]
    bl func_0203b404
    mov r1, #0x81
    str r1, [sp, #0x0]
    add r1, sp, #0x58
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r0, [r10, #0x20]
    mov r2, #0x810000
    mov r3, #0x0
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    str r4, [r10, #0x44]
    ldr r1, .L_0214e668
    ldr r0, [r10, #0x20]
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    ldr r1, [r10, #0x18]
    mov r4, r0
    bl func_ov003_0214e908
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e688
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r10
    str r4, [r10, #0x4c]
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    str r1, [r0, #0x140]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e68c
    ldr r2, .L_0214e690
    str r1, [r0, #0x124]
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e694
    mov r1, #0x10
    blx func_ov012_021b6760
    str r4, [r10, #0x24]
    mov r9, #0x0
    mov r8, #0xb8
    mov r7, #0x86
    add r6, sp, #0x30
    mov r5, #0x810000
    add r11, sp, #0x38
.L_0214e100:
    mov r0, r9, lsl #0x5
    add r0, r0, #0x30
    str r8, [sp, #0x30]
    str r0, [sp, #0x34]
    bl func_0203b404
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r0, [r10, #0x24]
    mov r2, r5
    add r3, r9, #0x5
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0214e698
    mov r0, r11
    mov r1, r4
    bl func_ov003_0214e940
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x34]
    add r0, r0, #0xa0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x44]
    str r0, [sp, #0x40]
    mov r0, r4
    add r1, sp, #0x40
    add r2, sp, #0x44
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    bl func_02023c60
    ldr r1, [sp, #0x34]
    ldr r0, [sp, #0x30]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x4c]
    str r0, [sp, #0x48]
    mov r0, r4
    add r1, sp, #0x48
    add r2, sp, #0x4c
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r2, .L_0214e69c
    ldr r3, [sp, #0x3c]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_ov012_021b4034
    ldr r1, .L_0214e6a0
    ldr r2, .L_0214e678
    mov r0, #0x0
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e6a4
    mov r1, #0x1
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e6a8
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e6ac
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e6b0
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r1, r10
    str r9, [r0, #0x124]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x34]
    add r0, r0, #0xa0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x54]
    str r0, [sp, #0x50]
    mov r0, r4
    add r1, sp, #0x50
    add r2, sp, #0x54
    bl func_ov003_0214e990
    add r0, r10, r9, lsl #0x2
    str r4, [r0, #0x30]
    ldrb r0, [r10, #0x1]
    cmp r9, r0
    bne .L_0214e2d0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
.L_0214e2d0:
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_0214e100
    mov r9, #0x0
    mov r4, #0x1
    mov r7, #0x3
    mov r6, r9
    mov r5, r4
    mov r11, #0x2
.L_0214e2f4:
    subs r0, r9, #0x1
    movmi r0, r7
    add r0, r10, r0, lsl #0x2
    ldr r1, [r0, #0x30]
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x30]
    add r8, r9, #0x1
    cmp r8, #0x3
    movgt r8, r6
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214e338
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x164]
    blx r2
    b .L_0214e34c
.L_0214e338:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, r4
    blx r3
.L_0214e34c:
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0x30]
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x30]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214e37c
    ldr r2, [r0, #0x0]
    mov r1, r11
    ldr r2, [r2, #0x164]
    blx r2
    b .L_0214e390
.L_0214e37c:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x2
    blx r3
.L_0214e390:
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_0214e2f4
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e6b4
    ldr r2, .L_0214e690
    str r1, [r0, #0x124]
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e694
    mov r1, #0x10
    blx func_ov012_021b6760
    str r4, [r10, #0x2c]
    mov r1, #0x40
    mov r0, #0x6a
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
    mov r7, #0x8
    add r6, sp, #0x28
    mov r5, #0x800000
    mov r4, #0x0
.L_0214e3f8:
    sub r0, r7, #0x8
    mov r8, r0, lsl #0x1
    bl func_0203b404
    sub r1, r7, #0x8
    rsb r1, r1, #0x84
    str r1, [sp, #0x0]
    mov r1, r0
    str r6, [sp, #0x4]
    ldr r0, [r10, #0x2c]
    ldr r1, [r1, #0x88]
    mov r2, r5
    add r3, r8, #0x1
    bl func_ov003_0214d554
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x30]
    orr r9, r8, #0x800000
    ldr r0, [r0, #0x4]
    mov r1, r9
    mov r2, r4
    bl func_02023894
    add r0, r8, #0x1
    orr r1, r0, #0x800000
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b3f78
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x30]
    mov r1, r9
    ldr r0, [r0, #0x4]
    blx func_ov012_021b4034
    add r7, r7, #0x1
    cmp r7, #0xb
    blt .L_0214e3f8
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e6b8
    ldr r2, .L_0214e6bc
    str r1, [r0, #0x124]
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e6c0
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r1, .L_0214e668
    str r4, [r10, #0x28]
    ldr r1, [r1, #0x0]
    mov r0, r4
    bl func_ov003_0214e8bc
    ldr r1, [r10, #0x1c]
    mov r4, r0
    bl func_ov003_0214e908
    ldr r0, [r10, #0x1c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0214e698
    add r0, sp, #0x8
    mov r1, r4
    bl func_ov003_0214e940
    mov r0, #0x0
    str r0, [sp, #0x14]
    mov r0, #0x100000
    str r0, [sp, #0x10]
    mov r0, r4
    add r1, sp, #0x10
    add r2, sp, #0x14
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x18]
    mov r0, r4
    add r1, sp, #0x18
    add r2, sp, #0x1c
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    ldr r2, .L_0214e69c
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_ov012_021b4034
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r0, #0x100000
    str r0, [sp, #0x20]
    mov r0, r4
    add r1, sp, #0x20
    add r2, sp, #0x24
    bl func_ov003_0214e990
    mov r0, #0x1
    str r4, [r10, #0x48]
    mov r1, r0
    mov r2, r0
    sub r3, r0, #0x2
    blx func_ov012_021bcf1c
    str r0, [r10, #0x5c]
    ldrb r1, [r10, #0x1]
    mov r0, r10
    bl func_ov003_0214ed1c
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r10, #0x28]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r10, #0x4]
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0214e63c: .word data_ov003_0215dc94
.L_0214e640: .word data_ov003_0215dbfc
.L_0214e644: .word func_ov003_0214e6c4
.L_0214e648: .word data_ov003_0215db3c
.L_0214e64c: .word data_ov003_0215db34
.L_0214e650: .word data_ov003_0215db44
.L_0214e654: .word data_ov003_0215dbec
.L_0214e658: .word data_ov003_0215db1c
.L_0214e65c: .word 0x1de
.L_0214e660: .word func_ov003_0214ec20
.L_0214e664: .word func_ov003_0214eccc
.L_0214e668: .word data_ov012_021d5154
.L_0214e66c: .word 0x31305053
.L_0214e670: .word 0x8df
.L_0214e674: .word data_ov003_0215db58
.L_0214e678: .word data_02093c8c
.L_0214e67c: .word func_ov003_0214eb7c
.L_0214e680: .word func_ov003_0214eb94
.L_0214e684: .word 0x510001
.L_0214e688: .word func_ov003_0214ed44
.L_0214e68c: .word 0x101
.L_0214e690: .word func_ov003_0214ea38
.L_0214e694: .word func_ov003_0214ea48
.L_0214e698: .word data_ov003_0215dca8
.L_0214e69c: .word 0x494c
.L_0214e6a0: .word data_ov003_0215db50
.L_0214e6a4: .word func_ov003_0214ed04
.L_0214e6a8: .word func_ov003_0214eab0
.L_0214e6ac: .word func_ov003_0214eac8
.L_0214e6b0: .word func_ov003_0214ea7c
.L_0214e6b4: .word 0x103
.L_0214e6b8: .word 0x102
.L_0214e6bc: .word func_ov003_0214e9dc
.L_0214e6c0: .word func_ov003_0214e9ec
    arm_func_end func_ov003_0214d958

    .global func_ov003_0214e6c4
    arm_func_start func_ov003_0214e6c4
func_ov003_0214e6c4: ; 0x0214e6c4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e6e8
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0214e6e8: .word func_ov003_0214e818
    arm_func_end func_ov003_0214e6c4

    .global func_ov003_0214e6ec
    arm_func_start func_ov003_0214e6ec
func_ov003_0214e6ec: ; 0x0214e6ec
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0214e720
    bl func_ov003_0214d47c
.L_0214e720:
    ldrb r2, [r4, #0x0]
    ldrsb r3, [r4, #0x1]
    mov r1, #0x0
    bl func_ov003_0214d28c
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_0214e748
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r4, #0x60]
.L_0214e748:
    ldr r0, .L_0214e814
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_0214e774
    blx func_ov012_021bd500
    mov r0, #0x0
    str r0, [r4, #0x5c]
.L_0214e774:
    mov r6, #0x0
    mov r5, r6
.L_0214e77c:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0214e7a0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x20]
.L_0214e7a0:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_0214e77c
    mov r6, #0x0
    mov r5, r6
.L_0214e7b4:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_0214e7d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0xc]
.L_0214e7d8:
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_0214e7b4
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0214e804
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_0214e804:
    blx func_ov012_021b65cc
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_0214e814: .word data_ov012_021d5154
    arm_func_end func_ov003_0214e6ec

    .global func_ov003_0214e818
    arm_func_start func_ov003_0214e818
func_ov003_0214e818: ; 0x0214e818
    bx lr
    arm_func_end func_ov003_0214e818

    .global func_ov003_0214e81c
    arm_func_start func_ov003_0214e81c
func_ov003_0214e81c: ; 0x0214e81c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_0214e894
    ldr r2, .L_0214e898
    ldr r3, .L_0214e89c
    mov r0, #0x70
    bl func_0201a21c
    movs r4, r0
    beq .L_0214e870
    mov r1, r7
    mov r2, r5
    blx func_ov012_021b054c
    ldr r2, .L_0214e8a0
    mov r1, r6
    add r0, r4, #0x68
    str r2, [r4, #0x0]
    bl func_ov003_0214e8a8
    ldr r0, .L_0214e8a4
    str r0, [r4, #0x0]
.L_0214e870:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214e88c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214e88c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214e894: .word data_ov003_0215dc0c
.L_0214e898: .word data_ov003_0215db24
.L_0214e89c: .word 0x1b2
.L_0214e8a0: .word data_ov003_0215db68
.L_0214e8a4: .word data_ov012_021d1c58
    arm_func_end func_ov003_0214e81c

    .global func_ov003_0214e8a8
    arm_func_start func_ov003_0214e8a8
func_ov003_0214e8a8: ; 0x0214e8a8
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov003_0214e8a8

    .global func_ov003_0214e8bc
    arm_func_start func_ov003_0214e8bc
func_ov003_0214e8bc: ; 0x0214e8bc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r4, [r0, #0x4]
    ldr r1, .L_0214e8fc
    ldr r2, .L_0214e900
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214e8f4
    ldr r3, .L_0214e904
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_0214e8f4:
    bl func_ov003_0214d47c
    ldmia sp!, {r3, r4, r5, pc}
.L_0214e8fc: .word data_ov003_0215da90
.L_0214e900: .word data_ov003_0215db2c
.L_0214e904: .word func_ov003_0214d65c
    arm_func_end func_ov003_0214e8bc

    .global func_ov003_0214e908
    arm_func_start func_ov003_0214e908
func_ov003_0214e908: ; 0x0214e908
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r5, [r1, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0xb4]
    blx r2
    mov r4, r0
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov003_0214e908

    .global func_ov003_0214e940
    arm_func_start func_ov003_0214e940
func_ov003_0214e940: ; 0x0214e940
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r2
    mov r6, r0
    ldr r4, [r1, #0x4]
    mov r0, r5
    bl func_020326b0
    mov r3, r0
    mov r0, r4
    ldr ip, [r0, #0x0]
    add r2, sp, #0x0
    ldr ip, [ip, #0x40]
    mov r1, r5
    blx ip
    mov r1, r0
    ldr r2, [sp, #0x0]
    mov r0, r6
    bl func_0202c4a4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
    arm_func_end func_ov003_0214e940

    .global func_ov003_0214e990
    arm_func_start func_ov003_0214e990
func_ov003_0214e990: ; 0x0214e990
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r2, #0x0]
    ldr r4, [r0, #0x50]
    ldr r0, [r1, #0x0]
    str r0, [r4, #0xc]
    str r2, [r4, #0x10]
    ldrb r0, [r4, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_0214e9cc
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0214e9cc:
    ldrb r0, [r4, #0x24]
    orr r0, r0, #0x31
    strb r0, [r4, #0x24]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0214e990

    .global func_ov003_0214e9dc
    arm_func_start func_ov003_0214e9dc
func_ov003_0214e9dc: ; 0x0214e9dc
    ldr ip, .L_0214e9e8
    ldr r0, [r0, #0x4]
    bx ip
.L_0214e9e8: .word func_ov012_021b65d8
    arm_func_end func_ov003_0214e9dc

    .global func_ov003_0214e9ec
    arm_func_start func_ov003_0214e9ec
func_ov003_0214e9ec: ; 0x0214e9ec
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x24]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0214e9ec

    .global func_ov003_0214ea38
    arm_func_start func_ov003_0214ea38
func_ov003_0214ea38: ; 0x0214ea38
    ldr ip, .L_0214ea44
    ldr r0, [r0, #0x4]
    bx ip
.L_0214ea44: .word func_ov012_021b65d8
    arm_func_end func_ov003_0214ea38

    .global func_ov003_0214ea48
    arm_func_start func_ov003_0214ea48
func_ov003_0214ea48: ; 0x0214ea48
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214ea78
    ldr r2, [r0, #0x124]
    cmp r2, r1
    ldmneia sp!, {r4, pc}
    mov r1, #0x1
    blx func_ov012_021b6214
    ldmia sp!, {r4, pc}
.L_0214ea78: .word 0x101
    arm_func_end func_ov003_0214ea48

    .global func_ov003_0214ea7c
    arm_func_start func_ov003_0214ea7c
func_ov003_0214ea7c: ; 0x0214ea7c
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x10]
    ldr r1, [r0, #0x124]
    ldrb r2, [r2, #0x1]
    cmp r2, r1
    bne .L_0214eaa4
    mov r1, #0x1
    blx func_ov012_021b6214
    ldmia sp!, {r3, pc}
.L_0214eaa4:
    mov r1, #0x0
    blx func_ov012_021b6214
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214ea7c

    .global func_ov003_0214eab0
    arm_func_start func_ov003_0214eab0
func_ov003_0214eab0: ; 0x0214eab0
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214eab0

    .global func_ov003_0214eac8
    arm_func_start func_ov003_0214eac8
func_ov003_0214eac8: ; 0x0214eac8
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r0, .L_0214eb70
    ldr r2, [r1, #0x124]
    ldr r4, [r1, #0x10]
    ldrb r0, [r0, r2]
    mov r1, #0x0
    strb r0, [r4, #0x0]
    strb r2, [r4, #0x1]
    ldr r0, [r4, #0x20]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldrb r0, [r4, #0x0]
    add r0, r0, #0xfd
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_0214eb20
    bl func_020703d8
.L_0214eb20:
    ldr r0, .L_0214eb74
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214eb74
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214eb74
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214eb74
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214eb78
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0214eb70: .word data_ov003_0215d444
.L_0214eb74: .word data_020a0e18
.L_0214eb78: .word func_ov003_0214e6ec
    arm_func_end func_ov003_0214eac8

    .global func_ov003_0214eb7c
    arm_func_start func_ov003_0214eb7c
func_ov003_0214eb7c: ; 0x0214eb7c
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214eb7c

    .global func_ov003_0214eb94
    arm_func_start func_ov003_0214eb94
func_ov003_0214eb94: ; 0x0214eb94
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x20
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    strb r0, [r4, #0x0]
    ldr r0, [r4, #0x20]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, .L_0214ec18
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214ec18
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214ec18
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214ec18
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214ec1c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0214ec18: .word data_020a0e18
.L_0214ec1c: .word func_ov003_0214e6ec
    arm_func_end func_ov003_0214eb94

    .global func_ov003_0214ec20
    arm_func_start func_ov003_0214ec20
func_ov003_0214ec20: ; 0x0214ec20
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r0
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x810000
    mov r2, #0x2
    mov r3, #0x85
    bl func_ov003_0214d4a4
    mov ip, #0x1000
    mov r3, #0x0
    add r1, sp, #0x10
    add r2, sp, #0xc
    mov r5, r0
    str ip, [sp, #0xc]
    str r3, [sp, #0x10]
    bl func_ov003_0214e990
    mov r0, r4
    mov r1, r5
    bl func_ov003_0214e908
    ldr r1, [r4, #0x4]
    mov r0, #0x85000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, #0x100000
    str r1, [sp, #0x4]
    mov r1, #0x180000
    str r1, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    add r2, sp, #0x4
    bl func_ov003_0214e990
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov003_0214ec20

    .global func_ov003_0214eccc
    arm_func_start func_ov003_0214eccc
func_ov003_0214eccc: ; 0x0214eccc
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr ip, [r0, #0x4]
    add r1, sp, #0x4
    ldrsh r3, [ip, #0xa2]
    add r2, sp, #0x0
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldrsh r3, [ip, #0xa0]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214eccc

    .global func_ov003_0214ed04
    arm_func_start func_ov003_0214ed04
func_ov003_0214ed04: ; 0x0214ed04
    ldr r1, [r0, #0x4]
    ldr ip, .L_0214ed18
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x124]
    bx ip
.L_0214ed18: .word func_ov003_0214ed1c
    arm_func_end func_ov003_0214ed04

    .global func_ov003_0214ed1c
    arm_func_start func_ov003_0214ed1c
func_ov003_0214ed1c: ; 0x0214ed1c
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x5c]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r3, .L_0214ed40
    mov r2, #0x0
    ldr r1, [r3, r1, lsl #0x2]
    blx func_ov012_021bd730
    ldmia sp!, {r3, pc}
.L_0214ed40: .word data_ov003_0215d448
    arm_func_end func_ov003_0214ed1c

    .global func_ov003_0214ed44
    arm_func_start func_ov003_0214ed44
func_ov003_0214ed44: ; 0x0214ed44
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0x68]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0x68]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0x68]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214ed44

    .global func_ov003_0214ed94
    arm_func_start func_ov003_0214ed94
func_ov003_0214ed94: ; 0x0214ed94
    ldrh r1, [r0, #0x4]
    add r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    bx lr
    arm_func_end func_ov003_0214ed94

    .global func_ov003_0214eda8
    arm_func_start func_ov003_0214eda8
func_ov003_0214eda8: ; 0x0214eda8
    str r1, [r0, #0x30]
    bx lr
    arm_func_end func_ov003_0214eda8

    .global func_ov003_0214edb0
    arm_func_start func_ov003_0214edb0
func_ov003_0214edb0: ; 0x0214edb0
    mov r0, #0x0
    bx lr
    arm_func_end func_ov003_0214edb0

    .global func_ov003_0214edb8
    arm_func_start func_ov003_0214edb8
func_ov003_0214edb8: ; 0x0214edb8
    mov r0, #0x0
    bx lr
    arm_func_end func_ov003_0214edb8

    .global func_ov003_0214edc0
    arm_func_start func_ov003_0214edc0
func_ov003_0214edc0: ; 0x0214edc0
    mov r0, #0x0
    bx lr
    arm_func_end func_ov003_0214edc0

    .global func_ov003_0214edc8
    arm_func_start func_ov003_0214edc8
func_ov003_0214edc8: ; 0x0214edc8
    ldr r2, [r0, #0x1c]
    cmp r2, r1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov003_0214edc8

    .global func_ov003_0214edd8
    arm_func_start func_ov003_0214edd8
func_ov003_0214edd8: ; 0x0214edd8
    str r1, [r0, #0x1c]
    bx lr
    arm_func_end func_ov003_0214edd8

    .global func_ov003_0214ede0
    arm_func_start func_ov003_0214ede0
func_ov003_0214ede0: ; 0x0214ede0
    mov r0, #0x1
    bx lr
    arm_func_end func_ov003_0214ede0

    .global func_ov003_0214ede8
    arm_func_start func_ov003_0214ede8
func_ov003_0214ede8: ; 0x0214ede8
    ldr r0, .L_0214edf0
    bx lr
.L_0214edf0: .word data_02093c74
    arm_func_end func_ov003_0214ede8

    .global func_ov003_0214edf4
    arm_func_start func_ov003_0214edf4
func_ov003_0214edf4: ; 0x0214edf4
    mov r0, #0x0
    bx lr
    arm_func_end func_ov003_0214edf4

    .global func_ov003_0214edfc
    arm_func_start func_ov003_0214edfc
func_ov003_0214edfc: ; 0x0214edfc
    ldr ip, .L_0214ee08
    add r0, r0, #0x68
    bx ip
.L_0214ee08: .word func_ov003_0214e8a8
    arm_func_end func_ov003_0214edfc

    .global func_ov003_0214ee0c
    arm_func_start func_ov003_0214ee0c
func_ov003_0214ee0c: ; 0x0214ee0c
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0214ee0c

    .global func_ov003_0214ee20
    arm_func_start func_ov003_0214ee20
func_ov003_0214ee20: ; 0x0214ee20
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0214ee20

    .global func_ov003_0214ee3c
    arm_func_start func_ov003_0214ee3c
func_ov003_0214ee3c: ; 0x0214ee3c
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldr r1, [sp, #0x0]
    strh r3, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov003_0214ee3c

    .global func_ov003_0214ee54
    arm_func_start func_ov003_0214ee54
func_ov003_0214ee54: ; 0x0214ee54
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x54
    ldr r1, .L_0214fac0
    mov r4, r0
    ldr r2, .L_0214fac4
    mov r0, #0x78
    mov r3, #0xa2
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x78
    mov r9, r0
    bl func_020517fc
    bl func_0207038c
    bl func_02020d90
    mov r1, #0x85000
    str r1, [sp, #0x50]
    mov r6, r0
    ldr r0, [r6, #0x4]
    add r1, sp, #0x50
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, .L_0214fac8
    bl func_02028384
    ldr r0, [r6, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r6
    mov r1, r4
    bl func_ov003_0214fb44
    str r6, [r9, #0x4]
    ldr r0, [r4, #0x4]
    mov r1, #0x21
    ldr r2, [r0, #0x10]
    mov r0, #0x0
    ldrb r2, [r2, #0x1d]
    strb r2, [r9, #0x1]
    strb r1, [r9, #0x0]
    bl func_02028920
    ldr r5, .L_0214facc
    ldr r4, .L_0214fad0
    str r0, [r9, #0x8]
    mov r7, #0x0
.L_0214ef0c:
    add r0, r7, #0x1
    bl func_0203b414
    mov r2, r0
    ldr r0, [r5, r7, lsl #0x2]
    ldr r1, [r4, r7, lsl #0x2]
    ldr r2, [r2, #0x88]
    bl func_ov003_0214d3a8
    add r1, r9, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0x18]
    cmp r7, #0x2
    blt .L_0214ef0c
    mov r7, #0x0
    ldr r5, .L_0214fad4
    mov r4, r7
.L_0214ef48:
    ldr r0, [r5, r7, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r9, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0xc]
    cmp r7, #0x3
    blt .L_0214ef48
    mov r0, #0x1
    bl func_02043264
    bl func_0203d4e4
    mov r0, #0x0
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x3c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x3c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x40]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x40
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x44]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x44
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x48]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x48
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r10, #0x0
    mov r8, #0x1
    mov r7, #0x4
    mov r5, r10
    mov r4, r10
    add r11, sp, #0x4c
.L_0214f1a8:
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r8
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r5
    ldr r0, [r0, #0x4]
    mov r2, r5
    bl func_0203cfbc
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r10
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, r10, lsl #0xc
    str r0, [sp, #0x4c]
    ldr r0, [r1, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r10, r10, #0x1
    cmp r10, #0x4
    blt .L_0214f1a8
    ldr r1, .L_0214fad8
    ldr r2, .L_0214fadc
    ldr r3, .L_0214fae0
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_0214f278
    ldr r1, .L_0214fae4
    ldr r2, .L_0214fae8
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r4, r0
.L_0214f278:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214f294
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214f294:
    ldr r4, [r4, #0x18]
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x1
    blx func_ov012_021b3b7c
    ldr r0, .L_0214faec
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214faf0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0214f2dc
    bl func_ov003_0214d47c
.L_0214f2dc:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_0214f2fc
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_0214f2fc:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0214f318
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214f318:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x21
    mov r2, #0x2
    mov r3, #0x5
    bl func_0206ad90
    mov r2, r0
    str r0, [r9, #0x6c]
    mov r1, #0x0
    ldr r0, .L_0214faf4
    strh r1, [r2, #0x18]
    strh r0, [r2, #0x16]
    mov r0, #0x1e
    strb r0, [r2, #0x1a]
    mov r1, #0x1
    strb r1, [r2, #0x1c]
    mov r0, r4
    strb r1, [r2, #0x1b]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r9
    bl func_ov003_0214d6b0
    mov r10, r0
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x4]
    mov r1, #0x100
    str r1, [r0, #0x124]
    ldr r0, .L_0214faec
    str r10, [r9, #0x20]
    ldr r1, [r0, #0x0]
    mov r0, r10
    bl func_ov003_0214e8bc
    mov r4, r0
    ldr r1, [r9, #0x18]
    bl func_ov003_0214e908
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214faf8
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r9, #0x54]
    mov r0, r10
    ldr r1, .L_0214faec
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r4, r0
    ldr r1, [r9, #0x1c]
    bl func_ov003_0214e908
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r9, #0x1c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r9, #0x50]
    mov r0, #0x80
    str r0, [sp, #0x34]
    mov r0, #0x0
    str r0, [sp, #0x38]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x81
    str r0, [sp, #0x0]
    add r1, sp, #0x34
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r10
    mov r2, #0x810000
    mov r3, #0x1
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    str r4, [r9, #0x48]
    mov r0, #0x100
    str r0, [sp, #0x34]
    mov r0, #0xc0
    str r0, [sp, #0x38]
    bl func_0203b3e4
    mov r2, r0
    mov r0, #0xa0
    str r0, [sp, #0x0]
    add r1, sp, #0x34
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r10
    mov r2, #0x510000
    mov r3, #0x0
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_0214fafc
    ldr r2, .L_0214fb00
    mov r0, #0x0
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214fb04
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214fb08
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214fb0c
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214fb0c
    blx func_ov012_021b3fc4
    ldr r1, [r4, #0x4]
    mov r2, #0x9
    str r2, [r1, #0x124]
    mov r0, #0x40
    str r4, [r9, #0x4c]
    str r0, [sp, #0x34]
    mov r0, #0x6a
    str r0, [sp, #0x38]
    mov r8, #0x5
    add r7, sp, #0x34
    mov r5, #0x800000
    mov r11, #0x1
.L_0214f5e8:
    bl func_0203b404
    sub r1, r8, #0x5
    rsb r2, r1, #0x84
    stmia sp, {r2, r7}
    mov r1, r1, lsl #0x1
    add r3, r1, #0x1
    ldr r1, [r0, #0x88]
    mov r0, r10
    mov r2, r5
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    add r0, r9, r8, lsl #0x2
    add r8, r8, #0x1
    str r4, [r0, #0x28]
    cmp r8, #0x8
    blt .L_0214f5e8
    mov r0, r9
    bl func_ov003_0214d6b0
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x4
    str r1, [r0, #0x140]
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    ldr r0, [r8, #0x4]
    ldr r1, .L_0214fb10
    ldr r2, .L_0214fb14
    str r1, [r0, #0x124]
    ldr r0, [r8, #0x4]
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r8, #0x4]
    ldr r2, .L_0214fb18
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r5, .L_0214fb1c
    str r8, [r9, #0x24]
    mov r7, #0x0
    mov r11, #0xb8
.L_0214f6a8:
    mov r0, #0x1b
    mul r0, r7, r0
    add r0, r0, #0x2a
    str r11, [sp, #0x8]
    cmp r7, #0x3
    str r0, [sp, #0xc]
    bne .L_0214f6e0
    ldr r0, [r9, #0x4]
    bl func_ov003_0214fb7c
    bl func_ov003_0214fde8
    cmp r0, #0x0
    movne r4, #0xd
    ldreq r4, [r5, r7, lsl #0x2]
    b .L_0214f6e4
.L_0214f6e0:
    ldr r4, [r5, r7, lsl #0x2]
.L_0214f6e4:
    bl func_0203b404
    mov r1, #0x87
    str r1, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r3, r4
    mov r0, r8
    mov r2, #0x810000
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r10, [r4, #0x4]
    ldr r0, .L_0214fb20
    bl func_020326b0
    mov r3, r0
    mov r0, r10
    ldr r10, [r0, #0x0]
    ldr r1, .L_0214fb20
    ldr r10, [r10, #0x40]
    add r2, sp, #0x30
    blx r10
    mov r1, r0
    ldr r2, [sp, #0x30]
    add r0, sp, #0x10
    bl func_0202c4a4
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    add r0, r0, #0xa0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x1c]
    str r0, [sp, #0x18]
    mov r0, r4
    add r1, sp, #0x18
    add r2, sp, #0x1c
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x0
    bl func_02023c60
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x24]
    str r0, [sp, #0x20]
    mov r0, r4
    add r1, sp, #0x20
    add r2, sp, #0x24
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_0214fb24
    ldr r3, [sp, #0x14]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    blx func_ov012_021b4034
    ldr r1, .L_0214fb28
    ldr r2, .L_0214fb00
    mov r0, #0x0
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214fb2c
    mov r1, #0x1
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214fb30
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214fb34
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214fb38
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    mov r1, r9
    str r7, [r0, #0x124]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    add r0, r0, #0xa0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x2c]
    str r0, [sp, #0x28]
    mov r0, r4
    add r1, sp, #0x28
    add r2, sp, #0x2c
    bl func_ov003_0214e990
    add r0, r9, r7, lsl #0x2
    str r4, [r0, #0x28]
    ldrb r0, [r9, #0x1]
    cmp r7, r0
    bne .L_0214f8d4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
.L_0214f8d4:
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_0214f6a8
    mov r10, #0x0
    mov r5, #0x4
    mov r4, r10
    mov r11, #0x1
.L_0214f8f0:
    subs r0, r10, #0x1
    movmi r0, r5
    add r0, r9, r0, lsl #0x2
    ldr r1, [r0, #0x28]
    add r0, r9, r10, lsl #0x2
    ldr r0, [r0, #0x28]
    add r7, r10, #0x1
    cmp r7, #0x4
    movgt r7, r4
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214f934
    ldr r2, [r0, #0x0]
    mov r1, r11
    ldr r2, [r2, #0x164]
    blx r2
    b .L_0214f948
.L_0214f934:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x1
    blx r3
.L_0214f948:
    add r0, r9, r7, lsl #0x2
    ldr r1, [r0, #0x28]
    add r0, r9, r10, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214f978
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x164]
    blx r2
    b .L_0214f98c
.L_0214f978:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x2
    blx r3
.L_0214f98c:
    add r10, r10, #0x1
    cmp r10, #0x5
    blt .L_0214f8f0
    mvn r1, #0x3f
    mov r0, #0x0
    ldr r7, .L_0214fb3c
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r10, #0xc
    mov r5, #0x81
    add r11, sp, #0x8
.L_0214f9b8:
    add r0, r7, r10, lsl #0x2
    ldr r0, [r0, #-0x30]
    blx r0
    cmp r0, #0x0
    beq .L_0214fa14
    bl func_0203b404
    stmia sp, {r5, r11}
    ldr r1, [r0, #0x88]
    mov r0, r8
    mov r2, #0x810000
    mov r3, #0x4
    bl func_ov003_0214d554
    add r1, r9, r10, lsl #0x2
    ldr r1, [r1, #-0x8]
    mov r4, r0
    bl func_ov003_0214fb44
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r9, r10, lsl #0x2
    str r4, [r0, #0x28]
.L_0214fa14:
    add r10, r10, #0x1
    cmp r10, #0x10
    blt .L_0214f9b8
    mov r1, #0x1
    mov r2, r1
    sub r3, r1, #0x2
    mov r0, #0x2
    blx func_ov012_021bcf1c
    str r0, [r9, #0x68]
    ldrb r1, [r9, #0x1]
    mov r0, r9
    bl func_ov003_021502d8
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r9, #0x24]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, .L_0214fb40
    ldrb r1, [r0, #0x4a]
    cmp r1, #0x0
    beq .L_0214fab4
    ldrsb r0, [r0, #0xa]
    cmp r0, #0x0
    bne .L_0214fab4
    mov r0, #0x1
    strb r0, [r9, #0x2]
    mov r4, #0x0
.L_0214fa90:
    add r0, r9, r4, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0214faa8
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
.L_0214faa8:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_0214fa90
.L_0214fab4:
    mov r0, r6
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0214fac0: .word data_ov003_0215ddfc
.L_0214fac4: .word data_ov003_0215dd74
.L_0214fac8: .word func_ov003_0214fb9c
.L_0214facc: .word data_ov003_0215dcc4
.L_0214fad0: .word data_ov003_0215dcbc
.L_0214fad4: .word data_ov003_0215dccc
.L_0214fad8: .word data_ov003_0215dbec
.L_0214fadc: .word data_ov003_0215dcb4
.L_0214fae0: .word 0x1de
.L_0214fae4: .word func_ov003_021501d0
.L_0214fae8: .word func_ov003_02150288
.L_0214faec: .word data_ov012_021d5154
.L_0214faf0: .word 0x31305053
.L_0214faf4: .word 0x8df
.L_0214faf8: .word func_ov003_02150330
.L_0214fafc: .word data_ov003_0215dce0
.L_0214fb00: .word data_02093c8c
.L_0214fb04: .word func_ov003_02150130
.L_0214fb08: .word func_ov003_02150148
.L_0214fb0c: .word 0x510001
.L_0214fb10: .word 0x101
.L_0214fb14: .word func_ov003_02150380
.L_0214fb18: .word func_ov003_02150390
.L_0214fb1c: .word data_ov003_0215d470
.L_0214fb20: .word data_ov003_0215de14
.L_0214fb24: .word 0x494c
.L_0214fb28: .word data_ov003_0215dcd8
.L_0214fb2c: .word func_ov003_021502c0
.L_0214fb30: .word func_ov003_0214fe04
.L_0214fb34: .word func_ov003_0214fe38
.L_0214fb38: .word func_ov003_0214fea4
.L_0214fb3c: .word data_ov003_0215d460
.L_0214fb40: .word data_020afedc
    arm_func_end func_ov003_0214ee54

    .global func_ov003_0214fb44
    arm_func_start func_ov003_0214fb44
func_ov003_0214fb44: ; 0x0214fb44
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214fb68
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
.L_0214fb68:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214fb44

    .global func_ov003_0214fb7c
    arm_func_start func_ov003_0214fb7c
func_ov003_0214fb7c: ; 0x0214fb7c
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov003_0214d47c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214fb7c

    .global func_ov003_0214fb9c
    arm_func_start func_ov003_0214fb9c
func_ov003_0214fb9c: ; 0x0214fb9c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214fbc0
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0214fbc0: .word func_ov003_0214fd04
    arm_func_end func_ov003_0214fb9c

    .global func_ov003_0214fbc4
    arm_func_start func_ov003_0214fbc4
func_ov003_0214fbc4: ; 0x0214fbc4
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrb r5, [r4, #0x0]
    ldr r0, [r4, #0x4]
    cmp r5, #0x0
    mvneq r6, #0x0
    ldrnesb r6, [r4, #0x1]
    bl func_ov003_0214fb7c
    mov r2, r5
    mov r3, r6
    mov r1, #0x1
    bl func_ov003_0214d28c
    ldr r0, [r4, #0x6c]
    cmp r0, #0x0
    beq .L_0214fc1c
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r4, #0x6c]
.L_0214fc1c:
    ldr r0, .L_0214fd00
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    beq .L_0214fc48
    bl func_ov012_021bab64
    mov r0, #0x0
    str r0, [r4, #0x70]
.L_0214fc48:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_0214fc60
    blx func_ov012_021bd500
    mov r0, #0x0
    str r0, [r4, #0x68]
.L_0214fc60:
    mov r6, #0x0
    mov r5, r6
.L_0214fc68:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0214fc8c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x20]
.L_0214fc8c:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_0214fc68
    mov r6, #0x0
    mov r5, r6
.L_0214fca0:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_0214fcc4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0xc]
.L_0214fcc4:
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_0214fca0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0214fcf0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_0214fcf0:
    blx func_ov012_021b65cc
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_0214fd00: .word data_ov012_021d5154
    arm_func_end func_ov003_0214fbc4

    .global func_ov003_0214fd04
    arm_func_start func_ov003_0214fd04
func_ov003_0214fd04: ; 0x0214fd04
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_0214fdd8
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    bne .L_0214fd40
    mov r0, #0x0
    mov r1, #0x3
    mov r2, #0x1
    bl func_ov012_021ba49c
    str r0, [r4, #0x70]
.L_0214fd40:
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x70]
    mov r3, r2
    mov r1, #0x62
    bl func_ov012_021bac28
    ldr r5, .L_0214fde0
    b .L_0214fd74
.L_0214fd6c:
    ldr r0, [r5, #0x0]
    blx r0
.L_0214fd74:
    ldr r0, [r4, #0x70]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_0214fd6c
    mov r5, #0x0
    strb r5, [r4, #0x2]
.L_0214fd8c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0214fda4
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
.L_0214fda4:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0214fd8c
    ldr r0, [r4, #0x24]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r2, .L_0214fde4
    mov r3, #0x0
    mov r0, #0x78
    mov r1, #0xb
    strb r3, [r2, #0x4a]
    bl func_0207342c
.L_0214fdd8:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0214fde0: .word data_020a0e18
.L_0214fde4: .word data_020afedc
    arm_func_end func_ov003_0214fd04

    .global func_ov003_0214fde8
    arm_func_start func_ov003_0214fde8
func_ov003_0214fde8: ; 0x0214fde8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x18]
    tst r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov003_0214fde8

    .global func_ov003_0214fe04
    arm_func_start func_ov003_0214fe04
func_ov003_0214fe04: ; 0x0214fe04
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x10]
    ldr r1, [r0, #0x124]
    ldrb r2, [r2, #0x1]
    cmp r2, r1
    bne .L_0214fe2c
    mov r1, #0x1
    blx func_ov012_021b6214
    ldmia sp!, {r3, pc}
.L_0214fe2c:
    mov r1, #0x0
    blx func_ov012_021b6214
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0214fe04

    .global func_ov003_0214fe38
    arm_func_start func_ov003_0214fe38
func_ov003_0214fe38: ; 0x0214fe38
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, [r0, #0x4]
    ldr r0, [r1, #0x124]
    ldr r5, [r1, #0x10]
    cmp r0, #0x3
    bne .L_0214fe74
    ldr r0, [r5, #0x4]
    bl func_ov003_0214fb7c
    bl func_ov003_0214fde8
    cmp r0, #0x0
    bne .L_0214fe74
    mov r0, #0x78
    mov r1, #0x2
    bl func_0207342c
    ldmia sp!, {r3, r4, r5, pc}
.L_0214fe74:
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    mov r4, #0x0
.L_0214fe84:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_0214fe84
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov003_0214fe38

    .global func_ov003_0214fea4
    arm_func_start func_ov003_0214fea4
func_ov003_0214fea4: ; 0x0214fea4
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x124]
    ldr r5, [r0, #0x10]
    cmp r4, #0x3
    bne .L_0214fed4
    ldr r0, [r5, #0x4]
    bl func_ov003_0214fb7c
    bl func_ov003_0214fde8
    cmp r0, #0x0
    beq .L_021500e0
.L_0214fed4:
    ldr r0, .L_021500e8
    mov r6, #0x0
    ldrb r0, [r0, r4]
    strb r0, [r5, #0x0]
    strb r4, [r5, #0x1]
.L_0214fee8:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_0214fee8
    cmp r4, #0x4
    mov r4, #0x1
    beq .L_02150080
    ldrb r1, [r5, #0x1]
    ldr r0, .L_021500ec
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    blt .L_02150080
    blx func_02072300
    cmp r0, #0x0
    beq .L_02150080
    ldr r0, [r5, #0x70]
    cmp r0, #0x0
    bne .L_0214ff50
    mov r0, #0x0
    mov r1, #0x3
    mov r2, r4
    bl func_ov012_021ba49c
    str r0, [r5, #0x70]
.L_0214ff50:
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0x70]
    mov r3, r2
    mov r1, #0x60
    bl func_ov012_021bac28
    ldr r4, .L_021500f0
    b .L_0214ff84
.L_0214ff7c:
    ldr r0, [r4, #0x0]
    blx r0
.L_0214ff84:
    ldr r0, [r5, #0x70]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_0214ff7c
    ldr r0, [r5, #0x70]
    bl func_ov012_021bad10
    cmp r0, #0x0
    beq .L_0214ffb8
    cmp r0, #0x1
    beq .L_0214fff8
    cmp r0, #0x2
    beq .L_0214fff0
    b .L_0214fff8
.L_0214ffb8:
    ldrb r2, [r5, #0x1]
    ldr r0, .L_021500ec
    ldr r1, .L_021500f4
    ldr r0, [r0, r2, lsl #0x2]
    mul r4, r0, r1
    add r0, r4, #0xe60
    add r0, r0, #0x3000
    blx func_02073114
    ldr r0, .L_021500f8
    mov r1, #0x0
    add r0, r0, r4
    strb r1, [r0, #0xc94]
    mov r4, #0x1
    b .L_02150080
.L_0214fff0:
    mov r4, #0x0
    b .L_02150080
.L_0214fff8:
    mov r0, #0x8
    bl func_ov003_02150100
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0x70]
    mov r3, r2
    mov r1, #0x61
    bl func_ov012_021bac28
    ldr r4, .L_021500f0
    b .L_02150034
.L_0215002c:
    ldr r0, [r4, #0x0]
    blx r0
.L_02150034:
    ldr r0, [r5, #0x70]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_0215002c
    ldr r0, [r5, #0x70]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    moveq r4, #0x0
    beq .L_02150080
    ldrb r1, [r5, #0x1]
    ldr r0, .L_021500ec
    ldr r0, [r0, r1, lsl #0x2]
    blx func_ov012_021c4ec0
    ldrb r2, [r5, #0x1]
    ldr r0, .L_021500ec
    mov r1, #0x0
    ldr r0, [r0, r2, lsl #0x2]
    bl func_020703c8
    mov r4, #0x1
.L_02150080:
    mov r6, #0x0
.L_02150084:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02150084
    ldr r0, [r5, #0x24]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    cmp r4, #0x0
    beq .L_021500e0
    blx func_ov012_021b65bc
    mov r0, #0x4
    bl func_ov003_02150100
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x4]
    ldr r1, .L_021500fc
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_021500e0:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_021500e8: .word data_ov003_0215d458
.L_021500ec: .word data_ov003_0215d484
.L_021500f0: .word data_020a0e18
.L_021500f4: .word 0xca4
.L_021500f8: .word data_020b4118
.L_021500fc: .word func_ov003_0214fbc4
    arm_func_end func_ov003_0214fea4

    .global func_ov003_02150100
    arm_func_start func_ov003_02150100
func_ov003_02150100: ; 0x02150100
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_0215012c
    b .L_02150120
.L_02150114:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_02150120:
    cmp r5, r6
    blo .L_02150114
    ldmia sp!, {r4, r5, r6, pc}
.L_0215012c: .word data_020a0e18
    arm_func_end func_ov003_02150100

    .global func_ov003_02150130
    arm_func_start func_ov003_02150130
func_ov003_02150130: ; 0x02150130
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02150130

    .global func_ov003_02150148
    arm_func_start func_ov003_02150148
func_ov003_02150148: ; 0x02150148
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    strb r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, .L_021501c8
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021501c8
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021501c8
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021501c8
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_021501cc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021501c8: .word data_020a0e18
.L_021501cc: .word func_ov003_0214fbc4
    arm_func_end func_ov003_02150148

    .global func_ov003_021501d0
    arm_func_start func_ov003_021501d0
func_ov003_021501d0: ; 0x021501d0
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r0
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x810000
    mov r2, #0x3
    mov r3, #0x86
    bl func_ov003_0214d4a4
    mov ip, #0x1000
    mov r3, #0x0
    add r1, sp, #0x10
    add r2, sp, #0xc
    mov r5, r0
    str ip, [sp, #0xc]
    str r3, [sp, #0x10]
    bl func_ov003_0214e990
    mov r0, r4
    mov r1, r5
    bl func_ov003_0214e908
    ldr r1, [r4, #0x4]
    mov r0, #0x86000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b8bcc
    mov r1, #0x100000
    str r1, [sp, #0x4]
    mov r1, #0x180000
    str r1, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    add r2, sp, #0x4
    bl func_ov003_0214e990
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov003_021501d0

    .global func_ov003_02150288
    arm_func_start func_ov003_02150288
func_ov003_02150288: ; 0x02150288
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr ip, [r0, #0x4]
    add r1, sp, #0x4
    ldrsh r3, [ip, #0xa2]
    add r2, sp, #0x0
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldrsh r3, [ip, #0xa0]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02150288

    .global func_ov003_021502c0
    arm_func_start func_ov003_021502c0
func_ov003_021502c0: ; 0x021502c0
    ldr r1, [r0, #0x4]
    ldr ip, .L_021502d4
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x124]
    bx ip
.L_021502d4: .word func_ov003_021502d8
    arm_func_end func_ov003_021502c0

    .global func_ov003_021502d8
    arm_func_start func_ov003_021502d8
func_ov003_021502d8: ; 0x021502d8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    cmp r4, #0x3
    bne .L_0215030c
    ldr r0, [r5, #0x4]
    bl func_ov003_0214fb7c
    bl func_ov003_0214fde8
    cmp r0, #0x0
    ldreq r0, .L_0215032c
    movne r1, #0x30
    ldreq r1, [r0, r4, lsl #0x2]
    b .L_02150314
.L_0215030c:
    ldr r0, .L_0215032c
    ldr r1, [r0, r4, lsl #0x2]
.L_02150314:
    ldr r0, [r5, #0x68]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r2, #0x0
    blx func_ov012_021bd730
    ldmia sp!, {r3, r4, r5, pc}
.L_0215032c: .word data_ov003_0215d498
    arm_func_end func_ov003_021502d8

    .global func_ov003_02150330
    arm_func_start func_ov003_02150330
func_ov003_02150330: ; 0x02150330
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0x74]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0x74]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0x74]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02150330

    .global func_ov003_02150380
    arm_func_start func_ov003_02150380
func_ov003_02150380: ; 0x02150380
    ldr ip, .L_0215038c
    ldr r0, [r0, #0x4]
    bx ip
.L_0215038c: .word func_ov012_021b65d8
    arm_func_end func_ov003_02150380

    .global func_ov003_02150390
    arm_func_start func_ov003_02150390
func_ov003_02150390: ; 0x02150390
    ldr ip, .L_0215039c
    ldr r0, [r0, #0x4]
    bx ip
.L_0215039c: .word func_ov012_021b65e0
    arm_func_end func_ov003_02150390

    .global func_ov003_021503a0
    arm_func_start func_ov003_021503a0
func_ov003_021503a0: ; 0x021503a0
    ldr ip, .L_021503ac
    mov r1, #0x0
    bx ip
.L_021503ac: .word func_ov003_021503e0
    arm_func_end func_ov003_021503a0

    .global func_ov003_021503b0
    arm_func_start func_ov003_021503b0
func_ov003_021503b0: ; 0x021503b0
    ldr ip, .L_021503bc
    mov r1, #0x1
    bx ip
.L_021503bc: .word func_ov003_021503e0
    arm_func_end func_ov003_021503b0

    .global func_ov003_021503c0
    arm_func_start func_ov003_021503c0
func_ov003_021503c0: ; 0x021503c0
    ldr ip, .L_021503cc
    mov r1, #0x2
    bx ip
.L_021503cc: .word func_ov003_021503e0
    arm_func_end func_ov003_021503c0

    .global func_ov003_021503d0
    arm_func_start func_ov003_021503d0
func_ov003_021503d0: ; 0x021503d0
    ldr ip, .L_021503dc
    mov r1, #0x3
    bx ip
.L_021503dc: .word func_ov003_021503e0
    arm_func_end func_ov003_021503d0

    .global func_ov003_021503e0
    arm_func_start func_ov003_021503e0
func_ov003_021503e0: ; 0x021503e0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xd8
    mov r10, r1
    mov r4, r0
    ldr r1, .L_02151388
    ldr r2, .L_0215138c
    mov r0, #0x60
    mov r3, #0xcb
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x60
    mov r9, r0
    bl func_020517fc
    blx func_ov012_021b65bc
    bl func_02020d90
    mov r1, #0x85000
    str r1, [sp, #0xcc]
    mov r7, r0
    ldr r0, [r7, #0x4]
    add r1, sp, #0xcc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, .L_02151390
    bl func_02028384
    ldr r0, [r7, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r4
    mov r0, r7
    bl func_ov003_0214fb44
    str r7, [r9, #0x4]
    strb r10, [r9, #0x2]
    mov r0, #0x21
    strb r0, [r9, #0x0]
    mov r0, #0x3b
    bl func_020736b4
    mov r0, #0x3b
    mov r1, #0x0
    bl func_020736e4
    mov r0, #0x0
    bl func_02028920
    str r0, [r9, #0x8]
    mov r0, #0x1
    bl func_02043264
    bl func_0203d4e4
    mov r0, #0x0
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0xb8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xb8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0xbc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xbc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0xc0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0xc4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r8, #0x0
    mov r6, #0x1
    mov r5, #0x4
    mov r4, r8
    mov r11, r8
.L_021506d4:
    mov r0, r8
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r6
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r8
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r5
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r8
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r4
    ldr r0, [r0, #0x4]
    mov r2, r4
    bl func_0203cfbc
    mov r0, r8
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r11
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r8
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, r8, lsl #0xc
    str r0, [sp, #0xc8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r8, r8, #0x1
    cmp r8, #0x4
    blt .L_021506d4
    ldr r6, .L_02151394
    ldr r5, .L_02151398
    mov r4, #0x0
.L_02150780:
    add r0, r4, #0x1
    bl func_0203b414
    mov r2, r0
    ldr r0, [r6, r4, lsl #0x2]
    ldr r1, [r5, r4, lsl #0x2]
    ldr r2, [r2, #0x88]
    bl func_ov003_0214d3a8
    add r1, r9, r4, lsl #0x2
    add r4, r4, #0x1
    str r0, [r1, #0x18]
    cmp r4, #0x2
    blt .L_02150780
    mov r6, #0x0
    ldr r5, .L_0215139c
    mov r4, r6
.L_021507bc:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r9, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0xc]
    cmp r6, #0x3
    blt .L_021507bc
    mov r0, r9
    bl func_ov003_0214d6b0
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x100
    str r1, [r0, #0x124]
    str r6, [r9, #0x20]
    mov r0, #0xc0
    str r1, [sp, #0xb0]
    str r0, [sp, #0xb4]
    bl func_0203b3e4
    mov r2, r0
    mov r0, #0xa0
    str r0, [sp, #0x0]
    add r1, sp, #0xb0
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r6
    mov r2, #0x510000
    mov r3, #0x14
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0xab]
    ldr r0, [r5, #0x4]
    mov r1, #0x10
    blx func_ov012_021b77a8
    ldr r0, [r5, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_021513a0
    ldr r2, .L_021513a4
    ldr r3, .L_021513a8
    mov r0, #0x70
    bl func_0201a21c
    movs r4, r0
    beq .L_021508d8
    ldr r2, .L_021513ac
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_021513b0
    ldr r1, .L_021513b4
    add r0, r4, #0x68
    str r2, [r4, #0x0]
    bl func_ov003_0214e8a8
    ldr r0, .L_021513b8
    str r0, [r4, #0x0]
.L_021508d8:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_021508f4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021508f4:
    ldr r1, [r4, #0x18]
    mov r0, r5
    bl func_02020e98
    ldr r0, [r5, #0x4]
    ldr r2, .L_021513bc
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_021513c0
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    ldr r1, .L_021513c4
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r1, .L_021513c4
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    ldr r1, .L_021513c8
    blx func_ov012_021b3fc4
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    str r1, [r0, #0x124]
    ldr r0, [r5, #0x4]
    blx func_ov012_021b65d8
    str r5, [r9, #0x34]
    mov r0, r6
    ldr r1, .L_021513cc
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r4, r0
    ldr r1, [r9, #0x18]
    bl func_ov003_0214e908
    ldr r0, [r4, #0x4]
    ldr r1, .L_021513d0
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r9, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r9, #0x30]
    mov r0, r9
    bl func_ov003_0214d6b0
    mov r5, r0
    ldr r3, .L_021513d4
    ldr r2, [r5, #0x4]
    ldr r1, .L_021513cc
    str r3, [r2, #0x124]
    str r5, [r9, #0x24]
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r4, r0
    ldr r1, [r9, #0x1c]
    bl func_ov003_0214e908
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    ldr r0, [r4, #0x4]
    ldr r2, .L_021513d8
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    ldr r2, .L_021513dc
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_021513e0
    add r0, sp, #0x80
    mov r1, r4
    bl func_ov003_0214e940
    mov r0, #0x0
    str r0, [sp, #0x9c]
    sub r0, r0, #0x100000
    str r0, [sp, #0x98]
    mov r0, r4
    add r1, sp, #0x98
    add r2, sp, #0x9c
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x80]
    ldr r3, [sp, #0x84]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0xa4]
    str r0, [sp, #0xa0]
    mov r0, r4
    add r1, sp, #0xa0
    add r2, sp, #0xa4
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x80]
    ldr r3, [sp, #0x84]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x80]
    ldr r2, .L_021513e4
    ldr r3, [sp, #0x84]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    mov r6, #0x0
    sub r3, r6, #0x100000
    add r1, sp, #0xa8
    add r2, sp, #0xac
    mov r0, r4
    str r6, [sp, #0xac]
    str r3, [sp, #0xa8]
    bl func_ov003_0214e990
    str r4, [r9, #0x38]
    mov r1, #0x3b
    mov r0, #0x60
    str r1, [sp, #0x88]
    str r0, [sp, #0x8c]
    bl func_0203b404
    mov r1, #0x80
    str r1, [sp, #0x0]
    add r1, sp, #0x88
    str r1, [sp, #0x4]
    mov r2, r0
    ldr r1, [r2, #0x88]
    ldrb r4, [r9, #0x2]
    ldr r3, .L_021513e8
    mov r0, r5
    ldr r3, [r3, r4, lsl #0x2]
    mov r2, #0x830000
    bl func_ov003_0214d554
    ldr r1, [r9, #0x38]
    mov r4, r0
    bl func_ov003_0214fb44
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_021513ec
    add r0, sp, #0x90
    mov r1, r4
    bl func_ov003_0214e940
    ldr r0, [r4, #0x4]
    mov r1, r6
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x90]
    ldr r3, [sp, #0x94]
    mov r2, r6
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x90]
    ldr r3, [sp, #0x94]
    mov r2, #0x1e
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x90]
    ldr r3, [sp, #0x94]
    mov r2, #0x3c
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0xc000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x90]
    ldr r3, [sp, #0x94]
    mov r2, #0x5a
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x10000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x90]
    ldr r3, [sp, #0x94]
    mov r2, #0x78
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x90]
    ldr r2, .L_021513e4
    ldr r3, [sp, #0x94]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    blx func_ov012_021b3f78
    ldr r1, [r4, #0x4]
    mov r2, #0x3
    str r2, [r1, #0x124]
    mov r0, r9
    str r4, [r9, #0x3c]
    bl func_ov003_0214d6b0
    mov r4, r0
    mov r1, #0x4
    ldr r0, [r4, #0x4]
    add r2, r1, #0xfe
    str r1, [r0, #0x140]
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    str r2, [r0, #0x124]
    ldr r0, [r4, #0x4]
    ldr r2, .L_021513f0
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_021513f4
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    add r0, sp, #0x10
    str r4, [r9, #0x28]
    bl func_0202c498
    mov r0, #0xac
    str r0, [sp, #0x18]
    mov r0, #0x60
    str r0, [sp, #0x1c]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r4
    mov r2, #0x820000
    mov r3, r6
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_021513e0
    add r0, sp, #0x20
    mov r1, r5
    bl func_ov003_0214e940
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x20]
    add r0, r0, #0xc0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x1c]
    str r1, [sp, #0x10]
    ldr r1, [sp, #0x24]
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x14]
    str r0, [sp, #0x2c]
    add r1, sp, #0x28
    mov r0, r5
    add r2, sp, #0x2c
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, r6
    bl func_02023c60
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x34]
    str r0, [sp, #0x30]
    mov r0, r5
    add r1, sp, #0x30
    add r2, sp, #0x34
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_021513e4
    ldr r3, [sp, #0x14]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    add r0, r0, #0xc0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x3c]
    str r0, [sp, #0x38]
    mov r0, r5
    add r1, sp, #0x38
    add r2, sp, #0x3c
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    mov r1, #0x4
    str r1, [r0, #0x124]
    str r5, [r9, #0x40]
    mov r1, #0xac
    mov r0, #0x60
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldrb r3, [r9, #0x2]
    ldr r2, .L_021513f8
    mov r0, r4
    ldr r3, [r2, r3, lsl #0x2]
    mov r2, #0x820000
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_021513e0
    add r0, sp, #0x40
    mov r1, r5
    bl func_ov003_0214e940
    ldr r0, [sp, #0x44]
    ldr r1, [sp, #0x40]
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x18]
    str r1, [sp, #0x10]
    ldr r1, [sp, #0x1c]
    add r0, r0, #0xc0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x4c]
    str r0, [sp, #0x48]
    mov r0, r5
    add r1, sp, #0x48
    add r2, sp, #0x4c
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, r6
    bl func_02023c60
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x54]
    str r0, [sp, #0x50]
    mov r0, r5
    add r1, sp, #0x50
    add r2, sp, #0x54
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_021513e4
    ldr r3, [sp, #0x14]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    add r0, r0, #0xc0
    mov r2, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r2, [sp, #0x5c]
    str r0, [sp, #0x58]
    add r1, sp, #0x58
    add r2, sp, #0x5c
    mov r0, r5
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    mov r1, #0x5
    str r1, [r0, #0x124]
    str r5, [r9, #0x44]
    mov r0, #0x60
    mov r1, #0xac
    str r0, [sp, #0x1c]
    str r1, [sp, #0x18]
    ldrb r1, [r9, #0x2]
    ldr r0, .L_021513fc
    ldr r0, [r0, r1, lsl #0x2]
    blx r0
    cmp r0, #0xa
    movhs r5, #0x2
    movlo r5, #0x1
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r3, r5
    mov r2, #0x820000
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_021513e0
    add r0, sp, #0x60
    mov r1, r5
    bl func_ov003_0214e940
    ldr r0, [sp, #0x64]
    ldr r1, [sp, #0x60]
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x18]
    str r1, [sp, #0x10]
    ldr r1, [sp, #0x1c]
    add r0, r0, #0xc0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x6c]
    str r0, [sp, #0x68]
    mov r0, r5
    add r1, sp, #0x68
    add r2, sp, #0x6c
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x0
    bl func_02023c60
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x74]
    str r0, [sp, #0x70]
    mov r0, r5
    add r1, sp, #0x70
    add r2, sp, #0x74
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_021513e4
    ldr r3, [sp, #0x14]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    ldr r2, .L_02151400
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    add r0, r0, #0xc0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x7c]
    str r0, [sp, #0x78]
    add r1, sp, #0x78
    add r2, sp, #0x7c
    mov r0, r5
    bl func_ov003_0214e990
    mov r2, #0x6
    ldr r1, [r5, #0x4]
    sub r0, r2, #0x12
    str r2, [r1, #0x124]
    str r5, [r9, #0x48]
    str r0, [sp, #0x18]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    ldrb r1, [r9, #0x2]
    ldr r0, .L_021513fc
    ldr r0, [r0, r1, lsl #0x2]
    blx r0
    mov r6, r0
    mov r1, #0xa
    bl func_0200d12c
    cmp r6, #0xa
    ldrhs r0, [sp, #0x18]
    mov r5, r1
    addhs r0, r0, #0x6
    strhs r0, [sp, #0x18]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    add r3, r5, #0x7
    mov r2, #0x820000
    bl func_ov003_0214d554
    ldr r1, [r9, #0x48]
    mov r5, r0
    bl func_ov003_0214fb44
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r2, [r5, #0x4]
    mov r3, #0x7
    str r3, [r2, #0x124]
    mov r0, r6
    mov r1, #0xa
    str r5, [r9, #0x4c]
    bl func_0200d12c
    movs r5, r0
    beq .L_02151274
    mvn r0, #0x13
    str r0, [sp, #0x18]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    add r3, r5, #0x7
    mov r2, #0x820000
    bl func_ov003_0214d554
    ldr r1, [r9, #0x48]
    mov r4, r0
    bl func_ov003_0214fb44
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x8
    str r1, [r0, #0x124]
    str r4, [r9, #0x50]
.L_02151274:
    ldrb r1, [r9, #0x2]
    ldr r0, .L_021513fc
    ldr r0, [r0, r1, lsl #0x2]
    blx r0
    cmp r0, #0x14
    blo .L_02151318
    mov r0, r9
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r2, .L_02151404
    mov r1, #0xa0
    str r2, [r0, #0x124]
    str r4, [r9, #0x2c]
    mov r0, #0x88
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    bl func_0203b404
    mov r1, #0x80
    mov r2, r0
    str r1, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r4
    mov r2, #0x820000
    mov r3, #0x18
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r2, #0x9
    str r2, [r0, #0x124]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    str r4, [r9, #0x54]
.L_02151318:
    mov r1, #0x1
    mov r2, r1
    sub r3, r1, #0x2
    mov r0, #0x4
    blx func_ov012_021bcf1c
    str r0, [r9, #0x58]
    ldrb r1, [r9, #0x2]
    ldr r0, .L_021513fc
    ldr r0, [r0, r1, lsl #0x2]
    blx r0
    mov r4, r0
    cmp r4, #0xa
    blo .L_02151410
    mov r1, #0xa
    bl func_0200d12c
    mov r2, r0
    ldr r1, .L_02151408
    add r0, sp, #0xd0
    ldr r1, [r1, r2, lsl #0x2]
    bl func_02074000
    mov r0, r4
    mov r1, #0xa
    bl func_0200d12c
    ldr r2, .L_02151408
    add r0, sp, #0xd0
    ldr r1, [r2, r1, lsl #0x2]
    bl func_020741bc
    b .L_02151420
.L_02151388: .word data_ov003_0215dfc0
.L_0215138c: .word data_ov003_0215df38
.L_02151390: .word func_ov003_0215147c
.L_02151394: .word data_ov003_0215de58
.L_02151398: .word data_ov003_0215de60
.L_0215139c: .word data_ov003_0215de68
.L_021513a0: .word data_ov003_0215dc0c
.L_021513a4: .word data_ov003_0215de48
.L_021513a8: .word 0x1b2
.L_021513ac: .word data_02093c8c
.L_021513b0: .word data_ov003_0215db68
.L_021513b4: .word data_ov003_0215de50
.L_021513b8: .word data_ov012_021d1c58
.L_021513bc: .word func_ov003_0215160c
.L_021513c0: .word func_ov003_02151624
.L_021513c4: .word 0x510014
.L_021513c8: .word 0x510015
.L_021513cc: .word data_ov012_021d5154
.L_021513d0: .word func_ov003_0215173c
.L_021513d4: .word 0x101
.L_021513d8: .word func_ov003_021516bc
.L_021513dc: .word func_ov003_02151694
.L_021513e0: .word data_ov003_0215dfd8
.L_021513e4: .word 0x494c
.L_021513e8: .word data_ov003_0215d4c4
.L_021513ec: .word data_ov003_0215dfe4
.L_021513f0: .word func_ov003_021515d0
.L_021513f4: .word func_ov003_021515e0
.L_021513f8: .word data_ov003_0215d4d4
.L_021513fc: .word data_ov003_0215de74
.L_02151400: .word func_ov003_0215170c
.L_02151404: .word 0x103
.L_02151408: .word data_ov003_0215de84
.L_0215140c: .word data_ov003_0215d4b4
.L_02151410:
    ldr r1, .L_02151408
    add r0, sp, #0xd0
    ldr r1, [r1, r4, lsl #0x2]
    bl func_02074000
.L_02151420:
    ldrb r2, [r9, #0x2]
    ldr r1, .L_0215140c
    ldr r0, [r9, #0x58]
    ldr r1, [r1, r2, lsl #0x2]
    add r2, sp, #0xd0
    blx func_ov012_021bd730
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r9, #0x24]
    cmp r0, #0x0
    beq .L_02151464
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_02151464:
    mov r0, r10
    bl func_ov003_0214d774
    blx func_ov012_021c4ec8
    mov r0, r7
    add sp, sp, #0xd8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov003_021503e0

    .global func_ov003_0215147c
    arm_func_start func_ov003_0215147c
func_ov003_0215147c: ; 0x0215147c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_021514a0
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021514a0: .word func_ov003_021515cc
    arm_func_end func_ov003_0215147c

    .global func_ov003_021514a4
    arm_func_start func_ov003_021514a4
func_ov003_021514a4: ; 0x021514a4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x4]
    ldr r6, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_021514d8
    bl func_ov003_0214d47c
.L_021514d8:
    ldrb r3, [r6, #0x2]
    ldr r1, .L_021515c8
    ldrb r2, [r6, #0x0]
    ldrb r1, [r1, r3]
    mvn r3, #0x0
    bl func_ov003_0214d28c
    ldr r0, [r6, #0x58]
    cmp r0, #0x0
    beq .L_02151508
    blx func_ov012_021bd500
    mov r0, #0x0
    str r0, [r6, #0x58]
.L_02151508:
    mov r5, #0x0
    mov r4, r5
    mov r7, r5
.L_02151514:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_02151554
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r6, r5, lsl #0x2
    str r7, [r0, #0x20]
.L_02151554:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_02151514
    mov r5, #0x0
    mov r4, r5
.L_02151568:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_0215158c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r6, r5, lsl #0x2
    str r4, [r0, #0xc]
.L_0215158c:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_02151568
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_021515b8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r6, #0x4]
.L_021515b8:
    blx func_ov012_021b65cc
    mov r0, r6
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021515c8: .word data_ov003_0215d4b0
    arm_func_end func_ov003_021514a4

    .global func_ov003_021515cc
    arm_func_start func_ov003_021515cc
func_ov003_021515cc: ; 0x021515cc
    bx lr
    arm_func_end func_ov003_021515cc

    .global func_ov003_021515d0
    arm_func_start func_ov003_021515d0
func_ov003_021515d0: ; 0x021515d0
    ldr ip, .L_021515dc
    ldr r0, [r0, #0x4]
    bx ip
.L_021515dc: .word func_ov012_021b65d8
    arm_func_end func_ov003_021515d0

    .global func_ov003_021515e0
    arm_func_start func_ov003_021515e0
func_ov003_021515e0: ; 0x021515e0
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_021515e0

    .global func_ov003_0215160c
    arm_func_start func_ov003_0215160c
func_ov003_0215160c: ; 0x0215160c
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215160c

    .global func_ov003_02151624
    arm_func_start func_ov003_02151624
func_ov003_02151624: ; 0x02151624
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65bc
    mov r1, #0x21
    ldr r0, .L_0215168c
    strb r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215168c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215168c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215168c
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02151690
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215168c: .word data_020a0e18
.L_02151690: .word func_ov003_021514a4
    arm_func_end func_ov003_02151624

    .global func_ov003_02151694
    arm_func_start func_ov003_02151694
func_ov003_02151694: ; 0x02151694
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02151694

    .global func_ov003_021516bc
    arm_func_start func_ov003_021516bc
func_ov003_021516bc: ; 0x021516bc
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_021516e8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_021516e8:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_021516bc

    .global func_ov003_0215170c
    arm_func_start func_ov003_0215170c
func_ov003_0215170c: ; 0x0215170c
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x2c]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215170c

    .global func_ov003_0215173c
    arm_func_start func_ov003_0215173c
func_ov003_0215173c: ; 0x0215173c
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0x5c]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0x5c]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0x5c]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215173c

    .global func_ov003_0215178c
    arm_func_start func_ov003_0215178c
func_ov003_0215178c: ; 0x0215178c
    ldr ip, .L_02151798
    mov r1, #0x0
    bx ip
.L_02151798: .word func_ov003_021517cc
    arm_func_end func_ov003_0215178c

    .global func_ov003_0215179c
    arm_func_start func_ov003_0215179c
func_ov003_0215179c: ; 0x0215179c
    ldr ip, .L_021517a8
    mov r1, #0x1
    bx ip
.L_021517a8: .word func_ov003_021517cc
    arm_func_end func_ov003_0215179c

    .global func_ov003_021517ac
    arm_func_start func_ov003_021517ac
func_ov003_021517ac: ; 0x021517ac
    ldr ip, .L_021517b8
    mov r1, #0x2
    bx ip
.L_021517b8: .word func_ov003_021517cc
    arm_func_end func_ov003_021517ac

    .global func_ov003_021517bc
    arm_func_start func_ov003_021517bc
func_ov003_021517bc: ; 0x021517bc
    ldr ip, .L_021517c8
    mov r1, #0x3
    bx ip
.L_021517c8: .word func_ov003_021517cc
    arm_func_end func_ov003_021517bc

    .global func_ov003_021517cc
    arm_func_start func_ov003_021517cc
func_ov003_021517cc: ; 0x021517cc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x78
    mov r4, r1
    mov r5, r0
    ldr r1, .L_0215228c
    ldr r2, .L_02152290
    mov r0, #0x50
    mov r3, #0xb8
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x50
    mov r10, r0
    bl func_020517fc
    mov r0, #0x8
    bl func_0207367c
    mov r0, #0x39
    bl func_020736b4
    mov r0, #0x39
    mov r1, #0x0
    bl func_020736e4
    bl func_02020d90
    mov r8, r0
    mov r0, #0x85000
    str r0, [sp, #0x74]
    ldr r0, [r8, #0x4]
    add r1, sp, #0x74
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r1, .L_02152294
    bl func_02028384
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r8
    mov r1, r5
    bl func_ov003_0214fb44
    str r8, [r10, #0x4]
    ldr r0, [r5, #0x4]
    mov r1, #0x21
    ldr r2, [r0, #0x10]
    mov r0, #0x0
    strb r4, [r2, #0x1e]
    strb r4, [r10, #0x2]
    strb r1, [r10, #0x0]
    bl func_02028920
    str r0, [r10, #0x8]
    mov r0, #0x1
    bl func_02043264
    bl func_0203d4e4
    mov r0, #0x0
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x60]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x60
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x64]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x64
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x68]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x68
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x6c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x6c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r9, #0x0
    mov r7, #0x1
    mov r6, #0x4
    mov r5, r9
    mov r4, r9
    add r11, sp, #0x70
.L_02151ad4:
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r6
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r5
    ldr r0, [r0, #0x4]
    mov r2, r5
    bl func_0203cfbc
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r9
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, r9, lsl #0xc
    str r0, [sp, #0x70]
    ldr r0, [r1, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_02151ad4
    ldr r5, .L_02152298
    ldr r4, .L_0215229c
    mov r6, #0x0
.L_02151b80:
    add r0, r6, #0x1
    bl func_0203b414
    mov r2, r0
    ldr r0, [r5, r6, lsl #0x2]
    ldr r1, [r4, r6, lsl #0x2]
    ldr r2, [r2, #0x88]
    bl func_ov003_0214d3a8
    add r1, r10, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x18]
    cmp r6, #0x2
    blt .L_02151b80
    mov r6, #0x0
    ldr r5, .L_021522a0
    mov r4, r6
.L_02151bbc:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r10, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0xc]
    cmp r6, #0x3
    blt .L_02151bbc
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x100
    str r1, [r0, #0x124]
    str r6, [r10, #0x20]
    mov r0, #0xc0
    str r1, [sp, #0x58]
    str r0, [sp, #0x5c]
    bl func_0203b3e4
    mov r2, r0
    mov r0, #0xa0
    str r0, [sp, #0x0]
    add r1, sp, #0x58
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r6
    mov r2, #0x510000
    mov r3, #0x14
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0xab]
    ldr r0, [r5, #0x4]
    mov r1, #0x10
    blx func_ov012_021b77a8
    ldr r0, [r5, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_021522a4
    ldr r2, .L_021522a8
    ldr r3, .L_021522ac
    mov r0, #0x70
    bl func_0201a21c
    movs r4, r0
    beq .L_02151cd8
    ldr r2, .L_021522b0
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_021522b4
    ldr r1, .L_021522b8
    add r0, r4, #0x68
    str r2, [r4, #0x0]
    bl func_ov003_0214e8a8
    ldr r0, .L_021522bc
    str r0, [r4, #0x0]
.L_02151cd8:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02151cf4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02151cf4:
    ldr r1, [r4, #0x18]
    mov r0, r5
    bl func_02020e98
    ldr r0, [r5, #0x4]
    ldr r2, .L_021522c0
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_021522c4
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    ldr r1, .L_021522c8
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r1, .L_021522c8
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    ldr r1, .L_021522cc
    blx func_ov012_021b3fc4
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    str r1, [r0, #0x124]
    ldr r0, [r5, #0x4]
    blx func_ov012_021b65d8
    str r5, [r10, #0x34]
    mov r0, r6
    ldr r1, .L_021522d0
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r4, r0
    ldr r1, [r10, #0x18]
    bl func_ov003_0214e908
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    ldr r1, .L_021522d4
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r10, #0x30]
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r5, r0
    ldr r2, .L_021522d8
    ldr r0, [r5, #0x4]
    mov r1, r10
    str r2, [r0, #0x124]
    ldr r0, [r5, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r2, .L_021522dc
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_021522e0
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, .L_021522d0
    str r5, [r10, #0x24]
    ldr r1, [r0, #0x0]
    mov r0, r5
    bl func_ov003_0214e8bc
    ldr r1, [r10, #0x1c]
    mov r4, r0
    bl func_ov003_0214e908
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_021522e4
    add r0, sp, #0x28
    mov r1, r4
    bl func_ov003_0214e940
    mov r0, #0x0
    str r0, [sp, #0x44]
    sub r0, r0, #0x100000
    str r0, [sp, #0x40]
    mov r0, r4
    add r1, sp, #0x40
    add r2, sp, #0x44
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x4c]
    str r0, [sp, #0x48]
    mov r0, r4
    add r1, sp, #0x48
    add r2, sp, #0x4c
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r2, .L_021522e8
    ldr r3, [sp, #0x2c]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_021522ec
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_021522f0
    mov r1, #0x10
    blx func_ov012_021b6760
    mov r0, #0x0
    str r0, [sp, #0x54]
    sub r0, r0, #0x100000
    str r0, [sp, #0x50]
    mov r0, r4
    add r1, sp, #0x50
    add r2, sp, #0x54
    bl func_ov003_0214e990
    str r4, [r10, #0x38]
    mov r0, #0x3b
    str r0, [sp, #0x30]
    mov r0, #0x60
    str r0, [sp, #0x34]
    bl func_0203b404
    mov r1, #0x80
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0x30
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    mov r0, r5
    mov r2, #0x830000
    mov r3, #0x4
    bl func_ov003_0214d554
    ldr r1, [r10, #0x38]
    mov r4, r0
    bl func_ov003_0214fb44
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_021522f4
    add r0, sp, #0x38
    mov r1, r4
    bl func_ov003_0214e940
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x1e
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x3c
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0xc000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x5a
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x10000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x78
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r2, .L_021522e8
    ldr r3, [sp, #0x3c]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    blx func_ov012_021b3f78
    ldr r1, [r4, #0x4]
    mov r2, #0x3
    str r2, [r1, #0x124]
    mov r0, r10
    str r4, [r10, #0x3c]
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r2, .L_021522f8
    ldr r1, [r4, #0x4]
    add r0, sp, #0x10
    str r2, [r1, #0x124]
    str r4, [r10, #0x28]
    bl func_0202c498
    mov r0, #0xa4
    str r0, [sp, #0x18]
    mov r0, #0x60
    str r0, [sp, #0x1c]
    bl func_0203b404
    mov r1, #0x80
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    mov r0, r4
    mov r2, #0x820000
    mov r3, #0x11
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_021522fc
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r1, .L_021522fc
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    ldr r1, .L_02152300
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02152304
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x24]
    str r0, [sp, #0x20]
    mov r0, r4
    add r1, sp, #0x20
    add r2, sp, #0x24
    bl func_ov003_0214e990
    ldr r1, [r4, #0x4]
    mov r2, #0x4
    str r2, [r1, #0x124]
    mov r0, r10
    str r4, [r10, #0x40]
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r2, .L_02152308
    ldr r1, [r4, #0x4]
    mov r0, #0xb0
    str r2, [r1, #0x124]
    str r4, [r10, #0x2c]
    str r0, [sp, #0x8]
    mov r0, #0x88
    str r0, [sp, #0xc]
    bl func_0203b404
    mov r1, #0x80
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    mov r0, r4
    mov r2, #0x820000
    mov r3, #0x19
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r2, #0x5
    str r2, [r0, #0x124]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    mov r1, #0x1
    mov r0, #0x5
    mov r2, r1
    sub r3, r1, #0x2
    str r4, [r10, #0x44]
    blx func_ov012_021bcf1c
    mov r1, #0x36
    mov r2, #0x0
    str r0, [r10, #0x48]
    blx func_ov012_021bd730
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r10, #0x24]
    cmp r0, #0x0
    beq .L_02152280
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_02152280:
    mov r0, r8
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215228c: .word data_ov003_0215e12c
.L_02152290: .word data_ov003_0215e0a4
.L_02152294: .word func_ov003_0215230c
.L_02152298: .word data_ov003_0215e004
.L_0215229c: .word data_ov003_0215dffc
.L_021522a0: .word data_ov003_0215e00c
.L_021522a4: .word data_ov003_0215dc0c
.L_021522a8: .word data_ov003_0215dfec
.L_021522ac: .word 0x1b2
.L_021522b0: .word data_02093c8c
.L_021522b4: .word data_ov003_0215db68
.L_021522b8: .word data_ov003_0215dff4
.L_021522bc: .word data_ov012_021d1c58
.L_021522c0: .word func_ov003_02152598
.L_021522c4: .word func_ov003_021525b0
.L_021522c8: .word 0x510014
.L_021522cc: .word 0x510015
.L_021522d0: .word data_ov012_021d5154
.L_021522d4: .word func_ov003_021524a0
.L_021522d8: .word 0x101
.L_021522dc: .word func_ov003_02152468
.L_021522e0: .word func_ov003_02152478
.L_021522e4: .word data_ov003_0215e144
.L_021522e8: .word 0x494c
.L_021522ec: .word func_ov003_021524f0
.L_021522f0: .word func_ov003_02152518
.L_021522f4: .word data_ov003_0215e150
.L_021522f8: .word 0x102
.L_021522fc: .word 0x820011
.L_02152300: .word 0x820012
.L_02152304: .word func_ov003_02152568
.L_02152308: .word 0x103
    arm_func_end func_ov003_021517cc

    .global func_ov003_0215230c
    arm_func_start func_ov003_0215230c
func_ov003_0215230c: ; 0x0215230c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02152330
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02152330: .word func_ov003_02152464
    arm_func_end func_ov003_0215230c

    .global func_ov003_02152334
    arm_func_start func_ov003_02152334
func_ov003_02152334: ; 0x02152334
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x4]
    ldr r6, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x8
    bl func_0207372c
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02152370
    bl func_ov003_0214d47c
.L_02152370:
    ldrb r3, [r6, #0x2]
    ldr r1, .L_02152460
    ldrb r2, [r6, #0x0]
    ldrb r1, [r1, r3]
    mvn r3, #0x0
    bl func_ov003_0214d28c
    ldr r0, [r6, #0x48]
    cmp r0, #0x0
    beq .L_021523a0
    blx func_ov012_021bd500
    mov r0, #0x0
    str r0, [r6, #0x48]
.L_021523a0:
    mov r5, #0x0
    mov r4, r5
    mov r7, r5
.L_021523ac:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_021523ec
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r6, r5, lsl #0x2
    str r7, [r0, #0x20]
.L_021523ec:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_021523ac
    mov r5, #0x0
    mov r4, r5
.L_02152400:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_02152424
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r6, r5, lsl #0x2
    str r4, [r0, #0xc]
.L_02152424:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_02152400
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_02152450
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r6, #0x4]
.L_02152450:
    blx func_ov012_021b65cc
    mov r0, r6
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02152460: .word data_ov003_0215d4e4
    arm_func_end func_ov003_02152334

    .global func_ov003_02152464
    arm_func_start func_ov003_02152464
func_ov003_02152464: ; 0x02152464
    bx lr
    arm_func_end func_ov003_02152464

    .global func_ov003_02152468
    arm_func_start func_ov003_02152468
func_ov003_02152468: ; 0x02152468
    ldr ip, .L_02152474
    ldr r0, [r0, #0x4]
    bx ip
.L_02152474: .word func_ov012_021b65d8
    arm_func_end func_ov003_02152468

    .global func_ov003_02152478
    arm_func_start func_ov003_02152478
func_ov003_02152478: ; 0x02152478
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_02152478

    .global func_ov003_021524a0
    arm_func_start func_ov003_021524a0
func_ov003_021524a0: ; 0x021524a0
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0x4c]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0x4c]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0x4c]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_021524a0

    .global func_ov003_021524f0
    arm_func_start func_ov003_021524f0
func_ov003_021524f0: ; 0x021524f0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_021524f0

    .global func_ov003_02152518
    arm_func_start func_ov003_02152518
func_ov003_02152518: ; 0x02152518
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_02152544
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_02152544:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_02152518

    .global func_ov003_02152568
    arm_func_start func_ov003_02152568
func_ov003_02152568: ; 0x02152568
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x2c]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02152568

    .global func_ov003_02152598
    arm_func_start func_ov003_02152598
func_ov003_02152598: ; 0x02152598
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02152598

    .global func_ov003_021525b0
    arm_func_start func_ov003_021525b0
func_ov003_021525b0: ; 0x021525b0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0xd
    ldr r4, [r0, #0x10]
    ldr r0, .L_02152614
    strb r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02152614
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02152614
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02152614
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02152618
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02152614: .word data_020a0e18
.L_02152618: .word func_ov003_02152334
    arm_func_end func_ov003_021525b0

    .global func_ov003_0215261c
    arm_func_start func_ov003_0215261c
func_ov003_0215261c: ; 0x0215261c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r0, .L_02152700
    ldr r1, .L_02152704
    ldr r2, .L_02152708
    mov r3, #0x8b
    bl func_ov003_02152710
    ldr r1, .L_02152700
    mov r5, r0
    bl func_ov003_0215271c
    bl func_02020d90
    mov r4, r0
    add r0, sp, #0x0
    mov r1, #0x85
    bl func_ov003_02152754
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov003_02152730
    ldr r1, .L_0215270c
    mov r0, r4
    bl func_ov003_02152760
    mov r0, r4
    mov r1, r5
    bl func_ov003_02152770
    mov r0, r4
    mov r1, r6
    bl func_ov003_0214fb44
    mov r0, r6
    str r4, [r5, #0x4]
    bl func_ov003_02152788
    strb r0, [r5, #0x2]
    mov r0, #0x21
    strb r0, [r5, #0x0]
    mov r0, #0x13
    strb r0, [r5, #0x58a]
    mov r0, #0x0
    strb r0, [r5, #0x58b]
    bl func_02028920
    str r0, [r5, #0x8]
    bl func_020756ac
    str r0, [r5, #0x564]
    bl func_ov003_021529f0
    mov r0, r5
    bl func_ov003_02152ef4
    mov r0, r5
    bl func_ov003_021532c8
    mov r0, r5
    bl func_ov003_02153508
    mov r0, r5
    bl func_ov003_0215369c
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02152700: .word 0x58c
.L_02152704: .word data_ov003_0215e378
.L_02152708: .word data_ov003_0215e24c
.L_0215270c: .word func_ov003_021527c0
    arm_func_end func_ov003_0215261c

    .global func_ov003_02152710
    arm_func_start func_ov003_02152710
func_ov003_02152710: ; 0x02152710
    ldr ip, .L_02152718
    bx ip
.L_02152718: .word func_0201a21c
    arm_func_end func_ov003_02152710

    .global func_ov003_0215271c
    arm_func_start func_ov003_0215271c
func_ov003_0215271c: ; 0x0215271c
    ldr ip, .L_0215272c
    mov r2, r1
    mov r1, #0x0
    bx ip
.L_0215272c: .word func_020517fc
    arm_func_end func_ov003_0215271c

    .global func_ov003_02152730
    arm_func_start func_ov003_02152730
func_ov003_02152730: ; 0x02152730
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02152730

    .global func_ov003_02152754
    arm_func_start func_ov003_02152754
func_ov003_02152754: ; 0x02152754
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov003_02152754

    .global func_ov003_02152760
    arm_func_start func_ov003_02152760
func_ov003_02152760: ; 0x02152760
    ldr ip, .L_0215276c
    ldr r0, [r0, #0x4]
    bx ip
.L_0215276c: .word func_02028384
    arm_func_end func_ov003_02152760

    .global func_ov003_02152770
    arm_func_start func_ov003_02152770
func_ov003_02152770: ; 0x02152770
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02152770

    .global func_ov003_02152788
    arm_func_start func_ov003_02152788
func_ov003_02152788: ; 0x02152788
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldrb r0, [r0, #0x1e]
    bx lr
    arm_func_end func_ov003_02152788

    .global func_ov003_02152798
    arm_func_start func_ov003_02152798
func_ov003_02152798: ; 0x02152798
    stmdb sp!, {r3, lr}
    ldr lr, [r0, #0x4]
    mov r0, #0x1
    mvn r3, r0, lsl r1
    ldr ip, [lr, #0x8bc]
    and r3, ip, r3
    orr r1, r3, r2, lsl r1
    str r1, [lr, #0x8bc]
    strb r0, [lr, #0x901]
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02152798

    .global func_ov003_021527c0
    arm_func_start func_ov003_021527c0
func_ov003_021527c0: ; 0x021527c0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x1a0]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    mov r0, #0x1
    strb r0, [r4, #0x58b]
    ldr r0, [r5, #0x4]
    ldr r1, .L_02152800
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02152800: .word func_ov003_021529ec
    arm_func_end func_ov003_021527c0

    .global func_ov003_02152804
    arm_func_start func_ov003_02152804
func_ov003_02152804: ; 0x02152804
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    mov r1, #0xd
    ldrb r2, [r4, #0x0]
    sub r3, r1, #0xe
    bl func_ov003_0214d28c
    ldr r0, [r4, #0x564]
    cmp r0, #0x0
    beq .L_0215284c
    bl func_02075758
    mov r0, #0x0
    str r0, [r4, #0x564]
.L_0215284c:
    mov r6, #0x0
    mov r5, r6
.L_02152854:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x55c]
    cmp r0, #0x0
    beq .L_02152870
    bl func_0206ae98
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x55c]
.L_02152870:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02152854
    mov r6, #0x0
    mov r5, r6
.L_02152884:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_021528a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x38]
.L_021528a8:
    add r6, r6, #0x1
    cmp r6, #0x2d
    blt .L_02152884
    mov r6, #0x0
    mov r5, r6
.L_021528bc:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0xec]
    cmp r0, #0x0
    beq .L_021528e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0xec]
.L_021528e0:
    add r6, r6, #0x1
    cmp r6, #0x14
    blt .L_021528bc
    mov r6, #0x0
    mov r5, r6
.L_021528f4:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x13c]
    cmp r0, #0x0
    beq .L_02152918
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x13c]
.L_02152918:
    add r6, r6, #0x1
    cmp r6, #0x14
    blt .L_021528f4
    mov r6, #0x0
    mov r5, r6
.L_0215292c:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x18c]
    cmp r0, #0x0
    beq .L_02152950
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x18c]
.L_02152950:
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_0215292c
    mov r6, #0x0
    mov r5, r6
.L_02152964:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_02152988
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0xc]
.L_02152988:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_02152964
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_021529b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_021529b4:
    blx func_ov012_021b65cc
    bl func_0203b3e4
    mov r1, #0x0
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov003_02152798
    bl func_0203b3f4
    mov r1, #0x0
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov003_02152798
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov003_02152804

    .global func_ov003_021529ec
    arm_func_start func_ov003_021529ec
func_ov003_021529ec: ; 0x021529ec
    bx lr
    arm_func_end func_ov003_021529ec

    .global func_ov003_021529f0
    arm_func_start func_ov003_021529f0
func_ov003_021529f0: ; 0x021529f0
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x34
    ldr r0, .L_02152e60
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    bl func_0203d4e4
    mov r0, #0x0
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    mov r0, #0x1000
    str r0, [sp, #0x20]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x20
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2000
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x1c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x18
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3000
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x14
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    ldr r0, [r4, #0x4]
    mov r1, #0x40
    mov r2, #0x20
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x10]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3000
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x4]
    add r1, sp, #0xc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2000
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1000
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    bl func_0203b3e4
    ldr r4, [r0, #0x88]
    mov r0, #0xc0
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, sp, #0x2c
    mov r2, #0x20
    mov r3, r1
    bl func_ov003_0214ee3c
    mov r0, r4
    mov r1, #0x0
    add r2, sp, #0x2c
    bl func_ov003_02152e64
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov003_02152e9c
    mov r0, r4
    mov r1, #0x0
    mov r2, #0xd
    bl func_ov003_02152eb4
    mov r0, r4
    mov r1, #0x12
    bl func_ov003_02152ecc
    mov r0, r4
    mov r1, #0x1
    bl func_ov003_02152ee0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov003_02152798
    bl func_0203b3f4
    mov r1, #0x0
    ldr r4, [r0, #0x88]
    mov r0, #0xa0
    str r0, [sp, #0x0]
    add r0, sp, #0x24
    mov r2, r1
    mov r3, r1
    bl func_ov003_0214ee3c
    add r2, sp, #0x24
    mov r0, r4
    mov r1, #0x0
    bl func_ov003_02152e64
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov003_02152e9c
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x17
    bl func_ov003_02152eb4
    mov r0, r4
    mov r1, #0x18
    bl func_ov003_02152ecc
    mov r0, r4
    mov r1, #0x1
    bl func_ov003_02152ee0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov003_02152798
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
.L_02152e60: .word data_020a0f64
    arm_func_end func_ov003_021529f0

    .global func_ov003_02152e64
    arm_func_start func_ov003_02152e64
func_ov003_02152e64: ; 0x02152e64
    ldr ip, [r0, #0x4]
    mov r0, #0x1
    strb r0, [ip, #0x901]
    ldrsh r3, [r2, #0x0]
    add r0, ip, r1, lsl #0x3
    add r0, r0, #0x800
    strh r3, [r0, #0xd8]
    ldrsh r1, [r2, #0x2]
    strh r1, [r0, #0xda]
    ldrsh r1, [r2, #0x4]
    strh r1, [r0, #0xdc]
    ldrsh r1, [r2, #0x6]
    strh r1, [r0, #0xde]
    bx lr
    arm_func_end func_ov003_02152e64

    .global func_ov003_02152e9c
    arm_func_start func_ov003_02152e9c
func_ov003_02152e9c: ; 0x02152e9c
    ldr r3, [r0, #0x4]
    mov r0, #0x1
    strb r0, [r3, #0x901]
    add r0, r3, r1
    strb r2, [r0, #0x8fd]
    bx lr
    arm_func_end func_ov003_02152e9c

    .global func_ov003_02152eb4
    arm_func_start func_ov003_02152eb4
func_ov003_02152eb4: ; 0x02152eb4
    ldr r3, [r0, #0x4]
    mov r0, #0x1
    strb r0, [r3, #0x901]
    add r0, r3, r1, lsl #0x2
    str r2, [r0, #0x8c8]
    bx lr
    arm_func_end func_ov003_02152eb4

    .global func_ov003_02152ecc
    arm_func_start func_ov003_02152ecc
func_ov003_02152ecc: ; 0x02152ecc
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    strb r0, [r2, #0x901]
    str r1, [r2, #0x8d4]
    bx lr
    arm_func_end func_ov003_02152ecc

    .global func_ov003_02152ee0
    arm_func_start func_ov003_02152ee0
func_ov003_02152ee0: ; 0x02152ee0
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    strb r1, [r2, #0x8ff]
    strb r0, [r2, #0x901]
    bx lr
    arm_func_end func_ov003_02152ee0

    .global func_ov003_02152ef4
    arm_func_start func_ov003_02152ef4
func_ov003_02152ef4: ; 0x02152ef4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    ldr r6, .L_021532b0
    ldr r5, .L_021532b4
    ldr r4, .L_021532b8
    mov r10, r0
    mov r7, #0x0
.L_02152f10:
    cmp r7, #0x3
    ldrb r0, [r6, r7]
    blt .L_02152f24
    bl func_0203b424
    b .L_02152f28
.L_02152f24:
    bl func_0203b414
.L_02152f28:
    cmp r7, #0x2
    cmpne r7, #0x5
    cmpne r7, #0x0
    ldr r2, [r0, #0x88]
    cmpne r7, #0x3
    beq .L_02152f54
    ldr r0, [r5, r7, lsl #0x2]
    ldr r1, [r4, r7, lsl #0x2]
    bl func_ov003_0214d3a8
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x20]
.L_02152f54:
    add r7, r7, #0x1
    cmp r7, #0x6
    blt .L_02152f10
    mov r6, #0x0
    ldr r5, .L_021532bc
    mov r4, r6
.L_02152f6c:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r10, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0xc]
    cmp r6, #0x5
    blt .L_02152f6c
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    ldrb r0, [r10, #0x2]
    ldr r6, [r1, #0x10]
    bl func_ov003_0214d8d8
    strb r0, [r6, #0x20]
    ldrb r0, [r10, #0x2]
    bl func_ov003_0214d774
    ldr r1, .L_021532c0
    blx func_ov012_021c56d0
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    mov r4, #0x0
    ldr r7, [r0, #0x10]
    add r5, sp, #0x0
.L_02152fd0:
    and r1, r4, #0xff
    add r0, r7, r4
    strb r1, [r0, #0x74]
    ldrb r0, [r10, #0x2]
    bl func_ov003_0214d7f0
    mov r1, r4, lsl #0x1
    add r4, r4, #0x1
    strh r0, [r5, r1]
    cmp r4, #0x14
    blt .L_02152fd0
    mov r5, #0x0
    add r11, sp, #0x0
.L_02153000:
    add r3, r5, #0x1
    add r4, r7, r5
    b .L_02153038
.L_0215300c:
    add r1, r7, r3
    ldrb r2, [r4, #0x74]
    ldrb r0, [r1, #0x74]
    add r3, r3, #0x1
    mov r8, r2, lsl #0x1
    mov r9, r0, lsl #0x1
    ldrsh r9, [r11, r9]
    ldrsh r8, [r11, r8]
    cmp r9, r8
    strgtb r0, [r4, #0x74]
    strgtb r2, [r1, #0x74]
.L_02153038:
    cmp r3, #0x14
    blt .L_0215300c
    add r5, r5, #0x1
    cmp r5, #0x14
    blt .L_02153000
    mov r3, #0x0
    add r2, sp, #0x0
.L_02153054:
    add r0, r7, r3
    ldrb r1, [r0, #0x74]
    add r0, r7, r3, lsl #0x1
    add r3, r3, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r1, [r2, r1]
    cmp r3, #0x14
    strh r1, [r0, #0x88]
    blt .L_02153054
    mov r5, #0x0
    mov r8, r5
.L_02153080:
    add r1, r7, r8
    ldrb r0, [r10, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d7f0
    mov r11, r0
    mov r4, #0x0
    add r9, r8, #0x1
    b .L_021530c0
.L_021530a0:
    add r1, r7, r9
    ldrb r0, [r10, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d7f0
    cmp r11, r0
    addeq r0, r4, #0x1
    andeq r4, r0, #0xff
    add r9, r9, #0x1
.L_021530c0:
    cmp r9, #0x14
    blt .L_021530a0
    ldrb r1, [r10, #0x2]
    mov r0, #0x14
    cmp r4, #0x0
    mla r0, r1, r0, r7
    add r0, r8, r0
    strb r5, [r0, #0x24]
    addeq r0, r8, #0x1
    add r8, r8, #0x1
    andeq r5, r0, #0xff
    cmp r8, #0x14
    blt .L_02153080
    mov r4, #0x0
    b .L_0215311c
.L_021530fc:
    add r1, r7, r4
    ldrb r0, [r10, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d7d4
    cmp r0, #0x0
    streq r4, [r10, #0x580]
    beq .L_02153124
    add r4, r4, #0x1
.L_0215311c:
    cmp r4, #0x14
    blt .L_021530fc
.L_02153124:
    mov r2, #0x0
.L_02153128:
    add r3, r2, #0x1
    add r1, r7, r2
    add r0, r7, r2, lsl #0x1
    b .L_02153188
.L_02153138:
    add r4, r7, r3, lsl #0x1
    ldrsh r5, [r0, #0x88]
    ldrsh r4, [r4, #0x88]
    cmp r5, r4
    bne .L_02153184
    add r4, r7, r3
    ldrb r8, [r4, #0x74]
    ldrb r5, [r1, #0x74]
    cmp r5, r8
    bhi .L_0215316c
    ldr r4, [r10, #0x580]
    cmp r3, r4
    bne .L_02153184
.L_0215316c:
    strb r8, [r1, #0x74]
    add r4, r7, r3
    strb r5, [r4, #0x74]
    ldr r4, [r10, #0x580]
    cmp r3, r4
    streq r2, [r10, #0x580]
.L_02153184:
    add r3, r3, #0x1
.L_02153188:
    cmp r3, #0x14
    blt .L_02153138
    add r2, r2, #0x1
    cmp r2, #0x14
    blt .L_02153128
    ldrb r5, [r10, #0x2]
    mov r0, #0x14
    add r1, r0, #0xc90
    mla r4, r5, r0, r7
    ldr r3, [r10, #0x580]
    mul r2, r5, r1
    add r1, r4, r3
    ldrb r3, [r1, #0x24]
    ldr r1, .L_021532c4
    add r0, r0, #0xc90
    strb r3, [r1, r2]
    ldrb r2, [r10, #0x2]
    mov r1, #0x1
    mul r0, r2, r0
    add r0, r0, #0xf6
    add r0, r0, #0x4a00
    blx func_02073114
    ldrb r0, [r6, #0x20]
    cmp r0, #0x13
    blo .L_02153254
    ldrb r2, [r10, #0x2]
    mov r0, #0x14
    ldr r1, [r10, #0x580]
    mla r0, r2, r0, r6
    add r0, r0, r1
    ldrb r0, [r0, #0x24]
    cmp r0, #0x4
    ldrhs r0, [r6, #0x18]
    orrhs r0, r0, #0x28
    strhs r0, [r6, #0x18]
    ldrb r0, [r6, #0x20]
    cmp r0, #0x14
    bne .L_02153254
    ldr r1, [r6, #0x18]
    mov r0, #0x14
    orr r1, r1, #0x8
    str r1, [r6, #0x18]
    ldrb r2, [r10, #0x2]
    ldr r1, [r10, #0x580]
    mla r0, r2, r0, r6
    add r0, r0, r1
    ldrb r0, [r0, #0x24]
    cmp r0, #0x0
    ldreq r0, [r6, #0x18]
    orreq r0, r0, #0x10
    streq r0, [r6, #0x18]
.L_02153254:
    ldrb r2, [r10, #0x2]
    mov r0, #0x14
    ldr r1, [r10, #0x580]
    mla r0, r2, r0, r6
    add r0, r0, r1
    ldrb r0, [r0, #0x24]
    strb r0, [r6, #0x21]
    ldr r0, [r6, #0x18]
    tst r0, #0x8
    beq .L_02153294
    mov r0, #0x36
    bl func_020734e0
    mov r0, #0x36
    mov r1, #0x0
    bl func_0207361c
    b .L_021532a8
.L_02153294:
    mov r0, #0x35
    bl func_020734e0
    mov r0, #0x35
    mov r1, #0x0
    bl func_0207361c
.L_021532a8:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021532b0: .word data_ov003_0215d510
.L_021532b4: .word data_ov003_0215e17c
.L_021532b8: .word data_ov003_0215e194
.L_021532bc: .word data_ov003_0215e168
.L_021532c0: .word data_ov003_0215ec20
.L_021532c4: .word data_020b4dae
    arm_func_end func_ov003_02152ef4

    .global func_ov003_021532c8
    arm_func_start func_ov003_021532c8
func_ov003_021532c8: ; 0x021532c8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x100
    str r1, [r0, #0x124]
    str r4, [r7, #0x38]
    mov r0, #0xc0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    bl func_0203b3f4
    mov r2, r0
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r4
    mov r2, #0x510000
    mov r3, #0x14
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0xab]
    ldr r0, [r5, #0x4]
    mov r1, #0x10
    blx func_ov012_021b77a8
    ldr r0, [r5, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_021534d4
    ldr r2, .L_021534d8
    ldr r3, .L_021534dc
    mov r0, #0x70
    bl func_0201a21c
    movs r6, r0
    beq .L_021533cc
    ldr r2, .L_021534e0
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_021534e4
    ldr r1, .L_021534e8
    add r0, r6, #0x68
    str r2, [r6, #0x0]
    bl func_ov003_0214e8a8
    ldr r0, .L_021534ec
    str r0, [r6, #0x0]
.L_021533cc:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_021533e8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021533e8:
    ldr r1, [r6, #0x18]
    mov r0, r5
    bl func_02020e98
    ldr r0, [r5, #0x4]
    ldr r2, .L_021534f0
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_021534f4
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    ldr r1, .L_021534f8
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r1, .L_021534f8
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    ldr r1, .L_021534fc
    blx func_ov012_021b3fc4
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    ldr r0, [r5, #0x4]
    blx func_ov012_021b65d8
    str r5, [r7, #0x1a0]
    mov r0, #0x80
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    bl func_0203b3e4
    mov r1, #0x20
    str r1, [sp, #0x0]
    add r1, sp, #0x8
    mov r3, r0
    str r1, [sp, #0x4]
    mov r0, r4
    ldr r1, [r3, #0x88]
    ldrb r4, [r7, #0x2]
    ldr r3, .L_02153500
    ldr r2, .L_02153504
    ldr r3, [r3, r4, lsl #0x2]
    bl func_ov003_0214d554
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r1, [r0, #0x124]
    str r4, [r7, #0x19c]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021534d4: .word data_ov003_0215dc0c
.L_021534d8: .word data_ov003_0215e158
.L_021534dc: .word 0x1b2
.L_021534e0: .word data_02093c8c
.L_021534e4: .word data_ov003_0215db68
.L_021534e8: .word data_ov003_0215e160
.L_021534ec: .word data_ov012_021d1c58
.L_021534f0: .word func_ov003_0215499c
.L_021534f4: .word func_ov003_021549b4
.L_021534f8: .word 0x510014
.L_021534fc: .word 0x510015
.L_02153500: .word data_ov003_0215d500
.L_02153504: .word 0x851000
    arm_func_end func_ov003_021532c8

    .global func_ov003_02153508
    arm_func_start func_ov003_02153508
func_ov003_02153508: ; 0x02153508
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r10, r0
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215364c
    mov r1, #0x1
    str r2, [r0, #0x124]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_02153650
    str r4, [r10, #0x3c]
    ldr r1, [r0, #0x0]
    mov r0, r4
    bl func_ov003_0214e8bc
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r2, .L_02153654
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r7, #0x4]
    ldr r2, .L_02153658
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r7, #0x4]
    ldr r1, .L_0215365c
    bl func_02028384
    mov r0, #0x84000
    str r0, [sp, #0x8]
    mov r0, r7
    add r1, sp, #0x8
    bl func_ov003_02152730
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r1, [r7, #0x4]
    mov r2, #0x3
    str r2, [r1, #0x124]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r7
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov003_0214e990
    mov r5, #0x1
    str r7, [r10, #0x1a4]
    mov r9, #0x0
    mov r6, #0x4
    mov r4, r5
.L_02153604:
    cmp r9, #0x0
    movne r0, r6
    moveq r0, r5
    add r0, r10, r0, lsl #0x2
    ldr r8, [r0, #0x20]
    mov r1, r4
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r7
    mov r1, r8
    bl func_ov003_0214e908
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_02153604
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0215364c: .word 0x101
.L_02153650: .word data_ov012_021d5154
.L_02153654: .word func_ov003_02154a20
.L_02153658: .word func_ov003_02154ac4
.L_0215365c: .word func_ov003_02154ac8
    arm_func_end func_ov003_02153508

    .global func_ov003_02153660
    arm_func_start func_ov003_02153660
func_ov003_02153660: ; 0x02153660
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r2, [r5, #0x24]
    mov r4, r1
    orr r1, r2, r4
    cmp r2, r1
    beq .L_02153688
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_02153688:
    ldrb r0, [r5, #0x24]
    orr r0, r0, r4
    orr r0, r0, #0x30
    strb r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov003_02153660

    .global func_ov003_0215369c
    arm_func_start func_ov003_0215369c
func_ov003_0215369c: ; 0x0215369c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c0
    mov r10, r0
    mov r6, #0x0
    str r6, [r10, #0x55c]
    str r6, [r10, #0x560]
.L_021536b4:
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r5, r0
    cmp r6, #0x0
    mov r3, #0x0
    beq .L_021536fc
    mov r4, #0x21000
    add r1, sp, #0x17c
    add r2, sp, #0x178
    str r4, [sp, #0x178]
    str r3, [sp, #0x17c]
    bl func_ov003_0214e990
    mov r2, #0x82000
    add r1, sp, #0x174
    mov r0, r5
    str r2, [sp, #0x174]
    bl func_ov003_02152730
    b .L_0215372c
.L_021536fc:
    mov r4, #0x9f000
    rsb r4, r4, #0x0
    add r1, sp, #0x170
    add r2, sp, #0x16c
    str r4, [sp, #0x16c]
    str r3, [sp, #0x170]
    bl func_ov003_0214e990
    mov r2, #0x83000
    add r1, sp, #0x168
    mov r0, r5
    str r2, [sp, #0x168]
    bl func_ov003_02152730
.L_0215372c:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    str r6, [r0, #0x124]
    ldr r0, [r5, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_02154638
    bl func_02028384
    add r0, r10, r6, lsl #0x2
    str r5, [r0, #0x44]
    ldr r1, .L_0215463c
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r1, r5
    mov r7, r0
    bl func_ov003_0214fb44
    mov r0, #0x0
    str r0, [sp, #0x160]
    str r0, [sp, #0x164]
    mov r0, r7
    add r1, sp, #0x164
    add r2, sp, #0x160
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    cmp r6, #0x0
    beq .L_021537e4
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    mov r3, #0x2
    b .L_021537f4
.L_021537e4:
    mov r0, #0x1
    bl func_0203b424
    ldr r2, [r0, #0x88]
    mov r3, #0x5
.L_021537f4:
    ldr r0, .L_02154640
    ldr r1, .L_02154644
    ldr r0, [r0, r3, lsl #0x2]
    ldr r1, [r1, r3, lsl #0x2]
    bl func_ov003_0214d3a8
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, #0x0
    mov r0, #0x9000
    str r1, [sp, #0x158]
    str r0, [sp, #0x15c]
    add r1, sp, #0x15c
    add r2, sp, #0x158
    mov r0, r4
    bl func_ov003_0214e990
    mov r0, r7
    mov r1, r4
    bl func_ov003_0214e908
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    cmp r6, #0x0
    beq .L_02153888
    mov r0, #0x3
    bl func_0203b414
    ldr r7, [r0, #0x88]
    str r4, [r10, #0x190]
    b .L_02153898
.L_02153888:
    mov r0, #0x0
    bl func_0203b424
    ldr r7, [r0, #0x88]
    str r4, [r10, #0x18c]
.L_02153898:
    ldr r1, .L_0215463c
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r3, #0x0
    add r1, sp, #0x128
    add r2, sp, #0x12c
    mov r8, r0
    str r3, [sp, #0x12c]
    str r3, [sp, #0x128]
    bl func_ov003_0214e990
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    cmp r6, #0x0
    movne r1, #0x1
    ldr r0, [r8, #0x4]
    moveq r1, #0x0
    str r1, [r0, #0x124]
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r2, #0x84000
    add r1, sp, #0x130
    mov r0, r8
    str r2, [sp, #0x130]
    bl func_ov003_02152730
    ldr r0, [r8, #0x4]
    ldr r1, .L_02154648
    bl func_02028384
    mov r0, r7
    bl func_ov003_0214cf8c
    bl func_02036ab8
    bl func_ov003_0214d47c
    mov r1, #0x10000
    str r1, [sp, #0x138]
    mov r1, #0x2c000
    str r1, [sp, #0x134]
    mov r9, r0
    add r1, sp, #0x134
    add r2, sp, #0x138
    bl func_ov003_0214e990
    ldr r0, [r9, #0x4]
    mov r1, #0x20
    ldr r0, [r0, #0x64]
    mov r2, r1
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xa4]
    blx r3
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x7c]
    blx r2
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x10
    mov r3, #0x0
    ldr r2, .L_0215464c
    mov r1, r0
    str r3, [sp, #0x0]
    bl func_ov012_021ca3a4
    mov r1, #0xe0000
    mov r4, r0
    str r1, [sp, #0x140]
    str r1, [sp, #0x13c]
    add r1, sp, #0x13c
    add r2, sp, #0x140
    bl func_ov003_0214e990
    ldr r11, [r4, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_02154650
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    mov r1, r9
    bl func_ov003_0214fb44
    bl func_ov003_0214cfc8
    mov r0, r8
    mov r1, r9
    bl func_ov003_0214e908
    mov r1, r4
    mov r0, r8
    bl func_ov003_0214e908
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    mov r0, r7
    ldr r11, [r1, #0x10]
    bl func_ov003_0214cf8c
    mvn r0, #0x0
    mov r7, #0x0
    str r0, [sp, #0x34]
.L_02153a6c:
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_0215464c
    mov r0, #0x100
    mov r1, #0x10
    mov r3, #0x0
    bl func_ov012_021ca3a4
    mov r1, #0x0
    str r1, [sp, #0x144]
    mov r1, r7, lsl #0x11
    str r1, [sp, #0x148]
    mov r4, r0
    add r1, sp, #0x144
    add r2, sp, #0x148
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    str r0, [sp, #0x18]
    ldr r0, [r0, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, [sp, #0x18]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    mov r0, r4
    mov r1, r9
    bl func_ov003_0214fb44
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r1, r11, r7
    ldrb r0, [r10, #0x2]
    ldrb r1, [r1, #0x80]
    bl func_ov003_0214d784
    add r1, sp, #0x180
    mov r2, #0x14
    bl func_02051890
    mov r1, #0x0
    add r0, sp, #0x144
    strh r1, [r0, #0x50]
    ldr r0, [r4, #0x4]
    ldr r2, [sp, #0x34]
    ldr r0, [r0, #0x64]
    add r1, sp, #0x180
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    mov r1, r4
    mov r0, r8
    bl func_ov003_0214e908
    add r7, r7, #0x1
    cmp r7, #0x8
    blt .L_02153a6c
    bl func_ov003_0214cfc8
    cmp r6, #0x0
    bne .L_02153e30
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r4, [r0, #0x88]
    ldr r1, .L_0215463c
    str r7, [r10, #0x194]
    ldr r1, [r1, #0x0]
    mov r0, r7
    bl func_ov003_0214e8bc
    mov r1, #0x0
    mov r8, r0
    str r1, [sp, #0x108]
    str r1, [sp, #0x104]
    add r1, sp, #0x104
    add r2, sp, #0x108
    bl func_ov003_0214e990
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r2, #0x2
    str r2, [r0, #0x124]
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0x10c]
    mov r0, r8
    add r1, sp, #0x10c
    bl func_ov003_02152730
    ldr r0, [r8, #0x4]
    ldr r1, .L_02154654
    bl func_02028384
    mov r0, r4
    bl func_ov003_0214cf8c
    bl func_02036ab8
    bl func_ov003_0214d47c
    mov r1, #0x3000
    str r1, [sp, #0x114]
    mov r1, #0x2c000
    str r1, [sp, #0x110]
    mov r9, r0
    add r1, sp, #0x110
    add r2, sp, #0x114
    bl func_ov003_0214e990
    ldr r0, [r9, #0x4]
    mov r1, #0x20
    ldr r0, [r0, #0x64]
    mov r2, r1
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xa4]
    blx r3
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x7c]
    blx r2
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x10
    mov r3, #0x0
    ldr r2, .L_02154658
    mov r1, r0
    str r3, [sp, #0x0]
    bl func_ov012_021ca3a4
    mov r1, #0xf0000
    str r1, [sp, #0x11c]
    str r1, [sp, #0x118]
    add r1, sp, #0x118
    mov r4, r0
    add r2, sp, #0x11c
    bl func_ov003_0214e990
    ldr r7, [r4, #0x4]
    ldr r0, [r7, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215465c
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov003_0214cfc8
    mov r0, r8
    mov r1, r9
    bl func_ov003_0214e908
    mov r1, r4
    mov r0, r8
    bl func_ov003_0214e908
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    mov r1, #0x0
    ldr r0, .L_02154658
    mov r2, r1
    blx func_ov012_021caa0c
    mov r11, r0
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    mov r7, #0x0
    ldr r0, [r0, #0x10]
    str r0, [sp, #0x14]
.L_02153d58:
    ldr r0, [r11, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov003_0214d47c
    mov r1, #0x0
    str r1, [sp, #0x120]
    mov r1, r7, lsl #0x5
    sub r1, r1, #0x100
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x124]
    mov r4, r0
    add r1, sp, #0x120
    add r2, sp, #0x124
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    str r0, [sp, #0x10]
    ldr r0, [r0, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, [sp, #0x10]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    mov r0, r4
    mov r1, r9
    bl func_ov003_0214fb44
    ldr r0, [r4, #0x4]
    add r1, r7, #0xc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r2, [sp, #0x14]
    ldrb r1, [r10, #0x2]
    add r2, r2, r7
    ldrb r2, [r2, #0x80]
    ldr r0, [r10, #0x564]
    bl func_ov003_0214d79c
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r1, r4
    mov r0, r8
    bl func_ov003_0214e908
    add r7, r7, #0x1
    cmp r7, #0x8
    blt .L_02153d58
    ldr r0, [r11, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    bl func_ov003_0214cfc8
.L_02153e30:
    mov r0, #0x4000
    rsb r0, r0, #0x0
    mov r9, #0x0
    str r0, [sp, #0x3c]
.L_02153e40:
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r4, r0
    cmp r6, #0x0
    movne r0, #0x0
    moveq r0, #0x14
    ldr r1, [r4, #0x4]
    add r0, r9, r0
    str r0, [r1, #0x124]
    mov r0, #0x0
    str r0, [sp, #0x154]
    mov r0, r9, lsl #0x11
    str r0, [sp, #0x150]
    mov r0, r4
    add r1, sp, #0x154
    add r2, sp, #0x150
    bl func_ov003_0214e990
    mov r0, r4
    mov r1, r5
    bl func_ov003_0214fb44
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0x14c]
    mov r0, r4
    add r1, sp, #0x14c
    bl func_ov003_02152730
    ldr r0, [r4, #0x4]
    ldr r1, .L_02154660
    bl func_02028384
    add r0, r10, r9, lsl #0x2
    cmp r6, #0x0
    strne r4, [r0, #0xec]
    streq r4, [r0, #0x13c]
    ldr r1, .L_0215463c
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0xd4]
    mov r0, r8
    add r1, sp, #0xd4
    bl func_ov003_02152730
    mov r0, #0x9c000
    str r0, [sp, #0xd8]
    mov r0, r8
    add r1, sp, #0xd8
    bl func_ov003_0214d52c
    mov r0, #0x0
    str r0, [sp, #0xe0]
    mov r0, #0x3000
    str r0, [sp, #0xdc]
    mov r0, r8
    add r1, sp, #0xdc
    add r2, sp, #0xe0
    bl func_ov003_0214e990
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    str r9, [r0, #0x124]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    cmp r6, #0x0
    cmpeq r9, #0x0
    bne .L_02153f98
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02153f98:
    cmp r6, #0x0
    beq .L_02153fb4
    bl func_0203b404
    ldr r7, [r0, #0x88]
    mov r0, #0x850000
    str r0, [sp, #0x2c]
    b .L_02153fc4
.L_02153fb4:
    bl func_0203b3f4
    ldr r7, [r0, #0x88]
    ldr r0, .L_02154664
    str r0, [sp, #0x2c]
.L_02153fc4:
    ldr r0, [r10, #0x4]
    ldrb r11, [r10, #0x2]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x10]
    mov r0, #0x14
    mla r0, r11, r0, r1
    add r0, r9, r0
    ldrb r2, [r0, #0x24]
    cmp r2, #0x3
    blo .L_021540f4
    add r0, r2, #0x1
    mov r1, #0xa
    str r0, [sp, #0xc]
    bl func_0200d12c
    movs r11, r0
    mov r0, #0xa
    mul r1, r11, r0
    ldr r0, [sp, #0xc]
    sub r0, r0, r1
    str r0, [sp, #0x30]
    beq .L_02154074
    ldr r1, [sp, #0x2c]
    mov r0, r7
    add r2, r11, #0x1b
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    mov r1, #0x10000
    str r1, [sp, #0xe8]
    mov r1, #0x18000
    str r1, [sp, #0xe4]
    str r0, [sp, #0x38]
    add r1, sp, #0xe4
    add r2, sp, #0xe8
    bl func_ov003_0214e990
    ldr r0, [sp, #0x38]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x38]
    mov r0, r8
    bl func_ov003_0214e908
.L_02154074:
    ldr r2, [sp, #0x30]
    ldr r1, [sp, #0x2c]
    mov r0, r7
    add r2, r2, #0x1b
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    cmp r11, #0x0
    mov r7, r0
    mov r1, #0x10000
    beq .L_021540b8
    str r1, [sp, #0xf0]
    mov r1, #0x20000
    str r1, [sp, #0xec]
    add r1, sp, #0xec
    add r2, sp, #0xf0
    bl func_ov003_0214e990
    b .L_021540d0
.L_021540b8:
    str r1, [sp, #0xf8]
    mov r1, #0x1d000
    str r1, [sp, #0xf4]
    add r1, sp, #0xf4
    add r2, sp, #0xf8
    bl func_ov003_0214e990
.L_021540d0:
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    mov r1, r7
    bl func_ov003_0214e908
    b .L_02154148
.L_021540f4:
    ldr r1, [sp, #0x2c]
    mov r0, r7
    add r2, r2, #0x18
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    mov r1, #0x11000
    str r1, [sp, #0x100]
    mov r1, #0x1b000
    str r1, [sp, #0xfc]
    mov r7, r0
    add r1, sp, #0xfc
    add r2, sp, #0x100
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    mov r1, r7
    bl func_ov003_0214e908
.L_02154148:
    ldr r1, .L_0215463c
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0xa4]
    mov r0, r8
    add r1, sp, #0xa4
    bl func_ov003_02152730
    mov r0, #0x9c000
    str r0, [sp, #0xa8]
    mov r0, r8
    add r1, sp, #0xa8
    bl func_ov003_0214d52c
    ldr r0, [sp, #0x3c]
    add r1, sp, #0xac
    str r0, [sp, #0xb0]
    mov r0, #0xc2000
    str r0, [sp, #0xac]
    mov r0, r8
    add r2, sp, #0xb0
    bl func_ov003_0214e990
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    str r9, [r0, #0x124]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    cmp r6, #0x0
    beq .L_021541fc
    bl func_0203b404
    ldr r11, [r0, #0x88]
    mov r0, #0x850000
    str r0, [sp, #0x1c]
    b .L_0215420c
.L_021541fc:
    bl func_0203b3f4
    ldr r11, [r0, #0x88]
    ldr r0, .L_02154664
    str r0, [sp, #0x1c]
.L_0215420c:
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    mov r1, #0x64
    ldr r0, [r0, #0x10]
    add r0, r0, r9, lsl #0x1
    ldrsh r0, [r0, #0x88]
    str r0, [sp, #0x8]
    bl func_0200d12c
    mov r7, r0
    mov r0, #0x64
    mul r1, r7, r0
    ldr r0, [sp, #0x8]
    sub r0, r0, r1
    mov r1, #0xa
    str r0, [sp, #0x4]
    bl func_0200d12c
    str r0, [sp, #0x20]
    mov r1, r0
    mov r0, #0xa
    mul r2, r1, r0
    ldr r0, [sp, #0x4]
    cmp r7, #0x0
    sub r0, r0, r2
    str r0, [sp, #0x24]
    mov r0, #0x1e
    str r0, [sp, #0x28]
    beq .L_021542d4
    ldr r1, [sp, #0x1c]
    mov r0, r11
    add r2, r7, #0x2d
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    mov r1, #0x11000
    str r1, [sp, #0xb8]
    mov r1, #0x16000
    str r1, [sp, #0xb4]
    str r0, [sp, #0x40]
    add r1, sp, #0xb4
    add r2, sp, #0xb8
    bl func_ov003_0214e990
    ldr r0, [sp, #0x40]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x40]
    mov r0, r8
    bl func_ov003_0214e908
.L_021542d4:
    cmp r7, #0x0
    ldreq r0, [sp, #0x20]
    cmpeq r0, #0x0
    beq .L_02154370
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x1c]
    add r2, r0, #0x2d
    mov r0, r11
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    cmp r7, #0x0
    mov r7, r0
    mov r1, #0x11000
    beq .L_02154330
    str r1, [sp, #0xc0]
    mov r1, #0x1e000
    str r1, [sp, #0xbc]
    add r1, sp, #0xbc
    add r2, sp, #0xc0
    bl func_ov003_0214e990
    mov r0, #0x26
    str r0, [sp, #0x28]
    b .L_02154350
.L_02154330:
    str r1, [sp, #0xc8]
    mov r1, #0x1a000
    str r1, [sp, #0xc4]
    add r1, sp, #0xc4
    add r2, sp, #0xc8
    bl func_ov003_0214e990
    mov r0, #0x22
    str r0, [sp, #0x28]
.L_02154350:
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r7
    mov r0, r8
    bl func_ov003_0214e908
.L_02154370:
    ldr r2, [sp, #0x24]
    ldr r1, [sp, #0x1c]
    mov r0, r11
    add r2, r2, #0x2d
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    ldr r1, [sp, #0x28]
    mov r7, r0
    mov r1, r1, lsl #0xc
    str r1, [sp, #0xcc]
    mov r1, #0x11000
    str r1, [sp, #0xd0]
    add r1, sp, #0xcc
    add r2, sp, #0xd0
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    mov r1, r7
    bl func_ov003_0214e908
    ldr r0, [r10, #0x580]
    cmp r9, r0
    bne .L_02154588
    ldr r1, .L_0215463c
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0x8c]
    mov r0, r8
    add r1, sp, #0x8c
    bl func_ov003_02152730
    mov r0, #0x9d000
    str r0, [sp, #0x90]
    mov r0, r8
    add r1, sp, #0x90
    bl func_ov003_0214d52c
    mov r0, #0x0
    str r0, [sp, #0x98]
    str r0, [sp, #0x94]
    mov r0, r8
    add r1, sp, #0x94
    add r2, sp, #0x98
    bl func_ov003_0214e990
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    str r9, [r0, #0x124]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    cmp r6, #0x0
    beq .L_02154484
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x850000
    b .L_02154490
.L_02154484:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02154664
.L_02154490:
    mov r2, #0xb
    mov r3, #0x9d
    bl func_ov003_0214d4a4
    mov r1, #0x10000
    str r1, [sp, #0xa0]
    mov r1, #0x81000
    str r1, [sp, #0x9c]
    mov r7, r0
    add r1, sp, #0x9c
    add r2, sp, #0xa0
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    mov r1, r7
    bl func_ov003_0214e908
    cmp r6, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    and r8, r0, #0xff
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x55c]
    cmp r0, #0x0
    bne .L_02154588
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x64]
    ldr r7, [r0, #0x2c]
    cmp r7, #0x0
    bne .L_0215451c
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r7, r0
.L_0215451c:
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    bne .L_02154538
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02154538:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r7, #0x18]
    mov r1, #0x21
    mov r2, #0xe
    mov r3, #0x5
    bl func_0206ad90
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x55c]
    cmp r0, #0x0
    beq .L_02154588
    mov r1, #0x0
    strh r1, [r0, #0x18]
    ldr r1, .L_02154668
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
.L_02154588:
    ldr r1, .L_0215463c
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0x74]
    mov r0, r8
    add r1, sp, #0x74
    bl func_ov003_02152730
    mov r0, #0x9c000
    str r0, [sp, #0x78]
    mov r0, r8
    add r1, sp, #0x78
    bl func_ov003_0214d52c
    mov r0, #0x0
    str r0, [sp, #0x80]
    mov r0, #0xaf000
    str r0, [sp, #0x7c]
    mov r0, r8
    add r1, sp, #0x7c
    add r2, sp, #0x80
    bl func_ov003_0214e990
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    str r9, [r0, #0x124]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    cmp r6, #0x0
    beq .L_02154670
    bl func_0203b404
    ldr r7, [r0, #0x88]
    mov r11, #0x850000
    b .L_0215467c
.L_02154638: .word func_ov003_02154b78
.L_0215463c: .word data_ov012_021d5154
.L_02154640: .word data_ov003_0215e17c
.L_02154644: .word data_ov003_0215e194
.L_02154648: .word func_ov003_02155250
.L_0215464c: .word data_ov003_0215e398
.L_02154650: .word data_ov003_0215d4ec
.L_02154654: .word func_ov003_021556d8
.L_02154658: .word data_ov003_0215e3a8
.L_0215465c: .word data_ov003_0215e3bc
.L_02154660: .word func_ov003_021550e4
.L_02154664: .word 0x851000
.L_02154668: .word 0x79f
.L_0215466c: .word data_ov003_0215d518
.L_02154670:
    bl func_0203b3f4
    ldr r7, [r0, #0x88]
    ldr r11, .L_02154664
.L_0215467c:
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    ldrb r0, [r10, #0x2]
    ldr r1, [r1, #0x10]
    add r1, r1, r9
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d7d4
    mov r3, r0
    ldr r2, .L_0215466c
    mov r1, r11
    ldrb r2, [r2, r3]
    mov r0, r7
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    mov r1, #0x10000
    str r1, [sp, #0x88]
    mov r1, #0x12000
    str r1, [sp, #0x84]
    mov r7, r0
    add r1, sp, #0x84
    add r2, sp, #0x88
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    mov r1, r7
    bl func_ov003_0214e908
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    ldrb r0, [r10, #0x2]
    ldr r1, [r1, #0x10]
    add r1, r1, r9
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d808
    cmp r0, #0x0
    beq .L_02154824
    ldr r1, .L_0215463c
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0x5c]
    mov r0, r8
    add r1, sp, #0x5c
    bl func_ov003_02152730
    mov r0, #0x9c000
    str r0, [sp, #0x60]
    mov r0, r8
    add r1, sp, #0x60
    bl func_ov003_0214d52c
    mov r0, #0x10000
    str r0, [sp, #0x68]
    mov r0, #0x9c000
    str r0, [sp, #0x64]
    mov r0, r8
    add r1, sp, #0x64
    add r2, sp, #0x68
    bl func_ov003_0214e990
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    str r9, [r0, #0x124]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    cmp r6, #0x0
    beq .L_021547d0
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x850000
    b .L_021547dc
.L_021547d0:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02154664
.L_021547dc:
    mov r2, #0x25
    mov r3, #0x9c
    bl func_ov003_0214d4a4
    mov r1, #0x8000
    str r1, [sp, #0x70]
    str r1, [sp, #0x6c]
    mov r7, r0
    add r1, sp, #0x6c
    add r2, sp, #0x70
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    mov r1, r7
    bl func_ov003_0214e908
.L_02154824:
    cmp r6, #0x0
    beq .L_0215497c
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    mov r0, r4
    ldr r8, [r1, #0x10]
    ldr r1, .L_0215463c
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r1, #0x9c000
    str r1, [sp, #0x44]
    add r1, sp, #0x44
    mov r7, r0
    bl func_ov003_0214d52c
    mov r0, #0x0
    str r0, [sp, #0x4c]
    mov r0, #0x2b000
    str r0, [sp, #0x48]
    mov r0, r7
    add r1, sp, #0x48
    add r2, sp, #0x4c
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    str r9, [r0, #0x124]
    ldr r0, [r7, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov003_0214d47c
    mov r1, #0x3000
    str r1, [sp, #0x54]
    mov r1, #0x0
    str r1, [sp, #0x50]
    mov r4, r0
    add r1, sp, #0x50
    add r2, sp, #0x54
    bl func_ov003_0214e990
    ldr r11, [r4, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x9c000
    str r0, [sp, #0x58]
    mov r0, r4
    add r1, sp, #0x58
    bl func_ov003_0214d52c
    add r0, r8, r9
    ldrb r2, [r0, #0x74]
    ldrb r1, [r10, #0x2]
    ldr r0, [r10, #0x564]
    bl func_ov003_0214d79c
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, r7
    mov r1, r4
    bl func_ov003_0214e908
    bl func_ov003_0214cfc8
.L_0215497c:
    add r9, r9, #0x1
    cmp r9, #0x14
    blt .L_02153e40
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_021536b4
    add sp, sp, #0x1c0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov003_0215369c

    .global func_ov003_0215499c
    arm_func_start func_ov003_0215499c
func_ov003_0215499c: ; 0x0215499c
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215499c

    .global func_ov003_021549b4
    arm_func_start func_ov003_021549b4
func_ov003_021549b4: ; 0x021549b4
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0xe
    ldr r4, [r0, #0x10]
    ldr r0, .L_02154a18
    strb r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02154a18
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02154a18
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02154a18
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02154a1c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02154a18: .word data_020a0e18
.L_02154a1c: .word func_ov003_02152804
    arm_func_end func_ov003_021549b4

    .global func_ov003_02154a20
    arm_func_start func_ov003_02154a20
func_ov003_02154a20: ; 0x02154a20
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    mov r4, #0x1
    b .L_02154a60
.L_02154a34:
    mov r0, r6
    mov r1, r5
    bl func_ov003_02154a7c
    cmp r5, #0x0
    beq .L_02154a5c
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02154a5c:
    add r5, r5, #0x1
.L_02154a60:
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r5, r0
    blo .L_02154a34
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov003_02154a20

    .global func_ov003_02154a7c
    arm_func_start func_ov003_02154a7c
func_ov003_02154a7c: ; 0x02154a7c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    beq .L_02154abc
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xc0]
    blx r2
    bl func_ov003_0214d47c
    mov r5, r0
.L_02154abc:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov003_02154a7c

    .global func_ov003_02154ac4
    arm_func_start func_ov003_02154ac4
func_ov003_02154ac4: ; 0x02154ac4
    bx lr
    arm_func_end func_ov003_02154ac4

    .global func_ov003_02154ac8
    arm_func_start func_ov003_02154ac8
func_ov003_02154ac8: ; 0x02154ac8
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r1, [r0, #0x4]
    ldr r0, [r1, #0x90]
    and r0, r0, #0x10
    cmp r0, #0x10
    bne .L_02154b70
    ldr r0, [r1, #0x50]
    mov r2, #0xc0
    ldr r1, [r0, #0xc]
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    add r4, r0, #0xd
    add r5, r0, #0xf3
    cmp r4, #0x100
    movgt r4, #0x100
    cmp r5, #0x100
    movgt r5, #0x100
    str r2, [sp, #0x0]
    add r0, sp, #0xc
    mov r1, r4
    mov r3, r5
    mov r2, #0x20
    bl func_ov003_0214ee3c
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    add r2, sp, #0xc
    mov r1, #0x0
    bl func_ov003_02152e64
    mov r0, #0xa0
    str r0, [sp, #0x0]
    mov r1, r4
    mov r3, r5
    add r0, sp, #0x4
    mov r2, #0x0
    bl func_ov003_0214ee3c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    add r2, sp, #0x4
    bl func_ov003_02152e64
.L_02154b70:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov003_02154ac8

    .global func_ov003_02154b78
    arm_func_start func_ov003_02154b78
func_ov003_02154b78: ; 0x02154b78
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x3c
    mov r4, r0
    ldr r6, [r4, #0x4]
    ldr r7, [r6, #0x10]
    ldrb r0, [r7, #0x58b]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_021550bc
.L_02154b9c: ; jump table
    b .L_021550bc ; case 0
    b .L_02154bb8 ; case 1
    b .L_02154d34 ; case 2
    b .L_02154e7c ; case 3
    b .L_02154f5c ; case 4
    b .L_02154f9c ; case 5
    b .L_021550bc ; case 6
.L_02154bb8:
    ldr r0, [r6, #0x124]
    cmp r0, #0x0
    beq .L_02154bf4
    ldr r0, [r7, #0x56c]
    mov r6, #0x21
    add r0, r0, #0x6
    str r0, [r7, #0x56c]
    bl func_0203b3e4
    ldr r1, [r7, #0x56c]
    ldr r5, [r0, #0x88]
    add ip, r1, #0x20
    cmp ip, #0xc0
    mov r2, #0x20
    movgt ip, #0xc0
    b .L_02154c6c
.L_02154bf4:
    add r0, r7, #0x500
    ldrh r1, [r0, #0x88]
    mvn r6, #0x9e
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
    bl func_0203b3f4
    ldr r1, [r7, #0x56c]
    mov r2, #0x0
    subs ip, r1, #0xa0
    movmi ip, r2
    cmp ip, #0xa0
    ldr r5, [r0, #0x88]
    movgt r0, #0xff
    strgt r0, [r7, #0x57c]
    movgt ip, #0xa0
    bgt .L_02154c6c
    mov r8, #0x0
    str r8, [r7, #0x57c]
    add r0, r7, #0x17c
    mov r3, #0x1
    b .L_02154c64
.L_02154c48:
    cmp ip, r8, lsl #0x5
    ble .L_02154c6c
    add r8, r8, #0x1
    ldr lr, [r0, #0x400]
    rsb r1, r8, #0x8
    orr r1, lr, r3, lsl r1
    str r1, [r0, #0x400]
.L_02154c64:
    cmp r8, #0x8
    blt .L_02154c48
.L_02154c6c:
    add r0, sp, #0x34
    mov r1, #0xd
    mov r3, #0xf3
    str ip, [sp, #0x0]
    bl func_ov003_0214ee3c
    add r2, sp, #0x34
    mov r0, r5
    mov r1, #0x0
    bl func_ov003_02152e64
    ldr r0, [r7, #0x56c]
    add r1, sp, #0x30
    add r0, r6, r0
    mov r5, r0, lsl #0xc
    mov r0, r4
    str r5, [sp, #0x30]
    bl func_ov003_021550c4
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    cmp r0, #0x0
    beq .L_02154ce0
    str r5, [sp, #0x2c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x2c
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    bl func_ov003_021550c4
.L_02154ce0:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x0
    bne .L_02154d0c
    ldr r0, [r7, #0x194]
    cmp r0, #0x0
    beq .L_02154d0c
    str r5, [sp, #0x28]
    ldr r0, [r7, #0x194]
    add r1, sp, #0x28
    bl func_ov003_021550c4
.L_02154d0c:
    add r0, r7, #0x500
    ldrh r1, [r0, #0x88]
    cmp r1, #0x50
    bls .L_021550bc
    mov r1, #0x0
    strh r1, [r0, #0x88]
    ldrb r0, [r7, #0x58b]
    add r0, r0, #0x1
    strb r0, [r7, #0x58b]
    b .L_021550bc
.L_02154d34:
    add r0, r7, #0x500
    ldrh r8, [r0, #0x88]
    mov r1, #0x14
    mov r5, #0x2
    mov r0, r8
    bl func_0200d12c
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_02154d8c
.L_02154d58: ; jump table
    b .L_02154d70 ; case 0
    b .L_02154d74 ; case 1
    b .L_02154d74 ; case 2
    b .L_02154d78 ; case 3
    b .L_02154d78 ; case 4
    b .L_02154d80 ; case 5
.L_02154d70:
    mov r5, #0x4
.L_02154d74:
    b .L_02154d8c
.L_02154d78:
    mov r5, #0x1
    b .L_02154d8c
.L_02154d80:
    tst r8, #0x1
    movne r5, #0x1
    moveq r5, #0x0
.L_02154d8c:
    ldr r0, [r6, #0x124]
    cmp r0, #0x0
    ldrne r0, [r7, #0x56c]
    movne r2, #0x21
    addne r0, r0, r5
    strne r0, [r7, #0x56c]
    addeq r0, r7, #0x500
    ldreqh r1, [r0, #0x88]
    mvneq r2, #0x9e
    addeq r1, r1, #0x1
    streqh r1, [r0, #0x88]
    ldr r0, [r7, #0x56c]
    add r1, sp, #0x24
    add r0, r2, r0
    mov r5, r0, lsl #0xc
    mov r0, r4
    str r5, [sp, #0x24]
    bl func_ov003_021550c4
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    cmp r0, #0x0
    beq .L_02154e08
    str r5, [sp, #0x20]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x20
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    bl func_ov003_021550c4
.L_02154e08:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x0
    bne .L_02154e34
    ldr r0, [r7, #0x194]
    cmp r0, #0x0
    beq .L_02154e34
    str r5, [sp, #0x1c]
    ldr r0, [r7, #0x194]
    add r1, sp, #0x1c
    bl func_ov003_021550c4
.L_02154e34:
    add r0, r7, #0x500
    ldrh r0, [r0, #0x88]
    cmp r0, #0x50
    bhi .L_02154e50
    ldr r0, [r7, #0x56c]
    cmp r0, #0x280
    blo .L_021550bc
.L_02154e50:
    add r0, r7, #0x500
    mov r1, #0x0
    strh r1, [r0, #0x88]
    ldr r0, [r7, #0x56c]
    cmp r0, #0x280
    movhs r0, #0x4
    strhsb r0, [r7, #0x58b]
    ldrlob r0, [r7, #0x58b]
    addlo r0, r0, #0x1
    strlob r0, [r7, #0x58b]
    b .L_021550bc
.L_02154e7c:
    ldr r0, [r6, #0x124]
    cmp r0, #0x0
    add r0, r7, #0x500
    beq .L_02154ea8
    ldrh r0, [r0, #0x88]
    mov r2, #0x21
    tst r0, #0x1
    ldreq r0, [r7, #0x56c]
    addeq r0, r0, #0x1
    streq r0, [r7, #0x56c]
    b .L_02154eb8
.L_02154ea8:
    ldrh r1, [r0, #0x88]
    mvn r2, #0x9e
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
.L_02154eb8:
    ldr r0, [r7, #0x56c]
    add r1, sp, #0x18
    add r0, r2, r0
    mov r5, r0, lsl #0xc
    mov r0, r4
    str r5, [sp, #0x18]
    bl func_ov003_021550c4
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    cmp r0, #0x0
    beq .L_02154f08
    str r5, [sp, #0x14]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x14
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    bl func_ov003_021550c4
.L_02154f08:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x0
    bne .L_02154f34
    ldr r0, [r7, #0x194]
    cmp r0, #0x0
    beq .L_02154f34
    str r5, [sp, #0x10]
    ldr r0, [r7, #0x194]
    add r1, sp, #0x10
    bl func_ov003_021550c4
.L_02154f34:
    ldr r0, [r7, #0x56c]
    cmp r0, #0x280
    blo .L_021550bc
    add r0, r7, #0x500
    mov r1, #0x0
    strh r1, [r0, #0x88]
    ldrb r0, [r7, #0x58b]
    add r0, r0, #0x1
    strb r0, [r7, #0x58b]
    b .L_021550bc
.L_02154f5c:
    ldr r0, [r6, #0x124]
    cmp r0, #0x0
    addne r0, r7, #0x500
    ldrneh r1, [r0, #0x88]
    addne r1, r1, #0x1
    strneh r1, [r0, #0x88]
    add r0, r7, #0x500
    ldrh r1, [r0, #0x88]
    cmp r1, #0x28
    blo .L_021550bc
    mov r1, #0x0
    strh r1, [r0, #0x88]
    ldrb r0, [r7, #0x58b]
    add r0, r0, #0x1
    strb r0, [r7, #0x58b]
    b .L_021550bc
.L_02154f9c:
    ldr r0, [r7, #0x580]
    cmp r0, #0x0
    blt .L_02154fb8
    cmp r0, #0x7
    movle r0, #0x6
    strleb r0, [r7, #0x58b]
    ble .L_021550bc
.L_02154fb8:
    add r0, r7, #0x500
    ldrh r0, [r0, #0x88]
    cmp r0, #0x0
    ldreq r0, [r7, #0x56c]
    streq r0, [r7, #0x570]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x0
    beq .L_02155018
    ldr r0, [r7, #0x580]
    mov r5, #0x21
    sub r1, r0, #0x5
    add r0, r7, #0x500
    cmp r1, #0xa
    ldrh r2, [r0, #0x88]
    movgt r1, #0xa
    mov r0, r1, lsl #0x5
    mul r0, r2, r0
    mov r1, #0x5a
    bl func_0200d12c
    ldr r1, [r7, #0x570]
    sub r0, r1, r0
    str r0, [r7, #0x56c]
    b .L_02155040
.L_02155018:
    add r0, r7, #0x500
    ldrh r1, [r0, #0x88]
    mvn r5, #0x9e
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
    ldrh r0, [r0, #0x88]
    cmp r0, #0x5a
    ldrhib r0, [r7, #0x58b]
    addhi r0, r0, #0x1
    strhib r0, [r7, #0x58b]
.L_02155040:
    ldr r0, [r7, #0x56c]
    add r1, sp, #0xc
    add r0, r5, r0
    mov r5, r0, lsl #0xc
    mov r0, r4
    str r5, [sp, #0xc]
    bl func_ov003_021550c4
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    cmp r0, #0x0
    beq .L_02155090
    str r5, [sp, #0x8]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x8
    ldr r0, [r0, #0x124]
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x18c]
    bl func_ov003_021550c4
.L_02155090:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x0
    bne .L_021550bc
    ldr r0, [r7, #0x194]
    cmp r0, #0x0
    beq .L_021550bc
    str r5, [sp, #0x4]
    ldr r0, [r7, #0x194]
    add r1, sp, #0x4
    bl func_ov003_021550c4
.L_021550bc:
    add sp, sp, #0x3c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov003_02154b78

    .global func_ov003_021550c4
    arm_func_start func_ov003_021550c4
func_ov003_021550c4: ; 0x021550c4
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_021550e0
    mov r1, #0x1
    str r2, [r0, #0x10]
    bx ip
.L_021550e0: .word func_ov003_02153660
    arm_func_end func_ov003_021550c4

    .global func_ov003_021550e4
    arm_func_start func_ov003_021550e4
func_ov003_021550e4: ; 0x021550e4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    bl func_ov003_0214fb7c
    ldr r2, [r7, #0x4]
    mov r1, r0
    ldr r5, [r2, #0x124]
    cmp r5, #0x14
    blt .L_0215511c
    add r0, sp, #0xc
    bl func_ov003_0215523c
    add r0, sp, #0xc
    ldr r1, [r0, #0x0]
    b .L_0215512c
.L_0215511c:
    add r0, sp, #0x8
    bl func_ov003_0215523c
    ldr r0, [sp, #0x8]
    sub r1, r0, #0x21000
.L_0215512c:
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r4, r0, asr #0xc
    add r0, sp, #0x4
    mov r1, r7
    bl func_ov003_0215523c
    ldr r0, [sp, #0x4]
    add r1, r0, r4, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r6, r0, asr #0xc
    cmp r6, #0x260
    blt .L_0215516c
.L_02155160:
    cmp r6, #0x260
    subge r6, r6, #0x280
    bge .L_02155160
.L_0215516c:
    mvn r0, #0x1f
    cmp r6, r0
    bgt .L_02155184
.L_02155178:
    cmp r6, r0
    addle r6, r6, #0x280
    ble .L_02155178
.L_02155184:
    sub r0, r6, r4
    mov r2, r0, lsl #0xc
    add r1, sp, #0x0
    mov r0, r7
    str r2, [sp, #0x0]
    bl func_ov003_021550c4
    ldr r0, [r7, #0x4]
    cmp r5, #0x14
    ldr r7, [r0, #0x10]
    ldr r1, [r7, #0x574]
    blt .L_021551ec
    sub r4, r5, #0x14
    mov r5, #0x1
    tst r1, r5, lsl r4
    beq .L_02155234
    ldr r1, [r7, #0x578]
    tst r1, r5, lsl r4
    bne .L_02155234
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x578]
    orr r0, r0, r5, lsl r4
    str r0, [r7, #0x578]
    b .L_02155234
.L_021551ec:
    mov r4, #0x1
    tst r1, r4, lsl r5
    ldreqb r1, [r7, #0x58a]
    cmpeq r1, r5
    bne .L_02155234
    cmp r6, #0x0
    bge .L_02155234
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0xd8]
    blx r2
    ldrb r0, [r7, #0x58a]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r7, #0x58a]
    ldr r0, [r7, #0x574]
    orr r0, r0, r4, lsl r5
    str r0, [r7, #0x574]
.L_02155234:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov003_021550e4

    .global func_ov003_0215523c
    arm_func_start func_ov003_0215523c
func_ov003_0215523c: ; 0x0215523c
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x50]
    ldr r1, [r1, #0x10]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov003_0215523c

    .global func_ov003_02155250
    arm_func_start func_ov003_02155250
func_ov003_02155250: ; 0x02155250
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x3c
    mov r10, r0
    ldr r0, [r10, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r0, #0x1
    bls .L_021556d0
    ldr r0, [r10, #0x4]
    ldr r7, [r0, #0x10]
    ldr r0, [r7, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r10, #0x4]
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x124]
    ldr r8, [r2, #0x10]
    cmp r0, #0x0
    beq .L_021554a4
    ldrb r0, [r7, #0x58b]
    ldr r1, [r7, #0x56c]
    cmp r0, #0x5
    mov r0, r1, lsr #0x8
    bne .L_021553a8
    mov r6, #0x0
.L_021552b4:
    mov r0, r10
    add r1, r6, #0x3
    bl func_ov003_02154a7c
    mov r4, r0
    ldr r2, [r4, #0x4]
    add r0, sp, #0xc
    mov r1, r4
    ldr r5, [r2, #0x10]
    ldr r9, [r7, #0x56c]
    bl func_ov003_0215523c
    add r1, sp, #0xc
    ldr r2, [r1, #0x0]
    mov r0, r5, lsl #0x8
    add r2, r2, r9, lsl #0xc
    add r1, r0, #0xe0
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    cmp r1, r0, asr #0xc
    ble .L_02155398
    mov r0, r5, lsl #0x3
    rsb r0, r0, #0x14
    adds r0, r6, r0
    bpl .L_02155318
.L_02155310:
    adds r0, r0, #0x14
    bmi .L_02155310
.L_02155318:
    add r1, r8, r0
    ldrb r0, [r7, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d784
    add r1, sp, #0x10
    mov r2, #0x14
    bl func_02051890
    mov r0, #0x0
    strh r0, [sp, #0x24]
    ldr r9, [r4, #0x4]
    ldr r0, [r9, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    add r1, sp, #0x10
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    cmp r5, #0x0
    beq .L_02155398
    ldr r0, [r4, #0x4]
    sub r1, r5, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
.L_02155398:
    add r6, r6, #0x1
    cmp r6, #0x8
    blt .L_021552b4
    b .L_021556d0
.L_021553a8:
    add r0, r0, #0x1
    mov r0, r0, lsl #0x3
    rsb r5, r0, #0x14
    mov r4, #0x0
.L_021553b8:
    mov r0, r10
    add r1, r4, #0x3
    bl func_ov003_02154a7c
    mov r6, r0
    ldr r2, [r6, #0x4]
    add r0, sp, #0x8
    mov r1, r6
    ldr r9, [r2, #0x10]
    bl func_ov003_0215523c
    add r0, sp, #0x8
    ldr r3, [r0, #0x0]
    ldr r0, [r7, #0x56c]
    mov r1, r3, asr #0xb
    add r1, r3, r1, lsr #0x14
    mov r1, r1, asr #0xc
    add r1, r1, #0x20
    mov r2, r9, lsl #0x8
    add r1, r0, r1
    add r0, r2, #0x200
    cmp r1, r0
    bls .L_02155494
    adds r0, r4, r5
    bpl .L_0215541c
.L_02155414:
    adds r0, r0, #0x14
    bmi .L_02155414
.L_0215541c:
    add r1, r8, r0
    ldrb r0, [r7, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d784
    add r1, sp, #0x10
    mov r2, #0x14
    bl func_02051890
    mov r0, #0x0
    strh r0, [sp, #0x24]
    ldr r11, [r6, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r6, #0x4]
    add r1, sp, #0x10
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    ldr r0, [r6, #0x4]
    add r1, r9, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
.L_02155494:
    add r4, r4, #0x1
    cmp r4, #0x8
    blt .L_021553b8
    b .L_021556d0
.L_021554a4:
    ldr r1, [r7, #0x56c]
    cmp r1, #0xa0
    blo .L_021556d0
    ldrb r0, [r7, #0x58b]
    sub r1, r1, #0xa0
    mov r1, r1, lsr #0x8
    cmp r0, #0x5
    bne .L_021555d4
    mov r0, r1, lsl #0x3
    rsb r9, r0, #0x14
    mov r6, #0x0
.L_021554d0:
    mov r0, r10
    add r1, r6, #0x3
    bl func_ov003_02154a7c
    mov r4, r0
    ldr r2, [r4, #0x4]
    add r0, sp, #0x4
    mov r1, r4
    ldr r5, [r2, #0x10]
    ldr r11, [r7, #0x56c]
    bl func_ov003_0215523c
    add r1, sp, #0x4
    ldr r2, [r1, #0x0]
    mov r0, r5, lsl #0x8
    add r1, r0, #0xe0
    add r0, r2, r11, lsl #0xc
    sub r2, r0, #0xa0000
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    cmp r1, r0, asr #0xc
    ble .L_021555c4
    adds r0, r6, r9
    bpl .L_02155530
.L_02155528:
    adds r0, r0, #0x14
    bmi .L_02155528
.L_02155530:
    cmp r0, #0x14
    blt .L_02155544
.L_02155538:
    sub r0, r0, #0x8
    cmp r0, #0x14
    bge .L_02155538
.L_02155544:
    add r1, r8, r0
    ldrb r0, [r7, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d784
    add r1, sp, #0x10
    mov r2, #0x14
    bl func_02051890
    mov r0, #0x0
    strh r0, [sp, #0x24]
    ldr r11, [r4, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    add r1, sp, #0x10
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    cmp r5, #0x0
    beq .L_021555c4
    ldr r0, [r4, #0x4]
    sub r1, r5, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
.L_021555c4:
    add r6, r6, #0x1
    cmp r6, #0x8
    blt .L_021554d0
    b .L_021556d0
.L_021555d4:
    add r0, r1, #0x1
    mov r0, r0, lsl #0x3
    rsb r5, r0, #0x14
    mov r4, #0x0
.L_021555e4:
    mov r0, r10
    add r1, r4, #0x3
    bl func_ov003_02154a7c
    mov r6, r0
    ldr r2, [r6, #0x4]
    add r0, sp, #0x0
    mov r1, r6
    ldr r9, [r2, #0x10]
    bl func_ov003_0215523c
    add r0, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r3, [r7, #0x56c]
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, asr #0xc
    mov r1, r9, lsl #0x8
    sub r2, r3, #0xa0
    add r0, r0, #0x20
    add r2, r2, r0
    add r0, r1, #0x200
    cmp r2, r0
    bls .L_021556c4
    adds r0, r4, r5
    bpl .L_0215564c
.L_02155644:
    adds r0, r0, #0x14
    bmi .L_02155644
.L_0215564c:
    add r1, r8, r0
    ldrb r0, [r7, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d784
    add r1, sp, #0x10
    mov r2, #0x14
    bl func_02051890
    mov r0, #0x0
    strh r0, [sp, #0x24]
    ldr r11, [r6, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r6, #0x4]
    add r1, sp, #0x10
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    ldr r0, [r6, #0x4]
    add r1, r9, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
.L_021556c4:
    add r4, r4, #0x1
    cmp r4, #0x8
    blt .L_021555e4
.L_021556d0:
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov003_02155250

    .global func_ov003_021556d8
    arm_func_start func_ov003_021556d8
func_ov003_021556d8: ; 0x021556d8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    ldr r0, [r10, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r0, #0x3
    blo .L_02155938
    ldr r0, [r10, #0x4]
    ldr r8, [r0, #0x10]
    ldr r0, [r8, #0x4]
    bl func_ov003_0214fb7c
    ldr r2, [r0, #0x4]
    ldr r1, [r8, #0x194]
    add r0, sp, #0x1c
    ldr r9, [r2, #0x10]
    bl func_ov003_0215523c
    add r1, sp, #0x1c
    ldr r0, [r8, #0x56c]
    ldr r1, [r1, #0x0]
    cmp r0, #0xa0
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r4, r0, asr #0xc
    blo .L_02155938
    ldrb r0, [r8, #0x58b]
    cmp r0, #0x5
    bne .L_02155838
    mov r7, #0x0
    mvn r11, #0x1f
.L_02155754:
    mov r0, r10
    add r1, r7, #0x3
    bl func_ov003_02154a7c
    mov r5, r0
    add r0, sp, #0x18
    mov r1, r5
    bl func_ov003_0215523c
    ldr r0, [sp, #0x18]
    add r1, r0, r4, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    cmp r11, r0, asr #0xc
    ble .L_02155828
    add r0, sp, #0x10
    mov r1, r5
    bl func_ov003_0215523c
    add r0, sp, #0x10
    ldr r1, [r0, #0x0]
    mov r0, r5
    add r1, r1, #0x100000
    str r1, [sp, #0x14]
    add r1, sp, #0x14
    bl func_ov003_021550c4
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x10]
    ldr r2, [r0, #0x0]
    add r6, r1, #0x8
    cmp r6, #0x14
    subge r6, r6, #0x14
    ldr r2, [r2, #0x24]
    mov r1, r6
    blx r2
    ldr r0, [r5, #0x4]
    str r0, [sp, #0x0]
    ldr r0, [r0, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, [sp, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    add r0, r9, r6
    ldrb r2, [r0, #0x74]
    ldrb r1, [r8, #0x2]
    ldr r0, [r8, #0x564]
    bl func_ov003_0214d79c
    ldr r2, [r5, #0x4]
    mov r1, r0
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
.L_02155828:
    add r7, r7, #0x1
    cmp r7, #0x8
    blt .L_02155754
    b .L_02155938
.L_02155838:
    mov r5, #0x0
.L_0215583c:
    mov r0, r10
    add r1, r5, #0x3
    bl func_ov003_02154a7c
    mov r6, r0
    ldr r1, [r8, #0x57c]
    mov r0, #0x1
    tst r1, r0, lsl r5
    beq .L_02155870
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02155870:
    add r0, sp, #0xc
    mov r1, r6
    bl func_ov003_0215523c
    ldr r0, [sp, #0xc]
    add r1, r0, r4, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    cmp r0, #0xe0
    ble .L_0215592c
    add r0, sp, #0x4
    mov r1, r6
    bl func_ov003_0215523c
    ldr r1, [sp, #0x4]
    mov r0, r6
    sub r1, r1, #0x100000
    str r1, [sp, #0x8]
    add r1, sp, #0x8
    bl func_ov003_021550c4
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x10]
    ldr r2, [r0, #0x0]
    subs r7, r1, #0x8
    addmi r7, r7, #0x14
    ldr r2, [r2, #0x24]
    mov r1, r7
    blx r2
    ldr r11, [r6, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    add r0, r9, r7
    ldrb r2, [r0, #0x74]
    ldrb r1, [r8, #0x2]
    ldr r0, [r8, #0x564]
    bl func_ov003_0214d79c
    ldr r2, [r6, #0x4]
    mov r1, r0
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
.L_0215592c:
    add r5, r5, #0x1
    cmp r5, #0x8
    blt .L_0215583c
.L_02155938:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov003_021556d8

    .global func_ov003_02155940
    arm_func_start func_ov003_02155940
func_ov003_02155940: ; 0x02155940
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, .L_02155aac
    mov r1, #0x0
    blx func_020101f4
    mov r4, r0
    bl func_ov003_02155ac0
    ldr r1, .L_02155ab0
    ldr r2, .L_02155ab4
    mov r0, #0xe0
    mov r3, #0xd3
    bl func_ov003_02152710
    mov r1, #0xe0
    mov r5, r0
    bl func_ov003_0215271c
    bl func_02020d90
    mov r6, r0
    add r0, sp, #0x0
    mov r1, #0x85
    bl func_ov003_02152754
    mov r0, r6
    add r1, sp, #0x0
    bl func_ov003_02152730
    ldr r1, .L_02155ab8
    mov r0, r6
    bl func_ov003_02152760
    mov r0, r6
    mov r1, r5
    bl func_ov003_02152770
    mov r0, r6
    mov r1, r7
    bl func_ov003_0214fb44
    mov r0, r7
    str r6, [r5, #0x4]
    bl func_ov003_02155acc
    strb r0, [r5, #0x2]
    mov r0, #0x21
    strb r0, [r5, #0x0]
    ldr r0, [r5, #0x4]
    bl func_ov003_0214fb7c
    bl func_ov003_02155adc
    mov r7, r0
    mov r8, #0x0
    b .L_02155a14
.L_021559f4:
    add r1, r7, r8
    ldrb r0, [r5, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d7d4
    cmp r0, #0x0
    streq r8, [r5, #0xd8]
    beq .L_02155a1c
    add r8, r8, #0x1
.L_02155a14:
    cmp r8, #0x14
    blt .L_021559f4
.L_02155a1c:
    mov r0, #0x0
    bl func_02028920
    str r0, [r5, #0x8]
    bl func_020756ac
    str r0, [r5, #0xd0]
    bl func_ov003_02155d40
    mov r0, r5
    bl func_ov003_02156118
    mov r0, r5
    bl func_ov003_021561bc
    mov r0, r5
    bl func_ov003_021564a0
    mov r0, r5
    bl func_ov003_02158004
    mov r0, r5
    bl func_ov003_02156de8
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    beq .L_02155a78
    bl func_ov003_02155ae8
.L_02155a78:
    mvn r0, #0x0
    strb r0, [r5, #0xdc]
    ldrsb r2, [r5, #0xdc]
    ldr r1, .L_02155abc
    mov r0, r4
    strb r2, [r5, #0xdd]
    str r5, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02155aac: .word data_ov003_0215e6a8
.L_02155ab0: .word data_ov003_0215e6b8
.L_02155ab4: .word data_ov003_0215e5a4
.L_02155ab8: .word func_ov003_02155b24
.L_02155abc: .word data_ov003_0215ec34
    arm_func_end func_ov003_02155940

    .global func_ov003_02155ac0
    arm_func_start func_ov003_02155ac0
func_ov003_02155ac0: ; 0x02155ac0
    ldr ip, .L_02155ac8
    bx ip
.L_02155ac8: .word func_ov012_021b65bc
    arm_func_end func_ov003_02155ac0

    .global func_ov003_02155acc
    arm_func_start func_ov003_02155acc
func_ov003_02155acc: ; 0x02155acc
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldrb r0, [r0, #0x1e]
    bx lr
    arm_func_end func_ov003_02155acc

    .global func_ov003_02155adc
    arm_func_start func_ov003_02155adc
func_ov003_02155adc: ; 0x02155adc
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    bx lr
    arm_func_end func_ov003_02155adc

    .global func_ov003_02155ae8
    arm_func_start func_ov003_02155ae8
func_ov003_02155ae8: ; 0x02155ae8
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02155ae8

    .global func_ov003_02155b04
    arm_func_start func_ov003_02155b04
func_ov003_02155b04: ; 0x02155b04
    ldr r3, [r0, #0x4]
    mov r0, #0x1
    mvn r1, r0, lsl r1
    ldr r2, [r3, #0x8bc]
    and r1, r2, r1
    str r1, [r3, #0x8bc]
    strb r0, [r3, #0x901]
    bx lr
    arm_func_end func_ov003_02155b04

    .global func_ov003_02155b24
    arm_func_start func_ov003_02155b24
func_ov003_02155b24: ; 0x02155b24
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02155b48
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02155b48: .word func_ov003_02155d3c
    arm_func_end func_ov003_02155b24

    .global func_ov003_02155b4c
    arm_func_start func_ov003_02155b4c
func_ov003_02155b4c: ; 0x02155b4c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x18]
    tst r0, #0x8
    beq .L_02155ba8
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x18]
    tst r0, #0x20
    moveq r0, #0xf
    streqb r0, [r4, #0x0]
    moveq r5, #0x0
    beq .L_02155bd4
.L_02155ba8:
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x18]
    tst r0, #0x10
    movne r5, #0x2
    bne .L_02155bd4
    tst r0, #0x20
    movne r5, #0x1
    moveq r5, #0x0
.L_02155bd4:
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    ldrb r2, [r4, #0x0]
    mov r3, r5
    mov r1, #0xe
    bl func_ov003_0214d28c
    ldr r0, [r4, #0xd0]
    cmp r0, #0x0
    beq .L_02155c04
    bl func_02075758
    mov r0, #0x0
    str r0, [r4, #0xd0]
.L_02155c04:
    ldr r0, [r4, #0xc4]
    cmp r0, #0x0
    beq .L_02155c1c
    bl func_02074608
    mov r0, #0x0
    str r0, [r4, #0xc4]
.L_02155c1c:
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    beq .L_02155c34
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r4, #0xcc]
.L_02155c34:
    ldr r0, [r4, #0xc8]
    cmp r0, #0x0
    beq .L_02155c4c
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r4, #0xc8]
.L_02155c4c:
    ldr r0, .L_02155d38
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0xc0]
    cmp r0, #0x0
    beq .L_02155c78
    bl func_02034d7c
    mov r0, #0x0
    str r0, [r4, #0xc0]
.L_02155c78:
    mov r6, #0x0
    mov r5, r6
.L_02155c80:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_02155ca4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x34]
.L_02155ca4:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02155c80
    mov r6, #0x0
    mov r5, r6
.L_02155cb8:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_02155cdc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0xc]
.L_02155cdc:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_02155cb8
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02155d08
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_02155d08:
    blx func_ov012_021b65cc
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    bl func_ov003_02155b04
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    bl func_ov003_02155b04
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_02155d38: .word data_ov012_021d5154
    arm_func_end func_ov003_02155b4c

    .global func_ov003_02155d3c
    arm_func_start func_ov003_02155d3c
func_ov003_02155d3c: ; 0x02155d3c
    bx lr
    arm_func_end func_ov003_02155d3c

    .global func_ov003_02155d40
    arm_func_start func_ov003_02155d40
func_ov003_02155d40: ; 0x02155d40
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x24
    ldr r0, .L_0215610c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    bl func_0203d4e4
    mov r0, #0x0
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    str r0, [sp, #0x20]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x20
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3000
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x1c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    ldr r0, [r4, #0x4]
    mov r1, #0x40
    mov r2, #0x20
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2000
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x18
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x0
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1000
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x14
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3000
    str r0, [sp, #0x10]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    ldr r0, [r4, #0x4]
    mov r1, #0x40
    mov r2, #0x20
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x4]
    add r1, sp, #0xc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    ldr r0, [r4, #0x4]
    mov r1, #0x40
    mov r2, #0x20
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2000
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_0203d478
    ldr r0, [r4, #0x4]
    mov r1, #0x40
    mov r2, #0x20
    bl func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1000
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, .L_02156110
    ldr r0, [r0, #0x4]
    tst r0, #0x1
    bne .L_021560b0
    ldr r0, .L_02156114
    mov ip, #0xac
    mov r1, #0x4
    mov r2, #0xc
    mov r3, #0xea
    str ip, [sp, #0x0]
    bl func_ov003_0214ee3c
    ldr r0, .L_02156110
    ldr r1, [r0, #0x4]
    orr r1, r1, #0x1
    str r1, [r0, #0x4]
.L_021560b0:
    bl func_0203b3f4
    ldr r4, [r0, #0x88]
    ldr r2, .L_02156114
    mov r0, r4
    mov r1, #0x0
    bl func_ov003_02152e64
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0x901]
    strb r2, [r0, #0x8fd]
    ldr r1, [r4, #0x4]
    mov r0, #0x15
    strb r2, [r1, #0x901]
    str r0, [r1, #0x8c8]
    ldr r1, [r4, #0x4]
    mov r0, #0x1a
    strb r2, [r1, #0x901]
    str r0, [r1, #0x8d4]
    ldr r0, [r4, #0x4]
    strb r2, [r0, #0x8ff]
    strb r2, [r0, #0x901]
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, pc}
.L_0215610c: .word data_020a0f64
.L_02156110: .word data_ov003_0215ec34
.L_02156114: .word data_ov003_0215e410
    arm_func_end func_ov003_02155d40

    .global func_ov003_02156118
    arm_func_start func_ov003_02156118
func_ov003_02156118: ; 0x02156118
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r7, .L_021561ac
    ldr r6, .L_021561b0
    ldr r5, .L_021561b4
    mov r4, r0
    mov r8, #0x0
.L_02156130:
    cmp r8, #0x3
    beq .L_02156168
    cmp r8, #0x2
    ldrb r0, [r7, r8]
    blt .L_0215614c
    bl func_0203b424
    b .L_02156150
.L_0215614c:
    bl func_0203b414
.L_02156150:
    ldr r2, [r0, #0x88]
    ldr r0, [r6, r8, lsl #0x2]
    ldr r1, [r5, r8, lsl #0x2]
    bl func_ov003_0214d3a8
    add r1, r4, r8, lsl #0x2
    str r0, [r1, #0x1c]
.L_02156168:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_02156130
    mov r7, #0x0
    ldr r6, .L_021561b8
    mov r5, r7
.L_02156180:
    ldr r0, [r6, r7, lsl #0x2]
    mov r1, r5
    blx func_020101f4
    add r1, r4, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0xc]
    cmp r7, #0x4
    blt .L_02156180
    mov r0, #0x0
    str r0, [r4, #0xc0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021561ac: .word data_ov003_0215e3e8
.L_021561b0: .word data_ov003_0215e428
.L_021561b4: .word data_ov003_0215e43c
.L_021561b8: .word data_ov003_0215e418
    arm_func_end func_ov003_02156118

    .global func_ov003_021561bc
    arm_func_start func_ov003_021561bc
func_ov003_021561bc: ; 0x021561bc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x14
    mov r4, r0
    bl func_ov003_0214d6b0
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x100
    str r1, [r0, #0x124]
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    str r6, [r4, #0x34]
    mov r0, #0x100
    str r0, [sp, #0xc]
    mov r0, #0xc0
    str r0, [sp, #0x10]
    bl func_0203b3f4
    mov r2, r0
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r1, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r6
    mov r2, #0x510000
    mov r3, #0x16
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0xab]
    ldr r0, [r5, #0x4]
    mov r1, #0x10
    blx func_ov012_021b77a8
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_02156458
    ldr r2, .L_0215645c
    mov r0, #0x0
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r5
    bl func_02020e98
    ldr r0, [r5, #0x4]
    ldr r2, .L_02156460
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_02156464
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156468
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156468
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215646c
    blx func_ov012_021b3fc4
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    str r5, [r4, #0x94]
    mov r1, #0x80
    mov r0, #0x0
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r1, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    ldrb r5, [r4, #0x2]
    ldr r3, .L_02156470
    mov r0, r6
    ldr r3, [r3, r5, lsl #0x2]
    mov r2, #0x840000
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r2, [r5, #0x4]
    mov r3, #0x1
    str r3, [r2, #0x124]
    ldr r1, .L_02156474
    str r5, [r4, #0x90]
    ldr r1, [r1, #0x0]
    mov r0, r6
    bl func_ov003_0214e8bc
    mov r10, r0
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r10, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x4]
    ldr r1, .L_02156478
    bl func_02028384
    mov r0, #0x84000
    str r0, [sp, #0x8]
    mov r0, r10
    add r1, sp, #0x8
    bl func_ov003_02152730
    mov r9, #0x0
    ldr r0, [r10, #0x4]
    mov r6, r9
    str r9, [r0, #0x124]
    str r10, [r4, #0x8c]
    mov r7, #0x4
    mov r5, #0x1
.L_02156408:
    cmp r9, #0x0
    movne r0, r7
    moveq r0, r6
    add r0, r4, r0, lsl #0x2
    ldr r8, [r0, #0x1c]
    cmp r8, #0x0
    beq .L_02156444
    ldr r0, [r8, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r10
    mov r1, r8
    bl func_ov003_0214e908
.L_02156444:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_02156408
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_02156458: .word data_ov003_0215e46c
.L_0215645c: .word data_02093c8c
.L_02156460: .word func_ov003_02158670
.L_02156464: .word func_ov003_02158688
.L_02156468: .word 0x510014
.L_0215646c: .word 0x510015
.L_02156470: .word data_ov003_0215d520
.L_02156474: .word data_ov012_021d5154
.L_02156478: .word func_ov003_0215872c
    arm_func_end func_ov003_021561bc

    .global func_ov003_0215647c
    arm_func_start func_ov003_0215647c
func_ov003_0215647c: ; 0x0215647c
    stmdb sp!, {r4, lr}
    mov r2, #0x0
    mov r4, r0
    bl func_02014604
    ldr r1, .L_0215649c
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0215649c: .word data_020958dc
    arm_func_end func_ov003_0215647c

    .global func_ov003_021564a0
    arm_func_start func_ov003_021564a0
func_ov003_021564a0: ; 0x021564a0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc4
    mov r10, r0
    bl func_ov003_0214d6b0
    mov r4, r0
    ldr r2, [r4, #0x4]
    ldr r3, .L_02156d80
    ldr r1, .L_02156d84
    str r3, [r2, #0x124]
    str r4, [r10, #0x38]
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r5, r0
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r6, [r5, #0x4]
    ldr r0, .L_02156d88
    bl func_020326b0
    mov r3, r0
    mov r0, r6
    ldr r6, [r0, #0x0]
    ldr r1, .L_02156d88
    ldr r6, [r6, #0x40]
    add r2, sp, #0x8
    blx r6
    mov r1, r0
    ldr r2, [sp, #0x8]
    add r0, sp, #0xac
    bl func_0202c4a4
    mov r0, #0x0
    str r0, [sp, #0xa4]
    mov r0, #0x100000
    str r0, [sp, #0xa8]
    mov r0, r5
    add r1, sp, #0xa8
    add r2, sp, #0xa4
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0xac]
    ldr r3, [sp, #0xb0]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x9c]
    str r0, [sp, #0xa0]
    mov r0, r5
    add r1, sp, #0xa0
    add r2, sp, #0x9c
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0xac]
    ldr r3, [sp, #0xb0]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0xac]
    ldr r2, .L_02156d8c
    ldr r3, [sp, #0xb0]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    mov r1, #0x3
    str r1, [r0, #0x124]
    mov r6, #0x0
    mov r3, #0x100000
    add r1, sp, #0x98
    add r2, sp, #0x94
    mov r0, r5
    str r6, [sp, #0x94]
    str r3, [sp, #0x98]
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r2, .L_02156d90
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_02156d94
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156d98
    bl func_02028384
    mov r0, #0x84000
    str r0, [sp, #0x90]
    mov r0, r5
    add r1, sp, #0x90
    bl func_ov003_02152730
    ldr r0, [r5, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r8, r6
    str r5, [r10, #0x98]
    mov r6, #0x1
    mov r7, #0x2
.L_0215664c:
    cmp r8, #0x0
    movne r0, r7
    moveq r0, r6
    add r0, r10, r0, lsl #0x2
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    beq .L_02156670
    mov r0, r5
    bl func_ov003_0214e908
.L_02156670:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_0215664c
    mov r7, #0x0
.L_02156680:
    cmp r7, #0x0
    ldrb r0, [r10, #0x2]
    beq .L_02156698
    bl func_ov003_0214d838
    and r0, r0, #0xff
    b .L_0215669c
.L_02156698:
    bl func_ov003_0214d820
.L_0215669c:
    add r0, r0, #0x1
    and r6, r0, #0xff
    mov r0, r6
    mov r1, #0xa
    bl func_0200d12c
    and r5, r0, #0xff
    mov r0, r6
    mov r1, #0xa
    bl func_0200d12c
    and r6, r1, #0xff
    ldr r1, .L_02156d84
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    ldr r1, [r10, #0x98]
    mov r8, r0
    bl func_ov003_0214fb44
    ldr r0, [r8, #0x4]
    ldr r2, .L_02156d90
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r8, #0x4]
    add r1, r7, #0x5
    str r1, [r0, #0x124]
    mov r0, #0x3e000
    cmp r7, #0x0
    str r0, [sp, #0x88]
    movne r0, #0x44
    moveq r0, #0x12
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x8c]
    mov r0, r8
    add r1, sp, #0x8c
    add r2, sp, #0x88
    bl func_ov003_0214e990
    cmp r7, #0x0
    add r0, r10, r7, lsl #0x2
    movne r9, #0xe
    moveq r9, #0x4
    str r8, [r0, #0xa0]
    cmp r5, #0x0
    beq .L_0215679c
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x840000
    add r2, r9, r5
    mov r3, #0x20
    bl func_ov003_0214d4a4
    mov r1, #0x8000
    str r1, [sp, #0x80]
    mov r1, #0x0
    str r1, [sp, #0x84]
    mov r11, r0
    add r1, sp, #0x84
    add r2, sp, #0x80
    bl func_ov003_0214e990
    mov r1, r11
    mov r0, r8
    bl func_ov003_0214e908
.L_0215679c:
    bl func_0203b404
    ldr r0, [r0, #0x88]
    add r2, r9, r6
    mov r1, #0x840000
    mov r3, #0x20
    bl func_ov003_0214d4a4
    cmp r5, #0x0
    mov r5, r0
    mov r1, #0x8000
    beq .L_021567e0
    str r1, [sp, #0x78]
    mov r1, #0xa000
    str r1, [sp, #0x7c]
    add r1, sp, #0x7c
    add r2, sp, #0x78
    bl func_ov003_0214e990
    b .L_021567f8
.L_021567e0:
    str r1, [sp, #0x70]
    mov r1, #0x6000
    str r1, [sp, #0x74]
    add r1, sp, #0x74
    add r2, sp, #0x70
    bl func_ov003_0214e990
.L_021567f8:
    mov r0, r8
    mov r1, r5
    bl func_ov003_0214e908
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_02156680
    mov r8, #0x0
    mov r5, #0xca000
    mov r11, #0x8000
.L_0215681c:
    ldrb r0, [r10, #0x2]
    mov r1, r8
    bl func_ov003_0214d850
    ldr r1, .L_02156d84
    mov r7, r0
    ldr r1, [r1, #0x0]
    mov r0, r4
    bl func_ov003_0214e8bc
    ldr r1, [r10, #0x98]
    mov r6, r0
    bl func_ov003_0214fb44
    ldr r0, [r6, #0x4]
    ldr r2, .L_02156d90
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r6, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x13
    mul r0, r8, r0
    add r0, r0, #0x40
    ldr r1, [r6, #0x4]
    add r2, r8, #0x8
    str r2, [r1, #0x124]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x68]
    mov r0, r6
    add r1, sp, #0x6c
    add r2, sp, #0x68
    str r5, [sp, #0x6c]
    bl func_ov003_0214e990
    add r0, r10, r8, lsl #0x2
    str r6, [r0, #0xac]
    bl func_0203b404
    mov r9, r0
    mov r0, r7
    mov r1, #0xa
    bl func_0200d12c
    mov r1, r0
    and r1, r1, #0xff
    add r2, r1, #0x4
    ldr r0, [r9, #0x88]
    mov r1, #0x840000
    mov r3, #0x20
    bl func_ov003_0214d4a4
    mov r1, #0x0
    str r1, [sp, #0x64]
    mov r9, r0
    add r1, sp, #0x64
    add r2, sp, #0x60
    str r11, [sp, #0x60]
    bl func_ov003_0214e990
    mov r1, r9
    mov r0, r6
    bl func_ov003_0214e908
    bl func_0203b404
    mov r9, r0
    mov r0, r7
    mov r1, #0xa
    bl func_0200d12c
    and r1, r1, #0xff
    add r2, r1, #0x4
    ldr r0, [r9, #0x88]
    mov r1, #0x840000
    mov r3, #0x20
    bl func_ov003_0214d4a4
    mov r1, #0x8000
    str r1, [sp, #0x58]
    mov r1, #0xd000
    str r1, [sp, #0x5c]
    mov r7, r0
    add r1, sp, #0x5c
    add r2, sp, #0x58
    bl func_ov003_0214e990
    mov r0, r6
    mov r1, r7
    bl func_ov003_0214e908
    add r8, r8, #0x1
    cmp r8, #0x4
    blt .L_0215681c
    ldrb r0, [r10, #0x2]
    bl func_ov003_0214d774
    blx func_02072224
    mov r1, #0x64
    mov r5, r0
    bl func_0200d12c
    and r7, r0, #0xff
    mov r0, #0x64
    smulbb r0, r7, r0
    sub r5, r5, r0
    mov r0, r5
    mov r1, #0xa
    bl func_0200d12c
    and r8, r0, #0xff
    mov r0, #0xa
    smulbb r0, r8, r0
    ldr r1, .L_02156d84
    sub r0, r5, r0
    and r5, r0, #0xff
    ldr r1, [r1, #0x0]
    mov r0, r4
    bl func_ov003_0214e8bc
    ldr r1, [r10, #0x98]
    mov r9, r0
    bl func_ov003_0214fb44
    ldr r0, [r9, #0x4]
    ldr r2, .L_02156d90
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r9, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r9, #0x4]
    mov r2, #0x7
    str r2, [r1, #0x124]
    mov r0, #0xa8000
    str r0, [sp, #0x50]
    mov r0, #0xc4000
    str r0, [sp, #0x54]
    mov r0, r9
    add r1, sp, #0x54
    add r2, sp, #0x50
    bl func_ov003_0214e990
    str r9, [r10, #0xa8]
    cmp r7, #0x0
    mov r6, #0xc
    beq .L_02156a70
    bl func_0203b404
    ldr r0, [r0, #0x88]
    add r2, r7, #0x4
    mov r1, #0x840000
    mov r3, #0x20
    bl func_ov003_0214d4a4
    mov r1, #0x8000
    str r1, [sp, #0x48]
    mov r1, #0x0
    str r1, [sp, #0x4c]
    add r1, sp, #0x4c
    mov r6, r0
    add r2, sp, #0x48
    bl func_ov003_0214e990
    mov r1, r6
    mov r0, r9
    bl func_ov003_0214e908
    mov r6, #0x18
.L_02156a70:
    cmp r7, #0x0
    cmpeq r8, #0x0
    beq .L_02156ae8
    bl func_0203b404
    ldr r0, [r0, #0x88]
    add r2, r8, #0x4
    mov r1, #0x840000
    mov r3, #0x21
    bl func_ov003_0214d4a4
    mov r8, r0
    cmp r7, #0x0
    beq .L_02156ac0
    mov r7, #0x8000
    mov r3, #0xc000
    add r1, sp, #0x44
    add r2, sp, #0x40
    str r7, [sp, #0x40]
    str r3, [sp, #0x44]
    bl func_ov003_0214e990
    b .L_02156adc
.L_02156ac0:
    mov r3, #0x8000
    add r1, sp, #0x3c
    add r2, sp, #0x38
    str r3, [sp, #0x38]
    str r3, [sp, #0x3c]
    bl func_ov003_0214e990
    mov r6, #0x14
.L_02156adc:
    mov r0, r9
    mov r1, r8
    bl func_ov003_0214e908
.L_02156ae8:
    bl func_0203b404
    ldr r0, [r0, #0x88]
    add r2, r5, #0x4
    mov r1, #0x840000
    mov r3, #0x22
    bl func_ov003_0214d4a4
    mov r5, #0x8000
    mov r3, r6, lsl #0xc
    str r5, [sp, #0x30]
    add r1, sp, #0x34
    add r2, sp, #0x30
    mov r5, r0
    str r3, [sp, #0x34]
    bl func_ov003_0214e990
    mov r0, r9
    mov r1, r5
    bl func_ov003_0214e908
    ldr r1, .L_02156d84
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    ldr r1, [r10, #0x98]
    mov r7, r0
    bl func_ov003_0214fb44
    ldr r0, [r7, #0x4]
    ldr r2, .L_02156d90
    mov r1, #0x10
    blx func_ov012_021b65e8
    mov r0, #0x84000
    str r0, [sp, #0x2c]
    mov r0, r7
    add r1, sp, #0x2c
    bl func_ov003_02152730
    ldr r0, [r7, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r7, #0x4]
    mov r2, #0xc
    str r2, [r1, #0x124]
    mov r0, #0x28000
    str r0, [sp, #0x24]
    mov r0, #0x15000
    str r0, [sp, #0x28]
    mov r0, r7
    add r1, sp, #0x28
    add r2, sp, #0x24
    bl func_ov003_0214e990
    str r7, [r10, #0xbc]
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    mov r1, #0xa
    ldr r0, [r0, #0x10]
    ldrb r5, [r0, #0x20]
    mov r0, r5
    bl func_0200d12c
    and r4, r0, #0xff
    mov r0, #0xa
    smulbb r0, r4, r0
    sub r0, r5, r0
    and r5, r0, #0xff
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov003_0214d47c
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r8, [r6, #0x4]
    ldr r0, [r8, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r1, .L_02156d9c
    add r0, sp, #0xb4
    bl func_02074000
    cmp r4, #0x0
    beq .L_02156c74
    ldr r1, .L_02156da0
    add r0, sp, #0xb4
    ldr r1, [r1, r4, lsl #0x2]
    bl func_020741bc
.L_02156c74:
    ldr r1, .L_02156da0
    add r0, sp, #0xb4
    ldr r1, [r1, r5, lsl #0x2]
    bl func_020741bc
    ldr r1, .L_02156da4
    add r0, sp, #0xb4
    bl func_020741bc
    ldr r0, [r6, #0x4]
    add r1, sp, #0xb4
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    cmp r4, #0x0
    beq .L_02156cd0
    mov r3, #0x0
    add r1, sp, #0x20
    add r2, sp, #0x1c
    mov r0, r6
    str r3, [sp, #0x1c]
    str r3, [sp, #0x20]
    bl func_ov003_0214e990
    b .L_02156cf0
.L_02156cd0:
    mov r4, #0x0
    mov r3, #0x6000
    add r1, sp, #0x18
    add r2, sp, #0x14
    mov r0, r6
    str r4, [sp, #0x14]
    str r3, [sp, #0x18]
    bl func_ov003_0214e990
.L_02156cf0:
    bl func_ov003_0214cfc8
    mov r0, r7
    mov r1, r6
    bl func_ov003_0214e908
    bl func_0203b3e4
    mov r1, #0x1
    str r1, [sp, #0x0]
    ldr r1, .L_02156da8
    ldr r2, [r0, #0x88]
    ldrsb r1, [r1, #0x12]
    mov r0, #0x3
    mov r3, #0x0
    bl func_02074580
    mov r1, #0x0
    mov r4, r0
    bl func_ov003_02156dac
    mov r0, #0x80000
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x8]
    add r1, sp, #0x4
    bl func_ov003_0214d52c
    ldr r5, [r4, #0x8]
    mov r0, #0xa0000
    str r0, [sp, #0xc]
    mov r0, #0x30000
    str r0, [sp, #0x10]
    mov r0, r5
    add r1, sp, #0x10
    add r2, sp, #0xc
    bl func_ov003_0214e990
    ldr r1, [r10, #0x98]
    mov r0, r5
    bl func_ov003_0214fb44
    str r4, [r10, #0xc4]
    add sp, sp, #0xc4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02156d80: .word 0x101
.L_02156d84: .word data_ov012_021d5154
.L_02156d88: .word data_ov003_0215e6d8
.L_02156d8c: .word 0x494c
.L_02156d90: .word func_ov003_0215877c
.L_02156d94: .word func_ov003_02158800
.L_02156d98: .word func_ov003_02158888
.L_02156d9c: .word data_ov003_0215e6e4
.L_02156da0: .word data_ov003_0215e48c
.L_02156da4: .word data_ov003_0215e6e8
.L_02156da8: .word data_020afedc
    arm_func_end func_ov003_021564a0

    .global func_ov003_02156dac
    arm_func_start func_ov003_02156dac
func_ov003_02156dac: ; 0x02156dac
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    ldr r2, [r4, #0x88]
    ldr r0, [r0, #0x4]
    add r1, r2, r1
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_02156dac

    .global func_ov003_02156de8
    arm_func_start func_ov003_02156de8
func_ov003_02156de8: ; 0x02156de8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x184
    mov r10, r0
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r5, [r10, #0x38]
    ldr r4, .L_02157c5c
    mov r0, #0x190
    ldr r1, .L_02157c60
    ldr r2, .L_02157c64
    sub r3, r0, #0x37
    ldr r6, [r4, #0x0]
    ldr r4, [r5, #0x4]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02156e38
    ldr r3, .L_02157c68
    mov r1, r4
    mov r2, r6
    blx func_ov012_021ae114
.L_02156e38:
    bl func_ov003_0214d47c
    mov r4, r0
    ldr r2, [r4, #0x4]
    mov r1, #0xe0
    str r1, [r2, #0x170]
    mov r1, #0x20
    str r1, [r2, #0x174]
    ldr r1, [r4, #0x4]
    mov r2, #0x5
    str r2, [r1, #0x180]
    ldr r1, [r10, #0x98]
    bl func_ov003_0214fb44
    mov r5, #0xc000
    mov r3, #0x4000
    add r1, sp, #0x100
    add r2, sp, #0xfc
    mov r0, r4
    str r5, [sp, #0xfc]
    str r3, [sp, #0x100]
    bl func_ov003_0214e990
    mov r0, r4
    mov r1, #0x0
    bl func_ov003_02157d04
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0x114]
    ldr r0, [r4, #0x4]
    mov r1, r10
    str r2, [r0, #0x13c]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157c6c
    bl func_02028384
    mov r0, #0x82000
    str r0, [sp, #0xf8]
    mov r0, r4
    add r1, sp, #0xf8
    bl func_ov003_02152730
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0x140]
    ldr r0, [r4, #0x4]
    strb r1, [r0, #0x141]
    ldr r0, [r4, #0x4]
    str r1, [r0, #0x144]
    str r4, [r10, #0x30]
    ldr r0, [r10, #0x4]
    ldr r5, [r10, #0x38]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    mov r0, r5
    ldr r8, [r1, #0x10]
    ldr r1, .L_02157c5c
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r1, #0x0
    mov r7, r0
    str r1, [sp, #0xe0]
    str r1, [sp, #0xdc]
    add r1, sp, #0xdc
    add r2, sp, #0xe0
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r2, #0x84000
    add r1, sp, #0xe4
    mov r0, r7
    str r2, [sp, #0xe4]
    bl func_ov003_02152730
    ldr r0, [r7, #0x4]
    ldr r1, .L_02157c70
    bl func_02028384
    ldr r0, [r7, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r10, #0x98]
    mov r0, r7
    bl func_ov003_0214fb44
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    bl func_02036ab8
    bl func_ov003_0214d47c
    mov r1, #0x1c000
    str r1, [sp, #0xec]
    mov r1, #0x1a000
    str r1, [sp, #0xe8]
    mov r9, r0
    add r1, sp, #0xe8
    add r2, sp, #0xec
    bl func_ov003_0214e990
    ldr r0, [r9, #0x4]
    mov r1, #0x20
    ldr r0, [r0, #0x64]
    mov r2, r1
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xa4]
    blx r3
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x7c]
    blx r2
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r7
    mov r1, r9
    bl func_ov003_0214e908
    mov r5, #0x0
.L_02157020:
    ldr r2, .L_02157c74
    mov r3, #0x0
    mov r0, #0x100
    mov r1, #0x10
    str r3, [sp, #0x0]
    bl func_ov012_021ca3a4
    mov r2, #0x3000
    add r1, sp, #0x118
    strh r2, [r1, #0x2c]
    add r1, r8, r5
    mov r6, r0
    ldrb r0, [r10, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d784
    add r2, sp, #0x144
    mov r1, #0x0
    add r3, r2, r5, lsl #0x1
    b .L_02157084
.L_02157068:
    mov r11, r1, lsl #0x1
    ldrh r2, [r0, r11]
    strh r2, [r3, #0x2]
    ldrh r2, [r0, r11]
    cmp r2, #0x0
    beq .L_0215708c
    add r1, r1, #0x1
.L_02157084:
    cmp r1, #0xa
    blt .L_02157068
.L_0215708c:
    cmp r1, #0xa
    addeq r0, sp, #0x144
    moveq r2, #0x0
    addeq r0, r0, r1, lsl #0x1
    streqh r2, [r0, #0x2]
    ldr r11, [r6, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    add r1, sp, #0x144
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    mov r0, r6
    mov r1, r9
    bl func_ov003_0214fb44
    mov r0, r5, lsl #0x11
    str r0, [sp, #0xf4]
    mov r0, #0x0
    str r0, [sp, #0xf0]
    mov r0, r6
    add r1, sp, #0xf0
    add r2, sp, #0xf4
    bl func_ov003_0214e990
    mov r1, r6
    mov r0, r7
    bl func_ov003_0214e908
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_02157020
    bl func_ov003_0214cfc8
    ldr r0, [r10, #0x4]
    ldr r5, [r10, #0x38]
    bl func_ov003_0214fb7c
    ldr r2, [r0, #0x4]
    ldr r1, .L_02157c5c
    mov r0, r5
    ldr r1, [r1, #0x0]
    ldr r8, [r2, #0x10]
    bl func_ov003_0214e8bc
    mov r2, #0x0
    add r1, sp, #0xc0
    str r2, [sp, #0xc4]
    str r2, [sp, #0xc0]
    add r2, sp, #0xc4
    mov r7, r0
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x84000
    str r0, [sp, #0xc8]
    mov r0, r7
    add r1, sp, #0xc8
    bl func_ov003_02152730
    ldr r0, [r7, #0x4]
    ldr r1, .L_02157c78
    bl func_02028384
    ldr r0, [r7, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r10, #0x98]
    mov r0, r7
    bl func_ov003_0214fb44
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    bl func_02036ab8
    bl func_ov003_0214d47c
    mov r1, #0xf000
    str r1, [sp, #0xd0]
    mov r1, #0x1a000
    str r1, [sp, #0xcc]
    mov r9, r0
    add r1, sp, #0xcc
    add r2, sp, #0xd0
    bl func_ov003_0214e990
    ldr r0, [r9, #0x4]
    mov r1, #0x20
    ldr r0, [r0, #0x64]
    mov r2, r1
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xa4]
    blx r3
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x7c]
    blx r2
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r7
    mov r1, r9
    bl func_ov003_0214e908
    mov r6, #0x0
.L_02157278:
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_02157c7c
    mov r0, #0xa0
    mov r1, #0x10
    mov r3, #0x0
    bl func_ov012_021ca3a4
    mov r5, r0
    ldr r1, .L_02157c80
    add r0, sp, #0x104
    bl func_02074000
    add r2, r8, r6
    ldrb r1, [r10, #0x2]
    ldrb r2, [r2, #0x74]
    ldr r0, [r10, #0xd0]
    bl func_ov003_0214d79c
    mov r1, r0
    add r0, sp, #0x104
    bl func_020741bc
    ldr r11, [r5, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    add r1, sp, #0x104
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    mov r0, r5
    mov r1, r9
    bl func_ov003_0214fb44
    mov r0, #0x0
    str r0, [sp, #0xd4]
    mov r0, r6, lsl #0x11
    str r0, [sp, #0xd8]
    mov r0, r5
    add r1, sp, #0xd4
    add r2, sp, #0xd8
    bl func_ov003_0214e990
    mov r1, r5
    mov r0, r7
    bl func_ov003_0214e908
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_02157278
    bl func_ov003_0214cfc8
    mov r9, #0x0
    ldr r11, .L_02157c5c
    str r9, [r10, #0xcc]
.L_02157380:
    ldr r0, [r4, #0x4]
    blx func_ov012_021ae3a4
    bl func_ov003_0214d47c
    mov r8, r0
    mov r1, #0x0
    bl func_ov003_02157d04
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r10, r9, lsl #0x2
    str r8, [r0, #0x3c]
    ldr r1, [r11, #0x0]
    mov r0, r8
    bl func_ov003_0214e8bc
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x4]
    mov r0, r6
    str r9, [r1, #0x124]
    mov r1, #0x0
    str r1, [sp, #0xb0]
    str r1, [sp, #0xac]
    add r1, sp, #0xac
    add r2, sp, #0xb0
    bl func_ov003_0214e990
    mov r0, #0xe0000
    str r0, [sp, #0xb4]
    mov r0, r6
    add r1, sp, #0xb4
    bl func_ov003_0214d52c
    ldr r0, [r6, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0xd8]
    cmp r0, r9
    ldr r0, [r6, #0x4]
    bne .L_02157440
    mov r1, #0x1
    blx func_ov012_021b6214
    b .L_02157448
.L_02157440:
    mov r1, #0x0
    blx func_ov012_021b6214
.L_02157448:
    ldr r1, .L_02157c84
    ldr r2, .L_02157c88
    mov r0, #0x0
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r6
    bl func_02020e98
    ldr r1, [r6, #0x4]
    ldr r0, .L_02157c8c
    str r0, [r1, #0xdc]
    bl func_0203b3f4
    ldr r1, .L_02157c90
    ldr r0, [r0, #0x88]
    add r1, r1, #0x60000
    mov r2, #0x0
    mov r3, #0xe0
    bl func_ov003_0214d4a4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x10000
    str r0, [sp, #0xbc]
    mov r0, #0x6c000
    str r0, [sp, #0xb8]
    mov r0, r5
    add r1, sp, #0xb8
    add r2, sp, #0xbc
    bl func_ov003_0214e990
    mov r1, r5
    mov r0, r6
    bl func_ov003_0214e908
    ldr r0, [r8, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r2, [r8, #0x4]
    ldr r1, .L_02157c94
    mov r0, r8
    str r1, [r2, #0xdc]
    ldr r2, [r8, #0x4]
    ldr r1, .L_02157c98
    str r1, [r2, #0xe0]
    ldr r1, [r11, #0x0]
    bl func_ov003_0214e8bc
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x4]
    mov r0, r6
    str r9, [r1, #0x124]
    mov r1, #0x0
    str r1, [sp, #0x84]
    str r1, [sp, #0x80]
    add r1, sp, #0x80
    add r2, sp, #0x84
    bl func_ov003_0214e990
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    mov r0, #0xd8000
    str r0, [sp, #0x88]
    mov r0, r6
    add r1, sp, #0x88
    bl func_ov003_0214d52c
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldrb r1, [r10, #0x2]
    mov r2, r9
    bl func_ov003_02157f80
    mov r5, r0
    cmp r5, #0x3
    blo .L_02157684
    add r7, r5, #0x1
    mov r0, r7
    mov r1, #0xa
    bl func_0200d12c
    movs r5, r0
    mov r0, #0xa
    mul r0, r5, r0
    sub r7, r7, r0
    beq .L_02157604
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157c90
    add r2, r5, #0x1b
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    mov r1, #0x10000
    str r1, [sp, #0x90]
    mov r1, #0xe000
    str r1, [sp, #0x8c]
    str r0, [sp, #0x10]
    add r1, sp, #0x8c
    add r2, sp, #0x90
    bl func_ov003_0214e990
    ldr r0, [sp, #0x10]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x10]
    mov r0, r6
    bl func_ov003_0214e908
.L_02157604:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157c90
    add r2, r7, #0x1b
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    cmp r5, #0x0
    mov r5, r0
    mov r1, #0x10000
    beq .L_02157648
    str r1, [sp, #0x98]
    mov r1, #0x16000
    str r1, [sp, #0x94]
    add r1, sp, #0x94
    add r2, sp, #0x98
    bl func_ov003_0214e990
    b .L_02157660
.L_02157648:
    str r1, [sp, #0xa0]
    mov r1, #0x12000
    str r1, [sp, #0x9c]
    add r1, sp, #0x9c
    add r2, sp, #0xa0
    bl func_ov003_0214e990
.L_02157660:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r6
    mov r1, r5
    bl func_ov003_0214e908
    b .L_021576dc
.L_02157684:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157c90
    add r2, r5, #0x18
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    mov r1, #0x14000
    str r1, [sp, #0xa8]
    mov r1, #0x11000
    str r1, [sp, #0xa4]
    mov r5, r0
    add r1, sp, #0xa4
    add r2, sp, #0xa8
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r6
    mov r1, r5
    bl func_ov003_0214e908
.L_021576dc:
    ldr r1, [r11, #0x0]
    mov r0, r8
    bl func_ov003_0214e8bc
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r7, #0x4]
    mov r0, r7
    str r9, [r1, #0x124]
    mov r1, #0x0
    str r1, [sp, #0x58]
    mov r1, #0xc7000
    str r1, [sp, #0x54]
    add r1, sp, #0x54
    add r2, sp, #0x58
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    mov r0, #0xd8000
    str r0, [sp, #0x5c]
    mov r0, r7
    add r1, sp, #0x5c
    bl func_ov003_0214d52c
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    mov r1, #0x64
    ldr r0, [r0, #0x10]
    add r0, r0, r9, lsl #0x1
    ldrsh r5, [r0, #0x88]
    mov r0, r5
    bl func_0200d12c
    mov r6, r0
    mov r0, #0x64
    mul r0, r6, r0
    sub r0, r5, r0
    mov r1, #0xa
    str r0, [sp, #0x4]
    bl func_0200d12c
    mov r5, r0
    mov r0, #0xa
    mul r1, r5, r0
    ldr r0, [sp, #0x4]
    cmp r6, #0x0
    sub r0, r0, r1
    str r0, [sp, #0x8]
    mov r0, #0xc
    str r0, [sp, #0xc]
    beq .L_0215780c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157c90
    add r2, r6, #0x2d
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    mov r1, #0xd000
    str r1, [sp, #0x64]
    mov r1, #0x4000
    str r1, [sp, #0x60]
    str r0, [sp, #0x14]
    add r1, sp, #0x60
    add r2, sp, #0x64
    bl func_ov003_0214e990
    ldr r0, [sp, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x14]
    mov r0, r7
    bl func_ov003_0214e908
.L_0215780c:
    cmp r6, #0x0
    cmpeq r5, #0x0
    beq .L_021578b0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157c90
    add r2, r5, #0x2d
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    cmp r6, #0x0
    mov r6, r0
    beq .L_02157864
    mov r1, #0xd000
    str r1, [sp, #0x6c]
    mov r1, #0xc000
    str r1, [sp, #0x68]
    add r1, sp, #0x68
    add r2, sp, #0x6c
    bl func_ov003_0214e990
    mov r0, #0x14
    str r0, [sp, #0xc]
    b .L_02157890
.L_02157864:
    cmp r5, #0x0
    beq .L_02157890
    mov r1, #0xd000
    str r1, [sp, #0x74]
    mov r1, #0x8000
    str r1, [sp, #0x70]
    add r1, sp, #0x70
    add r2, sp, #0x74
    bl func_ov003_0214e990
    mov r0, #0x10
    str r0, [sp, #0xc]
.L_02157890:
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r6
    mov r0, r7
    bl func_ov003_0214e908
.L_021578b0:
    bl func_0203b3f4
    ldr r1, [sp, #0x8]
    ldr r0, [r0, #0x88]
    add r2, r1, #0x2d
    ldr r1, .L_02157c90
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    ldr r1, [sp, #0xc]
    mov r5, r0
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x78]
    mov r1, #0xd000
    str r1, [sp, #0x7c]
    add r1, sp, #0x78
    add r2, sp, #0x7c
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r7
    mov r1, r5
    bl func_ov003_0214e908
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    ldrb r0, [r10, #0x2]
    ldr r1, [r1, #0x10]
    add r5, r1, r9
    ldrb r1, [r5, #0x74]
    bl func_ov003_0214d7d4
    ldr r1, .L_02157c9c
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    blt .L_02157a1c
    ldr r1, [r11, #0x0]
    mov r0, r8
    bl func_ov003_0214e8bc
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x4]
    mov r0, r6
    str r9, [r1, #0x124]
    mov r1, #0x8000
    str r1, [sp, #0x44]
    mov r1, #0xac000
    str r1, [sp, #0x40]
    add r1, sp, #0x40
    add r2, sp, #0x44
    bl func_ov003_0214e990
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    mov r0, #0xd8000
    str r0, [sp, #0x48]
    mov r0, r6
    add r1, sp, #0x48
    bl func_ov003_0214d52c
    bl func_0203b3f4
    ldrb r1, [r5, #0x74]
    ldr r5, [r0, #0x88]
    ldrb r0, [r10, #0x2]
    bl func_ov003_0214d7d4
    mov r2, r0
    ldr r1, .L_02157c9c
    mov r0, r5
    ldr r2, [r1, r2, lsl #0x2]
    ldr r1, .L_02157c90
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x8000
    str r0, [sp, #0x50]
    str r0, [sp, #0x4c]
    mov r0, r5
    add r1, sp, #0x4c
    add r2, sp, #0x50
    bl func_ov003_0214e990
    mov r0, r6
    mov r1, r5
    bl func_ov003_0214e908
.L_02157a1c:
    ldr r0, [r10, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    ldrb r0, [r10, #0x2]
    ldr r1, [r1, #0x10]
    add r1, r1, r9
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d808
    cmp r0, #0x0
    beq .L_02157b08
    ldr r1, [r11, #0x0]
    mov r0, r8
    bl func_ov003_0214e8bc
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x4]
    mov r0, r6
    str r9, [r1, #0x124]
    mov r1, #0x10000
    str r1, [sp, #0x30]
    mov r1, #0x90000
    str r1, [sp, #0x2c]
    add r1, sp, #0x2c
    add r2, sp, #0x30
    bl func_ov003_0214e990
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    mov r0, #0xd8000
    str r0, [sp, #0x34]
    mov r0, r6
    add r1, sp, #0x34
    bl func_ov003_0214d52c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157c90
    mov r2, #0x25
    mov r3, #0xd8
    bl func_ov003_0214d4a4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x8000
    str r0, [sp, #0x3c]
    str r0, [sp, #0x38]
    mov r0, r5
    add r1, sp, #0x38
    add r2, sp, #0x3c
    bl func_ov003_0214e990
    mov r0, r6
    mov r1, r5
    bl func_ov003_0214e908
.L_02157b08:
    ldr r0, [r10, #0xd8]
    cmp r0, r9
    bne .L_02157c1c
    ldr r1, [r11, #0x0]
    mov r0, r8
    bl func_ov003_0214e8bc
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x4]
    mov r0, r6
    str r9, [r1, #0x124]
    mov r1, #0x0
    str r1, [sp, #0x1c]
    str r1, [sp, #0x18]
    add r1, sp, #0x18
    add r2, sp, #0x1c
    bl func_ov003_0214e990
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    mov r0, #0xd9000
    str r0, [sp, #0x20]
    mov r0, r6
    add r1, sp, #0x20
    bl func_ov003_0214d52c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157c90
    mov r2, #0xb
    mov r3, #0xd9
    bl func_ov003_0214d4a4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x10000
    str r0, [sp, #0x28]
    mov r0, #0x74000
    str r0, [sp, #0x24]
    mov r0, r5
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov003_0214e990
    mov r0, r6
    mov r1, r5
    bl func_ov003_0214e908
    ldr r0, [r10, #0xcc]
    cmp r0, #0x0
    bne .L_02157c1c
    mov r0, r5
    bl func_ov003_02157f9c
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x21
    mov r2, #0xe
    mov r3, #0x5
    bl func_0206ad90
    str r0, [r10, #0xcc]
    cmp r0, #0x0
    beq .L_02157c1c
    ldr r1, .L_02157ca0
    mov r2, #0x1e
    bl func_ov003_02157fe4
.L_02157c1c:
    add r9, r9, #0x1
    cmp r9, #0x14
    blt .L_02157380
    ldr r0, [r4, #0x4]
    ldr r1, [r10, #0xd8]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x1a0]
    blx r3
    ldr r0, [r4, #0x4]
    ldr r1, [r10, #0xd8]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x198]
    blx r2
    add sp, sp, #0x184
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02157c5c: .word data_ov012_021d5154
.L_02157c60: .word data_ov003_0215e570
.L_02157c64: .word data_ov003_0215e3f8
.L_02157c68: .word func_ov003_02157ca4
.L_02157c6c: .word func_ov003_0215891c
.L_02157c70: .word func_ov003_02157d2c
.L_02157c74: .word data_ov003_0215e6f0
.L_02157c78: .word func_ov003_02157e6c
.L_02157c7c: .word data_ov003_0215e700
.L_02157c80: .word data_ov003_0215e714
.L_02157c84: .word data_ov003_0215e474
.L_02157c88: .word data_02093c8c
.L_02157c8c: .word func_ov003_02158a5c
.L_02157c90: .word 0x851000
.L_02157c94: .word func_ov003_0215898c
.L_02157c98: .word func_ov003_021589f4
.L_02157c9c: .word data_ov003_0215e450
.L_02157ca0: .word 0x79f
    arm_func_end func_ov003_02156de8

    .global func_ov003_02157ca4
    arm_func_start func_ov003_02157ca4
func_ov003_02157ca4: ; 0x02157ca4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02157cf0
    mov r5, r0
    ldr r2, .L_02157cf4
    ldr r3, .L_02157cf8
    mov r0, #0x44
    bl func_0201a21c
    movs r4, r0
    beq .L_02157ce8
    mov r1, r5
    bl func_ov003_0215647c
    ldr r0, .L_02157cfc
    mov r1, #0x1
    str r0, [r4, #0x0]
    ldr r0, .L_02157d00
    strb r1, [r4, #0x40]
    str r0, [r4, #0x0]
.L_02157ce8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02157cf0: .word data_ov003_0215e560
.L_02157cf4: .word data_ov003_0215e580
.L_02157cf8: .word 0x14e
.L_02157cfc: .word data_ov012_021d2a24
.L_02157d00: .word data_ov012_021d080c
    arm_func_end func_ov003_02157ca4

    .global func_ov003_02157d04
    arm_func_start func_ov003_02157d04
func_ov003_02157d04: ; 0x02157d04
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02157d20
    mov r1, #0x0
    blx func_ov012_021b5898
    ldmia sp!, {r3, pc}
.L_02157d20:
    ldr r1, [r1, #0x4]
    blx func_ov012_021b5898
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02157d04

    .global func_ov003_02157d2c
    arm_func_start func_ov003_02157d2c
func_ov003_02157d2c: ; 0x02157d2c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x40
    mov r8, r0
    ldr r0, [r8, #0x4]
    ldr r6, [r0, #0x10]
    ldr r0, [r6, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    ldr r0, [r8, #0x4]
    ldr r4, [r1, #0x10]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r0, #0x3
    blo .L_02157e64
    ldrb r0, [r6, #0xde]
    cmp r0, #0x0
    beq .L_02157e64
    ldrsb r0, [r6, #0xdc]
    mov r5, #0x0
    add r7, r4, r0
.L_02157d80:
    mov r0, r8
    add r1, r5, #0x2
    bl func_ov003_02154a7c
    add r1, r7, r5
    mov r4, r0
    ldrb r0, [r6, #0x2]
    ldrb r1, [r1, #0x74]
    bl func_ov003_0214d784
    mov r1, #0x3000
    strh r1, [sp, #0x0]
    mov r1, #0x0
    add r3, sp, #0x0
    b .L_02157dd4
.L_02157db4:
    mov lr, r1, lsl #0x1
    ldrh ip, [r0, lr]
    add r2, r3, r1, lsl #0x1
    strh ip, [r2, #0x2]
    ldrh r2, [r0, lr]
    cmp r2, #0x0
    beq .L_02157ddc
    add r1, r1, #0x1
.L_02157dd4:
    cmp r1, #0xa
    blt .L_02157db4
.L_02157ddc:
    cmp r1, #0xa
    addeq r0, sp, #0x0
    moveq r2, #0x0
    addeq r0, r0, r1, lsl #0x1
    streqh r2, [r0, #0x2]
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    ldr r9, [r4, #0x4]
    ldr r0, [r9, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    add r1, sp, #0x0
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    bl func_ov003_0214cfc8
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_02157d80
.L_02157e64:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    arm_func_end func_ov003_02157d2c

    .global func_ov003_02157e6c
    arm_func_start func_ov003_02157e6c
func_ov003_02157e6c: ; 0x02157e6c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x40
    mov r10, r0
    ldr r0, [r10, #0x4]
    ldr r7, [r0, #0x10]
    ldr r0, [r7, #0x4]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    ldr r0, [r10, #0x4]
    ldr r4, [r1, #0x10]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r0, #0x3
    blo .L_02157f74
    ldrb r0, [r7, #0xde]
    cmp r0, #0x0
    beq .L_02157f74
    ldrsb r0, [r7, #0xdc]
    ldr r11, .L_02157f7c
    mov r6, #0x0
    add r9, r4, r0
    add r4, sp, #0x0
.L_02157ec8:
    mov r0, r10
    add r1, r6, #0x2
    bl func_ov003_02154a7c
    mov r5, r0
    mov r0, r4
    mov r1, r11
    bl func_02074000
    add r2, r9, r6
    ldrb r1, [r7, #0x2]
    ldrb r2, [r2, #0x74]
    ldr r0, [r7, #0xd0]
    bl func_ov003_0214d79c
    mov r1, r0
    mov r0, r4
    bl func_020741bc
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov003_0214cf8c
    ldr r8, [r5, #0x4]
    ldr r0, [r8, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    bl func_ov003_0214cfc8
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_02157ec8
.L_02157f74:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02157f7c: .word data_ov003_0215e714
    arm_func_end func_ov003_02157e6c

    .global func_ov003_02157f80
    arm_func_start func_ov003_02157f80
func_ov003_02157f80: ; 0x02157f80
    ldr r3, [r0, #0x4]
    mov r0, #0x14
    ldr r3, [r3, #0x10]
    mla r0, r1, r0, r3
    add r0, r0, r2
    ldrb r0, [r0, #0x24]
    bx lr
    arm_func_end func_ov003_02157f80

    .global func_ov003_02157f9c
    arm_func_start func_ov003_02157f9c
func_ov003_02157f9c: ; 0x02157f9c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r4, [r0, #0x2c]
    cmp r4, #0x0
    bne .L_02157fc0
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r4, r0
.L_02157fc0:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02157fdc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02157fdc:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_02157f9c

    .global func_ov003_02157fe4
    arm_func_start func_ov003_02157fe4
func_ov003_02157fe4: ; 0x02157fe4
    mov r3, #0x0
    strh r3, [r0, #0x18]
    strh r1, [r0, #0x16]
    strb r2, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    bx lr
    arm_func_end func_ov003_02157fe4

    .global func_ov003_02158004
    arm_func_start func_ov003_02158004
func_ov003_02158004: ; 0x02158004
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, .L_02158150
    mov r5, r0
    ldr r2, .L_02158154
    ldr r3, .L_02158158
    mov r0, #0xbc
    bl func_0201a21c
    movs r4, r0
    beq .L_0215803c
    ldr r1, .L_0215815c
    mov r2, #0x0
    blx func_ov012_021af358
    mov r4, r0
.L_0215803c:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02158058
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158058:
    ldr r4, [r4, #0x18]
    mov lr, #0xa
    ldr r1, [r4, #0x4]
    mov r0, #0x10
    str r0, [r1, #0x94]
    str r0, [r1, #0x98]
    ldr ip, [r4, #0x4]
    ldr r1, .L_02158160
    ldr r2, .L_02158164
    add r3, lr, #0x1d4
    mov r0, #0xcc
    str lr, [ip, #0x9c]
    bl func_0201a21c
    movs r6, r0
    beq .L_021580a8
    ldr r1, .L_02158168
    ldr r2, .L_0215816c
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r6, r0
.L_021580a8:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_021580c4
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021580c4:
    ldr r6, [r6, #0x18]
    ldr r1, .L_02158170
    mov r0, r6
    bl func_ov003_0215817c
    bl func_ov003_02157f9c
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x31
    mov r2, #0xe
    mov r3, #0x5
    bl func_0206ad90
    str r0, [r5, #0xc8]
    cmp r0, #0x0
    beq .L_02158108
    ldr r1, .L_02158174
    mov r2, #0x1e
    bl func_ov003_02157fe4
.L_02158108:
    mov r2, r6
    mov r3, r4
    mov r0, #0x1
    mov r1, #0x0
    blx func_ov012_021b3b7c
    ldr r1, .L_02158178
    mov r2, #0x1
    mov r0, r4
    str r2, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02158150: .word data_ov003_0215e550
.L_02158154: .word data_ov003_0215e400
.L_02158158: .word 0x212
.L_0215815c: .word func_ov003_021581a4
.L_02158160: .word data_ov003_0215dbec
.L_02158164: .word data_ov003_0215e3f0
.L_02158168: .word func_ov003_021584dc
.L_0215816c: .word func_ov003_02158594
.L_02158170: .word 0x31305053
.L_02158174: .word 0x8df
.L_02158178: .word data_ov012_021d5154
    arm_func_end func_ov003_02158004

    .global func_ov003_0215817c
    arm_func_start func_ov003_0215817c
func_ov003_0215817c: ; 0x0215817c
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov003_0214d47c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215817c

    .global func_ov003_021581a4
    arm_func_start func_ov003_021581a4
func_ov003_021581a4: ; 0x021581a4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x90]
    bl func_ov003_0214d47c
    mov r1, #0xc000
    str r1, [sp, #0x18]
    ldr r1, [r0, #0x4]
    ldr r0, [r5, #0x4]
    ldrsh r2, [r1, #0xcc]
    ldr r0, [r0, #0x94]
    add r1, sp, #0x1c
    sub r0, r2, r0
    add r0, r0, #0x9
    mov r3, r0, lsl #0xc
    add r2, sp, #0x18
    mov r0, r5
    str r3, [sp, #0x1c]
    bl func_ov003_0214e990
    ldr r2, [r5, #0x4]
    ldr r1, .L_021583dc
    ldr r0, [r2, #0x98]
    sub r0, r0, #0x10
    str r0, [r2, #0x98]
    ldr r0, [r5, #0x4]
    str r1, [r0, #0xb4]
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0xac]
    tst r0, #0x1
    bne .L_021583d4
    mov r0, #0x0
    strh r0, [sp, #0x20]
    strh r0, [sp, #0x22]
    ldr r2, [r5, #0x4]
    add r1, sp, #0x20
    ldr r3, [r2, #0x94]
    ldr r2, .L_021583e0
    strh r3, [sp, #0x24]
    ldr r3, [r5, #0x4]
    ldr r3, [r3, #0x98]
    strh r3, [sp, #0x26]
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r5
    bl func_02020e98
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_021583e4
    mov r2, #0x5
    mov r3, #0x20
    bl func_ov003_0214d4a4
    mov r1, #0xa000
    str r1, [sp, #0x10]
    mov r1, #0x8000
    str r1, [sp, #0x14]
    mov r4, r0
    add r1, sp, #0x14
    add r2, sp, #0x10
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r4
    mov r0, r5
    bl func_ov003_0214e908
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_021583e4
    mov r2, #0x9
    mov r3, #0x20
    bl func_ov003_0214d4a4
    ldr r1, [r5, #0x4]
    mov r2, #0x8000
    ldr r3, [r1, #0x98]
    mov r4, r0
    str r2, [sp, #0xc]
    sub r2, r3, #0xa
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x8]
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r4
    mov r0, r5
    bl func_ov003_0214e908
    ldr r4, [r5, #0x4]
    ldr r1, .L_021583e8
    ldr r0, [r4, #0xac]
    ldr r2, .L_021583ec
    and r0, r0, #0x1
    cmp r0, #0x1
    moveq r7, #0x1
    ldr r3, .L_021583f0
    mov r0, #0xb4
    movne r7, #0x0
    ldr r4, [r4, #0x94]
    bl func_0201a21c
    movs r6, r0
    beq .L_02158374
    ldr r2, .L_021583f4
    mov r1, #0x0
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r1, [r5, #0x4]
    mov r2, r4
    mov r3, r7
    blx func_ov012_021af494
    mov r6, r0
.L_02158374:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02158390
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158390:
    ldr r6, [r6, #0x18]
    mov r0, #0x0
    mov r4, #0x10
    mov r3, #0x20
    ldr r2, .L_021583e0
    add r1, sp, #0x20
    strh r0, [sp, #0x20]
    strh r0, [sp, #0x22]
    strh r4, [sp, #0x24]
    strh r3, [sp, #0x26]
    bl func_ov003_0214e81c
    mov r1, r0
    mov r0, r6
    bl func_02020e98
    ldr r0, [r5, #0x4]
    ldr r1, [r6, #0x4]
    blx func_ov012_021b8efc
.L_021583d4:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021583dc: .word func_ov003_0215848c
.L_021583e0: .word data_02093c8c
.L_021583e4: .word 0x851000
.L_021583e8: .word data_ov003_0215e540
.L_021583ec: .word data_ov003_0215e408
.L_021583f0: .word 0x226
.L_021583f4: .word func_ov003_021583f8
    arm_func_end func_ov003_021581a4

    .global func_ov003_021583f8
    arm_func_start func_ov003_021583f8
func_ov003_021583f8: ; 0x021583f8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r0, #0x1
    bne .L_02158474
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02158488
    mov r2, #0x7
    mov r3, #0x20
    bl func_ov003_0214d4a4
    mov ip, #0x0
    mov r3, #0x9000
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r4, r0
    str ip, [sp, #0x0]
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r5
    mov r1, r4
    bl func_ov003_0214e908
.L_02158474:
    ldr r0, [r5, #0x4]
    mov r1, #0x20
    str r1, [r0, #0x98]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02158488: .word 0x851000
    arm_func_end func_ov003_021583f8

    .global func_ov003_0215848c
    arm_func_start func_ov003_0215848c
func_ov003_0215848c: ; 0x0215848c
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    beq .L_021584ac
    cmp r1, #0x1
    beq .L_021584bc
    cmp r1, #0x4
    ldmeqia sp!, {r3, pc}
    b .L_021584cc
.L_021584ac:
    mov r0, #0x78
    mov r1, #0x3
    bl func_0207342c
    ldmia sp!, {r3, pc}
.L_021584bc:
    mov r0, #0x78
    mov r1, #0x3
    bl func_0207342c
    ldmia sp!, {r3, pc}
.L_021584cc:
    mov r0, #0x78
    mov r1, #0x3
    bl func_0207342c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215848c

    .global func_ov003_021584dc
    arm_func_start func_ov003_021584dc
func_ov003_021584dc: ; 0x021584dc
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r5, r0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_02158590
    mov r2, #0xc
    mov r3, #0x60
    bl func_ov003_0214d4a4
    mov ip, #0x10000
    mov r3, #0x74000
    add r1, sp, #0x14
    add r2, sp, #0x10
    mov r4, r0
    str ip, [sp, #0x10]
    str r3, [sp, #0x14]
    bl func_ov003_0214e990
    mov r0, #0xd9000
    str r0, [sp, #0xc]
    add r1, sp, #0xc
    mov r0, r4
    bl func_ov003_0214d52c
    mov r1, r4
    mov r0, r5
    bl func_ov003_0214e908
    mov r0, #0x60000
    str r0, [sp, #0x8]
    mov r0, r5
    add r1, sp, #0x8
    bl func_ov003_0214d52c
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, #0x100000
    str r1, [sp, #0x0]
    mov r1, #0x180000
    str r1, [sp, #0x4]
    mov r0, r5
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov003_0214e990
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_02158590: .word 0x851000
    arm_func_end func_ov003_021584dc

    .global func_ov003_02158594
    arm_func_start func_ov003_02158594
func_ov003_02158594: ; 0x02158594
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0x4]
    add r1, sp, #0x4
    ldrsh r3, [r4, #0xa2]
    add r2, sp, #0x0
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    ldr r1, .L_02158660
    mov r0, r5
    bl func_ov003_0215817c
    ldr r1, .L_02158664
    mov r5, r0
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x30]
    cmpne r0, #0x0
    beq .L_02158658
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x194]
    blx r1
    ldr r1, .L_02158664
    mov r4, r0
    ldr r6, [r1, #0x0]
    ldr r0, [r6, #0x4]
    bl func_ov003_0214fb7c
    ldrb r1, [r6, #0x2]
    mov r2, r4
    bl func_ov003_02157f80
    cmp r0, #0x3
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    blo .L_0215863c
    ldr r1, .L_02158668
    bl func_02023894
    b .L_02158644
.L_0215863c:
    ldr r1, .L_0215866c
    bl func_02023894
.L_02158644:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_02158658:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02158660: .word 0x31305053
.L_02158664: .word data_ov003_0215ec34
.L_02158668: .word 0x85100c
.L_0215866c: .word 0x851038
    arm_func_end func_ov003_02158594

    .global func_ov003_02158670
    arm_func_start func_ov003_02158670
func_ov003_02158670: ; 0x02158670
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02158670

    .global func_ov003_02158688
    arm_func_start func_ov003_02158688
func_ov003_02158688: ; 0x02158688
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r4, [r0, #0x10]
    ldr r0, .L_0215871c
    strb r1, [r4, #0x0]
    ldrb r2, [r4, #0x2]
    ldr ip, [r4, #0xd8]
    ldr r1, .L_02158720
    mul r3, r2, r0
    strb ip, [r1, r3]
    ldrb r2, [r4, #0x2]
    mov r1, #0x1
    mul r0, r2, r0
    add r0, r0, #0xf7
    add r0, r0, #0x4a00
    blx func_02073114
    ldr r0, .L_02158724
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02158724
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02158724
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02158724
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02158728
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215871c: .word 0xca4
.L_02158720: .word data_020b4daf
.L_02158724: .word data_020a0e18
.L_02158728: .word func_ov003_02155b4c
    arm_func_end func_ov003_02158688

    .global func_ov003_0215872c
    arm_func_start func_ov003_0215872c
func_ov003_0215872c: ; 0x0215872c
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0xd4]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0xd4]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0xd4]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215872c

    .global func_ov003_0215877c
    arm_func_start func_ov003_0215877c
func_ov003_0215877c: ; 0x0215877c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    mov r4, #0x1
    b .L_021587bc
.L_02158790:
    mov r0, r6
    mov r1, r5
    bl func_ov003_02154a7c
    cmp r5, #0x0
    beq .L_021587b8
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_021587b8:
    add r5, r5, #0x1
.L_021587bc:
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r5, r0
    blo .L_02158790
    ldr r1, [r6, #0x4]
    ldr r0, [r1, #0x124]
    cmp r0, #0x3
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r1, #0x10]
    mov r0, #0x1
    strb r0, [r1, #0xde]
    ldr r0, [r1, #0x38]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov003_0215877c

    .global func_ov003_02158800
    arm_func_start func_ov003_02158800
func_ov003_02158800: ; 0x02158800
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xc4]
    cmp r0, #0x0
    beq .L_02158844
    ldrb r0, [r4, #0x2]
    bl func_ov003_0214d838
    and r5, r0, #0xff
    ldrb r0, [r4, #0x2]
    bl func_ov003_0214d820
    cmp r5, r0
    movhi r1, #0x1a
    ldr r0, [r4, #0xc4]
    movls r1, #0x19
    bl func_ov003_02156dac
.L_02158844:
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x3
    bne .L_0215886c
    blx func_ov012_021b65cc
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x38]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
.L_0215886c:
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov003_02158800

    .global func_ov003_02158888
    arm_func_start func_ov003_02158888
func_ov003_02158888: ; 0x02158888
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    ldr r1, [r0, #0x4]
    ldr r0, [r1, #0x90]
    and r0, r0, #0x10
    cmp r0, #0x10
    bne .L_021588f8
    ldr r0, [r1, #0x50]
    mov r2, #0xac
    ldr r1, [r0, #0xc]
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    add r1, r0, #0x4
    add r3, r0, #0xea
    cmp r1, #0x100
    movgt r1, #0x100
    cmp r3, #0x100
    str r2, [sp, #0x0]
    movgt r3, #0x100
    add r0, sp, #0x4
    mov r2, #0xc
    bl func_ov003_0214ee3c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov003_02152e64
.L_021588f8:
    add sp, sp, #0xc
    ldmia sp!, {pc}
    arm_func_end func_ov003_02158888

    .global func_ov003_02158900
    arm_func_start func_ov003_02158900
func_ov003_02158900: ; 0x02158900
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x90]
    and r0, r0, #0x10
    cmp r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov003_02158900

    .global func_ov003_0215891c
    arm_func_start func_ov003_0215891c
func_ov003_0215891c: ; 0x0215891c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x98]
    bl func_ov003_02158900
    cmp r0, #0x0
    bne .L_02158948
    ldrb r0, [r4, #0xde]
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r4, #0xde]
.L_02158948:
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x19c]
    blx r1
    ldrsb r1, [r4, #0xdc]
    cmp r1, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x19c]
    blx r1
    strb r0, [r4, #0xdc]
    mov r0, #0x1
    strb r0, [r4, #0xde]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0215891c

    .global func_ov003_0215898c
    arm_func_start func_ov003_0215898c
func_ov003_0215898c: ; 0x0215898c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r6, #0x0
    ldr r5, [r0, #0x10]
    mov r4, #0x1
    b .L_021589d8
.L_021589a8:
    ldr r0, [r7, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x170]
    blx r2
    bl func_ov003_0214d47c
    cmp r5, r0
    bne .L_021589d4
    ldr r0, [r5, #0x4]
    mov r1, r4
    blx func_ov012_021b6214
.L_021589d4:
    add r6, r6, #0x1
.L_021589d8:
    ldr r0, [r7, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x16c]
    blx r1
    cmp r6, r0
    blo .L_021589a8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov003_0215898c

    .global func_ov003_021589f4
    arm_func_start func_ov003_021589f4
func_ov003_021589f4: ; 0x021589f4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r6, #0x0
    ldr r5, [r0, #0x10]
    mov r4, r6
    b .L_02158a40
.L_02158a10:
    ldr r0, [r7, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x170]
    blx r2
    bl func_ov003_0214d47c
    cmp r5, r0
    bne .L_02158a3c
    ldr r0, [r5, #0x4]
    mov r1, r4
    blx func_ov012_021b6214
.L_02158a3c:
    add r6, r6, #0x1
.L_02158a40:
    ldr r0, [r7, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x16c]
    blx r1
    cmp r6, r0
    blo .L_02158a10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov003_021589f4

    .global func_ov003_02158a5c
    arm_func_start func_ov003_02158a5c
func_ov003_02158a5c: ; 0x02158a5c
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x4]
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x124]
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x198]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02158a5c

    .global func_ov003_02158a84
    arm_func_start func_ov003_02158a84
func_ov003_02158a84: ; 0x02158a84
    ldr ip, .L_02158a90
    mov r1, #0xff
    bx ip
.L_02158a90: .word func_ov003_02158abc
    arm_func_end func_ov003_02158a84

    .global func_ov003_02158a94
    arm_func_start func_ov003_02158a94
func_ov003_02158a94: ; 0x02158a94
    ldr ip, .L_02158aa0
    mov r1, #0xfe
    bx ip
.L_02158aa0: .word func_ov003_02158abc
    arm_func_end func_ov003_02158a94

    .global func_ov003_02158aa4
    arm_func_start func_ov003_02158aa4
func_ov003_02158aa4: ; 0x02158aa4
    ldr r1, [r0, #0x4]
    ldr ip, .L_02158ab8
    ldr r1, [r1, #0x10]
    ldrb r1, [r1, #0x1e]
    bx ip
.L_02158ab8: .word func_ov003_02158abc
    arm_func_end func_ov003_02158aa4

    .global func_ov003_02158abc
    arm_func_start func_ov003_02158abc
func_ov003_02158abc: ; 0x02158abc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x80
    mov r5, r1
    mov r6, r0
    ldr r1, .L_02159774
    ldr r2, .L_02159778
    mov r0, #0x58
    mov r3, #0xb0
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x58
    mov r9, r0
    bl func_020517fc
    bl func_02020d90
    mov r1, #0x85000
    str r1, [sp, #0x7c]
    mov r4, r0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x7c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215977c
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r6
    mov r0, r4
    bl func_ov003_0214fb44
    str r4, [r9, #0x4]
    strb r5, [r9, #0x2]
    mov r0, #0x21
    strb r0, [r9, #0x0]
    mov r0, #0x0
    bl func_02028920
    str r0, [r9, #0x8]
    mov r0, #0x1
    bl func_02043264
    mov r0, #0x0
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x68]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x68
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x6c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x6c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x70]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x70
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x74]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x74
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r10, #0x0
    mov r8, #0x1
    mov r7, #0x4
    mov r6, r10
    mov r5, r10
    add r11, sp, #0x78
.L_02158d98:
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r8
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r6
    ldr r0, [r0, #0x4]
    mov r2, r6
    bl func_0203cfbc
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r10
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, r10, lsl #0xc
    str r0, [sp, #0x78]
    ldr r0, [r1, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r10, r10, #0x1
    cmp r10, #0x4
    blt .L_02158d98
    ldr r6, .L_02159780
    ldr r5, .L_02159784
    mov r7, #0x0
.L_02158e44:
    add r0, r7, #0x1
    bl func_0203b414
    mov r2, r0
    ldr r0, [r6, r7, lsl #0x2]
    ldr r1, [r5, r7, lsl #0x2]
    ldr r2, [r2, #0x88]
    bl func_ov003_0214d3a8
    add r1, r9, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0x18]
    cmp r7, #0x2
    blt .L_02158e44
    mov r7, #0x0
    ldr r6, .L_02159788
    mov r5, r7
.L_02158e80:
    ldr r0, [r6, r7, lsl #0x2]
    mov r1, r5
    blx func_020101f4
    add r1, r9, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0xc]
    cmp r7, #0x3
    blt .L_02158e80
    ldr r1, .L_0215978c
    ldr r2, .L_02159790
    ldr r3, .L_02159794
    mov r0, #0xcc
    bl func_0201a21c
    movs r5, r0
    beq .L_02158ed0
    ldr r1, .L_02159798
    ldr r2, .L_0215979c
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r5, r0
.L_02158ed0:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02158eec
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158eec:
    ldr r5, [r5, #0x18]
    mov r1, #0x0
    mov r2, r5
    mov r3, r1
    mov r0, #0x1
    blx func_ov012_021b3b7c
    ldr r0, .L_021597a0
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r0, [r5, #0x4]
    ldr r1, .L_021597a4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02158f34
    bl func_ov003_0214d47c
.L_02158f34:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r6, [r0, #0x2c]
    cmp r6, #0x0
    bne .L_02158f54
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r6, r0
.L_02158f54:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02158f70
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02158f70:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x18]
    mov r1, #0x21
    mov r2, #0x6
    mov r3, #0x5
    bl func_0206ad90
    str r0, [r9, #0x50]
    cmp r0, #0x0
    beq .L_02158fbc
    mov r2, #0x0
    ldr r1, .L_021597a8
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
.L_02158fbc:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r9
    bl func_ov003_0214d6b0
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x100
    str r1, [r0, #0x124]
    ldr r1, .L_021597a0
    str r5, [r9, #0x20]
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r5, r0
    ldr r1, [r9, #0x18]
    bl func_ov003_0214e908
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_021597ac
    bl func_02028384
    ldr r0, [r5, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r9, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r9, #0x30]
    mov r0, r9
    bl func_ov003_0214d6b0
    mov r6, r0
    ldr r2, .L_021597b0
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    str r2, [r0, #0x124]
    ldr r0, [r6, #0x4]
    blx func_ov012_021b6214
    str r6, [r9, #0x24]
    mov r0, r6
    ldr r1, .L_021597a0
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r5, r0
    ldr r1, [r9, #0x1c]
    bl func_ov003_0214e908
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    str r1, [r0, #0x124]
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_021597b4
    add r0, sp, #0x38
    mov r1, r5
    bl func_ov003_0214e940
    mov r7, #0x0
    sub r3, r7, #0x100000
    add r1, sp, #0x50
    add r2, sp, #0x54
    mov r0, r5
    str r7, [sp, #0x54]
    str r3, [sp, #0x50]
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, r7
    bl func_02023c60
    mov r0, r7
    str r0, [sp, #0x5c]
    str r0, [sp, #0x58]
    mov r0, r5
    add r1, sp, #0x58
    add r2, sp, #0x5c
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, r7
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r2, .L_021597b8
    ldr r3, [sp, #0x3c]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    mov r1, r7
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r2, .L_021597bc
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_021597c0
    mov r1, #0x10
    blx func_ov012_021b6760
    mov r0, r7
    str r0, [sp, #0x64]
    sub r0, r0, #0x100000
    str r0, [sp, #0x60]
    add r1, sp, #0x60
    add r2, sp, #0x64
    mov r0, r5
    bl func_ov003_0214e990
    str r5, [r9, #0x34]
    mov r1, #0x3b
    mov r0, #0x60
    str r1, [sp, #0x40]
    str r0, [sp, #0x44]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x40
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r6
    mov r2, #0x830000
    mov r3, #0x5
    bl func_ov003_0214d554
    ldr r1, [r9, #0x34]
    mov r5, r0
    bl func_ov003_0214fb44
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_021597c4
    add r0, sp, #0x48
    mov r1, r5
    bl func_ov003_0214e940
    ldr r0, [r5, #0x4]
    mov r1, r7
    bl func_02023738
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x48]
    ldr r3, [sp, #0x4c]
    mov r2, r7
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x4000
    bl func_02023738
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x48]
    ldr r3, [sp, #0x4c]
    mov r2, #0x1e
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x8000
    bl func_02023738
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x48]
    ldr r3, [sp, #0x4c]
    mov r2, #0x3c
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0xc000
    bl func_02023738
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x48]
    ldr r3, [sp, #0x4c]
    mov r2, #0x5a
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x10000
    bl func_02023738
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x48]
    ldr r3, [sp, #0x4c]
    mov r2, #0x78
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x48]
    ldr r2, .L_021597b8
    ldr r3, [sp, #0x4c]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x3
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    mov r1, r7
    blx func_ov012_021b6214
    ldr r1, [r5, #0x4]
    mov r2, #0x2
    str r2, [r1, #0x124]
    mov r0, r9
    str r5, [r9, #0x38]
    bl func_ov003_0214d6b0
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    mov r1, #0x4
    ldr r0, [r8, #0x4]
    add r2, r1, #0xfe
    str r1, [r0, #0x140]
    ldr r0, [r8, #0x4]
    mov r1, #0x10
    str r2, [r0, #0x124]
    ldr r0, [r8, #0x4]
    ldr r2, .L_021597c8
    blx func_ov012_021b65e8
    ldr r0, [r8, #0x4]
    ldr r2, .L_021597cc
    mov r1, #0x10
    blx func_ov012_021b6760
    add r0, sp, #0x8
    str r8, [r9, #0x28]
    bl func_0202c498
    mov r0, #0xa8
    str r0, [sp, #0x10]
    mov r0, #0x40
    str r0, [sp, #0x14]
    ldrb r0, [r9, #0x2]
    cmp r0, #0xff
    moveq r6, r7
    beq .L_021593d8
    cmp r0, #0xfe
    moveq r6, #0x1
    movne r6, #0x2
.L_021593d8:
    cmp r6, #0x2
    ldrne r0, [sp, #0x14]
    ldr r1, .L_021597d0
    addne r0, r0, #0xc
    strne r0, [sp, #0x14]
    mov r0, #0xc
    mla r11, r6, r0, r1
    mov r10, #0x0
.L_021593f8:
    ldr r0, [r11, r10, lsl #0x2]
    cmp r0, #0x0
    blt .L_02159624
    bl func_0203b404
    mov r1, #0x82
    str r1, [sp, #0x0]
    add r1, sp, #0x10
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r3, [r11, r10, lsl #0x2]
    mov r0, r8
    mov r2, #0x820000
    bl func_ov003_0214d554
    mov r7, r0
    ldr r0, [r7, #0x4]
    bl func_02023940
    ldr r2, .L_021597b4
    add r0, sp, #0x18
    mov r1, r7
    bl func_ov003_0214e940
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x18]
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x10]
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x14]
    add r0, r0, #0xc0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x24]
    str r0, [sp, #0x20]
    mov r0, r7
    add r1, sp, #0x20
    add r2, sp, #0x24
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x0
    bl func_02023c60
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x10]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x2c]
    str r0, [sp, #0x28]
    mov r0, r7
    add r1, sp, #0x28
    add r2, sp, #0x2c
    bl func_ov003_0214e990
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x8]
    ldr r2, .L_021597b8
    ldr r3, [sp, #0xc]
    bl func_02023c80
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r7, #0x4]
    ldr r2, .L_021597d4
    mov r1, #0x1
    blx func_ov012_021b65e8
    ldr r0, [r7, #0x4]
    ldr r2, .L_021597d8
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r7, #0x4]
    ldr r2, .L_021597dc
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r7, #0x4]
    ldr r2, .L_021597e0
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r1, .L_021597e4
    ldr r2, .L_021597e8
    ldr r3, .L_021597ec
    mov r0, #0x70
    bl func_0201a21c
    movs r5, r0
    beq .L_0215959c
    ldr r2, .L_021597f0
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r0, .L_021597f4
    ldr r1, .L_021597f8
    str r0, [r5, #0x0]
    add r0, r5, #0x68
    bl func_ov003_0214e8a8
    ldr r0, .L_021597fc
    str r0, [r5, #0x0]
.L_0215959c:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_021595b8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021595b8:
    ldr r1, [r5, #0x18]
    mov r0, r7
    bl func_02020e98
    ldr r0, [r7, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    add r0, r0, #0xc0
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x34]
    str r0, [sp, #0x30]
    mov r0, r7
    add r1, sp, #0x30
    add r2, sp, #0x34
    bl func_ov003_0214e990
    ldr r1, [r7, #0x4]
    add r2, r10, #0x3
    add r0, r9, r10, lsl #0x2
    str r2, [r1, #0x124]
    str r7, [r0, #0x3c]
    ldr r0, [sp, #0x14]
    add r0, r0, #0x20
    str r0, [sp, #0x14]
.L_02159624:
    add r10, r10, #0x1
    cmp r10, #0x3
    blt .L_021593f8
    cmp r6, #0x2
    moveq r10, #0x3
    movne r10, #0x2
    mov r8, #0x0
    sub r6, r10, #0x1
    mov r5, r8
    mov r11, #0x1
    b .L_021596f0
.L_02159650:
    subs r0, r8, #0x1
    movmi r0, r6
    add r0, r9, r0, lsl #0x2
    ldr r1, [r0, #0x3c]
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x3c]
    add r7, r8, #0x1
    cmp r7, r6
    movgt r7, r5
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02159694
    ldr r2, [r0, #0x0]
    mov r1, r11
    ldr r2, [r2, #0x164]
    blx r2
    b .L_021596a8
.L_02159694:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x1
    blx r3
.L_021596a8:
    add r0, r9, r7, lsl #0x2
    ldr r1, [r0, #0x3c]
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x3c]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_021596d8
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x164]
    blx r2
    b .L_021596ec
.L_021596d8:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x2
    blx r3
.L_021596ec:
    add r8, r8, #0x1
.L_021596f0:
    cmp r8, r10
    blt .L_02159650
    ldrb r1, [r9, #0x2]
    mov r0, #0x7
    cmp r1, #0xfe
    mov r1, #0x1
    moveq r0, #0x8
    mov r2, r1
    sub r3, r1, #0x2
    blx func_ov012_021bcf1c
    str r0, [r9, #0x4c]
    ldrb r0, [r9, #0x2]
    mov r1, #0x2
    cmp r0, #0xff
    moveq r1, #0x0
    beq .L_02159738
    cmp r0, #0xfe
    moveq r1, #0x1
.L_02159738:
    ldr r0, [r9, #0x4c]
    mov r2, #0x0
    bl func_ov003_02159c04
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r9, #0x24]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    mov r0, r4
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02159774: .word data_ov003_0215e86c
.L_02159778: .word data_ov003_0215e7f8
.L_0215977c: .word func_ov003_02159800
.L_02159780: .word data_ov003_0215e730
.L_02159784: .word data_ov003_0215e728
.L_02159788: .word data_ov003_0215e74c
.L_0215978c: .word data_ov003_0215dbec
.L_02159790: .word data_ov003_0215e720
.L_02159794: .word 0x1de
.L_02159798: .word func_ov003_02159c38
.L_0215979c: .word func_ov003_02159ce4
.L_021597a0: .word data_ov012_021d5154
.L_021597a4: .word 0x31305053
.L_021597a8: .word 0x8df
.L_021597ac: .word func_ov003_021599a0
.L_021597b0: .word 0x101
.L_021597b4: .word data_ov003_0215e88c
.L_021597b8: .word 0x494c
.L_021597bc: .word func_ov003_021599f0
.L_021597c0: .word func_ov003_02159a18
.L_021597c4: .word data_ov003_0215e898
.L_021597c8: .word func_ov003_02159980
.L_021597cc: .word func_ov003_02159990
.L_021597d0: .word data_ov003_0215d530
.L_021597d4: .word func_ov003_02159bc8
.L_021597d8: .word func_ov003_02159af0
.L_021597dc: .word func_ov003_02159b08
.L_021597e0: .word func_ov003_02159a70
.L_021597e4: .word data_ov003_0215dc0c
.L_021597e8: .word data_ov003_0215e718
.L_021597ec: .word 0x1b2
.L_021597f0: .word data_02093c8c
.L_021597f4: .word data_ov003_0215db68
.L_021597f8: .word data_ov003_0215e738
.L_021597fc: .word data_ov012_021d1c58
    arm_func_end func_ov003_02158abc

    .global func_ov003_02159800
    arm_func_start func_ov003_02159800
func_ov003_02159800: ; 0x02159800
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02159824
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02159824: .word func_ov003_0215997c
    arm_func_end func_ov003_02159800

    .global func_ov003_02159828
    arm_func_start func_ov003_02159828
func_ov003_02159828: ; 0x02159828
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x4]
    ldr r6, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrb r0, [r6, #0x2]
    cmp r0, #0xff
    moveq r4, #0x11
    beq .L_0215985c
    cmp r0, #0xfe
    moveq r4, #0x12
    movne r4, #0x13
.L_0215985c:
    ldr r0, [r6, #0x4]
    bl func_ov003_0214fb7c
    ldrb r2, [r6, #0x0]
    ldrsb r3, [r6, #0x1]
    mov r1, r4
    bl func_ov003_0214d28c
    ldr r0, [r6, #0x50]
    cmp r0, #0x0
    beq .L_0215988c
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r6, #0x50]
.L_0215988c:
    ldr r0, .L_02159978
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r6, #0x4c]
    cmp r0, #0x0
    beq .L_021598b8
    blx func_ov012_021bd500
    mov r0, #0x0
    str r0, [r6, #0x4c]
.L_021598b8:
    mov r5, #0x0
    mov r4, r5
    mov r7, r5
.L_021598c4:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_02159904
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r6, r5, lsl #0x2
    str r7, [r0, #0x20]
.L_02159904:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_021598c4
    mov r5, #0x0
    mov r4, r5
.L_02159918:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_0215993c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r6, r5, lsl #0x2
    str r4, [r0, #0xc]
.L_0215993c:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_02159918
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_02159968
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r6, #0x4]
.L_02159968:
    blx func_ov012_021b65cc
    mov r0, r6
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02159978: .word data_ov012_021d5154
    arm_func_end func_ov003_02159828

    .global func_ov003_0215997c
    arm_func_start func_ov003_0215997c
func_ov003_0215997c: ; 0x0215997c
    bx lr
    arm_func_end func_ov003_0215997c

    .global func_ov003_02159980
    arm_func_start func_ov003_02159980
func_ov003_02159980: ; 0x02159980
    ldr ip, .L_0215998c
    ldr r0, [r0, #0x4]
    bx ip
.L_0215998c: .word func_ov012_021b65d8
    arm_func_end func_ov003_02159980

    .global func_ov003_02159990
    arm_func_start func_ov003_02159990
func_ov003_02159990: ; 0x02159990
    ldr ip, .L_0215999c
    ldr r0, [r0, #0x4]
    bx ip
.L_0215999c: .word func_ov012_021b65e0
    arm_func_end func_ov003_02159990

    .global func_ov003_021599a0
    arm_func_start func_ov003_021599a0
func_ov003_021599a0: ; 0x021599a0
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0x54]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0x54]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0x54]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_021599a0

    .global func_ov003_021599f0
    arm_func_start func_ov003_021599f0
func_ov003_021599f0: ; 0x021599f0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_021599f0

    .global func_ov003_02159a18
    arm_func_start func_ov003_02159a18
func_ov003_02159a18: ; 0x02159a18
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_02159a18

    .global func_ov003_02159a70
    arm_func_start func_ov003_02159a70
func_ov003_02159a70: ; 0x02159a70
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, [r4, #0x4]
    ldr r2, [r3, #0x10]
    ldrb r0, [r2, #0x2]
    cmp r0, #0xff
    moveq r1, #0x4
    beq .L_02159a9c
    cmp r0, #0xfe
    moveq r1, #0x4
    movne r1, #0x5
.L_02159a9c:
    ldr r0, [r3, #0x124]
    cmp r1, r0
    bne .L_02159ac8
    ldr r0, [r2, #0x2c]
    cmp r0, #0x0
    beq .L_02159ac8
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02159ac8:
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x124]
    cmp r1, #0x3
    bne .L_02159ae4
    mov r1, #0x1
    blx func_ov012_021b6214
    ldmia sp!, {r4, pc}
.L_02159ae4:
    mov r1, #0x0
    blx func_ov012_021b6214
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_02159a70

    .global func_ov003_02159af0
    arm_func_start func_ov003_02159af0
func_ov003_02159af0: ; 0x02159af0
    stmdb sp!, {r3, lr}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    blx func_ov012_021b65bc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02159af0

    .global func_ov003_02159b08
    arm_func_start func_ov003_02159b08
func_ov003_02159b08: ; 0x02159b08
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r0, [r4, #0x2]
    cmp r0, #0xff
    moveq r0, #0x0
    beq .L_02159b30
    cmp r0, #0xfe
    moveq r0, #0x1
    movne r0, #0x2
.L_02159b30:
    ldr r1, [r1, #0x124]
    ldr r3, .L_02159bbc
    add ip, r0, r0, lsl #0x1
    ldr r0, [r4, #0x4]
    sub r2, r1, #0x3
    add r1, r3, ip
    ldrb r5, [r2, r1]
    bl func_ov003_0214fb7c
    ldr r1, [r0, #0x4]
    mov r0, #0x21
    ldr r2, [r1, #0x10]
    mov r1, #0x0
    strb r5, [r2, #0x1f]
    strb r0, [r4, #0x0]
    ldr r0, .L_02159bc0
    strb r1, [r4, #0x1]
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02159bc0
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02159bc0
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02159bc0
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02159bc4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02159bbc: .word data_ov003_0215e740
.L_02159bc0: .word data_020a0e18
.L_02159bc4: .word func_ov003_02159828
    arm_func_end func_ov003_02159b08

    .global func_ov003_02159bc8
    arm_func_start func_ov003_02159bc8
func_ov003_02159bc8: ; 0x02159bc8
    ldr r2, [r0, #0x4]
    ldr r3, [r2, #0x10]
    ldrb r0, [r3, #0x2]
    cmp r0, #0xff
    moveq r1, #0x0
    beq .L_02159bec
    cmp r0, #0xfe
    moveq r1, #0x1
    movne r1, #0x2
.L_02159bec:
    ldr r2, [r2, #0x124]
    ldr ip, .L_02159c00
    ldr r0, [r3, #0x4c]
    sub r2, r2, #0x3
    bx ip
.L_02159c00: .word func_ov003_02159c04
    arm_func_end func_ov003_02159bc8

    .global func_ov003_02159c04
    arm_func_start func_ov003_02159c04
func_ov003_02159c04: ; 0x02159c04
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr ip, .L_02159c34
    mov r3, #0xc
    mla r3, r1, r3, ip
    ldr r1, [r3, r2, lsl #0x2]
    cmp r1, #0x0
    ldmltia sp!, {r3, pc}
    mov r2, #0x0
    blx func_ov012_021bd730
    ldmia sp!, {r3, pc}
.L_02159c34: .word data_ov003_0215d554
    arm_func_end func_ov003_02159c04

    .global func_ov003_02159c38
    arm_func_start func_ov003_02159c38
func_ov003_02159c38: ; 0x02159c38
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r0
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x820000
    mov r2, #0x13
    mov r3, #0x81
    bl func_ov003_0214d4a4
    mov ip, #0x1000
    mov r3, #0x0
    add r1, sp, #0x10
    add r2, sp, #0xc
    mov r5, r0
    str ip, [sp, #0xc]
    str r3, [sp, #0x10]
    bl func_ov003_0214e990
    mov r0, r4
    mov r1, r5
    bl func_ov003_0214e908
    ldr r1, [r4, #0x4]
    mov r0, #0x81000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, #0x100000
    str r1, [sp, #0x4]
    mov r1, #0x180000
    str r1, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    add r2, sp, #0x4
    bl func_ov003_0214e990
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov003_02159c38

    .global func_ov003_02159ce4
    arm_func_start func_ov003_02159ce4
func_ov003_02159ce4: ; 0x02159ce4
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr ip, [r0, #0x4]
    add r1, sp, #0x4
    ldrsh r3, [ip, #0xa2]
    add r2, sp, #0x0
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldrsh r3, [ip, #0xa0]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_02159ce4

    .global func_ov003_02159d1c
    arm_func_start func_ov003_02159d1c
func_ov003_02159d1c: ; 0x02159d1c
    ldr ip, .L_02159d28
    mov r1, #0x0
    bx ip
.L_02159d28: .word func_ov003_02159d5c
    arm_func_end func_ov003_02159d1c

    .global func_ov003_02159d2c
    arm_func_start func_ov003_02159d2c
func_ov003_02159d2c: ; 0x02159d2c
    ldr ip, .L_02159d38
    mov r1, #0x1
    bx ip
.L_02159d38: .word func_ov003_02159d5c
    arm_func_end func_ov003_02159d2c

    .global func_ov003_02159d3c
    arm_func_start func_ov003_02159d3c
func_ov003_02159d3c: ; 0x02159d3c
    ldr ip, .L_02159d48
    mov r1, #0x2
    bx ip
.L_02159d48: .word func_ov003_02159d5c
    arm_func_end func_ov003_02159d3c

    .global func_ov003_02159d4c
    arm_func_start func_ov003_02159d4c
func_ov003_02159d4c: ; 0x02159d4c
    ldr ip, .L_02159d58
    mov r1, #0x3
    bx ip
.L_02159d58: .word func_ov003_02159d5c
    arm_func_end func_ov003_02159d4c

    .global func_ov003_02159d5c
    arm_func_start func_ov003_02159d5c
func_ov003_02159d5c: ; 0x02159d5c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x15c
    mov r5, r1
    mov r6, r0
    ldr r1, .L_0215abdc
    ldr r2, .L_0215abe0
    mov r0, #0x100
    mov r3, #0xe4
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x100
    mov r10, r0
    bl func_020517fc
    mov r0, #0x8
    bl func_0207367c
    mov r0, #0x3a
    bl func_020736b4
    bl func_02020d90
    mov r1, #0x85000
    str r1, [sp, #0x58]
    mov r4, r0
    add r1, sp, #0x58
    bl func_ov003_02152730
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215abe4
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    cmp r6, #0x0
    ldr r0, [r4, #0x4]
    bne .L_02159df8
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_02159e08
.L_02159df8:
    ldr r2, [r0, #0x0]
    ldr r1, [r6, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_02159e08:
    str r4, [r10, #0x4]
    mov r0, #0x0
    bl func_02028920
    str r0, [r10, #0xc]
    and r0, r5, #0xff
    cmp r0, #0x3
    strb r5, [r10, #0x2]
    ldrne r0, .L_0215abe8
    movne r1, #0x0
    bne .L_02159e48
    ldr r0, .L_0215abec
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    ldr r0, .L_0215abe8
    mov r1, #0x1
.L_02159e48:
    strb r1, [r0, #0x0]
    mov r0, #0x0
    bl func_02043264
    ldr r0, .L_0215abec
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    bl func_0203d4e4
    mov r0, #0x0
    bl func_0203b414
    ldr r5, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    str r0, [sp, #0x38]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x38
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r5, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r5, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3000
    str r0, [sp, #0x3c]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x3c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r5, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, .L_0215abe8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    ldr r0, [r5, #0x4]
    beq .L_02159f70
    ldr r2, [r0, #0x0]
    mov r1, #0x4000
    ldr r2, [r2, #0x90]
    blx r2
    b .L_02159f80
.L_02159f70:
    ldr r2, [r0, #0x0]
    mov r1, #0x8000
    ldr r2, [r2, #0x90]
    blx r2
.L_02159f80:
    mov r0, #0x2000
    str r0, [sp, #0x40]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x40
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r5, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, #0x8
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, .L_0215abe8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    ldr r0, [r5, #0x4]
    beq .L_02159ff8
    ldr r2, [r0, #0x0]
    mov r1, #0xc000
    ldr r2, [r2, #0x90]
    blx r2
    b .L_0215a008
.L_02159ff8:
    ldr r2, [r0, #0x0]
    mov r1, #0x8000
    ldr r2, [r2, #0x90]
    blx r2
.L_0215a008:
    mov r0, #0x1000
    str r0, [sp, #0x44]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x44
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r5, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r5, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3000
    str r0, [sp, #0x48]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x48
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r5, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, #0x4
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r5, #0x4]
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2000
    str r0, [sp, #0x4c]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x4c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r5, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, #0x8
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, .L_0215abe8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    ldr r0, [r5, #0x4]
    beq .L_0215a15c
    ldr r2, [r0, #0x0]
    mov r1, #0xc000
    ldr r2, [r2, #0x90]
    blx r2
    b .L_0215a16c
.L_0215a15c:
    ldr r2, [r0, #0x0]
    mov r1, #0x8000
    ldr r2, [r2, #0x90]
    blx r2
.L_0215a16c:
    mov r0, #0x1000
    str r0, [sp, #0x50]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x50
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r5, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r5, #0x4]
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, #0x8
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, .L_0215abe8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    ldr r0, [r5, #0x4]
    beq .L_0215a1e4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x90]
    blx r2
    b .L_0215a1f4
.L_0215a1e4:
    ldr r2, [r0, #0x0]
    mov r1, #0x8000
    ldr r2, [r2, #0x90]
    blx r2
.L_0215a1f4:
    mov r0, #0x0
    str r0, [sp, #0x54]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x54
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r7, .L_0215abf0
    ldr r6, .L_0215abf4
    ldr r5, .L_0215abf8
    mov r8, #0x0
.L_0215a220:
    cmp r8, #0x3
    ldrsb r0, [r7, r8]
    blt .L_0215a234
    bl func_0203b424
    b .L_0215a238
.L_0215a234:
    bl func_0203b414
.L_0215a238:
    ldr r2, [r0, #0x88]
    ldrb r0, [r10, #0x2]
    cmp r0, #0x3
    bne .L_0215a270
    cmp r8, #0x6
    beq .L_0215a294
    add r0, r6, r8, lsl #0x2
    add r1, r5, r8, lsl #0x2
    ldr r0, [r0, #0x1c]
    ldr r1, [r1, #0x1c]
    bl func_ov003_0214d3a8
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x1c]
    b .L_0215a294
.L_0215a270:
    cmp r8, #0x2
    cmpne r8, #0x5
    cmpne r8, #0x6
    beq .L_0215a294
    ldr r0, [r6, r8, lsl #0x2]
    ldr r1, [r5, r8, lsl #0x2]
    bl func_ov003_0214d3a8
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x1c]
.L_0215a294:
    add r8, r8, #0x1
    cmp r8, #0x7
    blt .L_0215a220
    ldrb r0, [r10, #0x2]
    cmp r0, #0x3
    beq .L_0215a464
    ldr r0, .L_0215abfc
    mov r1, #0x0
    blx func_020101f4
    ldr r1, .L_0215ac00
    ldr r2, .L_0215ac04
    mov r7, r0
    ldr r1, [r1, #0x0]
    add r0, sp, #0xdc
    ldrsb r5, [r2, #0x12]
    bl func_02074000
    ldr r1, .L_0215ac08
    add r0, sp, #0xdc
    ldr r6, [r1, r5, lsl #0x3]
    mov r1, r6
    bl func_020741bc
    ldr r1, .L_0215ac00
    add r0, sp, #0xdc
    ldr r1, [r1, #0x1c]
    bl func_020741bc
    ldr r1, .L_0215ac00
    add r0, sp, #0xdc
    ldr r1, [r1, #0x4]
    bl func_020741bc
    ldr r1, .L_0215ac00
    add r0, sp, #0x5c
    ldr r1, [r1, #0x0]
    bl func_02074000
    mov r1, r6
    add r0, sp, #0x5c
    bl func_020741bc
    ldr r1, .L_0215ac00
    add r0, sp, #0x5c
    ldr r1, [r1, #0x28]
    bl func_020741bc
    ldr r1, .L_0215ac00
    add r0, sp, #0x5c
    ldr r1, [r1, #0x8]
    bl func_020741bc
    add r0, sp, #0xdc
    bl func_02033bb8
    cmp r0, #0x0
    add r0, sp, #0x5c
    moveq r5, #0xc
    bl func_02033bb8
    cmp r0, #0x0
    ldr r0, .L_0215ac08
    moveq r5, #0xc
    ldr r9, [r0, r5, lsl #0x3]
    ldr r6, .L_0215ac0c
    ldr r5, .L_0215ac00
    mov r8, #0x0
    add r11, sp, #0xdc
.L_0215a37c:
    ldr r1, [r5, #0x0]
    mov r0, r11
    bl func_02074000
    mov r0, r11
    mov r1, r9
    bl func_020741bc
    ldr r1, [r6, r8, lsl #0x2]
    mov r0, r11
    bl func_020741bc
    ldr r1, [r5, #0x4]
    mov r0, r11
    bl func_020741bc
    ldr r1, [r5, #0x0]
    add r0, sp, #0x5c
    bl func_02074000
    add r0, sp, #0x5c
    mov r1, r9
    bl func_020741bc
    add r1, r6, r8, lsl #0x2
    ldr r1, [r1, #0xc]
    add r0, sp, #0x5c
    bl func_020741bc
    ldr r1, [r5, #0x8]
    add r0, sp, #0x5c
    bl func_020741bc
    cmp r8, #0x0
    bne .L_0215a408
    mov r0, r11
    bl func_02033bb8
    cmp r0, #0x0
    bne .L_0215a408
    add r0, sp, #0x5c
    bl func_02033bb8
    cmp r0, #0x0
    beq .L_0215a448
.L_0215a408:
    cmp r8, #0x0
    beq .L_0215a41c
    mov r0, r8
    bl func_0203b424
    b .L_0215a424
.L_0215a41c:
    mov r0, #0x3
    bl func_0203b414
.L_0215a424:
    ldr r2, [r0, #0x88]
    mov r0, r11
    add r1, sp, #0x5c
    bl func_ov003_0214d3a8
    cmp r8, #0x0
    addne r1, r8, #0x4
    moveq r1, #0x2
    add r1, r10, r1, lsl #0x2
    str r0, [r1, #0x1c]
.L_0215a448:
    add r8, r8, #0x1
    cmp r8, #0x3
    blt .L_0215a37c
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215a464:
    mov r7, #0x0
    ldr r6, .L_0215ac10
    mov r5, r7
.L_0215a470:
    ldr r0, [r6, r7, lsl #0x2]
    mov r1, r5
    blx func_020101f4
    add r1, r10, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0x10]
    cmp r7, #0x3
    blt .L_0215a470
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x100
    str r1, [r0, #0x124]
    str r8, [r10, #0x38]
    mov r7, #0x0
.L_0215a4c4:
    ldr r1, .L_0215ac14
    mov r0, r8
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r9, r0
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r9, #0x4]
    cmp r7, #0x0
    str r7, [r0, #0x124]
    bne .L_0215a530
    mov r2, #0x84000
    add r1, sp, #0x30
    mov r0, r9
    str r2, [sp, #0x30]
    bl func_ov003_02152730
    ldr r0, [r9, #0x4]
    ldr r1, .L_0215ac18
    bl func_02028384
    ldr r0, [r9, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
.L_0215a530:
    ldr r1, .L_0215ac1c
    add r2, r10, r7, lsl #0x2
    add r0, r7, r7, lsl #0x1
    str r9, [r2, #0x4c]
    add r11, r1, r0
    mov r6, #0x0
.L_0215a548:
    ldrsb r0, [r11, r6]
    cmp r0, #0x0
    blt .L_0215a584
    add r0, r10, r0, lsl #0x2
    ldr r5, [r0, #0x1c]
    cmp r5, #0x0
    beq .L_0215a584
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r9
    mov r1, r5
    bl func_ov003_0214e908
.L_0215a584:
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_0215a548
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_0215a4c4
    ldrb r0, [r10, #0x2]
    cmp r0, #0x3
    bne .L_0215a69c
    ldr r0, .L_0215ac20
    ldr r1, [r0, #0x4]
    ldr r0, [r0, #0x0]
    str r1, [sp, #0x2c]
    str r0, [sp, #0x28]
    bl func_0203b3e4
    mov r2, #0x11
    str r2, [sp, #0x0]
    add r1, sp, #0x28
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r2, .L_0215ac24
    mov r0, r8
    mov r3, #0x0
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x3
    str r1, [r0, #0x124]
    ldr r7, .L_0215ac28
    ldr r6, .L_0215ac2c
    ldr r11, .L_0215ac24
    str r5, [r10, #0x58]
    mov r9, #0x0
.L_0215a61c:
    cmp r9, #0x0
    beq .L_0215a62c
    bl func_0203b3f4
    b .L_0215a630
.L_0215a62c:
    bl func_0203b3e4
.L_0215a630:
    ldr r1, [r0, #0x88]
    add r0, r9, r9, lsl #0x1
    add r3, r7, r0
    ldrb r2, [r3, #0x8]
    add r0, r9, #0x2
    add r0, r6, r0, lsl #0x3
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldrb r3, [r3, #0x7]
    mov r0, r8
    mov r2, r11
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    add r1, r9, #0x5
    str r1, [r0, #0x124]
    add r0, r10, r9, lsl #0x2
    add r9, r9, #0x1
    str r5, [r0, #0x60]
    cmp r9, #0x2
    blt .L_0215a61c
    b .L_0215a75c
.L_0215a69c:
    ldr r11, .L_0215ac28
    mov r7, #0x0
.L_0215a6a4:
    cmp r7, #0x0
    cmpne r7, #0x4
    addne r0, r7, r7, lsl #0x1
    addne r6, r11, r0
    ldrneb r5, [r6, #0x1]
    bne .L_0215a6d4
    add r0, r7, r7, lsl #0x1
    add r6, r11, r0
    ldrb r1, [r10, #0x2]
    ldrb r0, [r6, #0x1]
    add r0, r1, r0
    and r5, r0, #0xff
.L_0215a6d4:
    ldrb r0, [r6, #0x0]
    cmp r0, #0x0
    ldrne r0, .L_0215ac30
    addne r9, r0, #0x10000
    ldreq r9, .L_0215ac30
    cmp r7, #0x3
    blt .L_0215a6f8
    bl func_0203b3f4
    b .L_0215a6fc
.L_0215a6f8:
    bl func_0203b3e4
.L_0215a6fc:
    ldrb r6, [r6, #0x2]
    ldr r1, [r0, #0x88]
    mov r3, r5
    ldr r5, .L_0215ac2c
    mov r0, r8
    mov r2, r9
    str r6, [sp, #0x0]
    add r5, r5, r7, lsl #0x3
    str r5, [sp, #0x4]
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    add r1, r7, #0x3
    str r1, [r0, #0x124]
    add r0, r10, r7, lsl #0x2
    add r7, r7, #0x1
    str r5, [r0, #0x58]
    cmp r7, #0x5
    blt .L_0215a6a4
.L_0215a75c:
    ldrb r0, [r10, #0x2]
    cmp r0, #0x3
    beq .L_0215a7e4
    ldr r0, [r10, #0x2c]
    bl func_ov003_02157f9c
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0xc1
    mov r2, #0xc
    mov r3, #0x0
    bl func_0206ad90
    str r0, [r10, #0xe4]
    mov r1, #0xa
    strb r1, [r0, #0x17]
    mov r1, #0x8
    strb r1, [r0, #0x16]
    mov r1, #0x1
    strb r1, [r0, #0x19]
    bl func_02020d90
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215ac34
    bl func_02028384
    mov r0, #0x81000
    str r0, [sp, #0x34]
    add r1, sp, #0x34
    mov r0, r5
    bl func_ov003_02152730
    ldr r0, [r5, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    str r5, [r10, #0x8]
.L_0215a7e4:
    ldrb r0, [r10, #0x2]
    cmp r0, #0x3
    beq .L_0215a898
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r2, .L_0215ac38
    mov r1, #0x80
    str r2, [r0, #0x124]
    str r5, [r10, #0x3c]
    mov r0, #0x70
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    bl func_0203b3e4
    mov r2, #0x12
    str r2, [sp, #0x0]
    add r1, sp, #0x20
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r2, .L_0215ac30
    mov r0, r5
    mov r3, #0x7
    bl func_ov003_0214d554
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r2, #0x8
    str r2, [r0, #0x124]
    ldr r0, [r5, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215ac3c
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215ac3c
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    ldr r2, .L_0215ac40
    mov r1, #0x10
    blx func_ov012_021b6760
    str r5, [r10, #0x6c]
.L_0215a898:
    ldrb r0, [r10, #0x2]
    cmp r0, #0x3
    beq .L_0215a978
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r9, r0
    ldr r0, [r9, #0x4]
    ldr r1, .L_0215ac44
    ldr r7, .L_0215ac48
    str r1, [r0, #0x124]
    ldr r11, .L_0215ac4c
    mov r5, #0x0
    str r9, [r10, #0x40]
.L_0215a8cc:
    cmp r5, #0x1
    addne r0, r5, r5, lsl #0x1
    ldrneb r8, [r7, r0]
    addne r6, r7, r0
    bne .L_0215a8f8
    add r2, r5, r5, lsl #0x1
    ldrb r1, [r10, #0x2]
    ldrb r0, [r7, r2]
    add r6, r7, r2
    add r0, r1, r0
    and r8, r0, #0xff
.L_0215a8f8:
    cmp r5, #0x2
    blt .L_0215a908
    bl func_0203b3f4
    b .L_0215a90c
.L_0215a908:
    bl func_0203b3e4
.L_0215a90c:
    ldrb r6, [r6, #0x1]
    ldr r1, [r0, #0x88]
    ldr r2, .L_0215ac30
    str r6, [sp, #0x0]
    add r6, r11, r5, lsl #0x3
    mov r0, r9
    mov r3, r8
    str r6, [sp, #0x4]
    bl func_ov003_0214d554
    mov r6, r0
    orr r8, r8, #0x81000
    ldr r0, [r6, #0x4]
    add r1, r5, #0x9
    str r1, [r0, #0x124]
    orr r8, r8, #0x800000
    ldr r0, [r6, #0x4]
    mov r1, r8
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x4]
    mov r1, r8
    blx func_ov012_021b4034
    add r0, r10, r5, lsl #0x2
    add r5, r5, #0x1
    str r6, [r0, #0x70]
    cmp r5, #0x4
    blt .L_0215a8cc
.L_0215a978:
    ldrb r0, [r10, #0x2]
    cmp r0, #0x3
    bne .L_0215aa50
    mov r0, r10
    bl func_ov003_0214d6b0
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r2, .L_0215ac50
    mov r0, #0x80
    str r2, [r1, #0x124]
    str r5, [r10, #0x44]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    bl func_0203b3f4
    mov r2, #0x18
    str r2, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r2, .L_0215ac24
    mov r0, r5
    mov r3, #0x3
    bl func_ov003_0214d554
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r2, #0xd
    str r2, [r0, #0x124]
    ldr r1, .L_0215ac54
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215ac54
    blx func_ov012_021b4034
    str r6, [r10, #0x80]
    mov r0, #0x80
    str r0, [sp, #0x18]
    mov r0, #0x50
    str r0, [sp, #0x1c]
    bl func_0203b3f4
    mov r1, #0x11
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    ldr r2, .L_0215ac24
    mov r0, r5
    mov r3, #0x4
    bl func_ov003_0214d554
    ldr r1, [r0, #0x4]
    mov r2, #0xe
    str r2, [r1, #0x124]
    str r0, [r10, #0x84]
.L_0215aa50:
    mov r0, r10
    bl func_ov003_0214d6b0
    ldr r1, .L_0215ac14
    str r0, [r10, #0x48]
    ldr r1, [r1, #0x0]
    bl func_ov003_0214e8bc
    mov r6, r0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r1, .L_0215ac58
    mov r2, #0x0
    mov r3, #0x3e
    bl func_ov003_0214d4a4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0xc]
    str r0, [sp, #0x8]
    mov r0, r5
    add r1, sp, #0x8
    add r2, sp, #0xc
    bl func_ov003_0214e990
    mov r1, r5
    mov r0, r6
    bl func_ov003_0214e908
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215ac58
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215ac58
    blx func_ov012_021b4034
    mov r1, #0x50000
    str r1, [sp, #0x14]
    mov r1, #0x80000
    str r1, [sp, #0x10]
    mov r0, r6
    add r1, sp, #0x10
    add r2, sp, #0x14
    bl func_ov003_0214e990
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r10, #0x3c]
    cmp r0, #0x0
    beq .L_0215ab2c
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_0215ab2c:
    ldr r0, [r10, #0x44]
    cmp r0, #0x0
    beq .L_0215ab4c
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_0215ab4c:
    ldr r2, .L_0215ac5c
    mov r1, #0x0
    mov r0, #0x1
    str r1, [r2, #0x0]
    blx func_ov012_021b7260
    mov r0, #0x2
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x8
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x4
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x10000
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x10
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x20
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x10000
    mov r1, #0x0
    blx func_ov012_021b7260
    mov r0, #0x20000
    mov r1, #0x0
    blx func_ov012_021b7260
    ldrb r0, [r10, #0x2]
    bl func_ov003_0214d774
    blx func_ov012_021c5498
    strb r0, [r10, #0x1]
    mov r0, r4
    add sp, sp, #0x15c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215abdc: .word data_ov003_0215eaec
.L_0215abe0: .word data_ov003_0215e990
.L_0215abe4: .word func_ov003_0215ac60
.L_0215abe8: .word data_ov003_0215ec3c
.L_0215abec: .word data_020a0f64
.L_0215abf0: .word data_ov003_0215d57c
.L_0215abf4: .word data_ov003_0215e924
.L_0215abf8: .word data_ov003_0215e8ec
.L_0215abfc: .word data_ov003_0215eb00
.L_0215ac00: .word data_ov003_0215e8bc
.L_0215ac04: .word data_020afedc
.L_0215ac08: .word data_020924b0
.L_0215ac0c: .word data_ov003_0215e8d4
.L_0215ac10: .word data_ov003_0215e8c8
.L_0215ac14: .word data_ov012_021d5154
.L_0215ac18: .word func_ov003_0215b330
.L_0215ac1c: .word data_ov003_0215d58c
.L_0215ac20: .word data_ov003_0215d584
.L_0215ac24: .word 0x891000
.L_0215ac28: .word data_ov003_0215d5a1
.L_0215ac2c: .word data_ov003_0215d5f4
.L_0215ac30: .word 0x881000
.L_0215ac34: .word func_ov003_0215b3b0
.L_0215ac38: .word 0x101
.L_0215ac3c: .word 0x881007
.L_0215ac40: .word func_ov003_0215b380
.L_0215ac44: .word 0x102
.L_0215ac48: .word data_ov003_0215d595
.L_0215ac4c: .word data_ov003_0215d5d4
.L_0215ac50: .word 0x103
.L_0215ac54: .word 0x891003
.L_0215ac58: .word 0x8c1000
.L_0215ac5c: .word data_ov012_021d514c
    arm_func_end func_ov003_02159d5c

    .global func_ov003_0215ac60
    arm_func_start func_ov003_0215ac60
func_ov003_0215ac60: ; 0x0215ac60
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x3a
    mov r1, #0x0
    bl func_020736e4
    bl func_02054b44
    str r0, [r4, #0xf8]
    str r1, [r4, #0xfc]
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215aca4
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215aca4: .word func_ov003_0215ae24
    arm_func_end func_ov003_0215ac60

    .global func_ov003_0215aca8
    arm_func_start func_ov003_0215aca8
func_ov003_0215aca8: ; 0x0215aca8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0215acdc
    bl func_ov003_0214d47c
.L_0215acdc:
    ldrb r2, [r4, #0x2]
    ldr r1, .L_0215ae1c
    ldrsb r3, [r4, #0x1]
    ldrb r1, [r1, r2]
    mov r2, #0x1f
    bl func_ov003_0214d28c
    mov r7, #0x0
    ldr r5, .L_0215ae20
    mov r6, r7
.L_0215ad00:
    add r0, r4, r7, lsl #0x2
    ldr r1, [r0, #0x88]
    cmp r1, #0x0
    beq .L_0215ad20
    ldr r0, [r5, #0x0]
    bl func_02042660
    add r0, r4, r7, lsl #0x2
    str r6, [r0, #0x88]
.L_0215ad20:
    add r7, r7, #0x1
    cmp r7, #0x16
    blt .L_0215ad00
    ldr r0, [r4, #0xe0]
    cmp r0, #0x0
    beq .L_0215ad44
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r4, #0xe0]
.L_0215ad44:
    ldr r0, [r4, #0xe4]
    cmp r0, #0x0
    beq .L_0215ad5c
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r4, #0xe4]
.L_0215ad5c:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215ad7c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0215ad7c:
    mov r6, #0x0
    mov r5, r6
.L_0215ad84:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_0215ada8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x38]
.L_0215ada8:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_0215ad84
    mov r6, #0x0
    mov r5, r6
.L_0215adbc:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_0215ade0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x10]
.L_0215ade0:
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_0215adbc
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0215ae0c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_0215ae0c:
    blx func_ov012_021b65cc
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215ae1c: .word data_ov003_0215d578
.L_0215ae20: .word data_020a0f64
    arm_func_end func_ov003_0215aca8

    .global func_ov003_0215ae24
    arm_func_start func_ov003_0215ae24
func_ov003_0215ae24: ; 0x0215ae24
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02054b44
    ldr r3, [r4, #0xf8]
    ldr r2, [r4, #0xfc]
    subs r3, r0, r3
    sbc r1, r1, r2
    ldr r0, .L_0215b028
    cmp r1, #0x0
    cmpeq r3, r0
    ldmloia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r0, [r4, #0x1]
    cmp r0, #0x0
    beq .L_0215b00c
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    bl func_02054b44
    str r0, [r4, #0xf8]
    str r1, [r4, #0xfc]
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215b02c
    bl func_02028384
    mov r0, #0x8
    mov r1, #0x0
    mov r2, #0x3f
    bl func_02073f64
    mov r0, #0x11
    mov r1, #0x0
    mov r2, #0x3f
    bl func_02073fa4
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r2, [r0, #0x4]
    mov r0, #0x1f
    strb r1, [r2, #0x901]
    str r0, [r2, #0x8c8]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r2, [r0, #0x4]
    mov r0, #0x0
    strb r1, [r2, #0x901]
    strb r0, [r2, #0x8fd]
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    mov r0, #0x1
    ldr r1, [r1, #0x4]
    strb r0, [r1, #0x8ff]
    strb r0, [r1, #0x901]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r2, [r0, #0x4]
    mov r0, #0x1f
    strb r1, [r2, #0x901]
    str r0, [r2, #0x8d4]
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    mov r0, #0x1
    ldr r2, [r1, #0x4]
    ldr r7, .L_0215b030
    ldr r1, [r2, #0x8bc]
    ldr r6, .L_0215b034
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r2, #0x8bc]
    mov r5, #0x0
    strb r0, [r2, #0x901]
.L_0215af58:
    ldr r0, [r6, #0x0]
    mov r2, r7
    mov r3, r4
    add r1, r5, #0x10
    bl func_02042460
    add r1, r4, r5, lsl #0x2
    add r5, r5, #0x1
    str r0, [r1, #0x88]
    cmp r5, #0xa
    blt .L_0215af58
    ldr r0, .L_0215b034
    ldr r2, .L_0215b038
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r5, #0x10
    bl func_02042460
    add r1, r4, r5, lsl #0x2
    ldr r7, .L_0215b03c
    ldr r6, .L_0215b034
    str r0, [r1, #0x88]
    add r5, r5, #0x1
    mov r8, #0x9
.L_0215afb0:
    ldr r0, [r6, #0x0]
    mov r2, r7
    mov r3, r4
    rsb r1, r8, #0x9c
    bl func_02042460
    add r1, r4, r5, lsl #0x2
    str r0, [r1, #0x88]
    add r5, r5, #0x1
    subs r8, r8, #0x1
    bpl .L_0215afb0
    ldr r0, .L_0215b034
    ldr r2, .L_0215b040
    ldr r0, [r0, #0x0]
    mov r1, #0x9d
    mov r3, #0x0
    bl func_02042460
    add r2, r4, r5, lsl #0x2
    str r0, [r2, #0x88]
    ldr r1, .L_0215b044
    mov r0, #0x1
    strh r1, [r4, #0xec]
    strh r0, [r4, #0xee]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0215b00c:
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215b048
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0215b028: .word 0x4c4b40
.L_0215b02c: .word func_ov003_0215b04c
.L_0215b030: .word func_ov003_0215b270
.L_0215b034: .word data_020a0f64
.L_0215b038: .word func_ov003_0215b1fc
.L_0215b03c: .word func_ov003_0215b2c4
.L_0215b040: .word func_ov003_0215b318
.L_0215b044: .word 0x13a
.L_0215b048: .word func_ov003_0215aca8
    arm_func_end func_ov003_0215ae24

    .global func_ov003_0215b04c
    arm_func_start func_ov003_0215b04c
func_ov003_0215b04c: ; 0x0215b04c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02054b44
    ldr r3, [r4, #0xf8]
    ldr r2, [r4, #0xfc]
    subs r3, r0, r3
    sbc r1, r1, r2
    ldr r0, .L_0215b1f4
    cmp r1, #0x0
    cmpeq r3, r0
    blo .L_0215b098
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215b1f8
    bl func_02028384
.L_0215b098:
    ldrh r1, [r4, #0xee]
    cmp r1, #0xe8
    bgt .L_0215b138
    bge .L_0215b1d0
    cmp r1, #0xe0
    bgt .L_0215b128
    bge .L_0215b1c4
    sub r0, r1, #0x4
    cmp r0, #0x18
    addls pc, pc, r0, lsl #0x2
    b .L_0215b1e4
.L_0215b0c4: ; jump table
    b .L_0215b164 ; case 0
    b .L_0215b1e4 ; case 1
    b .L_0215b170 ; case 2
    b .L_0215b1e4 ; case 3
    b .L_0215b17c ; case 4
    b .L_0215b1e4 ; case 5
    b .L_0215b188 ; case 6
    b .L_0215b1e4 ; case 7
    b .L_0215b194 ; case 8
    b .L_0215b1e4 ; case 9
    b .L_0215b1ac ; case 10
    b .L_0215b1e4 ; case 11
    b .L_0215b1b8 ; case 12
    b .L_0215b1e4 ; case 13
    b .L_0215b1e4 ; case 14
    b .L_0215b1e4 ; case 15
    b .L_0215b1ac ; case 16
    b .L_0215b1e4 ; case 17
    b .L_0215b1e4 ; case 18
    b .L_0215b1e4 ; case 19
    b .L_0215b1b8 ; case 20
    b .L_0215b1e4 ; case 21
    b .L_0215b1e4 ; case 22
    b .L_0215b1e4 ; case 23
    b .L_0215b1ac ; case 24
.L_0215b128:
    cmp r1, #0xe4
    moveq r0, #0x8b
    streqh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b138:
    cmp r1, #0xee
    bgt .L_0215b154
    bge .L_0215b1dc
    cmp r1, #0xec
    moveq r0, #0x1c
    streqh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b154:
    cmp r1, #0xf0
    mvneq r0, #0x3b
    streqh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b164:
    mov r0, #0x10c
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b170:
    mov r0, #0xec
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b17c:
    mov r0, #0xcd
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b188:
    mov r0, #0xb4
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b194:
    mov r2, #0x9c
    mov r0, #0x78
    mov r1, #0xb
    strh r2, [r4, #0xec]
    bl func_0207342c
    b .L_0215b1e4
.L_0215b1ac:
    mov r0, #0x80
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b1b8:
    mov r0, #0x7e
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b1c4:
    mov r0, #0x88
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b1d0:
    mov r0, #0x64
    strh r0, [r4, #0xec]
    b .L_0215b1e4
.L_0215b1dc:
    mvn r0, #0x3
    strh r0, [r4, #0xec]
.L_0215b1e4:
    ldrh r0, [r4, #0xee]
    add r0, r0, #0x1
    strh r0, [r4, #0xee]
    ldmia sp!, {r3, r4, r5, pc}
.L_0215b1f4: .word 0x2dc6c0
.L_0215b1f8: .word func_ov003_0215aca8
    arm_func_end func_ov003_0215b04c

    .global func_ov003_0215b1fc
    arm_func_start func_ov003_0215b1fc
func_ov003_0215b1fc: ; 0x0215b1fc
    ldrsh r1, [r1, #0xec]
    ldr ip, .L_0215b238
    mov r3, #0x9c
    sub r0, r1, #0x3a
    cmp r0, #0xff
    add r2, r1, #0x3a
    movgt r0, #0xff
    cmp r0, #0x0
    movlt r0, #0x0
    cmp r2, #0xff
    movgt r2, #0xff
    cmp r2, #0x0
    movlt r2, #0x0
    mov r1, #0x10
    bx ip
.L_0215b238: .word func_ov003_0215b23c
    arm_func_end func_ov003_0215b1fc

    .global func_ov003_0215b23c
    arm_func_start func_ov003_0215b23c
func_ov003_0215b23c: ; 0x0215b23c
    mov ip, r0, lsl #0x8
    mov r0, r1, lsl #0x8
    and ip, ip, #0xff00
    and r1, r2, #0xff
    ldr r2, .L_0215b26c
    orr ip, ip, r1
    and r1, r0, #0xff00
    and r0, r3, #0xff
    strh ip, [r2, #0x0]
    orr r0, r1, r0
    strh r0, [r2, #0x4]
    bx lr
.L_0215b26c: .word 0x4001040
    arm_func_end func_ov003_0215b23c

    .global func_ov003_0215b270
    arm_func_start func_ov003_0215b270
func_ov003_0215b270: ; 0x0215b270
    sub r2, r0, #0x10
    ldr r0, .L_0215b2bc
    mov r2, r2, lsl #0x1
    ldrsh r2, [r0, r2]
    ldrsh r1, [r1, #0xec]
    ldr ip, .L_0215b2c0
    mov r3, #0x9c
    sub r0, r1, r2, asr #0x1
    cmp r0, #0xff
    add r2, r1, r2, asr #0x1
    movgt r0, #0xff
    cmp r0, #0x0
    movlt r0, #0x0
    cmp r2, #0xff
    movgt r2, #0xff
    cmp r2, #0x0
    movlt r2, #0x0
    mov r1, #0x10
    bx ip
.L_0215b2bc: .word data_ov003_0215d5c0
.L_0215b2c0: .word func_ov003_0215b23c
    arm_func_end func_ov003_0215b270

    .global func_ov003_0215b2c4
    arm_func_start func_ov003_0215b2c4
func_ov003_0215b2c4: ; 0x0215b2c4
    sub r2, r0, #0x92
    ldr r0, .L_0215b310
    mov r2, r2, lsl #0x1
    ldrsh r2, [r0, r2]
    ldrsh r1, [r1, #0xec]
    ldr ip, .L_0215b314
    mov r3, #0x9c
    sub r0, r1, r2, asr #0x1
    cmp r0, #0xff
    add r2, r1, r2, asr #0x1
    movgt r0, #0xff
    cmp r0, #0x0
    movlt r0, #0x0
    cmp r2, #0xff
    movgt r2, #0xff
    cmp r2, #0x0
    movlt r2, #0x0
    mov r1, #0x10
    bx ip
.L_0215b310: .word data_ov003_0215d61c
.L_0215b314: .word func_ov003_0215b23c
    arm_func_end func_ov003_0215b2c4

    .global func_ov003_0215b318
    arm_func_start func_ov003_0215b318
func_ov003_0215b318: ; 0x0215b318
    ldr r0, .L_0215b32c
    mov r1, #0x0
    strh r1, [r0, #0x0]
    strh r1, [r0, #0x4]
    bx lr
.L_0215b32c: .word 0x4001040
    arm_func_end func_ov003_0215b318

    .global func_ov003_0215b330
    arm_func_start func_ov003_0215b330
func_ov003_0215b330: ; 0x0215b330
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0xe8]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0xe8]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0xe8]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov003_0214e990
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215b330

    .global func_ov003_0215b380
    arm_func_start func_ov003_0215b380
func_ov003_0215b380: ; 0x0215b380
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x40]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215b380

    .global func_ov003_0215b3b0
    arm_func_start func_ov003_0215b3b0
func_ov003_0215b3b0: ; 0x0215b3b0
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r1, [r4, #0xf2]
    add r0, r1, #0x1
    strb r0, [r4, #0xf2]
    cmp r1, #0xa
    blo .L_0215b43c
    ldr r0, [r4, #0x20]
    bl func_ov003_02157f9c
    ldrb r1, [r4, #0xf3]
    ldr ip, .L_0215b444
    add r2, r1, #0x1
    and r1, r2, #0xff
    cmp r1, #0x4
    strb r2, [r4, #0xf3]
    movhs r1, #0x0
    strhsb r1, [r4, #0xf3]
    ldrb r2, [r4, #0xf3]
    ldr r1, .L_0215b448
    mov r2, r2, lsl #0x1
    ldrh r3, [r1, r2]
    add r1, sp, #0x0
    mov r2, #0xc2
    strh r3, [sp, #0x0]
    ldrb lr, [r4, #0xf3]
    mov r3, #0x1
    mov lr, lr, lsl #0x1
    ldrh ip, [ip, lr]
    strh ip, [sp, #0x2]
    ldr r0, [r0, #0x4]
    bl func_02029c68
    mov r0, #0x0
    strb r0, [r4, #0xf2]
.L_0215b43c:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0215b444: .word data_ov003_0215d5b8
.L_0215b448: .word data_ov003_0215d5b0
    arm_func_end func_ov003_0215b3b0

    .global func_ov003_0215b44c
    arm_func_start func_ov003_0215b44c
func_ov003_0215b44c: ; 0x0215b44c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215b540
    mov r6, r0
    ldr r2, .L_0215b544
    mov r0, #0xc
    mov r3, #0x61
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0xc
    mov r5, r0
    bl func_020517fc
    bl func_02020d90
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    cmp r6, #0x0
    ldr r0, [r4, #0x4]
    bne .L_0215b4b8
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_0215b4c8
.L_0215b4b8:
    ldr r2, [r0, #0x0]
    ldr r1, [r6, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_0215b4c8:
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215b548
    bl func_02028384
    mov r0, #0x85000
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    str r4, [r5, #0x4]
    ldr r0, [r6, #0x4]
    mov r2, #0x10
    ldr r1, [r0, #0x10]
    ldr r0, .L_0215b54c
    ldrb r3, [r1, #0x1e]
    mov r1, #0x0
    strb r3, [r5, #0x2]
    strb r2, [r5, #0x0]
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    mov r0, #0x0
    bl func_02043264
    bl func_0203d4e4
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0215b540: .word data_ov003_0215eb24
.L_0215b544: .word data_ov003_0215eb14
.L_0215b548: .word func_ov003_0215b550
.L_0215b54c: .word data_020a0f64
    arm_func_end func_ov003_0215b44c

    .global func_ov003_0215b550
    arm_func_start func_ov003_0215b550
func_ov003_0215b550: ; 0x0215b550
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215b6cc
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl func_ov012_021ba49c
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldrb r2, [r4, #0x2]
    ldr r0, [r0, #0x10]
    ldr r7, .L_0215b6d4
    ldrb r1, [r0, #0x21]
    mov r0, #0x18
    ldr r3, .L_0215b6d8
    cmp r1, #0x3
    movhi r1, #0x3
    mul r5, r1, r0
    mov r0, #0x60
    smulbb r2, r2, r0
    ldr r1, .L_0215b6dc
    ldr r0, .L_0215b6e0
    add r1, r1, r2
    add r0, r0, r2
    ldr r1, [r5, r1]
    add lr, r3, r2
    ldr ip, .L_0215b6e4
    ldr r3, .L_0215b6e8
    add r7, r7, r2
    str r1, [sp, #0x0]
    ldr r0, [r5, r0]
    add r3, r3, r2
    str r0, [sp, #0x4]
    ldr r1, [r5, r7]
    add ip, ip, r2
    str r1, [sp, #0x8]
    ldr r0, [r5, lr]
    ldr r2, [r5, ip]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x8]
    ldr r3, [r5, r3]
    mov r1, #0x1
    bl func_ov012_021bac28
    ldrb r2, [r4, #0x2]
    ldr r1, .L_0215b6e4
    mov r0, #0x60
    mla r0, r2, r0, r1
    ldr r1, [r5, r0]
    mov r0, #0x0
    blx func_02072870
    ldrb r2, [r4, #0x2]
    ldr r1, .L_0215b6e8
    mov r0, #0x60
    mla r0, r2, r0, r1
    ldr r1, [r5, r0]
    mov r0, #0x1
    blx func_02072870
    ldrb r2, [r4, #0x2]
    ldr r1, .L_0215b6dc
    mov r0, #0x60
    mla r0, r2, r0, r1
    ldr r1, [r5, r0]
    mov r0, #0x2
    blx func_02072870
    ldrb r2, [r4, #0x2]
    ldr r1, .L_0215b6e0
    mov r0, #0x60
    mla r0, r2, r0, r1
    ldr r1, [r5, r0]
    mov r0, #0x3
    blx func_02072870
    ldrb r3, [r4, #0x2]
    ldr r2, .L_0215b6d4
    mov r1, #0x60
    mla r1, r3, r1, r2
    ldr r1, [r5, r1]
    mov r0, #0x4
    blx func_02072870
    ldrb r3, [r4, #0x2]
    ldr r2, .L_0215b6d8
    mov r1, #0x60
    mla r1, r3, r1, r2
    ldr r1, [r5, r1]
    mov r0, #0x5
    blx func_02072870
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215b6ec
    bl func_02028384
.L_0215b6cc:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215b6d4: .word data_ov003_0215d658
.L_0215b6d8: .word data_ov003_0215d65c
.L_0215b6dc: .word data_ov003_0215d650
.L_0215b6e0: .word data_ov003_0215d654
.L_0215b6e4: .word data_ov003_0215d648
.L_0215b6e8: .word data_ov003_0215d64c
.L_0215b6ec: .word func_ov003_0215b794
    arm_func_end func_ov003_0215b550

    .global func_ov003_0215b6f0
    arm_func_start func_ov003_0215b6f0
func_ov003_0215b6f0: ; 0x0215b6f0
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x18]
    tst r0, #0x10
    movne r5, #0x2
    bne .L_0215b734
    tst r0, #0x8
    movne r5, #0x1
    moveq r5, #0x0
.L_0215b734:
    ldr r0, [r4, #0x4]
    bl func_ov003_0214fb7c
    ldrb r2, [r4, #0x0]
    mov r3, r5
    mov r1, #0xe
    bl func_ov003_0214d28c
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215b764
    bl func_ov012_021bab64
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0215b764:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0215b784
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_0215b784:
    blx func_ov012_021b65cc
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov003_0215b6f0

    .global func_ov003_0215b794
    arm_func_start func_ov003_0215b794
func_ov003_0215b794: ; 0x0215b794
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x8]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215b7d0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215b7d0: .word func_ov003_0215b6f0
    arm_func_end func_ov003_0215b794

    .global func_ov003_0215b7d4
    arm_func_start func_ov003_0215b7d4
func_ov003_0215b7d4: ; 0x0215b7d4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x64
    ldr r1, .L_0215c520
    mov r4, r0
    ldr r2, .L_0215c524
    mov r0, #0x144
    mov r3, #0x3f
    bl func_0201a21c
    ldr r1, .L_0215c528
    mov r8, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl func_02041f7c
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x144
    bl func_020517fc
    ldr r1, .L_0215c52c
    str r4, [r8, #0xac]
    ldr r2, [r1, #0x0]
    mov r0, #0x1
    mov r1, r0
    str r2, [r8, #0xbc]
    bl func_02075fbc
    str r0, [r8, #0x0]
    bl func_02076908
    str r0, [r8, #0x4]
    mov r4, #0x0
    b .L_0215b870
.L_0215b848:
    mov r0, r4
    bl func_02070ca4
    mov r1, r0
    ldr r0, [r8, #0x4]
    bl func_020769cc
    ldr r0, [r8, #0x4]
    bl func_020789c0
    add r1, r8, r4, lsl #0x2
    str r0, [r1, #0xc0]
    add r4, r4, #0x1
.L_0215b870:
    ldr r0, [r8, #0xbc]
    cmp r4, r0
    blt .L_0215b848
    ldr r0, [r8, #0xac]
    mov r3, #0x0
    cmp r0, #0x1
    bne .L_0215b8bc
    strb r3, [r8, #0x140]
    ldr r2, .L_0215c530
    b .L_0215b8ac
.L_0215b898:
    add r0, r2, r3
    ldrsb r1, [r0, #0x34]
    add r0, r8, r3, lsl #0x2
    add r3, r3, #0x1
    str r1, [r0, #0xd0]
.L_0215b8ac:
    ldr r0, [r8, #0xbc]
    cmp r3, r0
    blt .L_0215b898
    b .L_0215b8f8
.L_0215b8bc:
    ldr r0, .L_0215c52c
    ldr r2, .L_0215c52c
    ldrb r0, [r0, #0x2d]
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r8, #0x140]
    b .L_0215b8ec
.L_0215b8d8:
    add r0, r2, r3
    ldrsb r1, [r0, #0x2e]
    add r0, r8, r3, lsl #0x2
    add r3, r3, #0x1
    str r1, [r0, #0xd0]
.L_0215b8ec:
    ldr r0, [r8, #0xbc]
    cmp r3, r0
    blt .L_0215b8d8
.L_0215b8f8:
    bl func_02026f94
    str r0, [r8, #0x18]
    mov r1, #0x80000
    str r1, [sp, #0x60]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x60
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r8, #0x18]
    ldr r1, .L_0215c534
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r8, #0x18]
    mov r1, r8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_020310f4
    ldr r2, .L_0215c538
    str r0, [r8, #0x14]
    ldr r1, .L_0215c53c
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_0215c540
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r0, #0x0
    bl func_02028920
    str r0, [r8, #0x1c]
    bl func_020756ac
    str r0, [r8, #0x10]
    ldr r0, .L_0215c544
    mov r1, #0x0
    blx func_020101f4
    mov r9, r0
    ldr r0, .L_0215c548
    mov r1, #0x0
    blx func_020101f4
    ldr r1, .L_0215c54c
    mov r7, r0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215c550
    sub r3, r3, #0x1
    ldr r2, [r0, #0x0]
    str r3, [r1, #0x0]
    ldr r1, .L_0215c554
    mov r0, #0x1
    str r2, [r1, r3, lsl #0x2]
    bl func_0203b414
    mov r1, #0x3
    str r1, [sp, #0x0]
    ldr r2, .L_0215c558
    ldr r1, .L_0215c55c
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    mov r2, #0x4
    mov r3, #0x4000
    bl func_ov003_0215c9e8
    str r0, [r8, #0x20]
    mov r0, #0x1
    bl func_0203b424
    mov r1, #0x3
    ldr r2, .L_0215c558
    str r1, [sp, #0x0]
    ldr r1, .L_0215c560
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    mov r2, #0x4
    mov r3, #0x4000
    bl func_ov003_0215c9e8
    str r0, [r8, #0x24]
    ldr r0, [r8, #0x20]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x24]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0xac]
    cmp r0, #0x2
    bne .L_0215bad8
    mov r10, #0x0
    add r6, sp, #0xc
    ldr r5, .L_0215c564
    mov r4, #0xc
    b .L_0215bacc
.L_0215ba88:
    add r0, r10, r10, lsr #0x1f
    mov r0, r0, asr #0x1
    add r0, r8, r0, lsl #0x2
    ldr r1, [r0, #0x20]
    mov r0, r6
    bl func_ov003_0215c8d8
    ldr r0, [r6, #0x0]
    bl func_ov003_0215c8b4
    bl func_ov003_0215c88c
    ldr r0, [r0, #0x4]
    mov r1, r5
    add r2, r10, #0xc
    mov r2, r2, lsl #0x4
    add r2, r2, #0x4
    mov r3, r4
    bl func_02029c68
    add r10, r10, #0x1
.L_0215bacc:
    ldr r0, [r8, #0xbc]
    cmp r10, r0
    blt .L_0215ba88
.L_0215bad8:
    ldr r10, [r8, #0xbc]
    add r6, sp, #0x10
    ldr r5, .L_0215c568
    mov r4, #0xc
    b .L_0215bb30
.L_0215baec:
    add r0, r10, r10, lsr #0x1f
    mov r0, r0, asr #0x1
    add r0, r8, r0, lsl #0x2
    ldr r1, [r0, #0x20]
    mov r0, r6
    bl func_ov003_0215c8d8
    ldr r0, [r6, #0x0]
    bl func_ov003_0215c8b4
    bl func_ov003_0215c88c
    ldr r0, [r0, #0x4]
    mov r1, r5
    add r2, r10, #0xc
    mov r2, r2, lsl #0x4
    add r2, r2, #0x4
    mov r3, r4
    bl func_02029c68
    add r10, r10, #0x1
.L_0215bb30:
    cmp r10, #0x4
    blt .L_0215baec
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    ldr r1, [r8, #0xc0]
    bl func_ov003_0215c934
    str r0, [r8, #0x28]
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    ldr r1, [r8, #0xc4]
    bl func_ov003_0215c934
    str r0, [r8, #0x2c]
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r1, [r8, #0xc8]
    bl func_ov003_0215c934
    str r0, [r8, #0x30]
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r1, [r8, #0xcc]
    bl func_ov003_0215c934
    str r0, [r8, #0x34]
    mov r0, #0x0
    str r0, [sp, #0x18]
    mov r0, #0x88000
    str r0, [sp, #0x14]
    ldr r0, [r8, #0x2c]
    add r1, sp, #0x14
    add r2, sp, #0x18
    bl func_ov003_0214e990
    mov r0, #0x2c000
    rsb r0, r0, #0x0
    str r0, [sp, #0x20]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    ldr r0, [r8, #0x30]
    add r1, sp, #0x1c
    add r2, sp, #0x20
    bl func_ov003_0214e990
    mov r0, #0x2c000
    rsb r0, r0, #0x0
    str r0, [sp, #0x28]
    mov r0, #0x88000
    str r0, [sp, #0x24]
    ldr r0, [r8, #0x34]
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov003_0214e990
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    ldr r1, .L_0215c550
    ldr r2, [r0, #0x4]
    ldr r0, .L_0215c56c
    str r2, [r1, #0x0]
    mov r1, #0x0
    blx func_020101f4
    ldr r4, .L_0215c570
    str r0, [r8, #0x3c]
    mov r5, #0x0
    mov r6, #0x800000
.L_0215bc30:
    add r3, r4, r5, lsl #0x3
    ldrsh r2, [r3, #0x6]
    mov r0, r8
    mov r1, r6
    str r2, [sp, #0x0]
    ldrsh r3, [r3, #0x4]
    ldr r2, [r4, r5, lsl #0x3]
    bl func_ov003_0215cb64
    add r1, r8, r5, lsl #0x2
    add r5, r5, #0x1
    str r0, [r1, #0x44]
    cmp r5, #0x9
    blt .L_0215bc30
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r2, .L_0215c550
    ldr r3, [r0, #0x4]
    ldr r0, .L_0215c574
    mov r1, #0x0
    str r3, [r2, #0x0]
    blx func_020101f4
    ldr r4, .L_0215c578
    str r0, [r8, #0x40]
    mov r5, #0x0
    mov r6, #0x810000
.L_0215bc94:
    add r3, r4, r5, lsl #0x3
    ldrsh r2, [r3, #0x6]
    mov r0, r8
    mov r1, r6
    str r2, [sp, #0x0]
    ldrsh r3, [r3, #0x4]
    ldr r2, [r4, r5, lsl #0x3]
    bl func_ov003_0215cb64
    add r1, r8, r5, lsl #0x2
    add r5, r5, #0x1
    str r0, [r1, #0x68]
    cmp r5, #0x9
    blt .L_0215bc94
    mov r10, #0x0
    mov r5, r10
    mov r4, r10
.L_0215bcd4:
    add r0, r10, r10, lsr #0x1f
    mov r6, r0, asr #0x1
    add r0, r8, r10, lsl #0x2
    add r1, r8, r6, lsl #0x2
    ldr r0, [r0, #0x4c]
    ldr r1, [r1, #0x5c]
    bl func_ov003_0214fb44
    add r0, r8, r10, lsl #0x2
    add r1, r8, r6, lsl #0x2
    ldr r0, [r0, #0x70]
    ldr r1, [r1, #0x80]
    bl func_ov003_0214fb44
    add r0, r8, r10, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r8, r10, lsl #0x2
    ldr r0, [r0, #0x70]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r10, r10, #0x1
    cmp r10, #0x4
    blt .L_0215bcd4
    ldr r0, [r8, #0xac]
    cmp r0, #0x1
    bne .L_0215be34
    ldr r0, [r8, #0x5c]
    ldr r1, .L_0215c57c
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0x60]
    ldr r1, .L_0215c580
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0x80]
    ldr r1, .L_0215c584
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0x84]
    ldr r1, .L_0215c588
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0xbc]
    cmp r0, #0x2
    beq .L_0215bdf8
    cmp r0, #0x3
    beq .L_0215bddc
    cmp r0, #0x4
    bne .L_0215be14
    mvn r1, #0x32
    str r1, [sp, #0x0]
    ldr r2, [r8, #0xdc]
    add r0, r8, #0x78
    sub r3, r1, #0x5
    mov r1, #0x810000
    bl func_ov003_0215cc18
.L_0215bddc:
    mvn r0, #0x32
    str r0, [sp, #0x0]
    ldr r2, [r8, #0xd8]
    add r0, r8, #0x70
    mov r1, #0x800000
    mov r3, #0x50
    bl func_ov003_0215cc18
.L_0215bdf8:
    mov r1, #0x35
    str r1, [sp, #0x0]
    ldr r2, [r8, #0xd4]
    add r0, r8, #0x54
    sub r3, r1, #0x6d
    mov r1, #0x800000
    bl func_ov003_0215cc18
.L_0215be14:
    mov r0, #0x35
    str r0, [sp, #0x0]
    ldr r2, [r8, #0xd0]
    add r0, r8, #0x4c
    mov r1, #0x800000
    mov r3, #0x50
    bl func_ov003_0215cc18
    b .L_0215beb0
.L_0215be34:
    ldrb r0, [r8, #0x140]
    cmp r0, #0x0
    beq .L_0215beb0
    ldr r0, [r8, #0x5c]
    ldr r1, [r8, #0xd0]
    ldr r0, [r0, #0x4]
    add r1, r1, #0x4
    add r1, r1, #0x800000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0x60]
    ldr r1, [r8, #0xd4]
    ldr r0, [r0, #0x4]
    add r1, r1, #0x8
    add r1, r1, #0x800000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0x80]
    ldr r1, [r8, #0xd8]
    ldr r0, [r0, #0x4]
    add r1, r1, #0x4
    add r1, r1, #0x810000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0x84]
    ldr r1, [r8, #0xdc]
    ldr r0, [r0, #0x4]
    add r1, r1, #0x8
    add r1, r1, #0x810000
    mov r2, #0x0
    bl func_02023894
.L_0215beb0:
    ldr r0, [r8, #0x48]
    ldr r1, .L_0215c58c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r8, #0x6c]
    ldr r1, .L_0215c58c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r8, #0xac]
    cmp r0, #0x2
    bne .L_0215bf3c
    ldr r1, [r8, #0x44]
    add r0, sp, #0x2c
    bl func_ov003_0215c8d8
    add r0, sp, #0x2c
    ldr r0, [r0, #0x0]
    bl func_ov003_0215c8b4
    bl func_ov003_0215c88c
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215c590
    mov r2, #0x11
    mov r3, #0xf
    bl func_02029c68
    ldr r1, [r8, #0x68]
    add r0, sp, #0x30
    bl func_ov003_0215c8d8
    add r0, sp, #0x30
    ldr r0, [r0, #0x0]
    bl func_ov003_0215c8b4
    bl func_ov003_0215c88c
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215c590
    mov r2, #0x11
    mov r3, #0xf
    bl func_02029c68
.L_0215bf3c:
    ldr r0, [r8, #0x10]
    bl func_02075780
    sub r6, r0, #0x1
    mov r0, r6, lsl #0x10
    mov r10, #0x0
    mov r4, r0, lsr #0x10
    add r5, r8, #0xe0
    mov r11, #0x16
.L_0215bf5c:
    mov r0, r10
    bl func_02070cdc
    mla r1, r10, r11, r5
    mov r2, #0x14
    bl func_02051890
    mov r0, r10
    bl func_02070cdc
    add r1, r8, r10, lsl #0x1
    ldrb r2, [r0, #0x34]
    add r0, r1, #0x100
    add r10, r10, #0x1
    strh r2, [r0, #0x38]
    ldrh r1, [r0, #0x38]
    cmp r1, r6
    strgth r4, [r0, #0x38]
    cmp r10, #0x4
    blt .L_0215bf5c
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    bl func_0203b404
    ldr r0, [r0, #0x88]
    ldr r2, .L_0215c550
    ldr r3, [r0, #0x4]
    mov r1, #0x0
    str r3, [r2, #0x0]
    ldr r0, .L_0215c594
    mov r2, r1
    blx func_ov012_021caa0c
    mov r7, r0
    mov r1, #0x0
    ldr r0, .L_0215c598
    mov r2, r1
    blx func_ov012_021caa0c
    mov r6, r0
    mov r10, #0x0
    add r5, r8, #0xe0
    mvn r4, #0x0
    mov r11, #0xa000
.L_0215c00c:
    ldr r0, [r6, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov003_0214d47c
    add r1, r8, r10, lsl #0x3
    str r0, [r1, #0x8c]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x8c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r0, r8, r10, lsl #0x3
    ldr r2, [r0, #0x8c]
    mov r0, #0x16
    mla r1, r10, r0, r5
    ldr r0, [r2, #0x4]
    mov r2, r4
    ldr r0, [r0, #0x64]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    mov r0, #0x88000
    mul r9, r10, r0
    str r11, [sp, #0x38]
    str r9, [sp, #0x34]
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x8c]
    add r1, sp, #0x34
    add r2, sp, #0x38
    bl func_ov003_0214e990
    mov r0, #0x20000
    str r0, [sp, #0x3c]
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x8c]
    add r1, sp, #0x3c
    bl func_ov003_0214d52c
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x8c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov003_0214d47c
    add r1, r8, r10, lsl #0x3
    str r0, [r1, #0x90]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x90]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r1, r8, r10, lsl #0x1
    add r1, r1, #0x100
    ldrh r1, [r1, #0x38]
    ldr r0, [r8, #0x10]
    bl func_02075788
    mov r1, r0
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x90]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, #0x1a000
    str r0, [sp, #0x44]
    str r9, [sp, #0x40]
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x90]
    add r1, sp, #0x40
    add r2, sp, #0x44
    bl func_ov003_0214e990
    mov r0, #0x20000
    str r0, [sp, #0x48]
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x90]
    add r1, sp, #0x48
    bl func_ov003_0214d52c
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x90]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r10, r10, #0x1
    cmp r10, #0x2
    blt .L_0215c00c
    ldr r0, [r7, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x5c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x5c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r2, #0x1
    ldr r1, [r1, #0x4]
    mov r0, #0x0
    strb r2, [r1, #0x956]
    bl func_0203b424
    ldr r1, [r0, #0x88]
    ldr r0, .L_0215c550
    ldr r1, [r1, #0x4]
    mov r10, #0x0
    str r1, [r0, #0x0]
    add r7, r8, #0xe0
    mov r4, #0xa8000
    mvn r6, #0x0
    mov r5, #0x98000
    mov r11, #0x88000
.L_0215c2b4:
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_0215c598
    mov r0, #0x78
    mov r1, #0x10
    mov r3, #0x0
    bl func_ov012_021ca3a4
    add r1, r8, r10, lsl #0x3
    str r0, [r1, #0x9c]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x9c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x9c]
    add r2, r10, #0x2
    ldr r3, [r0, #0x4]
    mov r0, #0x16
    mla r1, r2, r0, r7
    ldr r0, [r3, #0x64]
    mov r2, r6
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    mul r9, r10, r11
    str r5, [sp, #0x50]
    str r9, [sp, #0x4c]
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x9c]
    add r1, sp, #0x4c
    add r2, sp, #0x50
    bl func_ov003_0214e990
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0x9c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_0215c594
    mov r0, #0x78
    mov r1, #0x10
    mov r3, #0x0
    bl func_ov012_021ca3a4
    add r1, r8, r10, lsl #0x3
    str r0, [r1, #0xa0]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0xa0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r1, r8, r10, lsl #0x1
    add r1, r1, #0x100
    ldrh r1, [r1, #0x3c]
    ldr r0, [r8, #0x10]
    bl func_02075788
    mov r1, r0
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0xa0]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    str r9, [sp, #0x54]
    str r4, [sp, #0x58]
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0xa0]
    add r1, sp, #0x54
    add r2, sp, #0x58
    bl func_ov003_0214e990
    add r0, r8, r10, lsl #0x3
    ldr r0, [r0, #0xa0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r10, r10, #0x1
    cmp r10, #0x2
    blt .L_0215c2b4
    ldr r0, [r8, #0x64]
    bl func_ov003_02157f9c
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x61
    mov r2, #0x2
    mov r3, #0x6
    bl func_0206ad90
    str r0, [r8, #0x8]
    ldr r0, [r8, #0x88]
    bl func_ov003_02157f9c
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x61
    mov r2, #0x2
    mov r3, #0x6
    bl func_0206ad90
    str r0, [r8, #0xc]
    ldr r0, [r8, #0x8]
    ldr r1, .L_0215c59c
    mov r2, #0xa
    mov r3, #0x1
    bl func_ov003_0215c8f0
    ldr r0, [r8, #0xc]
    ldr r1, .L_0215c59c
    mov r2, #0xa
    mov r3, #0x1
    bl func_ov003_0215c8f0
    ldr r0, [r8, #0x8]
    mov r1, #0x0
    bl func_ov003_0215c910
    ldr r0, [r8, #0xc]
    mov r1, #0x0
    bl func_ov003_0215c910
    ldr r1, .L_0215c54c
    ldr r2, .L_0215c554
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215c550
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    mov r0, #0x37
    bl func_020734e0
    mov r0, #0x37
    mov r1, #0x0
    bl func_0207361c
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r8, #0x14]
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215c520: .word data_ov003_0215eb44
.L_0215c524: .word data_ov003_0215eb38
.L_0215c528: .word data_020a0f64
.L_0215c52c: .word data_020afe90
.L_0215c530: .word data_020afedc
.L_0215c534: .word func_ov003_0215c5a0
.L_0215c538: .word data_02093c04
.L_0215c53c: .word data_020a0e80
.L_0215c540: .word data_020a16c0
.L_0215c544: .word data_ov003_0215eb50
.L_0215c548: .word data_ov003_0215eb64
.L_0215c54c: .word data_02093c08
.L_0215c550: .word data_020a0dd0
.L_0215c554: .word data_020a16d0
.L_0215c558: .word data_ov003_0215eb78
.L_0215c55c: .word data_ov003_0215eb88
.L_0215c560: .word data_ov003_0215eb9c
.L_0215c564: .word data_ov003_0215d7e6
.L_0215c568: .word data_ov003_0215d7fe
.L_0215c56c: .word data_ov003_0215ebb0
.L_0215c570: .word data_ov003_0215d860
.L_0215c574: .word data_ov003_0215ebc4
.L_0215c578: .word data_ov003_0215d818
.L_0215c57c: .word 0x80000b
.L_0215c580: .word 0x80000c
.L_0215c584: .word 0x81000b
.L_0215c588: .word 0x81000c
.L_0215c58c: .word func_ov003_0215cd5c
.L_0215c590: .word data_ov003_0215d7c8
.L_0215c594: .word data_ov003_0215ebd8
.L_0215c598: .word data_ov003_0215ebec
.L_0215c59c: .word 0x7fff
    arm_func_end func_ov003_0215b7d4

    .global func_ov003_0215c5a0
    arm_func_start func_ov003_0215c5a0
func_ov003_0215c5a0: ; 0x0215c5a0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, .L_0215c638
    ldr r2, [r5, #0x4]
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    add r1, r1, #0x1
    str r1, [r0, #0x0]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xbc]
    cmp r0, #0x2
    beq .L_0215c608
    cmp r0, #0x3
    beq .L_0215c5f8
    cmp r0, #0x4
    bne .L_0215c618
    ldr r0, [r4, #0x84]
    ldr r1, .L_0215c63c
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_0215c5f8:
    ldr r0, [r4, #0x80]
    ldr r1, .L_0215c640
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_0215c608:
    ldr r0, [r4, #0x60]
    ldr r1, .L_0215c644
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_0215c618:
    ldr r0, [r4, #0x5c]
    ldr r1, .L_0215c648
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215c64c
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215c638: .word data_020a0f10
.L_0215c63c: .word func_ov003_0215cde8
.L_0215c640: .word func_ov003_0215cdd8
.L_0215c644: .word func_ov003_0215cdc8
.L_0215c648: .word func_ov003_0215cd8c
.L_0215c64c: .word func_ov003_0215c650
    arm_func_end func_ov003_0215c5a0

    .global func_ov003_0215c650
    arm_func_start func_ov003_0215c650
func_ov003_0215c650: ; 0x0215c650
    ldr r0, .L_0215c664
    ldr r1, [r0, #0x0]
    add r1, r1, #0x1
    str r1, [r0, #0x0]
    bx lr
.L_0215c664: .word data_020a0f10
    arm_func_end func_ov003_0215c650

    .global func_ov003_0215c668
    arm_func_start func_ov003_0215c668
func_ov003_0215c668: ; 0x0215c668
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0215c87c
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    add r0, r0, #0x1
    str r0, [r1, #0x0]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x8
    bl func_0207367c
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215c6a8
    bl func_0206ae98
.L_0215c6a8:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0215c6b8
    bl func_0206ae98
.L_0215c6b8:
    mov r5, #0x0
.L_0215c6bc:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_0215c6d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215c6d8:
    add r5, r5, #0x1
    cmp r5, #0x9
    blt .L_0215c6bc
    mov r5, #0x0
.L_0215c6e8:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x68]
    cmp r0, #0x0
    beq .L_0215c704
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215c704:
    add r5, r5, #0x1
    cmp r5, #0x9
    blt .L_0215c6e8
    mov r5, #0x0
.L_0215c714:
    add r0, r4, r5, lsl #0x3
    ldr r0, [r0, #0x8c]
    cmp r0, #0x0
    beq .L_0215c730
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215c730:
    add r0, r4, r5, lsl #0x3
    ldr r0, [r0, #0x90]
    cmp r0, #0x0
    beq .L_0215c74c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215c74c:
    add r0, r4, r5, lsl #0x3
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_0215c768
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215c768:
    add r0, r4, r5, lsl #0x3
    ldr r0, [r0, #0xa0]
    cmp r0, #0x0
    beq .L_0215c784
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215c784:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215c714
    ldr r0, [r4, #0x3c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x40]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x28]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x2c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x30]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x34]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x20]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x10]
    bl func_02075758
    bl func_020735e4
    ldr r0, [r4, #0x4]
    bl func_0207698c
    ldr r0, [r4, #0x0]
    bl func_020763e0
    ldr r1, .L_0215c880
    ldr r2, .L_0215c884
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215c888
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x18]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215c87c: .word data_020a0f10
.L_0215c880: .word data_02093c04
.L_0215c884: .word data_020a16c0
.L_0215c888: .word data_020a0e80
    arm_func_end func_ov003_0215c668

    .global func_ov003_0215c88c
    arm_func_start func_ov003_0215c88c
func_ov003_0215c88c: ; 0x0215c88c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0215c8ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215c8ac:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0215c88c

    .global func_ov003_0215c8b4
    arm_func_start func_ov003_0215c8b4
func_ov003_0215c8b4: ; 0x0215c8b4
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    bne .L_0215c8d0
    ldr r0, [r0, #0xc]
    bl func_02036430
    mov r1, r0
.L_0215c8d0:
    mov r0, r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov003_0215c8b4

    .global func_ov003_0215c8d8
    arm_func_start func_ov003_0215c8d8
func_ov003_0215c8d8: ; 0x0215c8d8
    ldr r1, [r1, #0x4]
    ldr ip, .L_0215c8ec
    ldr r1, [r1, #0x64]
    add r1, r1, #0x14
    bx ip
.L_0215c8ec: .word func_020193f0
    arm_func_end func_ov003_0215c8d8

    .global func_ov003_0215c8f0
    arm_func_start func_ov003_0215c8f0
func_ov003_0215c8f0: ; 0x0215c8f0
    strh r1, [r0, #0x16]
    strb r2, [r0, #0x18]
    mov r1, #0x1
    strb r1, [r0, #0x19]
    strb r3, [r0, #0x1b]
    mov r1, #0x0
    strb r1, [r0, #0x1a]
    bx lr
    arm_func_end func_ov003_0215c8f0

    .global func_ov003_0215c910
    arm_func_start func_ov003_0215c910
func_ov003_0215c910: ; 0x0215c910
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0215c924
    bl func_0206af1c
.L_0215c924:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0215c910

    .global func_ov003_0215c934
    arm_func_start func_ov003_0215c934
func_ov003_0215c934: ; 0x0215c934
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x2c
    mov r1, #0x0
    mov r2, #0x20
    bl func_020517fc
    add r0, sp, #0xc
    mov r1, #0x0
    mov r2, #0x20
    bl func_020517fc
    ldr r1, .L_0215c9d8
    add r0, sp, #0x2c
    bl func_02074000
    ldr r1, .L_0215c9dc
    add r0, sp, #0x2c
    ldr r1, [r1, r4, lsl #0x3]
    bl func_020741bc
    add r0, sp, #0xc
    add r1, sp, #0x2c
    bl func_02074000
    ldr r1, .L_0215c9e0
    add r0, sp, #0x2c
    bl func_020741bc
    ldr r1, .L_0215c9e4
    add r0, sp, #0xc
    bl func_020741bc
    mov r1, #0x2
    str r1, [sp, #0x0]
    add r2, sp, #0x2c
    str r2, [sp, #0x4]
    add r1, sp, #0xc
    str r1, [sp, #0x8]
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x8
    mov r3, #0x8000
    bl func_ov003_0215c9e8
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_0215c9d8: .word data_ov003_0215ebfc
.L_0215c9dc: .word data_020924b0
.L_0215c9e0: .word data_ov003_0215ec08
.L_0215c9e4: .word data_ov003_0215ec10
    arm_func_end func_ov003_0215c934

    .global func_ov003_0215c9e8
    arm_func_start func_ov003_0215c9e8
func_ov003_0215c9e8: ; 0x0215c9e8
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r7, r2
    mov r6, r3
    mov r4, #0x0
    bl func_0203d0b4
    ldr r0, [r5, #0x4]
    mov r1, r7
    bl func_0203d478
    mov r1, #0x20
    ldr r0, [r5, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    ldr r0, [sp, #0x20]
    add r1, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r1, [r5, #0x4]
    mov r2, r4
    strb r2, [r1, #0x956]
    ldr r1, [sp, #0x24]
    ldr r0, .L_0215cb60
    ldr r2, [r5, #0x4]
    cmp r1, #0x0
    str r2, [r0, #0x0]
    beq .L_0215caa4
    ldr r0, [sp, #0x24]
    bl func_02035c90
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0215caa0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215caa0:
    ldr r4, [r4, #0x38]
.L_0215caa4:
    bl func_02036ab8
    bl func_ov003_0214d47c
    ldr r1, [sp, #0x28]
    mov r5, r0
    cmp r1, #0x0
    beq .L_0215cacc
    ldr r0, [r5, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
.L_0215cacc:
    cmp r4, #0x0
    beq .L_0215cb14
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_0215cafc
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_0215cb14
.L_0215cafc:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_0215cb14:
    mov r3, #0x0
    add r1, sp, #0x8
    add r2, sp, #0x4
    mov r0, r5
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    bl func_ov003_0214e990
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    cmp r4, #0x0
    beq .L_0215cb54
    mov r0, r4
    bl func_02034d7c
.L_0215cb54:
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0215cb60: .word data_020a0dd0
    arm_func_end func_ov003_0215c9e8

    .global func_ov003_0215cb64
    arm_func_start func_ov003_0215cb64
func_ov003_0215cb64: ; 0x0215cb64
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r8, r1
    mov r5, r0
    mov r0, r8
    mov r7, r2
    mov r6, r3
    bl func_020329ec
    bl func_ov003_0214d47c
    mov r2, #0x60000
    add r1, sp, #0x8
    str r2, [sp, #0x8]
    mov r4, r0
    bl func_ov003_0214d52c
    ldr r0, [r4, #0x4]
    add r1, r8, r7
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r1, [sp, #0x28]
    mov r0, r6, lsl #0xc
    mov r1, r1, lsl #0xc
    str r0, [sp, #0x4]
    str r1, [sp, #0x0]
    mov r0, r4
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov003_0214e990
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov003_0215cb64

    .global func_ov003_0215cc18
    arm_func_start func_ov003_0215cc18
func_ov003_0215cc18: ; 0x0215cc18
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    movs r7, r2
    mov r10, r0
    mov r9, r1
    mov r11, r3
    bpl .L_0215cc64
    mov r5, #0x0
    mov r4, r5
.L_0215cc3c:
    ldr r0, [r10], #0x4
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215cc3c
    b .L_0215cd54
.L_0215cc64:
    cmp r7, #0xa
    movlt r4, #0x0
    mvnge r4, #0x3
    cmp r7, #0x3
    movlt r5, #0x17
    addge r7, r7, #0x1
    movge r5, #0xd
    mov r6, #0x1
    add r8, sp, #0x8
.L_0215cc88:
    mov r0, r7
    mov r1, #0xa
    bl func_0200d12c
    str r1, [r8, r6, lsl #0x2]
    mov r0, r7
    mov r1, #0xa
    bl func_0200d12c
    mov r7, r0
    subs r6, r6, #0x1
    bpl .L_0215cc88
    ldr r0, [sp, #0x38]
    mov r8, #0x0
    mov r6, r0, lsl #0xc
.L_0215ccbc:
    add r0, sp, #0x8
    ldr r7, [r0, r8, lsl #0x2]
    cmp r7, #0x0
    bne .L_0215ccd4
    cmp r8, #0x1
    bne .L_0215cd2c
.L_0215ccd4:
    add r0, r11, r4
    mov r0, r0, lsl #0xc
    str r6, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov003_0214e990
    add r0, r9, r7
    add r1, r5, r0
    ldr r0, [r10, #0x0]
    mov r2, #0x0
    ldr r0, [r0, #0x4]
    bl func_02023894
    ldr r0, [r10, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r4, r4, #0x8
    b .L_0215cd44
.L_0215cd2c:
    ldr r0, [r10, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215cd44:
    add r8, r8, #0x1
    cmp r8, #0x2
    add r10, r10, #0x4
    blt .L_0215ccbc
.L_0215cd54:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov003_0215cc18

    .global func_ov003_0215cd5c
    arm_func_start func_ov003_0215cd5c
func_ov003_0215cd5c: ; 0x0215cd5c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x50]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x60]
    blx r1
    mov r1, r0
    ldr r0, [r4, #0x4]
    add r1, r1, #0xa0
    bl func_02023738
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0215cd5c

    .global func_ov003_0215cd8c
    arm_func_start func_ov003_0215cd8c
func_ov003_0215cd8c: ; 0x0215cd8c
    stmdb sp!, {r4, lr}
    mov r1, #0x0
    mov r4, r0
    bl func_ov003_0215cdf8
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x0
    mov r1, r0
    mov r2, #0xc
    bl func_02073f24
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215cdc4
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215cdc4: .word func_ov003_0215d038
    arm_func_end func_ov003_0215cd8c

    .global func_ov003_0215cdc8
    arm_func_start func_ov003_0215cdc8
func_ov003_0215cdc8: ; 0x0215cdc8
    ldr ip, .L_0215cdd4
    mov r1, #0x1
    bx ip
.L_0215cdd4: .word func_ov003_0215cec4
    arm_func_end func_ov003_0215cdc8

    .global func_ov003_0215cdd8
    arm_func_start func_ov003_0215cdd8
func_ov003_0215cdd8: ; 0x0215cdd8
    ldr ip, .L_0215cde4
    mov r1, #0x2
    bx ip
.L_0215cde4: .word func_ov003_0215cdf8
    arm_func_end func_ov003_0215cdd8

    .global func_ov003_0215cde8
    arm_func_start func_ov003_0215cde8
func_ov003_0215cde8: ; 0x0215cde8
    ldr ip, .L_0215cdf4
    mov r1, #0x3
    bx ip
.L_0215cdf4: .word func_ov003_0215cec4
    arm_func_end func_ov003_0215cde8

    .global func_ov003_0215cdf8
    arm_func_start func_ov003_0215cdf8
func_ov003_0215cdf8: ; 0x0215cdf8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r2, [r6, #0x4]
    mov r5, r1
    add r0, sp, #0x8
    mov r1, r6
    ldr r4, [r2, #0x10]
    bl func_ov003_0215ceb0
    add r0, sp, #0x8
    ldr r2, [r0, #0x0]
    add r1, sp, #0xc
    add r2, r2, #0x15000
    mov r0, r6
    str r2, [sp, #0xc]
    bl func_ov003_0215ce90
    add r0, sp, #0x4
    mov r1, r6
    bl func_ov003_0215ceb0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movle r0, #0x0
    ble .L_0215ce84
    mov r2, #0x0
    add r1, sp, #0x0
    mov r0, r6
    str r2, [sp, #0x0]
    bl func_ov003_0215ce90
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215ce8c
    bl func_02028384
    mov r0, r4
    mov r1, r5
    bl func_ov003_0215cf58
    mov r0, #0x1
.L_0215ce84:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0215ce8c: .word func_ov003_0215d294
    arm_func_end func_ov003_0215cdf8

    .global func_ov003_0215ce90
    arm_func_start func_ov003_0215ce90
func_ov003_0215ce90: ; 0x0215ce90
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0215ceac
    mov r1, #0x1
    str r2, [r0, #0xc]
    bx ip
.L_0215ceac: .word func_ov003_02153660
    arm_func_end func_ov003_0215ce90

    .global func_ov003_0215ceb0
    arm_func_start func_ov003_0215ceb0
func_ov003_0215ceb0: ; 0x0215ceb0
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x50]
    ldr r1, [r1, #0xc]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov003_0215ceb0

    .global func_ov003_0215cec4
    arm_func_start func_ov003_0215cec4
func_ov003_0215cec4: ; 0x0215cec4
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r2, [r5, #0x4]
    mov r4, r1
    add r0, sp, #0x8
    mov r1, r5
    ldr r6, [r2, #0x10]
    bl func_ov003_0215ceb0
    ldr r0, [sp, #0x8]
    add r1, sp, #0xc
    sub r2, r0, #0x15000
    mov r0, r5
    str r2, [sp, #0xc]
    bl func_ov003_0215ce90
    add r0, sp, #0x4
    mov r1, r5
    bl func_ov003_0215ceb0
    ldr r0, [sp, #0x4]
    cmp r0, #0x100000
    movge r0, #0x0
    bge .L_0215cf4c
    mov r2, #0x100000
    add r1, sp, #0x0
    mov r0, r5
    str r2, [sp, #0x0]
    bl func_ov003_0215ce90
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215cf54
    bl func_02028384
    mov r0, r6
    mov r1, r4
    bl func_ov003_0215cf58
    mov r0, #0x1
.L_0215cf4c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0215cf54: .word func_ov003_0215d294
    arm_func_end func_ov003_0215cec4

    .global func_ov003_0215cf58
    arm_func_start func_ov003_0215cf58
func_ov003_0215cf58: ; 0x0215cf58
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r0
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_0215d018
.L_0215cf70: ; jump table
    b .L_0215cf80 ; case 0
    b .L_0215cf80 ; case 1
    b .L_0215cfcc ; case 2
    b .L_0215cfcc ; case 3
.L_0215cf80:
    add r0, r5, r4, lsl #0x3
    ldr r0, [r0, #0x8c]
    cmp r0, #0x0
    beq .L_0215cfa4
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215cfa4:
    add r0, r5, r4, lsl #0x3
    ldr r0, [r0, #0x90]
    cmp r0, #0x0
    beq .L_0215d018
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0215d018
.L_0215cfcc:
    sub r6, r4, #0x2
    add r0, r5, r6, lsl #0x3
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_0215cff4
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215cff4:
    add r0, r5, r6, lsl #0x3
    ldr r0, [r0, #0xa0]
    cmp r0, #0x0
    beq .L_0215d018
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215d018:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov003_0215cf58

    .global func_ov003_0215d038
    arm_func_start func_ov003_0215d038
func_ov003_0215d038: ; 0x0215d038
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02073840
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215d084
    bl func_02028384
    ldr r0, [r4, #0x64]
    ldr r1, .L_0215d088
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x88]
    ldr r1, .L_0215d08c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d084: .word func_ov003_0215d294
.L_0215d088: .word func_ov003_0215d090
.L_0215d08c: .word func_ov003_0215d158
    arm_func_end func_ov003_0215d038

    .global func_ov003_0215d090
    arm_func_start func_ov003_0215d090
func_ov003_0215d090: ; 0x0215d090
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xb0]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [r4, #0xb0]
    ldr r1, [r4, #0xb0]
    mov r0, #0xa0
    mul r0, r1, r0
    mov r1, #0x64
    bl func_0200d12c
    sub r1, r0, #0x20
    str r0, [r4, #0xb0]
    mov r2, r1, lsl #0xc
    add r1, sp, #0x8
    mov r0, r5
    str r2, [sp, #0x8]
    bl func_ov003_0215ce90
    add r0, sp, #0x4
    mov r1, r5
    bl func_ov003_0215ceb0
    ldr r0, [sp, #0x4]
    cmp r0, #0x80000
    ble .L_0215d128
    mov r2, #0x80000
    add r1, sp, #0x0
    mov r0, r5
    str r2, [sp, #0x0]
    bl func_ov003_0215ce90
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215d130
    bl func_02028384
    ldr r0, [r4, #0x8]
    mov r1, #0x0
    bl func_ov003_0215d134
.L_0215d128:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215d130: .word func_ov003_0215d1fc
    arm_func_end func_ov003_0215d090

    .global func_ov003_0215d134
    arm_func_start func_ov003_0215d134
func_ov003_0215d134: ; 0x0215d134
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0215d148
    bl func_0206af1c
.L_0215d148:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
    arm_func_end func_ov003_0215d134

    .global func_ov003_0215d158
    arm_func_start func_ov003_0215d158
func_ov003_0215d158: ; 0x0215d158
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    moveq r0, #0x6
    streq r0, [r4, #0xb4]
    ldr r1, [r4, #0xb4]
    mov r0, #0xa0
    mul r0, r1, r0
    mov r1, #0x64
    bl func_0200d12c
    rsb r1, r0, #0x120
    str r0, [r4, #0xb4]
    mov r2, r1, lsl #0xc
    add r1, sp, #0x8
    mov r0, r5
    str r2, [sp, #0x8]
    bl func_ov003_0215ce90
    add r0, sp, #0x4
    mov r1, r5
    bl func_ov003_0215ceb0
    ldr r0, [sp, #0x4]
    cmp r0, #0x80000
    bge .L_0215d1f0
    mov r2, #0x80000
    add r1, sp, #0x0
    mov r0, r5
    str r2, [sp, #0x0]
    bl func_ov003_0215ce90
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215d1f8
    bl func_02028384
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    bl func_ov003_0215d134
.L_0215d1f0:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215d1f8: .word func_ov003_0215d294
    arm_func_end func_ov003_0215d158

    .global func_ov003_0215d1fc
    arm_func_start func_ov003_0215d1fc
func_ov003_0215d1fc: ; 0x0215d1fc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02086bd4
    cmp r0, #0x0
    movne r2, #0x0
    bne .L_0215d244
    ldr r0, [r4, #0x1c]
    ldr r2, [r0, #0x0]
    ldr r0, [r2, #0x74]
    ldr r1, [r2, #0x70]
    add r0, r2, r0, lsl #0x2
    add r1, r2, r1, lsl #0x2
    ldr r0, [r0, #0x18]
    ldr r1, [r1, #0x18]
    mvn r0, r0
    and r2, r1, r0
.L_0215d244:
    ldr r1, [r4, #0xb8]
    add r0, r1, #0x1
    str r0, [r4, #0xb8]
    cmp r1, #0x84
    bgt .L_0215d260
    tst r2, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
.L_0215d260:
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x18]
    ldr r1, .L_0215d28c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215d290
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d28c: .word func_ov003_0215c668
.L_0215d290: .word func_ov003_0215d294
    arm_func_end func_ov003_0215d1fc

    .global func_ov003_0215d294
    arm_func_start func_ov003_0215d294
func_ov003_0215d294: ; 0x0215d294
    bx lr
    arm_func_end func_ov003_0215d294

    .section .rodata, 4, 1, 4
data_ov003_0215d298:
    .byte 0x00, 0x01, 0x02, 0x03
data_ov003_0215d29c:
    .byte 0x02, 0x03, 0x04, 0x19, 0x10, 0x14, 0x15, 0x16, 0x17, 0x18, 0x1f, 0x20, 0xff, 0x00, 0x00, 0x00
data_ov003_0215d2ac:
    .word func_ov003_0214d958
    .word func_ov003_0214ee54
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_021503a0
    .word func_ov003_021503b0
    .word func_ov003_021503c0
    .word func_ov003_021503d0
    .word func_ov003_0215178c
    .word func_ov003_0215179c
    .word func_ov003_021517ac
    .word func_ov003_021517bc
    .word func_ov003_0215261c
    .word func_ov003_02155940
    .word func_ov003_0215b44c
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_02158a84
    .word func_ov003_02158a94
    .word func_ov003_02158aa4
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov003_02159d1c
    .word func_ov003_02159d2c
    .word func_ov003_02159d3c
    .word func_ov003_02159d4c
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215d334:
    .byte 0x34, 0x00, 0x00, 0x00
data_ov003_0215d338:
    .byte 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
    .byte 0x34, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
    .byte 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x34, 0x00, 0x00, 0x00
    .byte 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215d444:
    .byte 0x01, 0x02, 0x03, 0x04
data_ov003_0215d448:
    .byte 0x29, 0x00, 0x00, 0x00, 0x2a, 0x00, 0x00, 0x00, 0x2b, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x00, 0x00
data_ov003_0215d458:
    .byte 0x14, 0x15, 0x16, 0x17, 0x18, 0x00, 0x00, 0x00
data_ov003_0215d460:
    .word func_ov003_0214d868
    .word func_ov003_0214d884
    .word func_ov003_0214d8a0
    .word func_ov003_0214d8bc
data_ov003_0215d470:
    .byte 0x09, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00
    .byte 0x0e, 0x00, 0x00, 0x00
data_ov003_0215d484:
    .byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
    .byte 0xff, 0xff, 0xff, 0xff
data_ov003_0215d498:
    .byte 0x2d, 0x00, 0x00, 0x00, 0x2e, 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
    .byte 0x31, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
data_ov003_0215d4b0:
    .byte 0x05, 0x06, 0x07, 0x08
data_ov003_0215d4b4:
    .byte 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
data_ov003_0215d4c4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
data_ov003_0215d4d4:
    .byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
data_ov003_0215d4e4:
    .byte 0x09, 0x0a, 0x0b, 0x0c, 0x00, 0x30, 0x00, 0x00
data_ov003_0215d4ec:
    .byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
    .byte 0x03, 0x00, 0x00, 0x00
data_ov003_0215d500:
    .byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
data_ov003_0215d510:
    .byte 0x03, 0x01, 0x02, 0x00, 0x03, 0x01, 0x00, 0x00
data_ov003_0215d518:
    .byte 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x00
data_ov003_0215d520:
    .byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
data_ov003_0215d530:
    .byte 0x14, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x14, 0x00, 0x00, 0x00
    .byte 0x17, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
    .byte 0x16, 0x00, 0x00, 0x00
data_ov003_0215d554:
    .byte 0x3a, 0x00, 0x00, 0x00, 0x3b, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x3c, 0x00, 0x00, 0x00
    .byte 0x3d, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00
    .byte 0x39, 0x00, 0x00, 0x00
data_ov003_0215d578:
    .byte 0x1b, 0x1c, 0x1d, 0x1e
data_ov003_0215d57c:
    .byte 0x01, 0x02, 0x03, 0x00, 0x03, 0x02, 0x01, 0x00
data_ov003_0215d584:
    .byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215d58c:
    .byte 0x00, 0x03, 0xff, 0x01, 0x04, 0xff, 0x02, 0x05, 0x06
data_ov003_0215d595:
    .byte 0x08, 0x13, 0x00, 0x04, 0x14, 0x00, 0x0c, 0x16, 0x00, 0x0d, 0x18, 0x00
data_ov003_0215d5a1:
    .byte 0x00, 0x00, 0x11, 0x00, 0x03, 0x15, 0x01, 0x02, 0x19, 0x01, 0x01, 0x19, 0x00, 0x09, 0x17
data_ov003_0215d5b0:
    .byte 0x00, 0x5e, 0x60, 0x6e, 0x80, 0x4d, 0x60, 0x6e
data_ov003_0215d5b8:
    .byte 0x60, 0x6e, 0x80, 0x4d, 0x00, 0x5e, 0x80, 0x4d
data_ov003_0215d5c0:
    .byte 0x60, 0x00, 0x64, 0x00, 0x68, 0x00, 0x6a, 0x00, 0x6c, 0x00, 0x6e, 0x00, 0x70, 0x00, 0x70, 0x00
    .byte 0x72, 0x00, 0x72, 0x00
data_ov003_0215d5d4:
    .byte 0x80, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x54, 0x00, 0x00, 0x00
    .byte 0x80, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x8c, 0x00, 0x00, 0x00
data_ov003_0215d5f4:
    .byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00
    .byte 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
    .byte 0x80, 0x00, 0x00, 0x00, 0xac, 0x00, 0x00, 0x00
data_ov003_0215d61c:
    .byte 0x72, 0x00, 0x72, 0x00, 0x70, 0x00, 0x70, 0x00, 0x6e, 0x00, 0x6c, 0x00, 0x6a, 0x00, 0x68, 0x00
    .byte 0x64, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215d648:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215d64c:
    .byte 0x84, 0x03, 0x00, 0x00
data_ov003_0215d650:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215d654:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215d658:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215d65c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x58, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2c, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84, 0x03, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x02, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x2c, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x84, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2c, 0x01, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf4, 0x01, 0x00, 0x00
    .byte 0xf4, 0x01, 0x00, 0x00, 0xf4, 0x01, 0x00, 0x00, 0xc8, 0x00, 0x00, 0x00, 0xc8, 0x00, 0x00, 0x00
    .byte 0x90, 0x01, 0x00, 0x00, 0x90, 0x01, 0x00, 0x00, 0x90, 0x01, 0x00, 0x00, 0x90, 0x01, 0x00, 0x00
    .byte 0x96, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x2c, 0x01, 0x00, 0x00, 0xc8, 0x00, 0x00, 0x00
    .byte 0xc8, 0x00, 0x00, 0x00, 0xc8, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
    .byte 0xc8, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
    .byte 0x32, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
data_ov003_0215d7c8:
    .byte 0xfb, 0x4f, 0x37, 0x02, 0x15, 0x02, 0xf4, 0x01, 0xd3, 0x01, 0x70, 0x01, 0x59, 0x02, 0x7a, 0x02
    .byte 0x9b, 0x02, 0x9b, 0x06, 0xfc, 0x0e, 0x1b, 0x43, 0x9f, 0x33, 0xbf, 0x67, 0xdf, 0x6b
data_ov003_0215d7e6:
    .byte 0xff, 0x03, 0x5f, 0x37, 0x3f, 0x2b, 0x1e, 0x23, 0x1f, 0x1b, 0x1f, 0x17, 0xff, 0x06, 0x9e, 0x02
    .byte 0xbd, 0x02, 0x5c, 0x02, 0xd7, 0x0d, 0x19, 0x0e
data_ov003_0215d7fe:
    .byte 0x8c, 0x31, 0x6d, 0x2d, 0x6d, 0x2d, 0x4a, 0x29, 0x4a, 0x29, 0x29, 0x25, 0x08, 0x21, 0xe7, 0x1c
    .byte 0xe7, 0x1c, 0xad, 0x35, 0x84, 0x10, 0x42, 0x08, 0x00, 0x00
data_ov003_0215d818:
    .byte 0x01, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x80, 0x00, 0xf0, 0xff
    .byte 0x0d, 0x00, 0x00, 0x00, 0x50, 0x00, 0xcd, 0xff, 0x0d, 0x00, 0x00, 0x00, 0x58, 0x00, 0xcd, 0xff
    .byte 0x0d, 0x00, 0x00, 0x00, 0xc8, 0xff, 0xcd, 0xff, 0x0d, 0x00, 0x00, 0x00, 0xc0, 0xff, 0xcd, 0xff
    .byte 0x03, 0x00, 0x00, 0x00, 0x80, 0xff, 0xbe, 0x00, 0x07, 0x00, 0x00, 0x00, 0x80, 0x01, 0xbe, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00
data_ov003_0215d860:
    .byte 0x01, 0x00, 0x00, 0x00, 0x80, 0x00, 0xc0, 0x00, 0x02, 0x00, 0x00, 0x00, 0x80, 0x00, 0xd0, 0x00
    .byte 0x0d, 0x00, 0x00, 0x00, 0x50, 0x00, 0x35, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x58, 0x00, 0x35, 0x00
    .byte 0x0d, 0x00, 0x00, 0x00, 0xc8, 0xff, 0x35, 0x00, 0x0d, 0x00, 0x00, 0x00, 0xc0, 0xff, 0x35, 0x00
    .byte 0x03, 0x00, 0x00, 0x00, 0x80, 0xff, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0xe0, 0xff, 0xc0, 0x00
    .section .init, 4, 1, 4
    .global __sinit_ov003_0215d8a8
    arm_func_start __sinit_ov003_0215d8a8
__sinit_ov003_0215d8a8: ; 0x0215d8a8
    stmdb sp!, {r3, lr}
    mov ip, #0xf
    ldr r0, .L_0215d8e4
    sub r1, ip, #0x4f
    sub r2, ip, #0x1d
    mov r3, #0x40
    str ip, [sp, #0x0]
    bl func_ov003_0214ee3c
    mov r3, #0x0
    ldr r0, .L_0215d8e8
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov003_0214ee3c
    ldmia sp!, {r3, pc}
.L_0215d8e4: .word data_ov003_0215db50
.L_0215d8e8: .word data_ov003_0215db58
    arm_func_end __sinit_ov003_0215d8a8

    .global __sinit_ov003_0215d8ec
    arm_func_start __sinit_ov003_0215d8ec
__sinit_ov003_0215d8ec: ; 0x0215d8ec
    stmdb sp!, {r3, lr}
    mov ip, #0xc
    ldr r0, .L_0215d928
    sub r1, ip, #0x4c
    sub r2, ip, #0x18
    mov r3, #0x40
    str ip, [sp, #0x0]
    bl func_ov003_0214ee3c
    mov r3, #0x0
    ldr r0, .L_0215d92c
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov003_0214ee3c
    ldmia sp!, {r3, pc}
.L_0215d928: .word data_ov003_0215dcd8
.L_0215d92c: .word data_ov003_0215dce0
    arm_func_end __sinit_ov003_0215d8ec

    .global __sinit_ov003_0215d930
    arm_func_start __sinit_ov003_0215d930
__sinit_ov003_0215d930: ; 0x0215d930
    stmdb sp!, {r3, lr}
    mov r3, #0x0
    ldr r0, .L_0215d950
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov003_0214ee3c
    ldmia sp!, {r3, pc}
.L_0215d950: .word data_ov003_0215de50
    arm_func_end __sinit_ov003_0215d930

    .global __sinit_ov003_0215d954
    arm_func_start __sinit_ov003_0215d954
__sinit_ov003_0215d954: ; 0x0215d954
    stmdb sp!, {r3, lr}
    mov r3, #0x0
    ldr r0, .L_0215d974
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov003_0214ee3c
    ldmia sp!, {r3, pc}
.L_0215d974: .word data_ov003_0215dff4
    arm_func_end __sinit_ov003_0215d954

    .global __sinit_ov003_0215d978
    arm_func_start __sinit_ov003_0215d978
__sinit_ov003_0215d978: ; 0x0215d978
    stmdb sp!, {r3, lr}
    mov r3, #0x0
    ldr r0, .L_0215d998
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov003_0214ee3c
    ldmia sp!, {r3, pc}
.L_0215d998: .word data_ov003_0215e160
    arm_func_end __sinit_ov003_0215d978

    .global __sinit_ov003_0215d99c
    arm_func_start __sinit_ov003_0215d99c
__sinit_ov003_0215d99c: ; 0x0215d99c
    stmdb sp!, {r3, lr}
    mov r3, #0x0
    ldr r0, .L_0215da10
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov003_0214ee3c
    mov r1, #0x0
    mov ip, #0x20
    ldr r0, .L_0215da14
    mov r2, r1
    mov r3, #0xe2
    str ip, [sp, #0x0]
    bl func_ov003_0214ee3c
    mov ip, #0xa0
    ldr r0, .L_0215da18
    mov r1, #0xe9
    mov r2, #0x8
    mov r3, #0xf9
    str ip, [sp, #0x0]
    bl func_ov003_0214ee3c
    mov r1, #0xea
    mov r0, #0x14
    str r0, [sp, #0x0]
    ldr r0, .L_0215da1c
    sub r2, r1, #0xf6
    mov r3, #0xfa
    bl func_ov003_0214ee3c
    ldmia sp!, {r3, pc}
.L_0215da10: .word data_ov003_0215e46c
.L_0215da14: .word data_ov003_0215e474
.L_0215da18: .word data_ov003_0215e47c
.L_0215da1c: .word data_ov003_0215e484
    arm_func_end __sinit_ov003_0215d99c

    .global __sinit_ov003_0215da20
    arm_func_start __sinit_ov003_0215da20
__sinit_ov003_0215da20: ; 0x0215da20
    stmdb sp!, {r3, lr}
    mov ip, #0xe
    ldr r0, .L_0215da44
    sub r1, ip, #0x40
    sub r2, ip, #0x1a
    mov r3, #0x32
    str ip, [sp, #0x0]
    bl func_ov003_0214ee3c
    ldmia sp!, {r3, pc}
.L_0215da44: .word data_ov003_0215e738
    arm_func_end __sinit_ov003_0215da20

    .section .ctor, 4, 1, 4
.p__sinit_ov003_0215d8a8:
    .word __sinit_ov003_0215d8a8
.p__sinit_ov003_0215d8ec:
    .word __sinit_ov003_0215d8ec
.p__sinit_ov003_0215d930:
    .word __sinit_ov003_0215d930
.p__sinit_ov003_0215d954:
    .word __sinit_ov003_0215d954
.p__sinit_ov003_0215d978:
    .word __sinit_ov003_0215d978
.p__sinit_ov003_0215d99c:
    .word __sinit_ov003_0215d99c
.p__sinit_ov003_0215da20:
    .word __sinit_ov003_0215da20
    .section .data, 4, 1, 4
data_ov003_0215da80:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215da88:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215da90:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov003_0215daa0:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x41, 0x64, 0x64, 0x4a, 0x6f, 0x62, 0x00, 0x00, 0x00
data_ov003_0215dab0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov003_0215dac0:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov003_0215dad4:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov003_0215dae8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov003_0215daf4:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215db08:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215db1c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215db24:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215db2c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215db34:
    .word data_ov003_0215dbd4
    .word data_ov003_0215dc48
data_ov003_0215db3c:
    .word data_ov003_0215dbe0
    .word data_ov003_0215dc30
data_ov003_0215db44:
    .word data_ov003_0215dc60
    .word data_ov003_0215dc78
    .word data_ov003_0215dc1c
data_ov003_0215db50:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215db58:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215db68:
    .word func_ov003_0214ee0c
    .word func_ov003_0214ee20
    .word func_ov003_0214ed94
    .word func_0201c8a0
    .word func_ov003_0214cf74
    .word func_ov012_021b0f50
    .word func_ov003_0214edf4
    .word func_0202f668
    .word func_ov003_0214edc0
    .word func_ov003_0214cf84
    .word func_ov003_0214edb8
    .word func_ov003_0214edb0
    .word func_ov003_0214ede0
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov003_0214edd8
    .word func_ov003_0214edc8
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214eda8
    .word func_ov003_0214ede8
    .word func_ov003_0214edfc
data_ov003_0215dbd4:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215dbe0:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215dbec:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dbfc:
    .byte 0x4a, 0x41, 0x54, 0x6f, 0x70, 0x4d, 0x65, 0x6e, 0x75, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov003_0215dc0c:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6c, 0x6c, 0x69, 0x73, 0x69, 0x6f, 0x6e, 0x2e, 0x69, 0x6e, 0x6c, 0x00
data_ov003_0215dc1c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215dc30:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dc48:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dc60:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x5f, 0x6a, 0x70, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov003_0215dc78:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x5f, 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dc94:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x54, 0x6f, 0x70, 0x4d, 0x65, 0x6e, 0x75, 0x2e, 0x63, 0x70
    .byte 0x70, 0x00, 0x00, 0x00
data_ov003_0215dca8:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dcb4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215dcbc:
    .word data_ov003_0215dd5c
    .word data_ov003_0215ddb0
data_ov003_0215dcc4:
    .word data_ov003_0215dd68
    .word data_ov003_0215dd98
data_ov003_0215dccc:
    .word data_ov003_0215ddc8
    .word data_ov003_0215dde0
    .word data_ov003_0215dd84
data_ov003_0215dcd8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dce0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214ee0c
    .word func_ov003_0214ee20
    .word func_ov003_0214ed94
    .word func_0201c8a0
    .word func_ov003_0214cf74
    .word func_ov012_021b0f50
    .word func_ov003_0214edf4
    .word func_0202f668
    .word func_ov003_0214edc0
    .word func_ov003_0214cf84
    .word func_ov003_0214edb8
    .word func_ov003_0214edb0
    .word func_ov003_0214ede0
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov003_0214edd8
    .word func_ov003_0214edc8
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214eda8
    .word func_ov003_0214ede8
    .word func_ov003_0214edfc
data_ov003_0215dd5c:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215dd68:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215dd74:
    .byte 0x4a, 0x41, 0x52, 0x61, 0x6e, 0x6b, 0x4d, 0x65, 0x6e, 0x75, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov003_0215dd84:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215dd98:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov003_0215ddb0:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov003_0215ddc8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x5f, 0x6a, 0x70, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov003_0215dde0:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x61, 0x72, 0x65, 0x6e, 0x61, 0x5f, 0x74, 0x6f, 0x70
    .byte 0x5f, 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215ddfc:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x52, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x4d, 0x65, 0x6e
    .byte 0x75, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov003_0215de14:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov003_0215de20:
    .byte 0x82, 0x50, 0x00, 0x00
data_ov003_0215de24:
    .byte 0x82, 0x4f, 0x00, 0x00
data_ov003_0215de28:
    .byte 0x82, 0x58, 0x00, 0x00
data_ov003_0215de2c:
    .byte 0x82, 0x51, 0x00, 0x00
data_ov003_0215de30:
    .byte 0x82, 0x53, 0x00, 0x00
data_ov003_0215de34:
    .byte 0x82, 0x52, 0x00, 0x00
data_ov003_0215de38:
    .byte 0x82, 0x56, 0x00, 0x00
data_ov003_0215de3c:
    .byte 0x82, 0x57, 0x00, 0x00
data_ov003_0215de40:
    .byte 0x82, 0x54, 0x00, 0x00
data_ov003_0215de44:
    .byte 0x82, 0x55, 0x00, 0x00
data_ov003_0215de48:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215de50:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215de58:
    .word data_ov003_0215df2c
    .word data_ov003_0215dfa8
data_ov003_0215de60:
    .word data_ov003_0215df20
    .word data_ov003_0215df60
data_ov003_0215de68:
    .word data_ov003_0215df78
    .word data_ov003_0215df90
    .word data_ov003_0215df4c
data_ov003_0215de74:
    .word func_ov003_0214d8f8
    .word func_ov003_0214d910
    .word func_ov003_0214d928
    .word func_ov003_0214d940
data_ov003_0215de84:
    .word data_ov003_0215de24
    .word data_ov003_0215de20
    .word data_ov003_0215de2c
    .word data_ov003_0215de34
    .word data_ov003_0215de30
    .word data_ov003_0215de40
    .word data_ov003_0215de44
    .word data_ov003_0215de38
    .word data_ov003_0215de3c
    .word data_ov003_0215de28
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214ee0c
    .word func_ov003_0214ee20
    .word func_ov003_0214ed94
    .word func_0201c8a0
    .word func_ov003_0214cf74
    .word func_ov012_021b0f50
    .word func_ov003_0214edf4
    .word func_0202f668
    .word func_ov003_0214edc0
    .word func_ov003_0214cf84
    .word func_ov003_0214edb8
    .word func_ov003_0214edb0
    .word func_ov003_0214ede0
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov003_0214edd8
    .word func_ov003_0214edc8
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214eda8
    .word func_ov003_0214ede8
    .word func_ov003_0214edfc
data_ov003_0215df20:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215df2c:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215df38:
    .byte 0x4a, 0x41, 0x52, 0x61, 0x6e, 0x6b, 0x42, 0x74, 0x6c, 0x42, 0x65, 0x66, 0x5f, 0x41, 0x64, 0x64
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215df4c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215df60:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov003_0215df78:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x30, 0x30
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215df90:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x30, 0x31
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dfa8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dfc0:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x52, 0x61, 0x6e, 0x6b, 0x42, 0x74, 0x6c, 0x42, 0x65, 0x66
    .byte 0x6f, 0x72, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov003_0215dfd8:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dfe4:
    .byte 0x32, 0x44, 0x52, 0x6f, 0x74, 0x00, 0x00, 0x00
data_ov003_0215dfec:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215dff4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215dffc:
    .word data_ov003_0215e098
    .word data_ov003_0215e0cc
data_ov003_0215e004:
    .word data_ov003_0215e08c
    .word data_ov003_0215e114
data_ov003_0215e00c:
    .word data_ov003_0215e0e4
    .word data_ov003_0215e0fc
    .word data_ov003_0215e0b8
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214ee0c
    .word func_ov003_0214ee20
    .word func_ov003_0214ed94
    .word func_0201c8a0
    .word func_ov003_0214cf74
    .word func_ov012_021b0f50
    .word func_ov003_0214edf4
    .word func_0202f668
    .word func_ov003_0214edc0
    .word func_ov003_0214cf84
    .word func_ov003_0214edb8
    .word func_ov003_0214edb0
    .word func_ov003_0214ede0
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov003_0214edd8
    .word func_ov003_0214edc8
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214eda8
    .word func_ov003_0214ede8
    .word func_ov003_0214edfc
data_ov003_0215e08c:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e098:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215e0a4:
    .byte 0x4a, 0x41, 0x52, 0x61, 0x6e, 0x6b, 0x42, 0x74, 0x6c, 0x41, 0x66, 0x74, 0x5f, 0x41, 0x64, 0x64
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215e0b8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215e0cc:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e0e4:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x30, 0x30
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e0fc:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x30, 0x31
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e114:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e12c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x52, 0x61, 0x6e, 0x6b, 0x42, 0x74, 0x6c, 0x41, 0x66, 0x74
    .byte 0x65, 0x72, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov003_0215e144:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e150:
    .byte 0x32, 0x44, 0x52, 0x6f, 0x74, 0x00, 0x00, 0x00
data_ov003_0215e158:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215e160:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e168:
    .word data_ov003_0215e290
    .word data_ov003_0215e2ac
    .word data_ov003_0215e338
    .word data_ov003_0215e358
    .word data_ov003_0215e238
data_ov003_0215e17c:
    .word data_ov003_0215e22c
    .word data_ov003_0215e2c8
    .word data_ov003_0215e260
    .word data_ov003_0215e22c
    .word data_ov003_0215e2e4
    .word data_ov003_0215e260
data_ov003_0215e194:
    .word data_ov003_0215e220
    .word data_ov003_0215e300
    .word data_ov003_0215e278
    .word data_ov003_0215e220
    .word data_ov003_0215e31c
    .word data_ov003_0215e278
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214ee0c
    .word func_ov003_0214ee20
    .word func_ov003_0214ed94
    .word func_0201c8a0
    .word func_ov003_0214cf74
    .word func_ov012_021b0f50
    .word func_ov003_0214edf4
    .word func_0202f668
    .word func_ov003_0214edc0
    .word func_ov003_0214cf84
    .word func_ov003_0214edb8
    .word func_ov003_0214edb0
    .word func_ov003_0214ede0
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov003_0214edd8
    .word func_ov003_0214edc8
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214eda8
    .word func_ov003_0214ede8
    .word func_ov003_0214edfc
data_ov003_0215e220:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215e22c:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e238:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215e24c:
    .byte 0x4a, 0x41, 0x52, 0x42, 0x41, 0x66, 0x74, 0x4c, 0x73, 0x74, 0x41, 0x6c, 0x6c, 0x5f, 0x41, 0x64
    .byte 0x64, 0x00, 0x00, 0x00
data_ov003_0215e260:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6c
    .byte 0x69, 0x73, 0x74, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e278:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6c
    .byte 0x69, 0x73, 0x74, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215e290:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov003_0215e2ac:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov003_0215e2c8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x74
    .byte 0x61, 0x62, 0x6c, 0x65, 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov003_0215e2e4:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x74
    .byte 0x61, 0x62, 0x6c, 0x65, 0x30, 0x32, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov003_0215e300:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x74
    .byte 0x61, 0x62, 0x6c, 0x65, 0x30, 0x31, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov003_0215e31c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x74
    .byte 0x61, 0x62, 0x6c, 0x65, 0x30, 0x32, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov003_0215e338:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6c
    .byte 0x69, 0x73, 0x74, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov003_0215e358:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6c
    .byte 0x69, 0x73, 0x74, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov003_0215e378:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x52, 0x61, 0x6e, 0x6b, 0x42, 0x74, 0x6c, 0x41, 0x66, 0x74
    .byte 0x65, 0x72, 0x4c, 0x73, 0x74, 0x41, 0x6c, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e398:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x64, 0x73, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
data_ov003_0215e3a8:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x4a, 0x53, 0x4b, 0x46, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215e3bc:
    .byte 0x81, 0x40, 0x00, 0x00
data_ov003_0215e3c0:
    .byte 0x82, 0x58, 0x00, 0x00
data_ov003_0215e3c4:
    .byte 0x82, 0x56, 0x00, 0x00
data_ov003_0215e3c8:
    .byte 0x82, 0x50, 0x00, 0x00
data_ov003_0215e3cc:
    .byte 0x82, 0x53, 0x00, 0x00
data_ov003_0215e3d0:
    .byte 0x82, 0x51, 0x00, 0x00
data_ov003_0215e3d4:
    .byte 0x82, 0x55, 0x00, 0x00
data_ov003_0215e3d8:
    .byte 0x82, 0x52, 0x00, 0x00
data_ov003_0215e3dc:
    .byte 0x82, 0x54, 0x00, 0x00
data_ov003_0215e3e0:
    .byte 0x82, 0x4f, 0x00, 0x00
data_ov003_0215e3e4:
    .byte 0x82, 0x57, 0x00, 0x00
data_ov003_0215e3e8:
    .byte 0x01, 0x02, 0x01, 0x02, 0x03, 0x00, 0x00, 0x00
data_ov003_0215e3f0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215e3f8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215e400:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215e408:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215e410:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e418:
    .word data_ov003_0215e618
    .word data_ov003_0215e634
    .word data_ov003_0215e688
    .word data_ov003_0215e590
data_ov003_0215e428:
    .word data_ov003_0215e528
    .word data_ov003_0215e5b8
    .word data_ov003_0215e650
    .word data_ov003_0215e5e8
    .word data_ov003_0215e528
data_ov003_0215e43c:
    .word data_ov003_0215e534
    .word data_ov003_0215e5d0
    .word data_ov003_0215e66c
    .word data_ov003_0215e600
    .word data_ov003_0215e534
data_ov003_0215e450:
    .byte 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
    .byte 0x2a, 0x00, 0x00, 0x00, 0x2b, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x00, 0x00
data_ov003_0215e46c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e474:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e47c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e484:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e48c:
    .word data_ov003_0215e3e0
    .word data_ov003_0215e3c8
    .word data_ov003_0215e3d0
    .word data_ov003_0215e3d8
    .word data_ov003_0215e3cc
    .word data_ov003_0215e3dc
    .word data_ov003_0215e3d4
    .word data_ov003_0215e3c4
    .word data_ov003_0215e3e4
    .word data_ov003_0215e3c0
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214ee0c
    .word func_ov003_0214ee20
    .word func_ov003_0214ed94
    .word func_0201c8a0
    .word func_ov003_0214cf74
    .word func_ov012_021b0f50
    .word func_ov003_0214edf4
    .word func_0202f668
    .word func_ov003_0214edc0
    .word func_ov003_0214cf84
    .word func_ov003_0214edb8
    .word func_ov003_0214edb0
    .word func_ov003_0214ede0
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov003_0214edd8
    .word func_ov003_0214edc8
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214eda8
    .word func_ov003_0214ede8
    .word func_ov003_0214edfc
data_ov003_0215e528:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e534:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215e540:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e550:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e560:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov003_0215e570:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov003_0215e580:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov003_0215e590:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215e5a4:
    .byte 0x4a, 0x41, 0x52, 0x42, 0x41, 0x66, 0x74, 0x4c, 0x73, 0x74, 0x53, 0x65, 0x6c, 0x5f, 0x41, 0x64
    .byte 0x64, 0x00, 0x00, 0x00
data_ov003_0215e5b8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f, 0x70, 0x65
    .byte 0x72, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov003_0215e5d0:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f, 0x70, 0x65
    .byte 0x72, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov003_0215e5e8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6c
    .byte 0x69, 0x73, 0x74, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e600:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6c
    .byte 0x69, 0x73, 0x74, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215e618:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov003_0215e634:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f, 0x70, 0x65
    .byte 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov003_0215e650:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x74
    .byte 0x61, 0x62, 0x6c, 0x65, 0x30, 0x33, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov003_0215e66c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x74
    .byte 0x61, 0x62, 0x6c, 0x65, 0x30, 0x33, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov003_0215e688:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x72, 0x61, 0x6e, 0x6b, 0x69, 0x6e, 0x67, 0x5f, 0x6c
    .byte 0x69, 0x73, 0x74, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov003_0215e6a8:
    .byte 0x63, 0x68, 0x72, 0x2f, 0x43, 0x68, 0x72, 0x41, 0x72, 0x63, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov003_0215e6b8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x52, 0x61, 0x6e, 0x6b, 0x42, 0x74, 0x6c, 0x41, 0x66, 0x74
    .byte 0x65, 0x72, 0x4c, 0x73, 0x74, 0x53, 0x65, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e6d8:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e6e4:
    .byte 0x91, 0xe6, 0x00, 0x00
data_ov003_0215e6e8:
    .byte 0x90, 0xed, 0x96, 0xda, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e6f0:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x44, 0x53, 0x46, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
data_ov003_0215e700:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x4a, 0x53, 0x4b, 0x46, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215e714:
    .byte 0x81, 0x40, 0x00, 0x00
data_ov003_0215e718:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215e720:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov003_0215e728:
    .word data_ov003_0215e7cc
    .word data_ov003_0215e854
data_ov003_0215e730:
    .word data_ov003_0215e7d8
    .word data_ov003_0215e83c
data_ov003_0215e738:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e740:
    .byte 0x01, 0x04, 0x00, 0x01, 0x04, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x00
data_ov003_0215e74c:
    .word data_ov003_0215e824
    .word data_ov003_0215e80c
    .word data_ov003_0215e7e4
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214ee0c
    .word func_ov003_0214ee20
    .word func_ov003_0214ed94
    .word func_0201c8a0
    .word func_ov003_0214cf74
    .word func_ov012_021b0f50
    .word func_ov003_0214edf4
    .word func_0202f668
    .word func_ov003_0214edc0
    .word func_ov003_0214cf84
    .word func_ov003_0214edb8
    .word func_ov003_0214edb0
    .word func_ov003_0214ede0
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov003_0214edd8
    .word func_ov003_0214edc8
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov003_0214eda8
    .word func_ov003_0214ede8
    .word func_ov003_0214edfc
data_ov003_0215e7cc:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215e7d8:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e7e4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215e7f8:
    .byte 0x4a, 0x41, 0x52, 0x42, 0x41, 0x66, 0x74, 0x53, 0x65, 0x6c, 0x5f, 0x41, 0x64, 0x64, 0x53, 0x75
    .byte 0x62, 0x00, 0x00, 0x00
data_ov003_0215e80c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x30, 0x31
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e824:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x30, 0x30
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e83c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e854:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e86c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x52, 0x61, 0x6e, 0x6b, 0x42, 0x74, 0x6c, 0x41, 0x66, 0x74
    .byte 0x65, 0x72, 0x53, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e88c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e898:
    .byte 0x32, 0x44, 0x52, 0x6f, 0x74, 0x00, 0x00, 0x00
data_ov003_0215e8a0:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215e8a4:
    .byte 0x61, 0x00, 0x00, 0x00
data_ov003_0215e8a8:
    .byte 0x63, 0x00, 0x00, 0x00
data_ov003_0215e8ac:
    .byte 0x62, 0x00, 0x00, 0x00
data_ov003_0215e8b0:
    .byte 0x61, 0x63, 0x00, 0x00
data_ov003_0215e8b4:
    .byte 0x61, 0x61, 0x00, 0x00
data_ov003_0215e8b8:
    .byte 0x61, 0x62, 0x00, 0x00
data_ov003_0215e8bc:
    .word data_ov003_0215e96c
    .word data_ov003_0215e95c
    .word data_ov003_0215e964
data_ov003_0215e8c8:
    .word data_ov003_0215eab4
    .word data_ov003_0215ead0
    .word data_ov003_0215e9dc
data_ov003_0215e8d4:
    .word data_ov003_0215e8b0
    .word data_ov003_0215e8b4
    .word data_ov003_0215e8b8
    .word data_ov003_0215e8a8
    .word data_ov003_0215e8a4
    .word data_ov003_0215e8ac
data_ov003_0215e8ec:
    .word data_ov003_0215e984
    .word data_ov003_0215ea54
    .word data_ov003_0215e8a0
    .word data_ov003_0215e984
    .word data_ov003_0215e9c8
    .word data_ov003_0215e8a0
    .word data_ov003_0215e8a0
    .word data_ov003_0215e984
    .word data_ov003_0215ea6c
    .word data_ov003_0215ea84
    .word data_ov003_0215e984
    .word data_ov003_0215e9c8
    .word data_ov003_0215ea9c
    .word data_ov003_0215e8a0
data_ov003_0215e924:
    .word data_ov003_0215e978
    .word data_ov003_0215e9f4
    .word data_ov003_0215e8a0
    .word data_ov003_0215e978
    .word data_ov003_0215e9a0
    .word data_ov003_0215e8a0
    .word data_ov003_0215e8a0
    .word data_ov003_0215e978
    .word data_ov003_0215ea0c
    .word data_ov003_0215ea24
    .word data_ov003_0215e978
    .word data_ov003_0215e9b4
    .word data_ov003_0215ea3c
    .word data_ov003_0215e8a0
data_ov003_0215e95c:
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e964:
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e96c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x63, 0x68, 0x72, 0x2f, 0x00
data_ov003_0215e978:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e984:
    .byte 0x49, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215e990:
    .byte 0x4a, 0x41, 0x43, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x74, 0x73, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov003_0215e9a0:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x30, 0x30, 0x2e
    .byte 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e9b4:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x31, 0x30, 0x2e
    .byte 0x61, 0x74, 0x6d, 0x00
data_ov003_0215e9c8:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x30, 0x30, 0x2e
    .byte 0x64, 0x69, 0x67, 0x00
data_ov003_0215e9dc:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x68, 0x61, 0x6c, 0x6c, 0x65, 0x6e, 0x67, 0x65
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov003_0215e9f4:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x74, 0x6f
    .byte 0x70, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215ea0c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x74, 0x6f
    .byte 0x70, 0x31, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215ea24:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x61, 0x6c
    .byte 0x6c, 0x5f, 0x61, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215ea3c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x61, 0x6c
    .byte 0x6c, 0x5f, 0x62, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov003_0215ea54:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x74, 0x6f
    .byte 0x70, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215ea6c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x74, 0x6f
    .byte 0x70, 0x31, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215ea84:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x61, 0x6c
    .byte 0x6c, 0x5f, 0x61, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215ea9c:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x61, 0x6c
    .byte 0x6c, 0x5f, 0x62, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215eab4:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x6f, 0x62
    .byte 0x6a, 0x30, 0x30, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov003_0215ead0:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x63, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x5f, 0x6f, 0x62
    .byte 0x6a, 0x31, 0x30, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov003_0215eaec:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x43, 0x6f, 0x6e, 0x67, 0x72, 0x61, 0x74, 0x73, 0x2e, 0x63
    .byte 0x70, 0x70, 0x00, 0x00
data_ov003_0215eb00:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x63, 0x68, 0x72, 0x2f, 0x63, 0x68, 0x72, 0x2e, 0x61
    .byte 0x61, 0x72, 0x00, 0x00
data_ov003_0215eb14:
    .byte 0x4a, 0x41, 0x47, 0x65, 0x74, 0x4a, 0x50, 0x6f, 0x77, 0x65, 0x72, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov003_0215eb24:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x47, 0x65, 0x74, 0x4a, 0x50, 0x6f, 0x77, 0x65, 0x72, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov003_0215eb38:
    .byte 0x56, 0x73, 0x43, 0x61, 0x6c, 0x6c, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov003_0215eb44:
    .byte 0x56, 0x73, 0x43, 0x61, 0x6c, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov003_0215eb50:
    .byte 0x76, 0x73, 0x63, 0x61, 0x6c, 0x6c, 0x2f, 0x76, 0x73, 0x63, 0x61, 0x6c, 0x6c, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov003_0215eb64:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x63, 0x68, 0x72, 0x2f, 0x63, 0x68, 0x72, 0x2e, 0x61
    .byte 0x61, 0x72, 0x00, 0x00
data_ov003_0215eb78:
    .byte 0x76, 0x73, 0x63, 0x61, 0x6c, 0x6c, 0x2f, 0x76, 0x73, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov003_0215eb88:
    .byte 0x76, 0x73, 0x63, 0x61, 0x6c, 0x6c, 0x2f, 0x76, 0x73, 0x30, 0x30, 0x5f, 0x61, 0x2e, 0x61, 0x74
    .byte 0x6d, 0x00, 0x00, 0x00
data_ov003_0215eb9c:
    .byte 0x76, 0x73, 0x63, 0x61, 0x6c, 0x6c, 0x2f, 0x76, 0x73, 0x30, 0x30, 0x5f, 0x62, 0x2e, 0x61, 0x74
    .byte 0x6d, 0x00, 0x00, 0x00
data_ov003_0215ebb0:
    .byte 0x76, 0x73, 0x63, 0x61, 0x6c, 0x6c, 0x2f, 0x6f, 0x62, 0x6a, 0x5f, 0x61, 0x2e, 0x61, 0x61, 0x72
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215ebc4:
    .byte 0x76, 0x73, 0x63, 0x61, 0x6c, 0x6c, 0x2f, 0x6f, 0x62, 0x6a, 0x5f, 0x62, 0x2e, 0x61, 0x61, 0x72
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215ebd8:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov003_0215ebec:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x44, 0x53, 0x46, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
data_ov003_0215ebfc:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x63, 0x68, 0x72, 0x2f, 0x00
data_ov003_0215ec08:
    .byte 0x61, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov003_0215ec10:
    .byte 0x76, 0x61, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .section .bss, 4, 1, 4
data_ov003_0215ec20: .space 0x14
data_ov003_0215ec34: .space 0x8
data_ov003_0215ec3c: .space 0x4
