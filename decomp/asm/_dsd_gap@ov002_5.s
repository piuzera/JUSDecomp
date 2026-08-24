    .include "macros/function.inc"

    .text
    .global func_ov002_0214cd20
    arm_func_start func_ov002_0214cd20
func_ov002_0214cd20: ; 0x0214cd20
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, .L_0214cfe0
    mov r5, r0
    ldr r2, .L_0214cfe4
    mov r0, #0x5c
    mov r3, #0xdd
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x5c
    bl func_020517fc
    bl func_02026f94
    str r0, [r4, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214cfe8
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_020310f4
    ldr r2, .L_0214cfec
    str r0, [r4, #0x0]
    ldr r1, .L_0214cff0
    ldr r6, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r6, r6, #0x1
    ldr r1, .L_0214cff4
    str r6, [r2, #0x0]
    str r3, [r1, r6, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    strb r5, [r4, #0x56]
    mov r0, r5, asr #0x8
    strb r0, [r4, #0x59]
    mvn r0, #0x0
    mov r7, #0x0
    ldr r6, .L_0214cff8
    strb r0, [r4, #0x55]
    mov r5, r7
.L_0214cde8:
    ldr r0, [r6, r7, lsl #0x2]
    mov r1, r5
    blx func_020101f4
    add r1, r4, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0xc]
    cmp r7, #0x7
    blt .L_0214cde8
    mov r1, #0x0
    ldr r0, .L_0214cffc
    mov r2, r1
    bl func_02033410
    mov r5, r0
    ldr r1, [r5, #0x1c]
    cmp r1, #0x0
    bne .L_0214ce34
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214ce34:
    ldr r0, [r5, #0x1c]
    mov r1, #0x0
    str r0, [r4, #0x28]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r4, #0x2c]
    ldr r0, [r4, #0x28]
    ldr r1, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0x8]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r4, #0x30]
    ldr r0, [r4, #0x28]
    ldr r1, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0xc]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r4, #0x34]
    ldr r0, [r4, #0x28]
    ldr r1, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0x14]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x28]
    ldr r1, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0x10]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r4, #0x38]
    mov r0, #0x0
    bl func_02075298
    str r0, [r4, #0x40]
    mov r0, #0x1
    bl func_02075298
    str r0, [r4, #0x44]
    ldr r0, .L_0214d000
    mov r1, #0x88
    ldr r5, [r0, #0xe5c]
    mov r2, #0x48
    str r5, [r4, #0x4c]
    ldr r3, [r4, #0x3c]
    mov r0, r4
    mla r1, r5, r1, r3
    ldrb r3, [r1, #0xa]
    strb r3, [r4, #0x53]
    ldr r1, [r4, #0x38]
    add r1, r1, r3, lsl #0x6
    ldrb r3, [r1, #0x2c]
    strb r3, [r4, #0x52]
    ldr r1, [r4, #0x34]
    mla r1, r3, r2, r1
    ldrb r1, [r1, #0x42]
    strb r1, [r4, #0x51]
    strb r1, [r4, #0x50]
    bl func_ov002_0214d394
    ldr r3, .L_0214d004
    ldr r2, .L_0214d008
    ldr r1, .L_0214d00c
    mov r0, #0x1
    str r3, [r2, #0x0]
    blx func_ov012_021b7260
    ldr r1, .L_0214d00c
    mov r0, #0x2
    blx func_ov012_021b7260
    ldr r1, .L_0214d00c
    mov r0, #0x8
    blx func_ov012_021b7260
    ldr r1, .L_0214d00c
    mov r0, #0x4
    blx func_ov012_021b7260
    ldr r1, .L_0214d00c
    mov r0, #0x10000
    blx func_ov012_021b7260
    ldrb r2, [r4, #0x56]
    ldr r1, .L_0214d010
    mov r0, r4
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldrb r2, [r4, #0x56]
    ldr r1, .L_0214d014
    mov r0, r4
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    str r0, [r4, #0x8]
    ldrb r2, [r4, #0x56]
    ldr r1, .L_0214d018
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    blx func_ov012_021b65bc
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x1
    strb r0, [r4, #0x54]
    ldr r0, [r4, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214cfe0: .word data_ov002_0215be4c
.L_0214cfe4: .word data_ov002_0215bbf0
.L_0214cfe8: .word func_ov002_0214d034
.L_0214cfec: .word data_02093c04
.L_0214cff0: .word data_020a0e80
.L_0214cff4: .word data_020a16c0
.L_0214cff8: .word data_ov002_0215bd48
.L_0214cffc: .word data_ov002_0215be58
.L_0214d000: .word data_020b32b8
.L_0214d004: .word func_ov002_0214d524
.L_0214d008: .word data_ov012_021d514c
.L_0214d00c: .word 0x30078
.L_0214d010: .word data_ov002_0215bcf4
.L_0214d014: .word data_ov002_0215bd10
.L_0214d018: .word data_ov002_0215bd80
    arm_func_end func_ov002_0214cd20

    .global func_ov002_0214d01c
    arm_func_start func_ov002_0214d01c
func_ov002_0214d01c: ; 0x0214d01c
    ldr r1, [r1, #0x0]
    mov r1, r1, asr #0x4
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov002_0214d01c

    .global func_ov002_0214d02c
    arm_func_start func_ov002_0214d02c
func_ov002_0214d02c: ; 0x0214d02c
    str r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov002_0214d02c

    .global func_ov002_0214d034
    arm_func_start func_ov002_0214d034
func_ov002_0214d034: ; 0x0214d034
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    bl func_ov002_0214e028
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214d034

    .global func_ov002_0214d060
    arm_func_start func_ov002_0214d060
func_ov002_0214d060: ; 0x0214d060
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    mov r0, r4
    bl func_ov002_0214e028
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r2, [r4, #0x56]
    ldr r1, .L_0214d104
    ldr r0, [r4, #0x8]
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x8]
    ldrb r2, [r4, #0x57]
    ldr r1, .L_0214d108
    mov r0, r4
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldr r0, .L_0214d10c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214d10c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0214d110
    bl func_02028384
    ldrb r2, [r4, #0x57]
    ldr r1, .L_0214d114
    mov r0, r4
    strb r2, [r4, #0x56]
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    str r0, [r4, #0x8]
    ldrb r2, [r4, #0x56]
    ldr r1, .L_0214d118
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d104: .word data_ov002_0215bd64
.L_0214d108: .word data_ov002_0215bcf4
.L_0214d10c: .word data_020a0e18
.L_0214d110: .word func_ov002_0214d034
.L_0214d114: .word data_ov002_0215bd10
.L_0214d118: .word data_ov002_0215bd80
    arm_func_end func_ov002_0214d060

    .global func_ov002_0214d11c
    arm_func_start func_ov002_0214d11c
func_ov002_0214d11c: ; 0x0214d11c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    blx func_ov012_021b65cc
    ldr r2, .L_0214d330
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
    ldrb r1, [r4, #0x52]
    ldr r2, [r4, #0x34]
    mov r0, #0x48
    mla r0, r1, r0, r2
    ldrb r3, [r4, #0x51]
    ldrb r0, [r0, #0x42]
    cmp r3, r0
    ldrne r1, [r4, #0x30]
    movne r0, #0x3c
    mlane r0, r3, r0, r1
    ldrneb r0, [r0, #0x2d]
    strneb r0, [r4, #0x52]
    ldrb r0, [r4, #0x53]
    ldr r1, [r4, #0x38]
    ldrb r2, [r4, #0x52]
    add r0, r1, r0, lsl #0x6
    ldrb r0, [r0, #0x2c]
    cmp r2, r0
    ldrne r1, [r4, #0x34]
    movne r0, #0x48
    mlane r0, r2, r0, r1
    ldrneb r0, [r0, #0x38]
    strneb r0, [r4, #0x53]
    ldr r2, [r4, #0x3c]
    ldr r1, [r4, #0x4c]
    mov r0, #0x88
    mla r0, r1, r0, r2
    ldrb r1, [r4, #0x53]
    ldrb r0, [r0, #0xa]
    cmp r1, r0
    ldrne r0, [r4, #0x38]
    addne r0, r0, r1, lsl #0x6
    ldrneb r0, [r0, #0x31]
    strne r0, [r4, #0x4c]
    ldrb r0, [r4, #0x58]
    cmp r0, #0x0
    ldr r0, [r4, #0x4c]
    bne .L_0214d210
    mov r1, #0x1
    blx func_02071afc
    b .L_0214d218
.L_0214d210:
    mov r1, #0x0
    blx func_02071afc
.L_0214d218:
    bl func_020735e4
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq .L_0214d234
    bl func_ov002_0215122c
    mov r0, #0x0
    str r0, [r4, #0x48]
.L_0214d234:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0214d258
    ldrb r2, [r4, #0x56]
    ldr r1, .L_0214d334
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0214d258:
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq .L_0214d268
    bl func_0207535c
.L_0214d268:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_0214d278
    bl func_0207535c
.L_0214d278:
    mov r5, #0x0
.L_0214d27c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_0214d298
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214d298:
    add r5, r5, #0x1
    cmp r5, #0x7
    blt .L_0214d27c
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_0214d2c0
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214d2c0:
    ldrb r3, [r4, #0x56]
    ldr r1, .L_0214d338
    ldrb ip, [r4, #0x59]
    ldr r2, [r1, #0x0]
    ldr r0, .L_0214d33c
    mov r3, r3, lsl #0x4
    ldrb r5, [r4, #0x58]
    orr lr, r3, ip, lsl #0x8
    add ip, r2, #0x1
    ldr r3, [r0, r2, lsl #0x2]
    ldr r0, .L_0214d340
    ldr r2, .L_0214d344
    orr r5, r5, lr
    str r5, [r2, #0x8]
    str ip, [r1, #0x0]
    str r3, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d330: .word data_ov012_021d514c
.L_0214d334: .word data_ov002_0215bd64
.L_0214d338: .word data_02093c04
.L_0214d33c: .word data_020a16c0
.L_0214d340: .word data_020a0e80
.L_0214d344: .word data_020afcb0
    arm_func_end func_ov002_0214d11c

    .global func_ov002_0214d348
    arm_func_start func_ov002_0214d348
func_ov002_0214d348: ; 0x0214d348
    stmdb sp!, {r4, lr}
    mov r4, r0
    strb r1, [r4, #0x57]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214d38c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldrb r2, [r4, #0x56]
    ldr r1, .L_0214d390
    mov r0, r4
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    blx func_ov012_021b65bc
    ldmia sp!, {r4, pc}
.L_0214d38c: .word func_ov002_0214d060
.L_0214d390: .word data_ov002_0215bd2c
    arm_func_end func_ov002_0214d348

    .global func_ov002_0214d394
    arm_func_start func_ov002_0214d394
func_ov002_0214d394: ; 0x0214d394
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r1, [r4, #0x51]
    ldr r0, .L_0214d40c
    ldrsb r2, [r4, #0x55]
    ldrb r0, [r0, r1]
    cmp r0, r2
    beq .L_0214d3f4
    mvn r0, #0x0
    cmp r2, r0
    beq .L_0214d3cc
    bl func_020735e4
    mvn r0, #0x0
    strb r0, [r4, #0x55]
.L_0214d3cc:
    ldrb r1, [r4, #0x51]
    ldr r0, .L_0214d40c
    ldrb r0, [r0, r1]
    bl func_020734e0
    mov r0, #0x7b
    bl func_02073744
    ldrb r1, [r4, #0x51]
    ldr r0, .L_0214d40c
    ldrb r0, [r0, r1]
    strb r0, [r4, #0x55]
.L_0214d3f4:
    ldrb r2, [r4, #0x51]
    ldr r0, .L_0214d40c
    mov r1, #0x0
    ldrb r0, [r0, r2]
    bl func_0207361c
    ldmia sp!, {r4, pc}
.L_0214d40c: .word data_ov002_0215afe0
    arm_func_end func_ov002_0214d394

    .global func_ov002_0214d410
    arm_func_start func_ov002_0214d410
func_ov002_0214d410: ; 0x0214d410
    stmdb sp!, {r3, lr}
    ldrsb r2, [r0, #0x55]
    mvn r1, #0x0
    cmp r2, r1
    ldmeqia sp!, {r3, pc}
    strb r1, [r0, #0x55]
    mov r0, #0x8
    bl func_0207367c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0214d410

    .global func_ov002_0214d434
    arm_func_start func_ov002_0214d434
func_ov002_0214d434: ; 0x0214d434
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0x4]
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    beq .L_0214d454
    bl func_ov002_0214d498
.L_0214d454:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_0214d468
    bl func_ov002_0214d498
.L_0214d468:
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r0, r5
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov002_0214d4c0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_0214d434

    .global func_ov002_0214d498
    arm_func_start func_ov002_0214d498
func_ov002_0214d498: ; 0x0214d498
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214d4b8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d4b8:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214d498

    .global func_ov002_0214d4c0
    arm_func_start func_ov002_0214d4c0
func_ov002_0214d4c0: ; 0x0214d4c0
    ldr r0, [r0, #0x4]
    ldr r3, [r1, #0x0]
    ldr r2, [r2, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0214d4e4
    str r3, [r0, #0xc]
    mov r1, #0x1
    str r2, [r0, #0x10]
    bx ip
.L_0214d4e4: .word func_ov002_0214d4e8
    arm_func_end func_ov002_0214d4c0

    .global func_ov002_0214d4e8
    arm_func_start func_ov002_0214d4e8
func_ov002_0214d4e8: ; 0x0214d4e8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r2, [r5, #0x24]
    mov r4, r1
    orr r1, r2, r4
    cmp r2, r1
    beq .L_0214d510
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0214d510:
    ldrb r0, [r5, #0x24]
    orr r0, r0, r4
    orr r0, r0, #0x30
    strb r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_0214d4e8

    .global func_ov002_0214d524
    arm_func_start func_ov002_0214d524
func_ov002_0214d524: ; 0x0214d524
    ldr ip, .L_0214d538
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bx ip
.L_0214d538: .word func_0207342c
    arm_func_end func_ov002_0214d524

    .global func_ov002_0214d53c
    arm_func_start func_ov002_0214d53c
func_ov002_0214d53c: ; 0x0214d53c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r4, r1
    mov r0, r2
    mov r5, r3
    bl func_ov002_0214d614
    cmp r4, #0x0
    beq .L_0214d570
    mov r0, r4
    bl func_020329ec
    bl func_ov002_0214d498
    b .L_0214d578
.L_0214d570:
    bl func_020329d4
    bl func_ov002_0214d498
.L_0214d578:
    mov r4, r0
    cmp r6, #0x0
    beq .L_0214d5a8
    ldr r0, [r4, #0x4]
    mov r1, r6
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214d5a8:
    ldr r0, [sp, #0x18]
    ldr r1, [r4, #0x4]
    ldr r3, .L_0214d610
    mov r2, r0, lsl #0xc
    str r3, [r1, #0x54]
    add r1, sp, #0x0
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov002_0214d650
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    cmp r5, #0x0
    beq .L_0214d600
    mov r0, r4
    mov r1, r5
    bl func_ov002_0214d678
    mov r0, r5
    mov r1, r4
    bl func_ov002_0214d6b0
.L_0214d600:
    bl func_ov002_0214d6e8
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0214d610: .word 0x31305053
    arm_func_end func_ov002_0214d53c

    .global func_ov002_0214d614
    arm_func_start func_ov002_0214d614
func_ov002_0214d614: ; 0x0214d614
    stmdb sp!, {r3, lr}
    ldr r2, .L_0214d644
    ldr r1, .L_0214d648
    ldr ip, [r2, #0x0]
    ldr lr, [r0, #0x4]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r0, .L_0214d64c
    str ip, [r2, #0x0]
    str r3, [r0, ip, lsl #0x2]
    str lr, [r1, #0x0]
    ldmia sp!, {r3, pc}
.L_0214d644: .word data_02093c08
.L_0214d648: .word data_020a0dd0
.L_0214d64c: .word data_020a16d0
    arm_func_end func_ov002_0214d614

    .global func_ov002_0214d650
    arm_func_start func_ov002_0214d650
func_ov002_0214d650: ; 0x0214d650
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
    arm_func_end func_ov002_0214d650

    .global func_ov002_0214d678
    arm_func_start func_ov002_0214d678
func_ov002_0214d678: ; 0x0214d678
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214d69c
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
.L_0214d69c:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0214d678

    .global func_ov002_0214d6b0
    arm_func_start func_ov002_0214d6b0
func_ov002_0214d6b0: ; 0x0214d6b0
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
    arm_func_end func_ov002_0214d6b0

    .global func_ov002_0214d6e8
    arm_func_start func_ov002_0214d6e8
func_ov002_0214d6e8: ; 0x0214d6e8
    ldr r1, .L_0214d70c
    ldr r2, .L_0214d710
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214d714
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bx lr
.L_0214d70c: .word data_02093c08
.L_0214d710: .word data_020a16d0
.L_0214d714: .word data_020a0dd0
    arm_func_end func_ov002_0214d6e8

    .global func_ov002_0214d718
    arm_func_start func_ov002_0214d718
func_ov002_0214d718: ; 0x0214d718
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r7, r1
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov002_0214d614
    mov r1, #0x0
    ldr r0, .L_0214d7f8
    mov r2, r1
    blx func_ov012_021caa0c
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov002_0214d498
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    mov r0, r7, lsl #0xc
    str r0, [sp, #0x8]
    mov r0, r5
    add r1, sp, #0x8
    bl func_ov002_0214d650
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0xf000
    str r0, [sp, #0x0]
    mov r0, #0x8000
    str r0, [sp, #0x4]
    mov r0, r5
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov002_0214d4c0
    cmp r6, #0x0
    beq .L_0214d7d8
    mov r0, r6
    mov r1, r5
    bl func_ov002_0214d6b0
    mov r0, r5
    mov r1, r6
    bl func_ov002_0214d678
.L_0214d7d8:
    bl func_ov002_0214d6e8
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0214d7f8: .word data_ov002_0215be6c
    arm_func_end func_ov002_0214d718

    .global func_ov002_0214d7fc
    arm_func_start func_ov002_0214d7fc
func_ov002_0214d7fc: ; 0x0214d7fc
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov002_0214d7fc

    .global func_ov002_0214d808
    arm_func_start func_ov002_0214d808
func_ov002_0214d808: ; 0x0214d808
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr ip, .L_0214d894
    mov r6, r0
    ldr r1, .L_0214d898
    ldr r2, .L_0214d89c
    ldr r3, .L_0214d8a0
    mov r0, #0x14c
    ldr r4, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214d848
    ldr r3, .L_0214d8a4
    mov r2, r4
    mov r1, #0x0
    blx func_ov012_021b7950
.L_0214d848:
    bl func_ov002_0214d498
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    cmp r5, #0x0
    beq .L_0214d88c
    mov r0, r4
    mov r1, r5
    blx func_ov012_021b3ba4
.L_0214d88c:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_0214d894: .word data_ov012_021d5154
.L_0214d898: .word data_ov002_0215bc54
.L_0214d89c: .word data_ov002_0215bbe8
.L_0214d8a0: .word 0x2a6
.L_0214d8a4: .word func_ov002_0214d8a8
    arm_func_end func_ov002_0214d808

    .global func_ov002_0214d8a8
    arm_func_start func_ov002_0214d8a8
func_ov002_0214d8a8: ; 0x0214d8a8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x44
    ldr r1, .L_0214d8f0
    ldr r2, .L_0214d8f4
    add r3, r0, #0xc1
    bl func_0201a21c
    movs r4, r0
    beq .L_0214d8e8
    mov r1, r5
    mov r2, #0x0
    bl func_02014604
    ldr r1, .L_0214d8f8
    mov r0, #0x1
    str r1, [r4, #0x0]
    strb r0, [r4, #0x40]
.L_0214d8e8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d8f0: .word data_ov002_0215bc2c
.L_0214d8f4: .word data_ov002_0215bc0c
.L_0214d8f8: .word data_ov012_021d2a24
    arm_func_end func_ov002_0214d8a8

    .global func_ov002_0214d8fc
    arm_func_start func_ov002_0214d8fc
func_ov002_0214d8fc: ; 0x0214d8fc
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    ldr r7, [r1, #0x4]
    ldr r4, .L_0214da10
    mov r8, r0
    mov r5, r3
    ldr r1, .L_0214da14
    ldr r2, .L_0214da18
    mov r0, #0x134
    mov r3, #0x3e
    ldr r4, [r4, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214d944
    ldr r3, .L_0214da1c
    mov r1, r7
    mov r2, r4
    blx func_ov012_021af0f8
.L_0214d944:
    bl func_ov002_0214d498
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, [r6, #0x0]
    ldr r0, [r0, #0x50]
    mov r1, #0x1
    str r2, [r0, #0xc]
    ldr r2, [r6, #0x4]
    str r2, [r0, #0x10]
    ldr r2, [r6, #0x8]
    str r2, [r0, #0x14]
    bl func_ov002_0214d4e8
    ldr r1, .L_0214da20
    ldr r2, .L_0214da24
    ldr r3, .L_0214da28
    mov r0, #0x70
    bl func_0201a21c
    movs r6, r0
    beq .L_0214d9cc
    ldr r2, .L_0214da2c
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_0214da30
    mov r1, r5
    add r0, r6, #0x68
    str r2, [r6, #0x0]
    bl func_ov002_0214da38
    ldr r0, .L_0214da34
    str r0, [r6, #0x0]
.L_0214d9cc:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_0214d9e8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d9e8:
    ldr r1, [r6, #0x18]
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0214da10: .word data_ov012_021d5154
.L_0214da14: .word data_ov002_0215bbfc
.L_0214da18: .word data_ov002_0215bbd8
.L_0214da1c: .word func_ov002_0214d8a8
.L_0214da20: .word data_ov002_0215bc1c
.L_0214da24: .word data_ov002_0215bbe0
.L_0214da28: .word 0x1b2
.L_0214da2c: .word data_02093c8c
.L_0214da30: .word data_ov002_0215bde0
.L_0214da34: .word data_ov012_021d1c58
    arm_func_end func_ov002_0214d8fc

    .global func_ov002_0214da38
    arm_func_start func_ov002_0214da38
func_ov002_0214da38: ; 0x0214da38
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov002_0214da38

    .global func_ov002_0214da4c
    arm_func_start func_ov002_0214da4c
func_ov002_0214da4c: ; 0x0214da4c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r1
    mov r4, r3
    mov r1, r2
    add r2, r6, #0x10
    add r3, r6, #0x1c
    bl func_ov002_0214d8fc
    mov r5, r0
    str r4, [sp, #0x0]
    ldr r1, [r6, #0xc]
    ldr r2, [sp, #0x18]
    mov r3, r5
    mov r0, #0x0
    bl func_ov002_0214d53c
    mov r4, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r6, #0x0]
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    ldr r1, [r6, #0x4]
    blx func_ov012_021b3fc4
    ldr r0, [r5, #0x4]
    ldr r1, [r6, #0x0]
    blx func_ov012_021b3fb0
    ldr r0, [r5, #0x4]
    ldr r1, [r6, #0x8]
    blx func_ov012_021b400c
    ldr r1, [r6, #0x0]
    cmp r1, #0x0
    beq .L_0214daec
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    b .L_0214db00
.L_0214daec:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0214db00:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
    arm_func_end func_ov002_0214da4c

    .global func_ov002_0214db0c
    arm_func_start func_ov002_0214db0c
func_ov002_0214db0c: ; 0x0214db0c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r4, #0x0
    mov r9, r2
    mov r8, r3
    strb r4, [r9, #0x0]
    str r0, [sp, #0x0]
    mov r10, r1
    mov r5, r4
    strb r4, [r8, #0x0]
    b .L_0214dbf8
.L_0214db38:
    add r11, r10, r5
    ldr r0, [sp, #0x0]
    ldrb r1, [r11, #0x31]
    ldr r2, [r0, #0x3c]
    mov r0, #0x88
    mla r0, r1, r0, r2
    ldrsb r1, [r0, #0x4]
    mov r6, #0x1
    str r0, [sp, #0x4]
    sub r0, r6, #0x2
    cmp r1, r0
    beq .L_0214db94
    add r0, r10, r1
    ldrb r1, [r0, #0x31]
    ldr r0, .L_0214dc18
    add r0, r0, r1
    add r0, r0, #0x3000
    ldrb r0, [r0, #0xdcc]
    tst r0, #0x1
    movne r0, r6
    moveq r0, #0x0
    cmp r0, #0x0
    moveq r4, #0x1
.L_0214db94:
    mvn r0, #0x0
    mov r7, #0x0
    str r0, [sp, #0x8]
    b .L_0214dbdc
.L_0214dba4:
    ldr r0, [sp, #0x4]
    mov r1, #0x14
    mla r0, r7, r1, r0
    ldrsh r1, [r0, #0x10]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    beq .L_0214dbd8
    ldrb r0, [r11, #0x31]
    mov r1, r7
    bl func_ov002_0214dc1c
    cmp r0, #0x0
    moveq r6, #0x0
    beq .L_0214dbe4
.L_0214dbd8:
    add r7, r7, #0x1
.L_0214dbdc:
    cmp r7, #0x5
    blt .L_0214dba4
.L_0214dbe4:
    cmp r6, #0x0
    ldrneb r0, [r9, #0x0]
    add r5, r5, #0x1
    addne r0, r0, #0x1
    strneb r0, [r9, #0x0]
.L_0214dbf8:
    ldrb r0, [r10, #0x30]
    cmp r5, r0
    blt .L_0214db38
    cmp r4, #0x0
    mvnne r0, #0x0
    strb r0, [r8, #0x0]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0214dc18: .word data_020b02b8
    arm_func_end func_ov002_0214db0c

    .global func_ov002_0214dc1c
    arm_func_start func_ov002_0214dc1c
func_ov002_0214dc1c: ; 0x0214dc1c
    ldr r2, .L_0214dc38
    mov r3, #0x1
    ldrb r0, [r2, r0]
    tst r0, r3, lsl r1
    moveq r3, #0x0
    mov r0, r3
    bx lr
.L_0214dc38: .word data_020b4084
    arm_func_end func_ov002_0214dc1c

    .global func_ov002_0214dc3c
    arm_func_start func_ov002_0214dc3c
func_ov002_0214dc3c: ; 0x0214dc3c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r5, #0x0
    mov r7, r3
    mov r8, r2
    strb r5, [r7, #0x0]
    mov r10, r0
    mov r9, r1
    mov r6, r5
    strb r5, [r8, #0x0]
    add r11, sp, #0x1
    mvn r4, #0x0
    b .L_0214dcbc
.L_0214dc6c:
    add r0, r9, r6
    ldrb r1, [r0, #0x38]
    ldr r3, [r10, #0x38]
    mov r0, r10
    add r1, r3, r1, lsl #0x6
    mov r2, r11
    add r3, sp, #0x0
    bl func_ov002_0214db0c
    ldrb r1, [r8, #0x0]
    ldrb r0, [sp, #0x1]
    add r6, r6, #0x1
    add r0, r1, r0
    strb r0, [r8, #0x0]
    ldrsb r1, [r7, #0x0]
    ldrsb r0, [sp, #0x0]
    add r0, r1, r0
    strb r0, [r7, #0x0]
    ldrsb r0, [sp, #0x0]
    cmp r0, r4
    moveq r5, #0x1
.L_0214dcbc:
    ldrb r0, [r9, #0x44]
    cmp r6, r0
    blt .L_0214dc6c
    cmp r5, #0x0
    mvnne r0, #0x0
    strneb r0, [r7, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov002_0214dc3c

    .global func_ov002_0214dcd8
    arm_func_start func_ov002_0214dcd8
func_ov002_0214dcd8: ; 0x0214dcd8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    mov r1, #0xa
    mov r9, r0
    mov r7, r2
    mov r6, r3
    bl func_0200d12c
    mov r4, r0
    ldr r1, [sp, #0x20]
    ldr r0, [r8, #0x4]
    add r1, r1, r4
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r8, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0xa
    mul r1, r4, r0
    sub r5, r9, r1
    sub r0, r0, #0xb
    cmp r9, r0
    moveq r5, #0xc
    cmp r4, #0x0
    mov r1, #0x0
    bne .L_0214dda8
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x20]
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    add r1, r1, r5
    bl func_02023894
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0214dda8:
    ldr r0, [r6, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x20]
    ldr r0, [r7, #0x4]
    mov r2, #0x0
    add r1, r1, r5
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    arm_func_end func_ov002_0214dcd8

    .global func_ov002_0214de0c
    arm_func_start func_ov002_0214de0c
func_ov002_0214de0c: ; 0x0214de0c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    ldr r2, [r4, #0x34]
    mov r0, #0x48
    mla r7, r1, r0, r2
    ldrb r0, [r7, #0x43]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0214ded0
.L_0214de30: ; jump table
    b .L_0214de40 ; case 0
    b .L_0214de48 ; case 1
    b .L_0214de94 ; case 2
    b .L_0214debc ; case 3
.L_0214de40:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0214de48:
    mov r9, #0x0
    mov r8, #0x1
    mov r6, r9
    mvn r5, #0x0
.L_0214de58:
    add r0, r7, r9, lsl #0x1
    ldrsh r1, [r0, #0x30]
    cmp r1, r5
    beq .L_0214de78
    mov r0, r4
    bl func_ov002_0214dedc
    cmp r0, #0x0
    moveq r8, r6
.L_0214de78:
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_0214de58
    cmp r8, #0x0
    beq .L_0214ded0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0214de94:
    ldrsh r2, [r7, #0x30]
    ldr r1, .L_0214ded8
    mov r0, #0x1
    and r3, r2, #0xff
    mov r2, r3, lsr #0x5
    ldr r1, [r1, r2, lsl #0x2]
    and r2, r3, #0x1f
    tst r1, r0, lsl r2
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0214debc:
    blx func_02070f94
    ldrsh r1, [r7, #0x30]
    cmp r1, r0
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0214ded0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0214ded8: .word data_020b0d34
    arm_func_end func_ov002_0214de0c

    .global func_ov002_0214dedc
    arm_func_start func_ov002_0214dedc
func_ov002_0214dedc: ; 0x0214dedc
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r2, [r6, #0x34]
    mov r0, #0x48
    mla r4, r1, r0, r2
    mov r5, #0x0
    b .L_0214df18
.L_0214def8:
    add r0, r4, r5
    ldrb r1, [r0, #0x38]
    mov r0, r6
    bl func_ov002_0214df2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
.L_0214df18:
    ldrb r0, [r4, #0x44]
    cmp r5, r0
    blt .L_0214def8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov002_0214dedc

    .global func_ov002_0214df2c
    arm_func_start func_ov002_0214df2c
func_ov002_0214df2c: ; 0x0214df2c
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x38]
    mvn r0, #0x0
    add ip, r2, r1, lsl #0x6
    ldrsb r1, [ip, #0x2f]
    cmp r1, r0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    mov lr, #0x0
    ldrb r4, [ip, #0x30]
    ldr r3, .L_0214dfa4
    mov r1, lr
    mov r2, #0x1
    b .L_0214df94
.L_0214df64:
    add r0, ip, lr
    ldrb r0, [r0, #0x31]
    add r0, r3, r0
    add r0, r0, #0x3000
    ldrb r0, [r0, #0xdcc]
    tst r0, #0x1
    movne r0, r2
    moveq r0, r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add lr, lr, #0x1
.L_0214df94:
    cmp lr, r4
    blt .L_0214df64
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0214dfa4: .word data_020b02b8
    arm_func_end func_ov002_0214df2c

    .global func_ov002_0214dfa8
    arm_func_start func_ov002_0214dfa8
func_ov002_0214dfa8: ; 0x0214dfa8
    ldrb r1, [r0, #0x2d]
    cmp r1, #0x2b
    ldrlo r0, .L_0214dff8
    addlo r0, r1, r0
    bxlo lr
    sub r1, r1, #0x2b
    cmp r1, #0xe
    ldreq r0, .L_0214dffc
    bxeq lr
    cmp r1, #0xa
    ldrhs r0, .L_0214e000
    bxhs lr
    cmp r1, #0x5
    ldrhs r0, .L_0214e004
    bxhs lr
    cmp r1, #0x1
    ldrhs r0, .L_0214e000
    addhs r0, r1, r0
    ldrlo r0, .L_0214dffc
    bx lr
.L_0214dff8: .word 0xa00fff
.L_0214dffc: .word 0xa01029
.L_0214e000: .word 0xa01032
.L_0214e004: .word 0xa01037
    arm_func_end func_ov002_0214dfa8

    .global func_ov002_0214e008
    arm_func_start func_ov002_0214e008
func_ov002_0214e008: ; 0x0214e008
    cmp r0, #0x2b
    ldrlo r1, .L_0214e020
    subhs r0, r0, #0x2b
    ldrhs r1, .L_0214e024
    ldr r0, [r1, r0, lsl #0x2]
    bx lr
.L_0214e020: .word data_0209e840
.L_0214e024: .word data_ov002_0215bd9c
    arm_func_end func_ov002_0214e008

    .global func_ov002_0214e028
    arm_func_start func_ov002_0214e028
func_ov002_0214e028: ; 0x0214e028
    stmdb sp!, {r3, lr}
    ldrb r0, [r0, #0x54]
    cmp r0, #0x0
    beq .L_0214e040
    bl func_0207382c
    ldmia sp!, {r3, pc}
.L_0214e040:
    bl func_02073840
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0214e028

    .global func_ov002_0214e048
    arm_func_start func_ov002_0214e048
func_ov002_0214e048: ; 0x0214e048
    mov r0, #0x0
    bx lr
    arm_func_end func_ov002_0214e048

    .global func_ov002_0214e050
    arm_func_start func_ov002_0214e050
func_ov002_0214e050: ; 0x0214e050
    bx lr
    arm_func_end func_ov002_0214e050

    .global func_ov002_0214e054
    arm_func_start func_ov002_0214e054
func_ov002_0214e054: ; 0x0214e054
    bx lr
    arm_func_end func_ov002_0214e054

    .global func_ov002_0214e058
    arm_func_start func_ov002_0214e058
func_ov002_0214e058: ; 0x0214e058
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x48]
    cmp r1, #0x0
    beq .L_0214e09c
    ldrb r0, [r4, #0x56]
    mov r1, #0x1
    cmp r0, #0x3
    bne .L_0214e088
    mov r0, #0x4
    bl func_02073ebc
    b .L_0214e090
.L_0214e088:
    mov r0, #0x6
    bl func_02073ebc
.L_0214e090:
    mov r0, #0x1
    strb r0, [r4, #0x54]
    b .L_0214e0b8
.L_0214e09c:
    bl func_ov002_02150b4c
    str r0, [r4, #0x48]
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x1
    strb r0, [r4, #0x54]
.L_0214e0b8:
    mov r0, r4
    bl func_ov002_0214e270
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e058

    .global func_ov002_0214e0c4
    arm_func_start func_ov002_0214e0c4
func_ov002_0214e0c4: ; 0x0214e0c4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq .L_0214e0e4
    bl func_ov002_0215122c
    mov r0, #0x0
    str r0, [r4, #0x48]
.L_0214e0e4:
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r1, #0x1
    mov r0, r4
    strb r1, [r4, #0x54]
    bl func_ov002_0214e270
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e0c4

    .global func_ov002_0214e104
    arm_func_start func_ov002_0214e104
func_ov002_0214e104: ; 0x0214e104
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x6
    mov r1, #0x1
    bl func_02073ebc
    mov r1, #0x1
    mov r0, r4
    strb r1, [r4, #0x54]
    bl func_ov002_0214d410
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e104

    .global func_ov002_0214e12c
    arm_func_start func_ov002_0214e12c
func_ov002_0214e12c: ; 0x0214e12c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq .L_0214e14c
    bl func_ov002_0215122c
    mov r0, #0x0
    str r0, [r4, #0x48]
.L_0214e14c:
    mov r0, r4
    bl func_ov002_0214d410
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e12c

    .global func_ov002_0214e158
    arm_func_start func_ov002_0214e158
func_ov002_0214e158: ; 0x0214e158
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x57]
    mov r1, #0x1
    cmp r0, #0x3
    bne .L_0214e194
    mov r0, #0x7
    bl func_02073ebc
    mov r0, #0x1
    strb r0, [r4, #0x54]
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_02151474
    ldmia sp!, {r4, pc}
.L_0214e194:
    cmp r0, #0x1
    bne .L_0214e1b0
    mov r0, #0x7
    bl func_02073ebc
    mov r0, #0x1
    strb r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
.L_0214e1b0:
    mov r0, #0x3
    bl func_02073ebc
    mov r0, #0x1
    strb r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e158

    .global func_ov002_0214e1c4
    arm_func_start func_ov002_0214e1c4
func_ov002_0214e1c4: ; 0x0214e1c4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x57]
    mov r1, #0x1
    cmp r0, #0x0
    bne .L_0214e1e8
    mov r0, #0x7
    bl func_02073ebc
    b .L_0214e1f0
.L_0214e1e8:
    mov r0, #0x3
    bl func_02073ebc
.L_0214e1f0:
    mov r0, #0x1
    strb r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e1c4

    .global func_ov002_0214e1fc
    arm_func_start func_ov002_0214e1fc
func_ov002_0214e1fc: ; 0x0214e1fc
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x1
    strb r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e1fc

    .global func_ov002_0214e21c
    arm_func_start func_ov002_0214e21c
func_ov002_0214e21c: ; 0x0214e21c
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x5
    mov r1, #0x1
    bl func_02073ebc
.L_0214e230:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0214e230
    mov r0, #0x1
    strb r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e21c

    .global func_ov002_0214e248
    arm_func_start func_ov002_0214e248
func_ov002_0214e248: ; 0x0214e248
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x330]
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    beq .L_0214e264
    bl func_ov002_02151288
.L_0214e264:
    mov r0, r4
    bl func_ov002_02151aec
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e248

    .global func_ov002_0214e270
    arm_func_start func_ov002_0214e270
func_ov002_0214e270: ; 0x0214e270
    stmdb sp!, {r3, lr}
    ldrb r0, [r0, #0x51]
    cmp r0, #0x0
    bne .L_0214e298
    bl func_0203b3e4
    mov r1, #0x0
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov002_0214e2d8
    ldmia sp!, {r3, pc}
.L_0214e298:
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x9
    mov r2, #0x3e
    bl func_ov002_0214e2d8
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0xb
    ldr r2, [r0, #0x4]
    mov r0, #0x5
    str r1, [r2, #0x8c0]
    str r0, [r2, #0x8c4]
    mov r0, #0x1
    str r0, [r2, #0x8f0]
    strb r0, [r2, #0x902]
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0214e270

    .global func_ov002_0214e2d8
    arm_func_start func_ov002_0214e2d8
func_ov002_0214e2d8: ; 0x0214e2d8
    ldr r3, [r0, #0x4]
    mov r0, #0x1
    str r1, [r3, #0x8e8]
    str r2, [r3, #0x8ec]
    str r0, [r3, #0x8f0]
    strb r0, [r3, #0x902]
    bx lr
    arm_func_end func_ov002_0214e2d8

    .global func_ov002_0214e2f4
    arm_func_start func_ov002_0214e2f4
func_ov002_0214e2f4: ; 0x0214e2f4
    ldrh r1, [r0, #0x4]
    add r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    bx lr
    arm_func_end func_ov002_0214e2f4

    .global func_ov002_0214e308
    arm_func_start func_ov002_0214e308
func_ov002_0214e308: ; 0x0214e308
    str r1, [r0, #0x30]
    bx lr
    arm_func_end func_ov002_0214e308

    .global func_ov002_0214e310
    arm_func_start func_ov002_0214e310
func_ov002_0214e310: ; 0x0214e310
    mov r0, #0x0
    bx lr
    arm_func_end func_ov002_0214e310

    .global func_ov002_0214e318
    arm_func_start func_ov002_0214e318
func_ov002_0214e318: ; 0x0214e318
    mov r0, #0x0
    bx lr
    arm_func_end func_ov002_0214e318

    .global func_ov002_0214e320
    arm_func_start func_ov002_0214e320
func_ov002_0214e320: ; 0x0214e320
    mov r0, #0x0
    bx lr
    arm_func_end func_ov002_0214e320

    .global func_ov002_0214e328
    arm_func_start func_ov002_0214e328
func_ov002_0214e328: ; 0x0214e328
    ldr r2, [r0, #0x1c]
    cmp r2, r1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov002_0214e328

    .global func_ov002_0214e338
    arm_func_start func_ov002_0214e338
func_ov002_0214e338: ; 0x0214e338
    str r1, [r0, #0x1c]
    bx lr
    arm_func_end func_ov002_0214e338

    .global func_ov002_0214e340
    arm_func_start func_ov002_0214e340
func_ov002_0214e340: ; 0x0214e340
    mov r0, #0x1
    bx lr
    arm_func_end func_ov002_0214e340

    .global func_ov002_0214e348
    arm_func_start func_ov002_0214e348
func_ov002_0214e348: ; 0x0214e348
    ldr r0, .L_0214e350
    bx lr
.L_0214e350: .word data_02093c74
    arm_func_end func_ov002_0214e348

    .global func_ov002_0214e354
    arm_func_start func_ov002_0214e354
func_ov002_0214e354: ; 0x0214e354
    mov r0, #0x0
    bx lr
    arm_func_end func_ov002_0214e354

    .global func_ov002_0214e35c
    arm_func_start func_ov002_0214e35c
func_ov002_0214e35c: ; 0x0214e35c
    ldr ip, .L_0214e368
    add r0, r0, #0x68
    bx ip
.L_0214e368: .word func_ov002_0214da38
    arm_func_end func_ov002_0214e35c

    .global func_ov002_0214e36c
    arm_func_start func_ov002_0214e36c
func_ov002_0214e36c: ; 0x0214e36c
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e36c

    .global func_ov002_0214e380
    arm_func_start func_ov002_0214e380
func_ov002_0214e380: ; 0x0214e380
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214e380

    .global func_ov002_0214e39c
    arm_func_start func_ov002_0214e39c
func_ov002_0214e39c: ; 0x0214e39c
    ldr r1, [r1, #0x0]
    str r1, [r0, #0x0]
    ldr r1, [r2, #0x0]
    str r1, [r0, #0x4]
    ldr r1, [r3, #0x0]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov002_0214e39c

    .global func_ov002_0214e3b8
    arm_func_start func_ov002_0214e3b8
func_ov002_0214e3b8: ; 0x0214e3b8
    bx lr
    arm_func_end func_ov002_0214e3b8

    .global func_ov002_0214e3bc
    arm_func_start func_ov002_0214e3bc
func_ov002_0214e3bc: ; 0x0214e3bc
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    ldr r1, .L_0214eb18
    mov r5, r0
    ldr r2, .L_0214eb1c
    mov r0, #0x90
    mov r3, #0xe0
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x90
    mov r4, r0
    bl func_020517fc
    mov r0, r5
    str r5, [r4, #0x84]
    bl func_ov002_0214d394
    mov r0, #0x0
    bl func_02043264
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x10
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
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x14]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x14
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r2, #0x1
    ldr r1, [r0, #0x4]
    mov r0, #0x2
    strb r2, [r1, #0x956]
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x18]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x18
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x10000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x1c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x1c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
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
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x20]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x20
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x24]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x24
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x28]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x28
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x2c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x2c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r0, [r4, #0x84]
    mov ip, #0x48
    ldrb lr, [r0, #0x53]
    ldr r1, .L_0214eb20
    ldr r2, .L_0214eb24
    strb lr, [r4, #0x8c]
    ldr r3, [r4, #0x84]
    mov r0, #0x78
    ldr r5, [r3, #0x38]
    ldr r3, .L_0214eb28
    add r5, r5, lr, lsl #0x6
    str r5, [r4, #0x88]
    ldrb lr, [r5, #0x2c]
    ldr r5, [r4, #0x84]
    ldr r5, [r5, #0x34]
    mla r5, lr, ip, r5
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214e904
    ldr r1, .L_0214eb2c
    mov r2, #0x1
    bl func_02024064
.L_0214e904:
    bl func_ov002_0214d498
    str r0, [r4, #0x8]
    mov r0, #0x4c000
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x8]
    add r1, sp, #0x4
    bl func_ov002_0214d650
    ldr r1, .L_0214eb20
    ldr r2, .L_0214eb24
    ldr r3, .L_0214eb28
    mov r0, #0x78
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214e948
    ldr r1, .L_0214eb2c
    mov r2, #0x1
    bl func_02024064
.L_0214e948:
    bl func_ov002_0214d498
    str r0, [r4, #0xc]
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0xc]
    bl func_ov002_0214d6b0
    ldrsh r0, [r5, #0x2e]
    add r1, sp, #0x8
    add r2, sp, #0xc
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0xc]
    ldrsh r0, [r5, #0x2c]
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xc]
    bl func_ov002_0214d4c0
    mov r0, r4
    bl func_ov002_0214edd4
    mov r0, r4
    bl func_ov002_0214ef80
    mov r0, r4
    bl func_ov002_0214efe8
    mov r0, r4
    bl func_ov002_0214f264
    mov r0, r4
    bl func_ov002_0214fa1c
    mov r0, r4
    bl func_ov002_0214fd34
    mov r0, r4
    bl func_ov002_0215001c
    ldr r0, [r4, #0x84]
    ldr r1, [r4, #0x10]
    mov r2, #0x1
    bl func_ov002_02155940
    ldr r1, .L_0214eb30
    str r0, [r4, #0x74]
    str r1, [r0, #0x1c]
    str r4, [r0, #0x20]
    ldr r1, [r4, #0x74]
    mov r2, #0x1
    mov r0, r4
    strb r2, [r1, #0x25]
    bl func_ov002_0214f1bc
    ldr r1, [r4, #0x84]
    ldr r0, [r4, #0xc]
    ldrb r1, [r1, #0x51]
    bl func_ov002_021566e0
    str r0, [r4, #0x70]
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, .L_0214eb34
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne .L_0214ea54
    ldr r0, .L_0214eb38
    mov ip, #0x98
    mov r1, #0x0
    mov r2, #0x30
    mov r3, #0xff
    str ip, [sp, #0x0]
    bl func_ov002_0214edbc
    ldr r0, .L_0214eb34
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
.L_0214ea54:
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    mov r0, #0x1
    ldr r3, [r1, #0x4]
    ldr r1, .L_0214eb3c
    strb r0, [r3, #0x901]
    ldrsh r2, [r1, #0x0]
    add r0, r3, #0x800
    strh r2, [r0, #0xe0]
    ldrsh r2, [r1, #0x2]
    strh r2, [r0, #0xe2]
    ldrsh r2, [r1, #0x4]
    strh r2, [r0, #0xe4]
    ldrsh r1, [r1, #0x6]
    strh r1, [r0, #0xe6]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r2, [r0, #0x4]
    mov r0, #0x1f
    strb r1, [r2, #0x901]
    str r0, [r2, #0x8cc]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r2, [r0, #0x4]
    mov r0, #0x1b
    strb r1, [r2, #0x901]
    str r0, [r2, #0x8d4]
    bl func_0203b3f4
    mov r1, #0x1
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov002_0214ecc0
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    mov r0, #0x1
    ldr r1, [r1, #0x4]
    strb r0, [r1, #0x901]
    strb r0, [r1, #0x8fe]
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    mov r0, r4
    ldr r2, [r1, #0x4]
    mov r1, #0x1
    strb r1, [r2, #0x8ff]
    strb r1, [r2, #0x901]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_0214eb18: .word data_ov002_0215c034
.L_0214eb1c: .word data_ov002_0215c01c
.L_0214eb20: .word data_ov002_0215bfa4
.L_0214eb24: .word data_ov002_0215bea0
.L_0214eb28: .word 0x4c3
.L_0214eb2c: .word func_02024a30
.L_0214eb30: .word func_ov002_02150ad4
.L_0214eb34: .word data_ov002_0215cc04
.L_0214eb38: .word data_ov002_0215bec8
.L_0214eb3c: .word data_ov002_0215bec8
    arm_func_end func_ov002_0214e3bc

    .global func_ov002_0214eb40
    arm_func_start func_ov002_0214eb40
func_ov002_0214eb40: ; 0x0214eb40
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x1
    strb r2, [r1, #0x956]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0x956]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0214ecc0
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x0
    bl func_ov002_0214ece8
    ldr r1, .L_0214ecbc
    mov r2, #0x0
    mov r0, #0x30
    str r2, [r1, #0x0]
    blx func_ov012_021b526c
    mov r5, #0x0
.L_0214ebec:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x78]
    cmp r0, #0x0
    beq .L_0214ec00
    bl func_0206ae98
.L_0214ec00:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0214ebec
    ldr r0, [r4, #0x80]
    cmp r0, #0x0
    beq .L_0214ec1c
    bl func_0206b138
.L_0214ec1c:
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    beq .L_0214ec2c
    bl func_ov002_02156ac8
.L_0214ec2c:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0214ec44
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214ec44:
    mov r5, #0x0
.L_0214ec48:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x5c]
    cmp r0, #0x0
    beq .L_0214ec64
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214ec64:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0214ec48
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq .L_0214ec80
    bl func_ov002_02156048
.L_0214ec80:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214ec98
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214ec98:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0214ecb0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214ecb0:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0214ecbc: .word data_ov012_021d5154
    arm_func_end func_ov002_0214eb40

    .global func_ov002_0214ecc0
    arm_func_start func_ov002_0214ecc0
func_ov002_0214ecc0: ; 0x0214ecc0
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
    arm_func_end func_ov002_0214ecc0

    .global func_ov002_0214ece8
    arm_func_start func_ov002_0214ece8
func_ov002_0214ece8: ; 0x0214ece8
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    bne .L_0214ed00
    mov r0, #0x0
    blx func_ov012_021cb434
    ldmia sp!, {r3, pc}
.L_0214ed00:
    ldr r0, [r0, #0x4]
    blx func_ov012_021cb434
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0214ece8

    .global func_ov002_0214ed0c
    arm_func_start func_ov002_0214ed0c
func_ov002_0214ed0c: ; 0x0214ed0c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x154]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0214ed54
    bl func_ov002_0214ed94
.L_0214ed54:
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214ed0c

    .global func_ov002_0214ed94
    arm_func_start func_ov002_0214ed94
func_ov002_0214ed94: ; 0x0214ed94
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214edb4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214edb4:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214ed94

    .global func_ov002_0214edbc
    arm_func_start func_ov002_0214edbc
func_ov002_0214edbc: ; 0x0214edbc
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldr r1, [sp, #0x0]
    strh r3, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov002_0214edbc

    .global func_ov002_0214edd4
    arm_func_start func_ov002_0214edd4
func_ov002_0214edd4: ; 0x0214edd4
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr r1, .L_0214eef8
    mov r5, r0
    ldr r2, .L_0214eefc
    ldr r3, .L_0214ef00
    mov r0, #0x78
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214ee08
    ldr r1, .L_0214ef04
    mov r2, #0x1
    bl func_02024064
.L_0214ee08:
    bl func_ov002_0214d498
    mov r4, r0
    ldr r0, [r5, #0x8]
    mov r1, r4
    bl func_ov002_0214d6b0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0214ef08
    add r0, sp, #0x10
    mov r1, r4
    bl func_ov002_0214ef10
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    mov r0, #0x100000
    str r0, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    bl func_ov002_0214ef60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    bl func_ov002_0214ef60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_0214ef0c
    ldr r3, [sp, #0x14]
    bl func_02023c80
    mov r0, #0x100000
    str r0, [sp, #0x4]
    mov r0, r4
    add r1, sp, #0x4
    bl func_ov002_0214ef60
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, #0x4c000
    str r0, [sp, #0x0]
    mov r0, r4
    add r1, sp, #0x0
    bl func_ov002_0214d650
    str r4, [r5, #0x4]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_0214eef8: .word data_ov002_0215bfa4
.L_0214eefc: .word data_ov002_0215bea0
.L_0214ef00: .word 0x4c3
.L_0214ef04: .word func_02024a30
.L_0214ef08: .word data_ov002_0215c048
.L_0214ef0c: .word 0x494c
    arm_func_end func_ov002_0214edd4

    .global func_ov002_0214ef10
    arm_func_start func_ov002_0214ef10
func_ov002_0214ef10: ; 0x0214ef10
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
    arm_func_end func_ov002_0214ef10

    .global func_ov002_0214ef60
    arm_func_start func_ov002_0214ef60
func_ov002_0214ef60: ; 0x0214ef60
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0214ef7c
    mov r1, #0x1
    str r2, [r0, #0xc]
    bx ip
.L_0214ef7c: .word func_ov002_0214d4e8
    arm_func_end func_ov002_0214ef60

    .global func_ov002_0214ef80
    arm_func_start func_ov002_0214ef80
func_ov002_0214ef80: ; 0x0214ef80
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    mov r5, r0
    ldr r0, [r5, #0x84]
    ldrb r2, [r5, #0x8c]
    ldr r3, [r0, #0x38]
    ldr r1, .L_0214efe0
    add r0, sp, #0x0
    add r4, r3, r2, lsl #0x6
    bl func_02074000
    ldrb r0, [r4, #0x2d]
    bl func_ov002_0214e008
    mov r1, r0
    add r0, sp, #0x0
    bl func_020741bc
    ldr r1, .L_0214efe4
    add r0, sp, #0x0
    bl func_020741bc
    add r0, sp, #0x0
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x0]
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
.L_0214efe0: .word data_ov002_0215c054
.L_0214efe4: .word data_ov002_0215c060
    arm_func_end func_ov002_0214ef80

    .global func_ov002_0214efe8
    arm_func_start func_ov002_0214efe8
func_ov002_0214efe8: ; 0x0214efe8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4c
    mov r9, r0
    ldr r1, [r9, #0x84]
    mov r0, #0x0
    ldrb r4, [r1, #0x51]
    bl func_0203b424
    ldr r1, [r0, #0x88]
    ldr r0, .L_0214f174
    bl func_ov002_02156d08
    str r0, [r9, #0x64]
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    ldr r0, .L_0214f178
    bl func_ov002_02156d08
    str r0, [r9, #0x60]
    mov r0, #0x3
    bl func_0203b424
    ldr r1, [r0, #0x88]
    ldr r0, .L_0214f17c
    ldr r0, [r0, r4, lsl #0x3]
    bl func_ov002_02156d08
    str r0, [r9, #0x5c]
    mov r4, r0
    mov r0, #0x100000
    str r0, [sp, #0x1c]
    sub r0, r0, #0x200000
    str r0, [sp, #0x18]
    mov r0, #0x0
    str r0, [sp, #0x14]
    add r0, sp, #0x34
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    mov r0, #0x0
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    str r0, [sp, #0x20]
    add r0, sp, #0x40
    add r1, sp, #0x28
    add r2, sp, #0x24
    add r3, sp, #0x20
    add r6, sp, #0x34
    bl func_ov002_0214e39c
    ldr r2, .L_0214f180
    add r0, sp, #0x2c
    mov r1, r4
    add r5, sp, #0x40
    bl func_ov002_0214ef10
    ldr r1, .L_0214f184
    ldr r2, .L_0214f188
    ldr r3, .L_0214f18c
    mov r0, #0x4c
    ldr r7, [sp, #0x30]
    ldr r8, [sp, #0x2c]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214f100
    ldr r2, .L_0214f190
    mov r1, #0x400
    stmia sp, {r2, r5, r6}
    str r1, [sp, #0xc]
    mov r5, #0x2
    mov r2, r8
    mov r3, r7
    mov r1, #0x0
    str r5, [sp, #0x10]
    bl func_02013264
.L_0214f100:
    bl func_ov002_0214f194
    mov r1, r0
    mov r0, r4
    bl func_02020f38
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov002_0214d614
    mov r0, #0x20
    mov r1, r0
    bl func_0203687c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r9, #0x68]
    bl func_ov002_0214d6e8
    mov r4, #0x1
.L_0214f150:
    add r0, r9, r4, lsl #0x2
    ldr r0, [r0, #0x5c]
    ldr r1, [r9, #0x4]
    bl func_ov002_0214d678
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_0214f150
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_0214f174: .word data_ov002_0215c06c
.L_0214f178: .word data_ov002_0215c080
.L_0214f17c: .word data_ov002_0215c570
.L_0214f180: .word data_ov002_0215c048
.L_0214f184: .word data_ov002_0215bff4
.L_0214f188: .word data_ov002_0215be90
.L_0214f18c: .word 0x2b9
.L_0214f190: .word 0x494c
    arm_func_end func_ov002_0214efe8

    .global func_ov002_0214f194
    arm_func_start func_ov002_0214f194
func_ov002_0214f194: ; 0x0214f194
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214f1b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214f1b4:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214f194

    .global func_ov002_0214f1bc
    arm_func_start func_ov002_0214f1bc
func_ov002_0214f1bc: ; 0x0214f1bc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r1, [r0, #0x18]
    ldr r4, [r0, #0x60]
    ldr r0, [r1, #0x4]
    mov r5, #0x8
    ldr r0, [r0, #0x15c]
    mov r6, #0x0
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x24]
    add r8, r0, r0, lsl #0x1
    b .L_0214f220
.L_0214f1ec:
    mov r7, r6
.L_0214f1f0:
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r0, [r0, #0x64]
    mov r2, r8
    ldr ip, [r0, #0x0]
    mov r3, r5
    ldr ip, [ip, #0x88]
    blx ip
    add r7, r7, #0x1
    cmp r7, #0x20
    blt .L_0214f1f0
    add r8, r8, #0x1
.L_0214f220:
    cmp r8, #0x20
    blt .L_0214f1ec
    mov r2, #0x30000
    add r1, sp, #0x0
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov002_0214f244
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov002_0214f1bc

    .global func_ov002_0214f244
    arm_func_start func_ov002_0214f244
func_ov002_0214f244: ; 0x0214f244
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0214f260
    mov r1, #0x1
    str r2, [r0, #0x10]
    bx ip
.L_0214f260: .word func_ov002_0214d4e8
    arm_func_end func_ov002_0214f244

    .global func_ov002_0214f264
    arm_func_start func_ov002_0214f264
func_ov002_0214f264: ; 0x0214f264
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x19c
    ldr r5, .L_0214f8e0
    mov r10, r0
    mov r9, #0x0
    mov r8, #0x4d
    mov r7, #0x12000
    add r6, sp, #0x7c
    mov r4, #0xc
.L_0214f288:
    bl func_0203b3f4
    str r8, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r3, [r10, #0x8]
    mov r0, r7
    mov r1, r7
    bl func_ov002_0214d53c
    mla r1, r9, r4, r5
    str r0, [r6, r9, lsl #0x2]
    bl func_ov002_0214f960
    add r9, r9, #0x1
    cmp r9, #0x8
    blt .L_0214f288
    ldr r0, [r10, #0x84]
    ldr r1, [r10, #0x88]
    add r2, sp, #0x15
    add r3, sp, #0x14
    bl func_ov002_0214db0c
    mov r2, #0x4e000
    ldr r0, [sp, #0x7c]
    add r1, sp, #0x54
    str r2, [sp, #0x54]
    bl func_ov002_0214d650
    ldr r4, [sp, #0x98]
    ldr r1, .L_0214f8e4
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, .L_0214f8e8
    ldr r1, [sp, #0x80]
    str r0, [sp, #0x0]
    ldrsb r0, [sp, #0x15]
    ldr r2, [sp, #0x84]
    ldr r3, [sp, #0x88]
    bl func_ov002_0214dcd8
    ldr r0, .L_0214f8e8
    ldr r1, [sp, #0x8c]
    str r0, [sp, #0x0]
    ldrsb r0, [sp, #0x14]
    ldr r2, [sp, #0x90]
    ldr r3, [sp, #0x94]
    bl func_ov002_0214dcd8
    mov r0, #0x9e000
    str r0, [sp, #0x50]
    mov r0, r4
    add r1, sp, #0x50
    bl func_ov002_0214ef60
    ldrsb r1, [sp, #0x14]
    ldrb r0, [sp, #0x15]
    cmp r1, r0
    ldr r0, [r4, #0x4]
    bne .L_0214f380
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0214f390
.L_0214f380:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd8]
    blx r2
.L_0214f390:
    bl func_0203b3f4
    mov r1, #0x4f
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r3, [r10, #0x4]
    ldr r0, .L_0214f8ec
    mov r1, #0x12000
    bl func_ov002_0214d53c
    ldr r1, .L_0214f8f0
    str r0, [sp, #0x7c]
    bl func_ov002_0214f960
    ldr r0, [r10, #0x88]
    bl func_ov002_0214dfa8
    mov r4, r0
    bl func_0203b3e4
    mov r1, #0x21
    str r1, [sp, #0x0]
    mov r2, r0
    ldr r2, [r2, #0x88]
    ldr r1, .L_0214f8f4
    ldr r3, [r10, #0x4]
    mov r0, r4
    bl func_ov002_0214d53c
    ldr r1, .L_0214f8f8
    bl func_ov002_0214f960
    bl func_0203b3e4
    mov r1, #0x60
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0214f8fc
    ldr r3, [r10, #0x4]
    mov r1, #0x10000
    bl func_ov002_0214d53c
    ldr r1, .L_0214f900
    bl func_ov002_0214f960
    ldr r1, [r10, #0x84]
    ldr r0, [r10, #0x88]
    ldr r4, [r1, #0x34]
    ldrb r1, [r0, #0x2c]
    mov r0, #0x48
    smulbb r6, r1, r0
    bl func_0203b3e4
    mov r1, #0x62
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0214f904
    ldr r3, [r10, #0x4]
    mov r1, #0x10000
    bl func_ov002_0214d53c
    ldr r1, .L_0214f908
    mov r5, r0
    bl func_ov002_0214f960
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    add r0, r4, r6
    bl func_02074294
    cmp r0, #0x6
    movlt r4, #0x6
    blt .L_0214f494
    add r0, r4, r6
    bl func_02074294
    mov r4, r0
.L_0214f494:
    add r0, sp, #0x1c
    mov r1, r5
    bl func_ov002_0214f990
    mov r0, #0xc
    mul r0, r4, r0
    ldr r2, [sp, #0x1c]
    add r1, sp, #0x18
    sub r2, r2, r0, lsl #0xc
    mov r0, r5
    str r2, [sp, #0x18]
    bl func_ov002_0214ef60
    add r0, sp, #0x2c
    mov r1, r5
    bl func_ov002_0214f990
    add r1, sp, #0x2c
    ldr r1, [r1, #0x0]
    mov r0, #0x0
    add r1, r1, #0x100000
    str r0, [sp, #0x34]
    str r1, [sp, #0x28]
    add r0, sp, #0x30
    mov r1, r5
    bl func_ov002_0214f9a4
    add r0, sp, #0x58
    add r1, sp, #0x28
    add r2, sp, #0x30
    add r3, sp, #0x34
    bl func_ov002_0214e39c
    ldr r2, .L_0214f90c
    add r0, sp, #0x20
    mov r1, r5
    add r7, sp, #0x58
    bl func_ov002_0214ef10
    ldr r1, .L_0214f910
    ldr r2, .L_0214f914
    ldr r3, .L_0214f918
    mov r0, #0x4c
    ldr r6, [sp, #0x24]
    ldr r4, [sp, #0x20]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214f568
    ldr r2, .L_0214f91c
    mov r1, #0x8
    stmia sp, {r2, r7}
    str r1, [sp, #0x8]
    mov r1, #0x0
    mov r2, r4
    mov r3, r6
    str r1, [sp, #0xc]
    mov r4, #0x1
    str r4, [sp, #0x10]
    bl func_02013b14
.L_0214f568:
    bl func_ov002_0214f194
    ldr r4, [r0, #0x4]
    ldr r1, .L_0214f920
    ldr r2, .L_0214f924
    ldr r3, .L_0214f928
    mov r0, #0x48
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214f5a0
    mov r1, #0x0
    mov r2, r4
    mov r3, #0x78
    str r1, [sp, #0x0]
    bl func_02014150
.L_0214f5a0:
    bl func_ov002_0214f194
    mov r1, r0
    mov r0, r5
    bl func_02020f38
    ldr r1, .L_0214f92c
    ldr r2, .L_0214f930
    ldr r3, .L_0214f934
    mov r0, #0x78
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214f5d8
    ldr r1, .L_0214f938
    mov r2, #0x1
    bl func_02024064
.L_0214f5d8:
    bl func_ov002_0214d498
    mov r8, r0
    ldr r0, [r10, #0x8]
    mov r1, r8
    bl func_ov002_0214d6b0
    ldr r1, [r10, #0x8]
    mov r0, r8
    bl func_ov002_0214d678
    ldrb r1, [r10, #0x8c]
    ldr r0, [r10, #0x84]
    mov r5, #0xa1
    bl func_ov002_0214df2c
    cmp r0, #0x0
    moveq r4, #0x1
    movne r4, #0x0
    bl func_0203b404
    mov r1, #0x6
    mul r9, r4, r1
    mov r2, #0xa1
    str r2, [sp, #0x0]
    ldr r2, [r0, #0x88]
    mov r3, r8
    add r0, r9, #0x20000
    mov r1, #0x20000
    bl func_ov002_0214d53c
    mov r6, r0
    mov r7, #0x1
    mov r11, #0x0
    b .L_0214f6d8
.L_0214f64c:
    sub r5, r5, #0x1
    bl func_0203b404
    str r5, [sp, #0x0]
    ldr r2, [r0, #0x88]
    mov r0, #0x20000
    mov r1, r0
    mov r3, r8
    bl func_ov002_0214d53c
    mov r4, r0
    add r1, r7, #0x20000
    ldr r0, [r4, #0x4]
    add r1, r1, r9
    mov r2, #0x0
    bl func_02023894
    cmp r0, #0x0
    beq .L_0214f6bc
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, r4
    add r1, sp, #0x4c
    add r2, sp, #0x48
    str r11, [sp, #0x48]
    str r11, [sp, #0x4c]
    bl func_ov002_0214d4c0
    b .L_0214f6d4
.L_0214f6bc:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0214f6e0
.L_0214f6d4:
    add r7, r7, #0x1
.L_0214f6d8:
    cmp r7, #0x6
    blt .L_0214f64c
.L_0214f6e0:
    ldr r0, [r10, #0x88]
    mov r2, #0x0
    ldrb r3, [r0, #0x2d]
    ldr r1, .L_0214f93c
    b .L_0214f708
.L_0214f6f4:
    ldr r0, [r1, r2, lsl #0x2]
    cmp r3, r0
    moveq r0, #0x1
    beq .L_0214f714
    add r2, r2, #0x1
.L_0214f708:
    cmp r2, #0x13
    blt .L_0214f6f4
    mov r0, #0x0
.L_0214f714:
    cmp r0, #0x0
    beq .L_0214f764
    ldr r1, .L_0214f940
    add r0, sp, #0x9c
    bl func_02074000
    ldr r0, [r10, #0x88]
    ldrb r0, [r0, #0x2d]
    bl func_ov002_0214e008
    mov r1, r0
    add r0, sp, #0x9c
    bl func_020741bc
    ldr r1, .L_0214f944
    add r0, sp, #0x9c
    bl func_020741bc
    mov r0, r6
    bl func_ov002_0214f9b8
    add r1, sp, #0x9c
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r10, #0x80]
.L_0214f764:
    mov r9, #0x0
    ldr r6, .L_0214f948
    mov r5, #0x63
    mov r11, #0x88
    b .L_0214f7f0
.L_0214f778:
    add r0, r1, r9
    ldr r1, [r10, #0x84]
    ldrb r0, [r0, #0x31]
    ldr r1, [r1, #0x3c]
    mla r7, r0, r11, r1
    ldrb r0, [r7, #0xc]
    tst r0, #0x4
    addne r4, r6, #0x1
    moveq r4, r6
    bl func_0203b3e4
    mov r1, r0
    str r5, [sp, #0x0]
    ldr r2, [r1, #0x88]
    mov r0, r4
    mov r1, #0x10000
    mov r3, r8
    bl func_ov002_0214d53c
    ldrsh r3, [r7, #0x2]
    add r1, sp, #0x44
    add r2, sp, #0x40
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x40]
    ldrsh r3, [r7, #0x0]
    mov r4, r0
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x44]
    bl func_ov002_0214d4c0
    add r0, r10, r9, lsl #0x2
    str r4, [r0, #0x1c]
    add r9, r9, #0x1
.L_0214f7f0:
    ldr r1, [r10, #0x88]
    ldrb r0, [r1, #0x30]
    cmp r9, r0
    blt .L_0214f778
    ldr r0, [r10, #0x1c]
    bl func_ov002_0214f9b8
    mov r4, #0x80
    mov r1, #0x1a
    mov r2, #0x6
    mov r3, #0x3
    str r4, [sp, #0x0]
    bl func_0206ad90
    ldr r2, .L_0214f94c
    mov r1, #0xf
    strh r2, [r0, #0x16]
    strb r1, [r0, #0x18]
    mov r1, #0x1
    strb r1, [r0, #0x19]
    str r0, [r10, #0x7c]
    ldr r1, .L_0214f950
    add r0, sp, #0x70
    bl func_ov002_0214fa00
    add r0, sp, #0x64
    add r1, sp, #0x70
    bl func_ov002_0214fa00
    ldr r1, [sp, #0x68]
    ldr r2, .L_0214f90c
    add r1, r1, #0xa000
    str r1, [sp, #0x68]
    add r0, sp, #0x38
    mov r1, r8
    bl func_ov002_0214ef10
    ldr r1, .L_0214f954
    ldr r2, .L_0214f958
    ldr r3, .L_0214f95c
    mov r0, #0x4c
    ldr r4, [sp, #0x3c]
    ldr r5, [sp, #0x38]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214f8c8
    ldr r1, .L_0214f91c
    add r2, sp, #0x70
    str r1, [sp, #0x0]
    str r2, [sp, #0x4]
    add r1, sp, #0x64
    str r1, [sp, #0x8]
    mov r1, #0xb4
    str r1, [sp, #0xc]
    mov r1, #0x0
    mov r2, r5
    mov r3, r4
    str r1, [sp, #0x10]
    bl func_02013264
.L_0214f8c8:
    bl func_ov002_0214f194
    mov r1, r0
    mov r0, r8
    bl func_02020f38
    add sp, sp, #0x19c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0214f8e0: .word data_ov002_0215cba4
.L_0214f8e4: .word 0x12014
.L_0214f8e8: .word 0x12001
.L_0214f8ec: .word 0x1200b
.L_0214f8f0: .word data_ov002_0215bf24
.L_0214f8f4: .word 0xa01000
.L_0214f8f8: .word data_ov002_0215bedc
.L_0214f8fc: .word 0x10003
.L_0214f900: .word data_ov002_0215bed0
.L_0214f904: .word 0x10002
.L_0214f908: .word data_ov002_0215bef4
.L_0214f90c: .word data_ov002_0215c048
.L_0214f910: .word data_ov002_0215c008
.L_0214f914: .word data_ov002_0215bec0
.L_0214f918: .word 0x2ef
.L_0214f91c: .word 0x494c
.L_0214f920: .word data_ov002_0215bfe0
.L_0214f924: .word data_ov002_0215beb0
.L_0214f928: .word 0x3e3
.L_0214f92c: .word data_ov002_0215bfa4
.L_0214f930: .word data_ov002_0215bea0
.L_0214f934: .word 0x4c3
.L_0214f938: .word func_02024a30
.L_0214f93c: .word data_ov002_0215afe8
.L_0214f940: .word data_ov002_0215c054
.L_0214f944: .word data_ov002_0215c094
.L_0214f948: .word 0x10005
.L_0214f94c: .word 0x7fff
.L_0214f950: .word data_ov002_0215bf00
.L_0214f954: .word data_ov002_0215bff4
.L_0214f958: .word data_ov002_0215be90
.L_0214f95c: .word 0x2b9
    arm_func_end func_ov002_0214f264

    .global func_ov002_0214f960
    arm_func_start func_ov002_0214f960
func_ov002_0214f960: ; 0x0214f960
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0214f98c
    str r2, [r0, #0xc]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x10]
    ldr r2, [r1, #0x8]
    mov r1, #0x1
    str r2, [r0, #0x14]
    bx ip
.L_0214f98c: .word func_ov002_0214d4e8
    arm_func_end func_ov002_0214f960

    .global func_ov002_0214f990
    arm_func_start func_ov002_0214f990
func_ov002_0214f990: ; 0x0214f990
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x50]
    ldr r1, [r1, #0xc]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov002_0214f990

    .global func_ov002_0214f9a4
    arm_func_start func_ov002_0214f9a4
func_ov002_0214f9a4: ; 0x0214f9a4
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x50]
    ldr r1, [r1, #0x10]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov002_0214f9a4

    .global func_ov002_0214f9b8
    arm_func_start func_ov002_0214f9b8
func_ov002_0214f9b8: ; 0x0214f9b8
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r4, [r0, #0x2c]
    cmp r4, #0x0
    bne .L_0214f9dc
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r4, r0
.L_0214f9dc:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214f9f8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214f9f8:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0214f9b8

    .global func_ov002_0214fa00
    arm_func_start func_ov002_0214fa00
func_ov002_0214fa00: ; 0x0214fa00
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov002_0214fa00

    .global func_ov002_0214fa1c
    arm_func_start func_ov002_0214fa1c
func_ov002_0214fa1c: ; 0x0214fa1c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x44
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    bl func_ov002_0214d614
    mov r1, #0x0
    ldr r0, .L_0214fd20
    mov r2, r1
    blx func_ov012_021caa0c
    mov r4, r0
    mov r5, #0x0
    mvn r8, #0xb
    mov r10, #0x50000
    mov r9, #0x50
    mov r11, #0xce000
.L_0214fa58:
    bl func_020152d4
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r10, [sp, #0x40]
    mov r0, r7
    add r1, sp, #0x40
    bl func_ov002_0214d650
    bl func_0203b3f4
    str r9, [sp, #0x0]
    ldr r2, [r0, #0x88]
    add r6, r5, #0x1
    add r0, r6, #0x12000
    mov r1, #0x12000
    mov r3, r7
    bl func_ov002_0214d53c
    add r1, sp, #0x3c
    str r11, [sp, #0x3c]
    bl func_ov002_0214ef60
    mov r0, #0x8
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, sp, #0x34
    mov r2, r8
    mov r3, r1
    bl func_ov002_0214edbc
    add r2, r5, #0x3080
    ldr r0, [r4, #0x4]
    ldr r1, [r7, #0x4]
    add r2, r2, #0xc000
    add r3, sp, #0x34
    blx func_ov012_021cb4d4
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_020152d4
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x50000
    str r0, [sp, #0x30]
    mov r0, r7
    add r1, sp, #0x30
    bl func_ov002_0214d650
    bl func_0203b3f4
    mov r1, #0x50
    str r1, [sp, #0x0]
    mov r1, r0
    ldr r2, [r1, #0x88]
    add r0, r6, #0x12000
    mov r1, #0x12000
    mov r3, r7
    bl func_ov002_0214d53c
    mov r1, #0xdc000
    str r1, [sp, #0x2c]
    add r1, sp, #0x2c
    bl func_ov002_0214ef60
    mov r0, #0x8
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, sp, #0x24
    mov r2, r8
    mov r3, r1
    bl func_ov002_0214edbc
    add r2, r5, #0x90
    ldr r0, [r4, #0x4]
    ldr r1, [r7, #0x4]
    add r2, r2, #0xf000
    add r3, sp, #0x24
    blx func_ov012_021cb4d4
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0xa
    blt .L_0214fa58
    bl func_020152d4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r2, #0x50000
    add r1, sp, #0x20
    mov r0, r5
    str r2, [sp, #0x20]
    bl func_ov002_0214d650
    bl func_0203b3f4
    mov r1, #0x50
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0214fd24
    mov r1, #0x12000
    mov r3, r5
    bl func_ov002_0214d53c
    mov r1, #0xd5000
    str r1, [sp, #0x1c]
    add r1, sp, #0x1c
    bl func_ov002_0214ef60
    mov r1, #0x0
    mov r0, #0x8
    str r0, [sp, #0x0]
    add r0, sp, #0x14
    sub r2, r1, #0xc
    mov r3, r1
    bl func_ov002_0214edbc
    ldr r0, [r4, #0x4]
    ldr r1, [r5, #0x4]
    ldr r2, .L_0214fd28
    add r3, sp, #0x14
    blx func_ov012_021cb4d4
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_020152d4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x50000
    str r0, [sp, #0x10]
    mov r0, r5
    add r1, sp, #0x10
    bl func_ov002_0214d650
    bl func_0203b3f4
    mov r1, #0x50
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0214fd2c
    mov r1, #0x12000
    mov r3, r5
    bl func_ov002_0214d53c
    mov r2, #0x8000
    rsb r2, r2, #0x0
    add r1, sp, #0xc
    str r2, [sp, #0xc]
    bl func_ov002_0214ef60
    mov r1, #0x0
    mov r2, #0x8
    str r2, [sp, #0x0]
    add r0, sp, #0x4
    mov r3, r1
    sub r2, r1, #0x8
    bl func_ov002_0214edbc
    ldr r0, [r4, #0x4]
    ldr r1, [r5, #0x4]
    ldr r2, .L_0214fd30
    add r3, sp, #0x4
    blx func_ov012_021cb4d4
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_ov002_0214ece8
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    bl func_ov002_0214d6e8
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0214fd20: .word data_ov002_0215c0a0
.L_0214fd24: .word 0x1200c
.L_0214fd28: .word 0xf190
.L_0214fd2c: .word 0x12014
.L_0214fd30: .word 0xf180
    arm_func_end func_ov002_0214fa1c

    .global func_ov002_0214fd34
    arm_func_start func_ov002_0214fd34
func_ov002_0214fd34: ; 0x0214fd34
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x50
    mov r8, r0
    ldr r0, [r8, #0x88]
    ldr r2, [r8, #0x84]
    ldrb r1, [r0, #0x2c]
    mov r0, #0x48
    ldr r6, [r2, #0x34]
    smulbb r5, r1, r0
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    bl func_ov002_0214d614
    mov r0, #0x0
    blx func_ov012_021c5fb4
    bl func_ov002_0214d498
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x20000
    str r0, [sp, #0x34]
    mov r0, r4
    add r1, sp, #0x34
    bl func_ov002_0214d650
    ldr r1, .L_0214fff4
    mov r0, r4
    bl func_ov002_0214f960
    ldr r0, [r4, #0x4]
    ldr r1, [r8, #0x88]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r1, [r8, #0x68]
    mov r0, r4
    bl func_ov002_0214d678
    ldr r0, [r8, #0x8]
    mov r1, r4
    bl func_ov002_0214d6b0
    mov r0, #0x0
    blx func_ov012_021c5fb4
    bl func_ov002_0214d498
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    mov r2, #0x61000
    add r1, sp, #0x30
    mov r0, r7
    str r2, [sp, #0x30]
    bl func_ov002_0214d650
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_0214fff8
    add r0, sp, #0x44
    bl func_ov002_0214fa00
    add r0, r6, r5
    ldr r4, [sp, #0x44]
    bl func_02074294
    cmp r0, #0x6
    movhi r1, #0xc
    mulhi r2, r0, r1
    rsbls r1, r0, #0x6
    movls r0, #0x6
    mulls r0, r1, r0
    rsbls r2, r0, #0x48
    add r1, sp, #0x44
    mov r0, r7
    rsb r4, r2, r4, lsr #0xc
    bl func_ov002_0214f960
    mov r2, r4, lsl #0xc
    add r1, sp, #0x2c
    mov r0, r7
    str r2, [sp, #0x2c]
    bl func_ov002_0214ef60
    ldr r0, [r7, #0x4]
    add r1, r6, r5
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r1, [r8, #0x68]
    mov r0, r7
    bl func_ov002_0214d678
    ldr r0, [r8, #0x8]
    mov r1, r7
    bl func_ov002_0214d6b0
    add r0, sp, #0x1c
    mov r1, r7
    bl func_ov002_0214f990
    add r1, sp, #0x1c
    ldr r1, [r1, #0x0]
    mov r0, #0x0
    add r1, r1, #0x100000
    str r0, [sp, #0x14]
    str r1, [sp, #0x20]
    add r0, sp, #0x18
    mov r1, r7
    bl func_ov002_0214f9a4
    add r0, sp, #0x38
    add r1, sp, #0x20
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    ldr r2, .L_0214fffc
    add r0, sp, #0x24
    mov r1, r7
    add r4, sp, #0x38
    bl func_ov002_0214ef10
    ldr r1, .L_02150000
    ldr r2, .L_02150004
    ldr r3, .L_02150008
    mov r0, #0x4c
    ldr r5, [sp, #0x28]
    ldr r6, [sp, #0x24]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214ffa0
    ldr r2, .L_0215000c
    mov r1, #0x8
    stmia sp, {r2, r4}
    str r1, [sp, #0x8]
    mov r1, #0x0
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0xc]
    mov r4, #0x1
    str r4, [sp, #0x10]
    bl func_02013b14
.L_0214ffa0:
    bl func_ov002_0214f194
    ldr r4, [r0, #0x4]
    ldr r1, .L_02150010
    ldr r2, .L_02150014
    ldr r3, .L_02150018
    mov r0, #0x48
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214ffd8
    mov r1, #0x0
    mov r2, r4
    mov r3, #0x78
    str r1, [sp, #0x0]
    bl func_02014150
.L_0214ffd8:
    bl func_ov002_0214f194
    mov r1, r0
    mov r0, r7
    bl func_02020f38
    bl func_ov002_0214d6e8
    add sp, sp, #0x50
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0214fff4: .word data_ov002_0215bf0c
.L_0214fff8: .word data_ov002_0215bf18
.L_0214fffc: .word data_ov002_0215c048
.L_02150000: .word data_ov002_0215c008
.L_02150004: .word data_ov002_0215bec0
.L_02150008: .word 0x2ef
.L_0215000c: .word 0x494c
.L_02150010: .word data_ov002_0215bfe0
.L_02150014: .word data_ov002_0215beb0
.L_02150018: .word 0x3e3
    arm_func_end func_ov002_0214fd34

    .global func_ov002_0215001c
    arm_func_start func_ov002_0215001c
func_ov002_0215001c: ; 0x0215001c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x60
    ldr r1, .L_02150664
    mov r7, r0
    ldr r2, .L_02150668
    ldr r3, .L_0215066c
    mov r0, #0xcc
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02150054
    ldr r1, .L_02150670
    ldr r2, .L_02150674
    mov r3, #0x0
    blx func_ov012_021af26c
.L_02150054:
    bl func_ov002_0214ed94
    mov r4, r0
    ldr r1, .L_02150678
    ldr r2, .L_0215067c
    ldr r3, .L_02150680
    mov r0, #0xbc
    bl func_0201a21c
    movs r5, r0
    beq .L_02150088
    ldr r1, .L_02150684
    mov r2, #0x0
    blx func_ov012_021af358
    mov r5, r0
.L_02150088:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_021500a4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021500a4:
    ldr r5, [r5, #0x18]
    mov r0, #0x14
    ldr r2, [r5, #0x4]
    mov r1, #0x10
    str r0, [r2, #0x94]
    str r0, [r2, #0x98]
    ldr r0, [r5, #0x4]
    mov r2, r4
    str r1, [r0, #0x9c]
    mov r3, r5
    mov r0, #0x30
    mov r1, #0x0
    blx func_ov012_021b3b7c
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150688
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_021500fc
    bl func_ov002_0214d498
.L_021500fc:
    bl func_ov002_0214f9b8
    mov r6, #0x80
    mov r1, #0x31
    mov r2, #0x6
    mov r3, #0x5
    str r6, [sp, #0x0]
    bl func_0206ad90
    mov r2, #0x0
    ldr r1, .L_0215068c
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    str r0, [r7, #0x78]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, .L_02150690
    mvn r1, #0x0
    str r1, [r0, #0x0]
    mov r0, r7
    mov r1, #0x0
    bl func_ov002_0214d808
    str r0, [r7, #0x10]
    mov r1, #0x0
    bl func_ov002_021506bc
    ldr r0, [r7, #0x10]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b7744
    mov r0, #0x62000
    str r0, [sp, #0x18]
    ldr r0, [r7, #0x10]
    add r1, sp, #0x18
    bl func_ov002_0214d650
    ldr r1, [r7, #0x10]
    mov r0, r7
    bl func_ov002_0214d808
    mov r1, #0x0
    str r0, [r7, #0x14]
    bl func_ov002_021506bc
    mov r0, #0x4c000
    str r0, [sp, #0x14]
    ldr r0, [r7, #0x14]
    add r1, sp, #0x14
    bl func_ov002_0214d650
    ldr r8, .L_02150694
    mov r9, #0x0
    mov r6, #0x4c
    add r5, sp, #0x1c
    mov r4, #0x1
    mov r10, #0x28
.L_021501ec:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mla r1, r9, r10, r8
    str r0, [sp, #0x0]
    ldr r2, [r7, #0x14]
    mov r0, r7
    mov r3, r6
    bl func_ov002_0214da4c
    str r0, [r5, r9, lsl #0x2]
    ldr r1, [r0, #0x4]
    add r9, r9, #0x1
    strb r4, [r1, #0xaa]
    ldr r0, [r0, #0x4]
    cmp r9, #0x1
    strb r4, [r0, #0xb1]
    ble .L_021501ec
    ldr r0, [sp, #0x1c]
    ldr r2, .L_02150698
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r4, [sp, #0x20]
    ldr r2, .L_0215069c
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [sp, #0x1c]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r1, #0x80
    blx func_ov012_021b77a8
    ldr r0, .L_021506a0
    ldr r0, [r0, #0x8d8]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_021502ac
    ldr r0, [r4, #0x4]
    ldr r1, .L_021506a4
    blx func_ov012_021b400c
    ldr r0, [r4, #0x4]
    mov r1, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_021502ac:
    ldr r0, .L_02150690
    mov r1, #0x30
    str r1, [r0, #0x0]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    bl func_ov002_0214d614
    ldr r4, [r7, #0x10]
    ldr r3, .L_02150690
    ldr r1, .L_021506a8
    ldr r2, .L_021506ac
    mov r0, #0x17c
    ldr r5, [r3, #0x0]
    ldr r4, [r4, #0x4]
    mov r3, #0xb5
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02150300
    ldr r3, .L_021506b0
    mov r1, r4
    mov r2, r5
    blx func_ov012_021acb3c
.L_02150300:
    bl func_ov002_0214d498
    mov r4, r0
    mov r1, #0x0
    bl func_ov002_021506bc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0x164]
    mov r5, #0x34000
    mov r3, #0x18000
    add r1, sp, #0x4
    add r2, sp, #0x8
    mov r0, r4
    str r5, [sp, #0x8]
    str r3, [sp, #0x4]
    bl func_ov002_0214d4c0
    ldr r0, [r4, #0x4]
    mov r1, #0xe2
    mov r2, #0x60
    blx func_ov012_021b5900
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r1, [r0, #0x13c]
    ldr r0, [r4, #0x4]
    mov r1, #0x18
    blx func_ov012_021ad6cc
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_021506b4
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0x140]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r2, [r0, #0x141]
    ldr r0, [r4, #0x4]
    str r1, [r0, #0x144]
    ldr r0, [r4, #0x4]
    blx func_ov012_021ac948
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1a8]
    blx r2
    ldr r1, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r1, #0x114]
    ldr r1, [r7, #0x4]
    mov r0, r4
    bl func_ov002_0214d678
    mov r0, #0x62000
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x160]
    bl func_ov002_0214d498
    add r1, sp, #0xc
    bl func_ov002_0214d650
    mov r0, #0x62000
    str r0, [sp, #0x10]
    mov r0, r4
    add r1, sp, #0x10
    bl func_ov002_0214d650
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x160]
    bl func_ov002_0214d498
    ldr r0, [r0, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r5, #0x0
    mov r6, r5
    b .L_02150600
.L_02150450:
    add r1, r0, r6
    ldr r3, [r7, #0x84]
    ldrb r2, [r1, #0x31]
    mov r1, #0x88
    ldr r8, [r3, #0x3c]
    sub r3, r1, #0x89
    mla r8, r2, r1, r8
    ldrsb r1, [r8, #0x4]
    cmp r1, r3
    beq .L_021504c4
    add r0, r0, r1
    ldrb r1, [r0, #0x31]
    ldr r0, .L_021506a0
    add r0, r0, r1
    add r0, r0, #0x3000
    ldrb r0, [r0, #0xdcc]
    tst r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_021504c4
    add r0, r7, r6, lsl #0x2
    ldr r0, [r0, #0x1c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_021505fc
.L_021504c4:
    ldr r0, .L_021506a0
    ldrb r9, [r8, #0xb]
    add r0, r0, r2
    mov r1, #0x0
    add r0, r0, #0x3000
    cmp r9, #0x5
    movhs r9, #0x5
    mov r3, r1
    ldrb r0, [r0, #0xdcc]
    mov r2, #0x1
    b .L_021504fc
.L_021504f0:
    tst r0, r2, lsl r3
    addne r1, r1, #0x1
    add r3, r3, #0x1
.L_021504fc:
    cmp r3, r9
    blo .L_021504f0
    mov r10, #0x0
    mov r3, r10
    cmp r9, r1
    bne .L_02150530
    sub r3, r10, #0xf
    sub r2, r10, #0x80
    strb r3, [sp, #0x20]
    add r0, sp, #0x20
    strb r2, [sp, #0x21]
    add r3, r10, #0x2
    strb r10, [r0, r3]
.L_02150530:
    mvn r2, #0xe
    add r0, sp, #0x20
    add r1, r1, #0x3080
    add r9, r9, #0x90
    add r1, r1, #0xc000
    strb r2, [r0, r3]
    sub r10, r2, #0x61
    add r2, r3, #0x1
    strb r10, [r0, r2]
    mov r10, r1, lsr #0x8
    add r2, r3, #0x2
    strb r10, [r0, r2]
    add r2, r3, #0x3
    strb r1, [r0, r2]
    add r9, r9, #0xf000
    mov r2, r9, lsr #0x8
    add r1, r3, #0x4
    strb r2, [r0, r1]
    add r1, r3, #0x5
    strb r9, [r0, r1]
    add r2, r0, r3
    mov r1, #0x0
    strb r1, [r2, #0x6]
    ldrb r1, [r8, #0xc]
    ldrb r2, [r8, #0x8]
    tst r1, #0x4
    ldr r1, [r7, #0x84]
    beq .L_021505b8
    ldr r3, [r1, #0x40]
    mov r1, #0xa4
    ldr r3, [r3, #0x4]
    mla r1, r2, r1, r3
    bl func_020741bc
    b .L_021505cc
.L_021505b8:
    ldr r3, [r1, #0x44]
    mov r1, #0xa4
    ldr r3, [r3, #0x4]
    mla r1, r2, r1, r3
    bl func_020741bc
.L_021505cc:
    add r1, r7, r6, lsl #0x2
    ldr r2, [r1, #0x1c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x20
    blx func_ov012_021ace90
    ldr r2, [r7, #0x88]
    ldr r1, [r7, #0x84]
    add r2, r2, r6
    ldrb r2, [r2, #0x31]
    ldr r1, [r1, #0x4c]
    cmp r2, r1
    moveq r5, r0
.L_021505fc:
    add r6, r6, #0x1
.L_02150600:
    ldr r0, [r7, #0x88]
    ldrb r1, [r0, #0x30]
    cmp r6, r1
    blt .L_02150450
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x1a0]
    blx r3
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x198]
    blx r2
    ldr r1, [r4, #0x4]
    ldr r2, .L_021506b8
    mov r0, r4
    str r2, [r1, #0x14c]
    mov r1, #0x0
    bl func_ov002_02150970
    str r4, [r7, #0x18]
    bl func_ov002_0214d6e8
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02150664: .word data_ov002_0215bfc0
.L_02150668: .word data_ov002_0215be88
.L_0215066c: .word 0x1de
.L_02150670: .word func_ov002_021506e4
.L_02150674: .word func_ov002_0215074c
.L_02150678: .word data_ov002_0215bfb0
.L_0215067c: .word data_ov002_0215bea8
.L_02150680: .word 0x212
.L_02150684: .word func_ov002_021507b0
.L_02150688: .word 0x31305053
.L_0215068c: .word 0x8df
.L_02150690: .word data_ov012_021d5154
.L_02150694: .word data_ov002_0215c1d8
.L_02150698: .word func_ov002_02150910
.L_0215069c: .word func_ov002_0215093c
.L_021506a0: .word data_020b02b8
.L_021506a4: .word 0x510013
.L_021506a8: .word data_ov002_0215bfd0
.L_021506ac: .word data_ov002_0215be98
.L_021506b0: .word func_ov002_0214d8a8
.L_021506b4: .word func_ov002_02150a3c
.L_021506b8: .word func_ov002_02150970
    arm_func_end func_ov002_0215001c

    .global func_ov002_021506bc
    arm_func_start func_ov002_021506bc
func_ov002_021506bc: ; 0x021506bc
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_021506d8
    mov r1, #0x0
    blx func_ov012_021b5898
    ldmia sp!, {r3, pc}
.L_021506d8:
    ldr r1, [r1, #0x4]
    blx func_ov012_021b5898
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_021506bc

    .global func_ov002_021506e4
    arm_func_start func_ov002_021506e4
func_ov002_021506e4: ; 0x021506e4
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_0203b3f4
    mov r1, #0x60
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150748
    mov r3, r4
    mov r1, #0x12000
    bl func_ov002_0214d53c
    mov ip, #0x8000
    mov r3, #0x70000
    add r1, sp, #0xc
    add r2, sp, #0x8
    str ip, [sp, #0x8]
    str r3, [sp, #0xc]
    bl func_ov002_0214d4c0
    mov r2, #0x60000
    add r1, sp, #0x4
    mov r0, r4
    str r2, [sp, #0x4]
    bl func_ov002_0214d650
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_02150748: .word 0x12013
    arm_func_end func_ov002_021506e4

    .global func_ov002_0215074c
    arm_func_start func_ov002_0215074c
func_ov002_0215074c: ; 0x0215074c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0x4]
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    beq .L_0215076c
    bl func_ov002_0214d498
.L_0215076c:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_02150780
    bl func_ov002_0214d498
.L_02150780:
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r0, r5
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov002_0214d4c0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_0215074c

    .global func_ov002_021507b0
    arm_func_start func_ov002_021507b0
func_ov002_021507b0: ; 0x021507b0
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov ip, #0x14000
    rsb ip, ip, #0x0
    mov r3, #0x74000
    add r1, sp, #0x1c
    add r2, sp, #0x18
    mov r4, r0
    str ip, [sp, #0x18]
    str r3, [sp, #0x1c]
    bl func_ov002_0214d4c0
    ldr r0, [r4, #0x4]
    mov r1, #0x7f
    str r1, [r0, #0x98]
    bl func_0203b3f4
    mov r1, #0x61
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_021508f0
    mov r3, r4
    mov r1, #0x12000
    bl func_ov002_0214d53c
    mov r1, #0x8000
    str r1, [sp, #0x14]
    add r1, sp, #0x14
    bl func_ov002_0214f244
    bl func_0203b3f4
    mov r1, #0x61
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_021508f4
    mov r1, #0x12000
    mov r3, r4
    bl func_ov002_0214d53c
    mov r1, #0x77000
    str r1, [sp, #0x10]
    add r1, sp, #0x10
    bl func_ov002_0214f244
    mov r0, #0xc8000
    str r0, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    bl func_ov002_0214d650
    mov r0, #0x7f
    str r0, [sp, #0x0]
    sub r1, r0, #0x93
    add r0, sp, #0x4
    mov r2, #0x0
    mov r3, #0x14
    bl func_ov002_0214edbc
    ldr r1, .L_021508f8
    ldr r2, .L_021508fc
    ldr r3, .L_02150900
    mov r0, #0x70
    add r6, sp, #0x4
    bl func_0201a21c
    movs r5, r0
    beq .L_021508c0
    ldr r2, .L_02150904
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_02150908
    mov r1, r6
    add r0, r5, #0x68
    str r2, [r5, #0x0]
    bl func_ov002_0214da38
    ldr r0, .L_0215090c
    str r0, [r5, #0x0]
.L_021508c0:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_021508dc
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021508dc:
    ldr r1, [r5, #0x18]
    mov r0, r4
    bl func_02020e98
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_021508f0: .word 0x1200e
.L_021508f4: .word 0x12010
.L_021508f8: .word data_ov002_0215bc1c
.L_021508fc: .word data_ov002_0215beb8
.L_02150900: .word 0x1b2
.L_02150904: .word data_02093c8c
.L_02150908: .word data_ov002_0215bde0
.L_0215090c: .word data_ov012_021d1c58
    arm_func_end func_ov002_021507b0

    .global func_ov002_02150910
    arm_func_start func_ov002_02150910
func_ov002_02150910: ; 0x02150910
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65cc
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    ldr r0, [r4, #0x84]
    mov r1, #0x1
    bl func_ov002_0214d348
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02150910

    .global func_ov002_0215093c
    arm_func_start func_ov002_0215093c
func_ov002_0215093c: ; 0x0215093c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x74]
    bl func_ov002_02156280
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0215093c

    .global func_ov002_02150970
    arm_func_start func_ov002_02150970
func_ov002_02150970: ; 0x02150970
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r7, [r0, #0x10]
    ldr r1, [r1, #0x194]
    blx r1
    ldr r2, [r4, #0x4]
    mov r8, #0x0
    ldr r2, [r2, #0x15c]
    mov r1, #0x24
    ldr r2, [r2, #0x8]
    ldr r5, .L_02150a38
    ldr r2, [r2, #0x20]
    mov r4, r8
    mla r1, r0, r1, r2
    ldr r6, [r1, #0x18]
    mov r9, #0x88
    b .L_02150a1c
.L_021509bc:
    add r0, r1, r8
    ldr r2, [r7, #0x84]
    ldrb r1, [r0, #0x31]
    ldr r0, [r2, #0x3c]
    mov r2, r4
    mla r0, r1, r9, r0
    ldrb r0, [r0, #0xc]
    tst r0, #0x4
    add r0, r7, r8, lsl #0x2
    addne r1, r5, #0x1
    ldr r0, [r0, #0x1c]
    moveq r1, r5
    cmp r6, r0
    ldr r0, [r0, #0x4]
    addeq r1, r1, #0x2
    bl func_02023894
    add r0, r7, r8, lsl #0x2
    ldr r0, [r0, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r8, r8, #0x1
.L_02150a1c:
    ldr r1, [r7, #0x88]
    ldrb r0, [r1, #0x30]
    cmp r8, r0
    blt .L_021509bc
    ldr r0, [r7, #0x7c]
    bl func_0206af1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02150a38: .word 0x10005
    arm_func_end func_ov002_02150970

    .global func_ov002_02150a3c
    arm_func_start func_ov002_02150a3c
func_ov002_02150a3c: ; 0x02150a3c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    ldr r4, [r0, #0x10]
    ldr r1, [r1, #0x194]
    blx r1
    ldr r2, [r5, #0x4]
    mov r5, r0
    ldr r0, [r2, #0x90]
    mov r3, #0x0
    and r0, r0, #0x4
    cmp r0, #0x4
    ldreq r1, [r2, #0x16c]
    ldreq r0, [r2, #0xbc]
    andeq r0, r1, r0
    cmpeq r1, r0
    moveq r3, #0x1
    cmp r3, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    ldr r1, [r4, #0x88]
    ldr r0, [r4, #0x84]
    add r1, r1, r5
    ldrb r3, [r1, #0x31]
    mov r2, #0x3
    mov r1, #0x6
    str r3, [r0, #0x4c]
    ldr r0, [r4, #0x84]
    strb r2, [r0, #0x58]
    ldr r0, [r4, #0x84]
    bl func_ov002_0214d348
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_02150a3c

    .global func_ov002_02150ad4
    arm_func_start func_ov002_02150ad4
func_ov002_02150ad4: ; 0x02150ad4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x3f
    ldr r2, [r0, #0x4]
    mov r0, #0x0
    str r1, [r2, #0x8e8]
    str r0, [r2, #0x8ec]
    str r0, [r2, #0x8f4]
    str r0, [r2, #0x8f0]
    mov r0, #0x1
    strb r0, [r2, #0x902]
    ldr r0, [r4, #0x84]
    bl func_ov002_0214e270
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02150ad4

    .global func_ov002_02150b4c
    arm_func_start func_ov002_02150b4c
func_ov002_02150b4c: ; 0x02150b4c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x3c
    ldr r1, .L_021511e0
    mov r4, r0
    ldr r2, .L_021511e4
    mov r0, #0x28
    mov r3, #0x65
    bl func_0201a21c
    mov r8, r0
    mov r1, #0x0
    mov r2, #0x28
    bl func_020517fc
    str r4, [r8, #0x0]
    mov r0, #0x1
    strb r0, [r8, #0x20]
    mov r0, #0x0
    strb r0, [r8, #0x21]
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
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x20]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x20
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x24]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x24
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x28]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x28
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x10000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x2c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x2c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r7, #0x0
    mov r4, r7
    b .L_02150ec4
.L_02150e08:
    ldr r1, [r1, #0x30]
    mov r0, #0x3c
    mla r9, r4, r0, r1
    mov r5, #0x0
    mov r6, r5
    mvn r11, #0x0
    b .L_02150ea4
.L_02150e24:
    add r1, r9, r6
    ldr r0, [r8, #0x0]
    ldrb r1, [r1, #0x2d]
    ldr r3, [r0, #0x34]
    mov r2, #0x48
    mla r10, r1, r2, r3
    bl func_ov002_0214de0c
    cmp r0, #0x0
    beq .L_02150ea0
    mov ip, #0x0
    ldrb lr, [r10, #0x44]
    b .L_02150e98
.L_02150e54:
    ldr r0, [r8, #0x0]
    add r1, r10, ip
    ldrb r1, [r1, #0x38]
    ldr r2, [r0, #0x38]
    add r1, r2, r1, lsl #0x6
    ldrsb r3, [r1, #0x2f]
    cmp r3, r11
    beq .L_02150e94
    ldr r1, [r0, #0x34]
    mov r0, #0x48
    mla r0, r3, r0, r1
    ldrb r2, [r10, #0x42]
    ldrb r0, [r0, #0x42]
    cmp r2, r0
    movlo r5, #0x1
    blo .L_02150ea0
.L_02150e94:
    add ip, ip, #0x1
.L_02150e98:
    cmp ip, lr
    blt .L_02150e54
.L_02150ea0:
    add r6, r6, #0x1
.L_02150ea4:
    ldrb r0, [r9, #0x2c]
    cmp r6, r0
    blt .L_02150e24
    cmp r5, #0x0
    addne r0, r7, #0x1
    andne r7, r0, #0xff
    beq .L_02150edc
    add r4, r4, #0x1
.L_02150ec4:
    ldr r1, [r8, #0x0]
    ldr r0, [r1, #0x2c]
    ldrh r0, [r0, #0x0]
    sub r0, r0, #0x1
    cmp r4, r0
    blt .L_02150e08
.L_02150edc:
    strb r7, [r8, #0x22]
    mov r0, #0x3
    bl func_0203b424
    ldrb r3, [r8, #0x22]
    ldr r2, .L_021511e8
    ldr r1, [r0, #0x88]
    ldr r0, [r2, r3, lsl #0x2]
    bl func_ov002_02156d08
    str r0, [r8, #0x4]
    ldr r1, .L_021511ec
    ldr r2, .L_021511f0
    ldr r3, .L_021511f4
    mov r0, #0x78
    bl func_0201a21c
    movs r4, r0
    beq .L_02150f2c
    ldr r1, .L_021511f8
    mov r2, #0x1
    bl func_02024064
    mov r4, r0
.L_02150f2c:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02150f48
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02150f48:
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    str r0, [r8, #0x8]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_0203b3f4
    mov r1, #0xe1
    str r1, [sp, #0x0]
    ldr r1, [r8, #0x0]
    ldr r2, [r0, #0x88]
    ldrb r1, [r1, #0x51]
    ldr r3, [r8, #0x8]
    add r0, r1, #0x50000
    mov r1, #0x50000
    bl func_ov002_0214d53c
    ldr r1, .L_021511fc
    str r0, [r8, #0xc]
    bl func_ov002_0214f960
    ldr r1, [r8, #0xc]
    ldr r0, .L_02151200
    ldr r4, [r1, #0x4]
    bl func_020326b0
    mov r3, r0
    mov r0, r4
    ldr r4, [r0, #0x0]
    ldr r1, .L_02151200
    ldr r4, [r4, #0x40]
    add r2, sp, #0x14
    blx r4
    mov r1, r0
    ldr r2, [sp, #0x14]
    add r0, sp, #0x18
    bl func_0202c4a4
    ldr r1, .L_02151204
    ldr r2, .L_02151208
    ldr r3, .L_0215120c
    mov r0, #0x4c
    ldr r4, [sp, #0x1c]
    ldr r5, [sp, #0x18]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02151028
    ldr r2, .L_02151210
    ldr r1, .L_02151214
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x8
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r5
    mov r3, r4
    str r1, [sp, #0x10]
    bl func_02013b14
.L_02151028:
    bl func_ov002_0214f194
    mov r1, r0
    ldr r0, [r8, #0xc]
    bl func_02020f38
    bl func_0203b3f4
    mov r1, #0xe5
    str r1, [sp, #0x0]
    ldr r1, [r8, #0x0]
    ldr r2, [r0, #0x88]
    ldrb r3, [r1, #0x51]
    mov r1, #0x50000
    mov r0, r3, lsl #0x1
    add r0, r0, #0x5
    ldr r3, [r8, #0x8]
    add r0, r0, #0x50000
    bl func_ov002_0214d53c
    ldr r1, .L_02151218
    str r0, [r8, #0x10]
    bl func_ov002_0214f960
    bl func_0203b3f4
    mov r1, #0xe3
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, [r8, #0x0]
    ldr r3, [r8, #0x8]
    ldrb r0, [r0, #0x51]
    mov r1, #0x50000
    mov r0, r0, lsl #0x1
    add r0, r0, #0xc
    add r0, r0, #0x50000
    bl func_ov002_0214d53c
    str r0, [r8, #0x14]
    bl func_0203b3f4
    mov r1, #0xe2
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215121c
    ldr r3, [r8, #0x8]
    mov r1, #0x50000
    bl func_ov002_0214d53c
    str r0, [r8, #0x18]
    ldr r1, [r8, #0x0]
    ldrb r0, [r8, #0x22]
    ldrb r1, [r1, #0x51]
    cmp r1, r0
    mov r0, r1, lsl #0x1
    add r0, r0, #0x16
    add r4, r0, #0x50000
    addlo r4, r4, #0x1
    bl func_0203b3f4
    mov r1, #0xe4
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r3, [r8, #0x8]
    mov r0, r4
    mov r1, #0x50000
    bl func_ov002_0214d53c
    ldr r5, .L_02151220
    str r0, [r8, #0x1c]
    mov r6, #0x2
    mov r4, #0xc
.L_0215111c:
    ldr r0, [r8, #0x0]
    add r1, r8, r6, lsl #0x2
    ldrb r2, [r0, #0x51]
    ldr r0, [r1, #0xc]
    mla r1, r2, r4, r5
    bl func_ov002_0214f960
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_0215111c
    ldr r0, .L_02151224
    ldr r2, [r0, #0x14]
    ldr r1, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    str r2, [sp, #0x30]
    str r1, [sp, #0x34]
    str r0, [sp, #0x38]
    bl func_0203b3f4
    mov r1, #0xe5
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r3, [r8, #0x8]
    ldr r0, .L_02151228
    mov r1, #0x50000
    bl func_ov002_0214d53c
    add r1, sp, #0x30
    bl func_ov002_0214f960
    mov r9, #0x1
    mov r7, #0xe5
    ldr r6, .L_02151228
    mov r5, #0x50000
    ldr r4, .L_02151220
    mov r10, #0xc
    b .L_021511c8
.L_021511a0:
    bl func_0203b3f4
    str r7, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r3, [r8, #0x8]
    mov r0, r6
    mov r1, r5
    bl func_ov002_0214d53c
    mla r1, r9, r10, r4
    bl func_ov002_0214f960
    add r9, r9, #0x1
.L_021511c8:
    ldrb r0, [r8, #0x22]
    cmp r9, r0
    ble .L_021511a0
    mov r0, r8
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021511e0: .word data_ov002_0215c17c
.L_021511e4: .word data_ov002_0215c0f4
.L_021511e8: .word data_ov002_0215c108
.L_021511ec: .word data_ov002_0215bfa4
.L_021511f0: .word data_ov002_0215c0b4
.L_021511f4: .word 0x4c3
.L_021511f8: .word func_02024a30
.L_021511fc: .word data_ov002_0215c164
.L_02151200: .word data_ov002_0215c18c
.L_02151204: .word data_ov002_0215c008
.L_02151208: .word data_ov002_0215c0bc
.L_0215120c: .word 0x2ef
.L_02151210: .word 0x494c
.L_02151214: .word data_ov002_0215c158
.L_02151218: .word data_ov002_0215c170
.L_0215121c: .word 0x5000b
.L_02151220: .word data_ov002_0215c11c
.L_02151224: .word data_ov002_0215c108
.L_02151228: .word 0x5000a
    arm_func_end func_ov002_02150b4c

    .global func_ov002_0215122c
    arm_func_start func_ov002_0215122c
func_ov002_0215122c: ; 0x0215122c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02151264
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02151264:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215127c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215127c:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0215122c

    .global func_ov002_02151288
    arm_func_start func_ov002_02151288
func_ov002_02151288: ; 0x02151288
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r1, [r6, #0x0]
    mov r0, #0xc
    ldrb r2, [r1, #0x51]
    ldr r5, .L_02151444
    strb r2, [r6, #0x23]
    ldrb r1, [r6, #0x21]
    smulbb r4, r2, r0
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, [r6, #0xc]
    ldrb r1, [r6, #0x23]
    ldr r0, [r7, #0x4]
    mov r2, #0x0
    add r1, r1, #0x50000
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r1, .L_02151448
    mov r0, r7
    bl func_ov002_0214f960
    ldr r1, .L_0215144c
    mov r0, r7
    mov r2, #0x0
    bl func_ov002_02151454
    ldr r0, [r0, #0x4]
    ldr r1, .L_02151450
    mov r2, #0x0
    bl func_02013c48
    ldr r0, [r6, #0x10]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x0]
    ldr r0, [r6, #0x10]
    ldrb r1, [r1, #0x51]
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    add r1, r1, #0x5
    add r1, r1, #0x50000
    bl func_02023894
    ldr r0, [r6, #0x10]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r6, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x18]
    add r1, r5, r4
    bl func_ov002_0214f960
    ldr r0, [r6, #0x1c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x1c]
    add r1, r5, r4
    bl func_ov002_0214f960
    ldr r1, [r6, #0x0]
    ldrb r0, [r6, #0x22]
    ldrb r1, [r1, #0x51]
    ldr r2, [r6, #0x1c]
    cmp r1, r0
    mov r0, r1, lsl #0x1
    movlo r3, #0x1
    add r0, r0, #0x16
    add r1, r0, #0x50000
    movhs r3, #0x0
    ldr r0, [r2, #0x4]
    add r1, r1, r3
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrb r0, [r6, #0x23]
    ldr r3, [r6, #0x14]
    mov r2, #0x0
    mov r0, r0, lsl #0x1
    add r1, r0, #0xc
    ldr r0, [r3, #0x4]
    add r1, r1, #0x50000
    bl func_02023894
    ldr r0, [r6, #0x14]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r6, #0x14]
    add r1, r5, r4
    bl func_ov002_0214f960
    mov r0, #0x1
    strb r0, [r6, #0x21]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02151444: .word data_ov002_0215c11c
.L_02151448: .word data_ov002_0215c164
.L_0215144c: .word 0x564d5049
.L_02151450: .word data_ov002_0215c158
    arm_func_end func_ov002_02151288

    .global func_ov002_02151454
    arm_func_start func_ov002_02151454
func_ov002_02151454: ; 0x02151454
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    bl func_02023fb0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_0214f194
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02151454

    .global func_ov002_02151474
    arm_func_start func_ov002_02151474
func_ov002_02151474: ; 0x02151474
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r5, [r4, #0xc]
    ldr r1, .L_02151538
    mov r0, r5
    bl func_ov002_0214f960
    ldr r1, .L_0215153c
    mov r0, r5
    mov r2, #0x0
    bl func_ov002_02151454
    ldr r0, [r0, #0x4]
    ldr r1, .L_02151540
    mov r2, #0x0
    bl func_02013c48
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x18]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x14]
    ldrb r1, [r4, #0x23]
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    mov r1, r1, lsl #0x1
    add r1, r1, #0xd
    add r1, r1, #0x50000
    bl func_02023894
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x0
    strb r0, [r4, #0x21]
    ldmia sp!, {r3, r4, r5, pc}
.L_02151538: .word data_ov002_0215c158
.L_0215153c: .word 0x564d5049
.L_02151540: .word data_ov002_0215c164
    arm_func_end func_ov002_02151474

    .global func_ov002_02151544
    arm_func_start func_ov002_02151544
func_ov002_02151544: ; 0x02151544
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r1, .L_02151788
    mov r5, r0
    ldr r2, .L_0215178c
    mov r0, #0x378
    mov r3, #0x104
    bl func_ov002_021517a0
    movs r6, r0
    beq .L_02151574
    bl func_ov002_021518b4
    mov r6, r0
.L_02151574:
    mov r0, r6
    mov r1, #0x378
    bl func_ov002_021517ac
    str r5, [r6, #0x330]
    bl func_02026f94
    str r0, [r6, #0x0]
    mov r1, r6
    bl func_ov002_021517c0
    ldr r0, [r6, #0x0]
    bl func_ov002_021517d8
    mov r0, r5
    bl func_ov002_0214d394
    bl func_ov002_02151c64
    mov r0, r6
    bl func_ov002_02151d4c
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    bl func_ov012_021ba49c
    mov r1, #0x0
    str r0, [r6, #0x340]
    bl func_ov012_021bad80
    mov r0, r6
    bl func_ov002_0215202c
    ldrb r1, [r6, #0x35d]
    ldr r0, [r6, #0xc]
    bl func_ov002_021566e0
    str r0, [r6, #0x338]
    mov r1, #0x0
    bl func_ov002_021517e8
    ldr r1, [r6, #0x8]
    bl func_ov002_0214d678
    mov r0, r6
    bl func_ov002_0215508c
    ldrb r0, [r6, #0x364]
    cmp r0, #0x0
    bne .L_02151618
    mov r0, r5
    bl func_ov002_021517f4
    cmp r0, #0x0
    bne .L_02151650
.L_02151618:
    mov r0, r5
    bl func_ov002_021517f4
    strb r0, [r6, #0x360]
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_021517fc
    ldr r1, .L_02151790
    add r0, r6, #0x344
    bl func_ov002_02151804
    mov r0, r6
    bl func_ov002_0215327c
    mov r0, r6
    bl func_ov002_02154680
    b .L_02151664
.L_02151650:
    add r0, r6, #0x344
    mov r1, #0x3f800000
    bl func_ov002_02151804
    mov r0, r6
    bl func_ov002_021535b0
.L_02151664:
    ldr r0, [r6, #0x10]
    mov r1, #0x1
    bl func_ov002_02151824
    ldrb r1, [r6, #0x35c]
    mov r0, r6
    bl func_ov002_02153808
    mov r1, #0x28
    mul r8, r0, r1
    add r0, r6, r8
    ldr r4, [r0, #0xd8]
    mov r1, #0x0
    mov r0, r4
    bl func_ov002_02151824
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_02151824
    mov r0, r5
    bl func_ov002_021517f4
    cmp r0, #0x1
    bne .L_0215171c
    ldr r0, [r6, #0x330]
    bl func_ov002_02151834
    strb r0, [r6, #0x35e]
    ldrb r1, [r6, #0x35c]
    ldr r0, [r6, #0x330]
    bl func_ov002_0215183c
    mov r4, r0
    add r7, r6, r8
    mov r5, #0x0
    b .L_02151710
.L_021516dc:
    add r0, r7, r5, lsl #0x2
    ldr r0, [r0, #0xdc]
    bl func_ov002_0215184c
    ldrb r1, [r6, #0x35e]
    cmp r1, r0
    bne .L_0215170c
    add r0, r6, r8
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0xdc]
    mov r1, #0x1
    bl func_ov002_02151824
    b .L_0215171c
.L_0215170c:
    add r5, r5, #0x1
.L_02151710:
    ldrb r0, [r4, #0x44]
    cmp r5, r0
    blt .L_021516dc
.L_0215171c:
    add r0, sp, #0x0
    mov r1, #0x3f800000
    bl func_ov002_02151874
    ldr r0, [r6, #0xc]
    add r1, sp, #0x0
    bl func_ov002_02151858
    ldr r0, [r6, #0xc]
    ldr r1, .L_02151794
    mov r2, #0x0
    bl func_ov002_02151454
    ldr r1, .L_02151798
    mov r2, #0x0
    bl func_ov002_02151898
    ldr r0, [r6, #0x8]
    ldr r1, .L_0215179c
    bl func_ov002_0214f960
    ldr r0, [r6, #0x8]
    ldr r1, .L_02151794
    mov r2, #0x0
    bl func_ov002_02151454
    ldr r1, .L_0215179c
    mov r2, #0x0
    bl func_ov002_02151898
    bl func_ov002_021518a8
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02151788: .word data_ov002_0215c300
.L_0215178c: .word data_ov002_0215c2e8
.L_02151790: .word 0x3f19999a
.L_02151794: .word 0x564d5049
.L_02151798: .word data_02093c98
.L_0215179c: .word data_02093c8c
    arm_func_end func_ov002_02151544

    .global func_ov002_021517a0
    arm_func_start func_ov002_021517a0
func_ov002_021517a0: ; 0x021517a0
    ldr ip, .L_021517a8
    bx ip
.L_021517a8: .word func_0201a21c
    arm_func_end func_ov002_021517a0

    .global func_ov002_021517ac
    arm_func_start func_ov002_021517ac
func_ov002_021517ac: ; 0x021517ac
    ldr ip, .L_021517bc
    mov r2, r1
    mov r1, #0x0
    bx ip
.L_021517bc: .word func_020517fc
    arm_func_end func_ov002_021517ac

    .global func_ov002_021517c0
    arm_func_start func_ov002_021517c0
func_ov002_021517c0: ; 0x021517c0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_021517c0

    .global func_ov002_021517d8
    arm_func_start func_ov002_021517d8
func_ov002_021517d8: ; 0x021517d8
    ldr ip, .L_021517e4
    ldr r0, [r0, #0x4]
    bx ip
.L_021517e4: .word func_020282f4
    arm_func_end func_ov002_021517d8

    .global func_ov002_021517e8
    arm_func_start func_ov002_021517e8
func_ov002_021517e8: ; 0x021517e8
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x8]
    bx lr
    arm_func_end func_ov002_021517e8

    .global func_ov002_021517f4
    arm_func_start func_ov002_021517f4
func_ov002_021517f4: ; 0x021517f4
    ldrb r0, [r0, #0x56]
    bx lr
    arm_func_end func_ov002_021517f4

    .global func_ov002_021517fc
    arm_func_start func_ov002_021517fc
func_ov002_021517fc: ; 0x021517fc
    strb r1, [r0, #0x56]
    bx lr
    arm_func_end func_ov002_021517fc

    .global func_ov002_02151804
    arm_func_start func_ov002_02151804
func_ov002_02151804: ; 0x02151804
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, .L_02151820
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02151820: .word 0x45800000
    arm_func_end func_ov002_02151804

    .global func_ov002_02151824
    arm_func_start func_ov002_02151824
func_ov002_02151824: ; 0x02151824
    ldr ip, .L_02151830
    ldr r0, [r0, #0x4]
    bx ip
.L_02151830: .word func_ov012_021b6214
    arm_func_end func_ov002_02151824

    .global func_ov002_02151834
    arm_func_start func_ov002_02151834
func_ov002_02151834: ; 0x02151834
    ldrb r0, [r0, #0x53]
    bx lr
    arm_func_end func_ov002_02151834

    .global func_ov002_0215183c
    arm_func_start func_ov002_0215183c
func_ov002_0215183c: ; 0x0215183c
    ldr r2, [r0, #0x34]
    mov r0, #0x48
    mla r0, r1, r0, r2
    bx lr
    arm_func_end func_ov002_0215183c

    .global func_ov002_0215184c
    arm_func_start func_ov002_0215184c
func_ov002_0215184c: ; 0x0215184c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x124]
    bx lr
    arm_func_end func_ov002_0215184c

    .global func_ov002_02151858
    arm_func_start func_ov002_02151858
func_ov002_02151858: ; 0x02151858
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020235dc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02151858

    .global func_ov002_02151874
    arm_func_start func_ov002_02151874
func_ov002_02151874: ; 0x02151874
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, .L_02151894
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [r4, #0x0]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02151894: .word 0x45800000
    arm_func_end func_ov002_02151874

    .global func_ov002_02151898
    arm_func_start func_ov002_02151898
func_ov002_02151898: ; 0x02151898
    ldr ip, .L_021518a4
    ldr r0, [r0, #0x4]
    bx ip
.L_021518a4: .word func_02013c48
    arm_func_end func_ov002_02151898

    .global func_ov002_021518a8
    arm_func_start func_ov002_021518a8
func_ov002_021518a8: ; 0x021518a8
    ldr ip, .L_021518b0
    bx ip
.L_021518b0: .word func_ov012_021b65bc
    arm_func_end func_ov002_021518a8

    .global func_ov002_021518b4
    arm_func_start func_ov002_021518b4
func_ov002_021518b4: ; 0x021518b4
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    add r0, r4, #0x348
    str r1, [r4, #0x344]
    bl func_ov002_021518d4
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_021518b4

    .global func_ov002_021518d4
    arm_func_start func_ov002_021518d4
func_ov002_021518d4: ; 0x021518d4
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov002_021518d4

    .global func_ov002_021518e8
    arm_func_start func_ov002_021518e8
func_ov002_021518e8: ; 0x021518e8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x0]
    cmp r0, #0x0
    beq .L_02151908
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02151908:
    ldr r0, [r10, #0x4]
    cmp r0, #0x0
    beq .L_02151920
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02151920:
    ldr r0, [r10, #0x340]
    cmp r0, #0x0
    beq .L_02151930
    bl func_ov012_021bab64
.L_02151930:
    ldr r0, [r10, #0x338]
    cmp r0, #0x0
    beq .L_02151948
    bl func_ov002_02156ac8
    mov r0, #0x0
    str r0, [r10, #0x338]
.L_02151948:
    ldr r0, [r10, #0x33c]
    cmp r0, #0x0
    beq .L_02151958
    bl func_ov002_02156048
.L_02151958:
    ldr r0, [r10, #0x10]
    cmp r0, #0x0
    beq .L_02151970
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02151970:
    ldr r0, .L_02151ae8
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r4, #0x10
.L_02151980:
    mov r0, r4
    blx func_ov012_021b526c
    add r4, r4, #0x1
    cmp r4, #0x12
    blt .L_02151980
    ldr r0, [r10, #0x334]
    cmp r0, #0x0
    beq .L_021519a4
    bl func_0206ae98
.L_021519a4:
    mov r4, #0x0
.L_021519a8:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_021519c4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021519c4:
    add r4, r4, #0x1
    cmp r4, #0x8
    blt .L_021519a8
    ldr r0, [r10, #0x4c]
    cmp r0, #0x0
    beq .L_021519e8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021519e8:
    ldr r0, [r10, #0x48]
    cmp r0, #0x0
    beq .L_02151a00
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02151a00:
    ldr r0, [r10, #0x330]
    ldrb r1, [r10, #0x35d]
    ldr r2, [r0, #0x30]
    mov r0, #0x3c
    mla r7, r1, r0, r2
    mov r5, #0x0
    mov r4, r5
    mov r11, #0x28
    b .L_02151a80
.L_02151a24:
    add r0, r7, r5
    ldr r2, [r10, #0x330]
    ldrb r1, [r0, #0x2d]
    ldr r2, [r2, #0x34]
    mov r0, #0x48
    mla r9, r5, r11, r10
    mla r8, r1, r0, r2
    mov r6, #0x0
    b .L_02151a70
.L_02151a48:
    add r0, r9, r6, lsl #0x2
    ldr r0, [r0, #0xec]
    cmp r0, #0x0
    beq .L_02151a6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r9, r6, lsl #0x2
    str r4, [r0, #0xec]
.L_02151a6c:
    add r6, r6, #0x1
.L_02151a70:
    ldrb r0, [r8, #0x44]
    cmp r6, r0
    blt .L_02151a48
    add r5, r5, #0x1
.L_02151a80:
    ldrb r0, [r7, #0x2c]
    cmp r5, r0
    blt .L_02151a24
    ldr r0, [r10, #0x20]
    cmp r0, #0x0
    beq .L_02151aa4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02151aa4:
    mov r4, #0x0
.L_02151aa8:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x58]
    cmp r0, #0x0
    beq .L_02151ac4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02151ac4:
    add r4, r4, #0x1
    cmp r4, #0x20
    blt .L_02151aa8
    ldrb r2, [r10, #0x35c]
    ldr r1, [r10, #0x330]
    mov r0, r10
    strb r2, [r1, #0x52]
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02151ae8: .word data_ov012_021d5154
    arm_func_end func_ov002_021518e8

    .global func_ov002_02151aec
    arm_func_start func_ov002_02151aec
func_ov002_02151aec: ; 0x02151aec
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x364]
    cmp r0, #0x0
    beq .L_02151b2c
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x0]
    ldr r1, .L_02151b34
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02151b2c:
    blx func_ov012_021b65cc
    ldmia sp!, {r4, pc}
.L_02151b34: .word func_ov002_02154ed8
    arm_func_end func_ov002_02151aec

    .global func_ov002_02151b38
    arm_func_start func_ov002_02151b38
func_ov002_02151b38: ; 0x02151b38
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65cc
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x340]
    mov r3, r2
    mov r1, #0x7d
    bl func_ov012_021bac28
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    ldr r2, [r1, #0x4]
    mov r1, #0x3d
    str r1, [r2, #0x8e8]
    str r0, [r2, #0x8ec]
    sub r0, r0, #0x8
    str r0, [r2, #0x8f4]
    mov r0, #0x2
    str r0, [r2, #0x8f0]
    mov r0, #0x1
    strb r0, [r2, #0x902]
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r6, .L_02151c60
    b .L_02151bc4
.L_02151bbc:
    ldr r0, [r6, #0x0]
    blx r0
.L_02151bc4:
    ldr r0, [r4, #0x340]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02151bbc
    ldr r0, [r4, #0x340]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    ldr r0, [r4, #0x330]
    beq .L_02151c00
    mov r1, #0x0
    strb r1, [r0, #0x58]
    ldr r0, [r4, #0x330]
    mov r1, #0x6
    bl func_ov002_0214d348
    b .L_02151c50
.L_02151c00:
    bl func_ov002_0214e270
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x330]
    mov r1, #0x1
    ldrb r0, [r0, #0x56]
    cmp r0, #0x0
    bne .L_02151c44
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    b .L_02151c50
.L_02151c44:
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
.L_02151c50:
    ldr r0, [r5, #0x4]
    bl func_020282f4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02151c60: .word data_020a0e18
    arm_func_end func_ov002_02151b38

    .global func_ov002_02151c64
    arm_func_start func_ov002_02151c64
func_ov002_02151c64: ; 0x02151c64
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    mov r0, #0x1
    bl func_02043264
    ldr r0, .L_02151d48
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
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
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_02151d48: .word data_020a0f64
    arm_func_end func_ov002_02151c64

    .global func_ov002_02151d4c
    arm_func_start func_ov002_02151d4c
func_ov002_02151d4c: ; 0x02151d4c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x34
    ldr r1, .L_02151fd0
    mov r7, r0
    ldr r2, .L_02151fd4
    ldr r3, .L_02151fd8
    mov r0, #0x78
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02151d80
    ldr r1, .L_02151fdc
    mov r2, #0x1
    bl func_02024064
.L_02151d80:
    bl func_ov002_0214d498
    mov r5, #0x60000
    mov r3, #0x80000
    add r1, sp, #0x30
    add r2, sp, #0x2c
    mov r4, r0
    str r5, [sp, #0x2c]
    str r3, [sp, #0x30]
    bl func_ov002_0214d4c0
    ldr r0, [r4, #0x4]
    ldr r1, .L_02151fe0
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x81000
    str r0, [sp, #0x28]
    mov r0, r4
    add r1, sp, #0x28
    bl func_ov002_02152008
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_02151fd0
    ldr r2, .L_02151fd4
    ldr r3, .L_02151fd8
    mov r0, #0x78
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02151e14
    ldr r1, .L_02151fdc
    mov r2, #0x1
    bl func_02024064
.L_02151e14:
    bl func_ov002_0214d498
    mov r5, r0
    mov r1, r4
    bl func_ov002_0214d678
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x78
    ldr r1, .L_02151fd0
    ldr r2, .L_02151fd4
    ldr r3, .L_02151fd8
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02151e60
    ldr r1, .L_02151fdc
    mov r2, #0x1
    bl func_02024064
.L_02151e60:
    bl func_ov002_0214d498
    mov r6, r0
    mov r1, r5
    bl func_ov002_0214d678
    ldr r0, [r6, #0x4]
    ldr r1, .L_02151fe4
    bl func_02028384
    ldr r0, [r6, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x82000
    str r0, [sp, #0x24]
    mov r0, r6
    add r1, sp, #0x24
    bl func_ov002_02152008
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r2, .L_02151fe8
    add r0, sp, #0x1c
    mov r1, r6
    bl func_ov002_0214ef10
    ldr r1, .L_02151fec
    ldr r2, .L_02151ff0
    ldr r3, .L_02151ff4
    mov r0, #0x4c
    ldr r8, [sp, #0x20]
    ldr r9, [sp, #0x1c]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02151f1c
    ldr r2, .L_02151ff8
    ldr r1, .L_02151ffc
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x8
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r9
    mov r3, r8
    str r1, [sp, #0x10]
    bl func_02013b14
.L_02151f1c:
    bl func_ov002_0214f194
    mov r1, r0
    mov r0, r6
    bl func_02020f38
    ldr r2, .L_02152000
    add r0, sp, #0x14
    mov r1, r5
    bl func_ov002_0214ef10
    ldr r1, .L_02151fec
    ldr r2, .L_02151ff0
    ldr r3, .L_02151ff4
    mov r0, #0x4c
    ldr r8, [sp, #0x18]
    ldr r9, [sp, #0x14]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02151f90
    ldr r2, .L_02151ff8
    ldr r1, .L_02152004
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x8
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r9
    mov r3, r8
    str r1, [sp, #0x10]
    bl func_02013b14
.L_02151f90:
    bl func_ov002_0214f194
    mov r1, r0
    mov r0, r5
    bl func_02020f38
    mov r0, r4
    mov r1, r5
    bl func_ov002_0214d6b0
    mov r0, r5
    mov r1, r6
    bl func_ov002_0214d6b0
    str r5, [r7, #0x8]
    str r6, [r7, #0xc]
    mov r0, r4
    str r4, [r7, #0x4]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02151fd0: .word data_ov002_0215bfa4
.L_02151fd4: .word data_ov002_0215c1a8
.L_02151fd8: .word 0x4c3
.L_02151fdc: .word func_02024a30
.L_02151fe0: .word func_ov002_0215460c
.L_02151fe4: .word func_ov002_021548f0
.L_02151fe8: .word data_ov002_0215c314
.L_02151fec: .word data_ov002_0215c008
.L_02151ff0: .word data_ov002_0215c198
.L_02151ff4: .word 0x2ef
.L_02151ff8: .word 0x494c
.L_02151ffc: .word data_02093c98
.L_02152000: .word data_ov002_0215c31c
.L_02152004: .word data_02093c8c
    arm_func_end func_ov002_02151d4c

    .global func_ov002_02152008
    arm_func_start func_ov002_02152008
func_ov002_02152008: ; 0x02152008
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02152008

    .global func_ov002_0215202c
    arm_func_start func_ov002_0215202c
func_ov002_0215202c: ; 0x0215202c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1f8
    mov r10, r0
    ldr r0, [r10, #0x330]
    mov r6, #0x0
    ldrb r2, [r0, #0x52]
    mov r0, #0x48
    mov r1, #0x3c
    strb r2, [r10, #0x35c]
    ldr r2, [r10, #0x330]
    mov r5, r6
    ldrb r2, [r2, #0x53]
    mov r11, #0x48
    strb r2, [r10, #0x35e]
    ldr r3, [r10, #0x330]
    ldrb r2, [r10, #0x35c]
    ldr r3, [r3, #0x34]
    mla r3, r2, r0, r3
    ldrb r0, [r3, #0x42]
    strb r0, [r10, #0x35d]
    ldr r0, [r10, #0x330]
    ldrb r2, [r3, #0x42]
    ldr r0, [r0, #0x30]
    mla r0, r2, r1, r0
    ldrb r0, [r0, #0x2c]
    strb r0, [r10, #0x35f]
    ldr r2, [r10, #0x330]
    ldrb r0, [r10, #0x35d]
    ldr r2, [r2, #0x30]
    mla r7, r0, r1, r2
    b .L_02152130
.L_021520a8:
    add r0, r7, r5
    ldr r1, [r10, #0x330]
    ldrb r0, [r0, #0x2d]
    ldr r1, [r1, #0x34]
    mov r4, #0x0
    mla r8, r0, r11, r1
    b .L_02152120
.L_021520c4:
    add r0, r8, r4
    ldr r2, [r10, #0x330]
    ldrb r1, [r0, #0x38]
    ldr r2, [r2, #0x38]
    add r0, sp, #0xf8
    add r9, r2, r1, lsl #0x6
    ldr r1, .L_02152e7c
    bl func_02074000
    ldrb r0, [r9, #0x2d]
    bl func_ov002_0214e008
    mov r1, r0
    add r0, sp, #0xf8
    bl func_020741bc
    ldr r1, .L_02152e80
    add r0, sp, #0xf8
    bl func_020741bc
    add r0, sp, #0xf8
    mov r1, #0x0
    blx func_020101f4
    add r1, r10, r6, lsl #0x2
    str r0, [r1, #0x58]
    add r6, r6, #0x1
    add r4, r4, #0x1
.L_02152120:
    ldrb r0, [r8, #0x44]
    cmp r4, r0
    blt .L_021520c4
    add r5, r5, #0x1
.L_02152130:
    ldrb r0, [r7, #0x2c]
    cmp r5, r0
    blt .L_021520a8
    bl func_0203b404
    mov r1, #0x47
    mov r2, r0
    str r1, [sp, #0x0]
    mov r0, #0x11000
    ldr r2, [r2, #0x88]
    mov r1, r0
    mov r3, #0x0
    bl func_ov002_0214d53c
    ldr r1, .L_02152e84
    str r0, [r10, #0x28]
    bl func_ov002_0214f960
    ldr r7, .L_02152e88
    ldr r5, .L_02152e84
    mov r9, #0x1
    mov r8, #0x44
    mov r6, #0x12000
    mov r11, #0x0
    mov r4, #0xc
.L_02152188:
    bl func_0203b3e4
    str r8, [sp, #0x0]
    ldr r2, [r0, #0x88]
    mov r0, r7
    mov r1, r6
    mov r3, r11
    bl func_ov002_0214d53c
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x28]
    mla r1, r9, r4, r5
    bl func_ov002_0214f960
    add r9, r9, #0x1
    cmp r9, #0x8
    blt .L_02152188
    ldr r0, [r10, #0x44]
    ldr r1, .L_02152e8c
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r10, #0x44]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    bl func_0203b3e4
    mov r1, #0x43
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02152e90
    mov r3, #0x0
    mov r1, r0
    bl func_ov002_0214d53c
    str r0, [r10, #0x4c]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x16000
    str r0, [sp, #0x6c]
    mov r0, #0xe000
    str r0, [sp, #0x70]
    ldr r0, [r10, #0x4c]
    add r1, sp, #0x70
    add r2, sp, #0x6c
    bl func_ov002_0214d4c0
    bl func_0203b404
    mov r1, #0x46
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02152e94
    mov r1, #0x11000
    mov r3, #0x0
    bl func_ov002_0214d53c
    ldr r1, .L_02152e84
    str r0, [r10, #0x48]
    bl func_ov002_0214f960
    mov r0, #0x0
    mov r1, #0x42
    bl func_ov002_0214d718
    str r0, [r10, #0x20]
    ldr r1, .L_02152e98
    ldr r2, .L_02152e9c
    ldr r3, .L_02152ea0
    mov r0, #0xcc
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021522ac
    ldr r1, .L_02152ea4
    ldr r2, .L_02152ea8
    mov r3, #0x0
    blx func_ov012_021af26c
.L_021522ac:
    bl func_ov002_0214ed94
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x10
    blx func_ov012_021b3b7c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0xcc
    ldr r1, .L_02152e98
    ldr r2, .L_02152e9c
    ldr r3, .L_02152ea0
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02152318
    ldr r1, .L_02152eac
    ldr r2, .L_02152eb0
    mov r3, #0x0
    blx func_ov012_021af26c
.L_02152318:
    bl func_ov002_0214ed94
    mov r4, r0
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x11
    blx func_ov012_021b3b7c
    ldr r1, .L_02152eb4
    mov r0, r4
    bl func_ov002_02153010
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    add r0, r0, #0x14
    bl func_ov002_02153060
    bl func_ov002_02153038
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x11
    mov r2, #0xf
    mov r3, #0x5
    bl func_0206ad90
    mov r1, #0x0
    strh r1, [r0, #0x18]
    ldr r2, .L_02152eb8
    mov r1, #0x1e
    strh r2, [r0, #0x16]
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    str r0, [r10, #0x334]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02152ebc
    mvn r2, #0x0
    str r2, [r1, #0x0]
    mov r0, r10
    mov r1, #0x0
    bl func_ov002_0214d808
    mov r1, #0x0
    mov r4, r0
    bl func_ov002_021506bc
    ldr r1, .L_02152ebc
    str r4, [r10, #0x10]
    mov r2, #0x10
    str r2, [r1, #0x0]
    ldr r1, [r10, #0x10]
    mov r0, r10
    bl func_ov002_0214d808
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    ldr r1, [r10, #0xc]
    mov r0, r4
    bl func_ov002_0214d678
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021506bc
    mov r0, #0xc5000
    str r0, [sp, #0x3c]
    mov r0, r4
    add r1, sp, #0x3c
    bl func_ov002_0214d650
    ldr r0, .L_02152ebc
    str r4, [r10, #0x14]
    mov r1, #0x11
    str r1, [r0, #0x0]
    ldr r1, [r10, #0x10]
    mov r0, r10
    bl func_ov002_0214d808
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    ldr r1, [r10, #0xc]
    mov r0, r4
    bl func_ov002_0214d678
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021506bc
    mov r2, #0x84000
    add r1, sp, #0x38
    mov r0, r4
    str r2, [sp, #0x38]
    bl func_ov002_0214d650
    str r4, [r10, #0x18]
    ldr r0, [r10, #0x330]
    ldrb r1, [r10, #0x35d]
    ldr r2, [r0, #0x30]
    mov r0, #0x3c
    mla r5, r1, r0, r2
    mov r9, #0x0
    b .L_02152a54
.L_02152498:
    add r0, r5, r9
    ldr r3, [r10, #0x330]
    ldrb r2, [r0, #0x2d]
    ldr r1, .L_02152ec0
    ldr r3, [r3, #0x34]
    mov r0, #0x48
    ldr r1, [r1, #0x4]
    mla r6, r2, r0, r3
    tst r1, #0x1
    bne .L_02152534
    mov r3, #0x20
    sub r1, r3, #0x40
    ldr r0, .L_02152ec4
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_ov002_0214edbc
    mov r4, #0x20
    ldr r0, .L_02152ec8
    sub r1, r4, #0x48
    sub r2, r4, #0x40
    mov r3, #0x28
    str r4, [sp, #0x0]
    bl func_ov002_0214edbc
    mov r3, #0x28
    ldr r0, .L_02152ecc
    str r3, [sp, #0x0]
    sub r1, r3, #0x50
    sub r2, r3, #0x48
    bl func_ov002_0214edbc
    mov r3, #0x28
    str r3, [sp, #0x0]
    ldr r0, .L_02152ed0
    sub r1, r3, #0x50
    mov r2, r1
    bl func_ov002_0214edbc
    ldr r0, .L_02152ec0
    ldr r1, [r0, #0x4]
    orr r1, r1, #0x1
    str r1, [r0, #0x4]
.L_02152534:
    ldr r0, .L_02152ec0
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne .L_0215256c
    mov r3, #0x20
    sub r1, r3, #0x40
    ldr r0, .L_02152ed4
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_ov002_0214edbc
    ldr r0, .L_02152ec0
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
.L_0215256c:
    mov r1, #0x0
    str r1, [sp, #0x50]
    ldr r0, .L_02152ebc
    mov r2, #0x10
    str r2, [r0, #0x0]
    ldrsh r2, [r6, #0x2e]
    add r0, sp, #0xb0
    add r1, sp, #0x58
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x54]
    ldrsh r4, [r6, #0x2c]
    add r2, sp, #0x54
    add r3, sp, #0x50
    mov r4, r4, lsl #0xc
    str r4, [sp, #0x58]
    bl func_ov002_0214e39c
    ldrb r0, [r6, #0x44]
    ldr r4, .L_02152ec4
    ldr r1, [r10, #0x14]
    sub r3, r0, #0x1
    add r2, sp, #0xb0
    mov r0, r10
    add r3, r4, r3, lsl #0x3
    bl func_ov002_0214d8fc
    mov r7, r0
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ed8
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152edc
    mov r1, #0x1
    blx func_ov012_021b65e8
    ldr r2, .L_02152ee0
    ldr r1, [r7, #0x4]
    mov r0, #0x84000
    str r2, [r1, #0xdc]
    str r0, [sp, #0x4c]
    mov r0, r7
    add r1, sp, #0x4c
    bl func_ov002_0214d650
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ee4
    mov r1, #0x1
    blx func_ov012_021b7454
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ee4
    mov r1, #0x2
    blx func_ov012_021b7454
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ee4
    mov r1, #0x8
    blx func_ov012_021b7454
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ee4
    mov r1, #0x4
    blx func_ov012_021b7454
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ee4
    mov r1, #0x10000
    blx func_ov012_021b7454
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ee4
    mov r1, #0x100
    blx func_ov012_021b7454
    ldr r0, [r7, #0x4]
    ldr r2, .L_02152ee4
    mov r1, #0x200
    blx func_ov012_021b7454
    mov r0, #0x28
    mul r2, r9, r0
    add r1, r10, #0xdc
    ldr r0, .L_02152ebc
    mov r3, #0x11
    str r3, [r0, #0x0]
    add r0, r10, r2
    add r4, r1, r2
    str r0, [sp, #0x1c]
    mov r8, #0x0
    b .L_021528dc
.L_021526ac:
    sub r2, r0, #0x1
    ldr r0, .L_02152ee8
    mov r1, #0x30
    mla r0, r2, r1, r0
    ldr r1, [r10, #0x330]
    add r11, r6, r8
    ldr r3, [r1, #0x38]
    mov r1, #0xc
    mul r1, r8, r1
    ldrb r2, [r11, #0x38]
    str r1, [sp, #0x18]
    add r1, r3, r2, lsl #0x6
    str r1, [sp, #0x20]
    ldr r1, [sp, #0x18]
    ldr r3, .L_02152ed4
    add r2, r0, r1
    ldr r1, [r10, #0x18]
    mov r0, r10
    bl func_ov002_0214d8fc
    str r0, [r4, r8, lsl #0x2]
    ldr r0, [r0, #0x4]
    ldr r2, .L_02152eec
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, r8, lsl #0x2]
    add r1, sp, #0x48
    ldr r2, [r0, #0x4]
    ldr r0, .L_02152ef0
    str r0, [r2, #0xdc]
    mov r0, #0x84000
    str r0, [sp, #0x48]
    ldr r0, [r4, r8, lsl #0x2]
    bl func_ov002_0214d650
    ldr r0, [r4, r8, lsl #0x2]
    ldrb r2, [r11, #0x38]
    ldr r0, [r0, #0x4]
    mov r1, r7
    str r2, [r0, #0x124]
    ldr r0, [r4, r8, lsl #0x2]
    bl func_ov002_0214d678
    ldr r0, [r4, r8, lsl #0x2]
    ldr r2, .L_02152ef4
    ldr r0, [r0, #0x4]
    mov r1, #0x100
    blx func_ov012_021b7454
    ldr r0, [r4, r8, lsl #0x2]
    ldr r2, .L_02152ef4
    ldr r0, [r0, #0x4]
    mov r1, #0x200
    blx func_ov012_021b7454
    ldr r0, [sp, #0x20]
    ldrb r1, [r0, #0x2d]
    sub r0, r1, #0x1
    and r0, r0, #0xff
    cmp r1, #0x30
    str r0, [sp, #0x30]
    blo .L_0215279c
    cmp r1, #0x34
    movls r0, #0x2f
    strls r0, [sp, #0x30]
.L_0215279c:
    ldrb r1, [r11, #0x38]
    ldr r0, [r10, #0x330]
    bl func_ov002_0214df2c
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x14]
    movne r0, #0x0
    strne r0, [sp, #0x14]
    bl func_0203b404
    ldr r1, [sp, #0x30]
    add r2, r8, #0x84
    str r2, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, [sp, #0x14]
    mov r1, r1, lsl #0x4
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    add r3, r0, #0x30000
    ldr r0, [sp, #0x30]
    add r1, r1, #0x30000
    add r0, r3, r0, lsl #0x4
    mov r3, #0x0
    bl func_ov002_0214d53c
    ldr r1, [r4, r8, lsl #0x2]
    mov r11, r0
    bl func_ov002_0214d678
    ldr r0, [r11, #0x4]
    ldr r1, [sp, #0x30]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r11, #0x4]
    bl func_020282f4
    ldrb r2, [r6, #0x44]
    mov r3, #0x30
    add r0, sp, #0x40
    sub ip, r2, #0x1
    ldr r2, .L_02152ee8
    mov r1, r11
    mla r3, ip, r3, r2
    ldr r2, [sp, #0x18]
    add r2, r3, r2
    str r2, [sp, #0x2c]
    ldr r2, .L_02152ef8
    bl func_ov002_0214ef10
    ldr r0, [sp, #0x44]
    ldr r1, .L_02152efc
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x40]
    ldr r2, .L_02152f00
    str r0, [sp, #0x24]
    ldr r3, .L_02152f04
    mov r0, #0x4c
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021528ac
    ldr r1, .L_02152f08
    ldr r2, [sp, #0x24]
    str r1, [sp, #0x0]
    ldr r1, [sp, #0x2c]
    ldr r3, [sp, #0x28]
    str r1, [sp, #0x4]
    mov r1, #0x8
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    bl func_02013b14
.L_021528ac:
    bl func_ov002_0214f194
    mov r1, r0
    mov r0, r11
    bl func_02020f38
    ldr r0, [sp, #0x1c]
    add r0, r0, r8, lsl #0x2
    str r11, [r0, #0xec]
    ldr r0, [sp, #0x1c]
    add r1, r0, r8
    ldr r0, [sp, #0x14]
    add r8, r8, #0x1
    strb r0, [r1, #0xfc]
.L_021528dc:
    ldrb r0, [r6, #0x44]
    cmp r8, r0
    blt .L_021526ac
    cmp r0, #0x1
    bls .L_021529a8
    mov r8, #0x0
    mvn r11, #0x0
    b .L_0215299c
.L_021528fc:
    ldr r0, .L_02152f0c
    add r0, r0, r1, lsl #0x4
    add r0, r0, r8, lsl #0x2
    ldrsb r1, [r0, #-0x10]
    cmp r1, r11
    beq .L_02152920
    ldr r0, [r4, r8, lsl #0x2]
    ldr r1, [r4, r1, lsl #0x2]
    bl func_ov002_02152f98
.L_02152920:
    ldrb r1, [r6, #0x44]
    ldr r0, .L_02152f0c
    add r0, r0, r1, lsl #0x4
    add r0, r0, r8, lsl #0x2
    ldrsb r1, [r0, #-0xf]
    cmp r1, r11
    beq .L_02152948
    ldr r0, [r4, r8, lsl #0x2]
    ldr r1, [r4, r1, lsl #0x2]
    bl func_ov002_02152f20
.L_02152948:
    ldrb r1, [r6, #0x44]
    ldr r0, .L_02152f0c
    add r0, r0, r1, lsl #0x4
    add r0, r0, r8, lsl #0x2
    ldrsb r1, [r0, #-0xe]
    cmp r1, r11
    beq .L_02152970
    ldr r0, [r4, r8, lsl #0x2]
    ldr r1, [r4, r1, lsl #0x2]
    bl func_ov002_02152fd4
.L_02152970:
    ldrb r1, [r6, #0x44]
    ldr r0, .L_02152f0c
    add r0, r0, r1, lsl #0x4
    add r0, r0, r8, lsl #0x2
    ldrsb r1, [r0, #-0xd]
    cmp r1, r11
    beq .L_02152998
    ldr r0, [r4, r8, lsl #0x2]
    ldr r1, [r4, r1, lsl #0x2]
    bl func_ov002_02152f5c
.L_02152998:
    add r8, r8, #0x1
.L_0215299c:
    ldrb r1, [r6, #0x44]
    cmp r8, r1
    blt .L_021528fc
.L_021529a8:
    add r2, r5, r9
    ldrb r1, [r2, #0x2d]
    ldr r0, [r7, #0x4]
    add r3, sp, #0x74
    str r1, [r0, #0x124]
    ldrb r1, [r2, #0x2d]
    ldr r0, [r10, #0x330]
    str r7, [r3, r9, lsl #0x2]
    bl func_ov002_0214de0c
    cmp r0, #0x0
    bne .L_02152a44
    ldr r0, [r7, #0x4]
    mov r1, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    mov r0, #0x28
    mla r8, r9, r0, r10
    mov r4, #0x0
    mov r11, #0x8
    b .L_02152a38
.L_021529fc:
    add r0, r8, r4, lsl #0x2
    ldr r0, [r0, #0xdc]
    mov r1, r11
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    add r0, r8, r4, lsl #0x2
    ldr r0, [r0, #0xdc]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r4, r4, #0x1
.L_02152a38:
    ldrb r0, [r6, #0x44]
    cmp r4, r0
    blt .L_021529fc
.L_02152a44:
    mov r0, #0x28
    mla r0, r9, r0, r10
    str r7, [r0, #0xd8]
    add r9, r9, #0x1
.L_02152a54:
    ldrb r0, [r5, #0x2c]
    cmp r9, r0
    blt .L_02152498
    mov r9, #0x0
    b .L_02152bc4
.L_02152a68:
    add r0, r5, r9
    ldr r1, [r10, #0x330]
    ldrb r2, [r0, #0x2d]
    mov r0, #0x48
    ldr r3, [r1, #0x34]
    sub r1, r0, #0x49
    mla r7, r2, r0, r3
    ldrsb r2, [r7, #0x3d]
    cmp r2, r1
    beq .L_02152aa0
    add r1, sp, #0x74
    ldr r0, [r1, r9, lsl #0x2]
    ldr r1, [r1, r2, lsl #0x2]
    bl func_ov002_02152f20
.L_02152aa0:
    ldrsb r2, [r7, #0x3f]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_02152ac0
    add r1, sp, #0x74
    ldr r0, [r1, r9, lsl #0x2]
    ldr r1, [r1, r2, lsl #0x2]
    bl func_ov002_02152f5c
.L_02152ac0:
    ldrsb r2, [r7, #0x3c]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_02152ae0
    add r1, sp, #0x74
    ldr r0, [r1, r9, lsl #0x2]
    ldr r1, [r1, r2, lsl #0x2]
    bl func_ov002_02152f98
.L_02152ae0:
    ldrsb r2, [r7, #0x3e]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_02152b00
    add r1, sp, #0x74
    ldr r0, [r1, r9, lsl #0x2]
    ldr r1, [r1, r2, lsl #0x2]
    bl func_ov002_02152fd4
.L_02152b00:
    ldrsb r2, [r7, #0x41]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_02152b60
    mov r0, #0x28
    mla r1, r2, r0, r10
    mla r8, r9, r0, r10
    ldr r6, [r1, #0xdc]
    mov r4, #0x0
    mov r11, #0x100
    b .L_02152b58
.L_02152b2c:
    add r0, r8, r4, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x0
    beq .L_02152b60
    ldr r0, [r0, #0x4]
    ldr r2, [r6, #0x4]
    ldr r3, [r0, #0x0]
    mov r1, r11
    ldr r3, [r3, #0x160]
    blx r3
    add r4, r4, #0x1
.L_02152b58:
    cmp r4, #0x4
    blt .L_02152b2c
.L_02152b60:
    ldrsb r2, [r7, #0x40]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_02152bc0
    mov r0, #0x28
    mla r1, r2, r0, r10
    mla r8, r9, r0, r10
    ldr r7, [r1, #0xdc]
    mov r6, #0x0
    mov r4, #0x200
    b .L_02152bb8
.L_02152b8c:
    add r0, r8, r6, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x0
    beq .L_02152bc0
    ldr r0, [r0, #0x4]
    ldr r2, [r7, #0x4]
    ldr r3, [r0, #0x0]
    mov r1, r4
    ldr r3, [r3, #0x160]
    blx r3
    add r6, r6, #0x1
.L_02152bb8:
    cmp r6, #0x4
    blt .L_02152b8c
.L_02152bc0:
    add r9, r9, #0x1
.L_02152bc4:
    ldrb r0, [r5, #0x2c]
    cmp r9, r0
    blt .L_02152a68
    ldr r6, [r10, #0x330]
    ldrb r1, [r10, #0x35d]
    ldr r2, [r6, #0x30]
    mov r0, #0x3c
    mla r9, r1, r0, r2
    ldrb r8, [r9, #0x2c]
    mov r1, #0x0
    add r0, sp, #0xbc
    b .L_02152bfc
.L_02152bf4:
    str r1, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
.L_02152bfc:
    cmp r1, r8
    blt .L_02152bf4
    sub r5, r8, #0x1
    mov r2, #0x0
    add r1, sp, #0xbc
    b .L_02152c8c
.L_02152c14:
    ldr r11, [r1, r2, lsl #0x2]
    ldr r7, [r6, #0x34]
    add r0, r9, r11
    ldrb ip, [r0, #0x2d]
    mov r0, #0x48
    add r4, r2, #0x1
    mla r3, ip, r0, r7
    b .L_02152c80
.L_02152c34:
    ldr r0, [r1, r4, lsl #0x2]
    mov ip, #0x48
    str r0, [sp, #0x34]
    add r0, r9, r0
    ldrb r0, [r0, #0x2d]
    ldrsh lr, [r3, #0x2e]
    mla ip, r0, ip, r7
    ldrsh r0, [ip, #0x2e]
    cmp lr, r0
    bge .L_02152c7c
    str r11, [r1, r4, lsl #0x2]
    ldr r11, [sp, #0x34]
    mov r0, r11
    str r0, [r1, r2, lsl #0x2]
    add r0, r9, r11
    ldrb ip, [r0, #0x2d]
    mov r0, #0x48
    mla r3, ip, r0, r7
.L_02152c7c:
    add r4, r4, #0x1
.L_02152c80:
    cmp r4, r8
    blt .L_02152c34
    add r2, r2, #0x1
.L_02152c8c:
    cmp r2, r5
    blt .L_02152c14
    mov r5, #0x84
    mov r6, #0x0
    add r4, r10, #0xd8
    b .L_02152d1c
.L_02152ca4:
    add r0, sp, #0xbc
    ldr r2, [r0, r6, lsl #0x2]
    mov r0, #0x28
    mul r3, r2, r0
    mov r1, r5, lsl #0xc
    str r1, [sp, #0x64]
    ldr r0, [r4, r3]
    add r1, sp, #0x64
    add r7, r4, r3
    bl func_ov002_0214d650
    mov r8, #0x0
.L_02152cd0:
    add r1, r7, r8, lsl #0x2
    ldr r0, [r1, #0x4]
    cmp r0, #0x0
    beq .L_02152d08
    mov r11, r5, lsl #0xc
    str r11, [sp, #0x60]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x60
    bl func_ov002_0214d650
    str r11, [sp, #0x5c]
    add r0, r7, r8, lsl #0x2
    ldr r0, [r0, #0x14]
    add r1, sp, #0x5c
    bl func_ov002_0214d650
.L_02152d08:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r5, r5, #0x1
    blt .L_02152cd0
    add r6, r6, #0x1
.L_02152d1c:
    ldrb r0, [r9, #0x2c]
    cmp r6, r0
    blt .L_02152ca4
    ldr r0, .L_02152ebc
    mvn r1, #0x0
    str r1, [r0, #0x0]
    ldr r1, [r10, #0x10]
    mov r0, r10
    bl func_ov002_0214d808
    mov r1, #0x0
    mov r7, r0
    bl func_ov002_021506bc
    mov r5, #0x1
    ldr r6, .L_02152f10
    mov r9, #0x0
    mov r4, #0x41000
    mov r11, r5
.L_02152d60:
    bl func_0203b3e4
    mov r1, #0x28
    mul r8, r9, r1
    ldr r1, [r0, #0x88]
    mov r0, r10
    str r1, [sp, #0x0]
    add r1, r6, r8
    mov r2, r7
    mov r3, #0x60
    bl func_ov002_0214da4c
    add r3, r10, r9, lsl #0x2
    add r1, r6, r8
    str r0, [r3, #0x50]
    ldr r2, [r1, #0x24]
    cmp r2, #0x0
    beq .L_02152db0
    ldr r0, [r3, #0x50]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6760
.L_02152db0:
    add r2, r10, r9, lsl #0x2
    ldr r0, [r2, #0x50]
    add r1, sp, #0x68
    ldr r0, [r0, #0x4]
    strb r5, [r0, #0xaa]
    str r4, [sp, #0x68]
    ldr r0, [r2, #0x50]
    bl func_ov002_0214d650
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x50]
    add r9, r9, #0x1
    ldr r0, [r0, #0x4]
    cmp r9, #0x1
    strb r11, [r0, #0xb1]
    ble .L_02152d60
    ldr r0, [r10, #0x50]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldr r0, [r10, #0x54]
    mov r1, #0x80
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldr r0, .L_02152f14
    ldr r0, [r0, #0x8d8]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02152e50
    ldr r0, [r10, #0x54]
    ldr r1, .L_02152f18
    ldr r0, [r0, #0x4]
    blx func_ov012_021b400c
    ldr r0, [r10, #0x54]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_02152e50:
    str r7, [r10, #0x1c]
    ldr r0, [r10, #0x330]
    ldr r1, [r10, #0x10]
    mov r2, #0x0
    bl func_ov002_02155940
    ldr r1, .L_02152f1c
    str r0, [r10, #0x33c]
    str r1, [r0, #0x1c]
    str r10, [r0, #0x20]
    add sp, sp, #0x1f8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02152e7c: .word data_ov002_0215c328
.L_02152e80: .word data_ov002_0215c334
.L_02152e84: .word data_ov002_0215cba4
.L_02152e88: .word 0x12001
.L_02152e8c: .word 0x12014
.L_02152e90: .word 0xa01000
.L_02152e94: .word 0x11002
.L_02152e98: .word data_ov002_0215bfc0
.L_02152e9c: .word data_ov002_0215c1a0
.L_02152ea0: .word 0x1de
.L_02152ea4: .word func_ov002_02153084
.L_02152ea8: .word func_ov002_0215313c
.L_02152eac: .word func_ov002_021530e0
.L_02152eb0: .word func_ov002_0214d434
.L_02152eb4: .word 0x31305053
.L_02152eb8: .word 0x8df
.L_02152ebc: .word data_ov012_021d5154
.L_02152ec0: .word data_ov002_0215cc08
.L_02152ec4: .word data_ov002_0215c1b8
.L_02152ec8: .word data_ov002_0215c1c0
.L_02152ecc: .word data_ov002_0215c1c8
.L_02152ed0: .word data_ov002_0215c1d0
.L_02152ed4: .word data_ov002_0215c1b0
.L_02152ed8: .word func_ov002_02153e8c
.L_02152edc: .word func_ov002_02154558
.L_02152ee0: .word func_ov002_021543ac
.L_02152ee4: .word 0x4007b
.L_02152ee8: .word data_ov002_0215c228
.L_02152eec: .word func_ov002_02153eb0
.L_02152ef0: .word func_ov002_02154098
.L_02152ef4: .word 0x30078
.L_02152ef8: .word data_ov002_0215c31c
.L_02152efc: .word data_ov002_0215c008
.L_02152f00: .word data_ov002_0215c198
.L_02152f04: .word 0x2ef
.L_02152f08: .word 0x494c
.L_02152f0c: .word data_ov002_0215b034
.L_02152f10: .word data_ov002_0215c1d8
.L_02152f14: .word data_020b02b8
.L_02152f18: .word 0x510013
.L_02152f1c: .word func_ov002_02153e14
    arm_func_end func_ov002_0215202c

    .global func_ov002_02152f20
    arm_func_start func_ov002_02152f20
func_ov002_02152f20: ; 0x02152f20
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02152f44
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_02152f44:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x1
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02152f20

    .global func_ov002_02152f5c
    arm_func_start func_ov002_02152f5c
func_ov002_02152f5c: ; 0x02152f5c
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02152f80
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_02152f80:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x2
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02152f5c

    .global func_ov002_02152f98
    arm_func_start func_ov002_02152f98
func_ov002_02152f98: ; 0x02152f98
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02152fbc
    ldr r2, [r0, #0x0]
    mov r1, #0x8
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_02152fbc:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x8
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02152f98

    .global func_ov002_02152fd4
    arm_func_start func_ov002_02152fd4
func_ov002_02152fd4: ; 0x02152fd4
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02152ff8
    ldr r2, [r0, #0x0]
    mov r1, #0x4
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_02152ff8:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x4
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02152fd4

    .global func_ov002_02153010
    arm_func_start func_ov002_02153010
func_ov002_02153010: ; 0x02153010
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_0214d498
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02153010

    .global func_ov002_02153038
    arm_func_start func_ov002_02153038
func_ov002_02153038: ; 0x02153038
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02153058
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02153058:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02153038

    .global func_ov002_02153060
    arm_func_start func_ov002_02153060
func_ov002_02153060: ; 0x02153060
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    bne .L_0215307c
    ldr r0, [r0, #0xc]
    bl func_02036430
    mov r1, r0
.L_0215307c:
    mov r0, r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02153060

    .global func_ov002_02153084
    arm_func_start func_ov002_02153084
func_ov002_02153084: ; 0x02153084
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0203b404
    mov r1, #0xc4
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_021530dc
    mov r3, r4
    mov r1, #0x11000
    bl func_ov002_0214d53c
    mov r2, #0x30000
    add r1, sp, #0x8
    str r2, [sp, #0x8]
    bl func_ov002_0214f244
    mov r2, #0xc4000
    add r1, sp, #0x4
    mov r0, r4
    str r2, [sp, #0x4]
    bl func_ov002_0214d650
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_021530dc: .word 0x1100f
    arm_func_end func_ov002_02153084

    .global func_ov002_021530e0
    arm_func_start func_ov002_021530e0
func_ov002_021530e0: ; 0x021530e0
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_0203b404
    mov r1, #0x82
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02153138
    mov r3, r4
    mov r1, #0x11000
    bl func_ov002_0214d53c
    ldr ip, [r4, #0x4]
    mov r3, #0x0
    mov r2, #0x2
    strh r3, [ip, #0xbc]
    strh r2, [ip, #0xbe]
    sub r2, r3, #0x10000
    add r1, sp, #0x4
    str r2, [sp, #0x4]
    bl func_ov002_0214f244
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02153138: .word 0x11010
    arm_func_end func_ov002_021530e0

    .global func_ov002_0215313c
    arm_func_start func_ov002_0215313c
func_ov002_0215313c: ; 0x0215313c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldr r4, [r6, #0x4]
    mov r7, r1
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_02153168
    bl func_ov002_0214d498
    mov r5, r0
.L_02153168:
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_0215317c
    bl func_ov002_0214d498
.L_0215317c:
    cmp r7, #0x0
    beq .L_021531b0
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x14
    add r2, sp, #0x10
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x10]
    ldrsh r3, [r4, #0xa0]
    mov r0, r6
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x14]
    bl func_ov002_0214d4c0
    b .L_02153254
.L_021531b0:
    ldr r0, [r5, #0x4]
    mov r2, #0x48
    ldr r5, [r0, #0x10]
    ldr r3, [r0, #0x124]
    ldr r0, [r5, #0x330]
    ldr r1, .L_0215325c
    ldr r7, [r0, #0x34]
    mov r0, r6
    mla r7, r3, r2, r7
    bl func_ov002_02153010
    ldrb r1, [r7, #0x44]
    mov r7, r0
    cmp r1, #0x1
    bne .L_0215320c
    mov r2, #0x20000
    add r0, sp, #0xc
    add r1, r5, #0x344
    str r2, [sp, #0xc]
    bl func_ov002_02153260
    add r1, sp, #0xc
    mov r0, r7
    bl func_ov002_0214f244
    b .L_0215322c
.L_0215320c:
    mov r2, #0x30000
    add r0, sp, #0x8
    add r1, r5, #0x344
    str r2, [sp, #0x8]
    bl func_ov002_02153260
    add r1, sp, #0x8
    mov r0, r7
    bl func_ov002_0214f244
.L_0215322c:
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r0, r6
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov002_0214d4c0
.L_02153254:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215325c: .word 0x31305053
    arm_func_end func_ov002_0215313c

    .global func_ov002_02153260
    arm_func_start func_ov002_02153260
func_ov002_02153260: ; 0x02153260
    ldr r3, [r0, #0x0]
    ldr r1, [r1, #0x0]
    smull r1, r2, r3, r1
    mov r1, r1, lsr #0xc
    orr r1, r1, r2, lsl #0x14
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov002_02153260

    .global func_ov002_0215327c
    arm_func_start func_ov002_0215327c
func_ov002_0215327c: ; 0x0215327c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x40
    mov r10, r0
    ldr r2, [r10, #0x330]
    ldrb r3, [r10, #0x35d]
    ldr r4, [r2, #0x30]
    mov r2, #0x3c
    ldrb r1, [r10, #0x35c]
    mla r6, r3, r2, r4
    bl func_ov002_02153808
    mov r1, #0x28
    mla r2, r0, r1, r10
    ldr r4, [r2, #0xd8]
    ldr r0, [r10, #0xc]
    ldr r1, .L_02153574
    mov r2, #0x0
    bl func_ov002_02151454
    mov r1, #0x1000
    str r1, [sp, #0x20]
    mov r5, r0
    ldr r0, [r10, #0xc]
    add r1, sp, #0x20
    bl func_ov002_02151858
    ldr r1, .L_02153578
    mov r0, #0x0
    str r0, [sp, #0x14]
    add r0, sp, #0x24
    str r1, [sp, #0x18]
    str r1, [sp, #0x1c]
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    ldr r0, [r5, #0x4]
    add r1, sp, #0x24
    mov r2, #0x0
    bl func_02013c48
    ldr r0, [r10, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r10, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r10, #0x14]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r10, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r10, #0x18]
    bl func_ov002_02153588
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldrb r1, [r10, #0x35c]
    mov r0, r10
    bl func_ov002_02153b54
    ldr r0, [r10, #0x50]
    ldr r2, .L_0215357c
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r10, #0x28]
    mov r1, #0x11000
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r10, #0x28]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r10, #0x48]
    ldr r1, .L_02153580
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, .L_02153584
    add r1, sp, #0x10
    ldr r0, [r0, #0x54]
    str r0, [sp, #0x10]
    ldr r0, [r10, #0x44]
    bl func_ov002_0214ef60
    mov r2, #0x0
    add r1, sp, #0x30
    b .L_02153414
.L_02153408:
    add r0, r2, #0x1
    strb r2, [r1, r2]
    and r2, r0, #0xff
.L_02153414:
    ldrb r0, [r6, #0x2c]
    cmp r2, r0
    blo .L_02153408
    mov r2, #0x0
    add r1, sp, #0x30
    b .L_0215349c
.L_0215342c:
    ldrb r3, [r1, r2]
    ldr r4, [r10, #0x330]
    mov r0, #0x48
    add r3, r6, r3
    ldrb r5, [r3, #0x2d]
    ldr r3, [r4, #0x34]
    add r4, r2, #0x1
    mla r3, r5, r0, r3
    mov r5, r0
    b .L_0215348c
.L_02153454:
    ldrb r0, [r1, r4]
    ldr r9, [r10, #0x330]
    ldrsh r8, [r3, #0x2e]
    add r7, r6, r0
    ldrb r7, [r7, #0x2d]
    ldr r9, [r9, #0x34]
    mla r9, r7, r5, r9
    ldrsh r7, [r9, #0x2e]
    cmp r8, r7
    ldrltb r7, [r1, r2]
    movlt r3, r9
    strltb r0, [r1, r2]
    strltb r7, [r1, r4]
    add r4, r4, #0x1
.L_0215348c:
    ldrb r0, [r6, #0x2c]
    cmp r4, r0
    blt .L_02153454
    add r2, r2, #0x1
.L_0215349c:
    sub r0, r0, #0x1
    cmp r2, r0
    blt .L_0215342c
    mov r8, #0x0
    b .L_02153538
.L_021534b0:
    add r5, sp, #0x30
    ldrb r3, [r5, r8]
    mov r0, #0x28
    ldr r4, [r10, #0x330]
    mla r1, r3, r0, r10
    add r0, r6, r3
    ldrb r3, [r0, #0x2d]
    add r2, r8, #0x83
    ldr r4, [r4, #0x34]
    mov r2, r2, lsl #0xc
    mov r0, #0x48
    str r2, [sp, #0xc]
    mla r7, r3, r0, r4
    ldr r0, [r1, #0xd8]
    add r1, sp, #0xc
    bl func_ov002_0214d650
    mov r9, #0x0
    add r11, sp, #0x8
    mov r4, #0x28
    b .L_02153528
.L_02153500:
    ldrb r1, [r5, r8]
    add r0, r9, #0x95
    mov r2, r0, lsl #0xc
    mla r0, r1, r4, r10
    str r2, [sp, #0x8]
    add r0, r0, r9, lsl #0x2
    ldr r0, [r0, #0xdc]
    mov r1, r11
    bl func_ov002_0214d650
    add r9, r9, #0x1
.L_02153528:
    ldrb r0, [r7, #0x44]
    cmp r9, r0
    blt .L_02153500
    add r8, r8, #0x1
.L_02153538:
    ldrb r0, [r6, #0x2c]
    cmp r8, r0
    blt .L_021534b0
    mov r0, #0x83000
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x14]
    add r1, sp, #0x4
    bl func_ov002_0214d650
    mov r0, #0x95000
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x18]
    add r1, sp, #0x0
    bl func_ov002_0214d650
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02153574: .word 0x564d5049
.L_02153578: .word 0x999
.L_0215357c: .word func_ov002_02153da0
.L_02153580: .word 0x11002
.L_02153584: .word data_ov002_0215cba4
    arm_func_end func_ov002_0215327c

    .global func_ov002_02153588
    arm_func_start func_ov002_02153588
func_ov002_02153588: ; 0x02153588
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x154]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_0214ed94
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02153588

    .global func_ov002_021535b0
    arm_func_start func_ov002_021535b0
func_ov002_021535b0: ; 0x021535b0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    mov r10, r0
    ldr r2, [r10, #0x330]
    ldrb r3, [r10, #0x35d]
    ldr r4, [r2, #0x30]
    mov r2, #0x3c
    ldrb r1, [r10, #0x35c]
    mla r5, r3, r2, r4
    bl func_ov002_02153808
    mov r4, r0
    ldr r0, [r10, #0xc]
    ldr r1, .L_021537f4
    mov r2, #0x0
    bl func_ov002_02151454
    mov r1, #0x28
    mla r1, r4, r1, r10
    ldr r6, [r1, #0xdc]
    ldr r1, [r10, #0x330]
    mov r2, #0x1
    strb r2, [r1, #0x56]
    ldr r1, [r10, #0x14]
    mov r4, r0
    ldr r0, [r1, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r10, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r10, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, .L_021537f8
    add r1, sp, #0x20
    str r0, [sp, #0x20]
    ldr r0, [r10, #0xc]
    bl func_ov002_02151858
    mov r0, #0x0
    str r0, [sp, #0x14]
    mov r0, #0x1000
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    add r0, sp, #0x24
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    ldr r0, [r4, #0x4]
    add r1, sp, #0x24
    mov r2, #0x0
    bl func_02013c48
    ldr r0, [r10, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r10, #0x18]
    bl func_ov002_02153588
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldrb r1, [r10, #0x35c]
    mov r0, r10
    bl func_ov002_02153b54
    mov r0, #0x1000
    str r0, [r10, #0x344]
    ldr r0, [r10, #0x50]
    ldr r2, .L_021537fc
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r10, #0x28]
    ldr r1, .L_02153800
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r10, #0x28]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r10, #0x48]
    ldr r1, .L_02153804
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x7b000
    str r0, [sp, #0x10]
    ldr r0, [r10, #0x44]
    add r1, sp, #0x10
    bl func_ov002_0214ef60
    mov r7, #0x0
    mov r4, #0x95000
    mov r11, #0x28
    b .L_021537b8
.L_02153754:
    mla r9, r7, r11, r10
    add r0, r5, r7
    ldr r1, [r10, #0x330]
    ldrb r2, [r0, #0x2d]
    ldr r3, [r1, #0x34]
    mov r0, #0x48
    str r4, [sp, #0xc]
    mla r6, r2, r0, r3
    ldr r0, [r9, #0xd8]
    add r1, sp, #0xc
    bl func_ov002_0214d650
    mov r8, #0x0
    b .L_021537a8
.L_02153788:
    add r0, r8, #0x83
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x8]
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0xdc]
    add r1, sp, #0x8
    bl func_ov002_0214d650
    add r8, r8, #0x1
.L_021537a8:
    ldrb r0, [r6, #0x44]
    cmp r8, r0
    blt .L_02153788
    add r7, r7, #0x1
.L_021537b8:
    ldrb r0, [r5, #0x2c]
    cmp r7, r0
    blt .L_02153754
    mov r0, #0x95000
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x14]
    add r1, sp, #0x4
    bl func_ov002_0214d650
    mov r0, #0x83000
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x18]
    add r1, sp, #0x0
    bl func_ov002_0214d650
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021537f4: .word 0x564d5049
.L_021537f8: .word 0x999
.L_021537fc: .word func_ov002_02153de0
.L_02153800: .word 0x11001
.L_02153804: .word 0x11003
    arm_func_end func_ov002_021535b0

    .global func_ov002_02153808
    arm_func_start func_ov002_02153808
func_ov002_02153808: ; 0x02153808
    stmdb sp!, {r3, lr}
    ldrb lr, [r0, #0x35f]
    mov ip, #0x0
    mov r2, #0x28
    b .L_0215383c
.L_0215381c:
    mla r3, ip, r2, r0
    ldr r3, [r3, #0xd8]
    ldr r3, [r3, #0x4]
    ldr r3, [r3, #0x124]
    cmp r1, r3
    moveq r0, ip
    ldmeqia sp!, {r3, pc}
    add ip, ip, #0x1
.L_0215383c:
    cmp ip, lr
    blt .L_0215381c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02153808

    .global func_ov002_0215384c
    arm_func_start func_ov002_0215384c
func_ov002_0215384c: ; 0x0215384c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x330]
    ldrb r1, [r5, #0x35c]
    ldr r2, [r0, #0x34]
    mov r0, #0x48
    mla r6, r1, r0, r2
    mov ip, #0x0
    strb ip, [sp, #0x5]
    strb ip, [sp, #0x4]
    ldrb lr, [r6, #0x44]
    mov r4, #0x1
    mov r1, ip
    mvn r0, #0x0
    b .L_021538b0
.L_0215388c:
    add r2, r6, ip
    ldr r3, [r5, #0x330]
    ldrb r2, [r2, #0x38]
    ldr r3, [r3, #0x38]
    add ip, ip, #0x1
    add r2, r3, r2, lsl #0x6
    ldrsb r2, [r2, #0x2f]
    cmp r2, r0
    movne r4, r1
.L_021538b0:
    cmp ip, lr
    blt .L_0215388c
    cmp r4, #0x0
    beq .L_02153984
    ldr r0, [r5, #0x330]
    ldrb r1, [r0, #0x56]
    cmp r1, #0x0
    bne .L_021538f0
    ldrb r2, [r5, #0x35c]
    ldr r3, [r0, #0x34]
    mov r1, #0x48
    mla r1, r2, r1, r3
    add r2, sp, #0x5
    add r3, sp, #0x4
    bl func_ov002_0214dc3c
    b .L_02153908
.L_021538f0:
    ldrb r1, [r5, #0x35e]
    ldr r4, [r0, #0x38]
    add r2, sp, #0x5
    add r3, sp, #0x4
    add r1, r4, r1, lsl #0x6
    bl func_ov002_0214db0c
.L_02153908:
    ldr r0, .L_021539d0
    str r0, [sp, #0x0]
    ldrsb r0, [sp, #0x5]
    ldr r1, [r5, #0x2c]
    ldr r2, [r5, #0x30]
    ldr r3, [r5, #0x34]
    bl func_ov002_0214dcd8
    ldr r0, .L_021539d0
    str r0, [sp, #0x0]
    ldrsb r0, [sp, #0x4]
    ldr r1, [r5, #0x38]
    ldr r2, [r5, #0x3c]
    ldr r3, [r5, #0x40]
    bl func_ov002_0214dcd8
    ldrb r1, [sp, #0x5]
    ldrsb r0, [sp, #0x4]
    cmp r1, r0
    ldr r0, [r5, #0x44]
    moveq r1, #0x1
    ldr r0, [r0, #0x4]
    movne r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_021539c8
.L_02153984:
    mov r6, #0x1
.L_02153988:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0x28]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r6, r6, #0x1
    cmp r6, #0x8
    blt .L_02153988
    ldr r0, [r5, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_021539c8:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_021539d0: .word 0x12001
    arm_func_end func_ov002_0215384c

    .global func_ov002_021539d4
    arm_func_start func_ov002_021539d4
func_ov002_021539d4: ; 0x021539d4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    add r0, sp, #0x14
    mov r8, r3
    mov r9, r2
    bl func_ov002_021518d4
    ldrsh r0, [r8, #0x0]
    add r2, r10, #0x300
    sub r4, sp, #0x4
    strh r0, [r2, #0x54]
    ldrsh r0, [r8, #0x2]
    strh r0, [r2, #0x56]
    ldrh r1, [r8, #0x0]
    ldr r0, [r10, #0x338]
    strh r1, [r4, #0x0]
    ldrh r1, [r8, #0x2]
    strh r1, [r4, #0x2]
    ldrh r3, [r2, #0x58]
    ldr r1, [r4, #0x0]
    strh r3, [r4, #0x0]
    ldrh r2, [r2, #0x5a]
    strh r2, [r4, #0x2]
    ldr r2, [r4, #0x0]
    bl func_ov002_02156b74
    mov r5, #0x0
    mov r11, #0x28
    mov r4, #0x48
    b .L_02153ac4
.L_02153a48:
    mla r0, r5, r11, r10
    ldr r6, [r0, #0xd8]
    ldr r1, [r10, #0x330]
    ldr r0, [r6, #0x4]
    ldr r1, [r1, #0x34]
    ldr r0, [r0, #0x124]
    ldrsh r2, [r8, #0x0]
    mla r7, r0, r4, r1
    ldrsh r3, [r7, #0x2c]
    add r0, sp, #0x10
    mov r1, r9
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x10]
    bl func_ov002_02153260
    ldr r1, [sp, #0x10]
    add r0, sp, #0xc
    str r1, [sp, #0x14]
    ldrsh r3, [r7, #0x2e]
    ldrsh r2, [r8, #0x2]
    mov r1, r9
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xc]
    bl func_ov002_02153260
    ldr r2, [sp, #0xc]
    mov r0, r6
    add r1, sp, #0x14
    str r2, [sp, #0x18]
    bl func_ov002_0214f960
    add r5, r5, #0x1
.L_02153ac4:
    ldrb r0, [r10, #0x35f]
    cmp r5, r0
    blt .L_02153a48
    ldr r0, [r10, #0x8]
    ldr r1, .L_02153b4c
    mov r2, #0x0
    bl func_ov002_02151454
    mov r4, r0
    ldr r1, [r10, #0x8]
    add r0, sp, #0x0
    bl func_ov002_0214f9a4
    ldr r3, [sp, #0x0]
    add r1, sp, #0x8
    str r3, [sp, #0x4]
    ldr r0, [r10, #0x34c]
    add r2, sp, #0x4
    sub r0, r3, r0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x50]
    ldr r3, [r0, #0xc]
    str r3, [sp, #0x8]
    ldr r0, [r10, #0x348]
    sub r0, r3, r0
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x8]
    bl func_ov002_0214d4c0
    ldr r0, [r4, #0x4]
    ldr r1, .L_02153b50
    mov r2, #0x0
    bl func_02013c48
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02153b4c: .word 0x564d5049
.L_02153b50: .word data_02093c8c
    arm_func_end func_ov002_021539d4

    .global func_ov002_02153b54
    arm_func_start func_ov002_02153b54
func_ov002_02153b54: ; 0x02153b54
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    mov r10, r0
    ldr r0, [r10, #0x330]
    mov r2, #0x1000
    ldr r3, [r0, #0x34]
    mov r0, #0x48
    str r2, [sp, #0x10]
    mla r5, r1, r0, r3
    ldr r0, [r10, #0x338]
    add r1, sp, #0x10
    bl func_ov002_02153d28
    ldr r0, [r10, #0x14]
    bl func_ov002_02153588
    ldr r1, .L_02153d1c
    bl func_ov002_02153010
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_02153d20
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrb r0, [r5, #0x44]
    cmp r0, #0x1
    bne .L_02153be0
    mov r2, #0x20000
    add r1, sp, #0xc
    mov r0, r4
    str r2, [sp, #0xc]
    bl func_ov002_0214f244
    b .L_02153bf4
.L_02153be0:
    mov r2, #0x30000
    add r1, sp, #0x8
    mov r0, r4
    str r2, [sp, #0x8]
    bl func_ov002_0214f244
.L_02153bf4:
    add r0, sp, #0x24
    bl func_ov002_021518d4
    add r0, r10, #0x300
    ldrh r1, [r0, #0x54]
    ldrh r0, [r0, #0x56]
    mov r4, #0x0
    strh r1, [sp, #0x14]
    strh r0, [sp, #0x16]
    ldrsh r11, [sp, #0x14]
    ldrsh r8, [sp, #0x16]
    b .L_02153d08
.L_02153c20:
    mov r0, #0x28
    mla r9, r4, r0, r10
    ldr r0, [r9, #0xd8]
    ldr r2, [r10, #0x330]
    ldr r1, [r0, #0x4]
    ldr r3, [r2, #0x34]
    ldr r2, [r1, #0x124]
    mov r1, #0x48
    mla r5, r2, r1, r3
    ldrsh r2, [r5, #0x2c]
    add r1, sp, #0x24
    sub r2, r2, r11
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x24]
    ldrsh r2, [r5, #0x2e]
    sub r2, r2, r8
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x28]
    bl func_ov002_0214f960
    mov r6, #0x0
    b .L_02153cf8
.L_02153c74:
    sub r2, r0, #0x1
    ldr r0, .L_02153d24
    mov r1, #0x30
    mla r1, r2, r1, r0
    mov r0, #0xc
    add r2, r9, r6, lsl #0x2
    mla r1, r6, r0, r1
    ldr r0, [r2, #0xdc]
    ldr r7, [r2, #0xec]
    str r0, [sp, #0x4]
    add r0, r9, r6
    ldrb r0, [r0, #0xfc]
    str r0, [sp, #0x0]
    add r0, sp, #0x18
    bl func_ov002_0214fa00
    ldr r0, [sp, #0x4]
    add r1, sp, #0x18
    bl func_ov002_0214f960
    ldr r0, [sp, #0x0]
    mov r2, #0x0
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    add r3, r0, #0x30000
    ldr r0, [r7, #0x4]
    ldr r1, [r0, #0x10]
    add r1, r3, r1, lsl #0x4
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r6, r6, #0x1
.L_02153cf8:
    ldrb r0, [r5, #0x44]
    cmp r6, r0
    blt .L_02153c74
    add r4, r4, #0x1
.L_02153d08:
    ldrb r0, [r10, #0x35f]
    cmp r4, r0
    blt .L_02153c20
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02153d1c: .word 0x31305053
.L_02153d20: .word 0x1100f
.L_02153d24: .word data_ov002_0215c228
    arm_func_end func_ov002_02153b54

    .global func_ov002_02153d28
    arm_func_start func_ov002_02153d28
func_ov002_02153d28: ; 0x02153d28
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x0]
    mov r4, r1
    cmp r0, #0x0
    beq .L_02153d70
    ldr r1, [r0, #0x4]
    add r0, sp, #0x4
    ldr r1, [r1, #0x50]
    ldr r2, [r1, #0x0]
    ldr r2, [r2, #0x34]
    blx r2
    ldr r0, [r4, #0x0]
    add r1, sp, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x0]
    bl func_ov002_02151858
.L_02153d70:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_02153d28

    .global func_ov002_02153d78
    arm_func_start func_ov002_02153d78
func_ov002_02153d78: ; 0x02153d78
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x33c]
    bl func_ov002_02156280
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02153d78

    .global func_ov002_02153da0
    arm_func_start func_ov002_02153da0
func_ov002_02153da0: ; 0x02153da0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65bc
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    ldr r0, [r4, #0x0]
    ldr r1, .L_02153ddc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
.L_02153ddc: .word func_ov002_02151b38
    arm_func_end func_ov002_02153da0

    .global func_ov002_02153de0
    arm_func_start func_ov002_02153de0
func_ov002_02153de0: ; 0x02153de0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65cc
    mov r0, #0x7b
    mov r1, #0x1
    bl func_0207342c
    ldr r1, [r4, #0x330]
    mov r2, #0x0
    mov r0, r4
    strb r2, [r1, #0x56]
    bl func_ov002_0215327c
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02153de0

    .global func_ov002_02153e14
    arm_func_start func_ov002_02153e14
func_ov002_02153e14: ; 0x02153e14
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x330]
    mov r1, #0x1
    ldrb r0, [r0, #0x56]
    cmp r0, #0x0
    bne .L_02153e4c
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    b .L_02153e64
.L_02153e4c:
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
.L_02153e64:
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x330]
    bl func_ov002_0214e270
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02153e14

    .global func_ov002_02153e8c
    arm_func_start func_ov002_02153e8c
func_ov002_02153e8c: ; 0x02153e8c
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x7b
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov002_021535b0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02153e8c

    .global func_ov002_02153eb0
    arm_func_start func_ov002_02153eb0
func_ov002_02153eb0: ; 0x02153eb0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldr r1, [r6, #0x4]
    mov r0, #0x7b
    ldr r4, [r1, #0x10]
    ldr r2, [r1, #0x124]
    ldr r3, [r4, #0x330]
    mov r1, #0x2
    ldr r3, [r3, #0x38]
    add r5, r3, r2, lsl #0x6
    bl func_0207342c
    blx func_ov012_021b65bc
    ldr r0, [r4, #0x14]
    bl func_ov002_02153588
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x18]
    bl func_ov002_02153588
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r6
    bl func_ov002_02153588
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x18]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0xc]
    ldr r1, .L_02154060
    mov r2, #0x0
    bl func_ov002_02151454
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x9c]
    blx r2
    mov r0, #0x3000
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    add r0, sp, #0xc
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov002_0214e39c
    ldr r0, [r7, #0x4]
    add r1, sp, #0xc
    mov r2, #0x0
    bl func_02013c48
    mov r0, #0x4
    bl func_ov002_02154068
    blx func_ov012_021b65cc
    ldrsb ip, [r5, #0x2f]
    mvn r0, #0x0
    cmp ip, r0
    bne .L_02154018
    ldr r2, [r6, #0x4]
    ldr r1, [r4, #0x330]
    ldr r2, [r2, #0x124]
    strb r2, [r1, #0x53]
    ldrsb r2, [r5, #0x2e]
    cmp r2, r0
    beq .L_02153ff8
    ldr r0, .L_02154064
    mov r1, r2, lsr #0x5
    ldr r0, [r0, r1, lsl #0x2]
    and r1, r2, #0x1f
    mov r2, #0x1
    tst r0, r2, lsl r1
    beq .L_02154008
.L_02153ff8:
    ldr r0, [r4, #0x330]
    mov r1, #0x2
    bl func_ov002_0214d348
    b .L_02154058
.L_02154008:
    ldr r0, [r4, #0x330]
    mov r1, #0x5
    bl func_ov002_0214d348
    b .L_02154058
.L_02154018:
    ldr r3, [r4, #0x330]
    mov r0, #0x48
    ldr r1, [r3, #0x34]
    ldrb r2, [r3, #0x51]
    mla r0, ip, r0, r1
    ldrb r0, [r0, #0x42]
    mov r1, #0x3
    strb r2, [r3, #0x50]
    strb r0, [r3, #0x51]
    ldrsb r2, [r5, #0x2f]
    ldr r0, [r4, #0x330]
    strb r2, [r0, #0x52]
    ldrsb r0, [r5, #0x2f]
    strb r0, [r4, #0x35c]
    ldr r0, [r4, #0x330]
    bl func_ov002_0214d348
.L_02154058:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02154060: .word 0x564d5049
.L_02154064: .word data_020b0cd4
    arm_func_end func_ov002_02153eb0

    .global func_ov002_02154068
    arm_func_start func_ov002_02154068
func_ov002_02154068: ; 0x02154068
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_02154094
    b .L_02154088
.L_0215407c:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_02154088:
    cmp r5, r6
    blo .L_0215407c
    ldmia sp!, {r4, r5, r6, pc}
.L_02154094: .word data_020a0e18
    arm_func_end func_ov002_02154068

    .global func_ov002_02154098
    arm_func_start func_ov002_02154098
func_ov002_02154098: ; 0x02154098
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r2, #0x48
    ldr r4, [r0, #0x10]
    ldr r1, [r0, #0x124]
    ldr r3, [r4, #0x330]
    mov r0, r4
    ldr r5, [r3, #0x38]
    ldr r3, [r3, #0x34]
    add r5, r5, r1, lsl #0x6
    ldrb r1, [r5, #0x2c]
    mla r6, r1, r2, r3
    bl func_ov002_02153808
    mov r1, #0x28
    mla r1, r0, r1, r4
    ldr r0, [r1, #0xd8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldrb r0, [r5, #0x2c]
    strb r0, [r4, #0x35c]
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x124]
    strb r0, [r4, #0x35e]
    ldr r0, [r4, #0x20]
    bl func_ov002_02154354
    ldr r0, [r4, #0x20]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, #0x18000
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x20]
    add r1, sp, #0x14
    bl func_ov002_0214ef60
    ldr r0, [r4, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r5
    bl func_ov002_0214dfa8
    mov r1, r0
    ldr r0, [r4, #0x4c]
    mov r2, #0x0
    ldr r0, [r0, #0x4]
    bl func_02023894
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrh r0, [r6, #0x2c]
    mov r2, #0x0
    strh r0, [sp, #0x18]
    ldrh r0, [r6, #0x2e]
    strh r0, [sp, #0x1a]
    ldrb r3, [r6, #0x44]
    b .L_02154224
.L_021541a0:
    add r1, r6, r2
    ldr r0, [r7, #0x4]
    ldrb r1, [r1, #0x38]
    ldr r0, [r0, #0x124]
    cmp r1, r0
    bne .L_02154220
    ldrb r3, [r6, #0x44]
    mov r1, #0xc
    ldr r0, .L_0215434c
    sub r5, r3, #0x1
    mov r3, #0x30
    mul r1, r2, r1
    mla r2, r5, r3, r0
    ldrsh r7, [sp, #0x18]
    ldr r2, [r1, r2]
    ldrsh r5, [sp, #0x1a]
    add r7, r2, r7, lsl #0xc
    mov r2, r7, asr #0xb
    add r2, r7, r2, lsr #0x14
    mov r2, r2, asr #0xc
    strh r2, [sp, #0x18]
    ldrb r2, [r6, #0x44]
    sub r2, r2, #0x1
    mla r0, r2, r3, r0
    add r0, r1, r0
    ldr r0, [r0, #0x4]
    add r1, r0, r5, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [sp, #0x1a]
    b .L_0215422c
.L_02154220:
    add r2, r2, #0x1
.L_02154224:
    cmp r2, r3
    blt .L_021541a0
.L_0215422c:
    ldr r0, [r4, #0x8]
    bl func_ov002_02154380
    mov r1, r0
    add r0, sp, #0x1c
    bl func_ov002_0214fa00
    ldr r1, [r4, #0x344]
    add r0, r4, #0x300
    rsb r1, r1, #0x0
    str r1, [sp, #0xc]
    ldrsh r1, [r0, #0x54]
    ldrsh r2, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    add r0, sp, #0x10
    sub r1, r2, r1
    add r2, r3, r1, lsl #0xc
    add r1, sp, #0xc
    str r2, [sp, #0x10]
    bl func_ov002_02153260
    ldr r0, [sp, #0x10]
    ldrsh r3, [sp, #0x1a]
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x344]
    ldr r5, [sp, #0x20]
    rsb r0, r0, #0x0
    str r0, [sp, #0x4]
    add r0, r4, #0x300
    ldrsh r2, [r0, #0x56]
    add r0, sp, #0x8
    add r1, sp, #0x4
    sub r2, r3, r2
    add r2, r5, r2, lsl #0xc
    str r2, [sp, #0x8]
    bl func_ov002_02153260
    ldr r1, [sp, #0x8]
    add r0, r4, #0x348
    str r1, [sp, #0x20]
    add r1, sp, #0x1c
    bl func_ov002_02154390
    ldr r0, [r4, #0x8]
    ldr r1, .L_02154350
    mov r2, #0x0
    bl func_ov002_02151454
    ldr r0, [r0, #0x4]
    add r1, sp, #0x1c
    mov r2, #0x0
    bl func_02013c48
    add r2, r4, #0x300
    ldrsh r1, [r2, #0x58]
    ldr r0, [sp, #0x1c]
    mov r3, #0x1000
    rsb r1, r0, r1, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [r2, #0x58]
    ldrsh r5, [r2, #0x5a]
    ldr r1, [sp, #0x20]
    mov r0, r4
    rsb r5, r1, r5, lsl #0xc
    mov r1, r5, asr #0xb
    add r1, r5, r1, lsr #0x14
    mov r1, r1, asr #0xc
    strh r1, [r2, #0x5a]
    str r3, [sp, #0x0]
    ldrb r1, [r4, #0x35c]
    add r2, sp, #0x0
    add r3, sp, #0x18
    bl func_ov002_021539d4
    mov r0, r4
    bl func_ov002_0215384c
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215434c: .word data_ov002_0215c228
.L_02154350: .word 0x564d5049
    arm_func_end func_ov002_02154098

    .global func_ov002_02154354
    arm_func_start func_ov002_02154354
func_ov002_02154354: ; 0x02154354
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x4]
    ldr r0, [r4, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02154354

    .global func_ov002_02154380
    arm_func_start func_ov002_02154380
func_ov002_02154380: ; 0x02154380
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x50]
    add r0, r0, #0xc
    bx lr
    arm_func_end func_ov002_02154380

    .global func_ov002_02154390
    arm_func_start func_ov002_02154390
func_ov002_02154390: ; 0x02154390
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov002_02154390

    .global func_ov002_021543ac
    arm_func_start func_ov002_021543ac
func_ov002_021543ac: ; 0x021543ac
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    ldr r0, [r0, #0x4]
    mov r2, #0x48
    ldr r4, [r0, #0x10]
    ldr r6, [r0, #0x124]
    ldr r1, [r4, #0x330]
    mov r0, r4
    ldr r3, [r1, #0x34]
    and r1, r6, #0xff
    strb r6, [r4, #0x35c]
    mla r5, r6, r2, r3
    bl func_ov002_02153808
    mov r1, #0x28
    mul r6, r0, r1
    add r7, r4, #0xdc
    ldr r0, [r7, r6]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r1, [r7, r6]
    add r0, sp, #0x10
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x124]
    strb r1, [r4, #0x35e]
    bl func_ov002_021518d4
    add r0, r4, #0x300
    ldrsh r3, [r0, #0x54]
    ldrsh r2, [r5, #0x2c]
    add r0, sp, #0xc
    add r1, r4, #0x344
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xc]
    bl func_ov002_02153260
    ldr r1, [sp, #0xc]
    add r0, r4, #0x300
    str r1, [sp, #0x10]
    ldrsh r3, [r0, #0x56]
    ldrsh r2, [r5, #0x2e]
    add r0, sp, #0x8
    add r1, r4, #0x344
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x8]
    bl func_ov002_02153260
    ldr r1, [sp, #0x8]
    add r0, r4, #0x348
    str r1, [sp, #0x14]
    add r1, sp, #0x10
    bl func_ov002_02154390
    ldr r0, [r4, #0x8]
    ldr r1, .L_02154550
    mov r2, #0x0
    bl func_ov002_02151454
    ldr r0, [r0, #0x4]
    add r1, sp, #0x10
    mov r2, #0x0
    bl func_02013c48
    add r1, r4, #0x300
    ldrsh r2, [r1, #0x58]
    ldr r0, [sp, #0x10]
    rsb r2, r0, r2, lsl #0xc
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [r1, #0x58]
    ldrsh r2, [r1, #0x5a]
    ldr r0, [sp, #0x14]
    rsb r2, r0, r2, lsl #0xc
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r2, r0, asr #0xc
    strh r2, [r1, #0x5a]
    ldr r0, .L_02154554
    add r2, sp, #0x4
    str r0, [sp, #0x4]
    ldrb r1, [r4, #0x35c]
    mov r0, r4
    add r3, r5, #0x2c
    bl func_ov002_021539d4
    ldr r0, [r4, #0x20]
    bl func_ov002_02154354
    ldr r0, [r4, #0x20]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, #0x8000
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x20]
    add r1, sp, #0x0
    bl func_ov002_0214ef60
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_ov002_0215384c
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02154550: .word 0x564d5049
.L_02154554: .word 0x999
    arm_func_end func_ov002_021543ac

    .global func_ov002_02154558
    arm_func_start func_ov002_02154558
func_ov002_02154558: ; 0x02154558
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, [r0, #0x4]
    mov r6, #0x0
    ldr r4, [r1, #0x10]
    ldr r1, [r1, #0x124]
    mov r0, #0x3c
    strb r1, [r4, #0x35c]
    ldr r2, [r4, #0x330]
    ldrb r1, [r4, #0x35d]
    ldr r2, [r2, #0x30]
    mov r11, r6
    mla r5, r1, r0, r2
    b .L_021545fc
.L_0215458c:
    add r9, r5, r6
    ldr r0, [r4, #0x330]
    ldrb r2, [r9, #0x2d]
    ldr r3, [r0, #0x34]
    mov r1, #0x28
    mov r0, #0x48
    mla r7, r2, r0, r3
    mla r10, r6, r1, r4
    mov r8, r11
    b .L_021545ec
.L_021545b4:
    ldrb r1, [r4, #0x35c]
    ldrb r0, [r9, #0x2d]
    cmp r1, r0
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0xdc]
    bne .L_021545dc
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    bl func_02023820
    b .L_021545e8
.L_021545dc:
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    bl func_02023820
.L_021545e8:
    add r8, r8, #0x1
.L_021545ec:
    ldrb r0, [r7, #0x44]
    cmp r8, r0
    blt .L_021545b4
    add r6, r6, #0x1
.L_021545fc:
    ldrb r0, [r5, #0x2c]
    cmp r6, r0
    blt .L_0215458c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov002_02154558

    .global func_ov002_0215460c
    arm_func_start func_ov002_0215460c
func_ov002_0215460c: ; 0x0215460c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215467c
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0xc]
    bl func_ov002_02151454
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x330]
    ldrb r0, [r0, #0x56]
    cmp r0, #0x0
    bne .L_0215465c
    mov r0, r4
    bl func_ov002_02154680
.L_0215465c:
    mov r0, #0x1000
    str r0, [sp, #0x0]
    ldr r0, [r4, #0xc]
    add r1, sp, #0x0
    bl func_ov002_02151858
    ldr r0, [r5, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, pc}
.L_0215467c: .word 0x564d5049
    arm_func_end func_ov002_0215460c

    .global func_ov002_02154680
    arm_func_start func_ov002_02154680
func_ov002_02154680: ; 0x02154680
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    mov r10, r0
    ldr r0, [r10, #0x330]
    ldrb r1, [r10, #0x35d]
    ldr r2, [r0, #0x30]
    mov r0, #0x3c
    mla r5, r1, r0, r2
    mov r6, #0x0
    b .L_02154808
.L_021546a8:
    add r0, r5, r6
    ldr r2, [r10, #0x330]
    ldrb r1, [r0, #0x2d]
    ldr r2, [r2, #0x34]
    mov r0, #0x48
    mla r8, r1, r0, r2
    add r0, sp, #0x18
    bl func_ov002_021518d4
    add r0, r10, #0x300
    ldrsh r1, [r8, #0x2c]
    ldrsh r0, [r0, #0x54]
    sub r0, r1, r0
    bl func_0200c954
    mov r1, r0
    ldr r0, .L_021548d0
    bl func_0200c9e4
    mov r1, r0
    ldr r0, .L_021548d4
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x18]
    add r0, r10, #0x300
    ldrsh r0, [r0, #0x56]
    ldrsh r1, [r8, #0x2e]
    sub r0, r1, r0
    bl func_0200c954
    mov r1, r0
    ldr r0, .L_021548d0
    bl func_0200c9e4
    mov r1, r0
    ldr r0, .L_021548d4
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x1c]
    mov r0, #0x28
    mla r9, r6, r0, r10
    ldr r0, [r9, #0xd8]
    add r1, sp, #0x18
    bl func_ov002_0214f960
    mov r7, #0x0
    ldr r4, .L_021548d8
    mov r11, #0xc
    b .L_021547f8
.L_02154754:
    sub r1, r0, #0x1
    mov r0, #0x30
    mla r0, r1, r0, r4
    mla r1, r7, r11, r0
    add r0, sp, #0xc
    bl func_ov002_0214fa00
    ldr r0, [sp, #0xc]
    bl func_0200c954
    ldr r1, .L_021548d0
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x10]
    bl func_0200c954
    ldr r1, .L_021548d0
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x10]
    add r0, r9, r7, lsl #0x2
    ldr r0, [r0, #0xec]
    add r1, r9, r7
    ldrb r3, [r1, #0xfc]
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    mov r3, r3, lsl #0x1
    ldr r1, [r0, #0x10]
    add r3, r3, #0x30000
    add r1, r3, r1, lsl #0x4
    bl func_02023894
    add r0, r9, r7, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r0, r9, r7, lsl #0x2
    ldr r0, [r0, #0xdc]
    add r1, sp, #0xc
    bl func_ov002_0214f960
    add r7, r7, #0x1
.L_021547f8:
    ldrb r0, [r8, #0x44]
    cmp r7, r0
    blt .L_02154754
    add r6, r6, #0x1
.L_02154808:
    ldrb r0, [r5, #0x2c]
    cmp r6, r0
    blt .L_021546a8
    ldr r0, [r10, #0x330]
    ldrb r2, [r10, #0x35c]
    ldr r3, [r0, #0x34]
    mov r1, #0x48
    ldr r0, [r10, #0x14]
    mla r5, r2, r1, r3
    bl func_ov002_02153588
    ldr r1, .L_021548dc
    bl func_ov002_02153010
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_021548e0
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrb r0, [r5, #0x44]
    cmp r0, #0x1
    bne .L_02154884
    ldr r2, .L_021548e4
    add r1, sp, #0x8
    mov r0, r4
    str r2, [sp, #0x8]
    bl func_ov002_0214f244
    b .L_02154898
.L_02154884:
    ldr r2, .L_021548e8
    add r1, sp, #0x4
    mov r0, r4
    str r2, [sp, #0x4]
    bl func_ov002_0214f244
.L_02154898:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_021548ec
    add r1, sp, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r10, #0x338]
    bl func_ov002_02153d28
    ldr r0, .L_021548ec
    str r0, [r10, #0x344]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021548d0: .word 0x3f19999a
.L_021548d4: .word 0x45800000
.L_021548d8: .word data_ov002_0215c228
.L_021548dc: .word 0x31305053
.L_021548e0: .word 0x1100e
.L_021548e4: .word 0x13333
.L_021548e8: .word 0x1cccc
.L_021548ec: .word 0x999
    arm_func_end func_ov002_02154680

    .global func_ov002_021548f0
    arm_func_start func_ov002_021548f0
func_ov002_021548f0: ; 0x021548f0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xb8
    ldr r0, [r0, #0x4]
    mov r1, #0x3c
    ldr r7, [r0, #0x10]
    ldr r0, [r7, #0x330]
    ldrb r2, [r7, #0x35d]
    ldr r3, [r0, #0x30]
    ldr r0, [r7, #0x8]
    mla r11, r2, r1, r3
    bl func_ov002_02154380
    mov r1, r0
    add r0, sp, #0xac
    bl func_ov002_0214fa00
    ldr r0, [r7, #0x344]
    ldr r1, [sp, #0xac]
    str r0, [sp, #0x78]
    add r0, r7, #0x300
    ldrsh r4, [r0, #0x54]
    rsb r3, r1, #0x0
    add r0, sp, #0x74
    add r1, sp, #0x70
    add r2, sp, #0x78
    str r3, [sp, #0x70]
    bl func_ov002_02154e54
    add r1, sp, #0x74
    ldr r2, [r1, #0x0]
    ldr r1, [sp, #0xb0]
    add r2, r2, r4, lsl #0xc
    str r2, [sp, #0xac]
    add r0, r7, #0x300
    ldrsh r5, [r0, #0x56]
    rsb r1, r1, #0x0
    add r0, sp, #0x6c
    str r1, [sp, #0x68]
    add r1, sp, #0x68
    add r2, sp, #0x78
    bl func_ov002_02154e54
    add r0, sp, #0x6c
    ldr r0, [r0, #0x0]
    mov r4, #0x0
    add r0, r0, r5, lsl #0xc
    str r0, [sp, #0xb0]
    b .L_02154e38
.L_021549a0:
    mov r0, #0x28
    mul r3, r4, r0
    add r5, r7, #0xd8
    add r10, r11, r4
    ldr r1, [r7, #0x330]
    ldr r6, [r5, r3]
    ldrb r9, [r10, #0x2d]
    ldr r0, [r6, #0x4]
    ldr r8, [r1, #0x34]
    mov r1, #0x48
    ldr r2, [r0, #0x0]
    mla r8, r9, r1, r8
    ldr r2, [r2, #0xd8]
    mov r1, #0x1
    add r5, r5, r3
    blx r2
    ldrsh r0, [r8, #0x2e]
    ldr r1, [sp, #0xb0]
    sub r1, r1, r0, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r9, r0, asr #0xc
    cmp r9, #0x100
    bgt .L_02154e34
    mvn r0, #0xff
    cmp r9, r0
    blt .L_02154e34
    ldr r1, [r7, #0x330]
    ldrb r1, [r1, #0x56]
    cmp r1, #0x1
    ldreqb r2, [r7, #0x35c]
    ldreqb r1, [r10, #0x2d]
    cmpeq r2, r1
    bne .L_02154af0
    add r0, r0, #0xe0
    cmp r9, r0
    blt .L_02154af0
    cmp r9, #0x20
    bgt .L_02154af0
    mov r9, #0x0
    mov r10, #0x1000
    b .L_02154a60
.L_02154a48:
    str r10, [sp, #0x64]
    add r0, r5, r9, lsl #0x2
    ldr r0, [r0, #0x14]
    add r1, sp, #0x64
    bl func_ov002_02154e84
    add r9, r9, #0x1
.L_02154a60:
    ldrb r0, [r8, #0x44]
    cmp r9, r0
    blt .L_02154a48
    mov r2, #0x1000
    add r1, sp, #0x60
    mov r0, r6
    str r2, [sp, #0x60]
    bl func_ov002_02151858
    add r0, sp, #0xa0
    bl func_ov002_021518d4
    add r0, r7, #0x300
    ldrsh r2, [r0, #0x54]
    ldrsh r3, [r8, #0x2c]
    add r0, sp, #0x5c
    add r1, sp, #0x78
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x5c]
    bl func_ov002_02153260
    ldr r1, [sp, #0x5c]
    add r0, r7, #0x300
    str r1, [sp, #0xa0]
    ldrsh r2, [r0, #0x56]
    ldrsh r3, [r8, #0x2e]
    add r0, sp, #0x58
    add r1, sp, #0x78
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x58]
    bl func_ov002_02153260
    ldr r0, [sp, #0x58]
    add r1, sp, #0xa0
    str r0, [sp, #0xa4]
    mov r0, r6
    bl func_ov002_0214f960
    b .L_02154e34
.L_02154af0:
    cmp r9, #0x0
    ble .L_02154c0c
    rsb r10, r9, #0x1c0
    mov r0, r10
    bl func_0200c954
    ldr r1, .L_02154e4c
    bl func_0200c5ac
    mov r1, r0
    ldr r0, .L_02154e50
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x54]
    mov r0, r6
    add r1, sp, #0x54
    bl func_ov002_02151858
    add r0, sp, #0x94
    bl func_ov002_021518d4
    add r0, r7, #0x300
    ldrsh r5, [r0, #0x54]
    ldrsh r2, [r8, #0x2c]
    ldr r1, [sp, #0xac]
    mov r0, r10
    rsb r1, r1, r2, lsl #0xc
    str r1, [sp, #0x48]
    bl func_0200c954
    mov r2, r0
    add r0, sp, #0x4c
    add r1, sp, #0x48
    bl func_ov002_02154ea8
    add r0, sp, #0x4c
    ldr r9, [sp, #0xac]
    ldr r0, [r0, #0x0]
    mov r1, #0x1c0
    bl func_0200d12c
    add r0, r9, r0
    sub r0, r0, r5, lsl #0xc
    str r0, [sp, #0x50]
    add r0, sp, #0x50
    add r1, sp, #0x78
    bl func_ov002_02153260
    ldr r2, [sp, #0x50]
    add r1, r7, #0x300
    str r2, [sp, #0x94]
    ldrsh r5, [r1, #0x56]
    ldrsh r2, [r8, #0x2e]
    ldr r1, [sp, #0xb0]
    mov r0, r10
    rsb r1, r1, r2, lsl #0xc
    str r1, [sp, #0x3c]
    bl func_0200c954
    mov r2, r0
    add r0, sp, #0x40
    add r1, sp, #0x3c
    bl func_ov002_02154ea8
    add r0, sp, #0x40
    ldr r8, [sp, #0xb0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1c0
    bl func_0200d12c
    add r0, r8, r0
    sub r2, r0, r5, lsl #0xc
    add r0, sp, #0x44
    add r1, sp, #0x78
    str r2, [sp, #0x44]
    bl func_ov002_02153260
    ldr r2, [sp, #0x44]
    add r1, sp, #0x94
    mov r0, r6
    str r2, [sp, #0x98]
    bl func_ov002_0214f960
    b .L_02154e34
.L_02154c0c:
    bge .L_02154d84
    rsb r0, r9, #0x1c0
    str r0, [sp, #0x0]
    bl func_0200c954
    ldr r1, .L_02154e4c
    bl func_0200c5ac
    mov r1, r0
    ldr r0, .L_02154e50
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x38]
    mov r0, r6
    add r1, sp, #0x38
    bl func_ov002_02151858
    add r0, sp, #0x88
    bl func_ov002_021518d4
    add r0, r7, #0x300
    ldrsh r0, [r0, #0x54]
    str r0, [sp, #0x8]
    ldrsh r2, [r8, #0x2c]
    ldr r1, [sp, #0xac]
    ldr r0, [sp, #0x0]
    rsb r1, r1, r2, lsl #0xc
    str r1, [sp, #0x2c]
    bl func_0200c954
    mov r2, r0
    add r0, sp, #0x30
    add r1, sp, #0x2c
    bl func_ov002_02154ea8
    add r0, sp, #0x30
    ldr r10, [sp, #0xac]
    ldr r0, [r0, #0x0]
    mov r1, #0x1c0
    bl func_0200d12c
    add r1, r10, r0
    ldr r0, [sp, #0x8]
    sub r0, r1, r0, lsl #0xc
    str r0, [sp, #0x34]
    add r0, sp, #0x34
    add r1, sp, #0x78
    bl func_ov002_02153260
    ldr r2, [sp, #0x34]
    add r1, r7, #0x300
    str r2, [sp, #0x88]
    ldrsh r1, [r1, #0x56]
    ldr r0, [sp, #0x0]
    str r1, [sp, #0x4]
    ldrsh r2, [r8, #0x2e]
    ldr r1, [sp, #0xb0]
    rsb r1, r1, r2, lsl #0xc
    str r1, [sp, #0x20]
    bl func_0200c954
    mov r2, r0
    add r0, sp, #0x24
    add r1, sp, #0x20
    bl func_ov002_02154ea8
    add r0, sp, #0x24
    ldr r10, [sp, #0xb0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1c0
    bl func_0200d12c
    add r1, r10, r0
    ldr r0, [sp, #0x4]
    sub r2, r1, r0, lsl #0xc
    add r0, sp, #0x28
    add r1, sp, #0x78
    str r2, [sp, #0x28]
    bl func_ov002_02153260
    ldr r2, [sp, #0x28]
    add r1, sp, #0x88
    mov r0, r6
    str r2, [sp, #0x8c]
    bl func_ov002_0214f960
    mov r6, #0x0
    ldr r10, .L_02154e4c
    b .L_02154d74
.L_02154d3c:
    add r0, r9, #0x1c0
    bl func_0200c954
    mov r1, r10
    bl func_0200c5ac
    mov r1, r0
    add r0, r10, #0x1a00000
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x1c]
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0x14]
    add r1, sp, #0x1c
    bl func_ov002_02154e84
    add r6, r6, #0x1
.L_02154d74:
    ldrb r0, [r8, #0x44]
    cmp r6, r0
    blt .L_02154d3c
    b .L_02154e34
.L_02154d84:
    mov r9, #0x0
    mov r10, #0x1000
    b .L_02154da8
.L_02154d90:
    str r10, [sp, #0x18]
    add r0, r5, r9, lsl #0x2
    ldr r0, [r0, #0x14]
    add r1, sp, #0x18
    bl func_ov002_02154e84
    add r9, r9, #0x1
.L_02154da8:
    ldrb r0, [r8, #0x44]
    cmp r9, r0
    blt .L_02154d90
    mov r2, #0x1000
    add r1, sp, #0x14
    mov r0, r6
    str r2, [sp, #0x14]
    bl func_ov002_02151858
    add r0, sp, #0x7c
    bl func_ov002_021518d4
    add r0, r7, #0x300
    ldrsh r2, [r0, #0x54]
    ldrsh r3, [r8, #0x2c]
    add r0, sp, #0x10
    add r1, sp, #0x78
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x10]
    bl func_ov002_02153260
    ldr r1, [sp, #0x10]
    add r0, r7, #0x300
    str r1, [sp, #0x7c]
    ldrsh r2, [r0, #0x56]
    ldrsh r3, [r8, #0x2e]
    add r0, sp, #0xc
    add r1, sp, #0x78
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xc]
    bl func_ov002_02153260
    ldr r0, [sp, #0xc]
    add r1, sp, #0x7c
    str r0, [sp, #0x80]
    mov r0, r6
    bl func_ov002_0214f960
.L_02154e34:
    add r4, r4, #0x1
.L_02154e38:
    ldrb r0, [r11, #0x2c]
    cmp r4, r0
    blt .L_021549a0
    add sp, sp, #0xb8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02154e4c: .word 0x43e00000
.L_02154e50: .word 0x45800000
    arm_func_end func_ov002_021548f0

    .global func_ov002_02154e54
    arm_func_start func_ov002_02154e54
func_ov002_02154e54: ; 0x02154e54
    stmdb sp!, {r4, lr}
    ldr r1, [r1, #0x0]
    mov r4, r0
    mov r0, r1, lsl #0x6
    str r0, [r4, #0x0]
    ldr r2, [r2, #0x0]
    mov r1, r2, asr #0x5
    add r1, r2, r1, lsr #0x1a
    mov r1, r1, asr #0x6
    bl func_0200d12c
    str r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02154e54

    .global func_ov002_02154e84
    arm_func_start func_ov002_02154e84
func_ov002_02154e84: ; 0x02154e84
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xf8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02154e84

    .global func_ov002_02154ea8
    arm_func_start func_ov002_02154ea8
func_ov002_02154ea8: ; 0x02154ea8
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, [r1, #0x0]
    mov r5, r0
    mov r4, r2
    mov r0, r1
    str r1, [r5, #0x0]
    bl func_0200c954
    mov r1, r4
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [r5, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_02154ea8

    .global func_ov002_02154ed8
    arm_func_start func_ov002_02154ed8
func_ov002_02154ed8: ; 0x02154ed8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    ldr r0, [r0, #0x4]
    ldr r9, [r0, #0x10]
    ldr r0, [r9, #0x8]
    bl func_ov002_02154380
    mov r1, r0
    add r0, sp, #0x18
    bl func_ov002_0214fa00
    mov r0, #0x2d
    ldrb r4, [r9, #0x35c]
    ldrb r5, [r9, #0x35e]
    bl func_ov002_02154068
    mov r6, #0x0
    b .L_02155048
.L_02154f14:
    add r0, r9, r6
    ldrb r2, [r0, #0x366]
    mov r0, #0x28
    ldr r1, [r9, #0x330]
    mla r10, r2, r0, r9
    ldr r8, [r10, #0xd8]
    ldr r7, [r1, #0x34]
    ldr r1, [r8, #0x4]
    add r0, sp, #0x8
    ldr r11, [r1, #0x124]
    mov r3, #0x48
    mov r1, #0x0
    mov r2, #0x10
    mla r7, r11, r3, r7
    bl func_020517fc
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    mov r0, #0x1e
    bl func_ov002_02154068
    ldr r0, .L_02155088
    mov r8, #0x0
    sub r11, r0, #0x10000
    b .L_02155000
.L_02154f74:
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0xec]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r1, r10, r8, lsl #0x2
    ldr r1, [r1, #0xec]
    add r0, sp, #0x4
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x64]
    add r1, r1, #0x14
    bl func_020193f0
    ldr r0, [sp, #0x4]
    bl func_ov002_02153060
    bl func_ov002_02153038
    mov r1, #0x80
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x4]
    mov r1, #0x1
    ldrh r2, [r2, #0x8]
    mov r3, #0x9
    sub r2, r2, #0x1
    and r2, r2, #0xff
    bl func_0206ad90
    add r1, sp, #0x8
    str r0, [r1, r8, lsl #0x2]
    ldr r1, .L_02155088
    add r8, r8, #0x1
    strh r1, [r0, #0x16]
    mov r1, #0x10
    strb r1, [r0, #0x18]
    strb r1, [r0, #0x11]
    strb r11, [r0, #0x19]
.L_02155000:
    ldrb r0, [r7, #0x44]
    cmp r8, r0
    blt .L_02154f74
    mov r0, #0x7b
    mov r1, #0x5
    bl func_0207342c
    mov r0, #0x5a
    bl func_ov002_02154068
    mov r10, #0x0
    add r8, sp, #0x8
    b .L_02155038
.L_0215502c:
    ldr r0, [r8, r10, lsl #0x2]
    bl func_0206ae98
    add r10, r10, #0x1
.L_02155038:
    ldrb r0, [r7, #0x44]
    cmp r10, r0
    blt .L_0215502c
    add r6, r6, #0x1
.L_02155048:
    ldrb r0, [r9, #0x365]
    cmp r6, r0
    blt .L_02154f14
    strb r4, [r9, #0x35c]
    strb r5, [r9, #0x35e]
    ldr r0, [r9, #0x10]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldrb r1, [r9, #0x360]
    ldr r0, [r9, #0x330]
    strb r1, [r0, #0x56]
    ldr r0, [r9, #0x330]
    ldrb r1, [r0, #0x56]
    bl func_ov002_0214d348
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02155088: .word 0xffff
    arm_func_end func_ov002_02154ed8

    .global func_ov002_0215508c
    arm_func_start func_ov002_0215508c
func_ov002_0215508c: ; 0x0215508c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r5, #0x0
    b .L_02155174
.L_021550a0:
    mov r0, #0x28
    mla r8, r5, r0, r10
    ldr r0, [r8, #0xd8]
    ldr r1, [r0, #0x4]
    ldr r0, [r1, #0x90]
    and r0, r0, #0x8
    cmp r0, #0x8
    beq .L_02155170
    ldr r3, [r10, #0x330]
    ldr r1, [r1, #0x124]
    ldr r2, [r3, #0x34]
    mov r0, #0x48
    mla r6, r1, r0, r2
    ldrb r0, [r6, #0x43]
    cmp r0, #0x0
    beq .L_02155170
    ldrb r0, [r6, #0x38]
    ldr r2, [r3, #0x38]
    ldr r1, .L_02155258
    add r0, r2, r0, lsl #0x6
    ldrb r0, [r0, #0x31]
    add r1, r1, r0
    add r1, r1, #0x3000
    ldrb r1, [r1, #0xdcc]
    tst r1, #0x40
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne .L_02155170
    blx func_02071b28
    ldrb r1, [r10, #0x365]
    mov r7, #0x0
    mov r0, #0x1
    add r1, r10, r1
    strb r5, [r1, #0x366]
    ldrb r1, [r10, #0x365]
    mov r4, r7
    add r1, r1, #0x1
    strb r1, [r10, #0x365]
    strb r0, [r10, #0x364]
    b .L_02155164
.L_02155144:
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0xec]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r7, r7, #0x1
.L_02155164:
    ldrb r0, [r6, #0x44]
    cmp r7, r0
    blt .L_02155144
.L_02155170:
    add r5, r5, #0x1
.L_02155174:
    ldrb r0, [r10, #0x35f]
    cmp r5, r0
    blt .L_021550a0
    mov r4, #0x0
    mov r11, #0x28
    b .L_02155204
.L_0215518c:
    add r8, r10, r4
    ldrb r1, [r8, #0x366]
    add r6, r4, #0x1
    mla r0, r1, r11, r10
    ldr r5, [r0, #0xd8]
    b .L_021551f4
.L_021551a4:
    add r9, r10, r6
    ldrb r2, [r9, #0x366]
    mov r1, #0x28
    add r0, sp, #0x0
    mla r1, r2, r1, r10
    ldr r7, [r1, #0xd8]
    mov r1, r7
    bl func_ov002_0214f9a4
    add r0, sp, #0x4
    mov r1, r5
    bl func_ov002_0214f9a4
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x0]
    add r6, r6, #0x1
    cmp r1, r0
    ldrltb r1, [r8, #0x366]
    ldrltb r0, [r9, #0x366]
    movlt r5, r7
    strltb r0, [r8, #0x366]
    strltb r1, [r9, #0x366]
.L_021551f4:
    ldrb r0, [r10, #0x365]
    cmp r6, r0
    blt .L_021551a4
    add r4, r4, #0x1
.L_02155204:
    ldrb r0, [r10, #0x365]
    sub r0, r0, #0x1
    cmp r4, r0
    blt .L_0215518c
    ldrb r0, [r10, #0x364]
    cmp r0, #0x0
    beq .L_02155250
    ldr r0, [r10, #0x50]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r10, #0x54]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_02155250:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02155258: .word data_020b02b8
    arm_func_end func_ov002_0215508c

    .global func_ov002_0215525c
    arm_func_start func_ov002_0215525c
func_ov002_0215525c: ; 0x0215525c
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov002_0215525c

    .global func_ov002_02155278
    arm_func_start func_ov002_02155278
func_ov002_02155278: ; 0x02155278
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov002_02155278

    .global func_ov002_0215528c
    arm_func_start func_ov002_0215528c
func_ov002_0215528c: ; 0x0215528c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    ldr r1, .L_021553e0
    mov r4, r0
    ldr r2, .L_021553e4
    mov r0, #0x20
    mov r3, #0x47
    bl func_0201a21c
    movs r6, r0
    beq .L_021552bc
    bl func_ov002_021553f4
    mov r6, r0
.L_021552bc:
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x20
    bl func_020517fc
    str r4, [r6, #0x0]
    bl func_ov002_0215559c
    bl func_02026f94
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    bl func_020282f4
    str r5, [r6, #0x4]
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    ldr r0, .L_021553e8
    bl func_ov002_02156d08
    mov r1, #0x60000
    str r1, [sp, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x0]
    add r1, sp, #0x0
    add r2, sp, #0x4
    mov r4, r0
    bl func_ov002_0214d4c0
    mov r0, #0x60000
    str r0, [sp, #0xc]
    mov r0, #0x80000
    str r0, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    add r2, sp, #0xc
    bl func_ov002_02155884
    mov r0, #0x28
    str r0, [sp, #0x10]
    mov r0, r4
    add r1, sp, #0x10
    bl func_ov002_02151858
    str r4, [r6, #0xc]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x64]
    ldr r4, [r0, #0x20]
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    bne .L_02155390
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02155390:
    ldr r0, [r6, #0x0]
    ldr r1, .L_021553ec
    ldrb r2, [r0, #0x51]
    ldr r0, [r4, #0x38]
    ldr r4, [r1, r2, lsl #0x2]
    bl func_02034db8
    ldr r0, [r0, #0x4]
    mov r1, r4
    bl func_0201710c
    mov r0, #0x28
    str r0, [r6, #0x10]
    mov r0, #0x0
    str r0, [r6, #0x14]
    strb r0, [r6, #0x1c]
    ldr r0, [r5, #0x4]
    ldr r1, .L_021553f0
    bl func_02028384
    mov r0, r6
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021553e0: .word data_ov002_0215c3d4
.L_021553e4: .word data_ov002_0215c340
.L_021553e8: .word data_ov002_0215c3e4
.L_021553ec: .word data_ov002_0215c3a4
.L_021553f0: .word func_ov002_021558bc
    arm_func_end func_ov002_0215528c

    .global func_ov002_021553f4
    arm_func_start func_ov002_021553f4
func_ov002_021553f4: ; 0x021553f4
    mov r1, #0x0
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    bx lr
    arm_func_end func_ov002_021553f4

    .global func_ov002_02155408
    arm_func_start func_ov002_02155408
func_ov002_02155408: ; 0x02155408
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    ldr r1, .L_02155510
    mov r4, r0
    ldr r2, .L_02155514
    mov r0, #0x20
    mov r3, #0x62
    bl func_0201a21c
    movs r6, r0
    beq .L_02155438
    bl func_ov002_021553f4
    mov r6, r0
.L_02155438:
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x20
    bl func_020517fc
    str r4, [r6, #0x0]
    bl func_ov002_0215559c
    bl func_02026f94
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_02155518
    bl func_02028384
    ldr r0, [r5, #0x4]
    bl func_020282f4
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    ldr r0, .L_0215551c
    bl func_ov002_02156d08
    mov r1, #0x60000
    str r1, [sp, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x0]
    add r1, sp, #0x0
    add r2, sp, #0x4
    mov r4, r0
    bl func_ov002_0214d4c0
    mov r0, #0x60000
    str r0, [sp, #0xc]
    mov r0, #0x80000
    str r0, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    add r2, sp, #0xc
    bl func_ov002_02155884
    mov r0, #0x28
    str r0, [sp, #0x10]
    mov r0, r4
    add r1, sp, #0x10
    bl func_ov002_02151858
    str r4, [r6, #0xc]
    mov r0, #0x0
    str r0, [r6, #0x10]
    str r0, [r6, #0x14]
    str r5, [r6, #0x4]
    mov r0, #0x2
    strb r0, [r6, #0x1c]
    mov r0, r6
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02155510: .word data_ov002_0215c3d4
.L_02155514: .word data_ov002_0215c3b8
.L_02155518: .word func_ov002_021558bc
.L_0215551c: .word data_ov002_0215c3e4
    arm_func_end func_ov002_02155408

    .global func_ov002_02155520
    arm_func_start func_ov002_02155520
func_ov002_02155520: ; 0x02155520
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_0215552c:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_02155548
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02155548:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_0215552c
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_0215556c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215556c:
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_02155520

    .global func_ov002_02155578
    arm_func_start func_ov002_02155578
func_ov002_02155578: ; 0x02155578
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x7b
    mov r1, #0x3
    bl func_0207342c
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02155578

    .global func_ov002_0215559c
    arm_func_start func_ov002_0215559c
func_ov002_0215559c: ; 0x0215559c
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x28
    mov r0, #0x1
    bl func_02043264
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
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
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
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
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x10000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    bl func_ov002_02155808
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    add r1, sp, #0x18
    add r2, sp, #0x14
    add r3, sp, #0x10
    bl func_ov002_02155808
    add sp, sp, #0x28
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0215559c

    .global func_ov002_02155808
    arm_func_start func_ov002_02155808
func_ov002_02155808: ; 0x02155808
    stmdb sp!, {r4, lr}
    ldr r4, [r2, #0x0]
    ldr r2, [r1, #0x0]
    ldr r1, [r3, #0x0]
    rsb lr, r2, r2, lsl #0x5
    rsb ip, r4, r4, lsl #0x5
    rsb r4, r1, r1, lsl #0x5
    mov r2, lr, asr #0xb
    mov r3, ip, asr #0xb
    mov r1, r4, asr #0xb
    add r2, lr, r2, lsr #0x14
    add r3, ip, r3, lsr #0x14
    add r1, r4, r1, lsr #0x14
    mov r2, r2, lsl #0x4
    mov r3, r3, lsl #0x4
    mov r1, r1, lsl #0x4
    mov ip, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    mov r3, r1, lsr #0x10
    ldr r4, [r0, #0x4]
    and r1, ip, #0x1f
    mov r0, r2, lsl #0x1b
    mov r2, r3, lsl #0x1b
    orr r0, r1, r0, lsr #0x16
    orr r0, r0, r2, lsr #0x11
    orr r1, r0, #0x8000
    add r0, r4, #0x800
    strh r1, [r0, #0xb8]
    mov r0, #0x1
    strb r0, [r4, #0x8fc]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02155808

    .global func_ov002_02155884
    arm_func_start func_ov002_02155884
func_ov002_02155884: ; 0x02155884
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r3, [r2, #0x0]
    add r2, sp, #0x0
    str r3, [sp, #0x0]
    ldr r3, [r1, #0x0]
    add r1, sp, #0x4
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x4]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x124]
    blx r3
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02155884

    .global func_ov002_021558bc
    arm_func_start func_ov002_021558bc
func_ov002_021558bc: ; 0x021558bc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r4, #0x0
    ldr r5, [r0, #0x10]
    add r7, sp, #0x0
    ldr r0, [r5, #0x14]
    add r1, r0, #0x1c
    str r1, [r5, #0x14]
    ldr r0, [r5, #0x10]
    add r0, r0, r1
    str r0, [r5, #0x10]
.L_021558ec:
    add r2, r5, r4, lsl #0x2
    ldr r0, [r2, #0x8]
    cmp r0, #0x0
    beq .L_02155910
    ldr r0, [r5, #0x10]
    mov r1, r7
    str r0, [sp, #0x0]
    ldr r0, [r2, #0x8]
    bl func_ov002_02151858
.L_02155910:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_021558ec
    ldr r0, [r5, #0x10]
    cmp r0, #0x14000
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldrb r1, [r5, #0x1c]
    ldr r0, [r5, #0x0]
    bl func_ov002_0214d348
    ldr r0, [r6, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov002_021558bc

    .global func_ov002_02155940
    arm_func_start func_ov002_02155940
func_ov002_02155940: ; 0x02155940
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x44
    mov r4, r2
    mov r5, r0
    ldr r1, .L_02155ff4
    ldr r2, .L_02155ff8
    mov r0, #0x2c
    mov r3, #0x7d
    bl func_0201a21c
    mov r9, r0
    mov r1, #0x0
    mov r2, #0x2c
    bl func_020517fc
    str r5, [r9, #0x0]
    ldr r0, .L_02155ffc
    strb r4, [r9, #0x26]
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne .L_021559b8
    ldr r0, .L_02156000
    mov r4, #0x64
    mov r1, #0xb2
    mov r2, #0x2a
    mov r3, #0xf6
    str r4, [sp, #0x0]
    bl func_ov002_0214edbc
    ldr r0, .L_02155ffc
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
.L_021559b8:
    ldrb r0, [r9, #0x26]
    cmp r0, #0x0
    bne .L_021559cc
    bl func_0203b3e4
    b .L_021559d0
.L_021559cc:
    bl func_0203b3f4
.L_021559d0:
    ldr r0, [r0, #0x88]
    mov r3, #0x1
    ldr r1, [r0, #0x4]
    ldr r5, .L_02156004
    strb r3, [r1, #0x901]
    ldrsh r2, [r5, #0x0]
    add r4, r1, #0x800
    mov r6, #0x1f
    strh r2, [r4, #0xd8]
    ldrsh r7, [r5, #0x2]
    mov r1, #0x0
    mov r2, r1
    strh r7, [r4, #0xda]
    ldrsh r7, [r5, #0x4]
    strh r7, [r4, #0xdc]
    ldrsh r5, [r5, #0x6]
    strh r5, [r4, #0xde]
    ldr r4, [r0, #0x4]
    strb r3, [r4, #0x901]
    str r6, [r4, #0x8c8]
    ldr r4, [r0, #0x4]
    strb r3, [r4, #0x901]
    str r6, [r4, #0x8d4]
    ldr r4, [r0, #0x4]
    strb r3, [r4, #0x901]
    strb r1, [r4, #0x8fd]
    ldr r4, [r0, #0x4]
    strb r3, [r4, #0x8ff]
    strb r3, [r4, #0x901]
    bl func_ov002_0214ecc0
    ldrb r0, [r9, #0x26]
    cmp r0, #0x0
    bne .L_02155a68
    ldr r0, .L_02156008
    ldr r1, .L_0215600c
    ldr r2, .L_02156010
    bl func_ov002_02156110
    b .L_02155a78
.L_02155a68:
    ldr r0, .L_02156014
    ldr r1, .L_0215600c
    ldr r2, .L_02156010
    bl func_ov002_02156110
.L_02155a78:
    mov r4, r0
    mov r0, r4
    mov r1, #0x30
    mov r2, #0x3
    bl func_ov002_02156180
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x20
    blx func_ov012_021b3b7c
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x21
    blx func_ov012_021b3b7c
    ldr r0, [r4, #0x4]
    ldr r1, .L_02156018
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    movs r5, r0
    moveq r0, #0x0
    beq .L_02155af0
    ldr r1, [r5, #0x18]
    cmp r1, #0x0
    bne .L_02155aec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02155aec:
    ldr r0, [r5, #0x18]
.L_02155af0:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_02155b10
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_02155b10:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02155b2c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02155b2c:
    mov r0, #0x80
    str r0, [sp, #0x0]
    mov r2, #0x5
    ldr r0, [r5, #0x18]
    mov r3, r2
    mov r1, #0x11
    bl func_0206ad90
    mov r2, #0x0
    ldr r1, .L_0215601c
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    str r0, [r9, #0x18]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldrb r0, [r9, #0x26]
    cmp r0, #0x0
    mov r0, #0x1
    bne .L_02155ba4
    bl func_0203b414
    ldr r1, [r0, #0x88]
    ldr r0, .L_02156020
    bl func_ov002_02156d08
    b .L_02155bb4
.L_02155ba4:
    bl func_0203b424
    ldr r1, [r0, #0x88]
    ldr r0, .L_02156020
    bl func_ov002_02156d08
.L_02155bb4:
    ldr r2, .L_02156024
    str r0, [r9, #0x14]
    mov r3, #0x20
    mov r0, r9
    mov r1, #0x0
    str r3, [r2, #0x0]
    bl func_ov002_0214d808
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    mov r0, #0x2000
    str r0, [sp, #0x4]
    add r1, sp, #0x4
    mov r0, r8
    bl func_ov002_0214d650
    ldr r0, [r8, #0x4]
    ldr r2, .L_02156028
    mov r1, #0x20
    blx func_ov012_021b6760
    ldr r0, [r8, #0x4]
    ldr r2, .L_0215602c
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, .L_02156024
    mov r1, #0x21
    ldr r6, .L_02156030
    mov r7, #0x0
    str r1, [r0, #0x0]
    mov r4, #0x2000
    mov r11, #0x18
.L_02155c44:
    mla r10, r7, r11, r6
    mov r0, r9
    mov r1, r8
    mov r2, r10
    add r3, r10, #0xc
    bl func_ov002_0214d8fc
    add r1, sp, #0x8
    mov r5, r0
    str r4, [sp, #0x8]
    bl func_ov002_0214d650
    add r0, r9, r7, lsl #0x2
    str r5, [r0, #0x8]
    ldr r0, [r5, #0x4]
    ldr r2, [r10, #0x14]
    mov r1, #0x4
    blx func_ov012_021b65e8
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_02155c44
    mov r4, #0x0
.L_02155c94:
    cmp r4, #0x0
    bne .L_02155cb0
    add r0, r9, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r1, [r9, #0x10]
    bl func_ov002_02152f20
    b .L_02155cc0
.L_02155cb0:
    add r1, r9, r4, lsl #0x2
    ldr r0, [r1, #0x8]
    ldr r1, [r1, #0x4]
    bl func_ov002_02152f20
.L_02155cc0:
    cmp r4, #0x2
    bne .L_02155cdc
    add r0, r9, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r1, [r9, #0x8]
    bl func_ov002_02152f5c
    b .L_02155cec
.L_02155cdc:
    add r1, r9, r4, lsl #0x2
    ldr r0, [r1, #0x8]
    ldr r1, [r1, #0xc]
    bl func_ov002_02152f5c
.L_02155cec:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_02155c94
    ldr r0, .L_02156034
    ldr r2, .L_02156038
    ldr r3, [r0, #0x0]
    mov r0, r9
    mov r1, r8
    bl func_ov002_0214d8fc
    mov r2, #0x2000
    add r1, sp, #0xc
    mov r4, r0
    str r2, [sp, #0xc]
    bl func_ov002_0214d650
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215603c
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023820
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    str r8, [r9, #0x4]
    ldr r0, [r8, #0x4]
    bl func_02023940
    ldr r4, [r8, #0x4]
    ldr r0, .L_02156040
    bl func_020326b0
    mov r3, r0
    mov r0, r4
    ldr r4, [r0, #0x0]
    ldr r1, .L_02156040
    ldr r4, [r4, #0x40]
    add r2, sp, #0x10
    blx r4
    mov r1, r0
    ldr r2, [sp, #0x10]
    add r0, sp, #0x3c
    bl func_0202c4a4
    mov r0, #0x0
    str r0, [sp, #0x34]
    mov r0, #0x100000
    str r0, [sp, #0x38]
    mov r0, r8
    add r1, sp, #0x38
    add r2, sp, #0x34
    bl func_ov002_0214d4c0
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x3c]
    ldr r3, [sp, #0x40]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    mov r0, r8
    add r1, sp, #0x30
    add r2, sp, #0x2c
    bl func_ov002_0214d4c0
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x3c]
    ldr r3, [sp, #0x40]
    mov r2, #0xa
    bl func_02023c60
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x3c]
    ldr r3, [sp, #0x40]
    ldr r2, .L_02156044
    bl func_02023c80
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r8, #0x4]
    bl func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
    mov r0, r8
    add r1, sp, #0x28
    add r2, sp, #0x24
    bl func_ov002_0214d4c0
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x3c]
    ldr r3, [sp, #0x40]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x1c]
    mov r0, #0x100000
    str r0, [sp, #0x20]
    mov r0, r8
    add r1, sp, #0x20
    add r2, sp, #0x1c
    bl func_ov002_0214d4c0
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x3c]
    ldr r3, [sp, #0x40]
    mov r2, #0xa
    bl func_02023c60
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x3c]
    ldr r2, .L_02156044
    ldr r3, [sp, #0x40]
    bl func_02023c80
    ldr r0, [r8, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r8, #0x4]
    bl func_020239a0
    mov r3, #0x0
    str r3, [sp, #0x14]
    add r1, sp, #0x18
    add r2, sp, #0x14
    mov r0, r8
    str r3, [sp, #0x18]
    bl func_ov002_0214d4c0
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x3c]
    ldr r3, [sp, #0x40]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r8, #0x4]
    mov r1, #0x2
    blx func_ov012_021b409c
    ldr r0, [r8, #0x4]
    mov r1, #0x3
    blx func_ov012_021b3f78
    ldr r0, [r8, #0x4]
    mov r1, #0x3
    blx func_ov012_021b3fb0
    ldr r1, [r9, #0x4]
    ldr r0, [r9, #0x14]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02155f9c
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_02155fac
.L_02155f9c:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_02155fac:
    ldr r0, [r9, #0x4]
    ldr r1, [r9, #0x14]
    ldr r0, [r0, #0x4]
    ldr r4, [r1, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r9, #0x4]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r0, r9
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02155ff4: .word data_ov002_0215c460
.L_02155ff8: .word data_ov002_0215c44c
.L_02155ffc: .word data_ov002_0215cc10
.L_02156000: .word data_ov002_0215c3fc
.L_02156004: .word data_ov002_0215c3fc
.L_02156008: .word func_ov002_021561a8
.L_0215600c: .word func_ov002_0214d434
.L_02156010: .word func_ov002_02156190
.L_02156014: .word func_ov002_02156214
.L_02156018: .word 0x31305053
.L_0215601c: .word 0x8df
.L_02156020: .word data_ov002_0215c470
.L_02156024: .word data_ov012_021d5154
.L_02156028: .word func_ov002_0215652c
.L_0215602c: .word func_ov002_021564c4
.L_02156030: .word data_ov002_0215c404
.L_02156034: .word data_02093bf4
.L_02156038: .word data_02093c8c
.L_0215603c: .word func_ov002_0215642c
.L_02156040: .word data_ov002_0215c480
.L_02156044: .word 0x494c
    arm_func_end func_ov002_02155940

    .global func_ov002_02156048
    arm_func_start func_ov002_02156048
func_ov002_02156048: ; 0x02156048
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r0, [r5, #0x26]
    cmp r0, #0x0
    bne .L_02156074
    bl func_0203b3e4
    mov r1, #0x0
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov002_0214ecc0
    b .L_02156088
.L_02156074:
    bl func_0203b3f4
    mov r1, #0x0
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov002_0214ecc0
.L_02156088:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    beq .L_02156098
    bl func_0206ae98
.L_02156098:
    ldr r0, .L_021560e0
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r4, #0x20
.L_021560a8:
    mov r0, r4
    blx func_ov012_021b526c
    add r4, r4, #0x1
    cmp r4, #0x22
    blt .L_021560a8
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_021560d4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021560d4:
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_021560e0: .word data_ov012_021d5154
    arm_func_end func_ov002_02156048

    .global func_ov002_021560e4
    arm_func_start func_ov002_021560e4
func_ov002_021560e4: ; 0x021560e4
    ldr r3, [r0, #0x4]
    mov r0, #0x0
    str r1, [r3, #0x8e8]
    str r0, [r3, #0x8ec]
    cmp r2, #0x0
    str r2, [r3, #0x8f4]
    movne r0, #0x2
    str r0, [r3, #0x8f0]
    mov r0, #0x1
    strb r0, [r3, #0x902]
    bx lr
    arm_func_end func_ov002_021560e4

    .global func_ov002_02156110
    arm_func_start func_ov002_02156110
func_ov002_02156110: ; 0x02156110
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_02156174
    ldr r2, .L_02156178
    ldr r3, .L_0215617c
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_02156150
    mov r1, r7
    mov r2, r6
    mov r3, r5
    blx func_ov012_021af26c
    mov r4, r0
.L_02156150:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215616c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215616c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02156174: .word data_ov002_0215bfc0
.L_02156178: .word data_ov002_0215c3f4
.L_0215617c: .word 0x1de
    arm_func_end func_ov002_02156110

    .global func_ov002_02156180
    arm_func_start func_ov002_02156180
func_ov002_02156180: ; 0x02156180
    ldr r0, [r0, #0x4]
    strh r1, [r0, #0xbc]
    strh r2, [r0, #0xbe]
    bx lr
    arm_func_end func_ov002_02156180

    .global func_ov002_02156190
    arm_func_start func_ov002_02156190
func_ov002_02156190: ; 0x02156190
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x128]
    blx r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_02156190

    .global func_ov002_021561a8
    arm_func_start func_ov002_021561a8
func_ov002_021561a8: ; 0x021561a8
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0203b3e4
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02156210
    mov r3, r4
    mov r1, #0x12000
    bl func_ov002_0214d53c
    mov r2, #0x0
    add r1, sp, #0x8
    str r2, [sp, #0x8]
    bl func_ov002_0214ef60
    mov r2, #0x2000
    add r1, sp, #0x4
    mov r0, r4
    str r2, [sp, #0x4]
    bl func_ov002_0214d650
    mov r0, r4
    mov r1, #0x30
    mov r2, #0x3
    bl func_ov002_02156180
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_02156210: .word 0x12012
    arm_func_end func_ov002_021561a8

    .global func_ov002_02156214
    arm_func_start func_ov002_02156214
func_ov002_02156214: ; 0x02156214
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0203b3f4
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215627c
    mov r3, r4
    mov r1, #0x12000
    bl func_ov002_0214d53c
    mov r2, #0x0
    add r1, sp, #0x8
    str r2, [sp, #0x8]
    bl func_ov002_0214ef60
    mov r2, #0x2000
    add r1, sp, #0x4
    mov r0, r4
    str r2, [sp, #0x4]
    bl func_ov002_0214d650
    mov r0, r4
    mov r1, #0x30
    mov r2, #0x3
    bl func_ov002_02156180
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_0215627c: .word 0x12012
    arm_func_end func_ov002_02156214

    .global func_ov002_02156280
    arm_func_start func_ov002_02156280
func_ov002_02156280: ; 0x02156280
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldrb r0, [r4, #0x26]
    cmp r0, #0x0
    ldrb r0, [r4, #0x25]
    bne .L_02156304
    cmp r0, #0x0
    beq .L_021562ec
    mov r0, #0x9
    mov r1, #0x1
    mov r2, #0x3d
    bl func_02073f24
    b .L_02156334
.L_021562ec:
    bl func_0203b3e4
    mov r1, #0x3d
    ldr r0, [r0, #0x88]
    sub r2, r1, #0x45
    bl func_ov002_021560e4
    b .L_02156334
.L_02156304:
    cmp r0, #0x0
    beq .L_02156320
    mov r0, #0x12
    mov r1, #0x1
    mov r2, #0x3d
    bl func_02073f24
    b .L_02156334
.L_02156320:
    bl func_0203b3f4
    mov r1, #0x3d
    ldr r0, [r0, #0x88]
    sub r2, r1, #0x45
    bl func_ov002_021560e4
.L_02156334:
    ldrb r0, [r4, #0x25]
    cmp r0, #0x0
    beq .L_0215635c
    ldr r5, .L_02156388
    b .L_02156350
.L_02156348:
    ldr r0, [r5, #0x0]
    blx r0
.L_02156350:
    bl func_02073840
    cmp r0, #0x0
    beq .L_02156348
.L_0215635c:
    mov r0, #0x78
    mov r1, #0x4
    bl func_0207342c
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldmia sp!, {r3, r4, r5, pc}
.L_02156388: .word data_020a0e18
    arm_func_end func_ov002_02156280

    .global func_ov002_0215638c
    arm_func_start func_ov002_0215638c
func_ov002_0215638c: ; 0x0215638c
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r4, #0x0]
    mov r1, #0x2
    strb r1, [r0, #0x58]
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    strb r1, [r0, #0x59]
    ldr r0, [r4, #0x0]
    mov r1, #0x6
    bl func_ov002_0214d348
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0215638c

    .global func_ov002_021563cc
    arm_func_start func_ov002_021563cc
func_ov002_021563cc: ; 0x021563cc
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    strb r1, [r0, #0x58]
    ldr r0, [r4, #0x0]
    mov r1, #0x2
    strb r1, [r0, #0x59]
    ldr r0, [r4, #0x0]
    mov r1, #0x6
    bl func_ov002_0214d348
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_021563cc

    .global func_ov002_0215640c
    arm_func_start func_ov002_0215640c
func_ov002_0215640c: ; 0x0215640c
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov002_0215644c
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0215640c

    .global func_ov002_0215642c
    arm_func_start func_ov002_0215642c
func_ov002_0215642c: ; 0x0215642c
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    mov r0, r4
    bl func_ov002_0215644c
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0215642c

    .global func_ov002_0215644c
    arm_func_start func_ov002_0215644c
func_ov002_0215644c: ; 0x0215644c
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x5
    bl func_0207342c
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    strb r1, [r0, #0x59]
    ldrb r0, [r4, #0x26]
    cmp r0, #0x0
    bne .L_021564ac
    bl func_0203b3e4
    mov r1, #0x0
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov002_0214ecc0
    ldmia sp!, {r4, pc}
.L_021564ac:
    bl func_0203b3f4
    mov r1, #0x0
    ldr r0, [r0, #0x88]
    mov r2, r1
    bl func_ov002_0214ecc0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0215644c

    .global func_ov002_021564c4
    arm_func_start func_ov002_021564c4
func_ov002_021564c4: ; 0x021564c4
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r0, [r4, #0x26]
    cmp r0, #0x0
    bne .L_021564f4
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_0214ecc0
    b .L_02156508
.L_021564f4:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_0214ecc0
.L_02156508:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_021564c4

    .global func_ov002_0215652c
    arm_func_start func_ov002_0215652c
func_ov002_0215652c: ; 0x0215652c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldrb r0, [r4, #0x25]
    cmp r0, #0x0
    beq .L_021565ac
    ldrb r0, [r4, #0x26]
    mov r1, #0x1
    mov r2, #0x3d
    cmp r0, #0x0
    bne .L_02156588
    mov r0, #0x8
    bl func_02073f24
    b .L_02156590
.L_02156588:
    mov r0, #0x11
    bl func_02073f24
.L_02156590:
    ldr r5, .L_021565c4
    b .L_021565a0
.L_02156598:
    ldr r0, [r5, #0x0]
    blx r0
.L_021565a0:
    bl func_02073840
    cmp r0, #0x0
    beq .L_02156598
.L_021565ac:
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x20]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_021565c4: .word data_020a0e18
    arm_func_end func_ov002_0215652c

    .global func_ov002_021565c8
    arm_func_start func_ov002_021565c8
func_ov002_021565c8: ; 0x021565c8
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02156658
    mov r5, r0
    ldr r2, .L_0215665c
    mov r0, #0xc
    mov r3, #0x37
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0xc
    bl func_020517fc
    str r5, [r4, #0x4]
    bl func_02026f94
    str r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r1, .L_02156660
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    mov r0, #0x0
    bl func_02043264
    ldrb r0, [r5, #0x53]
    ldr r1, [r5, #0x38]
    add r0, r1, r0, lsl #0x6
    ldrsb r0, [r0, #0x2e]
    bl func_ov002_02157220
    str r0, [r4, #0x8]
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02156658: .word data_ov002_0215c4a0
.L_0215665c: .word data_ov002_0215c48c
.L_02156660: .word func_ov002_021566a4
    arm_func_end func_ov002_021565c8

    .global func_ov002_02156664
    arm_func_start func_ov002_02156664
func_ov002_02156664: ; 0x02156664
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02156684
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02156684:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02156664

    .global func_ov002_02156690
    arm_func_start func_ov002_02156690
func_ov002_02156690: ; 0x02156690
    ldr r0, [r0, #0x0]
    ldr ip, .L_021566a0
    ldr r0, [r0, #0x4]
    bx ip
.L_021566a0: .word func_02028330
    arm_func_end func_ov002_02156690

    .global func_ov002_021566a4
    arm_func_start func_ov002_021566a4
func_ov002_021566a4: ; 0x021566a4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x10]
    ldr r0, [r1, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r1, #0x4]
    mov r1, #0x2
    bl func_ov002_0214d348
    ldr r0, [r4, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_021566a4

    .global func_ov002_021566e0
    arm_func_start func_ov002_021566e0
func_ov002_021566e0: ; 0x021566e0
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0xd0
    mov r4, r1
    mov r6, r0
    ldr r1, .L_02156a98
    ldr r2, .L_02156a9c
    mov r0, #0x28
    mov r3, #0x5b
    bl func_0201a21c
    movs r5, r0
    movne r0, #0x0
    strne r0, [r5, #0x18]
    strne r0, [r5, #0x1c]
    strne r0, [r5, #0x20]
    mov r0, r5
    mov r1, #0x0
    mov r2, #0x28
    bl func_020517fc
    str r6, [r5, #0x4]
    ldr r1, .L_02156aa0
    ldr r2, .L_02156aa4
    ldr r3, .L_02156aa8
    mov r0, #0x78
    strb r4, [r5, #0x24]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02156758
    ldr r1, .L_02156aac
    mov r2, #0x1
    bl func_02024064
.L_02156758:
    bl func_ov002_0214d498
    mov r4, r0
    mov r1, r6
    bl func_ov002_0214d678
    ldr r1, [r4, #0x4]
    mov r0, #0xfe000
    str r0, [sp, #0x34]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x34
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    str r4, [r5, #0x0]
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x28]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x28
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x2c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x2c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x10000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x30]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x30
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldrb r3, [r5, #0x24]
    ldr r2, .L_02156ab0
    ldr r1, [r0, #0x88]
    ldr r0, [r2, r3, lsl #0x3]
    bl func_ov002_02156d08
    str r0, [r5, #0x8]
    ldrb r1, [r5, #0x24]
    ldr r0, .L_02156ab4
    ldr r0, [r0, r1, lsl #0x3]
    cmp r0, #0x0
    beq .L_02156970
    mov r0, #0x3
    bl func_0203b414
    ldrb r3, [r5, #0x24]
    ldr r2, .L_02156ab4
    ldr r1, [r0, #0x88]
    ldr r0, [r2, r3, lsl #0x3]
    bl func_ov002_02156d08
    str r0, [r5, #0xc]
.L_02156970:
    mov r6, #0x0
    ldr r4, [r5, #0x8]
    sub lr, r6, #0x100000
    mov ip, #0x100000
    add r0, sp, #0x44
    add r1, sp, #0x1c
    add r2, sp, #0x20
    add r3, sp, #0x24
    str r6, [sp, #0x24]
    str lr, [sp, #0x20]
    str ip, [sp, #0x1c]
    bl func_ov002_0214e39c
    mov ip, r6
    add r0, sp, #0x38
    add r1, sp, #0x10
    add r2, sp, #0x14
    add r3, sp, #0x18
    str ip, [sp, #0x18]
    str ip, [sp, #0x14]
    str ip, [sp, #0x10]
    bl func_ov002_0214e39c
    ldr r2, .L_02156ab8
    add r0, sp, #0x8
    mov r1, r4
    bl func_ov002_0214ef10
    mov r0, #0x400
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r1, .L_02156abc
    add r0, sp, #0x8
    add r2, sp, #0x38
    add r3, sp, #0x44
    bl func_ov002_02156bf0
    mov r1, r0
    mov r0, r4
    bl func_02020f38
    ldrb r1, [r5, #0x24]
    ldr r0, .L_02156ab0
    ldr r1, [r0, r1, lsl #0x3]
    cmp r1, #0x0
    beq .L_02156a50
    add r0, sp, #0x50
    bl func_02074000
    ldr r1, .L_02156ac0
    add r0, sp, #0x50
    bl func_020741bc
    ldr r0, [r5, #0x8]
    mov r1, r6
    bl func_ov002_02156cc4
    bl func_02034db8
    bl func_ov002_02156c8c
    add r1, sp, #0x50
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r5, #0x10]
.L_02156a50:
    mov r4, #0x0
.L_02156a54:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_02156a6c
    ldr r1, [r5, #0x0]
    bl func_ov002_0214d678
.L_02156a6c:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_02156a54
    ldrb r2, [r5, #0x24]
    ldr r1, .L_02156ac4
    mov r0, r5
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    mov r0, r5
    add sp, sp, #0xd0
    ldmia sp!, {r4, r5, r6, pc}
.L_02156a98: .word data_ov002_0215c598
.L_02156a9c: .word data_ov002_0215c548
.L_02156aa0: .word data_ov002_0215bfa4
.L_02156aa4: .word data_ov002_0215c4b0
.L_02156aa8: .word 0x4c3
.L_02156aac: .word func_02024a30
.L_02156ab0: .word data_ov002_0215c570
.L_02156ab4: .word data_ov002_0215c574
.L_02156ab8: .word data_ov002_0215c5b0
.L_02156abc: .word 0x494c
.L_02156ac0: .word data_ov002_0215c5bc
.L_02156ac4: .word data_ov002_0215b074
    arm_func_end func_ov002_021566e0

    .global func_ov002_02156ac8
    arm_func_start func_ov002_02156ac8
func_ov002_02156ac8: ; 0x02156ac8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02156b28
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02156b28:
    mov r5, #0x0
.L_02156b2c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_02156b48
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02156b48:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_02156b5c
    bl func_0206b138
.L_02156b5c:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02156b2c
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov002_02156ac8

    .global func_ov002_02156b74
    arm_func_start func_ov002_02156b74
func_ov002_02156b74: ; 0x02156b74
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0xc]
    ldrsh r1, [sp, #0x26]
    cmp r0, #0x0
    ldrsh r5, [sp, #0x2a]
    beq .L_02156bbc
    ldrsh r0, [sp, #0x24]
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x8]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0xc]
    ldr r0, [r4, #0xc]
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_ov002_02155884
.L_02156bbc:
    ldrsh r0, [sp, #0x28]
    mov r1, r5, lsl #0xc
    str r1, [sp, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x8]
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov002_02155884
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, lr}
    add sp, sp, #0x10
    bx lr
    arm_func_end func_ov002_02156b74

    .global func_ov002_02156bf0
    arm_func_start func_ov002_02156bf0
func_ov002_02156bf0: ; 0x02156bf0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r9, r1
    mov r8, r2
    mov r7, r3
    ldr r1, .L_02156c80
    ldr r2, .L_02156c84
    ldr r3, .L_02156c88
    ldr r4, [r0, #0x4]
    ldr r5, [r0, #0x0]
    mov r0, #0x4c
    bl func_0201a21c
    movs r6, r0
    beq .L_02156c58
    str r9, [sp, #0x0]
    str r8, [sp, #0x4]
    ldr r1, [sp, #0x30]
    str r7, [sp, #0x8]
    ldr ip, [sp, #0x34]
    str r1, [sp, #0xc]
    mov r2, r5
    mov r3, r4
    mov r1, #0x0
    str ip, [sp, #0x10]
    bl func_02013264
    mov r6, r0
.L_02156c58:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02156c74
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02156c74:
    ldr r0, [r6, #0x18]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02156c80: .word data_ov002_0215bff4
.L_02156c84: .word data_ov002_0215c4b8
.L_02156c88: .word 0x2b9
    arm_func_end func_ov002_02156bf0

    .global func_ov002_02156c8c
    arm_func_start func_ov002_02156c8c
func_ov002_02156c8c: ; 0x02156c8c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02156cbc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02156cbc:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02156c8c

    .global func_ov002_02156cc4
    arm_func_start func_ov002_02156cc4
func_ov002_02156cc4: ; 0x02156cc4
    ldr r0, [r0, #0x4]
    ldr ip, .L_02156cdc
    ldr r0, [r0, #0x64]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x20]
    bx ip
.L_02156cdc: .word func_ov002_02156ce0
    arm_func_end func_ov002_02156cc4

    .global func_ov002_02156ce0
    arm_func_start func_ov002_02156ce0
func_ov002_02156ce0: ; 0x02156ce0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_02156d00
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02156d00:
    ldr r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02156ce0

    .global func_ov002_02156d08
    arm_func_start func_ov002_02156d08
func_ov002_02156d08: ; 0x02156d08
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x200
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x100
    mov r1, #0x0
    mov r2, #0x100
    bl func_020517fc
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x100
    bl func_020517fc
    add r0, sp, #0x100
    mov r1, r5
    bl func_02074000
    ldr r1, .L_02156d80
    add r0, sp, #0x100
    bl func_020741bc
    mov r1, r5
    add r0, sp, #0x0
    bl func_02074000
    ldr r1, .L_02156d84
    add r0, sp, #0x0
    bl func_020741bc
    mov r2, r4
    add r0, sp, #0x100
    add r1, sp, #0x0
    bl func_ov002_02156d88
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
.L_02156d80: .word data_ov002_0215c5c4
.L_02156d84: .word data_ov002_0215c5cc
    arm_func_end func_ov002_02156d08

    .global func_ov002_02156d88
    arm_func_start func_ov002_02156d88
func_ov002_02156d88: ; 0x02156d88
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, .L_02156e6c
    ldr r3, .L_02156e70
    ldr ip, [r4, #0x0]
    ldr lr, [r2, #0x4]
    ldr r5, [r3, #0x0]
    mov r6, r0
    sub ip, ip, #0x1
    ldr r2, .L_02156e74
    mov r0, r1
    str ip, [r4, #0x0]
    str r5, [r2, ip, lsl #0x2]
    str lr, [r3, #0x0]
    bl func_02035c90
    bl func_ov002_02156ce0
    mov r4, r0
    bl func_02036ab8
    bl func_ov002_0214d498
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_02156e10
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_02156e28
.L_02156e10:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_02156e28:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    ldr r2, .L_02156e6c
    ldr r0, .L_02156e74
    ldr r4, [r2, #0x0]
    ldr r1, .L_02156e70
    ldr r3, [r0, r4, lsl #0x2]
    add r4, r4, #0x1
    mov r0, r5
    str r4, [r2, #0x0]
    str r3, [r1, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_02156e6c: .word data_02093c08
.L_02156e70: .word data_020a0dd0
.L_02156e74: .word data_020a16d0
    arm_func_end func_ov002_02156d88

    .global func_ov002_02156e78
    arm_func_start func_ov002_02156e78
func_ov002_02156e78: ; 0x02156e78
    bx lr
    arm_func_end func_ov002_02156e78

    .global func_ov002_02156e7c
    arm_func_start func_ov002_02156e7c
func_ov002_02156e7c: ; 0x02156e7c
    stmdb sp!, {r4, lr}
    mov r2, #0xf8000
    str r2, [r0, #0x18]
    ldr r1, [r0, #0xc]
    ldr r1, [r1, #0x4]
    ldr r4, [r1, #0x50]
    str r2, [r4, #0xc]
    ldr r1, [r0, #0x1c]
    str r1, [r4, #0x10]
    ldr r0, [r0, #0x20]
    str r0, [r4, #0x14]
    ldrb r0, [r4, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_02156ec8
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_02156ec8:
    ldrb r0, [r4, #0x24]
    orr r0, r0, #0x31
    strb r0, [r4, #0x24]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_02156e7c

    .global func_ov002_02156ed8
    arm_func_start func_ov002_02156ed8
func_ov002_02156ed8: ; 0x02156ed8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x140
    mov r4, r0
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x0
    ldr r5, [r4, #0xc]
    sub r1, r0, #0x200000
    str r0, [sp, #0x8]
    add r0, sp, #0x28
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    add r1, sp, #0x10
    add r2, sp, #0xc
    add r3, sp, #0x8
    bl func_ov002_0214e39c
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    add r0, sp, #0x34
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    ldr r2, .L_02156fe0
    add r0, sp, #0x20
    mov r1, r5
    bl func_ov002_0214ef10
    mov r0, #0x1000
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r1, .L_02156fe4
    add r0, sp, #0x20
    add r2, sp, #0x34
    add r3, sp, #0x28
    bl func_ov002_02156bf0
    mov r1, r0
    mov r0, r5
    bl func_02020f38
    ldrb r2, [r4, #0x24]
    ldr r1, .L_02156fe8
    add r0, sp, #0x40
    ldr r1, [r1, r2, lsl #0x3]
    bl func_02074000
    ldr r1, .L_02156fec
    add r0, sp, #0x40
    bl func_020741bc
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    bl func_ov002_02156cc4
    bl func_02034db8
    bl func_ov002_02156c8c
    add r1, sp, #0x40
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r4, #0x14]
    add sp, sp, #0x140
    ldmia sp!, {r3, r4, r5, pc}
.L_02156fe0: .word data_ov002_0215c5b0
.L_02156fe4: .word 0x494c
.L_02156fe8: .word data_ov002_0215c574
.L_02156fec: .word data_ov002_0215c5bc
    arm_func_end func_ov002_02156ed8

    .global func_ov002_02156ff0
    arm_func_start func_ov002_02156ff0
func_ov002_02156ff0: ; 0x02156ff0
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x140
    mov r4, r0
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x0
    ldr r5, [r4, #0xc]
    sub r1, r0, #0x200000
    str r0, [sp, #0x8]
    add r0, sp, #0x28
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    add r1, sp, #0x10
    add r2, sp, #0xc
    add r3, sp, #0x8
    bl func_ov002_0214e39c
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    add r0, sp, #0x34
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    ldr r2, .L_021570f8
    add r0, sp, #0x20
    mov r1, r5
    bl func_ov002_0214ef10
    mov r0, #0x1000
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r1, .L_021570fc
    add r0, sp, #0x20
    add r2, sp, #0x34
    add r3, sp, #0x28
    bl func_ov002_02156bf0
    mov r1, r0
    mov r0, r5
    bl func_02020f38
    ldrb r2, [r4, #0x24]
    ldr r1, .L_02157100
    add r0, sp, #0x40
    ldr r1, [r1, r2, lsl #0x3]
    bl func_02074000
    ldr r1, .L_02157104
    add r0, sp, #0x40
    bl func_020741bc
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    bl func_ov002_02156cc4
    bl func_02034db8
    bl func_ov002_02156c8c
    add r1, sp, #0x40
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r4, #0x14]
    add sp, sp, #0x140
    ldmia sp!, {r3, r4, r5, pc}
.L_021570f8: .word data_ov002_0215c5b0
.L_021570fc: .word 0x494c
.L_02157100: .word data_ov002_0215c574
.L_02157104: .word data_ov002_0215c5bc
    arm_func_end func_ov002_02156ff0

    .global func_ov002_02157108
    arm_func_start func_ov002_02157108
func_ov002_02157108: ; 0x02157108
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x140
    mov r4, r0
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x0
    ldr r5, [r4, #0xc]
    sub r1, r0, #0x200000
    str r0, [sp, #0x8]
    add r0, sp, #0x28
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    add r1, sp, #0x10
    add r2, sp, #0xc
    add r3, sp, #0x8
    bl func_ov002_0214e39c
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    add r0, sp, #0x34
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    ldr r2, .L_02157210
    add r0, sp, #0x20
    mov r1, r5
    bl func_ov002_0214ef10
    mov r0, #0x1000
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r1, .L_02157214
    add r0, sp, #0x20
    add r2, sp, #0x34
    add r3, sp, #0x28
    bl func_ov002_02156bf0
    mov r1, r0
    mov r0, r5
    bl func_02020f38
    ldrb r2, [r4, #0x24]
    ldr r1, .L_02157218
    add r0, sp, #0x40
    ldr r1, [r1, r2, lsl #0x3]
    bl func_02074000
    ldr r1, .L_0215721c
    add r0, sp, #0x40
    bl func_020741bc
    ldr r0, [r4, #0xc]
    mov r1, #0x0
    bl func_ov002_02156cc4
    bl func_02034db8
    bl func_ov002_02156c8c
    add r1, sp, #0x40
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r4, #0x14]
    add sp, sp, #0x140
    ldmia sp!, {r3, r4, r5, pc}
.L_02157210: .word data_ov002_0215c5b0
.L_02157214: .word 0x494c
.L_02157218: .word data_ov002_0215c574
.L_0215721c: .word data_ov002_0215c5bc
    arm_func_end func_ov002_02157108

    .global func_ov002_02157220
    arm_func_start func_ov002_02157220
func_ov002_02157220: ; 0x02157220
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xac
    mov r5, r0
    bl func_0203b404
    ldr r0, [r0, #0x88]
    ldr r4, [r0, #0x4]
    bl func_ov002_0215790c
    ldr r0, .L_021578cc
    str r4, [r0, #0x0]
    bl func_ov002_0214d6e8
    ldr r1, .L_021578d0
    ldr r0, .L_021578d4
    ldr r2, .L_021578d8
    mov r3, #0x174
    bl func_0201a21c
    movs r10, r0
    beq .L_021572bc
    add r0, r10, #0x1d8
    add r4, r10, #0x20
    add r6, r0, #0x800
.L_02157270:
    add r8, r4, #0x4
    add r7, r4, #0x18c
.L_02157278:
    add r0, r8, #0x8
    bl func_ov002_021518d4
    add r8, r8, #0x1c
    cmp r8, r7
    blo .L_02157278
    add r0, r4, #0x18
    add r8, r4, #0x370
    add r7, r0, #0x400
.L_02157298:
    mov r0, r8
    bl func_ov002_021518d4
    add r8, r8, #0xc
    cmp r8, r7
    blo .L_02157298
    add r0, r4, #0xdc
    add r4, r0, #0x400
    cmp r4, r6
    blo .L_02157270
.L_021572bc:
    ldr r2, .L_021578d4
    mov r0, r10
    mov r1, #0x0
    bl func_020517fc
    mov r0, #0x0
    strb r0, [r10, #0x14]
    bl func_02026f94
    str r0, [r10, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r10, #0x4]
    ldr r1, .L_021578dc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x4]
    mov r1, r10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r5, lsl #0x10
    mov r8, r0, asr #0x10
    bl func_020310f4
    ldr r2, .L_021578e0
    str r0, [r10, #0x0]
    ldr r1, .L_021578e4
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_021578e8
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r9, #0x1
    mov r4, #0x4
    mov r6, #0x0
    mov r5, #0x40
    mov r7, r9
    mov r11, r4
.L_02157370:
    mov r0, r9
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r9
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r11
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r9
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r9
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, r9
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, r9
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    add r0, r10, r9, lsl #0x2
    strb r6, [r0, #0x4e2]
    strb r5, [r0, #0x4e3]
    strb r5, [r0, #0x4e4]
    strb r4, [r0, #0x4e5]
    strb r6, [r0, #0x9be]
    strb r5, [r0, #0x9bf]
    strb r5, [r0, #0x9c0]
    add r9, r9, #0x1
    strb r4, [r0, #0x9c1]
    cmp r9, #0x4
    blt .L_02157370
    mov r0, r6
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r4, [r0, #0x4]
    bl func_ov002_0215790c
    ldr r1, .L_021578cc
    mov r0, #0x0
    str r4, [r1, #0x0]
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
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    bl func_ov002_0214d6e8
    mov r0, #0x0
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    add r1, sp, #0x28
    add r2, sp, #0x24
    add r3, sp, #0x20
    bl func_ov002_02155808
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov002_02155808
    add r0, r10, #0xa00
    strh r8, [r0, #0x86]
    ldr r0, .L_021578ec
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0xa00]
    ldr r0, .L_021578f0
    mov r1, #0x0
    ldr r0, [r0, r8, lsl #0x2]
    mov r2, r1
    bl func_02033410
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne .L_0215762c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215762c:
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    str r0, [r10, #0x18]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r1, #0x0
    mov r4, r1
    str r0, [r10, #0x1c]
    b .L_02157734
.L_02157658:
    ldr r0, .L_021578f4
    mov r2, #0x0
    mla r5, r4, r0, r10
    add r0, r5, #0x400
    strh r2, [r0, #0x90]
    strh r2, [r0, #0x92]
    ldr r2, [r10, #0x1c]
    ldrh r0, [r2, #0xa]
    add r0, r2, r0
    add r1, r0, r1
    str r1, [r5, #0x20]
    ldrh r0, [r1, #0x6]
    add r0, r1, r0
    str r0, [r5, #0x36c]
    bl func_02020d90
    str r0, [r5, #0x368]
    add r0, r5, #0x400
    ldrsh r3, [r0, #0x92]
    add r1, sp, #0x10
    add r2, sp, #0xc
    mov r3, r3, lsl #0xc
    str r3, [sp, #0xc]
    ldrsh r0, [r0, #0x90]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x10]
    ldr r0, [r5, #0x368]
    bl func_ov002_0214d4c0
    ldr r0, [r5, #0x368]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x20]
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x0
    bne .L_02157704
    mov r0, #0x1
    strb r0, [r5, #0x4e4]
    add r0, r10, #0xa00
    ldrsh r1, [r0, #0x84]
    add r1, r1, #0x1
    strh r1, [r0, #0x84]
.L_02157704:
    ldr r1, [r5, #0x20]
    mov r0, #0xff
    ldr r1, [r1, #0x0]
    mov r3, #0x0
    strb r0, [r5, #0x4f3]
    mvn r2, #0x0
.L_0215771c:
    add r0, r5, r3
    add r3, r3, #0x1
    strb r2, [r0, #0x370]
    cmp r3, #0xe
    blt .L_0215771c
    add r4, r4, #0x1
.L_02157734:
    ldr r0, [r10, #0x1c]
    ldrsh r0, [r0, #0x0]
    cmp r4, r0
    blt .L_02157658
    mov r9, #0x0
    mov r8, r9
    add r11, sp, #0x2c
    mov r4, r9
    b .L_021577dc
.L_02157758:
    ldr r0, .L_021578f4
    mov r5, r4
    mla r0, r8, r0, r10
    ldr r7, [r0, #0x20]
    ldrh r0, [r7, #0x6]
    add r6, r7, r0
    b .L_021577cc
.L_02157774:
    ldrb r0, [r6, #0x0]
    cmp r0, #0x0
    bne .L_021577c0
    ldrb r0, [r6, #0x4]
    cmp r0, #0x4
    blo .L_021577c0
    ldr r1, .L_021578f8
    mov r0, r11
    bl func_02074000
    mov r0, r11
    add r1, r6, #0x14
    bl func_020741bc
    mov r0, r11
    mov r1, #0x0
    blx func_020101f4
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0xa04]
    add r0, r9, #0x1
    and r9, r0, #0xff
.L_021577c0:
    ldrh r0, [r6, #0x2]
    add r5, r5, #0x1
    add r6, r6, r0
.L_021577cc:
    ldrsh r0, [r7, #0x4]
    cmp r5, r0
    blt .L_02157774
    add r8, r8, #0x1
.L_021577dc:
    ldr r0, [r10, #0x1c]
    ldrsh r0, [r0, #0x0]
    cmp r8, r0
    blt .L_02157758
    mov r0, #0x0
    bl func_02028920
    str r0, [r10, #0x8]
    mov r0, #0x0
    bl func_020208ec
    add r4, r10, #0x1d8
    str r0, [r10, #0xc]
    add r0, r4, #0x800
    mov r1, #0x0
    mov r2, #0x14
    bl func_020517fc
    bl func_02026f94
    str r0, [r10, #0x9d8]
    ldr r0, [r0, #0x4]
    add r1, r4, #0x800
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x9d8]
    ldr r1, .L_021578fc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x1c]
    ldr r1, .L_021578d0
    ldrb r0, [r0, #0x4]
    ldr r2, .L_02157900
    ldr r3, .L_02157904
    strb r0, [r4, #0x808]
    ldr r0, [r10, #0x1c]
    add r0, r0, #0xc
    str r0, [r4, #0x804]
    ldrb r0, [r4, #0x808]
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r4, #0x810]
    ldrb r2, [r4, #0x808]
    mov r1, #0x0
    mov r2, r2, lsl #0x2
    bl func_020517fc
    b .L_02157894
.L_0215788c:
    add r0, r4, #0x800
    bl func_ov002_02159f24
.L_02157894:
    ldr r0, [r10, #0x1c]
    ldrb r1, [r4, #0x809]
    ldrb r0, [r0, #0x5]
    cmp r1, r0
    blo .L_0215788c
    ldr r2, .L_02157908
    mov r3, #0x2000
    mov r0, #0x2
    mov r1, #0x1
    str r3, [r2, #0x0]
    bl func_02073ebc
    ldr r0, [r10, #0x0]
    add sp, sp, #0xac
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021578cc: .word data_020a0dd0
.L_021578d0: .word data_ov002_0215ca94
.L_021578d4: .word 0xa8c
.L_021578d8: .word data_ov002_0215c778
.L_021578dc: .word func_ov002_02157960
.L_021578e0: .word data_02093c04
.L_021578e4: .word data_020a0e80
.L_021578e8: .word data_020a16c0
.L_021578ec: .word data_ov002_0215caa0
.L_021578f0: .word data_ov002_0215c6a4
.L_021578f4: .word 0x4dc
.L_021578f8: .word data_ov002_0215cab0
.L_021578fc: .word func_ov002_02159fe4
.L_02157900: .word data_ov002_0215c99c
.L_02157904: .word 0xa0d
.L_02157908: .word data_020a10a8
    arm_func_end func_ov002_02157220

    .global func_ov002_0215790c
    arm_func_start func_ov002_0215790c
func_ov002_0215790c: ; 0x0215790c
    ldr r1, .L_02157930
    ldr r0, .L_02157934
    ldr r3, [r1, #0x0]
    ldr r2, [r0, #0x0]
    sub r3, r3, #0x1
    ldr r0, .L_02157938
    str r3, [r1, #0x0]
    str r2, [r0, r3, lsl #0x2]
    bx lr
.L_02157930: .word data_02093c08
.L_02157934: .word data_020a0dd0
.L_02157938: .word data_020a16d0
    arm_func_end func_ov002_0215790c

    .global func_ov002_0215793c
    arm_func_start func_ov002_0215793c
func_ov002_0215793c: ; 0x0215793c
    stmdb sp!, {r3, lr}
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0215793c

    .global func_ov002_02157960
    arm_func_start func_ov002_02157960
func_ov002_02157960: ; 0x02157960
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157984
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02157984: .word func_ov002_02157988
    arm_func_end func_ov002_02157960

    .global func_ov002_02157988
    arm_func_start func_ov002_02157988
func_ov002_02157988: ; 0x02157988
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    ldr r0, [r0, #0x4]
    mov r4, #0x0
    ldr r7, [r0, #0x10]
    b .L_02157cd0
.L_021579a0:
    ldr r0, .L_02157dac
    mul r6, r4, r0
    add r5, r7, r6
    ldrb r0, [r5, #0x4e4]
    cmp r0, #0x0
    bne .L_02157cc4
    ldr r3, [r5, #0x1dc]
    ldr r10, [r5, #0x36c]
    cmp r3, #0x0
    beq .L_021579ec
    mov r0, r10
    mov r1, r7
    mov r2, r4
    blx r3
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x1dc]
    movne r0, #0x1
    b .L_02157a94
.L_021579ec:
    ldrb r2, [r10, #0x0]
    ldr r1, .L_02157db0
    mov r0, r10
    ldr r3, [r1, r2, lsl #0x2]
    mov r1, r7
    mov r2, r4
    blx r3
    add r1, r5, #0x8c
    add r9, r1, #0x400
    add r8, r5, #0x400
    ldr r11, .L_02157db0
    b .L_02157a84
.L_02157a1c:
    ldrh r0, [r10, #0x2]
    ldr r1, [r5, #0x36c]
    add r0, r1, r0
    str r0, [r5, #0x36c]
    ldrsh r0, [r9, #0x0]
    add r0, r0, #0x1
    strh r0, [r9, #0x0]
    ldr r0, [r5, #0x20]
    ldrsh r1, [r8, #0x8c]
    ldrsh r0, [r0, #0x4]
    cmp r1, r0
    blt .L_02157a68
    mov r0, #0x1
    strb r0, [r5, #0x4e4]
    add r1, r7, #0xa00
    ldrsh r2, [r1, #0x84]
    add r2, r2, #0x1
    strh r2, [r1, #0x84]
    b .L_02157a94
.L_02157a68:
    ldr r10, [r5, #0x36c]
    mov r1, r7
    ldrb r3, [r10, #0x0]
    mov r0, r10
    mov r2, r4
    ldr r3, [r11, r3, lsl #0x2]
    blx r3
.L_02157a84:
    ldr r1, [r5, #0x1dc]
    cmp r1, #0x0
    cmpeq r0, #0x0
    beq .L_02157a1c
.L_02157a94:
    cmp r0, #0x0
    ldreq r0, [r5, #0x1dc]
    cmpeq r0, #0x0
    bne .L_02157af0
    ldr r2, [r5, #0x36c]
    add r0, r5, #0x400
    ldrh r1, [r2, #0x2]
    add r1, r2, r1
    str r1, [r5, #0x36c]
    ldrsh r1, [r0, #0x8c]
    add r1, r1, #0x1
    strh r1, [r0, #0x8c]
    ldr r1, [r5, #0x20]
    ldrsh r2, [r0, #0x8c]
    ldrsh r0, [r1, #0x4]
    cmp r2, r0
    blt .L_02157af0
    mov r0, #0x1
    strb r0, [r5, #0x4e4]
    add r0, r7, #0xa00
    ldrsh r1, [r0, #0x84]
    add r1, r1, #0x1
    strh r1, [r0, #0x84]
.L_02157af0:
    ldrb r0, [r5, #0x4e5]
    cmp r0, #0x0
    beq .L_02157b14
    ldr r0, .L_02157db4
    ldr r0, [r0, r4, lsl #0x2]
    blx r0
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r5, #0x4e5]
.L_02157b14:
    ldrb r0, [r5, #0x4f5]
    cmp r0, #0x0
    beq .L_02157b84
    add r0, r7, #0x20
    add r0, r0, r6
    bl func_ov002_02159eac
    add r8, r7, r6
    ldrb r0, [r8, #0x4f8]
    bl func_ov002_02159584
    add r1, r8, #0x400
    strh r0, [r1, #0x90]
    ldrb r0, [r8, #0x4f9]
    bl func_ov002_02159584
    add r1, r8, #0x400
    strh r0, [r1, #0x92]
    ldrsh r0, [r1, #0xf6]
    sub r0, r0, #0x1
    strh r0, [r1, #0xf6]
    ldrsh r0, [r1, #0xf6]
    cmp r0, #0x0
    movle r1, #0x0
    addle r0, r5, #0x400
    strleh r1, [r0, #0x92]
    strleh r1, [r0, #0x90]
    movgt r1, #0x1
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r5, #0x4f5]
.L_02157b84:
    add r1, r7, #0x24
    add r0, r7, #0x1ac
    add r11, r1, r6
    add r8, r0, r6
    mov r6, #0x0
.L_02157b98:
    mov r0, #0x1c
    mla r0, r6, r0, r5
    ldr r1, [r0, #0x24]
    cmp r1, #0x0
    ldreq r0, [r0, #0x28]
    cmpeq r0, #0x0
    beq .L_02157c38
    mov r0, #0x1c
    mul r10, r6, r0
    add r9, r5, r10
    str r1, [sp, #0x0]
    ldr r1, [r9, #0x28]
    add r3, r11, r10
    str r1, [sp, #0x4]
    ldrb ip, [r9, #0x3f]
    add r0, r3, #0x8
    add r1, r3, #0x14
    add r2, r3, #0x16
    str ip, [sp, #0x8]
    add r3, r3, #0x18
    bl func_ov002_02158e64
    ldrsh r0, [r9, #0x3c]
    cmp r0, #0x0
    bgt .L_02157c38
    mov r0, r9
    ldrsh r1, [r0, #0x38]
    ldrb r2, [r0, #0x3e]
    mov r3, r1, lsl #0xc
    mov r1, #0xc
    mla r1, r2, r1, r5
    str r3, [r1, #0x390]
    ldrsh r1, [r0, #0x3a]
    ldrb r2, [r0, #0x3e]
    mov r3, r1, lsl #0xc
    mov r1, #0xc
    mla r1, r2, r1, r5
    str r3, [r1, #0x394]
    mov r1, #0x0
    str r1, [r0, #0x24]
    str r1, [r0, #0x28]
.L_02157c38:
    cmp r6, #0x4
    bge .L_02157c84
    mov r0, #0xc
    mul r10, r6, r0
    add r9, r5, r10
    ldr r3, [r9, #0x1ac]
    cmp r3, #0x0
    beq .L_02157c84
    add r2, r8, r10
    add r0, r2, #0x6
    add r1, r2, #0x8
    add r2, r2, #0x4
    bl func_ov002_02159db4
    mov r0, r9
    add r0, r0, #0x100
    ldrsh r0, [r0, #0xb0]
    cmp r0, #0x0
    movle r0, #0x0
    strle r0, [r9, #0x1ac]
.L_02157c84:
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, asr #0x10
    cmp r6, #0xe
    blt .L_02157b98
    add r0, r5, #0x400
    ldrsh r3, [r0, #0x92]
    add r1, sp, #0x10
    add r2, sp, #0xc
    mov r3, r3, lsl #0xc
    str r3, [sp, #0xc]
    ldrsh r0, [r0, #0x90]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x10]
    ldr r0, [r5, #0x368]
    bl func_ov002_0214d4c0
.L_02157cc4:
    add r0, r4, #0x1
    mov r0, r0, lsl #0x10
    mov r4, r0, asr #0x10
.L_02157cd0:
    ldr r0, [r7, #0x1c]
    ldrsh r0, [r0, #0x0]
    cmp r4, r0
    blt .L_021579a0
    add r0, r7, #0xa00
    ldrsh r3, [r0, #0x86]
    ldr r0, .L_02157db8
    mov r2, #0x1
    mov r1, r3, lsr #0x5
    ldr r0, [r0, r1, lsl #0x2]
    and r1, r3, #0x1f
    tst r0, r2, lsl r1
    beq .L_02157d70
    ldr r0, [r7, #0x8]
    ldr r2, [r0, #0x0]
    ldr r0, [r2, #0x74]
    ldr r1, [r2, #0x70]
    add r0, r2, r0, lsl #0x2
    add r1, r2, r1, lsl #0x2
    ldr r0, [r0, #0x18]
    ldr r1, [r1, #0x18]
    mvn r0, r0
    and r0, r1, r0
    tst r0, #0x8000
    bne .L_02157d50
    ldr r0, [r7, #0xc]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x130]
    blx r1
    cmp r0, #0x0
    beq .L_02157d70
.L_02157d50:
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r7, #0x4]
    ldr r1, .L_02157dbc
    ldr r0, [r0, #0x4]
    bl func_02028384
    b .L_02157da4
.L_02157d70:
    ldr r1, [r7, #0x1c]
    add r0, r7, #0xa00
    ldrsh r1, [r1, #0x0]
    ldrsh r0, [r0, #0x84]
    cmp r1, r0
    bgt .L_02157da4
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r7, #0x4]
    ldr r1, .L_02157dbc
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_02157da4:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02157dac: .word 0x4dc
.L_02157db0: .word data_ov002_0215c664
.L_02157db4: .word data_ov002_0215c5e4
.L_02157db8: .word data_020b0cd4
.L_02157dbc: .word func_ov002_02157dc0
    arm_func_end func_ov002_02157988

    .global func_ov002_02157dc0
    arm_func_start func_ov002_02157dc0
func_ov002_02157dc0: ; 0x02157dc0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    ldr r0, [r0, #0x4]
    ldr r6, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    mov r5, #0x0
.L_02157ddc:
    ldr r0, .L_02158170
    mov r7, #0x0
    mla r8, r5, r0, r6
    mov r4, r7
    mov r9, r7
.L_02157df0:
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x1e0]
    cmp r0, #0x0
    beq .L_02157e30
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x1e0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r8, r7, lsl #0x2
    str r9, [r0, #0x1e0]
.L_02157e30:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_02157df0
    mov r4, #0x0
    mov r7, r4
.L_02157e44:
    add r0, r8, r4, lsl #0x2
    ldr r0, [r0, #0x1f0]
    cmp r0, #0x0
    beq .L_02157e68
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r8, r4, lsl #0x2
    str r7, [r0, #0x1f0]
.L_02157e68:
    add r4, r4, #0x1
    cmp r4, #0xa
    blt .L_02157e44
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02157ddc
    add r0, r6, #0xa00
    ldrh r0, [r0, #0x88]
    tst r0, #0x1
    beq .L_02157e9c
    bl func_020735e4
    mov r0, #0x8
    bl func_0207367c
.L_02157e9c:
    ldr r4, .L_02158174
    b .L_02157eac
.L_02157ea4:
    ldr r0, [r4, #0x0]
    blx r0
.L_02157eac:
    ldrb r0, [r6, #0x9e4]
    cmp r0, #0x0
    bne .L_02157ea4
    ldr r5, [r6, #0x9e8]
    cmp r5, #0x0
    beq .L_02157efc
    mov r7, #0x0
    mov r4, r7
    b .L_02157ee8
.L_02157ed0:
    ldr r0, [r5, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_02157ee4
    bl func_02034d7c
    str r4, [r5, r7, lsl #0x2]
.L_02157ee4:
    add r7, r7, #0x1
.L_02157ee8:
    ldrb r0, [r6, #0x9e0]
    cmp r7, r0
    blt .L_02157ed0
    mov r0, r5
    bl func_0201b268
.L_02157efc:
    ldr r0, [r6, #0x9d8]
    cmp r0, #0x0
    beq .L_02157f1c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r6, #0x9d8]
.L_02157f1c:
    ldr r0, .L_02158178
    mov r1, #0x0
    str r1, [r0, #0x0]
    add r0, r6, #0xa00
    ldrsh r0, [r0, #0x86]
    blx func_020713f0
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x1
    strb r2, [r1, #0x956]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    bl func_020737d4
    bl func_02073800
    mov r5, #0x0
    mov r4, r5
.L_0215801c:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xa04]
    cmp r0, #0x0
    beq .L_02158040
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r6, r5, lsl #0x2
    str r4, [r0, #0xa04]
.L_02158040:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_0215801c
    mov r8, #0x0
    ldr r4, .L_02158170
    mov r5, r8
.L_02158058:
    mla r7, r8, r4, r6
    ldr r0, [r7, #0x368]
    cmp r0, #0x0
    beq .L_02158078
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    str r5, [r7, #0x368]
.L_02158078:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_02158058
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    beq .L_021580a8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r6, #0x18]
.L_021580a8:
    mov r9, #0x0
    ldr r10, .L_02158170
    mov r4, r9
    mov r5, r9
.L_021580b8:
    mla r8, r9, r10, r6
    mov r7, r5
.L_021580c0:
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x1e0]
    cmp r0, #0x0
    beq .L_021580e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r8, r7, lsl #0x2
    str r4, [r0, #0x1e0]
.L_021580e4:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_021580c0
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_021580b8
    ldr r0, [r6, #0xa00]
    cmp r0, #0x0
    beq .L_02158114
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02158114:
    ldr r1, .L_0215817c
    ldr r2, .L_02158180
    ldr r3, [r1, #0x0]
    ldr r0, .L_02158184
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldrb r1, [r6, #0x14]
    ldr r0, .L_02158188
    str r1, [r0, #0x8]
    ldr r0, [r6, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r6
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02158170: .word 0x4dc
.L_02158174: .word data_020a0e18
.L_02158178: .word data_020a10a8
.L_0215817c: .word data_02093c04
.L_02158180: .word data_020a16c0
.L_02158184: .word data_020a0e80
.L_02158188: .word data_020afcb0
    arm_func_end func_ov002_02157dc0

    .global func_ov002_0215818c
    arm_func_start func_ov002_0215818c
func_ov002_0215818c: ; 0x0215818c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x134
    sub sp, sp, #0x400
    ldr r3, .L_02158970
    mov r4, #0x0
    mov r10, r0
    str r4, [r3, #0x0]
    ldrb r3, [r10, #0x4]
    ldr r0, .L_02158974
    mov r9, r1
    ldrsb r0, [r0, r3]
    mov r8, r2
    cmp r0, #0x0
    beq .L_02158878
    cmp r3, #0x3
    bhi .L_021581f8
    ldr r0, .L_02158978
    ldrsh r1, [r10, #0x6]
    smlabb r2, r8, r0, r9
    add r0, r2, r3, lsl #0x1
    add r0, r0, #0x300
    strh r1, [r0, #0x7e]
    ldrb r0, [r10, #0x4]
    ldrsh r1, [r10, #0x8]
    add r0, r2, r0, lsl #0x1
    add r0, r0, #0x300
    strh r1, [r0, #0x86]
.L_021581f8:
    ldr r0, .L_02158978
    add r1, r9, #0x20
    mul r7, r8, r0
    ldr r0, [r1, r7]
    add r11, r1, r7
    add r5, sp, #0x5c
    str r0, [sp, #0x58]
    add r6, r11, #0x4
    add r4, sp, #0x1e4
.L_0215821c:
    ldr r1, [r6, #0x0]
    add r0, r5, #0x8
    str r1, [r5, #0x0]
    ldr r2, [r6, #0x4]
    add r1, r6, #0x8
    str r2, [r5, #0x4]
    bl func_ov002_0214fa00
    ldrsh r0, [r6, #0x14]
    strh r0, [r5, #0x14]
    ldrsh r0, [r6, #0x16]
    strh r0, [r5, #0x16]
    ldrsh r0, [r6, #0x18]
    strh r0, [r5, #0x18]
    ldrb r0, [r6, #0x1a]
    strb r0, [r5, #0x1a]
    ldrb r0, [r6, #0x1b]
    add r6, r6, #0x1c
    strb r0, [r5, #0x1b]
    add r5, r5, #0x1c
    cmp r5, r4
    blo .L_0215821c
    add r0, r9, r7
    add r6, r0, #0x1ac
    mov r5, #0x3
.L_0215827c:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_0215827c
    add r4, r9, r7
    ldr r0, [r4, #0x1dc]
    add r5, sp, #0x218
    str r0, [sp, #0x214]
    add r0, r4, #0x1e0
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    add r6, r4, #0x1f0
    add r5, sp, #0x228
    mov r4, #0x2
.L_021582b4:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_021582b4
    add r3, r9, r7
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    add r2, sp, #0x250
    add r3, r3, #0x218
    mov r1, #0x100
.L_021582dc:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne .L_021582dc
    add r0, r9, r7
    add r5, sp, #0x350
    add r6, r0, #0x318
    mov r4, #0x3
.L_021582fc:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_021582fc
    ldmia r6, {r0, r1}
    add r4, r9, r7
    stmia r5, {r0, r1}
    add r6, r4, #0x350
    add r5, sp, #0x388
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    ldr r0, [r4, #0x368]
    add r2, sp, #0x3a8
    str r0, [sp, #0x3a0]
    ldr r0, [r4, #0x36c]
    add r3, r4, #0x370
    str r0, [sp, #0x3a4]
    mov r1, #0xe
.L_0215834c:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne .L_0215834c
    add r0, r9, r7
    add r0, r0, #0x7e
    add r2, sp, #0x300
    add r2, r2, #0xb6
    add r3, r0, #0x300
    mov r1, #0x4
.L_02158374:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02158374
    add r0, r9, r7
    add r0, r0, #0x86
    add r2, sp, #0x300
    add r2, r2, #0xbe
    add r3, r0, #0x300
    mov r1, #0x4
.L_0215839c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0215839c
    add r5, sp, #0x3c8
    add r6, r11, #0x370
    add r4, sp, #0x470
.L_021583b8:
    mov r0, r5
    mov r1, r6
    bl func_ov002_0214fa00
    add r5, r5, #0xc
    cmp r5, r4
    add r6, r6, #0xc
    blo .L_021583b8
    add r0, r9, r7
    add r0, r0, #0x38
    add r2, r0, #0x400
    mov r1, #0xe
.L_021583e4:
    ldrh r0, [r2], #0x2
    subs r1, r1, #0x1
    strh r0, [r4], #0x2
    bne .L_021583e4
    add r0, r9, r7
    add r0, r0, #0x54
    add r2, sp, #0x400
    add r2, r2, #0x8c
    add r3, r0, #0x400
    mov r1, #0xe
.L_0215840c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0215840c
    add r0, r9, r7
    add r2, sp, #0x400
    add r2, r2, #0xa8
    add r3, r0, #0x470
    mov r1, #0xe
.L_02158430:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02158430
    add r0, r9, r7
    add r1, r0, #0x400
    ldrsh r4, [r1, #0x8c]
    add r2, r0, #0x94
    add r3, r0, #0xa4
    add r0, sp, #0x400
    strh r4, [r0, #0xc4]
    ldrsh r4, [r1, #0x8e]
    add r11, sp, #0x400
    add r5, sp, #0x400
    strh r4, [r0, #0xc6]
    ldrsh r4, [r1, #0x90]
    add r11, r11, #0xcc
    add r2, r2, #0x400
    strh r4, [r0, #0xc8]
    ldrsh r1, [r1, #0x92]
    add r6, r3, #0x400
    add r5, r5, #0xdc
    strh r1, [r0, #0xca]
    ldmia r2, {r0, r1, r2, r3}
    stmia r11, {r0, r1, r2, r3}
    mov r4, #0x4
.L_02158498:
    ldrh r0, [r6], #0x2
    subs r4, r4, #0x1
    strh r0, [r5], #0x2
    bne .L_02158498
    add r0, r9, r7
    add r0, r0, #0xac
    add r2, sp, #0x400
    add r2, r2, #0xe4
    add r3, r0, #0x400
    mov r1, #0x4
.L_021584c0:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_021584c0
    add r0, r9, r7
    add r0, r0, #0xb4
    add r2, sp, #0x400
    add r2, r2, #0xec
    add r3, r0, #0x400
    mov r1, #0x4
.L_021584e8:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_021584e8
    add r0, r9, r7
    add r0, r0, #0xbc
    add r5, sp, #0x400
    add r5, r5, #0xf4
    add r6, r0, #0x400
    mov r4, #0x2
.L_02158510:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_02158510
    add r3, r9, r7
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    ldrb r1, [r3, #0x4e4]
    add r2, sp, #0x500
    add r0, r3, #0xe6
    strb r1, [sp, #0x51c]
    ldrb r4, [r3, #0x4e5]
    add r2, r2, #0x1e
    add r3, r0, #0x400
    mov r1, #0xc
    strb r4, [sp, #0x51d]
.L_02158550:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne .L_02158550
    add r0, r9, r7
    add r1, sp, #0x400
    ldrb r4, [r0, #0x4f2]
    ldrsh r2, [r1, #0xc4]
    add r3, r0, #0x400
    strb r4, [sp, #0x52a]
    ldrb r1, [r0, #0x4f3]
    add r4, sp, #0x58
    strb r1, [sp, #0x52b]
    ldrsb r1, [r3, #0xf4]
    strb r1, [sp, #0x52c]
    ldrb r1, [r0, #0x4f5]
    strb r1, [sp, #0x52d]
    ldrsh r3, [r3, #0xf6]
    add r1, sp, #0x500
    strh r3, [r1, #0x2e]
    ldrb r1, [r0, #0x4f8]
    strb r1, [sp, #0x530]
    ldrb r1, [r0, #0x4f9]
    strb r1, [sp, #0x531]
    ldrb r1, [r0, #0x4fa]
    strb r1, [sp, #0x532]
    ldrb r0, [r0, #0x4fb]
    strb r0, [sp, #0x533]
    ldrb r3, [r10, #0x4]
    add r0, r4, r3, lsl #0x1
    add r5, r0, #0x300
    ldr r0, .L_0215897c
    b .L_02158658
.L_021585d4:
    ldr r6, [r4, #0x34c]
    ldrh r1, [r6, #0x2]
    add r1, r6, r1
    str r1, [r4, #0x34c]
    ldrb r11, [r1, #0x0]
    ldrsb r6, [r0, r11]
    cmp r6, #0x0
    beq .L_02158644
    ldrb r6, [r1, #0x4]
    cmp r6, r3
    bne .L_02158654
    cmp r11, #0x1
    bne .L_02158668
    ldrsh ip, [r5, #0x5e]
    ldrsh r11, [r1, #0x6]
    subs r6, r11, ip, asr #0x1
    bmi .L_02158668
    add r6, r11, ip, asr #0x1
    cmp r6, #0x100
    bgt .L_02158668
    ldrsh r11, [r5, #0x66]
    ldrsh r6, [r1, #0x8]
    subs r1, r6, r11, asr #0x1
    bmi .L_02158668
    add r1, r6, r11, asr #0x1
    cmp r1, #0xc0
    ble .L_02158654
    b .L_02158668
.L_02158644:
    cmp r11, #0x3
    ldreqb r1, [r1, #0x4]
    cmpeq r1, r3
    beq .L_02158668
.L_02158654:
    add r2, r2, #0x1
.L_02158658:
    ldr r1, [r4, #0x0]
    ldrsh r1, [r1, #0x4]
    cmp r2, r1
    ble .L_021585d4
.L_02158668:
    cmp r8, #0x0
    ldrb r0, [r10, #0xe]
    bne .L_0215867c
    bl func_0203b414
    b .L_02158680
.L_0215867c:
    bl func_0203b424
.L_02158680:
    ldr r6, [r0, #0x88]
    bl func_ov002_0215790c
    ldrb r1, [r10, #0xb]
    mov r0, r6
    bl func_ov002_0215793c
    ldr r1, .L_02158980
    add r0, sp, #0x18
    bl func_02074000
    add r0, sp, #0x18
    add r1, r10, #0x14
    bl func_020741bc
    ldrb r0, [r10, #0xf]
    ldr r1, [r9, #0x9e8]
    ldrb r5, [r10, #0x5]
    ldr r8, [r1, r0, lsl #0x2]
    mov r1, #0x0
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1c]
    blx r2
    mov r4, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    mul r3, r0, r4
    add r0, r9, #0x94
    add r0, r0, #0x400
    cmp r5, #0x0
    ldrb r1, [r10, #0xe]
    add r2, r0, r7
    moveq r3, r3, lsr #0x1
    ldr r0, [r2, r1, lsl #0x2]
    cmp r3, r0
    movls r3, r0
    str r3, [r2, r1, lsl #0x2]
    ldrb r0, [r10, #0xf]
    ldr r1, [r9, #0x9e8]
    ldrb r4, [r10, #0x4]
    ldr r5, [r1, r0, lsl #0x2]
    ldr r3, [r6, #0x4]
    ldr r1, .L_02158984
    ldr r0, .L_02158970
    mov r2, #0x0
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bl func_02036ab8
    bl func_ov002_0214d498
    mov r8, r0
    ldr r0, [r8, #0x4]
    add r1, sp, #0x18
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r5, #0x0
    ldr r0, [r8, #0x4]
    bne .L_02158784
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_0215879c
.L_02158784:
    ldr r0, [r0, #0x64]
    ldr r1, [r5, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_0215879c:
    mov r3, #0x80000
    add r1, sp, #0xc
    add r2, sp, #0x8
    mov r0, r8
    str r3, [sp, #0x8]
    str r3, [sp, #0xc]
    bl func_ov002_0214d4c0
    add r0, r9, #0x1e0
    add r5, r0, r7
    ldr r0, .L_02158970
    str r8, [r5, r4, lsl #0x2]
    mov r1, #0x2000
    str r1, [r0, #0x0]
    ldrsh r3, [r10, #0x6]
    ldrb r2, [r10, #0x4]
    ldrsh r1, [r10, #0x8]
    ldrb r0, [r10, #0xd]
    mov r3, r3, asr #0x1
    ldr r2, [r5, r2, lsl #0x2]
    add r0, r0, r1, asr #0x1
    mov r1, r3, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x14]
    str r0, [sp, #0x10]
    ldr r0, [r2, #0x4]
    add r1, sp, #0x14
    ldr r3, [r0, #0x0]
    add r2, sp, #0x10
    ldr r3, [r3, #0x124]
    blx r3
    ldrb r0, [r10, #0x4]
    mov r1, #0x0
    ldr r0, [r5, r0, lsl #0x2]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov002_0214d6e8
    add r0, r9, #0xf3
    add r3, r0, #0x400
    ldrb r0, [r10, #0xe]
    mov r2, #0x1
    add r1, r9, r7
    mvn r0, r2, lsl r0
    ldrb r2, [r3, r7]
    and r0, r2, r0
    strb r0, [r3, r7]
    ldrb r0, [r10, #0x4]
    ldrb r2, [r10, #0xe]
    add r0, r1, r0
    strb r2, [r0, #0x370]
    ldrb r0, [r10, #0x4]
    add r0, r1, r0, lsl #0x2
    str r6, [r0, #0x318]
    b .L_02158954
.L_02158878:
    ldr r3, .L_02158988
    add r2, sp, #0x0
    mov r1, #0x4
.L_02158884:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne .L_02158884
    cmp r8, #0x0
    bne .L_021588b4
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    ldr r4, [r0, #0x4]
    bl func_ov002_0215790c
    ldr r0, .L_02158984
    b .L_021588c8
.L_021588b4:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r4, [r0, #0x4]
    bl func_ov002_0215790c
    ldr r0, .L_02158984
.L_021588c8:
    str r4, [r0, #0x0]
    ldrb r1, [r10, #0x4]
    ldr r0, [r10, #0x10]
    sub r1, r1, #0x4
    and r4, r1, #0xff
    bl func_020329ec
    bl func_ov002_0214d498
    ldr r1, .L_02158978
    add r2, r9, #0x1f0
    smulbb r5, r8, r1
    add r6, r2, r5
    str r0, [r6, r4, lsl #0x2]
    ldrb r1, [r10, #0xc]
    ldr r2, [r10, #0x10]
    ldr r0, [r0, #0x4]
    add r1, r2, r1
    mov r2, #0x0
    bl func_02023894
    ldr r2, [r6, r4, lsl #0x2]
    ldrb r1, [r10, #0xb]
    add r0, sp, #0x0
    ldr r2, [r2, #0x4]
    ldrb r0, [r0, r1]
    add r1, sp, #0x4
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x4]
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r0, r9, r5
    ldr r1, [r10, #0x10]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0x4bc]
    bl func_ov002_0214d6e8
.L_02158954:
    ldr r0, .L_02158970
    mov r1, #0x2000
    str r1, [r0, #0x0]
    mov r0, #0x0
    add sp, sp, #0x134
    add sp, sp, #0x400
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02158970: .word data_020a10a8
.L_02158974: .word data_ov002_0215c98c
.L_02158978: .word 0x4dc
.L_0215897c: .word data_ov002_0215c784
.L_02158980: .word data_ov002_0215cab0
.L_02158984: .word data_020a0dd0
.L_02158988: .word data_ov002_0215b08b
    arm_func_end func_ov002_0215818c

    .global func_ov002_0215898c
    arm_func_start func_ov002_0215898c
func_ov002_0215898c: ; 0x0215898c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    mov r8, r0
    mov r7, r1
    ldr r0, .L_02158bb4
    mov r6, r2
    add r1, r7, #0x20
    ldrb r2, [r8, #0x4]
    ldrsh r3, [r8, #0x6]
    smlabb r4, r6, r0, r1
    mov r0, #0xc
    mla r1, r2, r0, r4
    mov r2, r3, lsl #0xc
    str r2, [r1, #0x370]
    ldrb r2, [r8, #0x4]
    ldrsh r3, [r8, #0x8]
    ldr r1, .L_02158bb8
    mla r0, r2, r0, r4
    mov r2, r3, lsl #0xc
    str r2, [r0, #0x374]
    ldrb r2, [r8, #0x4]
    ldrsb r0, [r1, r2]
    cmp r0, #0x0
    beq .L_02158b1c
    add r0, r4, r2, lsl #0x1
    add r0, r0, #0x400
    mov r1, #0x64
    strh r1, [r0, #0x8c]
    ldrsh r0, [r8, #0x8]
    add r1, sp, #0x14
    add r2, sp, #0x10
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x10]
    ldrsh r0, [r8, #0x6]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x14]
    ldrb r0, [r8, #0x4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x1c0]
    bl func_ov002_0214d4c0
    ldrb r0, [r8, #0x4]
    mov r1, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x1c0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x1000
    str r0, [sp, #0xc]
    ldrb r0, [r8, #0x4]
    add r1, sp, #0xc
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x1c0]
    bl func_ov002_02151858
    ldr r2, [r4, #0x34c]
    ldrh r1, [r2, #0x2]
    ldrb r0, [r2, r1]
    add r2, r2, r1
    cmp r0, #0x4
    bne .L_02158acc
    ldrb r0, [r8, #0x4]
    ldrh r1, [r2, #0x8]
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x400
    strh r1, [r0, #0x8c]
    ldrh r0, [r2, #0x8]
    bl func_0200c99c
    ldr r1, .L_02158bbc
    bl func_0200c5ac
    mov r1, r0
    ldr r0, .L_02158bc0
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x8]
    ldrb r0, [r8, #0x4]
    add r1, sp, #0x8
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x1c0]
    bl func_ov002_02151858
.L_02158acc:
    ldrb r0, [r8, #0x5]
    tst r0, #0x2
    ldrb r0, [r8, #0x4]
    beq .L_02158afc
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2f8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    b .L_02158b6c
.L_02158afc:
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2f8]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    b .L_02158b6c
.L_02158b1c:
    ldrsh r1, [r8, #0x8]
    sub r0, r2, #0x4
    and r5, r0, #0xff
    mov r0, r1, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r2, [r8, #0x6]
    add r0, r4, r5, lsl #0x2
    add r1, sp, #0x4
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x1d0]
    add r2, sp, #0x0
    bl func_ov002_0214d4c0
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1d0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02158b6c:
    ldrb r0, [r8, #0x5]
    tst r0, #0x1
    moveq r0, #0x0
    beq .L_02158bac
    ldr r5, [r4, #0x34c]
    add r0, r4, #0x400
    ldrh r3, [r5, #0x2]
    mov r1, r7
    mov r2, r6
    add r3, r5, r3
    str r3, [r4, #0x34c]
    ldrsh r3, [r0, #0x6c]
    add r3, r3, #0x1
    strh r3, [r0, #0x6c]
    ldr r0, [r4, #0x34c]
    bl func_ov002_02158bc4
.L_02158bac:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02158bb4: .word 0x4dc
.L_02158bb8: .word data_ov002_0215c98c
.L_02158bbc: .word 0x42c80000
.L_02158bc0: .word 0x45800000
    arm_func_end func_ov002_0215898c

    .global func_ov002_02158bc4
    arm_func_start func_ov002_02158bc4
func_ov002_02158bc4: ; 0x02158bc4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, .L_02158d30
    ldrb r4, [r0, #0x4]
    smulbb ip, r2, r3
    add r3, r1, #0x20
    add r3, r3, ip
    add r4, r3, r4, lsl #0x1
    ldrsh r5, [r0, #0x6]
    add lr, r4, #0x400
    strh r5, [lr, #0x18]
    ldrb r4, [r0, #0x4]
    ldrsh r5, [r0, #0x8]
    add r4, r3, r4, lsl #0x1
    add lr, r4, #0x400
    strh r5, [lr, #0x34]
    ldrb r4, [r0, #0x4]
    ldrsh r5, [r0, #0xa]
    add r4, r3, r4, lsl #0x1
    add lr, r4, #0x400
    strh r5, [lr, #0x50]
    ldrb r4, [r0, #0x5]
    tst r4, #0x1
    movne r4, #0x1
    moveq r4, #0x0
    strb r4, [r3, #0x4db]
    ldrb r4, [r0, #0x5]
    tst r4, #0x2
    bne .L_02158d20
    ldrb r4, [r0, #0x4]
    mov r2, #0xc
    mov lr, #0x1c
    smulbb r6, r4, r2
    add r7, r3, #0x370
    ldr r2, [r7, r6]
    smulbb r4, r4, lr
    add r5, r3, #0xc
    str r2, [r5, r4]
    add r6, r7, r6
    ldr r2, [r6, #0x4]
    add r4, r5, r4
    str r2, [r4, #0x4]
    ldr r2, [r6, #0x8]
    str r2, [r4, #0x8]
    ldrb r5, [r0, #0x4]
    add r2, r3, r5, lsl #0x1
    add r2, r2, #0x400
    mla r4, r5, lr, r3
    ldrsh r2, [r2, #0x18]
    strh r2, [r4, #0x18]
    ldrb r5, [r0, #0x4]
    add r2, r3, r5, lsl #0x1
    add r2, r2, #0x400
    mla r4, r5, lr, r3
    ldrsh r2, [r2, #0x34]
    strh r2, [r4, #0x1a]
    ldrb r4, [r0, #0x4]
    cmp r4, #0x4
    addlo r1, r1, ip
    addlo r1, r1, r4, lsl #0x2
    ldrlo r1, [r1, #0x1e0]
    mla r2, r4, lr, r3
    strlo r1, [r2, #0x4]
    addhs ip, r1, ip
    subhs r1, r4, #0x4
    addhs r1, ip, r1, lsl #0x2
    ldrhs r1, [r1, #0x1f0]
    strhs r1, [r2, #0x8]
    ldrb r1, [r0, #0x4]
    mov r2, #0x1c
    mla ip, r1, r2, r3
    add r1, r3, r1, lsl #0x1
    add r1, r1, #0x400
    ldrsh r1, [r1, #0x50]
    strh r1, [ip, #0x1c]
    ldrb ip, [r0, #0x4]
    mla r1, ip, r2, r3
    strb ip, [r1, #0x1e]
    ldrb r1, [r0, #0x5]
    ldrb r2, [r0, #0x4]
    mov r0, #0x0
    tst r1, #0x1
    mov r1, #0x1c
    movne r4, #0x1
    mla r1, r2, r1, r3
    moveq r4, #0x0
    strb r4, [r1, #0x1f]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02158d20:
    ldr ip, .L_02158d34
    str ip, [r3, #0x1bc]
    bl func_ov002_02158d38
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02158d30: .word 0x4dc
.L_02158d34: .word func_ov002_02158d38
    arm_func_end func_ov002_02158bc4

    .global func_ov002_02158d38
    arm_func_start func_ov002_02158d38
func_ov002_02158d38: ; 0x02158d38
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, .L_02158e60
    ldrb r3, [r5, #0x4]
    smulbb r6, r2, r0
    add r0, r1, #0x20
    cmp r3, #0x4
    add r4, r0, r6
    bhs .L_02158db4
    add r0, r1, r6
    add r0, r0, r3, lsl #0x2
    ldr ip, [r0, #0x1e0]
    add r1, r4, #0x370
    mov r0, #0xc
    mla r0, r3, r0, r1
    add r1, r4, #0x18
    add r2, r4, #0x34
    add r1, r1, #0x400
    add r2, r2, #0x400
    add r6, r4, #0x450
    str ip, [sp, #0x0]
    mov ip, #0x0
    str ip, [sp, #0x4]
    ldrb ip, [r4, #0x4db]
    add r1, r1, r3, lsl #0x1
    add r2, r2, r3, lsl #0x1
    add r3, r6, r3, lsl #0x1
    str ip, [sp, #0x8]
    bl func_ov002_02158e64
    b .L_02158e08
.L_02158db4:
    mov r2, #0x0
    add r1, r1, r6
    sub r0, r3, #0x4
    str r2, [sp, #0x0]
    add r0, r1, r0, lsl #0x2
    ldr r1, [r0, #0x1f0]
    add r0, r4, #0x18
    str r1, [sp, #0x4]
    add r1, r4, #0x34
    ldrb ip, [r4, #0x4db]
    add r6, r0, #0x400
    add r2, r1, #0x400
    add lr, r4, #0x450
    add r1, r4, #0x370
    mov r0, #0xc
    mla r0, r3, r0, r1
    add r1, r6, r3, lsl #0x1
    add r2, r2, r3, lsl #0x1
    add r3, lr, r3, lsl #0x1
    str ip, [sp, #0x8]
    bl func_ov002_02158e64
.L_02158e08:
    ldrb r3, [r5, #0x4]
    add r0, r4, r3, lsl #0x1
    add r0, r0, #0x400
    ldrsh r1, [r0, #0x50]
    cmp r1, #0x0
    movgt r0, #0x1
    bgt .L_02158e58
    mov r2, #0xc
    mla r1, r3, r2, r4
    ldrsh r3, [r0, #0x18]
    mov r0, #0x0
    mov r3, r3, lsl #0xc
    str r3, [r1, #0x370]
    ldrb r5, [r5, #0x4]
    add r1, r4, r5, lsl #0x1
    add r1, r1, #0x400
    ldrsh r3, [r1, #0x34]
    mla r1, r5, r2, r4
    mov r2, r3, lsl #0xc
    str r2, [r1, #0x374]
.L_02158e58:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02158e60: .word 0x4dc
    arm_func_end func_ov002_02158d38

    .global func_ov002_02158e64
    arm_func_start func_ov002_02158e64
func_ov002_02158e64: ; 0x02158e64
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r7, r0
    add r0, sp, #0x0
    mov r5, r1
    mov r4, r2
    mov r6, r3
    bl func_ov002_021518d4
    ldrb r0, [sp, #0x30]
    ldrsh r2, [r5, #0x0]
    ldr r1, [r7, #0x0]
    cmp r0, #0x0
    rsb r3, r1, r2, lsl #0xc
    str r3, [sp, #0x0]
    ldrsh r1, [r4, #0x0]
    ldr r0, [r7, #0x4]
    rsb r2, r0, r1, lsl #0xc
    str r2, [sp, #0x4]
    beq .L_02158ec8
    ldrsh r0, [r6, #0x0]
    cmp r0, #0x0
    movgt r1, r3, lsl #0x1
    movgt r0, r2, lsl #0x1
    strgt r1, [sp, #0x0]
    strgt r0, [sp, #0x4]
.L_02158ec8:
    ldr r0, [sp, #0x0]
    mov r5, r0
    cmp r0, #0x0
    ble .L_02158ef8
    ldrsh r4, [r6, #0x0]
    mov r0, r5, asr #0xb
    add r0, r5, r0, lsr #0x14
    mov r1, r4
    mov r0, r0, asr #0xc
    bl func_0200d12c
    cmp r1, r4, asr #0x1
    bgt .L_02158f24
.L_02158ef8:
    cmp r5, #0x0
    bgt .L_02158f5c
    ldrsh r4, [r6, #0x0]
    mov r0, r5, asr #0xb
    add r0, r5, r0, lsr #0x14
    mov r1, r4
    mov r0, r0, asr #0xc
    bl func_0200d12c
    rsb r0, r1, #0x0
    cmp r0, r4, asr #0x1
    ble .L_02158f5c
.L_02158f24:
    cmp r5, #0x0
    movgt r8, #0x1
    mvnle r8, #0x0
    mov r0, r5
    mov r1, r4
    bl func_0200d12c
    add r1, r0, r8, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x4
    str r0, [sp, #0x0]
    b .L_02158f6c
.L_02158f5c:
    ldrsh r1, [r6, #0x0]
    mov r0, r5
    bl func_0200d12c
    str r0, [sp, #0x0]
.L_02158f6c:
    ldr r5, [sp, #0x4]
    cmp r5, #0x0
    ble .L_02158f98
    ldrsh r4, [r6, #0x0]
    mov r0, r5, asr #0xb
    add r0, r5, r0, lsr #0x14
    mov r1, r4
    mov r0, r0, asr #0xc
    bl func_0200d12c
    cmp r1, r4, asr #0x1
    bgt .L_02158fc4
.L_02158f98:
    cmp r5, #0x0
    bgt .L_02158ffc
    ldrsh r4, [r6, #0x0]
    mov r0, r5, asr #0xb
    add r0, r5, r0, lsr #0x14
    mov r1, r4
    mov r0, r0, asr #0xc
    bl func_0200d12c
    rsb r0, r1, #0x0
    cmp r0, r4, asr #0x1
    ble .L_02158ffc
.L_02158fc4:
    cmp r5, #0x0
    movgt r8, #0x1
    mvnle r8, #0x0
    mov r0, r5
    mov r1, r4
    bl func_0200d12c
    add r1, r0, r8, lsl #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x4
    str r0, [sp, #0x4]
    b .L_0215900c
.L_02158ffc:
    ldrsh r1, [r6, #0x0]
    mov r0, r5
    bl func_0200d12c
    str r0, [sp, #0x4]
.L_0215900c:
    ldr r2, [r7, #0x0]
    ldr r1, [sp, #0x0]
    ldr r0, [sp, #0x28]
    add r1, r2, r1
    str r1, [r7, #0x0]
    ldr r2, [r7, #0x4]
    ldr r1, [sp, #0x4]
    cmp r0, #0x0
    add r1, r2, r1
    str r1, [r7, #0x4]
    beq .L_02159044
    mov r1, r7
    bl func_ov002_0214f960
    b .L_02159058
.L_02159044:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x0
    beq .L_02159058
    mov r1, r7
    bl func_ov002_0214f960
.L_02159058:
    ldrsh r0, [r6, #0x0]
    sub r0, r0, #0x1
    strh r0, [r6, #0x0]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov002_02158e64

    .global func_ov002_0215906c
    arm_func_start func_ov002_0215906c
func_ov002_0215906c: ; 0x0215906c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb ip, [r5, #0x4]
    ldr r3, .L_021591b0
    ldr r0, .L_021591b4
    ldrsb r3, [r3, ip]
    add r1, r1, #0x20
    smlabb r4, r2, r0, r1
    cmp r3, #0x0
    beq .L_02159180
    add r0, r4, ip, lsl #0x2
    ldr r0, [r0, #0x1c0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldrb r0, [r5, #0x4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x1c0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldrb r1, [r5, #0x4]
    mov r3, #0x0
    mov r0, #0x1c
    add r1, r4, r1, lsl #0x2
    str r3, [r1, #0x1c0]
    ldrb r1, [r5, #0x4]
    add r2, r4, #0x4
    smulbb r1, r1, r0
    ldr r0, [r2, r1]
    cmp r0, #0x0
    strne r3, [r2, r1]
    ldrb r1, [r5, #0x4]
    mov r0, #0xc
    add r2, r4, #0x18c
    smulbb r1, r1, r0
    ldr r0, [r2, r1]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r2, r1]
    ldrb r2, [r5, #0x4]
    mov r0, #0x3000
    add r1, sp, #0x0
    add r2, r4, r2, lsl #0x2
    ldr r2, [r2, #0x2f8]
    str r0, [sp, #0x0]
    ldr r0, [r2, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldrb r0, [r5, #0x4]
    mov r1, #0x0
    mov r2, #0x1
    add r0, r4, r0, lsl #0x2
    str r1, [r0, #0x2f8]
    ldrb r0, [r5, #0x4]
    ldrb r3, [r4, #0x4d3]
    sub r1, r2, #0x2
    add r0, r4, r0
    add r0, r0, #0x300
    ldrsb r0, [r0, #0x50]
    orr r0, r3, r2, lsl r0
    strb r0, [r4, #0x4d3]
    ldrb r0, [r5, #0x4]
    add r0, r4, r0
    strb r1, [r0, #0x350]
    b .L_021591a8
.L_02159180:
    sub r0, ip, #0x4
    and r5, r0, #0xff
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1d0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r5, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x1d0]
.L_021591a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021591b0: .word data_ov002_0215c98c
.L_021591b4: .word 0x4dc
    arm_func_end func_ov002_0215906c

    .global func_ov002_021591b8
    arm_func_start func_ov002_021591b8
func_ov002_021591b8: ; 0x021591b8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r3, .L_021592e4
    mov r6, r1
    smulbb r5, r2, r3
    mov r7, r0
    add r0, r6, #0x20
    add r4, r0, r5
    ldrb r0, [r7, #0x4]
    ldrsh r2, [r7, #0x6]
    add r1, r4, #0x8c
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x400
    strh r2, [r0, #0x84]
    ldrb r0, [r7, #0x4]
    ldrh r2, [r7, #0x8]
    add r3, r4, #0x94
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x400
    strh r2, [r0, #0x94]
    add r0, r4, #0x84
    ldrb r2, [r7, #0x4]
    add r8, r1, #0x400
    add ip, r0, #0x400
    add r1, r4, r2, lsl #0x2
    add lr, r3, #0x400
    ldr r3, [r1, #0x1c0]
    add r0, r8, r2, lsl #0x1
    add r1, lr, r2, lsl #0x1
    add r2, ip, r2, lsl #0x1
    bl func_ov002_02159db4
    ldrb r0, [r7, #0x5]
    tst r0, #0x1
    ldrb r0, [r7, #0x4]
    bne .L_021592c0
    mov r2, #0xc
    mla r1, r0, r2, r4
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x400
    add r3, r6, r5
    ldrh r5, [r0, #0x8c]
    add r1, r1, #0x100
    mov r0, #0x0
    strh r5, [r1, #0x92]
    ldrb r1, [r7, #0x4]
    mla r5, r1, r2, r4
    add r1, r4, r1, lsl #0x1
    add r1, r1, #0x400
    ldrh r6, [r1, #0x94]
    add r1, r5, #0x100
    strh r6, [r1, #0x94]
    ldrb r5, [r7, #0x4]
    add r3, r3, r5, lsl #0x2
    mla r1, r5, r2, r4
    ldr r3, [r3, #0x1e0]
    str r3, [r1, #0x18c]
    ldrb r1, [r7, #0x4]
    mla r3, r1, r2, r4
    add r1, r4, r1, lsl #0x1
    add r1, r1, #0x400
    ldrsh r5, [r1, #0x84]
    add r1, r3, #0x100
    strh r5, [r1, #0x90]
    ldrb r3, [r7, #0x4]
    mla r1, r3, r2, r4
    strb r3, [r1, #0x196]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021592c0:
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x400
    ldrsh r0, [r0, #0x84]
    cmp r0, #0x0
    ldrgt r1, .L_021592e8
    movle r0, #0x0
    movgt r0, #0x1
    strgt r1, [r4, #0x1bc]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021592e4: .word 0x4dc
.L_021592e8: .word func_ov002_021592ec
    arm_func_end func_ov002_021591b8

    .global func_ov002_021592ec
    arm_func_start func_ov002_021592ec
func_ov002_021592ec: ; 0x021592ec
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, .L_02159354
    add r1, r1, #0x20
    smlabb r4, r2, r0, r1
    ldrb ip, [r5, #0x4]
    add r0, r4, #0x8c
    add r1, r4, #0x94
    add r2, r4, #0x84
    add r3, r4, ip, lsl #0x2
    add r0, r0, #0x400
    add r1, r1, #0x400
    add r2, r2, #0x400
    ldr r3, [r3, #0x1c0]
    add r0, r0, ip, lsl #0x1
    add r1, r1, ip, lsl #0x1
    add r2, r2, ip, lsl #0x1
    bl func_ov002_02159db4
    ldrb r0, [r5, #0x4]
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x400
    ldrsh r0, [r0, #0x84]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02159354: .word 0x4dc
    arm_func_end func_ov002_021592ec

    .global func_ov002_02159358
    arm_func_start func_ov002_02159358
func_ov002_02159358: ; 0x02159358
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r3, .L_0215948c
    mov r6, r1
    mul r5, r2, r3
    add r1, r6, #0x20
    mov r7, r0
    cmp r2, #0x0
    add r4, r1, r5
    bne .L_02159394
    ldrb r1, [r7, #0x6]
    ldr r0, .L_02159490
    ldrb r0, [r0, r1]
    add r0, r0, #0x4
    and r0, r0, #0xff
    b .L_021593ac
.L_02159394:
    cmp r2, #0x1
    ldreqb r1, [r7, #0x6]
    ldreq r0, .L_02159490
    ldreqb r0, [r0, r1]
    addeq r0, r0, #0xd
    andeq r0, r0, #0xff
.L_021593ac:
    ldrb r1, [r7, #0x6]
    cmp r1, #0x7
    bhs .L_021593f4
    ldrb r3, [r7, #0x7]
    ldrh ip, [r7, #0x4]
    ldr r1, .L_02159494
    and r8, r3, #0x1f
    ldr r3, [r1, r2, lsl #0x2]
    mov r2, r8
    and r1, ip, #0xff
    blx r3
    ldrb r0, [r7, #0x7]
    tst r0, #0x20
    bne .L_02159478
    mov r0, #0x1
    strb r0, [r4, #0x4c5]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_021593f4:
    ldrh r2, [r7, #0x4]
    add r0, r4, #0x400
    ldr r1, .L_02159498
    strh r2, [r0, #0xd6]
    ldrb r2, [r7, #0x8]
    ldr r0, .L_0215949c
    ldrb r1, [r1, r2]
    strb r1, [r4, #0x4d8]
    ldrb r1, [r7, #0x8]
    ldrb r0, [r0, r1]
    strb r0, [r4, #0x4d9]
    ldrb r0, [r7, #0x9]
    strb r0, [r4, #0x4da]
    ldr r9, [r4, #0x348]
    mov r0, r9
    bl func_ov002_021594a4
    mov r8, #0x0
    b .L_0215944c
.L_0215943c:
    mov r1, r8
    bl func_ov002_0214d678
    mov r0, r9
    bl func_ov002_021594a4
.L_0215944c:
    cmp r0, #0x0
    bne .L_0215943c
    mov r0, r4
    bl func_ov002_02159eac
    ldrb r0, [r7, #0x7]
    tst r0, #0x20
    addeq r0, r6, r5
    moveq r1, #0x1
    streqb r1, [r0, #0x4f5]
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02159478:
    ldr r1, .L_021594a0
    add r0, r6, r5
    str r1, [r0, #0x1dc]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0215948c: .word 0x4dc
.L_02159490: .word data_ov002_0215c5dc
.L_02159494: .word data_ov002_0215c5ec
.L_02159498: .word data_ov002_0215c5d4
.L_0215949c: .word data_ov002_0215c5d8
.L_021594a0: .word func_ov002_021594c4
    arm_func_end func_ov002_02159358

    .global func_ov002_021594a4
    arm_func_start func_ov002_021594a4
func_ov002_021594a4: ; 0x021594a4
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_0214d498
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_021594a4

    .global func_ov002_021594c4
    arm_func_start func_ov002_021594c4
func_ov002_021594c4: ; 0x021594c4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, .L_0215957c
    mov r6, r2
    ldrb r0, [r0, #0x6]
    mul r2, r6, r3
    mov r7, r1
    cmp r0, #0x7
    add r0, r7, #0x20
    bhs .L_02159504
    ldr r0, .L_02159580
    ldr r0, [r0, r6, lsl #0x2]
    blx r0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02159504:
    add r0, r0, r2
    bl func_ov002_02159eac
    ldr r0, .L_0215957c
    add r4, r7, #0x490
    mul r5, r6, r0
    add r0, r7, r5
    ldrb r0, [r0, #0x4f8]
    bl func_ov002_02159584
    add r1, r7, r5
    strh r0, [r4, r5]
    ldrb r0, [r1, #0x4f9]
    bl func_ov002_02159584
    add r1, r7, r5
    add r1, r1, #0x400
    add r2, r7, #0xf6
    strh r0, [r1, #0x92]
    add r1, r2, #0x400
    ldrsh r0, [r1, r5]
    sub r0, r0, #0x1
    strh r0, [r1, r5]
    ldrsh r0, [r1, r5]
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    add r1, r7, #0x92
    mov r0, #0x0
    add r1, r1, #0x400
    strh r0, [r1, r5]
    strh r0, [r4, r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215957c: .word 0x4dc
.L_02159580: .word data_ov002_0215c5e4
    arm_func_end func_ov002_021594c4

    .global func_ov002_02159584
    arm_func_start func_ov002_02159584
func_ov002_02159584: ; 0x02159584
    stmdb sp!, {r4, lr}
    ldr r1, .L_021595ac
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r4
    bl func_0200d338
    mov r0, r1
    ldmia sp!, {r4, pc}
.L_021595ac: .word data_020a0da8
    arm_func_end func_ov002_02159584

    .global func_ov002_021595b0
    arm_func_start func_ov002_021595b0
func_ov002_021595b0: ; 0x021595b0
    ldr r3, .L_021595d8
    ldrsh r0, [r0, #0x4]
    smlabb r2, r2, r3, r1
    sub r3, r0, #0x1
    add r0, r2, #0x400
    ldr r1, .L_021595dc
    strh r3, [r0, #0x8e]
    str r1, [r2, #0x1dc]
    mov r0, #0x1
    bx lr
.L_021595d8: .word 0x4dc
.L_021595dc: .word func_ov002_021595e0
    arm_func_end func_ov002_021595b0

    .global func_ov002_021595e0
    arm_func_start func_ov002_021595e0
func_ov002_021595e0: ; 0x021595e0
    ldr r3, .L_02159610
    add r0, r1, #0x8e
    smulbb r1, r2, r3
    add r2, r0, #0x400
    ldrsh r0, [r2, r1]
    sub r0, r0, #0x1
    strh r0, [r2, r1]
    ldrsh r0, [r2, r1]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02159610: .word 0x4dc
    arm_func_end func_ov002_021595e0

    .global func_ov002_02159614
    arm_func_start func_ov002_02159614
func_ov002_02159614: ; 0x02159614
    mov r0, #0x0
    bx lr
    arm_func_end func_ov002_02159614

    .global func_ov002_0215961c
    arm_func_start func_ov002_0215961c
func_ov002_0215961c: ; 0x0215961c
    mov r0, #0x0
    bx lr
    arm_func_end func_ov002_0215961c

    .global func_ov002_02159624
    arm_func_start func_ov002_02159624
func_ov002_02159624: ; 0x02159624
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    ldr r0, .L_021597ac
    ldrsb r3, [r10, #0x24]
    mul r8, r2, r0
    sub r0, r3, #0x1
    mov r0, r0, lsl #0x3
    add r0, r0, r3, lsl #0x4
    mov r9, r1
    rsb r0, r0, #0xc0
    mov r0, r0, lsl #0xf
    add r7, r9, r8
    strb r3, [r7, #0x4f4]
    mov r5, r0, asr #0x10
    mov r4, #0x0
    mov r11, #0xc
.L_02159668:
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0x350]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0x350]
    ldr r6, [r0, #0x4]
    ldr r0, [r6, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldrsb r0, [r10, #0x24]
    cmp r4, r0
    bge .L_02159748
    add r0, r10, r4, lsl #0x1
    ldrsh r2, [r0, #0x14]
    mov r0, r5, lsl #0xc
    add r1, r7, r4, lsl #0x2
    str r0, [sp, #0x0]
    smulbb r0, r2, r11
    rsb r0, r0, #0x100
    mov r0, r0, asr #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x4
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x350]
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov002_0214d4c0
    add r0, r7, r4, lsl #0x2
    ldr r1, [r0, #0x350]
    add r0, r10, r4, lsl #0x1
    ldr r2, [r1, #0x4]
    ldrh r1, [r0, #0x4]
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    add r1, r10, r1
    ldr r2, [r2, #0x68]
    blx r2
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0x350]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r5, #0x18
    mov r0, r0, lsl #0x10
    mov r5, r0, asr #0x10
.L_02159748:
    add r4, r4, #0x1
    cmp r4, #0x6
    blt .L_02159668
    ldr r2, .L_021597b0
    add r1, r9, r8
    add r0, r9, #0xf2
    str r2, [r1, #0x1dc]
    add r4, r0, #0x400
    mov r0, #0x0
    strb r0, [r4, r8]
    bl func_ov002_0215790c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    mov r2, #0x1e
    bl func_ov002_0214e2d8
    bl func_0203b3f4
    ldrb r1, [r4, r8]
    ldr r0, [r0, #0x88]
    rsb r2, r1, #0x10
    bl func_ov002_021597b4
    bl func_ov002_0214d6e8
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021597ac: .word 0x4dc
.L_021597b0: .word func_ov002_021597d0
    arm_func_end func_ov002_02159624

    .global func_ov002_021597b4
    arm_func_start func_ov002_021597b4
func_ov002_021597b4: ; 0x021597b4
    ldr r3, [r0, #0x4]
    mov r0, #0x1
    str r1, [r3, #0x8c0]
    str r2, [r3, #0x8c4]
    str r0, [r3, #0x8f0]
    strb r0, [r3, #0x902]
    bx lr
    arm_func_end func_ov002_021597b4

    .global func_ov002_021597d0
    arm_func_start func_ov002_021597d0
func_ov002_021597d0: ; 0x021597d0
    stmdb sp!, {r4, lr}
    ldr r0, .L_02159850
    add r1, r1, #0x20
    smlabb r4, r2, r0, r1
    ldrb r0, [r4, #0x4d2]
    add r1, r0, #0x1
    and r0, r1, #0xff
    cmp r0, #0x10
    strb r1, [r4, #0x4d2]
    movhi r0, #0x10
    strhib r0, [r4, #0x4d2]
    cmp r2, #0x1
    bne .L_02159848
    bl func_ov002_0215790c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    mov r2, #0x1e
    bl func_ov002_0214e2d8
    bl func_0203b3f4
    ldrb r1, [r4, #0x4d2]
    ldr r0, [r0, #0x88]
    rsb r2, r1, #0x10
    bl func_ov002_021597b4
    bl func_ov002_0214d6e8
    ldrb r0, [r4, #0x4d2]
    cmp r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_02159848:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02159850: .word 0x4dc
    arm_func_end func_ov002_021597d0

    .global func_ov002_02159854
    arm_func_start func_ov002_02159854
func_ov002_02159854: ; 0x02159854
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r0, .L_021598d8
    ldrb r3, [r8, #0x4]
    mov r7, r1
    smulbb r5, r2, r0
    sub r1, r3, #0x4
    add r0, r7, #0x1f0
    add r6, r0, r5
    and r4, r1, #0xff
    add r0, r7, r5
    add r0, r0, r4, lsl #0x2
    ldr r3, [r6, r4, lsl #0x2]
    ldr r1, [r0, #0x4bc]
    ldrb r2, [r8, #0x5]
    ldr r0, [r3, #0x4]
    add r1, r2, r1
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrb r0, [r8, #0x6]
    tst r0, #0x1
    ldrne r1, .L_021598dc
    addne r0, r7, r5
    strne r1, [r0, #0x1dc]
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021598d8: .word 0x4dc
.L_021598dc: .word func_ov002_021598e0
    arm_func_end func_ov002_02159854

    .global func_ov002_021598e0
    arm_func_start func_ov002_021598e0
func_ov002_021598e0: ; 0x021598e0
    stmdb sp!, {r3, lr}
    ldrb r3, [r0, #0x4]
    ldr r0, .L_02159920
    smlabb r1, r2, r0, r1
    sub r0, r3, #0x4
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x1f0]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_02159920: .word 0x4dc
    arm_func_end func_ov002_021598e0

    .global func_ov002_02159924
    arm_func_start func_ov002_02159924
func_ov002_02159924: ; 0x02159924
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, .L_02159984
    add r3, r1, #0xf2
    smulbb r5, r2, r0
    ldr r2, .L_02159988
    add r0, r1, r5
    str r2, [r0, #0x1dc]
    add r4, r3, #0x400
    mov r0, #0x10
    strb r0, [r4, r5]
    bl func_ov002_0215790c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    mov r2, #0x1e
    bl func_ov002_0214e2d8
    bl func_0203b3f4
    ldrb r1, [r4, r5]
    ldr r0, [r0, #0x88]
    rsb r2, r1, #0x10
    bl func_ov002_021597b4
    bl func_ov002_0214d6e8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02159984: .word 0x4dc
.L_02159988: .word func_ov002_0215998c
    arm_func_end func_ov002_02159924

    .global func_ov002_0215998c
    arm_func_start func_ov002_0215998c
func_ov002_0215998c: ; 0x0215998c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_02159a30
    mov r4, r1
    smulbb r6, r2, r0
    add r0, r4, #0x20
    add r5, r0, r6
    ldrb r0, [r5, #0x4d2]
    sub r0, r0, #0x1
    strb r0, [r5, #0x4d2]
    bl func_ov002_0215790c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    mov r2, #0x1e
    bl func_ov002_0214e2d8
    bl func_0203b3f4
    ldrb r1, [r5, #0x4d2]
    ldr r0, [r0, #0x88]
    rsb r2, r1, #0x10
    bl func_ov002_021597b4
    bl func_ov002_0214d6e8
    ldrb r0, [r5, #0x4d2]
    cmp r0, #0x0
    bne .L_02159a28
    mov r5, #0x0
    add r6, r4, r6
    mov r4, r5
.L_021599f8:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x350]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_021599f8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02159a28:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_02159a30: .word 0x4dc
    arm_func_end func_ov002_0215998c

    .global func_ov002_02159a34
    arm_func_start func_ov002_02159a34
func_ov002_02159a34: ; 0x02159a34
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r1, [r4, #0x4]
    ldr r0, .L_02159ab0
    ldr r0, [r0, r1, lsl #0x4]
    cmp r0, #0x1
    bne .L_02159a70
    ldr r0, .L_02159ab4
    ldr r0, [r0, r1, lsl #0x4]
    bl func_020736b4
    ldrb r2, [r4, #0x4]
    ldr r0, .L_02159ab8
    mov r1, #0x0
    ldr r0, [r0, r2, lsl #0x4]
    bl func_020736e4
.L_02159a70:
    ldrb r1, [r4, #0x4]
    ldr r0, .L_02159ab0
    ldr r0, [r0, r1, lsl #0x4]
    cmp r0, #0x0
    bne .L_02159aa8
    ldr r0, .L_02159ab4
    ldr r0, [r0, r1, lsl #0x4]
    bl func_02073744
    ldrb r2, [r4, #0x4]
    ldr r0, .L_02159abc
    ldr r1, .L_02159ab8
    ldr r0, [r0, r2, lsl #0x4]
    ldr r1, [r1, r2, lsl #0x4]
    bl func_0207342c
.L_02159aa8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02159ab0: .word data_ov002_0215c62c
.L_02159ab4: .word data_ov002_0215c624
.L_02159ab8: .word data_ov002_0215c628
.L_02159abc: .word data_ov002_0215c630
    arm_func_end func_ov002_02159a34

    .global func_ov002_02159ac0
    arm_func_start func_ov002_02159ac0
func_ov002_02159ac0: ; 0x02159ac0
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    add r1, r4, #0xa00
    ldrh r1, [r1, #0x88]
    mov r5, r0
    tst r1, #0x1
    beq .L_02159ae0
    bl func_020735e4
.L_02159ae0:
    ldrb r1, [r5, #0x4]
    cmp r1, #0x6
    bne .L_02159b04
    ldrb r0, [r5, #0x5]
    bl func_0207367c
    add r0, r4, #0xa00
    ldrh r1, [r0, #0x88]
    bic r1, r1, #0x1
    b .L_02159b30
.L_02159b04:
    ldr r0, .L_02159b3c
    ldr r0, [r0, r1, lsl #0x2]
    bl func_020734e0
    ldrb r2, [r5, #0x4]
    ldr r0, .L_02159b40
    ldrb r1, [r5, #0x5]
    ldr r0, [r0, r2, lsl #0x2]
    bl func_0207361c
    add r0, r4, #0xa00
    ldrh r1, [r0, #0x88]
    orr r1, r1, #0x1
.L_02159b30:
    strh r1, [r0, #0x88]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02159b3c: .word data_ov002_0215c5f4
.L_02159b40: .word data_ov002_0215c60c
    arm_func_end func_ov002_02159ac0

    .global func_ov002_02159b44
    arm_func_start func_ov002_02159b44
func_ov002_02159b44: ; 0x02159b44
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r3, .L_02159db0
    mov r5, r2
    add r1, r1, #0x20
    smlabb r8, r5, r3, r1
    mov r6, r0
    mov r4, #0x0
    mov r11, #0x1
    mov r7, #0x3
.L_02159b68:
    cmp r5, #0x0
    add r1, r6, r4, lsl #0x2
    add r0, r8, r4, lsl #0x2
    bne .L_02159c8c
    ldrb r1, [r1, #0x7]
    ldrb r0, [r0, #0x4c9]
    cmp r0, r1
    beq .L_02159bf0
    cmp r1, #0x8
    add r0, r4, #0x1
    bne .L_02159bac
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    b .L_02159bc0
.L_02159bac:
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r11
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
.L_02159bc0:
    add r1, r6, r4, lsl #0x2
    add r0, r4, #0x1
    ldrb r9, [r1, #0x7]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r9
    ldr r0, [r0, #0x4]
    bl func_0203d478
    add r0, r6, r4, lsl #0x2
    ldrb r1, [r0, #0x7]
    add r0, r8, r4, lsl #0x2
    strb r1, [r0, #0x4c9]
.L_02159bf0:
    add r1, r6, r4, lsl #0x2
    add r0, r8, r4, lsl #0x2
    ldrb r10, [r1, #0x5]
    ldrb r0, [r0, #0x4c7]
    cmp r0, r10
    beq .L_02159c40
    add r0, r4, #0x1
    ldrb r9, [r1, #0x6]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r10
    ldr r0, [r0, #0x4]
    mov r2, r9
    bl func_0203cfbc
    add r2, r6, r4, lsl #0x2
    ldrb r0, [r2, #0x5]
    add r1, r8, r4, lsl #0x2
    strb r0, [r1, #0x4c7]
    ldrb r0, [r2, #0x6]
    strb r0, [r1, #0x4c8]
.L_02159c40:
    add r1, r6, r4, lsl #0x2
    add r0, r8, r4, lsl #0x2
    ldrb r9, [r1, #0x4]
    ldrb r0, [r0, #0x4c6]
    cmp r0, r9
    beq .L_02159d9c
    add r0, r4, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r9, lsl #0xa
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    add r0, r6, r4, lsl #0x2
    ldrb r1, [r0, #0x4]
    add r0, r8, r4, lsl #0x2
    strb r1, [r0, #0x4c6]
    b .L_02159d9c
.L_02159c8c:
    ldrb r1, [r1, #0x7]
    ldrb r0, [r0, #0x4c9]
    cmp r0, r1
    beq .L_02159d04
    cmp r1, #0x8
    add r0, r4, #0x1
    bne .L_02159cc0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    b .L_02159cd4
.L_02159cc0:
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
.L_02159cd4:
    add r1, r6, r4, lsl #0x2
    add r0, r4, #0x1
    ldrb r9, [r1, #0x7]
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r9
    ldr r0, [r0, #0x4]
    bl func_0203d478
    add r0, r6, r4, lsl #0x2
    ldrb r1, [r0, #0x7]
    add r0, r8, r4, lsl #0x2
    strb r1, [r0, #0x4c9]
.L_02159d04:
    add r1, r6, r4, lsl #0x2
    add r0, r8, r4, lsl #0x2
    ldrb r10, [r1, #0x5]
    ldrb r0, [r0, #0x4c7]
    cmp r0, r10
    beq .L_02159d54
    add r0, r4, #0x1
    ldrb r9, [r1, #0x6]
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r10
    ldr r0, [r0, #0x4]
    mov r2, r9
    bl func_0203cfbc
    add r2, r6, r4, lsl #0x2
    ldrb r0, [r2, #0x5]
    add r1, r8, r4, lsl #0x2
    strb r0, [r1, #0x4c7]
    ldrb r0, [r2, #0x6]
    strb r0, [r1, #0x4c8]
.L_02159d54:
    add r1, r6, r4, lsl #0x2
    add r0, r8, r4, lsl #0x2
    ldrb r9, [r1, #0x4]
    ldrb r0, [r0, #0x4c6]
    cmp r0, r9
    beq .L_02159d9c
    add r0, r4, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r9, lsl #0xa
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    add r0, r6, r4, lsl #0x2
    ldrb r1, [r0, #0x4]
    add r0, r8, r4, lsl #0x2
    strb r1, [r0, #0x4c6]
.L_02159d9c:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_02159b68
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02159db0: .word 0x4dc
    arm_func_end func_ov002_02159b44

    .global func_ov002_02159db4
    arm_func_start func_ov002_02159db4
func_ov002_02159db4: ; 0x02159db4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    ldrh r1, [r1, #0x0]
    ldrh r0, [r6, #0x0]
    mov r5, r2
    mov r4, r3
    sub r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
    cmp r8, #0x0
    ble .L_02159df8
    ldrsh r7, [r5, #0x0]
    mov r0, r8
    mov r1, r7
    bl func_0200d12c
    cmp r1, r7, asr #0x1
    bgt .L_02159e1c
.L_02159df8:
    cmp r8, #0x0
    bgt .L_02159e44
    ldrsh r7, [r5, #0x0]
    mov r0, r8
    mov r1, r7
    bl func_0200d12c
    rsb r0, r1, #0x0
    cmp r0, r7, asr #0x1
    ble .L_02159e44
.L_02159e1c:
    cmp r8, #0x0
    movgt r9, #0x1
    mvnle r9, #0x0
    mov r0, r8
    mov r1, r7
    bl func_0200d12c
    add r0, r0, r9
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    b .L_02159e58
.L_02159e44:
    ldrsh r1, [r5, #0x0]
    mov r0, r8
    bl func_0200d12c
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
.L_02159e58:
    ldrh r0, [r6, #0x0]
    add r0, r0, r1
    strh r0, [r6, #0x0]
    ldrh r0, [r6, #0x0]
    bl func_0200c99c
    ldr r1, .L_02159ea4
    bl func_0200c5ac
    mov r1, r0
    ldr r0, .L_02159ea8
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x0]
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_02151858
    ldrsh r0, [r5, #0x0]
    sub r0, r0, #0x1
    strh r0, [r5, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02159ea4: .word 0x42c80000
.L_02159ea8: .word 0x45800000
    arm_func_end func_ov002_02159db4

    .global func_ov002_02159eac
    arm_func_start func_ov002_02159eac
func_ov002_02159eac: ; 0x02159eac
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r6, [r4, #0x348]
    mov r7, #0x0
    mov r5, #0x1
.L_02159ec0:
    ldrb r0, [r4, #0x4da]
    tst r0, r5, lsl r7
    addne r0, r4, r7, lsl #0x2
    ldrne r0, [r0, #0x1c0]
    cmpne r0, #0x0
    beq .L_02159ee0
    mov r1, r6
    bl func_ov002_0214d678
.L_02159ee0:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_02159ec0
    ldrb r0, [r4, #0x4da]
    tst r0, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r5, #0x0
.L_02159efc:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1d0]
    cmp r0, #0x0
    beq .L_02159f14
    mov r1, r6
    bl func_ov002_0214d678
.L_02159f14:
    add r5, r5, #0x1
    cmp r5, #0xa
    blt .L_02159efc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov002_02159eac

    .global func_ov002_02159f24
    arm_func_start func_ov002_02159f24
func_ov002_02159f24: ; 0x02159f24
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x100
    mov r5, r0
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x100
    bl func_020517fc
    ldr r1, [r5, #0x4]
    add r0, sp, #0x0
    ldrb r4, [r1, #0x0]
    add r2, r1, #0x1
    ldr r1, .L_02159fe0
    str r2, [r5, #0x4]
    bl func_02074000
    add r2, sp, #0x5
    b .L_02159f84
.L_02159f64:
    ldr r0, [r5, #0x4]
    mov r1, r0
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    ldrsb r1, [r1, #0x0]
    sub r0, r4, #0x1
    and r4, r0, #0xff
    strb r1, [r2], #0x1
.L_02159f84:
    cmp r4, #0x0
    bne .L_02159f64
    add r0, sp, #0x0
    bl func_02035c90
    mov r6, r0
    ldr r1, [r6, #0x38]
    cmp r1, #0x0
    bne .L_02159fb0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02159fb0:
    ldrb r0, [r5, #0x9]
    ldr r2, [r6, #0x38]
    ldr r1, [r5, #0x10]
    str r2, [r1, r0, lsl #0x2]
    ldr r0, [r5, #0x4]
    add r0, r0, r4
    str r0, [r5, #0x4]
    ldrb r0, [r5, #0x9]
    add r0, r0, #0x1
    strb r0, [r5, #0x9]
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
.L_02159fe0: .word data_ov002_0215cab0
    arm_func_end func_ov002_02159f24

    .global func_ov002_02159fe4
    arm_func_start func_ov002_02159fe4
func_ov002_02159fe4: ; 0x02159fe4
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r2, [r4, #0x8]
    ldrb r1, [r4, #0x9]
    cmp r2, r1
    bhi .L_0215a018
    ldr r1, .L_0215a034
    mov r2, #0x0
    str r2, [r1, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
.L_0215a018:
    mov r1, #0x1
    mov r0, r4
    strb r1, [r4, #0xc]
    bl func_ov002_02159f24
    mov r0, #0x0
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0215a034: .word data_020a10a8
    arm_func_end func_ov002_02159fe4

    .global func_ov002_0215a038
    arm_func_start func_ov002_0215a038
func_ov002_0215a038: ; 0x0215a038
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x98
    ldr r1, .L_0215ab94
    mov r4, r0
    ldr r2, .L_0215ab98
    mov r0, #0x5c
    mov r3, #0x36
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x5c
    mov r9, r0
    bl func_020517fc
    blx func_ov012_021b65bc
    mov r0, #0x1
    bl func_02043264
    bl func_02026f94
    str r0, [r9, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x7c]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x7c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r9, #0x4]
    ldr r1, .L_0215ab9c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x4]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    str r4, [r9, #0x50]
    bl func_020310f4
    ldr r2, .L_0215aba0
    str r0, [r9, #0x0]
    ldr r1, .L_0215aba4
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_0215aba8
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r0, #0x0
    bl func_02028920
    str r0, [r9, #0x8]
    mov r0, #0x1
    mov r1, r0
    bl func_02075fbc
    str r0, [r9, #0xc]
    bl func_02076908
    str r0, [r9, #0x10]
    mov r0, #0x0
    bl func_02070ca4
    mov r1, r0
    ldr r0, [r9, #0x10]
    bl func_020769cc
    mov r0, #0x1
    mov r1, #0x0
    mov r2, #0x3
    mov r3, r0
    str r0, [sp, #0x0]
    bl func_02078cd4
    str r0, [r9, #0x14]
    mov r1, #0x8
    mov r2, #0x0
    bl func_0207903c
    ldr r0, [r9, #0x14]
    mov r1, #0x60
    bl func_02079c30
    ldr r0, [r9, #0x14]
    ldr r1, [r9, #0x10]
    bl func_02079094
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    ldr r2, .L_0215abac
    ldr r3, [r0, #0x4]
    mov r1, #0x1
    add r0, r3, #0x800
    strh r2, [r0, #0xb8]
    strb r1, [r3, #0x8fc]
    ldr r0, .L_0215abb0
    mov r1, #0x0
    blx func_020101f4
    ldr r1, .L_0215abb4
    mov r7, r0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215abb8
    sub r3, r3, #0x1
    ldr r2, [r0, #0x0]
    str r3, [r1, #0x0]
    ldr r1, .L_0215abbc
    mov r0, #0x2
    str r2, [r1, r3, lsl #0x2]
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
    str r0, [sp, #0x74]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x74
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0x956]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r2, [r4, #0x4]
    ldr r1, .L_0215abb8
    ldr r0, .L_0215abc0
    str r2, [r1, #0x0]
    bl func_ov002_0215ae44
    mov r4, r0
    bl func_02036ab8
    bl func_ov002_0214d498
    str r0, [r9, #0x28]
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215abc4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    ldr r0, [r9, #0x28]
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_0215ae70
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0x4]
    ldr r0, [r9, #0x28]
    add r1, sp, #0x4
    add r2, sp, #0x8
    bl func_ov002_0214d4c0
    ldr r0, [r9, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    mov r0, #0x1
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
    mov r1, #0x4000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2000
    str r0, [sp, #0x78]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x78
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0x956]
    ldr r1, .L_0215abb8
    ldr r2, [r4, #0x4]
    ldr r0, .L_0215abc8
    str r2, [r1, #0x0]
    bl func_ov002_0215ae44
    mov r4, r0
    bl func_02036ab8
    bl func_ov002_0214d498
    str r0, [r9, #0x2c]
    ldr r1, .L_0215abcc
    add r0, sp, #0x80
    bl func_02074000
    ldr r0, [r9, #0x50]
    cmp r0, #0x1
    bne .L_0215a37c
    ldr r1, .L_0215abd0
    add r0, sp, #0x8e
    bl func_0207424c
.L_0215a37c:
    ldr r0, [r9, #0x2c]
    add r1, sp, #0x80
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    ldr r0, [r9, #0x2c]
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_0215ae70
    mov r1, #0x0
    sub r0, r1, #0x100000
    str r1, [sp, #0x10]
    str r0, [sp, #0xc]
    ldr r0, [r9, #0x2c]
    add r1, sp, #0xc
    add r2, sp, #0x10
    bl func_ov002_0214d4c0
    ldr r0, [r9, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    ldr r0, [r9, #0x10]
    mov r3, #0x0
    add r4, r0, #0xfe
    ldr r2, .L_0215abd4
    str r3, [sp, #0x0]
    mov r0, #0xa0
    mov r1, #0x10
    bl func_ov012_021ca3a4
    str r0, [r9, #0x30]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    ldr r0, [r9, #0x30]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r9, #0x30]
    add r1, r4, #0x500
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, #0x68000
    str r0, [sp, #0x18]
    mov r0, #0x8000
    str r0, [sp, #0x14]
    ldr r0, [r9, #0x30]
    add r1, sp, #0x14
    add r2, sp, #0x18
    bl func_ov002_0214d4c0
    mov r0, #0x20000
    str r0, [sp, #0x1c]
    ldr r0, [r9, #0x30]
    add r1, sp, #0x1c
    bl func_ov002_0214d650
    ldr r0, [r9, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r9, #0x30]
    ldr r1, [r9, #0x2c]
    bl func_ov002_0214d678
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    ldr r2, .L_0215abb8
    ldr r3, [r0, #0x4]
    ldr r0, .L_0215abd8
    mov r1, #0x0
    str r3, [r2, #0x0]
    blx func_020101f4
    ldr r4, .L_0215abdc
    str r0, [r9, #0x38]
    mov r8, #0x0
    mov r6, #0x800000
    mov r5, #0x20000
    add r11, sp, #0x20
.L_0215a4e8:
    mov r0, r6
    bl func_020329ec
    bl func_ov002_0214d498
    add r1, r9, r8, lsl #0x2
    str r0, [r1, #0x3c]
    str r5, [sp, #0x20]
    ldr r0, [r1, #0x3c]
    mov r1, r11
    bl func_ov002_0214d650
    add r0, r8, r8, lsl #0x1
    add r10, r4, r0
    add r1, r9, r8, lsl #0x2
    ldrb r0, [r4, r0]
    ldr r2, [r1, #0x3c]
    add r1, r0, #0x800000
    ldr r0, [r2, #0x4]
    mov r2, #0x0
    bl func_02023894
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x3c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrb r2, [r10, #0x2]
    ldrb r1, [r10, #0x1]
    add r0, r9, r8, lsl #0x2
    mov r2, r2, lsl #0xc
    mov r1, r1, lsl #0xc
    str r2, [sp, #0x28]
    str r1, [sp, #0x24]
    ldr r0, [r0, #0x3c]
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov002_0214d4c0
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x3c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    cmp r8, #0x0
    beq .L_0215a5ac
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x3c]
    ldr r1, [r9, #0x2c]
    bl func_ov002_0214d678
.L_0215a5ac:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_0215a4e8
    ldr r0, [r9, #0x50]
    cmp r0, #0x1
    bne .L_0215a5f0
    ldr r0, [r9, #0x3c]
    ldr r1, .L_0215abe0
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r9, #0x3c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0215a5f0:
    mov r5, #0x0
    mov r4, r5
.L_0215a5f8:
    ldr r0, [r9, #0x10]
    add r1, r9, r5, lsl #0x2
    add r0, r0, r5
    add r0, r0, #0x500
    ldrsb r0, [r0, #0xe0]
    ldr r3, [r1, #0x44]
    mov r2, r4
    add r1, r0, #0x6
    ldr r0, [r3, #0x4]
    add r1, r1, #0x800000
    bl func_02023894
    add r0, r9, r5, lsl #0x2
    ldr r0, [r0, #0x44]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215a5f8
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, .L_0215abe4
    mov r1, #0x0
    blx func_020101f4
    str r0, [r9, #0x34]
    ldr r0, .L_0215abe8
    ldr r1, .L_0215abec
    ldr r2, .L_0215abf0
    ldr r3, .L_0215abf4
    ldr r4, [r0, #0x0]
    mov r0, #0x14c
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215a6a0
    ldr r3, .L_0215abf8
    mov r2, r4
    mov r1, #0x0
    blx func_ov012_021b7950
.L_0215a6a0:
    bl func_ov002_0214d498
    str r0, [r9, #0x18]
    movs r1, #0x0
    bne .L_0215a6bc
    ldr r0, [r0, #0x4]
    blx func_ov012_021b5898
    b .L_0215a6cc
.L_0215a6bc:
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_0215a6cc:
    mov r0, #0x20000
    str r0, [sp, #0x2c]
    ldr r0, [r9, #0x18]
    add r1, sp, #0x2c
    bl func_ov002_0214d650
    ldr r0, [r9, #0x18]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r9, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r0, #0x800000
    bl func_020329ec
    bl func_ov002_0214d498
    mov r1, #0x21000
    str r1, [sp, #0x30]
    mov r4, r0
    add r1, sp, #0x30
    bl func_ov002_0214d650
    ldr r2, .L_0215abfc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r2, [r0, #0x54]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_0215abe8
    ldr r0, [r9, #0x18]
    ldr r1, [r1, #0x0]
    bl func_ov002_0215aeb0
    mov r1, r4
    str r0, [r9, #0x1c]
    bl func_ov002_0214d6b0
    ldr r0, [r9, #0x1c]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x1c]
    mov r2, #0x1
    ldr r0, [r0, #0x4]
    mov r1, #0x8000
    strb r2, [r0, #0xaa]
    ldr r0, [r9, #0x1c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    mov r2, #0xa
    str r2, [sp, #0x0]
    sub r1, r2, #0x7e
    add r0, sp, #0x34
    sub r2, r2, #0x14
    mov r3, #0x0
    bl func_ov002_0214edbc
    ldr r2, .L_0215ac00
    mov r0, #0x0
    add r1, sp, #0x34
    bl func_ov002_0215aefc
    mov r1, r0
    ldr r0, [r9, #0x1c]
    bl func_02020e98
    ldr r0, [r9, #0x1c]
    ldr r2, .L_0215ac04
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r9, #0x1c]
    mov r2, #0x1
    ldr r1, [r0, #0x4]
    mov r0, #0x21000
    strb r2, [r1, #0xb1]
    str r0, [sp, #0x3c]
    ldr r0, [r9, #0x1c]
    add r1, sp, #0x3c
    bl func_ov002_0214d650
    mov r1, #0xf000
    mov r0, #0xfe000
    str r1, [sp, #0x44]
    str r0, [sp, #0x40]
    ldr r0, [r9, #0x1c]
    add r1, sp, #0x40
    add r2, sp, #0x44
    bl func_ov002_0214d4c0
    ldr r0, [r9, #0x1c]
    ldr r1, .L_0215ac08
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r9, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r9, #0x1c]
    ldr r1, .L_0215ac08
    ldr r0, [r0, #0x4]
    blx func_ov012_021b3f78
    ldr r0, [r9, #0x1c]
    ldr r1, .L_0215ac08
    ldr r0, [r0, #0x4]
    blx func_ov012_021b3fb0
    ldr r0, [r9, #0x1c]
    ldr r1, .L_0215ac0c
    ldr r0, [r0, #0x4]
    blx func_ov012_021b3fc4
    ldr r0, [r9, #0x1c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    str r1, [r0, #0x124]
    ldr r0, [r9, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x510000
    bl func_020329ec
    bl func_ov002_0214d498
    mov r1, #0x20000
    str r1, [sp, #0x48]
    mov r4, r0
    add r1, sp, #0x48
    bl func_ov002_0214d650
    ldr r2, .L_0215abfc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r2, [r0, #0x54]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_0215abe8
    ldr r0, [r9, #0x18]
    ldr r1, [r1, #0x0]
    bl func_ov002_0215aeb0
    str r0, [r9, #0x20]
    mov r1, r4
    bl func_ov002_0214d6b0
    ldr r0, [r9, #0x20]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x20]
    mov r2, #0x1
    ldr r0, [r0, #0x4]
    mov r1, #0x20
    strb r2, [r0, #0xaa]
    ldr r0, [r9, #0x20]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    mov r3, #0x0
    add r0, sp, #0x4c
    sub r1, r3, #0x31
    sub r2, r3, #0x11
    str r3, [sp, #0x0]
    bl func_ov002_0214edbc
    ldr r2, .L_0215ac00
    mov r0, #0x0
    add r1, sp, #0x4c
    bl func_ov002_0215aefc
    mov r1, r0
    ldr r0, [r9, #0x20]
    bl func_02020e98
    ldr r0, [r9, #0x20]
    ldr r2, .L_0215ac04
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r1, [r9, #0x20]
    mov r3, #0x1
    ldr r2, [r1, #0x4]
    mov r0, #0x20000
    strb r3, [r2, #0xb1]
    str r0, [sp, #0x54]
    ldr r0, [r9, #0x20]
    add r1, sp, #0x54
    bl func_ov002_0214d650
    mov r0, #0xc0000
    str r0, [sp, #0x5c]
    mov r0, #0xff000
    str r0, [sp, #0x58]
    ldr r0, [r9, #0x20]
    add r1, sp, #0x58
    add r2, sp, #0x5c
    bl func_ov002_0214d4c0
    ldr r0, [r9, #0x20]
    mov r1, #0x510000
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r9, #0x20]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r9, #0x20]
    mov r1, #0x510000
    ldr r0, [r0, #0x4]
    blx func_ov012_021b3f78
    ldr r0, [r9, #0x20]
    mov r1, #0x510000
    ldr r0, [r0, #0x4]
    blx func_ov012_021b3fb0
    ldr r0, [r9, #0x20]
    ldr r1, .L_0215ac10
    ldr r0, [r0, #0x4]
    blx func_ov012_021b3fc4
    ldr r0, [r9, #0x20]
    mov r2, #0x0
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    str r2, [r0, #0x124]
    ldr r0, [r9, #0x20]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_0215abe8
    ldr r0, [r9, #0x18]
    ldr r1, [r1, #0x0]
    bl func_ov002_0215aeb0
    str r0, [r9, #0x24]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x24]
    mov r3, #0x1
    ldr r2, [r0, #0x4]
    mov r1, #0x0
    strb r3, [r2, #0xaa]
    add r0, sp, #0x60
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    bl func_ov002_0214edbc
    ldr r2, .L_0215ac00
    mov r0, #0x0
    add r1, sp, #0x60
    bl func_ov002_0215aefc
    mov r1, r0
    ldr r0, [r9, #0x24]
    bl func_02020e98
    mov r0, #0x20000
    str r0, [sp, #0x68]
    ldr r0, [r9, #0x24]
    add r1, sp, #0x68
    bl func_ov002_0214d650
    mov r0, #0x0
    str r0, [sp, #0x70]
    str r0, [sp, #0x6c]
    ldr r0, [r9, #0x24]
    add r1, sp, #0x6c
    add r2, sp, #0x70
    bl func_ov002_0214d4c0
    ldr r0, [r9, #0x24]
    mov r2, #0x0
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    str r2, [r0, #0x124]
    ldr r0, [r9, #0x24]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r9, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r9, #0x24]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r2, .L_0215abb4
    ldr r0, .L_0215abbc
    ldr r4, [r2, #0x0]
    ldr r1, .L_0215abb8
    ldr r3, [r0, r4, lsl #0x2]
    add r4, r4, #0x1
    mov r0, #0x2f
    str r4, [r2, #0x0]
    str r3, [r1, #0x0]
    bl func_020734e0
    mov r0, #0x2f
    mov r1, #0x0
    bl func_0207361c
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r9, #0x0]
    add sp, sp, #0x98
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ab94: .word data_ov002_0215cae0
.L_0215ab98: .word data_ov002_0215cad0
.L_0215ab9c: .word func_ov002_0215ac14
.L_0215aba0: .word data_02093c04
.L_0215aba4: .word data_020a0e80
.L_0215aba8: .word data_020a16c0
.L_0215abac: .word 0xffff
.L_0215abb0: .word data_ov002_0215caf0
.L_0215abb4: .word data_02093c08
.L_0215abb8: .word data_020a0dd0
.L_0215abbc: .word data_020a16d0
.L_0215abc0: .word data_ov002_0215cb08
.L_0215abc4: .word data_ov002_0215cb14
.L_0215abc8: .word data_ov002_0215cb20
.L_0215abcc: .word data_ov002_0215cb34
.L_0215abd0: .word data_ov002_0215cb48
.L_0215abd4: .word data_ov002_0215cb4c
.L_0215abd8: .word data_ov002_0215cb60
.L_0215abdc: .word data_ov002_0215b090
.L_0215abe0: .word 0x800001
.L_0215abe4: .word data_ov002_0215cb74
.L_0215abe8: .word data_ov012_021d5154
.L_0215abec: .word data_ov002_0215bc54
.L_0215abf0: .word data_ov002_0215cab8
.L_0215abf4: .word 0x2a6
.L_0215abf8: .word func_ov002_0214d8a8
.L_0215abfc: .word 0x31305053
.L_0215ac00: .word data_02093c8c
.L_0215ac04: .word func_ov002_0215af88
.L_0215ac08: .word 0x800002
.L_0215ac0c: .word 0x800003
.L_0215ac10: .word 0x510001
    arm_func_end func_ov002_0215a038

    .global func_ov002_0215ac14
    arm_func_start func_ov002_0215ac14
func_ov002_0215ac14: ; 0x0215ac14
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r1, [r5, #0x4]
    add r0, sp, #0x8
    ldr r4, [r1, #0x10]
    ldr r1, [r4, #0x2c]
    bl func_ov002_0214f990
    add r0, sp, #0x8
    ldr r0, [r0, #0x0]
    add r1, sp, #0xc
    add r0, r0, #0x20000
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x2c]
    bl func_ov002_0214ef60
    ldr r1, [r4, #0x2c]
    add r0, sp, #0x4
    bl func_ov002_0214f990
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ble .L_0215ac9c
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x2c]
    add r1, sp, #0x0
    bl func_ov002_0214ef60
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215acac
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_0215ac9c:
    mov r0, r5
    bl func_ov002_0215acb0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0215acac: .word func_ov002_0215acb0
    arm_func_end func_ov002_0215ac14

    .global func_ov002_0215acb0
    arm_func_start func_ov002_0215acb0
func_ov002_0215acb0: ; 0x0215acb0
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r0, [r0, #0x4]
    add r1, sp, #0x4
    ldr ip, [r0, #0x10]
    add r2, sp, #0x0
    ldr r0, [ip, #0x58]
    add r3, r0, #0x1
    mov r0, r3, lsr #0x2
    rsb r0, r0, #0x0
    str r3, [ip, #0x58]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldr r0, [ip, #0x58]
    mov r0, r0, lsr #0x2
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x4]
    ldr r0, [ip, #0x28]
    bl func_ov002_0214d4c0
    bl func_0207382c
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0215acb0

    .global func_ov002_0215ad08
    arm_func_start func_ov002_0215ad08
func_ov002_0215ad08: ; 0x0215ad08
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215ad2c
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215ad2c: .word func_ov002_0215ad30
    arm_func_end func_ov002_0215ad08

    .global func_ov002_0215ad30
    arm_func_start func_ov002_0215ad30
func_ov002_0215ad30: ; 0x0215ad30
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x8
    bl func_0207367c
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_0215ad68
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215ad68:
    ldr r0, [r4, #0x34]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x38]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x30]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x2c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x28]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x14]
    bl func_02078f88
    ldr r0, [r4, #0x10]
    bl func_0207698c
    ldr r0, [r4, #0xc]
    bl func_020763e0
    bl func_020735e4
    ldr r1, .L_0215ae34
    ldr r2, .L_0215ae38
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215ae3c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r4, #0x54]
    ldr r0, .L_0215ae40
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    blx func_ov012_021b65cc
    ldmia sp!, {r4, pc}
.L_0215ae34: .word data_02093c04
.L_0215ae38: .word data_020a16c0
.L_0215ae3c: .word data_020a0e80
.L_0215ae40: .word data_020afcb0
    arm_func_end func_ov002_0215ad30

    .global func_ov002_0215ae44
    arm_func_start func_ov002_0215ae44
func_ov002_0215ae44: ; 0x0215ae44
    stmdb sp!, {r4, lr}
    bl func_02035c90
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0215ae68
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215ae68:
    ldr r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov002_0215ae44

    .global func_ov002_0215ae70
    arm_func_start func_ov002_0215ae70
func_ov002_0215ae70: ; 0x0215ae70
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215ae98
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x50]
    blx r3
    ldmia sp!, {r3, pc}
.L_0215ae98:
    ldr r0, [r0, #0x64]
    ldr r1, [r1, #0x4]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x50]
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov002_0215ae70

    .global func_ov002_0215aeb0
    arm_func_start func_ov002_0215aeb0
func_ov002_0215aeb0: ; 0x0215aeb0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r4, [r0, #0x4]
    ldr r1, .L_0215aef0
    ldr r2, .L_0215aef4
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215aee8
    ldr r3, .L_0215aef8
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_0215aee8:
    bl func_ov002_0214d498
    ldmia sp!, {r3, r4, r5, pc}
.L_0215aef0: .word data_ov002_0215bbfc
.L_0215aef4: .word data_ov002_0215cac0
.L_0215aef8: .word func_ov002_0214d8a8
    arm_func_end func_ov002_0215aeb0

    .global func_ov002_0215aefc
    arm_func_start func_ov002_0215aefc
func_ov002_0215aefc: ; 0x0215aefc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_0215af74
    ldr r2, .L_0215af78
    ldr r3, .L_0215af7c
    mov r0, #0x70
    bl func_0201a21c
    movs r4, r0
    beq .L_0215af50
    mov r1, r7
    mov r2, r5
    blx func_ov012_021b054c
    ldr r2, .L_0215af80
    mov r1, r6
    add r0, r4, #0x68
    str r2, [r4, #0x0]
    bl func_ov002_0214da38
    ldr r0, .L_0215af84
    str r0, [r4, #0x0]
.L_0215af50:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215af6c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215af6c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215af74: .word data_ov002_0215bc1c
.L_0215af78: .word data_ov002_0215cac8
.L_0215af7c: .word 0x1b2
.L_0215af80: .word data_ov002_0215bde0
.L_0215af84: .word data_ov012_021d1c58
    arm_func_end func_ov002_0215aefc

    .global func_ov002_0215af88
    arm_func_start func_ov002_0215af88
func_ov002_0215af88: ; 0x0215af88
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r5, [r0, #0x124]
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    str r5, [r4, #0x54]
    cmp r5, #0x1
    mov r0, #0x78
    bne .L_0215afc0
    mov r1, #0x0
    bl func_0207342c
    b .L_0215afc8
.L_0215afc0:
    mov r1, #0x1
    bl func_0207342c
.L_0215afc8:
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215afdc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215afdc: .word func_ov002_0215ad08
    arm_func_end func_ov002_0215af88

    .section .rodata, 4, 1, 4
data_ov002_0215afe0:
    .byte 0x08, 0x08, 0x09, 0x0a, 0x0b, 0x00, 0x00, 0x00
data_ov002_0215afe8:
    .byte 0x01, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
    .byte 0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
    .byte 0x17, 0x00, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x1f, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
    .byte 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
    .byte 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00
data_ov002_0215b034:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0xff, 0xff, 0x01, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x01, 0xff, 0x02, 0xff, 0xff, 0xff, 0x02, 0x00, 0x01, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x01, 0x03, 0x02, 0xff, 0xff, 0x03, 0x02, 0x00, 0x01, 0x03, 0xff, 0x00, 0x01, 0xff, 0x02, 0x00
data_ov002_0215b074:
    .word func_ov002_02156e7c
    .word func_ov002_02156ed8
    .word func_ov002_02156ff0
    .word func_ov002_02157108
    .word func_ov002_02156e78
    .byte 0x04, 0x08, 0x08
data_ov002_0215b08b:
    .byte 0x20, 0x60, 0xa0, 0xe0, 0x00
data_ov002_0215b090:
    .byte 0x00, 0x80, 0x00, 0x05, 0x29, 0x4f, 0x06, 0xbd, 0x6f, 0x06, 0xd5, 0x6f, 0x06, 0xed, 0x6f, 0x00
    .section .init, 4, 1, 4
    .global __sinit_ov002_0215b0a0
    arm_func_start __sinit_ov002_0215b0a0
__sinit_ov002_0215b0a0: ; 0x0215b0a0
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x60
    add r0, sp, #0x54
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x58
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x5c
    mov r1, #0x80
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b280
    add r1, sp, #0x5c
    add r2, sp, #0x58
    add r3, sp, #0x54
    bl func_ov002_0214e39c
    add r0, sp, #0x48
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x4c
    mov r1, #0xb
    bl func_ov002_0214d7fc
    add r0, sp, #0x50
    mov r1, #0xd4
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b284
    add r1, sp, #0x50
    add r2, sp, #0x4c
    add r3, sp, #0x48
    bl func_ov002_0214e39c
    add r0, sp, #0x3c
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x40
    mov r1, #0xb
    bl func_ov002_0214d7fc
    add r0, sp, #0x44
    mov r1, #0xdc
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b288
    add r1, sp, #0x44
    add r2, sp, #0x40
    add r3, sp, #0x3c
    bl func_ov002_0214e39c
    add r0, sp, #0x30
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x34
    mov r1, #0xb
    bl func_ov002_0214d7fc
    add r0, sp, #0x38
    mov r1, #0xd8
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b28c
    add r1, sp, #0x38
    add r2, sp, #0x34
    add r3, sp, #0x30
    bl func_ov002_0214e39c
    add r0, sp, #0x24
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x28
    mov r1, #0xb
    bl func_ov002_0214d7fc
    add r0, sp, #0x2c
    mov r1, #0xec
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b290
    add r1, sp, #0x2c
    add r2, sp, #0x28
    add r3, sp, #0x24
    bl func_ov002_0214e39c
    add r0, sp, #0x18
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x1c
    mov r1, #0xb
    bl func_ov002_0214d7fc
    add r0, sp, #0x20
    mov r1, #0xf4
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b294
    add r1, sp, #0x20
    add r2, sp, #0x1c
    add r3, sp, #0x18
    bl func_ov002_0214e39c
    add r0, sp, #0xc
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x10
    mov r1, #0xb
    bl func_ov002_0214d7fc
    add r0, sp, #0x14
    mov r1, #0xf0
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b298
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    bl func_ov002_0214e39c
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x4
    mov r1, #0x7
    bl func_ov002_0214d7fc
    add r0, sp, #0x8
    mov r1, #0x87
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b29c
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov002_0214e39c
    ldr r0, .L_0215b2a0
    ldr r1, .L_0215b2a4
    mov r2, #0x4
    bl func_ov002_0214e3b8
    add sp, sp, #0x60
    ldmia sp!, {r3, pc}
.L_0215b280: .word data_ov002_0215cba4
.L_0215b284: .word data_ov002_0215cbb0
.L_0215b288: .word data_ov002_0215cbbc
.L_0215b28c: .word data_ov002_0215cbc8
.L_0215b290: .word data_ov002_0215cbd4
.L_0215b294: .word data_ov002_0215cbe0
.L_0215b298: .word data_ov002_0215cbec
.L_0215b29c: .word data_ov002_0215cbf8
.L_0215b2a0: .word data_ov002_0215cba0
.L_0215b2a4: .word data_ov002_0215be80
    arm_func_end __sinit_ov002_0215b0a0

    .global __sinit_ov002_0215b2a8
    arm_func_start __sinit_ov002_0215b2a8
__sinit_ov002_0215b2a8: ; 0x0215b2a8
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x60
    add r0, sp, #0x54
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x58
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x5c
    mov r1, #0x80
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b478
    add r1, sp, #0x5c
    add r2, sp, #0x58
    add r3, sp, #0x54
    bl func_ov002_0214e39c
    add r0, sp, #0x48
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x4c
    mov r1, #0x11
    bl func_ov002_0214d7fc
    add r0, sp, #0x50
    mov r1, #0xe
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b47c
    add r1, sp, #0x50
    add r2, sp, #0x4c
    add r3, sp, #0x48
    bl func_ov002_0214e39c
    add r0, sp, #0x3c
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x40
    mov r1, #0x20
    bl func_ov002_0214d7fc
    add r0, sp, #0x44
    mov r1, #0x0
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b480
    add r1, sp, #0x44
    add r2, sp, #0x40
    add r3, sp, #0x3c
    bl func_ov002_0214e39c
    add r0, sp, #0x30
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x34
    mov r1, #0xa8
    bl func_ov002_0214d7fc
    add r0, sp, #0x38
    mov r1, #0x170
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b484
    add r1, sp, #0x38
    add r2, sp, #0x34
    add r3, sp, #0x30
    bl func_ov002_0214e39c
    add r0, sp, #0x24
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x28
    mov r1, #0x6c
    bl func_ov002_0214d7fc
    add r0, sp, #0x2c
    mov r1, #0x80
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b488
    add r1, sp, #0x2c
    add r2, sp, #0x28
    add r3, sp, #0x24
    bl func_ov002_0214e39c
    add r0, sp, #0x18
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x1c
    mov r1, #0xa
    bl func_ov002_0214d7fc
    add r0, sp, #0x20
    mov r1, #0x18
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b48c
    add r1, sp, #0x20
    add r2, sp, #0x1c
    add r3, sp, #0x18
    bl func_ov002_0214e39c
    add r0, sp, #0xc
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x10
    mov r1, #0xa1
    bl func_ov002_0214d7fc
    add r0, sp, #0x14
    mov r1, #0xfc
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b490
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    bl func_ov002_0214e39c
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x4
    mov r1, #0x30
    bl func_ov002_0214d7fc
    add r0, sp, #0x8
    mov r1, #0xee
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b494
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov002_0214e39c
    add sp, sp, #0x60
    ldmia sp!, {r3, pc}
.L_0215b478: .word data_ov002_0215bed0
.L_0215b47c: .word data_ov002_0215bedc
.L_0215b480: .word data_ov002_0215bee8
.L_0215b484: .word data_ov002_0215bef4
.L_0215b488: .word data_ov002_0215bf00
.L_0215b48c: .word data_ov002_0215bf0c
.L_0215b490: .word data_ov002_0215bf18
.L_0215b494: .word data_ov002_0215bf24
    arm_func_end __sinit_ov002_0215b2a8

    .global __sinit_ov002_0215b498
    arm_func_start __sinit_ov002_0215b498
__sinit_ov002_0215b498: ; 0x0215b498
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x60
    add r0, sp, #0x54
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x58
    mov r1, #0x9d
    bl func_ov002_0214d7fc
    add r0, sp, #0x5c
    mov r1, #0x1b
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b668
    add r1, sp, #0x5c
    add r2, sp, #0x58
    add r3, sp, #0x54
    bl func_ov002_0214e39c
    add r0, sp, #0x48
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x4c
    mov r1, #0x9d
    bl func_ov002_0214d7fc
    add r0, sp, #0x50
    mov r1, #0x52
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b66c
    add r1, sp, #0x50
    add r2, sp, #0x4c
    add r3, sp, #0x48
    bl func_ov002_0214e39c
    add r0, sp, #0x3c
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x40
    mov r1, #0x5f
    bl func_ov002_0214d7fc
    add r0, sp, #0x44
    mov r1, #0x6f
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b670
    add r1, sp, #0x44
    add r2, sp, #0x40
    add r3, sp, #0x3c
    bl func_ov002_0214e39c
    add r0, sp, #0x30
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x34
    mov r1, #0x5f
    bl func_ov002_0214d7fc
    add r0, sp, #0x38
    mov r1, #0xbf
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b674
    add r1, sp, #0x38
    add r2, sp, #0x34
    add r3, sp, #0x30
    bl func_ov002_0214e39c
    add r0, sp, #0x24
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x28
    mov r1, #0x21
    bl func_ov002_0214d7fc
    add r0, sp, #0x2c
    mov r1, #0xdc
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b678
    add r1, sp, #0x2c
    add r2, sp, #0x28
    add r3, sp, #0x24
    bl func_ov002_0214e39c
    add r0, sp, #0x18
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x1c
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x20
    mov r1, #0x0
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b67c
    add r1, sp, #0x20
    add r2, sp, #0x1c
    add r3, sp, #0x18
    bl func_ov002_0214e39c
    add r0, sp, #0xc
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x10
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x14
    mvn r1, #0x7f
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b680
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    bl func_ov002_0214e39c
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x4
    mov r1, #0xc0
    bl func_ov002_0214d7fc
    add r0, sp, #0x8
    mov r1, #0x100
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b684
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov002_0214e39c
    add sp, sp, #0x60
    ldmia sp!, {r3, pc}
.L_0215b668: .word data_ov002_0215c11c
.L_0215b66c: .word data_ov002_0215c128
.L_0215b670: .word data_ov002_0215c134
.L_0215b674: .word data_ov002_0215c140
.L_0215b678: .word data_ov002_0215c14c
.L_0215b67c: .word data_ov002_0215c158
.L_0215b680: .word data_ov002_0215c164
.L_0215b684: .word data_ov002_0215c170
    arm_func_end __sinit_ov002_0215b498

    .global __sinit_ov002_0215b688
    arm_func_start __sinit_ov002_0215b688
__sinit_ov002_0215b688: ; 0x0215b688
    stmdb sp!, {lr}
    sub sp, sp, #0xbc
    add r0, sp, #0x98
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x9c
    mov r1, #0xc0
    bl func_ov002_0214d7fc
    add r0, sp, #0xa0
    mov r1, #0x100
    bl func_ov002_0214d7fc
    add r0, sp, #0xb0
    add r1, sp, #0xa0
    add r2, sp, #0x9c
    add r3, sp, #0x98
    bl func_ov002_0214e39c
    ldr r0, .L_0215b9c8
    add r1, sp, #0xb0
    bl func_ov002_0215525c
    mov r3, #0x0
    add r0, sp, #0x90
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov002_0214edbc
    ldr r0, .L_0215b9cc
    add r1, sp, #0x90
    bl func_ov002_02155278
    add r0, sp, #0x8c
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x88
    mov r1, #0xc0
    bl func_ov002_0214d7fc
    add r0, sp, #0x84
    mov r1, #0xce
    bl func_ov002_0214d7fc
    add r0, sp, #0xa4
    add r1, sp, #0x84
    add r2, sp, #0x88
    add r3, sp, #0x8c
    bl func_ov002_0214e39c
    ldr r0, .L_0215b9d0
    add r1, sp, #0xa4
    bl func_ov002_0215525c
    mov r3, #0x0
    add r0, sp, #0x7c
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov002_0214edbc
    ldr r0, .L_0215b9d4
    add r1, sp, #0x7c
    bl func_ov002_02155278
    add r0, sp, #0x70
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x74
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x78
    mov r1, #0x0
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b9d8
    add r1, sp, #0x78
    add r2, sp, #0x74
    add r3, sp, #0x70
    bl func_ov002_0214e39c
    ldr r0, .L_0215b9dc
    bl func_ov002_021518d4
    ldr r0, .L_0215b9e0
    bl func_ov002_021518d4
    ldr r0, .L_0215b9e4
    bl func_ov002_021518d4
    add r0, sp, #0x64
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x68
    mov r1, #0x10
    bl func_ov002_0214d7fc
    add r0, sp, #0x6c
    mvn r1, #0x27
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b9e8
    add r1, sp, #0x6c
    add r2, sp, #0x68
    add r3, sp, #0x64
    bl func_ov002_0214e39c
    add r0, sp, #0x58
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x5c
    mov r1, #0x10
    bl func_ov002_0214d7fc
    add r0, sp, #0x60
    mov r1, #0x28
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b9ec
    add r1, sp, #0x60
    add r2, sp, #0x5c
    add r3, sp, #0x58
    bl func_ov002_0214e39c
    ldr r0, .L_0215b9f0
    bl func_ov002_021518d4
    ldr r0, .L_0215b9f4
    bl func_ov002_021518d4
    add r0, sp, #0x4c
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x50
    mov r1, #0x20
    bl func_ov002_0214d7fc
    add r0, sp, #0x54
    mov r1, #0x0
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b9f8
    add r1, sp, #0x54
    add r2, sp, #0x50
    add r3, sp, #0x4c
    bl func_ov002_0214e39c
    add r0, sp, #0x40
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x44
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x48
    mvn r1, #0x27
    bl func_ov002_0214d7fc
    ldr r0, .L_0215b9fc
    add r1, sp, #0x48
    add r2, sp, #0x44
    add r3, sp, #0x40
    bl func_ov002_0214e39c
    add r0, sp, #0x34
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x38
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x3c
    mov r1, #0x28
    bl func_ov002_0214d7fc
    ldr r0, .L_0215ba00
    add r1, sp, #0x3c
    add r2, sp, #0x38
    add r3, sp, #0x34
    bl func_ov002_0214e39c
    ldr r0, .L_0215ba04
    bl func_ov002_021518d4
    add r0, sp, #0x28
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x2c
    mov r1, #0x20
    bl func_ov002_0214d7fc
    add r0, sp, #0x30
    mov r1, #0x0
    bl func_ov002_0214d7fc
    ldr r0, .L_0215ba08
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    bl func_ov002_0214e39c
    add r0, sp, #0x1c
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x20
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x24
    mvn r1, #0x27
    bl func_ov002_0214d7fc
    ldr r0, .L_0215ba0c
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    bl func_ov002_0214e39c
    add r0, sp, #0x10
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x14
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x18
    mov r1, #0x28
    bl func_ov002_0214d7fc
    ldr r0, .L_0215ba10
    add r1, sp, #0x18
    add r2, sp, #0x14
    add r3, sp, #0x10
    bl func_ov002_0214e39c
    add r0, sp, #0x4
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x8
    mvn r1, #0x1f
    bl func_ov002_0214d7fc
    add r0, sp, #0xc
    mov r1, #0x0
    bl func_ov002_0214d7fc
    ldr r0, .L_0215ba14
    add r1, sp, #0xc
    add r2, sp, #0x8
    add r3, sp, #0x4
    bl func_ov002_0214e39c
    add sp, sp, #0xbc
    ldmia sp!, {pc}
.L_0215b9c8: .word data_ov002_0215c1e8
.L_0215b9cc: .word data_ov002_0215c1f4
.L_0215b9d0: .word data_ov002_0215c210
.L_0215b9d4: .word data_ov002_0215c21c
.L_0215b9d8: .word data_ov002_0215c228
.L_0215b9dc: .word data_ov002_0215c234
.L_0215b9e0: .word data_ov002_0215c240
.L_0215b9e4: .word data_ov002_0215c24c
.L_0215b9e8: .word data_ov002_0215c258
.L_0215b9ec: .word data_ov002_0215c264
.L_0215b9f0: .word data_ov002_0215c270
.L_0215b9f4: .word data_ov002_0215c27c
.L_0215b9f8: .word data_ov002_0215c288
.L_0215b9fc: .word data_ov002_0215c294
.L_0215ba00: .word data_ov002_0215c2a0
.L_0215ba04: .word data_ov002_0215c2ac
.L_0215ba08: .word data_ov002_0215c2b8
.L_0215ba0c: .word data_ov002_0215c2c4
.L_0215ba10: .word data_ov002_0215c2d0
.L_0215ba14: .word data_ov002_0215c2dc
    arm_func_end __sinit_ov002_0215b688

    .global __sinit_ov002_0215ba18
    arm_func_start __sinit_ov002_0215ba18
__sinit_ov002_0215ba18: ; 0x0215ba18
    stmdb sp!, {lr}
    sub sp, sp, #0x64
    add r0, sp, #0x34
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x38
    mov r1, #0x34
    bl func_ov002_0214d7fc
    add r0, sp, #0x3c
    mov r1, #0xd0
    bl func_ov002_0214d7fc
    add r0, sp, #0x58
    add r1, sp, #0x3c
    add r2, sp, #0x38
    add r3, sp, #0x34
    bl func_ov002_0214e39c
    ldr r0, .L_0215bb6c
    add r1, sp, #0x58
    bl func_ov002_0215525c
    mov r2, #0x9
    str r2, [sp, #0x0]
    sub r1, r2, #0x31
    add r0, sp, #0x2c
    sub r2, r2, #0x12
    mov r3, #0x28
    bl func_ov002_0214edbc
    ldr r0, .L_0215bb70
    add r1, sp, #0x2c
    bl func_ov002_02155278
    add r0, sp, #0x28
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x24
    mov r1, #0x47
    bl func_ov002_0214d7fc
    add r0, sp, #0x20
    mov r1, #0xd0
    bl func_ov002_0214d7fc
    add r0, sp, #0x4c
    add r1, sp, #0x20
    add r2, sp, #0x24
    add r3, sp, #0x28
    bl func_ov002_0214e39c
    ldr r0, .L_0215bb74
    add r1, sp, #0x4c
    bl func_ov002_0215525c
    mov r2, #0x9
    str r2, [sp, #0x0]
    sub r1, r2, #0x31
    add r0, sp, #0x18
    sub r2, r2, #0x12
    mov r3, #0x28
    bl func_ov002_0214edbc
    ldr r0, .L_0215bb78
    add r1, sp, #0x18
    bl func_ov002_02155278
    add r0, sp, #0x14
    mov r1, #0x0
    bl func_ov002_0214d7fc
    add r0, sp, #0x10
    mov r1, #0x5a
    bl func_ov002_0214d7fc
    add r0, sp, #0xc
    mov r1, #0xd0
    bl func_ov002_0214d7fc
    add r0, sp, #0x40
    add r1, sp, #0xc
    add r2, sp, #0x10
    add r3, sp, #0x14
    bl func_ov002_0214e39c
    ldr r0, .L_0215bb7c
    add r1, sp, #0x40
    bl func_ov002_0215525c
    mov r2, #0x9
    str r2, [sp, #0x0]
    sub r1, r2, #0x31
    add r0, sp, #0x4
    sub r2, r2, #0x12
    mov r3, #0x28
    bl func_ov002_0214edbc
    ldr r0, .L_0215bb80
    add r1, sp, #0x4
    bl func_ov002_02155278
    add sp, sp, #0x64
    ldmia sp!, {pc}
.L_0215bb6c: .word data_ov002_0215c404
.L_0215bb70: .word data_ov002_0215c410
.L_0215bb74: .word data_ov002_0215c41c
.L_0215bb78: .word data_ov002_0215c428
.L_0215bb7c: .word data_ov002_0215c434
.L_0215bb80: .word data_ov002_0215c440
    arm_func_end __sinit_ov002_0215ba18

    .section .ctor, 4, 1, 4
.p__sinit_ov002_0215b0a0:
    .word __sinit_ov002_0215b0a0
.p__sinit_ov002_0215b2a8:
    .word __sinit_ov002_0215b2a8
.p__sinit_ov002_0215b498:
    .word __sinit_ov002_0215b498
.p__sinit_ov002_0215b688:
    .word __sinit_ov002_0215b688
.p__sinit_ov002_0215ba18:
    .word __sinit_ov002_0215ba18
    .section .data, 4, 1, 4
data_ov002_0215bba0:
    .byte 0x70, 0x00, 0x00, 0x00
data_ov002_0215bba4:
    .byte 0x6d, 0x00, 0x00, 0x00
data_ov002_0215bba8:
    .byte 0x75, 0x00, 0x00, 0x00
data_ov002_0215bbac:
    .byte 0x6a, 0x00, 0x00, 0x00
data_ov002_0215bbb0:
    .byte 0x77, 0x72, 0x00, 0x00
data_ov002_0215bbb4:
    .byte 0x66, 0x6e, 0x00, 0x00
data_ov002_0215bbb8:
    .byte 0x65, 0x61, 0x00, 0x00
data_ov002_0215bbbc:
    .byte 0x61, 0x73, 0x74, 0x00
data_ov002_0215bbc0:
    .byte 0x62, 0x73, 0x30, 0x32, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bbc8:
    .byte 0x62, 0x73, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bbd0:
    .byte 0x62, 0x73, 0x30, 0x31, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bbd8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215bbe0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215bbe8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215bbf0:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov002_0215bbfc:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov002_0215bc0c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov002_0215bc1c:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6c, 0x6c, 0x69, 0x73, 0x69, 0x6f, 0x6e, 0x2e, 0x69, 0x6e, 0x6c, 0x00
data_ov002_0215bc2c:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov002_0215bc40:
    .byte 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov002_0215bc54:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov002_0215bc68:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2e
    .byte 0x61, 0x61, 0x72, 0x00
data_ov002_0215bc7c:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6d, 0x61, 0x70, 0x5f, 0x6f, 0x62, 0x6a, 0x2e
    .byte 0x61, 0x61, 0x72, 0x00
data_ov002_0215bc90:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x67, 0x61, 0x5f, 0x6d, 0x61, 0x70, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov002_0215bca8:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x67, 0x61, 0x5f, 0x73, 0x65, 0x6c, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov002_0215bcc0:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x62, 0x61, 0x5f, 0x6d, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x30, 0x30, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov002_0215bcd8:
    .byte 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x5f, 0x69, 0x63, 0x6f
    .byte 0x6e, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bcf4:
    .word func_ov002_0214e058
    .word func_ov002_0214e058
    .word func_ov002_0214e0c4
    .word func_ov002_0214e104
    .word func_ov002_0214e104
    .word func_ov002_0214e12c
    .word func_ov002_0214d11c
data_ov002_0215bd10:
    .word func_ov002_02151544
    .word func_ov002_02151544
    .word func_ov002_0214e3bc
    .word func_ov002_0215528c
    .word func_ov002_02155408
    .word func_ov002_021565c8
    .word func_ov002_0214e048
data_ov002_0215bd2c:
    .word func_ov002_0214e1c4
    .word func_ov002_0214e158
    .word func_ov002_0214e1fc
    .word func_ov002_0214e21c
    .word func_ov002_0214e21c
    .word func_ov002_0214e054
    .word func_ov002_0214e1fc
data_ov002_0215bd48:
    .word data_ov002_0215bc68
    .word data_ov002_0215bca8
    .word data_ov002_0215bc90
    .word data_ov002_0215bcc0
    .word data_ov002_0215bc7c
    .word data_ov002_0215bc40
    .word data_ov002_0215bcd8
data_ov002_0215bd64:
    .word func_ov002_021518e8
    .word func_ov002_021518e8
    .word func_ov002_0214eb40
    .word func_ov002_02155520
    .word func_ov002_02155520
    .word func_ov002_02156664
    .word func_ov002_0214e050
data_ov002_0215bd80:
    .word func_ov002_0214e248
    .word func_ov002_0214e248
    .word func_ov002_0214ed0c
    .word func_ov002_02155578
    .word func_ov002_02155578
    .word func_ov002_02156690
    .word func_ov002_0214e050
data_ov002_0215bd9c:
    .word data_ov002_0215bbb8
    .word data_ov002_0215bbac
    .word data_ov002_0215bba8
    .word data_ov002_0215bba4
    .word data_ov002_0215bba0
    .word data_ov002_0215bbb0
    .word data_ov002_0215bbb0
    .word data_ov002_0215bbb0
    .word data_ov002_0215bbb0
    .word data_ov002_0215bbb0
    .word data_ov002_0215bbc8
    .word data_ov002_0215bbd0
    .word data_ov002_0215bbb4
    .word data_ov002_0215bbc0
    .word data_ov002_0215bbbc
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
data_ov002_0215bde0:
    .word func_ov002_0214e36c
    .word func_ov002_0214e380
    .word func_ov002_0214e2f4
    .word func_0201c8a0
    .word func_ov002_0214d01c
    .word func_ov012_021b0f50
    .word func_ov002_0214e354
    .word func_0202f668
    .word func_ov002_0214e320
    .word func_ov002_0214d02c
    .word func_ov002_0214e318
    .word func_ov002_0214e310
    .word func_ov002_0214e340
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov002_0214e338
    .word func_ov002_0214e328
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov002_0214e308
    .word func_ov002_0214e348
    .word func_ov002_0214e35c
data_ov002_0215be4c:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov002_0215be58:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2e
    .byte 0x62, 0x69, 0x6e, 0x00
data_ov002_0215be6c:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov002_0215be80:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x00
data_ov002_0215be88:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215be90:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215be98:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215bea0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215bea8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215beb0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215beb8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215bec0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215bec8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bed0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bedc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bee8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bef4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bf00:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bf0c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bf18:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bf24:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov002_0214e36c
    .word func_ov002_0214e380
    .word func_ov002_0214e2f4
    .word func_0201c8a0
    .word func_ov002_0214d01c
    .word func_ov012_021b0f50
    .word func_ov002_0214e354
    .word func_0202f668
    .word func_ov002_0214e320
    .word func_ov002_0214d02c
    .word func_ov002_0214e318
    .word func_ov002_0214e310
    .word func_ov002_0214e340
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov002_0214e338
    .word func_ov002_0214e328
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov002_0214e308
    .word func_ov002_0214e348
    .word func_ov002_0214e35c
data_ov002_0215bfa4:
    .byte 0x41, 0x4c, 0x4e, 0x6f, 0x64, 0x65, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00
data_ov002_0215bfb0:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bfc0:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov002_0215bfd0:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov002_0215bfe0:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov002_0215bff4:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov002_0215c008:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov002_0215c01c:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x5f, 0x43, 0x72
    .byte 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c034:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x2e, 0x63, 0x70
    .byte 0x70, 0x00, 0x00, 0x00
data_ov002_0215c048:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c054:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c060:
    .byte 0x5f, 0x62, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov002_0215c06c:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x62, 0x61, 0x5f, 0x6d, 0x5f, 0x73, 0x65, 0x6c
    .byte 0x30, 0x31, 0x00, 0x00
data_ov002_0215c080:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x62, 0x61, 0x5f, 0x6d, 0x5f, 0x73, 0x65, 0x6c
    .byte 0x30, 0x30, 0x00, 0x00
data_ov002_0215c094:
    .byte 0x5f, 0x62, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x2e, 0x62, 0x69, 0x6e, 0x00
data_ov002_0215c0a0:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov002_0215c0b4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c0bc:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c0c4:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6d, 0x61, 0x70, 0x30, 0x30, 0x00, 0x00, 0x00
data_ov002_0215c0d4:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6d, 0x61, 0x70, 0x30, 0x31, 0x00, 0x00, 0x00
data_ov002_0215c0e4:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6d, 0x61, 0x70, 0x30, 0x32, 0x00, 0x00, 0x00
data_ov002_0215c0f4:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x4d, 0x61, 0x70, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74
    .byte 0x65, 0x00, 0x00, 0x00
data_ov002_0215c108:
    .word data_ov002_0215c0c4
    .word data_ov002_0215c0c4
    .word data_ov002_0215c0c4
    .word data_ov002_0215c0d4
    .word data_ov002_0215c0e4
data_ov002_0215c11c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c128:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c134:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c140:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c14c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c158:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c164:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c170:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c17c:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x4d, 0x61, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov002_0215c18c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c198:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c1a0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c1a8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c1b0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c1b8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c1c0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c1c8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c1d0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c1d8:
    .byte 0x00, 0x00, 0x51, 0x00, 0x01, 0x00, 0x51, 0x00, 0x2c, 0x00, 0x51, 0x00, 0x00, 0x00, 0x51, 0x00
data_ov002_0215c1e8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c1f4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x51, 0x00
    .byte 0x12, 0x00, 0x51, 0x00, 0x13, 0x00, 0x51, 0x00, 0x00, 0x00, 0x51, 0x00
data_ov002_0215c210:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c21c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov002_02153d78
data_ov002_0215c228:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c234:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c240:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c24c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c258:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c264:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c270:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c27c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c288:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c294:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c2a0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c2ac:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c2b8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c2c4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c2d0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c2dc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c2e8:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x50, 0x6c, 0x61, 0x6e, 0x65, 0x74, 0x5f, 0x43, 0x72
    .byte 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c300:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x50, 0x6c, 0x61, 0x6e, 0x65, 0x74, 0x2e, 0x63, 0x70
    .byte 0x70, 0x00, 0x00, 0x00
data_ov002_0215c314:
    .byte 0x53, 0x63, 0x61, 0x6c, 0x65, 0x00, 0x00, 0x00
data_ov002_0215c31c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c328:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c334:
    .byte 0x5f, 0x70, 0x6c, 0x61, 0x6e, 0x65, 0x74, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov002_0215c340:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x57, 0x61, 0x72, 0x70, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov002_0215c354:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x77, 0x61, 0x72, 0x70, 0x30, 0x30, 0x2e, 0x6e
    .byte 0x63, 0x6c, 0x00, 0x00
data_ov002_0215c368:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x77, 0x61, 0x72, 0x70, 0x30, 0x33, 0x2e, 0x6e
    .byte 0x63, 0x6c, 0x00, 0x00
data_ov002_0215c37c:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x77, 0x61, 0x72, 0x70, 0x30, 0x32, 0x2e, 0x6e
    .byte 0x63, 0x6c, 0x00, 0x00
data_ov002_0215c390:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x77, 0x61, 0x72, 0x70, 0x30, 0x31, 0x2e, 0x6e
    .byte 0x63, 0x6c, 0x00, 0x00
data_ov002_0215c3a4:
    .word data_ov002_0215c354
    .word data_ov002_0215c354
    .word data_ov002_0215c390
    .word data_ov002_0215c37c
    .word data_ov002_0215c368
data_ov002_0215c3b8:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x57, 0x61, 0x72, 0x70, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x50, 0x6c, 0x61, 0x6e, 0x65, 0x74, 0x49, 0x6e, 0x00, 0x00
data_ov002_0215c3d4:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x57, 0x61, 0x72, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov002_0215c3e4:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x77, 0x61, 0x72, 0x70, 0x30, 0x30, 0x00, 0x00
data_ov002_0215c3f4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c3fc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c404:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c410:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov002_0215638c
data_ov002_0215c41c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c428:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov002_021563cc
data_ov002_0215c434:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c440:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov002_0215640c
data_ov002_0215c44c:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x4d, 0x65, 0x6e, 0x75, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov002_0215c460:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x4d, 0x65, 0x6e, 0x75, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov002_0215c470:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x77, 0x69, 0x6e, 0x5f, 0x73, 0x65, 0x6c, 0x00
data_ov002_0215c480:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c48c:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x44, 0x65, 0x6d, 0x6f, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov002_0215c4a0:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x44, 0x65, 0x6d, 0x6f, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov002_0215c4b0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c4b8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215c4c0:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x65, 0x61, 0x72, 0x74, 0x68, 0x30, 0x31, 0x00
data_ov002_0215c4d0:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x5f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x30
    .byte 0x31, 0x00, 0x00, 0x00
data_ov002_0215c4e4:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x5f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x30
    .byte 0x30, 0x00, 0x00, 0x00
data_ov002_0215c4f8:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x5f, 0x62, 0x6c, 0x61, 0x63, 0x6b, 0x30
    .byte 0x30, 0x00, 0x00, 0x00
data_ov002_0215c50c:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x5f, 0x62, 0x6c, 0x61, 0x63, 0x6b, 0x30
    .byte 0x31, 0x00, 0x00, 0x00
data_ov002_0215c520:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x5f, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79
    .byte 0x30, 0x30, 0x00, 0x00
data_ov002_0215c534:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x5f, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79
    .byte 0x30, 0x31, 0x00, 0x00
data_ov002_0215c548:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x42, 0x61, 0x63, 0x6b, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov002_0215c55c:
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x5f, 0x70, 0x6c, 0x61, 0x6e, 0x65, 0x74
    .byte 0x30, 0x30, 0x00, 0x00
data_ov002_0215c570:
    .word data_ov002_0215c4e4
data_ov002_0215c574:
    .word data_ov002_0215c4c0
    .word data_ov002_0215c4e4
    .word data_ov002_0215c4d0
    .word data_ov002_0215c520
    .word data_ov002_0215c534
    .word data_ov002_0215c4f8
    .word data_ov002_0215c50c
    .word data_ov002_0215c55c
    .byte 0x00, 0x00, 0x00, 0x00
data_ov002_0215c598:
    .byte 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x42, 0x61, 0x63, 0x6b, 0x67, 0x72, 0x6f, 0x75, 0x6e
    .byte 0x64, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov002_0215c5b0:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c5bc:
    .byte 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c5c4:
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c5cc:
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c5d4:
    .byte 0x02, 0x04, 0x06, 0x00
data_ov002_0215c5d8:
    .byte 0x04, 0x08, 0x0c, 0x00
data_ov002_0215c5dc:
    .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x08, 0x00
data_ov002_0215c5e4:
    .word func_02073854
    .word func_02073868
data_ov002_0215c5ec:
    .word func_02073f64
    .word func_02073fa4
data_ov002_0215c5f4:
    .byte 0x0c, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00, 0x00
    .byte 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
data_ov002_0215c60c:
    .byte 0x0c, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00, 0x00
    .byte 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
data_ov002_0215c624:
    .byte 0x37, 0x00, 0x00, 0x00
data_ov002_0215c628:
    .byte 0x37, 0x00, 0x00, 0x00
data_ov002_0215c62c:
    .byte 0x01, 0x00, 0x00, 0x00
data_ov002_0215c630:
    .byte 0x00, 0x00, 0x00, 0x00, 0x7d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x7d, 0x00, 0x00, 0x00, 0x7d, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x7d, 0x00, 0x00, 0x00, 0x7d, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x7d, 0x00, 0x00, 0x00
data_ov002_0215c664:
    .word func_ov002_0215818c
    .word func_ov002_0215898c
    .word func_ov002_02158bc4
    .word func_ov002_0215906c
    .word func_ov002_021591b8
    .word func_ov002_02159358
    .word func_ov002_021595b0
    .word func_ov002_02159614
    .word func_ov002_0215961c
    .word func_ov002_02159624
    .word func_ov002_02159854
    .word func_ov002_02159924
    .word func_ov002_02159a34
    .word func_ov002_02159ac0
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov002_02159b44
data_ov002_0215c6a4:
    .word data_ov002_0215c9b0
    .word data_ov002_0215c8d4
    .word data_ov002_0215c964
    .word data_ov002_0215c8e0
    .word data_ov002_0215c7b4
    .word data_ov002_0215c7cc
    .word data_ov002_0215c790
    .word data_ov002_0215c934
    .word data_ov002_0215c808
    .word data_ov002_0215c7f0
    .word data_ov002_0215c8bc
    .word data_ov002_0215c85c
    .word data_ov002_0215c79c
    .word data_ov002_0215c850
    .word data_ov002_0215c7d8
    .word data_ov002_0215c844
    .word data_ov002_0215c88c
    .word data_ov002_0215c838
    .word data_ov002_0215c970
    .word data_ov002_0215c82c
    .word data_ov002_0215c958
    .word data_ov002_0215c820
    .word data_ov002_0215c940
    .word data_ov002_0215c814
    .word data_ov002_0215c928
    .word data_ov002_0215c91c
    .word data_ov002_0215c910
    .word data_ov002_0215c7e4
    .word data_ov002_0215c8f8
    .word data_ov002_0215c7fc
    .word data_ov002_0215c874
    .word data_ov002_0215c880
    .word data_ov002_0215c8c8
    .word data_ov002_0215c898
    .word data_ov002_0215c8a4
    .word data_ov002_0215c8b0
    .word data_ov002_0215c7c0
    .word data_ov002_0215c8ec
    .word data_ov002_0215c904
    .word data_ov002_0215c94c
    .word data_ov002_0215c868
    .word data_ov002_0215c7a8
    .word data_ov002_0215c9c4
    .word data_ov002_0215c9d8
    .word data_ov002_0215ca3c
    .word data_ov002_0215ca50
    .word data_ov002_0215ca64
    .word data_ov002_0215ca7c
    .word data_ov002_0215c97c
    .word data_ov002_0215c9ec
    .word data_ov002_0215ca00
    .word data_ov002_0215ca14
    .word data_ov002_0215ca28
data_ov002_0215c778:
    .byte 0x44, 0x65, 0x6d, 0x6f, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c784:
    .byte 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c790:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x68, 0x68, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c79c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x62, 0x75, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7a8:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x74, 0x6c, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7b4:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x73, 0x6b, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7c0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x69, 0x73, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7cc:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6a, 0x6a, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7d8:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x62, 0x62, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7e4:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x68, 0x6b, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7f0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x72, 0x6b, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c7fc:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6b, 0x6e, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c808:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x79, 0x6f, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c814:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x64, 0x6e, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c820:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x65, 0x73, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c82c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x64, 0x73, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c838:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x74, 0x72, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c844:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6b, 0x6b, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c850:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x64, 0x67, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c85c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x62, 0x6c, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c868:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6e, 0x6b, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c874:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6f, 0x6a, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c880:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x63, 0x74, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c88c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x67, 0x74, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c898:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x72, 0x62, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8a4:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x74, 0x63, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8b0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6d, 0x6f, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8bc:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x62, 0x63, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8c8:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x68, 0x73, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8d4:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x64, 0x62, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8e0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6e, 0x61, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8ec:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6e, 0x62, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c8f8:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x73, 0x73, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c904:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x63, 0x62, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c910:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6e, 0x6e, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c91c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6d, 0x72, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c928:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x69, 0x67, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c934:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x79, 0x68, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c940:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x73, 0x64, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c94c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x74, 0x7a, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c958:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x74, 0x6f, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c964:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6f, 0x70, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c970:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x70, 0x6a, 0x2e, 0x6d, 0x64, 0x66, 0x00
data_ov002_0215c97c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x2e, 0x6d, 0x64, 0x66, 0x00, 0x00, 0x00
data_ov002_0215c98c:
    .byte 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov002_0215c99c:
    .byte 0x44, 0x65, 0x6d, 0x6f, 0x5f, 0x49, 0x6e, 0x69, 0x74, 0x54, 0x65, 0x78, 0x74, 0x75, 0x72, 0x65
    .byte 0x00, 0x00, 0x00, 0x00
data_ov002_0215c9b0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2e, 0x6d, 0x64, 0x66
    .byte 0x00, 0x00, 0x00, 0x00
data_ov002_0215c9c4:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x30, 0x30, 0x2e, 0x6d, 0x64
    .byte 0x66, 0x00, 0x00, 0x00
data_ov002_0215c9d8:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x30, 0x31, 0x2e, 0x6d, 0x64
    .byte 0x66, 0x00, 0x00, 0x00
data_ov002_0215c9ec:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x5f, 0x30, 0x30, 0x2e, 0x6d, 0x64
    .byte 0x66, 0x00, 0x00, 0x00
data_ov002_0215ca00:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x5f, 0x30, 0x31, 0x2e, 0x6d, 0x64
    .byte 0x66, 0x00, 0x00, 0x00
data_ov002_0215ca14:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x5f, 0x30, 0x32, 0x2e, 0x6d, 0x64
    .byte 0x66, 0x00, 0x00, 0x00
data_ov002_0215ca28:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x5f, 0x30, 0x33, 0x2e, 0x6d, 0x64
    .byte 0x66, 0x00, 0x00, 0x00
data_ov002_0215ca3c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x5f, 0x30, 0x30, 0x2e, 0x6d
    .byte 0x64, 0x66, 0x00, 0x00
data_ov002_0215ca50:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x5f, 0x30, 0x31, 0x2e, 0x6d
    .byte 0x64, 0x66, 0x00, 0x00
data_ov002_0215ca64:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x62, 0x6c, 0x61, 0x63, 0x6b, 0x68, 0x6f, 0x6c, 0x65, 0x5f, 0x30
    .byte 0x30, 0x2e, 0x6d, 0x64, 0x66, 0x00, 0x00, 0x00
data_ov002_0215ca7c:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x62, 0x6c, 0x61, 0x63, 0x6b, 0x68, 0x6f, 0x6c, 0x65, 0x5f, 0x30
    .byte 0x31, 0x2e, 0x6d, 0x64, 0x66, 0x00, 0x00, 0x00
data_ov002_0215ca94:
    .byte 0x44, 0x65, 0x6d, 0x6f, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov002_0215caa0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x64, 0x65, 0x6d, 0x6f, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov002_0215cab0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x00, 0x00, 0x00
data_ov002_0215cab8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215cac0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215cac8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov002_0215cad0:
    .byte 0x44, 0x65, 0x63, 0x6b, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov002_0215cae0:
    .byte 0x44, 0x65, 0x63, 0x6b, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov002_0215caf0:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x63, 0x68, 0x65, 0x63, 0x6b, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x63, 0x68
    .byte 0x65, 0x63, 0x6b, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov002_0215cb08:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov002_0215cb14:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov002_0215cb20:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x63, 0x68, 0x65, 0x63, 0x6b, 0x2f, 0x77, 0x69, 0x6e, 0x2e, 0x64, 0x69
    .byte 0x67, 0x00, 0x00, 0x00
data_ov002_0215cb34:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x63, 0x68, 0x65, 0x63, 0x6b, 0x2f, 0x77, 0x69, 0x6e, 0x5f, 0x67, 0x2e
    .byte 0x61, 0x74, 0x6d, 0x00
data_ov002_0215cb48:
    .byte 0x61, 0x00, 0x00, 0x00
data_ov002_0215cb4c:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov002_0215cb60:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x63, 0x68, 0x65, 0x63, 0x6b, 0x2f, 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov002_0215cb74:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .section .bss, 4, 1, 4
data_ov002_0215cba0: .space 0x4
data_ov002_0215cba4: .space 0xc
data_ov002_0215cbb0: .space 0xc
data_ov002_0215cbbc: .space 0xc
data_ov002_0215cbc8: .space 0xc
data_ov002_0215cbd4: .space 0xc
data_ov002_0215cbe0: .space 0xc
data_ov002_0215cbec: .space 0xc
data_ov002_0215cbf8: .space 0xc
data_ov002_0215cc04: .space 0x4
data_ov002_0215cc08: .space 0x8
data_ov002_0215cc10: .space 0x10
