    .include "macros/function.inc"

    .text
    .global func_ov007_0214cd20
    arm_func_start func_ov007_0214cd20
func_ov007_0214cd20: ; 0x0214cd20
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x78
    mov r5, r0
    add r0, sp, #0x28
    mov r4, r1
    bl func_0205542c
    ldrb r2, [sp, #0x12]
    ldrb r1, [sp, #0x29]
    ldrh r3, [sp, #0x40]
    bic r2, r2, #0xf
    and r1, r1, #0xf
    orr r2, r2, r1
    strb r2, [sp, #0x12]
    add r0, sp, #0x2c
    add r1, sp, #0x14
    mov r2, r3, lsl #0x1
    strb r3, [sp, #0x13]
    bl func_02051890
    ldrb r2, [sp, #0x12]
    add r0, sp, #0x4
    mov r1, #0xe
    bic r2, r2, #0xf0
    strb r2, [sp, #0x12]
    bl func_0200f69c
    ldrh r1, [sp, #0x4]
    ldr r3, .L_0214ce28
    ldrh r0, [sp, #0x6]
    strh r1, [r3, #0x8]
    ldrh r1, [sp, #0x8]
    strh r0, [r3, #0xa]
    ldrh r0, [sp, #0xa]
    strh r1, [r3, #0xc]
    ldrh r1, [sp, #0xc]
    strh r0, [r3, #0xe]
    ldr r0, .L_0214ce2c
    strh r1, [r3, #0x10]
    ldrh ip, [sp, #0xe]
    mov r1, #0x0
    mov r2, #0xb100
    strh ip, [r3, #0x12]
    ldrh ip, [sp, #0x10]
    strh ip, [r3, #0x14]
    ldr r0, [r0, #0x0]
    bl func_0201a418
    ldr r1, .L_0214ce28
    mov r3, r4
    mov r4, #0x2
    str r0, [r1, #0x0]
    str r4, [sp, #0x0]
    ldr r0, [r1, #0x0]
    mov r2, r5
    add r1, sp, #0x12
    blx func_ov012_021c0264
    cmp r0, #0x0
    beq .L_0214ce00
    bl func_02055684
.L_0214ce00:
    mov r0, #0x100
    mov r1, #0x3
    blx func_ov012_021c01a8
    ldr r0, .L_0214ce30
    blx func_ov012_021beb40
    ldr r0, .L_0214ce28
    mov r1, #0x1
    strh r1, [r0, #0x8]
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_0214ce28: .word data_ov007_0216ace0
.L_0214ce2c: .word data_020a0dd8
.L_0214ce30: .word func_ov007_0214d228
    arm_func_end func_ov007_0214cd20

    .global func_ov007_0214ce34
    arm_func_start func_ov007_0214ce34
func_ov007_0214ce34: ; 0x0214ce34
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    ldr r2, .L_0214cf90
    mov r7, r0
    mov r3, #0x2
    mov r0, r1
    strh r3, [r2, #0x8]
    blx func_ov012_021bff44
    cmp r0, #0x0
    ldrne r0, .L_0214cf90
    movne r1, #0x7
    strneh r1, [r0, #0x8]
    bne .L_0214cf88
    ldr r0, [r7, #0x0]
    mov r4, #0x0
    cmp r0, #0x0
    moveq r6, r4
    beq .L_0214ce9c
    add r0, sp, #0x0
    blx func_02064744
    ldr r1, [r7, #0x0]
    add r0, sp, #0x0
    blx func_0206451c
    cmp r0, #0x0
    beq .L_0214cf7c
    add r6, sp, #0x0
.L_0214ce9c:
    mov r0, r6
    blx func_ov012_021bf4ac
    mov r5, r0
    cmp r5, #0x10000
    movhi r5, #0x10000
    cmp r5, #0x0
    beq .L_0214cf6c
    ldr r0, .L_0214cf94
    cmp r5, #0x100
    ldr r0, [r0, #0x0]
    bhi .L_0214cef4
    ldrb r1, [r0, #0x414]
    cmp r1, #0x0
    beq .L_0214cef4
    ldr r0, .L_0214cf98
    mov r1, r5
    ldr r0, [r0, #0x0]
    bl func_0201a6d8
    mov r1, r0
    movs r0, #0x0
    strne r1, [r0, #0x0]
    b .L_0214cf04
.L_0214cef4:
    mov r2, r5
    mov r1, #0x0
    bl func_0201a418
    mov r1, r0
.L_0214cf04:
    ldr r0, .L_0214cf90
    cmp r1, #0x0
    str r1, [r0, #0x4]
    beq .L_0214cf6c
    mov r0, r6
    mov r2, r5
    blx func_ov012_021bf19c
    cmp r0, #0x0
    beq .L_0214cf40
    ldr r1, .L_0214cf90
    mov r0, r7
    ldr r1, [r1, #0x4]
    blx func_ov012_021bef3c
    cmp r0, #0x0
    movne r4, #0x1
.L_0214cf40:
    cmp r4, #0x0
    bne .L_0214cf6c
    ldr r0, .L_0214cf90
    ldr r5, [r0, #0x4]
    mov r0, r5
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_0214cf6c
    mov r0, r5
    mov r1, #0x1
    bl func_0201a958
.L_0214cf6c:
    add r0, sp, #0x0
    cmp r6, r0
    bne .L_0214cf7c
    blx func_020644ec
.L_0214cf7c:
    cmp r4, #0x0
    bne .L_0214cf88
    bl func_02055684
.L_0214cf88:
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214cf90: .word data_ov007_0216ace0
.L_0214cf94: .word data_020a0dd8
.L_0214cf98: .word data_020a0f60
    arm_func_end func_ov007_0214ce34

    .global func_ov007_0214cf9c
    arm_func_start func_ov007_0214cf9c
func_ov007_0214cf9c: ; 0x0214cf9c
    stmdb sp!, {r4, lr}
    mov r1, #0x1
    mov r4, r0
    blx func_ov012_021be9f0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov007_0214d5d0
    mov r0, r4
    blx func_ov012_021bfd64
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0214cf9c

    .global func_ov007_0214cfc8
    arm_func_start func_ov007_0214cfc8
func_ov007_0214cfc8: ; 0x0214cfc8
    stmdb sp!, {r4, lr}
    mov r1, #0x0
    mov r4, r0
    blx func_ov012_021be9f0
    cmp r0, #0x0
    bne .L_0214cff4
    mov r0, r4
    bl func_ov007_0214d5d0
    mov r0, r4
    blx func_ov012_021bfd64
    ldmia sp!, {r4, pc}
.L_0214cff4:
    bl func_02055238
    ldr r1, .L_0214d024
    mov r3, #0x1
    ldrh r2, [r1, #0xc]
    mvn r3, r3, lsl r4
    and r2, r2, r3
    strh r2, [r1, #0xc]
    ldrh r2, [r1, #0xa]
    and r2, r2, r3
    strh r2, [r1, #0xa]
    bl func_0205524c
    ldmia sp!, {r4, pc}
.L_0214d024: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214cfc8

    .global func_ov007_0214d028
    arm_func_start func_ov007_0214d028
func_ov007_0214d028: ; 0x0214d028
    stmdb sp!, {r4, lr}
    mov r1, #0x2
    mov r4, r0
    blx func_ov012_021be9f0
    cmp r0, #0x0
    bne .L_0214d054
    mov r0, r4
    bl func_ov007_0214d5d0
    mov r0, r4
    blx func_ov012_021bfd64
    ldmia sp!, {r4, pc}
.L_0214d054:
    bl func_02055238
    ldr r1, .L_0214d084
    mov ip, #0x1
    ldrh r3, [r1, #0xe]
    mvn r2, ip, lsl r4
    and r2, r3, r2
    strh r2, [r1, #0xe]
    ldrh r2, [r1, #0x10]
    orr r2, r2, ip, lsl r4
    strh r2, [r1, #0x10]
    bl func_0205524c
    ldmia sp!, {r4, pc}
.L_0214d084: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d028

    .global func_ov007_0214d088
    arm_func_start func_ov007_0214d088
func_ov007_0214d088: ; 0x0214d088
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, .L_0214d0e4
    mov r0, #0x3
    mov r6, #0x1
    strh r0, [r4, #0x8]
    mov r5, r6
.L_0214d0a0:
    ldrh r0, [r4, #0xa]
    tst r0, r5, lsl r6
    beq .L_0214d0cc
    mov r0, r6
    bl func_ov007_0214d51c
    cmp r0, #0x1
    bne .L_0214d0cc
    mov r0, r6
    bl func_ov007_0214d5d0
    mov r0, r6
    blx func_ov012_021bfd64
.L_0214d0cc:
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    cmp r6, #0x10
    blo .L_0214d0a0
    ldmia sp!, {r4, r5, r6, pc}
.L_0214d0e4: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d088

    .global func_ov007_0214d0e8
    arm_func_start func_ov007_0214d0e8
func_ov007_0214d0e8: ; 0x0214d0e8
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, .L_0214d148
    ldrh r0, [r4, #0xa]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r6, #0x1
    mov r5, r6
    b .L_0214d138
.L_0214d10c:
    ldrh r0, [r4, #0xa]
    tst r0, r5, lsl r6
    beq .L_0214d12c
    mov r0, r6
    blx func_ov012_021bea98
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_0214d12c:
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
.L_0214d138:
    cmp r6, #0x10
    blo .L_0214d10c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_0214d148: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d0e8

    .global func_ov007_0214d14c
    arm_func_start func_ov007_0214d14c
func_ov007_0214d14c: ; 0x0214d14c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, #0x1
    ldr r8, .L_0214d1d0
    mov r7, #0x0
    mov r4, #0x3
    mov r5, r6
.L_0214d164:
    ldrh r0, [r8, #0x12]
    tst r0, r5, lsl r6
    beq .L_0214d1a0
    mov r0, r6
    mov r1, r4
    blx func_ov012_021be9f0
    cmp r0, #0x0
    orrne r0, r7, r5, lsl r6
    movne r0, r0, lsl #0x10
    movne r7, r0, lsr #0x10
    bne .L_0214d1a0
    mov r0, r6
    bl func_ov007_0214d5d0
    mov r0, r6
    blx func_ov012_021bfd64
.L_0214d1a0:
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    cmp r6, #0x10
    blo .L_0214d164
    cmp r7, #0x0
    ldreq r0, .L_0214d1d0
    moveq r1, #0x7
    ldrne r0, .L_0214d1d0
    movne r1, #0x4
    strh r1, [r0, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0214d1d0: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d14c

    .global func_ov007_0214d1d4
    arm_func_start func_ov007_0214d1d4
func_ov007_0214d1d4: ; 0x0214d1d4
    stmdb sp!, {r3, lr}
    ldr r0, .L_0214d1f8
    ldrh r1, [r0, #0x8]
    cmp r1, #0x5
    ldmeqia sp!, {r3, pc}
    mov r1, #0x6
    strh r1, [r0, #0x8]
    blx func_ov012_021bfe80
    ldmia sp!, {r3, pc}
.L_0214d1f8: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d1d4

    .global func_ov007_0214d1fc
    arm_func_start func_ov007_0214d1fc
func_ov007_0214d1fc: ; 0x0214d1fc
    stmdb sp!, {r3, lr}
    ldr r0, .L_0214d224
    ldrh r1, [r0, #0x8]
    cmp r1, #0x4
    ldreqh r1, [r0, #0xa]
    ldreqh r0, [r0, #0x14]
    cmpeq r1, r0
    ldmneia sp!, {r3, pc}
    blx func_ov012_021bfe80
    ldmia sp!, {r3, pc}
.L_0214d224: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d1fc

    .global func_ov007_0214d228
    arm_func_start func_ov007_0214d228
func_ov007_0214d228: ; 0x0214d228
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r2
    cmp r1, #0xe
    addls pc, pc, r1, lsl #0x2
    b .L_0214d4cc
.L_0214d240: ; jump table
    b .L_0214d4cc ; case 0
    ldmia sp!, {r3, r4, r5, pc} ; case 1
    b .L_0214d27c ; case 2
    b .L_0214d308 ; case 3
    ldmia sp!, {r3, r4, r5, pc} ; case 4
    ldmia sp!, {r3, r4, r5, pc} ; case 5
    ldmia sp!, {r3, r4, r5, pc} ; case 6
    b .L_0214d3a8 ; case 7
    ldmia sp!, {r3, r4, r5, pc} ; case 8
    b .L_0214d3d0 ; case 9
    b .L_0214d324 ; case 10
    ldmia sp!, {r3, r4, r5, pc} ; case 11
    b .L_0214d3fc ; case 12
    b .L_0214d488 ; case 13
    b .L_0214d37c ; case 14
.L_0214d27c:
    ldr r0, .L_0214d4d4
    ldrh r0, [r0, #0x8]
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02055238
    ldr r1, .L_0214d4d4
    mov r2, #0x1
    ldrh r3, [r1, #0xa]
    orr r2, r3, r2, lsl r5
    strh r2, [r1, #0xa]
    bl func_0205524c
    sub r1, r5, #0x1
    mov r0, #0x1e
    mul r0, r1, r0
    ldrb r3, [r4, #0xa]
    ldr r1, .L_0214d4d8
    ldr r2, .L_0214d4dc
    strb r3, [r1, r0]
    ldrb r3, [r4, #0xb]
    ldr r1, .L_0214d4e0
    ldr ip, .L_0214d4e4
    strb r3, [r2, r0]
    ldrb lr, [r4, #0xc]
    ldr r3, .L_0214d4e8
    ldr r2, .L_0214d4ec
    strb lr, [r1, r0]
    ldrb lr, [r4, #0xd]
    ldr r1, .L_0214d4f0
    strb lr, [ip, r0]
    ldrb ip, [r4, #0xe]
    strb ip, [r3, r0]
    ldrb r3, [r4, #0xf]
    strb r3, [r2, r0]
    strh r5, [r1, r0]
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d308:
    bl func_ov007_0214d51c
    cmp r0, #0x6
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov007_0214d5d0
    bl func_ov007_0214d1fc
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d324:
    ldr r1, .L_0214d4d4
    ldrh r2, [r1, #0x8]
    cmp r2, #0x2
    beq .L_0214d33c
    bl func_ov007_0214cfc8
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d33c:
    ldrh r3, [r1, #0xc]
    mov r2, #0x1
    orr r2, r3, r2, lsl r5
    strh r2, [r1, #0xc]
    bl func_ov007_0214cf9c
    mov r0, r5
    blx func_ov012_021bead8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r3, .L_0214d4f4
    sub r2, r5, #0x1
    mov r1, #0x1e
    mla r1, r2, r1, r3
    mov r2, #0x16
    bl func_02051890
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d37c:
    ldr r1, .L_0214d4d4
    mov r4, #0x1
    ldrh r3, [r1, #0xc]
    mvn r2, r4, lsl r5
    and r2, r3, r2
    strh r2, [r1, #0xc]
    ldrh r2, [r1, #0xe]
    orr r2, r2, r4, lsl r5
    strh r2, [r1, #0xe]
    bl func_ov007_0214d028
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d3a8:
    ldr r0, .L_0214d4d4
    mov r3, #0x1
    ldrh r2, [r0, #0x10]
    mvn r1, r3, lsl r5
    and r1, r2, r1
    strh r1, [r0, #0x10]
    ldrh r1, [r0, #0x12]
    orr r1, r1, r3, lsl r5
    strh r1, [r0, #0x12]
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d3d0:
    ldr r0, .L_0214d4d4
    mov r3, #0x1
    ldrh r2, [r0, #0x12]
    mvn r1, r3, lsl r5
    and r1, r2, r1
    strh r1, [r0, #0x12]
    ldrh r1, [r0, #0x14]
    orr r1, r1, r3, lsl r5
    strh r1, [r0, #0x14]
    bl func_ov007_0214d1fc
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d3fc:
    ldr r0, .L_0214d4d4
    ldrh r1, [r0, #0x8]
    cmp r1, #0x4
    moveq r1, #0x5
    movne r1, #0x0
    strh r1, [r0, #0x8]
    ldr r0, .L_0214d4d4
    ldr r4, [r0, #0x4]
    cmp r4, #0x0
    beq .L_0214d44c
    mov r0, r4
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_0214d440
    mov r0, r4
    mov r1, #0x1
    bl func_0201a958
.L_0214d440:
    ldr r0, .L_0214d4d4
    mov r1, #0x0
    str r1, [r0, #0x4]
.L_0214d44c:
    ldr r0, .L_0214d4d4
    ldr r4, [r0, #0x0]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_0214d478
    mov r0, r4
    mov r1, #0x1
    bl func_0201a958
.L_0214d478:
    ldr r0, .L_0214d4d4
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d488:
    ldrh r0, [r4, #0x0]
    cmp r0, #0x8
    bgt .L_0214d4b4
    ldmgeia sp!, {r3, r4, r5, pc}
    cmp r0, #0x2
    ldmgtia sp!, {r3, r4, r5, pc}
    cmp r0, #0x1
    ldmltia sp!, {r3, r4, r5, pc}
    cmpne r0, #0x2
    beq .L_0214d4bc
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d4b4:
    cmp r0, #0x9
    ldmneia sp!, {r3, r4, r5, pc}
.L_0214d4bc:
    ldr r0, .L_0214d4d4
    mov r1, #0x7
    strh r1, [r0, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d4cc:
    bl func_02055684
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d4d4: .word data_ov007_0216ace0
.L_0214d4d8: .word data_ov007_0216ad0c
.L_0214d4dc: .word data_ov007_0216ad0d
.L_0214d4e0: .word data_ov007_0216ad0e
.L_0214d4e4: .word data_ov007_0216ad0f
.L_0214d4e8: .word data_ov007_0216ad10
.L_0214d4ec: .word data_ov007_0216ad11
.L_0214d4f0: .word data_ov007_0216ad12
.L_0214d4f4: .word data_ov007_0216acf6
    arm_func_end func_ov007_0214d228

    .global func_ov007_0214d4f8
    arm_func_start func_ov007_0214d4f8
func_ov007_0214d4f8: ; 0x0214d4f8
    ldr r0, .L_0214d504
    ldrh r0, [r0, #0x8]
    bx lr
.L_0214d504: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d4f8

    .global func_ov007_0214d508
    arm_func_start func_ov007_0214d508
func_ov007_0214d508: ; 0x0214d508
    ldr r1, .L_0214d518
    ldr r0, [r1, r0, lsl #0x2]
    ldrh r0, [r0, #0x0]
    bx lr
.L_0214d518: .word data_ov007_02169298
    arm_func_end func_ov007_0214d508

    .global func_ov007_0214d51c
    arm_func_start func_ov007_0214d51c
func_ov007_0214d51c: ; 0x0214d51c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_02055238
    ldr r1, .L_0214d5c8
    mov r2, #0x1
    mov r2, r2, lsl r4
    ldrh r1, [r1, #0xa]
    mov r4, r2, lsl #0x10
    mov r5, r0
    tst r1, r4, lsr #0x10
    bne .L_0214d558
    bl func_0205524c
    mov r0, #0x0
    b .L_0214d5c0
.L_0214d558:
    ldr r0, .L_0214d5cc
    add r1, sp, #0x0
    mov r2, #0xe
    bl func_02051890
    mov r0, r5
    bl func_0205524c
    ldrh r0, [sp, #0x4]
    tst r0, r4, lsr #0x10
    movne r0, #0x2
    bne .L_0214d5c0
    ldrh r0, [sp, #0x6]
    tst r0, r4, lsr #0x10
    movne r0, #0x3
    bne .L_0214d5c0
    ldrh r0, [sp, #0x8]
    tst r0, r4, lsr #0x10
    movne r0, #0x4
    bne .L_0214d5c0
    ldrh r0, [sp, #0xa]
    tst r0, r4, lsr #0x10
    movne r0, #0x5
    bne .L_0214d5c0
    ldrh r0, [sp, #0xc]
    tst r0, r4, lsr #0x10
    movne r0, #0x6
    moveq r0, #0x1
.L_0214d5c0:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d5c8: .word data_ov007_0216ace0
.L_0214d5cc: .word data_ov007_0216ace8
    arm_func_end func_ov007_0214d51c

    .global func_ov007_0214d5d0
    arm_func_start func_ov007_0214d5d0
func_ov007_0214d5d0: ; 0x0214d5d0
    stmdb sp!, {r4, lr}
    mov r1, #0x1
    mvn r0, r1, lsl r0
    mov r4, r0, lsl #0x10
    bl func_02055238
    ldr r1, .L_0214d638
    ldrh r2, [r1, #0xa]
    and r2, r2, r4, lsr #0x10
    strh r2, [r1, #0xa]
    ldrh r2, [r1, #0xc]
    and r2, r2, r4, lsr #0x10
    strh r2, [r1, #0xc]
    ldrh r2, [r1, #0xe]
    and r2, r2, r4, lsr #0x10
    strh r2, [r1, #0xe]
    ldrh r2, [r1, #0x10]
    and r2, r2, r4, lsr #0x10
    strh r2, [r1, #0x10]
    ldrh r2, [r1, #0x12]
    and r2, r2, r4, lsr #0x10
    strh r2, [r1, #0x12]
    ldrh r2, [r1, #0x14]
    and r2, r2, r4, lsr #0x10
    strh r2, [r1, #0x14]
    bl func_0205524c
    ldmia sp!, {r4, pc}
.L_0214d638: .word data_ov007_0216ace0
    arm_func_end func_ov007_0214d5d0

    .global func_ov007_0214d63c
    arm_func_start func_ov007_0214d63c
func_ov007_0214d63c: ; 0x0214d63c
    ldr r1, .L_0214d664
    mov r2, #0x1
    ldrh r1, [r1, #0xa]
    tst r1, r2, lsl r0
    subne r1, r0, #0x1
    ldrne r2, .L_0214d668
    movne r0, #0x1e
    mlane r0, r1, r0, r2
    moveq r0, #0x0
    bx lr
.L_0214d664: .word data_ov007_0216ace0
.L_0214d668: .word data_ov007_0216acf6
    arm_func_end func_ov007_0214d63c

    .global func_ov007_0214d66c
    arm_func_start func_ov007_0214d66c
func_ov007_0214d66c: ; 0x0214d66c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02086c38
    blx func_0208b644
    ldr r1, .L_0214d6b4
    mov r2, #0x0
    mov r0, r4
    strb r2, [r1, #0x0]
    blx func_0208a47c
    mov r4, r0
    bl func_0201a2fc
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_0201aeec
    ldr r0, .L_0214d6b8
    mov r1, r4
    bl func_ov007_0214cd20
    ldmia sp!, {r4, pc}
.L_0214d6b4: .word data_ov007_0216ad50
.L_0214d6b8: .word 0x341
    arm_func_end func_ov007_0214d66c

    .global func_ov007_0214d6bc
    arm_func_start func_ov007_0214d6bc
func_ov007_0214d6bc: ; 0x0214d6bc
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_0214d71c
    mov r2, #0x0
    mov r6, r0
    strb r2, [r1, #0x0]
    bl func_ov007_0214d1d4
    mov r5, #0x0
    ldr r4, .L_0214d720
    b .L_0214d6f8
.L_0214d6e0:
    bl func_ov007_0214d4f8
    cmp r0, #0x6
    bne .L_0214d700
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_0214d6f8:
    cmp r5, #0xb4
    blo .L_0214d6e0
.L_0214d700:
    bl func_ov007_0214d4f8
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, #0x1
    blx func_0208b784
    bl func_02086c24
    ldmia sp!, {r4, r5, r6, pc}
.L_0214d71c: .word data_ov007_0216ad50
.L_0214d720: .word data_020a0e18
    arm_func_end func_ov007_0214d6bc

    .global func_ov007_0214d724
    arm_func_start func_ov007_0214d724
func_ov007_0214d724: ; 0x0214d724
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    bl func_ov007_0214d6bc
    ldr r1, .L_0214d748
    mov r0, r4
    mov r2, #0x7e
    blx func_02088904
    ldmia sp!, {r4, pc}
.L_0214d748: .word data_ov007_021694dc
    arm_func_end func_ov007_0214d724

    .global func_ov007_0214d74c
    arm_func_start func_ov007_0214d74c
func_ov007_0214d74c: ; 0x0214d74c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, .L_0214d7c4
    mov r1, #0x0
    str r1, [r0, #0x8]
    blx func_0208a49c
    bl func_02089b54
    mov r5, r0
    mov r1, r5, lsl #0x10
    ldr r0, .L_0214d7c8
    mov r1, r1, lsr #0x10
    bl func_ov007_0214ce34
    ldr r4, .L_0214d7cc
    b .L_0214d794
.L_0214d780:
    bl func_ov007_0214d4f8
    cmp r0, #0x7
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    blx r0
.L_0214d794:
    bl func_ov007_0214d4f8
    cmp r0, #0x2
    bne .L_0214d780
    ldr r1, .L_0214d7d0
    mov r2, #0x1
    mov r0, #0x2
    str r2, [r1, #0x0]
    blx func_0208a4c4
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    blx func_0208a4d0
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d7c4: .word data_020afe90
.L_0214d7c8: .word data_ov007_02168978
.L_0214d7cc: .word data_020a0e18
.L_0214d7d0: .word data_020a0f10
    arm_func_end func_ov007_0214d74c

    .global func_ov007_0214d7d4
    arm_func_start func_ov007_0214d7d4
func_ov007_0214d7d4: ; 0x0214d7d4
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    movs r5, r0
    bne .L_0214d810
    add r0, sp, #0x0
    bl func_0205542c
    ldr r1, .L_0214d880
    add r0, sp, #0x4
    mov r2, #0x14
    bl func_02051890
    ldr r0, .L_0214d884
    mov r1, #0x0
    strh r1, [r0, #0x16]
    ldr r0, .L_0214d880
    b .L_0214d878
.L_0214d810:
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov007_0214d51c
    cmp r0, #0x3
    movlt r0, #0x0
    blt .L_0214d878
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov007_0214d63c
    mov r4, r0
    mov r0, r5
    blx func_0208a4dc
    mov r1, r0
    add r0, r4, #0x16
    mov r2, #0x6
    bl func_02051890
    ldrb r2, [r4, #0x1]
    ldr r1, .L_0214d880
    add r0, r4, #0x2
    mov r2, r2, lsl #0x1
    bl func_02051890
    ldrb r1, [r4, #0x1]
    ldr r0, .L_0214d880
    mov r2, #0x0
    mov r1, r1, lsl #0x1
    strh r2, [r0, r1]
.L_0214d878:
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
.L_0214d880: .word data_ov007_0216ad52
.L_0214d884: .word data_ov007_0216ad50
    arm_func_end func_ov007_0214d7d4

    .global func_ov007_0214d888
    arm_func_start func_ov007_0214d888
func_ov007_0214d888: ; 0x0214d888
    stmdb sp!, {r4, lr}
    bl func_ov007_0214d088
    ldr r1, .L_0214d92c
    mov r2, #0x1
    mov r0, #0x2
    strb r2, [r1, #0x0]
    bl func_ov007_0214d51c
    cmp r0, #0x0
    bne .L_0214d8d0
    mov r0, #0x3
    blx func_0208a4dc
    mov r4, r0
    mov r0, #0x2
    blx func_0208a4dc
    mov r1, r0
    mov r0, r4
    mov r2, #0x6
    bl func_02051890
.L_0214d8d0:
    mov r0, #0x1
    bl func_ov007_0214d51c
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, #0x2
    blx func_0208a4dc
    mov r4, r0
    mov r0, #0x1
    blx func_0208a4dc
    mov r1, r0
    mov r0, r4
    mov r2, #0x6
    bl func_02051890
    mov r0, #0x3
    blx func_0208a4dc
    mov r4, r0
    mov r0, #0x2
    blx func_0208a4dc
    mov r1, r0
    mov r0, r4
    mov r2, #0x6
    bl func_02051890
    ldmia sp!, {r4, pc}
.L_0214d92c: .word data_ov007_0216ad50
    arm_func_end func_ov007_0214d888

    .global func_ov007_0214d930
    arm_func_start func_ov007_0214d930
func_ov007_0214d930: ; 0x0214d930
    stmdb sp!, {r3, lr}
    bl func_ov007_0214d0e8
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0214d930

    .global func_ov007_0214d948
    arm_func_start func_ov007_0214d948
func_ov007_0214d948: ; 0x0214d948
    ldr ip, .L_0214d954
    mov r0, #0x0
    bx ip
.L_0214d954: .word func_ov007_0214d508
    arm_func_end func_ov007_0214d948

    .global func_ov007_0214d958
    arm_func_start func_ov007_0214d958
func_ov007_0214d958: ; 0x0214d958
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, .L_0214da3c
    mov r8, #0x0
    strb r8, [r0, #0x0]
    mov r5, r8
    mov r4, #0x6
    mov r7, r8
    mov r6, #0x1
.L_0214d978:
    mov r0, r7
    bl func_ov007_0214d508
    add r1, r8, #0x1
    tst r0, r6, lsl r1
    bne .L_0214d9a0
    mov r0, r1
    blx func_0208a4dc
    mov r1, r5
    mov r2, r4
    bl func_020517fc
.L_0214d9a0:
    add r8, r8, #0x1
    cmp r8, #0x3
    blt .L_0214d978
    bl func_ov007_0214d14c
    mov r5, #0x0
    ldr r4, .L_0214da40
    b .L_0214d9e4
.L_0214d9bc:
    bl func_ov007_0214d4f8
    cmp r0, #0x4
    beq .L_0214d9ec
    bl func_ov007_0214d4f8
    cmp r0, #0x7
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_0214d9e4:
    cmp r5, #0xb4
    blo .L_0214d9bc
.L_0214d9ec:
    mov r5, #0x0
    ldr r4, .L_0214da40
    b .L_0214da20
.L_0214d9f8:
    bl func_ov007_0214d4f8
    cmp r0, #0x5
    beq .L_0214da28
    bl func_ov007_0214d4f8
    cmp r0, #0x7
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_0214da20:
    cmp r5, #0xb4
    blo .L_0214d9f8
.L_0214da28:
    bl func_ov007_0214d4f8
    cmp r0, #0x5
    movne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0214da3c: .word data_ov007_0216ad50
.L_0214da40: .word data_020a0e18
    arm_func_end func_ov007_0214d958

    .global func_ov007_0214da44
    arm_func_start func_ov007_0214da44
func_ov007_0214da44: ; 0x0214da44
    ldr r0, .L_0214da58
    ldr ip, .L_0214da5c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bx ip
.L_0214da58: .word data_ov007_0216ad68
.L_0214da5c: .word func_ov007_0214e150
    arm_func_end func_ov007_0214da44

    .global func_ov007_0214da60
    arm_func_start func_ov007_0214da60
func_ov007_0214da60: ; 0x0214da60
    ldr r0, .L_0214da74
    ldr ip, .L_0214da78
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x1c]
    bx ip
.L_0214da74: .word data_ov007_0216ad68
.L_0214da78: .word func_ov007_0215c274
    arm_func_end func_ov007_0214da60

    .global func_ov007_0214da7c
    arm_func_start func_ov007_0214da7c
func_ov007_0214da7c: ; 0x0214da7c
    ldr r0, .L_0214da90
    ldr ip, .L_0214da94
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x18]
    bx ip
.L_0214da90: .word data_ov007_0216ad68
.L_0214da94: .word func_ov007_02153644
    arm_func_end func_ov007_0214da7c

    .global func_ov007_0214da98
    arm_func_start func_ov007_0214da98
func_ov007_0214da98: ; 0x0214da98
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov010_02199ee8
    ldr r1, .L_0214db58
    ldr r2, .L_0214db5c
    mov r0, #0x2c
    mov r3, #0xb2
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x2c
    mov r4, r0
    bl func_020517fc
    ldr r0, .L_0214db60
    str r4, [r0, #0x0]
    bl func_020310f4
    ldr r2, .L_0214db64
    str r0, [r4, #0x0]
    ldr r1, .L_0214db68
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_0214db6c
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, .L_0214db70
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x0
    str r0, [r4, #0xc]
    str r8, [r4, #0x10]
    str r7, [r4, #0x14]
    str r6, [r4, #0x18]
    str r5, [r4, #0x1c]
    ldr r0, [r4, #0x0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0214db58: .word data_ov007_02169500
.L_0214db5c: .word data_ov007_021694ec
.L_0214db60: .word data_ov007_0216ad68
.L_0214db64: .word data_02093c04
.L_0214db68: .word data_020a0e80
.L_0214db6c: .word data_020a16c0
.L_0214db70: .word func_ov007_0214deac
    arm_func_end func_ov007_0214da98

    .global func_ov007_0214db74
    arm_func_start func_ov007_0214db74
func_ov007_0214db74: ; 0x0214db74
    str r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov007_0214db74

    .global func_ov007_0214db7c
    arm_func_start func_ov007_0214db7c
func_ov007_0214db7c: ; 0x0214db7c
    stmdb sp!, {r4, lr}
    mov r1, #0x0
    mov r4, r0
    mov r2, r1
    mov r3, r1
    mov r0, #0x1
    bl func_ov007_0214da98
    ldr r1, .L_0214dba8
    ldr r1, [r1, #0x0]
    str r4, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_0214dba8: .word data_ov007_0216ad68
    arm_func_end func_ov007_0214db7c

    .global func_ov007_0214dbac
    arm_func_start func_ov007_0214dbac
func_ov007_0214dbac: ; 0x0214dbac
    ldr ip, .L_0214dbc4
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x9
    bx ip
.L_0214dbc4: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dbac

    .global func_ov007_0214dbc8
    arm_func_start func_ov007_0214dbc8
func_ov007_0214dbc8: ; 0x0214dbc8
    ldr ip, .L_0214dbe0
    mov r0, #0x1
    mov r2, #0x0
    mov r1, r0
    mov r3, r2
    bx ip
.L_0214dbe0: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dbc8

    .global func_ov007_0214dbe4
    arm_func_start func_ov007_0214dbe4
func_ov007_0214dbe4: ; 0x0214dbe4
    ldr ip, .L_0214dbfc
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x3
    bx ip
.L_0214dbfc: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dbe4

    .global func_ov007_0214dc00
    arm_func_start func_ov007_0214dc00
func_ov007_0214dc00: ; 0x0214dc00
    ldr ip, .L_0214dc18
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x2
    bx ip
.L_0214dc18: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dc00

    .global func_ov007_0214dc1c
    arm_func_start func_ov007_0214dc1c
func_ov007_0214dc1c: ; 0x0214dc1c
    ldr ip, .L_0214dc34
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x4
    bx ip
.L_0214dc34: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dc1c

    .global func_ov007_0214dc38
    arm_func_start func_ov007_0214dc38
func_ov007_0214dc38: ; 0x0214dc38
    ldr ip, .L_0214dc50
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x5
    bx ip
.L_0214dc50: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dc38

    .global func_ov007_0214dc54
    arm_func_start func_ov007_0214dc54
func_ov007_0214dc54: ; 0x0214dc54
    ldr ip, .L_0214dc6c
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x6
    bx ip
.L_0214dc6c: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dc54

    .global func_ov007_0214dc70
    arm_func_start func_ov007_0214dc70
func_ov007_0214dc70: ; 0x0214dc70
    ldr ip, .L_0214dc88
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x8
    bx ip
.L_0214dc88: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dc70

    .global func_ov007_0214dc8c
    arm_func_start func_ov007_0214dc8c
func_ov007_0214dc8c: ; 0x0214dc8c
    ldr ip, .L_0214dca4
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x2
    mov r1, #0x1
    bx ip
.L_0214dca4: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dc8c

    .global func_ov007_0214dca8
    arm_func_start func_ov007_0214dca8
func_ov007_0214dca8: ; 0x0214dca8
    ldr ip, .L_0214dcc0
    mov r2, #0x0
    mov r3, r2
    mov r0, #0xa
    mov r1, #0x2
    bx ip
.L_0214dcc0: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dca8

    .global func_ov007_0214dcc4
    arm_func_start func_ov007_0214dcc4
func_ov007_0214dcc4: ; 0x0214dcc4
    ldr ip, .L_0214dcdc
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x7
    mov r1, #0x4
    bx ip
.L_0214dcdc: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dcc4

    .global func_ov007_0214dce0
    arm_func_start func_ov007_0214dce0
func_ov007_0214dce0: ; 0x0214dce0
    ldr ip, .L_0214dcf8
    mov r0, #0xe
    mov r1, #0x6
    mov r2, #0x0
    mov r3, #0x1
    bx ip
.L_0214dcf8: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dce0

    .global func_ov007_0214dcfc
    arm_func_start func_ov007_0214dcfc
func_ov007_0214dcfc: ; 0x0214dcfc
    ldr ip, .L_0214dd14
    mov r0, #0xe
    mov r1, #0x6
    mov r2, #0x0
    mov r3, #0x2
    bx ip
.L_0214dd14: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dcfc

    .global func_ov007_0214dd18
    arm_func_start func_ov007_0214dd18
func_ov007_0214dd18: ; 0x0214dd18
    ldr ip, .L_0214dd30
    mov r0, #0x13
    mov r1, #0x7
    mov r2, #0x2
    mov r3, #0x0
    bx ip
.L_0214dd30: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dd18

    .global func_ov007_0214dd34
    arm_func_start func_ov007_0214dd34
func_ov007_0214dd34: ; 0x0214dd34
    ldr ip, .L_0214dd4c
    mov r0, #0x13
    mov r1, #0x7
    mov r2, #0x4
    mov r3, #0x0
    bx ip
.L_0214dd4c: .word func_ov007_0214da98
    arm_func_end func_ov007_0214dd34

    .global func_ov007_0214dd50
    arm_func_start func_ov007_0214dd50
func_ov007_0214dd50: ; 0x0214dd50
    ldr r0, .L_0214dd5c
    ldr r0, [r0, #0x0]
    bx lr
.L_0214dd5c: .word data_ov007_0216ad68
    arm_func_end func_ov007_0214dd50

    .global func_ov007_0214dd60
    arm_func_start func_ov007_0214dd60
func_ov007_0214dd60: ; 0x0214dd60
    cmp r0, #0x0
    strne r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov007_0214dd60

    .global func_ov007_0214dd6c
    arm_func_start func_ov007_0214dd6c
func_ov007_0214dd6c: ; 0x0214dd6c
    cmp r0, #0x0
    movne r2, #0x19
    strne r2, [r0, #0x10]
    strne r1, [r0, #0xc]
    bx lr
    arm_func_end func_ov007_0214dd6c

    .global func_ov007_0214dd80
    arm_func_start func_ov007_0214dd80
func_ov007_0214dd80: ; 0x0214dd80
    cmp r0, #0x0
    strne r1, [r0, #0x14]
    bx lr
    arm_func_end func_ov007_0214dd80

    .global func_ov007_0214dd8c
    arm_func_start func_ov007_0214dd8c
func_ov007_0214dd8c: ; 0x0214dd8c
    cmp r0, #0x0
    strne r1, [r0, #0x18]
    bx lr
    arm_func_end func_ov007_0214dd8c

    .global func_ov007_0214dd98
    arm_func_start func_ov007_0214dd98
func_ov007_0214dd98: ; 0x0214dd98
    cmp r0, #0x0
    strne r1, [r0, #0x1c]
    bx lr
    arm_func_end func_ov007_0214dd98

    .global func_ov007_0214dda4
    arm_func_start func_ov007_0214dda4
func_ov007_0214dda4: ; 0x0214dda4
    cmp r0, #0x0
    strne r1, [r0, #0x20]
    bx lr
    arm_func_end func_ov007_0214dda4

    .global func_ov007_0214ddb0
    arm_func_start func_ov007_0214ddb0
func_ov007_0214ddb0: ; 0x0214ddb0
    cmp r0, #0x0
    ldrne r0, [r0, #0x20]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov007_0214ddb0

    .global func_ov007_0214ddc0
    arm_func_start func_ov007_0214ddc0
func_ov007_0214ddc0: ; 0x0214ddc0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_0214ddec
    b .L_0214dde0
.L_0214ddd4:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_0214dde0:
    cmp r5, r6
    blo .L_0214ddd4
    ldmia sp!, {r4, r5, r6, pc}
.L_0214ddec: .word data_020a0e18
    arm_func_end func_ov007_0214ddc0

    .global func_ov007_0214ddf0
    arm_func_start func_ov007_0214ddf0
func_ov007_0214ddf0: ; 0x0214ddf0
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
    arm_func_end func_ov007_0214ddf0

    .global func_ov007_0214de1c
    arm_func_start func_ov007_0214de1c
func_ov007_0214de1c: ; 0x0214de1c
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    str r1, [r2, #0x8f8]
    strb r0, [r2, #0x902]
    bx lr
    arm_func_end func_ov007_0214de1c

    .global func_ov007_0214de30
    arm_func_start func_ov007_0214de30
func_ov007_0214de30: ; 0x0214de30
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
    arm_func_end func_ov007_0214de30

    .global func_ov007_0214deac
    arm_func_start func_ov007_0214deac
func_ov007_0214deac: ; 0x0214deac
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    beq .L_0214ded8
    ldr r0, [r1, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    beq .L_0214e128
.L_0214ded8:
    cmp r1, #0x0
    beq .L_0214e054
    mov r0, #0x4
    bl func_ov007_0214ddc0
    mov r0, #0x2
    bl func_ov007_0214ddc0
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x3f
    mov r2, #0x0
    bl func_ov007_0214ddf0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x3f
    mov r2, #0x0
    bl func_ov007_0214ddf0
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mvn r1, #0xf
    bl func_ov007_0214de1c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mvn r1, #0xf
    bl func_ov007_0214de1c
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0x4]
    str r0, [sp, #0x0]
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    add r1, sp, #0x0
    add r2, sp, #0x4
    add r3, sp, #0x8
    bl func_ov007_0214de30
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x10]
    str r0, [sp, #0xc]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    add r1, sp, #0xc
    add r2, sp, #0x10
    add r3, sp, #0x14
    bl func_ov007_0214de30
    mov r0, #0x0
    bl func_02043264
    ldr r0, .L_0214e130
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    bl func_0203d4e4
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0x958]
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x2
    strb r2, [r1, #0x958]
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x3
    strb r2, [r1, #0x958]
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x1
    strb r2, [r1, #0x958]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x2
    strb r2, [r1, #0x958]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x3
    strb r2, [r1, #0x958]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    ldr r1, [r0, #0x4]
    mov r0, #0x2
    strb r2, [r1, #0x958]
    bl func_ov007_0214ddc0
.L_0214e054:
    bl func_ov010_021a3264
    cmp r0, #0x0
    movne r0, #0x18
    strne r0, [r5, #0x10]
    ldr r1, [r5, #0x10]
    ldr r0, .L_0214e134
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0214e080
    blx r0
.L_0214e080:
    str r0, [r5, #0x8]
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x10]
    bne .L_0214e128
    ldr r0, [r5, #0x4]
    ldr r4, [r5, #0xc]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0214e138
    ldr r2, .L_0214e13c
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214e140
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r2, [r0, #0x0]
    str r3, [r1, #0x0]
    ldr r1, [r5, #0xc]
    ldr r0, .L_0214e144
    str r1, [r0, #0x8]
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r1, .L_0214e148
    mov r2, #0x0
    mov r0, r5
    str r2, [r1, #0x0]
    bl func_0201b244
    cmp r4, #0x9
    cmpne r4, #0xe
    cmpne r4, #0xf
    beq .L_0214e114
    bl func_ov010_02199fd8
.L_0214e114:
    ldr r0, .L_0214e14c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl func_0201ad30
.L_0214e128:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_0214e130: .word data_020a0f64
.L_0214e134: .word data_ov007_021689b4
.L_0214e138: .word data_02093c04
.L_0214e13c: .word data_020a16c0
.L_0214e140: .word data_020a0e80
.L_0214e144: .word data_020afcb0
.L_0214e148: .word data_ov007_0216ad68
.L_0214e14c: .word data_020a0dd8
    arm_func_end func_ov007_0214deac

    .global func_ov007_0214e150
    thumb_func_start func_ov007_0214e150
func_ov007_0214e150: ; 0x0214e150
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0xd0
    mov r4, r0
    mov r0, #0xb0
    mov r3, r0
    ldr r1, .L_0214e4a0
    ldr r2, .L_0214e4a4
    add r3, #0xb7
    blx func_0201a21c
    mov r5, r0
    mov r1, #0x0
    mov r2, #0xb0
    blx func_020517fc
    blx func_ov007_021517f4
    mov r1, r5
    add r1, #0xab
    strb r0, [r1, #0x0]
    ldr r0, .L_0214e4a8
    ldr r1, [r0, #0x58]
    mov r0, #0x20
    tst r0, r1
    bne .L_0214e186
    mov r1, #0x1
    b .L_0214e188
.L_0214e186:
    mov r1, #0x0
.L_0214e188:
    mov r0, r5
    add r0, #0xac
    strb r1, [r0, #0x0]
    mov r0, r5
    add r0, #0x8c
    str r4, [r0, #0x0]
    cmp r4, #0x1
    blt .L_0214e1b6
    cmp r4, #0x6
    bge .L_0214e1b6
    mov r0, r5
    mov r1, #0x4
    add r0, #0x94
    str r1, [r0, #0x0]
    mov r0, r5
    add r1, r4, #0x7
    add r0, #0x98
    str r1, [r0, #0x0]
    mov r0, r5
    mov r1, #0x3
    add r0, #0x9c
    str r1, [r0, #0x0]
    b .L_0214e20e
.L_0214e1b6:
    cmp r4, #0x6
    blt .L_0214e1d8
    cmp r4, #0x9
    bge .L_0214e1d8
    mov r0, r5
    mov r1, #0x5
    add r0, #0x94
    str r1, [r0, #0x0]
    mov r0, r5
    add r1, r4, #0x7
    add r0, #0x98
    str r1, [r0, #0x0]
    mov r0, r5
    mov r1, #0x4
    add r0, #0x9c
    str r1, [r0, #0x0]
    b .L_0214e20e
.L_0214e1d8:
    cmp r4, #0x9
    bne .L_0214e1f6
    mov r0, r5
    mov r1, #0x6
    add r0, #0x94
    str r1, [r0, #0x0]
    mov r0, r5
    mov r1, #0x8
    add r0, #0x98
    str r1, [r0, #0x0]
    mov r0, r5
    mov r1, #0x1
    add r0, #0x9c
    str r1, [r0, #0x0]
    b .L_0214e20e
.L_0214e1f6:
    mov r0, r5
    mov r1, #0x4
    add r0, #0x94
    str r1, [r0, #0x0]
    mov r0, r5
    mov r1, #0x8
    add r0, #0x98
    str r1, [r0, #0x0]
    mov r0, r5
    mov r1, #0x1
    add r0, #0x9c
    str r1, [r0, #0x0]
.L_0214e20e:
    mov r0, r5
    add r0, #0x8c
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0214e220
    mov r0, r5
    mov r1, #0x1
    add r0, #0xaa
    strb r1, [r0, #0x0]
.L_0214e220:
    blx func_020310f4
    ldr r1, .L_0214e4ac
    str r0, [r5, #0x4]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_0214e4b0
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_0214e4b4
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r5, #0x4]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    str r0, [r5, #0x10]
    mov r0, r5
    mov r3, #0x1
    add r0, #0xad
    strb r3, [r0, #0x0]
    mov r0, r5
    add r0, #0xa8
    strb r3, [r0, #0x0]
    mov r0, r5
    mov r2, #0x6
    subs r1, r3, #0x2
    add r0, #0xa6
    strb r1, [r0, #0x0]
    mov r0, r5
    add r0, #0xa7
    strb r1, [r0, #0x0]
    mov r0, #0x40
    mov r1, #0x20
    lsl r2, r2, #0xc
    blx func_ov007_02150678
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    str r0, [r5, #0x0]
    mov r0, #0x2
    blx func_0203b414
    mov r2, r0
    ldr r1, .L_0214e4b8
    add r2, #0x88
    ldmia r1!, {r0, r1}
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    ldr r7, .L_0214e4bc
    str r0, [r5, #0x14]
    mov r4, #0x0
.L_0214e2a2:
    lsl r6, r4, #0x2
    ldr r0, [r7, r6]
    mov r1, #0x0
    bl func_020101f4
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x1c]
    cmp r4, #0x3
    blt .L_0214e2a2
    ldr r1, .L_0214e4c0
    ldr r2, .L_0214e4c4
    ldr r3, .L_0214e4c8
    mov r0, #0xcc
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_0214e2d0
    ldr r1, .L_0214e4cc
    ldr r2, .L_0214e4d0
    mov r3, #0x0
    bl func_ov012_021af26c
.L_0214e2d0:
    blx func_ov007_0214f870
    mov r6, r0
    ldr r2, [r6, #0x4]
    mov r1, #0x0
    mov r0, r2
    add r0, #0xbc
    strh r1, [r0, #0x0]
    mov r0, #0x3
    add r2, #0xbe
    strh r0, [r2, #0x0]
    mov r0, #0x1
    mov r2, r6
    mov r3, r1
    bl func_ov012_021b3b7c
    ldr r0, .L_0214e4d4
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r1, .L_0214e4d8
    mov r0, r6
    blx func_ov007_0214f898
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    add r0, #0x14
    ldr r4, [r0, #0x18]
    cmp r4, #0x0
    bne .L_0214e312
    ldr r0, [r0, #0xc]
    blx func_02036430
    mov r4, r0
.L_0214e312:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214e320
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214e320:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x18]
    mov r1, #0x21
    mov r2, #0x3
    mov r3, #0x5
    blx func_0206ad90
    mov r1, r5
    add r1, #0x88
    str r0, [r1, #0x0]
    mov r0, r5
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x0
    strh r0, [r1, #0x18]
    ldr r0, .L_0214e4dc
    strh r0, [r1, #0x16]
    mov r0, #0x1e
    strb r0, [r1, #0x1a]
    mov r0, #0x1
    strb r0, [r1, #0x1c]
    strb r0, [r1, #0x1b]
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b44
    mov r4, r0
    str r4, [r5, #0x28]
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e4e0
    blx func_02028384
    mov r0, #0x85
    lsl r0, r0, #0xc
    str r0, [sp, #0x2c]
    mov r0, r4
    add r1, sp, #0x2c
    blx func_ov007_0214ed20
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    blx func_0203b404
    mov r3, r0
    add r3, #0x88
    mov r1, #0x81
    ldr r0, [r5, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    blx func_0203b3e4
    mov r1, r0
    add r1, #0x88
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214e4e4
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x44]
    ldr r1, [r5, #0x28]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0214e4e8
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    mov r0, #0x5
    lsl r0, r0, #0xe
    str r0, [sp, #0x50]
    mov r0, r4
    add r1, sp, #0x50
    blx func_ov007_0214f27c
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e4ec
    add r0, #0xdc
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e4f0
    add r0, #0xe0
    str r1, [r0, #0x0]
    str r4, [r5, #0x2c]
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0214e4f4
    add r0, sp, #0x64
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_0214e4f8
    add r0, sp, #0x5c
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x48]
    ldr r0, .L_0214e4fc
    add r1, sp, #0x4c
    str r0, [sp, #0x4c]
    mov r0, r4
    add r2, sp, #0x48
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x5c]
    ldr r3, [sp, #0x60]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x40]
    str r0, [sp, #0x44]
    mov r0, r4
    add r1, sp, #0x44
    add r2, sp, #0x40
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    mov r2, #0x10
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r2, .L_0214e500
    b .L_0214e504
.L_0214e4a0: .word data_ov007_0216971c
.L_0214e4a4: .word data_ov007_02169684
.L_0214e4a8: .word data_020b0b38
.L_0214e4ac: .word data_02093c04
.L_0214e4b0: .word data_020a0e80
.L_0214e4b4: .word data_020a16c0
.L_0214e4b8: .word data_ov007_02169510
.L_0214e4bc: .word data_ov007_02169518
.L_0214e4c0: .word data_ov007_02169644
.L_0214e4c4: .word data_ov007_0216962c
.L_0214e4c8: .word 0x1de
.L_0214e4cc: .word func_ov007_0214f8c0
.L_0214e4d0: .word func_ov007_0214f970
.L_0214e4d4: .word data_ov012_021d5154
.L_0214e4d8: .word 0x31305053
.L_0214e4dc: .word 0x8df
.L_0214e4e0: .word func_ov007_021503d0
.L_0214e4e4: .word func_ov007_0214f834
.L_0214e4e8: .word 0x101
.L_0214e4ec: .word func_ov007_0215026c
.L_0214e4f0: .word func_ov007_02150304
.L_0214e4f4: .word data_ov007_02169730
.L_0214e4f8: .word data_ov007_0216973c
.L_0214e4fc: .word 0xfffb0000
.L_0214e500: .word 0x494c
.L_0214e504:
    ldr r3, [sp, #0x68]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x38]
    str r0, [sp, #0x3c]
    mov r0, r4
    add r1, sp, #0x3c
    add r2, sp, #0x38
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x5c]
    ldr r3, [sp, #0x60]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    blx func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b7744
    mov r0, #0x0
    str r0, [sp, #0x54]
    mov r0, #0x60
    str r0, [sp, #0x58]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x88
    str r0, [sp, #0x0]
    add r0, sp, #0x54
    str r0, [sp, #0x4]
    add r1, #0x88
    ldr r1, [r1, #0x0]
    ldr r2, .L_0214e918
    mov r0, r4
    mov r3, #0x2
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x48]
    mov r7, #0x0
.L_0214e5b4:
    ldr r1, .L_0214e91c
    mov r0, r4
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    bl func_ov012_021b6214
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    add r2, r7, #0x4
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    lsl r0, r7, #0x2
    add r0, r5, r0
    str r6, [r0, #0x4c]
    mov r0, #0x1c
    ldr r1, .L_0214e920
    mul r0, r7
    add r1, r1, r0
    str r1, [sp, #0x8]
    ldr r1, [r1, #0x4]
    add r2, sp, #0x30
    lsl r1, r1, #0xc
    str r1, [sp, #0x30]
    ldr r1, .L_0214e920
    ldr r0, [r1, r0]
    add r1, sp, #0x34
    lsl r0, r0, #0xc
    str r0, [sp, #0x34]
    mov r0, r6
    blx func_ov007_0214f218
    ldr r0, [sp, #0x8]
    ldr r2, .L_0214e924
    ldrb r0, [r0, #0x18]
    lsl r0, r0, #0x3
    str r0, [sp, #0xc]
    ldr r1, [sp, #0xc]
    mov r0, #0x0
    add r1, r2, r1
    ldr r2, .L_0214e928
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r6
    blx func_02020e98
    ldr r1, .L_0214e924
    ldr r0, [sp, #0xc]
    add r0, r1, r0
    blx func_ov007_0214f474
    str r0, [sp, #0x10]
    ldr r1, .L_0214e924
    ldr r0, [sp, #0xc]
    add r0, r1, r0
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r6, #0x4]
    ldr r2, [sp, #0x10]
    bl func_ov012_021b5900
    ldr r1, [r6, #0x4]
    ldr r0, .L_0214e92c
    add r1, #0xdc
    str r0, [r1, #0x0]
    ldr r1, [r6, #0x4]
    ldr r0, .L_0214e930
    add r1, #0xe0
    str r0, [r1, #0x0]
    ldr r0, [r6, #0x4]
    ldr r2, .L_0214e934
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r6, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    ldr r1, [r6, #0x4]
    ldr r0, .L_0214e938
    add r1, #0xec
    str r0, [r1, #0x0]
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    add r1, #0xac
    strb r0, [r1, #0x0]
    mov r1, #0x49
    ldr r2, [r6, #0x4]
    lsl r1, r1, #0x2
    ldr r1, [r2, r1]
    mov r0, r5
    mov r2, #0x0
    bl func_ov007_0214f9dc
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_0214e5b4
    mov r0, r5
    mov r1, #0x0
    add r0, #0xa9
    strb r1, [r0, #0x0]
    ldr r1, [r5, #0x28]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0214e93c
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x22
    str r2, [r1, r0]
    mov r0, #0xa
    lsl r0, r0, #0xc
    str r0, [sp, #0xb4]
    mov r0, r4
    add r1, sp, #0xb4
    blx func_ov007_0214f27c
    str r4, [r5, #0x30]
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0214e940
    add r0, sp, #0xc0
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_0214e944
    add r0, sp, #0xb8
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0xac]
    mov r0, #0x7
    lsl r0, r0, #0x12
    str r0, [sp, #0xb0]
    mov r0, r4
    add r1, sp, #0xb0
    add r2, sp, #0xac
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xc0]
    ldr r3, [sp, #0xc4]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xb8]
    ldr r3, [sp, #0xbc]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0xa4]
    str r0, [sp, #0xa8]
    mov r0, r4
    add r1, sp, #0xa8
    add r2, sp, #0xa4
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xc0]
    ldr r3, [sp, #0xc4]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xc0]
    ldr r2, .L_0214e948
    ldr r3, [sp, #0xc4]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x9c]
    str r0, [sp, #0xa0]
    mov r0, r4
    add r1, sp, #0xa0
    add r2, sp, #0x9c
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xc0]
    ldr r3, [sp, #0xc4]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xb8]
    ldr r3, [sp, #0xbc]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_02023c70
    ldr r1, .L_0214e91c
    mov r0, r4
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x7
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x58]
    ldr r6, [r5, #0x14]
    cmp r6, #0x0
    beq .L_0214e7f8
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    mov r1, r6
    blx func_ov007_0214f48c
.L_0214e7f8:
    ldr r1, [r5, #0x30]
    mov r0, r5
    blx func_ov007_0215145c
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0214e94c
    ldr r1, [r6, #0x4]
    mov r0, r2
    add r0, #0x21
    str r2, [r1, r0]
    mov r0, #0x2
    lsl r0, r0, #0x10
    str r0, [sp, #0x90]
    mov r0, #0x17
    lsl r0, r0, #0xe
    str r0, [sp, #0x8c]
    mov r0, r6
    add r1, sp, #0x8c
    add r2, sp, #0x90
    blx func_ov007_0214f218
    ldr r0, [r6, #0x4]
    ldr r1, .L_0214e950
    add r0, #0xdc
    str r1, [r0, #0x0]
    ldr r0, [r6, #0x4]
    ldr r1, .L_0214e954
    add r0, #0xe0
    str r1, [r0, #0x0]
    str r6, [r5, #0x34]
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    bl func_ov012_021b7744
    mov r0, #0x48
    str r0, [sp, #0x84]
    mov r0, #0x10
    str r0, [sp, #0x88]
    mov r7, #0x0
.L_0214e852:
    add r4, r7, #0x4
    cmp r4, #0x8
    bne .L_0214e864
    mov r0, #0xac
    ldrsb r0, [r5, r0]
    cmp r0, #0x0
    beq .L_0214e898
    mov r4, #0x9
    b .L_0214e898
.L_0214e864:
    cmp r4, #0x4
    bne .L_0214e876
    mov r0, r5
    add r0, #0xab
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0214e898
    mov r4, #0x10
    b .L_0214e898
.L_0214e876:
    cmp r4, #0x5
    bne .L_0214e888
    mov r0, r5
    add r0, #0xab
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0214e898
    mov r4, #0x11
    b .L_0214e898
.L_0214e888:
    cmp r4, #0x7
    bne .L_0214e898
    mov r0, r5
    add r0, #0xab
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0214e898
    mov r4, #0x12
.L_0214e898:
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x84
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r6
    lsl r2, r2, #0x10
    mov r3, r4
    blx func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x1
    mov r3, #0x7e
    blx func_ov007_021510f0
    mov r1, #0x0
    str r1, [sp, #0x98]
    mov r1, #0x3a
    lsl r1, r1, #0xc
    str r1, [sp, #0x94]
    str r0, [sp, #0x14]
    add r1, sp, #0x94
    add r2, sp, #0x98
    blx func_ov007_0214f218
    ldr r1, [sp, #0x14]
    mov r0, r4
    blx func_ov007_0214f48c
    mov r2, r7
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    add r2, #0x8
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    lsl r0, r7, #0x2
    add r0, r5, r0
    str r4, [r0, #0x5c]
    ldr r1, .L_0214e958
    ldr r2, .L_0214e928
    b .L_0214e95c
    mov r8, r8
.L_0214e918: .word 0x818000
.L_0214e91c: .word data_ov012_021d5154
.L_0214e920: .word data_ov007_02169564
.L_0214e924: .word data_ov007_02169544
.L_0214e928: .word data_02093c8c
.L_0214e92c: .word func_ov007_0214fa3c
.L_0214e930: .word func_ov007_0214fd00
.L_0214e934: .word func_ov007_0214fd04
.L_0214e938: .word func_ov007_02150344
.L_0214e93c: .word 0x102
.L_0214e940: .word data_ov007_02169730
.L_0214e944: .word data_ov007_0216973c
.L_0214e948: .word 0x494c
.L_0214e94c: .word 0x103
.L_0214e950: .word func_ov007_0215026c
.L_0214e954: .word func_ov007_02150304
.L_0214e958: .word data_ov007_0216955c
.L_0214e95c:
    mov r0, #0x0
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, .L_0214ecf0
    blx func_ov007_0214f474
    str r0, [sp, #0x18]
    ldr r0, .L_0214ecf0
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r2, [sp, #0x18]
    bl func_ov012_021b5900
    mov r0, r4
    add r1, sp, #0x84
    mov r2, r7
    bl func_ov007_0214f4c4
    ldr r1, [r4, #0x4]
    ldr r0, .L_0214ecf4
    add r1, #0xdc
    str r0, [r1, #0x0]
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214ecf8
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    ldr r1, [r4, #0x4]
    ldr r0, .L_0214ecfc
    add r1, #0xec
    str r0, [r1, #0x0]
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, #0xac
    strb r0, [r1, #0x0]
    ldr r0, [sp, #0x88]
    add r7, r7, #0x1
    add r0, #0x1b
    str r0, [sp, #0x88]
    cmp r7, #0x5
    bge .L_0214e9c6
    b .L_0214e852
.L_0214e9c6:
    mov r0, r5
    mov r1, #0x8
    bl func_ov007_02150448
    ldr r1, [r5, #0x30]
    mov r0, r5
    blx func_ov007_0215145c
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r2, #0x41
    lsl r2, r2, #0x2
    mov r0, r2
    ldr r1, [r7, #0x4]
    add r0, #0x20
    str r2, [r1, r0]
    mov r0, #0x2
    lsl r0, r0, #0x10
    str r0, [sp, #0x78]
    mov r0, #0x17
    lsl r0, r0, #0xe
    str r0, [sp, #0x74]
    mov r0, r7
    add r1, sp, #0x74
    add r2, sp, #0x78
    blx func_ov007_0214f218
    ldr r0, [r7, #0x4]
    ldr r1, .L_0214ed00
    add r0, #0xdc
    str r1, [r0, #0x0]
    ldr r0, [r7, #0x4]
    ldr r1, .L_0214ed04
    add r0, #0xe0
    str r1, [r0, #0x0]
    str r7, [r5, #0x38]
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    bl func_ov012_021b7744
    mov r0, #0x48
    str r0, [sp, #0x6c]
    mov r0, #0x2b
    str r0, [sp, #0x70]
    mov r6, #0x0
.L_0214ea2a:
    mov r4, r6
    add r4, #0xa
    cmp r4, #0xa
    bne .L_0214ea3e
    mov r0, r5
    add r0, #0xab
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0214ea3e
    mov r4, #0x13
.L_0214ea3e:
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x6c
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r7
    lsl r2, r2, #0x10
    mov r3, r4
    blx func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, .L_0214ed08
    ldrsb r0, [r0, r6]
    cmp r0, #0x0
    beq .L_0214eaac
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x2
    mov r3, #0x7e
    blx func_ov007_021510f0
    mov r1, #0x0
    str r1, [sp, #0x80]
    mov r1, #0x3a
    lsl r1, r1, #0xc
    str r1, [sp, #0x7c]
    str r0, [sp, #0x1c]
    add r1, sp, #0x7c
    add r2, sp, #0x80
    blx func_ov007_0214f218
    ldr r1, [sp, #0x1c]
    mov r0, r4
    blx func_ov007_0214f48c
.L_0214eaac:
    mov r2, r6
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    add r2, #0xd
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    lsl r0, r6, #0x2
    add r0, r5, r0
    str r4, [r0, #0x70]
    ldr r1, .L_0214ecf0
    ldr r2, .L_0214ed0c
    mov r0, #0x0
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, .L_0214ecf0
    blx func_ov007_0214f474
    str r0, [sp, #0x20]
    ldr r0, .L_0214ecf0
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r2, [sp, #0x20]
    bl func_ov012_021b5900
    mov r0, r4
    add r1, sp, #0x6c
    add r2, r6, #0x1
    bl func_ov007_0214f4c4
    ldr r1, [r4, #0x4]
    ldr r0, .L_0214ecf4
    add r1, #0xdc
    str r0, [r1, #0x0]
    ldr r0, [r4, #0x4]
    ldr r2, .L_0214ecf8
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    ldr r1, [r4, #0x4]
    ldr r0, .L_0214ed10
    add r1, #0xec
    str r0, [r1, #0x0]
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, #0xac
    strb r0, [r1, #0x0]
    ldr r0, [sp, #0x70]
    add r6, r6, #0x1
    add r0, #0x1b
    str r0, [sp, #0x70]
    cmp r6, #0x3
    bge .L_0214eb2c
    b .L_0214ea2a
.L_0214eb2c:
    mov r0, r5
    mov r1, #0x8
    bl func_ov007_02150480
    mov r4, #0x0
.L_0214eb36:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r7, [r0, #0x4c]
    mov r0, #0x1c
    mov r1, r4
    mul r1, r0
    ldr r0, .L_0214ed14
    add r6, r0, r1
    ldrb r1, [r6, #0x19]
    mov r0, r7
    lsl r1, r1, #0x2
    add r1, r5, r1
    ldr r1, [r1, #0x3c]
    blx func_ov007_0214f70c
    ldrb r1, [r6, #0x1a]
    mov r0, r7
    lsl r1, r1, #0x2
    add r1, r5, r1
    ldr r1, [r1, #0x3c]
    blx func_ov007_0214f748
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0214eb36
    mov r4, #0x0
    mov r7, #0x5
.L_0214eb6c:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r6, [r0, #0x5c]
    add r0, r4, #0x4
    mov r1, r7
    blx func_0200d12c
    lsl r1, r1, #0x2
    add r1, r5, r1
    ldr r1, [r1, #0x5c]
    mov r0, r6
    blx func_ov007_0214f70c
    add r0, r4, #0x6
    mov r1, #0x5
    blx func_0200d12c
    lsl r1, r1, #0x2
    add r1, r5, r1
    ldr r1, [r1, #0x5c]
    mov r0, r6
    blx func_ov007_0214f748
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_0214eb6c
    mov r4, #0x0
    mov r7, #0x3
.L_0214eba4:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r6, [r0, #0x70]
    add r0, r4, #0x2
    mov r1, r7
    blx func_0200d12c
    lsl r1, r1, #0x2
    add r1, r5, r1
    ldr r1, [r1, #0x70]
    mov r0, r6
    blx func_ov007_0214f70c
    add r0, r4, #0x4
    mov r1, #0x3
    blx func_0200d12c
    lsl r1, r1, #0x2
    add r1, r5, r1
    ldr r1, [r1, #0x70]
    mov r0, r6
    blx func_ov007_0214f748
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0214eba4
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x3
    mov r3, #0x70
    blx func_ov007_021510f0
    str r0, [r5, #0x7c]
    mov r0, #0x6
    lsl r0, r0, #0x12
    str r0, [sp, #0x28]
    mov r0, #0x0
    str r0, [sp, #0x24]
    ldr r0, [r5, #0x7c]
    add r1, sp, #0x24
    add r2, sp, #0x28
    blx func_ov007_0214f218
    mov r2, #0x1
    mov r0, #0x9
    mov r1, #0x0
    subs r3, r2, #0x2
    bl func_ov012_021bcf1c
    mov r1, r5
    add r1, #0x80
    str r0, [r1, #0x0]
    mov r0, r5
    add r0, #0x9c
    ldr r0, [r0, #0x0]
    cmp r0, #0x1
    bne .L_0214ec24
    mov r0, r5
    add r0, #0x94
    b .L_0214ec28
.L_0214ec24:
    mov r0, r5
    add r0, #0x98
.L_0214ec28:
    ldr r1, [r0, #0x0]
    mov r0, r5
    bl func_ov007_0214f784
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    blx func_ov012_021ba49c
    mov r1, r5
    add r1, #0x84
    str r0, [r1, #0x0]
    mov r0, r5
    add r0, #0x8c
    ldr r0, [r0, #0x0]
    cmp r0, #0x8
    bne .L_0214ec4e
    mov r0, #0x0
    b .L_0214ec50
.L_0214ec4e:
    mov r0, #0x2
.L_0214ec50:
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    mov r1, #0x1
    blx func_02073ebc
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x8]
    ldr r1, .L_0214ed18
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0xcc]
    ldr r0, [r5, #0x8]
    add r1, sp, #0xcc
    blx func_ov007_0214ed20
    blx func_02026f94
    str r0, [r5, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0xc]
    ldr r1, .L_0214ed1c
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x86
    lsl r0, r0, #0xc
    str r0, [sp, #0xc8]
    ldr r0, [r5, #0xc]
    add r1, sp, #0xc8
    blx func_ov007_0214ed20
    ldr r0, [r5, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x30]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x2c]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    add sp, #0xd0
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_0214ecf0: .word data_ov007_0216955c
.L_0214ecf4: .word func_ov007_0214fa3c
.L_0214ecf8: .word func_ov007_0215022c
.L_0214ecfc: .word func_ov007_021503b0
.L_0214ed00: .word func_ov007_0215026c
.L_0214ed04: .word func_ov007_02150304
.L_0214ed08: .word data_ov007_02168a1c
.L_0214ed0c: .word data_02093c8c
.L_0214ed10: .word func_ov007_021503c0
.L_0214ed14: .word data_ov007_02169564
.L_0214ed18: .word func_ov007_0214ed54
.L_0214ed1c: .word func_ov007_0214ef7c
    thumb_func_end func_ov007_0214e150

    .global func_ov007_0214ed20
    arm_func_start func_ov007_0214ed20
func_ov007_0214ed20: ; 0x0214ed20
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0214ed20

    .global func_ov007_0214ed44
    arm_func_start func_ov007_0214ed44
func_ov007_0214ed44: ; 0x0214ed44
    ldr r1, [r1, #0x0]
    mov r1, r1, asr #0x4
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov007_0214ed44

    .global func_ov007_0214ed54
    thumb_func_start func_ov007_0214ed54
func_ov007_0214ed54: ; 0x0214ed54
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_0214ed6e
    bl func_ov012_021b65cc
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_020282f4
.L_0214ed6e:
    pop {r4, pc}
    thumb_func_end func_ov007_0214ed54

    .global func_ov007_0214ed70
    arm_func_start func_ov007_0214ed70
func_ov007_0214ed70: ; 0x0214ed70
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0214eef4
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    blx r0
    ldr r0, .L_0214eef4
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214eef4
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0214eef4
    ldr r0, [r0, #0x0]
    blx r0
    ldrb r0, [r4, #0xae]
    mov r1, #0x1
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x3
    and r0, r0, #0xff
    bl func_02073ebc
    ldr r5, .L_0214eef4
    b .L_0214edd8
.L_0214edd0:
    ldr r0, [r5, #0x0]
    blx r0
.L_0214edd8:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0214edd0
    bl func_020735e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, .L_0214eef8
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x84]
    cmp r0, #0x0
    beq .L_0214ee14
    bl func_ov012_021bab64
.L_0214ee14:
    ldr r0, [r4, #0x80]
    cmp r0, #0x0
    beq .L_0214ee24
    blx func_ov012_021bd500
.L_0214ee24:
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    beq .L_0214ee34
    bl func_0206ae98
.L_0214ee34:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0214ee4c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214ee4c:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214ee64
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214ee64:
    ldr r0, [r4, #0x7c]
    cmp r0, #0x0
    beq .L_0214ee7c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214ee7c:
    mov r5, #0x0
.L_0214ee80:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_0214ee9c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214ee9c:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0214ee80
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_0214eefc
    ldr r2, .L_0214ef00
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214ef04
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0214eef4: .word data_020a0e18
.L_0214eef8: .word data_ov012_021d5154
.L_0214eefc: .word data_02093c04
.L_0214ef00: .word data_020a16c0
.L_0214ef04: .word data_020a0e80
    arm_func_end func_ov007_0214ed70

    .global func_ov007_0214ef08
    arm_func_start func_ov007_0214ef08
func_ov007_0214ef08: ; 0x0214ef08
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    ldr r5, [r0, #0x10]
    mov r3, r2
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0x84]
    mov r1, #0x50
    bl func_ov012_021bac28
    ldr r4, .L_0214ef78
.L_0214ef44:
    ldr r0, [r5, #0x84]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    bne .L_0214ef60
    ldr r0, [r4, #0x0]
    blx r0
    b .L_0214ef44
.L_0214ef60:
    mov r0, r5
    blx func_ov007_0214fda4
    ldr r0, [r6, #0x4]
    bl func_020282f4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0214ef78: .word data_020a0e18
    arm_func_end func_ov007_0214ef08

    .global func_ov007_0214ef7c
    arm_func_start func_ov007_0214ef7c
func_ov007_0214ef7c: ; 0x0214ef7c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r6, #0x0
    ldr r4, [r0, #0x10]
    mov r1, r6
    ldr r0, [r4, #0x2c]
    bl func_ov007_0214f1bc
    cmp r0, #0x0
    movne r6, #0x1
    cmp r6, #0x0
    bne .L_0214f028
    ldrsb r0, [r4, #0xaa]
    cmp r0, #0x0
    bne .L_0214efcc
    ldr r0, [r4, #0x10]
    bl func_ov007_0214f1f0
    cmp r0, #0x0
    beq .L_0214f028
.L_0214efcc:
    ldr r0, [r4, #0x30]
    mov r1, #0x2
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x2c]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r6, #0x1
.L_0214f028:
    cmp r6, #0x0
    beq .L_0214f1b0
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    bne .L_0214f0d0
    mov r0, r4
    blx func_ov007_0214fd84
    bl func_0208c538
    bl func_ov010_02199e58
    cmp r0, #0x0
    bne .L_0214f098
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x84]
    mov r3, r2
    mov r1, #0x25
    bl func_ov012_021bac28
    ldr r6, .L_0214f1b8
.L_0214f07c:
    ldr r0, [r4, #0x84]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    bne .L_0214f098
    ldr r0, [r6, #0x0]
    blx r0
    b .L_0214f07c
.L_0214f098:
    blx func_02070fd4
    bl func_ov010_0219ba50
    cmp r0, #0x0
    beq .L_0214f0b4
    ldr r0, [r4, #0x84]
    mov r1, #0x44
    bl func_ov007_021516f0
.L_0214f0b4:
    blx func_02071f08
    mov r6, r0
    blx func_02070fd4
    add r1, r6, #0x40
    bl func_ov010_0219bacc
    mov r0, r4
    blx func_ov007_0214fda4
.L_0214f0d0:
    ldr r0, [r4, #0x9c]
    mov r1, #0x1
    cmp r0, #0x1
    bne .L_0214f108
    ldr r0, [r4, #0x94]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x3c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    b .L_0214f19c
.L_0214f108:
    ldr r0, [r4, #0x98]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x3c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x9c]
    mov r1, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x28]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x9c]
    mov r1, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x40]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x98]
    mov r1, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x3c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x9c]
    mov r1, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x28]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
.L_0214f19c:
    mov r0, #0x0
    strb r0, [r4, #0xaa]
    strb r0, [r4, #0xad]
    ldr r0, [r5, #0x4]
    bl func_020282f4
.L_0214f1b0:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0214f1b8: .word data_020a0e18
    arm_func_end func_ov007_0214ef7c

    .global func_ov007_0214f1bc
    arm_func_start func_ov007_0214f1bc
func_ov007_0214f1bc: ; 0x0214f1bc
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0214f1bc

    .global func_ov007_0214f1f0
    arm_func_start func_ov007_0214f1f0
func_ov007_0214f1f0: ; 0x0214f1f0
    ldr r2, [r0, #0x0]
    ldr r0, [r2, #0x74]
    ldr r1, [r2, #0x70]
    add r0, r2, r0, lsl #0x2
    add r1, r2, r1, lsl #0x2
    ldr r0, [r0, #0x18]
    ldr r1, [r1, #0x18]
    mvn r0, r0
    and r0, r1, r0
    bx lr
    arm_func_end func_ov007_0214f1f0

    .global func_ov007_0214f218
    arm_func_start func_ov007_0214f218
func_ov007_0214f218: ; 0x0214f218
    ldr r0, [r0, #0x4]
    ldr r3, [r1, #0x0]
    ldr r2, [r2, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0214f23c
    str r3, [r0, #0xc]
    mov r1, #0x1
    str r2, [r0, #0x10]
    bx ip
.L_0214f23c: .word func_ov007_0214f240
    arm_func_end func_ov007_0214f218

    .global func_ov007_0214f240
    arm_func_start func_ov007_0214f240
func_ov007_0214f240: ; 0x0214f240
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r2, [r5, #0x24]
    mov r4, r1
    orr r1, r2, r4
    cmp r2, r1
    beq .L_0214f268
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0214f268:
    ldrb r0, [r5, #0x24]
    orr r0, r0, r4
    orr r0, r0, #0x30
    strb r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov007_0214f240

    .global func_ov007_0214f27c
    arm_func_start func_ov007_0214f27c
func_ov007_0214f27c: ; 0x0214f27c
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
    arm_func_end func_ov007_0214f27c

    .global func_ov007_0214f2a4
    arm_func_start func_ov007_0214f2a4
func_ov007_0214f2a4: ; 0x0214f2a4
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
    arm_func_end func_ov007_0214f2a4

    .global func_ov007_0214f2f4
    arm_func_start func_ov007_0214f2f4
func_ov007_0214f2f4: ; 0x0214f2f4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r4, [r0, #0x4]
    ldr r1, .L_0214f334
    ldr r2, .L_0214f338
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214f32c
    ldr r3, .L_0214f33c
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_0214f32c:
    bl func_ov007_0214f340
    ldmia sp!, {r3, r4, r5, pc}
.L_0214f334: .word data_ov007_02169654
.L_0214f338: .word data_ov007_02169634
.L_0214f33c: .word func_ov007_0214f368
    arm_func_end func_ov007_0214f2f4

    .global func_ov007_0214f340
    arm_func_start func_ov007_0214f340
func_ov007_0214f340: ; 0x0214f340
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214f360
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214f360:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0214f340

    .global func_ov007_0214f368
    arm_func_start func_ov007_0214f368
func_ov007_0214f368: ; 0x0214f368
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x44
    ldr r1, .L_0214f3b0
    ldr r2, .L_0214f3b4
    add r3, r0, #0xc1
    bl func_0201a21c
    movs r4, r0
    beq .L_0214f3a8
    mov r1, r5
    mov r2, #0x0
    bl func_02014604
    ldr r1, .L_0214f3b8
    mov r0, #0x1
    str r1, [r4, #0x0]
    strb r0, [r4, #0x40]
.L_0214f3a8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0214f3b0: .word data_ov007_02169698
.L_0214f3b4: .word data_ov007_02169664
.L_0214f3b8: .word data_ov012_021d2a24
    arm_func_end func_ov007_0214f368

    .global func_ov007_0214f3bc
    arm_func_start func_ov007_0214f3bc
func_ov007_0214f3bc: ; 0x0214f3bc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_0214f434
    ldr r2, .L_0214f438
    ldr r3, .L_0214f43c
    mov r0, #0x70
    bl func_0201a21c
    movs r4, r0
    beq .L_0214f410
    mov r1, r7
    mov r2, r5
    blx func_ov012_021b054c
    ldr r2, .L_0214f440
    mov r1, r6
    add r0, r4, #0x68
    str r2, [r4, #0x0]
    bl func_ov007_0214f448
    ldr r0, .L_0214f444
    str r0, [r4, #0x0]
.L_0214f410:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214f42c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214f42c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214f434: .word data_ov007_02169674
.L_0214f438: .word data_ov007_0216963c
.L_0214f43c: .word 0x1b2
.L_0214f440: .word data_ov007_021695c0
.L_0214f444: .word data_ov012_021d1c58
    arm_func_end func_ov007_0214f3bc

    .global func_ov007_0214f448
    arm_func_start func_ov007_0214f448
func_ov007_0214f448: ; 0x0214f448
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov007_0214f448

    .global func_ov007_0214f45c
    arm_func_start func_ov007_0214f45c
func_ov007_0214f45c: ; 0x0214f45c
    ldrsh r1, [r0, #0x0]
    ldrsh r0, [r0, #0x4]
    cmp r0, r1
    subgt r0, r0, r1
    suble r0, r1, r0
    bx lr
    arm_func_end func_ov007_0214f45c

    .global func_ov007_0214f474
    arm_func_start func_ov007_0214f474
func_ov007_0214f474: ; 0x0214f474
    ldrsh r1, [r0, #0x2]
    ldrsh r0, [r0, #0x6]
    cmp r0, r1
    subgt r0, r0, r1
    suble r0, r1, r0
    bx lr
    arm_func_end func_ov007_0214f474

    .global func_ov007_0214f48c
    arm_func_start func_ov007_0214f48c
func_ov007_0214f48c: ; 0x0214f48c
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
    arm_func_end func_ov007_0214f48c

    .global func_ov007_0214f4c4
    thumb_func_start func_ov007_0214f4c4
func_ov007_0214f4c4: ; 0x0214f4c4
    push {r4, r5, r6, lr}
    sub sp, sp, #0x40
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    mov r6, r2
    blx func_02023940
    ldr r2, .L_0214f700
    add r0, sp, #0x38
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r2, .L_0214f704
    add r0, sp, #0x30
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    add r1, sp, #0x2c
    lsl r0, r0, #0xc
    str r0, [sp, #0x28]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x28
    add r0, #0xa4
    lsl r0, r0, #0xc
    str r0, [sp, #0x2c]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    lsl r2, r6, #0x1
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    add r2, r2, #0x4
    blx func_02023c60
    ldr r0, [r4, #0x4]
    add r1, sp, #0x24
    lsl r0, r0, #0xc
    str r0, [sp, #0x20]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x20
    lsl r0, r0, #0xc
    str r0, [sp, #0x24]
    mov r0, r5
    blx func_ov007_0214f218
    add r3, r6, #0x1
    mov r2, #0x5
    sub r2, r2, r3
    lsl r3, r2, #0x1
    mov r2, #0x14
    sub r2, r2, r3
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r2, .L_0214f708
    ldr r3, [sp, #0x3c]
    blx func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x5
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x1c
    lsl r0, r0, #0xc
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x18
    lsl r0, r0, #0xc
    str r0, [sp, #0x1c]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x1
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x1
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x6
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x14
    lsl r0, r0, #0xc
    str r0, [sp, #0x10]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x10
    lsl r0, r0, #0xc
    str r0, [sp, #0x14]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    add r1, sp, #0xc
    lsl r0, r0, #0xc
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x8
    add r0, #0xa4
    lsl r0, r0, #0xc
    str r0, [sp, #0xc]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r2, .L_0214f708
    ldr r3, [sp, #0x3c]
    blx func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x7
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x4
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x0
    add r0, #0xa4
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x1
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x1
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x8
    blx func_02023c70
    add sp, #0x40
    pop {r4, r5, r6, pc}
.L_0214f700: .word data_ov007_02169730
.L_0214f704: .word data_ov007_0216973c
.L_0214f708: .word 0x494c
    thumb_func_end func_ov007_0214f4c4

    .global func_ov007_0214f70c
    arm_func_start func_ov007_0214f70c
func_ov007_0214f70c: ; 0x0214f70c
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214f730
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_0214f730:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x1
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0214f70c

    .global func_ov007_0214f748
    arm_func_start func_ov007_0214f748
func_ov007_0214f748: ; 0x0214f748
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214f76c
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_0214f76c:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x2
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0214f748

    .global func_ov007_0214f784
    thumb_func_start func_ov007_0214f784
func_ov007_0214f784: ; 0x0214f784
    push {r3, lr}
    mov r2, #0x92
    mov r3, #0x0
    cmp r1, #0x4
    blo .L_0214f794
    cmp r1, #0x7
    bhs .L_0214f794
    mov r3, #0x1
.L_0214f794:
    cmp r3, #0x0
    beq .L_0214f7a2
    subs r1, r1, #0x4
    lsl r2, r1, #0x2
    ldr r1, .L_0214f7d4
    ldr r2, [r1, r2]
    b .L_0214f7c2
.L_0214f7a2:
    cmp r1, #0x8
    blo .L_0214f7c2
    cmp r1, #0x10
    bhs .L_0214f7c2
    mov r2, r1
    sub r2, #0x8
    lsl r3, r2, #0x2
    ldr r2, .L_0214f7d8
    cmp r1, #0xc
    ldr r2, [r2, r3]
    bne .L_0214f7c2
    mov r1, #0xac
    ldrsb r1, [r0, r1]
    cmp r1, #0x0
    beq .L_0214f7c2
    mov r2, #0x4
.L_0214f7c2:
    cmp r2, #0x92
    beq .L_0214f7d2
    add r0, #0x80
    ldr r0, [r0, #0x0]
    mov r1, r2
    mov r2, #0x0
    bl func_ov012_021bd730
.L_0214f7d2:
    pop {r3, pc}
.L_0214f7d4: .word data_ov007_02168a20
.L_0214f7d8: .word data_ov007_02168a3c
    thumb_func_end func_ov007_0214f784

    .global func_ov007_0214f7dc
    thumb_func_start func_ov007_0214f7dc
func_ov007_0214f7dc: ; 0x0214f7dc
    push {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov012_021b65bc
    ldr r0, .L_0214f80c
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    mov r0, #0x43
    lsl r0, r0, #0x4
    strb r2, [r1, r0]
    mov r0, r5
    add r0, #0xae
    strb r4, [r0, #0x0]
    ldr r0, [r5, #0x8]
    ldr r1, .L_0214f810
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
    pop {r3, r4, r5, pc}
.L_0214f80c: .word data_020a0f64
.L_0214f810: .word func_ov007_0214ed70
    thumb_func_end func_ov007_0214f7dc

    .global func_ov007_0214f814
    thumb_func_start func_ov007_0214f814
func_ov007_0214f814: ; 0x0214f814
    push {r4, lr}
    mov r4, r0
    bl func_ov007_0214fd84
    ldr r0, [r4, #0x8]
    ldr r1, .L_0214f830
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
    pop {r4, pc}
.L_0214f830: .word func_ov007_0214ef08
    thumb_func_end func_ov007_0214f814

    .global func_ov007_0214f834
    thumb_func_start func_ov007_0214f834
func_ov007_0214f834: ; 0x0214f834
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0214f86c
    cmp r0, r1
    bne .L_0214f86a
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0214f86a
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0214f7dc
.L_0214f86a:
    pop {r3, r4, r5, pc}
.L_0214f86c: .word 0x80011001
    thumb_func_end func_ov007_0214f834

    .global func_ov007_0214f870
    arm_func_start func_ov007_0214f870
func_ov007_0214f870: ; 0x0214f870
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214f890
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214f890:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0214f870

    .global func_ov007_0214f898
    arm_func_start func_ov007_0214f898
func_ov007_0214f898: ; 0x0214f898
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov007_0214f340
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0214f898

    .global func_ov007_0214f8c0
    thumb_func_start func_ov007_0214f8c0
func_ov007_0214f8c0: ; 0x0214f8c0
    push {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0xe
    mov r3, #0x7f
    blx func_ov007_021510f0
    mov r1, r0
    mov r0, r4
    blx func_ov007_0214f48c
    mov r0, #0x7f
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, r4
    add r1, sp, #0x0
    blx func_ov007_0214f27c
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214f904
    ldr r0, [r0, #0x50]
    str r1, [r0, #0x10]
    mov r1, #0x1
    blx func_ov007_0214f240
    add sp, #0x4
    pop {r3, r4, pc}
    mov r8, r8
.L_0214f904: .word 0xfff40000
    thumb_func_end func_ov007_0214f8c0

    .global func_ov007_0214f908
    thumb_func_start func_ov007_0214f908
func_ov007_0214f908: ; 0x0214f908
    push {r3, r4, r5, r6, r7, lr}
    str r1, [sp, #0x0]
    ldr r1, .L_0214f964
    blx func_ov007_0214f898
    mov r6, r0
    mov r5, #0x0
.L_0214f916:
    ldr r0, [sp, #0x0]
    lsl r4, r5, #0x3
    blx func_ov007_0214f45c
    mov r7, r0
    ldr r0, .L_0214f968
    add r0, r0, r4
    blx func_ov007_0214f45c
    cmp r7, r0
    bne .L_0214f95c
    ldr r0, [sp, #0x0]
    blx func_ov007_0214f474
    mov r7, r0
    ldr r0, .L_0214f968
    add r0, r0, r4
    blx func_ov007_0214f474
    cmp r7, r0
    bne .L_0214f95c
    ldr r0, .L_0214f96c
    lsl r1, r5, #0x2
    ldr r1, [r0, r1]
    cmp r1, #0x0
    beq .L_0214f95c
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214f95c:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0214f916
    pop {r3, r4, r5, r6, r7, pc}
.L_0214f964: .word 0x31305053
.L_0214f968: .word data_ov007_02169544
.L_0214f96c: .word data_ov007_02168a2c
    thumb_func_end func_ov007_0214f908

    .global func_ov007_0214f970
    thumb_func_start func_ov007_0214f970
func_ov007_0214f970: ; 0x0214f970
    push {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r5, [r6, #0x4]
    ldr r1, .L_0214f9d8
    add r5, #0xa0
    blx func_ov007_0214f898
    mov r4, r0
    mov r0, r5
    blx func_ov007_0214f45c
    cmp r0, #0x0
    beq .L_0214f996
    mov r0, r5
    blx func_ov007_0214f474
    cmp r0, #0x0
    bne .L_0214f9a4
.L_0214f996:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_0214f9d2
.L_0214f9a4:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x2
    ldrsh r0, [r5, r0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, #0x0
    ldrsh r0, [r5, r0]
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r6
    blx func_ov007_0214f218
    mov r0, r6
    mov r1, r5
    bl func_ov007_0214f908
.L_0214f9d2:
    add sp, #0x8
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0214f9d8: .word 0x31305053
    thumb_func_end func_ov007_0214f970

    .global func_ov007_0214f9dc
    thumb_func_start func_ov007_0214f9dc
func_ov007_0214f9dc: ; 0x0214f9dc
    push {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r2
    cmp r5, #0x4
    blo .L_0214fa14
    cmp r5, #0x7
    bhs .L_0214fa14
    ldr r0, [r0, #0x48]
    ldr r1, .L_0214fa18
    blx func_ov007_0214f898
    mov r4, r0
    ldr r1, .L_0214fa1c
    cmp r6, #0x0
    beq .L_0214f9fe
    subs r0, r5, #0x4
    b .L_0214fa00
.L_0214f9fe:
    mov r0, #0x2
.L_0214fa00:
    orr r1, r0
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214fa14:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0214fa18: .word 0x31305053
.L_0214fa1c: .word 0x818000
    thumb_func_end func_ov007_0214f9dc

    .global func_ov007_0214fa20
    thumb_func_start func_ov007_0214fa20
func_ov007_0214fa20: ; 0x0214fa20
    cmp r0, #0x8
    blo .L_0214fa2c
    cmp r0, #0xd
    bhs .L_0214fa2c
    subs r0, r0, #0x7
    bx lr
.L_0214fa2c:
    cmp r0, #0xd
    blo .L_0214fa38
    cmp r0, #0x10
    bhs .L_0214fa38
    subs r0, r0, #0x7
    bx lr
.L_0214fa38:
    mov r0, #0x0
    bx lr
    thumb_func_end func_ov007_0214fa20

    .global func_ov007_0214fa3c
    thumb_func_start func_ov007_0214fa3c
func_ov007_0214fa3c: ; 0x0214fa3c
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r1, [r7, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r5, [r1, #0x10]
    cmp r0, #0x4
    blo .L_0214fa54
    cmp r0, #0x7
    blo .L_0214fa56
.L_0214fa54:
    b .L_0214fc6e
.L_0214fa56:
    mov r1, r5
    add r1, #0x94
    mov r4, #0x0
    mvn r4, r4
    ldr r1, [r1, #0x0]
    mov r6, r4
    cmp r1, r0
    beq .L_0214fa90
    cmp r1, #0x4
    blo .L_0214fa88
    cmp r1, #0x7
    bhs .L_0214fa88
    mov r0, r5
    mov r2, #0x0
    bl func_ov007_0214f9dc
    mov r0, r5
    add r0, #0x94
    ldr r0, [r0, #0x0]
    cmp r0, #0x4
    bne .L_0214fa82
    mov r4, #0x3
.L_0214fa82:
    cmp r0, #0x5
    bne .L_0214fa88
    mov r4, #0x4
.L_0214fa88:
    mov r0, r5
    mov r1, #0x0
    add r0, #0x98
    str r1, [r0, #0x0]
.L_0214fa90:
    mov r1, #0x49
    ldr r2, [r7, #0x4]
    lsl r1, r1, #0x2
    ldr r1, [r2, r1]
    mov r0, r5
    mov r2, #0x1
    bl func_ov007_0214f9dc
    mov r1, #0x49
    ldr r0, [r7, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, r1]
    mov r0, r5
    add r0, #0x94
    str r2, [r0, #0x0]
    ldr r0, [r7, #0x4]
    add r2, sp, #0x4
    ldr r0, [r0, r1]
    subs r1, r0, #0x4
    mov r0, #0x1c
    mul r0, r1
    ldr r1, .L_0214fcec
    ldr r1, [r1, r0]
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    ldr r1, .L_0214fcf0
    ldr r0, [r1, r0]
    add r1, sp, #0x8
    lsl r0, r0, #0xc
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x7c]
    blx func_ov007_0214f218
    mov r0, r5
    add r0, #0x94
    ldr r0, [r0, #0x0]
    cmp r0, #0x4
    bne .L_0214fade
    mov r6, #0x3
.L_0214fade:
    cmp r0, #0x5
    bne .L_0214fae4
    mov r6, #0x4
.L_0214fae4:
    ldr r0, [r5, #0x30]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r5, #0x34]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r5, #0x38]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r5, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    mov r0, #0xa5
    ldrsb r1, [r5, r0]
    lsl r0, r6, #0x18
    asr r0, r0, #0x18
    cmp r1, r0
    beq .L_0214fb9a
    mov r1, r5
    add r1, #0xa0
    ldr r1, [r1, #0x0]
    cmp r1, #0x0
    beq .L_0214fbee
    cmp r4, #0x0
    blt .L_0214fb72
    mov r0, #0xa7
    ldrsb r1, [r5, r0]
    lsl r0, r4, #0x18
    asr r0, r0, #0x18
    cmp r1, r0
    bne .L_0214fb72
    cmp r4, #0x3
    bne .L_0214fb40
    mov r0, r5
    mov r1, #0x8
    bl func_ov007_02150448
    b .L_0214fb4c
.L_0214fb40:
    cmp r4, #0x4
    bne .L_0214fb4c
    mov r0, r5
    mov r1, #0x8
    bl func_ov007_02150480
.L_0214fb4c:
    mov r4, #0x0
    mov r0, r5
    mvn r4, r4
    add r0, #0xa7
    strb r4, [r0, #0x0]
    mov r0, r5
    add r0, #0xa4
    strb r4, [r0, #0x0]
    mov r0, r5
    add r0, #0xa5
    strb r6, [r0, #0x0]
    mov r0, r5
    add r0, #0xa0
    ldr r0, [r0, #0x0]
    ldr r1, .L_0214fcf4
    ldr r0, [r0, #0x4]
    blx func_02028384
    b .L_0214fbfa
.L_0214fb72:
    cmp r4, #0x0
    blt .L_0214fb8a
    mov r0, #0xa6
    ldrsb r1, [r5, r0]
    lsl r0, r4, #0x18
    asr r0, r0, #0x18
    cmp r1, r0
    bne .L_0214fb8a
    mov r0, r5
    add r0, #0xa5
    strb r6, [r0, #0x0]
    b .L_0214fcb6
.L_0214fb8a:
    cmp r6, #0x0
    blt .L_0214fb9c
    mov r0, #0xa7
    ldrsb r1, [r5, r0]
    lsl r0, r6, #0x18
    asr r0, r0, #0x18
    cmp r1, r0
    bne .L_0214fb9c
.L_0214fb9a:
    b .L_0214fcb6
.L_0214fb9c:
    cmp r6, #0x0
    blt .L_0214fbd2
    mov r2, #0xa6
    ldrsb r1, [r5, r2]
    lsl r0, r6, #0x18
    asr r0, r0, #0x18
    cmp r1, r0
    bne .L_0214fbd2
    mov r4, r2
    mov r1, r5
    sub r4, #0xa7
    add r1, #0xa7
    strb r4, [r1, #0x0]
    mov r1, r5
    add r1, #0xa4
    strb r4, [r1, #0x0]
    mov r1, r5
    add r1, #0xa5
    strb r0, [r1, #0x0]
    mov r0, r5
    add r0, #0xa0
    ldr r0, [r0, #0x0]
    ldr r1, .L_0214fcf4
    ldr r0, [r0, #0x4]
    blx func_02028384
    b .L_0214fbfa
.L_0214fbd2:
    mov r0, r5
    add r0, #0xa4
    strb r4, [r0, #0x0]
    mov r0, r5
    add r0, #0xa5
    strb r6, [r0, #0x0]
    mov r0, r5
    add r0, #0xa0
    ldr r0, [r0, #0x0]
    ldr r1, .L_0214fcf4
    ldr r0, [r0, #0x4]
    blx func_02028384
    b .L_0214fbfa
.L_0214fbee:
    mov r1, r5
    add r1, #0xa4
    strb r4, [r1, #0x0]
    mov r1, r5
    add r1, #0xa5
    strb r0, [r1, #0x0]
.L_0214fbfa:
    blx func_02026f94
    str r0, [sp, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r5
    add r1, #0xa0
    ldr r0, [sp, #0x0]
    cmp r4, #0x0
    str r0, [r1, #0x0]
    blt .L_0214fc42
    mov r0, r5
    add r0, #0xa6
    strb r4, [r0, #0x0]
    cmp r4, #0x3
    bne .L_0214fc2a
    mov r0, r5
    mov r1, #0x7
    bl func_ov007_02150448
    b .L_0214fc36
.L_0214fc2a:
    cmp r4, #0x4
    bne .L_0214fc36
    mov r0, r5
    mov r1, #0x7
    bl func_ov007_02150480
.L_0214fc36:
    ldr r0, [sp, #0x0]
    ldr r1, .L_0214fcf8
    ldr r0, [r0, #0x4]
    blx func_02028384
    b .L_0214fcb6
.L_0214fc42:
    cmp r6, #0x0
    blt .L_0214fcb6
    mov r0, r5
    add r0, #0xa7
    strb r6, [r0, #0x0]
    mov r0, #0xaa
    ldrsb r0, [r5, r0]
    cmp r0, #0x0
    beq .L_0214fc58
    mov r2, #0x6
    b .L_0214fc5a
.L_0214fc58:
    mov r2, #0x5
.L_0214fc5a:
    mov r0, r5
    mov r1, r6
    bl func_ov007_021504b8
    ldr r0, [sp, #0x0]
    ldr r1, .L_0214fcfc
    ldr r0, [r0, #0x4]
    blx func_02028384
    b .L_0214fcb6
.L_0214fc6e:
    cmp r0, #0x8
    blo .L_0214fcb6
    cmp r0, #0x10
    bhs .L_0214fcb6
    mov r1, r5
    add r1, #0x98
    str r0, [r1, #0x0]
    ldr r0, [r5, #0x2c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r5, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    mov r0, #0x49
    ldr r1, [r7, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    cmp r0, #0x8
    blo .L_0214fcac
    cmp r0, #0xd
    bhs .L_0214fcac
    ldr r0, [r5, #0x34]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    b .L_0214fcb6
.L_0214fcac:
    ldr r0, [r5, #0x38]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
.L_0214fcb6:
    mov r1, #0x49
    ldr r2, [r7, #0x4]
    lsl r1, r1, #0x2
    ldr r1, [r2, r1]
    mov r0, r5
    bl func_ov007_0214f784
    ldr r0, [r7, #0x4]
    mov r1, #0x4a
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    blx r2
    mov r1, #0x3
    and r0, r1
    cmp r0, #0x3
    bne .L_0214fce6
    mov r0, #0xad
    ldrsb r0, [r5, r0]
    cmp r0, #0x0
    bne .L_0214fce6
    mov r0, #0x78
    blx func_0207342c
.L_0214fce6:
    add sp, #0xc
    pop {r4, r5, r6, r7, pc}
    mov r8, r8
.L_0214fcec: .word data_ov007_02169570
.L_0214fcf0: .word data_ov007_0216956c
.L_0214fcf4: .word func_ov007_0215052c
.L_0214fcf8: .word func_ov007_0215054c
.L_0214fcfc: .word func_ov007_021505a0
    thumb_func_end func_ov007_0214fa3c

    .global func_ov007_0214fd00
    thumb_func_start func_ov007_0214fd00
func_ov007_0214fd00: ; 0x0214fd00
    bx lr
    thumb_func_end func_ov007_0214fd00

    .byte 0x00, 0x00

    .global func_ov007_0214fd04
    thumb_func_start func_ov007_0214fd04
func_ov007_0214fd04: ; 0x0214fd04
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0214fd80
    cmp r0, r1
    beq .L_0214fd1e
    add r1, r1, #0x1
    cmp r0, r1
    pop {r3, r4, r5, pc}
.L_0214fd1e:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0214fd7c
    ldr r1, [r5, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r5, [r1, #0x10]
    cmp r0, #0x6
    bne .L_0214fd56
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r1, #0x1
    blx func_ov007_0214dd6c
    mov r0, r5
    mov r1, #0x0
    bl func_ov007_0214f7dc
    pop {r3, r4, r5, pc}
.L_0214fd56:
    mov r4, #0x0
    cmp r0, #0x4
    bne .L_0214fd60
    ldr r4, [r5, #0x34]
    b .L_0214fd66
.L_0214fd60:
    cmp r0, #0x5
    bne .L_0214fd66
    ldr r4, [r5, #0x38]
.L_0214fd66:
    cmp r4, #0x0
    beq .L_0214fd7c
    ldr r0, [r5, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
.L_0214fd7c:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0214fd80: .word 0x80011000
    thumb_func_end func_ov007_0214fd04

    .global func_ov007_0214fd84
    thumb_func_start func_ov007_0214fd84
func_ov007_0214fd84: ; 0x0214fd84
    push {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_0214fd8a:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_0214fd9a
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65d8
.L_0214fd9a:
    add r4, r4, #0x1
    cmp r4, #0x10
    blt .L_0214fd8a
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_0214fd84

    .byte 0x00, 0x00

    .global func_ov007_0214fda4
    thumb_func_start func_ov007_0214fda4
func_ov007_0214fda4: ; 0x0214fda4
    push {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_0214fdaa:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_0214fdba
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65e0
.L_0214fdba:
    add r4, r4, #0x1
    cmp r4, #0x10
    blt .L_0214fdaa
    ldr r0, [r5, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_0214fda4

    .global func_ov007_0214fdcc
    thumb_func_start func_ov007_0214fdcc
func_ov007_0214fdcc: ; 0x0214fdcc
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0xab
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0214fe1a
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r6, r0
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    bl func_ov007_0214fa20
    mov r1, r0
    mov r0, r6
    blx func_ov007_0214dd80
    blx func_ov007_0214dd50
    mov r1, #0x2
    blx func_ov007_0214dd60
    ldr r0, .L_0214fe2c
    mov r1, #0x0
    strb r1, [r0, #0x0]
    strb r1, [r0, #0x4]
    mov r0, r4
    bl func_ov007_0214f7dc
    pop {r4, r5, r6, pc}
.L_0214fe1a:
    mov r0, #0x78
    mov r1, #0x2
    blx func_0207342c
    mov r0, r4
    bl func_ov007_0214f814
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0214fe2c: .word data_020afeb0
    thumb_func_end func_ov007_0214fdcc

    .global func_ov007_0214fe30
    thumb_func_start func_ov007_0214fe30
func_ov007_0214fe30: ; 0x0214fe30
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r6, r0
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    bl func_ov007_0214fa20
    mov r1, r0
    mov r0, r6
    blx func_ov007_0214dd80
    blx func_ov007_0214dd50
    mov r1, #0x6
    blx func_ov007_0214dd60
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0214f7dc
    pop {r4, r5, r6, pc}
    thumb_func_end func_ov007_0214fe30

    .byte 0x00, 0x00

    .global func_ov007_0214fe70
    thumb_func_start func_ov007_0214fe70
func_ov007_0214fe70: ; 0x0214fe70
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0xab
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0214fea2
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r1, #0x7
    blx func_ov007_0214dd6c
    ldr r0, .L_0214feb4
    mov r1, #0x0
    strb r1, [r0, #0x0]
    strb r1, [r0, #0x4]
    mov r0, r4
    bl func_ov007_0214f7dc
    pop {r4, pc}
.L_0214fea2:
    mov r0, #0x78
    mov r1, #0x2
    blx func_0207342c
    mov r0, r4
    bl func_ov007_0214f814
    pop {r4, pc}
    mov r8, r8
.L_0214feb4: .word data_020afeb0
    thumb_func_end func_ov007_0214fe70

    .global func_ov007_0214feb8
    thumb_func_start func_ov007_0214feb8
func_ov007_0214feb8: ; 0x0214feb8
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0xab
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0214ff1c
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    bl func_ov012_021b6214
    mov r0, r4
    mov r1, #0x0
    add r0, #0xa8
    strb r1, [r0, #0x0]
    mov r0, r4
    bl func_ov007_0214fd84
    blx func_ov007_0214dd50
    mov r6, r0
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    bl func_ov007_0214fa20
    mov r1, r0
    mov r0, r6
    blx func_ov007_0214dd80
    blx func_ov007_0214dd50
    mov r1, #0x6
    blx func_ov007_0214dd6c
    ldr r0, .L_0214ff2c
    mov r1, #0x0
    strb r1, [r0, #0x0]
    strb r1, [r0, #0x4]
    mov r0, r4
    bl func_ov007_0214f7dc
    pop {r4, r5, r6, pc}
.L_0214ff1c:
    mov r0, #0x78
    mov r1, #0x2
    blx func_0207342c
    mov r0, r4
    bl func_ov007_0214f814
    pop {r4, r5, r6, pc}
.L_0214ff2c: .word data_020afeb0
    thumb_func_end func_ov007_0214feb8

    .global func_ov007_0214ff30
    thumb_func_start func_ov007_0214ff30
func_ov007_0214ff30: ; 0x0214ff30
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r2, [r5, #0x4]
    mov r0, #0xac
    ldr r4, [r2, #0x10]
    ldrsb r1, [r4, r0]
    cmp r1, #0x0
    beq .L_0214ff52
    add r0, #0x78
    ldr r0, [r2, r0]
    cmp r0, #0xc
    bne .L_0214ff52
    mov r0, #0x78
    mov r1, #0x2
    blx func_0207342c
    pop {r4, r5, r6, pc}
.L_0214ff52:
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r6, r0
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    bl func_ov007_0214fa20
    mov r1, r0
    mov r0, r6
    blx func_ov007_0214dd80
    blx func_ov007_0214dd50
    mov r1, #0xb
    blx func_ov007_0214dd60
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0214f7dc
    pop {r4, r5, r6, pc}
    thumb_func_end func_ov007_0214ff30

    .global func_ov007_0214ff88
    thumb_func_start func_ov007_0214ff88
func_ov007_0214ff88: ; 0x0214ff88
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    bl func_ov012_021b6214
    mov r0, r4
    mov r1, #0x0
    add r0, #0xa8
    strb r1, [r0, #0x0]
    mov r0, r4
    bl func_ov007_0214fd84
    blx func_ov007_0214dd50
    mov r6, r0
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    bl func_ov007_0214fa20
    mov r1, r0
    mov r0, r6
    blx func_ov007_0214dd80
    blx func_ov007_0214dd50
    mov r1, #0x0
    blx func_ov007_0214dd8c
    blx func_ov007_0214dd50
    mov r1, #0x13
    blx func_ov007_0214dd60
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0214f7dc
    pop {r4, r5, r6, pc}
    thumb_func_end func_ov007_0214ff88

    .byte 0x00, 0x00

    .global func_ov007_0214ffe8
    arm_func_start func_ov007_0214ffe8
func_ov007_0214ffe8: ; 0x0214ffe8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r0, [r4, #0xab]
    cmp r0, #0x0
    mov r0, #0x78
    bne .L_02150020
    mov r1, #0x2
    bl func_0207342c
    mov r0, r4
    blx func_ov007_0214f814
    b .L_021501e4
.L_02150020:
    mov r1, #0x0
    bl func_0207342c
    mov r1, #0x0
    mov r0, r4
    strb r1, [r4, #0xa8]
    blx func_ov007_0214fd84
    ldr r0, .L_021501ec
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    strb r1, [r0, #0x430]
    bl func_0208c538
    bl func_ov010_02199e58
    cmp r0, #0x0
    bne .L_021500c8
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x84]
    mov r3, r2
    mov r1, #0x25
    bl func_ov012_021bac28
    ldr r6, .L_021501f0
.L_02150080:
    ldr r0, [r4, #0x84]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    bne .L_0215009c
    ldr r0, [r6, #0x0]
    blx r0
    b .L_02150080
.L_0215009c:
    mov r0, r4
    blx func_ov007_0214fda4
    mov r1, #0x1
    strb r1, [r4, #0xa8]
    ldr r0, [r5, #0x4]
    blx func_ov012_021b6214
    ldr r0, .L_021501ec
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    strb r1, [r0, #0x430]
    b .L_021501e4
.L_021500c8:
    blx func_02070fd4
    mov r6, r0
    blx func_02070ff4
    mov r3, #0x0
    mov r1, r0
    mov r0, r6
    str r3, [sp, #0x0]
    mov r2, #0x32
    blx func_ov007_02166190
    mov r1, #0x1
    ldr r0, [r4, #0x84]
    mov r2, r1
    bl func_ov010_021a3228
    ldr r6, .L_021501f0
    b .L_0215010c
.L_02150104:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215010c:
    bl func_ov010_021a32a8
    cmp r0, #0x0
    beq .L_02150104
    bl func_ov010_021a3280
    cmp r0, #0x0
    beq .L_02150134
    mov r0, r4
    mov r1, #0x0
    blx func_ov007_0214f7dc
    b .L_021501e4
.L_02150134:
    bl func_ov010_021a32fc
    cmp r0, #0x0
    beq .L_021501a0
    bl func_ov010_021a3248
    blx func_02071f08
    mov r6, r0
    blx func_02070fd4
    add r1, r6, #0x40
    bl func_ov010_0219bacc
    bl func_ov007_0214dd50
    ldr r1, [r5, #0x4]
    mov r5, r0
    ldr r0, [r1, #0x124]
    blx func_ov007_0214fa20
    mov r1, r0
    mov r0, r5
    bl func_ov007_0214dd80
    bl func_ov007_0214dd50
    mov r1, #0xe
    bl func_ov007_0214dd60
    mov r0, r4
    mov r1, #0x0
    ldr r2, .L_021501f4
    strb r1, [r2, #0x20]
    strb r1, [r2, #0x24]
    blx func_ov007_0214f7dc
    b .L_021501e4
.L_021501a0:
    ldr r6, .L_021501f0
    b .L_021501b0
.L_021501a8:
    ldr r0, [r6, #0x0]
    blx r0
.L_021501b0:
    bl func_ov010_021a315c
    cmp r0, #0x0
    bne .L_021501a8
    mov r0, r4
    blx func_ov007_0214fda4
    mov r1, #0x1
    strb r1, [r4, #0xa8]
    ldr r0, [r5, #0x4]
    blx func_ov012_021b6214
    ldr r0, .L_021501ec
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    strb r1, [r0, #0x430]
.L_021501e4:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_021501ec: .word data_020a0f64
.L_021501f0: .word data_020a0e18
.L_021501f4: .word data_020afe90
    arm_func_end func_ov007_0214ffe8

    .global func_ov007_021501f8
    thumb_func_start func_ov007_021501f8
func_ov007_021501f8: ; 0x021501f8
    push {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    mov r0, r4
    bl func_ov007_0214fd84
    mov r0, r4
    add r0, #0x84
    ldr r0, [r0, #0x0]
    mov r1, #0x10
    blx func_ov007_021516f0
    blx func_ov007_0214dd50
    mov r1, #0xd
    blx func_ov007_0214dd6c
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0214f7dc
    pop {r4, pc}
    thumb_func_end func_ov007_021501f8

    .global func_ov007_0215022c
    thumb_func_start func_ov007_0215022c
func_ov007_0215022c: ; 0x0215022c
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02150264
    cmp r0, r1
    bne .L_02150260
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_02150260
    mov r1, #0x49
    ldr r2, [r5, #0x4]
    lsl r1, r1, #0x2
    ldr r1, [r2, r1]
    mov r0, r5
    lsl r2, r1, #0x2
    ldr r1, .L_02150268
    ldr r1, [r1, r2]
    blx r1
.L_02150260:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_02150264: .word 0x80011000
.L_02150268: .word data_ov007_02169504
    thumb_func_end func_ov007_0215022c

    .global func_ov007_0215026c
    thumb_func_start func_ov007_0215026c
func_ov007_0215026c: ; 0x0215026c
    push {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    blx func_ov007_021502c4
    ldr r1, .L_021502c0
    mov r4, r0
    blx func_ov007_0214f898
    cmp r0, #0x0
    beq .L_021502bc
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x5f
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    blx r2
    blx func_ov007_0214f340
    ldr r3, [r0, #0x4]
    mov r0, #0xce
    ldrsh r0, [r3, r0]
    mov r1, #0x0
    mov r5, #0xcc
    str r0, [sp, #0x0]
    ldrsh r3, [r3, r5]
    add r0, sp, #0x4
    mov r2, r1
    blx func_ov007_021502ec
    mov r0, r4
    add r1, sp, #0x4
    bl func_ov007_0214f908
.L_021502bc:
    add sp, #0xc
    pop {r4, r5, pc}
.L_021502c0: .word 0x31305053
    thumb_func_end func_ov007_0215026c

    .global func_ov007_021502c4
    arm_func_start func_ov007_021502c4
func_ov007_021502c4: ; 0x021502c4
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x154]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov007_0214f870
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_021502c4

    .global func_ov007_021502ec
    arm_func_start func_ov007_021502ec
func_ov007_021502ec: ; 0x021502ec
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldr r1, [sp, #0x0]
    strh r3, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov007_021502ec

    .global func_ov007_02150304
    thumb_func_start func_ov007_02150304
func_ov007_02150304: ; 0x02150304
    push {r3, lr}
    blx func_ov007_021502c4
    ldr r1, .L_02150324
    blx func_ov007_0214f898
    cmp r0, #0x0
    beq .L_02150320
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_02150320:
    pop {r3, pc}
    mov r8, r8
.L_02150324: .word 0x31305053
    thumb_func_end func_ov007_02150304

    .global func_ov007_02150328
    arm_func_start func_ov007_02150328
func_ov007_02150328: ; 0x02150328
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x90]
    and r0, r0, #0x1
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov007_02150328

    .global func_ov007_02150344
    thumb_func_start func_ov007_02150344
func_ov007_02150344: ; 0x02150344
    push {r4, r5, r6, lr}
    mov r6, r2
    ldr r2, [r0, #0x4]
    mov r0, #0x4
    ldr r4, [r2, #0x10]
    tst r0, r1
    beq .L_021503ae
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r0, [r2, r0]
    cmp r0, #0x4
    bne .L_02150384
    mov r5, #0x0
    b .L_0215037a
.L_02150360:
    lsl r0, r5, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x5c]
    blx func_ov007_02150328
    cmp r0, #0x0
    beq .L_02150378
    add r5, #0x8
    lsl r0, r5, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x3c]
    b .L_02150380
.L_02150378:
    add r5, r5, #0x1
.L_0215037a:
    cmp r5, #0x5
    blt .L_02150360
    mov r0, #0x0
.L_02150380:
    str r0, [r6, #0x0]
    pop {r4, r5, r6, pc}
.L_02150384:
    cmp r0, #0x5
    bne .L_021503ae
    mov r5, #0x0
    b .L_021503a6
.L_0215038c:
    lsl r0, r5, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x70]
    blx func_ov007_02150328
    cmp r0, #0x0
    beq .L_021503a4
    add r5, #0xd
    lsl r0, r5, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x3c]
    b .L_021503ac
.L_021503a4:
    add r5, r5, #0x1
.L_021503a6:
    cmp r5, #0x3
    blt .L_0215038c
    mov r0, #0x0
.L_021503ac:
    str r0, [r6, #0x0]
.L_021503ae:
    pop {r4, r5, r6, pc}
    thumb_func_end func_ov007_02150344

    .global func_ov007_021503b0
    thumb_func_start func_ov007_021503b0
func_ov007_021503b0: ; 0x021503b0
    ldr r0, [r0, #0x4]
    ldr r3, [r0, #0x10]
    mov r0, #0x8
    tst r0, r1
    beq .L_021503be
    ldr r0, [r3, #0x4c]
    str r0, [r2, #0x0]
.L_021503be:
    bx lr
    thumb_func_end func_ov007_021503b0

    .global func_ov007_021503c0
    thumb_func_start func_ov007_021503c0
func_ov007_021503c0: ; 0x021503c0
    ldr r0, [r0, #0x4]
    ldr r3, [r0, #0x10]
    mov r0, #0x8
    tst r0, r1
    beq .L_021503ce
    ldr r0, [r3, #0x50]
    str r0, [r2, #0x0]
.L_021503ce:
    bx lr
    thumb_func_end func_ov007_021503c0

    .global func_ov007_021503d0
    thumb_func_start func_ov007_021503d0
func_ov007_021503d0: ; 0x021503d0
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x10]
    blx func_ov007_0214f1f0
    mov r1, #0x3c
    tst r0, r1
    beq .L_02150440
    mov r0, #0xa6
    ldrsb r0, [r4, r0]
    cmp r0, #0x0
    blt .L_02150412
    mov r1, #0xa4
    ldrsb r1, [r4, r1]
    mov r0, r4
    mov r2, #0x8
    bl func_ov007_021504b8
    mov r0, #0xa5
    ldrsb r1, [r4, r0]
    cmp r1, #0x0
    blt .L_02150406
    mov r0, r4
    mov r2, #0x6
    bl func_ov007_021504b8
.L_02150406:
    mov r1, #0x0
    mov r0, r4
    mvn r1, r1
    add r0, #0xa6
    strb r1, [r0, #0x0]
    b .L_02150430
.L_02150412:
    mov r0, #0xa7
    ldrsb r0, [r4, r0]
    cmp r0, #0x0
    blt .L_02150430
    mov r1, #0xa5
    ldrsb r1, [r4, r1]
    mov r0, r4
    mov r2, #0x6
    bl func_ov007_021504b8
    mov r1, #0x0
    mov r0, r4
    mvn r1, r1
    add r0, #0xa7
    strb r1, [r0, #0x0]
.L_02150430:
    add r4, #0xa0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02150440
    ldr r0, [r0, #0x4]
    ldr r1, .L_02150444
    blx func_02028384
.L_02150440:
    pop {r4, pc}
    mov r8, r8
.L_02150444: .word func_ov007_0215052c
    thumb_func_end func_ov007_021503d0

    .global func_ov007_02150448
    thumb_func_start func_ov007_02150448
func_ov007_02150448: ; 0x02150448
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r7, r1
    mov r4, #0x0
.L_02150450:
    lsl r0, r4, #0x2
    add r0, r6, r0
    ldr r5, [r0, #0x5c]
    mov r1, r7
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_02150450
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_02150448

    .byte 0x00, 0x00

    .global func_ov007_02150480
    thumb_func_start func_ov007_02150480
func_ov007_02150480: ; 0x02150480
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r7, r1
    mov r4, #0x0
.L_02150488:
    lsl r0, r4, #0x2
    add r0, r6, r0
    ldr r5, [r0, #0x70]
    mov r1, r7
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_02150488
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_02150480

    .byte 0x00, 0x00

    .global func_ov007_021504b8
    thumb_func_start func_ov007_021504b8
func_ov007_021504b8: ; 0x021504b8
    push {r3, lr}
    cmp r1, #0x3
    bne .L_021504c6
    mov r1, r2
    bl func_ov007_02150448
    pop {r3, pc}
.L_021504c6:
    cmp r1, #0x4
    bne .L_021504d0
    mov r1, r2
    bl func_ov007_02150480
.L_021504d0:
    pop {r3, pc}
    thumb_func_end func_ov007_021504b8

    .byte 0x00, 0x00

    .global func_ov007_021504d4
    thumb_func_start func_ov007_021504d4
func_ov007_021504d4: ; 0x021504d4
    push {r4, r5, r6, lr}
    mov r5, r0
    cmp r1, #0x3
    bne .L_02150500
    mov r4, #0x0
    mov r6, r4
    b .L_021504f8
.L_021504e2:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x5c]
    mov r1, r6
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    bne .L_021504f6
    mov r0, #0x0
    pop {r4, r5, r6, pc}
.L_021504f6:
    add r4, r4, #0x1
.L_021504f8:
    cmp r4, #0x5
    blt .L_021504e2
    mov r0, #0x1
    pop {r4, r5, r6, pc}
.L_02150500:
    cmp r1, #0x4
    bne .L_02150528
    mov r4, #0x0
    mov r6, r4
    b .L_02150520
.L_0215050a:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x70]
    mov r1, r6
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    bne .L_0215051e
    mov r0, #0x0
    pop {r4, r5, r6, pc}
.L_0215051e:
    add r4, r4, #0x1
.L_02150520:
    cmp r4, #0x3
    blt .L_0215050a
    mov r0, #0x1
    pop {r4, r5, r6, pc}
.L_02150528:
    mov r0, #0x1
    pop {r4, r5, r6, pc}
    thumb_func_end func_ov007_021504d4

    .global func_ov007_0215052c
    thumb_func_start func_ov007_0215052c
func_ov007_0215052c: ; 0x0215052c
    push {r3, lr}
    ldr r1, [r0, #0x4]
    ldr r2, [r1, #0x10]
    mov r1, r2
    add r1, #0xa0
    ldr r1, [r1, #0x0]
    cmp r0, r1
    bne .L_02150542
    mov r1, #0x0
    add r2, #0xa0
    str r1, [r2, #0x0]
.L_02150542:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    pop {r3, pc}
    thumb_func_end func_ov007_0215052c

    .byte 0x00, 0x00

    .global func_ov007_0215054c
    thumb_func_start func_ov007_0215054c
func_ov007_0215054c: ; 0x0215054c
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0xa4
    ldr r4, [r0, #0x10]
    ldrsb r1, [r4, r1]
    mov r0, r4
    bl func_ov007_021504d4
    cmp r0, #0x0
    beq .L_02150596
    mov r1, #0x0
    mov r0, r4
    mvn r1, r1
    add r0, #0xa6
    strb r1, [r0, #0x0]
    mov r1, #0xa5
    ldrsb r2, [r4, r1]
    cmp r2, #0x0
    blt .L_0215058e
    mov r0, r4
    add r0, #0xa7
    strb r2, [r0, #0x0]
    ldrsb r1, [r4, r1]
    mov r0, r4
    mov r2, #0x5
    bl func_ov007_021504b8
    ldr r0, [r5, #0x4]
    ldr r1, .L_02150598
    blx func_02028384
    pop {r3, r4, r5, pc}
.L_0215058e:
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215059c
    blx func_02028384
.L_02150596:
    pop {r3, r4, r5, pc}
.L_02150598: .word func_ov007_021505a0
.L_0215059c: .word func_ov007_0215052c
    thumb_func_end func_ov007_0215054c

    .global func_ov007_021505a0
    thumb_func_start func_ov007_021505a0
func_ov007_021505a0: ; 0x021505a0
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0xa5
    ldr r4, [r0, #0x10]
    ldrsb r1, [r4, r1]
    mov r0, r4
    bl func_ov007_021504d4
    cmp r0, #0x0
    beq .L_021505c6
    mov r0, #0x0
    mvn r0, r0
    add r4, #0xa7
    strb r0, [r4, #0x0]
    ldr r0, [r5, #0x4]
    ldr r1, .L_021505c8
    blx func_02028384
.L_021505c6:
    pop {r3, r4, r5, pc}
.L_021505c8: .word func_ov007_0215052c
    thumb_func_end func_ov007_021505a0

    .global func_ov007_021505cc
    arm_func_start func_ov007_021505cc
func_ov007_021505cc: ; 0x021505cc
    ldrh r1, [r0, #0x4]
    add r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    bx lr
    arm_func_end func_ov007_021505cc

    .global func_ov007_021505e0
    arm_func_start func_ov007_021505e0
func_ov007_021505e0: ; 0x021505e0
    str r1, [r0, #0x30]
    bx lr
    arm_func_end func_ov007_021505e0

    .global func_ov007_021505e8
    arm_func_start func_ov007_021505e8
func_ov007_021505e8: ; 0x021505e8
    mov r0, #0x0
    bx lr
    arm_func_end func_ov007_021505e8

    .global func_ov007_021505f0
    arm_func_start func_ov007_021505f0
func_ov007_021505f0: ; 0x021505f0
    mov r0, #0x0
    bx lr
    arm_func_end func_ov007_021505f0

    .global func_ov007_021505f8
    arm_func_start func_ov007_021505f8
func_ov007_021505f8: ; 0x021505f8
    mov r0, #0x0
    bx lr
    arm_func_end func_ov007_021505f8

    .global func_ov007_02150600
    arm_func_start func_ov007_02150600
func_ov007_02150600: ; 0x02150600
    ldr r2, [r0, #0x1c]
    cmp r2, r1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov007_02150600

    .global func_ov007_02150610
    arm_func_start func_ov007_02150610
func_ov007_02150610: ; 0x02150610
    str r1, [r0, #0x1c]
    bx lr
    arm_func_end func_ov007_02150610

    .global func_ov007_02150618
    arm_func_start func_ov007_02150618
func_ov007_02150618: ; 0x02150618
    mov r0, #0x1
    bx lr
    arm_func_end func_ov007_02150618

    .global func_ov007_02150620
    arm_func_start func_ov007_02150620
func_ov007_02150620: ; 0x02150620
    ldr r0, .L_02150628
    bx lr
.L_02150628: .word data_02093c74
    arm_func_end func_ov007_02150620

    .global func_ov007_0215062c
    arm_func_start func_ov007_0215062c
func_ov007_0215062c: ; 0x0215062c
    mov r0, #0x0
    bx lr
    arm_func_end func_ov007_0215062c

    .global func_ov007_02150634
    arm_func_start func_ov007_02150634
func_ov007_02150634: ; 0x02150634
    ldr ip, .L_02150640
    add r0, r0, #0x68
    bx ip
.L_02150640: .word func_ov007_0214f448
    arm_func_end func_ov007_02150634

    .global func_ov007_02150644
    thumb_func_start func_ov007_02150644
func_ov007_02150644: ; 0x02150644
    push {r4, lr}
    mov r4, r0
    bl func_ov012_021b0644
    mov r0, r4
    pop {r4, pc}
    thumb_func_end func_ov007_02150644

    .global func_ov007_02150650
    thumb_func_start func_ov007_02150650
func_ov007_02150650: ; 0x02150650
    push {r4, lr}
    mov r4, r0
    bl func_ov012_021b0644
    mov r0, r4
    blx func_0201b244
    mov r0, r4
    pop {r4, pc}
    thumb_func_end func_ov007_02150650

    .byte 0x00, 0x00

    .global func_ov007_02150664
    arm_func_start func_ov007_02150664
func_ov007_02150664: ; 0x02150664
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov007_02150664

    .global func_ov007_02150678
    arm_func_start func_ov007_02150678
func_ov007_02150678: ; 0x02150678
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r0, r3
    mov r5, r1
    mov r4, r2
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
    mov r0, #0x1000
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
    mov r0, #0x0
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
    mov r1, r6
    ldr r0, [r0, #0x4]
    mov r2, r5
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r4
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
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
    mov r6, #0x0
    mov r5, #0x1
    mov r4, #0x4
    mov r8, r6
    mov r7, r6
.L_021508a4:
    mov r0, r6
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r5
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r6
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r6
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r8
    ldr r0, [r0, #0x4]
    mov r2, r8
    bl func_0203cfbc
    mov r0, r6
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r6
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r6
    bl func_ov007_02150938
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_021508a4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov007_02150678

    .global func_ov007_02150938
    arm_func_start func_ov007_02150938
func_ov007_02150938: ; 0x02150938
    stmdb sp!, {r3, lr}
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02150938

    .global func_ov007_0215095c
    arm_func_start func_ov007_0215095c
func_ov007_0215095c: ; 0x0215095c
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r2, [r0, #0x4]
    add r1, sp, #0x4
    ldr lr, [r2, #0x10]
    add r2, sp, #0x0
    ldr r3, [lr, #0x4]
    add ip, r3, #0x1
    mov r3, ip, lsr #0x2
    rsb r3, r3, #0x0
    str ip, [lr, #0x4]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldr r3, [lr, #0x4]
    mov r3, r3, lsr #0x2
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov007_0214f218
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0215095c

    .global func_ov007_021509ac
    arm_func_start func_ov007_021509ac
func_ov007_021509ac: ; 0x021509ac
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, .L_02150b28
    mov r4, r0
    ldr r2, .L_02150b2c
    mov r0, #0x8
    mov r3, #0x66
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x8
    mov r7, r0
    bl func_020517fc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
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
    ldr r0, .L_02150b30
    ldr r1, .L_02150b34
    mov r2, r4
    bl func_ov007_02150f80
    ldr r1, .L_02150b38
    mov r6, r0
    bl func_ov007_0215102c
    mov r0, r7
    mov r1, #0x0
    bl func_ov007_0215145c
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r1, .L_02150b3c
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov007_0214f2f4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150b40
    bl func_02028384
    mov r0, #0x84000
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    mov r1, r6
    bl func_ov007_0214f48c
    str r5, [r7, #0x0]
    mov r0, r7
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02150b28: .word data_ov007_02169890
.L_02150b2c: .word data_ov007_02169768
.L_02150b30: .word data_ov007_02168a78
.L_02150b34: .word data_ov007_02168a84
.L_02150b38: .word data_ov007_02168a90
.L_02150b3c: .word data_ov012_021d5154
.L_02150b40: .word func_ov007_0215095c
    arm_func_end func_ov007_021509ac

    .global func_ov007_02150b44
    arm_func_start func_ov007_02150b44
func_ov007_02150b44: ; 0x02150b44
    ldr r0, [r0, #0x0]
    bx lr
    arm_func_end func_ov007_02150b44

    .global func_ov007_02150b4c
    arm_func_start func_ov007_02150b4c
func_ov007_02150b4c: ; 0x02150b4c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02150b70
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02150b70:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02150b4c

    .global func_ov007_02150b7c
    arm_func_start func_ov007_02150b7c
func_ov007_02150b7c: ; 0x02150b7c
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov lr, #0x80
    mov ip, #0x0
    str lr, [sp, #0x8]
    str ip, [sp, #0xc]
    mov ip, #0x70
    mov lr, r2
    mov r4, r1
    mov r1, r3
    add r2, sp, #0x8
    str ip, [sp, #0x0]
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, r4
    mov r3, lr
    bl func_ov007_02151538
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02150b7c

    .global func_ov007_02150bdc
    arm_func_start func_ov007_02150bdc
func_ov007_02150bdc: ; 0x02150bdc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r3, #0x100
    mov r2, #0xc0
    str r3, [sp, #0x10]
    str r2, [sp, #0x14]
    mov r3, #0x70
    str r3, [sp, #0x0]
    add r2, sp, #0x10
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x510000
    mov r3, #0x0
    bl func_ov007_02151538
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
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    strb r2, [r0, #0xb1]
    ldr r0, [r4, #0x4]
    blx func_ov012_021b77a8
    mvn r0, #0x2f
    strh r0, [sp, #0x8]
    add r0, r0, #0x20
    strh r0, [sp, #0xa]
    mov r0, #0x0
    ldr r1, .L_02150d24
    ldr r2, .L_02150d28
    ldr r3, .L_02150d2c
    strh r0, [sp, #0xc]
    strh r0, [sp, #0xe]
    mov r0, #0x70
    add r6, sp, #0x8
    bl func_0201a21c
    movs r5, r0
    beq .L_02150cbc
    ldr r2, .L_02150d30
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_02150d34
    mov r1, r6
    add r0, r5, #0x68
    str r2, [r5, #0x0]
    bl func_ov007_0214f448
    ldr r0, .L_02150d38
    str r0, [r5, #0x0]
.L_02150cbc:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02150cd8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02150cd8:
    ldr r1, [r5, #0x18]
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150d3c
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150d40
    blx func_ov012_021b400c
    mov r0, r4
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02150d24: .word data_ov007_02169674
.L_02150d28: .word data_ov007_02169744
.L_02150d2c: .word 0x1b2
.L_02150d30: .word data_02093c8c
.L_02150d34: .word data_ov007_021695c0
.L_02150d38: .word data_ov012_021d1c58
.L_02150d3c: .word 0x510001
.L_02150d40: .word 0x51002c
    arm_func_end func_ov007_02150bdc

    .global func_ov007_02150d44
    arm_func_start func_ov007_02150d44
func_ov007_02150d44: ; 0x02150d44
    stmdb sp!, {r4, lr}
    ldr r1, .L_02150dac
    mov r4, r0
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, .L_02150db0
    ldr r2, .L_02150db4
    mov r0, #0x8
    mov r3, #0xf9
    bl func_0201a21c
    ldr r3, .L_02150dac
    mov r1, #0x0
    mov r2, #0x8
    str r0, [r3, #0x0]
    bl func_020517fc
    ldr r1, .L_02150dac
    ldr r0, .L_02150db8
    ldr r2, [r1, #0x0]
    mov r1, #0x0
    str r4, [r2, #0x4]
    blx func_020101f4
    ldr r1, .L_02150dac
    ldr r1, [r1, #0x0]
    str r0, [r1, #0x0]
    ldmia sp!, {r4, pc}
.L_02150dac: .word data_ov007_0216ad6c
.L_02150db0: .word data_ov007_02169890
.L_02150db4: .word data_ov007_02169780
.L_02150db8: .word data_ov007_021698a4
    arm_func_end func_ov007_02150d44

    .global func_ov007_02150dbc
    arm_func_start func_ov007_02150dbc
func_ov007_02150dbc: ; 0x02150dbc
    stmdb sp!, {r3, lr}
    ldr r1, .L_02150e10
    ldr r2, [r1, #0x0]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r2, #0x4]
    cmp r1, r0
    ldmneia sp!, {r3, pc}
    ldr r0, [r2, #0x0]
    cmp r0, #0x0
    beq .L_02150df4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02150df4:
    ldr r0, .L_02150e10
    ldr r0, [r0, #0x0]
    bl func_0201b244
    ldr r0, .L_02150e10
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldmia sp!, {r3, pc}
.L_02150e10: .word data_ov007_0216ad6c
    arm_func_end func_ov007_02150dbc

    .global func_ov007_02150e14
    arm_func_start func_ov007_02150e14
func_ov007_02150e14: ; 0x02150e14
    stmdb sp!, {r3, lr}
    ldr r1, .L_02150e70
    ldr r1, [r1, #0x4]
    cmp r1, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov007_02150e78
    mov r1, #0x0
    ldr r0, .L_02150e74
    mov r2, r1
    blx func_ov012_021caa0c
    ldr r1, .L_02150e70
    str r0, [r1, #0x4]
    bl func_ov007_02150eb4
    ldr r0, .L_02150e70
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    bl func_ov007_02150ee4
    mov r1, #0x0
    bl func_02034d94
    ldmia sp!, {r3, pc}
.L_02150e70: .word data_ov007_0216ad6c
.L_02150e74: .word data_ov007_021698bc
    arm_func_end func_ov007_02150e14

    .global func_ov007_02150e78
    arm_func_start func_ov007_02150e78
func_ov007_02150e78: ; 0x02150e78
    stmdb sp!, {r3, lr}
    ldr r2, .L_02150ea8
    ldr r1, .L_02150eac
    ldr ip, [r2, #0x0]
    ldr lr, [r0, #0x4]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r0, .L_02150eb0
    str ip, [r2, #0x0]
    str r3, [r0, ip, lsl #0x2]
    str lr, [r1, #0x0]
    ldmia sp!, {r3, pc}
.L_02150ea8: .word data_02093c08
.L_02150eac: .word data_020a0dd0
.L_02150eb0: .word data_020a16d0
    arm_func_end func_ov007_02150e78

    .global func_ov007_02150eb4
    arm_func_start func_ov007_02150eb4
func_ov007_02150eb4: ; 0x02150eb4
    ldr r1, .L_02150ed8
    ldr r2, .L_02150edc
    ldr r3, [r1, #0x0]
    ldr r0, .L_02150ee0
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bx lr
.L_02150ed8: .word data_02093c08
.L_02150edc: .word data_020a16d0
.L_02150ee0: .word data_020a0dd0
    arm_func_end func_ov007_02150eb4

    .global func_ov007_02150ee4
    arm_func_start func_ov007_02150ee4
func_ov007_02150ee4: ; 0x02150ee4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_02150f04
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02150f04:
    ldr r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02150ee4

    .global func_ov007_02150f0c
    arm_func_start func_ov007_02150f0c
func_ov007_02150f0c: ; 0x02150f0c
    ldr r0, .L_02150f18
    ldr r0, [r0, #0x4]
    bx lr
.L_02150f18: .word data_ov007_0216ad6c
    arm_func_end func_ov007_02150f0c

    .global func_ov007_02150f1c
    arm_func_start func_ov007_02150f1c
func_ov007_02150f1c: ; 0x02150f1c
    stmdb sp!, {r3, lr}
    ldr r0, .L_02150f50
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, .L_02150f50
    mov r1, #0x0
    str r1, [r0, #0x4]
    ldmia sp!, {r3, pc}
.L_02150f50: .word data_ov007_0216ad6c
    arm_func_end func_ov007_02150f1c

    .global func_ov007_02150f54
    arm_func_start func_ov007_02150f54
func_ov007_02150f54: ; 0x02150f54
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, r1
    bl func_ov007_02150e78
    mov r0, r4
    bl func_02035c90
    bl func_ov007_02150ee4
    mov r4, r0
    bl func_ov007_02150eb4
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02150f54

    .global func_ov007_02150f80
    arm_func_start func_ov007_02150f80
func_ov007_02150f80: ; 0x02150f80
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    mov r0, r2
    bl func_ov007_02150e78
    mov r0, r4
    bl func_02035c90
    bl func_ov007_02150ee4
    mov r4, r0
    bl func_02036ab8
    bl func_ov007_0214f340
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_02150fec
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_02151004
.L_02150fec:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_02151004:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    bl func_ov007_02150eb4
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_02150f80

    .global func_ov007_0215102c
    arm_func_start func_ov007_0215102c
func_ov007_0215102c: ; 0x0215102c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r4, r1
    ldr r0, [r0, #0x64]
    ldr r0, [r0, #0x20]
    bl func_ov007_02150ee4
    bl func_02034db8
    ldr r0, [r0, #0x4]
    mov r1, r4
    bl func_0201710c
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0215102c

    .global func_ov007_02151058
    arm_func_start func_ov007_02151058
func_ov007_02151058: ; 0x02151058
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldrsh r3, [r7, #0x0]
    ldrsh r1, [r7, #0x4]
    mov r8, r0
    mov r6, r2
    cmp r1, r3
    subgt r0, r1, r3
    suble r0, r3, r1
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrsh r5, [r7, #0x2]
    ldrsh r0, [r7, #0x6]
    cmp r0, r5
    subgt r0, r0, r5
    suble r0, r5, r0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    b .L_021510e0
.L_021510a4:
    ldrsh r4, [r7, #0x0]
    b .L_021510d0
.L_021510ac:
    ldr r0, [r8, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x64]
    mov r2, r5
    ldr ip, [r0, #0x0]
    mov r3, r6
    ldr ip, [ip, #0x88]
    blx ip
    add r4, r4, #0x1
.L_021510d0:
    ldrsh r0, [r7, #0x4]
    cmp r4, r0
    blo .L_021510ac
    add r5, r5, #0x1
.L_021510e0:
    ldrsh r0, [r7, #0x6]
    cmp r5, r0
    blo .L_021510a4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov007_02151058

    .global func_ov007_021510f0
    arm_func_start func_ov007_021510f0
func_ov007_021510f0: ; 0x021510f0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov007_02150e78
    mov r0, r7
    bl func_020329ec
    bl func_ov007_0214f340
    mov r4, r0
    ldr ip, .L_02151174
    ldr r3, [r4, #0x4]
    mov r2, r5, lsl #0xc
    str ip, [r3, #0x54]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    bl func_ov007_0214f27c
    ldr r0, [r4, #0x4]
    orr r1, r7, r6
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
    bl func_ov007_02150eb4
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02151174: .word 0x31305053
    arm_func_end func_ov007_021510f0

    .global func_ov007_02151178
    arm_func_start func_ov007_02151178
func_ov007_02151178: ; 0x02151178
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x64
    ldr r4, .L_0215136c
    mov r7, r0
    ldr r0, [r4, #0x8]
    mov r4, r1
    mov r6, r2
    mov r5, r3
    tst r0, #0x1
    bne .L_021512d0
    ldr r0, .L_02151370
    mov ip, #0x1000
    add r1, sp, #0x60
    add r2, sp, #0x5c
    add r3, sp, #0x58
    str ip, [sp, #0x58]
    str ip, [sp, #0x5c]
    str ip, [sp, #0x60]
    bl func_ov007_02151394
    mov ip, #0x1000
    ldr r0, .L_02151374
    add r1, sp, #0x54
    add r2, sp, #0x50
    add r3, sp, #0x4c
    str ip, [sp, #0x4c]
    str ip, [sp, #0x50]
    str ip, [sp, #0x54]
    bl func_ov007_02151394
    mov r1, #0x1000
    ldr r0, .L_02151378
    str r1, [sp, #0x40]
    str r1, [sp, #0x44]
    str r1, [sp, #0x48]
    add r1, sp, #0x48
    add r2, sp, #0x44
    add r3, sp, #0x40
    bl func_ov007_02151394
    mov r0, #0x1000
    str r0, [sp, #0x34]
    str r0, [sp, #0x38]
    str r0, [sp, #0x3c]
    ldr r0, .L_0215137c
    add r1, sp, #0x3c
    add r2, sp, #0x38
    add r3, sp, #0x34
    bl func_ov007_02151394
    mov r0, #0x1000
    str r0, [sp, #0x28]
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    ldr r0, .L_02151380
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    bl func_ov007_02151394
    mov r0, #0x1000
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    ldr r0, .L_02151384
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    bl func_ov007_02151394
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    ldr r0, .L_02151388
    add r1, sp, #0x18
    add r2, sp, #0x14
    add r3, sp, #0x10
    bl func_ov007_02151394
    mov ip, #0x0
    ldr r0, .L_0215138c
    add r1, sp, #0xc
    add r2, sp, #0x8
    add r3, sp, #0x4
    str ip, [sp, #0x4]
    str ip, [sp, #0x8]
    str ip, [sp, #0xc]
    bl func_ov007_02151394
    ldr r0, .L_0215136c
    ldr r1, [r0, #0x8]
    orr r1, r1, #0x1
    str r1, [r0, #0x8]
.L_021512d0:
    mov r0, r7
    bl func_ov007_02150e78
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov007_0214f340
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_02151390
    str r1, [r0, #0x54]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    cmp r7, r0
    ldr r0, [r4, #0x4]
    bne .L_02151320
    ldr r2, [r0, #0x0]
    ldr r1, .L_02151370
    ldr r2, [r2, #0xfc]
    add r1, r1, r6, lsl #0x4
    blx r2
    b .L_02151334
.L_02151320:
    ldr r0, [r0, #0x64]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
.L_02151334:
    mov r2, r5, lsl #0xc
    add r1, sp, #0x0
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov007_0214f27c
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov007_02150eb4
    mov r0, r4
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0215136c: .word data_ov007_0216ad6c
.L_02151370: .word data_ov007_02169810
.L_02151374: .word data_ov007_02169820
.L_02151378: .word data_ov007_02169830
.L_0215137c: .word data_ov007_02169840
.L_02151380: .word data_ov007_02169850
.L_02151384: .word data_ov007_02169860
.L_02151388: .word data_ov007_02169870
.L_0215138c: .word data_ov007_02169880
.L_02151390: .word 0x31305854
    arm_func_end func_ov007_02151178

    .global func_ov007_02151394
    arm_func_start func_ov007_02151394
func_ov007_02151394: ; 0x02151394
    ldr ip, [r1, #0x0]
    mov r1, #0x1000
    str ip, [r0, #0x0]
    ldr r2, [r2, #0x0]
    str r2, [r0, #0x4]
    ldr r2, [r3, #0x0]
    str r2, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
    arm_func_end func_ov007_02151394

    .global func_ov007_021513b8
    arm_func_start func_ov007_021513b8
func_ov007_021513b8: ; 0x021513b8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x40
    mov r5, r0
    ldr r6, [r5, #0x4]
    mov r4, r1
    ldr r0, [r6, #0x64]
    mov r7, r2
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    cmp r4, #0x0
    beq .L_02151454
    cmp r7, #0x0
    ble .L_02151438
    cmp r7, #0x20
    movge r7, #0x1f
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x40
    bl func_020517fc
    add r1, sp, #0x0
    mov r0, r4
    mov r2, r7, lsl #0x1
    bl func_02051890
    add r4, sp, #0x0
    mov r0, r7, lsl #0x1
    mov r1, #0x0
    strh r1, [r4, r0]
.L_02151438:
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
.L_02151454:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov007_021513b8

    .global func_ov007_0215145c
    arm_func_start func_ov007_0215145c
func_ov007_0215145c: ; 0x0215145c
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr ip, .L_02151524
    mov r6, r0
    ldr r1, .L_02151528
    ldr r2, .L_0215152c
    ldr r3, .L_02151530
    mov r0, #0x14c
    ldr r4, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215149c
    ldr r3, .L_02151534
    mov r2, r4
    mov r1, #0x0
    blx func_ov012_021b7950
.L_0215149c:
    bl func_ov007_0214f340
    mov r4, r0
    movs r1, #0x0
    bne .L_021514b8
    ldr r0, [r4, #0x4]
    blx func_ov012_021b5898
    b .L_021514c8
.L_021514b8:
    mov r1, #0x4
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_021514c8:
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b7744
    cmp r5, #0x0
    beq .L_02151508
    mov r0, r4
    mov r1, r5
    blx func_ov012_021b3ba4
.L_02151508:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_02151524: .word data_ov012_021d5154
.L_02151528: .word data_ov007_02169754
.L_0215152c: .word data_ov007_0216974c
.L_02151530: .word 0x2a6
.L_02151534: .word func_ov007_0214f368
    arm_func_end func_ov007_0215145c

    .global func_ov007_02151538
    arm_func_start func_ov007_02151538
func_ov007_02151538: ; 0x02151538
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    ldr ip, .L_021515cc
    mov r8, r1
    ldr r1, [ip, #0x0]
    mov r7, r2
    mov r6, r3
    ldr r5, [sp, #0x2c]
    bl func_ov007_0214f2f4
    mov r4, r0
    ldr r3, [sp, #0x28]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov007_021510f0
    mov r1, r0
    mov r0, r4
    bl func_ov007_0214f48c
    ldr r1, [sp, #0x28]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x8]
    add r1, sp, #0x8
    bl func_ov007_0214f27c
    ldr r1, [r5, #0x4]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r2, [r5, #0x0]
    add r1, sp, #0x4
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x4]
    add r2, sp, #0x0
    bl func_ov007_0214f218
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_021515cc: .word data_ov012_021d5154
    arm_func_end func_ov007_02151538

    .global func_ov007_021515d0
    arm_func_start func_ov007_021515d0
func_ov007_021515d0: ; 0x021515d0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    ldr ip, .L_02151664
    mov r8, r1
    ldr r1, [ip, #0x0]
    mov r7, r2
    mov r6, r3
    ldr r5, [sp, #0x2c]
    bl func_ov007_0214f2f4
    mov r4, r0
    ldr r3, [sp, #0x28]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov007_02151178
    mov r1, r0
    mov r0, r4
    bl func_ov007_0214f48c
    ldr r1, [sp, #0x28]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x8]
    add r1, sp, #0x8
    bl func_ov007_0214f27c
    ldr r1, [r5, #0x4]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r2, [r5, #0x0]
    add r1, sp, #0x4
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x4]
    add r2, sp, #0x0
    bl func_ov007_0214f218
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02151664: .word data_ov012_021d5154
    arm_func_end func_ov007_021515d0

    .global func_ov007_02151668
    arm_func_start func_ov007_02151668
func_ov007_02151668: ; 0x02151668
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r6, r0
    cmp r1, #0x6
    movhi r1, #0x6
    ldr r0, .L_021516ec
    rsb r3, r1, #0x6
    mov r5, r2
    ldr r2, [r0, r3, lsl #0x2]
    mov r0, #0xa
    mul r0, r2, r0
    sub r0, r0, #0x1
    cmp r6, r0
    movhi r6, r0
    ldr r0, .L_021516ec
    sub r4, r1, #0x1
    mov r9, #0x0
    add r8, r0, r3, lsl #0x2
    b .L_021516dc
.L_021516b0:
    ldr r10, [r8, r9, lsl #0x2]
    mov r0, r6
    mov r1, r10
    bl func_0200d338
    mov r7, r0
    mov r0, r6
    mov r1, r10
    bl func_0200d338
    strb r7, [r5, r9]
    mov r6, r1
    add r9, r9, #0x1
.L_021516dc:
    cmp r9, r4
    blt .L_021516b0
    strb r6, [r5, r9]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_021516ec: .word data_ov007_02168a60
    arm_func_end func_ov007_02151668

    .global func_ov007_021516f0
    arm_func_start func_ov007_021516f0
func_ov007_021516f0: ; 0x021516f0
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r0, #0x0
    mov r4, r1
    bl func_0206dcdc
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, r6
    mov r1, r4
    mov r3, r2
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
    mov r0, r6
    mov r1, #0x1
    bl func_ov012_021bad88
    mov r0, #0x14
    bl func_ov007_021517c4
    bl func_02072ab4
    mov r5, r0
    mov r0, #0xa
    bl func_ov007_021517c4
    mov r0, r6
    bl func_ov012_021bace0
    ldr r4, .L_021517c0
    b .L_02151768
.L_02151760:
    ldr r0, [r4, #0x0]
    blx r0
.L_02151768:
    mov r0, r6
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02151760
    cmp r5, #0x0
    bne .L_021517b0
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, r6
    mov r3, r2
    mov r1, #0x11
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
    mov r0, #0x14
    bl func_ov007_021517c4
    bl func_0206dd40
.L_021517b0:
    mov r0, #0x1
    bl func_0206dcdc
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_021517c0: .word data_020a0e18
    arm_func_end func_ov007_021516f0

    .global func_ov007_021517c4
    arm_func_start func_ov007_021517c4
func_ov007_021517c4: ; 0x021517c4
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_021517f0
    b .L_021517e4
.L_021517d8:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_021517e4:
    cmp r5, r6
    blo .L_021517d8
    ldmia sp!, {r4, r5, r6, pc}
.L_021517f0: .word data_020a0e18
    arm_func_end func_ov007_021517c4

    .global func_ov007_021517f4
    arm_func_start func_ov007_021517f4
func_ov007_021517f4: ; 0x021517f4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r0, #0x0
    mov r1, #0x1
    bl func_02075fbc
    mov r4, r0
    bl func_02076908
    mov r6, #0x0
    mov r5, r0
    mov r7, r6
    b .L_02151864
.L_0215181c:
    mov r0, r7
    blx func_02071f10
    mov r1, r0
    mov r0, r5
    bl func_020769cc
    mov r0, r5
    bl func_0207879c
    cmp r0, #0x0
    bne .L_02151860
    mov r0, r7
    blx func_02071f10
    mov r1, r0
    mov r0, r5
    bl func_02078814
    cmp r0, #0x0
    movne r6, #0x1
    bne .L_02151870
.L_02151860:
    add r7, r7, #0x1
.L_02151864:
    blx func_02071f54
    cmp r7, r0
    blo .L_0215181c
.L_02151870:
    mov r0, r5
    bl func_0207698c
    mov r0, r4
    bl func_020763e0
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov007_021517f4

    .global func_ov007_02151888
    arm_func_start func_ov007_02151888
func_ov007_02151888: ; 0x02151888
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x2c
    mov r6, #0x0
    mov r5, r0
    mov r10, r1
    mov r9, r2
    mov r8, r3
    mov r7, r6
    blx func_02072070
    mov r4, r0
    mov r0, r5
    blx func_02072050
    mov r5, r0
    blx func_020725ac
    cmp r0, #0x0
    beq .L_02151914
    mov r0, r5
    mov r1, r10
    blx func_020725bc
    cmp r0, #0x0
    beq .L_02151914
    mov r0, r10
    bl func_ov010_021a2254
    cmp r0, #0x0
    bne .L_02151914
    add r1, sp, #0x20
    add r0, r5, #0x40
    mov r2, #0xc
    bl func_02051890
    add r1, sp, #0x0
    add r0, r5, #0x14
    mov r2, #0x20
    add r6, sp, #0x20
    bl func_02051890
    add r7, sp, #0x0
.L_02151914:
    mov r0, r9
    mov r1, r4
    mov r2, #0x5c
    bl func_02051890
    mov r0, r10
    mov r1, r5
    mov r2, #0x4c
    bl func_02051890
    cmp r6, #0x0
    beq .L_0215194c
    mov r0, r6
    add r1, r5, #0x40
    mov r2, #0xc
    bl func_02051890
.L_0215194c:
    cmp r7, #0x0
    beq .L_02151964
    mov r0, r5
    mov r1, r7
    mov r2, #0x0
    blx func_0207260c
.L_02151964:
    mov r0, r5
    mov r1, r8
    mov r2, #0x1
    blx func_0207267c
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
    arm_func_end func_ov007_02151888

    .global func_ov007_0215197c
    thumb_func_start func_ov007_0215197c
func_ov007_0215197c: ; 0x0215197c
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x60
    mov r0, #0x71
    ldr r1, .L_02151d18
    ldr r2, .L_02151d1c
    ldr r3, .L_02151d20
    lsl r0, r0, #0x4
    blx func_0201a21c
    mov r2, #0x71
    mov r1, #0x0
    lsl r2, r2, #0x4
    mov r5, r0
    blx func_020517fc
    blx func_020310f4
    ldr r1, .L_02151d24
    str r0, [r5, #0x4]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_02151d28
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_02151d2c
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r5, #0x4]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    str r0, [r5, #0x10]
    mov r4, #0x0
    b .L_021519de
.L_021519ce:
    mov r0, r4
    bl func_02072050
    mov r1, r0
    add r0, #0x40
    blx func_ov010_021a2340
    add r4, r4, #0x1
.L_021519de:
    bl func_020720d8
    cmp r4, r0
    blo .L_021519ce
    mov r0, r5
    bl func_ov007_02152100
    mov r1, #0x40
    mov r0, #0x20
    lsl r2, r1, #0x7
    mov r3, #0x1
    blx func_ov007_02150678
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    str r0, [r5, #0x0]
    blx func_0203b404
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_02150e14
    ldr r7, .L_02151d30
    mov r4, #0x0
.L_02151a18:
    ldrsb r0, [r7, r4]
    blx func_0203b414
    mov r2, r0
    add r2, #0x88
    ldr r0, .L_02151d34
    lsl r6, r4, #0x2
    ldr r1, .L_02151d38
    ldr r0, [r0, r6]
    ldr r1, [r1, r6]
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x18]
    cmp r4, #0x2
    blt .L_02151a18
    mov r0, #0x2
    blx func_0203b414
    mov r1, r0
    ldr r0, .L_02151d3c
    add r1, #0x88
    ldr r0, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150f54
    ldr r7, .L_02151d40
    str r0, [r5, #0x28]
    mov r4, #0x0
.L_02151a56:
    lsl r6, r4, #0x2
    ldr r0, [r7, r6]
    mov r1, #0x0
    bl func_020101f4
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x20]
    cmp r4, #0x2
    blt .L_02151a56
    blx func_0203b404
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_02150e78
    mov r0, #0x81
    lsl r0, r0, #0x10
    blx func_02035e88
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_02151a8c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02151a8c:
    ldr r0, [r4, #0x38]
    mov r1, #0x1
    str r0, [r5, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x50]
    blx r2
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x50]
    blx r1
    blx func_ov007_02150eb4
    ldr r1, .L_02151d44
    ldr r2, .L_02151d48
    ldr r3, .L_02151d4c
    mov r0, #0xcc
    blx func_0201a21c
    mov r4, r0
    beq .L_02151ac4
    ldr r1, .L_02151d50
    ldr r2, .L_02151d54
    mov r3, #0x0
    bl func_ov012_021af26c
    mov r4, r0
.L_02151ac4:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02151ad2
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02151ad2:
    ldr r1, .L_02151d58
    ldr r2, .L_02151d5c
    ldr r3, .L_02151d60
    mov r0, #0xbc
    ldr r6, [r4, #0x18]
    blx func_0201a21c
    mov r4, r0
    beq .L_02151aee
    ldr r1, .L_02151d64
    mov r2, #0x0
    bl func_ov012_021af358
    mov r4, r0
.L_02151aee:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02151afc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02151afc:
    ldr r3, [r4, #0x18]
    mov r1, #0x10
    ldr r2, [r3, #0x4]
    mov r0, r2
    add r0, #0x94
    str r1, [r0, #0x0]
    add r2, #0x98
    str r1, [r2, #0x0]
    ldr r0, [r3, #0x4]
    mov r1, #0x13
    add r0, #0x9c
    str r1, [r0, #0x0]
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r6
    bl func_ov012_021b3b7c
    ldr r0, .L_02151d68
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r1, .L_02151d6c
    mov r0, r6
    blx func_ov007_0214f898
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    add r0, #0x14
    ldr r4, [r0, #0x18]
    cmp r4, #0x0
    bne .L_02151b40
    ldr r0, [r0, #0xc]
    blx func_02036430
    mov r4, r0
.L_02151b40:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02151b4e
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02151b4e:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x18]
    mov r1, #0x11
    mov r2, #0x4
    mov r3, #0x5
    blx func_0206ad90
    mov r1, #0x1e
    lsl r1, r1, #0x4
    str r0, [r5, r1]
    ldr r1, [r5, r1]
    mov r0, #0x0
    strh r0, [r1, #0x18]
    ldr r0, .L_02151d70
    strh r0, [r1, #0x16]
    mov r0, #0x1e
    strb r0, [r1, #0x1a]
    mov r0, #0x1
    strb r0, [r1, #0x1c]
    strb r0, [r1, #0x1b]
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b44
    str r0, [r5, #0x30]
    blx func_0203b404
    mov r3, r0
    add r3, #0x88
    mov r1, #0x81
    ldr r0, [r5, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    blx func_0203b3e4
    mov r1, r0
    add r1, #0x88
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02151d74
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x40]
    ldr r1, [r5, #0x30]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_02151d78
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    str r4, [r5, #0x34]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_02151d7c
    add r0, sp, #0x58
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_02151d80
    add r0, sp, #0x50
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, .L_02151d84
    add r1, sp, #0x4c
    str r0, [sp, #0x48]
    mov r0, #0x0
    str r0, [sp, #0x4c]
    mov r0, r4
    add r2, sp, #0x48
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x10
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x40]
    str r0, [sp, #0x44]
    mov r0, r4
    add r1, sp, #0x44
    add r2, sp, #0x40
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x18
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r2, .L_02151d88
    ldr r3, [sp, #0x5c]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x38]
    str r0, [sp, #0x3c]
    mov r0, r4
    add r1, sp, #0x3c
    add r2, sp, #0x38
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r2, .L_02151d8c
    mov r1, #0x10
    bl func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_02151d90
    mov r1, #0x10
    bl func_ov012_021b6760
    ldr r1, .L_02151d68
    b .L_02151d94
    mov r8, r8
.L_02151d18: .word data_ov007_02169a78
.L_02151d1c: .word data_ov007_02169a18
.L_02151d20: .word 0x122
.L_02151d24: .word data_02093c04
.L_02151d28: .word data_020a0e80
.L_02151d2c: .word data_020a16c0
.L_02151d30: .word data_ov007_02168aa4
.L_02151d34: .word data_ov007_021698f8
.L_02151d38: .word data_ov007_02169900
.L_02151d3c: .word data_ov007_021698cc
.L_02151d40: .word data_ov007_021698d0
.L_02151d44: .word data_ov007_02169644
.L_02151d48: .word data_ov007_0216997c
.L_02151d4c: .word 0x1de
.L_02151d50: .word func_ov007_02152918
.L_02151d54: .word func_ov007_02152974
.L_02151d58: .word data_ov007_021699c4
.L_02151d5c: .word data_ov007_02169994
.L_02151d60: .word 0x212
.L_02151d64: .word func_ov007_02152794
.L_02151d68: .word data_ov012_021d5154
.L_02151d6c: .word 0x31305053
.L_02151d70: .word 0x8df
.L_02151d74: .word func_ov007_02152554
.L_02151d78: .word 0x101
.L_02151d7c: .word data_ov007_02169a90
.L_02151d80: .word data_ov007_02169a9c
.L_02151d84: .word 0xfff40000
.L_02151d88: .word 0x494c
.L_02151d8c: .word func_ov007_021524d8
.L_02151d90: .word func_ov007_02152528
.L_02151d94:
    mov r0, r4
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x44]
    ldr r7, [r5, #0x18]
    cmp r7, #0x0
    beq .L_02151dda
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r6
    mov r1, r7
    blx func_ov007_0214f48c
.L_02151dda:
    ldr r0, .L_021520d4
    ldr r1, .L_021520d8
    ldr r6, [r0, #0x0]
    mov r0, #0x19
    lsl r0, r0, #0x4
    mov r3, r0
    ldr r2, .L_021520dc
    sub r3, #0x37
    ldr r4, [r4, #0x4]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_02151dfe
    ldr r3, .L_021520e0
    mov r1, r4
    mov r2, r6
    bl func_ov012_021ae114
.L_02151dfe:
    blx func_ov007_0214f340
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    bl func_ov012_021b6214
    mov r0, #0xd8
    mov r1, r0
    ldr r3, [r6, #0x4]
    add r1, #0x98
    str r0, [r3, r1]
    mov r1, r0
    mov r2, #0x20
    add r1, #0x9c
    str r2, [r3, r1]
    ldr r1, [r6, #0x4]
    mov r2, #0x5
    add r0, #0xa8
    str r2, [r1, r0]
    ldr r1, [r5, #0x44]
    mov r0, r6
    blx func_ov007_02152468
    mov r0, #0x1
    lsl r0, r0, #0x10
    str r0, [sp, #0x24]
    lsr r0, r0, #0x1
    str r0, [sp, #0x20]
    mov r0, r6
    add r1, sp, #0x20
    add r2, sp, #0x24
    blx func_ov007_0214f218
    mov r0, r6
    mov r1, #0x0
    blx func_ov007_021524a0
    mov r2, #0x45
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    lsl r2, r2, #0x2
    strb r1, [r0, r2]
    ldr r0, [r6, #0x4]
    add r2, #0x94
    ldr r3, [r0, #0x0]
    ldr r3, [r3, r2]
    blx r3
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r2, #0x4f
    ldr r1, [r6, #0x4]
    mov r0, #0x1
    lsl r2, r2, #0x2
    str r0, [r1, r2]
    ldr r3, [r6, #0x4]
    add r1, r2, #0x4
    strb r0, [r3, r1]
    add r1, r2, #0x5
    ldr r3, [r6, #0x4]
    add r2, #0x8
    strb r0, [r3, r1]
    ldr r1, [r6, #0x4]
    mov r7, #0x0
    str r0, [r1, r2]
    str r6, [r5, #0x48]
.L_02151e88:
    ldr r0, [r6, #0x4]
    bl func_ov012_021ae3a4
    blx func_ov007_0214f340
    lsl r1, r7, #0x2
    add r1, r5, r1
    mov r4, r0
    str r1, [sp, #0x4]
    str r4, [r1, #0x4c]
    mov r1, #0x0
    blx func_ov007_021524a0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r1, .L_021520d4
    mov r0, r4
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r4, r0
    mov r0, #0x2
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_02150e78
    ldr r0, [r5, #0x28]
    ldr r0, [r0, #0x4]
    blx func_02032a4c
    blx func_ov007_0214f340
    ldr r2, [r0, #0x4]
    ldr r1, .L_021520e4
    lsl r3, r7, #0x1e
    str r1, [r2, #0x54]
    lsr r2, r7, #0x1f
    sub r3, r3, r2
    mov r1, #0x1e
    ror r3, r1
    add r1, r2, r3
    str r0, [sp, #0x8]
    blx func_ov007_021524c8
    mov r0, #0x31
    lsl r0, r0, #0xe
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x8]
    add r1, sp, #0x28
    blx func_ov007_0214f27c
    ldr r0, [sp, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [sp, #0x8]
    mov r1, r4
    blx func_ov007_02152468
    ldr r1, [sp, #0x8]
    mov r0, r4
    blx func_ov007_0214f48c
    blx func_ov007_02150eb4
    mov r0, #0x31
    lsl r0, r0, #0xe
    str r0, [sp, #0x2c]
    mov r0, r4
    add r1, sp, #0x2c
    blx func_ov007_0214f27c
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    lsl r0, r0, #0x2
    str r7, [r1, r0]
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, #0xac
    strb r0, [r1, #0x0]
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x8
    mov r3, #0xa0
    blx func_ov007_021510f0
    ldr r2, [r0, #0x4]
    ldr r1, .L_021520e8
    str r0, [sp, #0xc]
    str r1, [r2, #0x54]
    mov r1, #0x11
    lsl r1, r1, #0xc
    str r1, [sp, #0x34]
    mov r1, #0xb
    lsl r1, r1, #0xc
    str r1, [sp, #0x30]
    add r1, sp, #0x30
    add r2, sp, #0x34
    blx func_ov007_0214f218
    ldr r0, [sp, #0xc]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [sp, #0xc]
    mov r1, r4
    blx func_ov007_02152468
    ldr r1, [sp, #0xc]
    mov r0, r4
    blx func_ov007_0214f48c
    mov r0, #0x45
    ldr r1, [sp, #0x4]
    lsl r0, r0, #0x2
    str r4, [r1, r0]
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_021520ec
    add r0, sp, #0x18
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_ov012_021b3fc4
    ldr r1, .L_021520f0
    ldr r2, .L_021520f4
    mov r0, #0x0
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, .L_021520f0
    blx func_ov007_0214f474
    str r0, [sp, #0x10]
    ldr r0, .L_021520f0
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r2, [sp, #0x10]
    bl func_ov012_021b5900
    ldr r0, [r4, #0x4]
    ldr r2, .L_021520f8
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x7
    mov r1, r0
    bl func_ov012_021b4104
    add r7, r7, #0x1
    cmp r7, #0x32
    bge .L_02152044
    b .L_02151e88
.L_02152044:
    mov r0, r5
    mov r1, #0x0
    bl func_ov007_0215214c
    mov r2, #0x1
    mov r0, #0xf
    mov r1, #0x0
    subs r3, r2, #0x2
    bl func_ov012_021bcf1c
    mov r1, #0x77
    lsl r1, r1, #0x2
    str r0, [r5, r1]
    ldr r0, [r5, r1]
    mov r1, #0x73
    mov r2, #0x0
    bl func_ov012_021bd730
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    blx func_ov012_021ba49c
    mov r1, #0x79
    lsl r1, r1, #0x2
    str r0, [r5, r1]
    mov r0, #0x2
    mov r1, #0x1
    blx func_02073ebc
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x8]
    ldr r1, .L_021520fc
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    ldr r1, [r5, #0x8]
    lsl r0, r0, #0x12
    str r0, [sp, #0x14]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x14
    ldr r2, [r0, #0x0]
    add r2, #0xa0
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x34]
    mov r2, #0x52
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    mov r1, #0x10
    ldr r3, [r3, r2]
    blx r3
    ldr r0, [r5, #0x4]
    add sp, #0x60
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_021520d4: .word data_ov012_021d5154
.L_021520d8: .word data_ov007_021699e4
.L_021520dc: .word data_ov007_02169984
.L_021520e0: .word func_ov007_02152408
.L_021520e4: .word 0x67625053
.L_021520e8: .word 0x6d625053
.L_021520ec: .word data_ov007_02169a9c
.L_021520f0: .word data_ov007_021698f0
.L_021520f4: .word data_02093c8c
.L_021520f8: .word func_ov007_021525ac
.L_021520fc: .word func_ov007_02152238
    thumb_func_end func_ov007_0215197c

    .global func_ov007_02152100
    thumb_func_start func_ov007_02152100
func_ov007_02152100: ; 0x02152100
    push {r3, r4, r5, r6, r7, lr}
    mov r5, #0x0
    mov r6, r0
    mov r4, r5
    mov r7, #0xc
.L_0215210a:
    bl func_02070ff4
    mov r1, r4
    mul r1, r7
    add r0, r0, r1
    blx func_ov010_021a2934
    cmp r0, #0x0
    beq .L_02152128
    lsl r0, r5, #0x2
    add r1, r6, r0
    mov r0, #0x19
    lsl r0, r0, #0x6
    add r5, r5, #0x1
    str r4, [r1, r0]
.L_02152128:
    add r4, r4, #0x1
    cmp r4, #0x32
    blt .L_0215210a
    ldr r0, .L_02152148
    mov r2, #0x0
    str r5, [r6, r0]
    mvn r2, r2
    sub r0, #0xc8
    b .L_02152142
.L_0215213a:
    lsl r1, r5, #0x2
    add r1, r6, r1
    str r2, [r1, r0]
    add r5, r5, #0x1
.L_02152142:
    cmp r5, #0x32
    blt .L_0215213a
    pop {r3, r4, r5, r6, r7, pc}
.L_02152148: .word 0x708
    thumb_func_end func_ov007_02152100

    .global func_ov007_0215214c
    thumb_func_start func_ov007_0215214c
func_ov007_0215214c: ; 0x0215214c
    push {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r4, r1
    mov r7, #0x1
    ldr r6, .L_02152234
    b .L_02152174
.L_02152158:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x4c]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    bl func_ov007_02152a40
    add r4, r4, #0x1
.L_02152174:
    ldr r0, [r5, r6]
    cmp r4, r0
    blt .L_02152158
    cmp r4, #0x5
    bgt .L_02152190
    ldr r0, [r5, #0x48]
    mov r3, #0x1a
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r6, [r0, #0x0]
    lsl r3, r3, #0x4
    ldr r6, [r6, r3]
    mov r2, r1
    blx r6
.L_02152190:
    ldr r0, [r5, #0x48]
    mov r1, #0x67
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    cmp r0, #0x0
    beq .L_021521c8
    ldr r0, [r5, #0x48]
    mov r1, #0x67
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    add r0, r0, #0x5
    cmp r0, r4
    bls .L_021521c8
    ldr r0, [r5, #0x48]
    mov r3, #0x1a
    ldr r0, [r0, #0x4]
    lsl r3, r3, #0x4
    ldr r6, [r0, #0x0]
    subs r1, r4, #0x5
    ldr r6, [r6, r3]
    mov r2, #0x0
    blx r6
.L_021521c8:
    cmp r4, #0x5
    bge .L_021521f0
    mov r6, #0x1
    b .L_021521ec
.L_021521d0:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x4c]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    bl func_ov007_02152a40
    add r4, r4, #0x1
.L_021521ec:
    cmp r4, #0x5
    blt .L_021521d0
.L_021521f0:
    mov r6, #0x0
    b .L_02152208
.L_021521f4:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x4c]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    add r4, r4, #0x1
.L_02152208:
    cmp r4, #0x32
    blt .L_021521f4
    ldr r0, [r5, #0x48]
    mov r1, #0x19
    ldr r4, [r0, #0x4]
    lsl r1, r1, #0x4
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    mov r0, r4
    mov r1, #0x5e
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    blx r2
    ldr r0, [r4, #0x64]
    mov r1, #0x1
    add r0, #0x40
    strb r1, [r0, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_02152234: .word 0x708
    thumb_func_end func_ov007_0215214c

    .global func_ov007_02152238
    thumb_func_start func_ov007_02152238
func_ov007_02152238: ; 0x02152238
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_0215224e
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_020282f4
.L_0215224e:
    pop {r4, pc}
    thumb_func_end func_ov007_02152238

    .global func_ov007_02152250
    arm_func_start func_ov007_02152250
func_ov007_02152250: ; 0x02152250
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_021523d0
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    blx r0
    ldr r0, .L_021523d0
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021523d0
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021523d0
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_021523d0
    b .L_021522a8
.L_021522a0:
    ldr r0, [r5, #0x0]
    blx r0
.L_021522a8:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_021522a0
    bl func_020735e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, .L_021523d4
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x1e4]
    cmp r0, #0x0
    beq .L_021522e4
    bl func_ov012_021bab64
.L_021522e4:
    ldr r0, [r4, #0x1dc]
    cmp r0, #0x0
    beq .L_021522f4
    blx func_ov012_021bd500
.L_021522f4:
    ldr r0, [r4, #0x1e0]
    cmp r0, #0x0
    beq .L_02152304
    bl func_0206ae98
.L_02152304:
    bl func_ov007_02150f1c
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_02152318
    bl func_02034d7c
.L_02152318:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_02152328
    bl func_02034d7c
.L_02152328:
    mov r5, #0x0
.L_0215232c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_02152348
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02152348:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215232c
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215236c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215236c:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02152384
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02152384:
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_021523d8
    ldr r2, .L_021523dc
    ldr r3, [r1, #0x0]
    ldr r0, .L_021523e0
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_021523d0: .word data_020a0e18
.L_021523d4: .word data_ov012_021d5154
.L_021523d8: .word data_02093c04
.L_021523dc: .word data_020a16c0
.L_021523e0: .word data_020a0e80
    arm_func_end func_ov007_02152250

    .global func_ov007_021523e4
    arm_func_start func_ov007_021523e4
func_ov007_021523e4: ; 0x021523e4
    stmdb sp!, {r4, lr}
    mov r2, #0x0
    mov r4, r0
    bl func_02014604
    ldr r1, .L_02152404
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02152404: .word data_020958dc
    arm_func_end func_ov007_021523e4

    .global func_ov007_02152408
    arm_func_start func_ov007_02152408
func_ov007_02152408: ; 0x02152408
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02152454
    mov r5, r0
    ldr r2, .L_02152458
    ldr r3, .L_0215245c
    mov r0, #0x44
    bl func_0201a21c
    movs r4, r0
    beq .L_0215244c
    mov r1, r5
    bl func_ov007_021523e4
    ldr r0, .L_02152460
    mov r1, #0x1
    str r0, [r4, #0x0]
    ldr r0, .L_02152464
    strb r1, [r4, #0x40]
    str r0, [r4, #0x0]
.L_0215244c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02152454: .word data_ov007_021699d4
.L_02152458: .word data_ov007_021699f4
.L_0215245c: .word 0x14e
.L_02152460: .word data_ov012_021d2a24
.L_02152464: .word data_ov012_021d080c
    arm_func_end func_ov007_02152408

    .global func_ov007_02152468
    arm_func_start func_ov007_02152468
func_ov007_02152468: ; 0x02152468
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215248c
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
.L_0215248c:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02152468

    .global func_ov007_021524a0
    arm_func_start func_ov007_021524a0
func_ov007_021524a0: ; 0x021524a0
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_021524bc
    mov r1, #0x0
    blx func_ov012_021b5898
    ldmia sp!, {r3, pc}
.L_021524bc:
    ldr r1, [r1, #0x4]
    blx func_ov012_021b5898
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_021524a0

    .global func_ov007_021524c8
    arm_func_start func_ov007_021524c8
func_ov007_021524c8: ; 0x021524c8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    strh r1, [r0, #0x4a]
    bx lr
    arm_func_end func_ov007_021524c8

    .global func_ov007_021524d8
    thumb_func_start func_ov007_021524d8
func_ov007_021524d8: ; 0x021524d8
    push {r4, r5, r6, lr}
    mov r5, r0
    mov r4, #0x0
    mov r6, #0x1
    b .L_02152516
.L_021524e2:
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xa8
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x0
    beq .L_02152502
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    add r2, #0xc0
    ldr r2, [r2, #0x0]
    blx r2
    blx func_ov007_0214f340
    b .L_02152504
.L_02152502:
    mov r0, r5
.L_02152504:
    cmp r4, #0x0
    beq .L_02152514
    ldr r0, [r0, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_02152514:
    add r4, r4, #0x1
.L_02152516:
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xac
    ldr r1, [r1, #0x0]
    blx r1
    cmp r4, r0
    blo .L_021524e2
    pop {r4, r5, r6, pc}
    thumb_func_end func_ov007_021524d8

    .byte 0x00, 0x00

    .global func_ov007_02152528
    thumb_func_start func_ov007_02152528
func_ov007_02152528: ; 0x02152528
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_ov012_021b65cc
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq .L_02152550
    ldr r0, [r0, #0x4]
    mov r2, #0x66
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x0
    blx r3
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
.L_02152550:
    pop {r4, pc}
    thumb_func_end func_ov007_02152528

    .byte 0x00, 0x00

    .global func_ov007_02152554
    thumb_func_start func_ov007_02152554
func_ov007_02152554: ; 0x02152554
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_021525a4
    cmp r0, r1
    bne .L_021525a2
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_021525a2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r1, #0x13
    blx func_ov007_0214dd60
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_021525a8
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
.L_021525a2:
    pop {r3, r4, r5, pc}
.L_021525a4: .word 0x80011001
.L_021525a8: .word func_ov007_02152250
    thumb_func_end func_ov007_02152554

    .global func_ov007_021525ac
    arm_func_start func_ov007_021525ac
func_ov007_021525ac: ; 0x021525ac
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r6, r0
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r2, [r6, #0x4]
    ldr r1, [r1, #0x8]
    ldr r4, [r2, #0x10]
    blx r1
    ldr r1, .L_0215278c
    cmp r0, r1
    bne .L_02152784
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x3
    beq .L_02152664
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x124]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x4c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrb r0, [r0, #0x10]
    mov r1, r0, lsl #0x18
    movs r1, r1, lsr #0x1f
    beq .L_02152664
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_02152664
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x194]
    blx r1
    ldr r1, [r6, #0x4]
    ldr r1, [r1, #0x124]
    cmp r1, r0
    beq .L_02152664
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x198]
    blx r2
.L_02152664:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    beq .L_02152784
    ldr r0, [r6, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r0, #0x124]
    add r0, r4, r0, lsl #0x2
    ldr r5, [r0, #0x640]
    cmp r5, #0x0
    movlt r6, #0x0
    blt .L_021526a8
    blx func_02070ff4
    mov r1, #0xc
    mla r6, r5, r1, r0
.L_021526a8:
    cmp r6, #0x0
    beq .L_021526c0
    mov r0, r6
    bl func_ov010_021a2934
    cmp r0, #0x0
    bne .L_021526d0
.L_021526c0:
    mov r0, #0x78
    mov r1, #0x2
    bl func_0207342c
    b .L_02152784
.L_021526d0:
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x1e4]
    mov r3, r2
    mov r1, #0x37
    bl func_ov012_021bac28
    ldr r5, .L_02152790
    b .L_0215271c
.L_02152714:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215271c:
    ldr r0, [r4, #0x1e4]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02152714
    ldr r0, [r4, #0x1e4]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    beq .L_02152758
    mov r0, r6
    bl func_ov010_021a2958
    mov r0, r4
    blx func_ov007_02152100
    mov r0, r4
    mov r1, #0x0
    blx func_ov007_0215214c
.L_02152758:
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
.L_02152784:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0215278c: .word 0x80011000
.L_02152790: .word data_020a0e18
    arm_func_end func_ov007_021525ac

    .global func_ov007_02152794
    thumb_func_start func_ov007_02152794
func_ov007_02152794: ; 0x02152794
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r0, [r5, #0x4]
    add r0, #0xac
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    tst r0, r1
    bne .L_02152898
    ldr r1, .L_0215289c
    ldr r2, .L_021528a0
    mov r0, #0x0
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r5
    blx func_02020e98
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x1
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0x13
    lsl r1, r1, #0xc
    str r1, [sp, #0x10]
    mov r1, #0xe5
    lsl r1, r1, #0xc
    str r1, [sp, #0x14]
    mov r4, r0
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x5
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0x8d
    lsl r1, r1, #0xc
    str r1, [sp, #0x8]
    mov r1, #0xe5
    lsl r1, r1, #0xc
    str r1, [sp, #0xc]
    mov r4, r0
    add r1, sp, #0xc
    add r2, sp, #0x8
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    ldr r1, [r5, #0x4]
    mov r6, #0x1
    mov r0, r1
    add r0, #0xac
    ldr r0, [r0, #0x0]
    and r0, r6
    cmp r0, #0x1
    beq .L_02152846
    mov r6, #0x0
.L_02152846:
    add r1, #0x94
    ldr r7, [r1, #0x0]
    ldr r1, .L_021528a4
    ldr r2, .L_021528a8
    ldr r3, .L_021528ac
    mov r0, #0xb4
    blx func_0201a21c
    mov r4, r0
    beq .L_0215286e
    ldr r1, .L_021528b0
    mov r2, r7
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r1, [r5, #0x4]
    mov r3, r6
    bl func_ov012_021af494
    mov r4, r0
.L_0215286e:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215287c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215287c:
    ldr r4, [r4, #0x18]
    ldr r1, .L_021528b4
    ldr r2, .L_021528a0
    mov r0, #0x0
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, [r5, #0x4]
    ldr r1, [r4, #0x4]
    bl func_ov012_021b8efc
.L_02152898:
    add sp, #0x18
    pop {r3, r4, r5, r6, r7, pc}
.L_0215289c: .word data_ov007_021698e0
.L_021528a0: .word data_02093c8c
.L_021528a4: .word data_ov007_021699b4
.L_021528a8: .word data_ov007_0216998c
.L_021528ac: .word 0x226
.L_021528b0: .word func_ov007_021528b8
.L_021528b4: .word data_ov007_021698d8
    thumb_func_end func_ov007_02152794

    .global func_ov007_021528b8
    thumb_func_start func_ov007_021528b8
func_ov007_021528b8: ; 0x021528b8
    push {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xac
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x1
    bne .L_0215290a
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x3
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0x1
    lsl r1, r1, #0x10
    str r1, [sp, #0x0]
    mov r1, #0xe5
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    mov r4, r0
    add r1, sp, #0x4
    add r2, sp, #0x0
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
.L_0215290a:
    ldr r0, [r5, #0x4]
    mov r1, #0x20
    add r0, #0x98
    str r1, [r0, #0x0]
    add sp, #0x8
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_021528b8

    .byte 0x00, 0x00

    .global func_ov007_02152918
    thumb_func_start func_ov007_02152918
func_ov007_02152918: ; 0x02152918
    push {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x7
    mov r3, #0x7f
    blx func_ov007_021510f0
    mov r1, #0x11
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    mov r1, #0x69
    lsl r1, r1, #0xc
    str r1, [sp, #0x8]
    mov r4, r0
    add r1, sp, #0x8
    add r2, sp, #0x4
    blx func_ov007_0214f218
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    mov r0, #0x7f
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, r5
    add r1, sp, #0x0
    blx func_ov007_0214f27c
    ldr r0, [r5, #0x4]
    ldr r1, .L_02152970
    ldr r0, [r0, #0x50]
    str r1, [r0, #0x10]
    mov r1, #0x1
    blx func_ov007_0214f240
    add sp, #0xc
    pop {r4, r5, pc}
.L_02152970: .word 0xfff40000
    thumb_func_end func_ov007_02152918

    .global func_ov007_02152974
    thumb_func_start func_ov007_02152974
func_ov007_02152974: ; 0x02152974
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r5, [r6, #0x4]
    mov r7, r1
    ldr r1, .L_021529e0
    add r5, #0xa0
    blx func_ov007_0214f898
    mov r4, r0
    mov r0, r5
    blx func_ov007_0214f45c
    cmp r0, #0x0
    beq .L_0215299c
    mov r0, r5
    blx func_ov007_0214f474
    cmp r0, #0x0
    bne .L_021529aa
.L_0215299c:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_021529dc
.L_021529aa:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    cmp r7, #0x0
    bne .L_021529c2
    mov r0, #0x78
    mov r1, #0x3
    blx func_0207342c
.L_021529c2:
    mov r0, #0x2
    ldrsh r0, [r5, r0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, #0x0
    ldrsh r0, [r5, r0]
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r6
    blx func_ov007_0214f218
.L_021529dc:
    add sp, #0x8
    pop {r3, r4, r5, r6, r7, pc}
.L_021529e0: .word 0x31305053
    thumb_func_end func_ov007_02152974

    .global func_ov007_021529e4
    thumb_func_start func_ov007_021529e4
func_ov007_021529e4: ; 0x021529e4
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r4, r1
    mov r7, r2
    mov r5, r3
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, r4
    mov r3, #0xa0
    blx func_ov007_021510f0
    mov r4, r0
    ldr r1, [r4, #0x4]
    add r2, sp, #0x0
    str r7, [r1, #0x54]
    ldr r1, [r5, #0x4]
    lsl r1, r1, #0xc
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x0]
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    add r1, sp, #0x4
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    mov r1, r6
    blx func_ov007_02152468
    mov r0, r6
    mov r1, r4
    blx func_ov007_0214f48c
    add sp, #0x8
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_021529e4

    .byte 0x00, 0x00

    .global func_ov007_02152a40
    thumb_func_start func_ov007_02152a40
func_ov007_02152a40: ; 0x02152a40
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x84
    lsl r5, r1, #0x2
    str r1, [sp, #0x10]
    add r1, r0, r5
    str r0, [sp, #0xc]
    mov r0, #0x45
    lsl r0, r0, #0x2
    ldr r7, [r1, r0]
    ldr r4, [r1, #0x4c]
    ldr r1, .L_02152d90
    mov r0, r7
    blx func_ov007_0214f898
    mov r6, r0
    ldr r1, .L_02152d94
    mov r0, r7
    blx func_ov007_0214f898
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0xc]
    add r1, r0, r5
    mov r0, #0x19
    lsl r0, r0, #0x6
    ldr r5, [r1, r0]
    mov r0, #0x0
    str r0, [sp, #0x38]
    str r0, [sp, #0x34]
    cmp r5, #0x0
    blt .L_02152a96
    add r0, sp, #0x68
    str r0, [sp, #0x0]
    add r0, sp, #0x64
    str r0, [sp, #0x4]
    add r0, sp, #0x60
    str r0, [sp, #0x8]
    mov r0, r5
    add r1, sp, #0x74
    add r2, sp, #0x70
    add r3, sp, #0x6c
    bl func_020710f8
    b .L_02152aa2
.L_02152a96:
    str r0, [sp, #0x60]
    str r0, [sp, #0x64]
    str r0, [sp, #0x68]
    str r0, [sp, #0x6c]
    str r0, [sp, #0x70]
    str r0, [sp, #0x74]
.L_02152aa2:
    cmp r5, #0x0
    blt .L_02152ab2
    bl func_02070ff4
    mov r1, #0xc
    mul r1, r5
    add r7, r0, r1
    b .L_02152ab4
.L_02152ab2:
    mov r7, #0x0
.L_02152ab4:
    cmp r7, #0x0
    beq .L_02152ac0
    mov r0, r7
    blx func_ov010_021a2934
    b .L_02152ac2
.L_02152ac0:
    mov r0, #0x0
.L_02152ac2:
    cmp r0, #0x3
    bhi .L_02152b44
    add r0, r0, r0
    add r0, pc
    ldrh r0, [r0, #0x6]
    lsl r0, r0, #0x10
    asr r0, r0, #0x10
    add pc, r0
.L_02152ad2: ; jump table
    .short .L_02152ada - .L_02152ad2 - 2
    .short .L_02152aea - .L_02152ad2 - 2
    .short .L_02152af8 - .L_02152ad2 - 2
    .short .L_02152b02 - .L_02152ad2 - 2
.L_02152ada:
    mov r0, r6
    mov r1, #0x0
    blx func_ov007_021524c8
    mov r0, #0x0
    mvn r0, r0
    str r0, [sp, #0x38]
    b .L_02152b44
.L_02152aea:
    mov r0, r6
    mov r1, #0x2
    blx func_ov007_021524c8
    mov r0, #0x1
    str r0, [sp, #0x34]
    b .L_02152b44
.L_02152af8:
    mov r0, r6
    mov r1, #0x1
    blx func_ov007_021524c8
    b .L_02152b44
.L_02152b02:
    mov r0, r5
    blx func_ov010_021a26e0
    cmp r0, #0x0
    bne .L_02152b2e
    mov r0, #0x1
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x70]
    cmp r0, #0x1
    blt .L_02152b24
    cmp r0, #0xc
    bgt .L_02152b24
    mov r0, r6
    mov r1, #0x3
    blx func_ov007_021524c8
    b .L_02152b36
.L_02152b24:
    mov r0, r6
    mov r1, #0x2
    blx func_ov007_021524c8
    b .L_02152b36
.L_02152b2e:
    mov r0, r6
    mov r1, #0x1
    blx func_ov007_021524c8
.L_02152b36:
    mov r0, r7
    blx func_ov010_021a2940
    cmp r0, #0x0
    beq .L_02152b44
    mov r0, #0x1
    str r0, [sp, #0x38]
.L_02152b44:
    ldr r0, [sp, #0x34]
    mov r3, #0x0
    cmp r0, #0x0
    beq .L_02152b54
    mov r0, r5
    bl func_02071050
    mov r3, r0
.L_02152b54:
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    mov r2, r4
    bl func_ov007_02152e60
    ldr r1, .L_02152d98
    mov r0, r4
    bl func_ov007_02152f38
    ldr r1, .L_02152d9c
    mov r0, r4
    bl func_ov007_02152f38
    ldr r1, .L_02152da0
    mov r0, r4
    bl func_ov007_02152f38
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x64]
    mov r0, #0x4a
    ldrsh r0, [r1, r0]
    cmp r0, #0x1
    beq .L_02152b8e
    cmp r0, #0x2
    bne .L_02152b88
    b .L_02152d0c
.L_02152b88:
    cmp r0, #0x3
    beq .L_02152bcc
    b .L_02152df2
.L_02152b8e:
    mov r0, r5
    blx func_ov010_021a2728
    add r2, sp, #0x78
    blx func_ov010_0219c380
    ldr r1, .L_02152da0
    mov r0, r4
    bl func_ov007_02152f38
    mov r0, #0x91
    str r0, [sp, #0x58]
    mov r0, #0xf
    ldr r7, .L_02152da0
    str r0, [sp, #0x5c]
    mov r5, #0x0
    add r6, sp, #0x78
.L_02152bb0:
    ldrsb r1, [r6, r5]
    mov r0, r4
    mov r2, r7
    add r1, #0x1e
    add r3, sp, #0x58
    bl func_ov007_021529e4
    ldr r0, [sp, #0x58]
    add r5, r5, #0x1
    add r0, r0, #0x5
    str r0, [sp, #0x58]
    cmp r5, #0xc
    blt .L_02152bb0
    b .L_02152dfe
.L_02152bcc:
    ldr r0, [sp, #0x60]
    ldr r1, .L_02152d9c
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x64]
    ldr r7, [sp, #0x70]
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x68]
    ldr r6, [sp, #0x74]
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x6c]
    str r0, [sp, #0x30]
    mov r0, r4
    bl func_ov007_02152f38
    mov r0, #0x7d
    lsl r0, r0, #0x4
    add r0, r6, r0
    mov r1, #0x4
    add r2, sp, #0x4c
    blx func_ov007_02151668
    mov r0, #0x1a
    str r0, [sp, #0x50]
    mov r0, #0x1e
    str r0, [sp, #0x54]
    mov r6, #0x0
.L_02152c00:
    add r1, sp, #0x4c
    ldrsb r1, [r1, r6]
    ldr r2, .L_02152d9c
    mov r0, r4
    add r1, #0xa
    add r3, sp, #0x50
    bl func_ov007_021529e4
    ldr r0, [sp, #0x50]
    add r6, r6, #0x1
    add r0, r0, #0x6
    str r0, [sp, #0x50]
    cmp r6, #0x4
    blt .L_02152c00
    mov r0, r7
    mov r1, #0x2
    add r2, sp, #0x4c
    blx func_ov007_02151668
    mov r0, #0x35
    str r0, [sp, #0x50]
    mov r0, #0x1e
    str r0, [sp, #0x54]
    mov r6, #0x0
    add r7, sp, #0x4c
.L_02152c32:
    ldrsb r1, [r7, r6]
    ldr r2, .L_02152d9c
    mov r0, r4
    add r1, #0xa
    add r3, sp, #0x50
    bl func_ov007_021529e4
    ldr r0, [sp, #0x50]
    add r6, r6, #0x1
    add r0, r0, #0x6
    str r0, [sp, #0x50]
    cmp r6, #0x2
    blt .L_02152c32
    ldr r0, [sp, #0x30]
    mov r1, #0x2
    add r2, sp, #0x4c
    blx func_ov007_02151668
    mov r0, #0x44
    str r0, [sp, #0x50]
    mov r0, #0x1e
    str r0, [sp, #0x54]
    mov r6, #0x0
    add r7, sp, #0x4c
.L_02152c62:
    ldrsb r1, [r7, r6]
    ldr r2, .L_02152d9c
    mov r0, r4
    add r1, #0xa
    add r3, sp, #0x50
    bl func_ov007_021529e4
    ldr r0, [sp, #0x50]
    add r6, r6, #0x1
    add r0, r0, #0x6
    str r0, [sp, #0x50]
    cmp r6, #0x2
    blt .L_02152c62
    ldr r0, [sp, #0x2c]
    mov r1, #0x2
    add r2, sp, #0x4c
    blx func_ov007_02151668
    mov r0, #0x58
    str r0, [sp, #0x50]
    mov r0, #0x1e
    str r0, [sp, #0x54]
    mov r6, #0x0
    add r7, sp, #0x4c
.L_02152c92:
    ldrsb r1, [r7, r6]
    ldr r2, .L_02152d9c
    mov r0, r4
    add r1, #0xa
    add r3, sp, #0x50
    bl func_ov007_021529e4
    ldr r0, [sp, #0x50]
    add r6, r6, #0x1
    add r0, r0, #0x6
    str r0, [sp, #0x50]
    cmp r6, #0x2
    blt .L_02152c92
    ldr r0, [sp, #0x28]
    mov r1, #0x2
    add r2, sp, #0x4c
    blx func_ov007_02151668
    mov r0, #0x6b
    str r0, [sp, #0x50]
    mov r0, #0x1e
    str r0, [sp, #0x54]
    mov r6, #0x0
    add r7, sp, #0x4c
.L_02152cc2:
    ldrsb r1, [r7, r6]
    ldr r2, .L_02152d9c
    mov r0, r4
    add r1, #0xa
    add r3, sp, #0x50
    bl func_ov007_021529e4
    ldr r0, [sp, #0x50]
    add r6, r6, #0x1
    add r0, r0, #0x6
    str r0, [sp, #0x50]
    cmp r6, #0x2
    blt .L_02152cc2
    ldr r0, [sp, #0x24]
    mov r1, #0x2
    add r2, sp, #0x4c
    blx func_ov007_02151668
    mov r0, #0x7e
    str r0, [sp, #0x50]
    mov r0, #0x1e
    str r0, [sp, #0x54]
    mov r6, #0x0
    add r7, sp, #0x4c
.L_02152cf2:
    ldrsb r1, [r7, r6]
    ldr r2, .L_02152d9c
    mov r0, r4
    add r1, #0xa
    add r3, sp, #0x50
    bl func_ov007_021529e4
    ldr r0, [sp, #0x50]
    add r6, r6, #0x1
    add r0, r0, #0x6
    str r0, [sp, #0x50]
    cmp r6, #0x2
    blt .L_02152cf2
.L_02152d0c:
    mov r0, r5
    bl func_02071200
    str r0, [sp, #0x1c]
    mov r0, r5
    bl func_020711c0
    str r0, [sp, #0x20]
    ldr r1, .L_02152d98
    mov r0, r4
    bl func_ov007_02152f38
    mov r1, #0xfa
    ldr r0, [sp, #0x20]
    lsl r1, r1, #0x2
    cmp r0, r1
    blo .L_02152d34
    mov r6, #0x4
    mov r5, #0x8d
    b .L_02152d38
.L_02152d34:
    mov r6, #0x3
    mov r5, #0x91
.L_02152d38:
    ldr r0, [sp, #0x20]
    mov r1, r6
    add r2, sp, #0x40
    mov r7, #0x6
    blx func_ov007_02151668
    mov r0, #0x1
    str r0, [sp, #0x18]
    mov r0, #0x11
    str r5, [sp, #0x44]
    str r0, [sp, #0x48]
    mov r5, #0x0
    b .L_02152d7c
.L_02152d52:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bne .L_02152d60
    add r0, sp, #0x40
    ldrsb r0, [r0, r5]
    cmp r0, #0x0
    beq .L_02152d74
.L_02152d60:
    mov r0, #0x1
    str r0, [sp, #0x18]
    add r1, sp, #0x40
    ldrsb r1, [r1, r5]
    ldr r2, .L_02152d98
    mov r0, r4
    add r1, #0x14
    add r3, sp, #0x44
    bl func_ov007_021529e4
.L_02152d74:
    ldr r0, [sp, #0x44]
    add r5, r5, #0x1
    add r0, r0, r7
    str r0, [sp, #0x44]
.L_02152d7c:
    cmp r5, r6
    blt .L_02152d52
    mov r1, #0xfa
    ldr r0, [sp, #0x1c]
    lsl r1, r1, #0x2
    cmp r0, r1
    blo .L_02152da4
    mov r6, #0x4
    mov r5, #0xaf
    b .L_02152da8
.L_02152d90: .word 0x67625053
.L_02152d94: .word 0x6d625053
.L_02152d98: .word 0x6d665053
.L_02152d9c: .word 0x746d5053
.L_02152da0: .word 0x6b665053
.L_02152da4:
    mov r6, #0x3
    mov r5, #0xb3
.L_02152da8:
    ldr r0, [sp, #0x1c]
    mov r1, r6
    add r2, sp, #0x40
    mov r7, #0x6
    blx func_ov007_02151668
    mov r0, #0x1
    str r0, [sp, #0x14]
    mov r0, #0x11
    str r5, [sp, #0x44]
    str r0, [sp, #0x48]
    mov r5, #0x0
    b .L_02152dec
.L_02152dc2:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    bne .L_02152dd0
    add r0, sp, #0x40
    ldrsb r0, [r0, r5]
    cmp r0, #0x0
    beq .L_02152de4
.L_02152dd0:
    mov r0, #0x1
    str r0, [sp, #0x14]
    add r1, sp, #0x40
    ldrsb r1, [r1, r5]
    ldr r2, .L_02152e54
    mov r0, r4
    add r1, #0x14
    add r3, sp, #0x44
    bl func_ov007_021529e4
.L_02152de4:
    ldr r0, [sp, #0x44]
    add r5, r5, #0x1
    add r0, r0, r7
    str r0, [sp, #0x44]
.L_02152dec:
    cmp r5, r6
    blt .L_02152dc2
    b .L_02152dfe
.L_02152df2:
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    mov r2, r4
    mov r3, #0x0
    bl func_ov007_02152e60
.L_02152dfe:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    blt .L_02152e40
    ldr r0, [sp, #0x3c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    ble .L_02152e26
    ldr r0, [sp, #0x3c]
    ldr r1, .L_02152e58
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    b .L_02152e32
.L_02152e26:
    ldr r0, [sp, #0x3c]
    ldr r1, .L_02152e5c
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
.L_02152e32:
    ldr r0, [sp, #0x3c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    b .L_02152e4e
.L_02152e40:
    ldr r0, [sp, #0x3c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_02152e4e:
    add sp, #0x84
    pop {r4, r5, r6, r7, pc}
    mov r8, r8
.L_02152e54: .word 0x6d665053
.L_02152e58: .word 0x810008
.L_02152e5c: .word 0x810009
    thumb_func_end func_ov007_02152a40

    .global func_ov007_02152e60
    thumb_func_start func_ov007_02152e60
func_ov007_02152e60: ; 0x02152e60
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    str r1, [sp, #0x0]
    mov r5, r2
    mov r7, r0
    ldr r1, .L_02152f30
    mov r0, r5
    mov r6, r3
    blx func_ov007_0214f898
    mov r4, r0
    bne .L_02152eec
    blx func_0203b404
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_02150e78
    blx func_ov007_02150f0c
    ldr r0, [r0, #0x4]
    bl func_ov012_021c5fb4
    blx func_ov007_0214f340
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    add r2, #0xa8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r1, .L_02152f30
    ldr r0, [r4, #0x4]
    add r2, sp, #0x8
    str r1, [r0, #0x54]
    mov r0, #0x2
    lsl r0, r0, #0xe
    str r0, [sp, #0x8]
    mov r0, #0x6
    lsl r0, r0, #0xe
    str r0, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    blx func_ov007_0214f218
    mov r0, #0xa
    lsl r0, r0, #0x10
    str r0, [sp, #0x4]
    mov r0, r4
    add r1, sp, #0x4
    blx func_ov007_0214f27c
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    mov r1, r5
    blx func_ov007_02152468
    blx func_ov007_02150eb4
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
.L_02152eec:
    ldr r5, [r4, #0x4]
    ldr r0, [r5, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r5
    ldr r1, [r0, #0x0]
    add r1, #0xc4
    ldr r1, [r1, #0x0]
    blx r1
    cmp r6, #0x0
    beq .L_02152f2c
    ldr r0, .L_02152f34
    mov r1, #0x16
    add r2, r7, r0
    ldr r0, [sp, #0x0]
    mul r1, r0
    add r5, r2, r1
    mov r0, r6
    mov r1, r5
    mov r2, #0x14
    blx func_02051890
    mov r2, #0x0
    strh r2, [r5, #0x14]
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r0, [r0, #0x64]
    subs r2, r2, #0x1
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
.L_02152f2c:
    add sp, #0x10
    pop {r3, r4, r5, r6, r7, pc}
.L_02152f30: .word 0x6d6e5053
.L_02152f34: .word 0x1f2
    thumb_func_end func_ov007_02152e60

    .global func_ov007_02152f38
    thumb_func_start func_ov007_02152f38
func_ov007_02152f38: ; 0x02152f38
    push {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    b .L_02152f4c
.L_02152f40:
    ldr r0, [r5, #0x4]
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xb8
    ldr r2, [r2, #0x0]
    blx r2
.L_02152f4c:
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f898
    mov r1, r0
    bne .L_02152f40
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_02152f38

    .byte 0x00, 0x00

    .global func_ov007_02152f5c
    thumb_func_start func_ov007_02152f5c
func_ov007_02152f5c: ; 0x02152f5c
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x8c
    ldr r1, .L_02153218
    ldr r2, .L_0215321c
    mov r0, #0x84
    mov r3, #0x7f
    blx func_0201a21c
    mov r1, #0x0
    mov r2, #0x84
    mov r5, r0
    blx func_020517fc
    blx func_020310f4
    ldr r1, .L_02153220
    str r0, [r5, #0x4]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_02153224
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_02153228
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r5, #0x4]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    str r0, [r5, #0x10]
    bl func_02070fd4
    mov r1, r5
    add r1, #0x7c
    blx func_ov010_0219adcc
    mov r1, #0x20
    mov r0, #0x40
    lsl r2, r1, #0x9
    mov r3, #0x1
    blx func_ov007_02150678
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    ldr r7, .L_0215322c
    str r0, [r5, #0x0]
    mov r4, #0x0
.L_02152fd2:
    add r0, r4, #0x2
    blx func_0203b414
    mov r2, r0
    lsl r6, r4, #0x2
    ldr r1, .L_02153230
    add r2, #0x88
    ldr r0, [r7, r6]
    ldr r1, [r1, r6]
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x14]
    cmp r4, #0x2
    blt .L_02152fd2
    ldr r7, .L_02153234
    mov r4, #0x0
.L_02152ff8:
    lsl r6, r4, #0x2
    ldr r0, [r7, r6]
    mov r1, #0x0
    bl func_020101f4
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x1c]
    cmp r4, #0x2
    blt .L_02152ff8
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b44
    str r0, [r5, #0x24]
    blx func_0203b404
    mov r3, r0
    add r3, #0x88
    mov r1, #0x81
    ldr r0, [r5, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    blx func_0203b3e4
    mov r1, r0
    add r1, #0x88
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02153238
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x34]
    ldr r1, [r5, #0x24]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215323c
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    str r4, [r5, #0x28]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_02153240
    add r0, sp, #0x34
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_02153244
    add r0, sp, #0x2c
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, .L_02153248
    add r1, sp, #0x28
    str r0, [sp, #0x24]
    mov r0, #0x0
    str r0, [sp, #0x28]
    mov r0, r4
    add r2, sp, #0x24
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r3, [sp, #0x38]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r3, [sp, #0x38]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x2c]
    ldr r3, [sp, #0x30]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    mov r0, r4
    add r1, sp, #0x20
    add r2, sp, #0x1c
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r3, [sp, #0x38]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r2, .L_0215324c
    ldr r3, [sp, #0x38]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    mov r0, r4
    add r1, sp, #0x18
    add r2, sp, #0x14
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r3, [sp, #0x38]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x2c]
    ldr r3, [sp, #0x30]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_02023c70
    ldr r0, .L_02153250
    ldr r1, .L_02153254
    ldr r6, [r0, #0x0]
    mov r0, #0x4d
    ldr r2, .L_02153258
    lsl r0, r0, #0x2
    mov r3, #0x3e
    ldr r7, [r4, #0x4]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_0215319c
    ldr r3, .L_0215325c
    mov r1, r7
    mov r2, r6
    bl func_ov012_021af0f8
.L_0215319c:
    blx func_ov007_0214f340
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x38]
    ldr r7, [r5, #0x14]
    cmp r7, #0x0
    beq .L_021531ec
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r7, [r7, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r7
    add r2, #0xb4
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_021531ec:
    mov r0, #0x40
    str r0, [sp, #0x3c]
    mov r0, #0x34
    str r0, [sp, #0x40]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x7e
    str r0, [sp, #0x0]
    add r0, sp, #0x3c
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x1
    blx func_ov007_02151538
    ldr r1, .L_02153260
    b .L_02153264
    mov r8, r8
.L_02153218: .word data_ov007_02169b48
.L_0215321c: .word data_ov007_02169b18
.L_02153220: .word data_02093c04
.L_02153224: .word data_020a0e80
.L_02153228: .word data_020a16c0
.L_0215322c: .word data_ov007_02169ab4
.L_02153230: .word data_ov007_02169abc
.L_02153234: .word data_ov007_02169aac
.L_02153238: .word func_ov007_021535ec
.L_0215323c: .word 0x101
.L_02153240: .word data_ov007_02169b60
.L_02153244: .word data_ov007_02169b6c
.L_02153248: .word 0xfff40000
.L_0215324c: .word 0x494c
.L_02153250: .word data_ov012_021d5154
.L_02153254: .word data_ov007_02169654
.L_02153258: .word data_ov007_02169aa4
.L_0215325c: .word func_ov007_0214f368
.L_02153260: .word 0x31305053
.L_02153264:
    mov r6, r0
    blx func_ov007_0214f898
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x4
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x3c]
    mov r0, #0xb8
    str r0, [sp, #0x3c]
    mov r0, #0x3b
    str r0, [sp, #0x40]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x7e
    str r0, [sp, #0x0]
    add r0, sp, #0x3c
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0xd
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x5
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    mov r1, r5
    str r6, [r5, #0x40]
    add r1, #0x80
    ldr r0, [r5, #0x7c]
    ldr r1, [r1, #0x0]
    add r2, sp, #0x7c
    blx func_ov010_0219c380
    mov r0, #0x0
    add r3, sp, #0x7c
    add r1, sp, #0x4c
.L_021532e2:
    ldrsb r2, [r3, r0]
    add r6, r2, #0x3
    lsl r2, r0, #0x2
    add r0, r0, #0x1
    str r6, [r1, r2]
    cmp r0, #0xc
    blt .L_021532e2
    mov r0, #0x57
    str r0, [sp, #0xc]
    mov r0, #0x88
    str r0, [sp, #0x10]
    mov r6, #0x0
.L_021532fa:
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0xc
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    lsl r7, r6, #0x2
    add r3, sp, #0x4c
    ldr r1, [r1, #0x0]
    ldr r3, [r3, r7]
    mov r0, r4
    lsl r2, r2, #0x10
    blx func_ov007_02151538
    str r0, [sp, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r1, [sp, #0x8]
    add r0, r6, #0x6
    ldr r2, [r1, #0x4]
    mov r1, #0x49
    lsl r1, r1, #0x2
    str r0, [r2, r1]
    ldr r0, [sp, #0x8]
    add r1, r5, r7
    str r0, [r1, #0x44]
    ldr r0, [sp, #0xc]
    add r6, r6, #0x1
    add r0, #0xb
    str r0, [sp, #0xc]
    cmp r6, #0xc
    blt .L_021532fa
    mov r2, #0x1
    mov r0, #0x10
    mov r1, #0x0
    subs r3, r2, #0x2
    bl func_ov012_021bcf1c
    mov r1, #0x72
    mov r2, #0x0
    str r0, [r5, #0x74]
    bl func_ov012_021bd730
    mov r0, #0x2
    mov r1, #0x1
    blx func_02073ebc
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x8]
    ldr r1, .L_021533e4
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x48]
    ldr r0, [r5, #0x8]
    add r1, sp, #0x48
    blx func_ov007_0214ed20
    blx func_02026f94
    str r0, [r5, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0xc]
    ldr r1, .L_021533e8
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x44]
    ldr r0, [r5, #0xc]
    add r1, sp, #0x44
    blx func_ov007_0214ed20
    ldr r0, [r5, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x28]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    add sp, #0x8c
    pop {r4, r5, r6, r7, pc}
    mov r8, r8
.L_021533e4: .word func_ov007_021533ec
.L_021533e8: .word func_ov007_0215353c
    thumb_func_end func_ov007_02152f5c

    .global func_ov007_021533ec
    thumb_func_start func_ov007_021533ec
func_ov007_021533ec: ; 0x021533ec
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_02153402
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_020282f4
.L_02153402:
    pop {r4, pc}
    thumb_func_end func_ov007_021533ec

    .global func_ov007_02153404
    arm_func_start func_ov007_02153404
func_ov007_02153404: ; 0x02153404
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0215352c
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    blx r0
    ldr r0, .L_0215352c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215352c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215352c
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215352c
    b .L_0215345c
.L_02153454:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215345c:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_02153454
    bl func_020735e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq .L_02153484
    blx func_ov012_021bd500
.L_02153484:
    mov r5, #0x0
.L_02153488:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_021534a4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_021534a4:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02153488
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_021534c8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021534c8:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_021534e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021534e0:
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_02153530
    ldr r2, .L_02153534
    ldr r3, [r1, #0x0]
    ldr r0, .L_02153538
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215352c: .word data_020a0e18
.L_02153530: .word data_02093c04
.L_02153534: .word data_020a16c0
.L_02153538: .word data_020a0e80
    arm_func_end func_ov007_02153404

    .global func_ov007_0215353c
    thumb_func_start func_ov007_0215353c
func_ov007_0215353c: ; 0x0215353c
    push {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r4, #0x0
    ldr r5, [r0, #0x10]
    mov r1, r4
    ldr r0, [r5, #0x28]
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    beq .L_02153554
    mov r4, #0x1
.L_02153554:
    cmp r4, #0x0
    beq .L_02153598
    ldr r5, [r5, #0x3c]
    ldr r1, .L_0215359c
    mov r0, r5
    blx func_ov007_0214f898
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_021535a0
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, .L_021535a4
    blx func_02028384
.L_02153598:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0215359c: .word 0x31305053
.L_021535a0: .word 0x810001
.L_021535a4: .word func_ov007_021535a8
    thumb_func_end func_ov007_0215353c

    .global func_ov007_021535a8
    thumb_func_start func_ov007_021535a8
func_ov007_021535a8: ; 0x021535a8
    push {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_021535e4
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x3c]
    blx func_ov007_0214f898
    mov r1, #0x0
    mov r5, r0
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    beq .L_021535e2
    ldr r0, [r5, #0x4]
    ldr r1, .L_021535e8
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    bl func_ov012_021b65cc
    ldr r0, [r4, #0x4]
    blx func_020282f4
.L_021535e2:
    pop {r3, r4, r5, pc}
.L_021535e4: .word 0x31305053
.L_021535e8: .word 0x810002
    thumb_func_end func_ov007_021535a8

    .global func_ov007_021535ec
    thumb_func_start func_ov007_021535ec
func_ov007_021535ec: ; 0x021535ec
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215363c
    cmp r0, r1
    bne .L_0215363a
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0215363a
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r1, #0x13
    blx func_ov007_0214dd60
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_02153640
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
.L_0215363a:
    pop {r3, r4, r5, pc}
.L_0215363c: .word 0x80011001
.L_02153640: .word func_ov007_02153404
    thumb_func_end func_ov007_021535ec

    .global func_ov007_02153644
    thumb_func_start func_ov007_02153644
func_ov007_02153644: ; 0x02153644
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x88
    ldr r1, .L_02153994
    mov r5, r0
    ldr r2, .L_02153998
    mov r0, #0x78
    mov r3, #0xb7
    blx func_0201a21c
    mov r1, #0x0
    mov r2, #0x78
    mov r4, r0
    blx func_020517fc
    str r5, [r4, #0x64]
    cmp r5, #0x1
    blt .L_02153670
    cmp r5, #0x5
    bge .L_02153670
    add r0, r5, #0x4
    str r0, [r4, #0x68]
    b .L_02153674
.L_02153670:
    mov r0, #0x5
    str r0, [r4, #0x68]
.L_02153674:
    blx func_020310f4
    ldr r1, .L_0215399c
    str r0, [r4, #0x4]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_021539a0
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_021539a4
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r4, #0x4]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    str r0, [r4, #0x14]
    bl func_02070fd4
    mov r1, r4
    add r1, #0x6c
    blx func_ov010_0219adcc
    mov r1, #0x20
    mov r0, #0x40
    lsl r2, r1, #0x8
    mov r3, #0x1
    blx func_ov007_02150678
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    str r0, [r4, #0x0]
    mov r0, #0x2
    blx func_0203b414
    mov r2, r0
    ldr r1, .L_021539a8
    add r2, #0x88
    ldmia r1!, {r0, r1}
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    ldr r7, .L_021539ac
    str r0, [r4, #0x18]
    mov r5, #0x0
.L_021536e6:
    lsl r6, r5, #0x2
    ldr r0, [r7, r6]
    mov r1, #0x0
    bl func_020101f4
    add r1, r4, r6
    add r5, r5, #0x1
    str r0, [r1, #0x20]
    cmp r5, #0x2
    blt .L_021536e6
    ldr r1, .L_021539b0
    ldr r2, .L_021539b4
    ldr r3, .L_021539b8
    mov r0, #0xcc
    blx func_0201a21c
    mov r5, r0
    beq .L_02153716
    ldr r1, .L_021539bc
    ldr r2, .L_021539c0
    mov r3, #0x0
    bl func_ov012_021af26c
    mov r5, r0
.L_02153716:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02153724
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02153724:
    ldr r6, [r5, #0x18]
    mov r1, #0x0
    mov r0, #0x1
    mov r2, r6
    mov r3, r1
    bl func_ov012_021b3b7c
    ldr r0, .L_021539c4
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r1, .L_021539c8
    mov r0, r6
    blx func_ov007_0214f898
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    add r0, #0x14
    ldr r5, [r0, #0x18]
    cmp r5, #0x0
    bne .L_02153754
    ldr r0, [r0, #0xc]
    blx func_02036430
    mov r5, r0
.L_02153754:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02153762
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02153762:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x11
    mov r2, #0xf
    mov r3, #0x5
    blx func_0206ad90
    str r0, [r4, #0x58]
    mov r1, #0x0
    strh r1, [r0, #0x18]
    ldr r1, .L_021539cc
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x0]
    blx func_ov007_02150b44
    str r0, [r4, #0x28]
    blx func_0203b404
    mov r3, r0
    add r3, #0x88
    mov r1, #0x81
    ldr r0, [r4, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    blx func_0203b3e4
    mov r1, r0
    add r1, #0x88
    ldr r0, [r4, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150bdc
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r2, .L_021539d0
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r5, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    mov r2, #0x2
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r5, [r4, #0x38]
    ldr r1, [r4, #0x28]
    mov r0, r4
    blx func_ov007_0215145c
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_021539d4
    ldr r1, [r6, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    str r6, [r4, #0x2c]
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    bl func_ov012_021b7744
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    ldr r0, [r6, #0x4]
    blx func_02023940
    ldr r2, .L_021539d8
    add r0, sp, #0x70
    mov r1, r6
    blx func_ov007_0214f2a4
    ldr r2, .L_021539dc
    add r0, sp, #0x68
    mov r1, r6
    blx func_ov007_0214f2a4
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x60]
    ldr r0, .L_021539e0
    add r1, sp, #0x64
    str r0, [sp, #0x64]
    mov r0, r6
    add r2, sp, #0x60
    blx func_ov007_0214f218
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x70]
    ldr r3, [sp, #0x74]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x70]
    ldr r3, [sp, #0x74]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x58]
    str r0, [sp, #0x5c]
    mov r0, r6
    add r1, sp, #0x5c
    add r2, sp, #0x58
    blx func_ov007_0214f218
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x70]
    ldr r3, [sp, #0x74]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x70]
    ldr r2, .L_021539e4
    ldr r3, [sp, #0x74]
    blx func_02023c80
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r6, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x50]
    str r0, [sp, #0x54]
    mov r0, r6
    add r1, sp, #0x54
    add r2, sp, #0x50
    blx func_ov007_0214f218
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x70]
    ldr r3, [sp, #0x74]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x2
    blx func_02023c70
    ldr r0, .L_021539c4
    ldr r1, .L_021539e8
    ldr r5, [r0, #0x0]
    mov r0, #0x4d
    ldr r2, .L_021539ec
    lsl r0, r0, #0x2
    mov r3, #0x3e
    ldr r7, [r6, #0x4]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_02153926
    ldr r3, .L_021539f0
    mov r1, r7
    mov r2, r5
    bl func_ov012_021af0f8
.L_02153926:
    blx func_ov007_0214f340
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r5, [r4, #0x3c]
    ldr r7, [r4, #0x18]
    cmp r7, #0x0
    beq .L_02153968
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r7
    blx func_ov007_0214f48c
.L_02153968:
    mov r0, #0x46
    str r0, [sp, #0x78]
    mov r0, #0x2e
    str r0, [sp, #0x7c]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x7e
    str r0, [sp, #0x0]
    add r0, sp, #0x78
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r6
    lsl r2, r2, #0x10
    mov r3, #0x1
    blx func_ov007_02151538
    ldr r1, .L_021539c8
    b .L_021539f4
    mov r8, r8
.L_02153994: .word data_ov007_02169c90
.L_02153998: .word data_ov007_02169c2c
.L_0215399c: .word data_02093c04
.L_021539a0: .word data_020a0e80
.L_021539a4: .word data_020a16c0
.L_021539a8: .word data_ov007_02169b74
.L_021539ac: .word data_ov007_02169b84
.L_021539b0: .word data_ov007_02169644
.L_021539b4: .word data_ov007_02169c10
.L_021539b8: .word 0x1de
.L_021539bc: .word func_ov007_02154320
.L_021539c0: .word func_ov007_0215436c
.L_021539c4: .word data_ov012_021d5154
.L_021539c8: .word 0x31305053
.L_021539cc: .word 0x8df
.L_021539d0: .word func_ov007_021542b4
.L_021539d4: .word 0x101
.L_021539d8: .word data_ov007_02169ca8
.L_021539dc: .word data_ov007_02169cb4
.L_021539e0: .word 0xfff00000
.L_021539e4: .word 0x494c
.L_021539e8: .word data_ov007_02169654
.L_021539ec: .word data_ov007_02169c08
.L_021539f0: .word func_ov007_0214f368
.L_021539f4:
    mov r5, r0
    blx func_ov007_0214f898
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    mov r2, #0x4
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r5, [r4, #0x40]
    mov r0, #0x28
    str r0, [sp, #0x18]
    mov r0, #0x7d
    str r0, [sp, #0x1c]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
.L_02153a2c:
    mov r0, #0x0
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    add r5, r0, #0x3
    cmp r0, #0x2
    bne .L_02153a4e
    ldr r0, [r4, #0x6c]
    mov r2, #0x0
    ldr r3, [r4, #0x70]
    mov r1, #0x0
    eor r1, r3
    eor r0, r2
    orr r0, r1
    bne .L_02153a4e
    mov r0, #0x1
    mov r5, #0x8
    str r0, [sp, #0x10]
.L_02153a4e:
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x18
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r6
    lsl r2, r2, #0x10
    mov r3, r5
    blx func_ov007_02151538
    mov r5, r0
    ldr r0, [sp, #0xc]
    ldr r1, [r5, #0x4]
    add r2, r0, #0x5
    mov r0, #0x49
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    ldr r0, [sp, #0xc]
    mov r1, r4
    lsl r0, r0, #0x2
    add r0, r4, r0
    str r5, [r0, #0x44]
    ldr r0, [r5, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    blx func_02023940
    ldr r2, .L_02153e20
    add r0, sp, #0x20
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r2, .L_02153e24
    add r0, sp, #0x28
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x4
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x7d
    lsl r0, r0, #0xc
    str r0, [sp, #0x34]
    mov r0, #0x47
    lsl r0, r0, #0xe
    str r0, [sp, #0x30]
    mov r0, r5
    add r1, sp, #0x30
    add r2, sp, #0x34
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    ble .L_02153b32
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0x24]
    blx func_02023c60
.L_02153b32:
    ldr r0, [sp, #0x1c]
    add r1, sp, #0x38
    lsl r0, r0, #0xc
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x18]
    add r2, sp, #0x3c
    lsl r0, r0, #0xc
    str r0, [sp, #0x38]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r2, [sp, #0x8]
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    add r2, #0x8
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r2, .L_02153e28
    ldr r3, [sp, #0x24]
    blx func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x5
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [sp, #0x1c]
    add r1, sp, #0x40
    lsl r0, r0, #0xc
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x18]
    add r2, sp, #0x44
    lsl r0, r0, #0xc
    str r0, [sp, #0x40]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x6
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [sp, #0x1c]
    add r1, sp, #0x48
    lsl r0, r0, #0xc
    str r0, [sp, #0x4c]
    ldr r0, [sp, #0x18]
    add r2, sp, #0x4c
    lsl r0, r0, #0xc
    str r0, [sp, #0x48]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x7
    blx func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x4
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r1, .L_02153e2c
    ldr r2, .L_02153e30
    ldr r3, .L_02153e34
    mov r0, #0x70
    blx func_0201a21c
    mov r7, r0
    beq .L_02153c62
    ldr r2, .L_02153e38
    mov r1, #0x0
    bl func_ov012_021b054c
    ldr r0, .L_02153e3c
    ldr r1, .L_02153e40
    str r0, [r7, #0x0]
    mov r0, r7
    add r0, #0x68
    blx func_ov007_0214f448
    ldr r0, .L_02153e44
    str r0, [r7, #0x0]
.L_02153c62:
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    bne .L_02153c70
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02153c70:
    ldr r1, [r7, #0x18]
    mov r0, r5
    blx func_02020e98
    ldr r0, .L_02153e40
    blx func_ov007_0214f474
    mov r7, r0
    ldr r0, .L_02153e40
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r5, #0x4]
    mov r2, r7
    bl func_ov012_021b5900
    ldr r0, [sp, #0x10]
    ldr r7, .L_02153e48
    cmp r0, #0x0
    beq .L_02153c9c
    ldr r7, .L_02153e4c
    b .L_02153cac
.L_02153c9c:
    ldr r0, [sp, #0xc]
    cmp r0, #0x3
    bne .L_02153cac
    blx func_ov010_0219df88
    cmp r0, #0x0
    beq .L_02153cac
    ldr r7, .L_02153e50
.L_02153cac:
    ldr r0, [r5, #0x4]
    mov r1, #0x8
    mov r2, r7
    blx func_02027834
    ldr r0, [r5, #0x4]
    mov r2, #0x5
    mov r1, r0
    bl func_ov012_021b4104
    ldr r0, [sp, #0x18]
    add r0, #0x3b
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x8]
    add r0, #0x8
    str r0, [sp, #0x8]
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x4
    bge .L_02153cd8
    b .L_02153a2c
.L_02153cd8:
    mov r5, #0x0
.L_02153cda:
    lsl r0, r5, #0x2
    add r0, r4, r0
    ldr r7, [r0, #0x44]
    add r0, r5, #0x5
    lsr r2, r0, #0x1f
    lsl r1, r0, #0x1e
    sub r1, r1, r2
    mov r0, #0x1e
    ror r1, r0
    add r0, r2, r1
    str r0, [sp, #0x14]
    add r0, r5, #0x3
    lsr r2, r0, #0x1f
    lsl r1, r0, #0x1e
    sub r1, r1, r2
    mov r0, #0x1e
    ror r1, r0
    add r0, r2, r1
    lsl r0, r0, #0x2
    add r0, r4, r0
    ldr r2, [r0, #0x44]
    ldr r0, [r7, #0x4]
    cmp r2, #0x0
    bne .L_02153d18
    mov r2, #0x59
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x8
    blx r3
    b .L_02153d2a
.L_02153d18:
    ldr r3, [r0, #0x0]
    ldr r2, [r2, #0x4]
    mov ip, r3
    mov r3, #0x16
    lsl r3, r3, #0x4
    mov r6, ip
    ldr r3, [r6, r3]
    mov r1, #0x8
    blx r3
.L_02153d2a:
    ldr r0, [sp, #0x14]
    lsl r0, r0, #0x2
    add r0, r4, r0
    ldr r2, [r0, #0x44]
    ldr r0, [r7, #0x4]
    cmp r2, #0x0
    bne .L_02153d46
    mov r2, #0x59
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x4
    blx r3
    b .L_02153d54
.L_02153d46:
    mov r3, #0x16
    ldr r6, [r0, #0x0]
    lsl r3, r3, #0x4
    ldr r2, [r2, #0x4]
    ldr r6, [r6, r3]
    mov r1, #0x4
    blx r6
.L_02153d54:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_02153cda
    mov r2, #0x1
    mov r0, #0xe
    mov r1, #0x0
    subs r3, r2, #0x2
    bl func_ov012_021bcf1c
    str r0, [r4, #0x54]
    ldr r1, [r4, #0x68]
    mov r0, r4
    bl func_ov007_02154274
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    blx func_ov012_021ba49c
    str r0, [r4, #0x5c]
    bl func_ov012_021b65bc
    mov r0, #0x2
    mov r1, #0x1
    blx func_02073ebc
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x8]
    ldr r1, .L_02153e54
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x84]
    ldr r0, [r4, #0x8]
    add r1, sp, #0x84
    blx func_ov007_0214ed20
    blx func_02026f94
    str r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0xc]
    ldr r1, .L_02153e58
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x80]
    ldr r0, [r4, #0xc]
    add r1, sp, #0x80
    blx func_ov007_0214ed20
    mov r0, r4
    bl func_ov007_021541a4
    ldr r0, [r4, #0x68]
    mov r1, #0x1
    lsl r0, r0, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    mov r0, r4
    mov r2, #0x0
    add r0, #0x74
    strb r2, [r0, #0x0]
    ldr r0, [r4, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_02023894
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    add sp, #0x88
    pop {r3, r4, r5, r6, r7, pc}
.L_02153e20: .word data_ov007_02169ca8
.L_02153e24: .word data_ov007_02169cb4
.L_02153e28: .word 0x494c
.L_02153e2c: .word data_ov007_02169674
.L_02153e30: .word data_ov007_02169c00
.L_02153e34: .word 0x1b2
.L_02153e38: .word data_02093c8c
.L_02153e3c: .word data_ov007_021695c0
.L_02153e40: .word data_ov007_02169b7c
.L_02153e44: .word data_ov012_021d1c58
.L_02153e48: .word func_ov007_0215441c
.L_02153e4c: .word func_ov007_021544d8
.L_02153e50: .word func_ov007_0215452c
.L_02153e54: .word func_ov007_02153e5c
.L_02153e58: .word func_ov007_02154074
    thumb_func_end func_ov007_02153644

    .global func_ov007_02153e5c
    thumb_func_start func_ov007_02153e5c
func_ov007_02153e5c: ; 0x02153e5c
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_02153e72
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_020282f4
.L_02153e72:
    pop {r4, pc}
    thumb_func_end func_ov007_02153e5c

    .global func_ov007_02153e74
    thumb_func_start func_ov007_02153e74
func_ov007_02153e74: ; 0x02153e74
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov010_0219ad4c
    cmp r0, #0x0
    beq .L_02153e8a
    ldr r0, [r4, #0x5c]
    mov r1, #0x10
    blx func_ov007_021516f0
.L_02153e8a:
    mov r0, r4
    bl func_ov007_02154294
    pop {r4, pc}
    thumb_func_end func_ov007_02153e74

    .byte 0x00, 0x00

    .global func_ov007_02153e94
    arm_func_start func_ov007_02153e94
func_ov007_02153e94: ; 0x02153e94
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02154008
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    blx r0
    ldr r0, .L_02154008
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02154008
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02154008
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_02154008
    b .L_02153eec
.L_02153ee4:
    ldr r0, [r5, #0x0]
    blx r0
.L_02153eec:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_02153ee4
    bl func_020735e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, .L_0215400c
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_02153f28
    bl func_ov012_021bab64
.L_02153f28:
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_02153f38
    blx func_ov012_021bd500
.L_02153f38:
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_02153f48
    bl func_0206ae98
.L_02153f48:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_02153f60
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02153f60:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02153f78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02153f78:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02153f90
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02153f90:
    mov r5, #0x0
.L_02153f94:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_02153fb0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02153fb0:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02153f94
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_02154010
    ldr r2, .L_02154014
    ldr r3, [r1, #0x0]
    ldr r0, .L_02154018
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_02154008: .word data_020a0e18
.L_0215400c: .word data_ov012_021d5154
.L_02154010: .word data_02093c04
.L_02154014: .word data_020a16c0
.L_02154018: .word data_020a0e80
    arm_func_end func_ov007_02153e94

    .global func_ov007_0215401c
    thumb_func_start func_ov007_0215401c
func_ov007_0215401c: ; 0x0215401c
    push {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x40]
    ldr r1, .L_02154068
    blx func_ov007_0214f898
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215406c
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, r4
    mov r1, #0x6
    bl func_ov007_02154248
    ldr r0, [r4, #0x10]
    ldr r1, .L_02154070
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x68]
    mov r1, #0x1
    lsl r0, r0, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    mov r0, #0x0
    add r4, #0x74
    strb r0, [r4, #0x0]
    pop {r3, r4, r5, pc}
.L_02154068: .word 0x31305053
.L_0215406c: .word 0x810002
.L_02154070: .word func_ov007_0215422c
    thumb_func_end func_ov007_0215401c

    .global func_ov007_02154074
    thumb_func_start func_ov007_02154074
func_ov007_02154074: ; 0x02154074
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r4, #0x0
    ldr r5, [r0, #0x10]
    mov r1, r4
    ldr r0, [r5, #0x2c]
    mov r7, r4
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    beq .L_0215408e
    mov r4, #0x1
.L_0215408e:
    ldr r0, [r5, #0x14]
    blx func_ov007_0214f1f0
    cmp r0, #0x0
    beq .L_0215409c
    mov r4, #0x1
    mov r7, r4
.L_0215409c:
    cmp r4, #0x0
    beq .L_0215412c
    ldr r0, [r5, #0x40]
    ldr r1, .L_02154130
    str r0, [sp, #0x0]
    blx func_ov007_0214f898
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    cmp r7, #0x0
    ldr r0, [r4, #0x4]
    beq .L_021540c8
    ldr r1, .L_02154134
    mov r2, #0x0
    blx func_02023894
    b .L_021540d0
.L_021540c8:
    ldr r1, .L_02154138
    mov r2, #0x0
    blx func_02023894
.L_021540d0:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [sp, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    cmp r7, #0x0
    beq .L_021540fe
    mov r0, r5
    bl func_ov007_0215401c
    bl func_ov012_021b65cc
    ldr r0, [r6, #0x4]
    blx func_020282f4
    pop {r3, r4, r5, r6, r7, pc}
.L_021540fe:
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215413c
    blx func_02028384
    mov r0, r5
    mov r1, #0x5
    bl func_ov007_02154248
    mov r0, r5
    mov r1, #0x0
    add r0, #0x74
    strb r1, [r0, #0x0]
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    bne .L_02154122
    mov r0, r5
    bl func_ov007_021541a4
.L_02154122:
    ldr r0, [r5, #0x10]
    ldr r1, .L_02154140
    ldr r0, [r0, #0x4]
    blx func_02028384
.L_0215412c:
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_02154130: .word 0x31305053
.L_02154134: .word 0x810002
.L_02154138: .word 0x810001
.L_0215413c: .word func_ov007_02154144
.L_02154140: .word func_ov007_021541ec
    thumb_func_end func_ov007_02154074

    .global func_ov007_02154144
    thumb_func_start func_ov007_02154144
func_ov007_02154144: ; 0x02154144
    push {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r4, #0x0
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0x14]
    blx func_ov007_0214f1f0
    cmp r0, #0x0
    beq .L_0215415a
    mov r4, #0x1
.L_0215415a:
    ldr r0, [r5, #0x40]
    ldr r1, .L_0215419c
    blx func_ov007_0214f898
    mov r6, r0
    cmp r4, #0x0
    bne .L_02154172
    mov r1, #0x0
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    beq .L_0215419a
.L_02154172:
    ldr r0, [r6, #0x4]
    ldr r1, .L_021541a0
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    cmp r4, #0x0
    beq .L_02154190
    mov r0, r5
    bl func_ov007_0215401c
.L_02154190:
    bl func_ov012_021b65cc
    ldr r0, [r7, #0x4]
    blx func_020282f4
.L_0215419a:
    pop {r3, r4, r5, r6, r7, pc}
.L_0215419c: .word 0x31305053
.L_021541a0: .word 0x810002
    thumb_func_end func_ov007_02154144

    .global func_ov007_021541a4
    thumb_func_start func_ov007_021541a4
func_ov007_021541a4: ; 0x021541a4
    push {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_021541b8
    ldr r0, [r0, #0x4]
    ldr r1, .L_021541e4
    blx func_02028384
.L_021541b8:
    blx func_02026f94
    str r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x10]
    ldr r1, .L_021541e8
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x10]
    add r1, sp, #0x0
    blx func_ov007_0214ed20
    add sp, #0x4
    pop {r3, r4, pc}
.L_021541e4: .word func_ov007_0215422c
.L_021541e8: .word func_ov007_02154244
    thumb_func_end func_ov007_021541a4

    .global func_ov007_021541ec
    thumb_func_start func_ov007_021541ec
func_ov007_021541ec: ; 0x021541ec
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x50]
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    beq .L_02154226
    ldr r0, [r5, #0x4]
    ldr r1, .L_02154228
    blx func_02028384
    mov r0, #0x74
    ldrsb r0, [r4, r0]
    cmp r0, #0x0
    beq .L_02154226
    ldr r0, [r4, #0x68]
    mov r1, #0x1
    lsl r0, r0, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    mov r0, #0x0
    add r4, #0x74
    strb r0, [r4, #0x0]
.L_02154226:
    pop {r3, r4, r5, pc}
.L_02154228: .word func_ov007_0215422c
    thumb_func_end func_ov007_021541ec

    .global func_ov007_0215422c
    thumb_func_start func_ov007_0215422c
func_ov007_0215422c: ; 0x0215422c
    push {r3, lr}
    ldr r1, [r0, #0x4]
    ldr r2, [r1, #0x10]
    ldr r1, [r2, #0x10]
    cmp r1, r0
    bne .L_0215423c
    mov r1, #0x0
    str r1, [r2, #0x10]
.L_0215423c:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    pop {r3, pc}
    thumb_func_end func_ov007_0215422c

    .global func_ov007_02154244
    thumb_func_start func_ov007_02154244
func_ov007_02154244: ; 0x02154244
    bx lr
    thumb_func_end func_ov007_02154244

    .byte 0x00, 0x00

    .global func_ov007_02154248
    thumb_func_start func_ov007_02154248
func_ov007_02154248: ; 0x02154248
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r7, r1
    mov r4, #0x0
.L_02154250:
    lsl r0, r4, #0x2
    add r0, r6, r0
    ldr r5, [r0, #0x44]
    mov r1, r7
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_02154250
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_02154248

    .byte 0x00, 0x00

    .global func_ov007_02154274
    thumb_func_start func_ov007_02154274
func_ov007_02154274: ; 0x02154274
    push {r3, lr}
    cmp r1, #0x5
    blo .L_0215428e
    cmp r1, #0x9
    bhs .L_0215428e
    subs r1, r1, #0x5
    lsl r2, r1, #0x2
    ldr r1, .L_02154290
    ldr r0, [r0, #0x54]
    ldr r1, [r1, r2]
    mov r2, #0x0
    bl func_ov012_021bd730
.L_0215428e:
    pop {r3, pc}
.L_02154290: .word data_ov007_02168aa8
    thumb_func_end func_ov007_02154274

    .global func_ov007_02154294
    thumb_func_start func_ov007_02154294
func_ov007_02154294: ; 0x02154294
    push {r4, lr}
    mov r4, r0
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_021542b0
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
    pop {r4, pc}
.L_021542b0: .word func_ov007_02153e94
    thumb_func_end func_ov007_02154294

    .global func_ov007_021542b4
    thumb_func_start func_ov007_021542b4
func_ov007_021542b4: ; 0x021542b4
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02154318
    cmp r0, r1
    bne .L_02154316
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_02154316
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x0]
    blx func_ov007_02150b44
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65d8
    mov r0, #0x78
    mov r1, #0x1
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r1, #0x1
    blx func_ov007_0214dd60
    ldr r0, [r4, #0x0]
    blx func_ov007_02150b44
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65d8
    ldr r0, [r4, #0x8]
    ldr r1, .L_0215431c
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
.L_02154316:
    pop {r3, r4, r5, pc}
.L_02154318: .word 0x80011001
.L_0215431c: .word func_ov007_02153e74
    thumb_func_end func_ov007_021542b4

    .global func_ov007_02154320
    thumb_func_start func_ov007_02154320
func_ov007_02154320: ; 0x02154320
    push {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x7
    mov r3, #0x7f
    blx func_ov007_021510f0
    mov r1, r0
    mov r0, r4
    blx func_ov007_0214f48c
    mov r0, #0x7f
    ldr r1, [r4, #0x4]
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02154368
    ldr r0, [r0, #0x50]
    str r1, [r0, #0x10]
    mov r1, #0x1
    blx func_ov007_0214f240
    add sp, #0x4
    pop {r3, r4, pc}
    mov r8, r8
.L_02154368: .word 0xfff40000
    thumb_func_end func_ov007_02154320

    .global func_ov007_0215436c
    thumb_func_start func_ov007_0215436c
func_ov007_0215436c: ; 0x0215436c
    push {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r5, [r6, #0x4]
    ldr r1, .L_021543cc
    add r5, #0xa0
    blx func_ov007_0214f898
    mov r4, r0
    mov r0, r5
    blx func_ov007_0214f45c
    cmp r0, #0x0
    beq .L_02154392
    mov r0, r5
    blx func_ov007_0214f474
    cmp r0, #0x0
    bne .L_021543a0
.L_02154392:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_021543c6
.L_021543a0:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x2
    ldrsh r0, [r5, r0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, #0x0
    ldrsh r0, [r5, r0]
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r6
    blx func_ov007_0214f218
.L_021543c6:
    add sp, #0x8
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_021543cc: .word 0x31305053
    thumb_func_end func_ov007_0215436c

    .global func_ov007_021543d0
    thumb_func_start func_ov007_021543d0
func_ov007_021543d0: ; 0x021543d0
    push {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x4]
    mov r1, #0x49
    lsl r1, r1, #0x2
    ldr r0, [r2, #0x10]
    ldr r1, [r2, r1]
    bl func_ov007_02154274
    ldr r0, [r4, #0x4]
    mov r1, #0x4a
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    blx r2
    mov r1, #0x3
    and r0, r1
    cmp r0, #0x3
    bne .L_02154412
    ldr r0, [r4, #0x4]
    add r0, #0xa8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02154412
    ldr r0, .L_02154414
    ldr r2, [r0, #0x0]
    ldr r0, .L_02154418
    ldr r0, [r0, #0x0]
    cmp r2, r0
    bhi .L_02154412
    mov r0, #0x78
    blx func_0207342c
.L_02154412:
    pop {r4, pc}
.L_02154414: .word data_ov012_021d5160
.L_02154418: .word data_02093c24
    thumb_func_end func_ov007_021543d0

    .global func_ov007_0215441c
    thumb_func_start func_ov007_0215441c
func_ov007_0215441c: ; 0x0215441c
    push {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_021544d4
    cmp r0, r1
    beq .L_02154438
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_0215444e
    pop {r3, r4, r5, pc}
.L_02154438:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x1
    tst r0, r1
    beq .L_021544d2
    mov r0, r4
    bl func_ov007_021543d0
    pop {r3, r4, r5, pc}
.L_0215444e:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_021544d2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r5, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    subs r0, r0, #0x5
    cmp r0, #0x3
    bhi .L_021544cc
    add r0, r0, r0
    add r0, pc
    ldrh r0, [r0, #0x6]
    lsl r0, r0, #0x10
    asr r0, r0, #0x10
    add pc, r0
.L_02154482: ; jump table
    .short .L_0215448a - .L_02154482 - 2
    .short .L_021544a0 - .L_02154482 - 2
    .short .L_021544ac - .L_02154482 - 2
    .short .L_021544c2 - .L_02154482 - 2
.L_0215448a:
    blx func_ov007_0214dd50
    mov r1, #0x1
    blx func_ov007_0214dd8c
    blx func_ov007_0214dd50
    mov r1, #0x14
    blx func_ov007_0214dd60
    b .L_021544cc
.L_021544a0:
    blx func_ov007_0214dd50
    mov r1, #0xa
    blx func_ov007_0214dd6c
    b .L_021544cc
.L_021544ac:
    blx func_ov007_0214dd50
    mov r1, #0x3
    blx func_ov007_0214dd8c
    blx func_ov007_0214dd50
    mov r1, #0x16
    blx func_ov007_0214dd60
    b .L_021544cc
.L_021544c2:
    blx func_ov007_0214dd50
    mov r1, #0xb
    blx func_ov007_0214dd6c
.L_021544cc:
    mov r0, r5
    bl func_ov007_02154294
.L_021544d2:
    pop {r3, r4, r5, pc}
.L_021544d4: .word 0x80011000
    thumb_func_end func_ov007_0215441c

    .global func_ov007_021544d8
    thumb_func_start func_ov007_021544d8
func_ov007_021544d8: ; 0x021544d8
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    ldr r6, [r0, #0x10]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02154528
    cmp r0, r1
    beq .L_021544f8
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_0215450e
    pop {r4, r5, r6, pc}
.L_021544f8:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x1
    tst r0, r1
    beq .L_02154524
    mov r0, r5
    bl func_ov007_021543d0
    pop {r4, r5, r6, pc}
.L_0215450e:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_02154524
    mov r0, r6
    mov r1, #0x31
    blx func_ov007_02154580
.L_02154524:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_02154528: .word 0x80011000
    thumb_func_end func_ov007_021544d8

    .global func_ov007_0215452c
    thumb_func_start func_ov007_0215452c
func_ov007_0215452c: ; 0x0215452c
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    ldr r6, [r0, #0x10]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215457c
    cmp r0, r1
    beq .L_0215454c
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_02154562
    pop {r4, r5, r6, pc}
.L_0215454c:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x1
    tst r0, r1
    beq .L_02154578
    mov r0, r5
    bl func_ov007_021543d0
    pop {r4, r5, r6, pc}
.L_02154562:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_02154578
    mov r0, r6
    mov r1, #0x33
    blx func_ov007_02154580
.L_02154578:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0215457c: .word 0x80011000
    thumb_func_end func_ov007_0215452c

    .global func_ov007_02154580
    arm_func_start func_ov007_02154580
func_ov007_02154580: ; 0x02154580
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r5, r1
    mov r0, #0x78
    mov r1, #0x2
    bl func_0207342c
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x28]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x2c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x5c]
    mov r1, r5
    mov r3, r2
    bl func_ov012_021bac28
    ldr r5, .L_02154640
    b .L_021545fc
.L_021545f4:
    ldr r0, [r5, #0x0]
    blx r0
.L_021545fc:
    ldr r0, [r4, #0x5c]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_021545f4
    ldr r0, [r4, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02154640: .word data_020a0e18
    arm_func_end func_ov007_02154580

    .global func_ov007_02154644
    thumb_func_start func_ov007_02154644
func_ov007_02154644: ; 0x02154644
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x78
    mov r0, #0x4f
    ldr r1, .L_0215482c
    ldr r2, .L_02154830
    lsl r0, r0, #0x2
    mov r3, #0xc4
    blx func_0201a21c
    mov r2, #0x4f
    mov r1, #0x0
    lsl r2, r2, #0x2
    mov r5, r0
    blx func_020517fc
    blx func_020310f4
    ldr r1, .L_02154834
    str r0, [r5, #0x4]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_02154838
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_0215483c
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r5, #0x4]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    mov r1, #0x40
    str r0, [r5, #0x10]
    mov r0, #0x20
    lsl r2, r1, #0x7
    mov r3, #0x1
    blx func_ov007_02150678
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    str r0, [r5, #0x0]
    blx func_0203b404
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_02150e14
    mov r0, #0x2
    blx func_0203b414
    mov r2, r0
    ldr r1, .L_02154840
    add r2, #0x88
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x0]
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    ldr r7, .L_02154844
    str r0, [r5, #0x14]
    mov r4, #0x0
.L_021546d6:
    lsl r6, r4, #0x2
    ldr r0, [r7, r6]
    mov r1, #0x0
    bl func_020101f4
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x1c]
    cmp r4, #0x2
    blt .L_021546d6
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b44
    str r0, [r5, #0x24]
    blx func_0203b404
    mov r3, r0
    add r3, #0x88
    mov r1, #0x8f
    ldr r0, [r5, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    blx func_0203b3e4
    mov r1, r0
    add r1, #0x88
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02154848
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r2, #0x49
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    lsl r2, r2, #0x2
    str r1, [r0, r2]
    str r4, [r5, #0x34]
    ldr r0, [r4, #0x4]
    add r2, #0x24
    ldr r3, [r0, #0x0]
    mov r1, #0x8
    ldr r3, [r3, r2]
    blx r3
    ldr r1, [r5, #0x24]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215484c
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    str r4, [r5, #0x28]
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_02154850
    add r0, sp, #0x64
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_02154854
    add r0, sp, #0x5c
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0xb2
    lsl r0, r0, #0xc
    str r0, [sp, #0x54]
    mov r0, #0x0
    str r0, [sp, #0x58]
    mov r0, r4
    add r1, sp, #0x58
    add r2, sp, #0x54
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    mov r2, #0x1e
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x5c]
    ldr r3, [sp, #0x60]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    mov r0, r4
    add r1, sp, #0x50
    add r2, sp, #0x4c
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r3, [sp, #0x68]
    mov r2, #0x26
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x64]
    ldr r2, .L_02154858
    ldr r3, [sp, #0x68]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, .L_0215485c
    ldr r1, .L_02154860
    ldr r6, [r0, #0x0]
    mov r0, #0x4d
    ldr r2, .L_02154864
    lsl r0, r0, #0x2
    mov r3, #0x3e
    ldr r4, [r4, #0x4]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_02154874
    ldr r3, .L_02154868
    b .L_0215486c
    mov r8, r8
.L_0215482c: .word data_ov007_02169d4c
.L_02154830: .word data_ov007_02169d30
.L_02154834: .word data_02093c04
.L_02154838: .word data_020a0e80
.L_0215483c: .word data_020a16c0
.L_02154840: .word data_ov007_02169cbc
.L_02154844: .word data_ov007_02169ccc
.L_02154848: .word func_ov007_02155180
.L_0215484c: .word 0x101
.L_02154850: .word data_ov007_02169d68
.L_02154854: .word data_ov007_02169d74
.L_02154858: .word 0x494c
.L_0215485c: .word data_ov012_021d5154
.L_02154860: .word data_ov007_02169654
.L_02154864: .word data_ov007_02169cd4
.L_02154868: .word func_ov007_0214f368
.L_0215486c:
    mov r1, r4
    mov r2, r6
    bl func_ov012_021af0f8
.L_02154874:
    blx func_ov007_0214f340
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x38]
    ldr r6, [r5, #0x14]
    cmp r6, #0x0
    beq .L_021548b6
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    mov r1, r6
    blx func_ov007_0214f48c
.L_021548b6:
    mov r0, #0x14
    str r0, [sp, #0x0]
    add r0, sp, #0x44
    mov r1, #0x1
    mov r2, #0x11
    mov r3, #0x1f
    blx func_ov007_021502ec
    ldr r0, [r5, #0x14]
    add r1, sp, #0x44
    mov r2, #0xa
    blx func_ov007_02151058
    mov r4, #0x0
    mov r7, #0x80
.L_021548d4:
    mov r0, #0x18
    ldr r6, [r5, #0x28]
    mul r0, r4
    add r0, #0x4c
    str r7, [sp, #0x3c]
    str r0, [sp, #0x40]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x3c
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x8f
    ldr r1, [r1, #0x0]
    mov r0, r6
    lsl r2, r2, #0x10
    mov r3, #0x11
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x34
    mul r0, r4
    add r0, r5, r0
    str r6, [r0, #0x6c]
    mov r0, r6
    add r1, sp, #0x3c
    bl func_ov007_02154cdc
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_021548d4
    mov r4, #0x0
.L_02154924:
    mov r0, #0x18
    mul r0, r4
    ldr r7, [r5, #0x28]
    add r0, #0x4c
    str r0, [sp, #0x38]
    mov r0, #0x60
    str r0, [sp, #0x34]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x34
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x8f
    ldr r1, [r1, #0x0]
    mov r0, r7
    lsl r2, r2, #0x10
    mov r3, #0x12
    blx func_ov007_02151538
    str r0, [sp, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x34
    mul r0, r4
    add r6, r5, r0
    ldr r0, [sp, #0xc]
    add r1, sp, #0x34
    str r0, [r6, #0x70]
    bl func_ov007_02154cdc
    mov r0, #0xc4
    str r0, [sp, #0x34]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x34
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x8f
    ldr r1, [r1, #0x0]
    mov r0, r7
    lsl r2, r2, #0x10
    mov r3, #0x13
    blx func_ov007_02151538
    str r0, [sp, #0x10]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [sp, #0x10]
    add r1, sp, #0x34
    str r0, [r6, #0x74]
    bl func_ov007_02154cdc
    mov r0, #0x98
    str r0, [sp, #0x34]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x34
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x8f
    ldr r1, [r1, #0x0]
    mov r0, r7
    lsl r2, r2, #0x10
    mov r3, #0x14
    blx func_ov007_02151538
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r7
    add r1, sp, #0x34
    str r7, [r6, #0x78]
    bl func_ov007_02154e60
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_02154924
    mov r4, #0x0
.L_021549ea:
    ldr r0, [r5, #0x28]
    mov r6, r4
    str r0, [sp, #0x8]
    mov r0, #0x28
    str r0, [sp, #0x20]
    mov r0, #0x18
    mul r6, r0
    mov r0, r6
    add r0, #0x44
    str r0, [sp, #0x24]
    blx func_0203b404
    add r0, #0x88
    ldr r7, [r0, #0x0]
    blx func_ov007_02150f0c
    mov r2, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x20
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x8]
    mov r1, r7
    mov r3, #0x6
    blx func_ov007_021515d0
    str r0, [sp, #0x14]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x34
    mul r0, r4
    add r7, r5, r0
    ldr r0, [sp, #0x14]
    add r1, sp, #0x20
    str r0, [r7, #0x7c]
    bl func_ov007_02154cdc
    add r6, #0x4c
    mov r0, #0x98
    str r6, [sp, #0x24]
    str r0, [sp, #0x20]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x20
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x8f
    ldr r0, [sp, #0x8]
    ldr r1, [r1, #0x0]
    lsl r2, r2, #0x10
    mov r3, #0x1f
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r7
    add r0, #0x80
    str r6, [r0, #0x0]
    ldr r1, .L_02154c20
    mov r0, r6
    blx func_ov007_0214f898
    mov r1, #0x27
    lsl r1, r1, #0xc
    str r1, [sp, #0x28]
    add r1, sp, #0x28
    blx func_ov007_02154fb4
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8f
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x20
    mov r3, #0x80
    blx func_ov007_021510f0
    str r0, [sp, #0x18]
    mov r1, #0x51
    lsl r1, r1, #0xc
    str r1, [sp, #0x2c]
    add r1, sp, #0x2c
    blx func_ov007_02154fb4
    ldr r1, [sp, #0x18]
    mov r0, r6
    blx func_ov007_0214f48c
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8f
    mov r2, r4
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    add r2, #0x21
    mov r3, #0x80
    blx func_ov007_021510f0
    ldr r2, [sp, #0x20]
    mov r1, #0x1c
    sub r1, r1, r2
    lsl r1, r1, #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x1c]
    add r1, sp, #0x30
    blx func_ov007_02154fb4
    ldr r1, [sp, #0x1c]
    mov r0, r6
    blx func_ov007_0214f48c
    mov r0, r6
    add r1, sp, #0x20
    bl func_ov007_02154cdc
    mov r0, #0x98
    str r0, [sp, #0x20]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x20
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x8f
    ldr r0, [sp, #0x8]
    ldr r1, [r1, #0x0]
    lsl r2, r2, #0x10
    mov r3, #0x14
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    add r7, #0x88
    mov r0, r6
    add r1, sp, #0x20
    str r6, [r7, #0x0]
    bl func_ov007_02154e60
    add r4, r4, #0x1
    cmp r4, #0x4
    bge .L_02154b30
    b .L_021549ea
.L_02154b30:
    mov r3, #0x0
    mov r1, r3
    mov r0, #0x34
.L_02154b36:
    mov r2, r3
    mul r2, r0
    add r2, r5, r2
    str r3, [r2, #0x5c]
    add r3, r3, #0x1
    str r1, [r2, #0x60]
    cmp r3, #0x4
    blt .L_02154b36
    mov r2, #0x1
    mov r0, #0xd
    subs r3, r2, #0x2
    bl func_ov012_021bcf1c
    mov r1, #0x6b
    mov r2, #0x0
    str r0, [r5, #0x44]
    bl func_ov012_021bd730
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    blx func_ov012_021ba49c
    mov r1, #0x0
    mov r2, r1
    str r0, [r5, #0x48]
    blx func_ov010_021a3228
    mov r0, #0x2
    mov r1, #0x1
    blx func_02073ebc
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x8]
    ldr r1, .L_02154c24
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x74]
    ldr r0, [r5, #0x8]
    add r1, sp, #0x74
    blx func_ov007_0214ed20
    blx func_02026f94
    str r0, [r5, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0xc]
    ldr r1, .L_02154c28
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x86
    lsl r0, r0, #0xc
    str r0, [sp, #0x70]
    ldr r0, [r5, #0xc]
    add r1, sp, #0x70
    blx func_ov007_0214ed20
    blx func_02026f94
    str r0, [r5, #0x58]
    ldr r0, [r5, #0x58]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x58]
    ldr r1, .L_02154c2c
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x6c]
    ldr r0, [r5, #0x58]
    add r1, sp, #0x6c
    blx func_ov007_0214ed20
    ldr r0, [r5, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x28]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    blx func_02088330
    ldr r0, [r5, #0x4]
    add sp, #0x78
    pop {r3, r4, r5, r6, r7, pc}
.L_02154c20: .word 0x31305053
.L_02154c24: .word func_ov007_02154c30
.L_02154c28: .word func_ov007_02154c58
.L_02154c2c: .word func_ov007_021553a0
    thumb_func_end func_ov007_02154644

    .global func_ov007_02154c30
    thumb_func_start func_ov007_02154c30
func_ov007_02154c30: ; 0x02154c30
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_02154c4a
    bl func_ov012_021b65cc
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_020282f4
.L_02154c4a:
    pop {r4, pc}
    thumb_func_end func_ov007_02154c30

    .global func_ov007_02154c4c
    thumb_func_start func_ov007_02154c4c
func_ov007_02154c4c: ; 0x02154c4c
    ldr r0, [r0, #0x4]
    ldr r3, .L_02154c54
    ldr r0, [r0, #0x10]
    bx r3
.L_02154c54: .word func_ov007_02154fd4
    thumb_func_end func_ov007_02154c4c

    .global func_ov007_02154c58
    arm_func_start func_ov007_02154c58
func_ov007_02154c58: ; 0x02154c58
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r5, #0x0
    ldr r7, [r0, #0x10]
    mov r1, r5
    ldr r0, [r7, #0x28]
    bl func_ov007_0214f1bc
    cmp r0, #0x0
    movne r5, #0x1
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x1
    bl func_ov010_0219adf4
    mov r0, #0x4
    bl func_ov010_0219ae0c
    ldr r5, .L_02154cd8
    mov r6, #0x0
.L_02154ca0:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
    cmp r6, #0xa
    blo .L_02154ca0
    ldr r0, [r7, #0x34]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x14c]
    blx r2
    ldr r0, [r4, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02154cd8: .word data_020a0e18
    arm_func_end func_ov007_02154c58

    .global func_ov007_02154cdc
    thumb_func_start func_ov007_02154cdc
func_ov007_02154cdc: ; 0x02154cdc
    push {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    blx func_02023940
    ldr r2, .L_02154e54
    add r0, sp, #0x28
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r2, .L_02154e58
    add r0, sp, #0x20
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x1c
    lsl r0, r0, #0xc
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x18
    add r0, #0xd8
    lsl r0, r0, #0xc
    str r0, [sp, #0x1c]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    add r1, sp, #0x14
    lsl r0, r0, #0xc
    str r0, [sp, #0x10]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x10
    lsl r0, r0, #0xc
    str r0, [sp, #0x14]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x10
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r2, .L_02154e5c
    ldr r3, [sp, #0x2c]
    blx func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x3
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r4, #0x4]
    add r1, sp, #0xc
    lsl r0, r0, #0xc
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x8
    lsl r0, r0, #0xc
    str r0, [sp, #0xc]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    add r1, sp, #0x4
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x0
    sub r0, #0xf0
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x10
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x10
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x28]
    ldr r2, .L_02154e5c
    ldr r3, [sp, #0x2c]
    blx func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x5
    blx func_02023c70
    add sp, #0x30
    pop {r3, r4, r5, pc}
.L_02154e54: .word data_ov007_02169d68
.L_02154e58: .word data_ov007_02169d74
.L_02154e5c: .word 0x494c
    thumb_func_end func_ov007_02154cdc

    .global func_ov007_02154e60
    thumb_func_start func_ov007_02154e60
func_ov007_02154e60: ; 0x02154e60
    push {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    blx func_02023940
    ldr r2, .L_02154fa8
    add r0, sp, #0x20
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r2, .L_02154fac
    add r0, sp, #0x18
    mov r1, r5
    blx func_ov007_0214f2a4
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    add r1, sp, #0x14
    lsl r0, r0, #0xc
    str r0, [sp, #0x10]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x10
    add r0, #0xd8
    lsl r0, r0, #0xc
    str r0, [sp, #0x14]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    add r1, sp, #0xc
    lsl r0, r0, #0xc
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x8
    lsl r0, r0, #0xc
    str r0, [sp, #0xc]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x10
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x10
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r2, .L_02154fb0
    ldr r3, [sp, #0x24]
    blx func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x3
    blx func_02023c70
    ldr r0, [r5, #0x4]
    blx func_020239a0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x4
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r5
    blx func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x5
    blx func_02023c70
    add sp, #0x28
    pop {r3, r4, r5, pc}
.L_02154fa8: .word data_ov007_02169d68
.L_02154fac: .word data_ov007_02169d74
.L_02154fb0: .word 0x494c
    thumb_func_end func_ov007_02154e60

    .global func_ov007_02154fb4
    arm_func_start func_ov007_02154fb4
func_ov007_02154fb4: ; 0x02154fb4
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_02154fd0
    mov r1, #0x1
    str r2, [r0, #0xc]
    bx ip
.L_02154fd0: .word func_ov007_0214f240
    arm_func_end func_ov007_02154fb4

    .global func_ov007_02154fd4
    arm_func_start func_ov007_02154fd4
func_ov007_02154fd4: ; 0x02154fd4
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    blx func_ov012_021b65bc
    ldr r0, .L_0215516c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215516c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215516c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215516c
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215516c
    b .L_0215502c
.L_02155024:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215502c:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_02155024
    bl func_020735e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    bl func_ov010_021a3248
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq .L_02155058
    bl func_ov012_021bab64
.L_02155058:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_02155068
    blx func_ov012_021bd500
.L_02155068:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_02155078
    bl func_0206ae98
.L_02155078:
    mov r5, #0x0
.L_0215507c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_02155098
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02155098:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215507c
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_021550bc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021550bc:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_021550d4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021550d4:
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_021550ec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021550ec:
    bl func_ov007_02150f1c
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    ldr r0, [r4, #0x12c]
    cmp r0, #0x0
    beq .L_02155114
    bl func_ov010_0219a93c
    cmp r0, #0x0
    bne .L_02155114
    bl func_ov010_0219bf68
.L_02155114:
    blx func_ov012_021b65cc
    ldr r1, .L_02155170
    ldr r2, .L_02155174
    ldr r3, [r1, #0x0]
    ldr r0, .L_02155178
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldr r0, .L_0215517c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl func_0201ad30
    ldmia sp!, {r3, r4, r5, pc}
.L_0215516c: .word data_020a0e18
.L_02155170: .word data_02093c04
.L_02155174: .word data_020a16c0
.L_02155178: .word data_020a0e80
.L_0215517c: .word data_020a0dd8
    arm_func_end func_ov007_02154fd4

    .global func_ov007_02155180
    thumb_func_start func_ov007_02155180
func_ov007_02155180: ; 0x02155180
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_021551e0
    cmp r0, r1
    bne .L_021551dc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_021551dc
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    mov r0, #0x4b
    lsl r0, r0, #0x2
    ldr r0, [r4, r0]
    cmp r0, #0x0
    bne .L_021551dc
    blx func_ov010_0219ae24
    blx func_ov007_0214dd50
    mov r1, #0xe
    blx func_ov007_0214dd60
    mov r0, #0x78
    mov r1, #0x1
    blx func_0207342c
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_021551e4
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
.L_021551dc:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_021551e0: .word 0x80011001
.L_021551e4: .word func_ov007_02154c4c
    thumb_func_end func_ov007_02155180

    .global func_ov007_021551e8
    thumb_func_start func_ov007_021551e8
func_ov007_021551e8: ; 0x021551e8
    push {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r3, r1
    cmp r2, #0x0
    beq .L_021551f8
    mov r5, #0xb
    b .L_021551fa
.L_021551f8:
    mov r5, #0xa
.L_021551fa:
    lsl r2, r3, #0x1
    add r0, r3, r2
    add r2, r3, r2
    add r0, #0xb
    str r0, [sp, #0x0]
    add r0, sp, #0x4
    mov r1, #0x1
    add r2, #0x8
    mov r3, #0x1f
    blx func_ov007_021502ec
    ldr r0, [r4, #0x14]
    add r1, sp, #0x4
    mov r2, r5
    blx func_ov007_02151058
    add sp, #0xc
    pop {r4, r5, pc}
    thumb_func_end func_ov007_021551e8

    .byte 0x00, 0x00

    .global func_ov007_02155220
    thumb_func_start func_ov007_02155220
func_ov007_02155220: ; 0x02155220
    push {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r2, [r5, #0x30]
    mov r7, r1
    lsl r0, r2, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_021552ae
    cmp r2, #0x0
    beq .L_02155240
    cmp r2, #0x1
    beq .L_0215525c
    cmp r2, #0x4
    beq .L_02155286
    pop {r3, r4, r5, r6, r7, pc}
.L_02155240:
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x30]
    lsl r0, r0, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    pop {r3, r4, r5, r6, r7, pc}
.L_0215525c:
    mov r4, #0x1
.L_0215525e:
    lsl r0, r4, #0x2
    add r6, r5, r0
    ldr r0, [r6, #0x10]
    cmp r0, #0x0
    beq .L_0215527e
    ldr r0, [r0, #0x4]
    mov r1, r7
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r6, #0x10]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0215527e:
    add r4, r4, #0x1
    cmp r4, #0x3
    ble .L_0215525e
    pop {r3, r4, r5, r6, r7, pc}
.L_02155286:
    mov r4, #0x4
.L_02155288:
    lsl r0, r4, #0x2
    add r6, r5, r0
    ldr r0, [r6, #0x10]
    cmp r0, #0x0
    beq .L_021552a8
    ldr r0, [r0, #0x4]
    mov r1, r7
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r6, #0x10]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_021552a8:
    add r4, r4, #0x1
    cmp r4, #0x7
    ble .L_02155288
.L_021552ae:
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_02155220

    .global func_ov007_021552b0
    thumb_func_start func_ov007_021552b0
func_ov007_021552b0: ; 0x021552b0
    push {r3, lr}
    ldr r1, [r0, #0x30]
    lsl r1, r1, #0x2
    add r0, r0, r1
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_021552c6
    mov r1, #0x0
    blx func_ov007_0214f1bc
    pop {r3, pc}
.L_021552c6:
    mov r0, #0x1
    pop {r3, pc}
    thumb_func_end func_ov007_021552b0

    .byte 0x00, 0x00

    .global func_ov007_021552cc
    thumb_func_start func_ov007_021552cc
func_ov007_021552cc: ; 0x021552cc
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    ldr r7, .L_0215539c
    str r0, [sp, #0x0]
    mov r6, r1
    str r2, [sp, #0x4]
    mov r5, r3
    mov r4, #0x4
.L_021552dc:
    mov r0, r6
    mov r1, r7
    blx func_0200d12c
    lsl r2, r4, #0x2
    add r1, sp, #0x10
    str r0, [r1, r2]
    mov r0, r6
    mov r1, r7
    blx func_0200d12c
    mov r6, r1
    mov r0, r7
    mov r1, #0xa
    blx func_0200d12c
    subs r4, r4, #0x1
    mov r7, r0
    cmp r4, #0x0
    bgt .L_021552dc
    ldr r0, [sp, #0x20]
    str r6, [sp, #0x10]
    cmp r0, #0x0
    bne .L_0215531c
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_02155318
    ldr r5, [sp, #0x38]
    mov r4, #0x2
    b .L_02155320
.L_02155318:
    mov r4, #0x3
    b .L_02155320
.L_0215531c:
    ldr r5, [sp, #0x4]
    mov r4, #0x4
.L_02155320:
    mov r0, #0x0
    str r0, [sp, #0x8]
    b .L_02155392
.L_02155326:
    ldr r0, [sp, #0x8]
    mov r6, #0x0
    cmp r0, #0x0
    bne .L_02155332
    cmp r4, #0x0
    bne .L_02155350
.L_02155332:
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8f
    lsl r3, r4, #0x2
    add r2, sp, #0x10
    ldr r2, [r2, r3]
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    add r2, #0x15
    mov r3, #0x80
    blx func_ov007_021510f0
    mov r6, r0
    b .L_02155376
.L_02155350:
    lsl r1, r4, #0x2
    add r0, sp, #0x10
    ldr r7, [r0, r1]
    cmp r7, #0x0
    beq .L_02155376
    mov r0, #0x1
    str r0, [sp, #0x8]
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8f
    add r7, #0x15
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, r7
    mov r3, #0x80
    blx func_ov007_021510f0
    mov r6, r0
.L_02155376:
    cmp r6, #0x0
    beq .L_0215538e
    lsl r0, r5, #0xc
    str r0, [sp, #0xc]
    mov r0, r6
    add r1, sp, #0xc
    blx func_ov007_02154fb4
    ldr r0, [sp, #0x0]
    mov r1, r6
    blx func_ov007_0214f48c
.L_0215538e:
    add r5, r5, #0x6
    subs r4, r4, #0x1
.L_02155392:
    cmp r4, #0x0
    bge .L_02155326
    add sp, #0x24
    pop {r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215539c: .word 0x2710
    thumb_func_end func_ov007_021552cc

    .global func_ov007_021553a0
    thumb_func_start func_ov007_021553a0
func_ov007_021553a0: ; 0x021553a0
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    blx func_ov010_021a3264
    cmp r0, #0x0
    beq .L_021553b8
    mov r0, r5
    blx func_ov007_02154fd4
    b .L_02155798
.L_021553b8:
    mov r0, #0x4b
    lsl r0, r0, #0x2
    ldr r1, [r5, r0]
    cmp r1, #0x0
    beq .L_021553c4
    b .L_0215554c
.L_021553c4:
    add r0, r0, #0x4
    ldr r4, [r5, r0]
    blx func_ov010_0219a15c
    cmp r0, #0x0
    beq .L_021553e6
    mov r0, #0x4b
    mov r1, #0x1
    lsl r0, r0, #0x2
    str r1, [r5, r0]
    add r0, r0, #0x4
    str r1, [r5, r0]
    blx func_ov010_0219b620
    mov r1, #0x4e
    lsl r1, r1, #0x2
    str r0, [r5, r1]
.L_021553e6:
    cmp r4, #0x0
    bne .L_021553f4
    mov r0, #0x13
    lsl r0, r0, #0x4
    ldr r0, [r5, r0]
    cmp r0, #0x0
    bne .L_021553f6
.L_021553f4:
    b .L_021554fe
.L_021553f6:
    mov r0, r5
    str r0, [sp, #0x10]
    add r0, #0x5c
    mov r4, #0x0
    str r0, [sp, #0x10]
.L_02155400:
    mov r0, #0x4d
    lsl r0, r0, #0x2
    ldr r0, [r5, r0]
    cmp r4, r0
    bge .L_021554e4
    mov r0, #0x34
    mov r1, r4
    mul r1, r0
    ldr r0, [sp, #0x10]
    add r6, r0, r1
    mov r0, r4
    mov r1, #0x1
    blx func_ov010_0219b5ac
    mov r7, r0
    ldr r0, [r6, #0x20]
    ldr r1, .L_02155730
    blx func_ov007_0214f898
    mov r1, r7
    mov r2, #0xa
    blx func_ov007_021513b8
    mov r0, r4
    blx func_ov010_0219b5dc
    mov r7, r0
    mov r0, r4
    blx func_ov010_0219b604
    str r0, [sp, #0x14]
    mov r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x24]
    mov r1, r7
    mov r2, #0x6
    mov r3, #0x9
    bl func_ov007_021552cc
    mov r0, #0x37
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x24]
    ldr r1, [sp, #0x14]
    mov r2, #0x31
    mov r3, #0x34
    bl func_ov007_021552cc
    mov r0, #0x4e
    lsl r0, r0, #0x2
    ldr r0, [r5, r0]
    cmp r0, r4
    bne .L_021554d8
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8f
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x10
    mov r3, #0x7f
    blx func_ov007_021510f0
    ldr r1, .L_02155734
    str r0, [sp, #0xc]
    str r1, [sp, #0x1c]
    add r1, sp, #0x1c
    blx func_ov007_02154fb4
    ldr r0, [sp, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    add r0, #0x14
    ldr r7, [r0, #0x18]
    cmp r7, #0x0
    bne .L_0215549e
    ldr r0, [r0, #0xc]
    blx func_02036430
    mov r7, r0
.L_0215549e:
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    bne .L_021554ac
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_021554ac:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r7, #0x18]
    mov r1, #0x31
    mov r2, #0x4
    mov r3, #0x5
    blx func_0206ad90
    str r0, [r5, #0x4c]
    mov r1, #0x0
    strh r1, [r0, #0x18]
    ldr r1, .L_02155738
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    ldr r0, [r6, #0x24]
    ldr r1, [sp, #0xc]
    blx func_ov007_0214f48c
.L_021554d8:
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov007_021551e8
    b .L_021554ee
.L_021554e4:
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_ov007_021551e8
.L_021554ee:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_02155400
    ldr r0, [r5, #0x44]
    mov r1, #0x6c
    mov r2, #0x0
    bl func_ov012_021bd730
.L_021554fe:
    mov r2, #0x4b
    lsl r2, r2, #0x2
    ldr r0, [r5, r2]
    cmp r0, #0x0
    beq .L_02155516
    ldr r0, [r5, #0x34]
    add r2, #0x1c
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    ldr r3, [r0, #0x0]
    ldr r3, [r3, r2]
    blx r3
.L_02155516:
    mov r0, #0x4b
    lsl r0, r0, #0x2
    ldr r1, [r5, r0]
    cmp r1, #0x0
    bne .L_0215554c
    add r0, r0, #0x4
    ldr r0, [r5, r0]
    cmp r0, #0x0
    bne .L_0215554c
    blx func_ov010_0219ba34
    cmp r0, #0x0
    beq .L_0215554c
    blx func_ov010_0219b4a4
    cmp r0, #0x2
    ldr r0, [r5, #0x44]
    bge .L_02155544
    mov r1, #0x6d
    mov r2, #0x0
    bl func_ov012_021bd730
    b .L_0215554c
.L_02155544:
    mov r1, #0x6b
    mov r2, #0x0
    bl func_ov012_021bd730
.L_0215554c:
    blx func_ov010_0219b4a4
    mov r1, #0x4d
    lsl r1, r1, #0x2
    str r0, [r5, r1]
    mov r2, #0x0
    mov r0, #0x34
    b .L_0215556e
.L_0215555c:
    mov r1, r2
    mul r1, r0
    add r1, r5, r1
    ldr r1, [r1, #0x60]
    cmp r1, #0x16
    bge .L_0215556c
    mov r0, #0x0
    b .L_02155574
.L_0215556c:
    add r2, r2, #0x1
.L_0215556e:
    cmp r2, #0x4
    blt .L_0215555c
    mov r0, #0x1
.L_02155574:
    cmp r0, #0x0
    beq .L_02155598
    blx func_ov010_0219a93c
    cmp r0, #0x0
    bne .L_02155598
    mov r0, #0x4b
    lsl r0, r0, #0x2
    ldr r1, [r5, r0]
    cmp r1, #0x0
    beq .L_02155598
    add r0, #0x8
    ldr r0, [r5, r0]
    cmp r0, #0x1
    bgt .L_02155598
    mov r0, #0x3
    blx func_ov010_0219a998
.L_02155598:
    mov r0, r5
    str r0, [sp, #0x18]
    add r0, #0x5c
    mov r6, #0x0
    str r0, [sp, #0x18]
.L_021555a2:
    mov r0, #0x34
    mov r1, r6
    mul r1, r0
    ldr r0, [sp, #0x18]
    add r4, r0, r1
    mov r0, #0x4d
    lsl r0, r0, #0x2
    ldr r0, [r5, r0]
    str r0, [sp, #0x8]
    subs r0, r0, #0x1
    cmp r6, r0
    bge .L_021555c0
    mov r0, #0x1
    str r0, [sp, #0x4]
    b .L_021555c4
.L_021555c0:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_021555c4:
    mov r0, #0x13
    lsl r0, r0, #0x4
    ldr r0, [r5, r0]
    cmp r0, #0x0
    beq .L_021555d2
    mov r7, #0x1
    b .L_021555d4
.L_021555d2:
    mov r7, #0x0
.L_021555d4:
    mov r0, #0x4b
    lsl r0, r0, #0x2
    ldr r0, [r5, r0]
    cmp r0, #0x0
    beq .L_021555e2
    mov r2, #0x1
    b .L_021555e4
.L_021555e2:
    mov r2, #0x0
.L_021555e4:
    ldr r0, [r4, #0x4]
    cmp r0, #0x16
    bgt .L_0215561c
    mov r1, r0
    sub r1, #0xa
    bmi .L_02155616
    add r1, r1, r1
    add r1, pc
    ldrh r1, [r1, #0x6]
    lsl r1, r1, #0x10
    asr r1, r1, #0x10
    add pc, r1
    lsl r0, r2, #0x1
    lsl r2, r4, #0x1
    lsl r0, r4, #0x5
    lsl r0, r4, #0x5
    lsl r0, r4, #0x5
    lsl r4, r3, #0x3
    lsl r0, r4, #0x5
    lsl r0, r4, #0x5
    lsl r0, r4, #0x5
    lsl r2, r6, #0x3
    lsl r4, r7, #0x3
    lsl r6, r7, #0x4
    lsl r4, r2, #0x5
.L_02155616:
    cmp r0, #0x0
    beq .L_02155620
    b .L_0215575e
.L_0215561c:
    cmp r0, #0x1f
    b .L_0215575e
.L_02155620:
    mov r0, #0x0
    strb r0, [r4, #0xc]
    cmp r6, #0x3
    bge .L_02155646
    ldr r0, [r5, #0x28]
    mov r1, #0x0
    blx func_ov007_0214f1bc
    cmp r0, #0x0
    beq .L_02155658
    mov r0, #0x0
    str r0, [r4, #0x30]
    mov r0, r4
    mov r1, #0x3
    bl func_ov007_02155220
    mov r0, #0xa
    str r0, [r4, #0x4]
    b .L_0215575e
.L_02155646:
    str r0, [r4, #0x30]
    mov r0, #0xf
    str r0, [r4, #0x4]
    b .L_0215575e
    mov r0, r4
    bl func_ov007_021552b0
    cmp r0, #0x0
    bne .L_0215565a
.L_02155658:
    b .L_0215575e
.L_0215565a:
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    bne .L_021556a6
    cmp r7, #0x0
    beq .L_02155684
    mov r0, r4
    mov r1, #0x5
    bl func_ov007_02155220
    add r1, r6, #0x1
    mov r0, #0x1e
    mul r0, r1
    str r0, [r4, #0x8]
    mov r0, #0x13
    str r0, [r4, #0x4]
    mov r0, #0x1
    strb r0, [r4, #0xc]
    b .L_0215575e
.L_02155684:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_0215575e
    mov r0, r4
    mov r1, #0x5
    bl func_ov007_02155220
    mov r0, #0x1
    str r0, [r4, #0x30]
    mov r0, r4
    mov r1, #0x3
    bl func_ov007_02155220
    ldr r0, [r4, #0x4]
    subs r0, r0, #0x1
    str r0, [r4, #0x4]
    b .L_0215575e
.L_021556a6:
    cmp r7, #0x0
    beq .L_021556b8
    add r1, r6, #0x1
    mov r0, #0x1e
    mul r0, r1
    str r0, [r4, #0x8]
    mov r0, #0x13
    str r0, [r4, #0x4]
    b .L_0215575e
.L_021556b8:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_0215575e
    mov r0, r4
    mov r1, #0x5
    bl func_ov007_02155220
    mov r0, #0x0
    str r0, [r4, #0x30]
    mov r0, r4
    mov r1, #0x3
    bl func_ov007_02155220
    ldr r0, [r4, #0x4]
    subs r0, r0, #0x1
    str r0, [r4, #0x4]
    b .L_0215575e
    cmp r7, #0x0
    beq .L_0215575e
    mov r0, #0x0
    str r0, [r4, #0x30]
    add r1, r6, #0x1
    mov r0, #0x1e
    mul r0, r1
    str r0, [r4, #0x8]
    mov r0, #0x13
    str r0, [r4, #0x4]
    b .L_0215575e
    cmp r2, #0x0
    beq .L_0215575e
    mov r0, #0x14
    str r0, [r4, #0x4]
    b .L_0215575e
    ldr r0, [r4, #0x8]
    subs r0, r0, #0x1
    str r0, [r4, #0x8]
    bne .L_0215575e
    ldrb r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_02155710
    mov r0, r4
    mov r1, #0x5
    bl func_ov007_02155220
.L_02155710:
    ldr r0, [sp, #0x8]
    cmp r6, r0
    bge .L_02155728
    mov r0, #0x4
    str r0, [r4, #0x30]
    mov r0, r4
    mov r1, #0x3
    bl func_ov007_02155220
    mov r0, #0x15
    str r0, [r4, #0x4]
    b .L_0215575e
.L_02155728:
    mov r0, #0x1f
    str r0, [r4, #0x4]
    b .L_0215575e
    mov r8, r8
.L_02155730: .word 0x31305854
.L_02155734: .word 0xfffe3000
.L_02155738: .word 0x8df
    mov r0, r4
    bl func_ov007_021552b0
    cmp r0, #0x0
    beq .L_0215575e
    mov r0, #0x78
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    b .L_0215575e
    ldr r0, [r4, #0x8]
    subs r0, r0, #0x1
    str r0, [r4, #0x8]
    bne .L_0215575e
    mov r0, #0x1f
    str r0, [r4, #0x4]
.L_0215575e:
    add r6, r6, #0x1
    cmp r6, #0x4
    bge .L_02155766
    b .L_021555a2
.L_02155766:
    mov r2, #0x0
    mov r0, #0x34
    b .L_0215577e
.L_0215576c:
    mov r1, r2
    mul r1, r0
    add r1, r5, r1
    ldr r1, [r1, #0x60]
    cmp r1, #0x1f
    beq .L_0215577c
    mov r0, #0x0
    b .L_02155784
.L_0215577c:
    add r2, r2, #0x1
.L_0215577e:
    cmp r2, #0x4
    blt .L_0215576c
    mov r0, #0x1
.L_02155784:
    cmp r0, #0x0
    beq .L_02155798
    blx func_ov007_0214dd50
    mov r1, #0xe
    blx func_ov007_0214dd6c
    mov r0, r5
    blx func_ov007_02154fd4
.L_02155798:
    add sp, #0x20
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_021553a0

    .global func_ov007_0215579c
    arm_func_start func_ov007_0215579c
func_ov007_0215579c: ; 0x0215579c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215593c
    ldr r0, .L_02155940
    ldr r2, .L_02155944
    mov r3, #0x80
    bl func_0201a21c
    ldr r2, .L_02155940
    mov r1, #0x0
    mov r4, r0
    bl func_020517fc
    bl func_020310f4
    ldr r2, .L_02155948
    str r0, [r4, #0x0]
    ldr r1, .L_0215594c
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_02155950
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    ldr r0, [r4, #0x0]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    ldr r0, [r4, #0x0]
    bl func_ov007_02150d44
    blx func_ov012_021b65bc
    mov r0, #0x0
    bl func_02028920
    str r0, [r4, #0x8]
    bl func_ov010_0219becc
    bl func_ov010_0219bf0c
    mov r0, #0x4
    bl func_ov010_0219adf4
    mov r0, #0x4
    bl func_ov010_0219ae0c
    mov r2, #0x0
    mvn r1, #0x0
.L_02155848:
    add r0, r4, r2
    add r2, r2, #0x1
    strb r1, [r0, #0x5b8]
    cmp r2, #0x32
    blt .L_02155848
    ldr r1, .L_02155954
    str r4, [r4, #0x1c]
    str r1, [r4, #0x28]
    ldr r0, .L_02155958
    ldr r1, .L_0215595c
    str r0, [r4, #0x2c]
    str r1, [r4, #0x30]
    ldr r0, .L_02155960
    mov r3, #0x0
    str r0, [r4, #0x34]
    ldr r1, .L_02155964
    ldr r0, .L_02155968
    str r1, [r4, #0x38]
    str r0, [r4, #0x3c]
    strb r3, [r4, #0xc]
    mov r0, #0x1
    strb r0, [r4, #0xd]
    strb r3, [r4, #0xe]
    mov r0, #0x32
    str r0, [r4, #0x10]
    add r0, r4, #0x40
    str r0, [r4, #0x14]
    mov r2, r3
    mov r0, #0x1c
    b .L_021558cc
.L_021558c0:
    mla r1, r3, r0, r4
    strb r2, [r1, #0x40]
    add r3, r3, #0x1
.L_021558cc:
    ldr r1, [r4, #0x10]
    cmp r3, r1
    blt .L_021558c0
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215596c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r1, [r4, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    add r0, r4, #0xc
    bl func_ov007_0215656c
    str r0, [r4, #0x5ec]
    ldr r0, [r4, #0x0]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0215593c: .word data_ov007_02169d98
.L_02155940: .word 0x5f8
.L_02155944: .word data_ov007_02169d7c
.L_02155948: .word data_02093c04
.L_0215594c: .word data_020a0e80
.L_02155950: .word data_020a16c0
.L_02155954: .word func_ov007_02155970
.L_02155958: .word func_ov007_021559c0
.L_0215595c: .word func_ov007_021559e4
.L_02155960: .word func_ov007_021559f0
.L_02155964: .word func_ov007_02155a08
.L_02155968: .word func_ov007_02155988
.L_0215596c: .word func_ov007_02155a14
    arm_func_end func_ov007_0215579c

    .global func_ov007_02155970
    arm_func_start func_ov007_02155970
func_ov007_02155970: ; 0x02155970
    stmdb sp!, {r3, lr}
    bl func_ov010_021a3264
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02155970

    .global func_ov007_02155988
    arm_func_start func_ov007_02155988
func_ov007_02155988: ; 0x02155988
    stmdb sp!, {r3, lr}
    bl func_ov010_021a3264
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov010_0219bee8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    bl func_ov010_0219bf28
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02155988

    .global func_ov007_021559c0
    arm_func_start func_ov007_021559c0
func_ov007_021559c0: ; 0x021559c0
    ldr r2, .L_021559e0
    str r1, [r0, #0x5f0]
    cmp r1, r2
    addne r1, r0, r1
    addne r1, r1, #0x500
    ldrnesb r1, [r1, #0xb8]
    strne r1, [r0, #0x5f4]
    bx lr
.L_021559e0: .word 0x7ff0
    arm_func_end func_ov007_021559c0

    .global func_ov007_021559e4
    arm_func_start func_ov007_021559e4
func_ov007_021559e4: ; 0x021559e4
    mvn r1, #0x0
    str r1, [r0, #0x5f0]
    bx lr
    arm_func_end func_ov007_021559e4

    .global func_ov007_021559f0
    arm_func_start func_ov007_021559f0
func_ov007_021559f0: ; 0x021559f0
    ldr ip, .L_02155a04
    mov r0, r1
    mov r1, #0x0
    mov r2, r1
    bx ip
.L_02155a04: .word func_ov010_021a3228 ; data_ov011_021a3228
    arm_func_end func_ov007_021559f0

    .global func_ov007_02155a08
    arm_func_start func_ov007_02155a08
func_ov007_02155a08: ; 0x02155a08
    ldr ip, .L_02155a10
    bx ip
.L_02155a10: .word func_ov010_021a3248 ; data_ov011_021a3248
    arm_func_end func_ov007_02155a08

    .global func_ov007_02155a14
    arm_func_start func_ov007_02155a14
func_ov007_02155a14: ; 0x02155a14
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02073fe4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02155a38
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02155a38: .word func_ov007_02155a3c
    arm_func_end func_ov007_02155a14

    .global func_ov007_02155a3c
    arm_func_start func_ov007_02155a3c
func_ov007_02155a3c: ; 0x02155a3c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, [r0, #0x4]
    ldr r9, [r1, #0x10]
    ldr r1, [r9, #0x5ec]
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x224]
    cmp r1, #0x0
    beq .L_02155a6c
    ldr r0, [r0, #0x4]
    ldr r1, .L_02155c1c
    bl func_02028384
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02155a6c:
    bl func_ov010_0219a0e0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    bl func_ov010_0219bee8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r7, #0x0
    mov r8, r7
    add r11, r9, #0x40
    b .L_02155bb8
.L_02155a94:
    mov r0, r8
    bl func_ov010_0219d80c
    mov r5, r0
    bl func_ov007_02167cec
    cmp r0, #0x0
    beq .L_02155bb4
    mov r0, #0x1c
    mla r6, r7, r0, r11
    add r10, r9, r7
    mov r0, r5
    mov r4, #0x0
    bl func_ov007_02167d00
    add r1, r10, #0x500
    ldrsb r1, [r1, #0xb8]
    cmp r1, r0
    beq .L_02155ae8
    ldr r0, [r9, #0x18]
    mov r4, #0x1
    cmp r0, #0x0
    strlt r7, [r9, #0x18]
    b .L_02155b44
.L_02155ae8:
    mov r0, r5
    bl func_ov007_02167d18
    ldrsb r1, [r6, #0x1]
    cmp r1, r0
    mov r0, r5
    movne r4, #0x1
    bl func_ov007_02167d30
    mov r1, r0
    add r0, r6, #0x4
    mov r2, #0x14
    bl func_0201b2a4
    cmp r0, #0x0
    mov r0, r5
    movne r4, #0x1
    bl func_ov007_02167d08
    ldrb r1, [r6, #0x19]
    cmp r1, r0
    mov r0, r5
    movne r4, #0x1
    bl func_ov007_02167d10
    ldrb r1, [r6, #0x1a]
    cmp r1, r0
    movne r4, #0x1
.L_02155b44:
    cmp r4, #0x0
    beq .L_02155bb0
    mov r0, #0x1
    strb r0, [r6, #0x0]
    mov r0, r5
    bl func_ov007_02167d18
    strb r0, [r6, #0x1]
    mov r0, #0x1
    strb r0, [r6, #0x2]
    mov r0, r5
    bl func_ov007_02167d30
    add r1, r6, #0x4
    mov r2, #0x14
    bl func_02051890
    mov r0, #0x0
    strb r0, [r6, #0x18]
    mov r0, r5
    bl func_ov007_02167d08
    strb r0, [r6, #0x19]
    mov r0, r5
    bl func_ov007_02167d10
    strb r0, [r6, #0x1a]
    mov r0, #0x0
    strb r0, [r6, #0x1b]
    mov r0, r5
    bl func_ov007_02167d00
    strb r0, [r10, #0x5b8]
.L_02155bb0:
    add r7, r7, #0x1
.L_02155bb4:
    add r8, r8, #0x1
.L_02155bb8:
    bl func_ov010_0219d7ec
    cmp r8, r0
    blt .L_02155a94
    add r0, r9, r7
    add r0, r0, #0x500
    ldrsb r1, [r0, #0xb8]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_02155be8
    ldr r0, [r9, #0x18]
    cmp r0, #0x0
    strlt r7, [r9, #0x18]
.L_02155be8:
    mov r4, #0x0
    mvn r2, #0x0
    mov r0, #0x1c
    b .L_02155c0c
.L_02155bf8:
    mla r3, r7, r0, r9
    add r1, r9, r7
    strb r4, [r3, #0x40]
    strb r2, [r1, #0x5b8]
    add r7, r7, #0x1
.L_02155c0c:
    ldr r1, [r9, #0x10]
    cmp r7, r1
    blt .L_02155bf8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02155c1c: .word func_ov007_02155c20
    arm_func_end func_ov007_02155a3c

    .global func_ov007_02155c20
    arm_func_start func_ov007_02155c20
func_ov007_02155c20: ; 0x02155c20
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r1, [r4, #0x5f0]
    cmp r1, #0x0
    bge .L_02155c4c
    bl func_ov010_0219af04
    bl func_ov007_0214dd50
    mov r1, #0xe
    bl func_ov007_0214dd60
    b .L_02155c84
.L_02155c4c:
    ldr r0, .L_02155d10
    cmp r1, r0
    bne .L_02155c6c
    bl func_ov010_0219af04
    bl func_ov007_0214dd50
    mov r1, #0x11
    bl func_ov007_0214dd60
    b .L_02155c84
.L_02155c6c:
    bl func_ov007_0214dd50
    ldr r1, [r4, #0x5f4]
    bl func_ov007_0214dda4
    bl func_ov007_0214dd50
    mov r1, #0x12
    bl func_ov007_0214dd60
.L_02155c84:
    ldr r0, .L_02155d14
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02155d14
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02155d14
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_02155d14
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x0]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_02155d18
    ldr r2, .L_02155d1c
    ldr r3, [r1, #0x0]
    ldr r0, .L_02155d20
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_02155d10: .word 0x7ff0
.L_02155d14: .word data_020a0e18
.L_02155d18: .word data_02093c04
.L_02155d1c: .word data_020a16c0
.L_02155d20: .word data_020a0e80
    arm_func_end func_ov007_02155c20

    .global func_ov007_02155d24
    thumb_func_start func_ov007_02155d24
func_ov007_02155d24: ; 0x02155d24
    push {r4, r5, lr}
    sub sp, sp, #0x5c
    mov r5, r0
    mov r0, #0x45
    ldr r1, .L_02155ecc
    ldr r2, .L_02155ed0
    lsl r0, r0, #0x2
    mov r3, #0x71
    blx func_0201a21c
    mov r2, #0x45
    mov r1, #0x0
    lsl r2, r2, #0x2
    mov r4, r0
    blx func_020517fc
    blx func_020310f4
    ldr r1, .L_02155ed4
    str r0, [r4, #0x0]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_02155ed8
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_02155edc
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r4, #0x0]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    ldr r0, [r4, #0x0]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    blx func_ov010_0219b620
    blx func_ov010_0219b614
    blx func_02088330
    mov r0, r4
    add r0, #0xb0
    strb r5, [r0, #0x0]
    mov r0, #0x0
    blx func_ov010_0219b448
    mov r0, r4
    add r0, #0xb0
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_02155db6
    mov r0, #0x3
    blx func_ov010_0219adf4
    mov r0, #0x4
    blx func_ov010_0219ae0c
    mov r0, #0x1
    blx func_ov010_0219b1c4
    mov r0, r4
    mov r1, #0x0
    add r0, #0xb4
    str r1, [r0, #0x0]
    b .L_02155e1a
.L_02155db6:
    blx func_ov007_0214dd50
    blx func_ov007_0214ddb0
    mov r1, #0x43
    lsl r1, r1, #0x2
    str r0, [r4, r1]
    ldr r0, [r4, r1]
    add r1, sp, #0x0
    add r2, sp, #0xc
    blx func_ov010_0219b0e8
    add r0, sp, #0x0
    ldrb r0, [r0, #0x0]
    cmp r0, #0x4
    beq .L_02155de0
    add r0, sp, #0xc
    blx func_ov010_021a20dc
    cmp r0, #0x3
    blt .L_02155dea
.L_02155de0:
    mov r0, r4
    mov r1, #0x5
    add r0, #0xb4
    str r1, [r0, #0x0]
    b .L_02155e1a
.L_02155dea:
    add r0, sp, #0xc
    blx func_ov010_021a1f98
    cmp r0, #0x0
    bne .L_02155e08
    mov r0, #0x43
    lsl r0, r0, #0x2
    ldr r0, [r4, r0]
    blx func_ov010_0219b0b4
    mov r0, r4
    mov r1, #0x2
    add r0, #0xb4
    str r1, [r0, #0x0]
    b .L_02155e1a
.L_02155e08:
    add r0, sp, #0xc
    blx func_ov010_021a1dc4
    blx func_ov010_0219d674
    mov r0, r4
    mov r1, #0x4
    add r0, #0xb4
    str r1, [r0, #0x0]
.L_02155e1a:
    mov r0, #0x0
    blx func_02028920
    str r0, [r4, #0xc]
    ldr r0, .L_02155ee0
    str r4, [r4, #0x24]
    str r0, [r4, #0x30]
    ldr r0, .L_02155ee4
    mov r1, r4
    str r0, [r4, #0x34]
    ldr r0, .L_02155ee8
    add r1, #0xb0
    str r0, [r4, #0x38]
    ldr r0, .L_02155eec
    str r0, [r4, #0x3c]
    ldr r0, .L_02155ef0
    str r0, [r4, #0x40]
    mov r0, #0x0
    strb r0, [r4, #0x10]
    strb r0, [r4, #0x11]
    strb r0, [r4, #0x13]
    strb r0, [r4, #0x14]
    ldrb r1, [r1, #0x0]
    mov r3, r0
    strb r1, [r4, #0x15]
    mov r1, #0x4
    str r1, [r4, #0x1c]
    mov r1, r4
    add r1, #0x44
    str r1, [r4, #0x20]
    mov r1, #0x18
.L_02155e58:
    mov r2, r0
    mul r2, r1
    add r2, r4, r2
    add r2, #0x44
    add r0, r0, #0x1
    strb r3, [r2, #0x0]
    cmp r0, #0x4
    blt .L_02155e58
    blx func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02155ef4
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x8
    blx func_ov007_0214ed20
    blx func_02026f94
    str r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x8]
    ldr r1, .L_02155ef8
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x8]
    add r1, sp, #0x4
    blx func_ov007_0214ed20
    mov r0, r4
    add r0, #0x10
    blx func_ov007_02157b7c
    mov r1, r4
    add r1, #0xa4
    str r0, [r1, #0x0]
    ldr r0, [r4, #0x0]
    add sp, #0x5c
    pop {r4, r5, pc}
.L_02155ecc: .word data_ov007_02169dd0
.L_02155ed0: .word data_ov007_02169db4
.L_02155ed4: .word data_02093c04
.L_02155ed8: .word data_020a0e80
.L_02155edc: .word data_020a16c0
.L_02155ee0: .word func_ov007_02155f14
.L_02155ee4: .word func_ov007_02155ff4
.L_02155ee8: .word func_ov007_02156010
.L_02155eec: .word func_ov007_02156038
.L_02155ef0: .word func_ov007_02156048
.L_02155ef4: .word func_ov007_0215618c
.L_02155ef8: .word func_ov007_02156050
    thumb_func_end func_ov007_02155d24

    .global func_ov007_02155efc
    thumb_func_start func_ov007_02155efc
func_ov007_02155efc: ; 0x02155efc
    ldr r3, .L_02155f04
    mov r0, #0x1
    bx r3
    mov r8, r8
.L_02155f04: .word func_ov007_02155d24
    thumb_func_end func_ov007_02155efc

    .global func_ov007_02155f08
    thumb_func_start func_ov007_02155f08
func_ov007_02155f08: ; 0x02155f08
    ldr r3, .L_02155f10
    mov r0, #0x0
    bx r3
    mov r8, r8
.L_02155f10: .word func_ov007_02155d24
    thumb_func_end func_ov007_02155f08

    .global func_ov007_02155f14
    arm_func_start func_ov007_02155f14
func_ov007_02155f14: ; 0x02155f14
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_ov010_021a3264
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02155fe8
    ldrb r0, [r4, #0xa8]
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02155fe8
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    beq .L_02155fe4
    ldrb r0, [r4, #0xa9]
    cmp r0, #0x0
    bne .L_02155fe4
    bl func_ov010_0219af84
    cmp r0, #0x0
    beq .L_02155fe4
    mvn r0, #0x0
    str r0, [r4, #0xac]
    str r0, [r4, #0x10c]
    bl func_ov010_0219d6c4
    ldr r0, [r4, #0xa4]
    mov r1, #0x1
    blx func_ov007_021586bc
    ldr r0, [r4, #0xa4]
    blx func_ov007_021586a4
    mov r5, r0
    mov r0, #0x78
    mov r1, #0xb
    bl func_0207342c
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, r5
    mov r1, #0x51
    mov r3, r2
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
    ldr r4, .L_02155ff0
    b .L_02155fcc
.L_02155fc4:
    ldr r0, [r4, #0x0]
    blx r0
.L_02155fcc:
    mov r0, r5
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02155fc4
    mov r0, #0x0
    b .L_02155fe8
.L_02155fe4:
    mov r0, #0x1
.L_02155fe8:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02155ff0: .word data_020a0e18
    arm_func_end func_ov007_02155f14

    .global func_ov007_02155ff4
    thumb_func_start func_ov007_02155ff4
func_ov007_02155ff4: ; 0x02155ff4
    push {r3, lr}
    add r0, #0xa4
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_ov007_021586bc
    mov r0, #0x0
    blx func_ov010_0219b1c4
    mov r0, #0x1
    blx func_ov010_0219b26c
    pop {r3, pc}
    thumb_func_end func_ov007_02155ff4

    .byte 0x00, 0x00

    .global func_ov007_02156010
    thumb_func_start func_ov007_02156010
func_ov007_02156010: ; 0x02156010
    push {r3, lr}
    mov r1, r0
    mov r2, #0x0
    mvn r2, r2
    add r1, #0xac
    str r2, [r1, #0x0]
    add r0, #0xb4
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02156030
    mov r0, #0x0
    blx func_ov010_0219b1c4
    blx func_ov010_0219ae88
    pop {r3, pc}
.L_02156030:
    blx func_ov010_0219af04
    pop {r3, pc}
    thumb_func_end func_ov007_02156010

    .byte 0x00, 0x00

    .global func_ov007_02156038
    thumb_func_start func_ov007_02156038
func_ov007_02156038: ; 0x02156038
    ldr r3, .L_02156044
    mov r0, r1
    mov r1, #0x0
    mov r2, r1
    bx r3
    mov r8, r8
.L_02156044: .word func_ov010_021a3228 ; data_ov011_021a3228
    thumb_func_end func_ov007_02156038

    .global func_ov007_02156048
    thumb_func_start func_ov007_02156048
func_ov007_02156048: ; 0x02156048
    ldr r3, .L_0215604c
    bx r3
.L_0215604c: .word func_ov010_021a3248 ; data_ov011_021a3248
    thumb_func_end func_ov007_02156048

    .global func_ov007_02156050
    arm_func_start func_ov007_02156050
func_ov007_02156050: ; 0x02156050
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_ov010_0219b620
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    add r1, r4, #0x100
    ldrh r0, [r1, #0x10]
    cmp r0, #0x0
    beq .L_021560c4
    mov r0, #0x1
    strb r0, [r4, #0x12]
    ldrh r2, [r1, #0x10]
    sub r2, r2, #0x1
    strh r2, [r1, #0x10]
    ldrh r1, [r1, #0x10]
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov010_0219b2e4
    bl func_ov010_0219ccbc
    bl func_02088808
    mov r0, #0x2
    str r0, [r4, #0xac]
    mov r0, #0x1
    strb r0, [r4, #0xa8]
    ldr r0, [r5, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021560c4:
    bl func_ov010_0219b1f8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x1
    ldr r6, .L_02156188
    strb r0, [r4, #0x12]
    mov r7, #0x0
.L_021560e0:
    ldr r0, [r6, #0x0]
    blx r0
    add r7, r7, #0x1
    cmp r7, #0x3c
    blo .L_021560e0
    mov r0, #0x1
    bl func_ov010_0219b2e4
    ldr r6, .L_02156188
    b .L_0215610c
.L_02156104:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215610c:
    bl func_ov010_0219b36c
    cmp r0, #0x0
    beq .L_02156104
    bl func_ov010_0219b408
    cmp r0, #0x0
    bne .L_02156160
    bl func_ov010_0219b614
    cmp r0, #0x0
    bne .L_02156140
    mov r0, #0x1
    bl func_ov010_0219b1c4
    mov r0, #0x0
    bl func_ov010_0219b26c
.L_02156140:
    mov r1, #0x0
    strb r1, [r4, #0x12]
    ldr r0, [r4, #0xa4]
    blx func_ov007_021586bc
    mov r0, #0x78
    mov r1, #0x2
    bl func_0207342c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02156160:
    mov r0, #0x1
    bl func_ov010_0219b1c4
    bl func_ov010_0219ccbc
    bl func_02088808
    mov r0, #0x1
    str r0, [r4, #0xac]
    strb r0, [r4, #0xa8]
    ldr r0, [r5, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02156188: .word data_020a0e18
    arm_func_end func_ov007_02156050

    .global func_ov007_0215618c
    thumb_func_start func_ov007_0215618c
func_ov007_0215618c: ; 0x0215618c
    push {r4, lr}
    mov r4, r0
    blx func_02073fe4
    cmp r0, #0x0
    beq .L_021561a0
    ldr r0, [r4, #0x4]
    ldr r1, .L_021561a4
    blx func_02028384
.L_021561a0:
    pop {r4, pc}
    mov r8, r8
.L_021561a4: .word func_ov007_021561a8
    thumb_func_end func_ov007_0215618c

    .global func_ov007_021561a8
    thumb_func_start func_ov007_021561a8
func_ov007_021561a8: ; 0x021561a8
    push {r3, r4, r5, r6, r7, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    mov r1, r4
    add r1, #0xa4
    ldr r1, [r1, #0x0]
    ldr r2, [r1, #0x4]
    mov r1, #0x89
    lsl r1, r1, #0x2
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_021561ca
    ldr r0, [r0, #0x4]
    ldr r1, .L_02156438
    blx func_02028384
    pop {r3, r4, r5, r6, r7, pc}
.L_021561ca:
    mov r0, r4
    add r0, #0xb4
    ldr r0, [r0, #0x0]
    cmp r0, #0x1
    bne .L_021561e0
    blx func_ov010_0219b634
    cmp r0, #0x0
    beq .L_021561e0
    blx func_ov010_0219af04
.L_021561e0:
    mov r0, r4
    add r0, #0xb4
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_021561f6
    cmp r0, #0x1
    beq .L_021561f6
    blx func_ov010_0219b620
    cmp r0, #0x0
    ble .L_021562b2
.L_021561f6:
    blx func_ov010_0219b620
    str r0, [r4, #0x18]
    mov r0, r4
    add r0, #0xb4
    ldr r0, [r0, #0x0]
    ldr r5, [r4, #0x20]
    cmp r0, #0x2
    bne .L_0215621a
    mov r0, #0x1
    add r4, #0xb4
    str r0, [r4, #0x0]
    blx func_ov010_0219b620
    blx func_ov010_0219b564
    blx func_ov010_021a220c
.L_0215621a:
    mov r4, #0x0
    mov r6, r4
    mov r7, #0x1
.L_02156220:
    mov r0, r4
    mov r1, #0x0
    blx func_ov010_0219b5ac
    cmp r0, #0x0
    beq .L_02156244
    mov r1, #0x18
    mov r2, r4
    mul r2, r1
    add r1, r5, r2
    strb r7, [r5, r2]
    mov r2, #0x0
    strb r2, [r1, #0x1]
    add r1, r1, #0x4
    mov r2, #0x14
    blx func_02051890
    b .L_0215624e
.L_02156244:
    mov r0, #0x18
    mul r0, r4
    add r1, r5, r0
    strb r6, [r5, r0]
    strb r6, [r1, #0x1]
.L_0215624e:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_02156220
    mov r4, #0x0
    blx func_ov010_0219b614
    cmp r0, #0x0
    bne .L_02156270
    blx func_ov010_0219a400
    mov r4, r0
    mov r0, #0x0
    mov r1, #0x32
    blx func_ov010_0219d6f0
    add r4, r4, r0
    b .L_02156288
.L_02156270:
    blx func_ov010_0219b0cc
    cmp r0, #0x0
    blt .L_02156288
    mov r0, r4
    blx func_ov010_0219b4f4
    cmp r0, #0x0
    beq .L_02156288
    blx func_ov010_021a21f0
    mov r4, r0
.L_02156288:
    cmp r4, #0x0
    ble .L_021562c2
    mov r6, #0x0
    mov r1, #0x1
    mov r0, #0x18
    b .L_021562a8
.L_02156294:
    mov r2, r6
    mul r2, r0
    add r3, r5, r2
    ldrsb r2, [r5, r2]
    cmp r2, #0x0
    bne .L_021562a6
    strb r1, [r3, #0x0]
    strb r1, [r3, #0x1]
    subs r4, r4, #0x1
.L_021562a6:
    add r6, r6, #0x1
.L_021562a8:
    cmp r6, #0x4
    bge .L_021562c2
    cmp r4, #0x0
    bgt .L_02156294
    pop {r3, r4, r5, r6, r7, pc}
.L_021562b2:
    mov r0, #0x0
    mov r1, #0x43
    mvn r0, r0
    lsl r1, r1, #0x2
    str r0, [r4, #0x18]
    ldr r0, [r4, r1]
    cmp r0, #0x0
    bge .L_021562c4
.L_021562c2:
    b .L_02156436
.L_021562c4:
    subs r1, r1, #0x3
    mov r2, r4
    add r1, r4, r1
    add r2, #0xb8
    blx func_ov010_0219b0e8
    mov r1, #0x42
    lsl r1, r1, #0x2
    strb r0, [r4, r1]
    mov r0, r4
    add r0, #0xb4
    ldr r0, [r0, #0x0]
    cmp r0, #0x5
    bls .L_021562e2
    b .L_021563ec
.L_021562e2:
    add r0, r0, r0
    add r0, pc
    ldrh r0, [r0, #0x6]
    lsl r0, r0, #0x10
    asr r0, r0, #0x10
    add pc, r0
.L_021562ee: ; jump table
    .short .L_021563ec - .L_021562ee - 2
    .short .L_021563ec - .L_021562ee - 2
    .short .L_02156382 - .L_021562ee - 2
    .short .L_0215634e - .L_021562ee - 2
    .short .L_021562fa - .L_021562ee - 2
    .short .L_021563dc - .L_021562ee - 2
.L_021562fa:
    ldrb r0, [r4, r1]
    mov r5, r4
    add r5, #0xb8
    cmp r0, #0x0
    beq .L_02156318
    add r0, r1, #0x1
    ldrb r0, [r4, r0]
    cmp r0, #0x4
    beq .L_02156318
    mov r0, r5
    mov r1, #0x2
    blx func_ov010_021a1f34
    cmp r0, #0x0
    bne .L_02156328
.L_02156318:
    blx func_ov010_0219af04
    mov r1, #0x0
    mov r0, r4
    mvn r1, r1
    add r0, #0xac
    str r1, [r0, #0x0]
    b .L_021563ec
.L_02156328:
    mov r0, r5
    blx func_ov010_0219b1ec
    cmp r0, #0x0
    beq .L_021563ec
    mov r0, #0x43
    lsl r0, r0, #0x2
    ldr r0, [r4, r0]
    blx func_ov010_0219b0b4
    mov r0, r4
    mov r1, #0x2
    add r0, #0xb4
    str r1, [r0, #0x0]
    mov r1, #0xb4
    mov r0, r1
    add r0, #0x5c
    strh r1, [r4, r0]
    b .L_021563ec
.L_0215634e:
    mov r5, r4
    add r5, #0xb8
    blx func_ov010_0219b564
    mov r1, #0x0
    blx func_ov010_021a1f34
    cmp r0, #0x0
    beq .L_021563ec
    mov r0, #0x4
    blx func_ov010_0219adf4
    mov r0, r5
    blx func_ov010_021a1dc4
    blx func_ov010_0219d674
    mov r0, r4
    mov r1, #0x4
    add r0, #0xb4
    str r1, [r0, #0x0]
    mov r0, r4
    mov r1, #0x0
    add r0, #0xa9
    strb r1, [r0, #0x0]
    b .L_021563ec
.L_02156382:
    ldrb r0, [r4, r1]
    mov r5, r4
    add r5, #0xb8
    cmp r0, #0x0
    beq .L_02156398
    mov r0, r5
    mov r1, #0x2
    blx func_ov010_021a1f34
    cmp r0, #0x0
    bne .L_021563a8
.L_02156398:
    blx func_ov010_0219af04
    mov r1, #0x0
    mov r0, r4
    mvn r1, r1
    add r0, #0xac
    str r1, [r0, #0x0]
    b .L_021563ec
.L_021563a8:
    mov r0, r5
    blx func_ov010_021a1f68
    cmp r0, #0x0
    bne .L_021563ec
    blx func_ov010_0219af04
    mov r0, r5
    blx func_ov010_021a20dc
    cmp r0, #0x3
    blt .L_021563ca
    mov r0, r4
    mov r1, #0x5
    add r0, #0xb4
    str r1, [r0, #0x0]
    b .L_021563ec
.L_021563ca:
    mov r0, r4
    mov r1, #0x3
    add r0, #0xb4
    str r1, [r0, #0x0]
    mov r0, r4
    mov r1, #0x1
    add r0, #0xa9
    strb r1, [r0, #0x0]
    b .L_021563ec
.L_021563dc:
    mov r0, r4
    mov r1, #0x1
    add r0, #0xa8
    strb r1, [r0, #0x0]
    mov r0, r4
    subs r1, r1, #0x2
    add r0, #0xac
    str r1, [r0, #0x0]
.L_021563ec:
    ldr r5, [r4, #0x20]
    mov r0, #0x1
    strb r0, [r5, #0x0]
    mov r0, #0x0
    strb r0, [r5, #0x1]
    mov r0, r4
    add r0, #0xc0
    add r1, r5, #0x4
    mov r2, #0x14
    blx func_02051890
    ldr r0, .L_0215643c
    mov r1, #0x18
    ldrb r0, [r4, r0]
    add r6, r0, #0x1
    mov r0, #0x1
    mov r2, r0
    b .L_0215641c
.L_02156410:
    mov r3, r0
    mul r3, r1
    add r4, r5, r3
    strb r2, [r5, r3]
    strb r2, [r4, #0x1]
    add r0, r0, #0x1
.L_0215641c:
    cmp r0, r6
    bge .L_02156424
    cmp r0, #0x4
    blt .L_02156410
.L_02156424:
    mov r3, #0x0
    mov r1, #0x18
    b .L_02156432
.L_0215642a:
    mov r2, r0
    mul r2, r1
    strb r3, [r5, r2]
    add r0, r0, #0x1
.L_02156432:
    cmp r0, #0x4
    blt .L_0215642a
.L_02156436:
    pop {r3, r4, r5, r6, r7, pc}
.L_02156438: .word func_ov007_02156440
.L_0215643c: .word 0x109
    thumb_func_end func_ov007_021561a8

    .global func_ov007_02156440
    arm_func_start func_ov007_02156440
func_ov007_02156440: ; 0x02156440
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    ble .L_02156484
    bl func_ov010_0219b614
    cmp r0, #0x0
    beq .L_02156468
    bl func_ov010_0219d6c4
.L_02156468:
    bl func_ov010_0219b614
    bl func_ov010_0219a564
    bl func_02087600
    bl func_ov007_0214dd50
    mov r1, #0xf
    bl func_ov007_0214dd6c
    b .L_02156494
.L_02156484:
    bl func_ov010_0219d6c4
    bl func_ov007_0214dd50
    mov r1, #0x10
    bl func_ov007_0214dd60
.L_02156494:
    ldr r0, .L_0215655c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215655c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215655c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215655c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_021564dc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021564dc:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_021564f4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021564f4:
    ldr r0, [r4, #0x0]
    bl func_ov007_02150dbc
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    ble .L_02156518
    bl func_ov010_0219a93c
    cmp r0, #0x0
    bne .L_02156518
    bl func_ov010_0219bf68
.L_02156518:
    blx func_ov012_021b65cc
    ldr r1, .L_02156560
    ldr r2, .L_02156564
    ldr r3, [r1, #0x0]
    ldr r0, .L_02156568
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_0215655c: .word data_020a0e18
.L_02156560: .word data_02093c04
.L_02156564: .word data_020a16c0
.L_02156568: .word data_020a0e80
    arm_func_end func_ov007_02156440

    .global func_ov007_0215656c
    arm_func_start func_ov007_0215656c
func_ov007_0215656c: ; 0x0215656c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4c
    ldr r1, .L_0215706c
    mov r4, r0
    ldr r2, .L_02157070
    mov r0, #0x7c
    mov r3, #0xe0
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x7c
    mov r9, r0
    bl func_020517fc
    bl func_020310f4
    str r0, [r9, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    ldr r1, .L_02157074
    ldr r0, .L_02157078
    ldr r3, [r1, #0x0]
    ldr r2, [r0, #0x0]
    ldr r5, [r9, #0x4]
    sub r3, r3, #0x1
    ldr r0, .L_0215707c
    str r3, [r1, #0x0]
    str r2, [r0, r3, lsl #0x2]
    ldr r0, [r5, #0x4]
    bl func_020314a0
    ldr r0, [r9, #0x4]
    bl func_ov007_02150d44
    blx func_ov012_021b65bc
    bl func_02087688
    str r4, [r9, #0x70]
    ldr r1, [r4, #0x14]
    cmp r1, #0x0
    beq .L_0215660c
    ldr r0, [r4, #0x10]
    blx r1
.L_0215660c:
    mov r0, #0x0
    bl func_02028920
    str r0, [r9, #0x10]
    mov r3, #0x1
    mov r0, #0x20
    mov r1, #0x40
    mov r2, #0x4000
    strb r3, [r9, #0x6d]
    bl func_ov007_02150678
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov007_021509ac
    str r0, [r9, #0x0]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov007_02150e14
    mov r0, #0x2
    bl func_0203b414
    ldr r1, .L_02157080
    ldr r2, [r0, #0x88]
    ldr r0, [r1, #0x8]
    ldr r1, [r1, #0x0]
    bl func_ov007_02150f80
    str r0, [r9, #0x18]
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    ldr r0, .L_02157080
    ldr r0, [r0, #0x4]
    bl func_ov007_02150f54
    mov r6, #0x0
    ldr r5, .L_02157084
    str r0, [r9, #0x28]
    mov r4, r6
.L_02156698:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r9, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x20]
    cmp r6, #0x2
    blt .L_02156698
    ldr r1, .L_02157088
    ldr r2, .L_0215708c
    ldr r3, .L_02157090
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_021566e8
    ldr r1, .L_02157094
    ldr r2, .L_02157098
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r4, r0
.L_021566e8:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02156704
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02156704:
    ldr r1, .L_0215709c
    ldr r2, .L_021570a0
    ldr r3, .L_021570a4
    mov r0, #0xbc
    ldr r4, [r4, #0x18]
    bl func_0201a21c
    movs r5, r0
    beq .L_02156734
    ldr r1, .L_021570a8
    mov r2, #0x0
    blx func_ov012_021af358
    mov r5, r0
.L_02156734:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02156750
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02156750:
    ldr r3, [r5, #0x18]
    mov r0, #0x10
    ldr r1, [r3, #0x4]
    mov r2, r4
    str r0, [r1, #0x94]
    str r0, [r1, #0x98]
    ldr r5, [r3, #0x4]
    mov r6, #0xb
    mov r0, #0x1
    mov r1, #0x0
    str r6, [r5, #0x9c]
    blx func_ov012_021b3b7c
    ldr r2, .L_021570ac
    mov r3, #0x1
    ldr r1, .L_021570b0
    mov r0, r4
    str r3, [r2, #0x0]
    bl func_ov007_0214f898
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_021567b8
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_021567b8:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_021567d4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_021567d4:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x11
    mov r2, #0x4
    mov r3, #0x5
    bl func_0206ad90
    mov r2, r0
    str r0, [r9, #0x60]
    mov r1, #0x0
    strh r1, [r2, #0x18]
    ldr r0, .L_021570b4
    mov r1, #0x1
    strh r0, [r2, #0x16]
    mov r0, #0x1e
    strb r0, [r2, #0x1a]
    strb r1, [r2, #0x1c]
    mov r0, r4
    strb r1, [r2, #0x1b]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r9, #0x0]
    bl func_ov007_02150b44
    str r0, [r9, #0x2c]
    bl func_0203b404
    ldr r3, [r0, #0x88]
    ldr r0, [r9, #0x0]
    mov r1, #0x8e0000
    mov r2, #0x0
    bl func_ov007_02150b7c
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    ldr r0, [r9, #0x0]
    bl func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_021570b8
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    str r2, [r1, #0x124]
    str r4, [r9, #0x3c]
    ldr r1, [r9, #0x2c]
    mov r0, r9
    bl func_ov007_0215145c
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_021570bc
    ldr r0, [r5, #0x4]
    str r1, [r0, #0x124]
    str r5, [r9, #0x30]
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_021570c0
    add r0, sp, #0x40
    mov r1, r5
    bl func_ov007_0214f2a4
    ldr r2, .L_021570c4
    add r0, sp, #0x38
    mov r1, r5
    bl func_ov007_0214f2a4
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0xc0000
    str r0, [sp, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x34]
    mov r0, r5
    add r1, sp, #0x34
    add r2, sp, #0x30
    bl func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x28]
    str r0, [sp, #0x2c]
    mov r0, r5
    add r1, sp, #0x2c
    add r2, sp, #0x28
    bl func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r2, #0x18
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x40]
    ldr r2, .L_021570c8
    ldr r3, [sp, #0x44]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    bl func_020239a0
    mov r3, #0x0
    add r1, sp, #0x24
    add r2, sp, #0x20
    mov r0, r5
    str r3, [sp, #0x20]
    str r3, [sp, #0x24]
    bl func_ov007_0214f218
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    ldr r2, .L_021570cc
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_021570d0
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_021570ac
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov007_0214f2f4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    str r1, [r0, #0x124]
    str r4, [r9, #0x40]
    ldr r6, [r9, #0x18]
    cmp r6, #0x0
    beq .L_02156b30
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    mov r1, r6
    bl func_ov007_0214f48c
.L_02156b30:
    ldr r4, .L_021570ac
    mov r0, #0x190
    ldr r1, .L_021570d4
    ldr r2, .L_021570d8
    sub r3, r0, #0x37
    ldr r6, [r4, #0x0]
    ldr r4, [r5, #0x4]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02156b68
    ldr r3, .L_021570dc
    mov r1, r4
    mov r2, r6
    blx func_ov012_021ae114
.L_02156b68:
    bl func_ov007_0214f340
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r1, [r8, #0x4]
    mov r0, #0x90
    str r0, [r1, #0x170]
    mov r0, #0x10
    str r0, [r1, #0x174]
    ldr r0, [r8, #0x4]
    mov r1, #0x6
    str r1, [r0, #0x180]
    ldr r1, [r9, #0x40]
    mov r0, r8
    bl func_ov007_02152468
    mov r0, #0x48000
    str r0, [sp, #0x10]
    mov r0, #0x30000
    str r0, [sp, #0xc]
    mov r0, r8
    add r1, sp, #0xc
    add r2, sp, #0x10
    bl func_ov007_0214f218
    mov r0, r8
    mov r1, #0x0
    bl func_ov007_021524a0
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0x114]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1a8]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r1, .L_021570e0
    bl func_02028384
    mov r0, #0x80000
    str r0, [sp, #0x14]
    mov r0, r8
    add r1, sp, #0x14
    bl func_ov007_0214ed20
    ldr r0, [r8, #0x4]
    mov r2, #0x1
    str r2, [r0, #0x13c]
    str r8, [r9, #0x44]
    ldr r0, [r9, #0x70]
    ldr r1, .L_0215706c
    ldr r0, [r0, #0x4]
    ldr r2, .L_021570e4
    str r0, [r9, #0x50]
    add r0, r0, #0x6
    str r0, [r9, #0x54]
    ldr r3, .L_021570e8
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r9, #0x48]
    ldr r0, [r9, #0x54]
    ldr r1, .L_0215706c
    ldr r2, .L_021570e4
    ldr r3, .L_021570ec
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r9, #0x4c]
    mov r10, #0x0
    ldr r4, .L_021570f0
    ldr r11, .L_021570f4
    b .L_02156f04
.L_02156c8c:
    ldr r0, [r8, #0x4]
    blx func_ov012_021ae3a4
    bl func_ov007_0214f340
    ldr r2, [r9, #0x48]
    mov r7, r0
    mov r1, #0x0
    str r7, [r2, r10, lsl #0x2]
    bl func_ov007_021524a0
    ldr r0, [r7, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    cmp r10, #0x6
    ldr r0, [r7, #0x4]
    bge .L_02156ce0
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_02156cf0
.L_02156ce0:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd8]
    blx r2
.L_02156cf0:
    ldr r1, .L_021570ac
    mov r0, r7
    ldr r1, [r1, #0x0]
    bl func_ov007_0214f2f4
    mov r6, r0
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    ldr r0, [r4, #0x0]
    ldr r3, [r1, #0x4]
    sub r2, r0, #0x1
    ldr r1, [r11, #0x0]
    ldr r0, .L_021570f8
    str r2, [r4, #0x0]
    str r3, [r11, #0x0]
    str r1, [r0, r2, lsl #0x2]
    ldr r0, [r9, #0x28]
    ldr r0, [r0, #0x4]
    bl func_02032a4c
    bl func_ov007_0214f340
    mov r5, r0
    mov r1, #0x2
    bl func_ov007_021524c8
    ldr r2, [r5, #0x4]
    ldr r1, .L_021570fc
    mov r0, r5
    str r1, [r2, #0x54]
    mov r1, #0xc4000
    str r1, [sp, #0x18]
    add r1, sp, #0x18
    bl func_ov007_0214f27c
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r5
    mov r1, r6
    bl func_ov007_02152468
    mov r1, r5
    mov r0, r6
    bl func_ov007_0214f48c
    ldr r2, [r4, #0x0]
    mov r0, #0xc4000
    add r1, r2, #0x1
    str r1, [r4, #0x0]
    ldr r1, .L_021570f8
    str r0, [sp, #0x1c]
    ldr r2, [r1, r2, lsl #0x2]
    mov r0, r6
    add r1, sp, #0x1c
    str r2, [r11, #0x0]
    bl func_ov007_0214f27c
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r2, [r6, #0x4]
    mov r0, #0x0
    strb r0, [r2, #0xac]
    ldr r0, [r9, #0x4c]
    mov r1, r9
    str r6, [r0, r10, lsl #0x2]
    ldr r0, [r6, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r6, #0x4]
    str r10, [r0, #0x124]
    ldr r0, [r6, #0x4]
    bl func_02023940
    ldr r2, .L_021570c4
    add r0, sp, #0x4
    mov r1, r6
    bl func_ov007_0214f2a4
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    ldr r0, [r6, #0x4]
    ldr r2, .L_02157100
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r6, #0x4]
    mov r2, #0x7
    mov r1, r0
    blx func_ov012_021b4104
    ldr r1, .L_02157104
    ldr r2, .L_02157108
    mov r0, #0x0
    bl func_ov007_0214f3bc
    mov r1, r0
    mov r0, r6
    bl func_02020e98
    ldr r0, .L_02157104
    bl func_ov007_0214f474
    mov r5, r0
    ldr r0, .L_02157104
    bl func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r6, #0x4]
    mov r2, r5
    blx func_ov012_021b5900
    ldr r0, [r7, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r7, #0x4]
    str r10, [r0, #0x124]
    add r10, r10, #0x1
.L_02156f04:
    ldr r0, [r9, #0x54]
    cmp r10, r0
    blt .L_02156c8c
    ldr r0, [r9, #0x70]
    mov r1, #0x0
    str r1, [r0, #0xc]
    ldr r0, [r9, #0x4]
    bl func_ov007_02150dbc
    mov r2, #0x1
    sub r3, r2, #0x2
    mov r0, #0xa
    mov r1, #0x0
    blx func_ov012_021bcf1c
    str r0, [r9, #0x5c]
    ldr r0, [r9, #0x70]
    mov r2, #0x0
    ldrb r0, [r0, #0x2]
    cmp r0, #0x0
    ldr r0, [r9, #0x5c]
    beq .L_02156f60
    mov r1, #0x63
    blx func_ov012_021bd730
    b .L_02156f68
.L_02156f60:
    mov r1, #0x62
    blx func_ov012_021bd730
.L_02156f68:
    mov r1, #0x1
    mov r2, r1
    mov r0, #0x0
    bl func_ov012_021ba49c
    str r0, [r9, #0x64]
    ldr r0, [r9, #0x70]
    ldr r2, [r0, #0x28]
    cmp r2, #0x0
    beq .L_02156f98
    ldr r0, [r0, #0x10]
    ldr r1, [r9, #0x64]
    blx r2
.L_02156f98:
    ldr r0, .L_0215710c
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x5
    bl func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    bl func_0207361c
    bl func_02026f94
    str r0, [r9, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x8]
    ldr r1, .L_02157110
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x80000
    str r0, [sp, #0x48]
    ldr r0, [r9, #0x8]
    add r1, sp, #0x48
    bl func_ov007_0214ed20
    blx func_ov012_021b65bc
    ldr r0, [r9, #0x70]
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    bne .L_02157030
    ldr r0, [r9, #0x30]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_02157030:
    ldr r0, [r9, #0x3c]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    bl func_02086c08
    cmp r0, #0x0
    ldreq r0, .L_02157114
    moveq r1, #0x1
    ldreq r0, [r0, #0x0]
    streqb r1, [r0, #0x430]
    ldr r0, [r9, #0x4]
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215706c: .word data_ov007_02169f34
.L_02157070: .word data_ov007_02169ef0
.L_02157074: .word data_02093c04
.L_02157078: .word data_020a0e80
.L_0215707c: .word data_020a16c0
.L_02157080: .word data_ov007_02169dec
.L_02157084: .word data_ov007_02169df8
.L_02157088: .word data_ov007_02169644
.L_0215708c: .word data_ov007_02169e7c
.L_02157090: .word 0x1de
.L_02157094: .word func_ov007_0215775c
.L_02157098: .word func_ov007_021577b8
.L_0215709c: .word data_ov007_021699c4
.L_021570a0: .word data_ov007_02169e8c
.L_021570a4: .word 0x212
.L_021570a8: .word func_ov007_021575bc
.L_021570ac: .word data_ov012_021d5154
.L_021570b0: .word 0x31305053
.L_021570b4: .word 0x8df
.L_021570b8: .word func_ov007_0215749c
.L_021570bc: .word 0x101
.L_021570c0: .word data_ov007_02169f50
.L_021570c4: .word data_ov007_02169f5c
.L_021570c8: .word 0x494c
.L_021570cc: .word func_ov007_021573e4
.L_021570d0: .word func_ov007_02157454
.L_021570d4: .word data_ov007_021699e4
.L_021570d8: .word data_ov007_02169e84
.L_021570dc: .word func_ov007_02152408
.L_021570e0: .word func_ov007_021578dc
.L_021570e4: .word data_ov007_02169f0c
.L_021570e8: .word 0x2e6
.L_021570ec: .word 0x2e7
.L_021570f0: .word data_02093c08
.L_021570f4: .word data_020a0dd0
.L_021570f8: .word data_020a16d0
.L_021570fc: .word 0x67625053
.L_02157100: .word func_ov007_021574f0
.L_02157104: .word data_ov007_02169e00
.L_02157108: .word data_02093c8c
.L_0215710c: .word data_020a0e18
.L_02157110: .word func_ov007_02157148
.L_02157114: .word data_020a0f64
    arm_func_end func_ov007_0215656c

    .global func_ov007_02157118
    thumb_func_start func_ov007_02157118
func_ov007_02157118: ; 0x02157118
    ldr r1, [r0, #0x4]
    mov r0, #0x87
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r3, .L_0215712c
    mov r2, #0x1
    add r0, #0x6d
    strb r2, [r0, #0x0]
    bx r3
    mov r8, r8
.L_0215712c: .word func_ov012_021b65bc
    thumb_func_end func_ov007_02157118

    .global func_ov007_02157130
    thumb_func_start func_ov007_02157130
func_ov007_02157130: ; 0x02157130
    ldr r1, [r0, #0x4]
    mov r0, #0x87
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r3, .L_02157144
    mov r2, #0x0
    add r0, #0x6d
    strb r2, [r0, #0x0]
    bx r3
    mov r8, r8
.L_02157144: .word func_ov012_021b65cc
    thumb_func_end func_ov007_02157130

    .global func_ov007_02157148
    thumb_func_start func_ov007_02157148
func_ov007_02157148: ; 0x02157148
    push {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r5, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_02157170
    ldr r0, [r5, #0x70]
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_0215716a
    ldr r1, .L_02157174
    blx func_02028384
    pop {r3, r4, r5, pc}
.L_0215716a:
    ldr r1, .L_02157178
    blx func_02028384
.L_02157170:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_02157174: .word func_ov007_0215717c
.L_02157178: .word func_ov007_021571b4
    thumb_func_end func_ov007_02157148

    .global func_ov007_0215717c
    thumb_func_start func_ov007_0215717c
func_ov007_0215717c: ; 0x0215717c
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x70]
    ldr r1, [r0, #0x30]
    cmp r1, #0x0
    beq .L_02157194
    ldr r0, [r0, #0x10]
    blx r1
    cmp r0, #0x0
    bne .L_021571ac
.L_02157194:
    ldr r0, [r4, #0x30]
    mov r2, #0x52
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    mov r1, #0x10
    ldr r3, [r3, r2]
    blx r3
    ldr r0, [r5, #0x4]
    ldr r1, .L_021571b0
    blx func_02028384
.L_021571ac:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_021571b0: .word func_ov007_021571b4
    thumb_func_end func_ov007_0215717c

    .global func_ov007_021571b4
    thumb_func_start func_ov007_021571b4
func_ov007_021571b4: ; 0x021571b4
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0x6d
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_021571da
    ldr r0, [r4, #0x70]
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    beq .L_021571da
    ldr r0, [r0, #0x10]
    blx r1
    cmp r0, #0x0
    bne .L_021571da
    mov r0, r4
    bl func_ov007_02157480
.L_021571da:
    pop {r4, pc}
    thumb_func_end func_ov007_021571b4

    .global func_ov007_021571dc
    thumb_func_start func_ov007_021571dc
func_ov007_021571dc: ; 0x021571dc
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x70]
    ldr r1, [r0, #0x24]
    cmp r1, #0x0
    beq .L_021571ee
    ldr r0, [r0, #0x10]
    blx r1
.L_021571ee:
    mov r0, r4
    bl func_ov007_02157480
    pop {r4, pc}
    thumb_func_end func_ov007_021571dc

    .byte 0x00, 0x00

    .global func_ov007_021571f8
    arm_func_start func_ov007_021571f8
func_ov007_021571f8: ; 0x021571f8
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_021573cc
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    blx r0
    ldr r0, .L_021573cc
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021573cc
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021573cc
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_021573cc
    b .L_02157250
.L_02157248:
    ldr r0, [r5, #0x0]
    blx r0
.L_02157250:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_02157248
    bl func_020735e4
    bl func_02086c08
    cmp r0, #0x0
    ldreq r0, .L_021573d0
    moveq r1, #0x0
    ldreq r0, [r0, #0x0]
    streqb r1, [r0, #0x430]
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, .L_021573d4
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x70]
    ldr r2, [r0, #0x2c]
    cmp r2, #0x0
    beq .L_021572b0
    ldr r0, [r0, #0x10]
    ldr r1, [r4, #0x64]
    blx r2
.L_021572b0:
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq .L_021572c0
    bl func_ov012_021bab64
.L_021572c0:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_021572d0
    blx func_ov012_021bd500
.L_021572d0:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_021572e0
    bl func_0206ae98
.L_021572e0:
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq .L_021572f0
    bl func_0201b268
.L_021572f0:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_02157300
    bl func_0201b268
.L_02157300:
    bl func_ov007_02150f1c
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_02157314
    bl func_02034d7c
.L_02157314:
    mov r5, #0x0
.L_02157318:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_02157334
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02157334:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02157318
    ldr r0, [r4, #0x70]
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    beq .L_02157358
    ldr r0, [r0, #0x10]
    blx r1
.L_02157358:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_02157370
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02157370:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02157388
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02157388:
    blx func_ov012_021b65cc
    ldr r1, .L_021573d8
    ldr r2, .L_021573dc
    ldr r3, [r1, #0x0]
    ldr r0, .L_021573e0
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_021573cc: .word data_020a0e18
.L_021573d0: .word data_020a0f64
.L_021573d4: .word data_ov012_021d5154
.L_021573d8: .word data_02093c04
.L_021573dc: .word data_020a16c0
.L_021573e0: .word data_020a0e80
    arm_func_end func_ov007_021571f8

    .global func_ov007_021573e4
    thumb_func_start func_ov007_021573e4
func_ov007_021573e4: ; 0x021573e4
    push {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, #0x0
    ldr r6, [r0, #0x10]
    mov r7, #0x1
    b .L_02157426
.L_021573f2:
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xa8
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x0
    beq .L_02157412
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    add r2, #0xc0
    ldr r2, [r2, #0x0]
    blx r2
    blx func_ov007_0214f340
    b .L_02157414
.L_02157412:
    mov r0, r5
.L_02157414:
    cmp r4, #0x0
    beq .L_02157424
    ldr r0, [r0, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_02157424:
    add r4, r4, #0x1
.L_02157426:
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xac
    ldr r1, [r1, #0x0]
    blx r1
    cmp r4, r0
    blo .L_021573f2
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    beq .L_02157452
    ldr r0, [r0, #0x4]
    mov r2, #0x66
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x0
    blx r3
    ldr r0, [r6, #0x44]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
.L_02157452:
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_021573e4

    .global func_ov007_02157454
    thumb_func_start func_ov007_02157454
func_ov007_02157454: ; 0x02157454
    push {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x10]
    mov r0, r2
    add r0, #0x6d
    strb r1, [r0, #0x0]
    mov r0, r2
    mov r1, #0x1
    add r0, #0x6c
    strb r1, [r0, #0x0]
    ldr r0, [r2, #0x3c]
    mov r2, #0x53
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    mov r1, #0x8
    ldr r3, [r3, r2]
    blx r3
    bl func_ov012_021b65cc
    pop {r3, pc}
    thumb_func_end func_ov007_02157454

    .global func_ov007_02157480
    thumb_func_start func_ov007_02157480
func_ov007_02157480: ; 0x02157480
    push {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_ov007_02157118
    ldr r0, [r4, #0x8]
    ldr r1, .L_02157498
    ldr r0, [r0, #0x4]
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_02157498: .word func_ov007_021571f8
    thumb_func_end func_ov007_02157480

    .global func_ov007_0215749c
    thumb_func_start func_ov007_0215749c
func_ov007_0215749c: ; 0x0215749c
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_021574e8
    cmp r0, r1
    bne .L_021574e4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_021574e4
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x4]
    bl func_ov007_02157118
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    ldr r0, [r4, #0x4]
    bl func_ov007_02157118
    ldr r0, [r4, #0x8]
    ldr r1, .L_021574ec
    ldr r0, [r0, #0x4]
    blx func_02028384
.L_021574e4:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_021574e8: .word 0x80011001
.L_021574ec: .word func_ov007_021571dc
    thumb_func_end func_ov007_0215749c

    .global func_ov007_021574f0
    thumb_func_start func_ov007_021574f0
func_ov007_021574f0: ; 0x021574f0
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    ldr r6, [r0, #0x10]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_021575b0
    cmp r0, r1
    bne .L_021575ac
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x3
    tst r0, r1
    beq .L_02157552
    ldr r0, [r5, #0x4]
    mov r1, r0
    add r1, #0x90
    ldr r2, [r1, #0x0]
    mov r1, #0x1
    and r1, r2
    cmp r1, #0x1
    bne .L_02157552
    mov r2, #0x49
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x10]
    ldr r1, [r0, r2]
    ldr r0, .L_021575b4
    cmp r1, r0
    ldr r0, [r3, #0x44]
    bne .L_02157544
    ldr r0, [r0, #0x4]
    ldr r1, [r3, #0x58]
    ldr r3, [r0, #0x0]
    add r2, #0x74
    ldr r3, [r3, r2]
    blx r3
    b .L_02157552
.L_02157544:
    ldr r3, .L_021575b8
    ldr r0, [r0, #0x4]
    and r1, r3
    ldr r3, [r0, #0x0]
    add r2, #0x74
    ldr r3, [r3, r2]
    blx r3
.L_02157552:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_021575ac
    ldr r0, [r6, #0x4]
    bl func_ov007_02157118
    ldr r1, [r5, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r4, [r1, #0x10]
    ldr r1, [r1, r0]
    mov r0, #0x2
    lsl r0, r0, #0xe
    tst r0, r1
    beq .L_02157582
    mov r0, #0x78
    mov r1, #0x2
    blx func_0207342c
    b .L_021575a6
.L_02157582:
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    ldr r0, [r4, #0x70]
    ldr r3, [r0, #0x20]
    cmp r3, #0x0
    beq .L_0215759e
    mov r1, #0x49
    ldr r2, [r5, #0x4]
    lsl r1, r1, #0x2
    ldr r0, [r0, #0x10]
    ldr r1, [r2, r1]
    blx r3
.L_0215759e:
    mov r0, r4
    bl func_ov007_02157480
    pop {r4, r5, r6, pc}
.L_021575a6:
    ldr r0, [r4, #0x4]
    bl func_ov007_02157130
.L_021575ac:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_021575b0: .word 0x80011000
.L_021575b4: .word 0x7ff0
.L_021575b8: .word 0xffff7fff
    thumb_func_end func_ov007_021574f0

    .global func_ov007_021575bc
    thumb_func_start func_ov007_021575bc
func_ov007_021575bc: ; 0x021575bc
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r0, [r5, #0x4]
    add r0, #0xac
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    tst r0, r1
    beq .L_021575d0
    b .L_021576e2
.L_021575d0:
    mov r0, #0x60
    str r0, [sp, #0x0]
    add r0, sp, #0x20
    mov r1, #0x93
    mov r2, #0x0
    mov r3, #0xa3
    blx func_ov007_021502ec
    ldr r2, .L_021576e8
    mov r0, #0x0
    add r1, sp, #0x20
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r5
    blx func_02020e98
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x5
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0xb
    lsl r1, r1, #0xc
    str r1, [sp, #0x18]
    mov r1, #0x9b
    lsl r1, r1, #0xc
    str r1, [sp, #0x1c]
    mov r4, r0
    add r1, sp, #0x1c
    add r2, sp, #0x18
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x9
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0x55
    lsl r1, r1, #0xc
    str r1, [sp, #0x10]
    mov r1, #0x9b
    lsl r1, r1, #0xc
    str r1, [sp, #0x14]
    mov r4, r0
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    ldr r1, [r5, #0x4]
    mov r6, #0x1
    mov r0, r1
    add r0, #0xac
    ldr r0, [r0, #0x0]
    and r0, r6
    cmp r0, #0x1
    beq .L_02157680
    mov r6, #0x0
.L_02157680:
    add r1, #0x94
    ldr r7, [r1, #0x0]
    ldr r1, .L_021576ec
    ldr r2, .L_021576f0
    ldr r3, .L_021576f4
    mov r0, #0xb4
    blx func_0201a21c
    mov r4, r0
    beq .L_021576a8
    ldr r1, .L_021576f8
    mov r2, r7
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r1, [r5, #0x4]
    mov r3, r6
    bl func_ov012_021af494
    mov r4, r0
.L_021576a8:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_021576b6
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021576b6:
    ldr r4, [r4, #0x18]
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r0, sp, #0x8
    mov r1, #0x93
    mov r2, #0x0
    mov r3, #0xa3
    blx func_ov007_021502ec
    ldr r2, .L_021576e8
    mov r0, #0x0
    add r1, sp, #0x8
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, [r5, #0x4]
    ldr r1, [r4, #0x4]
    bl func_ov012_021b8efc
.L_021576e2:
    add sp, #0x28
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_021576e8: .word data_02093c8c
.L_021576ec: .word data_ov007_021699b4
.L_021576f0: .word data_ov007_02169e94
.L_021576f4: .word 0x226
.L_021576f8: .word func_ov007_021576fc
    thumb_func_end func_ov007_021575bc

    .global func_ov007_021576fc
    thumb_func_start func_ov007_021576fc
func_ov007_021576fc: ; 0x021576fc
    push {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xac
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x1
    bne .L_0215774e
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x7
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0x1
    lsl r1, r1, #0x10
    str r1, [sp, #0x0]
    mov r1, #0x9b
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    mov r4, r0
    add r1, sp, #0x4
    add r2, sp, #0x0
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
.L_0215774e:
    ldr r0, [r5, #0x4]
    mov r1, #0x20
    add r0, #0x98
    str r1, [r0, #0x0]
    add sp, #0x8
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_021576fc

    .byte 0x00, 0x00

    .global func_ov007_0215775c
    thumb_func_start func_ov007_0215775c
func_ov007_0215775c: ; 0x0215775c
    push {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x2
    mov r3, #0x7f
    blx func_ov007_021510f0
    mov r1, #0x2
    lsl r1, r1, #0xe
    str r1, [sp, #0x4]
    mov r1, #0x4a
    lsl r1, r1, #0xc
    str r1, [sp, #0x8]
    mov r4, r0
    add r1, sp, #0x8
    add r2, sp, #0x4
    blx func_ov007_0214f218
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    mov r0, #0x7f
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, r5
    add r1, sp, #0x0
    blx func_ov007_0214f27c
    ldr r0, [r5, #0x4]
    ldr r1, .L_021577b4
    ldr r0, [r0, #0x50]
    str r1, [r0, #0x10]
    mov r1, #0x1
    blx func_ov007_0214f240
    add sp, #0xc
    pop {r4, r5, pc}
.L_021577b4: .word 0xfff40000
    thumb_func_end func_ov007_0215775c

    .global func_ov007_021577b8
    thumb_func_start func_ov007_021577b8
func_ov007_021577b8: ; 0x021577b8
    push {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r5, [r6, #0x4]
    ldr r1, .L_02157848
    add r5, #0xa0
    blx func_ov007_0214f898
    mov r4, r0
    mov r0, r5
    blx func_ov007_0214f45c
    cmp r0, #0x0
    beq .L_021577de
    mov r0, r5
    blx func_ov007_0214f474
    cmp r0, #0x0
    bne .L_021577ec
.L_021577de:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_02157842
.L_021577ec:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    add r0, #0x94
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02157806
    mov r0, #0x0
    b .L_0215780a
.L_02157806:
    blx func_ov007_0214f340
.L_0215780a:
    ldr r0, [r0, #0x4]
    add r0, #0xa8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02157828
    ldr r0, .L_0215784c
    ldr r1, [r0, #0x0]
    ldr r0, .L_02157850
    ldr r0, [r0, #0x0]
    cmp r1, r0
    bhi .L_02157828
    mov r0, #0x78
    mov r1, #0x3
    blx func_0207342c
.L_02157828:
    mov r0, #0x2
    ldrsh r0, [r5, r0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, #0x0
    ldrsh r0, [r5, r0]
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r6
    blx func_ov007_0214f218
.L_02157842:
    add sp, #0x8
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_02157848: .word 0x31305053
.L_0215784c: .word data_ov012_021d5160
.L_02157850: .word data_02093c24
    thumb_func_end func_ov007_021577b8

    .global func_ov007_02157854
    thumb_func_start func_ov007_02157854
func_ov007_02157854: ; 0x02157854
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x67
    ldr r4, [r0, #0x10]
    lsl r1, r1, #0x2
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    cmp r0, #0x0
    beq .L_02157896
    ldr r0, [r4, #0x44]
    mov r1, #0x67
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    ldr r1, [r4, #0x58]
    add r0, r0, #0x6
    cmp r0, r1
    bls .L_02157896
    ldr r0, [r4, #0x44]
    mov r3, #0x1a
    ldr r0, [r0, #0x4]
    lsl r3, r3, #0x4
    ldr r6, [r0, #0x0]
    subs r1, r1, #0x5
    ldr r6, [r6, r3]
    mov r2, #0x0
    blx r6
.L_02157896:
    ldr r0, [r4, #0x44]
    mov r1, #0x65
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    ldr r1, [r4, #0x58]
    cmp r0, r1
    ble .L_021578cc
    ldr r0, [r4, #0x44]
    mov r1, #0x65
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    cmp r0, #0x6
    blt .L_021578cc
    ldr r0, [r4, #0x44]
    mov r2, #0x66
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    ldr r1, [r4, #0x58]
    ldr r3, [r3, r2]
    blx r3
.L_021578cc:
    ldr r0, [r5, #0x4]
    ldr r1, .L_021578d8
    blx func_02028384
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_021578d8: .word func_ov007_021578dc
    thumb_func_end func_ov007_02157854

    .global func_ov007_021578dc
    thumb_func_start func_ov007_021578dc
func_ov007_021578dc: ; 0x021578dc
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r5, [r0, #0x10]
    mov r0, r5
    add r0, #0x6d
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02157980
    ldr r0, [r5, #0x70]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    bge .L_02157902
    ldr r1, [r5, #0x58]
    mov r0, r5
    bl func_ov007_021579ac
    mov r0, #0x0
    b .L_0215790e
.L_02157902:
    str r0, [r5, #0x78]
    mov r1, #0x0
    ldr r0, [r5, #0x70]
    mvn r1, r1
    str r1, [r0, #0xc]
    mov r0, #0x1
.L_0215790e:
    cmp r0, #0x0
    beq .L_02157980
    ldr r1, [r5, #0x78]
    mov r0, r5
    bl func_ov007_021579ac
    ldr r4, [r5, #0x78]
    mov r7, #0x1c
    b .L_02157938
.L_02157920:
    ldr r0, [r5, #0x70]
    ldr r1, [r0, #0x8]
    mov r0, r4
    mul r0, r7
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    beq .L_0215793e
    mov r0, r5
    mov r1, r4
    bl func_ov007_02157a3c
    add r4, r4, #0x1
.L_02157938:
    ldr r0, [r5, #0x50]
    cmp r4, r0
    blt .L_02157920
.L_0215793e:
    ldr r3, .L_021579a4
    mov r2, #0x1
    mov r0, r5
    mov r1, r4
    str r2, [sp, #0x0]
    bl func_ov007_021579d8
    mov r7, #0x2
    str r4, [r5, #0x58]
    add r4, r4, #0x1
    lsl r7, r7, #0xe
    b .L_02157972
.L_02157956:
    cmp r4, #0x6
    bge .L_0215795e
    mov r0, #0x1
    b .L_02157960
.L_0215795e:
    mov r0, #0x0
.L_02157960:
    mov r3, r4
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, r4
    mov r2, #0x2
    orr r3, r7
    bl func_ov007_021579d8
    add r4, r4, #0x1
.L_02157972:
    ldr r0, [r5, #0x54]
    cmp r4, r0
    blt .L_02157956
    ldr r0, [r6, #0x4]
    ldr r1, .L_021579a8
    blx func_02028384
.L_02157980:
    ldr r4, [r6, #0x4]
    mov r1, #0x19
    mov r0, r4
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x4
    ldr r2, [r2, r1]
    blx r2
    mov r0, r4
    mov r1, #0x5e
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    blx r2
    ldr r0, [r4, #0x64]
    mov r1, #0x1
    add r0, #0x40
    strb r1, [r0, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_021579a4: .word 0x7ff0
.L_021579a8: .word func_ov007_02157854
    thumb_func_end func_ov007_021578dc

    .global func_ov007_021579ac
    thumb_func_start func_ov007_021579ac
func_ov007_021579ac: ; 0x021579ac
    push {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r6, r1
    mov r4, #0x0
    mov r7, #0x2
    b .L_021579d2
.L_021579b8:
    ldr r0, [r5, #0x70]
    ldr r1, [r0, #0x8]
    mov r0, #0x1c
    mul r0, r4
    add r0, r1, r0
    ldrsb r0, [r0, r7]
    cmp r0, #0x0
    beq .L_021579d0
    mov r0, r5
    mov r1, r4
    bl func_ov007_02157a3c
.L_021579d0:
    add r4, r4, #0x1
.L_021579d2:
    cmp r4, r6
    blt .L_021579b8
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_021579ac

    .global func_ov007_021579d8
    thumb_func_start func_ov007_021579d8
func_ov007_021579d8: ; 0x021579d8
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r5, r0
    mov r6, r1
    ldr r0, [r5, #0x48]
    lsl r1, r6, #0x2
    ldr r4, [r0, r1]
    ldr r0, [r5, #0x4c]
    str r2, [sp, #0x0]
    ldr r0, [r0, r1]
    ldr r1, .L_02157a38
    mov r7, r3
    str r0, [sp, #0x4]
    blx func_ov007_0214f898
    ldr r1, [sp, #0x0]
    blx func_ov007_021524c8
    ldr r0, [sp, #0x4]
    ldr r1, [r0, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    str r7, [r1, r0]
    add r0, sp, #0x10
    ldrb r0, [r0, #0x10]
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_02157a1c
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_02157a26
.L_02157a1c:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_02157a26:
    mov r0, r5
    mov r1, r6
    mov r2, r4
    mov r3, #0x0
    bl func_ov007_02157ae4
    add sp, #0x8
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_02157a38: .word 0x67625053
    thumb_func_end func_ov007_021579d8

    .global func_ov007_02157a3c
    thumb_func_start func_ov007_02157a3c
func_ov007_02157a3c: ; 0x02157a3c
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r6, r1
    ldr r0, [r5, #0x48]
    lsl r1, r6, #0x2
    ldr r0, [r0, r1]
    ldr r2, [r5, #0x70]
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x4c]
    ldr r0, [r0, r1]
    ldr r1, [r2, #0x8]
    str r0, [sp, #0x4]
    mov r0, #0x1c
    mul r0, r6
    add r4, r1, r0
    ldrb r0, [r2, #0x2]
    cmp r0, #0x0
    beq .L_02157a66
    mov r3, #0x2
    b .L_02157a68
.L_02157a66:
    mov r3, #0x4
.L_02157a68:
    ldrb r1, [r4, #0x19]
    ldrb r0, [r4, #0x1a]
    mov r7, #0x0
    add r0, r1, r0
    cmp r0, r3
    bge .L_02157a88
    mov r0, #0x1
    ldrsb r1, [r4, r0]
    cmp r1, #0x0
    beq .L_02157a86
    ldrb r1, [r2, #0x1]
    cmp r1, #0x0
    beq .L_02157a88
    mov r7, r0
    b .L_02157a88
.L_02157a86:
    mov r7, r0
.L_02157a88:
    cmp r7, #0x0
    beq .L_02157a92
    mov r0, #0x0
    str r0, [sp, #0x0]
    b .L_02157a96
.L_02157a92:
    mov r0, #0x2
    str r0, [sp, #0x0]
.L_02157a96:
    ldr r0, [sp, #0x4]
    ldr r1, .L_02157ae0
    blx func_ov007_0214f898
    ldr r1, [sp, #0x0]
    blx func_ov007_021524c8
    ldr r2, [sp, #0x8]
    mov r0, r5
    mov r1, r6
    add r3, r4, #0x4
    bl func_ov007_02157ae4
    ldr r0, [sp, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [sp, #0x4]
    cmp r7, #0x0
    ldr r2, [r0, #0x4]
    bne .L_02157acc
    mov r0, #0x2
    lsl r0, r0, #0xe
    b .L_02157ace
.L_02157acc:
    mov r0, #0x0
.L_02157ace:
    mov r1, r6
    orr r1, r0
    mov r0, #0x49
    lsl r0, r0, #0x2
    str r1, [r2, r0]
    mov r0, #0x0
    strb r0, [r4, #0x2]
    add sp, #0xc
    pop {r4, r5, r6, r7, pc}
.L_02157ae0: .word 0x67625053
    thumb_func_end func_ov007_02157a3c

    .global func_ov007_02157ae4
    thumb_func_start func_ov007_02157ae4
func_ov007_02157ae4: ; 0x02157ae4
    push {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r6, r2
    ldr r1, .L_02157b78
    mov r0, r6
    mov r5, r3
    blx func_ov007_0214f898
    mov r4, r0
    bne .L_02157b3e
    cmp r5, #0x0
    beq .L_02157b74
    blx func_0203b404
    add r0, #0x88
    ldr r4, [r0, #0x0]
    blx func_ov007_02150f0c
    mov r1, r0
    mov r0, r4
    mov r2, #0x6
    mov r3, #0xa0
    blx func_ov007_02151178
    mov r4, r0
    ldr r2, .L_02157b78
    ldr r1, [r4, #0x4]
    str r2, [r1, #0x54]
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r1, #0x12
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    add r1, sp, #0x4
    add r2, sp, #0x0
    blx func_ov007_0214f218
    mov r0, r4
    mov r1, r6
    blx func_ov007_02152468
    mov r0, r6
    mov r1, r4
    blx func_ov007_0214f48c
.L_02157b3e:
    ldr r6, [r4, #0x4]
    ldr r0, [r6, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r6
    ldr r1, [r0, #0x0]
    add r1, #0xc4
    ldr r1, [r1, #0x0]
    blx r1
    cmp r5, #0x0
    beq .L_02157b74
    mov r0, r5
    add r1, sp, #0x8
    mov r2, #0x14
    blx func_02051890
    mov r2, #0x0
    add r0, sp, #0x0
    strh r2, [r0, #0x1c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x8
    ldr r0, [r0, #0x64]
    subs r2, r2, #0x1
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
.L_02157b74:
    add sp, #0x20
    pop {r4, r5, r6, pc}
.L_02157b78: .word 0x6d6e5053
    thumb_func_end func_ov007_02157ae4

    .global func_ov007_02157b7c
    arm_func_start func_ov007_02157b7c
func_ov007_02157b7c: ; 0x02157b7c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x68
    ldr r1, .L_021585e0
    mov r4, r0
    ldr r2, .L_021585e4
    mov r0, #0x80
    mov r3, #0xb2
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x80
    mov r9, r0
    bl func_020517fc
    bl func_020310f4
    ldr r2, .L_021585e8
    str r0, [r9, #0x4]
    ldr r1, .L_021585ec
    ldr r5, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r5, r5, #0x1
    ldr r1, .L_021585f0
    str r5, [r2, #0x0]
    str r3, [r1, r5, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    ldr r0, [r9, #0x4]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    ldr r0, [r9, #0x4]
    bl func_ov007_02150d44
    blx func_ov012_021b65bc
    str r4, [r9, #0x7c]
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    beq .L_02157c18
    ldr r0, [r4, #0x14]
    blx r1
.L_02157c18:
    ldrb r0, [r4, #0x0]
    strb r0, [r9, #0x6f]
    ldrsb r0, [r4, #0x3]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    strb r0, [r9, #0x6e]
    ldrsb r0, [r9, #0x6f]
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x8
    str r0, [r9, #0x78]
    ldrsb r0, [r9, #0x6e]
    cmp r0, #0x0
    mvnne r0, #0xb
    moveq r0, #0x0
    str r0, [r9, #0x74]
    mov r0, #0x0
    strb r0, [r9, #0x70]
    bl func_02028920
    str r0, [r9, #0x10]
    mov r0, #0x20
    mov r1, #0x40
    mov r2, #0x4000
    mov r3, #0x1
    bl func_ov007_02150678
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov007_021509ac
    str r0, [r9, #0x0]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov007_02150e14
    ldrsb r0, [r9, #0x6f]
    cmp r0, #0x0
    ldrne r4, .L_021585f4
    bne .L_02157cc0
    ldrsb r0, [r9, #0x6e]
    cmp r0, #0x0
    ldrne r4, .L_021585f8
    ldreq r4, .L_021585fc
.L_02157cc0:
    mov r0, #0x2
    bl func_0203b414
    mov r2, r0
    ldr r1, .L_02158600
    ldr r0, [r4, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0x88]
    bl func_ov007_02150f80
    mov r6, #0x0
    ldr r5, .L_02158604
    str r0, [r9, #0x14]
    mov r4, r6
.L_02157cf0:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r9, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x1c]
    cmp r6, #0x2
    blt .L_02157cf0
    ldr r0, [r9, #0x0]
    bl func_ov007_02150b44
    mov r4, r0
    str r4, [r9, #0x28]
    bl func_0203b404
    mov r1, r0
    ldr r3, [r1, #0x88]
    ldr r0, [r9, #0x0]
    mov r1, #0x8f0000
    mov r2, #0x0
    bl func_ov007_02150b7c
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    ldr r0, [r9, #0x0]
    bl func_ov007_02150bdc
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r2, .L_02158608
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r5, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    str r5, [r9, #0x38]
    ldr r0, [r9, #0x7c]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_02157f0c
    mov r1, #0xff
    mov r0, #0xf
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    bl func_0203b404
    mov r2, #0x60
    str r2, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r2, #0x8f0000
    mov r3, #0x1
    bl func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    blx func_ov012_021b77a8
    ldr r1, .L_0215860c
    ldr r2, .L_02158610
    ldr r3, .L_02158614
    mov r0, #0x70
    bl func_0201a21c
    movs r5, r0
    beq .L_02157e48
    ldr r2, .L_02158618
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_0215861c
    ldr r1, .L_02158620
    add r0, r5, #0x68
    str r2, [r5, #0x0]
    bl func_ov007_0214f448
    ldr r0, .L_02158624
    str r0, [r5, #0x0]
.L_02157e48:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02157e64
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02157e64:
    ldr r1, [r5, #0x18]
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    mov r1, #0x6
    str r1, [r0, #0x124]
    str r4, [r9, #0x48]
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02158628
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215862c
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215862c
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r1, .L_02158630
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02157f0c:
    ldr r1, [r9, #0x28]
    mov r0, r9
    bl func_ov007_0215145c
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r2, .L_02158634
    mov r1, #0x1
    str r2, [r0, #0x124]
    ldr r0, [r7, #0x4]
    blx func_ov012_021b6214
    str r7, [r9, #0x2c]
    ldr r0, [r7, #0x4]
    bl func_02023940
    ldr r2, .L_02158638
    add r0, sp, #0x50
    mov r1, r7
    bl func_ov007_0214f2a4
    ldr r2, .L_0215863c
    add r0, sp, #0x48
    mov r1, r7
    bl func_ov007_0214f2a4
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0xc0000
    str r0, [sp, #0x40]
    mov r0, #0x0
    str r0, [sp, #0x44]
    mov r0, r7
    add r1, sp, #0x44
    add r2, sp, #0x40
    bl func_ov007_0214f218
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x48]
    ldr r3, [sp, #0x4c]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x38]
    str r0, [sp, #0x3c]
    mov r0, r7
    add r1, sp, #0x3c
    add r2, sp, #0x38
    bl func_ov007_0214f218
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x18
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    ldr r2, .L_02158640
    bl func_02023c80
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_02158644
    ldr r4, [r7, #0x4]
    ldr r5, [r0, #0x0]
    mov r0, #0x134
    ldr r1, .L_02158648
    ldr r2, .L_0215864c
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02158098
    ldr r3, .L_02158650
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_02158098:
    bl func_ov007_0214f340
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    str r1, [r0, #0x124]
    str r4, [r9, #0x3c]
    ldr r5, [r9, #0x14]
    cmp r5, #0x0
    beq .L_02158104
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    mov r1, r5
    bl func_ov007_0214f48c
.L_02158104:
    mov r4, #0x8000
    mov r8, #0x0
    rsb r4, r4, #0x0
    mov r6, #0x80
    mov r11, #0xa0
    b .L_0215829c
.L_0215811c:
    mov r0, #0x18
    mul r0, r8, r0
    ldr r5, [r9, #0x2c]
    add r0, r0, #0x48
    str r6, [sp, #0x10]
    ldr r1, [r9, #0x78]
    add r0, r1, r0
    str r0, [sp, #0x14]
    bl func_0203b404
    ldr r10, [r0, #0x88]
    bl func_ov007_02150f0c
    str r11, [sp, #0x0]
    add r2, sp, #0x10
    str r2, [sp, #0x4]
    mov r2, r0
    mov r1, r10
    mov r0, r5
    mov r3, #0x6
    bl func_ov007_021515d0
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r5, #0x4]
    add r2, r8, #0x8
    str r2, [r1, #0x124]
    add r0, r9, r8, lsl #0x2
    str r5, [r0, #0x50]
    ldr r1, .L_02158654
    mov r0, r5
    bl func_ov007_0214f898
    str r4, [sp, #0x1c]
    ldr r2, [r9, #0x74]
    add r1, sp, #0x18
    sub r2, r2, #0x41
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x18]
    add r2, sp, #0x1c
    bl func_ov007_0214f218
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x8f0000
    mov r2, #0x12
    mov r3, #0xa0
    bl func_ov007_021510f0
    mov r10, r0
    ldr r3, [r10, #0x4]
    ldr r2, .L_02158658
    add r1, sp, #0x20
    str r2, [r3, #0x54]
    mov r2, #0x0
    str r2, [sp, #0x24]
    add r2, sp, #0x24
    str r4, [sp, #0x20]
    bl func_ov007_0214f218
    mov r1, r10
    mov r0, r5
    bl func_ov007_0214f48c
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x8f0000
    mov r2, #0x5
    mov r3, #0xa0
    bl func_ov007_021510f0
    mov r10, r0
    ldr r3, [r10, #0x4]
    ldr r2, .L_0215865c
    add r1, sp, #0x28
    str r2, [r3, #0x54]
    mov r2, #0x0
    str r2, [sp, #0x2c]
    mov r2, #0x50000
    str r2, [sp, #0x28]
    add r2, sp, #0x2c
    bl func_ov007_0214f218
    mov r1, r10
    mov r0, r5
    bl func_ov007_0214f48c
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x10]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x34]
    str r0, [sp, #0x30]
    mov r0, r5
    add r1, sp, #0x30
    add r2, sp, #0x34
    bl func_ov007_0214f218
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r8, r8, #0x1
.L_0215829c:
    ldr r0, [r9, #0x7c]
    ldr r0, [r0, #0xc]
    cmp r8, r0
    blt .L_0215811c
    mov r0, #0x80
    str r0, [sp, #0x58]
    ldr r0, [r9, #0x78]
    add r0, r0, #0x48
    str r0, [sp, #0x5c]
    bl func_0203b404
    mov r2, #0x7f
    str r2, [sp, #0x0]
    add r1, sp, #0x58
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r7
    mov r2, #0x8f0000
    mov r3, #0x6
    bl func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x7
    str r1, [r0, #0x124]
    ldr r1, .L_02158660
    mov r0, r4
    str r4, [r9, #0x4c]
    bl func_ov007_0214f898
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r4, [r0, #0x2c]
    cmp r4, #0x0
    bne .L_0215833c
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r4, r0
.L_0215833c:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02158358
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02158358:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x18]
    mov r1, #0x31
    mov r2, #0x4
    mov r3, #0x5
    bl func_0206ad90
    str r0, [r9, #0x64]
    mov r2, #0x0
    ldr r1, .L_02158664
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    mov r0, #0xc8
    str r0, [sp, #0x58]
    ldr r0, [r9, #0x78]
    add r0, r0, #0x3c
    str r0, [sp, #0x5c]
    bl func_0203b404
    mov r2, #0x70
    str r2, [sp, #0x0]
    add r1, sp, #0x58
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r7
    mov r2, #0x8f0000
    mov r3, #0x25
    bl func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    str r1, [r0, #0x124]
    str r4, [r9, #0x40]
    ldrsb r0, [r9, #0x6f]
    cmp r0, #0x0
    beq .L_02158470
    mov r0, #0x98
    str r0, [sp, #0x58]
    ldr r0, [r9, #0x78]
    add r0, r0, #0xa6
    str r0, [sp, #0x5c]
    bl func_0203b404
    mov r2, #0x70
    str r2, [sp, #0x0]
    add r1, sp, #0x58
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r7
    mov r2, #0x8f0000
    mov r3, #0x7
    bl func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x5
    str r1, [r0, #0x124]
    str r4, [r9, #0x44]
.L_02158470:
    mov r2, #0x1
    sub r3, r2, #0x2
    mov r0, #0xb
    mov r1, #0x0
    blx func_ov012_021bcf1c
    str r0, [r9, #0x60]
    ldr r0, [r9, #0x7c]
    mov r2, #0x0
    ldrsb r0, [r0, #0x5]
    cmp r0, #0x0
    ldr r0, [r9, #0x60]
    beq .L_021584ac
    mov r1, #0x64
    blx func_ov012_021bd730
    b .L_021584b4
.L_021584ac:
    mov r1, #0x67
    blx func_ov012_021bd730
.L_021584b4:
    mov r1, #0x1
    mov r2, r1
    mov r0, #0x0
    bl func_ov012_021ba49c
    str r0, [r9, #0x68]
    ldr r0, [r9, #0x7c]
    ldr r2, [r0, #0x2c]
    cmp r2, #0x0
    beq .L_021584e4
    ldr r0, [r0, #0x14]
    ldr r1, [r9, #0x68]
    blx r2
.L_021584e4:
    ldr r0, [r9, #0x38]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, .L_02158668
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x5
    bl func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    bl func_0207361c
    bl func_02026f94
    str r0, [r9, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x8]
    ldr r1, .L_0215866c
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x80000
    str r0, [sp, #0x64]
    ldr r0, [r9, #0x8]
    add r1, sp, #0x64
    bl func_ov007_0214ed20
    bl func_02026f94
    str r0, [r9, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0xc]
    ldr r1, .L_02158670
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x86000
    str r0, [sp, #0x60]
    ldr r0, [r9, #0xc]
    add r1, sp, #0x60
    bl func_ov007_0214ed20
    ldr r0, [r9, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r9, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r9, #0x4]
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021585e0: .word data_ov007_0216a0ac
.L_021585e4: .word data_ov007_0216a090
.L_021585e8: .word data_02093c04
.L_021585ec: .word data_020a0e80
.L_021585f0: .word data_020a16c0
.L_021585f4: .word data_ov007_02169f64
.L_021585f8: .word data_ov007_02169f70
.L_021585fc: .word data_ov007_02169f6c
.L_02158600: .word data_ov007_02169f64
.L_02158604: .word data_ov007_02169f7c
.L_02158608: .word func_ov007_02158bd4
.L_0215860c: .word data_ov007_02169674
.L_02158610: .word data_ov007_02169ff8
.L_02158614: .word 0x1b2
.L_02158618: .word data_02093c8c
.L_0215861c: .word data_ov007_021695c0
.L_02158620: .word data_ov007_02169f74
.L_02158624: .word data_ov012_021d1c58
.L_02158628: .word func_ov007_02158c1c
.L_0215862c: .word 0x8f0001
.L_02158630: .word 0x8f0002
.L_02158634: .word 0x101
.L_02158638: .word data_ov007_0216a0c8
.L_0215863c: .word data_ov007_0216a0d4
.L_02158640: .word 0x494c
.L_02158644: .word data_ov012_021d5154
.L_02158648: .word data_ov007_02169654
.L_0215864c: .word data_ov007_0216a000
.L_02158650: .word func_ov007_0214f368
.L_02158654: .word 0x31305854
.L_02158658: .word 0x6e755053
.L_0215865c: .word 0x6b6f5053
.L_02158660: .word 0x31305053
.L_02158664: .word 0x8df
.L_02158668: .word data_020a0e18
.L_0215866c: .word func_ov007_021586e0
.L_02158670: .word func_ov007_0215891c
    arm_func_end func_ov007_02157b7c

    .global func_ov007_02158674
    arm_func_start func_ov007_02158674
func_ov007_02158674: ; 0x02158674
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    ldr r2, [r0, #0x0]
    mov r1, #0x8
    beq .L_02158698
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r3, pc}
.L_02158698:
    ldr r2, [r2, #0x14c]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02158674

    .global func_ov007_021586a4
    thumb_func_start func_ov007_021586a4
func_ov007_021586a4: ; 0x021586a4
    ldr r1, [r0, #0x4]
    mov r0, #0x87
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r0, [r0, #0x68]
    bx lr
    thumb_func_end func_ov007_021586a4

    .global func_ov007_021586b0
    thumb_func_start func_ov007_021586b0
func_ov007_021586b0: ; 0x021586b0
    ldr r1, [r0, #0x4]
    mov r0, #0x87
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r0, [r0, #0x60]
    bx lr
    thumb_func_end func_ov007_021586b0

    .global func_ov007_021586bc
    thumb_func_start func_ov007_021586bc
func_ov007_021586bc: ; 0x021586bc
    push {r3, lr}
    ldr r2, [r0, #0x4]
    mov r0, #0x87
    lsl r0, r0, #0x2
    ldr r0, [r2, r0]
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_021586dc
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    beq .L_021586d8
    bl func_ov012_021b65d8
    pop {r3, pc}
.L_021586d8:
    bl func_ov012_021b65e0
.L_021586dc:
    pop {r3, pc}
    thumb_func_end func_ov007_021586bc

    .byte 0x00, 0x00

    .global func_ov007_021586e0
    arm_func_start func_ov007_021586e0
func_ov007_021586e0: ; 0x021586e0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r5, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r4, .L_0215872c
    b .L_0215870c
.L_02158704:
    ldr r0, [r4, #0x0]
    blx r0
.L_0215870c:
    ldrsb r0, [r5, #0x6c]
    cmp r0, #0x0
    beq .L_02158704
    blx func_ov012_021b65cc
    ldr r0, [r6, #0x4]
    ldr r1, .L_02158730
    bl func_02028384
    ldmia sp!, {r4, r5, r6, pc}
.L_0215872c: .word data_020a0e18
.L_02158730: .word func_ov007_02158734
    arm_func_end func_ov007_021586e0

    .global func_ov007_02158734
    thumb_func_start func_ov007_02158734
func_ov007_02158734: ; 0x02158734
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x7c]
    ldr r1, [r0, #0x20]
    cmp r1, #0x0
    beq .L_02158758
    ldr r0, [r0, #0x14]
    blx r1
    cmp r0, #0x0
    bne .L_02158758
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_0215875c
    ldr r0, [r0, #0x4]
    blx func_02028384
.L_02158758:
    pop {r4, pc}
    mov r8, r8
.L_0215875c: .word func_ov007_0215878c
    thumb_func_end func_ov007_02158734

    .global func_ov007_02158760
    thumb_func_start func_ov007_02158760
func_ov007_02158760: ; 0x02158760
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x7c]
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    beq .L_02158776
    ldr r0, [r0, #0x14]
    blx r1
.L_02158776:
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_02158788
    ldr r0, [r0, #0x4]
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_02158788: .word func_ov007_0215878c
    thumb_func_end func_ov007_02158760

    .global func_ov007_0215878c
    arm_func_start func_ov007_0215878c
func_ov007_0215878c: ; 0x0215878c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0215890c
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    blx r0
    ldr r0, .L_0215890c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215890c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215890c
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215890c
    b .L_021587e4
.L_021587dc:
    ldr r0, [r5, #0x0]
    blx r0
.L_021587e4:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_021587dc
    bl func_020735e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, [r4, #0x7c]
    ldr r2, [r0, #0x30]
    cmp r2, #0x0
    beq .L_02158818
    ldr r0, [r0, #0x14]
    ldr r1, [r4, #0x68]
    blx r2
.L_02158818:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_02158828
    bl func_ov012_021bab64
.L_02158828:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_02158838
    blx func_ov012_021bd500
.L_02158838:
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq .L_02158848
    bl func_0206ae98
.L_02158848:
    mov r5, #0x0
.L_0215884c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_02158868
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02158868:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215884c
    bl func_ov007_02150f1c
    ldr r0, [r4, #0x7c]
    ldr r1, [r0, #0x1c]
    cmp r1, #0x0
    beq .L_02158890
    ldr r0, [r0, #0x14]
    blx r1
.L_02158890:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_021588a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021588a8:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_021588c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021588c0:
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_02158910
    ldr r2, .L_02158914
    ldr r3, [r1, #0x0]
    ldr r0, .L_02158918
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215890c: .word data_020a0e18
.L_02158910: .word data_02093c04
.L_02158914: .word data_020a16c0
.L_02158918: .word data_020a0e80
    arm_func_end func_ov007_0215878c

    .global func_ov007_0215891c
    thumb_func_start func_ov007_0215891c
func_ov007_0215891c: ; 0x0215891c
    push {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r4, #0x0
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0x2c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    bne .L_0215893a
    mov r0, #0x1
    b .L_0215893c
.L_0215893a:
    mov r0, r4
.L_0215893c:
    cmp r0, #0x0
    bne .L_02158942
    mov r4, #0x1
.L_02158942:
    cmp r4, #0x0
    beq .L_02158954
    mov r0, #0x1
    add r5, #0x6c
    strb r0, [r5, #0x0]
    ldr r0, [r6, #0x4]
    ldr r1, .L_02158958
    blx func_02028384
.L_02158954:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_02158958: .word func_ov007_0215895c
    thumb_func_end func_ov007_0215891c

    .global func_ov007_0215895c
    thumb_func_start func_ov007_0215895c
func_ov007_0215895c: ; 0x0215895c
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r0, [r0, #0x4]
    mov r6, #0x0
    ldr r4, [r0, #0x10]
    str r6, [sp, #0x0]
    ldr r1, [r4, #0x7c]
    ldr r0, [r1, #0x10]
    str r0, [sp, #0x8]
    ldr r0, [r1, #0xc]
    str r0, [sp, #0x4]
    mov r0, #0x2
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    beq .L_0215897e
    mov r1, #0x1
    b .L_02158980
.L_0215897e:
    mov r1, r6
.L_02158980:
    ldr r0, [r4, #0x38]
    blx func_ov007_02158674
    mov r5, #0x0
    b .L_02158a00
.L_0215898a:
    lsl r0, r5, #0x2
    add r0, r4, r0
    ldr r7, [r0, #0x50]
    mov r0, #0x18
    ldr r1, [sp, #0x8]
    mul r0, r5
    ldr r2, [sp, #0x8]
    add r1, r1, r0
    ldrsb r0, [r2, r0]
    cmp r0, #0x0
    beq .L_021589e8
    mov r0, #0x1
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    beq .L_021589c4
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov007_02158b34
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov007_02158b74
    ldr r0, [sp, #0x0]
    add r0, r0, #0x1
    str r0, [sp, #0x0]
    b .L_021589d8
.L_021589c4:
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov007_02158b34
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov007_02158b74
.L_021589d8:
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    add r6, r6, #0x1
    b .L_021589fe
.L_021589e8:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov007_02158b34
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_021589fe:
    add r5, r5, #0x1
.L_02158a00:
    ldr r0, [sp, #0x4]
    cmp r5, r0
    blt .L_0215898a
    ldr r0, [r4, #0x7c]
    ldr r5, [r4, #0x4c]
    ldr r2, [r0, #0x8]
    mov r0, #0x0
    cmp r2, #0x0
    blt .L_02158a34
    mov r1, #0x18
    mul r1, r2
    ldr r2, [sp, #0x8]
    ldrsb r2, [r2, r1]
    cmp r2, #0x0
    beq .L_02158a34
    ldr r0, [r5, #0x4]
    ldr r2, [r4, #0x78]
    add r1, #0x48
    add r1, r2, r1
    ldr r0, [r0, #0x50]
    lsl r1, r1, #0xc
    str r1, [r0, #0x10]
    mov r1, #0x1
    blx func_ov007_0214f240
    mov r0, #0x1
.L_02158a34:
    cmp r0, #0x0
    ldr r0, [r5, #0x4]
    beq .L_02158a46
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_02158a50
.L_02158a46:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_02158a50:
    ldr r1, [r4, #0x7c]
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_02158aec
    ldr r5, [r4, #0x48]
    cmp r6, #0x2
    blt .L_02158ac0
    ldr r0, [sp, #0x0]
    cmp r0, #0x0
    bne .L_02158ac0
    mov r0, #0x4
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    ldr r0, [r5, #0x4]
    beq .L_02158a88
    mov r1, #0x0
    bl func_ov012_021b6214
    ldr r0, [r5, #0x4]
    bl func_ov012_021b65d8
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_02158a98
.L_02158a88:
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    bl func_ov012_021b65e0
.L_02158a98:
    mov r0, #0x6d
    ldrsb r0, [r4, r0]
    cmp r0, #0x0
    bne .L_02158aec
    ldr r1, [r4, #0x7c]
    mov r0, #0x3
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    ldr r0, [r4, #0x60]
    beq .L_02158ab6
    mov r1, #0x66
    mov r2, #0x0
    bl func_ov012_021bd730
    b .L_02158aec
.L_02158ab6:
    mov r1, #0x65
    mov r2, #0x0
    bl func_ov012_021bd730
    b .L_02158aec
.L_02158ac0:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    bl func_ov012_021b6214
    ldr r0, [r5, #0x4]
    bl func_ov012_021b65d8
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x60]
    mov r1, #0x64
    mov r2, #0x0
    bl func_ov012_021bd730
    mov r0, r4
    mov r1, #0x0
    add r0, #0x6d
    strb r1, [r0, #0x0]
.L_02158aec:
    ldr r1, [r4, #0x7c]
    ldrb r0, [r1, #0x0]
    cmp r0, #0x0
    beq .L_02158b2c
    ldr r0, [r4, #0x44]
    ldrb r5, [r1, #0x1]
    cmp r0, #0x0
    beq .L_02158b2c
    mov r1, r4
    add r1, #0x70
    ldrb r1, [r1, #0x0]
    cmp r1, r5
    beq .L_02158b2c
    ldr r1, .L_02158b30
    blx func_ov007_0214f898
    mov r6, r0
    mov r1, #0x8f
    ldr r0, [r6, #0x4]
    add r2, r5, #0x7
    lsl r1, r1, #0x10
    orr r1, r2
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r4, #0x70
    strb r5, [r4, #0x0]
.L_02158b2c:
    add sp, #0xc
    pop {r4, r5, r6, r7, pc}
.L_02158b30: .word 0x31305053
    thumb_func_end func_ov007_0215895c

    .global func_ov007_02158b34
    thumb_func_start func_ov007_02158b34
func_ov007_02158b34: ; 0x02158b34
    push {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    add r0, #0x8
    lsl r0, r0, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x30]
    ldr r1, .L_02158b70
    mov r6, r2
    blx func_ov007_0214f898
    cmp r6, #0x0
    beq .L_02158b64
    ldr r1, [r5, #0x7c]
    ldr r2, [r1, #0x10]
    mov r1, #0x18
    mul r1, r4
    add r1, r2, r1
    add r1, r1, #0x4
    mov r2, #0xa
    blx func_ov007_021513b8
    pop {r4, r5, r6, pc}
.L_02158b64:
    mov r1, #0x0
    mov r2, r1
    blx func_ov007_021513b8
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_02158b70: .word 0x31305854
    thumb_func_end func_ov007_02158b34

    .global func_ov007_02158b74
    thumb_func_start func_ov007_02158b74
func_ov007_02158b74: ; 0x02158b74
    push {r4, r5, r6, lr}
    add r1, #0x8
    lsl r1, r1, #0x2
    add r0, r0, r1
    ldr r4, [r0, #0x30]
    ldr r1, .L_02158bcc
    mov r0, r4
    mov r6, r2
    blx func_ov007_0214f898
    mov r5, r0
    ldr r1, .L_02158bd0
    mov r0, r4
    blx func_ov007_0214f898
    mov r4, r0
    cmp r6, #0x0
    ldr r0, [r5, #0x4]
    beq .L_02158bb2
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    pop {r4, r5, r6, pc}
.L_02158bb2:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_02158bcc: .word 0x6e755053
.L_02158bd0: .word 0x6b6f5053
    thumb_func_end func_ov007_02158b74

    .global func_ov007_02158bd4
    thumb_func_start func_ov007_02158bd4
func_ov007_02158bd4: ; 0x02158bd4
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02158c14
    cmp r0, r1
    bne .L_02158c10
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_02158c10
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_02158c18
    ldr r0, [r0, #0x4]
    blx func_02028384
.L_02158c10:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_02158c14: .word 0x80011001
.L_02158c18: .word func_ov007_02158760
    thumb_func_end func_ov007_02158bd4

    .global func_ov007_02158c1c
    thumb_func_start func_ov007_02158c1c
func_ov007_02158c1c: ; 0x02158c1c
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02158c64
    cmp r0, r1
    bne .L_02158c60
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_02158c60
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0x6d
    strb r1, [r0, #0x0]
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    ldr r0, [r4, #0x7c]
    ldr r2, [r0, #0x24]
    cmp r2, #0x0
    beq .L_02158c60
    ldr r0, [r0, #0x14]
    mov r1, #0x1
    blx r2
.L_02158c60:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_02158c64: .word 0x80011000
    thumb_func_end func_ov007_02158c1c

    .global func_ov007_02158c68
    arm_func_start func_ov007_02158c68
func_ov007_02158c68: ; 0x02158c68
    stmdb sp!, {r4, lr}
    ldr r0, .L_02158d0c
    ldr r4, [r0, #0x0]
    cmp r4, #0x0
    bne .L_02158cf4
    bl func_02086cf4
    ldr r1, .L_02158d10
    ldr r0, .L_02158d14
    ldr r2, .L_02158d18
    mov r3, #0x54
    bl func_0201a21c
    ldr r2, .L_02158d14
    mov r1, #0x0
    mov r4, r0
    bl func_020517fc
    mov r0, #0x1
    strb r0, [r4, #0xbe8]
    bl func_02026f94
    str r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r1, .L_02158d1c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x0]
    ldr r2, .L_02158d20
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    ldr r0, .L_02158d0c
    str r4, [r0, #0x0]
.L_02158cf4:
    mov r0, #0x0
    strb r0, [r4, #0xbe0]
    sub r0, r0, #0x1
    str r0, [r4, #0xa60]
    str r0, [r4, #0xbdc]
    ldmia sp!, {r4, pc}
.L_02158d0c: .word data_ov007_0216ad78
.L_02158d10: .word data_ov007_0216a15c
.L_02158d14: .word 0xbec
.L_02158d18: .word data_ov007_0216a0f8
.L_02158d1c: .word func_ov007_02159608
.L_02158d20: .word func_ov007_02158e90
    arm_func_end func_ov007_02158c68

    .global func_ov007_02158d24
    arm_func_start func_ov007_02158d24
func_ov007_02158d24: ; 0x02158d24
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02158d78
    mov r5, r0
    ldr r4, [r1, #0x0]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02158d54
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02158d54:
    mov r0, r4
    bl func_0201b244
    cmp r5, #0x0
    beq .L_02158d68
    bl func_02086d30
.L_02158d68:
    ldr r0, .L_02158d78
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
.L_02158d78: .word data_ov007_0216ad78
    arm_func_end func_ov007_02158d24

    .global func_ov007_02158d7c
    arm_func_start func_ov007_02158d7c
func_ov007_02158d7c: ; 0x02158d7c
    ldr r1, .L_02158d8c
    ldr r1, [r1, #0x0]
    str r0, [r1, #0x4]
    bx lr
.L_02158d8c: .word data_ov007_0216ad78
    arm_func_end func_ov007_02158d7c

    .global func_ov007_02158d90
    arm_func_start func_ov007_02158d90
func_ov007_02158d90: ; 0x02158d90
    cmp r1, #0x0
    beq .L_02158db8
    cmp r1, #0x1
    beq .L_02158dcc
    cmp r1, #0x2
    moveq r1, #0x1
    streq r1, [r0, #0x8]
    moveq r1, #0x0
    streq r1, [r0, #0xc]
    bx lr
.L_02158db8:
    mov r1, #0x3
    str r1, [r0, #0x8]
    mov r1, #0x8
    str r1, [r0, #0xc]
    bx lr
.L_02158dcc:
    mov r1, #0x3
    str r1, [r0, #0x8]
    mov r1, #0x0
    str r1, [r0, #0xc]
    bx lr
    arm_func_end func_ov007_02158d90

    .global func_ov007_02158de0
    arm_func_start func_ov007_02158de0
func_ov007_02158de0: ; 0x02158de0
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02158e38
    mov r5, r0
    ldr r4, [r1, #0x0]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov007_02158d90
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    blx func_0208c1e4
    ldr r0, [r4, #0x0]
    mov r1, r5
    blx func_0208b8ec
    mov r0, #0x0
    strb r0, [r4, #0xbe6]
    add r0, r4, #0xb00
    ldrsb r1, [r0, #0xe6]
    ldr r0, .L_02158e3c
    str r1, [r0, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_02158e38: .word data_ov007_0216ad78
.L_02158e3c: .word data_020afe90
    arm_func_end func_ov007_02158de0

    .global func_ov007_02158e40
    arm_func_start func_ov007_02158e40
func_ov007_02158e40: ; 0x02158e40
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02158e80
    mov r5, r0
    ldr r4, [r1, #0x0]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mvn r0, #0x0
    strb r0, [r4, #0xbe6]
    bl func_ov007_021598f0
    mov r0, r4
    mov r1, r5
    bl func_ov007_02158d90
    ldr r0, [r4, #0x0]
    mov r1, r5
    blx func_0208ba84
    ldmia sp!, {r3, r4, r5, pc}
.L_02158e80: .word data_ov007_0216ad78
    arm_func_end func_ov007_02158e40

    .global func_ov007_02158e84
    arm_func_start func_ov007_02158e84
func_ov007_02158e84: ; 0x02158e84
    ldr ip, .L_02158e8c
    bx ip
.L_02158e8c: .word func_0208c17c
    arm_func_end func_ov007_02158e84

    .global func_ov007_02158e90
    arm_func_start func_ov007_02158e90
func_ov007_02158e90: ; 0x02158e90
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r2, [r5, #0x4]
    ldr r1, [r1, #0x8]
    ldr r7, [r2, #0x10]
    blx r1
    sub r0, r0, #0x70000000
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_021594d4
.L_02158ec8: ; jump table
    b .L_02158ee4 ; case 0
    b .L_02158fd8 ; case 1
    b .L_0215907c ; case 2
    b .L_02159174 ; case 3
    b .L_02159268 ; case 4
    b .L_021594d4 ; case 5
    b .L_021594c8 ; case 6
.L_02158ee4:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r6, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r5, r0
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov007_0215961c
    movs r4, r0
    beq .L_02158f6c
    mov r1, r6
    add r0, r4, #0x4
    mov r2, #0x18
    bl func_0201b298
    cmp r0, #0x0
    beq .L_02159540
    mov r0, r5
    add r1, r4, #0x1c
    mov r2, #0xc0
    bl func_02051890
    mov r0, r6
    add r1, r4, #0x4
    mov r2, #0x18
    bl func_02051890
    mov r0, r7
    mov r1, r4
    bl func_ov007_02159694
    b .L_02159540
.L_02158f6c:
    add r4, r7, #0x10
    mov r1, #0x0
    b .L_02158f8c
.L_02158f78:
    ldrsb r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02158f98
    add r1, r1, #0x1
    add r4, r4, #0xdc
.L_02158f8c:
    cmp r1, #0xc
    blt .L_02158f78
    mov r4, #0x0
.L_02158f98:
    cmp r4, #0x0
    beq .L_02159540
    mov r0, r5
    add r1, r4, #0x1c
    mov r2, #0xc0
    bl func_02051890
    mov r0, r6
    add r1, r4, #0x4
    mov r2, #0x18
    bl func_02051890
    mov r2, #0x1
    mov r0, r7
    mov r1, r4
    strb r2, [r4, #0x0]
    bl func_ov007_02159694
    b .L_02159540
.L_02158fd8:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, r0
    mov r0, r7
    mov r2, r5
    bl func_ov007_0215961c
    movs r4, r0
    beq .L_02159540
    mov r2, #0x0
    mov r0, r7
    mov r1, r4
    strb r2, [r4, #0x0]
    bl func_ov007_02159694
    add r0, r7, #0x10
    sub r0, r4, r0
    mov r1, #0xdc
    bl func_0200d338
    mov r6, #0xdc
    mov r9, r0
    add r8, r7, #0x10
    mov r4, r6
    mov r5, r6
    b .L_02159068
.L_02159050:
    add r2, r9, #0x1
    mla r0, r9, r4, r8
    mla r1, r2, r5, r8
    mov r2, r6
    bl func_02051890
    add r9, r9, #0x1
.L_02159068:
    cmp r9, #0xb
    blt .L_02159050
    mov r0, #0x0
    strb r0, [r7, #0x984]
    b .L_02159540
.L_0215907c:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    add r1, r7, #0x264
    add r6, r1, #0x800
    mov r4, r0
    mov r1, #0x0
    b .L_021590c8
.L_021590b4:
    ldrsb r0, [r6, #0x0]
    cmp r0, #0x0
    beq .L_021590d4
    add r1, r1, #0x1
    add r6, r6, #0x22
.L_021590c8:
    cmp r1, #0xb
    blt .L_021590b4
    mov r6, #0x0
.L_021590d4:
    cmp r6, #0x0
    beq .L_02159540
    ldrsb r0, [r5, #0x16]
    cmp r0, #0x0
    beq .L_021590fc
    bl func_ov007_021597fc
    ldr r1, [r7, #0xc]
    cmp r0, r1
    blt .L_0215910c
    b .L_02159540
.L_021590fc:
    bl func_ov007_021597b4
    ldr r1, [r7, #0x8]
    cmp r0, r1
    bge .L_02159540
.L_0215910c:
    mov r0, r4
    add r1, r6, #0x4
    mov r2, #0x6
    bl func_02051890
    mov r0, r5
    add r1, r6, #0xa
    mov r2, #0x18
    bl func_02051890
    add r0, r7, #0x264
    add r0, r0, #0x800
    mov r2, #0x1
    sub r0, r6, r0
    mov r1, #0x22
    strb r2, [r6, #0x0]
    bl func_0200d338
    add r0, r0, #0x1
    bl func_02070cdc
    mov r0, r7
    mov r1, r6
    bl func_ov007_02159740
    bl func_ov007_021597fc
    ldrb r1, [r7, #0xbe0]
    and r0, r0, #0xff
    cmp r1, r0
    strneb r0, [r7, #0xbe0]
    b .L_02159540
.L_02159174:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    add r1, r7, #0x264
    mov r6, r0
    add r5, r1, #0x800
    mov r8, #0x0
    mov r4, #0x6
    b .L_021591c8
.L_0215919c:
    ldrsb r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_021591c0
    mov r1, r6
    mov r2, r4
    add r0, r5, #0x4
    bl func_0201b298
    cmp r0, #0x0
    beq .L_021591d4
.L_021591c0:
    add r8, r8, #0x1
    add r5, r5, #0x22
.L_021591c8:
    cmp r8, #0xb
    blt .L_0215919c
    mov r5, #0x0
.L_021591d4:
    cmp r5, #0x0
    beq .L_02159540
    add r0, r7, #0x264
    add r0, r0, #0x800
    sub r0, r5, r0
    mov r1, #0x22
    bl func_0200d338
    mov r4, r0
    add r0, r4, #0x1
    bl func_02070cdc
    mov r2, #0x0
    mov r0, r7
    mov r1, r5
    strb r2, [r5, #0x0]
    bl func_ov007_02159740
    mov r8, #0x22
    add r0, r7, #0x264
    add r9, r0, #0x800
    mov r5, r8
    mov r6, r8
    b .L_02159240
.L_02159228:
    add r1, r4, #0x1
    mla r0, r1, r5, r9
    mla r1, r4, r6, r9
    mov r2, r8
    bl func_02051890
    add r4, r4, #0x1
.L_02159240:
    cmp r4, #0xa
    blt .L_02159228
    mov r0, #0x0
    strb r0, [r7, #0xbb8]
    bl func_ov007_021597fc
    ldrb r1, [r7, #0xbe0]
    and r0, r0, #0xff
    cmp r1, r0
    strneb r0, [r7, #0xbe0]
    b .L_02159540
.L_02159268:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x11
    bhi .L_021592a8
    bhs .L_02159348
    cmp r0, #0x5
    bhi .L_02159458
    cmp r0, #0x0
    beq .L_021592b4
    cmp r0, #0x4
    beq .L_021593fc
    cmp r0, #0x5
    beq .L_02159300
    b .L_02159458
.L_021592a8:
    cmp r0, #0x26
    beq .L_02159368
    b .L_02159458
.L_021592b4:
    mov r0, #0x1
    strb r0, [r7, #0xbe5]
    add r0, r7, #0xb00
    ldrsb r0, [r0, #0xe6]
    cmp r0, #0x0
    addge r0, r7, r0
    movge r1, #0x0
    strgeb r1, [r0, #0xbe1]
    blx func_0208c11c
    add r0, r7, r0
    mov r1, #0x1
    strb r1, [r0, #0xbe1]
    blx func_0208c11c
    strb r0, [r7, #0xbe6]
    add r0, r7, #0xb00
    ldrsb r1, [r0, #0xe6]
    ldr r0, .L_02159548
    str r1, [r0, #0x8]
    b .L_02159540
.L_02159300:
    mov r0, #0x1
    strb r0, [r7, #0xbe1]
    blx func_0208c11c
    add r0, r7, r0
    mov r1, #0x1
    strb r1, [r0, #0xbe1]
    blx func_0208c11c
    strb r0, [r7, #0xbe6]
    add r0, r7, #0xb00
    ldrsb r2, [r0, #0xe6]
    ldr r1, .L_02159548
    mov r0, r4
    str r2, [r1, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    blx func_0208c11c
    b .L_02159540
.L_02159348:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    add r0, r7, r0
    mov r1, #0x1
    strb r1, [r0, #0xbe1]
    b .L_02159540
.L_02159368:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    strb r0, [r7, #0xbe0]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r0, r0, lsr #0x8
    and r3, r0, #0xff
    mov r0, #0x0
    mov r2, #0x1
    b .L_021593d0
.L_021593c0:
    add r1, r7, r0
    add r0, r0, #0x1
    strb r2, [r1, #0xbe1]
    and r0, r0, #0xff
.L_021593d0:
    cmp r0, r3
    blo .L_021593c0
    mov r2, #0x0
    b .L_021593f0
.L_021593e0:
    add r1, r7, r0
    add r0, r0, #0x1
    strb r2, [r1, #0xbe1]
    and r0, r0, #0xff
.L_021593f0:
    cmp r0, #0x4
    blo .L_021593e0
    b .L_02159540
.L_021593fc:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    add r0, r7, r0
    mov r1, #0x0
    strb r1, [r0, #0xbe1]
    add r0, r7, #0xb00
    ldrsb r0, [r0, #0xe6]
    cmp r0, #0x0
    addge r0, r7, r0
    strgeb r1, [r0, #0xbe1]
    blx func_0208c11c
    add r0, r7, r0
    mov r1, #0x1
    strb r1, [r0, #0xbe1]
    blx func_0208c11c
    strb r0, [r7, #0xbe6]
    add r0, r7, #0xb00
    ldrsb r1, [r0, #0xe6]
    ldr r0, .L_02159548
    str r1, [r0, #0x8]
    b .L_02159540
.L_02159458:
    mov r0, r7
    bl func_ov007_021595e0
    ldr r0, [r7, #0x4]
    cmp r0, #0x0
    beq .L_02159540
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r8, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r6, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r2, r8
    mov r3, r6
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r1, [r7, #0x4]
    bl func_ov007_0215954c
    b .L_02159540
.L_021594c8:
    mov r0, #0x1
    strb r0, [r7, #0xbe7]
    b .L_02159540
.L_021594d4:
    mov r0, r7
    bl func_ov007_021595e0
    ldr r0, [r7, #0x4]
    cmp r0, #0x0
    beq .L_02159540
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r8, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r6, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r2, r8
    mov r3, r6
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r1, [r7, #0x4]
    bl func_ov007_0215954c
.L_02159540:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02159548: .word data_020afe90
    arm_func_end func_ov007_02158e90

    .global func_ov007_0215954c
    arm_func_start func_ov007_0215954c
func_ov007_0215954c: ; 0x0215954c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r2
    ldr r4, [r0, #0x4]
    ldr r5, [r1, #0x4]
    mov r0, #0x2c
    mov r6, r3
    ldr r1, .L_021595cc
    ldr r2, .L_021595d0
    add r3, r0, #0xde
    bl func_0201a21c
    movs r1, r0
    beq .L_021595bc
    ldr r0, .L_021595d4
    mov r2, #0x0
    str r0, [r1, #0x0]
    ldr r0, .L_021595d8
    str r2, [r1, #0xc]
    ldr r2, [r0, #0x0]
    ldr r0, .L_021595dc
    str r2, [r1, #0x10]
    str r4, [r1, #0x14]
    str r7, [r1, #0x18]
    str r0, [r1, #0x0]
    ldr r2, [sp, #0x18]
    str r6, [r1, #0x20]
    ldr r0, [sp, #0x1c]
    str r2, [r1, #0x24]
    str r0, [r1, #0x28]
.L_021595bc:
    ldr r2, [sp, #0x1c]
    mov r0, r5
    bl func_02028644
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021595cc: .word data_ov007_0216a0e8
.L_021595d0: .word data_ov007_0216a0dc
.L_021595d4: .word data_02094584
.L_021595d8: .word data_02093c24
.L_021595dc: .word data_ov007_0216a13c
    arm_func_end func_ov007_0215954c

    .global func_ov007_021595e0
    arm_func_start func_ov007_021595e0
func_ov007_021595e0: ; 0x021595e0
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    bxeq lr
    ldr r1, [r1, #0x4]
    ldrb r1, [r1, #0x29]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x1f
    movne r1, #0x0
    strne r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov007_021595e0

    .global func_ov007_02159608
    arm_func_start func_ov007_02159608
func_ov007_02159608: ; 0x02159608
    ldr r0, [r0, #0x4]
    ldr ip, .L_02159618
    ldr r0, [r0, #0x10]
    bx ip
.L_02159618: .word func_ov007_021595e0
    arm_func_end func_ov007_02159608

    .global func_ov007_0215961c
    arm_func_start func_ov007_0215961c
func_ov007_0215961c: ; 0x0215961c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r1
    mov r8, r2
    add r6, r0, #0x10
    mov r7, #0x0
    mov r4, #0x6
    mov r5, #0x14
    b .L_02159684
.L_0215963c:
    ldrsb r0, [r6, #0x0]
    cmp r0, #0x0
    beq .L_0215967c
    mov r1, r8
    mov r2, r5
    add r0, r6, #0x4
    bl func_0201b298
    cmp r0, #0x0
    bne .L_0215967c
    mov r2, r4
    add r0, r6, #0x20
    add r1, r9, #0x4
    bl func_0201b298
    cmp r0, #0x0
    moveq r0, r6
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0215967c:
    add r7, r7, #0x1
    add r6, r6, #0xdc
.L_02159684:
    cmp r7, #0xc
    blt .L_0215963c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    arm_func_end func_ov007_0215961c

    .global func_ov007_02159694
    arm_func_start func_ov007_02159694
func_ov007_02159694: ; 0x02159694
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    sub r0, r1, r0
    mov r1, #0xdc
    bl func_0200d338
    ldr r1, [r4, #0xa60]
    cmp r1, #0x0
    cmpge r0, r1
    strlt r0, [r4, #0xa60]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02159694

    .global func_ov007_021596c0
    arm_func_start func_ov007_021596c0
func_ov007_021596c0: ; 0x021596c0
    ldr r0, .L_021596d0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x10
    bx lr
.L_021596d0: .word data_ov007_0216ad78
    arm_func_end func_ov007_021596c0

    .global func_ov007_021596d4
    arm_func_start func_ov007_021596d4
func_ov007_021596d4: ; 0x021596d4
    ldr r0, .L_021596e4
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0xa60]
    bx lr
.L_021596e4: .word data_ov007_0216ad78
    arm_func_end func_ov007_021596d4

    .global func_ov007_021596e8
    arm_func_start func_ov007_021596e8
func_ov007_021596e8: ; 0x021596e8
    ldr r0, .L_021596fc
    mvn r1, #0x0
    ldr r0, [r0, #0x0]
    str r1, [r0, #0xa60]
    bx lr
.L_021596fc: .word data_ov007_0216ad78
    arm_func_end func_ov007_021596e8

    .global func_ov007_02159700
    arm_func_start func_ov007_02159700
func_ov007_02159700: ; 0x02159700
    stmdb sp!, {r4, lr}
    ldr r3, .L_0215973c
    mov r2, #0xdc
    ldr r4, [r3, #0x0]
    add r3, r4, #0x10
    mla r2, r0, r2, r3
    add r0, r2, #0x1c
    blx func_0208bb00
    strb r0, [r4, #0xbe8]
    add r0, r4, #0xb00
    ldrsb r0, [r0, #0xe8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_0215973c: .word data_ov007_0216ad78
    arm_func_end func_ov007_02159700

    .global func_ov007_02159740
    arm_func_start func_ov007_02159740
func_ov007_02159740: ; 0x02159740
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x264
    add r0, r0, #0x800
    sub r0, r1, r0
    mov r1, #0x22
    bl func_0200d338
    ldr r1, [r4, #0xbdc]
    cmp r1, #0x0
    cmpge r0, r1
    strlt r0, [r4, #0xbdc]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02159740

    .global func_ov007_02159770
    arm_func_start func_ov007_02159770
func_ov007_02159770: ; 0x02159770
    ldr r0, .L_02159784
    ldr r0, [r0, #0x0]
    add r0, r0, #0x264
    add r0, r0, #0x800
    bx lr
.L_02159784: .word data_ov007_0216ad78
    arm_func_end func_ov007_02159770

    .global func_ov007_02159788
    arm_func_start func_ov007_02159788
func_ov007_02159788: ; 0x02159788
    ldr r0, .L_02159798
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0xbdc]
    bx lr
.L_02159798: .word data_ov007_0216ad78
    arm_func_end func_ov007_02159788

    .global func_ov007_0215979c
    arm_func_start func_ov007_0215979c
func_ov007_0215979c: ; 0x0215979c
    ldr r0, .L_021597b0
    mvn r1, #0x0
    ldr r0, [r0, #0x0]
    str r1, [r0, #0xbdc]
    bx lr
.L_021597b0: .word data_ov007_0216ad78
    arm_func_end func_ov007_0215979c

    .global func_ov007_021597b4
    arm_func_start func_ov007_021597b4
func_ov007_021597b4: ; 0x021597b4
    ldr r1, .L_021597f8
    mov r0, #0x0
    ldr r1, [r1, #0x0]
    mov r3, r0
    add r1, r1, #0x264
    add r2, r1, #0x800
.L_021597cc:
    ldrsb r1, [r2, #0x0]
    cmp r1, #0x0
    beq .L_021597e4
    ldrsb r1, [r2, #0x20]
    cmp r1, #0x0
    addeq r0, r0, #0x1
.L_021597e4:
    add r3, r3, #0x1
    cmp r3, #0xb
    add r2, r2, #0x22
    blt .L_021597cc
    bx lr
.L_021597f8: .word data_ov007_0216ad78
    arm_func_end func_ov007_021597b4

    .global func_ov007_021597fc
    arm_func_start func_ov007_021597fc
func_ov007_021597fc: ; 0x021597fc
    ldr r1, .L_0215983c
    mov r0, #0x0
    ldr r1, [r1, #0x0]
    mov r3, r0
    add r1, r1, #0x264
    add r2, r1, #0x800
.L_02159814:
    ldrsb r1, [r2, #0x0]
    add r3, r3, #0x1
    cmp r1, #0x0
    ldrnesb r1, [r2, #0x20]
    add r2, r2, #0x22
    cmpne r1, #0x0
    addne r0, r0, #0x1
    cmp r3, #0xb
    blt .L_02159814
    bx lr
.L_0215983c: .word data_ov007_0216ad78
    arm_func_end func_ov007_021597fc

    .global func_ov007_02159840
    arm_func_start func_ov007_02159840
func_ov007_02159840: ; 0x02159840
    ldr r1, .L_02159864
    ldr r1, [r1, #0x0]
    add r0, r1, r0
    add r0, r0, #0xb00
    ldrsb r0, [r0, #0xe1]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02159864: .word data_ov007_0216ad78
    arm_func_end func_ov007_02159840

    .global func_ov007_02159868
    arm_func_start func_ov007_02159868
func_ov007_02159868: ; 0x02159868
    ldr r0, .L_02159888
    ldr r0, [r0, #0x0]
    add r0, r0, #0xb00
    ldrsb r0, [r0, #0xe5]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02159888: .word data_ov007_0216ad78
    arm_func_end func_ov007_02159868

    .global func_ov007_0215988c
    arm_func_start func_ov007_0215988c
func_ov007_0215988c: ; 0x0215988c
    ldr r0, .L_021598a0
    ldr r0, [r0, #0x0]
    add r0, r0, #0xb00
    ldrsb r0, [r0, #0xe6]
    bx lr
.L_021598a0: .word data_ov007_0216ad78
    arm_func_end func_ov007_0215988c

    .global func_ov007_021598a4
    arm_func_start func_ov007_021598a4
func_ov007_021598a4: ; 0x021598a4
    ldr r0, .L_021598b4
    ldr r0, [r0, #0x0]
    ldrb r0, [r0, #0xbe0]
    bx lr
.L_021598b4: .word data_ov007_0216ad78
    arm_func_end func_ov007_021598a4

    .global func_ov007_021598b8
    arm_func_start func_ov007_021598b8
func_ov007_021598b8: ; 0x021598b8
    ldr r0, .L_021598ec
    ldr r0, [r0, #0x0]
    add r0, r0, #0xb00
    ldrsb r1, [r0, #0xe7]
    cmp r1, #0x0
    bne .L_021598dc
    ldrsb r0, [r0, #0xe8]
    cmp r0, #0x0
    bne .L_021598e4
.L_021598dc:
    mov r0, #0x1
    bx lr
.L_021598e4:
    mov r0, #0x0
    bx lr
.L_021598ec: .word data_ov007_0216ad78
    arm_func_end func_ov007_021598b8

    .global func_ov007_021598f0
    arm_func_start func_ov007_021598f0
func_ov007_021598f0: ; 0x021598f0
    ldr r0, .L_0215990c
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    mov r0, #0x1
    strb r1, [r2, #0xbe7]
    strb r0, [r2, #0xbe8]
    bx lr
.L_0215990c: .word data_ov007_0216ad78
    arm_func_end func_ov007_021598f0

    .global func_ov007_02159910
    arm_func_start func_ov007_02159910
func_ov007_02159910: ; 0x02159910
    ldr r0, [r0, #0x10]
    bx lr
    arm_func_end func_ov007_02159910

    .global func_ov007_02159918
    arm_func_start func_ov007_02159918
func_ov007_02159918: ; 0x02159918
    ldr r0, [r0, #0xc]
    bx lr
    arm_func_end func_ov007_02159918

    .global func_ov007_02159920
    arm_func_start func_ov007_02159920
func_ov007_02159920: ; 0x02159920
    ldr r0, [r0, #0x18]
    bx lr
    arm_func_end func_ov007_02159920

    .global func_ov007_02159928
    arm_func_start func_ov007_02159928
func_ov007_02159928: ; 0x02159928
    stmdb sp!, {r4, lr}
    ldr r1, .L_02159980
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_02159954
    ldr r1, [r4, #0x28]
    tst r1, #0x2
    beq .L_02159954
    bl func_0201b268
.L_02159954:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_02159970
    ldr r1, [r4, #0x28]
    tst r1, #0x4
    beq .L_02159970
    bl func_0201b268
.L_02159970:
    mov r0, r4
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02159980: .word data_ov007_0216a13c
    arm_func_end func_ov007_02159928

    .global func_ov007_02159984
    arm_func_start func_ov007_02159984
func_ov007_02159984: ; 0x02159984
    ldr r0, [r0, #0x24]
    bx lr
    arm_func_end func_ov007_02159984

    .global func_ov007_0215998c
    arm_func_start func_ov007_0215998c
func_ov007_0215998c: ; 0x0215998c
    ldr r0, [r0, #0x20]
    bx lr
    arm_func_end func_ov007_0215998c

    .global func_ov007_02159994
    arm_func_start func_ov007_02159994
func_ov007_02159994: ; 0x02159994
    stmdb sp!, {r4, lr}
    ldr r1, .L_021599e4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_021599c0
    ldr r1, [r4, #0x28]
    tst r1, #0x2
    beq .L_021599c0
    bl func_0201b268
.L_021599c0:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_021599dc
    ldr r1, [r4, #0x28]
    tst r1, #0x4
    beq .L_021599dc
    bl func_0201b268
.L_021599dc:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_021599e4: .word data_ov007_0216a13c
    arm_func_end func_ov007_02159994

    .global func_ov007_021599e8
    arm_func_start func_ov007_021599e8
func_ov007_021599e8: ; 0x021599e8
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_02159ab4
    ldr r2, .L_02159ab8
    mov r0, #0x188
    mov r3, #0x2d
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x188
    mov r4, r0
    bl func_020517fc
    mov r0, #0x1
    strb r0, [r4, #0x4]
    strb r0, [r4, #0x5]
    mov r3, #0x0
    strb r3, [r4, #0x6]
    mov r0, #0xc
    str r0, [r4, #0x8]
    add r0, r4, #0x38
    str r0, [r4, #0xc]
    mov r2, r3
    mov r0, #0x1c
    b .L_02159a50
.L_02159a44:
    mla r1, r3, r0, r4
    strb r2, [r1, #0x38]
    add r3, r3, #0x1
.L_02159a50:
    ldr r1, [r4, #0x8]
    cmp r3, r1
    blt .L_02159a44
    bl func_02026f94
    str r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r1, .L_02159abc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r1, [r4, #0x0]
    mov r0, #0x80000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02159ab4: .word data_ov007_0216a198
.L_02159ab8: .word data_ov007_0216a178
.L_02159abc: .word func_ov007_02159af4
    arm_func_end func_ov007_021599e8

    .global func_ov007_02159ac0
    arm_func_start func_ov007_02159ac0
func_ov007_02159ac0: ; 0x02159ac0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02159ae0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02159ae0:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02159ac0

    .global func_ov007_02159aec
    arm_func_start func_ov007_02159aec
func_ov007_02159aec: ; 0x02159aec
    add r0, r0, #0x4
    bx lr
    arm_func_end func_ov007_02159aec

    .global func_ov007_02159af4
    arm_func_start func_ov007_02159af4
func_ov007_02159af4: ; 0x02159af4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r0, [r0, #0x4]
    ldr r10, [r0, #0x10]
    bl func_ov007_021596d4
    movs r6, r0
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    bl func_ov007_021596c0
    mov r1, #0xdc
    add r3, r10, #0x38
    mov r2, #0x1c
    mla r7, r6, r1, r0
    mla r8, r6, r2, r3
    mov r9, r6
    mov r5, #0x1
    mov r11, #0x14
    mov r4, #0x0
    b .L_02159b7c
.L_02159b38:
    ldrsb r1, [r7, #0x0]
    mov r2, r11
    add r0, r7, #0x4
    strb r1, [r8, #0x0]
    strb r5, [r8, #0x2]
    add r1, r8, #0x4
    bl func_02051890
    strb r4, [r8, #0x18]
    ldrb r0, [r7, #0x1a]
    add r9, r9, #0x1
    strb r0, [r8, #0x19]
    ldrb r1, [r7, #0x19]
    ldrb r0, [r7, #0x1a]
    add r7, r7, #0xdc
    sub r0, r1, r0
    strb r0, [r8, #0x1b]
    add r8, r8, #0x1c
.L_02159b7c:
    ldr r0, [r10, #0x8]
    cmp r9, r0
    blt .L_02159b38
    str r6, [r10, #0x10]
    bl func_ov007_021596e8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov007_02159af4

    .global func_ov007_02159b94
    arm_func_start func_ov007_02159b94
func_ov007_02159b94: ; 0x02159b94
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02159d40
    mov r5, r0
    ldr r2, .L_02159d44
    mov r0, #0xc0
    mov r3, #0x59
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0xc0
    bl func_020517fc
    mov r0, r5
    add r1, r4, #0xb0
    mov r2, #0x10
    bl func_02051890
    ldrb r0, [r4, #0xb0]
    cmp r0, #0x0
    beq .L_02159be4
    ldr r0, [r4, #0xb4]
    bl func_ov007_02158de0
.L_02159be4:
    bl func_020310f4
    ldr r2, .L_02159d48
    str r0, [r4, #0x0]
    ldr r1, .L_02159d4c
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_02159d50
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    ldr r0, [r4, #0x0]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    mov r0, #0x1
    strb r0, [r4, #0xa5]
    ldr r0, [r4, #0x0]
    bl func_ov007_02150d44
    blx func_ov012_021b65bc
    mov r0, #0x0
    bl func_02028920
    str r0, [r4, #0x8]
    ldrb r0, [r4, #0xb1]
    mov r3, #0x0
    mov r1, #0x4
    strb r0, [r4, #0xc]
    strb r3, [r4, #0xd]
    strb r3, [r4, #0xf]
    strb r3, [r4, #0x10]
    ldrb r2, [r4, #0xb0]
    add r0, r4, #0x40
    strb r2, [r4, #0x11]
    str r1, [r4, #0x18]
    str r0, [r4, #0x1c]
    mov r2, r3
    mov r0, #0x18
.L_02159c84:
    mla r1, r3, r0, r4
    add r3, r3, #0x1
    strb r2, [r1, #0x40]
    cmp r3, #0x4
    blt .L_02159c84
    ldrb r0, [r4, #0xb0]
    cmp r0, #0x0
    beq .L_02159cbc
    blx func_02071f08
    add r1, r4, #0x44
    mov r2, #0x14
    bl func_02051890
    mov r0, #0x1
    strb r0, [r4, #0x40]
.L_02159cbc:
    ldr r0, .L_02159d54
    str r4, [r4, #0x20]
    str r0, [r4, #0x2c]
    ldr r1, .L_02159d58
    ldr r0, .L_02159d5c
    str r1, [r4, #0x30]
    str r0, [r4, #0x34]
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02159d60
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r1, [r4, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    bl func_02088330
    bl func_020882e0
    add r0, r4, #0xc
    bl func_ov007_02157b7c
    str r0, [r4, #0xa8]
    ldr r0, [r4, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
.L_02159d40: .word data_ov007_0216a1d0
.L_02159d44: .word data_ov007_0216a1b4
.L_02159d48: .word data_02093c04
.L_02159d4c: .word data_020a0e80
.L_02159d50: .word data_020a16c0
.L_02159d54: .word func_ov007_02159d98
.L_02159d58: .word func_ov007_02159d64
.L_02159d5c: .word func_ov007_02159d84
.L_02159d60: .word func_ov007_02159fa0
    arm_func_end func_ov007_02159b94

    .global func_ov007_02159d64
    arm_func_start func_ov007_02159d64
func_ov007_02159d64: ; 0x02159d64
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b65bc
    blx func_0208c174
    blx func_0208bf9c
    mov r0, #0x1
    str r0, [r4, #0xac]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02159d64

    .global func_ov007_02159d84
    arm_func_start func_ov007_02159d84
func_ov007_02159d84: ; 0x02159d84
    ldr ip, .L_02159d94
    mvn r1, #0x0
    str r1, [r0, #0xac]
    bx ip
.L_02159d94: .word func_ov007_02158e84
    arm_func_end func_ov007_02159d84

    .global func_ov007_02159d98
    arm_func_start func_ov007_02159d98
func_ov007_02159d98: ; 0x02159d98
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldrb r0, [r8, #0xa4]
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02159f94
    ldr r0, [r8, #0xac]
    cmp r0, #0x0
    ble .L_02159ef0
    bl func_02086c4c
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r8, #0xa5]
    movne r0, #0x1
    bne .L_02159dfc
    bl func_020882c4
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02159dfc
    bl func_02088290
    bl func_02086c94
    mov r0, #0x0
    strb r0, [r8, #0xa5]
    mov r0, #0x1
.L_02159dfc:
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02159f94
    bl func_020876f8
    cmp r0, #0x0
    beq .L_02159ed0
    bl func_02086d60
    mov r4, r0
    bl func_02086d80
    sub r6, r4, r0
    bl func_02086d80
    mov r4, #0x1
    mov r1, r4, lsl r6
    mov r0, r4, lsl r0
    sub r1, r1, #0x1
    sub r0, r0, #0x1
    mov r7, r4
    orr r5, r0, r1, lsl #0x4
    mov r9, r4
    b .L_02159e60
.L_02159e4c:
    mov r0, r7
    bl func_02088310
    cmp r0, #0x0
    orrne r4, r4, r9, lsl r7
    add r7, r7, #0x1
.L_02159e60:
    bl func_02086d80
    cmp r7, r0
    blo .L_02159e4c
    mov r9, #0x4
    add r6, r6, #0x4
    mov r7, #0x1
    b .L_02159e90
.L_02159e7c:
    mov r0, r9
    bl func_02088310
    cmp r0, #0x0
    orrne r4, r4, r7, lsl r9
    add r9, r9, #0x1
.L_02159e90:
    cmp r9, r6
    blt .L_02159e7c
    and r4, r5, r4
    cmp r5, r4
    bne .L_02159eb4
    bl func_020882e0
    bl func_02087160
    mov r0, #0x1
    strb r0, [r8, #0xa4]
.L_02159eb4:
    cmp r5, r4
    bne .L_02159f0c
    bl func_020882e0
    bl func_02087160
    mov r0, #0x1
    strb r0, [r8, #0xa4]
    b .L_02159f0c
.L_02159ed0:
    bl func_02088360
    cmp r0, #0x0
    beq .L_02159f0c
    bl func_02088330
    bl func_020882e0
    mov r0, #0x1
    strb r0, [r8, #0xa4]
    b .L_02159f0c
.L_02159ef0:
    bl func_ov007_02159868
    cmp r0, #0x0
    beq .L_02159f0c
    bl func_020876ac
    bl func_0208712c
    mov r0, #0x1
    str r0, [r8, #0xac]
.L_02159f0c:
    bl func_ov007_021598b8
    cmp r0, #0x0
    beq .L_02159f90
    mvn r0, #0x0
    str r0, [r8, #0xac]
    ldr r0, [r8, #0xa8]
    mov r1, #0x1
    blx func_ov007_021586bc
    ldr r0, [r8, #0xa8]
    blx func_ov007_021586a4
    mov r5, r0
    mov r0, #0x78
    mov r1, #0xb
    bl func_0207342c
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, r5
    mov r1, #0x51
    mov r3, r2
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
    ldr r4, .L_02159f9c
    b .L_02159f78
.L_02159f70:
    ldr r0, [r4, #0x0]
    blx r0
.L_02159f78:
    mov r0, r5
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02159f70
    mov r0, #0x0
    b .L_02159f94
.L_02159f90:
    mov r0, #0x1
.L_02159f94:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02159f9c: .word data_020a0e18
    arm_func_end func_ov007_02159d98

    .global func_ov007_02159fa0
    arm_func_start func_ov007_02159fa0
func_ov007_02159fa0: ; 0x02159fa0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02073fe4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02159fc4
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02159fc4: .word func_ov007_02159fc8
    arm_func_end func_ov007_02159fa0

    .global func_ov007_02159fc8
    arm_func_start func_ov007_02159fc8
func_ov007_02159fc8: ; 0x02159fc8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, [r0, #0x4]
    ldr r10, [r1, #0x10]
    ldr r1, [r10, #0xa8]
    ldr r6, [r10, #0x1c]
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x224]
    cmp r1, #0x0
    beq .L_02159ffc
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215a164
    bl func_02028384
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02159ffc:
    ldrb r0, [r10, #0xb0]
    cmp r0, #0x0
    beq .L_0215a0ac
    bl func_ov007_02159788
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    bl func_ov007_02159770
    mov r8, #0x1
    mov r9, #0x0
    mov r7, r0
    mov r5, r8
    mov r4, r9
    mov r11, #0x18
.L_0215a030:
    ldrsb r0, [r7, #0x0]
    cmp r0, #0x0
    beq .L_0215a06c
    ldrsb r0, [r7, #0x20]
    cmp r0, #0x0
    bne .L_0215a06c
    mul r0, r8, r11
    add r3, r6, r0
    strb r5, [r6, r0]
    mov r2, #0x14
    add r0, r7, #0xa
    add r1, r3, #0x4
    strb r4, [r3, #0x1]
    bl func_02051890
    add r8, r8, #0x1
.L_0215a06c:
    add r9, r9, #0x1
    cmp r9, #0xb
    add r7, r7, #0x22
    blt .L_0215a030
    mov r2, #0x0
    mov r0, #0x18
    b .L_0215a094
.L_0215a088:
    mul r1, r8, r0
    strb r2, [r6, r1]
    add r8, r8, #0x1
.L_0215a094:
    cmp r8, #0x4
    blt .L_0215a088
    bl func_ov007_021597fc
    strb r0, [r10, #0xd]
    bl func_ov007_0215979c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215a0ac:
    bl func_ov007_0215988c
    cmp r0, #0x0
    blt .L_0215a158
    bl func_ov007_0215988c
    mov r1, #0x1
    str r0, [r10, #0x14]
    strb r1, [r10, #0xa0]
    ldr r0, [r10, #0x14]
    mov r7, #0x0
    add r0, r10, r0
    mov r8, r7
    strb r1, [r0, #0xa0]
    mov r5, r1
    mov r11, #0x14
    mov r4, #0x18
.L_0215a0e8:
    cmp r8, #0x0
    ldrne r0, [r10, #0x14]
    cmpne r8, r0
    beq .L_0215a108
    mov r0, r8
    bl func_ov007_02159840
    cmp r0, #0x0
    beq .L_0215a12c
.L_0215a108:
    mul r1, r7, r4
    mov r0, r8
    add r9, r6, r1
    strb r5, [r6, r1]
    bl func_02070cdc
    mov r2, r11
    add r1, r9, #0x4
    bl func_02051890
    add r7, r7, #0x1
.L_0215a12c:
    add r8, r8, #0x1
    cmp r8, #0x4
    blt .L_0215a0e8
    mov r2, #0x0
    mov r0, #0x18
    b .L_0215a150
.L_0215a144:
    mul r1, r7, r0
    strb r2, [r6, r1]
    add r7, r7, #0x1
.L_0215a150:
    cmp r7, #0x4
    blt .L_0215a144
.L_0215a158:
    bl func_ov007_021598a4
    strb r0, [r10, #0xd]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215a164: .word func_ov007_0215a168
    arm_func_end func_ov007_02159fc8

    .global func_ov007_0215a168
    arm_func_start func_ov007_0215a168
func_ov007_0215a168: ; 0x0215a168
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    bge .L_0215a194
    ldr r0, [r4, #0xbc]
    cmp r0, #0x0
    beq .L_0215a1a4
    blx r0
    b .L_0215a1a4
.L_0215a194:
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    beq .L_0215a1a4
    blx r0
.L_0215a1a4:
    ldr r0, .L_0215a2a4
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215a2a4
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215a2a4
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215a2a4
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    bge .L_0215a1ec
    ldrb r0, [r4, #0xa5]
    bl func_ov007_02158d24
    b .L_0215a224
.L_0215a1ec:
    mov r0, #0x0
    bl func_ov007_02158d24
    blx func_0208c11c
    blx func_0208bd0c
    blx func_0208bce4
    blx func_0208c11c
    ldr r1, .L_0215a2a8
    str r0, [r1, #0x8]
    blx func_0208bd0c
    ldr r1, .L_0215a2a8
    str r0, [r1, #0x0]
    blx func_0208bd0c
    ldr r1, .L_0215a2a8
    str r0, [r1, #0x4]
.L_0215a224:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0215a23c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215a23c:
    bl func_02088330
    bl func_020882e0
    ldr r0, [r4, #0x0]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_0215a2ac
    ldr r2, .L_0215a2b0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215a2b4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldr r0, .L_0215a2b8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl func_0201ad30
    ldmia sp!, {r4, pc}
.L_0215a2a4: .word data_020a0e18
.L_0215a2a8: .word data_020afe90
.L_0215a2ac: .word data_02093c04
.L_0215a2b0: .word data_020a16c0
.L_0215a2b4: .word data_020a0e80
.L_0215a2b8: .word data_020a0dd8
    arm_func_end func_ov007_0215a168

    .global func_ov007_0215a2bc
    arm_func_start func_ov007_0215a2bc
func_ov007_0215a2bc: ; 0x0215a2bc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x6c
    mov r0, #0x88
    ldr r1, .L_0215af9c
    ldr r2, .L_0215afa0
    add r3, r0, #0x9f
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x88
    mov r10, r0
    bl func_020517fc
    blx func_0208822c
    bl func_02087688
    bl func_ov007_02158c68
    mov r0, #0x0
    bl func_ov007_02158e40
    bl func_020883b0
    bl func_020310f4
    ldr r2, .L_0215afa4
    str r0, [r10, #0x4]
    ldr r1, .L_0215afa8
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_0215afac
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    ldr r0, [r10, #0x4]
    bl func_ov007_02150d44
    blx func_ov012_021b65bc
    bl func_ov007_021599e8
    str r0, [r10, #0x7c]
    bl func_ov007_02159aec
    str r0, [r10, #0x74]
    mov r0, #0x0
    bl func_02028920
    str r0, [r10, #0x10]
    mov r0, #0x20
    mov r1, #0x40
    mov r2, #0x4000
    mov r3, #0x1
    bl func_ov007_02150678
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov007_021509ac
    str r0, [r10, #0x0]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov007_02150e14
    mov r0, #0x2
    bl func_0203b414
    ldr r1, .L_0215afb0
    ldr r2, [r0, #0x88]
    ldr r0, [r1, #0x8]
    ldr r1, [r1, #0x0]
    bl func_ov007_02150f80
    str r0, [r10, #0x18]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, .L_0215afb0
    ldr r1, [r0, #0x88]
    ldr r0, [r2, #0x4]
    bl func_ov007_02150f54
    mov r6, #0x0
    ldr r5, .L_0215afb4
    str r0, [r10, #0x28]
    mov r4, r6
.L_0215a3d4:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r10, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x20]
    cmp r6, #0x2
    blt .L_0215a3d4
    ldr r0, .L_0215afb8
    ldr r1, .L_0215afbc
    ldr r2, .L_0215afc0
    bl func_ov007_0215b880
    mov r4, r0
    ldr r1, .L_0215afc4
    ldr r2, .L_0215afc8
    ldr r3, .L_0215afcc
    mov r0, #0xbc
    bl func_0201a21c
    movs r5, r0
    beq .L_0215a434
    ldr r1, .L_0215afd0
    mov r2, #0x0
    blx func_ov012_021af358
    mov r5, r0
.L_0215a434:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0215a450
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215a450:
    ldr r3, [r5, #0x18]
    mov r0, #0x10
    ldr r1, [r3, #0x4]
    mov r2, r4
    str r0, [r1, #0x94]
    str r0, [r1, #0x98]
    ldr r5, [r3, #0x4]
    mov r6, #0xb
    mov r0, #0x1
    mov r1, #0x0
    str r6, [r5, #0x9c]
    blx func_ov012_021b3b7c
    ldr r2, .L_0215afd4
    mov r3, #0x1
    ldr r1, .L_0215afd8
    mov r0, r4
    str r3, [r2, #0x0]
    bl func_ov007_0214f898
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_0215a4b8
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_0215a4b8:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0215a4d4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215a4d4:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x11
    mov r2, #0x4
    mov r3, #0x5
    bl func_0206ad90
    mov r2, r0
    str r0, [r10, #0x64]
    mov r1, #0x0
    strh r1, [r2, #0x18]
    ldr r0, .L_0215afdc
    mov r1, #0x1
    strh r0, [r2, #0x16]
    mov r0, #0x1e
    strb r0, [r2, #0x1a]
    strb r1, [r2, #0x1c]
    mov r0, r4
    strb r1, [r2, #0x1b]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, .L_0215afe0
    ldr r1, .L_0215afe4
    mov r2, #0x0
    bl func_ov007_0215b880
    mov r4, r0
    ldr r1, [r4, #0x4]
    mov r0, #0x10
    strh r0, [r1, #0xbc]
    mov r0, #0x3
    strh r0, [r1, #0xbe]
    mov r1, #0x0
    mov r0, #0x2
    mov r2, r4
    mov r3, r1
    blx func_ov012_021b3b7c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r10, #0x0]
    bl func_ov007_02150b44
    str r0, [r10, #0x2c]
    bl func_0203b404
    ldr r3, [r0, #0x88]
    ldr r0, [r10, #0x0]
    mov r1, #0x8e0000
    mov r2, #0x0
    bl func_ov007_02150b7c
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    ldr r0, [r10, #0x0]
    bl func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215afe8
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    str r4, [r10, #0x3c]
    ldr r1, [r10, #0x2c]
    mov r0, r10
    bl func_ov007_0215145c
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r2, .L_0215afec
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    str r2, [r0, #0x124]
    str r5, [r10, #0x30]
    ldr r0, [r5, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b7744
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_0215aff0
    add r0, sp, #0x60
    mov r1, r5
    bl func_ov007_0214f2a4
    ldr r2, .L_0215aff4
    add r0, sp, #0x58
    mov r1, r5
    bl func_ov007_0214f2a4
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0xc0000
    str r0, [sp, #0x50]
    mov r0, #0x0
    str r0, [sp, #0x54]
    mov r0, r5
    add r1, sp, #0x54
    add r2, sp, #0x50
    bl func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    bl func_02023c60
    mov r3, #0x0
    add r1, sp, #0x4c
    add r2, sp, #0x48
    mov r0, r5
    str r3, [sp, #0x48]
    str r3, [sp, #0x4c]
    bl func_ov007_0214f218
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x18
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x60]
    ldr r2, .L_0215aff8
    ldr r3, [sp, #0x64]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    bl func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x40]
    str r0, [sp, #0x44]
    mov r0, r5
    add r1, sp, #0x44
    add r2, sp, #0x40
    bl func_ov007_0214f218
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    ldr r2, .L_0215affc
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r5, #0x4]
    ldr r2, .L_0215b000
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r1, .L_0215afd4
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov007_0214f2f4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, #0x3
    ldr r0, [r4, #0x4]
    str r1, [r0, #0x124]
    str r4, [r10, #0x40]
    ldr r6, [r10, #0x18]
    cmp r6, #0x0
    beq .L_0215a874
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    mov r1, r6
    bl func_ov007_0214f48c
.L_0215a874:
    ldr r4, .L_0215afd4
    mov r0, #0x190
    ldr r1, .L_0215b004
    ldr r2, .L_0215b008
    sub r3, r0, #0x37
    ldr r6, [r4, #0x0]
    ldr r4, [r5, #0x4]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215a8ac
    ldr r3, .L_0215b00c
    mov r1, r4
    mov r2, r6
    blx func_ov012_021ae114
.L_0215a8ac:
    bl func_ov007_0214f340
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0xef0000
    str r1, [r0, #0x124]
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r1, [r8, #0x4]
    mov r0, #0xa8
    str r0, [r1, #0x170]
    mov r0, #0x10
    str r0, [r1, #0x174]
    ldr r0, [r8, #0x4]
    mov r1, #0x6
    str r1, [r0, #0x180]
    ldr r1, [r10, #0x40]
    mov r0, r8
    bl func_ov007_02152468
    mov r0, #0x48000
    str r0, [sp, #0x30]
    mov r0, #0x20000
    str r0, [sp, #0x2c]
    mov r0, r8
    add r1, sp, #0x2c
    add r2, sp, #0x30
    bl func_ov007_0214f218
    mov r0, r8
    mov r1, #0x0
    bl func_ov007_021524a0
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0x114]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1a8]
    blx r2
    ldr r0, [r8, #0x4]
    bl func_02023940
    ldr r2, .L_0215aff4
    add r0, sp, #0x4
    mov r1, r8
    bl func_ov007_0214f2a4
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r1, .L_0215b010
    bl func_02028384
    mov r2, #0x84000
    add r1, sp, #0x34
    mov r0, r8
    str r2, [sp, #0x34]
    bl func_ov007_0214ed20
    ldr r0, [r8, #0x4]
    ldr r2, .L_0215b014
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r8, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r8, #0x4]
    mov r2, #0x1
    str r2, [r0, #0x13c]
    str r8, [r10, #0x44]
    ldr r0, [r10, #0x74]
    ldr r1, .L_0215af9c
    ldr r0, [r0, #0x4]
    ldr r2, .L_0215b018
    str r0, [r10, #0x54]
    add r0, r0, #0x6
    str r0, [r10, #0x58]
    mov r3, #0x3dc
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r10, #0x48]
    ldr r0, [r10, #0x58]
    ldr r1, .L_0215af9c
    ldr r2, .L_0215b018
    ldr r3, .L_0215b01c
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r10, #0x4c]
    ldr r0, [r10, #0x58]
    ldr r1, .L_0215af9c
    ldr r2, .L_0215b018
    ldr r3, .L_0215b020
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r10, #0x50]
    ldr r0, .L_0215afd4
    mov r1, #0x2
    mov r9, #0x0
    str r1, [r0, #0x0]
    ldr r11, .L_0215b024
    ldr r4, .L_0215afb0
    b .L_0215ae68
.L_0215aa94:
    ldr r0, [r8, #0x4]
    blx func_ov012_021ae3a4
    bl func_ov007_0214f340
    ldr r2, [r10, #0x48]
    mov r7, r0
    mov r1, #0x0
    str r7, [r2, r9, lsl #0x2]
    bl func_ov007_021524a0
    ldr r0, [r7, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r7, #0x4]
    add r2, r9, #0x800
    str r2, [r1, #0x124]
    ldr r1, .L_0215afd4
    mov r0, r7
    ldr r1, [r1, #0x0]
    bl func_ov007_0214f2f4
    mov r6, r0
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r11, #0x0]
    ldr r0, [r0, #0x88]
    sub r3, r1, #0x1
    ldr r1, .L_0215b028
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r1, .L_0215b02c
    str r3, [r11, #0x0]
    str r2, [r1, r3, lsl #0x2]
    ldr r1, .L_0215b028
    str r0, [r1, #0x0]
    ldr r0, [r10, #0x28]
    ldr r0, [r0, #0x4]
    bl func_02032a4c
    bl func_ov007_0214f340
    mov r5, r0
    ldr r3, [r5, #0x4]
    ldr r2, .L_0215b030
    add r1, sp, #0x38
    str r2, [r3, #0x54]
    mov r2, #0xc4000
    str r2, [sp, #0x38]
    bl func_ov007_0214f27c
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r5
    mov r1, r6
    bl func_ov007_02152468
    mov r1, r5
    mov r0, r6
    bl func_ov007_0214f48c
    mov r0, #0xc4000
    str r0, [sp, #0x3c]
    mov r0, r6
    add r1, sp, #0x3c
    bl func_ov007_0214f27c
    ldr r2, [r11, #0x0]
    mov r1, r10
    add r0, r2, #0x1
    str r0, [r11, #0x0]
    ldr r0, .L_0215b02c
    ldr r2, [r0, r2, lsl #0x2]
    ldr r0, .L_0215b028
    str r2, [r0, #0x0]
    ldr r0, [r10, #0x4c]
    str r6, [r0, r9, lsl #0x2]
    ldr r0, [r6, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    str r9, [r0, #0x124]
    ldr r0, [r6, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    strb r0, [r1, #0xac]
    ldr r0, [r6, #0x4]
    bl func_02023940
    ldr r2, .L_0215aff4
    add r0, sp, #0xc
    mov r1, r6
    bl func_ov007_0214f2a4
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    ldr r0, [r6, #0x4]
    ldr r2, .L_0215b014
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r6, #0x4]
    mov r2, #0x7
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x1c]
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x20]
    str r0, [sp, #0x18]
    ldr r2, .L_0215b034
    mov r0, #0x0
    add r1, sp, #0x14
    bl func_ov007_0214f3bc
    mov r1, r0
    mov r0, r6
    bl func_02020e98
    add r0, sp, #0x14
    bl func_ov007_0214f474
    mov r5, r0
    add r0, sp, #0x14
    bl func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r6, #0x4]
    mov r2, r5
    blx func_ov012_021b5900
    ldr r2, [r6, #0x4]
    ldr r1, .L_0215b038
    mov r0, r7
    str r1, [r2, #0xec]
    ldr r1, .L_0215afd4
    ldr r1, [r1, #0x0]
    bl func_ov007_0214f2f4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    ldr r2, [r5, #0x4]
    mov r0, #0x0
    strb r0, [r2, #0xac]
    ldr r0, [r10, #0x50]
    mov r1, r10
    str r5, [r0, r9, lsl #0x2]
    ldr r0, [r5, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    orr r2, r9, #0x2000
    str r2, [r0, #0x124]
    ldr r0, [r5, #0x4]
    ldr r2, .L_0215b014
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r5, #0x4]
    mov r2, #0x7
    mov r1, r0
    blx func_ov012_021b4104
    ldr r1, [r4, #0x24]
    mov r0, #0x0
    str r1, [sp, #0x1c]
    ldr r2, [r4, #0x28]
    add r1, sp, #0x1c
    str r2, [sp, #0x20]
    ldr r2, .L_0215b034
    bl func_ov007_0214f3bc
    mov r1, r0
    mov r0, r5
    bl func_02020e98
    add r0, sp, #0x1c
    bl func_ov007_0214f474
    mov r6, r0
    add r0, sp, #0x1c
    bl func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r5, #0x4]
    mov r2, r6
    blx func_ov012_021b5900
    ldr r1, [r5, #0x4]
    ldr r0, .L_0215b038
    str r0, [r1, #0xec]
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r2, .L_0215aff4
    add r0, sp, #0x24
    mov r1, r5
    bl func_ov007_0214f2a4
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x24]
    ldr r3, [sp, #0x28]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    add r9, r9, #0x1
.L_0215ae68:
    ldr r0, [r10, #0x58]
    cmp r9, r0
    blt .L_0215aa94
    ldr r1, [r10, #0x74]
    mov r2, #0x0
    mov r0, r10
    str r2, [r1, #0xc]
    blx func_ov007_0215bcac
    cmp r0, #0x0
    beq .L_0215aea0
    mov r0, r10
    blx func_ov007_0215bcd4
    mov r0, r10
    blx func_ov007_0215bd4c
.L_0215aea0:
    ldr r0, [r10, #0x4]
    bl func_ov007_02150dbc
    mov r2, #0x1
    sub r3, r2, #0x2
    mov r0, #0xa
    mov r1, #0x0
    blx func_ov012_021bcf1c
    mov r1, #0x62
    mov r2, #0x0
    str r0, [r10, #0x60]
    blx func_ov012_021bd730
    mov r1, #0x1
    mov r2, r1
    mov r0, #0x0
    bl func_ov012_021ba49c
    ldr r1, .L_0215b03c
    str r0, [r10, #0x68]
    ldr r0, [r1, #0x0]
    blx r0
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x5
    bl func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    bl func_0207361c
    bl func_02026f94
    str r0, [r10, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x8]
    ldr r1, .L_0215b040
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x80000
    str r0, [sp, #0x68]
    ldr r0, [r10, #0x8]
    add r1, sp, #0x68
    bl func_ov007_0214ed20
    blx func_ov012_021b65bc
    ldr r0, [r10, #0x30]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r10, #0x3c]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, .L_0215b044
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    strb r1, [r0, #0x430]
    ldr r0, [r10, #0x4]
    add sp, sp, #0x6c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215af9c: .word data_ov007_0216a354
.L_0215afa0: .word data_ov007_0216a2d8
.L_0215afa4: .word data_02093c04
.L_0215afa8: .word data_020a0e80
.L_0215afac: .word data_020a16c0
.L_0215afb0: .word data_ov007_0216a1ec
.L_0215afb4: .word data_ov007_0216a1f8
.L_0215afb8: .word func_ov007_0215b8f0
.L_0215afbc: .word func_ov007_0215b970
.L_0215afc0: .word func_ov007_0215b96c
.L_0215afc4: .word data_ov007_021699c4
.L_0215afc8: .word data_ov007_0216a2a4
.L_0215afcc: .word 0x212
.L_0215afd0: .word func_ov007_0215b6e0
.L_0215afd4: .word data_ov012_021d5154
.L_0215afd8: .word 0x31305053
.L_0215afdc: .word 0x8df
.L_0215afe0: .word func_ov007_0215baf0
.L_0215afe4: .word func_ov007_0215bb4c
.L_0215afe8: .word func_ov007_0215b688
.L_0215afec: .word 0x101
.L_0215aff0: .word data_ov007_0216a370
.L_0215aff4: .word data_ov007_0216a37c
.L_0215aff8: .word 0x494c
.L_0215affc: .word func_ov007_0215b3d8
.L_0215b000: .word func_ov007_0215b454
.L_0215b004: .word data_ov007_021699e4
.L_0215b008: .word data_ov007_0216a294
.L_0215b00c: .word func_ov007_02152408
.L_0215b010: .word func_ov007_0215be88
.L_0215b014: .word func_ov007_0215b11c
.L_0215b018: .word data_ov007_0216a32c
.L_0215b01c: .word 0x3dd
.L_0215b020: .word 0x3de
.L_0215b024: .word data_02093c08
.L_0215b028: .word data_020a0dd0
.L_0215b02c: .word data_020a16d0
.L_0215b030: .word 0x67625053
.L_0215b034: .word data_02093c8c
.L_0215b038: .word func_ov007_0215b294
.L_0215b03c: .word data_020a0e18
.L_0215b040: .word func_ov007_0215b048
.L_0215b044: .word data_020a0f64
    arm_func_end func_ov007_0215a2bc

    .global func_ov007_0215b048
    thumb_func_start func_ov007_0215b048
func_ov007_0215b048: ; 0x0215b048
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_0215b05e
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_020282f4
.L_0215b05e:
    pop {r4, pc}
    thumb_func_end func_ov007_0215b048

    .global func_ov007_0215b060
    thumb_func_start func_ov007_0215b060
func_ov007_0215b060: ; 0x0215b060
    push {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0x72
    strb r1, [r0, #0x0]
    mov r0, r4
    add r0, #0x73
    strb r1, [r0, #0x0]
    blx func_ov007_02158e84
    blx func_ov007_0214dd50
    mov r1, #0x1
    blx func_ov007_0214dd60
    mov r0, r4
    blx func_ov007_0215b478
    pop {r4, pc}
    thumb_func_end func_ov007_0215b060

    .byte 0x00, 0x00

    .global func_ov007_0215b08c
    thumb_func_start func_ov007_0215b08c
func_ov007_0215b08c: ; 0x0215b08c
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r2, #0x49
    lsl r2, r2, #0x2
    ldr r4, [r0, #0x10]
    ldr r1, [r0, r2]
    ldr r0, .L_0215b10c
    cmp r1, r0
    bne .L_0215b0b0
    ldr r0, [r4, #0x44]
    add r2, #0x74
    ldr r0, [r0, #0x4]
    ldr r1, [r4, #0x5c]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, r2]
    blx r3
    b .L_0215b0da
.L_0215b0b0:
    mov r0, #0xf
    lsl r0, r0, #0xc
    tst r0, r1
    beq .L_0215b0da
    ldr r0, [r4, #0x44]
    ldr r3, .L_0215b110
    ldr r0, [r0, #0x4]
    and r1, r3
    ldr r3, [r0, #0x0]
    add r2, #0x74
    ldr r3, [r3, r2]
    blx r3
    mov r0, #0x49
    ldr r1, [r5, #0x4]
    lsl r0, r0, #0x2
    ldr r1, [r1, r0]
    mov r0, #0x3
    lsl r0, r0, #0xc
    tst r0, r1
    beq .L_0215b0da
    str r1, [r4, #0x6c]
.L_0215b0da:
    ldr r0, [r5, #0x4]
    mov r1, #0x4a
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    blx r2
    mov r1, #0x3
    and r0, r1
    cmp r0, #0x3
    bne .L_0215b10a
    ldr r0, [r5, #0x4]
    add r0, #0xa8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0215b10a
    ldr r0, .L_0215b114
    ldr r2, [r0, #0x0]
    ldr r0, .L_0215b118
    ldr r0, [r0, #0x0]
    cmp r2, r0
    bhi .L_0215b10a
    mov r0, #0x78
    blx func_0207342c
.L_0215b10a:
    pop {r3, r4, r5, pc}
.L_0215b10c: .word 0x4ff0
.L_0215b110: .word 0xffff0fff
.L_0215b114: .word data_ov012_021d5160
.L_0215b118: .word data_02093c24
    thumb_func_end func_ov007_0215b08c

    .global func_ov007_0215b11c
    thumb_func_start func_ov007_0215b11c
func_ov007_0215b11c: ; 0x0215b11c
    push {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215b288
    cmp r0, r1
    beq .L_0215b142
    add r1, r1, #0x1
    cmp r0, r1
    beq .L_0215b138
    b .L_0215b286
.L_0215b138:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    pop {r4, r5, r6, pc}
.L_0215b142:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    bne .L_0215b152
    b .L_0215b264
.L_0215b152:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0x71
    strb r1, [r0, #0x0]
    bl func_ov012_021b65bc
    mov r0, #0x49
    mov r6, #0x0
    ldr r1, [r5, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r1, .L_0215b28c
    mvn r6, r6
    cmp r0, r1
    bne .L_0215b178
    ldr r6, [r4, #0x5c]
    b .L_0215b186
.L_0215b178:
    mov r1, #0xf
    lsl r1, r1, #0xc
    tst r1, r0
    beq .L_0215b186
    ldr r1, .L_0215b290
    mov r6, r0
    and r6, r1
.L_0215b186:
    cmp r6, #0x0
    blt .L_0215b258
    ldr r0, [r4, #0x44]
    mov r1, #0x65
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    cmp r6, r0
    beq .L_0215b1a4
    mov r0, r5
    bl func_ov007_0215b08c
    b .L_0215b258
.L_0215b1a4:
    ldr r1, [r5, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r2, [r1, r0]
    ldr r4, [r1, #0x10]
    mov r1, #0x2
    lsl r1, r1, #0xe
    mov r3, r2
    tst r3, r1
    beq .L_0215b1cc
    mov r0, #0x78
    mov r1, #0x2
    blx func_0207342c
    mov r0, #0x0
    add r4, #0x71
    strb r0, [r4, #0x0]
    bl func_ov012_021b65cc
    pop {r4, r5, r6, pc}
.L_0215b1cc:
    ldr r3, .L_0215b28c
    cmp r2, r3
    bne .L_0215b1de
    blx func_ov007_0214dd50
    mov r1, #0x3
    blx func_ov007_0214dd60
    b .L_0215b248
.L_0215b1de:
    ldr r3, .L_0215b290
    and r3, r2
    mov r2, r4
    add r2, #0x80
    str r3, [r2, #0x0]
    ldr r2, [r5, #0x4]
    ldr r2, [r2, r0]
    lsr r0, r1, #0x2
    tst r0, r2
    beq .L_0215b226
    mov r0, r4
    mov r1, #0x1
    add r0, #0x71
    strb r1, [r0, #0x0]
    bl func_ov012_021b65bc
    mov r0, r4
    add r0, #0x80
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    blx func_ov007_02159700
    blx func_ov007_0214dd50
    mov r1, #0x3
    blx func_ov007_0214dd6c
    mov r0, r4
    mov r1, #0x1
    add r0, #0x72
    strb r1, [r0, #0x0]
    mov r0, r4
    mov r1, #0x0
    add r0, #0x73
    strb r1, [r0, #0x0]
    b .L_0215b248
.L_0215b226:
    mov r0, r4
    mov r1, #0x1
    add r0, #0x71
    strb r1, [r0, #0x0]
    bl func_ov012_021b65bc
    mov r0, r4
    add r0, #0x80
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    blx func_ov007_02159700
    blx func_ov007_0214dd50
    mov r1, #0x4
    blx func_ov007_0214dd60
.L_0215b248:
    mov r0, #0x78
    mov r1, #0x0
    blx func_0207342c
    mov r0, r4
    blx func_ov007_0215b478
    pop {r4, r5, r6, pc}
.L_0215b258:
    mov r0, #0x0
    add r4, #0x71
    strb r0, [r4, #0x0]
    bl func_ov012_021b65cc
    pop {r4, r5, r6, pc}
.L_0215b264:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x3
    tst r0, r1
    beq .L_0215b286
    ldr r0, [r5, #0x4]
    add r0, #0x90
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    and r0, r1
    cmp r0, #0x1
    bne .L_0215b286
    mov r0, r5
    bl func_ov007_0215b08c
.L_0215b286:
    pop {r4, r5, r6, pc}
.L_0215b288: .word 0x80011000
.L_0215b28c: .word 0x4ff0
.L_0215b290: .word 0xffff0fff
    thumb_func_end func_ov007_0215b11c

    .global func_ov007_0215b294
    thumb_func_start func_ov007_0215b294
func_ov007_0215b294: ; 0x0215b294
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    ldr r2, [r0, #0x4]
    mov r1, #0x49
    lsl r1, r1, #0x2
    ldr r3, [r2, r1]
    mov r1, #0xf
    ldr r4, [r2, #0x10]
    lsl r1, r1, #0xc
    mov r2, r3
    and r2, r1
    ldr r1, .L_0215b3d0
    ldr r7, .L_0215b3d4
    and r1, r3
    cmp r3, r7
    bne .L_0215b302
    mov r1, #0x1
    mov r2, r6
    tst r2, r1
    beq .L_0215b2e6
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    bgt .L_0215b2c6
    b .L_0215b3ce
.L_0215b2c6:
    ldr r2, [r4, #0x6c]
    lsl r1, r1, #0xd
    tst r1, r2
    beq .L_0215b2da
    subs r0, r0, #0x1
    ldr r1, [r4, #0x50]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b2da:
    subs r0, r0, #0x1
    ldr r1, [r4, #0x4c]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b2e6:
    mov r1, #0x2
    tst r1, r6
    beq .L_0215b3ce
    ldr r2, [r4, #0x5c]
    cmp r2, #0x5
    bge .L_0215b2fe
    add r0, r2, #0x1
    ldr r1, [r4, #0x4c]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b2fe:
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b302:
    mov r7, #0x2
    lsl r7, r7, #0xe
    cmp r2, r7
    bne .L_0215b336
    mov r2, #0x1
    tst r2, r6
    beq .L_0215b31c
    subs r0, r1, #0x1
    ldr r2, [r4, #0x4c]
    lsl r0, r0, #0x2
    ldr r0, [r2, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b31c:
    mov r2, #0x2
    tst r2, r6
    beq .L_0215b3ce
    cmp r1, #0x5
    bhs .L_0215b332
    add r0, r1, #0x1
    ldr r2, [r4, #0x4c]
    lsl r0, r0, #0x2
    ldr r0, [r2, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b332:
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b336:
    lsr r3, r7, #0x3
    tst r3, r2
    beq .L_0215b378
    mov r2, #0x4
    tst r2, r6
    beq .L_0215b34c
    ldr r2, [r4, #0x50]
    lsl r0, r1, #0x2
    ldr r0, [r2, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b34c:
    mov r2, #0x1
    tst r2, r6
    beq .L_0215b366
    cmp r1, #0x0
    beq .L_0215b362
    subs r0, r1, #0x1
    ldr r2, [r4, #0x4c]
    lsl r0, r0, #0x2
    ldr r0, [r2, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b362:
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b366:
    mov r0, #0x2
    tst r0, r6
    beq .L_0215b3ce
    add r0, r1, #0x1
    ldr r2, [r4, #0x4c]
    lsl r0, r0, #0x2
    ldr r0, [r2, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b378:
    lsr r3, r7, #0x2
    tst r2, r3
    beq .L_0215b3ce
    mov r2, #0x8
    tst r2, r6
    beq .L_0215b38e
    ldr r2, [r4, #0x4c]
    lsl r0, r1, #0x2
    ldr r0, [r2, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b38e:
    mov r2, #0x1
    tst r2, r6
    beq .L_0215b3a8
    cmp r1, #0x0
    beq .L_0215b3a4
    subs r0, r1, #0x1
    ldr r2, [r4, #0x50]
    lsl r0, r0, #0x2
    ldr r0, [r2, r0]
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b3a4:
    str r0, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b3a8:
    mov r0, #0x2
    tst r0, r6
    beq .L_0215b3ce
    add r0, r1, #0x1
    ldr r1, [r4, #0x4c]
    lsl r0, r0, #0x2
    ldr r3, [r1, r0]
    mov r1, #0x49
    ldr r2, [r3, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    ldr r1, .L_0215b3d4
    cmp r2, r1
    bne .L_0215b3c8
    str r3, [r5, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b3c8:
    ldr r1, [r4, #0x50]
    ldr r0, [r1, r0]
    str r0, [r5, #0x0]
.L_0215b3ce:
    pop {r3, r4, r5, r6, r7, pc}
.L_0215b3d0: .word 0xffff0fff
.L_0215b3d4: .word 0x4ff0
    thumb_func_end func_ov007_0215b294

    .global func_ov007_0215b3d8
    thumb_func_start func_ov007_0215b3d8
func_ov007_0215b3d8: ; 0x0215b3d8
    push {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, #0x0
    ldr r6, [r0, #0x10]
    mov r7, #0x1
    b .L_0215b41a
.L_0215b3e6:
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xa8
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x0
    beq .L_0215b406
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    add r2, #0xc0
    ldr r2, [r2, #0x0]
    blx r2
    blx func_ov007_0214f340
    b .L_0215b408
.L_0215b406:
    mov r0, r5
.L_0215b408:
    cmp r4, #0x0
    beq .L_0215b418
    ldr r0, [r0, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215b418:
    add r4, r4, #0x1
.L_0215b41a:
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xac
    ldr r1, [r1, #0x0]
    blx r1
    cmp r4, r0
    blo .L_0215b3e6
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    beq .L_0215b452
    ldr r0, [r0, #0x4]
    mov r2, #0x66
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x0
    blx r3
    ldr r0, [r6, #0x44]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r6, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
.L_0215b452:
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_0215b3d8

    .global func_ov007_0215b454
    thumb_func_start func_ov007_0215b454
func_ov007_0215b454: ; 0x0215b454
    push {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x10]
    mov r0, r2
    add r0, #0x70
    strb r1, [r0, #0x0]
    ldr r0, [r2, #0x3c]
    mov r2, #0x53
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    mov r1, #0x8
    ldr r3, [r3, r2]
    blx r3
    bl func_ov012_021b65cc
    pop {r3, pc}
    thumb_func_end func_ov007_0215b454

    .global func_ov007_0215b478
    arm_func_start func_ov007_0215b478
func_ov007_0215b478: ; 0x0215b478
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r0, #0x1
    strb r0, [r4, #0x71]
    blx func_ov012_021b65bc
    ldr r0, .L_0215b670
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215b670
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215b670
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215b670
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215b670
    b .L_0215b4d8
.L_0215b4d0:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215b4d8:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215b4d0
    ldrsb r0, [r4, #0x72]
    cmp r0, #0x0
    beq .L_0215b514
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bl func_ov007_02158d24
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x0
    beq .L_0215b514
    bl func_02086c24
.L_0215b514:
    bl func_020735e4
    ldr r0, .L_0215b674
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    strb r1, [r0, #0x430]
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r1, .L_0215b678
    mov r2, #0x0
    mov r0, #0x1
    str r2, [r1, #0x0]
    blx func_ov012_021b526c
    mov r0, #0x2
    blx func_ov012_021b526c
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_0215b55c
    bl func_ov012_021bab64
.L_0215b55c:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_0215b56c
    blx func_ov012_021bd500
.L_0215b56c:
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq .L_0215b57c
    bl func_0206ae98
.L_0215b57c:
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq .L_0215b58c
    bl func_0201b268
.L_0215b58c:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_0215b59c
    bl func_0201b268
.L_0215b59c:
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_0215b5ac
    bl func_0201b268
.L_0215b5ac:
    bl func_ov007_02150f1c
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_0215b5c0
    bl func_02034d7c
.L_0215b5c0:
    mov r5, #0x0
.L_0215b5c4:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0215b5e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215b5e0:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215b5c4
    ldr r0, [r4, #0x7c]
    cmp r0, #0x0
    beq .L_0215b5fc
    bl func_ov007_02159ac0
.L_0215b5fc:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215b614
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b614:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0215b62c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b62c:
    blx func_ov012_021b65cc
    ldr r1, .L_0215b67c
    ldr r2, .L_0215b680
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215b684
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215b670: .word data_020a0e18
.L_0215b674: .word data_020a0f64
.L_0215b678: .word data_ov012_021d5154
.L_0215b67c: .word data_02093c04
.L_0215b680: .word data_020a16c0
.L_0215b684: .word data_020a0e80
    arm_func_end func_ov007_0215b478

    .global func_ov007_0215b688
    thumb_func_start func_ov007_0215b688
func_ov007_0215b688: ; 0x0215b688
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215b6d8
    cmp r0, r1
    bne .L_0215b6d4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0215b6d4
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    mov r0, r4
    mov r1, #0x1
    add r0, #0x71
    strb r1, [r0, #0x0]
    bl func_ov012_021b65bc
    ldr r0, [r4, #0x8]
    ldr r1, .L_0215b6dc
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028330
.L_0215b6d4:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215b6d8: .word 0x80011001
.L_0215b6dc: .word func_ov007_0215b060
    thumb_func_end func_ov007_0215b688

    .global func_ov007_0215b6e0
    thumb_func_start func_ov007_0215b6e0
func_ov007_0215b6e0: ; 0x0215b6e0
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r0, [r5, #0x4]
    add r0, #0xac
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    tst r0, r1
    beq .L_0215b6f4
    b .L_0215b806
.L_0215b6f4:
    mov r0, #0x60
    str r0, [sp, #0x0]
    add r0, sp, #0x20
    mov r1, #0xab
    mov r2, #0x0
    mov r3, #0xbb
    blx func_ov007_021502ec
    ldr r2, .L_0215b80c
    mov r0, #0x0
    add r1, sp, #0x20
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r5
    blx func_02020e98
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x5
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0xb
    lsl r1, r1, #0xc
    str r1, [sp, #0x18]
    mov r1, #0xb3
    lsl r1, r1, #0xc
    str r1, [sp, #0x1c]
    mov r4, r0
    add r1, sp, #0x1c
    add r2, sp, #0x18
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x9
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0x55
    lsl r1, r1, #0xc
    str r1, [sp, #0x10]
    mov r1, #0xb3
    lsl r1, r1, #0xc
    str r1, [sp, #0x14]
    mov r4, r0
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    ldr r1, [r5, #0x4]
    mov r6, #0x1
    mov r0, r1
    add r0, #0xac
    ldr r0, [r0, #0x0]
    and r0, r6
    cmp r0, #0x1
    beq .L_0215b7a4
    mov r6, #0x0
.L_0215b7a4:
    add r1, #0x94
    ldr r7, [r1, #0x0]
    ldr r1, .L_0215b810
    ldr r2, .L_0215b814
    ldr r3, .L_0215b818
    mov r0, #0xb4
    blx func_0201a21c
    mov r4, r0
    beq .L_0215b7cc
    ldr r1, .L_0215b81c
    mov r2, r7
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r1, [r5, #0x4]
    mov r3, r6
    bl func_ov012_021af494
    mov r4, r0
.L_0215b7cc:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215b7da
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215b7da:
    ldr r4, [r4, #0x18]
    mov r0, #0x20
    str r0, [sp, #0x0]
    add r0, sp, #0x8
    mov r1, #0xab
    mov r2, #0x0
    mov r3, #0xbb
    blx func_ov007_021502ec
    ldr r2, .L_0215b80c
    mov r0, #0x0
    add r1, sp, #0x8
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, [r5, #0x4]
    ldr r1, [r4, #0x4]
    bl func_ov012_021b8efc
.L_0215b806:
    add sp, #0x28
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215b80c: .word data_02093c8c
.L_0215b810: .word data_ov007_021699b4
.L_0215b814: .word data_ov007_0216a29c
.L_0215b818: .word 0x226
.L_0215b81c: .word func_ov007_0215b820
    thumb_func_end func_ov007_0215b6e0

    .global func_ov007_0215b820
    thumb_func_start func_ov007_0215b820
func_ov007_0215b820: ; 0x0215b820
    push {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xac
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x1
    bne .L_0215b872
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x7
    mov r3, #0x60
    blx func_ov007_021510f0
    mov r1, #0x1
    lsl r1, r1, #0x10
    str r1, [sp, #0x0]
    mov r1, #0xb3
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    mov r4, r0
    add r1, sp, #0x4
    add r2, sp, #0x0
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
.L_0215b872:
    ldr r0, [r5, #0x4]
    mov r1, #0x20
    add r0, #0x98
    str r1, [r0, #0x0]
    add sp, #0x8
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_0215b820

    .byte 0x00, 0x00

    .global func_ov007_0215b880
    arm_func_start func_ov007_0215b880
func_ov007_0215b880: ; 0x0215b880
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_0215b8e4
    ldr r2, .L_0215b8e8
    ldr r3, .L_0215b8ec
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_0215b8c0
    mov r1, r7
    mov r2, r6
    mov r3, r5
    blx func_ov012_021af26c
    mov r4, r0
.L_0215b8c0:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215b8dc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215b8dc:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215b8e4: .word data_ov007_02169644
.L_0215b8e8: .word data_ov007_0216a28c
.L_0215b8ec: .word 0x1de
    arm_func_end func_ov007_0215b880

    .global func_ov007_0215b8f0
    thumb_func_start func_ov007_0215b8f0
func_ov007_0215b8f0: ; 0x0215b8f0
    push {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x4
    mov r3, #0x7f
    blx func_ov007_021510f0
    mov r1, #0x2
    lsl r1, r1, #0xe
    str r1, [sp, #0x8]
    mov r1, #0x15
    lsl r1, r1, #0xe
    str r1, [sp, #0xc]
    mov r4, r0
    add r1, sp, #0xc
    add r2, sp, #0x8
    blx func_ov007_0214f218
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    mov r0, #0x7f
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r5
    add r1, sp, #0x4
    blx func_ov007_0214f27c
    ldr r0, .L_0215b948
    add r1, sp, #0x0
    str r0, [sp, #0x0]
    mov r0, r5
    blx func_ov007_0215b94c
    add sp, #0x10
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215b948: .word 0xfff40000
    thumb_func_end func_ov007_0215b8f0

    .global func_ov007_0215b94c
    arm_func_start func_ov007_0215b94c
func_ov007_0215b94c: ; 0x0215b94c
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0215b968
    mov r1, #0x1
    str r2, [r0, #0x10]
    bx ip
.L_0215b968: .word func_ov007_0214f240
    arm_func_end func_ov007_0215b94c

    .global func_ov007_0215b96c
    thumb_func_start func_ov007_0215b96c
func_ov007_0215b96c: ; 0x0215b96c
    bx lr
    thumb_func_end func_ov007_0215b96c

    .byte 0x00, 0x00

    .global func_ov007_0215b970
    thumb_func_start func_ov007_0215b970
func_ov007_0215b970: ; 0x0215b970
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r7, r0
    ldr r5, [r7, #0x4]
    ldr r1, .L_0215bab4
    add r5, #0xa0
    blx func_ov007_0214f898
    mov r4, r0
    mov r0, r7
    blx func_ov007_0215bad0
    ldr r1, [r0, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r1, [r1, r0]
    mov r0, #0xef
    lsl r0, r0, #0x10
    cmp r1, r0
    bne .L_0215b9a6
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_0215baae
.L_0215b9a6:
    mov r0, r5
    blx func_ov007_0214f45c
    mov r6, r0
    ldr r0, .L_0215bab8
    blx func_ov007_0214f45c
    cmp r6, r0
    bne .L_0215b9f6
    mov r0, r5
    blx func_ov007_0214f474
    mov r6, r0
    ldr r0, .L_0215bab8
    blx func_ov007_0214f474
    cmp r6, r0
    bne .L_0215b9f6
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215babc
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x2
    lsl r0, r0, #0xe
    str r0, [sp, #0x18]
    mov r0, #0x15
    lsl r0, r0, #0xe
    str r0, [sp, #0x1c]
    mov r0, r4
    add r1, sp, #0x1c
    add r2, sp, #0x18
    blx func_ov007_0214f218
    b .L_0215ba94
.L_0215b9f6:
    mov r0, r5
    blx func_ov007_0214f45c
    mov r6, r0
    ldr r0, .L_0215bac0
    blx func_ov007_0214f45c
    cmp r6, r0
    bne .L_0215ba46
    mov r0, r5
    blx func_ov007_0214f474
    mov r6, r0
    ldr r0, .L_0215bac0
    blx func_ov007_0214f474
    cmp r6, r0
    bne .L_0215ba46
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215bac4
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x2
    lsl r0, r0, #0xe
    str r0, [sp, #0x10]
    mov r0, #0x42
    lsl r0, r0, #0xc
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    b .L_0215ba94
.L_0215ba46:
    mov r0, r5
    blx func_ov007_0214f45c
    mov r6, r0
    ldr r0, .L_0215bac8
    blx func_ov007_0214f45c
    cmp r6, r0
    bne .L_0215ba94
    mov r0, r5
    blx func_ov007_0214f474
    mov r6, r0
    ldr r0, .L_0215bac8
    blx func_ov007_0214f474
    cmp r6, r0
    bne .L_0215ba94
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215bacc
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x2
    lsl r0, r0, #0xe
    str r0, [sp, #0x8]
    mov r0, #0x95
    lsl r0, r0, #0xc
    str r0, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    add r2, sp, #0x8
    blx func_ov007_0214f218
.L_0215ba94:
    mov r0, #0x2
    ldrsh r0, [r5, r0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, #0x0
    ldrsh r0, [r5, r0]
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r7
    blx func_ov007_0214f218
.L_0215baae:
    add sp, #0x20
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215bab4: .word 0x31305053
.L_0215bab8: .word data_ov007_0216a208
.L_0215babc: .word 0x8e0004
.L_0215bac0: .word data_ov007_0216a200
.L_0215bac4: .word 0x8e0001
.L_0215bac8: .word data_ov007_0216a210
.L_0215bacc: .word 0x8e0003
    thumb_func_end func_ov007_0215b970

    .global func_ov007_0215bad0
    arm_func_start func_ov007_0215bad0
func_ov007_0215bad0: ; 0x0215bad0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x94]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov007_0214f340
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0215bad0

    .global func_ov007_0215baf0
    thumb_func_start func_ov007_0215baf0
func_ov007_0215baf0: ; 0x0215baf0
    push {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x8e
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x4
    mov r3, #0x7f
    blx func_ov007_021510f0
    mov r1, #0x2
    lsl r1, r1, #0xe
    str r1, [sp, #0x8]
    mov r1, #0x15
    lsl r1, r1, #0xe
    str r1, [sp, #0xc]
    mov r4, r0
    add r1, sp, #0xc
    add r2, sp, #0x8
    blx func_ov007_0214f218
    mov r0, r5
    mov r1, r4
    blx func_ov007_0214f48c
    mov r0, #0x7f
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r5
    add r1, sp, #0x4
    blx func_ov007_0214f27c
    ldr r0, .L_0215bb48
    add r1, sp, #0x0
    str r0, [sp, #0x0]
    mov r0, r5
    blx func_ov007_0215b94c
    add sp, #0x10
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215bb48: .word 0xfff40000
    thumb_func_end func_ov007_0215baf0

    .global func_ov007_0215bb4c
    thumb_func_start func_ov007_0215bb4c
func_ov007_0215bb4c: ; 0x0215bb4c
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r7, r0
    ldr r5, [r7, #0x4]
    ldr r1, .L_0215bc90
    add r5, #0xa0
    blx func_ov007_0214f898
    mov r4, r0
    mov r0, r7
    blx func_ov007_0215bad0
    ldr r1, [r0, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r1, [r1, r0]
    mov r0, #0xef
    lsl r0, r0, #0x10
    cmp r1, r0
    bne .L_0215bb82
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_0215bc8a
.L_0215bb82:
    mov r0, r5
    blx func_ov007_0214f45c
    mov r6, r0
    ldr r0, .L_0215bc94
    blx func_ov007_0214f45c
    cmp r6, r0
    bne .L_0215bbd2
    mov r0, r5
    blx func_ov007_0214f474
    mov r6, r0
    ldr r0, .L_0215bc94
    blx func_ov007_0214f474
    cmp r6, r0
    bne .L_0215bbd2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215bc98
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x2
    lsl r0, r0, #0xe
    str r0, [sp, #0x18]
    mov r0, #0x15
    lsl r0, r0, #0xe
    str r0, [sp, #0x1c]
    mov r0, r4
    add r1, sp, #0x1c
    add r2, sp, #0x18
    blx func_ov007_0214f218
    b .L_0215bc70
.L_0215bbd2:
    mov r0, r5
    blx func_ov007_0214f45c
    mov r6, r0
    ldr r0, .L_0215bc9c
    blx func_ov007_0214f45c
    cmp r6, r0
    bne .L_0215bc22
    mov r0, r5
    blx func_ov007_0214f474
    mov r6, r0
    ldr r0, .L_0215bc9c
    blx func_ov007_0214f474
    cmp r6, r0
    bne .L_0215bc22
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215bca0
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x2
    lsl r0, r0, #0xe
    str r0, [sp, #0x10]
    mov r0, #0x42
    lsl r0, r0, #0xc
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    b .L_0215bc70
.L_0215bc22:
    mov r0, r5
    blx func_ov007_0214f45c
    mov r6, r0
    ldr r0, .L_0215bca4
    blx func_ov007_0214f45c
    cmp r6, r0
    bne .L_0215bc70
    mov r0, r5
    blx func_ov007_0214f474
    mov r6, r0
    ldr r0, .L_0215bca4
    blx func_ov007_0214f474
    cmp r6, r0
    bne .L_0215bc70
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215bca8
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x2
    lsl r0, r0, #0xe
    str r0, [sp, #0x8]
    mov r0, #0x95
    lsl r0, r0, #0xc
    str r0, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    add r2, sp, #0x8
    blx func_ov007_0214f218
.L_0215bc70:
    mov r0, #0x2
    ldrsh r0, [r5, r0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, #0x0
    ldrsh r0, [r5, r0]
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r7
    blx func_ov007_0214f218
.L_0215bc8a:
    add sp, #0x20
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215bc90: .word 0x31305053
.L_0215bc94: .word data_ov007_0216a208
.L_0215bc98: .word 0x8e0004
.L_0215bc9c: .word data_ov007_0216a200
.L_0215bca0: .word 0x8e0001
.L_0215bca4: .word data_ov007_0216a210
.L_0215bca8: .word 0x8e0003
    thumb_func_end func_ov007_0215bb4c

    .global func_ov007_0215bcac
    thumb_func_start func_ov007_0215bcac
func_ov007_0215bcac: ; 0x0215bcac
    push {r3, lr}
    ldr r1, [r0, #0x74]
    ldr r2, [r1, #0xc]
    cmp r2, #0x0
    bge .L_0215bcc0
    ldr r1, [r0, #0x5c]
    bl func_ov007_0215bedc
    mov r0, #0x0
    pop {r3, pc}
.L_0215bcc0:
    mov r1, r0
    add r1, #0x84
    str r2, [r1, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x74]
    mvn r1, r1
    str r1, [r0, #0xc]
    mov r0, #0x1
    pop {r3, pc}
    thumb_func_end func_ov007_0215bcac

    .byte 0x00, 0x00

    .global func_ov007_0215bcd4
    thumb_func_start func_ov007_0215bcd4
func_ov007_0215bcd4: ; 0x0215bcd4
    push {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r1, r5
    add r1, #0x84
    ldr r1, [r1, #0x0]
    bl func_ov007_0215bedc
    mov r0, r5
    add r0, #0x84
    ldr r4, [r0, #0x0]
    mov r6, #0x1c
    b .L_0215bd04
.L_0215bcec:
    ldr r0, [r5, #0x74]
    ldr r1, [r0, #0x8]
    mov r0, r4
    mul r0, r6
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    beq .L_0215bd0a
    mov r0, r5
    mov r1, r4
    bl func_ov007_0215bfd0
    add r4, r4, #0x1
.L_0215bd04:
    ldr r0, [r5, #0x54]
    cmp r4, r0
    blt .L_0215bcec
.L_0215bd0a:
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r3, .L_0215bd48
    mov r0, r5
    mov r1, r4
    mov r2, #0x4
    bl func_ov007_0215bf08
    mov r7, #0x1
    str r4, [r5, #0x5c]
    add r4, r4, #0x1
    lsl r6, r7, #0xf
    b .L_0215bd40
.L_0215bd24:
    cmp r4, #0x6
    bge .L_0215bd2c
    mov r0, r7
    b .L_0215bd2e
.L_0215bd2c:
    mov r0, #0x0
.L_0215bd2e:
    mov r3, r4
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, r4
    mov r2, #0x5
    orr r3, r6
    bl func_ov007_0215bf08
    add r4, r4, #0x1
.L_0215bd40:
    ldr r0, [r5, #0x58]
    cmp r4, r0
    blt .L_0215bd24
    pop {r3, r4, r5, r6, r7, pc}
.L_0215bd48: .word 0x4ff0
    thumb_func_end func_ov007_0215bcd4

    .global func_ov007_0215bd4c
    thumb_func_start func_ov007_0215bd4c
func_ov007_0215bd4c: ; 0x0215bd4c
    push {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x44]
    mov r1, #0x67
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    cmp r0, #0x0
    beq .L_0215bd8a
    ldr r0, [r4, #0x44]
    mov r1, #0x67
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    ldr r1, [r4, #0x5c]
    add r0, r0, #0x6
    cmp r0, r1
    bls .L_0215bd8a
    ldr r0, [r4, #0x44]
    mov r3, #0x1a
    ldr r0, [r0, #0x4]
    lsl r3, r3, #0x4
    ldr r5, [r0, #0x0]
    subs r1, r1, #0x5
    ldr r5, [r5, r3]
    mov r2, #0x0
    blx r5
.L_0215bd8a:
    ldr r0, [r4, #0x44]
    mov r1, #0x65
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    ldr r1, [r4, #0x5c]
    cmp r0, r1
    ble .L_0215bdc2
    ldr r0, [r4, #0x44]
    mov r1, #0x65
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    cmp r0, #0x6
    blt .L_0215bdc2
    ldr r0, [r4, #0x44]
    mov r2, #0x66
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    ldr r1, [r4, #0x5c]
    ldr r3, [r3, r2]
    blx r3
    pop {r3, r4, r5, pc}
.L_0215bdc2:
    ldr r0, [r4, #0x44]
    mov r1, #0x65
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0x2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, r1]
    blx r2
    cmp r0, #0x0
    blt .L_0215be32
    ldr r1, [r4, #0x5c]
    cmp r0, r1
    bge .L_0215be32
    lsl r5, r0, #0x2
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    mov r0, #0x2
    ldr r1, [r4, #0x6c]
    lsl r0, r0, #0xc
    tst r0, r1
    beq .L_0215be18
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x50]
    mov r1, #0x1
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    pop {r3, r4, r5, pc}
.L_0215be18:
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    pop {r3, r4, r5, pc}
.L_0215be32:
    cmp r0, #0x0
    blt .L_0215be68
    lsl r5, r0, #0x2
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, r5]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
.L_0215be68:
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_0215bd4c

    .byte 0x00, 0x00

    .global func_ov007_0215be6c
    thumb_func_start func_ov007_0215be6c
func_ov007_0215be6c: ; 0x0215be6c
    push {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    bl func_ov007_0215bd4c
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215be84
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_0215be84: .word func_ov007_0215be88
    thumb_func_end func_ov007_0215be6c

    .global func_ov007_0215be88
    thumb_func_start func_ov007_0215be88
func_ov007_0215be88: ; 0x0215be88
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    mov r0, r4
    add r0, #0x71
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0215beb2
    mov r0, r4
    bl func_ov007_0215bcac
    cmp r0, #0x0
    beq .L_0215beb2
    mov r0, r4
    bl func_ov007_0215bcd4
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215bed8
    blx func_02028384
.L_0215beb2:
    ldr r4, [r5, #0x4]
    mov r1, #0x19
    mov r0, r4
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x4
    ldr r2, [r2, r1]
    blx r2
    mov r0, r4
    mov r1, #0x5e
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0x2
    ldr r2, [r2, r1]
    blx r2
    ldr r0, [r4, #0x64]
    mov r1, #0x1
    add r0, #0x40
    strb r1, [r0, #0x0]
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215bed8: .word func_ov007_0215be6c
    thumb_func_end func_ov007_0215be88

    .global func_ov007_0215bedc
    thumb_func_start func_ov007_0215bedc
func_ov007_0215bedc: ; 0x0215bedc
    push {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r6, r1
    mov r4, #0x0
    mov r7, #0x2
    b .L_0215bf02
.L_0215bee8:
    ldr r0, [r5, #0x74]
    ldr r1, [r0, #0x8]
    mov r0, #0x1c
    mul r0, r4
    add r0, r1, r0
    ldrsb r0, [r0, r7]
    cmp r0, #0x0
    beq .L_0215bf00
    mov r0, r5
    mov r1, r4
    bl func_ov007_0215bfd0
.L_0215bf00:
    add r4, r4, #0x1
.L_0215bf02:
    cmp r4, r6
    blt .L_0215bee8
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_0215bedc

    .global func_ov007_0215bf08
    thumb_func_start func_ov007_0215bf08
func_ov007_0215bf08: ; 0x0215bf08
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    mov r7, r1
    ldr r1, [r5, #0x48]
    lsl r0, r7, #0x2
    ldr r6, [r1, r0]
    ldr r1, [r5, #0x4c]
    str r2, [sp, #0x0]
    ldr r4, [r1, r0]
    ldr r1, [r5, #0x50]
    str r3, [sp, #0x4]
    ldr r0, [r1, r0]
    ldr r1, .L_0215bfc4
    str r0, [sp, #0x8]
    mov r0, r4
    blx func_ov007_0214f898
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, .L_0215bfc8
    ldr r1, [r0, #0x1c]
    ldr r0, [r0, #0x20]
    str r1, [sp, #0x14]
    str r0, [sp, #0x18]
    mov r0, r4
    mov r1, #0x0
    blx func_02020ed0
    mov r1, r0
    mov r0, r4
    blx func_02020eb4
    ldr r2, .L_0215bfcc
    mov r0, #0x0
    add r1, sp, #0x14
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    add r0, sp, #0x14
    blx func_ov007_0214f474
    str r0, [sp, #0x10]
    add r0, sp, #0x14
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r2, [sp, #0x10]
    bl func_ov012_021b5900
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x0]
    blx func_ov007_021524c8
    mov r1, #0x49
    ldr r2, [r4, #0x4]
    ldr r0, [sp, #0x4]
    lsl r1, r1, #0x2
    str r0, [r2, r1]
    add r0, sp, #0x20
    ldrb r0, [r0, #0x10]
    cmp r0, #0x0
    ldr r0, [r6, #0x4]
    beq .L_0215bfa8
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_0215bfb2
.L_0215bfa8:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215bfb2:
    mov r0, r5
    mov r1, r7
    mov r2, r6
    mov r3, #0x0
    bl func_ov007_0215c10c
    add sp, #0x1c
    pop {r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215bfc4: .word 0x67625053
.L_0215bfc8: .word data_ov007_0216a1ec
.L_0215bfcc: .word data_02093c8c
    thumb_func_end func_ov007_0215bf08

    .global func_ov007_0215bfd0
    thumb_func_start func_ov007_0215bfd0
func_ov007_0215bfd0: ; 0x0215bfd0
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r7, r0
    mov r4, r1
    ldr r1, [r7, #0x48]
    lsl r0, r4, #0x2
    ldr r1, [r1, r0]
    str r1, [sp, #0xc]
    ldr r1, [r7, #0x4c]
    ldr r6, [r1, r0]
    ldr r1, [r7, #0x50]
    ldr r0, [r1, r0]
    ldr r1, .L_0215c100
    str r0, [sp, #0x8]
    mov r0, r6
    blx func_ov007_0214f898
    ldr r2, [r7, #0x74]
    mov ip, r0
    mov r0, #0x1c
    ldr r1, [r2, #0x8]
    mul r0, r4
    add r5, r1, r0
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    beq .L_0215c0fc
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x0]
    ldrb r1, [r5, #0x19]
    ldrb r0, [r5, #0x1a]
    add r0, r1, r0
    cmp r0, #0x4
    bge .L_0215c028
    mov r1, #0x1
    ldrsb r0, [r5, r1]
    cmp r0, #0x0
    beq .L_0215c026
    ldrb r0, [r2, #0x1]
    cmp r0, #0x0
    beq .L_0215c028
    str r1, [sp, #0x4]
    b .L_0215c028
.L_0215c026:
    str r1, [sp, #0x4]
.L_0215c028:
    ldrb r0, [r2, #0x0]
    cmp r0, #0x0
    beq .L_0215c03e
    ldrb r0, [r5, #0x1b]
    cmp r0, #0x4
    bhs .L_0215c03e
    mov r0, #0x1
    ldrsb r1, [r5, r0]
    cmp r1, #0x0
    bne .L_0215c03e
    str r0, [sp, #0x0]
.L_0215c03e:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_0215c048
    mov r1, #0x0
    b .L_0215c04a
.L_0215c048:
    mov r1, #0x2
.L_0215c04a:
    ldr r0, [sp, #0x0]
    cmp r0, #0x0
    bne .L_0215c05e
    mov r0, #0xa
    lsl r0, r0, #0xc
    mov r3, r4
    orr r3, r0
    add r1, r1, #0x1
    ldr r0, [sp, #0x8]
    b .L_0215c068
.L_0215c05e:
    mov r0, #0x2
    lsl r0, r0, #0xc
    mov r3, r4
    orr r3, r0
    ldr r0, [sp, #0x8]
.L_0215c068:
    ldr r2, [r0, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    str r3, [r2, r0]
    mov r0, ip
    blx func_ov007_021524c8
    ldr r2, [sp, #0xc]
    mov r0, r7
    mov r1, r4
    add r3, r5, #0x4
    bl func_ov007_0215c10c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_0215c08c
    mov r0, #0x1
    b .L_0215c08e
.L_0215c08c:
    mov r0, #0x9
.L_0215c08e:
    lsl r0, r0, #0xc
    mov r2, r4
    orr r2, r0
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    ldr r0, .L_0215c104
    ldr r1, [r0, #0x14]
    ldr r0, [r0, #0x18]
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    mov r0, r6
    mov r1, #0x0
    blx func_02020ed0
    mov r1, r0
    mov r0, r6
    blx func_02020eb4
    ldr r2, .L_0215c108
    mov r0, #0x0
    add r1, sp, #0x10
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r6
    blx func_02020e98
    add r0, sp, #0x10
    blx func_ov007_0214f474
    mov r4, r0
    add r0, sp, #0x10
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r6, #0x4]
    mov r2, r4
    bl func_ov012_021b5900
    ldr r0, [sp, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215c0fc:
    add sp, #0x18
    pop {r3, r4, r5, r6, r7, pc}
.L_0215c100: .word 0x67625053
.L_0215c104: .word data_ov007_0216a1ec
.L_0215c108: .word data_02093c8c
    thumb_func_end func_ov007_0215bfd0

    .global func_ov007_0215c10c
    thumb_func_start func_ov007_0215c10c
func_ov007_0215c10c: ; 0x0215c10c
    push {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r6, r2
    ldr r1, .L_0215c1a0
    mov r0, r6
    mov r5, r3
    blx func_ov007_0214f898
    mov r4, r0
    bne .L_0215c166
    cmp r5, #0x0
    beq .L_0215c19c
    blx func_0203b404
    add r0, #0x88
    ldr r4, [r0, #0x0]
    blx func_ov007_02150f0c
    mov r1, r0
    mov r0, r4
    mov r2, #0x6
    mov r3, #0xa0
    blx func_ov007_02151178
    mov r4, r0
    ldr r2, .L_0215c1a0
    ldr r1, [r4, #0x4]
    str r2, [r1, #0x54]
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r1, #0xa
    lsl r1, r1, #0xc
    str r1, [sp, #0x4]
    add r1, sp, #0x4
    add r2, sp, #0x0
    blx func_ov007_0214f218
    mov r0, r4
    mov r1, r6
    blx func_ov007_02152468
    mov r0, r6
    mov r1, r4
    blx func_ov007_0214f48c
.L_0215c166:
    ldr r6, [r4, #0x4]
    ldr r0, [r6, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r6
    ldr r1, [r0, #0x0]
    add r1, #0xc4
    ldr r1, [r1, #0x0]
    blx r1
    cmp r5, #0x0
    beq .L_0215c19c
    mov r0, r5
    add r1, sp, #0x8
    mov r2, #0x14
    blx func_02051890
    mov r2, #0x0
    add r0, sp, #0x0
    strh r2, [r0, #0x1c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x8
    ldr r0, [r0, #0x64]
    subs r2, r2, #0x1
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
.L_0215c19c:
    add sp, #0x20
    pop {r4, r5, r6, pc}
.L_0215c1a0: .word 0x6d6e5053
    thumb_func_end func_ov007_0215c10c

    .global func_ov007_0215c1a4
    arm_func_start func_ov007_0215c1a4
func_ov007_0215c1a4: ; 0x0215c1a4
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    mov ip, #0x1
    ldr r2, .L_0215c1f0
    ldr r1, .L_0215c1f4
    mov r3, #0x0
    add r0, sp, #0x0
    strb ip, [sp, #0x0]
    strb ip, [sp, #0x1]
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    bl func_ov007_02159b94
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_0215c1f0: .word func_ov007_0215c24c
.L_0215c1f4: .word func_ov007_0215c260
    arm_func_end func_ov007_0215c1a4

    .global func_ov007_0215c1f8
    arm_func_start func_ov007_0215c1f8
func_ov007_0215c1f8: ; 0x0215c1f8
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    mov ip, #0x0
    ldr r2, .L_0215c244
    ldr r1, .L_0215c248
    mov r3, #0x1
    add r0, sp, #0x0
    strb ip, [sp, #0x0]
    strb r3, [sp, #0x1]
    str ip, [sp, #0x4]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    bl func_ov007_02159b94
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_0215c244: .word func_ov007_0215c24c
.L_0215c248: .word func_ov007_0215c260
    arm_func_end func_ov007_0215c1f8

    .global func_ov007_0215c24c
    arm_func_start func_ov007_0215c24c
func_ov007_0215c24c: ; 0x0215c24c
    stmdb sp!, {r3, lr}
    bl func_ov007_0214dd50
    mov r1, #0x2
    bl func_ov007_0214dd6c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0215c24c

    .global func_ov007_0215c260
    arm_func_start func_ov007_0215c260
func_ov007_0215c260: ; 0x0215c260
    stmdb sp!, {r3, lr}
    bl func_ov007_0214dd50
    mov r1, #0x2
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_0215c260

    .global func_ov007_0215c274
    thumb_func_start func_ov007_0215c274
func_ov007_0215c274: ; 0x0215c274
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    ldr r1, .L_0215c5f4
    mov r4, r0
    ldr r2, .L_0215c5f8
    mov r0, #0x84
    mov r3, #0xca
    blx func_0201a21c
    mov r1, #0x0
    mov r2, #0x84
    mov r5, r0
    blx func_020517fc
    bl func_0208822c
    blx func_02087688
    str r4, [r5, #0x64]
    cmp r4, #0x1
    blt .L_0215c2a8
    cmp r4, #0x3
    bge .L_0215c2a8
    add r0, r4, #0x3
    str r0, [r5, #0x68]
    b .L_0215c2ac
.L_0215c2a8:
    mov r0, #0x4
    str r0, [r5, #0x68]
.L_0215c2ac:
    blx func_ov007_021517f4
    mov r1, r5
    add r1, #0x7f
    strb r0, [r1, #0x0]
    blx func_020310f4
    ldr r1, .L_0215c5fc
    str r0, [r5, #0x4]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_0215c600
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_0215c604
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r5, #0x4]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    str r0, [r5, #0x14]
    blx func_ov010_0219b14c
    mov r1, r5
    add r1, #0x75
    strb r0, [r1, #0x0]
    mov r0, r5
    mov r1, #0x0
    add r0, #0x74
    strb r1, [r0, #0x0]
    bl func_ov012_021b65bc
    mov r1, #0x20
    mov r0, #0x40
    lsl r2, r1, #0x8
    mov r3, #0x1
    blx func_ov007_02150678
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    str r0, [r5, #0x0]
    mov r0, #0x2
    blx func_0203b414
    mov r2, r0
    ldr r1, .L_0215c608
    add r2, #0x88
    ldmia r1!, {r0, r1}
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    ldr r7, .L_0215c60c
    str r0, [r5, #0x18]
    mov r4, #0x0
.L_0215c332:
    lsl r6, r4, #0x2
    ldr r0, [r7, r6]
    mov r1, #0x0
    bl func_020101f4
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x20]
    cmp r4, #0x2
    blt .L_0215c332
    ldr r1, .L_0215c610
    ldr r2, .L_0215c614
    ldr r3, .L_0215c618
    mov r0, #0xcc
    blx func_0201a21c
    mov r4, r0
    beq .L_0215c362
    ldr r1, .L_0215c61c
    ldr r2, .L_0215c620
    mov r3, #0x0
    bl func_ov012_021af26c
    mov r4, r0
.L_0215c362:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215c370
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215c370:
    ldr r6, [r4, #0x18]
    mov r1, #0x10
    ldr r2, [r6, #0x4]
    mov r0, r2
    add r0, #0xbc
    strh r1, [r0, #0x0]
    mov r1, #0x0
    add r2, #0xbe
    strh r1, [r2, #0x0]
    mov r0, #0x1
    mov r2, r6
    mov r3, r1
    bl func_ov012_021b3b7c
    ldr r0, .L_0215c624
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r1, .L_0215c628
    mov r0, r6
    blx func_ov007_0214f898
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    add r0, #0x14
    ldr r4, [r0, #0x18]
    cmp r4, #0x0
    bne .L_0215c3ae
    ldr r0, [r0, #0xc]
    blx func_02036430
    mov r4, r0
.L_0215c3ae:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215c3bc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215c3bc:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x18]
    mov r1, #0x21
    mov r2, #0xf
    mov r3, #0x3
    blx func_0206ad90
    ldr r1, .L_0215c62c
    str r0, [r5, #0x58]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x18]
    mov r1, #0x1
    strb r1, [r0, #0x19]
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b44
    str r0, [r5, #0x28]
    blx func_0203b404
    mov r3, r0
    add r3, #0x88
    mov r1, #0x81
    ldr r0, [r5, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    blx func_0203b3e4
    mov r1, r0
    add r1, #0x88
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215c630
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x40]
    ldr r1, [r5, #0x28]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215c634
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    str r4, [r5, #0x2c]
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0215c638
    add r0, sp, #0x28
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_0215c63c
    add r0, sp, #0x20
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, .L_0215c640
    add r1, sp, #0x1c
    str r0, [sp, #0x18]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    mov r0, r4
    add r2, sp, #0x18
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r2, .L_0215c644
    ldr r3, [sp, #0x2c]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b4034
    ldr r0, .L_0215c624
    ldr r1, .L_0215c648
    ldr r6, [r0, #0x0]
    mov r0, #0x4d
    ldr r2, .L_0215c64c
    lsl r0, r0, #0x2
    mov r3, #0x3e
    ldr r4, [r4, #0x4]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_0215c522
    ldr r3, .L_0215c650
    mov r1, r4
    mov r2, r6
    bl func_ov012_021af0f8
.L_0215c522:
    blx func_ov007_0214f340
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x44]
    ldr r6, [r5, #0x18]
    cmp r6, #0x0
    beq .L_0215c564
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    mov r1, r6
    blx func_ov007_0214f48c
.L_0215c564:
    ldr r1, [r5, #0x28]
    mov r0, r5
    blx func_ov007_0215145c
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215c654
    ldr r1, [r6, #0x4]
    mov r0, r2
    add r0, #0x22
    str r2, [r1, r0]
    str r6, [r5, #0x30]
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    bl func_ov012_021b7744
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    ldr r0, [r6, #0x4]
    blx func_02023940
    ldr r2, .L_0215c63c
    add r0, sp, #0x58
    mov r1, r6
    blx func_ov007_0214f2a4
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x5
    blx func_02023c70
    ldr r0, [r6, #0x4]
    mov r1, #0x5
    bl func_ov012_021b4034
    mov r0, #0x4c
    str r0, [sp, #0x60]
    mov r0, #0x6e
    str r0, [sp, #0x64]
    mov r7, #0x0
.L_0215c5e6:
    mov r0, r5
    add r0, #0x7f
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0215c658
    add r4, r7, #0x1
    b .L_0215c65c
.L_0215c5f4: .word data_ov007_0216a4a4
.L_0215c5f8: .word data_ov007_0216a46c
.L_0215c5fc: .word data_02093c04
.L_0215c600: .word data_020a0e80
.L_0215c604: .word data_020a16c0
.L_0215c608: .word data_ov007_0216a384
.L_0215c60c: .word data_ov007_0216a394
.L_0215c610: .word data_ov007_02169644
.L_0215c614: .word data_ov007_0216a420
.L_0215c618: .word 0x1de
.L_0215c61c: .word func_ov007_0215cda0
.L_0215c620: .word func_ov007_0215cdec
.L_0215c624: .word data_ov012_021d5154
.L_0215c628: .word 0x31305053
.L_0215c62c: .word 0x8df
.L_0215c630: .word func_ov007_0215cd5c
.L_0215c634: .word 0x101
.L_0215c638: .word data_ov007_0216a4c0
.L_0215c63c: .word data_ov007_0216a4cc
.L_0215c640: .word 0xfff40000
.L_0215c644: .word 0x494c
.L_0215c648: .word data_ov007_02169654
.L_0215c64c: .word data_ov007_0216a418
.L_0215c650: .word func_ov007_0214f368
.L_0215c654: .word 0x102
.L_0215c658:
    mov r4, r7
    add r4, #0x8
.L_0215c65c:
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x60
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r6
    lsl r2, r2, #0x10
    mov r3, r4
    blx func_ov007_02151538
    mov r4, r0
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    add r2, r7, #0x4
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    lsl r0, r7, #0x2
    add r0, r5, r0
    str r4, [r0, #0x48]
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0215ca0c
    add r0, sp, #0x30
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_0215ca10
    add r0, sp, #0x38
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x6e
    lsl r0, r0, #0xc
    str r0, [sp, #0x44]
    ldr r0, .L_0215ca14
    add r1, sp, #0x40
    str r0, [sp, #0x40]
    mov r0, r4
    add r2, sp, #0x44
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    lsl r2, r7, #0x3
    blx func_02023c60
    ldr r0, [sp, #0x64]
    add r1, sp, #0x48
    lsl r0, r0, #0xc
    str r0, [sp, #0x4c]
    ldr r0, [sp, #0x60]
    add r2, sp, #0x4c
    lsl r0, r0, #0xc
    str r0, [sp, #0x48]
    mov r0, r4
    blx func_ov007_0214f218
    add r2, r7, #0x1
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    lsl r2, r2, #0x3
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r2, .L_0215ca18
    ldr r3, [sp, #0x34]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x5
    blx func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x5
    bl func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r1, .L_0215ca1c
    ldr r2, .L_0215ca20
    mov r0, #0x0
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, .L_0215ca1c
    blx func_ov007_0214f474
    str r0, [sp, #0x8]
    ldr r0, .L_0215ca1c
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r2, [sp, #0x8]
    bl func_ov012_021b5900
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215ca24
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    ldr r1, [r4, #0x4]
    ldr r0, .L_0215ca28
    add r1, #0xdc
    str r0, [r1, #0x0]
    ldr r0, [sp, #0x60]
    add r7, r7, #0x1
    add r0, #0x68
    str r0, [sp, #0x60]
    cmp r7, #0x2
    bge .L_0215c7ea
    b .L_0215c5e6
.L_0215c7ea:
    ldr r2, [r5, #0x4c]
    ldr r0, [r5, #0x48]
    cmp r2, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215c802
    mov r2, #0x59
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x4
    blx r3
    b .L_0215c810
.L_0215c802:
    mov r3, #0x16
    ldr r4, [r0, #0x0]
    lsl r3, r3, #0x4
    ldr r2, [r2, #0x4]
    ldr r4, [r4, r3]
    mov r1, #0x4
    blx r4
.L_0215c810:
    ldr r2, [r5, #0x48]
    ldr r0, [r5, #0x4c]
    cmp r2, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215c828
    mov r2, #0x59
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x8
    blx r3
    b .L_0215c836
.L_0215c828:
    mov r3, #0x16
    ldr r4, [r0, #0x0]
    lsl r3, r3, #0x4
    ldr r2, [r2, #0x4]
    ldr r4, [r4, r3]
    mov r1, #0x8
    blx r4
.L_0215c836:
    ldr r0, [r5, #0x4c]
    ldr r2, .L_0215ca2c
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    bl func_ov012_021b6760
    ldr r1, [r5, #0x28]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215ca30
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x21
    str r2, [r1, r0]
    str r4, [r5, #0x34]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_ov012_021b7744
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_ov012_021b6214
    mov r0, #0xcc
    str r0, [sp, #0x60]
    mov r0, #0x4c
    str r0, [sp, #0x64]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x70
    str r0, [sp, #0x0]
    add r0, sp, #0x60
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x5
    blx func_ov007_02151538
    ldr r1, .L_0215ca34
    mov r4, r0
    blx func_ov007_0214f898
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x6
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x50]
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0215ca10
    add r0, sp, #0x50
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_ov012_021b3fc4
    ldr r1, .L_0215ca38
    ldr r2, .L_0215ca20
    mov r0, #0x0
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, .L_0215ca38
    blx func_ov007_0214f474
    mov r6, r0
    ldr r0, .L_0215ca38
    blx func_ov007_0214f45c
    mov r1, r0
    ldr r0, [r4, #0x4]
    mov r2, r6
    bl func_ov012_021b5900
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    add r0, #0xaa
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    add r0, #0xab
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215ca3c
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x5
    mov r3, #0x70
    blx func_ov007_021510f0
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215ca40
    blx func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r2, #0x1
    str r4, [r5, #0x70]
    mov r0, #0xc
    mov r1, #0x0
    subs r3, r2, #0x2
    bl func_ov012_021bcf1c
    str r0, [r5, #0x54]
    ldr r0, [r5, #0x68]
    cmp r0, #0x4
    ldr r0, [r5, #0x54]
    bne .L_0215c9c2
    mov r1, #0x69
    mov r2, #0x0
    bl func_ov012_021bd730
    b .L_0215c9ca
.L_0215c9c2:
    mov r1, #0x6a
    mov r2, #0x0
    bl func_ov012_021bd730
.L_0215c9ca:
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    blx func_ov012_021ba49c
    mov r1, #0x0
    mov r2, r1
    str r0, [r5, #0x5c]
    blx func_ov010_021a3228
    mov r0, #0x2
    mov r1, #0x1
    blx func_02073ebc
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x8]
    ldr r1, .L_0215ca44
    b .L_0215ca48
    mov r8, r8
.L_0215ca0c: .word data_ov007_0216a4c0
.L_0215ca10: .word data_ov007_0216a4cc
.L_0215ca14: .word 0x132000
.L_0215ca18: .word 0x494c
.L_0215ca1c: .word data_ov007_0216a39c
.L_0215ca20: .word data_02093c8c
.L_0215ca24: .word func_ov007_0215ce58
.L_0215ca28: .word func_ov007_0215d038
.L_0215ca2c: .word func_ov007_0215cbb8
.L_0215ca30: .word 0x103
.L_0215ca34: .word 0x31305053
.L_0215ca38: .word data_ov007_0216a38c
.L_0215ca3c: .word func_ov007_0215d084
.L_0215ca40: .word func_ov007_0215d0c0
.L_0215ca44: .word func_ov007_0215ca98
.L_0215ca48:
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    ldr r1, [r5, #0x8]
    lsl r0, r0, #0x12
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
    ldr r2, [r0, #0x0]
    add r2, #0xa0
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x2c]
    mov r2, #0x52
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    mov r1, #0x10
    ldr r3, [r3, r2]
    blx r3
    ldr r0, [r5, #0x30]
    mov r2, #0x52
    ldr r0, [r0, #0x4]
    lsl r2, r2, #0x2
    ldr r3, [r0, #0x0]
    mov r1, #0x10
    ldr r3, [r3, r2]
    blx r3
    ldr r0, [r5, #0x68]
    mov r1, #0x1
    lsl r0, r0, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x38]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r5, #0x4]
    add sp, #0x68
    pop {r3, r4, r5, r6, r7, pc}
    thumb_func_end func_ov007_0215c274

    .global func_ov007_0215ca98
    thumb_func_start func_ov007_0215ca98
func_ov007_0215ca98: ; 0x0215ca98
    push {r4, lr}
    mov r4, r0
    blx func_0207382c
    cmp r0, #0x0
    beq .L_0215caac
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215cab0
    blx func_02028384
.L_0215caac:
    pop {r4, pc}
    mov r8, r8
.L_0215cab0: .word func_ov007_0215cab4
    thumb_func_end func_ov007_0215ca98

    .global func_ov007_0215cab4
    thumb_func_start func_ov007_0215cab4
func_ov007_0215cab4: ; 0x0215cab4
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov010_021a315c
    cmp r0, #0x0
    beq .L_0215cad2
    blx func_ov010_021a3264
    cmp r0, #0x0
    beq .L_0215cad2
    mov r0, r4
    blx func_ov007_0215cbcc
    pop {r4, pc}
.L_0215cad2:
    blx func_ov010_021a315c
    cmp r0, #0x0
    beq .L_0215cae2
    blx func_ov010_021a3348
    cmp r0, #0x0
    bne .L_0215caf4
.L_0215cae2:
    blx func_ov010_021a315c
    cmp r0, #0x0
    bne .L_0215cb28
    mov r0, r4
    add r0, #0x7d
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0215cb28
.L_0215caf4:
    blx func_ov007_0214dd50
    mov r1, #0x1
    blx func_ov007_0214dd60
    blx func_ov010_0219ad4c
    cmp r0, #0x0
    bne .L_0215cb18
    mov r0, r4
    add r0, #0x7e
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0215cb18
    bl func_02070f88
    cmp r0, #0x0
    beq .L_0215cb20
.L_0215cb18:
    ldr r0, [r4, #0x5c]
    mov r1, #0x10
    blx func_ov007_021516f0
.L_0215cb20:
    mov r0, r4
    blx func_ov007_0215cbcc
    pop {r4, pc}
.L_0215cb28:
    blx func_ov010_0219a93c
    cmp r0, #0x0
    bne .L_0215cb9e
    blx func_ov010_0219a18c
    cmp r0, #0x0
    bne .L_0215cb9e
    mov r0, r4
    add r0, #0x7d
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0215cb66
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0215cba0
    ldr r0, [r4, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    mov r0, r4
    mov r1, #0x0
    add r0, #0x7d
    strb r1, [r0, #0x0]
.L_0215cb66:
    mov r0, r4
    add r0, #0x7c
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0215cb9e
    blx func_ov010_021a315c
    cmp r0, #0x0
    beq .L_0215caf4
    blx func_ov010_0219bd9c
    mov r0, r4
    mov r1, #0x0
    add r0, #0x7c
    strb r1, [r0, #0x0]
    mov r0, r4
    mov r1, #0x1
    add r0, #0x7d
    strb r1, [r0, #0x0]
    blx func_ov010_0219ad8c
    mov r1, r4
    add r1, #0x7e
    strb r0, [r1, #0x0]
    mov r0, r4
    mov r1, #0x1
    bl func_ov007_0215cba0
.L_0215cb9e:
    pop {r4, pc}
    thumb_func_end func_ov007_0215cab4

    .global func_ov007_0215cba0
    thumb_func_start func_ov007_0215cba0
func_ov007_0215cba0: ; 0x0215cba0
    push {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x28]
    beq .L_0215cbb0
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65d8
    pop {r3, pc}
.L_0215cbb0:
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65e0
    pop {r3, pc}
    thumb_func_end func_ov007_0215cba0

    .global func_ov007_0215cbb8
    thumb_func_start func_ov007_0215cbb8
func_ov007_0215cbb8: ; 0x0215cbb8
    ldr r0, [r0, #0x4]
    ldr r3, .L_0215cbc8
    ldr r0, [r0, #0x10]
    mov r1, #0x1
    add r0, #0x74
    strb r1, [r0, #0x0]
    bx r3
    mov r8, r8
.L_0215cbc8: .word func_ov012_021b65cc
    thumb_func_end func_ov007_0215cbb8

    .global func_ov007_0215cbcc
    arm_func_start func_ov007_0215cbcc
func_ov007_0215cbcc: ; 0x0215cbcc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    blx func_ov012_021b65bc
    ldr r0, .L_0215cd48
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215cd48
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215cd48
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215cd48
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215cd48
    b .L_0215cc24
.L_0215cc1c:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215cc24:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215cc1c
    blx func_ov012_021b65cc
    bl func_020735e4
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    beq .L_0215cc50
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215cc50:
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, .L_0215cd4c
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    bl func_ov010_021a3248
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_0215cc80
    bl func_ov012_021bab64
.L_0215cc80:
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_0215cc90
    blx func_ov012_021bd500
.L_0215cc90:
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_0215cca0
    bl func_0206ae98
.L_0215cca0:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215ccb8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215ccb8:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0215ccd0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215ccd0:
    mov r5, #0x0
.L_0215ccd4:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0215ccf0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215ccf0:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215ccd4
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_0215cd50
    ldr r2, .L_0215cd54
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215cd58
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215cd48: .word data_020a0e18
.L_0215cd4c: .word data_ov012_021d5154
.L_0215cd50: .word data_02093c04
.L_0215cd54: .word data_020a16c0
.L_0215cd58: .word data_020a0e80
    arm_func_end func_ov007_0215cbcc

    .global func_ov007_0215cd5c
    thumb_func_start func_ov007_0215cd5c
func_ov007_0215cd5c: ; 0x0215cd5c
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215cd9c
    cmp r0, r1
    bne .L_0215cd9a
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0215cd9a
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    blx func_ov007_0214dd50
    mov r1, #0x1
    blx func_ov007_0214dd60
    mov r0, #0x1
    add r4, #0x7c
    strb r0, [r4, #0x0]
.L_0215cd9a:
    pop {r3, r4, r5, pc}
.L_0215cd9c: .word 0x80011001
    thumb_func_end func_ov007_0215cd5c

    .global func_ov007_0215cda0
    thumb_func_start func_ov007_0215cda0
func_ov007_0215cda0: ; 0x0215cda0
    push {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    blx func_0203b404
    add r0, #0x88
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x3
    mov r3, #0x7f
    blx func_ov007_021510f0
    mov r1, r0
    mov r0, r4
    blx func_ov007_0214f48c
    mov r0, #0x7f
    ldr r1, [r4, #0x4]
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215cde8
    ldr r0, [r0, #0x50]
    str r1, [r0, #0x10]
    mov r1, #0x1
    blx func_ov007_0214f240
    add sp, #0x4
    pop {r3, r4, pc}
    mov r8, r8
.L_0215cde8: .word 0xfff40000
    thumb_func_end func_ov007_0215cda0

    .global func_ov007_0215cdec
    thumb_func_start func_ov007_0215cdec
func_ov007_0215cdec: ; 0x0215cdec
    push {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0x4]
    ldr r1, .L_0215ce4c
    add r4, #0xa0
    blx func_ov007_0214f898
    ldr r0, [r5, #0x4]
    add r0, #0x94
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0215ce0a
    mov r0, #0x0
    b .L_0215ce0e
.L_0215ce0a:
    blx func_ov007_0214f340
.L_0215ce0e:
    ldr r0, [r0, #0x4]
    add r0, #0xa8
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0215ce2c
    ldr r0, .L_0215ce50
    ldr r1, [r0, #0x0]
    ldr r0, .L_0215ce54
    ldr r0, [r0, #0x0]
    cmp r1, r0
    bhi .L_0215ce2c
    mov r0, #0x78
    mov r1, #0x3
    blx func_0207342c
.L_0215ce2c:
    mov r0, #0x2
    ldrsh r0, [r4, r0]
    add r1, sp, #0x4
    add r2, sp, #0x0
    lsl r0, r0, #0xc
    str r0, [sp, #0x0]
    mov r0, #0x0
    ldrsh r0, [r4, r0]
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r5
    blx func_ov007_0214f218
    add sp, #0x8
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215ce4c: .word 0x31305053
.L_0215ce50: .word data_ov012_021d5160
.L_0215ce54: .word data_02093c24
    thumb_func_end func_ov007_0215cdec

    .global func_ov007_0215ce58
    arm_func_start func_ov007_0215ce58
func_ov007_0215ce58: ; 0x0215ce58
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215d030
    cmp r0, r1
    bne .L_0215d028
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    beq .L_0215d028
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r0, [r4, #0x7f]
    cmp r0, #0x0
    mov r0, #0x78
    bne .L_0215cf3c
    mov r1, #0x2
    bl func_0207342c
    mov r0, r4
    mov r1, #0x1
    blx func_ov007_0215cba0
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x5c]
    mov r3, r2
    mov r1, #0x50
    bl func_ov012_021bac28
    ldr r5, .L_0215d034
.L_0215cef0:
    ldr r0, [r4, #0x5c]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    bne .L_0215cf0c
    ldr r0, [r5, #0x0]
    blx r0
    b .L_0215cef0
.L_0215cf0c:
    mov r0, r4
    mov r1, #0x0
    blx func_ov007_0215cba0
    ldr r0, [r4, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    b .L_0215d028
.L_0215cf3c:
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x4
    bne .L_0215cffc
    bl func_ov010_0219a5e8
    cmp r0, #0x0
    beq .L_0215cffc
    mov r0, r4
    mov r1, #0x1
    blx func_ov007_0215cba0
    bl func_ov010_0219a62c
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    str r3, [sp, #0xc]
    str r3, [sp, #0x10]
    mov r2, r0
    ldr r0, [r4, #0x5c]
    mov r1, #0x3c
    bl func_ov012_021bac78
    ldr r6, .L_0215d034
    b .L_0215cfa8
.L_0215cfa0:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215cfa8:
    ldr r0, [r4, #0x5c]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_0215cfa0
    ldr r0, [r4, #0x5c]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    bne .L_0215cffc
    mov r0, r4
    mov r1, #0x0
    blx func_ov007_0215cba0
    ldr r0, [r4, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    bl func_ov010_0219a588
    b .L_0215d028
.L_0215cffc:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x124]
    sub r5, r0, #0x4
    bl func_ov007_0214dd50
    add r1, r5, #0x1
    bl func_ov007_0214dd98
    bl func_ov007_0214dd50
    add r1, r5, #0xf
    bl func_ov007_0214dd60
    mov r0, r4
    bl func_ov007_0215cbcc
.L_0215d028:
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0215d030: .word 0x80011000
.L_0215d034: .word data_020a0e18
    arm_func_end func_ov007_0215ce58

    .global func_ov007_0215d038
    thumb_func_start func_ov007_0215d038
func_ov007_0215d038: ; 0x0215d038
    push {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x49
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    ldr r4, [r1, #0x10]
    cmp r0, #0x4
    ldr r0, [r4, #0x50]
    bne .L_0215d066
    cmp r0, #0x0
    beq .L_0215d05a
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215d05a:
    ldr r0, [r4, #0x54]
    mov r1, #0x69
    mov r2, #0x0
    bl func_ov012_021bd730
    pop {r4, pc}
.L_0215d066:
    cmp r0, #0x0
    beq .L_0215d076
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215d076:
    ldr r0, [r4, #0x54]
    mov r1, #0x6a
    mov r2, #0x0
    bl func_ov012_021bd730
    pop {r4, pc}
    thumb_func_end func_ov007_0215d038

    .byte 0x00, 0x00

    .global func_ov007_0215d084
    thumb_func_start func_ov007_0215d084
func_ov007_0215d084: ; 0x0215d084
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215d0bc
    cmp r0, r1
    bne .L_0215d0ba
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0215d0ba
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x10]
    mov r0, r1
    add r0, #0x74
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0215d0ba
    mov r0, #0x1
    add r1, #0x6c
    strb r0, [r1, #0x0]
.L_0215d0ba:
    pop {r3, r4, r5, pc}
.L_0215d0bc: .word 0x80011001
    thumb_func_end func_ov007_0215d084

    .global func_ov007_0215d0c0
    thumb_func_start func_ov007_0215d0c0
func_ov007_0215d0c0: ; 0x0215d0c0
    push {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x4c]
    ldr r0, [r0, #0x4]
    add r0, #0x90
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    and r1, r0
    cmp r1, #0x1
    bne .L_0215d178
    mov r1, r4
    add r1, #0x74
    ldrb r1, [r1, #0x0]
    cmp r1, #0x0
    beq .L_0215d178
    mov r1, r4
    add r1, #0x6c
    ldrb r1, [r1, #0x0]
    cmp r1, #0x0
    bne .L_0215d11c
    mov r1, r4
    add r1, #0x7d
    ldrb r1, [r1, #0x0]
    cmp r1, #0x0
    bne .L_0215d11c
    ldr r1, [r4, #0x14]
    ldr r2, [r1, #0x0]
    ldr r1, [r2, #0x70]
    ldr r3, [r2, #0x74]
    lsl r1, r1, #0x2
    add r1, r2, r1
    lsl r3, r3, #0x2
    add r2, r2, r3
    ldr r2, [r2, #0x18]
    ldr r1, [r1, #0x18]
    mvn r2, r2
    and r2, r1
    mov r1, #0x40
    tst r1, r2
    beq .L_0215d11c
    mov r1, r4
    add r1, #0x6c
    strb r0, [r1, #0x0]
.L_0215d11c:
    mov r0, r4
    add r0, #0x6c
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0215d14c
    mov r0, r4
    add r0, #0x75
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0215d134
    mov r1, #0x1
    b .L_0215d136
.L_0215d134:
    mov r1, #0x0
.L_0215d136:
    mov r0, r4
    add r0, #0x75
    strb r1, [r0, #0x0]
    mov r0, #0x78
    mov r1, #0x3
    blx func_0207342c
    mov r0, r4
    mov r1, #0x0
    add r0, #0x6c
    strb r1, [r0, #0x0]
.L_0215d14c:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x50]
    add r1, sp, #0x4
    ldr r0, [r0, #0x4]
    add r2, sp, #0x0
    ldr r0, [r0, #0x50]
    ldr r0, [r0, #0x10]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x50]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x50]
    ldr r0, [r0, #0xc]
    str r0, [sp, #0x4]
    mov r0, r5
    blx func_ov007_0214f218
    b .L_0215d184
.L_0215d178:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215d184:
    mov r0, r4
    add r0, #0x75
    ldrb r0, [r0, #0x0]
    mov r1, #0x4
    cmp r0, #0x0
    bne .L_0215d192
    add r1, r1, #0x1
.L_0215d192:
    ldr r0, [r4, #0x78]
    cmp r0, r1
    beq .L_0215d1b2
    str r1, [r4, #0x78]
    mov r2, #0x81
    lsl r2, r2, #0x10
    orr r1, r2
    ldr r0, [r5, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0215d1b2:
    add r4, #0x75
    ldrb r0, [r4, #0x0]
    blx func_ov010_0219b174
    add sp, #0x8
    pop {r3, r4, r5, pc}
    thumb_func_end func_ov007_0215d0c0

    .byte 0x00, 0x00

    .global func_ov007_0215d1c0
    thumb_func_start func_ov007_0215d1c0
func_ov007_0215d1c0: ; 0x0215d1c0
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x9c
    mov r0, #0x21
    lsl r0, r0, #0x4
    mov r3, r0
    ldr r1, .L_0215d508
    ldr r2, .L_0215d50c
    sub r3, #0xfd
    blx func_0201a21c
    mov r2, #0x21
    mov r1, #0x0
    lsl r2, r2, #0x4
    mov r5, r0
    blx func_020517fc
    blx func_020310f4
    ldr r1, .L_0215d510
    str r0, [r5, #0x4]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_0215d514
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_0215d518
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r5, #0x4]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    str r0, [r5, #0x10]
    ldr r0, .L_0215d51c
    ldrb r0, [r0, #0x4]
    bl func_02071f10
    mov r1, #0x43
    lsl r1, r1, #0x2
    add r1, r5, r1
    mov r2, #0x5c
    blx func_02051890
    bl func_02071f08
    mov r1, r5
    add r1, #0xc0
    mov r2, #0x4c
    blx func_02051890
    mov r0, #0x43
    lsl r0, r0, #0x2
    add r1, r5, r0
    mov r0, r5
    add r0, #0xb8
    str r1, [r0, #0x0]
    mov r1, r5
    mov r0, r5
    add r1, #0xc0
    add r0, #0xbc
    str r1, [r0, #0x0]
    add r0, sp, #0x7c
    mov r1, #0x0
    mov r2, #0x20
    blx func_020517fc
    mov r0, r5
    add r0, #0xbc
    ldr r0, [r0, #0x0]
    add r1, sp, #0x7c
    mov r2, #0x0
    bl func_0207260c
    mov r0, r5
    add r0, #0xbc
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    add r0, #0x40
    mov r2, #0xc
    blx func_020517fc
    mov r1, #0x40
    mov r0, #0x20
    lsl r2, r1, #0x8
    mov r3, #0x1
    blx func_ov007_02150678
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r4, [r0, #0x0]
    mov r1, #0x3
    ldr r0, [r4, #0x4]
    blx func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x8
    blx func_0203d478
    mov r1, #0x20
    ldr r0, [r4, #0x4]
    mov r2, r1
    blx func_0203cfbc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    lsl r1, r1, #0xe
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x3
    lsl r0, r0, #0xc
    str r0, [sp, #0x70]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x70
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0x94
    ldr r2, [r2, #0x0]
    blx r2
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    blx func_ov012_021ba49c
    str r0, [r5, #0x70]
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    ldr r7, .L_0215d520
    str r0, [r5, #0x0]
    mov r4, #0x0
.L_0215d2ea:
    add r0, r4, #0x2
    blx func_0203b414
    mov r2, r0
    lsl r6, r4, #0x2
    ldr r1, .L_0215d524
    add r2, #0x88
    ldr r0, [r7, r6]
    ldr r1, [r1, r6]
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x14]
    cmp r4, #0x2
    blt .L_0215d2ea
    ldr r0, .L_0215d528
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_020101f4
    str r0, [r5, #0x1c]
    ldr r6, [r5, #0x14]
    mov r4, r5
    mov r0, r6
    add r4, #0x74
    blx func_ov007_0215e100
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0xb4
    mov r2, #0x1
    mov r3, #0x5
    blx func_0206ad90
    str r0, [r5, #0x74]
    mov r0, r6
    blx func_ov007_0215e100
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0xb1
    mov r2, #0x1
    mov r3, #0x5
    blx func_0206ad90
    ldr r2, .L_0215d52c
    str r0, [r4, #0x4]
    mov r0, #0x1e
    str r0, [sp, #0x0]
    mov r3, r2
    ldr r0, [r5, #0x74]
    mov r1, #0x3
    sub r3, #0x6f
    blx func_ov007_0215e148
    ldr r2, .L_0215d52c
    mov r0, #0x1e
    str r0, [sp, #0x0]
    mov r3, r2
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    sub r3, #0x6f
    blx func_ov007_0215e148
    ldr r0, [r5, #0x74]
    mov r1, #0x0
    blx func_ov007_0215e168
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov007_0215e168
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b44
    mov r4, r0
    str r4, [r5, #0x20]
    blx func_0203b3e4
    mov r3, r0
    add r3, #0x88
    mov r1, #0x81
    ldr r0, [r5, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    mov r0, #0x7c
    str r0, [sp, #0x8]
    mov r0, #0xa0
    str r0, [sp, #0xc]
    blx func_0203b3e4
    mov r1, r0
    mov r0, #0x9e
    str r0, [sp, #0x0]
    add r0, sp, #0x8
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x3
    blx func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x7
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x48]
    ldr r1, [r5, #0x20]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215d530
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    str r4, [r5, #0x24]
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0215d534
    add r0, sp, #0x30
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_0215d538
    add r0, sp, #0x28
    mov r1, r4
    blx func_ov007_0214f2a4
    mov r0, #0x3
    lsl r0, r0, #0x12
    str r0, [sp, #0x20]
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r0, r4
    add r1, sp, #0x24
    add r2, sp, #0x20
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    mov r0, r4
    add r1, sp, #0x1c
    add r2, sp, #0x18
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r2, .L_0215d53c
    ldr r3, [sp, #0x34]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_02023c70
    ldr r1, .L_0215d540
    b .L_0215d544
.L_0215d508: .word data_ov007_0216a5d4
.L_0215d50c: .word data_ov007_0216a5bc
.L_0215d510: .word data_02093c04
.L_0215d514: .word data_020a0e80
.L_0215d518: .word data_020a16c0
.L_0215d51c: .word data_020afeb0
.L_0215d520: .word data_ov007_0216a4e0
.L_0215d524: .word data_ov007_0216a4d8
.L_0215d528: .word data_ov007_0216a4d4
.L_0215d52c: .word 0x8df
.L_0215d530: .word 0x101
.L_0215d534: .word data_ov007_0216a5ec
.L_0215d538: .word data_ov007_0216a5f8
.L_0215d53c: .word 0x494c
.L_0215d540: .word data_ov012_021d5154
.L_0215d544:
    mov r0, r4
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x2
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x34]
    ldr r7, [r5, #0x14]
    cmp r7, #0x0
    beq .L_0215d598
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r7, [r7, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r7
    add r2, #0xb4
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215d598:
    mov r0, #0xd0
    str r0, [sp, #0x38]
    mov r0, #0x88
    str r0, [sp, #0x3c]
    blx func_0203b3e4
    mov r1, r0
    mov r0, #0xa0
    str r0, [sp, #0x0]
    add r0, sp, #0x38
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x9
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x5
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x40]
    mov r0, #0xb8
    str r0, [sp, #0x38]
    mov r0, #0x60
    str r0, [sp, #0x3c]
    blx func_0203b3e4
    mov r1, r0
    mov r0, #0x9f
    str r0, [sp, #0x0]
    add r0, sp, #0x38
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0xa
    blx func_ov007_02151538
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x42
    str r0, [sp, #0x38]
    mov r0, #0x81
    str r0, [sp, #0x3c]
    blx func_0203b3e4
    mov r1, r0
    mov r0, #0x9e
    str r0, [sp, #0x0]
    add r0, sp, #0x38
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x5
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x38]
    mov r0, #0x82
    str r0, [sp, #0x38]
    mov r0, #0x7d
    str r0, [sp, #0x3c]
    blx func_0203b3e4
    mov r1, r0
    mov r0, #0x9e
    str r0, [sp, #0x0]
    add r0, sp, #0x38
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x7
    blx func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x4
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x3c]
    ldr r1, [r5, #0x20]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215d944
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x22
    str r2, [r1, r0]
    str r4, [r5, #0x28]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0215d948
    add r0, sp, #0x68
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_0215d94c
    add r0, sp, #0x60
    mov r1, r4
    blx func_ov007_0214f2a4
    mov r0, #0x0
    str r0, [sp, #0x58]
    ldr r0, .L_0215d950
    add r1, sp, #0x5c
    str r0, [sp, #0x5c]
    mov r0, r4
    add r2, sp, #0x58
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x50]
    str r0, [sp, #0x54]
    mov r0, r4
    add r1, sp, #0x54
    add r2, sp, #0x50
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r2, .L_0215d954
    ldr r3, [sp, #0x6c]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x48]
    str r0, [sp, #0x4c]
    mov r0, r4
    add r1, sp, #0x4c
    add r2, sp, #0x48
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_02023c70
    ldr r1, .L_0215d958
    mov r0, r4
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0xc
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    mov r1, #0x0
    str r4, [r5, #0x5c]
    mov r3, #0xc0
    str r3, [sp, #0x0]
    add r0, sp, #0x40
    mov r2, r1
    add r3, #0x40
    blx func_ov007_021502ec
    ldr r2, .L_0215d95c
    mov r0, #0x0
    add r1, sp, #0x40
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215d960
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r0, #0x3
    blx func_0203b424
    mov r2, r0
    add r2, #0x88
    ldr r0, .L_0215d964
    ldr r1, .L_0215d968
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    str r0, [r5, #0x6c]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x1
    mov r1, r0
    blx func_02075fbc
    str r0, [r5, #0x60]
    blx func_02076908
    mov r1, r5
    str r0, [r5, #0x64]
    add r1, #0xb8
    ldr r1, [r1, #0x0]
    blx func_020769cc
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r1, #0x0
    mov r2, #0x3
    mov r3, r0
    blx func_02078cd4
    str r0, [r5, #0x68]
    mov r1, #0x8
    mov r2, #0x0
    blx func_0207903c
    ldr r0, [r5, #0x68]
    mov r1, #0x60
    blx func_02079c30
    ldr r0, [r5, #0x68]
    ldr r1, [r5, #0x64]
    blx func_02079094
    blx func_0203b3f4
    add r0, #0x88
    ldr r0, [r0, #0x0]
    ldr r1, .L_0215d96c
    ldr r2, [r0, #0x4]
    ldr r0, .L_0215d970
    strh r1, [r2, r0]
    mov r1, #0x1
    add r0, #0x44
    strb r1, [r2, r0]
    mov r0, #0x2
    blx func_02073ebc
    mov r0, r5
    mov r1, #0x0
    add r0, #0xac
    str r1, [r0, #0x0]
    mov r0, r5
    bl func_ov007_0215dc18
    mov r0, r5
    mov r1, #0x1
    add r0, #0xb4
    strb r1, [r0, #0x0]
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x8]
    ldr r1, .L_0215d974
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x78]
    ldr r0, [r5, #0x8]
    add r1, sp, #0x78
    blx func_ov007_0214ed20
    blx func_02026f94
    str r0, [r5, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0xc]
    ldr r1, .L_0215d978
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x74]
    ldr r0, [r5, #0xc]
    add r1, sp, #0x74
    blx func_ov007_0214ed20
    ldr r0, [r5, #0x24]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x28]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    add sp, #0x9c
    pop {r4, r5, r6, r7, pc}
.L_0215d944: .word 0x102
.L_0215d948: .word data_ov007_0216a5ec
.L_0215d94c: .word data_ov007_0216a5f8
.L_0215d950: .word 0xfff00000
.L_0215d954: .word 0x494c
.L_0215d958: .word data_ov012_021d5154
.L_0215d95c: .word data_02093c8c
.L_0215d960: .word func_ov007_0215ddec
.L_0215d964: .word data_ov007_0216a600
.L_0215d968: .word data_ov007_0216a61c
.L_0215d96c: .word 0xffff
.L_0215d970: .word 0x8b8
.L_0215d974: .word func_ov007_0215d97c
.L_0215d978: .word func_ov007_0215d994
    thumb_func_end func_ov007_0215d1c0

    .global func_ov007_0215d97c
    thumb_func_start func_ov007_0215d97c
func_ov007_0215d97c: ; 0x0215d97c
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_0215d992
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_020282f4
.L_0215d992:
    pop {r4, pc}
    thumb_func_end func_ov007_0215d97c

    .global func_ov007_0215d994
    thumb_func_start func_ov007_0215d994
func_ov007_0215d994: ; 0x0215d994
    push {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d9a8
    blx func_02028384
    mov r0, r4
    bl func_ov007_0215d9ac
    pop {r4, pc}
.L_0215d9a8: .word func_ov007_0215d9ac
    thumb_func_end func_ov007_0215d994

    .global func_ov007_0215d9ac
    thumb_func_start func_ov007_0215d9ac
func_ov007_0215d9ac: ; 0x0215d9ac
    push {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215da14
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x48]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xb0
    ldr r2, [r2, #0x0]
    blx r2
    cmp r0, #0x0
    bne .L_0215d9ca
    mov r5, #0x0
    b .L_0215d9d0
.L_0215d9ca:
    blx func_ov007_0214f340
    mov r5, r0
.L_0215d9d0:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    bne .L_0215d9e2
    mov r0, #0x1
    b .L_0215d9e4
.L_0215d9e2:
    mov r0, #0x0
.L_0215d9e4:
    cmp r0, #0x0
    bne .L_0215da10
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215da18
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    bl func_ov012_021b65cc
    ldr r0, [r4, #0x5c]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65d8
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215da1c
    blx func_02028384
.L_0215da10:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0215da14: .word 0x31305053
.L_0215da18: .word 0x810004
.L_0215da1c: .word func_ov007_0215da20
    thumb_func_end func_ov007_0215d9ac

    .global func_ov007_0215da20
    thumb_func_start func_ov007_0215da20
func_ov007_0215da20: ; 0x0215da20
    push {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x9d
    ldr r0, [r0, #0x10]
    ldrsb r1, [r0, r1]
    cmp r1, #0x0
    beq .L_0215da40
    bl func_ov007_0215dc18
    cmp r0, #0x0
    bne .L_0215da40
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215da44
    blx func_02028384
.L_0215da40:
    pop {r4, pc}
    mov r8, r8
.L_0215da44: .word func_ov007_0215da48
    thumb_func_end func_ov007_0215da20

    .global func_ov007_0215da48
    thumb_func_start func_ov007_0215da48
func_ov007_0215da48: ; 0x0215da48
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    mov r0, r4
    bl func_ov007_0215de20
    blx func_02086c38
    ldr r0, .L_0215da8c
    mov r1, #0x1
    strb r1, [r0, #0x8]
    mov r1, #0x5a
    mov r0, r4
    lsl r1, r1, #0x2
    add r0, #0xc0
    add r1, r4, r1
    mov r2, #0xa8
    blx func_ov007_02161dac
    mov r0, r4
    mov r1, #0x3
    blx func_ov007_0215e1b0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215da90
    blx func_02028384
    mov r0, r4
    mov r1, #0x1
    bl func_ov007_0215dda8
    pop {r3, r4, r5, pc}
.L_0215da8c: .word data_020afeb0
.L_0215da90: .word func_ov007_0215da94
    thumb_func_end func_ov007_0215da48

    .global func_ov007_0215da94
    thumb_func_start func_ov007_0215da94
func_ov007_0215da94: ; 0x0215da94
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov007_02161e50
    cmp r0, #0x0
    beq .L_0215db2e
    mov r6, #0x5a
    lsl r6, r6, #0x2
    add r0, r4, r6
    bl func_020725ac
    cmp r0, #0x0
    beq .L_0215dac4
    mov r1, r4
    add r0, r4, r6
    add r1, #0xc0
    bl func_020725bc
    cmp r0, #0x0
    bne .L_0215dac4
    mov r0, #0x1
    b .L_0215dac6
.L_0215dac4:
    mov r0, #0x0
.L_0215dac6:
    cmp r0, #0x0
    bne .L_0215dae6
    blx func_02086c38
    ldr r0, .L_0215db68
    mov r1, #0x1
    strb r1, [r0, #0x8]
    mov r1, #0x5a
    mov r0, r4
    lsl r1, r1, #0x2
    add r0, #0xc0
    add r1, r4, r1
    mov r2, #0xa8
    blx func_ov007_02161dac
    pop {r4, r5, r6, pc}
.L_0215dae6:
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0215dda8
    mov r0, #0x5a
    lsl r0, r0, #0x2
    add r0, r4, r0
    bl func_02072134
    mov r6, r0
    bpl .L_0215db02
    bl func_02072090
    mov r6, r0
.L_0215db02:
    mov r2, #0x5a
    lsl r2, r2, #0x2
    add r1, r4, r2
    add r2, #0x4c
    mov r0, r6
    add r2, r4, r2
    mov r3, #0x5
    blx func_ov007_02151888
    ldr r0, .L_0215db68
    mov r1, #0x2
    strb r1, [r0, #0x0]
    strb r6, [r0, #0x4]
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0215de20
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215db6c
    blx func_02028384
    pop {r4, r5, r6, pc}
.L_0215db2e:
    mov r0, #0x9d
    ldrsb r0, [r4, r0]
    cmp r0, #0x0
    beq .L_0215db64
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0215dda8
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0215de20
    blx func_ov007_02161e68
    blx func_02086c24
    ldr r0, .L_0215db68
    mov r1, #0x0
    strb r1, [r0, #0x8]
    mov r0, r4
    mov r1, #0x5
    blx func_ov007_0215e1b0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215db70
    blx func_02028384
.L_0215db64:
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0215db68: .word data_020afeb0
.L_0215db6c: .word func_ov007_0215db74
.L_0215db70: .word func_ov007_0215dbdc
    thumb_func_end func_ov007_0215da94

    .global func_ov007_0215db74
    thumb_func_start func_ov007_0215db74
func_ov007_0215db74: ; 0x0215db74
    push {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x10
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x70]
    blx func_ov007_021516f0
    blx func_02086c24
    ldr r0, .L_0215dba0
    mov r1, #0x0
    strb r1, [r0, #0x8]
    mov r0, r4
    mov r1, #0x4
    blx func_ov007_0215e1b0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215dba4
    blx func_02028384
    pop {r3, r4, r5, pc}
.L_0215dba0: .word data_020afeb0
.L_0215dba4: .word func_ov007_0215dba8
    thumb_func_end func_ov007_0215db74

    .global func_ov007_0215dba8
    thumb_func_start func_ov007_0215dba8
func_ov007_0215dba8: ; 0x0215dba8
    push {r3, lr}
    ldr r1, [r0, #0x4]
    ldr r2, [r1, #0x10]
    mov r1, #0x9d
    ldrsb r1, [r2, r1]
    cmp r1, #0x0
    beq .L_0215dbbe
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215dbc0
    blx func_02028384
.L_0215dbbe:
    pop {r3, pc}
.L_0215dbc0: .word func_ov007_0215dbc4
    thumb_func_end func_ov007_0215dba8

    .global func_ov007_0215dbc4
    thumb_func_start func_ov007_0215dbc4
func_ov007_0215dbc4: ; 0x0215dbc4
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov007_0214dd50
    mov r1, #0x6
    blx func_ov007_0214dd6c
    mov r0, r4
    blx func_ov007_0215dc48
    pop {r4, pc}
    thumb_func_end func_ov007_0215dbc4

    .global func_ov007_0215dbdc
    thumb_func_start func_ov007_0215dbdc
func_ov007_0215dbdc: ; 0x0215dbdc
    push {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    mov r1, #0x29
    mov r2, r4
    add r2, #0x74
    ldrsb r1, [r2, r1]
    cmp r1, #0x0
    beq .L_0215dc10
    mov r1, #0x2a
    ldrsb r1, [r2, r1]
    cmp r1, #0x0
    beq .L_0215dc00
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215dc14
    blx func_02028384
    pop {r4, pc}
.L_0215dc00:
    blx func_ov007_0214dd50
    mov r1, #0x6
    blx func_ov007_0214dd6c
    mov r0, r4
    blx func_ov007_0215dc48
.L_0215dc10:
    pop {r4, pc}
    mov r8, r8
.L_0215dc14: .word func_ov007_0215da48
    thumb_func_end func_ov007_0215dbdc

    .global func_ov007_0215dc18
    thumb_func_start func_ov007_0215dc18
func_ov007_0215dc18: ; 0x0215dc18
    push {r4, lr}
    mov r4, r0
    mov r1, r4
    add r1, #0xac
    ldr r1, [r1, #0x0]
    lsl r2, r1, #0x2
    ldr r1, .L_0215dc44
    ldr r1, [r1, r2]
    cmp r1, #0x0
    blt .L_0215dc40
    blx func_ov007_0215e1b0
    mov r0, r4
    add r0, #0xac
    ldr r0, [r0, #0x0]
    add r4, #0xac
    add r0, r0, #0x1
    str r0, [r4, #0x0]
    mov r0, #0x1
    pop {r4, pc}
.L_0215dc40:
    mov r0, #0x0
    pop {r4, pc}
.L_0215dc44: .word data_ov007_02168ab8
    thumb_func_end func_ov007_0215dc18

    .global func_ov007_0215dc48
    arm_func_start func_ov007_0215dc48
func_ov007_0215dc48: ; 0x0215dc48
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    blx func_ov012_021b65bc
    ldr r0, .L_0215dd98
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215dd98
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215dd98
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215dd98
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215dd98
    b .L_0215dca0
.L_0215dc98:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215dca0:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215dc98
    blx func_ov012_021b65cc
    bl func_020735e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02150b4c
    ldr r0, [r4, #0x68]
    bl func_02078f88
    ldr r0, [r4, #0x64]
    bl func_0207698c
    ldr r0, [r4, #0x60]
    bl func_020763e0
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    beq .L_0215dce4
    bl func_ov012_021bab64
.L_0215dce4:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215dcfc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215dcfc:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0215dd14
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215dd14:
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq .L_0215dd24
    bl func_0206ae98
.L_0215dd24:
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_0215dd34
    bl func_0206ae98
.L_0215dd34:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0215dd4c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215dd4c:
    ldr r0, [r4, #0x4]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_0215dd9c
    ldr r2, .L_0215dda0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215dda4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215dd98: .word data_020a0e18
.L_0215dd9c: .word data_02093c04
.L_0215dda0: .word data_020a16c0
.L_0215dda4: .word data_020a0e80
    arm_func_end func_ov007_0215dc48

    .global func_ov007_0215dda8
    thumb_func_start func_ov007_0215dda8
func_ov007_0215dda8: ; 0x0215dda8
    push {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0215ddce
    ldr r0, [r4, #0x5c]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65e0
    ldr r0, [r4, #0x5c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x5c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    add r0, #0xaa
    strb r1, [r0, #0x0]
    pop {r4, pc}
.L_0215ddce:
    ldr r0, [r4, #0x5c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    add r0, #0xaa
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x5c]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    ldr r0, [r4, #0x5c]
    ldr r0, [r0, #0x4]
    bl func_ov012_021b65d8
    pop {r4, pc}
    thumb_func_end func_ov007_0215dda8

    .byte 0x00, 0x00

    .global func_ov007_0215ddec
    thumb_func_start func_ov007_0215ddec
func_ov007_0215ddec: ; 0x0215ddec
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215de1c
    cmp r0, r1
    bne .L_0215de18
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0215de18
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    add r0, #0x9d
    strb r1, [r0, #0x0]
.L_0215de18:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215de1c: .word 0x80011000
    thumb_func_end func_ov007_0215ddec

    .global func_ov007_0215de20
    thumb_func_start func_ov007_0215de20
func_ov007_0215de20: ; 0x0215de20
    push {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    ldr r0, [r4, #0x38]
    beq .L_0215de5a
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215de8c
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x3c]
    ldr r1, .L_0215de90
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x3c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    pop {r4, pc}
.L_0215de5a:
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215de94
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x3c]
    ldr r1, .L_0215de98
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x3c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    pop {r4, pc}
    mov r8, r8
.L_0215de8c: .word 0x810006
.L_0215de90: .word 0x810008
.L_0215de94: .word 0x810005
.L_0215de98: .word 0x810007
    thumb_func_end func_ov007_0215de20

    .global func_ov007_0215de9c
    thumb_func_start func_ov007_0215de9c
func_ov007_0215de9c: ; 0x0215de9c
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215ded4
    cmp r0, r1
    bne .L_0215ded0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_0215ded0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    mov r0, #0x1
    add r4, #0x9d
    strb r0, [r4, #0x0]
.L_0215ded0:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215ded4: .word 0x80011001
    thumb_func_end func_ov007_0215de9c

    .global func_ov007_0215ded8
    thumb_func_start func_ov007_0215ded8
func_ov007_0215ded8: ; 0x0215ded8
    push {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    mov r0, #0x1
    add r4, #0x9d
    strb r0, [r4, #0x0]
    pop {r4, pc}
    thumb_func_end func_ov007_0215ded8

    .byte 0x00, 0x00

    .global func_ov007_0215def0
    thumb_func_start func_ov007_0215def0
func_ov007_0215def0: ; 0x0215def0
    push {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x3
    ldr r5, [r0, #0x10]
    mov r0, #0x78
    mov r4, r5
    add r4, #0x74
    blx func_0207342c
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    lsl r0, r0, #0x2
    ldr r0, [r1, r0]
    cmp r0, #0xa
    beq .L_0215df14
    mov r1, #0x1
    b .L_0215df16
.L_0215df14:
    mov r1, #0x0
.L_0215df16:
    mov r0, r4
    add r0, #0x2a
    strb r1, [r0, #0x0]
    mov r0, #0x2a
    ldrsb r0, [r4, r0]
    add r5, #0x74
    cmp r0, #0x0
    beq .L_0215df3a
    ldr r0, [r5, #0x0]
    mov r1, #0x0
    blx func_ov007_0215e18c
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215df50
    mov r2, #0x0
    blx func_0206af68
    pop {r4, r5, r6, pc}
.L_0215df3a:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov007_0215e18c
    ldr r0, [r5, #0x0]
    ldr r1, .L_0215df50
    mov r2, #0x0
    blx func_0206af68
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0215df50: .word 0x7fff
    thumb_func_end func_ov007_0215def0

    .global func_ov007_0215df54
    thumb_func_start func_ov007_0215df54
func_ov007_0215df54: ; 0x0215df54
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    cmp r1, #0x0
    ldr r0, [r5, #0x50]
    bne .L_0215df62
    b .L_0215e0bc
.L_0215df62:
    cmp r0, #0x0
    beq .L_0215df68
    b .L_0215e094
.L_0215df68:
    mov r6, #0x0
    mov r7, #0x18
.L_0215df6c:
    ldr r1, .L_0215e0f0
    ldr r0, [r5, #0x28]
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, #0x0
    add r0, sp, #0x14
    mov r2, r1
    mov r3, #0x40
    str r7, [sp, #0x0]
    blx func_ov007_021502ec
    ldr r2, .L_0215e0f4
    mov r0, #0x0
    add r1, sp, #0x14
    blx func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    blx func_02020e98
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, #0xaa
    strb r0, [r1, #0x0]
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215e0f8
    mov r1, #0x4
    bl func_ov012_021b65e8
    ldr r1, [r4, #0x4]
    mov r2, r6
    ldr r0, .L_0215e0fc
    add r1, #0xdc
    str r0, [r1, #0x0]
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    add r2, #0x9
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    lsl r0, r6, #0x2
    add r0, r5, r0
    add r6, r6, #0x1
    str r4, [r0, #0x50]
    cmp r6, #0x2
    blt .L_0215df6c
    mov r0, #0x12
    lsl r0, r0, #0xe
    str r0, [sp, #0xc]
    mov r0, #0xf
    lsl r0, r0, #0xe
    str r0, [sp, #0x10]
    ldr r0, [r5, #0x50]
    add r1, sp, #0x10
    add r2, sp, #0xc
    blx func_ov007_0214f218
    mov r0, #0x12
    lsl r0, r0, #0xe
    str r0, [sp, #0x4]
    mov r0, #0x21
    lsl r0, r0, #0xe
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x54]
    add r1, sp, #0x8
    add r2, sp, #0x4
    blx func_ov007_0214f218
    ldr r2, [r5, #0x54]
    ldr r0, [r5, #0x50]
    cmp r2, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215e024
    mov r2, #0x59
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x4
    blx r3
    b .L_0215e032
.L_0215e024:
    mov r3, #0x16
    ldr r4, [r0, #0x0]
    lsl r3, r3, #0x4
    ldr r2, [r2, #0x4]
    ldr r4, [r4, r3]
    mov r1, #0x4
    blx r4
.L_0215e032:
    ldr r2, [r5, #0x50]
    ldr r0, [r5, #0x54]
    cmp r2, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215e04a
    mov r2, #0x59
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x2
    ldr r3, [r3, r2]
    mov r1, #0x8
    blx r3
    b .L_0215e058
.L_0215e04a:
    mov r3, #0x16
    ldr r4, [r0, #0x0]
    lsl r3, r3, #0x4
    ldr r2, [r2, #0x4]
    ldr r4, [r4, r3]
    mov r1, #0x8
    blx r4
.L_0215e058:
    ldr r1, .L_0215e0f0
    ldr r0, [r5, #0x28]
    ldr r1, [r1, #0x0]
    blx func_ov007_0214f2f4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    add r0, #0xaa
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    add r0, #0xab
    strb r1, [r0, #0x0]
    mov r0, #0x49
    ldr r2, [r4, #0x4]
    mov r3, #0xa
    lsl r0, r0, #0x2
    str r3, [r2, r0]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    str r4, [r5, #0x58]
.L_0215e094:
    ldr r0, [r5, #0x50]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x54]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x50]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_ov012_021b6214
    b .L_0215e0ea
.L_0215e0bc:
    cmp r0, #0x0
    beq .L_0215e0ca
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r5, #0x50]
.L_0215e0ca:
    ldr r0, [r5, #0x54]
    cmp r0, #0x0
    beq .L_0215e0da
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r5, #0x54]
.L_0215e0da:
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    beq .L_0215e0ea
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r5, #0x58]
.L_0215e0ea:
    add sp, #0x1c
    pop {r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215e0f0: .word data_ov012_021d5154
.L_0215e0f4: .word data_02093c8c
.L_0215e0f8: .word func_ov007_0215ded8
.L_0215e0fc: .word func_ov007_0215def0
    thumb_func_end func_ov007_0215df54

    .global func_ov007_0215e100
    arm_func_start func_ov007_0215e100
func_ov007_0215e100: ; 0x0215e100
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r4, [r0, #0x2c]
    cmp r4, #0x0
    bne .L_0215e124
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r4, r0
.L_0215e124:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215e140
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215e140:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0215e100

    .global func_ov007_0215e148
    arm_func_start func_ov007_0215e148
func_ov007_0215e148: ; 0x0215e148
    ldrb ip, [sp, #0x0]
    strh r3, [r0, #0x18]
    strh r2, [r0, #0x16]
    strb ip, [r0, #0x1a]
    strb r1, [r0, #0x1c]
    mov r1, #0x1
    strb r1, [r0, #0x1b]
    bx lr
    arm_func_end func_ov007_0215e148

    .global func_ov007_0215e168
    arm_func_start func_ov007_0215e168
func_ov007_0215e168: ; 0x0215e168
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0215e17c
    bl func_0206af1c
.L_0215e17c:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0215e168

    .global func_ov007_0215e18c
    arm_func_start func_ov007_0215e18c
func_ov007_0215e18c: ; 0x0215e18c
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0215e1a0
    bl func_0206af1c
.L_0215e1a0:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0215e18c

    .global func_ov007_0215e1b0
    arm_func_start func_ov007_0215e1b0
func_ov007_0215e1b0: ; 0x0215e1b0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    add r5, r10, #0x74
    mov r4, #0x0
    strb r1, [r5, #0x28]
    strb r4, [r5, #0x29]
    strb r4, [r5, #0x2a]
    mov r6, r4
.L_0215e1d4:
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_0215e218
    ldr r0, [r10, #0x28]
    ldr r1, [r1, #0x4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r5, r4, lsl #0x2
    str r6, [r0, #0x8]
.L_0215e218:
    add r4, r4, #0x1
    cmp r4, #0x8
    blt .L_0215e1d4
    ldrb r0, [r10, #0xb4]
    cmp r0, #0x0
    beq .L_0215e23c
    ldr r0, .L_0215e604
    ldr r0, [r0, #0x0]
    blx r0
.L_0215e23c:
    ldrsb r1, [r10, #0x9c]
    ldr r0, .L_0215e608
    add r0, r0, r1, lsl #0x3
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    beq .L_0215e2ec
    cmp r0, #0x2
    bne .L_0215e324
    ldr r6, [r10, #0x14]
    ldr r8, .L_0215e60c
    mov r9, #0x9
    mov r5, #0xb
    mov r4, #0x0
    mov r11, #0x3
.L_0215e274:
    mov r7, r11
.L_0215e278:
    str r5, [sp, #0x0]
    str r4, [sp, #0x4]
    str r4, [sp, #0x8]
    ldr r0, [r6, #0x4]
    ldrb r3, [r8], #0x1
    ldr r0, [r0, #0x64]
    mov r1, r7
    ldr ip, [r0, #0x0]
    mov r2, r9
    ldr ip, [ip, #0x60]
    blx ip
    add r7, r7, #0x1
    cmp r7, #0x1c
    ble .L_0215e278
    add r9, r9, #0x1
    cmp r9, #0xb
    ble .L_0215e274
    mov r0, r10
    mov r1, #0x1
    blx func_ov007_0215df54
    ldr r0, [r10, #0x4c]
    cmp r0, #0x0
    beq .L_0215e460
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r10, #0x4c]
    b .L_0215e460
.L_0215e2ec:
    mov r0, r10
    bl func_ov007_0215e634
    mov r0, r10
    mov r1, #0x0
    blx func_ov007_0215df54
    ldr r0, [r10, #0x4c]
    cmp r0, #0x0
    beq .L_0215e460
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r10, #0x4c]
    b .L_0215e460
.L_0215e324:
    mov r0, r10
    bl func_ov007_0215e634
    mov r0, r10
    mov r1, #0x0
    blx func_ov007_0215df54
    ldr r0, [r10, #0x4c]
    cmp r0, #0x0
    bne .L_0215e438
    mov r1, #0xe0
    mov r0, #0x50
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    bl func_0203b3e4
    mov r2, #0x70
    str r2, [sp, #0x0]
    add r1, sp, #0x18
    mov r2, r0
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    ldr r0, [r10, #0x28]
    mov r2, #0x810000
    mov r3, #0x1
    bl func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_0215e610
    ldr r2, .L_0215e614
    mov r0, #0x0
    bl func_ov007_0214f3bc
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215e618
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e61c
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e61c
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e61c
    blx func_ov012_021b3fb0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e620
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    mov r1, #0x8
    str r1, [r0, #0x124]
    str r4, [r10, #0x4c]
.L_0215e438:
    ldr r0, [r10, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
.L_0215e460:
    add r9, r10, #0x74
    ldrsb r5, [r9, #0x28]
    ldr r6, .L_0215e608
    ldr r0, [r10, #0x70]
    ldr r1, [r6, r5, lsl #0x3]
    bl func_ov012_021bad40
    ldr r2, .L_0215e624
    ldr r1, .L_0215e628
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_0215e62c
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    mov r7, r0
    bl func_0203b404
    ldr r1, [r0, #0x88]
    ldr r0, .L_0215e628
    ldr r1, [r1, #0x4]
    cmp r7, #0x0
    str r1, [r0, #0x0]
    mov r8, #0x0
    ble .L_0215e5dc
    mov r11, #0x18000
    b .L_0215e5d4
.L_0215e4c4:
    ldr r0, [r10, #0x70]
    ldr r1, [r6, r5, lsl #0x3]
    mov r2, r8
    bl func_ov012_021bad54
    mov r4, r0
    mov r1, #0x0
    ldr r0, .L_0215e630
    mov r2, r1
    blx func_ov012_021c5f88
    bl func_ov007_0214f340
    add r1, r9, r8, lsl #0x2
    str r0, [r1, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, r8, lsl #0x4
    add r0, r0, #0x29
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x10]
    str r11, [sp, #0xc]
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x8]
    add r1, sp, #0xc
    add r2, sp, #0x10
    bl func_ov007_0214f218
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x8]
    add r1, sp, #0x14
    ldr r2, [r0, #0x4]
    mov r0, #0x20000
    str r0, [sp, #0x14]
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x28]
    add r1, r9, r8, lsl #0x2
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0x8]
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xb4]
    blx r2
    ldrb r0, [r10, #0xb4]
    cmp r0, #0x0
    beq .L_0215e5d0
    ldr r0, .L_0215e604
    ldr r0, [r0, #0x0]
    blx r0
.L_0215e5d0:
    add r8, r8, #0x1
.L_0215e5d4:
    cmp r8, r7
    blt .L_0215e4c4
.L_0215e5dc:
    ldr r1, .L_0215e624
    ldr r2, .L_0215e62c
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215e628
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215e604: .word data_020a0e18
.L_0215e608: .word data_ov007_02168ac8
.L_0215e60c: .word data_ov007_02168af8
.L_0215e610: .word data_ov007_0216a4e8
.L_0215e614: .word data_02093c8c
.L_0215e618: .word func_ov007_0215de9c
.L_0215e61c: .word 0x810001
.L_0215e620: .word 0x810002
.L_0215e624: .word data_02093c08
.L_0215e628: .word data_020a0dd0
.L_0215e62c: .word data_020a16d0
.L_0215e630: .word data_ov007_0216a638
    arm_func_end func_ov007_0215e1b0

    .global func_ov007_0215e634
    arm_func_start func_ov007_0215e634
func_ov007_0215e634: ; 0x0215e634
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    ldr r7, [r0, #0x14]
    ldr r9, .L_0215e6a4
    mov r10, #0x9
    mov r5, #0xb
    mov r4, #0x0
    mov r6, #0x3
.L_0215e654:
    mov r8, r6
.L_0215e658:
    str r5, [sp, #0x0]
    str r4, [sp, #0x4]
    str r4, [sp, #0x8]
    ldr r0, [r7, #0x4]
    ldrb r3, [r9], #0x1
    ldr r0, [r0, #0x64]
    mov r1, r8
    ldr ip, [r0, #0x0]
    mov r2, r10
    ldr ip, [ip, #0x60]
    blx ip
    add r8, r8, #0x1
    cmp r8, #0x1c
    ble .L_0215e658
    add r10, r10, #0x1
    cmp r10, #0xb
    ble .L_0215e654
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0215e6a4: .word data_ov007_02168b46
    arm_func_end func_ov007_0215e634

    .global func_ov007_0215e6a8
    arm_func_start func_ov007_0215e6a8
func_ov007_0215e6a8: ; 0x0215e6a8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0205889c
    cmp r0, #0x0
    bne .L_0215e6c4
    bl func_02055684
    b .L_0215e708
.L_0215e6c4:
    cmp r0, #0x8000
    bne .L_0215e6d4
    bl func_02055684
    b .L_0215e708
.L_0215e6d4:
    add r4, r4, #0x1
    sub r1, r4, #0x1
    mov r2, #0x1
    mov r1, r2, lsl r1
    ands r1, r1, r0
    bne .L_0215e708
.L_0215e6ec:
    add r4, r4, #0x1
    cmp r4, #0x10
    movgt r4, r2
    sub r1, r4, #0x1
    mov r1, r2, lsl r1
    ands r1, r1, r0
    beq .L_0215e6ec
.L_0215e708:
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0215e6a8

    .global func_ov007_0215e714
    arm_func_start func_ov007_0215e714
func_ov007_0215e714: ; 0x0215e714
    ldrh r1, [r0, #0x2]
    ldrh r2, [r0, #0x0]
    cmp r1, #0x0
    moveq r3, #0x1
    movne r3, #0x0
    cmp r3, #0x0
    beq .L_0215e74c
    cmp r2, #0x80
    beq .L_0215e770
    cmp r2, #0xe
    bne .L_0215e770
    ldrh r0, [r0, #0x4]
    cmp r0, #0xa
    b .L_0215e770
.L_0215e74c:
    cmp r2, #0xe
    bne .L_0215e770
    cmp r1, #0x9
    beq .L_0215e76c
    cmp r1, #0xd
    beq .L_0215e76c
    cmp r1, #0xf
    bne .L_0215e770
.L_0215e76c:
    mov r3, #0x1
.L_0215e770:
    mov r0, r3
    bx lr
    arm_func_end func_ov007_0215e714

    .global func_ov007_0215e778
    arm_func_start func_ov007_0215e778
func_ov007_0215e778: ; 0x0215e778
    cmp r1, #0x0
    mov r0, #0x1
    bxeq lr
    cmp r1, #0x2
    movne r0, #0x0
    bx lr
    arm_func_end func_ov007_0215e778

    .global func_ov007_0215e790
    arm_func_start func_ov007_0215e790
func_ov007_0215e790: ; 0x0215e790
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0x20]
    str r1, [r0, #0x24]
    bx lr
    arm_func_end func_ov007_0215e790

    .global func_ov007_0215e7a8
    arm_func_start func_ov007_0215e7a8
func_ov007_0215e7a8: ; 0x0215e7a8
    str r1, [r0, #0x4]
    str r2, [r0, #0x8]
    str r3, [r0, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    str r1, [r0, #0x20]
    str r1, [r0, #0x24]
    bx lr
    arm_func_end func_ov007_0215e7a8

    .global func_ov007_0215e7cc
    arm_func_start func_ov007_0215e7cc
func_ov007_0215e7cc: ; 0x0215e7cc
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0, #0x20]
    ldr r3, [r3, #0xc]
    ldr r3, [r3, #0xc]
    cmp r3, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {pc}
    blx r3
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_0215e7cc

    .global func_ov007_0215e7f8
    arm_func_start func_ov007_0215e7f8
func_ov007_0215e7f8: ; 0x0215e7f8
    bx lr
    arm_func_end func_ov007_0215e7f8

    .global func_ov007_0215e7fc
    arm_func_start func_ov007_0215e7fc
func_ov007_0215e7fc: ; 0x0215e7fc
    bx lr
    arm_func_end func_ov007_0215e7fc

    .global func_ov007_0215e800
    arm_func_start func_ov007_0215e800
func_ov007_0215e800: ; 0x0215e800
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r2, [r5, #0x20]
    ldr r2, [r2, #0xc]
    ldr r2, [r2, #0x14]
    blx r2
    movs r4, r0
    beq .L_0215e840
    ldr r0, [r5, #0x20]
    ldr r2, [r0, #0x8]
    cmp r2, #0x0
    beq .L_0215e840
    add r1, r5, #0x10
    mov r0, #0x5
    blx r2
.L_0215e840:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov007_0215e800

    .global func_ov007_0215e84c
    arm_func_start func_ov007_0215e84c
func_ov007_0215e84c: ; 0x0215e84c
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x20]
    ldr r2, [r2, #0xc]
    ldr r2, [r2, #0x10]
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_0215e84c

    .global func_ov007_0215e86c
    arm_func_start func_ov007_0215e86c
func_ov007_0215e86c: ; 0x0215e86c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr r5, [r1, #0x44]
    mov r6, r0
    cmp r5, #0x0
    addeq sp, sp, #0x4
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r4, r0
    mov r9, r0
    add r8, r6, #0x24
    and r7, r5, #0x80000000
    mov r3, #0x1
    ldr r2, .L_0215e938
.L_0215e8a4:
    ldr lr, [r8, #0x4]
    cmp lr, r5
    moveq r4, r8
    beq .L_0215e908
    cmp r7, #0x0
    beq .L_0215e8f8
    ands ip, lr, #0x80000000
    beq .L_0215e8f8
    cmp lr, #0x80000000
    moveq ip, r3
    movne ip, r0
    cmp r5, r2
    bne .L_0215e8ec
    cmp ip, #0x0
    bne .L_0215e8f8
    mov r5, lr
    mov r4, r8
    b .L_0215e908
.L_0215e8ec:
    cmp ip, #0x0
    movne r4, r8
    bne .L_0215e908
.L_0215e8f8:
    add r9, r9, #0x1
    cmp r9, #0x10
    add r8, r8, #0x30
    blt .L_0215e8a4
.L_0215e908:
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r2, [r4, #0xc]
    mov r0, r6
    ldr r2, [r2, #0x8]
    blx r2
    cmp r0, #0x0
    strne r4, [r6, #0x20]
    strne r5, [r6, #0x324]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_0215e938: .word 0x80400120
    arm_func_end func_ov007_0215e86c

    .global func_ov007_0215e93c
    arm_func_start func_ov007_0215e93c
func_ov007_0215e93c: ; 0x0215e93c
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x20]
    ldr r2, [r2, #0xc]
    ldr r2, [r2, #0x4]
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_0215e93c

    .global func_ov007_0215e95c
    arm_func_start func_ov007_0215e95c
func_ov007_0215e95c: ; 0x0215e95c
    stmdb sp!, {r4, r5, r6, lr}
    cmp r1, #0x0
    addeq r1, r0, #0x2f4
    mov r6, r1
    add r4, r0, #0x24
    add r5, r0, #0x324
    mov r0, #0x0
    mov ip, #0x1
.L_0215e97c:
    add r6, r6, #0x30
    cmp r6, r5
    movhs r6, r4
    ldr lr, [r6, #0x4]
    cmp lr, r2
    moveq lr, ip
    movne lr, r0
    cmp r3, #0x0
    beq .L_0215e9a8
    cmp lr, #0x0
    bne .L_0215e9c4
.L_0215e9a8:
    cmp r3, #0x0
    bne .L_0215e9b8
    cmp lr, #0x0
    beq .L_0215e9c4
.L_0215e9b8:
    cmp r6, r1
    bne .L_0215e97c
    mov r6, #0x0
.L_0215e9c4:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_0215e95c

    .global func_ov007_0215e9cc
    arm_func_start func_ov007_0215e9cc
func_ov007_0215e9cc: ; 0x0215e9cc
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr ip, [sp, #0x8]
    str ip, [sp, #0x0]
    ldr ip, [r0, #0x20]
    ldr ip, [ip, #0xc]
    ldr ip, [ip, #0x1c]
    blx ip
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_0215e9cc

    .global func_ov007_0215e9f4
    arm_func_start func_ov007_0215e9f4
func_ov007_0215e9f4: ; 0x0215e9f4
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0, #0x20]
    ldr r3, [r3, #0xc]
    ldr r3, [r3, #0x18]
    blx r3
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_0215e9f4

    .global func_ov007_0215ea14
    arm_func_start func_ov007_0215ea14
func_ov007_0215ea14: ; 0x0215ea14
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215ea5c
    mov r5, r0
    ldr r4, [r1, #0x0]
    cmp r4, #0x0
    beq .L_0215ea50
.L_0215ea30:
    ldr r1, [r4, #0x0]
    mov r0, r5
    bl func_020579ec
    cmp r0, #0x0
    beq .L_0215ea50
    ldr r4, [r4, #0x28]
    cmp r4, #0x0
    bne .L_0215ea30
.L_0215ea50:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215ea5c: .word data_ov007_0216ad7c
    arm_func_end func_ov007_0215ea14

    .global func_ov007_0215ea60
    arm_func_start func_ov007_0215ea60
func_ov007_0215ea60: ; 0x0215ea60
    ldr r1, .L_0215eaa8
    ldr r2, [r1, #0x0]
    cmp r2, #0x0
    streq r0, [r1, #0x0]
    moveq r1, #0x0
    streq r1, [r0, #0x28]
    bxeq lr
    cmp r2, r0
    bxeq lr
    ldr r1, [r2, #0x28]
    cmp r1, #0x0
    streq r0, [r2, #0x28]
    moveq r1, #0x0
    streq r1, [r0, #0x28]
    bxeq lr
    mov r2, r1
    b #-0x24
    bx lr
.L_0215eaa8: .word data_ov007_0216ad7c
    arm_func_end func_ov007_0215ea60

    .global func_ov007_0215eaac
    arm_func_start func_ov007_0215eaac
func_ov007_0215eaac: ; 0x0215eaac
    ldr ip, .L_0215eac4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x4
    str r0, [r1, #0x20]
    bx ip
.L_0215eac4: .word func_0205174c
    arm_func_end func_ov007_0215eaac

    .global func_ov007_0215eac8
    arm_func_start func_ov007_0215eac8
func_ov007_0215eac8: ; 0x0215eac8
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    add r2, r0, #0x5000
    str r1, [r2, #0xf4]
    ldr r1, [r2, #0xf0]
    cmp r1, #0x1
    addeq sp, sp, #0x4
    ldmeqia sp!, {pc}
    ldr r2, [r2, #0xf4]
    cmp r1, r2
    addeq sp, sp, #0x4
    ldmeqia sp!, {pc}
    mov r2, #0x0
    bl func_ov007_0215f994
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_0215eac8

    .global func_ov007_0215eb08
    arm_func_start func_ov007_0215eb08
func_ov007_0215eb08: ; 0x0215eb08
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02055224
    mov r7, r0
    bl func_020584c8
    mov r0, r7
    bl func_0205524c
    ldr r1, .L_0215eb9c
    mov r0, #0x0
    str r8, [r1, #0x0]
    mov r1, r8
    ldr r2, .L_0215eba0
    bl func_0205174c
    add r0, r8, #0x5000
    mov r2, #0x0
    strh r2, [r0, #0xe4]
    mov r3, #0x1
    str r3, [r0, #0xec]
    str r5, [r0, #0xf8]
    strh r4, [r0, #0xe0]
    mov r1, #0x220
    strh r1, [r0, #0xe8]
    mov r1, #0x3dc0
    strh r1, [r0, #0xea]
    str r2, [r0, #0xf0]
    str r6, [r0, #0xfc]
    ldr r1, [r0, #0xfc]
    mov r2, #0x5a
    strh r3, [r1, #0xe]
    ldr r1, [r0, #0xfc]
    strh r2, [r1, #0x18]
    ldr r0, [r0, #0xfc]
    strh r3, [r0, #0x32]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0215eb9c: .word data_ov007_0216ad84
.L_0215eba0: .word 0x5640
    arm_func_end func_ov007_0215eb08

    .global func_ov007_0215eba4
    arm_func_start func_ov007_0215eba4
func_ov007_0215eba4: ; 0x0215eba4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215ee54
    movs r4, r0
    ldr r10, [r1, #0x0]
    beq .L_0215ebd4
    mov r0, r10
    mov r1, r4
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ebd4:
    cmp r4, #0x0
    bne .L_0215ec9c
    ldr r0, .L_0215ee58
    add r1, r10, #0x5000
    mov r2, #0x1
    str r2, [r1, #0xf0]
    mov r2, #0x0
    str r2, [r1, #0x108]
    add r0, r10, r0
    str r0, [r1, #0x5e0]
    add r0, r10, #0x5500
    mov r1, #0x400
    strh r1, [r0, #0xe4]
    bl func_0205889c
    ldr r1, .L_0215ee5c
    add r3, r10, #0x5500
    strh r0, [r1, #0x0]
    ldrh r5, [r1, #0x0]
    ldr r0, .L_0215ee60
    mov r4, #0x6e
    rsb r2, r5, #0x0
    and r2, r5, r2
    strh r2, [r3, #0xe6]
    eor r2, r5, r2
    strh r2, [r1, #0x0]
    add r0, r10, r0
    mov r1, #0xff
    mov r2, #0x6
    strh r4, [r3, #0xe8]
    bl func_020517fc
    ldr r0, .L_0215ee64
    add r3, r10, #0x5500
    mov r1, #0x1
    strh r1, [r3, #0xf0]
    mov r4, #0x0
    add r0, r10, r0
    mov r1, #0xff
    mov r2, #0x20
    strh r4, [r3, #0xf2]
    bl func_020517fc
    ldr r1, .L_0215ee68
    ldr r0, .L_0215ee6c
    add r1, r10, r1
    bl func_02058f88
    mov r2, r0
    mov r0, r10
    mov r1, #0x26
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ec9c:
    ldrh r0, [r4, #0x0]
    cmp r0, #0x26
    bne .L_0215ecf0
    ldrh r0, [r4, #0x8]
    cmp r0, #0x5
    bne .L_0215ecd0
    ldr r0, .L_0215ee58
    mov r1, #0x400
    add r0, r10, r0
    bl func_02053fe4
    ldrh r1, [r4, #0xe]
    add r0, r10, #0x5000
    str r1, [r0, #0x108]
.L_0215ecd0:
    ldr r0, .L_0215ee6c
    bl func_02058f40
    mov r2, r0
    mov r0, r10
    mov r1, #0xb
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ecf0:
    cmp r0, #0xb
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    add r4, r10, #0x5000
    ldr r0, [r4, #0xf4]
    mov r9, #0x0
    cmp r0, #0x5
    bne .L_0215ee10
    ldr r1, [r4, #0x108]
    ldr r0, .L_0215ee58
    mov r8, r9
    cmp r1, #0x0
    add r7, r10, r0
    ble .L_0215edac
    mov r11, r9
    mov r5, #0x6
.L_0215ed30:
    ldrh r1, [r7, #0x0]
    ldrh r0, [r7, #0x3c]
    mov r6, r1, lsl #0x1
    cmp r0, #0x10
    blo .L_0215ed90
    ldrh r0, [r7, #0x40]
    cmp r0, #0x1
    bne .L_0215ed90
    ldr r2, [r4, #0xf8]
    mov r9, r11
    cmp r2, #0x0
    beq .L_0215ed70
    mov r0, r5
    mov r1, r7
    blx r2
    mov r9, r0
.L_0215ed70:
    cmp r9, #0x0
    beq .L_0215ed90
    ldr r1, .L_0215ee70
    mov r0, r7
    add r1, r10, r1
    mov r2, #0xc0
    bl func_02051890
    b .L_0215edac
.L_0215ed90:
    add r0, r6, #0x3
    bic r1, r0, #0x3
    ldr r0, [r4, #0x108]
    add r8, r8, #0x1
    cmp r8, r0
    add r7, r7, r1
    blt .L_0215ed30
.L_0215edac:
    cmp r9, #0x0
    bne .L_0215ee10
    ldr r3, .L_0215ee5c
    ldrh r1, [r3, #0x0]
    rsb r0, r1, #0x0
    ands r5, r1, r0
    beq .L_0215ee10
    add r0, r10, #0x5000
    mov r1, #0x0
    str r1, [r0, #0x108]
    ldrh r4, [r3, #0x0]
    add r1, r10, #0x5500
    ldr r2, .L_0215ee68
    strh r5, [r1, #0xe6]
    eor r4, r4, r5
    ldr r0, .L_0215ee6c
    add r1, r10, r2
    strh r4, [r3, #0x0]
    bl func_02058f88
    mov r2, r0
    mov r0, r10
    mov r1, #0x26
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ee10:
    cmp r9, #0x0
    beq .L_0215ee28
    mov r0, #0x0
    bl func_ov007_0215ef6c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ee28:
    add r0, r10, #0x5000
    ldr r1, [r0, #0xf4]
    mov r2, #0x0
    cmp r1, #0x5
    moveq r1, #0x3
    streq r1, [r0, #0xf4]
    mov r0, r10
    mov r1, #0x3
    bl func_ov007_0215f994
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ee54: .word data_ov007_0216ad84
.L_0215ee58: .word 0x51e0
.L_0215ee5c: .word data_ov007_0216ad80
.L_0215ee60: .word 0x55ea
.L_0215ee64: .word 0x55f4
.L_0215ee68: .word 0x55e0
.L_0215ee6c: .word func_ov007_0215eba4
.L_0215ee70: .word 0x5120
    arm_func_end func_ov007_0215eba4

    .global func_ov007_0215ee74
    arm_func_start func_ov007_0215ee74
func_ov007_0215ee74: ; 0x0215ee74
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r1, .L_0215ef64
    movs r6, r0
    ldr r5, [r1, #0x0]
    mov r4, #0x0
    bne .L_0215eeac
    add r0, r5, #0x5000
    mov r1, #0x1
    str r1, [r0, #0xf0]
    strh r4, [r0, #0xe2]
    mov r1, #0x65
    str r1, [r0, #0x104]
    b .L_0215ef14
.L_0215eeac:
    mov r0, r5
    mov r1, r6
    bl func_ov007_0215fc84
    cmp r0, #0x0
    beq .L_0215ef08
    add r0, r5, #0x5000
    ldrh r1, [r6, #0xa]
    ldr r2, [r0, #0x104]
    ldrh r4, [r6, #0x8]
    cmp r2, r1
    strgt r1, [r0, #0x104]
    strgth r4, [r0, #0xe2]
    bl func_0205889c
    clz r0, r0
    rsb r0, r0, #0x20
    cmp r4, r0
    bne .L_0215ef14
    add r1, r5, #0x5000
    mov r0, #0x0
    str r0, [r1, #0x100]
    bl func_ov007_0215f1f4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_0215ef08:
    add r0, r5, #0x5000
    mov r1, r4
    str r1, [r0, #0x100]
.L_0215ef14:
    add r0, r5, #0x5000
    ldr r0, [r0, #0x100]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov007_0215e6a8
    mov r3, r0
    mov r4, #0x1e
    ldr r0, .L_0215ef68
    mov r1, #0x3
    mov r2, #0x11
    str r4, [sp, #0x0]
    bl func_0205ab10
    mov r2, r0
    mov r0, r5
    mov r1, r4
    bl func_ov007_0215fcb8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_0215ef64: .word data_ov007_0216ad84
.L_0215ef68: .word func_ov007_0215ee74
    arm_func_end func_ov007_0215ee74

    .global func_ov007_0215ef6c
    arm_func_start func_ov007_0215ef6c
func_ov007_0215ef6c: ; 0x0215ef6c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r1, .L_0215f0f0
    movs r5, r0
    ldr r4, [r1, #0x0]
    beq .L_0215ef9c
    mov r0, r4
    mov r1, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, pc}
.L_0215ef9c:
    cmp r5, #0x0
    bne .L_0215f048
    ldr r0, .L_0215f0f4
    add r1, sp, #0x8
    add r0, r4, r0
    mov r2, #0x6
    bl func_02051890
    add r0, r4, #0x5000
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    beq .L_0215efd8
    ldr r1, .L_0215f0f8
    mov r0, #0x9
    add r1, r4, r1
    blx r2
.L_0215efd8:
    ldr r0, .L_0215f0fc
    ldr r1, .L_0215f100
    add r0, r4, r0
    add r1, r4, r1
    mov r2, #0x18
    bl func_02051890
    ldr r1, .L_0215f0f4
    add r0, sp, #0x8
    add r1, r4, r1
    mov r2, #0x6
    bl func_02051890
    ldr r2, .L_0215f0f8
    ldr ip, .L_0215f100
    add r1, r4, #0x5000
    mov r3, #0x1
    str r3, [r1, #0xf0]
    mov r1, #0x0
    str r1, [sp, #0x0]
    add r1, r4, r2
    ldr r0, .L_0215f104
    add r2, r4, ip
    bl func_02058e64
    mov r2, r0
    mov r0, r4
    mov r1, #0xc
    bl func_ov007_0215fcb8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_0215f048:
    ldrh r0, [r5, #0x0]
    cmp r0, #0xc
    bne .L_0215f0bc
    ldrh r1, [r5, #0xa]
    add r0, r4, #0x5000
    add r2, r4, #0x5000
    strh r1, [r0, #0xe4]
    ldr r0, [r0, #0xfc]
    ldr r1, .L_0215f108
    ldrh r0, [r0, #0x16]
    ldrh r3, [r2, #0xe8]
    add r1, r4, r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x10
    str r3, [sp, #0x0]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r2, [r2, #0xea]
    ldr r0, .L_0215f10c
    add r3, r4, #0xf00
    bl func_02059864
    mov r2, r0
    mov r0, r4
    mov r1, #0xe
    bl func_ov007_0215fcb8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_0215f0bc:
    cmp r0, #0xe
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, pc}
    ldrh r0, [r5, #0x4]
    cmp r0, #0xa
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    mov r2, r5
    mov r1, #0x5
    bl func_ov007_0215f994
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_0215f0f0: .word data_ov007_0216ad84
.L_0215f0f4: .word 0x512c
.L_0215f0f8: .word 0x5120
.L_0215f0fc: .word 0x5134
.L_0215f100: .word 0x5624
.L_0215f104: .word func_ov007_0215f110
.L_0215f108: .word 0x1120
.L_0215f10c: .word func_ov007_0215ef6c
    arm_func_end func_ov007_0215ef6c

    .global func_ov007_0215f110
    arm_func_start func_ov007_0215f110
func_ov007_0215f110: ; 0x0215f110
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215f1f0
    mov r5, r0
    ldr r4, [r1, #0x0]
    mov r1, r5
    mov r0, r4
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldrh r0, [r5, #0x8]
    cmp r0, #0x9
    bgt .L_0215f17c
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_0215f1e0
.L_0215f154: ; jump table
    b .L_0215f1e0 ; case 0
    b .L_0215f1e0 ; case 1
    b .L_0215f1e0 ; case 2
    b .L_0215f1e0 ; case 3
    b .L_0215f1e0 ; case 4
    b .L_0215f1e0 ; case 5
    b .L_0215f1e8 ; case 6
    b .L_0215f188 ; case 7
    b .L_0215f1e8 ; case 8
    b .L_0215f1ac ; case 9
.L_0215f17c:
    cmp r0, #0x1a
    beq .L_0215f1ac
    b .L_0215f1e0
.L_0215f188:
    add r0, r4, #0x5000
    ldr r0, [r0, #0xf0]
    cmp r0, #0x5
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, r5
    bl func_ov007_0215ef6c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f1ac:
    add r1, r4, #0x5000
    ldr r0, [r1, #0xf0]
    cmp r0, #0x1
    moveq r0, #0x3
    streq r0, [r1, #0xf4]
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r2, #0x4
    mov r0, #0x0
    str r2, [r1, #0xf4]
    bl func_ov007_0215f488
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f1e0:
    mov r0, r4
    bl func_ov007_0215fe34
.L_0215f1e8:
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f1f0: .word data_ov007_0216ad84
    arm_func_end func_ov007_0215f110

    .global func_ov007_0215f1f4
    arm_func_start func_ov007_0215f1f4
func_ov007_0215f1f4: ; 0x0215f1f4
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r1, .L_0215f348
    movs r5, r0
    ldr r4, [r1, #0x0]
    beq .L_0215f224
    mov r0, r4
    mov r1, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
.L_0215f224:
    cmp r5, #0x0
    bne .L_0215f278
    add r0, r4, #0x5000
    mov r1, #0x1
    str r1, [r0, #0xf0]
    ldrh r1, [r0, #0xe2]
    ldr r0, [r0, #0xfc]
    strh r1, [r0, #0x32]
    bl func_020584c8
    add r1, r4, #0x5000
    ldr r2, [r1, #0xfc]
    strh r0, [r2, #0xc]
    ldr r1, [r1, #0xfc]
    ldr r0, .L_0215f34c
    bl func_02059320
    mov r2, r0
    mov r0, r4
    mov r1, #0x7
    bl func_ov007_0215fcb8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f278:
    ldrh r0, [r5, #0x0]
    cmp r0, #0x7
    bne .L_0215f2a4
    ldr r0, .L_0215f350
    bl func_02059250
    mov r2, r0
    mov r0, r4
    mov r1, #0x8
    bl func_ov007_0215fcb8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f2a4:
    cmp r0, #0x8
    bne .L_0215f314
    add r0, r4, #0x5000
    mov r1, #0x0
    strh r1, [r0, #0xe4]
    strh r1, [r0, #0xe6]
    ldr r0, [r0, #0xfc]
    add r2, r4, #0x5000
    ldrh r0, [r0, #0x16]
    ldrh r3, [r2, #0xe8]
    cmp r0, #0x0
    moveq r1, #0x1
    mov r0, r1, lsl #0x10
    str r3, [sp, #0x0]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldr r1, .L_0215f354
    ldrh r2, [r2, #0xea]
    ldr r0, .L_0215f34c
    add r1, r4, r1
    add r3, r4, #0xf00
    bl func_02059864
    mov r2, r0
    mov r0, r4
    mov r1, #0xe
    bl func_ov007_0215fcb8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f314:
    cmp r0, #0xe
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, pc}
    ldrh r0, [r5, #0x4]
    cmp r0, #0xa
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    bl func_ov007_0215f994
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f348: .word data_ov007_0216ad84
.L_0215f34c: .word func_ov007_0215f1f4
.L_0215f350: .word func_ov007_0215f358
.L_0215f354: .word 0x1120
    arm_func_end func_ov007_0215f1f4

    .global func_ov007_0215f358
    arm_func_start func_ov007_0215f358
func_ov007_0215f358: ; 0x0215f358
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r1, r0
    ldrh r3, [r1, #0x8]
    ldr r2, .L_0215f484
    cmp r3, #0x0
    ldr r4, [r2, #0x0]
    bne .L_0215f384
    bl func_ov007_0215f1f4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f384:
    ldrh r0, [r1, #0x2]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    cmp r3, #0x7
    bgt .L_0215f3d8
    cmp r3, #0x7
    bge .L_0215f3f8
    cmp r3, #0x2
    addgt sp, sp, #0x4
    ldmgtia sp!, {r4, r5, pc}
    cmp r3, #0x0
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, pc}
    cmp r3, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    cmp r3, #0x2
    beq .L_0215f45c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f3d8:
    cmp r3, #0x9
    bgt .L_0215f3ec
    add sp, sp, #0x4
    cmp r3, #0x9
    ldmia sp!, {r4, r5, pc}
.L_0215f3ec:
    add sp, sp, #0x4
    cmp r3, #0x1a
    ldmia sp!, {r4, r5, pc}
.L_0215f3f8:
    add r0, r4, #0x5000
    ldrh r0, [r0, #0xe6]
    add r2, r4, #0x5000
    mov r3, #0x1
    cmp r0, #0x0
    ldrh r0, [r1, #0x10]
    moveq r5, #0x1
    movne r5, #0x0
    mov r0, r3, lsl r0
    ldrh r3, [r2, #0xe6]
    mov r0, r0, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    strh r0, [r2, #0xe6]
    ldr r2, [r2, #0xf8]
    cmp r2, #0x0
    beq .L_0215f440
    mov r0, #0xa
    blx r2
.L_0215f440:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, r4
    bl func_ov007_0215fbb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f45c:
    add r0, r4, #0x5000
    ldr r2, [r0, #0xf8]
    ldr r1, [r0, #0xfc]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x5
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f484: .word data_ov007_0216ad84
    arm_func_end func_ov007_0215f358

    .global func_ov007_0215f488
    arm_func_start func_ov007_0215f488
func_ov007_0215f488: ; 0x0215f488
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215f51c
    movs r5, r0
    ldr r4, [r1, #0x0]
    beq .L_0215f4b8
    mov r0, r4
    mov r1, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
.L_0215f4b8:
    cmp r5, #0x0
    bne .L_0215f4ec
    ldr r0, .L_0215f520
    add r1, r4, #0x5000
    mov r2, #0x1
    str r2, [r1, #0xf0]
    bl func_02059470
    mov r2, r0
    mov r0, r4
    mov r1, #0x1
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f4ec:
    ldrh r0, [r5, #0x0]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    add r3, r4, #0x5000
    mov r2, #0x0
    mov r1, #0x3
    strh r2, [r3, #0xe4]
    bl func_ov007_0215f994
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f51c: .word data_ov007_0216ad84
.L_0215f520: .word func_ov007_0215f488
    arm_func_end func_ov007_0215f488

    .global func_ov007_0215f524
    arm_func_start func_ov007_0215f524
func_ov007_0215f524: ; 0x0215f524
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215f5d8
    movs r5, r0
    ldr r4, [r1, #0x0]
    beq .L_0215f554
    mov r0, r4
    mov r1, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
.L_0215f554:
    cmp r5, #0x0
    bne .L_0215f588
    ldr r0, .L_0215f5dc
    add r1, r4, #0x5000
    mov r2, #0x1
    str r2, [r1, #0xf0]
    bl func_020595a8
    mov r2, r0
    mov r0, r4
    mov r1, #0x4
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f588:
    ldrh r0, [r5, #0x0]
    cmp r0, #0x4
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    bl func_0205822c
    mov r2, r0
    mov r0, r4
    mov r1, #0x2
    bl func_ov007_0215fcb8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r1, #0x0
    ldr r3, .L_0215f5d8
    mov r0, r4
    mov r2, r1
    str r1, [r3, #0x0]
    bl func_ov007_0215f994
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f5d8: .word data_ov007_0216ad84
.L_0215f5dc: .word func_ov007_0215f524
    arm_func_end func_ov007_0215f524

    .global func_ov007_0215f5e0
    arm_func_start func_ov007_0215f5e0
func_ov007_0215f5e0: ; 0x0215f5e0
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215f66c
    movs r5, r0
    ldr r4, [r1, #0x0]
    beq .L_0215f610
    mov r0, r4
    mov r1, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
.L_0215f610:
    cmp r5, #0x0
    bne .L_0215f644
    ldr r0, .L_0215f670
    add r1, r4, #0x5000
    mov r2, #0x1
    str r2, [r1, #0xf0]
    bl func_02059518
    mov r2, r0
    mov r0, r4
    mov r1, #0x6
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f644:
    ldrh r0, [r5, #0x0]
    cmp r0, #0x6
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov007_0215f994
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f66c: .word data_ov007_0216ad84
.L_0215f670: .word func_ov007_0215f5e0
    arm_func_end func_ov007_0215f5e0

    .global func_ov007_0215f674
    arm_func_start func_ov007_0215f674
func_ov007_0215f674: ; 0x0215f674
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215f700
    movs r5, r0
    ldr r4, [r1, #0x0]
    beq .L_0215f6a4
    mov r0, r4
    mov r1, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
.L_0215f6a4:
    cmp r5, #0x0
    bne .L_0215f6d8
    ldr r0, .L_0215f704
    add r1, r4, #0x5000
    mov r2, #0x1
    str r2, [r1, #0xf0]
    bl func_02059560
    mov r2, r0
    mov r0, r4
    mov r1, #0x5
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f6d8:
    ldrh r0, [r5, #0x0]
    cmp r0, #0x5
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, r4
    mov r1, #0x3
    mov r2, #0x0
    bl func_ov007_0215f994
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f700: .word data_ov007_0216ad84
.L_0215f704: .word func_ov007_0215f674
    arm_func_end func_ov007_0215f674

    .global func_ov007_0215f708
    arm_func_start func_ov007_0215f708
func_ov007_0215f708: ; 0x0215f708
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0215f804
    movs r5, r0
    ldr r4, [r1, #0x0]
    beq .L_0215f738
    mov r0, r4
    mov r1, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
.L_0215f738:
    cmp r5, #0x0
    bne .L_0215f78c
    add r0, r4, #0x5000
    mov r1, #0x1
    str r1, [r0, #0x100]
    str r1, [r0, #0xf0]
    ldrh r1, [r0, #0xe0]
    mov r0, r4
    bl func_02058494
    mov r2, r0
    mov r0, r4
    mov r1, #0x0
    bl func_ov007_0215fcb8
    ldr r0, .L_0215f808
    bl func_020595f0
    mov r2, r0
    mov r0, r4
    mov r1, #0x3
    bl func_ov007_0215fcb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f78c:
    ldrh r0, [r5, #0x0]
    cmp r0, #0x3
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    ldr r0, .L_0215f80c
    bl func_02058c74
    mov r2, r0
    mov r0, r4
    mov r1, #0x80
    bl func_ov007_0215fcb8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, .L_0215f810
    mov r0, #0x4
    mov r2, #0x0
    bl func_02058b94
    mov r2, r0
    mov r0, r4
    mov r1, #0x81
    bl func_ov007_0215fcb8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov007_0215f994
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215f804: .word data_ov007_0216ad84
.L_0215f808: .word func_ov007_0215f708
.L_0215f80c: .word func_ov007_0215f92c
.L_0215f810: .word func_ov007_0215f814
    arm_func_end func_ov007_0215f708

    .global func_ov007_0215f814
    arm_func_start func_ov007_0215f814
func_ov007_0215f814: ; 0x0215f814
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r1, .L_0215f928
    mov r4, r0
    ldr r5, [r1, #0x0]
    mov r1, r4
    mov r0, r5
    bl func_ov007_0215fc84
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
    ldrh r0, [r4, #0x4]
    cmp r0, #0x15
    bgt .L_0215f888
    cmp r0, #0x15
    bge .L_0215f898
    cmp r0, #0x9
    addgt sp, sp, #0xc
    ldmgtia sp!, {r4, r5, pc}
    cmp r0, #0x7
    addlt sp, sp, #0xc
    ldmltia sp!, {r4, r5, pc}
    cmp r0, #0x7
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
    cmp r0, #0x9
    beq .L_0215f8e0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f888:
    cmp r0, #0x1a
    beq .L_0215f8e0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f898:
    ldrh r1, [r4, #0x12]
    mov r2, #0x1
    add r0, r5, #0x5000
    mov r1, r2, lsl r1
    strh r1, [sp, #0x6]
    ldrh r1, [r4, #0x10]
    strh r1, [sp, #0x4]
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
    add r1, sp, #0x0
    mov r0, #0x8
    blx r2
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f8e0:
    ldrh r0, [r4, #0x12]
    add r1, r5, #0x5000
    mov r3, #0x1
    mvn r0, r3, lsl r0
    ldrh r2, [r1, #0xe6]
    mov r0, r0, lsl #0x10
    and r0, r2, r0, lsr #0x10
    strh r0, [r1, #0xe6]
    ldr r2, [r1, #0xf8]
    ldrh r0, [r4, #0x12]
    cmp r2, #0x0
    addeq sp, sp, #0xc
    mov r1, r3, lsl r0
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0xb
    blx r2
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0215f928: .word data_ov007_0216ad84
    arm_func_end func_ov007_0215f814

    .global func_ov007_0215f92c
    arm_func_start func_ov007_0215f92c
func_ov007_0215f92c: ; 0x0215f92c
    ldrh r1, [r0, #0x2]
    ldr r0, .L_0215f950
    ldr r0, [r0, #0x0]
    cmp r1, #0x8
    addeq r0, r0, #0x5000
    moveq r1, #0x6
    streq r1, [r0, #0xf4]
    streq r1, [r0, #0xf0]
    bx lr
.L_0215f950: .word data_ov007_0216ad84
    arm_func_end func_ov007_0215f92c

    .global func_ov007_0215f954
    arm_func_start func_ov007_0215f954
func_ov007_0215f954: ; 0x0215f954
    stmdb sp!, {r4, lr}
    ldr r2, .L_0215f990
    mov r1, r0
    ldr r4, [r2, #0x0]
    mov r0, r4
    bl func_ov007_0215fc84
    add r0, r4, #0x5000
    mov r1, #0x0
    str r1, [r0, #0xec]
    ldrh r0, [r0, #0xe6]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov007_0215fbb8
    ldmia sp!, {r4, pc}
.L_0215f990: .word data_ov007_0216ad84
    arm_func_end func_ov007_0215f954

    .global func_ov007_0215f994
    arm_func_start func_ov007_0215f994
func_ov007_0215f994: ; 0x0215f994
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    add r0, r5, #0x5000
    str r1, [r0, #0xf0]
    ldr r3, [r0, #0xf4]
    mov r4, r2
    cmp r3, r1
    bne .L_0215fac4
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_0215fbb0
.L_0215f9c4: ; jump table
    b .L_0215f9dc ; case 0
    b .L_0215fbb0 ; case 1
    b .L_0215fa00 ; case 2
    b .L_0215fa24 ; case 3
    b .L_0215fa48 ; case 4
    b .L_0215fa70 ; case 5
.L_0215f9dc:
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x0
    mov r1, r0
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fa00:
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x2
    mov r1, #0x0
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fa24:
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x1
    mov r1, #0x0
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fa48:
    mov r1, #0x0
    str r1, [r0, #0xec]
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x3
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fa70:
    mov r1, #0x0
    str r1, [r0, #0xec]
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    beq .L_0215fa8c
    mov r0, #0x4
    blx r2
.L_0215fa8c:
    add r0, r5, #0x5000
    ldrh r1, [r0, #0xe6]
    orr r1, r1, #0x1
    strh r1, [r0, #0xe6]
    ldr r2, [r0, #0xf8]
    cmp r2, #0x0
    beq .L_0215fab4
    mov r1, r4
    mov r0, #0xa
    blx r2
.L_0215fab4:
    mov r0, r5
    bl func_ov007_0215fbb8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fac4:
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_0215fbb0
.L_0215fad0: ; jump table
    b .L_0215fae8 ; case 0
    b .L_0215fbb0 ; case 1
    b .L_0215faf8 ; case 2
    b .L_0215fb3c ; case 3
    b .L_0215fba8 ; case 4
    b .L_0215fba8 ; case 5
.L_0215fae8:
    mov r0, #0x0
    bl func_ov007_0215f708
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215faf8:
    cmp r3, #0x5
    addls pc, pc, r3, lsl #0x2
    b .L_0215fbb0
.L_0215fb04: ; jump table
    b .L_0215fb1c ; case 0
    b .L_0215fbb0 ; case 1
    b .L_0215fbb0 ; case 2
    b .L_0215fb2c ; case 3
    b .L_0215fb2c ; case 4
    b .L_0215fb2c ; case 5
.L_0215fb1c:
    mov r0, #0x0
    bl func_ov007_0215f524
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fb2c:
    mov r0, #0x0
    bl func_ov007_0215f674
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fb3c:
    cmp r3, #0x5
    addls pc, pc, r3, lsl #0x2
    b .L_0215fbb0
.L_0215fb48: ; jump table
    b .L_0215fb60 ; case 0
    b .L_0215fbb0 ; case 1
    b .L_0215fb60 ; case 2
    b .L_0215fbb0 ; case 3
    b .L_0215fb70 ; case 4
    b .L_0215fb98 ; case 5
.L_0215fb60:
    mov r0, #0x0
    bl func_ov007_0215f5e0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fb70:
    mov r1, #0x1
    str r1, [r0, #0x100]
    ldr r0, [r0, #0x100]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x0
    bl func_ov007_0215ee74
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fb98:
    mov r0, #0x0
    bl func_ov007_0215eba4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0215fba8:
    mov r0, #0x0
    bl func_ov007_0215f488
.L_0215fbb0:
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov007_0215f994

    .global func_ov007_0215fbb8
    arm_func_start func_ov007_0215fbb8
func_ov007_0215fbb8: ; 0x0215fbb8
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r0
    add r0, r4, #0x5000
    ldr r1, [r0, #0xec]
    cmp r1, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, pc}
    ldrh r1, [r0, #0xe4]
    cmp r1, #0x0
    ldreq r0, [r0, #0xfc]
    add r1, r4, #0x5000
    ldreqh r5, [r0, #0x34]
    addne r0, r4, #0x5100
    ldrh r2, [r1, #0xe6]
    ldrneh r5, [r0, #0x6e]
    ldr r0, .L_0215fc7c
    add r0, r4, r0
    strh r5, [sp, #0x10]
    str r0, [sp, #0xc]
    strh r2, [sp, #0x12]
    ldr r2, [r1, #0xf8]
    cmp r2, #0x0
    beq .L_0215fc24
    add r1, sp, #0xc
    mov r0, #0x7
    blx r2
.L_0215fc24:
    ldrh r3, [sp, #0x10]
    cmp r3, r5
    addhi sp, sp, #0x14
    ldmhiia sp!, {r4, r5, pc}
    ldrh r2, [sp, #0x12]
    mov r1, #0x4
    mov r0, #0x2
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr r0, .L_0215fc80
    mov r1, #0x0
    bl func_020596e8
    mov r2, r0
    mov r0, r4
    mov r1, #0xf
    bl func_ov007_0215fcb8
    add r1, r4, #0x5000
    str r0, [r1, #0xec]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_0215fc7c: .word 0x4ee0
.L_0215fc80: .word func_ov007_0215f954
    arm_func_end func_ov007_0215fbb8

    .global func_ov007_0215fc84
    arm_func_start func_ov007_0215fc84
func_ov007_0215fc84: ; 0x0215fc84
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r0, r5
    bl func_ov007_0215e714
    movs r4, r0
    bne .L_0215fcb0
    ldrh r1, [r5, #0x0]
    ldrh r2, [r5, #0x2]
    mov r0, r6
    bl func_ov007_0215fcfc
.L_0215fcb0:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_0215fc84

    .global func_ov007_0215fcb8
    arm_func_start func_ov007_0215fcb8
func_ov007_0215fcb8: ; 0x0215fcb8
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r1
    mov r5, r2
    mov r7, r0
    mov r0, r6
    mov r1, r5
    bl func_ov007_0215e778
    movs r4, r0
    bne .L_0215fcf0
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov007_0215fcfc
.L_0215fcf0:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
    arm_func_end func_ov007_0215fcb8

    .global func_ov007_0215fcfc
    arm_func_start func_ov007_0215fcfc
func_ov007_0215fcfc: ; 0x0215fcfc
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {pc}
    cmp r1, #0x26
    bgt .L_0215fda8
    cmp r1, #0x26
    bge .L_0215fde0
    cmp r1, #0x1e
    addls pc, pc, r1, lsl #0x2
    b .L_0215fdc8
.L_0215fd2c: ; jump table
    b .L_0215fdc8 ; case 0
    b .L_0215fdd4 ; case 1
    b .L_0215fdc8 ; case 2
    b .L_0215fdd4 ; case 3
    b .L_0215fdd4 ; case 4
    b .L_0215fdd4 ; case 5
    b .L_0215fdd4 ; case 6
    b .L_0215fde0 ; case 7
    b .L_0215fde0 ; case 8
    b .L_0215fdc8 ; case 9
    b .L_0215fdc8 ; case 10
    b .L_0215fde0 ; case 11
    b .L_0215fdec ; case 12
    b .L_0215fde0 ; case 13
    b .L_0215fde0 ; case 14
    b .L_0215fe2c ; case 15
    b .L_0215fdc8 ; case 16
    b .L_0215fdc8 ; case 17
    b .L_0215fdc8 ; case 18
    b .L_0215fdc8 ; case 19
    b .L_0215fdc8 ; case 20
    b .L_0215fdc8 ; case 21
    b .L_0215fdc8 ; case 22
    b .L_0215fdc8 ; case 23
    b .L_0215fdc8 ; case 24
    b .L_0215fdc8 ; case 25
    b .L_0215fdc8 ; case 26
    b .L_0215fdc8 ; case 27
    b .L_0215fdc8 ; case 28
    b .L_0215fdc8 ; case 29
    b .L_0215fde0 ; case 30
.L_0215fda8:
    cmp r1, #0x80
    bgt .L_0215fdbc
    cmp r1, #0x80
    beq .L_0215fe28
    b .L_0215fdc8
.L_0215fdbc:
    cmp r1, #0x81
    addeq sp, sp, #0x4
    ldmeqia sp!, {pc}
.L_0215fdc8:
    bl func_ov007_0215fe34
    add sp, sp, #0x4
    ldmia sp!, {pc}
.L_0215fdd4:
    bl func_ov007_0215fe34
    add sp, sp, #0x4
    ldmia sp!, {pc}
.L_0215fde0:
    bl func_ov007_0215fe34
    add sp, sp, #0x4
    ldmia sp!, {pc}
.L_0215fdec:
    cmp r2, #0x1
    beq .L_0215fe00
    sub r1, r2, #0xb
    cmp r1, #0x1
    bhi .L_0215fe1c
.L_0215fe00:
    add r2, r0, #0x5000
    mov r3, #0x5
    mov r1, #0x3
    str r3, [r2, #0xf0]
    bl func_ov007_0215eac8
    add sp, sp, #0x4
    ldmia sp!, {pc}
.L_0215fe1c:
    bl func_ov007_0215fe34
    add sp, sp, #0x4
    ldmia sp!, {pc}
.L_0215fe28:
    bl func_ov007_0215fe34
.L_0215fe2c:
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_0215fcfc

    .global func_ov007_0215fe34
    arm_func_start func_ov007_0215fe34
func_ov007_0215fe34: ; 0x0215fe34
    add r1, r0, #0x5000
    ldr r2, [r1, #0xf0]
    ldr ip, .L_0215fe54
    cmp r2, #0x1
    ldreq r2, [r1, #0xf4]
    streq r2, [r1, #0xf0]
    mov r1, #0x0
    bx ip
.L_0215fe54: .word func_ov007_0215eac8
    arm_func_end func_ov007_0215fe34

    .global func_ov007_0215fe58
    arm_func_start func_ov007_0215fe58
func_ov007_0215fe58: ; 0x0215fe58
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    add r0, r0, #0x1
    str r0, [r4, #0x0]
    ldr r0, [r4, #0x0]
    cmp r0, #0x4
    blt .L_0215febc
    mov r1, #0x0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x4]
    cmp r0, #0x4
    strge r1, [r4, #0x4]
    ldr r1, [r4, #0x4]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_0215febc
    bl func_02054b44
    and r0, r0, #0x3
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    str r0, [r4, #0x4]
.L_0215febc:
    ldr r1, [r4, #0x4]
    ldr r0, [r4, #0x0]
    add r1, r4, r1, lsl #0x4
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_0215fee8
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_0215fee8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0215fe58

    .global func_ov007_0215fef0
    arm_func_start func_ov007_0215fef0
func_ov007_0215fef0: ; 0x0215fef0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02054b44
    and r0, r0, #0x3
    str r0, [r4, #0x0]
    bl func_02054b44
    mov r0, r0, lsr #0x2
    orr r0, r0, r1, lsl #0x1e
    and r0, r0, #0x3
    str r0, [r4, #0x4]
    mov r3, #0x0
    str r3, [r4, #0x8]
    ldr r0, .L_0215ff38
    add r1, r4, #0x10
    mov r2, #0x40
    str r3, [r4, #0xc]
    bl func_02051760
    ldmia sp!, {r4, pc}
.L_0215ff38: .word data_ov007_02168b94
    arm_func_end func_ov007_0215fef0

    .global func_ov007_0215ff3c
    arm_func_start func_ov007_0215ff3c
func_ov007_0215ff3c: ; 0x0215ff3c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl func_02055238
    ldr r2, .L_02160008
    ldr r1, .L_0216000c
    ldr r2, [r2, #0x0]
    mov r5, r0
    add r0, r2, r1
    mov r1, #0x0
    mov r2, r9
    mov r3, #0x1
    bl func_ov007_0215e95c
    cmp r0, #0x0
    bne .L_0215fff8
    ldr r0, .L_02160008
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    ldr r0, .L_0216000c
    mov r2, r1
    add r0, r3, r0
    mov r3, #0x1
    bl func_ov007_0215e95c
    movs r4, r0
    bne .L_0215ffb4
    bl func_02055684
    b .L_0215fff8
.L_0215ffb4:
    ldr r0, [sp, #0x30]
    bl func_ov007_0215ea14
    movs r10, r0
    bne .L_0215ffc8
    bl func_02055684
.L_0215ffc8:
    mov r0, r4
    mov r1, r9
    mov r2, r8
    mov r3, r10
    bl func_ov007_0215e7a8
    ldr r8, [sp, #0x2c]
    ldr r3, [sp, #0x28]
    mov r0, r4
    mov r1, r7
    mov r2, r6
    str r8, [sp, #0x0]
    bl func_ov007_0215e790
.L_0215fff8:
    mov r0, r5
    bl func_0205524c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02160008: .word data_ov007_0216ad8c
.L_0216000c: .word 0x5760
    arm_func_end func_ov007_0215ff3c

    .global func_ov007_02160010
    arm_func_start func_ov007_02160010
func_ov007_02160010: ; 0x02160010
    ldr r0, .L_0216003c
    ldr r0, [r0, #0x0]
    add r1, r0, #0x5200
    ldrh r0, [r1, #0x6]
    cmp r0, #0x0
    ldrneh r1, [r1, #0x4]
    movne r2, #0x1
    orrne r0, r0, r2, lsl r1
    movne r0, r0, lsl #0x10
    movne r0, r0, lsr #0x10
    bx lr
.L_0216003c: .word data_ov007_0216ad8c
    arm_func_end func_ov007_02160010

    .global func_ov007_02160040
    arm_func_start func_ov007_02160040
func_ov007_02160040: ; 0x02160040
    ldr r0, .L_02160060
    ldr r0, [r0, #0x0]
    add r0, r0, #0x5000
    ldr r0, [r0, #0x210]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_02160060: .word data_ov007_0216ad8c
    arm_func_end func_ov007_02160040

    .global func_ov007_02160064
    arm_func_start func_ov007_02160064
func_ov007_02160064: ; 0x02160064
    ldr r0, .L_02160070
    ldr r0, [r0, #0x0]
    bx lr
.L_02160070: .word data_ov007_0216ad88
    arm_func_end func_ov007_02160064

    .global func_ov007_02160074
    arm_func_start func_ov007_02160074
func_ov007_02160074: ; 0x02160074
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_02055238
    mov r4, r0
    bl func_ov007_02160064
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_021600fc
.L_02160094: ; jump table
    b .L_021600fc ; case 0
    b .L_021600fc ; case 1
    b .L_021600a4 ; case 2
    b .L_021600a4 ; case 3
.L_021600a4:
    bl func_02055238
    ldr r1, .L_0216010c
    mov r5, r0
    ldr r2, .L_02160110
    mov r0, #0x1
    ldr r1, [r1, #0x0]
    str r0, [r2, #0x0]
    ldr r2, [r1, #0x4]
    cmp r2, #0x0
    beq .L_021600d4
    mov r1, #0x0
    blx r2
.L_021600d4:
    mov r0, r5
    bl func_0205524c
    bl func_ov007_02160010
    cmp r0, #0x0
    bne .L_021600fc
    ldr r0, .L_0216010c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
.L_021600fc:
    mov r0, r4
    bl func_0205524c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0216010c: .word data_ov007_0216ad8c
.L_02160110: .word data_ov007_0216ad88
    arm_func_end func_ov007_02160074

    .global func_ov007_02160114
    arm_func_start func_ov007_02160114
func_ov007_02160114: ; 0x02160114
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_02055238
    mov r4, r0
    bl func_ov007_02160064
    cmp r0, #0x2
    bne .L_0216017c
    ldr r0, .L_0216018c
    mov r1, #0x3
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    bl func_02055238
    ldr r1, .L_0216018c
    mov r5, r0
    ldr r2, .L_02160190
    mov r0, #0x3
    ldr r1, [r1, #0x0]
    str r0, [r2, #0x0]
    ldr r2, [r1, #0x4]
    cmp r2, #0x0
    beq .L_02160174
    mov r1, #0x0
    blx r2
.L_02160174:
    mov r0, r5
    bl func_0205524c
.L_0216017c:
    mov r0, r4
    bl func_0205524c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0216018c: .word data_ov007_0216ad8c
.L_02160190: .word data_ov007_0216ad88
    arm_func_end func_ov007_02160114

    .global func_ov007_02160194
    arm_func_start func_ov007_02160194
func_ov007_02160194: ; 0x02160194
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r5, r1
    mov r6, r2
    bl func_02055238
    mov r4, r0
    bl func_ov007_02160064
    cmp r0, #0x0
    bne .L_02160298
    ands r0, r7, #0x1f
    beq .L_021601c8
    bl func_02055684
.L_021601c8:
    ldr r3, .L_021602a8
    ldr r2, .L_021602ac
    mov r1, r7
    mov r0, #0x0
    str r7, [r3, #0x0]
    bl func_0205174c
    ldr r0, .L_021602a8
    ldr r1, [r0, #0x0]
    str r6, [r1, #0x0]
    ldr r1, [r0, #0x0]
    str r5, [r1, #0x4]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x8
    bl func_ov007_0215fef0
    ldr r1, .L_021602a8
    ldr r0, .L_021602b0
    ldr r1, [r1, #0x0]
    add r0, r1, r0
    bl func_ov007_0215eaac
    ldr r1, .L_021602a8
    mov r5, #0x1
    ldr r0, [r1, #0x0]
    mov r3, #0x200
    strh r5, [r0, #0xf0]
    ldr r0, [r1, #0x0]
    ldr r2, .L_021602b4
    add r0, r0, #0x100
    strh r3, [r0, #0x14]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x100
    strh r3, [r0, #0x16]
    ldr r0, [r1, #0x0]
    strh r5, [r0, #0xf6]
    ldr r3, [r1, #0x0]
    add r0, r3, #0x120
    add r1, r3, #0xe0
    ldr r3, [r3, #0x0]
    bl func_ov007_0215eb08
    bl func_02055238
    mov r5, r0
    mov r0, #0x2
    ldr r2, .L_021602b8
    ldr r1, .L_021602a8
    str r0, [r2, #0x0]
    ldr r1, [r1, #0x0]
    ldr r2, [r1, #0x4]
    cmp r2, #0x0
    beq .L_02160290
    mov r1, #0x0
    blx r2
.L_02160290:
    mov r0, r5
    bl func_0205524c
.L_02160298:
    mov r0, r4
    bl func_0205524c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_021602a8: .word data_ov007_0216ad8c
.L_021602ac: .word 0x5a88
.L_021602b0: .word 0x5760
.L_021602b4: .word func_ov007_021602bc
.L_021602b8: .word data_ov007_0216ad88
    arm_func_end func_ov007_02160194

    .global func_ov007_021602bc
    arm_func_start func_ov007_021602bc
func_ov007_021602bc: ; 0x021602bc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r5, r1
    cmp r0, #0xb
    mov r4, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_02160854
.L_021602d8: ; jump table
    b .L_02160404 ; case 0
    b .L_02160498 ; case 1
    b .L_02160450 ; case 2
    b .L_0216053c ; case 3
    b .L_0216053c ; case 4
    b .L_02160308 ; case 5
    b .L_021603a8 ; case 6
    b .L_021607e4 ; case 7
    b .L_021607fc ; case 8
    b .L_021605b8 ; case 9
    b .L_021605d4 ; case 10
    b .L_02160768 ; case 11
.L_02160308:
    ldr r0, .L_02160864
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0xd8]
    cmp r0, #0x0
    bne .L_02160858
    bl func_ov007_02160064
    cmp r0, #0x3
    bne .L_02160858
    ldr r1, .L_02160864
    ldr r0, .L_02160868
    ldr r1, [r1, #0x0]
    add r0, r1, r0
    add r1, r1, #0xe0
    bl func_ov007_0215e93c
    ldr r1, .L_02160864
    ldr r2, [r1, #0x0]
    add r0, r2, #0x5200
    ldrh r0, [r0, #0x6]
    cmp r0, #0x0
    bne .L_02160858
    ldrb r0, [r2, #0xdc]
    add r0, r0, #0x1
    strb r0, [r2, #0xdc]
    ldr r2, [r1, #0x0]
    ldrb r0, [r2, #0xdc]
    cmp r0, #0xa
    bls .L_02160858
    mov r0, r4
    strb r0, [r2, #0xdc]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x8
    bl func_ov007_0215fe58
    cmp r0, #0x0
    bne .L_02160858
    ldr r0, .L_02160864
    mov r1, #0x5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    b .L_02160858
.L_021603a8:
    ldr r2, .L_02160864
    ldr r0, .L_02160868
    ldr r2, [r2, #0x0]
    str r5, [sp, #0xc]
    add r0, r2, r0
    bl func_ov007_0215e86c
    ldr r1, .L_02160864
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x0]
    add r1, sp, #0x8
    ldr r2, [r0, #0x4]
    mov r0, #0x6
    blx r2
    ldr r4, [sp, #0x8]
    cmp r4, #0x0
    beq .L_02160858
    ldr r0, .L_02160864
    ldr r1, [r0, #0x0]
    add r0, r1, #0x5000
    ldr r0, [r0, #0x780]
    ldr r0, [r0, #0x4]
    str r0, [r1, #0xe8]
    b .L_02160858
.L_02160404:
    ldr r0, .L_02160864
    ldr r1, [r0, #0x0]
    str r4, [r1, #0xd8]
    ldr r6, [r0, #0x0]
    bl func_02055238
    ldr r1, .L_02160864
    mov r5, r0
    ldr r2, .L_0216086c
    mov r0, r4
    ldr r1, [r1, #0x0]
    str r0, [r2, #0x0]
    ldr r2, [r1, #0x4]
    cmp r2, #0x0
    beq .L_02160444
    mov r1, r6
    blx r2
.L_02160444:
    mov r0, r5
    bl func_0205524c
    b .L_02160858
.L_02160450:
    ldr r0, .L_02160864
    ldr r0, [r0, #0x0]
    str r4, [r0, #0xd8]
    bl func_02055238
    ldr r1, .L_02160864
    mov r5, r0
    ldr r2, .L_0216086c
    mov r0, #0x2
    ldr r1, [r1, #0x0]
    str r0, [r2, #0x0]
    ldr r2, [r1, #0x4]
    cmp r2, #0x0
    beq .L_0216048c
    mov r1, r4
    blx r2
.L_0216048c:
    mov r0, r5
    bl func_0205524c
    b .L_02160858
.L_02160498:
    bl func_ov007_02160064
    cmp r0, #0x3
    beq .L_021604bc
    ldr r0, .L_02160864
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    b .L_02160858
.L_021604bc:
    ldr r0, .L_02160864
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0xd8]
    cmp r0, #0x0
    beq .L_021604e0
    add r0, r1, #0x120
    mov r1, #0x2
    bl func_ov007_0215eac8
    b .L_02160858
.L_021604e0:
    add r0, r1, #0x8
    bl func_ov007_0215fe58
    cmp r0, #0x0
    beq .L_02160524
    bl func_ov007_02160874
    ldr r1, .L_02160864
    ldr r0, .L_02160868
    ldr r1, [r1, #0x0]
    add r0, r1, r0
    add r1, r1, #0xe0
    bl func_ov007_0215e93c
    ldr r0, .L_02160864
    mov r1, #0x4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    b .L_02160858
.L_02160524:
    ldr r0, .L_02160864
    mov r1, #0x5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    b .L_02160858
.L_0216053c:
    bl func_ov007_02160064
    cmp r0, #0x3
    beq .L_02160560
    ldr r0, .L_02160864
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    b .L_02160580
.L_02160560:
    ldr r0, .L_02160864
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0xd8]
    cmp r0, #0x0
    beq .L_02160580
    add r0, r1, #0x120
    mov r1, #0x2
    bl func_ov007_0215eac8
.L_02160580:
    ldr r0, .L_02160864
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    strb r2, [r1, #0xdc]
    ldr r1, [r0, #0x0]
    add r0, r1, #0x5200
    ldrh r3, [r0, #0x4]
    add r2, r1, #0x58
    add r0, r2, r3, lsl #0x3
    mov r1, r3, lsl #0x3
    add r0, r0, #0x2
    strh r3, [r2, r1]
    bl func_020554a8
    b .L_02160858
.L_021605b8:
    ldr r2, .L_02160864
    ldr r0, .L_02160868
    ldr r3, [r2, #0x0]
    add r2, r5, #0x14
    add r0, r3, r0
    bl func_ov007_0215e7cc
    b .L_02160858
.L_021605d4:
    ldr r0, .L_02160864
    ldr r0, [r0, #0x0]
    add r0, r0, #0x5000
    ldr r7, [r0, #0x780]
    bl func_ov007_02160040
    movs r10, r0
    ldreq r0, .L_02160864
    ldreq r1, [r0, #0x0]
    addeq r0, r1, #0x5200
    ldreqh r0, [r0, #0x8c]
    streq r0, [sp, #0x4]
    beq .L_02160618
    ldr r0, .L_02160864
    ldr r1, [r0, #0x0]
    add r0, r1, #0x100
    ldrh r0, [r0, #0x14]
    str r0, [sp, #0x4]
.L_02160618:
    cmp r10, #0x0
    addne r0, r1, #0x100
    ldrneh r11, [r0, #0x16]
    addeq r0, r1, #0x5200
    ldr r1, .L_02160864
    ldreqh r11, [r0, #0x8e]
    cmp r10, #0x0
    ldrneh r0, [r5, #0x10]
    ldr r1, [r1, #0x0]
    mov r6, #0x0
    moveq r0, #0x0
    mov r0, r0, lsl #0x10
    mov r9, r0, lsr #0x10
    ldr r0, [r1, #0xd8]
    add r1, r1, #0x58
    cmp r0, #0x0
    add r8, r1, r9, lsl #0x3
    bne .L_02160674
    bl func_ov007_02160064
    cmp r0, #0x3
    bne .L_02160674
    cmp r7, #0x0
    movne r6, #0x1
.L_02160674:
    strh r9, [r8, #0x0]
    cmp r10, #0x0
    beq .L_0216069c
    ldrh r0, [r5, #0xa]
    strh r0, [r8, #0x2]
    ldrh r0, [r5, #0xc]
    strh r0, [r8, #0x4]
    ldrh r0, [r5, #0xe]
    strh r0, [r8, #0x6]
    b .L_021606c4
.L_0216069c:
    ldr r1, .L_02160864
    ldr r0, .L_02160870
    ldr r1, [r1, #0x0]
    add r1, r1, r0
    ldrh r0, [r1, #0x4]
    strh r0, [r8, #0x2]
    ldrh r0, [r1, #0x6]
    strh r0, [r8, #0x4]
    ldrh r0, [r1, #0x8]
    strh r0, [r8, #0x6]
.L_021606c4:
    ldr r1, .L_02160864
    ldr r0, .L_02160868
    ldr r3, [r1, #0x0]
    ldr r1, [sp, #0x4]
    mov r2, r11
    add r0, r3, r0
    bl func_ov007_0215e9f4
    cmp r6, #0x0
    beq .L_02160720
    ldr r1, [r7, #0x10]
    cmp r1, #0x0
    beq .L_02160720
    ldr r3, [r7, #0x20]
    cmp r3, #0x0
    beq .L_02160720
    ldr r2, [r7, #0x24]
    ldr r0, .L_02160864
    str r2, [sp, #0x0]
    ldr r5, [r0, #0x0]
    ldr r0, .L_02160868
    ldr r2, [r7, #0x14]
    add r0, r5, r0
    bl func_ov007_0215e9cc
.L_02160720:
    ldr r0, .L_02160864
    mov r1, #0x1
    mov r1, r1, lsl r9
    mov r1, r1, lsl #0x10
    ldr r2, [r0, #0x0]
    ldr r0, .L_02160868
    mov r1, r1, lsr #0x10
    add r0, r2, r0
    bl func_ov007_0215e7fc
    cmp r6, #0x0
    beq .L_02160858
    ldr r0, .L_02160864
    mov r1, r8
    ldr r2, [r0, #0x0]
    mov r0, #0x4
    ldr r2, [r2, #0x4]
    blx r2
    b .L_02160858
.L_02160768:
    ldr r0, .L_02160864
    mov r1, r5, lsl #0x10
    ldr r2, [r0, #0x0]
    ldr r0, .L_02160868
    mov r1, r1, lsr #0x10
    add r0, r2, r0
    bl func_ov007_0215e7f8
    bl func_ov007_02160010
    cmp r0, #0x0
    bne .L_02160858
    bl func_ov007_02160064
    cmp r0, #0x3
    beq .L_021607c0
    bl func_ov007_02160064
    cmp r0, #0x1
    beq .L_021607c0
    ldr r0, .L_02160864
    ldr r0, [r0, #0x0]
    add r0, r0, #0x5000
    ldr r0, [r0, #0x780]
    cmp r0, #0x0
    bne .L_02160858
.L_021607c0:
    ldr r0, .L_02160864
    mov r3, #0x0
    ldr r2, [r0, #0x0]
    mov r1, #0x3
    strb r3, [r2, #0xdc]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    b .L_02160858
.L_021607e4:
    ldr r2, .L_02160864
    ldr r0, .L_02160868
    ldr r2, [r2, #0x0]
    add r0, r2, r0
    bl func_ov007_0215e84c
    b .L_02160858
.L_021607fc:
    ldr r2, .L_02160864
    ldr r0, .L_02160868
    ldr r2, [r2, #0x0]
    add r0, r2, r0
    bl func_ov007_0215e800
    ldr r1, .L_02160864
    ldr r0, .L_02160868
    ldr r2, [r1, #0x0]
    add r1, r2, #0x5000
    ldr r1, [r1, #0x780]
    add r0, r2, r0
    ldr r1, [r1, #0xc]
    ldr r1, [r1, #0x20]
    blx r1
    cmp r0, #0x0
    bne .L_02160858
    ldr r0, .L_02160864
    mov r1, #0x3
    ldr r0, [r0, #0x0]
    add r0, r0, #0x120
    bl func_ov007_0215eac8
    b .L_02160858
.L_02160854:
    bl func_02055684
.L_02160858:
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02160864: .word data_ov007_0216ad8c
.L_02160868: .word 0x5760
.L_0216086c: .word data_ov007_0216ad88
.L_02160870: .word 0x5240
    arm_func_end func_ov007_021602bc

    .global func_ov007_02160874
    arm_func_start func_ov007_02160874
func_ov007_02160874: ; 0x02160874
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, .L_021608ec
    mov r2, #0x0
    ldr ip, [r0, #0x0]
    ldr r0, .L_021608f0
    add r1, ip, #0x5000
    ldr r1, [r1, #0x780]
    mov r3, r2
    add r0, ip, r0
    bl func_ov007_0215e95c
    cmp r0, #0x0
    bne .L_021608c8
    ldr r0, .L_021608ec
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    ldr r0, .L_021608f0
    mov r2, r1
    add r0, r3, r0
    mov r3, #0x1
    bl func_ov007_0215e95c
.L_021608c8:
    ldr r2, .L_021608ec
    ldr r1, [r2, #0x0]
    add r1, r1, #0x5000
    str r0, [r1, #0x780]
    ldr r1, [r0, #0x4]
    ldr r0, [r2, #0x0]
    str r1, [r0, #0xe8]
    add sp, sp, #0x4
    ldmia sp!, {pc}
.L_021608ec: .word data_ov007_0216ad8c
.L_021608f0: .word 0x5760
    arm_func_end func_ov007_02160874

    .global func_ov007_021608f4
    arm_func_start func_ov007_021608f4
func_ov007_021608f4: ; 0x021608f4
    ldr ip, .L_02160900
    ldr r0, .L_02160904
    bx ip
.L_02160900: .word func_ov007_0215ea60
.L_02160904: .word data_ov007_0216a654
    arm_func_end func_ov007_021608f4

    .global func_ov007_02160908
    arm_func_start func_ov007_02160908
func_ov007_02160908: ; 0x02160908
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, [r9, #0x20]
    mov r7, #0x0
    ldr r0, [r0, #0xc]
    mov r8, r1
    ldr r6, [r0, #0x24]
    mov r10, r7
    ldr r0, [r6, #0x14]
    mov r11, #0x0
    cmp r0, #0x0
    ldrh r0, [r8, #0x4]
    cmp r0, #0x6
    addlo sp, sp, #0xc
    movlo r0, r11
    ldmloia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r8, #0x0]
    add r1, sp, #0x0
    mov r2, #0x6
    bl func_02051890
    ldrh r0, [sp, #0x0]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_021609c8
    ldr r0, [r8, #0x0]
    add r1, sp, #0x6
    mov r2, #0x4
    bl func_02051890
    ldrh r2, [sp, #0x6]
    ldrh r3, [sp, #0x8]
    ldr r1, .L_02160ce8
    mov r2, r2, lsl #0x10
    mov r5, r2, lsr #0x11
    mov r0, r3, lsl #0x1f
    mov r2, r3, lsl #0x10
    mov r4, r2, lsr #0x11
    cmp r5, r1
    mov r0, r0, lsr #0x1f
    mov r2, r11
    bne .L_021609b4
    cmp r4, r1
    moveq r2, #0x1
.L_021609b4:
    cmp r2, #0x0
    movne r1, #0x4
    moveq r1, #0x3
    str r1, [r6, #0x18]
    b .L_021609f4
.L_021609c8:
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x1b
    str r0, [r6, #0x18]
    ldrh r0, [sp, #0x0]
    ldrh r5, [sp, #0x2]
    ldrh r4, [sp, #0x4]
    mov r1, r0, lsl #0x1e
    mov r0, r0, lsl #0x1d
    ldrb r11, [sp, #0x1]
    mov r10, r1, lsr #0x1f
    mov r0, r0, lsr #0x1f
.L_021609f4:
    ldr r1, [r6, #0x14]
    cmp r0, r1
    beq .L_02160a10
    ldr r0, [r6, #0x10]
    cmp r0, #0x4
    moveq r7, #0x1
    b .L_02160cb8
.L_02160a10:
    ldr r0, [r6, #0x18]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_02160cb8
.L_02160a20: ; jump table
    b .L_02160cb8 ; case 0
    b .L_02160ca4 ; case 1
    b .L_02160a34 ; case 2
    b .L_02160a80 ; case 3
    b .L_02160c64 ; case 4
.L_02160a34:
    ldr r0, [r6, #0x10]
    cmp r0, #0x2
    bne .L_02160cb8
    str r5, [r9, #0x8]
    strh r11, [r9, #0x1c]
    str r4, [r9, #0x14]
    ldr r1, [r9, #0x4]
    ldr r0, [r9, #0x8]
    cmp r1, r0
    bhi .L_02160a6c
    ldr r1, [r9, #0x14]
    ldr r0, [r9, #0x18]
    cmp r1, r0
    bls .L_02160a78
.L_02160a6c:
    mov r0, #0x1
    str r0, [r6, #0x10]
    b .L_02160a80
.L_02160a78:
    cmp r10, #0x0
    beq .L_02160cb8
.L_02160a80:
    ldr r0, [r6, #0x10]
    cmp r0, #0x2
    bne .L_02160b0c
    mov r0, #0x3
    str r0, [r6, #0x10]
    ldrh r1, [r8, #0x4]
    ldr r0, [r6, #0x8]
    cmp r1, r0
    ldreq r0, [r6, #0x4]
    streq r0, [r6, #0x1c]
    ldreq r0, [r6, #0x8]
    streq r0, [r6, #0x20]
    strne r0, [r6, #0x1c]
    ldrne r0, [r6, #0x4]
    strne r0, [r6, #0x20]
    ldr r1, [r6, #0x1c]
    mov r0, #0x0
    sub r1, r1, #0x4
    str r1, [r6, #0x1c]
    ldr r1, [r6, #0x20]
    sub r1, r1, #0x4
    str r1, [r6, #0x20]
    str r0, [r6, #0x24]
    str r0, [r6, #0x28]
    str r0, [r6, #0x2c]
    ldr r0, [r9, #0x14]
    ldr r1, [r6, #0x20]
    add r0, r0, r1
    sub r0, r0, #0x1
    bl func_0200d338
    str r0, [r6, #0x30]
    ldr r2, .L_02160cec
    add r1, r6, #0x34
    mov r0, #0x0
    bl func_0205174c
.L_02160b0c:
    ldr r0, [r6, #0x18]
    cmp r0, #0x3
    bne .L_02160cb8
    ldr r0, [r6, #0x10]
    cmp r0, #0x3
    bne .L_02160cb8
    ldr r0, .L_02160ce8
    str r5, [r6, #0x28]
    cmp r4, r0
    beq .L_02160ba0
    mov r10, r4, lsr #0x5
    add r0, r6, r10, lsl #0x2
    and r5, r4, #0x1f
    mov r1, #0x1
    mov r1, r1, lsl r5
    ldr r0, [r0, #0x34]
    ands r0, r1, r0
    bne .L_02160ba0
    ldr r2, [r6, #0x20]
    ldr r0, [r8, #0x0]
    mul r3, r2, r4
    ldr r1, [r9, #0x14]
    add r0, r0, #0x4
    sub r1, r1, r3
    cmp r2, r1
    movhi r2, r1
    ldr r1, [r9, #0x10]
    add r1, r1, r3
    bl func_02051890
    add r2, r6, #0x34
    ldr r1, [r2, r10, lsl #0x2]
    mov r0, #0x1
    orr r0, r1, r0, lsl r5
    str r0, [r2, r10, lsl #0x2]
    ldr r0, [r6, #0x2c]
    add r0, r0, #0x1
    str r0, [r6, #0x2c]
.L_02160ba0:
    ldr r1, [r6, #0x2c]
    ldr r0, [r6, #0x30]
    cmp r1, r0
    bhs .L_02160c48
    ldr r0, [r6, #0x24]
    mov r1, r0, lsr #0x5
    and r8, r0, #0x1f
    mov r0, #0x0
    mov r4, #0x1
    mvn r2, #0x0
.L_02160bc8:
    add r8, r8, #0x1
    cmp r8, #0x20
    blo .L_02160c14
    add r1, r1, #0x1
    b .L_02160be0
.L_02160bdc:
    add r1, r1, #0x1
.L_02160be0:
    add r3, r6, r1, lsl #0x2
    ldr r3, [r3, #0x34]
    cmp r3, r2
    beq .L_02160bdc
    mov r3, r1, lsl #0x2
    add r3, r6, r3
    ldr r3, [r3, #0x34]
    mvn r3, r3
    mvn r5, r3
    sub r3, r3, #0x1
    and r3, r5, r3
    clz r3, r3
    rsb r8, r3, #0x20
.L_02160c14:
    ldr r3, [r6, #0x30]
    add r5, r8, r1, lsl #0x5
    cmp r5, r3
    movhs r1, r0
    movhs r8, r0
    add r3, r6, r1, lsl #0x2
    mov r5, r4, lsl r8
    ldr r3, [r3, #0x34]
    ands r3, r5, r3
    bne .L_02160bc8
    add r0, r8, r1, lsl #0x5
    str r0, [r6, #0x24]
    b .L_02160cb8
.L_02160c48:
    ldr r1, .L_02160ce8
    str r1, [r6, #0x24]
    ldr r0, [r6, #0x28]
    cmp r0, r1
    moveq r0, #0x4
    streq r0, [r6, #0x10]
    b .L_02160cb8
.L_02160c64:
    ldr r0, [r6, #0x10]
    cmp r0, #0x3
    bne .L_02160c94
    str r5, [r6, #0x28]
    ldr r1, [r6, #0x28]
    ldr r0, .L_02160ce8
    cmp r1, r0
    bne .L_02160c94
    ldr r1, [r6, #0x24]
    cmp r1, r0
    moveq r0, #0x4
    streq r0, [r6, #0x10]
.L_02160c94:
    ldr r0, [r6, #0x10]
    cmp r0, #0x4
    moveq r7, #0x1
    b .L_02160cb8
.L_02160ca4:
    mov r0, #0x1
    str r0, [r6, #0x10]
    cmp r10, #0x0
    movne r0, #0x0
    strne r0, [r6, #0xc]
.L_02160cb8:
    cmp r7, #0x0
    beq .L_02160cdc
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r6, #0x14]
    mov r0, #0x1
    str r0, [r6, #0x10]
.L_02160cdc:
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02160ce8: .word 0x7fff
.L_02160cec: .word 0x1004
    arm_func_end func_ov007_02160908

    .global func_ov007_02160cf0
    arm_func_start func_ov007_02160cf0
func_ov007_02160cf0: ; 0x02160cf0
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x20]
    ldr r2, [r2, #0xc]
    ldr r2, [r2, #0x24]
    ldr r3, [r2, #0x10]
    sub r3, r3, #0x3
    cmp r3, #0x1
    bhi .L_02160dbc
    ldr r1, [r1, #0x0]
    ldr ip, .L_02160e50
    ldrh r3, [r1, #0x0]
    ldr lr, .L_02160e54
    bic r3, r3, #0x1
    orr r3, r3, #0x1
    strh r3, [r1, #0x0]
    ldr r3, [r2, #0x14]
    ldrh r4, [r1, #0x2]
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bic r4, r4, #0x1
    and r3, r3, #0x1
    orr r3, r4, r3
    strh r3, [r1, #0x2]
    ldrh r4, [r1, #0x0]
    ldr r3, [r2, #0x24]
    mov r3, r3, lsl #0x10
    and r4, r4, ip
    and r3, lr, r3, lsr #0x10
    orr r3, r4, r3, lsl #0x1
    strh r3, [r1, #0x0]
    ldrh r4, [r1, #0x2]
    ldr r3, [r2, #0x28]
    mov r3, r3, lsl #0x10
    and r4, r4, ip
    and r3, lr, r3, lsr #0x10
    orr r3, r4, r3, lsl #0x1
    strh r3, [r1, #0x2]
    ldr ip, [r2, #0x28]
    cmp ip, lr
    ldmeqia sp!, {r4, pc}
    ldr r2, [r2, #0x1c]
    ldr r3, [r0, #0x4]
    mul r4, r2, ip
    ldr r0, [r0, #0x0]
    sub r3, r3, r4
    cmp r2, r3
    movhi r2, r3
    add r1, r1, #0x4
    add r0, r0, r4
    bl func_02051890
    ldmia sp!, {r4, pc}
.L_02160dbc:
    ldr r1, [r1, #0x0]
    ldrh r3, [r1, #0x0]
    bic r3, r3, #0x1
    strh r3, [r1, #0x0]
    ldr ip, [r2, #0x18]
    ldr r3, [r2, #0x10]
    cmp ip, r3
    moveq r3, #0x1
    ldrh ip, [r1, #0x0]
    movne r3, #0x0
    and r3, r3, #0xff
    and r3, r3, #0x1
    bic ip, ip, #0x2
    orr r3, ip, r3, lsl #0x1
    strh r3, [r1, #0x0]
    ldr r3, [r2, #0x14]
    ldrh ip, [r1, #0x0]
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bic ip, ip, #0x4
    and r3, r3, #0x1
    orr r3, ip, r3, lsl #0x2
    strh r3, [r1, #0x0]
    ldrh r3, [r1, #0x0]
    ldr r2, [r2, #0x10]
    and r2, r2, #0xff
    bic r3, r3, #0xf8
    and r2, r2, #0x1f
    orr r2, r3, r2, lsl #0x3
    strh r2, [r1, #0x0]
    ldrh r2, [r0, #0xc]
    strb r2, [r1, #0x1]
    ldr r2, [r0, #0x18]
    strh r2, [r1, #0x2]
    ldr r0, [r0, #0x4]
    strh r0, [r1, #0x4]
    ldmia sp!, {r4, pc}
.L_02160e50: .word 0xffff0001
.L_02160e54: .word 0x7fff
    arm_func_end func_ov007_02160cf0

    .global func_ov007_02160e58
    arm_func_start func_ov007_02160e58
func_ov007_02160e58: ; 0x02160e58
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0xc]
    bx lr
    arm_func_end func_ov007_02160e58

    .global func_ov007_02160e6c
    arm_func_start func_ov007_02160e6c
func_ov007_02160e6c: ; 0x02160e6c
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, [r7, #0x20]
    mov r6, r3
    ldr r0, [r0, #0xc]
    mov r5, #0x0
    ldr r4, [r0, #0x24]
    ldr r0, [r4, #0x10]
    cmp r0, #0x1
    bne .L_02160ee4
    mov r0, r2, lsl #0x10
    str r1, [r7, #0x0]
    mov r3, r0, lsr #0x10
    mov r0, r1
    str r3, [r7, #0x8]
    mov r1, r2
    str r3, [r7, #0x4]
    mov r5, #0x1
    bl func_02051098
    ldr r1, [sp, #0x18]
    strh r0, [r7, #0xc]
    mov r0, r1, lsl #0x10
    str r6, [r7, #0x10]
    mov r0, r0, lsr #0x10
    str r0, [r7, #0x18]
    mov r0, #0x2
    str r0, [r4, #0x10]
    mov r0, #0x0
    str r0, [r4, #0x18]
.L_02160ee4:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
    arm_func_end func_ov007_02160e6c

    .global func_ov007_02160ef0
    arm_func_start func_ov007_02160ef0
func_ov007_02160ef0: ; 0x02160ef0
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0, #0x20]
    mov ip, #0x0
    ldr lr, [r3, #0xc]
    mov r3, #0x1
    ldr lr, [lr, #0x24]
    str ip, [r0, #0x0]
    str ip, [r0, #0x4]
    str ip, [r0, #0x8]
    strh ip, [r0, #0xc]
    str ip, [r0, #0x10]
    str ip, [r0, #0x14]
    str ip, [r0, #0x18]
    strh ip, [r0, #0x1c]
    str r1, [lr, #0x4]
    str r2, [lr, #0x8]
    str r3, [lr, #0x10]
    str ip, [lr, #0x14]
    str ip, [lr, #0x18]
    str r3, [lr, #0xc]
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_02160ef0

    .global func_ov007_02160f4c
    arm_func_start func_ov007_02160f4c
func_ov007_02160f4c: ; 0x02160f4c
    ldr r1, [r0, #0x20]
    mov r0, #0x57
    strb r0, [r2, #0x0]
    mov r0, #0x58
    strb r0, [r2, #0x1]
    mov r0, #0x43
    strb r0, [r2, #0x2]
    mov r0, #0x31
    strb r0, [r2, #0x3]
    ldr r0, [r1, #0x4]
    str r0, [r2, #0x4]
    bx lr
    arm_func_end func_ov007_02160f4c

    .global func_ov007_02160f7c
    arm_func_start func_ov007_02160f7c
func_ov007_02160f7c: ; 0x02160f7c
    mov r0, #0x1
    bx lr
    arm_func_end func_ov007_02160f7c

    .global func_ov007_02160f84
    arm_func_start func_ov007_02160f84
func_ov007_02160f84: ; 0x02160f84
    ldr r2, [r0, #0x20]
    mov r0, #0x4
    ldr r3, [r2, #0xc]
    ldr r2, [r2, #0x14]
    ldr r3, [r3, #0x24]
    str r2, [r3, #0x0]
    str r3, [r1, #0x0]
    strh r0, [r1, #0x4]
    bx lr
    arm_func_end func_ov007_02160f84

    .global func_ov007_02160fa8
    arm_func_start func_ov007_02160fa8
func_ov007_02160fa8: ; 0x02160fa8
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0x58c]
    bx lr
    arm_func_end func_ov007_02160fa8

    .global func_ov007_02160fbc
    arm_func_start func_ov007_02160fbc
func_ov007_02160fbc: ; 0x02160fbc
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r0, [r8, #0x20]
    mov r6, r2
    ldr r0, [r0, #0xc]
    mov r7, r1
    ldr r4, [r0, #0x24]
    mov r5, r3
    mov r0, r4
    bl func_ov007_02161870
    mov r2, r6, lsl #0x10
    mov r0, r7
    mov r1, r6
    mov r2, r2, lsr #0x10
    str r7, [r8, #0x0]
    str r2, [r8, #0x4]
    bl func_02051098
    strh r0, [r8, #0xc]
    ldr r1, [sp, #0x18]
    str r5, [r8, #0x10]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r8, #0x18]
    ldr r1, .L_0216108c
    mov r0, #0x0
    mov r2, #0x158
    add r1, r4, r1
    bl func_0205174c
    ldr r3, [sp, #0x18]
    ldr r0, .L_02161090
    ldr r2, .L_02161094
    umull r0, r1, r3, r0
    sub r0, r3, r1
    add r1, r1, r0, lsr #0x1
    mov r1, r1, lsr #0x8
    umull r0, r1, r2, r1
    subs r1, r3, r0
    movne r8, #0x1
    ldr r2, [sp, #0x18]
    ldr r1, .L_02161090
    moveq r8, #0x0
    umull r1, r3, r2, r1
    sub r1, r2, r3
    add r3, r3, r1, lsr #0x1
    mov r3, r3, lsr #0x8
    add r1, r8, r3
    str r1, [r4, #0x424]
    str r6, [r4, #0x420]
    str r7, [r4, #0x428]
    mov r0, #0x1
    str r5, [r4, #0x0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0216108c: .word 0x42c
.L_02161090: .word 0x2040811
.L_02161094: .word 0x1fc
    arm_func_end func_ov007_02160fbc

    .global func_ov007_02161098
    arm_func_start func_ov007_02161098
func_ov007_02161098: ; 0x02161098
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x20]
    sub ip, r2, #0x4
    ldr r2, [r0, #0xc]
    ldr r0, .L_021610ec
    ldr r4, [r2, #0x24]
    sub r1, r1, #0x4
    add r3, r4, #0x500
    strh r1, [r3, #0x84]
    add r1, r4, r0
    mov r0, #0x0
    mov r2, #0x158
    strh ip, [r3, #0x86]
    bl func_0205174c
    mov r0, #0x0
    str r0, [r4, #0x424]
    str r0, [r4, #0x420]
    str r0, [r4, #0x428]
    mov r0, #0x1
    str r0, [r4, #0x58c]
    ldmia sp!, {r4, pc}
.L_021610ec: .word 0x42c
    arm_func_end func_ov007_02161098

    .global func_ov007_021610f0
    arm_func_start func_ov007_021610f0
func_ov007_021610f0: ; 0x021610f0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x20]
    mov r5, r1
    ldr r0, [r0, #0xc]
    ldr r4, [r0, #0x24]
    bl func_ov007_02160040
    cmp r0, #0x0
    beq .L_021611fc
    ldr r0, [r5, #0x0]
    ldr r1, .L_021612dc
    bl func_ov007_021618ec
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_02161138
    ldrh r1, [r5, #0x4]
    cmp r1, #0x0
    bne .L_02161140
.L_02161138:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02161140:
    add r1, r4, #0x214
    bl func_ov007_02161468
    add r0, r4, #0x200
    ldrh r2, [r0, #0x14]
    ldr r1, .L_021612e0
    cmp r2, r1
    moveq r0, #0x0
    streq r0, [r4, #0x58c]
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x4]
    cmp r1, #0x1
    bne .L_021611f4
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    bne .L_021611b4
    ldrh r1, [r0, #0x16]
    ldr r0, [r4, #0x424]
    cmp r1, r0
    bge .L_021611f4
    mov r0, r6
    bl func_ov007_02161380
    cmp r0, #0x1
    bne .L_021611f4
    mov r0, r6
    mov r2, r4
    add r1, r4, #0x214
    bl func_ov007_021612ec
    b .L_021611f4
.L_021611b4:
    ldr r0, .L_021612e4
    cmp r2, r0
    moveq r0, #0x1
    streq r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    cmp r0, #0x1
    bne .L_021611f4
    ldr r0, [r4, #0x10]
    cmp r0, #0x6
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x10]
    movlt r0, #0x0
    movge r0, #0x0
    strge r0, [r4, #0x4]
    movge r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_021611f4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_021611fc:
    ldr r0, [r5, #0x0]
    ldr r1, .L_021612e8
    bl func_ov007_021618ec
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_02161220
    ldrh r1, [r5, #0x4]
    cmp r1, #0x0
    bne .L_02161228
.L_02161220:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02161228:
    add r1, r4, #0x214
    bl func_ov007_02161468
    add r0, r4, #0x200
    ldrh r2, [r0, #0x14]
    ldr r1, .L_021612e0
    cmp r2, r1
    moveq r0, #0x0
    streq r0, [r4, #0x58c]
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x4]
    cmp r1, #0x1
    bne .L_021612d4
    ldrh r1, [r5, #0x4]
    cmp r1, #0x200
    movlo r0, #0x0
    ldmloia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    bne .L_021612ac
    ldrh r1, [r0, #0x16]
    ldr r0, [r4, #0x424]
    cmp r1, r0
    bge .L_021612d4
    mov r0, r6
    bl func_ov007_02161380
    cmp r0, #0x1
    bne .L_021612d4
    mov r0, r6
    mov r2, r4
    add r1, r4, #0x214
    bl func_ov007_021612ec
    b .L_021612d4
.L_021612ac:
    ldr r0, .L_021612e4
    cmp r2, r0
    moveq r0, #0x1
    streq r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r4, #0x4]
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_021612d4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_021612dc: .word data_ov007_0216a6b0
.L_021612e0: .word 0xfffd
.L_021612e4: .word 0xffff
.L_021612e8: .word data_ov007_0216a6bc
    arm_func_end func_ov007_021610f0

    .global func_ov007_021612ec
    arm_func_start func_ov007_021612ec
func_ov007_021612ec: ; 0x021612ec
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0, #0x20]
    ldr r2, [r2, #0x0]
    ldr r0, [r0, #0xc]
    add r5, r1, #0x4
    cmp r2, #0x0
    ldr ip, [r0, #0x24]
    ldrh r3, [r1, #0x2]
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, #0x1fc
    ldr r1, [ip, #0x424]
    mla r4, r3, r0, r2
    sub r0, r1, #0x1
    cmp r3, r0
    bne .L_02161368
    add r0, ip, #0x500
    ldrh r6, [r0, #0x86]
    ldr r0, [ip, #0x420]
    mov r1, r6
    bl func_0200d12c
    movs r2, r1
    beq .L_02161354
    mov r0, r5
    mov r1, r4
    bl func_02051890
    ldmia sp!, {r4, r5, r6, pc}
.L_02161354:
    mov r0, r5
    mov r1, r4
    mov r2, r6
    bl func_02051890
    ldmia sp!, {r4, r5, r6, pc}
.L_02161368:
    add r0, ip, #0x500
    ldrh r2, [r0, #0x86]
    mov r0, r5
    mov r1, r4
    bl func_02051890
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_021612ec

    .global func_ov007_02161380
    arm_func_start func_ov007_02161380
func_ov007_02161380: ; 0x02161380
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0xc]
    ldr r3, [r0, #0x24]
    ldr r0, [r3, #0x41c]
    cmp r1, r0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    add r0, r0, #0x20
    cmp r1, r0
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    mov r2, r1, lsr #0x1f
    rsb r0, r2, r1, lsl #0x1b
    add r0, r2, r0, ror #0x1b
    mov r2, #0x1
    mov r4, r2, lsl r0
    ldr r0, [r3, #0x418]
    ands r1, r0, r4
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    orr r0, r0, r4
    str r0, [r3, #0x418]
    ldr r1, [r3, #0x41c]
    ldr r0, .L_02161460
    mov ip, r1, lsr #0x1f
    rsb r1, ip, r1, lsl #0x1b
    add r1, ip, r1, ror #0x1b
    mov r4, r2, lsl r1
    ldr ip, [r3, #0x418]
    add r1, r3, r0
    ands r0, ip, r4
    beq .L_02161458
    ldr r0, .L_02161464
    add r0, r3, r0
.L_0216140c:
    ldr ip, [r3, #0x41c]
    ldr r4, [r0, #0x0]
    mov lr, ip, lsr #0x1f
    add r4, r4, #0x1
    rsb ip, lr, ip, lsl #0x1b
    str r4, [r0, #0x0]
    add r4, lr, ip, ror #0x1b
    mvn r4, r2, lsl r4
    ldr ip, [r1, #0x0]
    and r4, ip, r4
    str r4, [r1, #0x0]
    ldr ip, [r3, #0x41c]
    ldr r4, [r3, #0x418]
    mov lr, ip, lsr #0x1f
    rsb ip, lr, ip, lsl #0x1b
    add ip, lr, ip, ror #0x1b
    mov ip, r2, lsl ip
    ands r4, r4, ip
    bne .L_0216140c
.L_02161458:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02161460: .word 0x418
.L_02161464: .word 0x41c
    arm_func_end func_ov007_02161380

    .global func_ov007_02161468
    arm_func_start func_ov007_02161468
func_ov007_02161468: ; 0x02161468
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldrb ip, [r0, #0x0]
    add r3, r0, #0x3
    mov r2, #0x0
    mov ip, ip, lsl #0x8
    strh ip, [r1, #0x0]
    ldrh lr, [r1, #0x0]
    ldrb ip, [r0, #0x1]
    add ip, lr, ip
    strh ip, [r1, #0x0]
    ldrb ip, [r0, #0x2]
    add r0, r0, #0x4
    mov ip, ip, lsl #0x8
    strh ip, [r1, #0x2]
    ldrh ip, [r1, #0x2]
    ldrb r3, [r3, #0x0]
    add r3, ip, r3
    strh r3, [r1, #0x2]
.L_021614b4:
    ldrb ip, [r0], #0x1
    add r3, r1, r2
    add r2, r2, #0x1
    strb ip, [r3, #0x4]
    cmp r2, #0x1fc
    blt .L_021614b4
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov007_02161468

    .global func_ov007_021614d4
    arm_func_start func_ov007_021614d4
func_ov007_021614d4: ; 0x021614d4
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, [r7, #0x20]
    mov r6, r1
    ldr r0, [r0, #0xc]
    ldr r5, [r0, #0x24]
    bl func_ov007_02160040
    cmp r0, #0x0
    beq .L_02161594
    ldr r0, [r5, #0xc]
    ldr r4, [r6, #0x0]
    cmp r0, #0x1
    bne .L_02161528
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    ldrne r0, .L_0216161c
    strneh r0, [r5, #0x14]
    ldreq r0, .L_02161620
    streqh r0, [r5, #0x14]
    b .L_02161548
.L_02161528:
    mov r0, r7
    bl func_ov007_0216172c
    strh r0, [r5, #0x14]
    ldrh r1, [r5, #0x14]
    ldr r0, .L_0216161c
    cmp r1, r0
    moveq r0, #0x1
    streq r0, [r5, #0xc]
.L_02161548:
    ldr r0, [r5, #0x8]
    add r2, r5, #0x14
    cmp r0, #0x0
    ldrne r1, .L_02161624
    addeq r0, r5, #0x200
    ldreqh r1, [r0, #0x14]
    mov r0, r7
    add r3, r5, #0x420
    bl func_ov007_02161628
    mov r1, r4
    add r0, r5, #0x14
    bl func_ov007_021616dc
    add r0, r5, #0x500
    ldrh r0, [r0, #0x84]
    add sp, sp, #0x4
    add r0, r0, #0x5
    bic r0, r0, #0x1
    strh r0, [r6, #0x4]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02161594:
    ldr r0, [r5, #0xc]
    cmp r0, #0x1
    bne .L_021615bc
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    ldrne r0, .L_0216161c
    strneh r0, [r5, #0x14]
    ldreq r0, .L_02161620
    streqh r0, [r5, #0x14]
    b .L_021615dc
.L_021615bc:
    mov r0, r7
    bl func_ov007_0216172c
    strh r0, [r5, #0x14]
    ldrh r1, [r5, #0x14]
    ldr r0, .L_0216161c
    cmp r1, r0
    moveq r0, #0x1
    streq r0, [r5, #0xc]
.L_021615dc:
    add r0, r5, #0x200
    ldrh r1, [r0, #0x14]
    mov r0, r7
    add r2, r5, #0x14
    add r3, r5, #0x420
    bl func_ov007_02161628
    ldr r1, [r6, #0x0]
    add r0, r5, #0x14
    bl func_ov007_021616dc
    add r0, r5, #0x500
    ldrh r0, [r0, #0x84]
    add r0, r0, #0x5
    bic r0, r0, #0x1
    strh r0, [r6, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0216161c: .word 0xffff
.L_02161620: .word 0xfffd
.L_02161624: .word 0xfffe
    arm_func_end func_ov007_021614d4

    .global func_ov007_02161628
    arm_func_start func_ov007_02161628
func_ov007_02161628: ; 0x02161628
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, [r0, #0x20]
    ldr r0, .L_021616d0
    ldr ip, [ip, #0xc]
    cmp r1, r0
    ldr ip, [ip, #0x24]
    strh r1, [r2, #0x2]
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, .L_021616d4
    cmp r1, r0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, .L_021616d8
    cmp r1, r0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, ip, #0x500
    ldrh r4, [r0, #0x84]
    ldr r3, [r3, #0x8]
    ldr r0, [ip, #0x424]
    mla r6, r1, r4, r3
    sub r0, r0, #0x1
    cmp r1, r0
    add r5, r2, #0x4
    bne .L_021616bc
    ldr r0, [ip, #0x420]
    mov r1, r4
    bl func_0200d12c
    movs r2, r1
    beq .L_021616a8
    mov r0, r6
    mov r1, r5
    bl func_02051890
    ldmia sp!, {r4, r5, r6, pc}
.L_021616a8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02051890
    ldmia sp!, {r4, r5, r6, pc}
.L_021616bc:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02051890
    ldmia sp!, {r4, r5, r6, pc}
.L_021616d0: .word 0xffff
.L_021616d4: .word 0xfffe
.L_021616d8: .word 0xfffd
    arm_func_end func_ov007_02161628

    .global func_ov007_021616dc
    arm_func_start func_ov007_021616dc
func_ov007_021616dc: ; 0x021616dc
    ldrh r2, [r0, #0x0]
    add r3, r1, #0x3
    mov ip, #0x0
    mov r2, r2, asr #0x8
    strb r2, [r1, #0x0]
    ldrh r2, [r0, #0x0]
    strb r2, [r1, #0x1]
    ldrh r2, [r0, #0x2]
    mov r2, r2, asr #0x8
    strb r2, [r1, #0x2]
    ldrh r2, [r0, #0x2]
    add r1, r1, #0x4
    strb r2, [r3, #0x0]
.L_02161710:
    add r2, r0, ip
    ldrb r2, [r2, #0x4]
    add ip, ip, #0x1
    cmp ip, #0x1fc
    strb r2, [r1], #0x1
    blt .L_02161710
    bx lr
    arm_func_end func_ov007_021616dc

    .global func_ov007_0216172c
    arm_func_start func_ov007_0216172c
func_ov007_0216172c: ; 0x0216172c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x20]
    ldr r0, [r0, #0xc]
    ldr r5, [r0, #0x24]
    ldr r1, [r5, #0x41c]
    ldr r0, [r5, #0x424]
    cmp r1, r0
    ldrge r0, .L_021617b0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r4, [r5, #0x414]
.L_02161758:
    ldr r0, [r5, #0x424]
    add r4, r4, #0x1
    cmp r4, r0
    bge .L_02161778
    ldr r0, [r5, #0x41c]
    add r0, r0, #0x20
    cmp r4, r0
    blt .L_0216177c
.L_02161778:
    ldr r4, [r5, #0x41c]
.L_0216177c:
    mov r0, r6
    mov r1, r4
    bl func_ov007_021617b4
    cmp r0, #0x0
    moveq r0, r4, lsl #0x10
    streq r4, [r5, #0x414]
    moveq r0, r0, lsr #0x10
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0x414]
    cmp r4, r0
    bne .L_02161758
    ldr r0, .L_021617b0
    ldmia sp!, {r4, r5, r6, pc}
.L_021617b0: .word 0xffff
    arm_func_end func_ov007_0216172c

    .global func_ov007_021617b4
    arm_func_start func_ov007_021617b4
func_ov007_021617b4: ; 0x021617b4
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0xc]
    ldr r3, [r0, #0x24]
    ldr r0, [r3, #0x41c]
    cmp r1, r0
    movlt r0, #0x1
    bxlt lr
    add r0, r0, #0x20
    cmp r1, r0
    movge r0, #0x0
    bxge lr
    mov r2, r1, lsr #0x1f
    rsb r0, r2, r1, lsl #0x1b
    add r1, r2, r0, ror #0x1b
    mov r0, #0x1
    mov r1, r0, lsl r1
    ldr r2, [r3, #0x418]
    ands r1, r2, r1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov007_021617b4

    .global func_ov007_02161804
    arm_func_start func_ov007_02161804
func_ov007_02161804: ; 0x02161804
    add r2, r1, #0x44
    add r0, r1, #0x40
    sub r0, r2, r0
    add r2, r0, #0x4
    ldrh r3, [r1, #0x3c]
    mov r0, #0x0
    cmp r3, r2
    bxlo lr
    ldrb r2, [r1, #0x4a]
    cmp r2, #0x4
    bxlo lr
    ldr r1, [r1, #0x50]
    ands r1, r1, #0x80000000
    moveq r0, #0x1
    bx lr
    arm_func_end func_ov007_02161804

    .global func_ov007_02161840
    arm_func_start func_ov007_02161840
func_ov007_02161840: ; 0x02161840
    stmdb sp!, {r4, lr}
    mov r4, r1
    ldr r1, .L_0216186c
    mov r0, #0x0
    mov r2, #0x4
    bl func_02051718
    ldr r1, .L_0216186c
    mov r0, #0x4
    str r1, [r4, #0x0]
    strh r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
.L_0216186c: .word data_ov007_0216bde0
    arm_func_end func_ov007_02161840

    .global func_ov007_02161870
    arm_func_start func_ov007_02161870
func_ov007_02161870: ; 0x02161870
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x14
    bl func_ov007_021618b8
    add r0, r4, #0x214
    bl func_ov007_021618b8
    mov r0, r4
    bl func_ov007_021618dc
    ldr r1, .L_021618b4
    mov r0, #0x1
    str r1, [r4, #0x414]
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    str r0, [r4, #0xc]
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.L_021618b4: .word 0xfffe
    arm_func_end func_ov007_02161870

    .global func_ov007_021618b8
    arm_func_start func_ov007_021618b8
func_ov007_021618b8: ; 0x021618b8
    ldr r2, .L_021618d4
    ldr ip, .L_021618d8
    strh r2, [r0, #0x2]
    mov r1, #0x0
    mov r2, #0x1fc
    strh r1, [r0], #0x4
    bx ip
.L_021618d4: .word 0xfffe
.L_021618d8: .word func_020517fc
    arm_func_end func_ov007_021618b8

    .global func_ov007_021618dc
    arm_func_start func_ov007_021618dc
func_ov007_021618dc: ; 0x021618dc
    mov r1, #0x0
    str r1, [r0, #0x418]
    str r1, [r0, #0x41c]
    bx lr
    arm_func_end func_ov007_021618dc

    .global func_ov007_021618ec
    arm_func_start func_ov007_021618ec
func_ov007_021618ec: ; 0x021618ec
    ldr ip, .L_021618f8
    ldr r1, .L_021618fc
    bx ip
.L_021618f8: .word func_ov007_02161468
.L_021618fc: .word data_ov007_0216bde4
    arm_func_end func_ov007_021618ec

    .global func_ov007_02161900
    arm_func_start func_ov007_02161900
func_ov007_02161900: ; 0x02161900
    ldr ip, .L_0216190c
    ldr r0, .L_02161910
    bx ip
.L_0216190c: .word func_ov007_0215ea60
.L_02161910: .word data_ov007_0216a684
    arm_func_end func_ov007_02161900

    .global func_ov007_02161914
    arm_func_start func_ov007_02161914
func_ov007_02161914: ; 0x02161914
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0x170]
    bx lr
    arm_func_end func_ov007_02161914

    .global func_ov007_02161928
    arm_func_start func_ov007_02161928
func_ov007_02161928: ; 0x02161928
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x20]
    mov r5, r3
    ldr r0, [r0, #0xc]
    ldr r4, [r0, #0x24]
    ldrb r0, [r4, #0x1]
    cmp r0, #0x5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x1
    strb r0, [r4, #0x1]
    mov r3, r2, lsl #0x10
    str r1, [r6, #0x0]
    mov r3, r3, lsr #0x10
    mov r0, r1
    mov r1, r2
    str r3, [r6, #0x4]
    bl func_02051098
    strh r0, [r6, #0xc]
    ldr r0, [sp, #0x10]
    str r5, [r6, #0x10]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    add r1, r4, #0x10
    mov r0, #0x0
    mov r2, #0x158
    str r3, [r6, #0x18]
    bl func_0205174c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_02161928

    .global func_ov007_021619a4
    arm_func_start func_ov007_021619a4
func_ov007_021619a4: ; 0x021619a4
    stmdb sp!, {r4, lr}
    ldr r3, [r0, #0x20]
    mov ip, #0x0
    ldr r4, [r3, #0xc]
    sub r3, r1, #0x8
    ldr r4, [r4, #0x24]
    sub r1, r2, #0x8
    str ip, [r0, #0x0]
    str ip, [r0, #0x4]
    strh ip, [r0, #0xc]
    str ip, [r0, #0x10]
    str ip, [r0, #0x14]
    str ip, [r0, #0x18]
    add r0, r4, #0x100
    strh r3, [r0, #0x68]
    strh r1, [r0, #0x6a]
    mov r0, ip
.L_021619e8:
    add r1, r4, ip, lsl #0x1
    add r1, r1, #0x100
    add ip, ip, #0x1
    strh r0, [r1, #0x6c]
    cmp ip, #0x2
    blt .L_021619e8
    strb r0, [r4, #0x0]
    str r0, [r4, #0x8]
    mov r1, #0x5
    strb r1, [r4, #0x1]
    strb r0, [r4, #0x4]
    add r1, r4, #0x10
    mov r2, #0x158
    strb r0, [r4, #0x5]
    bl func_0205174c
    mov r0, #0x1
    str r0, [r4, #0x170]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_021619a4

    .global func_ov007_02161a30
    arm_func_start func_ov007_02161a30
func_ov007_02161a30: ; 0x02161a30
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, [r0, #0x20]
    ldrh r3, [r1, #0x4]
    ldr r2, [r2, #0xc]
    ldr r4, [r1, #0x0]
    ldr r6, [r2, #0x24]
    mov r5, #0x0
    add r2, r6, #0x100
    ldrh r2, [r2, #0x6a]
    cmp r3, r2
    blo .L_02161b54
    ldrb r3, [r4, #0x0]
    ldrb r2, [r6, #0x0]
    cmp r3, r2
    ldreqh r3, [r4, #0x0]
    ldreqh r2, [r4, #0x2]
    streqh r3, [r6, #0x4]
    streqh r2, [r6, #0x6]
    ldrb r3, [r4, #0x4]
    ldrb r2, [r6, #0x0]
    cmp r3, r2
    bne .L_02161b1c
    ldrb r3, [r4, #0x5]
    ldr r1, [r1, #0x0]
    cmp r3, #0x1
    add r2, r1, #0x8
    beq .L_02161ab4
    cmp r3, #0x2
    beq .L_02161b14
    cmp r3, #0x5
    moveq r0, #0x0
    streq r0, [r6, #0x170]
    b .L_02161b1c
.L_02161ab4:
    ldrh r3, [r2, #0x0]
    add r1, r6, #0x100
    str r3, [r0, #0x14]
    ldrh r2, [r2, #0x2]
    strh r2, [r0, #0x1c]
    ldrh r1, [r1, #0x6a]
    ldr r0, [r0, #0x14]
    add r0, r0, r1
    sub r0, r0, #0x1
    bl func_0200d338
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r6, #0x8]
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    str r1, [r6, #0xc]
    strh r0, [r6, #0x2]
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    movne r0, #0x2
    strneb r0, [r6, #0x1]
    moveq r0, #0x4
    streqb r0, [r6, #0x1]
    b .L_02161b1c
.L_02161b14:
    ldrh r1, [r4, #0x6]
    bl func_ov007_02161b5c
.L_02161b1c:
    ldrb r0, [r4, #0x4]
    ldrb r1, [r6, #0x0]
    cmp r0, r1
    bne .L_02161b54
    ldrb r0, [r4, #0x5]
    cmp r0, #0x4
    bne .L_02161b54
    ldrb r0, [r6, #0x5]
    cmp r0, #0x4
    addeq r0, r1, #0x1
    streqb r0, [r6, #0x0]
    moveq r0, #0x5
    streqb r0, [r6, #0x1]
    moveq r5, #0x1
.L_02161b54:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_02161a30

    .global func_ov007_02161b5c
    arm_func_start func_ov007_02161b5c
func_ov007_02161b5c: ; 0x02161b5c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, [r0, #0x20]
    ldr r3, [r3, #0xc]
    ldr r6, [r3, #0x24]
    ldr r3, [r6, #0x8]
    cmp r1, r3
    ldmhsia sp!, {r4, r5, r6, pc}
    add ip, r6, #0x10
    mov r5, r1, asr #0x5
    and r3, r1, #0x1f
    mov r4, #0x1
    mov r4, r4, lsl r3
    ldr r3, [ip, r5, lsl #0x2]
    add r5, ip, r5, lsl #0x2
    ands r3, r3, r4
    ldmneia sp!, {r4, r5, r6, pc}
    add r3, r6, #0x100
    ldrh ip, [r3, #0x6a]
    ldr r3, [r0, #0x14]
    mul lr, r1, ip
    sub r3, r3, lr
    cmp r3, ip
    ldr r1, [r0, #0x10]
    movhi r3, ip
    cmp r1, #0x0
    beq .L_02161bd4
    mov r0, r2
    mov r2, r3
    add r1, r1, lr
    bl func_02051890
.L_02161bd4:
    ldr r0, [r5, #0x0]
    orr r0, r0, r4
    str r0, [r5, #0x0]
    ldr r0, [r6, #0xc]
    sub r0, r0, #0x1
    str r0, [r6, #0xc]
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    moveq r0, #0x4
    streqb r0, [r6, #0x1]
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r6, #0x100
    ldrh r0, [r0, #0x6c]
    ldr r4, [r6, #0x8]
    mov r5, r0
    cmp r0, r4
    subhs r5, r4, #0x1
.L_02161c18:
    add r0, r0, #0x1
    cmp r0, r4
    movhs r0, #0x0
    cmp r0, r5
    addeq r0, r6, #0x100
    ldreqh r0, [r0, #0x6e]
    beq .L_02161c80
    mov r1, r0, asr #0x5
    add r1, r6, r1, lsl #0x2
    and r2, r0, #0x1f
    mov r3, #0x1
    mov r2, r3, lsl r2
    ldr r1, [r1, #0x10]
    ands r1, r2, r1
    bne .L_02161c18
    mov r2, #0x0
.L_02161c58:
    add r1, r6, r2, lsl #0x1
    add r1, r1, #0x100
    ldrh r1, [r1, #0x6c]
    cmp r0, r1
    beq .L_02161c78
    add r2, r2, #0x1
    cmp r2, #0x2
    blt .L_02161c58
.L_02161c78:
    cmp r2, #0x2
    blt .L_02161c18
.L_02161c80:
    mov r1, #0x2
    sub r3, r1, #0x1
.L_02161c88:
    sub r1, r3, #0x1
    add r1, r6, r1, lsl #0x1
    add r1, r1, #0x100
    ldrh r2, [r1, #0x6c]
    add r1, r6, r3, lsl #0x1
    add r1, r1, #0x100
    sub r3, r3, #0x1
    strh r2, [r1, #0x6c]
    cmp r3, #0x0
    bgt .L_02161c88
    add r1, r6, #0x100
    strh r0, [r1, #0x6c]
    ldrh r0, [r1, #0x6c]
    strh r0, [r6, #0x2]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_02161b5c

    .global func_ov007_02161cc4
    arm_func_start func_ov007_02161cc4
func_ov007_02161cc4: ; 0x02161cc4
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x20]
    mov r5, r1
    ldr r1, [r2, #0xc]
    ldr r3, [r5, #0x0]
    ldr r4, [r1, #0x24]
    ldrh r2, [r4, #0x0]
    ldrh r1, [r4, #0x2]
    strh r2, [r3, #0x0]
    strh r1, [r3, #0x2]
    ldrh r2, [r4, #0x4]
    ldrh r1, [r4, #0x6]
    strh r2, [r3, #0x4]
    strh r1, [r3, #0x6]
    ldrb r2, [r4, #0x4]
    ldrb r1, [r4, #0x0]
    cmp r2, r1
    bne .L_02161d70
    ldrb r2, [r4, #0x5]
    ldr r1, [r5, #0x0]
    cmp r2, #0x1
    add r1, r1, #0x8
    beq .L_02161d30
    cmp r2, #0x2
    beq .L_02161d44
    b .L_02161d70
.L_02161d30:
    ldr r2, [r0, #0x4]
    strh r2, [r1, #0x0]
    ldrh r0, [r0, #0xc]
    strh r0, [r1, #0x2]
    b .L_02161d70
.L_02161d44:
    add r2, r4, #0x100
    ldrh ip, [r2, #0x68]
    ldrh r3, [r4, #0x6]
    ldr r2, [r0, #0x4]
    ldr r0, [r0, #0x0]
    mul lr, r3, ip
    sub r2, r2, lr
    cmp r2, ip
    movhi r2, ip
    add r0, r0, lr
    bl func_02051890
.L_02161d70:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x68]
    add r0, r0, #0x9
    bic r0, r0, #0x1
    strh r0, [r5, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov007_02161cc4

    .global func_ov007_02161d8c
    arm_func_start func_ov007_02161d8c
func_ov007_02161d8c: ; 0x02161d8c
    mov r0, #0x1
    bx lr
    arm_func_end func_ov007_02161d8c

    .global func_ov007_02161d94
    arm_func_start func_ov007_02161d94
func_ov007_02161d94: ; 0x02161d94
    bx lr
    arm_func_end func_ov007_02161d94

    .global func_ov007_02161d98
    arm_func_start func_ov007_02161d98
func_ov007_02161d98: ; 0x02161d98
    ldr ip, .L_02161da4
    ldr r0, .L_02161da8
    bx ip
.L_02161da4: .word func_ov007_0215ea60
.L_02161da8: .word data_ov007_0216a6cc
    arm_func_end func_ov007_02161d98

    .global func_ov007_02161dac
    arm_func_start func_ov007_02161dac
func_ov007_02161dac: ; 0x02161dac
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r1
    movs r6, r0
    mov r4, r2
    cmpne r5, #0x0
    beq .L_02161de4
    cmp r4, #0x0
    ble .L_02161de4
    cmp r4, #0x8000
    bgt .L_02161de4
    bl func_ov007_02161e50
    cmp r0, #0x0
    bne .L_02161dec
.L_02161de4:
    mov r0, #0x0
    b .L_02161e34
.L_02161dec:
    ldr r0, .L_02161e3c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xa000
    bl func_0201a418
    ldr r1, .L_02161e40
    mov r2, #0x2
    bl func_ov007_02160194
    ldr ip, .L_02161e44
    str r5, [sp, #0x0]
    ldr r0, .L_02161e48
    ldr r1, .L_02161e4c
    mov r2, r6
    mov r3, r4
    stmib sp, {r4, ip}
    bl func_ov007_0215ff3c
    bl func_ov007_02160114
    mov r0, #0x1
.L_02161e34:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02161e3c: .word data_020a0dd8
.L_02161e40: .word func_ov007_02161e80
.L_02161e44: .word data_ov007_0216a6f8
.L_02161e48: .word 0x80000472
.L_02161e4c: .word func_ov007_02161ed4
    arm_func_end func_ov007_02161dac

    .global func_ov007_02161e50
    arm_func_start func_ov007_02161e50
func_ov007_02161e50: ; 0x02161e50
    stmdb sp!, {r3, lr}
    bl func_ov007_02160064
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02161e50

    .global func_ov007_02161e68
    arm_func_start func_ov007_02161e68
func_ov007_02161e68: ; 0x02161e68
    stmdb sp!, {r3, lr}
    bl func_ov007_02161e50
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov007_02160074
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02161e68

    .global func_ov007_02161e80
    arm_func_start func_ov007_02161e80
func_ov007_02161e80: ; 0x02161e80
    stmdb sp!, {r4, lr}
    mov r4, r1
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
.L_02161e94: ; jump table
    b .L_02161eac ; case 0
    ldmia sp!, {r4, pc} ; case 1
    ldmia sp!, {r4, pc} ; case 2
    ldmia sp!, {r4, pc} ; case 3
    ldmia sp!, {r4, pc} ; case 4
    ldmia sp!, {r4, pc} ; case 5
.L_02161eac:
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_0201a9ec
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_0201a958
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02161e80

    .global func_ov007_02161ed4
    arm_func_start func_ov007_02161ed4
func_ov007_02161ed4: ; 0x02161ed4
    stmdb sp!, {r3, lr}
    bl func_ov007_02161e50
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov007_02160074
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02161ed4

    .global func_ov007_02161eec
    arm_func_start func_ov007_02161eec
func_ov007_02161eec: ; 0x02161eec
    stmdb sp!, {r4, lr}
    ldr r1, .L_02161fd4
    ldr r2, .L_02161fd8
    mov r0, #0xb0
    mov r3, #0x67
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0xb0
    mov r4, r0
    bl func_020517fc
    blx func_ov012_021b65bc
    blx func_0208822c
    mov r0, #0x3
    bl func_ov007_0214d66c
    bl func_ov007_0214d74c
    mov r3, #0x0
    strb r3, [r4, #0x8]
    strb r3, [r4, #0x9]
    strb r3, [r4, #0xb]
    strb r3, [r4, #0xc]
    mov r0, #0x1
    strb r0, [r4, #0xd]
    mov r0, #0x4
    str r0, [r4, #0x14]
    add r0, r4, #0x3c
    str r0, [r4, #0x18]
    mov r2, r3
    mov r0, #0x18
.L_02161f5c:
    mla r1, r3, r0, r4
    add r3, r3, #0x1
    strb r2, [r1, #0x3c]
    cmp r3, #0x4
    blt .L_02161f5c
    ldr r0, .L_02161fdc
    str r4, [r4, #0x1c]
    ldr r1, .L_02161fe0
    str r0, [r4, #0x20]
    ldr r0, .L_02161fe4
    str r1, [r4, #0x24]
    ldr r1, .L_02161fe8
    str r0, [r4, #0x28]
    ldr r0, .L_02161fec
    str r1, [r4, #0x2c]
    str r0, [r4, #0x30]
    mov r1, #0x1
    ldr r0, .L_02161ff0
    strb r1, [r4, #0xa1]
    ldr r0, [r0, #0x0]
    blx r0
    add r0, r4, #0x8
    bl func_ov007_02157b7c
    ldr r1, .L_02161ff4
    str r0, [r4, #0x0]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    strb r1, [r0, #0x430]
    ldr r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02161fd4: .word data_ov007_0216a71c
.L_02161fd8: .word data_ov007_0216a700
.L_02161fdc: .word func_ov007_02161ff8
.L_02161fe0: .word func_ov007_0216204c
.L_02161fe4: .word func_ov007_0216208c
.L_02161fe8: .word func_ov007_02162128
.L_02161fec: .word func_ov007_02162174
.L_02161ff0: .word data_020a0e18
.L_02161ff4: .word data_020a0f64
    arm_func_end func_ov007_02161eec

    .global func_ov007_02161ff8
    arm_func_start func_ov007_02161ff8
func_ov007_02161ff8: ; 0x02161ff8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02162044
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x4]
    ldr r2, .L_02162048
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    ldmia sp!, {r4, pc}
.L_02162044: .word func_ov007_021621e4
.L_02162048: .word func_ov007_021624ac
    arm_func_end func_ov007_02161ff8

    .global func_ov007_0216204c
    arm_func_start func_ov007_0216204c
func_ov007_0216204c: ; 0x0216204c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0216206c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0216206c:
    mov r0, r4
    bl func_0201b244
    ldr r0, .L_02162088
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    strb r1, [r0, #0x430]
    ldmia sp!, {r4, pc}
.L_02162088: .word data_020a0f64
    arm_func_end func_ov007_0216204c

    .global func_ov007_0216208c
    arm_func_start func_ov007_0216208c
func_ov007_0216208c: ; 0x0216208c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r7, r0
    ldrb r0, [r7, #0xa0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    ldrb r0, [r7, #0xa1]
    cmp r0, #0x0
    beq .L_02162120
    mov r5, #0x0
    mov r6, r5
    add r10, r7, #0x40
    mov r4, #0x1
    mov r9, #0x14
    mov r8, #0x18
.L_021620c8:
    mov r0, r6
    bl func_ov007_0214d7d4
    cmp r0, #0x0
    beq .L_021620f4
    mul r1, r5, r8
    add r3, r7, r1
    mov r2, r9
    add r1, r10, r1
    strb r4, [r3, #0x3c]
    bl func_02051890
    add r5, r5, #0x1
.L_021620f4:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_021620c8
    mov r2, #0x0
    mov r0, #0x18
    b .L_02162118
.L_0216210c:
    mla r1, r5, r0, r7
    strb r2, [r1, #0x3c]
    add r5, r5, #0x1
.L_02162118:
    cmp r5, #0x4
    blt .L_0216210c
.L_02162120:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    arm_func_end func_ov007_0216208c

    .global func_ov007_02162128
    arm_func_start func_ov007_02162128
func_ov007_02162128: ; 0x02162128
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    blx func_ov012_021b65bc
    str r4, [r5, #0x9c]
    ldr r0, [r5, #0x0]
    blx func_ov007_021586b0
    mov r1, #0x68
    mov r2, #0x0
    blx func_ov012_021bd730
    bl func_020882e0
    bl func_ov007_0214d888
    ldr r0, [r5, #0x4]
    ldr r1, .L_02162170
    ldr r0, [r0, #0x4]
    bl func_02028384
    blx func_ov012_021b65cc
    ldmia sp!, {r3, r4, r5, pc}
.L_02162170: .word func_ov007_021621e8
    arm_func_end func_ov007_02162128

    .global func_ov007_02162174
    arm_func_start func_ov007_02162174
func_ov007_02162174: ; 0x02162174
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b65bc
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    ble .L_021621bc
    ldr r0, [r4, #0x4]
    ldr r1, .L_021621e0
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x1
    bl func_ov007_0214d6bc
    bl func_ov007_0214dd50
    mov r1, #0x1
    bl func_ov007_0214dd60
    mov r0, #0x1
    strb r0, [r4, #0xa0]
    b .L_021621d4
.L_021621bc:
    bne .L_021621d4
    mov r0, #0x1
    bl func_ov007_0214d6bc
    bl func_ov007_0214dd50
    mov r1, #0x1
    bl func_ov007_0214dd60
.L_021621d4:
    mvn r0, #0x0
    str r0, [r4, #0x9c]
    ldmia sp!, {r4, pc}
.L_021621e0: .word func_ov007_021621e4
    arm_func_end func_ov007_02162174

    .global func_ov007_021621e4
    arm_func_start func_ov007_021621e4
func_ov007_021621e4: ; 0x021621e4
    bx lr
    arm_func_end func_ov007_021621e4

    .global func_ov007_021621e8
    arm_func_start func_ov007_021621e8
func_ov007_021621e8: ; 0x021621e8
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x1
    ldr r4, [r1, #0x10]
    strb r0, [r4, #0xc]
    bl func_ov007_0214d930
    cmp r0, #0x0
    bne .L_0216223c
    bl func_ov007_0214d948
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    blx func_ov012_021b65bc
    mvn r0, #0x0
    str r0, [r4, #0x9c]
    mov r0, #0x7
    bl func_ov007_0214d724
    ldr r0, [r4, #0x4]
    ldr r1, .L_021622cc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0216223c:
    bl func_ov007_0214d958
    cmp r0, #0x0
    bne .L_02162270
    blx func_ov012_021b65bc
    mvn r0, #0x0
    str r0, [r4, #0x9c]
    mov r0, #0x7
    bl func_ov007_0214d724
    ldr r0, [r4, #0x4]
    ldr r1, .L_021622cc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02162270:
    mov r0, #0x1
    strb r0, [r4, #0xa]
    blx func_ov012_021b65bc
    mov r0, #0x5
    bl func_ov007_0214d508
    mov r3, #0x0
    strh r3, [r4, #0xa2]
    mov r2, #0x1
.L_02162290:
    tst r0, r2, lsl r3
    ldrneh r1, [r4, #0xa2]
    add r3, r3, #0x1
    addne r1, r1, #0x1
    strneh r1, [r4, #0xa2]
    cmp r3, #0x20
    blt .L_02162290
    mov r0, #0x0
    strh r0, [r4, #0xa4]
    str r0, [r4, #0xa8]
    ldr r0, [r4, #0x4]
    ldr r1, .L_021622d0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021622cc: .word func_ov007_021622d4
.L_021622d0: .word func_ov007_0216231c
    arm_func_end func_ov007_021621e8

    .global func_ov007_021622d4
    arm_func_start func_ov007_021622d4
func_ov007_021622d4: ; 0x021622d4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r0, .L_02162314
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    strb r1, [r0, #0x29]
    bl func_ov007_0214dd50
    mov r1, #0x5
    bl func_ov007_0214dd6c
    mov r0, #0x1
    strb r0, [r4, #0xa0]
    ldr r0, [r5, #0x4]
    ldr r1, .L_02162318
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02162314: .word data_020afe90
.L_02162318: .word func_ov007_021621e4
    arm_func_end func_ov007_021622d4

    .global func_ov007_0216231c
    arm_func_start func_ov007_0216231c
func_ov007_0216231c: ; 0x0216231c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    ldr r0, .L_02162370
    ldr r3, [r1, #0x10]
    mov r1, #0x1
    strb r1, [r0, #0x29]
    strb r1, [r0, #0x28]
    mov r1, #0x5
    strb r1, [r0, #0x20]
    mov r0, #0x0
    strb r0, [r3, #0xa1]
    str r0, [r3, #0xac]
    ldrh r2, [r3, #0xa2]
    ldr r0, [r3, #0x4]
    mov r1, #0x3
    blx func_0208b9a0
    ldr r0, [r4, #0x4]
    ldr r1, .L_02162374
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02162370: .word data_020afe90
.L_02162374: .word func_ov007_02162378
    arm_func_end func_ov007_0216231c

    .global func_ov007_02162378
    arm_func_start func_ov007_02162378
func_ov007_02162378: ; 0x02162378
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0208c220
    cmp r0, #0x0
    beq .L_021623b4
    mvn r0, #0x0
    str r0, [r4, #0xa8]
    mov r0, #0x0
    bl func_ov007_0214d6bc
    ldr r0, [r5, #0x4]
    ldr r1, .L_0216241c
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_021623b4:
    blx func_0208bce4
    ldrh r1, [r4, #0xa2]
    add r1, r1, #0x1
    cmp r1, r0
    bne .L_021623e8
    mov r0, #0x1
    str r0, [r4, #0xa8]
    blx func_0208c174
    blx func_0208bf9c
    ldr r0, [r5, #0x4]
    ldr r1, .L_02162420
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_021623e8:
    ldr r0, [r4, #0xac]
    add r0, r0, #0x1
    str r0, [r4, #0xac]
    cmp r0, #0x2d0
    ldmlsia sp!, {r3, r4, r5, pc}
    mov r0, #0x9
    bl func_ov007_0214d724
    mvn r0, #0x1
    str r0, [r4, #0xa8]
    ldr r0, [r5, #0x4]
    ldr r1, .L_0216241c
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0216241c: .word func_ov007_02162464
.L_02162420: .word func_ov007_02162424
    arm_func_end func_ov007_02162378

    .global func_ov007_02162424
    arm_func_start func_ov007_02162424
func_ov007_02162424: ; 0x02162424
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0208c248
    bl func_ov007_02167fb8
    bl func_ov007_0214dd50
    mov r1, #0x5
    bl func_ov007_0214dd6c
    mov r0, #0x1
    strb r0, [r4, #0xa0]
    ldr r0, [r5, #0x4]
    ldr r1, .L_02162460
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02162460: .word func_ov007_021621e4
    arm_func_end func_ov007_02162424

    .global func_ov007_02162464
    arm_func_start func_ov007_02162464
func_ov007_02162464: ; 0x02162464
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r0, .L_021624a4
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    strb r1, [r0, #0x29]
    bl func_ov007_0214dd50
    mov r1, #0x5
    bl func_ov007_0214dd6c
    mov r0, #0x1
    strb r0, [r4, #0xa0]
    ldr r0, [r5, #0x4]
    ldr r1, .L_021624a8
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_021624a4: .word data_020afe90
.L_021624a8: .word func_ov007_021621e4
    arm_func_end func_ov007_02162464

    .global func_ov007_021624ac
    arm_func_start func_ov007_021624ac
func_ov007_021624ac: ; 0x021624ac
    stmdb sp!, {r4, lr}
    mov r4, r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_021624ac

    .global func_ov007_021624e8
    arm_func_start func_ov007_021624e8
func_ov007_021624e8: ; 0x021624e8
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_02162640
    ldr r2, .L_02162644
    mov r0, #0x4c
    mov r3, #0x54
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x4c
    mov r4, r0
    bl func_020517fc
    mov r2, #0x0
    mvn r1, #0x0
.L_0216251c:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x8]
    cmp r2, #0xc
    blt .L_0216251c
    bl func_ov007_02158c68
    mov r0, #0x2
    bl func_ov007_02158e40
    bl func_020310f4
    ldr r2, .L_02162648
    str r0, [r4, #0x0]
    ldr r1, .L_0216264c
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_02162650
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    bl func_ov007_021599e8
    str r0, [r4, #0x44]
    bl func_ov007_02159aec
    str r0, [r4, #0x48]
    str r4, [r0, #0x10]
    ldr r0, [r4, #0x48]
    ldr r1, .L_02162654
    ldr r2, .L_02162658
    str r1, [r0, #0x14]
    ldr r0, [r4, #0x48]
    ldr r1, .L_0216265c
    str r2, [r0, #0x18]
    ldr r0, [r4, #0x48]
    ldr r2, .L_02162660
    str r1, [r0, #0x1c]
    ldr r0, [r4, #0x48]
    ldr r1, .L_02162664
    str r2, [r0, #0x20]
    ldr r0, [r4, #0x48]
    mov r2, #0x0
    str r1, [r0, #0x24]
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    strb r2, [r0, #0x0]
    ldr r0, [r4, #0x48]
    strb r2, [r0, #0x1]
    ldr r0, [r4, #0x48]
    strb r1, [r0, #0x2]
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02162668
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r1, [r4, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x48]
    bl func_ov007_0215656c
    str r0, [r4, #0x40]
    ldr r0, [r4, #0x0]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02162640: .word data_ov007_0216a754
.L_02162644: .word data_ov007_0216a738
.L_02162648: .word data_02093c04
.L_0216264c: .word data_020a0e80
.L_02162650: .word data_020a16c0
.L_02162654: .word func_ov007_02162730
.L_02162658: .word func_ov007_02162734
.L_0216265c: .word func_ov007_02162784
.L_02162660: .word func_ov007_0216278c
.L_02162664: .word func_ov007_021627d0
.L_02162668: .word func_ov007_0216266c
    arm_func_end func_ov007_021624e8

    .global func_ov007_0216266c
    arm_func_start func_ov007_0216266c
func_ov007_0216266c: ; 0x0216266c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02073fe4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02162690
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02162690: .word func_ov007_02162694
    arm_func_end func_ov007_0216266c

    .global func_ov007_02162694
    arm_func_start func_ov007_02162694
func_ov007_02162694: ; 0x02162694
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x40]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x44]
    bl func_ov007_02159ac0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    bge .L_021626d4
    mov r0, #0x1
    bl func_ov007_02158d24
    bl func_02086c24
.L_021626d4:
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02162724
    ldr r2, .L_02162728
    ldr r3, [r1, #0x0]
    ldr r0, .L_0216272c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_02162724: .word data_02093c04
.L_02162728: .word data_020a16c0
.L_0216272c: .word data_020a0e80
    arm_func_end func_ov007_02162694

    .global func_ov007_02162730
    arm_func_start func_ov007_02162730
func_ov007_02162730: ; 0x02162730
    bx lr
    arm_func_end func_ov007_02162730

    .global func_ov007_02162734
    arm_func_start func_ov007_02162734
func_ov007_02162734: ; 0x02162734
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    bge .L_02162754
    bl func_ov007_0214dd50
    mov r1, #0x7
    bl func_ov007_0214dd6c
    ldmia sp!, {r3, pc}
.L_02162754:
    ldr r0, .L_02162780
    cmp r1, r0
    bne .L_02162770
    bl func_ov007_0214dd50
    mov r1, #0x8
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
.L_02162770:
    bl func_ov007_0214dd50
    mov r1, #0x9
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
.L_02162780: .word 0x7ff0
    arm_func_end func_ov007_02162734

    .global func_ov007_02162784
    arm_func_start func_ov007_02162784
func_ov007_02162784: ; 0x02162784
    mov r0, #0x1
    bx lr
    arm_func_end func_ov007_02162784

    .global func_ov007_0216278c
    arm_func_start func_ov007_0216278c
func_ov007_0216278c: ; 0x0216278c
    stmdb sp!, {r4, lr}
    ldr r2, .L_021627cc
    mov r4, r0
    str r1, [r4, #0x38]
    cmp r1, r2
    ldmeqia sp!, {r4, pc}
    str r1, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    blx func_ov007_02157118
    ldr r0, [r4, #0x3c]
    mov r1, #0x0
    bl func_ov007_02159700
    bl func_ov007_0214dd50
    mov r1, #0x9
    bl func_ov007_0214dd60
    ldmia sp!, {r4, pc}
.L_021627cc: .word 0x7ff0
    arm_func_end func_ov007_0216278c

    .global func_ov007_021627d0
    arm_func_start func_ov007_021627d0
func_ov007_021627d0: ; 0x021627d0
    ldr ip, .L_021627e0
    mvn r1, #0x0
    str r1, [r0, #0x38]
    bx ip
.L_021627e0: .word func_ov007_02158e84
    arm_func_end func_ov007_021627d0

    .global func_ov007_021627e4
    arm_func_start func_ov007_021627e4
func_ov007_021627e4: ; 0x021627e4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02162994
    mov r5, r0
    ldr r2, .L_02162998
    mov r0, #0x168
    mov r3, #0x5f
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x168
    mov r4, r0
    bl func_020517fc
    mov r0, #0x1
    strb r0, [r4, #0xad]
    strb r5, [r4, #0xac]
    strb r0, [r4, #0xae]
    ldrb r0, [r4, #0xac]
    cmp r0, #0x0
    beq .L_02162834
    mov r0, #0x2
    bl func_ov007_02158de0
.L_02162834:
    bl func_020310f4
    ldr r2, .L_0216299c
    str r0, [r4, #0x0]
    ldr r1, .L_021629a0
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_021629a4
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    ldr r0, [r4, #0x0]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    mov r0, #0x0
    bl func_02028920
    str r0, [r4, #0x8]
    mov r3, #0x0
    strb r3, [r4, #0xc]
    strb r3, [r4, #0xd]
    mov r0, #0x1
    strb r0, [r4, #0xf]
    strb r3, [r4, #0x10]
    strb r5, [r4, #0x11]
    mov r0, #0x4
    str r0, [r4, #0x18]
    add r0, r4, #0x40
    str r0, [r4, #0x1c]
    mov r2, r3
    mov r0, #0x18
.L_021628bc:
    mla r1, r3, r0, r4
    add r3, r3, #0x1
    strb r2, [r1, #0x40]
    cmp r3, #0x4
    blt .L_021628bc
    ldrb r0, [r4, #0xac]
    cmp r0, #0x0
    beq .L_021628f4
    blx func_02071f08
    add r1, r4, #0x44
    mov r2, #0x14
    bl func_02051890
    mov r0, #0x1
    strb r0, [r4, #0x40]
.L_021628f4:
    ldr r0, .L_021629a8
    str r4, [r4, #0x20]
    str r0, [r4, #0x2c]
    ldr r1, .L_021629ac
    ldr r0, .L_021629b0
    str r1, [r4, #0x30]
    str r0, [r4, #0x34]
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_021629b4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r1, [r4, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_021629b8
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    bl func_ov007_02158d7c
    bl func_020882e0
    bl func_02088330
    add r0, r4, #0xc
    bl func_ov007_02157b7c
    str r0, [r4, #0xa8]
    ldr r0, [r4, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
.L_02162994: .word data_ov007_0216a790
.L_02162998: .word data_ov007_0216a770
.L_0216299c: .word data_02093c04
.L_021629a0: .word data_020a0e80
.L_021629a4: .word data_020a16c0
.L_021629a8: .word func_ov007_02162dcc
.L_021629ac: .word func_ov007_02162f50
.L_021629b0: .word func_ov007_02162f78
.L_021629b4: .word func_ov007_02162f94
.L_021629b8: .word func_ov007_021629dc
    arm_func_end func_ov007_021627e4

    .global func_ov007_021629bc
    arm_func_start func_ov007_021629bc
func_ov007_021629bc: ; 0x021629bc
    ldr ip, .L_021629c8
    mov r0, #0x1
    bx ip
.L_021629c8: .word func_ov007_021627e4
    arm_func_end func_ov007_021629bc

    .global func_ov007_021629cc
    arm_func_start func_ov007_021629cc
func_ov007_021629cc: ; 0x021629cc
    ldr ip, .L_021629d8
    mov r0, #0x0
    bx ip
.L_021629d8: .word func_ov007_021627e4
    arm_func_end func_ov007_021629cc

    .global func_ov007_021629dc
    arm_func_start func_ov007_021629dc
func_ov007_021629dc: ; 0x021629dc
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x70000004
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x1b
    beq .L_02162a28
    cmp r0, #0x23
    beq .L_02162a90
    ldmia sp!, {r4, r5, r6, pc}
.L_02162a28:
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r1, .L_02162af8
    ldr r2, [r2, #0x4]
    ldr r6, [r1, #0x8]
    blx r2
    cmp r0, r6
    beq .L_02162a7c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldr r2, [r4, #0xb4]
    mov r1, #0x1
    orr r1, r2, r1, lsl r0
    mov r0, r5
    str r1, [r4, #0xb4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    str r0, [r4, #0xbc]
.L_02162a7c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
.L_02162a90:
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r1, .L_02162af8
    ldr r2, [r2, #0x4]
    ldr r6, [r1, #0x8]
    blx r2
    cmp r0, r6
    beq .L_02162ae4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldr r2, [r4, #0xb8]
    mov r1, #0x1
    orr r1, r2, r1, lsl r0
    mov r0, r5
    str r1, [r4, #0xb8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    str r0, [r4, #0xbc]
.L_02162ae4:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
.L_02162af8: .word data_020afe90
    arm_func_end func_ov007_021629dc

    .global func_ov007_02162afc
    arm_func_start func_ov007_02162afc
func_ov007_02162afc: ; 0x02162afc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02086c4c
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r5, #0xae]
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0x0
    beq .L_02162b4c
    bl func_020882c4
    cmp r0, #0x0
    beq .L_02162b4c
    bl func_02088290
    bl func_02086c94
    mov r0, #0x0
    strb r0, [r5, #0xae]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02162b4c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov007_02162afc

    .global func_ov007_02162b54
    arm_func_start func_ov007_02162b54
func_ov007_02162b54: ; 0x02162b54
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0xa8]
    mov r1, #0x1
    blx func_ov007_021586bc
    mov r0, #0x0
    strb r0, [r4, #0xad]
    bl func_020876ac
    bl func_0208712c
    ldr r0, .L_02162dc4
    ldr r0, [r0, #0x0]
    blx r0
    ldr r5, .L_02162dc4
    mov r6, #0x1
.L_02162b90:
    bl func_020876ac
    eor r0, r0, #0x1
    bl func_02088310
    cmp r0, #0x0
    bne .L_02162bc4
    mov r0, r4
    mov r1, r6
    bl func_ov007_02162afc
    cmp r0, #0x0
    bne .L_02162dbc
    ldr r0, [r5, #0x0]
    blx r0
    b .L_02162b90
.L_02162bc4:
    bl func_020882e0
    blx func_02071f08
    mov r5, r0
    blx func_02070fd4
    add r1, r5, #0x40
    bl func_ov010_0219bacc
    ldr r0, .L_02162dc8
    ldrb r0, [r0, #0x24]
    blx func_02071f10
    add r1, r4, #0xc0
    mov r2, #0x5c
    bl func_02051890
    blx func_02071f08
    add r1, r4, #0x11c
    mov r2, #0x4c
    bl func_02051890
    bl func_020876ac
    mov r1, r0
    add r0, r4, #0x11c
    bl func_02086e04
    ldr r0, .L_02162dc4
    ldr r0, [r0, #0x0]
    blx r0
    bl func_020876ac
    mov r1, r0
    add r0, r4, #0xc0
    bl func_02086e38
    mov r6, #0x1
    ldr r5, .L_02162dc4
    b .L_02162c58
.L_02162c3c:
    mov r0, r4
    mov r1, r6
    bl func_ov007_02162afc
    cmp r0, #0x0
    bne .L_02162dbc
    ldr r0, [r5, #0x0]
    blx r0
.L_02162c58:
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    ldrne r0, [r4, #0xb4]
    cmpne r0, #0x0
    beq .L_02162c3c
    bl func_020876ac
    bl func_0208712c
    ldr r0, .L_02162dc4
    ldr r0, [r0, #0x0]
    blx r0
    bl func_020876ac
    cmp r0, #0x0
    bne .L_02162cdc
    mov r6, #0x1
    ldr r5, .L_02162dc4
    mov r7, r6
.L_02162c98:
    mov r0, r7
    mov r8, r7
    bl func_02088310
    cmp r0, #0x0
    addne r8, r7, #0x1
    cmp r8, #0x2
    beq .L_02162cd4
    mov r0, r4
    mov r1, r6
    bl func_ov007_02162afc
    cmp r0, #0x0
    bne .L_02162dbc
    ldr r0, [r5, #0x0]
    blx r0
    b .L_02162c98
.L_02162cd4:
    bl func_ov007_02158e84
    b .L_02162d10
.L_02162cdc:
    mov r6, #0x0
    ldr r5, .L_02162dc4
    b .L_02162d04
.L_02162ce8:
    mov r0, r4
    mov r1, r6
    bl func_ov007_02162afc
    cmp r0, #0x0
    bne .L_02162dbc
    ldr r0, [r5, #0x0]
    blx r0
.L_02162d04:
    bl func_ov007_021598b8
    cmp r0, #0x0
    beq .L_02162ce8
.L_02162d10:
    mov r0, #0x1
    bl func_ov007_02158d24
    bl func_02086c24
    ldr r0, [r4, #0xbc]
    bl func_02070cdc
    blx func_02072134
    movs r6, r0
    bpl .L_02162d38
    blx func_02072090
    mov r6, r0
.L_02162d38:
    ldr r0, [r4, #0xbc]
    bl func_02070cdc
    mov r5, r0
    ldr r0, [r4, #0xbc]
    bl func_02070ca4
    mov r2, r0
    mov r0, r6
    mov r1, r5
    mov r3, #0x4
    bl func_ov007_02151888
    ldr r0, .L_02162dc8
    mov r1, #0x2
    strb r1, [r0, #0x20]
    strb r6, [r0, #0x24]
    ldr r0, [r4, #0xa8]
    blx func_ov007_021586a4
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r1, #0x4d
    mov r3, r2
    mov r5, r0
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
    ldr r4, .L_02162dc4
    b .L_02162dac
.L_02162da4:
    ldr r0, [r4, #0x0]
    blx r0
.L_02162dac:
    mov r0, r5
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02162da4
.L_02162dbc:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02162dc4: .word data_020a0e18
.L_02162dc8: .word data_020afe90
    arm_func_end func_ov007_02162b54

    .global func_ov007_02162dcc
    arm_func_start func_ov007_02162dcc
func_ov007_02162dcc: ; 0x02162dcc
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldrb r1, [r4, #0xa4]
    cmp r1, #0x0
    movne r0, #0x0
    bne .L_02162f44
    ldrb r1, [r4, #0xad]
    cmp r1, #0x0
    beq .L_02162f40
    ldr r1, [r4, #0xb0]
    cmp r1, #0x0
    ble .L_02162ea0
    mov r1, #0x1
    bl func_ov007_02162afc
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02162f44
    bl func_020876f8
    cmp r0, #0x0
    beq .L_02162e80
    bl func_02086d80
    mov r6, #0x1
    mov r0, r6, lsl r0
    mov r8, r6
    sub r7, r0, #0x1
    mov r5, r6
    b .L_02162e50
.L_02162e3c:
    mov r0, r8
    bl func_02088310
    cmp r0, #0x0
    orrne r6, r6, r5, lsl r8
    add r8, r8, #0x1
.L_02162e50:
    bl func_02086d80
    cmp r8, r0
    blo .L_02162e3c
    and r0, r7, r6
    cmp r7, r0
    bne .L_02162ebc
    bl func_020882e0
    bl func_02087160
    mov r0, r4
    bl func_ov007_02162b54
    mov r0, #0x0
    b .L_02162f44
.L_02162e80:
    bl func_02088360
    cmp r0, #0x0
    beq .L_02162ebc
    bl func_02088330
    mov r0, r4
    bl func_ov007_02162b54
    mov r0, #0x0
    b .L_02162f44
.L_02162ea0:
    bl func_ov007_02159868
    cmp r0, #0x0
    beq .L_02162ebc
    bl func_020876ac
    bl func_0208712c
    mov r0, #0x1
    str r0, [r4, #0xb0]
.L_02162ebc:
    bl func_ov007_021598b8
    cmp r0, #0x0
    beq .L_02162f40
    mvn r0, #0x1
    str r0, [r4, #0xb0]
    ldr r0, [r4, #0xa8]
    mov r1, #0x1
    blx func_ov007_021586bc
    ldr r0, [r4, #0xa8]
    blx func_ov007_021586a4
    mov r5, r0
    mov r0, #0x78
    mov r1, #0xb
    bl func_0207342c
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, r5
    mov r1, #0x51
    mov r3, r2
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
    ldr r4, .L_02162f4c
    b .L_02162f28
.L_02162f20:
    ldr r0, [r4, #0x0]
    blx r0
.L_02162f28:
    mov r0, r5
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02162f20
    mov r0, #0x0
    b .L_02162f44
.L_02162f40:
    mov r0, #0x1
.L_02162f44:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02162f4c: .word data_020a0e18
    arm_func_end func_ov007_02162dcc

    .global func_ov007_02162f50
    arm_func_start func_ov007_02162f50
func_ov007_02162f50: ; 0x02162f50
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xa8]
    mov r1, #0x1
    blx func_ov007_021586bc
    blx func_0208c174
    blx func_0208bf9c
    mov r0, #0x1
    str r0, [r4, #0xb0]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02162f50

    .global func_ov007_02162f78
    arm_func_start func_ov007_02162f78
func_ov007_02162f78: ; 0x02162f78
    stmdb sp!, {r3, lr}
    mvn r1, #0x0
    str r1, [r0, #0xb0]
    bl func_ov007_0214dd50
    mov r1, #0x7
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02162f78

    .global func_ov007_02162f94
    arm_func_start func_ov007_02162f94
func_ov007_02162f94: ; 0x02162f94
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02073fe4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02162fb8
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02162fb8: .word func_ov007_02162fbc
    arm_func_end func_ov007_02162f94

    .global func_ov007_02162fbc
    arm_func_start func_ov007_02162fbc
func_ov007_02162fbc: ; 0x02162fbc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, [r0, #0x4]
    ldr r10, [r1, #0x10]
    ldr r1, [r10, #0xa8]
    ldr r6, [r10, #0x1c]
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x224]
    cmp r1, #0x0
    beq .L_02162ff0
    ldr r0, [r0, #0x4]
    ldr r1, .L_02163144
    bl func_02028384
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02162ff0:
    ldrb r0, [r10, #0xad]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldrb r0, [r10, #0xac]
    cmp r0, #0x0
    beq .L_021630ac
    bl func_ov007_02159788
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    bl func_ov007_02159770
    mov r8, #0x1
    mov r9, #0x0
    mov r7, r0
    mov r5, r8
    mov r4, r9
    mov r11, #0x18
.L_02163030:
    ldrsb r0, [r7, #0x0]
    cmp r0, #0x0
    beq .L_0216306c
    ldrsb r0, [r7, #0x20]
    cmp r0, #0x0
    bne .L_0216306c
    mul r0, r8, r11
    add r3, r6, r0
    strb r5, [r6, r0]
    mov r2, #0x14
    add r0, r7, #0xa
    add r1, r3, #0x4
    strb r4, [r3, #0x1]
    bl func_02051890
    add r8, r8, #0x1
.L_0216306c:
    add r9, r9, #0x1
    cmp r9, #0xb
    add r7, r7, #0x22
    blt .L_02163030
    mov r2, #0x0
    mov r0, #0x18
    b .L_02163094
.L_02163088:
    mul r1, r8, r0
    strb r2, [r6, r1]
    add r8, r8, #0x1
.L_02163094:
    cmp r8, #0x4
    blt .L_02163088
    bl func_ov007_021597fc
    strb r0, [r10, #0xd]
    bl func_ov007_0215979c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021630ac:
    bl func_ov007_0215988c
    cmp r0, #0x0
    blt .L_02163138
    bl func_ov007_0215988c
    mov r1, #0x1
    str r0, [r10, #0x14]
    strb r1, [r10, #0xa0]
    ldr r0, [r10, #0x14]
    mov r7, #0x0
    add r0, r10, r0
    mov r8, r7
    strb r1, [r0, #0xa0]
    mov r5, r1
    mov r11, #0x14
    mov r4, #0x18
.L_021630e8:
    cmp r8, #0x0
    ldrne r0, [r10, #0x14]
    cmpne r8, r0
    beq .L_02163108
    mov r0, r8
    bl func_ov007_02159840
    cmp r0, #0x0
    beq .L_0216312c
.L_02163108:
    mul r1, r7, r4
    mov r0, r8
    add r9, r6, r1
    strb r5, [r6, r1]
    bl func_02070cdc
    mov r2, r11
    add r1, r9, #0x4
    bl func_02051890
    add r7, r7, #0x1
.L_0216312c:
    add r8, r8, #0x1
    cmp r8, #0x4
    blt .L_021630e8
.L_02163138:
    bl func_ov007_021597fc
    strb r0, [r10, #0xd]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02163144: .word func_ov007_02163148
    arm_func_end func_ov007_02162fbc

    .global func_ov007_02163148
    arm_func_start func_ov007_02163148
func_ov007_02163148: ; 0x02163148
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xb0]
    cmp r0, #0x0
    bge .L_02163170
    bl func_ov007_0214dd50
    mov r1, #0x7
    bl func_ov007_0214dd60
    b .L_0216317c
.L_02163170:
    bl func_ov007_0214dd50
    mov r1, #0x7
    bl func_ov007_0214dd6c
.L_0216317c:
    ldr r0, .L_0216320c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0216320c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0216320c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0216320c
    ldr r0, [r0, #0x0]
    blx r0
    ldrb r0, [r4, #0xae]
    bl func_ov007_02158d24
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_021631cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021631cc:
    ldr r1, .L_02163210
    ldr r2, .L_02163214
    ldr r3, [r1, #0x0]
    ldr r0, .L_02163218
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_0216320c: .word data_020a0e18
.L_02163210: .word data_02093c04
.L_02163214: .word data_020a16c0
.L_02163218: .word data_020a0e80
    arm_func_end func_ov007_02163148

    .global func_ov007_0216321c
    arm_func_start func_ov007_0216321c
func_ov007_0216321c: ; 0x0216321c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_02163370
    ldr r2, .L_02163374
    mov r0, #0x4c
    mov r3, #0x56
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x4c
    mov r4, r0
    bl func_020517fc
    mov r2, #0x0
    mvn r1, #0x0
.L_02163250:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x8]
    cmp r2, #0xc
    blt .L_02163250
    bl func_ov007_02158c68
    mov r0, #0x1
    bl func_ov007_02158e40
    bl func_020310f4
    ldr r2, .L_02163378
    str r0, [r4, #0x0]
    ldr r1, .L_0216337c
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_02163380
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    bl func_ov007_021599e8
    str r0, [r4, #0x44]
    bl func_ov007_02159aec
    str r0, [r4, #0x48]
    str r4, [r0, #0x10]
    ldr r0, [r4, #0x48]
    ldr r2, .L_02163384
    ldr r1, .L_02163388
    str r2, [r0, #0x14]
    ldr r0, [r4, #0x48]
    ldr r2, .L_0216338c
    str r1, [r0, #0x18]
    ldr r0, [r4, #0x48]
    ldr r1, .L_02163390
    str r2, [r0, #0x1c]
    ldr r0, [r4, #0x48]
    ldr r2, .L_02163394
    str r1, [r0, #0x20]
    ldr r0, [r4, #0x48]
    mov r1, #0x0
    str r2, [r0, #0x24]
    ldr r0, [r4, #0x48]
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x48]
    strb r1, [r0, #0x1]
    ldr r0, [r4, #0x48]
    strb r1, [r0, #0x2]
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02163398
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r1, [r4, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x48]
    bl func_ov007_0215656c
    str r0, [r4, #0x40]
    ldr r0, [r4, #0x0]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02163370: .word data_ov007_0216a7c8
.L_02163374: .word data_ov007_0216a7ac
.L_02163378: .word data_02093c04
.L_0216337c: .word data_020a0e80
.L_02163380: .word data_020a16c0
.L_02163384: .word func_ov007_02163460
.L_02163388: .word func_ov007_02163464
.L_0216338c: .word func_ov007_021634b4
.L_02163390: .word func_ov007_021634bc
.L_02163394: .word func_ov007_02163500
.L_02163398: .word func_ov007_0216339c
    arm_func_end func_ov007_0216321c

    .global func_ov007_0216339c
    arm_func_start func_ov007_0216339c
func_ov007_0216339c: ; 0x0216339c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02073fe4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_021633c0
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021633c0: .word func_ov007_021633c4
    arm_func_end func_ov007_0216339c

    .global func_ov007_021633c4
    arm_func_start func_ov007_021633c4
func_ov007_021633c4: ; 0x021633c4
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x40]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x44]
    bl func_ov007_02159ac0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    bge .L_02163404
    mov r0, #0x1
    bl func_ov007_02158d24
    bl func_02086c24
.L_02163404:
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02163454
    ldr r2, .L_02163458
    ldr r3, [r1, #0x0]
    ldr r0, .L_0216345c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_02163454: .word data_02093c04
.L_02163458: .word data_020a16c0
.L_0216345c: .word data_020a0e80
    arm_func_end func_ov007_021633c4

    .global func_ov007_02163460
    arm_func_start func_ov007_02163460
func_ov007_02163460: ; 0x02163460
    bx lr
    arm_func_end func_ov007_02163460

    .global func_ov007_02163464
    arm_func_start func_ov007_02163464
func_ov007_02163464: ; 0x02163464
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    bge .L_02163484
    bl func_ov007_0214dd50
    mov r1, #0x1
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
.L_02163484:
    ldr r0, .L_021634b0
    cmp r1, r0
    bne .L_021634a0
    bl func_ov007_0214dd50
    mov r1, #0xc
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
.L_021634a0:
    bl func_ov007_0214dd50
    mov r1, #0xd
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
.L_021634b0: .word 0x7ff0
    arm_func_end func_ov007_02163464

    .global func_ov007_021634b4
    arm_func_start func_ov007_021634b4
func_ov007_021634b4: ; 0x021634b4
    mov r0, #0x1
    bx lr
    arm_func_end func_ov007_021634b4

    .global func_ov007_021634bc
    arm_func_start func_ov007_021634bc
func_ov007_021634bc: ; 0x021634bc
    stmdb sp!, {r4, lr}
    ldr r2, .L_021634fc
    mov r4, r0
    str r1, [r4, #0x38]
    cmp r1, r2
    ldmeqia sp!, {r4, pc}
    str r1, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    blx func_ov007_02157118
    ldr r0, [r4, #0x3c]
    mov r1, #0x0
    bl func_ov007_02159700
    bl func_ov007_0214dd50
    mov r1, #0xd
    bl func_ov007_0214dd60
    ldmia sp!, {r4, pc}
.L_021634fc: .word 0x7ff0
    arm_func_end func_ov007_021634bc

    .global func_ov007_02163500
    arm_func_start func_ov007_02163500
func_ov007_02163500: ; 0x02163500
    ldr ip, .L_02163510
    mvn r1, #0x0
    str r1, [r0, #0x38]
    bx ip
.L_02163510: .word func_ov007_02158e84
    arm_func_end func_ov007_02163500

    .global func_ov007_02163514
    arm_func_start func_ov007_02163514
func_ov007_02163514: ; 0x02163514
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    mov ip, #0x1
    ldr r2, .L_02163560
    ldr r1, .L_02163564
    mov r3, #0x0
    add r0, sp, #0x0
    strb ip, [sp, #0x0]
    strb r3, [sp, #0x1]
    str ip, [sp, #0x4]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    bl func_ov007_02159b94
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_02163560: .word func_ov007_021635bc
.L_02163564: .word func_ov007_021635d0
    arm_func_end func_ov007_02163514

    .global func_ov007_02163568
    arm_func_start func_ov007_02163568
func_ov007_02163568: ; 0x02163568
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    mov ip, #0x0
    ldr r2, .L_021635b4
    ldr r1, .L_021635b8
    mov r3, #0x1
    add r0, sp, #0x0
    strb ip, [sp, #0x0]
    strb ip, [sp, #0x1]
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    bl func_ov007_02159b94
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_021635b4: .word func_ov007_021635bc
.L_021635b8: .word func_ov007_021635d0
    arm_func_end func_ov007_02163568

    .global func_ov007_021635bc
    arm_func_start func_ov007_021635bc
func_ov007_021635bc: ; 0x021635bc
    stmdb sp!, {r3, lr}
    bl func_ov007_0214dd50
    mov r1, #0x8
    bl func_ov007_0214dd6c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_021635bc

    .global func_ov007_021635d0
    arm_func_start func_ov007_021635d0
func_ov007_021635d0: ; 0x021635d0
    stmdb sp!, {r3, lr}
    bl func_ov007_0214dd50
    mov r1, #0xb
    bl func_ov007_0214dd60
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_021635d0

    .global func_ov007_021635e4
    arm_func_start func_ov007_021635e4
func_ov007_021635e4: ; 0x021635e4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x54
    mov r5, r1
    mov r4, r2
    mov r7, r0
    ldr r1, .L_02163cb0
    ldr r2, .L_02163cb4
    mov r0, #0x6c
    mov r3, #0x81
    bl func_0201a21c
    mov r6, r0
    str r7, [r6, #0x58]
    str r5, [r6, #0x5c]
    strb r4, [r6, #0x68]
    ldr r0, [r7, #0x4]
    mov r1, #0x3
    bl func_0203d0b4
    ldr r0, [r7, #0x4]
    mov r1, #0x8
    bl func_0203d478
    mov r1, #0x40
    ldr r0, [r7, #0x4]
    mov r2, r1
    bl func_0203cfbc
    ldr r0, [r7, #0x4]
    mov r1, #0x8000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1000
    str r0, [sp, #0x38]
    ldr r0, [r7, #0x4]
    add r1, sp, #0x38
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, .L_02163cb8
    mov r1, #0x0
    blx func_020101f4
    str r0, [r6, #0x4]
    ldr r0, .L_02163cbc
    mov r1, #0x0
    blx func_020101f4
    str r0, [r6, #0x8]
    ldr r0, .L_02163cc0
    mov r1, #0x0
    blx func_020101f4
    str r0, [r6, #0xc]
    ldr r1, .L_02163cc4
    ldr r2, .L_02163cc8
    ldr r3, .L_02163ccc
    mov r0, #0x78
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021636cc
    ldr r1, .L_02163cd0
    mov r2, #0x1
    bl func_02024064
.L_021636cc:
    bl func_ov007_0214f340
    str r0, [r6, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x0]
    mov r2, #0x100000
    ldr r0, [r0, #0x4]
    rsb r2, r2, #0x0
    ldr r0, [r0, #0x50]
    mov r1, #0x1
    str r2, [r0, #0xc]
    bl func_ov007_0214f240
    mov r0, #0x100000
    rsb r0, r0, #0x0
    str r0, [sp, #0x1c]
    mov r0, #0x0
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    add r0, sp, #0x3c
    add r1, sp, #0x1c
    add r2, sp, #0x20
    add r3, sp, #0x24
    bl func_ov007_02163ee0
    ldr r1, [r6, #0x0]
    ldr r2, .L_02163cd4
    add r0, sp, #0x14
    add r7, sp, #0x3c
    bl func_ov007_0214f2a4
    ldr r1, .L_02163cd8
    ldr r2, .L_02163cdc
    ldr r3, .L_02163ce0
    mov r0, #0x4c
    ldr r5, [sp, #0x18]
    ldr r4, [sp, #0x14]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02163794
    ldr r2, .L_02163ce4
    mov r1, #0x8
    stmia sp, {r2, r7}
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r4
    mov r3, r5
    str r1, [sp, #0x10]
    bl func_02013b14
.L_02163794:
    bl func_ov007_02163eb8
    mov r1, r0
    ldr r0, [r6, #0x0]
    bl func_02020f38
    ldr r0, [r6, #0x0]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r6, #0x0]
    ldr r1, .L_02163ce8
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldrb r0, [r6, #0x68]
    cmp r0, #0x0
    ldrne r4, .L_02163cec
    ldrne r7, .L_02163cf0
    ldreq r4, .L_02163cf4
    ldr r0, [r6, #0x58]
    ldreq r7, .L_02163cf8
    bl func_ov007_02150e78
    mov r0, r4
    bl func_02035c90
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_02163810
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02163810:
    ldr r4, [r4, #0x38]
    bl func_02036ab8
    bl func_ov007_0214f340
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_0216385c
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_02163874
.L_0216385c:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_02163874:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    ldr r0, [r6, #0x0]
    mov r1, r5
    bl func_ov007_0214f48c
    ldr r1, [r6, #0x0]
    mov r0, r5
    bl func_ov007_02152468
    str r5, [r6, #0x10]
    bl func_ov007_02150eb4
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r1, .L_02163cfc
    ldr r0, .L_02163d00
    str r1, [sp, #0x4]
    ldr r2, [r6, #0x5c]
    ldr r3, [r6, #0x0]
    mov r1, r0
    bl func_ov007_02163f2c
    ldr r9, .L_02163cfc
    ldr r8, .L_02163d04
    str r0, [r6, #0x14]
    mov r5, #0x1
    mov r4, #0x64
    mov r7, #0xc
.L_021638ec:
    mla r0, r5, r7, r9
    str r4, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r2, [r6, #0x5c]
    ldr r3, [r6, #0x0]
    mov r0, r8
    mov r1, r8
    bl func_ov007_02163f2c
    add r1, r6, r5, lsl #0x2
    add r5, r5, #0x1
    str r0, [r1, #0x14]
    cmp r5, #0x10
    blt .L_021638ec
    mov r7, #0x9
    mov r5, #0x63000
    add r4, sp, #0x30
.L_0216392c:
    str r5, [sp, #0x30]
    add r0, r6, r7, lsl #0x2
    ldr r0, [r0, #0x14]
    mov r1, r4
    bl func_ov007_0214f27c
    add r7, r7, #0x1
    cmp r7, #0xc
    ble .L_0216392c
    mov r0, #0x61000
    str r0, [sp, #0x2c]
    ldr r0, [r6, #0x50]
    add r1, sp, #0x2c
    bl func_ov007_0214f27c
    mov r0, #0x62000
    str r0, [sp, #0x28]
    ldr r0, [r6, #0x4c]
    add r1, sp, #0x28
    bl func_ov007_0214f27c
    ldr r0, [r6, #0x50]
    ldr r1, .L_02163d08
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x50]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r6, #0x4c]
    ldr r1, .L_02163d0c
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r6, #0x48]
    ldr r1, .L_02163d10
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x48]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrb r1, [r6, #0x68]
    ldr r0, .L_02163d14
    ldr r4, [r0, #0x8]
    cmp r1, #0x0
    beq .L_02163a98
    ldr r7, .L_02163d18
    mov r8, #0x0
    mov r5, #0xc
.L_02163a18:
    mla r1, r8, r5, r7
    add r0, r6, r8, lsl #0x2
    ldr r0, [r0, #0x14]
    bl func_ov007_02163efc
    add r8, r8, #0x1
    cmp r8, #0x5
    ble .L_02163a18
    mov r7, #0x6
    mov r5, #0x0
.L_02163a3c:
    add r0, r6, r7, lsl #0x2
    ldr r0, [r0, #0x14]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r7, r7, #0x1
    cmp r7, #0x10
    blt .L_02163a3c
    ldr r0, [r6, #0x28]
    ldr r1, .L_02163d1c
    ldr r0, [r0, #0x4]
    add r1, r4, r1
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x28]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    b .L_02163b50
.L_02163a98:
    bl func_02087724
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02163ae4
    ldr r0, [r6, #0x50]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_02163b50
.L_02163ae4:
    add r1, r4, #0x5
    mov r0, #0xc
    mul r3, r1, r0
    ldr r2, .L_02163cfc
    ldr r1, .L_02163d20
    ldr r0, .L_02163d24
    ldr r2, [r2, r3]
    ldr r1, [r1, r3]
    ldr r0, [r0, r3]
    str r1, [sp, #0x4c]
    str r2, [sp, #0x48]
    str r0, [sp, #0x50]
    ldr r0, [r6, #0x4c]
    add r1, sp, #0x48
    bl func_ov007_02163efc
    ldr r0, .L_02163d28
    ldr r3, [sp, #0x48]
    ldr r1, [r0, #0x118]
    ldr r2, [sp, #0x4c]
    add r1, r3, r1
    str r1, [sp, #0x48]
    ldr r0, [r0, #0x11c]
    add r1, sp, #0x48
    add r0, r2, r0
    str r0, [sp, #0x4c]
    ldr r0, [r6, #0x50]
    bl func_ov007_02163efc
.L_02163b50:
    ldr r0, [r6, #0x4c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r4, [r0, #0x2c]
    cmp r4, #0x0
    bne .L_02163b74
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r4, r0
.L_02163b74:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02163b90
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02163b90:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x18]
    mov r1, #0x21
    mov r2, #0x3
    mov r3, #0x5
    bl func_0206ad90
    mov r2, #0x0
    ldr r1, .L_02163d2c
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    str r0, [r6, #0x64]
    ldr r0, [r6, #0x5c]
    bl func_ov007_02150e78
    mov r1, #0x0
    ldr r0, .L_02163d30
    mov r2, r1
    blx func_ov012_021caa0c
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov007_0214f340
    mov r1, #0x65000
    str r1, [sp, #0x34]
    add r1, sp, #0x34
    mov r5, r0
    bl func_ov007_0214f27c
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x0]
    mov r0, r5
    bl func_ov007_02152468
    ldr r0, [r6, #0x0]
    mov r1, r5
    bl func_ov007_0214f48c
    ldrb r0, [r6, #0x68]
    cmp r0, #0x0
    beq .L_02163c70
    ldr r1, .L_02163d34
    mov r0, r5
    bl func_ov007_02163efc
    b .L_02163c7c
.L_02163c70:
    ldr r1, .L_02163d38
    mov r0, r5
    bl func_ov007_02163efc
.L_02163c7c:
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    bl func_ov007_02150eb4
    str r5, [r6, #0x54]
    bl func_020750e0
    str r0, [r6, #0x60]
    ldr r0, [r6, #0x0]
    bl func_ov007_02163fec
    mov r0, r6
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02163cb0: .word data_ov007_0216a9e4
.L_02163cb4: .word data_ov007_0216a960
.L_02163cb8: .word data_ov007_0216a9f8
.L_02163cbc: .word data_ov007_0216aa14
.L_02163cc0: .word data_ov007_0216aa34
.L_02163cc4: .word data_ov007_0216a92c
.L_02163cc8: .word data_ov007_0216a914
.L_02163ccc: .word 0x4c3
.L_02163cd0: .word func_02024a30
.L_02163cd4: .word data_ov007_0216aa50
.L_02163cd8: .word data_ov007_0216a94c
.L_02163cdc: .word data_ov007_0216a924
.L_02163ce0: .word 0x2ef
.L_02163ce4: .word 0x494c
.L_02163ce8: .word func_ov007_02163fec
.L_02163cec: .word data_ov007_0216aa5c
.L_02163cf0: .word data_ov007_0216aa7c
.L_02163cf4: .word data_ov007_0216aa9c
.L_02163cf8: .word data_ov007_0216aabc
.L_02163cfc: .word data_ov007_0216a848
.L_02163d00: .word 0xa01000
.L_02163d04: .word 0x885000
.L_02163d08: .word 0x885018
.L_02163d0c: .word 0x885017
.L_02163d10: .word 0x88500f
.L_02163d14: .word data_020afe90
.L_02163d18: .word data_ov007_0216a7f4
.L_02163d1c: .word 0x885008
.L_02163d20: .word data_ov007_0216a84c
.L_02163d24: .word data_ov007_0216a850
.L_02163d28: .word data_ov007_0216a7e4
.L_02163d2c: .word 0x8df
.L_02163d30: .word data_ov007_0216aadc
.L_02163d34: .word data_ov007_0216a83c
.L_02163d38: .word data_ov007_0216a908
    arm_func_end func_ov007_021635e4

    .global func_ov007_02163d3c
    arm_func_start func_ov007_02163d3c
func_ov007_02163d3c: ; 0x02163d3c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x64]
    cmp r0, #0x0
    beq .L_02163d54
    bl func_0206ae98
.L_02163d54:
    ldr r0, [r5, #0x60]
    cmp r0, #0x0
    beq .L_02163d64
    bl func_02075168
.L_02163d64:
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_02163d7c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02163d7c:
    mov r4, #0x0
.L_02163d80:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_02163d9c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02163d9c:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_02163d80
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov007_02163d3c

    .global func_ov007_02163db4
    arm_func_start func_ov007_02163db4
func_ov007_02163db4: ; 0x02163db4
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    movs r4, r0
    beq .L_02163de4
    ldr r1, [r4, #0x0]
    add r0, sp, #0x10
    bl func_ov007_02163e84
    mov r0, #0x100000
    ldr r1, [sp, #0x10]
    rsb r0, r0, #0x0
    cmp r1, r0
    ble .L_02163dfc
.L_02163de4:
    ldr r1, [r4, #0x0]
    add r0, sp, #0xc
    bl func_ov007_02163e84
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    ble .L_02163e6c
.L_02163dfc:
    ldr r0, [r4, #0x0]
    mov r1, #0x100000
    ldr r0, [r0, #0x4]
    rsb r1, r1, #0x0
    ldr r0, [r0, #0x50]
    mov r2, #0x0
    str r1, [r0, #0xc]
    str r2, [r0, #0x10]
    mov r1, #0x1
    str r2, [r0, #0x14]
    bl func_ov007_0214f240
    mov ip, #0x0
    add r0, sp, #0x14
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    str ip, [sp, #0x0]
    str ip, [sp, #0x4]
    str ip, [sp, #0x8]
    bl func_ov007_02163ee0
    ldr r0, [r4, #0x0]
    ldr r1, .L_02163e74
    mov r2, #0x0
    bl func_ov007_02163e98
    ldr r0, [r0, #0x4]
    add r1, sp, #0x14
    mov r2, #0x0
    bl func_02013c48
.L_02163e6c:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_02163e74: .word 0x564d5049
    arm_func_end func_ov007_02163db4

    .global func_ov007_02163e78
    arm_func_start func_ov007_02163e78
func_ov007_02163e78: ; 0x02163e78
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov007_02163e78

    .global func_ov007_02163e84
    arm_func_start func_ov007_02163e84
func_ov007_02163e84: ; 0x02163e84
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x50]
    ldr r1, [r1, #0xc]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov007_02163e84

    .global func_ov007_02163e98
    arm_func_start func_ov007_02163e98
func_ov007_02163e98: ; 0x02163e98
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    bl func_02023fb0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov007_02163eb8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02163e98

    .global func_ov007_02163eb8
    arm_func_start func_ov007_02163eb8
func_ov007_02163eb8: ; 0x02163eb8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02163ed8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02163ed8:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02163eb8

    .global func_ov007_02163ee0
    arm_func_start func_ov007_02163ee0
func_ov007_02163ee0: ; 0x02163ee0
    ldr r1, [r1, #0x0]
    str r1, [r0, #0x0]
    ldr r1, [r2, #0x0]
    str r1, [r0, #0x4]
    ldr r1, [r3, #0x0]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov007_02163ee0

    .global func_ov007_02163efc
    arm_func_start func_ov007_02163efc
func_ov007_02163efc: ; 0x02163efc
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_02163f28
    str r2, [r0, #0xc]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x10]
    ldr r2, [r1, #0x8]
    mov r1, #0x1
    str r2, [r0, #0x14]
    bx ip
.L_02163f28: .word func_ov007_0214f240
    arm_func_end func_ov007_02163efc

    .global func_ov007_02163f2c
    arm_func_start func_ov007_02163f2c
func_ov007_02163f2c: ; 0x02163f2c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r4, r1
    mov r0, r2
    mov r5, r3
    bl func_ov007_02150e78
    mov r0, r4
    bl func_020329ec
    bl func_ov007_0214f340
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r6
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [sp, #0x18]
    ldr r2, .L_02163fe8
    ldr r1, [r4, #0x4]
    mov r0, r0, lsl #0xc
    str r2, [r1, #0x54]
    str r0, [sp, #0x0]
    mov r0, r4
    add r1, sp, #0x0
    bl func_ov007_0214f27c
    ldr r1, [sp, #0x1c]
    mov r0, r4
    bl func_ov007_02163efc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    mov r1, r5
    bl func_ov007_02152468
    mov r0, r5
    mov r1, r4
    bl func_ov007_0214f48c
    bl func_ov007_02150eb4
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02163fe8: .word 0x31305053
    arm_func_end func_ov007_02163f2c

    .global func_ov007_02163fec
    arm_func_start func_ov007_02163fec
func_ov007_02163fec: ; 0x02163fec
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, [r0, #0x4]
    ldr r0, .L_02164324
    ldr r8, [r1, #0x10]
    ldr r4, [r0, #0xc]
    ldr r0, [r8, #0x54]
    ldr r5, [r0, #0x4]
    ldr r0, [r5, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r8, #0x60]
    mov r1, r4
    bl func_02075190
    ldr r2, [r8, #0x54]
    mov r1, r0
    ldr r0, [r2, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r0, [r8, #0x60]
    mov r1, r4
    ldr r5, [r8, #0x14]
    bl func_020751a4
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x2f
    beq .L_02164088
    sub r1, r1, #0x1
    cmp r0, r1
    bne .L_02164088
    cmp r4, #0x12
    addls r0, r4, #0x1d
    addhi r0, r4, #0xe
.L_02164088:
    add r1, r0, #0x1000
    ldr r0, [r5, #0x4]
    add r1, r1, #0xa00000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, .L_02164324
    ldr r4, [r8, #0x18]
    ldr r1, [r0, #0x10]
    ldr r0, [r4, #0x4]
    add r1, r1, #0x85000
    add r1, r1, #0x800000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r1, .L_02164324
    ldr r0, .L_02164328
    ldr r1, [r1, #0x1c]
    ldr r4, [r8, #0x1c]
    cmp r1, r0
    ldrge r1, .L_0216432c
    bge .L_02164110
    ldr r0, .L_02164330
    cmp r1, r0
    ldrge r1, .L_02164334
    ldrlt r1, .L_02164338
.L_02164110:
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, .L_02164324
    ldr r4, [r8, #0x20]
    ldrb r0, [r0, #0x2b]
    ldr r1, .L_0216433c
    cmp r0, #0x0
    moveq r2, #0x1
    movne r2, #0x0
    add r1, r2, r1
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, .L_02164324
    ldr r4, [r8, #0x24]
    ldrb r0, [r0, #0x2c]
    ldr r1, .L_0216433c
    cmp r0, #0x0
    moveq r2, #0x1
    movne r2, #0x0
    add r1, r2, r1
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrb r0, [r8, #0x68]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r11, .L_02164340
    ldr r6, .L_02164324
    mov r9, #0x0
    add r5, r11, #0x3
    add r4, r11, #0x9
.L_021641d0:
    add r0, r8, r9, lsl #0x2
    ldr r10, [r0, #0x28]
    ldr r7, [r0, #0x38]
    ldr r0, [r6, #0x0]
    cmp r0, r9
    bgt .L_02164214
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_021642ec
.L_02164214:
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    cmp r0, r9
    ldr r0, [r10, #0x4]
    bgt .L_0216425c
    add r1, r9, r5
    bl func_02023894
    ldr r0, [r10, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0216428c
.L_0216425c:
    add r1, r9, r11
    bl func_02023894
    ldr r0, [r10, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0216428c:
    ldrb r0, [r6, #0x2d]
    cmp r0, #0x0
    ldr r0, [r7, #0x4]
    beq .L_021642dc
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0xd8]
    blx r2
    add r1, r6, r9
    ldrsb r1, [r1, #0x2e]
    ldr r0, [r7, #0x4]
    mov r2, #0x0
    add r1, r1, r4
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    b .L_021642ec
.L_021642dc:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd8]
    blx r2
.L_021642ec:
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_021641d0
    ldr r0, .L_02164324
    ldrb r0, [r0, #0x2d]
    cmp r0, #0x0
    ldr r0, [r8, #0x48]
    moveq r1, #0x1
    ldr r0, [r0, #0x4]
    movne r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02164324: .word data_020afe90
.L_02164328: .word 0x332f
.L_0216432c: .word 0x885005
.L_02164330: .word 0x224f
.L_02164334: .word 0x885004
.L_02164338: .word 0x885003
.L_0216433c: .word 0x885006
.L_02164340: .word 0x885010
    arm_func_end func_ov007_02163fec

    .global func_ov007_02164344
    thumb_func_start func_ov007_02164344
func_ov007_02164344: ; 0x02164344
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x8c
    mov r0, #0x64
    mov r3, r0
    ldr r1, .L_02164704
    ldr r2, .L_02164708
    add r3, #0xc8
    blx func_0201a21c
    mov r1, #0x0
    mov r2, #0x64
    mov r5, r0
    blx func_020517fc
    blx func_020310f4
    ldr r1, .L_0216470c
    str r0, [r5, #0x8]
    ldr r2, [r1, #0x0]
    subs r2, r2, #0x1
    str r2, [r1, #0x0]
    ldr r1, .L_02164710
    lsl r2, r2, #0x2
    ldr r3, [r1, #0x0]
    ldr r1, .L_02164714
    str r3, [r1, r2]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, [r5, #0x8]
    blx func_ov007_02150d44
    bl func_ov012_021b65bc
    mov r0, #0x0
    blx func_02028920
    str r0, [r5, #0x18]
    mov r0, #0x0
    str r0, [r5, #0x60]
    mov r0, #0x1
    blx func_02043264
    mov r0, #0x0
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x0
    blx func_0203b414
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    lsl r0, r0, #0xc
    str r0, [sp, #0x68]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x68
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x1
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x1
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    blx func_0203cfbc
    mov r0, #0x1
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x1
    blx func_0203b414
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x6c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x6c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x2
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x2
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    blx func_0203cfbc
    mov r0, #0x2
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0xe
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x2
    blx func_0203b414
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x2
    lsl r0, r0, #0xc
    str r0, [sp, #0x70]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x70
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    blx func_0203cfbc
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x2
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0xe
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x3
    lsl r0, r0, #0xc
    str r0, [sp, #0x74]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x74
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r4, #0x0
    mov r6, #0x1
    mov r7, #0x4
.L_02164506:
    mov r0, r4
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, r6
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, r4
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, r7
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, r4
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    blx func_0203cfbc
    mov r0, r4
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    blx func_0203b424
    add r0, #0x88
    ldr r1, [r0, #0x0]
    lsl r0, r4, #0xc
    str r0, [sp, #0x7c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x7c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_02164506
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, r1
    blx func_0203cfbc
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x2
    ldr r0, [r0, #0x4]
    lsl r1, r1, #0xe
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x2
    lsl r0, r0, #0xc
    str r0, [sp, #0x78]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x78
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r1, #0x1
    mov r0, #0x0
    mov r2, r1
    blx func_ov012_021ba49c
    str r0, [r5, #0x54]
    mov r0, #0x3
    blx func_0203b414
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    str r0, [r5, #0x0]
    mov r0, #0x2
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov007_021509ac
    str r0, [r5, #0x4]
    mov r0, #0x2
    blx func_0203b414
    mov r2, r0
    ldr r1, .L_02164718
    add r2, #0x88
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x0]
    ldr r2, [r2, #0x0]
    blx func_ov007_02150f80
    ldr r7, .L_0216471c
    str r0, [r5, #0x1c]
    mov r4, #0x0
.L_02164624:
    lsl r6, r4, #0x2
    ldr r0, [r7, r6]
    mov r1, #0x0
    bl func_020101f4
    add r1, r5, r6
    add r4, r4, #0x1
    str r0, [r1, #0x24]
    cmp r4, #0x2
    blt .L_02164624
    blx func_0203b3f4
    add r0, #0x88
    ldr r4, [r0, #0x0]
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, r4
    mov r2, #0x0
    blx func_ov007_021635e4
    str r0, [r5, #0x58]
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b44
    str r0, [r5, #0x2c]
    blx func_0203b404
    mov r3, r0
    add r3, #0x88
    mov r1, #0x81
    ldr r0, [r5, #0x0]
    ldr r3, [r3, #0x0]
    lsl r1, r1, #0x10
    mov r2, #0x0
    blx func_ov007_02150b7c
    blx func_0203b3e4
    mov r1, r0
    add r1, #0x88
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x0]
    blx func_ov007_02150bdc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02164720
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    bl func_ov012_021b4104
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x40]
    ldr r1, [r5, #0x2c]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_02164724
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x23
    str r2, [r1, r0]
    str r4, [r5, #0x30]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_02164728
    add r0, sp, #0x28
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_0216472c
    add r0, sp, #0x20
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, .L_02164730
    b .L_02164734
    mov r8, r8
.L_02164704: .word data_ov007_0216aaf0
.L_02164708: .word data_ov007_0216a9a8
.L_0216470c: .word data_02093c04
.L_02164710: .word data_020a0e80
.L_02164714: .word data_020a16c0
.L_02164718: .word data_ov007_0216a7e4
.L_0216471c: .word data_ov007_0216a7ec
.L_02164720: .word func_ov007_02164e8c
.L_02164724: .word 0x101
.L_02164728: .word data_ov007_0216aa50
.L_0216472c: .word data_ov007_0216ab0c
.L_02164730: .word 0xfff40000
.L_02164734:
    add r1, sp, #0x1c
    str r0, [sp, #0x18]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    mov r0, r4
    add r2, sp, #0x18
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x10
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r2, .L_02164b2c
    ldr r3, [sp, #0x2c]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    add r2, sp, #0x8
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_02023c70
    ldr r0, .L_02164b30
    ldr r1, .L_02164b34
    ldr r6, [r0, #0x0]
    mov r0, #0x4d
    ldr r2, .L_02164b38
    lsl r0, r0, #0x2
    mov r3, #0x3e
    ldr r7, [r4, #0x4]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_02164818
    ldr r3, .L_02164b3c
    mov r1, r7
    mov r2, r6
    bl func_ov012_021af0f8
.L_02164818:
    blx func_ov007_0214f340
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x3
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x44]
    ldr r7, [r5, #0x1c]
    cmp r7, #0x0
    beq .L_0216485a
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r6
    mov r1, r7
    blx func_ov007_0214f48c
.L_0216485a:
    mov r0, #0x98
    str r0, [sp, #0x30]
    str r0, [sp, #0x34]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x30
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x3
    blx func_ov007_02151538
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r6, #0x4]
    mov r2, #0x4
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r6, [r5, #0x48]
    mov r0, #0x9c
    str r0, [sp, #0x30]
    mov r0, #0x6c
    str r0, [sp, #0x34]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r0, sp, #0x30
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x2
    blx func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x5
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    str r4, [r5, #0x4c]
    ldr r1, [r5, #0x2c]
    mov r0, r5
    blx func_ov007_0215145c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_02164b40
    ldr r1, [r4, #0x4]
    mov r0, r2
    add r0, #0x22
    str r2, [r1, r0]
    str r4, [r5, #0x34]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov012_021b6214
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_02164b44
    add r0, sp, #0x58
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r2, .L_02164b48
    add r0, sp, #0x50
    mov r1, r4
    blx func_ov007_0214f2a4
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x15
    lsl r0, r0, #0xe
    str r0, [sp, #0x48]
    ldr r0, .L_02164b4c
    add r1, sp, #0x4c
    str r0, [sp, #0x4c]
    mov r0, r4
    add r2, sp, #0x48
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x0
    blx func_02023c60
    mov r0, #0x15
    lsl r0, r0, #0xe
    str r0, [sp, #0x40]
    mov r0, #0x1f
    lsl r0, r0, #0xe
    str r0, [sp, #0x44]
    mov r0, r4
    add r1, sp, #0x44
    add r2, sp, #0x40
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x8
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r2, .L_02164b2c
    ldr r3, [sp, #0x5c]
    blx func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_02023c70
    ldr r0, [r4, #0x4]
    blx func_020239a0
    mov r0, #0x15
    lsl r0, r0, #0xe
    str r0, [sp, #0x38]
    mov r0, #0x1f
    lsl r0, r0, #0xe
    str r0, [sp, #0x3c]
    mov r0, r4
    add r1, sp, #0x3c
    add r2, sp, #0x38
    blx func_ov007_0214f218
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x0
    blx func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_02023c70
    mov r0, #0x0
    str r0, [sp, #0x60]
    str r0, [sp, #0x64]
    blx func_0203b404
    mov r1, r0
    mov r0, #0x7e
    str r0, [sp, #0x0]
    add r0, sp, #0x60
    str r0, [sp, #0x4]
    add r1, #0x88
    mov r2, #0x81
    ldr r1, [r1, #0x0]
    mov r0, r4
    lsl r2, r2, #0x10
    mov r3, #0x1
    blx func_ov007_02151538
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x49
    ldr r1, [r4, #0x4]
    mov r2, #0x6
    lsl r0, r0, #0x2
    str r2, [r1, r0]
    mov r0, #0x2
    mov r1, #0x1
    str r4, [r5, #0x50]
    blx func_02073ebc
    mov r0, #0x5
    blx func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    blx func_0207361c
    blx func_02026f94
    str r0, [r5, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0xc]
    ldr r1, .L_02164b50
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x88]
    ldr r0, [r5, #0xc]
    add r1, sp, #0x88
    blx func_ov007_0214ed20
    ldr r0, .L_02164b54
    mov r1, #0x0
    str r1, [r0, #0x8]
    bl func_0208bd0c
    ldr r1, .L_02164b54
    str r0, [r1, #0x0]
    bl func_0208bd0c
    ldr r1, .L_02164b54
    str r0, [r1, #0x4]
    blx func_02026f94
    str r0, [r5, #0x14]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x14]
    ldr r1, .L_02164b58
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x84]
    ldr r0, [r5, #0x14]
    add r1, sp, #0x84
    blx func_ov007_0214ed20
    ldr r0, [r5, #0x14]
    ldr r2, .L_02164b5c
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    blx func_02027834
    ldr r0, [r5, #0x14]
    blx func_02086cac
    blx func_02026f94
    str r0, [r5, #0x10]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x10]
    ldr r1, .L_02164b60
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x2
    lsl r0, r0, #0x12
    str r0, [sp, #0x80]
    ldr r0, [r5, #0x10]
    add r1, sp, #0x80
    blx func_ov007_0214ed20
    ldr r0, [r5, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x30]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x34]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x34]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x58]
    mov r1, #0x0
    blx func_ov007_02163db4
    ldr r0, [r5, #0x8]
    add sp, #0x8c
    pop {r4, r5, r6, r7, pc}
.L_02164b2c: .word 0x494c
.L_02164b30: .word data_ov012_021d5154
.L_02164b34: .word data_ov007_02169654
.L_02164b38: .word data_ov007_0216a91c
.L_02164b3c: .word func_ov007_0214f368
.L_02164b40: .word 0x102
.L_02164b44: .word data_ov007_0216aa50
.L_02164b48: .word data_ov007_0216ab0c
.L_02164b4c: .word 0xfff88000
.L_02164b50: .word func_ov007_02164b68
.L_02164b54: .word data_020afe90
.L_02164b58: .word func_ov007_02164cc0
.L_02164b5c: .word func_ov007_02164d80
.L_02164b60: .word func_ov007_02164cb4
    thumb_func_end func_ov007_02164344

    .global func_ov007_02164b64
    thumb_func_start func_ov007_02164b64
func_ov007_02164b64: ; 0x02164b64
    bx lr
    thumb_func_end func_ov007_02164b64

    .byte 0x00, 0x00

    .global func_ov007_02164b68
    thumb_func_start func_ov007_02164b68
func_ov007_02164b68: ; 0x02164b68
    push {r4, lr}
    mov r4, r0
    blx func_0207382c
    cmp r0, #0x0
    beq .L_02164b80
    bl func_ov012_021b65cc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02164b84
    blx func_02028384
.L_02164b80:
    pop {r4, pc}
    mov r8, r8
.L_02164b84: .word func_ov007_02164b88
    thumb_func_end func_ov007_02164b68

    .global func_ov007_02164b88
    thumb_func_start func_ov007_02164b88
func_ov007_02164b88: ; 0x02164b88
    push {r3, r4, r5, lr}
    mov r4, r0
    blx func_020883d8
    cmp r0, #0x0
    beq .L_02164bc2
    blx func_020876ac
    blx func_0208712c
    ldr r0, .L_02164bc4
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldr r1, .L_02164bc8
    mov r0, #0x13
    ldrsb r5, [r1, r0]
    blx func_02086d80
    add r1, r0, r5
    ldr r0, .L_02164bc4
    str r1, [r0, #0x0]
    blx func_02086d80
    ldr r1, .L_02164bc4
    str r0, [r1, #0x4]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02164bcc
    blx func_02028384
.L_02164bc2:
    pop {r3, r4, r5, pc}
.L_02164bc4: .word data_020afe90
.L_02164bc8: .word data_020afeb0
.L_02164bcc: .word func_ov007_02164b64
    thumb_func_end func_ov007_02164b88

    .global func_ov007_02164bd0
    thumb_func_start func_ov007_02164bd0
func_ov007_02164bd0: ; 0x02164bd0
    push {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_020871f4
    mov r0, r4
    bl func_ov007_02164e54
    pop {r4, pc}
    thumb_func_end func_ov007_02164bd0

    .byte 0x00, 0x00

    .global func_ov007_02164be4
    thumb_func_start func_ov007_02164be4
func_ov007_02164be4: ; 0x02164be4
    push {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    blx func_0207382c
    cmp r0, #0x0
    beq .L_02164ca2
    ldr r0, [r5, #0x60]
    cmp r0, #0x0
    bne .L_02164c0a
    blx func_02086c4c
    cmp r0, #0x0
    bne .L_02164c06
    blx func_02086d30
    b .L_02164c0a
.L_02164c06:
    mov r0, #0x1
    str r0, [r5, #0x60]
.L_02164c0a:
    mov r0, #0x0
    blx func_02086cac
    blx func_020735e4
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    beq .L_02164c1e
    blx func_ov007_02163d3c
.L_02164c1e:
    ldr r0, [r5, #0x54]
    cmp r0, #0x0
    beq .L_02164c28
    blx func_ov012_021bab64
.L_02164c28:
    ldr r0, [r5, #0x0]
    blx func_ov007_02150b4c
    ldr r0, [r5, #0x4]
    blx func_ov007_02150b4c
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_02164c40
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02164c40:
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    beq .L_02164c4c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02164c4c:
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    beq .L_02164c58
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02164c58:
    mov r4, #0x0
.L_02164c5a:
    lsl r0, r4, #0x2
    add r0, r5, r0
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_02164c6a
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02164c6a:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_02164c5a
    ldr r0, [r5, #0x8]
    blx func_ov007_02150dbc
    bl func_ov012_021b65cc
    ldr r0, .L_02164ca4
    ldr r2, [r0, #0x0]
    add r1, r2, #0x1
    str r1, [r0, #0x0]
    ldr r0, .L_02164ca8
    lsl r1, r2, #0x2
    ldr r1, [r0, r1]
    ldr r0, .L_02164cac
    str r1, [r0, #0x0]
    ldr r1, [r5, #0x60]
    ldr r0, .L_02164cb0
    str r1, [r0, #0x8]
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r5
    blx func_0201b244
.L_02164ca2:
    pop {r3, r4, r5, pc}
.L_02164ca4: .word data_02093c04
.L_02164ca8: .word data_020a16c0
.L_02164cac: .word data_020a0e80
.L_02164cb0: .word data_020afcb0
    thumb_func_end func_ov007_02164be4

    .global func_ov007_02164cb4
    thumb_func_start func_ov007_02164cb4
func_ov007_02164cb4: ; 0x02164cb4
    ldr r3, .L_02164cbc
    ldr r0, [r0, #0x4]
    bx r3
    mov r8, r8
.L_02164cbc: .word func_020282f4
    thumb_func_end func_ov007_02164cb4

    .global func_ov007_02164cc0
    arm_func_start func_ov007_02164cc0
func_ov007_02164cc0: ; 0x02164cc0
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    bl func_02073fe4
    cmp r0, #0x0
    beq .L_02164d74
    bl func_020882c4
    cmp r0, #0x0
    beq .L_02164d74
    bl func_02088290
    ldr r0, [r5, #0x40]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    bl func_020883d8
    cmp r0, #0x0
    beq .L_02164d10
    bl func_02088394
    cmp r0, #0x0
    beq .L_02164d6c
.L_02164d10:
    bl func_020883d8
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    cmp r0, #0x0
    str r2, [sp, #0xc]
    movne r1, #0x4a
    ldr r0, [r5, #0x54]
    moveq r1, #0x51
    mov r3, r2
    bl func_ov012_021bac28
    ldr r4, .L_02164d7c
    b .L_02164d50
.L_02164d48:
    ldr r0, [r4, #0x0]
    blx r0
.L_02164d50:
    ldr r0, [r5, #0x54]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02164d48
    mov r0, r5
    blx func_ov007_02164e54
    b .L_02164d70
.L_02164d6c:
    bl func_02086c94
.L_02164d70:
    bl func_02088330
.L_02164d74:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02164d7c: .word data_020a0e18
    arm_func_end func_ov007_02164cc0

    .global func_ov007_02164d80
    thumb_func_start func_ov007_02164d80
func_ov007_02164d80: ; 0x02164d80
    push {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    mov r5, r1
    ldr r4, [r0, #0x10]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02164e4c
    cmp r0, r1
    beq .L_02164da4
    add r1, r1, #0x3
    cmp r0, r1
    bne .L_02164e48
    mov r0, r4
    bl func_ov007_02164e54
    pop {r3, r4, r5, pc}
.L_02164da4:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x11
    bhi .L_02164dc6
    bhs .L_02164e16
    cmp r0, #0x5
    bhi .L_02164e48
    cmp r0, #0x2
    blo .L_02164e48
    beq .L_02164dd0
    cmp r0, #0x4
    beq .L_02164e30
    cmp r0, #0x5
    beq .L_02164e0e
    pop {r3, r4, r5, pc}
.L_02164dc6:
    cmp r0, #0x1b
    bne .L_02164e48
    mov r0, #0x2
    str r0, [r4, #0x5c]
    pop {r3, r4, r5, pc}
.L_02164dd0:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x2
    blt .L_02164df2
    blx func_02087268
    blx func_02087390
    blx func_020882e0
    blx func_02088330
    mov r0, #0x1
    str r0, [r4, #0x60]
    mov r0, r4
    bl func_ov007_02164e54
    pop {r3, r4, r5, pc}
.L_02164df2:
    ldr r0, .L_02164e50
    mov r1, #0x0
    str r1, [r0, #0x8]
    bl func_0208bd0c
    ldr r1, .L_02164e50
    str r0, [r1, #0x0]
    bl func_0208bd0c
    ldr r1, .L_02164e50
    str r0, [r1, #0x4]
    blx func_02088330
    pop {r3, r4, r5, pc}
.L_02164e0e:
    ldr r0, .L_02164e50
    mov r1, #0x0
    str r1, [r0, #0x8]
    pop {r3, r4, r5, pc}
.L_02164e16:
    bl func_0208bd0c
    ldr r1, .L_02164e50
    str r0, [r1, #0x0]
    bl func_0208bd0c
    ldr r1, .L_02164e50
    str r0, [r1, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    pop {r3, r4, r5, pc}
.L_02164e30:
    bl func_0208bd0c
    ldr r1, .L_02164e50
    str r0, [r1, #0x0]
    bl func_0208bd0c
    ldr r1, .L_02164e50
    str r0, [r1, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02164e48:
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_02164e4c: .word 0x70000004
.L_02164e50: .word data_020afe90
    thumb_func_end func_ov007_02164d80

    .global func_ov007_02164e54
    thumb_func_start func_ov007_02164e54
func_ov007_02164e54: ; 0x02164e54
    push {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    ldr r1, .L_02164e84
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    blx func_02028330
    ldr r0, [r4, #0x14]
    ldr r1, .L_02164e88
    ldr r0, [r0, #0x4]
    blx func_02028384
    mov r0, #0x3
    mov r1, #0x1
    blx func_02073ebc
    bl func_ov012_021b65bc
    pop {r4, pc}
    mov r8, r8
.L_02164e84: .word func_ov007_02164be4
.L_02164e88: .word func_ov007_02164b64
    thumb_func_end func_ov007_02164e54

    .global func_ov007_02164e8c
    thumb_func_start func_ov007_02164e8c
func_ov007_02164e8c: ; 0x02164e8c
    push {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02164edc
    cmp r0, r1
    bne .L_02164eda
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    mov r1, #0x4
    tst r0, r1
    beq .L_02164eda
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    mov r0, #0x78
    blx func_0207342c
    bl func_ov012_021b65bc
    ldr r0, [r4, #0xc]
    ldr r1, .L_02164ee0
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    blx func_02028330
    ldr r0, [r4, #0x14]
    ldr r1, .L_02164ee4
    ldr r0, [r0, #0x4]
    blx func_02028384
.L_02164eda:
    pop {r3, r4, r5, pc}
.L_02164edc: .word 0x80011001
.L_02164ee0: .word func_ov007_02164bd0
.L_02164ee4: .word func_ov007_02164b64
    thumb_func_end func_ov007_02164e8c

    .global func_ov007_02164ee8
    arm_func_start func_ov007_02164ee8
func_ov007_02164ee8: ; 0x02164ee8
    stmdb sp!, {r4, lr}
    ldr r1, .L_02165000
    ldr r2, .L_02165004
    mov r0, #0x98
    mov r3, #0x5e
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x98
    mov r4, r0
    bl func_020517fc
    bl func_020310f4
    ldr r2, .L_02165008
    str r0, [r4, #0x0]
    ldr r1, .L_0216500c
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_02165010
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    ldr r0, [r4, #0x0]
    bl func_ov007_02150d44
    blx func_ov012_021b65bc
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    mov r3, #0x1
    bl func_ov007_02150678
    bl func_ov010_0219a9cc
    cmp r0, #0x7
    beq .L_02164fa4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov007_021509ac
    str r0, [r4, #0xc]
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov007_021509ac
    str r0, [r4, #0x10]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov007_02150e14
    b .L_02164fac
.L_02164fa4:
    mov r0, #0x0
    bl func_0206dcdc
.L_02164fac:
    mov r1, #0x1
    mov r2, r1
    mov r0, #0x0
    bl func_ov012_021ba49c
    str r0, [r4, #0x8]
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02165014
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02165000: .word data_ov007_0216ab2c
.L_02165004: .word data_ov007_0216ab14
.L_02165008: .word data_02093c04
.L_0216500c: .word data_020a0e80
.L_02165010: .word data_020a16c0
.L_02165014: .word func_ov007_021650bc
    arm_func_end func_ov007_02164ee8

    .global func_ov007_02165018
    arm_func_start func_ov007_02165018
func_ov007_02165018: ; 0x02165018
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    bl func_ov007_02150b4c
    ldr r0, [r4, #0x10]
    bl func_ov007_02150b4c
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_02165048
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02165048:
    ldr r0, [r4, #0x8]
    bl func_ov012_021bab64
    bl func_ov007_02150f1c
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x0]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_021650b0
    ldr r2, .L_021650b4
    ldr r3, [r1, #0x0]
    ldr r0, .L_021650b8
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_021650b0: .word data_02093c04
.L_021650b4: .word data_020a16c0
.L_021650b8: .word data_020a0e80
    arm_func_end func_ov007_02165018

    .global func_ov007_021650bc
    arm_func_start func_ov007_021650bc
func_ov007_021650bc: ; 0x021650bc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x8]
    mov r1, #0xff
    mov r2, #0x0
    bl func_ov010_021a3228
    ldr r0, [r5, #0x4]
    ldr r1, .L_021650fc
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_021650fc: .word func_ov007_02165100
    arm_func_end func_ov007_021650bc

    .global func_ov007_02165100
    arm_func_start func_ov007_02165100
func_ov007_02165100: ; 0x02165100
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_ov010_021a315c
    cmp r0, #0x0
    bne .L_02165130
    bl func_ov007_0214dd50
    mov r1, #0x1
    bl func_ov007_0214dd60
    mov r0, r4
    bl func_ov007_02165018
    ldmia sp!, {r4, pc}
.L_02165130:
    bl func_ov010_021a32fc
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov010_021a3248
    bl func_ov007_0214dd50
    mov r1, #0xe
    bl func_ov007_0214dd60
    mov r0, r4
    bl func_ov007_02165018
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02165100

    .global func_ov007_02165158
    arm_func_start func_ov007_02165158
func_ov007_02165158: ; 0x02165158
    stmdb sp!, {r4, lr}
    bl func_02086c08
    cmp r0, #0x0
    beq .L_02165218
    ldr r1, .L_02165284
    ldr r2, .L_02165288
    mov r0, #0x10
    mov r3, #0xa8
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    bl func_020310f4
    str r0, [r4, #0x0]
    bl func_ov007_02165320
    ldr r0, [r4, #0x0]
    bl func_ov007_02150d44
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, .L_0216528c
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_ov010_0219a884
    cmp r0, #0x0
    beq .L_021651f4
    bl func_02087770
    cmp r0, #0x1
    moveq r0, #0x4
    movne r0, #0x5
    str r0, [r4, #0x8]
    bl func_ov010_0219a8c4
    b .L_02165210
.L_021651f4:
    bl func_02087770
    cmp r0, #0x1
    moveq r0, #0x2
    movne r0, #0x3
    str r0, [r4, #0x8]
    bl func_ov007_02164ee8
    str r0, [r4, #0xc]
.L_02165210:
    ldr r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02165218:
    ldr r1, .L_02165284
    ldr r2, .L_02165290
    mov r0, #0xc
    mov r3, #0x6d
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0xc
    bl func_020517fc
    bl func_020310f4
    str r0, [r4, #0x0]
    bl func_ov007_02165320
    ldr r0, [r4, #0x0]
    bl func_ov007_02150d44
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, .L_02165294
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02165284: .word data_ov007_0216ab74
.L_02165288: .word data_ov007_0216ab5c
.L_0216528c: .word func_ov007_02165380
.L_02165290: .word data_ov007_0216ab44
.L_02165294: .word func_ov007_0216535c
    arm_func_end func_ov007_02165158

    .global func_ov007_02165298
    arm_func_start func_ov007_02165298
func_ov007_02165298: ; 0x02165298
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_021652b8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021652b8:
    ldr r0, [r4, #0x0]
    bl func_ov007_02150dbc
    blx func_ov012_021b65cc
    ldr r1, .L_02165310
    ldr r2, .L_02165314
    ldr r3, [r1, #0x0]
    ldr r0, .L_02165318
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r4, #0x8]
    ldr r0, .L_0216531c
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_02165310: .word data_02093c04
.L_02165314: .word data_020a16c0
.L_02165318: .word data_020a0e80
.L_0216531c: .word data_020afcb0
    arm_func_end func_ov007_02165298

    .global func_ov007_02165320
    arm_func_start func_ov007_02165320
func_ov007_02165320: ; 0x02165320
    stmdb sp!, {r3, lr}
    ldr r2, .L_02165350
    ldr r1, .L_02165354
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_02165358
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    ldmia sp!, {r3, pc}
.L_02165350: .word data_02093c04
.L_02165354: .word data_020a0e80
.L_02165358: .word data_020a16c0
    arm_func_end func_ov007_02165320

    .global func_ov007_0216535c
    arm_func_start func_ov007_0216535c
func_ov007_0216535c: ; 0x0216535c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0208c310
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x8]
    bl func_ov007_02165298
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_0216535c

    .global func_ov007_02165380
    arm_func_start func_ov007_02165380
func_ov007_02165380: ; 0x02165380
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_021653a8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_021653a8:
    bl func_ov010_021a315c
    cmp r0, #0x0
    bne .L_021653c0
    mov r0, #0x1
    str r0, [r4, #0x8]
    bl func_ov010_02199fd8
.L_021653c0:
    mov r0, r4
    bl func_ov007_02165298
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02165380

    .global func_ov007_021653cc
    arm_func_start func_ov007_021653cc
func_ov007_021653cc: ; 0x021653cc
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    beq .L_021653e4
    cmp r0, #0x1
    beq .L_021653f0
    cmp r0, #0x2
.L_021653e4:
    mov r0, #0x0
    bl func_ov007_021653fc
    ldmia sp!, {r3, pc}
.L_021653f0:
    mov r0, #0x5
    bl func_ov007_021653fc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_021653cc

    .global func_ov007_021653fc
    arm_func_start func_ov007_021653fc
func_ov007_021653fc: ; 0x021653fc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x3c
    ldr r1, .L_02165a24
    mov r4, r0
    ldr r2, .L_02165a28
    mov r0, #0x44
    mov r3, #0xbc
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x44
    mov r9, r0
    bl func_020517fc
    bl func_020310f4
    ldr r2, .L_02165a2c
    str r0, [r9, #0x0]
    ldr r1, .L_02165a30
    ldr r5, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r5, r5, #0x1
    ldr r1, .L_02165a34
    str r5, [r2, #0x0]
    str r3, [r1, r5, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    bl func_02086c08
    cmp r0, #0x0
    beq .L_0216546c
    bl func_0208c5d0
.L_0216546c:
    ldr r0, [r9, #0x0]
    bl func_ov007_02150d44
    blx func_ov012_021b65bc
    str r4, [r9, #0x1c]
    mov r5, #0x0
    str r5, [r9, #0x24]
    ldr r4, .L_02165a38
    b .L_021654bc
.L_0216548c:
    ldr r0, [r4, #0x8]
    cmp r5, r0
    beq .L_021654b8
    mov r0, r5
    bl func_02070cdc
    blx func_020725ac
    cmp r0, #0x0
    beq .L_021654b8
    mov r0, r5
    bl func_02070cdc
    b .L_021654c8
.L_021654b8:
    add r5, r5, #0x1
.L_021654bc:
    ldr r0, [r4, #0x4]
    cmp r5, r0
    blt .L_0216548c
.L_021654c8:
    ldr r0, .L_02165a38
    str r5, [r9, #0x20]
    ldr r0, [r0, #0x4]
    cmp r5, r0
    movge r0, #0x1
    strge r0, [r9, #0x1c]
    mov r0, #0x1
    bl func_02043264
    mov r0, #0x0
    bl func_0203b414
    ldr r4, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    mov r0, #0x0
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x1c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r8, #0x1
    mov r11, #0x0
    mov r7, r8
    mov r6, #0x4
    mov r5, r11
    add r4, sp, #0x20
.L_02165534:
    mov r0, r8
    bl func_0203b414
    ldr r10, [r0, #0x88]
    mov r1, r7
    ldr r0, [r10, #0x4]
    bl func_0203d0b4
    ldr r0, [r10, #0x4]
    mov r1, r6
    bl func_0203d478
    ldr r0, [r10, #0x4]
    mov r1, r11
    mov r2, r11
    bl func_0203cfbc
    ldr r0, [r10, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r8, lsl #0xc
    str r0, [sp, #0x20]
    ldr r0, [r10, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r8, r8, #0x1
    cmp r8, #0x3
    blt .L_02165534
    mov r10, #0x0
    mov r8, #0x1
    mov r7, #0x4
    mov r6, r10
    mov r5, r10
    add r4, sp, #0x28
.L_021655bc:
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
    str r0, [sp, #0x28]
    ldr r0, [r1, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r10, r10, #0x1
    cmp r10, #0x3
    blt .L_021655bc
    mov r0, #0x3
    bl func_0203b424
    ldr r4, [r0, #0x88]
    mov r1, #0x3
    ldr r0, [r4, #0x4]
    bl func_0203d0b4
    ldr r0, [r4, #0x4]
    mov r1, #0x8
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
    str r0, [sp, #0x24]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x24
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov007_021509ac
    str r0, [r9, #0x10]
    mov r0, #0x3
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_02165a3c
    ldr r1, .L_02165a40
    bl func_ov007_02150f80
    str r0, [r9, #0x34]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x1
    mov r1, r0
    bl func_02075fbc
    str r0, [r9, #0x28]
    bl func_02076908
    str r0, [r9, #0x2c]
    mov r0, #0x1
    mov r1, r0
    mov r2, #0x3
    mov r3, r0
    str r0, [sp, #0x0]
    bl func_02078cd4
    str r0, [r9, #0x30]
    mov r1, #0x8
    mov r2, #0x0
    bl func_0207903c
    ldr r0, [r9, #0x30]
    mov r1, #0x60
    bl func_02079c30
    ldr r0, .L_02165a44
    mov r1, #0x0
    blx func_020101f4
    str r0, [r9, #0x38]
    bl func_0203b404
    ldr r1, .L_02165a48
    ldr r0, [r0, #0x88]
    ldr r2, [r1, #0x0]
    ldr r4, [r0, #0x4]
    sub r3, r2, #0x1
    ldr r0, .L_02165a4c
    str r3, [r1, #0x0]
    ldr r2, [r0, #0x0]
    ldr r1, .L_02165a50
    str r4, [r0, #0x0]
    str r2, [r1, r3, lsl #0x2]
    mov r0, #0x810000
    bl func_020329ec
    bl func_ov007_0214f340
    str r0, [r9, #0x3c]
    mov r0, #0x80000
    str r0, [sp, #0x4]
    ldr r0, [r9, #0x3c]
    add r1, sp, #0x4
    bl func_ov007_0214f27c
    mov r0, #0x28000
    str r0, [sp, #0xc]
    mov r0, #0x80000
    str r0, [sp, #0x8]
    ldr r0, [r9, #0x3c]
    add r1, sp, #0x8
    add r2, sp, #0xc
    bl func_ov007_0214f218
    ldr r0, [r9, #0x3c]
    mov r1, #0x810000
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r9, #0x3c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r9, #0x3c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, #0x0
    ldr r0, .L_02165a54
    mov r2, r1
    blx func_ov012_021caa0c
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov007_0214f340
    str r0, [r9, #0x40]
    mov r0, #0x1000
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    str r0, [sp, #0x34]
    str r0, [sp, #0x38]
    ldr r0, [r9, #0x40]
    add r1, sp, #0x2c
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xfc]
    blx r2
    mov r0, #0x7f000
    str r0, [sp, #0x10]
    ldr r0, [r9, #0x40]
    add r1, sp, #0x10
    bl func_ov007_0214f27c
    mov r1, #0x26000
    mov r0, #0x49000
    str r1, [sp, #0x18]
    str r0, [sp, #0x14]
    ldr r0, [r9, #0x40]
    add r1, sp, #0x14
    add r2, sp, #0x18
    bl func_ov007_0214f218
    ldr r0, [r9, #0x40]
    bl func_ov007_02165c04
    ldr r0, [r9, #0x40]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r1, .L_02165a48
    ldr r2, .L_02165a50
    ldr r3, [r1, #0x0]
    ldr r0, .L_02165a4c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r9, #0x1c]
    cmp r0, #0x1
    beq .L_02165974
    ldr r0, [r9, #0x20]
    bl func_02070ca4
    mov r1, r0
    mov r0, r9
    bl func_ov007_02165be4
    ldr r0, [r9, #0x20]
    bl func_02070cdc
    mov r1, r0
    mov r0, r9
    bl func_ov007_02165c30
    ldr r0, [r9, #0x40]
    cmp r0, #0x0
    beq .L_02165954
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02165954:
    ldr r0, [r9, #0x3c]
    cmp r0, #0x0
    beq .L_02165974
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02165974:
    mov r1, #0x1
    mov r2, r1
    mov r0, #0x0
    bl func_ov012_021ba49c
    mov r1, #0x0
    str r0, [r9, #0xc]
    bl func_ov012_021bad80
    mov r0, #0x5
    bl func_020734e0
    mov r0, #0x5
    mov r1, #0x0
    bl func_0207361c
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    bl func_02026f94
    str r0, [r9, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x4]
    ldr r1, .L_02165a58
    ldr r0, [r0, #0x4]
    bl func_02028384
    bl func_02026f94
    str r0, [r9, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x9
    mov r1, #0x0
    mov r2, #0x3c
    bl func_02073f24
    ldr r0, [r9, #0x8]
    ldr r1, .L_02165a5c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02165a24: .word data_ov007_0216aba8
.L_02165a28: .word data_ov007_0216ab88
.L_02165a2c: .word data_02093c04
.L_02165a30: .word data_020a0e80
.L_02165a34: .word data_020a16c0
.L_02165a38: .word data_020afe90
.L_02165a3c: .word data_ov007_0216abc4
.L_02165a40: .word data_ov007_0216abe0
.L_02165a44: .word data_ov007_0216abfc
.L_02165a48: .word data_02093c08
.L_02165a4c: .word data_020a0dd0
.L_02165a50: .word data_020a16d0
.L_02165a54: .word data_ov007_0216ac10
.L_02165a58: .word func_ov007_02165d04
.L_02165a5c: .word func_ov007_02165cdc
    arm_func_end func_ov007_021653fc

    .global func_ov007_02165a60
    arm_func_start func_ov007_02165a60
func_ov007_02165a60: ; 0x02165a60
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    blx func_ov012_021b65bc
    ldr r5, .L_02165bd0
    mov r6, #0x0
.L_02165a74:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
    cmp r6, #0x4
    blo .L_02165a74
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_02165bd0
    b .L_02165aa4
.L_02165a9c:
    ldr r0, [r5, #0x0]
    blx r0
.L_02165aa4:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_02165a9c
    bl func_020735e4
    ldr r0, [r4, #0x10]
    bl func_ov007_02150b4c
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    beq .L_02165acc
    bl func_02078f88
.L_02165acc:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_02165adc
    bl func_0207698c
.L_02165adc:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_02165aec
    bl func_020763e0
.L_02165aec:
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq .L_02165b0c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x40]
.L_02165b0c:
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_02165b2c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x3c]
.L_02165b2c:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_02165b4c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x38]
.L_02165b4c:
    ldr r0, [r4, #0xc]
    bl func_ov012_021bab64
    ldr r0, [r4, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x0]
    bl func_ov007_02150dbc
    bl func_02073778
    blx func_ov012_021b65cc
    ldr r1, .L_02165bd4
    ldr r2, .L_02165bd8
    ldr r3, [r1, #0x0]
    ldr r0, .L_02165bdc
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r4, #0x24]
    ldr r0, .L_02165be0
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_02165bd0: .word data_020a0e18
.L_02165bd4: .word data_02093c04
.L_02165bd8: .word data_020a16c0
.L_02165bdc: .word data_020a0e80
.L_02165be0: .word data_020afcb0
    arm_func_end func_ov007_02165a60

    .global func_ov007_02165be4
    arm_func_start func_ov007_02165be4
func_ov007_02165be4: ; 0x02165be4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x2c]
    bl func_020769cc
    ldr r0, [r4, #0x30]
    ldr r1, [r4, #0x2c]
    bl func_02079094
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02165be4

    .global func_ov007_02165c04
    arm_func_start func_ov007_02165c04
func_ov007_02165c04: ; 0x02165c04
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
    arm_func_end func_ov007_02165c04

    .global func_ov007_02165c30
    arm_func_start func_ov007_02165c30
func_ov007_02165c30: ; 0x02165c30
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x16
    bl func_020517fc
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x14
    bl func_02051890
    ldr r0, [r5, #0x40]
    bl func_ov007_02165c04
    ldr r0, [r5, #0x40]
    add r1, sp, #0x0
    ldr r0, [r0, #0x4]
    mvn r2, #0x0
    ldr r0, [r0, #0x64]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov007_02165c30

    .global func_ov007_02165c90
    arm_func_start func_ov007_02165c90
func_ov007_02165c90: ; 0x02165c90
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x20]
    mov r6, r1
    bl func_02070cdc
    mov r4, r0
    ldr r0, [r5, #0x20]
    bl func_02070ca4
    mov r5, r0
    bl func_02086c08
    cmp r0, #0x0
    movne r3, #0x2
    moveq r3, #0x3
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov007_02151888
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_02165c90

    .global func_ov007_02165cd8
    arm_func_start func_ov007_02165cd8
func_ov007_02165cd8: ; 0x02165cd8
    bx lr
    arm_func_end func_ov007_02165cd8

    .global func_ov007_02165cdc
    arm_func_start func_ov007_02165cdc
func_ov007_02165cdc: ; 0x02165cdc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02073840
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02165d00
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02165d00: .word func_ov007_02165cd8
    arm_func_end func_ov007_02165cdc

    .global func_ov007_02165d04
    arm_func_start func_ov007_02165d04
func_ov007_02165d04: ; 0x02165d04
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    blx func_ov012_021b65cc
    mov r0, #0x78
    mov r1, #0xb
    bl func_0207342c
    ldr r1, [r4, #0x4]
    mov r0, r4
    ldr r3, [r1, #0x10]
    mvn r2, #0x0
    ldr r1, [r3, #0x1c]
    str r2, [r3, #0x1c]
    bl func_ov007_02165d48
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02165d04

    .global func_ov007_02165d48
    arm_func_start func_ov007_02165d48
func_ov007_02165d48: ; 0x02165d48
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    ldr r3, [r2, #0x10]
    ldr r2, [r3, #0x1c]
    cmp r2, r1
    ldmeqia sp!, {r3, pc}
    ldr r2, .L_02165d78
    str r1, [r3, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r1, [r2, r1, lsl #0x2]
    bl func_02028384
    ldmia sp!, {r3, pc}
.L_02165d78: .word data_ov007_02168bd4
    arm_func_end func_ov007_02165d48

    .global func_ov007_02165d7c
    arm_func_start func_ov007_02165d7c
func_ov007_02165d7c: ; 0x02165d7c
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r0, .L_02165e58
    ldr r4, [r1, #0x10]
    ldr r1, [r0, #0x4]
    ldr r0, [r4, #0x20]
    cmp r0, r1
    bge .L_02165df4
    bl func_02070cdc
    blx func_020725a0
    ldr r6, .L_02165e58
    b .L_02165de4
.L_02165db0:
    ldr r0, [r4, #0x20]
    add r1, r0, #0x1
    str r1, [r4, #0x20]
    ldr r0, [r6, #0x8]
    cmp r1, r0
    ldreq r0, [r4, #0x20]
    addeq r0, r0, #0x1
    streq r0, [r4, #0x20]
    ldr r0, [r4, #0x20]
    bl func_02070cdc
    blx func_020725ac
    cmp r0, #0x0
    bne .L_02165df4
.L_02165de4:
    ldr r1, [r4, #0x20]
    ldr r0, [r6, #0x4]
    cmp r1, r0
    blt .L_02165db0
.L_02165df4:
    ldr r1, .L_02165e58
    ldr r0, [r4, #0x20]
    ldr r1, [r1, #0x4]
    cmp r0, r1
    blt .L_02165e24
    bl func_02086c08
    cmp r0, #0x0
    beq .L_02165e18
    bl func_0208c5bc
.L_02165e18:
    mov r0, r4
    bl func_ov007_02165a60
    ldmia sp!, {r4, r5, r6, pc}
.L_02165e24:
    bl func_02070ca4
    mov r1, r0
    mov r0, r4
    bl func_ov007_02165be4
    ldr r0, [r4, #0x20]
    bl func_02070cdc
    mov r1, r0
    mov r0, r4
    bl func_ov007_02165c30
    mov r0, r5
    mov r1, #0x0
    bl func_ov007_02165d48
    ldmia sp!, {r4, r5, r6, pc}
.L_02165e58: .word data_020afe90
    arm_func_end func_ov007_02165d7c

    .global func_ov007_02165e5c
    arm_func_start func_ov007_02165e5c
func_ov007_02165e5c: ; 0x02165e5c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    ldr r5, [r0, #0x10]
    mov r3, r2
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0xc]
    mov r1, #0x6e
    bl func_ov012_021bac28
    ldr r4, .L_02165f38
    b .L_02165ea4
.L_02165e9c:
    ldr r0, [r4, #0x0]
    blx r0
.L_02165ea4:
    ldr r0, [r5, #0xc]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02165e9c
    ldr r0, [r5, #0xc]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    beq .L_02165f24
    ldr r0, [r5, #0x20]
    bl func_02070cdc
    blx func_02072134
    movs r1, r0
    bmi .L_02165ef0
    mov r0, r5
    bl func_ov007_02165c90
    mov r0, r6
    mov r1, #0x2
    bl func_ov007_02165d48
    b .L_02165f30
.L_02165ef0:
    blx func_02072090
    movs r1, r0
    bmi .L_02165f14
    mov r0, r5
    bl func_ov007_02165c90
    mov r0, r6
    mov r1, #0x3
    bl func_ov007_02165d48
    b .L_02165f30
.L_02165f14:
    mov r0, r6
    mov r1, #0x4
    bl func_ov007_02165d48
    b .L_02165f30
.L_02165f24:
    mov r0, r6
    mov r1, #0x1
    bl func_ov007_02165d48
.L_02165f30:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02165f38: .word data_020a0e18
    arm_func_end func_ov007_02165e5c

    .global func_ov007_02165f3c
    arm_func_start func_ov007_02165f3c
func_ov007_02165f3c: ; 0x02165f3c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    ldr r5, [r0, #0x10]
    mov r3, r2
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0xc]
    mov r1, #0x6f
    bl func_ov012_021bac28
    ldr r4, .L_02165fa4
    b .L_02165f84
.L_02165f7c:
    ldr r0, [r4, #0x0]
    blx r0
.L_02165f84:
    ldr r0, [r5, #0xc]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02165f7c
    mov r0, r6
    bl func_ov007_02165d7c
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02165fa4: .word data_020a0e18
    arm_func_end func_ov007_02165f3c

    .global func_ov007_02165fa8
    arm_func_start func_ov007_02165fa8
func_ov007_02165fa8: ; 0x02165fa8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    ldr r5, [r0, #0x10]
    mov r3, r2
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0xc]
    mov r1, #0x70
    bl func_ov012_021bac28
    ldr r4, .L_02166010
    b .L_02165ff0
.L_02165fe8:
    ldr r0, [r4, #0x0]
    blx r0
.L_02165ff0:
    ldr r0, [r5, #0xc]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02165fe8
    mov r0, r6
    bl func_ov007_02165d7c
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02166010: .word data_020a0e18
    arm_func_end func_ov007_02165fa8

    .global func_ov007_02166014
    arm_func_start func_ov007_02166014
func_ov007_02166014: ; 0x02166014
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    ldr r5, [r0, #0x10]
    mov r3, r2
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0xc]
    mov r1, #0x71
    bl func_ov012_021bac28
    ldr r4, .L_0216607c
    b .L_0216605c
.L_02166054:
    ldr r0, [r4, #0x0]
    blx r0
.L_0216605c:
    ldr r0, [r5, #0xc]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02166054
    mov r0, r6
    bl func_ov007_02165d7c
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0216607c: .word data_020a0e18
    arm_func_end func_ov007_02166014

    .global func_ov007_02166080
    arm_func_start func_ov007_02166080
func_ov007_02166080: ; 0x02166080
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    ldr r5, [r0, #0x10]
    mov r3, r2
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0xc]
    mov r1, #0x72
    bl func_ov012_021bac28
    ldr r4, .L_02166110
    b .L_021660c8
.L_021660c0:
    ldr r0, [r4, #0x0]
    blx r0
.L_021660c8:
    ldr r0, [r5, #0xc]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_021660c0
    ldr r0, [r5, #0xc]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    beq .L_021660fc
    mov r1, #0x1
    mov r0, r5
    str r1, [r5, #0x24]
    bl func_ov007_02165a60
    b .L_02166108
.L_021660fc:
    mov r0, r6
    mov r1, #0x0
    bl func_ov007_02165d48
.L_02166108:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02166110: .word data_020a0e18
    arm_func_end func_ov007_02166080

    .global func_ov007_02166114
    arm_func_start func_ov007_02166114
func_ov007_02166114: ; 0x02166114
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r5, [r0, #0x10]
    blx func_02072090
    mov r1, r0
    mov r0, r5
    bl func_ov007_02165c90
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0xc]
    mov r3, r2
    mov r1, #0x73
    bl func_ov012_021bac28
    ldr r4, .L_0216618c
    b .L_0216616c
.L_02166164:
    ldr r0, [r4, #0x0]
    blx r0
.L_0216616c:
    ldr r0, [r5, #0xc]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02166164
    mov r0, r6
    bl func_ov007_02165d7c
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0216618c: .word data_020a0e18
    arm_func_end func_ov007_02166114

    .global func_ov007_02166190
    thumb_func_start func_ov007_02166190
func_ov007_02166190: ; 0x02166190
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, .L_021662cc
    mov r6, r1
    ldr r0, [r0, #0x0]
    mov r7, r2
    mov r4, r3
    cmp r0, #0x0
    beq .L_021661a6
    b .L_021662c6
.L_021661a6:
    ldr r0, .L_021662d0
    ldr r0, [r0, #0x0]
    blx func_ov007_021662ec
    str r0, [sp, #0x0]
    blx func_02031124
    ldr r0, [r0, #0x4]
    blx func_020314a0
    ldr r0, .L_021662d4
    ldr r1, .L_021662cc
    ldr r2, .L_021662d8
    str r0, [r1, #0x0]
    mov r1, #0x0
    blx func_020517fc
    ldr r1, .L_021662cc
    ldr r0, [r1, #0x0]
    str r5, [r0, #0x14]
    ldr r0, [r1, #0x0]
    str r6, [r0, #0x18]
    ldr r0, [r1, #0x0]
    str r7, [r0, #0x44]
    mov r0, #0x0
    ldr r2, [r1, #0x0]
    subs r3, r0, #0x1
    str r0, [r2, #0x48]
    ldr r2, [r1, #0x0]
    str r0, [r2, #0x4c]
    ldr r2, [r1, #0x0]
    add r2, #0x50
    strb r0, [r2, #0x0]
    ldr r2, [r1, #0x0]
    str r0, [r2, #0xc]
    ldr r2, [r1, #0x0]
    str r0, [r2, #0x10]
    ldr r2, [r1, #0x0]
    str r0, [r2, #0x24]
    ldr r2, [r1, #0x0]
    str r3, [r2, #0x40]
    ldr r2, [r1, #0x0]
    add r2, #0x5b
    strb r0, [r2, #0x0]
    ldr r0, [r1, #0x0]
    mov r2, #0x2
    add r0, #0x5a
    strb r2, [r0, #0x0]
    ldr r0, [r1, #0x0]
    mov r1, #0xff
    add r0, #0xdc
    lsl r2, r2, #0xa
    blx func_0201b28c
    blx func_ov010_0219a22c
    cmp r4, #0x0
    bne .L_0216622e
    ldr r0, .L_021662cc
    ldr r1, [r0, #0x0]
    ldr r0, .L_021662dc
    add r0, r1, r0
    blx func_ov010_021a3178
    ldr r4, .L_021662e0
    blx func_ov010_021a314c
    str r0, [sp, #0x20]
.L_0216622e:
    ldr r0, .L_021662cc
    ldr r2, [sp, #0x20]
    ldr r1, [r0, #0x0]
    str r4, [r1, #0x0]
    ldr r1, [r0, #0x0]
    str r2, [r1, #0x4]
    ldr r1, [r0, #0x0]
    mov r0, #0xc6
    lsl r0, r0, #0x4
    add r0, r1, r0
    blx func_ov010_021a02c0
    ldr r2, .L_021662cc
    ldr r1, .L_021662e4
    ldr r3, [r2, #0x0]
    str r0, [r3, r1]
    ldr r4, [r2, #0x0]
    mov r1, #0x0
    add r4, #0x70
    mov r0, r4
    mov r2, #0x16
    blx func_020517fc
    bl func_02071f08
    mov r1, r4
    mov r2, #0x14
    blx func_02051890
    ldr r0, .L_021662cc
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a1c5c
    blx func_02026f94
    ldr r1, .L_021662cc
    ldr r2, [r1, #0x0]
    str r0, [r2, #0x8]
    ldr r0, [r1, #0x0]
    ldr r1, [r0, #0x8]
    mov r0, #0x2
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    add r2, #0xa0
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, .L_021662cc
    ldr r1, .L_021662e8
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028384
    ldr r0, .L_021662cc
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0x8]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    blx func_ov010_0219dfc8
    ldr r0, [sp, #0x0]
    ldr r0, [r0, #0x4]
    blx func_020314a0
    blx func_0201a2fc
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    blx func_0201aeec
.L_021662c6:
    add sp, #0x8
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_021662cc: .word data_0214ccf8
.L_021662d0: .word data_020a0e80
.L_021662d4: .word data_ov010_021aa0d8 ; data_ov011_021aa0d8
.L_021662d8: .word 0x1cb4
.L_021662dc: .word 0x1be0
.L_021662e0: .word func_ov010_021a34d0 ; data_ov011_021a34d0
.L_021662e4: .word 0x1bd4
.L_021662e8: .word func_ov007_02166388
    thumb_func_end func_ov007_02166190

    .global func_ov007_021662ec
    arm_func_start func_ov007_021662ec
func_ov007_021662ec: ; 0x021662ec
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x25c]
    cmp r1, #0x0
    bne .L_0216630c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0216630c:
    ldr r0, [r4, #0x25c]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_021662ec

    .global func_ov007_02166314
    thumb_func_start func_ov007_02166314
func_ov007_02166314: ; 0x02166314
    push {r4, r5, r6, lr}
    blx func_ov010_021a31ec
    ldr r0, .L_0216637c
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_02166374
    blx func_ov010_0219a308
    blx func_ov010_0219e08c
    ldr r0, .L_0216637c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, .L_0216637c
    ldr r1, [r0, #0x0]
    ldr r0, .L_02166380
    ldr r0, [r1, r0]
    blx func_ov010_021a03bc
    ldr r2, .L_0216637c
    ldr r1, .L_02166380
    ldr r3, [r2, #0x0]
    mov r0, #0x0
    str r0, [r3, r1]
    ldr r4, [r2, #0x0]
    ldr r1, .L_02166384
    add r4, #0xdc
    add r3, r1, #0x1
.L_02166354:
    add r6, r4, r1
    mov r5, r3
    b .L_02166364
.L_0216635a:
    ldrb r2, [r6, #0x0]
    subs r6, r6, #0x1
    cmp r2, #0xff
    bne .L_02166368
    subs r5, r5, #0x1
.L_02166364:
    cmp r5, #0x0
    bgt .L_0216635a
.L_02166368:
    add r0, r0, #0x1
    cmp r0, #0x4
    blt .L_02166354
    ldr r0, .L_0216637c
    mov r1, #0x0
    str r1, [r0, #0x0]
.L_02166374:
    bl func_ov007_021671e4
    pop {r4, r5, r6, pc}
    mov r8, r8
.L_0216637c: .word data_0214ccf8
.L_02166380: .word 0x1bd4
.L_02166384: .word 0x1ff
    thumb_func_end func_ov007_02166314

    .global func_ov007_02166388
    thumb_func_start func_ov007_02166388
func_ov007_02166388: ; 0x02166388
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_021663e0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_02069880
    cmp r0, #0x0
    bne .L_021663be
    ldr r0, .L_021663e0
    ldr r1, .L_021663e4
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_020698bc
    ldr r0, .L_021663e0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_020697d0
    cmp r0, #0x0
    beq .L_021663be
    ldr r0, .L_021663e0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_020697b8
.L_021663be:
    ldr r0, .L_021663e0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_02069864
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_021663d6
    ldr r1, .L_021663e8
    blx func_02028384
    pop {r4, pc}
.L_021663d6:
    ldr r1, .L_021663ec
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_021663e0: .word data_0214ccf8
.L_021663e4: .word 0x414a554a
.L_021663e8: .word func_ov007_02166438
.L_021663ec: .word func_ov007_021663f0
    thumb_func_end func_ov007_02166388

    .global func_ov007_021663f0
    thumb_func_start func_ov007_021663f0
func_ov007_021663f0: ; 0x021663f0
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_0216642c
    ldr r3, [r0, #0x0]
    mov r0, #0x0
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    mov r2, r0
    blx r3
    cmp r0, #0x0
    beq .L_02166428
    ldr r0, .L_0216642c
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x1
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_02166422
    ldr r1, .L_02166430
    blx func_02028384
    pop {r4, pc}
.L_02166422:
    ldr r1, .L_02166434
    blx func_02028384
.L_02166428:
    pop {r4, pc}
    mov r8, r8
.L_0216642c: .word data_0214ccf8
.L_02166430: .word func_ov007_021665b8
.L_02166434: .word func_ov007_02166858
    thumb_func_end func_ov007_021663f0

    .global func_ov007_02166438
    thumb_func_start func_ov007_02166438
func_ov007_02166438: ; 0x02166438
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_0216645c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_0206981c
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_02166454
    ldr r1, .L_02166460
    blx func_02028384
    pop {r4, pc}
.L_02166454:
    ldr r1, .L_02166464
    blx func_02028384
    pop {r4, pc}
.L_0216645c: .word data_0214ccf8
.L_02166460: .word func_ov007_02166570
.L_02166464: .word func_ov007_02166468
    thumb_func_end func_ov007_02166438

    .global func_ov007_02166468
    thumb_func_start func_ov007_02166468
func_ov007_02166468: ; 0x02166468
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_021664a4
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x2
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_021664a0
    ldr r0, .L_021664a4
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x3
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_0216649a
    ldr r1, .L_021664a8
    blx func_02028384
    pop {r4, pc}
.L_0216649a:
    ldr r1, .L_021664ac
    blx func_02028384
.L_021664a0:
    pop {r4, pc}
    mov r8, r8
.L_021664a4: .word data_0214ccf8
.L_021664a8: .word func_ov007_021664b0
.L_021664ac: .word func_ov007_02166858
    thumb_func_end func_ov007_02166468

    .global func_ov007_021664b0
    thumb_func_start func_ov007_021664b0
func_ov007_021664b0: ; 0x021664b0
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_021664d0
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x4
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_021664ce
    ldr r0, [r4, #0x4]
    ldr r1, .L_021664d4
    blx func_02028384
.L_021664ce:
    pop {r4, pc}
.L_021664d0: .word data_0214ccf8
.L_021664d4: .word func_ov007_021664d8
    thumb_func_end func_ov007_021664b0

    .global func_ov007_021664d8
    thumb_func_start func_ov007_021664d8
func_ov007_021664d8: ; 0x021664d8
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, .L_0216653c
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x5
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_0216653a
    ldr r0, .L_0216653c
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x6
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_02166532
    mov r5, #0x0
    b .L_0216651e
.L_02166504:
    ldr r4, [r1, #0x18]
    mov r0, #0xc
    mov r7, r5
    mul r7, r0
    add r0, r4, r7
    bl func_020698cc
    cmp r0, #0x0
    beq .L_0216651c
    add r0, r4, r7
    bl func_02069ba0
.L_0216651c:
    add r5, r5, #0x1
.L_0216651e:
    ldr r0, .L_0216653c
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0x44]
    cmp r5, r0
    blt .L_02166504
    ldr r0, [r6, #0x4]
    ldr r1, .L_02166540
    blx func_02028384
    pop {r3, r4, r5, r6, r7, pc}
.L_02166532:
    ldr r0, [r6, #0x4]
    ldr r1, .L_02166544
    blx func_02028384
.L_0216653a:
    pop {r3, r4, r5, r6, r7, pc}
.L_0216653c: .word data_0214ccf8
.L_02166540: .word func_ov007_02166548
.L_02166544: .word func_ov007_02166438
    thumb_func_end func_ov007_021664d8

    .global func_ov007_02166548
    thumb_func_start func_ov007_02166548
func_ov007_02166548: ; 0x02166548
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_02166564
    ldr r1, .L_02166568
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_020698bc
    ldr r0, [r4, #0x4]
    ldr r1, .L_0216656c
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_02166564: .word data_0214ccf8
.L_02166568: .word 0x414a554a
.L_0216656c: .word func_ov007_021665b8
    thumb_func_end func_ov007_02166548

    .global func_ov007_02166570
    thumb_func_start func_ov007_02166570
func_ov007_02166570: ; 0x02166570
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_021665ac
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x7
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_021665a8
    ldr r0, .L_021665ac
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x8
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_021665a2
    ldr r1, .L_021665b0
    blx func_02028384
    pop {r4, pc}
.L_021665a2:
    ldr r1, .L_021665b4
    blx func_02028384
.L_021665a8:
    pop {r4, pc}
    mov r8, r8
.L_021665ac: .word data_0214ccf8
.L_021665b0: .word func_ov007_021665b8
.L_021665b4: .word func_ov007_02166858
    thumb_func_end func_ov007_02166570

    .global func_ov007_021665b8
    thumb_func_start func_ov007_021665b8
func_ov007_021665b8: ; 0x021665b8
    push {r4, lr}
    mov r4, r0
    blx func_02086c38
    bl func_02087974
    ldr r0, .L_02166600
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x9
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    ldr r1, .L_02166600
    ldr r2, [r1, #0x0]
    ldr r0, [r2, #0xc]
    cmp r0, #0x0
    bne .L_021665f4
    ldr r0, .L_02166604
    ldr r0, [r0, #0x0]
    str r0, [r2, #0xc]
    ldr r0, [r1, #0x0]
    ldr r0, [r0, #0xc]
    bl func_ov010_02175b38
    mov r0, #0x2
    bl func_ov010_02175af8
    bl func_ov010_02175a90
.L_021665f4:
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166608
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_02166600: .word data_0214ccf8
.L_02166604: .word data_0214ccfc
.L_02166608: .word func_ov007_0216660c
    thumb_func_end func_ov007_021665b8

    .global func_ov007_0216660c
    thumb_func_start func_ov007_0216660c
func_ov007_0216660c: ; 0x0216660c
    push {r4, lr}
    mov r4, r0
    bl func_ov010_02175a18
    mov r0, r4
    blx func_ov010_0219bb10
    cmp r0, #0x0
    bne .L_0216662e
    bl func_ov010_02175a60
    cmp r0, #0x0
    beq .L_0216662e
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166630
    blx func_02028384
.L_0216662e:
    pop {r4, pc}
.L_02166630: .word func_ov007_02166634
    thumb_func_end func_ov007_0216660c

    .global func_ov007_02166634
    thumb_func_start func_ov007_02166634
func_ov007_02166634: ; 0x02166634
    push {r4, lr}
    mov r4, r0
    bl func_ov010_021759a4
    cmp r0, #0x4
    beq .L_0216665c
    blx func_ov010_0219a7f4
    ldr r0, .L_02166668
    ldr r3, [r0, #0x0]
    mov r0, #0x12
    ldr r1, [r3, #0x4]
    ldr r2, [r3, #0x2c]
    ldr r3, [r3, #0x0]
    blx r3
    ldr r0, [r4, #0x4]
    ldr r1, .L_0216666c
    blx func_02028384
    pop {r4, pc}
.L_0216665c:
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166670
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_02166668: .word data_0214ccf8
.L_0216666c: .word func_ov010_0219bc98 ; data_ov011_0219bc98
.L_02166670: .word func_ov007_02166674
    thumb_func_end func_ov007_02166634

    .global func_ov007_02166674
    thumb_func_start func_ov007_02166674
func_ov007_02166674: ; 0x02166674
    push {r3, r4, lr}
    sub sp, sp, #0x14
    ldr r1, .L_021666f0
    mov r4, r0
    ldr r2, [r1, #0x0]
    ldr r0, [r2, #0x10]
    cmp r0, #0x0
    bne .L_021666e2
    ldr r0, .L_021666f4
    ldr r3, .L_021666f8
    ldr r0, [r0, #0x0]
    add r0, #0xc
    str r0, [r2, #0x10]
    ldr r1, [r1, #0x0]
    ldr r0, .L_021666fc
    ldr r2, .L_02166700
    str r0, [sp, #0x0]
    mov r0, #0x12
    lsl r0, r0, #0x8
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x18]
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x44]
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x14]
    bl func_ov010_02176de8
    ldr r0, .L_021666f0
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    mov r3, r1
    str r1, [r2, #0x30]
    ldr r0, [r0, #0x0]
    ldr r2, .L_02166704
    add r0, #0x70
    bl func_ov010_02176aa8
    cmp r0, #0x0
    bne .L_021666e2
    blx func_ov010_0219a7f4
    ldr r0, .L_021666f0
    ldr r3, [r0, #0x0]
    mov r0, #0x12
    ldr r1, [r3, #0x4]
    ldr r2, [r3, #0x2c]
    ldr r3, [r3, #0x0]
    blx r3
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166708
    blx func_02028384
    b .L_021666ea
.L_021666e2:
    ldr r0, [r4, #0x4]
    ldr r1, .L_0216670c
    blx func_02028384
.L_021666ea:
    add sp, #0x14
    pop {r3, r4, pc}
    mov r8, r8
.L_021666f0: .word data_0214ccf8
.L_021666f4: .word data_0214ccfc
.L_021666f8: .word data_ov007_0216ac48
.L_021666fc: .word data_ov007_0216ac58
.L_02166700: .word 0x2a2f
.L_02166704: .word func_ov007_02167358
.L_02166708: .word func_ov010_0219bc98 ; data_ov011_0219bc98
.L_0216670c: .word func_ov007_02166710
    thumb_func_end func_ov007_02166674

    .global func_ov007_02166710
    thumb_func_start func_ov007_02166710
func_ov007_02166710: ; 0x02166710
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02166752
    ldr r0, .L_02166754
    ldr r3, [r0, #0x0]
    ldr r0, [r3, #0x48]
    cmp r0, #0x1
    bne .L_02166752
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    mov r0, #0xa
    mov r2, #0x0
    blx r3
    cmp r0, #0x0
    beq .L_02166752
    ldr r0, .L_02166754
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    blx func_ov010_0219ad18
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    beq .L_0216674c
    ldr r1, .L_02166758
    blx func_02028384
    pop {r4, pc}
.L_0216674c:
    ldr r1, .L_0216675c
    blx func_02028384
.L_02166752:
    pop {r4, pc}
.L_02166754: .word data_0214ccf8
.L_02166758: .word func_ov007_0216679c
.L_0216675c: .word func_ov007_02166760
    thumb_func_end func_ov007_02166710

    .global func_ov007_02166760
    thumb_func_start func_ov007_02166760
func_ov007_02166760: ; 0x02166760
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02166794
    bl func_ov010_02175b84
    cmp r0, #0x0
    beq .L_0216677e
    cmp r0, #0x1
    beq .L_0216677e
    cmp r0, #0x2
    beq .L_02166788
    pop {r4, pc}
.L_0216677e:
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166798
    blx func_02028384
    pop {r4, pc}
.L_02166788:
    blx func_ov010_0219a588
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166798
    blx func_02028384
.L_02166794:
    pop {r4, pc}
    mov r8, r8
.L_02166798: .word func_ov007_021667cc
    thumb_func_end func_ov007_02166760

    .global func_ov007_0216679c
    thumb_func_start func_ov007_0216679c
func_ov007_0216679c: ; 0x0216679c
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_021667c2
    ldr r0, .L_021667c4
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0xb
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_021667c2
    ldr r0, [r4, #0x4]
    ldr r1, .L_021667c8
    blx func_02028384
.L_021667c2:
    pop {r4, pc}
.L_021667c4: .word data_0214ccf8
.L_021667c8: .word func_ov007_02166760
    thumb_func_end func_ov007_0216679c

    .global func_ov007_021667cc
    thumb_func_start func_ov007_021667cc
func_ov007_021667cc: ; 0x021667cc
    push {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_021667fa
    mov r0, #0x0
    ldr r1, .L_02166800
    str r0, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r1, .L_02166804
    ldr r3, .L_02166808
    mov r2, r0
    str r0, [sp, #0x8]
    bl func_ov010_02176a40
    cmp r0, #0x0
    beq .L_021667fa
    ldr r0, [r4, #0x4]
    ldr r1, .L_0216680c
    blx func_02028384
.L_021667fa:
    add sp, #0xc
    pop {r3, r4, pc}
    mov r8, r8
.L_02166800: .word func_ov010_0219d618 ; data_ov011_0219d618
.L_02166804: .word func_ov007_02167410
.L_02166808: .word func_ov010_0219d4f0 ; data_ov011_0219d4f0
.L_0216680c: .word func_ov007_02166810
    thumb_func_end func_ov007_021667cc

    .global func_ov007_02166810
    thumb_func_start func_ov007_02166810
func_ov007_02166810: ; 0x02166810
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_0216684e
    ldr r0, .L_02166850
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    beq .L_0216684e
    blx func_ov010_0219a278
    ldr r0, .L_02166850
    mov r3, #0x0
    ldr r1, [r0, #0x0]
    mov r2, #0x2
    add r1, #0x53
    strb r3, [r1, #0x0]
    ldr r1, [r0, #0x0]
    str r2, [r1, #0x48]
    ldr r0, [r0, #0x0]
    add r0, #0x51
    strb r3, [r0, #0x0]
    blx func_ov010_0219a4b4
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166854
    blx func_02028384
.L_0216684e:
    pop {r4, pc}
.L_02166850: .word data_0214ccf8
.L_02166854: .word func_ov010_0219bdec ; data_ov011_0219bdec
    thumb_func_end func_ov007_02166810

    .global func_ov007_02166858
    thumb_func_start func_ov007_02166858
func_ov007_02166858: ; 0x02166858
    push {r3, lr}
    ldr r0, .L_0216686c
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0xd
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    pop {r3, pc}
    mov r8, r8
.L_0216686c: .word data_0214ccf8
    thumb_func_end func_ov007_02166858

    .global func_ov007_02166870
    thumb_func_start func_ov007_02166870
func_ov007_02166870: ; 0x02166870
    push {r4, lr}
    ldr r1, .L_0216690c
    mov r2, #0x1
    ldr r1, [r1, #0x0]
    mov r4, r0
    add r1, #0x50
    strb r2, [r1, #0x0]
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_0216690a
    ldr r0, .L_0216690c
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0xe
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_0216690a
    ldr r0, .L_0216690c
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0xf
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    cmp r0, #0x0
    beq .L_021668da
    ldr r0, .L_0216690c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a1e14
    ldr r0, .L_0216690c
    ldr r0, [r0, #0x0]
    add r0, #0x53
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_021668cc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166910
    blx func_02028384
    pop {r4, pc}
.L_021668cc:
    blx func_ov010_0219a278
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166914
    blx func_02028384
    pop {r4, pc}
.L_021668da:
    ldr r0, .L_0216690c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x48]
    cmp r0, #0x2
    beq .L_021668ee
    cmp r0, #0x3
    beq .L_021668ee
    cmp r0, #0x4
    beq .L_021668f8
    b .L_02166900
.L_021668ee:
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166918
    blx func_02028384
    b .L_02166900
.L_021668f8:
    ldr r0, [r4, #0x4]
    ldr r1, .L_0216691c
    blx func_02028384
.L_02166900:
    ldr r0, .L_0216690c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, #0x50
    strb r1, [r0, #0x0]
.L_0216690a:
    pop {r4, pc}
.L_0216690c: .word data_0214ccf8
.L_02166910: .word func_ov007_02166920
.L_02166914: .word func_ov007_02166958
.L_02166918: .word func_ov010_0219bdec ; data_ov011_0219bdec
.L_0216691c: .word func_ov010_0219c074 ; data_ov011_0219c074
    thumb_func_end func_ov007_02166870

    .global func_ov007_02166920
    thumb_func_start func_ov007_02166920
func_ov007_02166920: ; 0x02166920
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_0216694e
    ldr r0, .L_02166950
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    beq .L_0216694e
    blx func_ov010_0219a278
    ldr r0, .L_02166950
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, #0x53
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166954
    blx func_02028384
.L_0216694e:
    pop {r4, pc}
.L_02166950: .word data_0214ccf8
.L_02166954: .word func_ov007_02166958
    thumb_func_end func_ov007_02166920

    .global func_ov007_02166958
    thumb_func_start func_ov007_02166958
func_ov007_02166958: ; 0x02166958
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_02166994
    mov r2, #0x1
    ldr r1, [r0, #0x0]
    add r1, #0x50
    strb r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    add r0, #0x88
    blx func_ov010_021a1e14
    ldr r0, .L_02166994
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    mov r0, #0x10
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    blx r3
    bl func_ov007_02166af0
    mov r0, #0x0
    blx func_ov007_021669e8
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166998
    blx func_02028384
    pop {r4, pc}
    mov r8, r8
.L_02166994: .word data_0214ccf8
.L_02166998: .word func_ov007_0216699c
    thumb_func_end func_ov007_02166958

    .global func_ov007_0216699c
    thumb_func_start func_ov007_0216699c
func_ov007_0216699c: ; 0x0216699c
    push {r3, lr}
    ldr r0, .L_021669c0
    mov r2, #0x1
    ldr r1, [r0, #0x0]
    add r1, #0x50
    strb r2, [r1, #0x0]
    ldr r3, [r0, #0x0]
    mov r0, #0x11
    ldr r1, [r3, #0x4]
    ldr r3, [r3, #0x0]
    mov r2, #0x0
    blx r3
    cmp r0, #0x0
    beq .L_021669bc
    bl func_ov007_02166314
.L_021669bc:
    pop {r3, pc}
    mov r8, r8
.L_021669c0: .word data_0214ccf8
    thumb_func_end func_ov007_0216699c

    .global func_ov007_021669c4
    thumb_func_start func_ov007_021669c4
func_ov007_021669c4: ; 0x021669c4
    push {r3, lr}
    ldr r0, .L_021669e4
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_021669e0
    blx func_ov010_0219dd5c
    bl func_ov007_02166af0
    mov r0, #0x0
    blx func_ov007_021669e8
    bl func_ov007_02166314
.L_021669e0:
    pop {r3, pc}
    mov r8, r8
.L_021669e4: .word data_0214ccf8
    thumb_func_end func_ov007_021669c4

    .global func_ov007_021669e8
    arm_func_start func_ov007_021669e8
func_ov007_021669e8: ; 0x021669e8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    ldr r1, .L_02166ae8
    mov r5, r0
    ldr r0, [r1, #0x0]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_02166ae0
    mov r4, #0x0
    mov r9, r4
    bl func_02054b44
    cmp r5, #0x0
    movne r9, #0x14
    mov r8, #0x0
    mov r7, #0x24
    ldr r6, .L_02166aec
    b .L_02166a70
.L_02166a2c:
    cmp r9, #0x0
    ble .L_02166a68
    sub r9, r9, #0x1
    cmp r9, #0x0
    bgt .L_02166a68
    str r8, [sp, #0x0]
    str r8, [sp, #0x4]
    str r8, [sp, #0x8]
    mov r0, r5
    mov r1, r7
    mov r2, r8
    mov r3, r8
    mov r4, r5
    str r8, [sp, #0xc]
    bl func_ov012_021bac28
.L_02166a68:
    ldr r0, [r6, #0x0]
    blx r0
.L_02166a70:
    blx func_ov010_02175918
    cmp r0, #0x0
    beq .L_02166a2c
    bl func_02054b44
    ldr r0, .L_02166ae8
    mov r6, #0x0
    ldr r0, [r0, #0x0]
    cmp r4, #0x0
    str r6, [r0, #0xc]
    beq .L_02166ad8
    ldr r5, .L_02166aec
.L_02166a9c:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
    cmp r6, #0x1e
    blo .L_02166a9c
    mov r0, r4
    bl func_ov012_021bace0
    ldr r5, .L_02166aec
    b .L_02166ac8
.L_02166ac0:
    ldr r0, [r5, #0x0]
    blx r0
.L_02166ac8:
    mov r0, r4
    bl func_ov012_021bacf4
    cmp r0, #0x0
    bne .L_02166ac0
.L_02166ad8:
    bl func_02086c24
    blx func_02087980
.L_02166ae0:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02166ae8: .word data_0214ccf8
.L_02166aec: .word data_020a0e18
    arm_func_end func_ov007_021669e8

    .global func_ov007_02166af0
    thumb_func_start func_ov007_02166af0
func_ov007_02166af0: ; 0x02166af0
    push {r3, lr}
    ldr r0, .L_02166b10
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0x10]
    cmp r0, #0x0
    beq .L_02166b0c
    mov r0, #0x0
    str r0, [r1, #0x48]
    bl func_ov010_02176cf8
    ldr r0, .L_02166b10
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x10]
.L_02166b0c:
    pop {r3, pc}
    mov r8, r8
.L_02166b10: .word data_0214ccf8
    thumb_func_end func_ov007_02166af0

    .global func_ov007_02166b14
    thumb_func_start func_ov007_02166b14
func_ov007_02166b14: ; 0x02166b14
    push {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02166ba4
    ldr r0, .L_02166ba8
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a1cfc
    ldr r2, .L_02166bac
    mov r0, #0x0
    ldr r1, [r2, #0x4]
    ldr r2, [r2, #0x0]
    bl func_ov010_0217e59c
    mov r1, #0x1
    add r0, sp, #0x0
    strb r1, [r0, #0x0]
    mov r1, #0x2
    strb r1, [r0, #0x1]
    ldr r0, .L_02166bb0
    add r1, sp, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x0
    mov r2, #0x8
    bl func_ov007_021671a4
    bl func_ov007_021671e4
    blx func_ov010_0219c9c4
    blx func_ov010_0219a328
    blx func_ov010_0219d964
    blx func_ov010_0219db84
    blx func_ov010_0219d984
    bl func_ov007_021671b8
    blx func_ov010_0219d830
    blx func_ov010_0219d908
    ldr r0, .L_02166ba8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a1e14
    ldr r0, .L_02166ba8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, #0x5c
    strb r1, [r0, #0x0]
    blx func_02087378
    blx func_ov010_0219cb6c
    blx func_ov010_0219a438
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166bb4
    blx func_02028384
    mov r0, r4
    bl func_ov007_02166bb8
.L_02166ba4:
    add sp, #0x8
    pop {r4, pc}
.L_02166ba8: .word data_0214ccf8
.L_02166bac: .word data_ov007_0216ac20
.L_02166bb0: .word 0xea60
.L_02166bb4: .word func_ov007_02166bb8
    thumb_func_end func_ov007_02166b14

    .global func_ov007_02166bb8
    thumb_func_start func_ov007_02166bb8
func_ov007_02166bb8: ; 0x02166bb8
    push {r4, lr}
    sub sp, sp, #0x88
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02166c2a
    ldr r3, .L_02166c30
    ldr r1, .L_02166c34
    ldr r2, [r3, #0x4]
    ldr r3, [r3, #0x0]
    add r0, sp, #0x8
    bl func_02003ce0
    blx func_02088234
    blx func_020882e0
    blx func_02088330
    blx func_ov010_0219bf4c
    ldr r0, .L_02166c38
    mov r3, #0x0
    ldr r1, [r0, #0x0]
    ldr r2, .L_02166c3c
    add r1, #0x57
    strb r3, [r1, #0x0]
    ldr r1, .L_02166c40
    str r1, [sp, #0x0]
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r1, sp, #0x8
    add r0, #0x5a
    ldrb r0, [r0, #0x0]
    bl func_ov010_021769dc
    cmp r0, #0x0
    beq .L_02166c1e
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166c44
    blx func_02028384
    ldr r0, .L_02166c38
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    str r2, [r1, #0x6c]
    ldr r1, [r0, #0x0]
    ldr r0, .L_02166c48
    strb r2, [r1, r0]
    b .L_02166c2a
.L_02166c1e:
    bl func_ov010_0217e670
    cmp r0, #0x0
    beq .L_02166c2a
    bl func_ov010_0217e6b0
.L_02166c2a:
    add sp, #0x88
    pop {r4, pc}
    mov r8, r8
.L_02166c30: .word data_ov007_0216ac20
.L_02166c34: .word data_ov007_0216ac60
.L_02166c38: .word data_0214ccf8
.L_02166c3c: .word func_ov007_021673e0
.L_02166c40: .word func_ov007_021673c4
.L_02166c44: .word func_ov007_02166c4c
.L_02166c48: .word 0xa3c
    thumb_func_end func_ov007_02166bb8

    .global func_ov007_02166c4c
    thumb_func_start func_ov007_02166c4c
func_ov007_02166c4c: ; 0x02166c4c
    push {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02166d00
    ldr r0, .L_02166d04
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    ble .L_02166ca2
    mov r0, #0x3
    str r0, [r1, #0x48]
    blx func_ov010_0219c600
    blx func_ov010_0219c92c
    blx func_ov010_0219c680
    bl func_ov010_0217668c
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    blx func_ov010_0219a7e0
    ldr r0, .L_02166d04
    mov r1, #0x50
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_0219d858
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166d08
    blx func_02028384
    ldr r0, .L_02166d04
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    ldr r0, .L_02166d0c
    strb r2, [r1, r0]
    b .L_02166d00
.L_02166ca2:
    bge .L_02166cb6
    mov r0, r4
    blx func_ov010_0219bf84
    ldr r0, .L_02166d04
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    ldr r0, .L_02166d0c
    strb r2, [r1, r0]
    b .L_02166d00
.L_02166cb6:
    add r0, sp, #0x0
    bl func_ov010_0217e420
    cmp r0, #0x0
    bne .L_02166cd6
    ldr r0, .L_02166d04
    ldr r1, [r0, #0x0]
    cmp r1, #0x0
    beq .L_02166cd2
    add r0, sp, #0x0
    ldmia r0!, {r2, r3}
    ldr r0, .L_02166d10
    add r0, r1, r0
    stmia r0!, {r2, r3}
.L_02166cd2:
    mov r0, #0x0
    b .L_02166cf2
.L_02166cd6:
    cmp r0, #0x1
    bne .L_02166cf0
    ldr r0, .L_02166d04
    ldr r1, [r0, #0x0]
    cmp r1, #0x0
    beq .L_02166cec
    add r0, sp, #0x0
    ldmia r0!, {r2, r3}
    ldr r0, .L_02166d10
    add r0, r1, r0
    stmia r0!, {r2, r3}
.L_02166cec:
    mov r0, #0x1
    b .L_02166cf2
.L_02166cf0:
    mov r0, #0x0
.L_02166cf2:
    cmp r0, #0x0
    beq .L_02166d00
    ldr r0, .L_02166d04
    mov r2, #0x1
    ldr r1, [r0, #0x0]
    ldr r0, .L_02166d0c
    strb r2, [r1, r0]
.L_02166d00:
    add sp, #0x8
    pop {r4, pc}
.L_02166d04: .word data_0214ccf8
.L_02166d08: .word func_ov007_02166d14
.L_02166d0c: .word 0xa3c
.L_02166d10: .word 0xa34
    thumb_func_end func_ov007_02166c4c

    .global func_ov007_02166d14
    thumb_func_start func_ov007_02166d14
func_ov007_02166d14: ; 0x02166d14
    push {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02166ddc
    ldr r0, .L_02166de0
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    bge .L_02166d40
    mov r0, r4
    blx func_ov010_0219bf84
    ldr r0, .L_02166de0
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    ldr r0, .L_02166de4
    strb r2, [r1, r0]
    b .L_02166ddc
.L_02166d40:
    blx func_ov010_0219d880
    cmp r0, #0x0
    beq .L_02166ddc
    ldr r0, .L_02166de0
    mov r2, #0x4
    ldr r1, [r0, #0x0]
    str r2, [r1, #0x48]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x3c]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166de8
    blx func_02028384
    blx func_ov010_0219b4a4
    ldr r1, .L_02166de0
    ldr r2, [r1, #0x0]
    ldr r1, .L_02166dec
    str r0, [r2, r1]
    blx func_ov010_0219b4b0
    ldr r2, .L_02166de0
    mov r1, #0xa3
    ldr r3, [r2, #0x0]
    lsl r1, r1, #0x4
    str r0, [r3, r1]
    ldr r0, [r2, #0x0]
    mov r1, #0x0
    add r0, #0x61
    strb r1, [r0, #0x0]
    blx func_ov010_0219cb58
    ldr r4, .L_02166df0
    mov r5, #0x0
.L_02166d88:
    bl func_ov010_021766fc
    cmp r5, r0
    beq .L_02166da2
    mov r0, r5
    bl func_ov010_02176654
    cmp r0, #0x0
    beq .L_02166da2
    mov r0, r5
    mov r1, r4
    bl func_ov010_0217eb74
.L_02166da2:
    add r0, r5, #0x1
    lsl r0, r0, #0x18
    lsr r5, r0, #0x18
    cmp r5, #0x4
    blo .L_02166d88
    mov r1, #0x0
    ldr r0, .L_02166df4
    mvn r1, r1
    str r1, [r0, #0x8]
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x14
    blx func_020517fc
    mov r0, #0x0
    blx func_02070cdc
    add r1, sp, #0x0
    mov r2, #0x0
    bl func_020725e0
    blx func_ov010_0219a6d0
    ldr r0, .L_02166de0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x68]
    cmp r0, #0x0
    beq .L_02166ddc
    blx r0
.L_02166ddc:
    add sp, #0x14
    pop {r4, r5, pc}
.L_02166de0: .word data_0214ccf8
.L_02166de4: .word 0xa3c
.L_02166de8: .word func_ov010_0219c074 ; data_ov011_0219c074
.L_02166dec: .word 0xa2c
.L_02166df0: .word 0x2710
.L_02166df4: .word data_020afe90
    thumb_func_end func_ov007_02166d14

    .global func_ov007_02166df8
    thumb_func_start func_ov007_02166df8
func_ov007_02166df8: ; 0x02166df8
    push {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    beq .L_02166e08
    b .L_02166f40
.L_02166e08:
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x1
    add r1, sp, #0x4
    mov r2, #0x4
    bl func_ov007_021671a4
    blx func_02087378
    blx func_ov010_0219cb6c
    blx func_ov010_0219a438
    bl func_ov007_021671e4
    blx func_ov010_0219c9c4
    blx func_ov010_0219a328
    blx func_ov010_0219d964
    blx func_ov010_0219db84
    blx func_ov010_0219d984
    bl func_ov007_021671b8
    blx func_ov010_0219d830
    blx func_ov010_0219d908
    ldr r0, .L_02166f44
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a21c8
    blx func_ov010_0219d648
    mov r0, #0x1
    blx func_ov010_0219b1c4
    ldr r0, .L_02166f44
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a1e14
    ldr r0, .L_02166f44
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, #0x5c
    strb r1, [r0, #0x0]
    blx func_02088234
    blx func_020882e0
    blx func_02088330
    blx func_ov010_0219bf4c
    ldr r0, .L_02166f44
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, #0x57
    strb r1, [r0, #0x0]
    blx func_ov010_0219a384
    ldr r1, .L_02166f44
    ldr r0, .L_02166f48
    ldr r3, [r1, #0x0]
    mov r2, #0x0
    str r2, [r3, r0]
    ldr r0, [r1, #0x0]
    ldr r3, .L_02166f4c
    add r0, #0x61
    strb r2, [r0, #0x0]
    str r2, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldr r1, .L_02166f50
    add r0, #0x5a
    ldrb r0, [r0, #0x0]
    bl func_ov010_02176974
    cmp r0, #0x0
    beq .L_02166f26
    ldr r0, .L_02166f44
    mov r2, #0x1
    ldr r1, [r0, #0x0]
    add r1, #0x51
    strb r2, [r1, #0x0]
    ldr r1, [r0, #0x0]
    mov r2, #0x4
    str r2, [r1, #0x48]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x3c]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166f54
    blx func_02028384
    blx func_ov010_0219b614
    blx func_ov010_0219c600
    blx func_ov010_0219c680
    blx func_ov010_0219b614
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    blx func_ov010_0219c9e4
    blx func_ov010_0219b620
    ldr r1, .L_02166f58
    str r0, [r1, #0x8]
    blx func_ov010_0219b620
    blx func_ov010_0219f428
    blx func_ov010_0219b620
    blx func_02070cdc
    mov r4, r0
    blx func_ov010_0219b620
    mov r1, #0x0
    blx func_ov010_0219b5ac
    mov r1, r0
    mov r0, r4
    mov r2, #0x0
    bl func_020725e0
    blx func_ov010_0219b620
    mov r1, #0x1
    blx func_ov010_0219f4ac
    blx func_ov010_0219de7c
    b .L_02166f40
.L_02166f26:
    blx func_ov010_0219a7f4
    ldr r0, .L_02166f44
    ldr r3, [r0, #0x0]
    mov r0, #0x12
    ldr r1, [r3, #0x4]
    ldr r2, [r3, #0x2c]
    ldr r3, [r3, #0x0]
    blx r3
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166f5c
    blx func_02028384
.L_02166f40:
    add sp, #0x8
    pop {r4, pc}
.L_02166f44: .word data_0214ccf8
.L_02166f48: .word 0x1bdc
.L_02166f4c: .word func_ov010_0219d144 ; data_ov011_0219d144
.L_02166f50: .word func_ov010_0219cfbc ; data_ov011_0219cfbc
.L_02166f54: .word func_ov010_0219c074 ; data_ov011_0219c074
.L_02166f58: .word data_020afe90
.L_02166f5c: .word func_ov010_0219bc98 ; data_ov011_0219bc98
    thumb_func_end func_ov007_02166df8

    .global func_ov007_02166f60
    thumb_func_start func_ov007_02166f60
func_ov007_02166f60: ; 0x02166f60
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02166fb6
    ldr r0, .L_02166fb8
    mov r1, #0x4
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a1e14
    ldr r0, .L_02166fb8
    mov r2, #0x1
    ldr r1, [r0, #0x0]
    add r1, #0x5c
    strb r2, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r0, .L_02166fbc
    mov r2, #0x32
    add r0, r1, r0
    mov r1, #0x0
    mov r3, r1
    blx func_ov007_02167b28
    ldr r0, .L_02166fb8
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    mvn r2, r2
    add r1, #0x59
    strb r2, [r1, #0x0]
    ldr r1, [r0, #0x0]
    mov r2, #0x1
    add r1, #0x51
    strb r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    add r0, #0x57
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02166fc0
    blx func_02028384
.L_02166fb6:
    pop {r4, pc}
.L_02166fb8: .word data_0214ccf8
.L_02166fbc: .word 0xa88
.L_02166fc0: .word func_ov007_02166fc4
    thumb_func_end func_ov007_02166f60

    .global func_ov007_02166fc4
    thumb_func_start func_ov007_02166fc4
func_ov007_02166fc4: ; 0x02166fc4
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_0216702c
    ldr r0, .L_02167030
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    bge .L_02166fe4
    mov r0, r4
    blx func_ov010_0219bf84
    pop {r4, pc}
.L_02166fe4:
    mov r0, r1
    add r0, #0x53
    ldrb r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_02166ff4
    mov r0, #0x0
    add r1, #0x53
    strb r0, [r1, #0x0]
.L_02166ff4:
    ldr r0, .L_02167030
    mov r2, #0x1
    ldr r1, [r0, #0x0]
    add r1, #0x54
    strb r2, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r0, .L_02167034
    add r0, r1, r0
    blx func_ov007_02167b88
    ldr r0, .L_02167030
    ldr r1, [r0, #0x0]
    mov r0, #0x59
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    blt .L_0216702c
    ldr r0, [r4, #0x4]
    ldr r1, .L_02167038
    blx func_02028384
    ldr r0, .L_02167030
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    add r1, #0x51
    strb r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r0, #0x54
    strb r2, [r0, #0x0]
.L_0216702c:
    pop {r4, pc}
    mov r8, r8
.L_02167030: .word data_0214ccf8
.L_02167034: .word 0xa88
.L_02167038: .word func_ov007_0216703c
    thumb_func_end func_ov007_02166fc4

    .global func_ov007_0216703c
    thumb_func_start func_ov007_0216703c
func_ov007_0216703c: ; 0x0216703c
    push {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_021670e4
    blx func_ov010_0219a384
    ldr r1, .L_021670e8
    ldr r0, .L_021670ec
    ldr r2, [r1, #0x0]
    mov r3, #0x0
    str r3, [r2, r0]
    ldr r0, [r1, #0x0]
    add r0, #0x61
    strb r3, [r0, #0x0]
    blx func_02087378
    blx func_ov010_0219cb6c
    blx func_ov010_0219a438
    bl func_ov007_021671e4
    blx func_ov010_0219c9c4
    blx func_ov010_0219a328
    blx func_ov010_0219d964
    blx func_ov010_0219db84
    blx func_ov010_0219d984
    bl func_ov007_021671b8
    blx func_ov010_0219d830
    blx func_ov010_0219d908
    blx func_02088234
    blx func_020882e0
    blx func_02088330
    blx func_ov010_0219bf4c
    mov r2, #0x0
    ldr r0, .L_021670e8
    str r2, [sp, #0x0]
    ldr r1, [r0, #0x0]
    mov r0, #0x59
    ldrsb r0, [r1, r0]
    ldr r1, .L_021670f0
    ldr r3, .L_021670f4
    bl func_ov010_02176830
    cmp r0, #0x0
    beq .L_021670ca
    ldr r0, .L_021670e8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, #0x51
    strb r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r1, .L_021670f8
    blx func_02028384
    b .L_021670e4
.L_021670ca:
    blx func_ov010_0219a7f4
    ldr r0, .L_021670e8
    ldr r3, [r0, #0x0]
    mov r0, #0x12
    ldr r1, [r3, #0x4]
    ldr r2, [r3, #0x2c]
    ldr r3, [r3, #0x0]
    blx r3
    ldr r0, [r4, #0x4]
    ldr r1, .L_021670fc
    blx func_02028384
.L_021670e4:
    add sp, #0x4
    pop {r3, r4, pc}
.L_021670e8: .word data_0214ccf8
.L_021670ec: .word 0x1bdc
.L_021670f0: .word func_ov010_0219cfbc ; data_ov011_0219cfbc
.L_021670f4: .word func_ov010_0219d144 ; data_ov011_0219d144
.L_021670f8: .word func_ov007_02167100
.L_021670fc: .word func_ov010_0219bc98 ; data_ov011_0219bc98
    thumb_func_end func_ov007_0216703c

    .global func_ov007_02167100
    thumb_func_start func_ov007_02167100
func_ov007_02167100: ; 0x02167100
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_0216712a
    ldr r0, .L_0216712c
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    bge .L_02167120
    mov r0, r4
    blx func_ov010_0219bf84
    pop {r4, pc}
.L_02167120:
    ble .L_0216712a
    ldr r0, [r4, #0x4]
    ldr r1, .L_02167130
    blx func_02028384
.L_0216712a:
    pop {r4, pc}
.L_0216712c: .word data_0214ccf8
.L_02167130: .word func_ov007_02167134
    thumb_func_end func_ov007_02167100

    .global func_ov007_02167134
    thumb_func_start func_ov007_02167134
func_ov007_02167134: ; 0x02167134
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_02167176
    ldr r0, .L_02167178
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    bge .L_02167154
    mov r0, r4
    blx func_ov010_0219bf84
    pop {r4, pc}
.L_02167154:
    blx func_ov010_0219b620
    cmp r0, #0x0
    blt .L_02167176
    blx func_ov010_0219b620
    ldr r0, .L_02167178
    mov r2, #0x4
    ldr r1, [r0, #0x0]
    str r2, [r1, #0x48]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x3c]
    ldr r0, [r4, #0x4]
    ldr r1, .L_0216717c
    blx func_02028384
.L_02167176:
    pop {r4, pc}
.L_02167178: .word data_0214ccf8
.L_0216717c: .word func_ov010_0219c074 ; data_ov011_0219c074
    thumb_func_end func_ov007_02167134

    .global func_ov007_02167180
    thumb_func_start func_ov007_02167180
func_ov007_02167180: ; 0x02167180
    push {r4, lr}
    mov r4, r0
    blx func_ov010_0219bc20
    cmp r0, #0x0
    bne .L_0216719e
    ldr r0, .L_021671a0
    ldr r1, [r0, #0x0]
    mov r0, #0x57
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    bge .L_0216719e
    mov r0, r4
    blx func_ov010_0219bf84
.L_0216719e:
    pop {r4, pc}
.L_021671a0: .word data_0214ccf8
    thumb_func_end func_ov007_02167180

    .global func_ov007_021671a4
    thumb_func_start func_ov007_021671a4
func_ov007_021671a4: ; 0x021671a4
    push {r3, lr}
    bl func_ov010_0217e480
    cmp r0, #0x0
    bne .L_021671b2
    mov r0, #0x1
    pop {r3, pc}
.L_021671b2:
    mov r0, #0x0
    pop {r3, pc}
    thumb_func_end func_ov007_021671a4

    .byte 0x00, 0x00

    .global func_ov007_021671b8
    thumb_func_start func_ov007_021671b8
func_ov007_021671b8: ; 0x021671b8
    push {r3, lr}
    ldr r0, .L_021671d8
    mov r2, #0x5
    ldr r1, [r0, #0x0]
    ldr r0, .L_021671dc
    lsl r2, r2, #0x6
    add r0, r1, r0
    mov r1, #0x0
    blx func_020517fc
    ldr r0, .L_021671e0
    mov r1, #0x1
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    pop {r3, pc}
    mov r8, r8
.L_021671d8: .word data_0214ccf8
.L_021671dc: .word 0x8ec
.L_021671e0: .word data_020afe90
    thumb_func_end func_ov007_021671b8

    .global func_ov007_021671e4
    thumb_func_start func_ov007_021671e4
func_ov007_021671e4: ; 0x021671e4
    push {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    ldr r0, .L_02167230
    mov r1, #0x1
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x8]
    bl func_02071f08
    mov r4, r0
    mov r0, #0x0
    blx func_02070cdc
    mov r1, r4
    mov r2, #0x0
    bl func_020725e0
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x14
    blx func_020517fc
    mov r5, #0x1
    add r4, sp, #0x0
    mov r6, #0x0
.L_02167218:
    mov r0, r5
    blx func_02070cdc
    mov r1, r4
    mov r2, r6
    bl func_020725e0
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_02167218
    add sp, #0x14
    pop {r3, r4, r5, r6, pc}
.L_02167230: .word data_020afe90
    thumb_func_end func_ov007_021671e4

    .global func_ov007_02167234
    thumb_func_start func_ov007_02167234
func_ov007_02167234: ; 0x02167234
    push {r3, lr}
    ldr r2, .L_02167280
    ldr r0, [r2, #0x0]
    ldr r1, [r0, #0x38]
    cmp r1, #0x4
    bhi .L_0216727a
    add r1, r1, r1
    add r1, pc
    ldrh r1, [r1, #0x6]
    lsl r1, r1, #0x10
    asr r1, r1, #0x10
    add pc, r1
.L_0216724c: ; jump table
    .short .L_0216727a - .L_0216724c - 2
    .short .L_02167256 - .L_0216724c - 2
    .short .L_0216726e - .L_0216724c - 2
    .short .L_02167272 - .L_0216724c - 2
    .short .L_02167276 - .L_0216724c - 2
.L_02167256:
    mov r1, #0x0
    add r0, #0x5b
    strb r1, [r0, #0x0]
    ldr r0, [r2, #0x0]
    str r1, [r0, #0x48]
    ldr r0, [r2, #0x0]
    ldr r1, .L_02167284
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x4]
    blx func_02028384
    b .L_0216727a
.L_0216726e:
    mov r0, #0x0
    pop {r3, pc}
.L_02167272:
    mov r0, #0x0
    pop {r3, pc}
.L_02167276:
    mov r0, #0x0
    pop {r3, pc}
.L_0216727a:
    mov r0, #0x1
    pop {r3, pc}
    mov r8, r8
.L_02167280: .word data_0214ccf8
.L_02167284: .word func_ov007_02166674
    thumb_func_end func_ov007_02167234

    .global func_ov007_02167288
    thumb_func_start func_ov007_02167288
func_ov007_02167288: ; 0x02167288
    ldr r0, .L_0216729c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x28]
    cmp r0, #0x7
    bne .L_02167296
    mov r0, #0x1
    bx lr
.L_02167296:
    mov r0, #0x0
    bx lr
    mov r8, r8
.L_0216729c: .word data_0214ccf8
    thumb_func_end func_ov007_02167288

    .global func_ov007_021672a0
    thumb_func_start func_ov007_021672a0
func_ov007_021672a0: ; 0x021672a0
    push {r4, lr}
    mov r4, r0
    ldr r0, .L_0216733c
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0x30]
    cmp r0, #0x0
    beq .L_021672b4
    mov r0, #0x1
    str r0, [r1, #0x38]
    b .L_021672ee
.L_021672b4:
    bl func_ov010_02175770
    ldr r0, .L_0216733c
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    str r2, [r1, #0x38]
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x28]
    cmp r1, #0x3
    bne .L_021672dc
    ldr r2, [r0, #0x2c]
    ldr r1, .L_02167340
    cmp r2, r1
    bne .L_021672d6
    mov r1, #0x1
    str r1, [r0, #0x38]
    b .L_021672ee
.L_021672d6:
    mov r1, #0x2
    str r1, [r0, #0x38]
    b .L_021672ee
.L_021672dc:
    cmp r1, #0x6
    bne .L_021672e6
    mov r1, #0x3
    str r1, [r0, #0x38]
    b .L_021672ee
.L_021672e6:
    cmp r1, #0x7
    bne .L_021672ee
    mov r1, #0x4
    str r1, [r0, #0x38]
.L_021672ee:
    ldr r0, .L_0216733c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x38]
    cmp r0, #0x4
    bhi .L_02167338
    add r0, r0, r0
    add r0, pc
    ldrh r0, [r0, #0x6]
    lsl r0, r0, #0x10
    asr r0, r0, #0x10
    add pc, r0
.L_02167304: ; jump table
    .short .L_02167338 - .L_02167304 - 2
    .short .L_0216730e - .L_02167304 - 2
    .short .L_02167314 - .L_02167304 - 2
    .short .L_02167324 - .L_02167304 - 2
    .short .L_02167334 - .L_02167304 - 2
.L_0216730e:
    bl func_ov007_02166af0
    b .L_02167338
.L_02167314:
    bl func_ov007_02166af0
    mov r0, r4
    blx func_ov007_021669e8
    bl func_ov010_02175770
    b .L_02167338
.L_02167324:
    bl func_ov007_02166af0
    mov r0, r4
    blx func_ov007_021669e8
    bl func_ov010_02175770
    b .L_02167338
.L_02167334:
    mov r0, #0x1
    pop {r4, pc}
.L_02167338:
    mov r0, #0x0
    pop {r4, pc}
.L_0216733c: .word data_0214ccf8
.L_02167340: .word 0xfffec5d2
    thumb_func_end func_ov007_021672a0

    .global func_ov007_02167344
    thumb_func_start func_ov007_02167344
func_ov007_02167344: ; 0x02167344
    ldr r0, .L_02167354
    mov r2, #0x0
    ldr r1, [r0, #0x0]
    str r2, [r1, #0x30]
    ldr r0, [r0, #0x0]
    str r2, [r0, #0x24]
    bx lr
    mov r8, r8
.L_02167354: .word data_0214ccf8
    thumb_func_end func_ov007_02167344

    .global func_ov007_02167358
    thumb_func_start func_ov007_02167358
func_ov007_02167358: ; 0x02167358
    push {r3, lr}
    cmp r0, #0x0
    bne .L_021673ae
    ldr r0, .L_021673b0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x48]
    mov r0, #0xf
    lsl r0, r0, #0x6
    bl func_ov010_0217ec04
    ldr r0, .L_021673b0
    ldr r1, [r0, #0x0]
    mov r0, r1
    ldr r1, [r1, #0x14]
    add r0, #0x88
    blx func_ov010_021a1d90
    ldr r0, .L_021673b0
    ldr r0, [r0, #0x0]
    add r0, #0x88
    blx func_ov010_021a1e04
    ldr r0, .L_021673b4
    mov r1, #0x0
    bl func_ov010_02178214
    ldr r0, .L_021673b8
    bl func_ov010_0217ec58
    blx func_ov010_0219c5c4
    blx func_ov010_0219cb6c
    blx func_ov010_0219a438
    ldr r0, .L_021673bc
    bl func_ov010_0217ec20
    ldr r0, .L_021673c0
    mov r1, #0x0
    bl func_ov010_02176810
.L_021673ae:
    pop {r3, pc}
.L_021673b0: .word data_0214ccf8
.L_021673b4: .word func_ov010_0219d4a4 ; data_ov011_0219d4a4
.L_021673b8: .word func_ov010_0219ce1c ; data_ov011_0219ce1c
.L_021673bc: .word func_ov010_0219cf94 ; data_ov011_0219cf94
.L_021673c0: .word func_ov010_0219d1ac ; data_ov011_0219d1ac
    thumb_func_end func_ov007_02167358

    .global func_ov007_021673c4
    thumb_func_start func_ov007_021673c4
func_ov007_021673c4: ; 0x021673c4
    push {r3, lr}
    ldr r1, .L_021673d4
    ldr r2, .L_021673d8
    ldr r1, [r1, #0x4]
    bl func_ov010_0217e560
    ldr r0, .L_021673dc
    pop {r3, pc}
.L_021673d4: .word data_ov007_0216ac20
.L_021673d8: .word data_ov007_0216ac6c
.L_021673dc: .word 0x7fffff
    thumb_func_end func_ov007_021673c4

    .global func_ov007_021673e0
    thumb_func_start func_ov007_021673e0
func_ov007_021673e0: ; 0x021673e0
    push {r3, lr}
    cmp r0, #0x0
    bne .L_0216740a
    cmp r1, #0x0
    bne .L_021673fe
    blx func_ov010_0219de7c
    bl func_ov010_021766fc
    ldr r0, .L_0216740c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, #0x57
    strb r1, [r0, #0x0]
    pop {r3, pc}
.L_021673fe:
    ldr r0, .L_0216740c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mvn r1, r1
    add r0, #0x57
    strb r1, [r0, #0x0]
.L_0216740a:
    pop {r3, pc}
.L_0216740c: .word data_0214ccf8
    thumb_func_end func_ov007_021673e0

    .global func_ov007_02167410
    thumb_func_start func_ov007_02167410
func_ov007_02167410: ; 0x02167410
    push {r3, r4, r5, r6, r7, lr}
    cmp r0, #0x0
    bne .L_0216746a
    cmp r1, #0x1
    bne .L_0216745e
    ldr r0, .L_02167478
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x14]
    bl func_02069550
    mov r4, #0x0
    ldr r6, .L_02167478
    mov r7, #0xc
    b .L_02167452
.L_0216742c:
    ldr r1, [r6, #0x0]
    mov r5, r4
    ldr r0, [r1, #0x1c]
    mul r5, r7
    ldr r1, [r1, #0x18]
    add r0, r0, r5
    add r1, r1, r5
    mov r2, #0xc
    blx func_0201b298
    cmp r0, #0x0
    bne .L_02167450
    ldr r1, [r6, #0x0]
    ldr r0, [r1, #0x14]
    ldr r1, [r1, #0x18]
    add r1, r1, r5
    blx func_ov010_021a2928
.L_02167450:
    add r4, r4, #0x1
.L_02167452:
    ldr r0, [r6, #0x0]
    ldr r0, [r0, #0x44]
    cmp r4, r0
    blt .L_0216742c
    blx func_ov010_0219a278
.L_0216745e:
    ldr r0, .L_02167478
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, #0x57
    strb r1, [r0, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_0216746a:
    ldr r0, .L_02167478
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mvn r1, r1
    add r0, #0x57
    strb r1, [r0, #0x0]
    pop {r3, r4, r5, r6, r7, pc}
.L_02167478: .word data_0214ccf8
    thumb_func_end func_ov007_02167410

    .global func_ov007_0216747c
    arm_func_start func_ov007_0216747c
func_ov007_0216747c: ; 0x0216747c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0216749c
    bl func_ov012_021bacf4
.L_0216749c:
    cmp r0, #0x0
    beq .L_021674e4
    ldr r0, [r4, #0x0]
    bl func_ov007_02167a48
    cmp r0, #0x0
    bne .L_021674e4
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_021674c4
    bl func_ov012_021bace0
.L_021674c4:
    ldr r5, .L_0216771c
.L_021674c8:
    ldr r0, [r4, #0x0]
    bl func_ov007_02167a48
    cmp r0, #0x0
    bne .L_021674e4
    ldr r0, [r5, #0x0]
    blx r0
    b .L_021674c8
.L_021674e4:
    bl func_ov010_0219a9cc
    bl func_ov010_0219a9e8
    bl func_ov010_0219a9b0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    bne .L_02167518
    ldr r5, .L_0216771c
    b .L_0216750c
.L_02167504:
    ldr r0, [r5, #0x0]
    blx r0
.L_0216750c:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02167504
.L_02167518:
    blx func_ov007_02167288
    bl func_ov010_0219aa04
    mov r5, r0
    ldr r0, [r4, #0x0]
    blx func_ov007_021672a0
    mov r0, #0x78
    mov r1, #0xb
    bl func_0207342c
    mvn r0, #0x0
    cmp r5, r0
    beq .L_02167580
    bl func_ov010_0219a9e8
    bl func_ov010_0219a9e8
    mvn r1, #0x0
    mul r2, r0, r1
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02167670
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    add r1, r5, #0x15
    str r3, [sp, #0xc]
    bl func_ov012_021bac28
    b .L_02167670
.L_02167580:
    bl func_ov010_0219a974
    cmp r0, #0x0
    beq .L_02167604
    bl func_ov010_0219a9b0
    cmp r0, #0x1
    beq .L_021675d0
    cmp r0, #0x3
    bne .L_021675d0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02167670
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r3, r2
    mov r1, #0x4f
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
    b .L_02167670
.L_021675d0:
    bl func_ov010_0219a9e8
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02167670
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    mov r1, #0x22
    str r3, [sp, #0x8]
    sub r2, r1, #0x23
    str r3, [sp, #0xc]
    bl func_ov012_021bac28
    b .L_02167670
.L_02167604:
    bl func_ov010_0219a9e8
    bl func_ov010_0219a9cc
    cmp r0, #0x6
    cmpne r0, #0x7
    ldr r0, [r4, #0x0]
    bne .L_02167648
    cmp r0, #0x0
    beq .L_02167670
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    mov r1, #0x23
    str r3, [sp, #0x8]
    sub r2, r1, #0x24
    str r3, [sp, #0xc]
    bl func_ov012_021bac28
    b .L_02167670
.L_02167648:
    cmp r0, #0x0
    beq .L_02167670
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    mov r1, #0x22
    str r3, [sp, #0x8]
    sub r2, r1, #0x23
    str r3, [sp, #0xc]
    bl func_ov012_021bac28
.L_02167670:
    ldr r5, .L_0216771c
.L_02167674:
    ldr r0, [r4, #0x0]
    bl func_ov007_02167a48
    cmp r0, #0x0
    bne .L_02167690
    ldr r0, [r5, #0x0]
    blx r0
    b .L_02167674
.L_02167690:
    blx func_ov007_02167288
    cmp r0, #0x0
    beq .L_021676f0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_021676c8
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r3, r2
    mov r1, #0x45
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
.L_021676c8:
    ldr r4, .L_0216771c
    mov r5, #0x0
.L_021676d0:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
    cmp r5, #0x14
    blo .L_021676d0
    bl func_0206dd40
    mov r0, #0x1
    b .L_02167714
.L_021676f0:
    blx func_ov007_02167344
    ldrb r0, [r4, #0x9]
    cmp r0, #0x1
    moveq r0, #0x1
    beq .L_02167714
    blx func_ov007_02167234
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
.L_02167714:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0216771c: .word data_020a0e18
    arm_func_end func_ov007_0216747c

    .global func_ov007_02167720
    arm_func_start func_ov007_02167720
func_ov007_02167720: ; 0x02167720
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r1
    cmp r0, #0x11
    mov r4, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_02167a3c
.L_0216773c: ; jump table
    b .L_02167784 ; case 0
    b .L_02167828 ; case 1
    b .L_02167798 ; case 2
    b .L_02167828 ; case 3
    b .L_021677ec ; case 4
    b .L_02167800 ; case 5
    b .L_02167828 ; case 6
    b .L_02167814 ; case 7
    b .L_02167828 ; case 8
    b .L_02167844 ; case 9
    b .L_0216787c ; case 10
    b .L_021678a8 ; case 11
    b .L_021679b8 ; case 12
    b .L_021679cc ; case 13
    b .L_021679d8 ; case 14
    b .L_02167828 ; case 15
    b .L_021679ec ; case 16
    b .L_02167a24 ; case 17
.L_02167784:
    mov r0, r5
    mov r1, #0x27
    bl func_ov007_02167a60
    mov r4, r0
    b .L_02167a3c
.L_02167798:
    ldrsb r0, [r5, #0x10]
    cmp r0, #0x0
    beq .L_021677b0
    cmp r0, #0x1
    beq .L_021677cc
    b .L_02167a3c
.L_021677b0:
    mov r0, r5
    mov r1, #0x29
    bl func_ov007_02167a60
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r5, #0x10]
    b .L_02167a3c
.L_021677cc:
    mov r0, r5
    mov r1, #0x2a
    bl func_ov007_02167a60
    cmp r0, #0x0
    movne r0, r4
    strneb r0, [r5, #0x10]
    movne r4, #0x1
    b .L_02167a3c
.L_021677ec:
    mov r0, r5
    mov r1, #0x47
    bl func_ov007_02167a60
    mov r4, r0
    b .L_02167a3c
.L_02167800:
    mov r0, r5
    mov r1, #0x2b
    bl func_ov007_02167a60
    mov r4, r0
    b .L_02167a3c
.L_02167814:
    mov r0, r5
    mov r1, #0x26
    bl func_ov007_02167a60
    mov r4, r0
    b .L_02167a3c
.L_02167828:
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    moveq r4, #0x1
    beq .L_02167a3c
    bl func_ov012_021bacfc
    mov r4, r0
    b .L_02167a3c
.L_02167844:
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_02167870
    str r4, [sp, #0x0]
    str r4, [sp, #0x4]
    str r4, [sp, #0x8]
    mov r2, r4
    mov r3, r4
    mov r1, #0x2c
    str r4, [sp, #0xc]
    bl func_ov012_021bac28
.L_02167870:
    mov r0, #0x2
    strb r0, [r5, #0xe]
    b .L_02167a3c
.L_0216787c:
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_0216788c
    bl func_ov012_021bace0
.L_0216788c:
    ldr r0, [r5, #0x0]
    bl func_ov007_02167a48
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r5, #0xe]
    movne r4, #0x1
    b .L_02167a3c
.L_021678a8:
    ldrsb r0, [r5, #0xf]
    cmp r0, #0x3c
    bgt .L_021678d4
    bge .L_02167968
    cmp r0, #0x0
    bgt .L_021678c8
    beq .L_021678f0
    b .L_02167958
.L_021678c8:
    cmp r0, #0x14
    beq .L_02167924
    b .L_02167958
.L_021678d4:
    cmp r0, #0x5a
    bgt .L_021678e4
    beq .L_0216798c
    b .L_02167958
.L_021678e4:
    cmp r0, #0x6e
    beq .L_021679b0
    b .L_02167958
.L_021678f0:
    mov r0, r5
    mov r1, #0x10
    bl func_ov007_02167a60
    ldrsb r0, [r5, #0xe]
    cmp r0, #0x1
    bne .L_02167a3c
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    bl func_ov012_021bad88
    ldrsb r0, [r5, #0xf]
    add r0, r0, #0x1
    strb r0, [r5, #0xf]
    b .L_02167a3c
.L_02167924:
    mov r0, r4
    bl func_0206dcdc
    bl func_02072ab4
    cmp r0, #0x0
    moveq r0, #0x50
    beq .L_02167948
    mov r0, #0x1
    bl func_0206dcdc
    mov r0, #0x32
.L_02167948:
    strb r0, [r5, #0xf]
    mov r0, #0x2
    strb r0, [r5, #0xe]
    b .L_02167a3c
.L_02167958:
    ldrsb r0, [r5, #0xf]
    add r0, r0, #0x1
    strb r0, [r5, #0xf]
    b .L_02167a3c
.L_02167968:
    mov r0, r5
    mov r1, #0x28
    bl func_ov007_02167a60
    cmp r0, #0x0
    beq .L_02167a3c
    mov r0, r4
    strb r0, [r5, #0xf]
    mov r0, #0x1
    b .L_02167a40
.L_0216798c:
    mov r0, r5
    mov r1, #0x11
    bl func_ov007_02167a60
    ldrsb r0, [r5, #0xe]
    cmp r0, #0x1
    ldreqsb r0, [r5, #0xf]
    addeq r0, r0, #0x1
    streqb r0, [r5, #0xf]
    b .L_02167a3c
.L_021679b0:
    bl func_0206dd40
    b .L_02167a3c
.L_021679b8:
    mov r0, r5
    mov r1, #0x2d
    bl func_ov007_02167a60
    mov r4, r0
    b .L_02167a3c
.L_021679cc:
    mov r0, #0x1
    strb r0, [r5, #0xb]
    b .L_02167a3c
.L_021679d8:
    mov r0, r5
    mov r1, #0x2e
    bl func_ov007_02167a60
    mov r4, r0
    b .L_02167a3c
.L_021679ec:
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_02167a18
    str r4, [sp, #0x0]
    str r4, [sp, #0x4]
    str r4, [sp, #0x8]
    mov r2, r4
    mov r3, r4
    mov r1, #0x2f
    str r4, [sp, #0xc]
    bl func_ov012_021bac28
.L_02167a18:
    mov r0, #0x2
    strb r0, [r5, #0xe]
    b .L_02167a3c
.L_02167a24:
    mov r0, r5
    mov r1, #0x30
    bl func_ov007_02167a60
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r5, #0xc]
.L_02167a3c:
    mov r0, r4
.L_02167a40:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov007_02167720

    .global func_ov007_02167a48
    arm_func_start func_ov007_02167a48
func_ov007_02167a48: ; 0x02167a48
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_ov012_021bad2c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02167a48

    .global func_ov007_02167a60
    arm_func_start func_ov007_02167a60
func_ov007_02167a60: ; 0x02167a60
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldrsb r0, [r4, #0xe]
    mov r5, r1
    cmp r0, #0x2
    bne .L_02167aa0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02167a8c
    bl func_ov012_021bace0
.L_02167a8c:
    ldr r0, [r4, #0x0]
    bl func_ov007_02167a48
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r4, #0xe]
.L_02167aa0:
    ldrsb r0, [r4, #0xe]
    cmp r0, #0x0
    bne .L_02167ae0
    mov r0, #0x1
    strb r0, [r4, #0xe]
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02167ae0
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r1, r5
    mov r3, r2
    str r2, [sp, #0xc]
    bl func_ov012_021bac28
.L_02167ae0:
    ldrsb r0, [r4, #0xe]
    cmp r0, #0x1
    bne .L_02167b08
    ldr r0, [r4, #0x0]
    bl func_ov007_02167a48
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r4, #0xe]
    movne r0, #0x1
    bne .L_02167b0c
.L_02167b08:
    mov r0, #0x0
.L_02167b0c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov007_02167a60

    .global func_ov007_02167b14
    arm_func_start func_ov007_02167b14
func_ov007_02167b14: ; 0x02167b14
    ldrb r0, [r0, #0x8]
    bx lr
    arm_func_end func_ov007_02167b14

    .global func_ov007_02167b1c
    arm_func_start func_ov007_02167b1c
func_ov007_02167b1c: ; 0x02167b1c
    add r0, r0, #0xc
    add r0, r0, r1, lsl #0x3
    bx lr
    arm_func_end func_ov007_02167b1c

    .global func_ov007_02167b28
    arm_func_start func_ov007_02167b28
func_ov007_02167b28: ; 0x02167b28
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    blx func_02070ff4
    str r0, [r4, #0x0]
    strb r7, [r4, #0x4]
    strb r6, [r4, #0x5]
    mov r0, #0x32
    strb r0, [r4, #0x8]
    mov r2, #0x0
    mvn r1, #0x0
.L_02167b5c:
    add r0, r4, r2, lsl #0x3
    add r2, r2, #0x1
    strb r1, [r0, #0xc]
    cmp r2, #0x32
    blt .L_02167b5c
    mov r0, #0x0
    strb r0, [r4, #0x6]
    cmp r5, #0x0
    movne r0, #0x1
    strb r0, [r4, #0x7]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov007_02167b28

    .global func_ov007_02167b88
    arm_func_start func_ov007_02167b88
func_ov007_02167b88: ; 0x02167b88
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x5c
    mov r10, r0
    mov r6, #0x0
    add r5, r10, #0xc
    mvn r4, #0x0
    add r11, sp, #0x8
.L_02167ba4:
    ldrb r1, [r10, #0x6]
    ldrb r0, [r10, #0x5]
    add r2, sp, #0x5
    add r1, r1, r6
    and r3, r1, #0xff
    cmp r3, r0
    subhs r0, r3, r0
    andhs r3, r0, #0xff
    ldrb r0, [r10, #0x4]
    add r1, sp, #0x4
    add r9, r0, r3
    strb r4, [r5, r9, lsl #0x3]
    str r11, [sp, #0x0]
    ldr r8, [r10, #0x0]
    mov r0, #0xc
    mla r0, r9, r0, r8
    add r3, sp, #0xc
    add r7, r5, r9, lsl #0x3
    blx func_ov010_0217830c
    mov r8, r0
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ble .L_02167c0c
    add r0, sp, #0xc
    mov r1, r9
    bl func_ov010_021a1ff8
.L_02167c0c:
    cmp r8, #0x6
    bne .L_02167cb4
    ldrb r0, [r10, #0x7]
    cmp r0, #0x0
    movne r1, #0x3
    moveq r1, #0x2
    add r0, sp, #0xc
    bl func_ov010_021a1f34
    cmp r0, #0x0
    beq .L_02167cb4
    strb r9, [r7, #0x0]
    ldrb r1, [sp, #0x5]
    add r0, sp, #0xc
    strb r1, [r7, #0x1]
    bl func_ov010_021a20dc
    add r2, r0, #0x1
    ldrb r1, [sp, #0x5]
    add r0, sp, #0xc
    sub r1, r2, r1
    strb r1, [r7, #0x2]
    bl func_ov010_021a1f68
    cmp r0, #0x0
    bne .L_02167c78
    add r0, sp, #0xc
    bl func_ov010_021a1f98
    cmp r0, #0x0
    beq .L_02167c80
.L_02167c78:
    mov r0, #0x1
    b .L_02167c84
.L_02167c80:
    mov r0, #0x0
.L_02167c84:
    and r0, r0, #0xff
    mov r1, r0, lsl #0x1f
    mov r0, r9
    ldrb r2, [r7, #0x3]
    bic r2, r2, #0x2
    orr r1, r2, r1, lsr #0x1e
    strb r1, [r7, #0x3]
    and r1, r1, #0xff
    bic r1, r1, #0x1
    strb r1, [r7, #0x3]
    blx func_02071050
    str r0, [r7, #0x4]
.L_02167cb4:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_02167ba4
    ldrb r0, [r10, #0x6]
    add r0, r0, #0x4
    strb r0, [r10, #0x6]
    ldrb r1, [r10, #0x5]
    and r0, r0, #0xff
    cmp r0, r1
    ldrhsb r0, [r10, #0x6]
    subhs r0, r0, r1
    strhsb r0, [r10, #0x6]
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov007_02167b88

    .global func_ov007_02167cec
    arm_func_start func_ov007_02167cec
func_ov007_02167cec: ; 0x02167cec
    ldrsb r0, [r0, #0x0]
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    arm_func_end func_ov007_02167cec

    .global func_ov007_02167d00
    arm_func_start func_ov007_02167d00
func_ov007_02167d00: ; 0x02167d00
    ldrsb r0, [r0, #0x0]
    bx lr
    arm_func_end func_ov007_02167d00

    .global func_ov007_02167d08
    arm_func_start func_ov007_02167d08
func_ov007_02167d08: ; 0x02167d08
    ldrsb r0, [r0, #0x1]
    bx lr
    arm_func_end func_ov007_02167d08

    .global func_ov007_02167d10
    arm_func_start func_ov007_02167d10
func_ov007_02167d10: ; 0x02167d10
    ldrsb r0, [r0, #0x2]
    bx lr
    arm_func_end func_ov007_02167d10

    .global func_ov007_02167d18
    arm_func_start func_ov007_02167d18
func_ov007_02167d18: ; 0x02167d18
    ldrb r0, [r0, #0x3]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov007_02167d18

    .global func_ov007_02167d30
    arm_func_start func_ov007_02167d30
func_ov007_02167d30: ; 0x02167d30
    ldr r0, [r0, #0x4]
    bx lr
    arm_func_end func_ov007_02167d30

    .global func_ov007_02167d38
    arm_func_start func_ov007_02167d38
func_ov007_02167d38: ; 0x02167d38
    mov r1, #0x0
    strh r1, [r0, #0x0]
    strh r1, [r0, #0x2]
    strh r1, [r0, #0x4]
    strh r1, [r0, #0x6]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov007_02167d38

    .global func_ov007_02167d54
    arm_func_start func_ov007_02167d54
func_ov007_02167d54: ; 0x02167d54
    stmdb sp!, {r3, lr}
    blx func_ov010_0217ec74
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov007_02167d54

    .global func_ov007_02167d6c
    arm_func_start func_ov007_02167d6c
func_ov007_02167d6c: ; 0x02167d6c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrsb r0, [r5, #0x3]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r6, #0x1
    ldrb r4, [r5, #0x2]
    mov r7, r6
    b .L_02167de4
.L_02167d94:
    mov r0, r4
    blx func_ov010_02176654
    cmp r0, #0x0
    beq .L_02167dd0
    mov r0, r4
    bl func_ov007_02167d54
    cmp r0, #0x0
    addne r0, r4, #0x1
    strneb r0, [r5, #0x2]
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrsb r0, [r5, #0x1]
    orr r0, r0, r7, lsl r4
    strb r0, [r5, #0x1]
    b .L_02167ddc
.L_02167dd0:
    ldrsb r0, [r5, #0x1]
    orr r0, r0, r6, lsl r4
    strb r0, [r5, #0x1]
.L_02167ddc:
    add r0, r4, #0x1
    and r4, r0, #0xff
.L_02167de4:
    cmp r4, #0x4
    blo .L_02167d94
    mov r0, #0x4
    strb r0, [r5, #0x2]
    ldrsb r0, [r5, #0x1]
    cmp r0, #0xf
    bne .L_02167e20
    ldrsb r0, [r5, #0x0]
    sub r0, r0, #0x1
    strb r0, [r5, #0x0]
    ldrsb r0, [r5, #0x0]
    cmp r0, #0x0
    ble .L_02167e20
    mov r0, r5
    bl func_ov007_02167e28
.L_02167e20:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov007_02167d6c

    .global func_ov007_02167e28
    arm_func_start func_ov007_02167e28
func_ov007_02167e28: ; 0x02167e28
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r4, #0x0
    strb r4, [r5, #0x1]
    ldrsb r1, [r5, #0x3]
    cmp r1, #0x0
    beq .L_02167e98
    mov r6, #0x1
    mov r7, r6
.L_02167e4c:
    mov r0, r4
    blx func_ov010_02176654
    cmp r0, #0x0
    beq .L_02167e78
    mov r0, r4
    bl func_ov007_02167d54
    cmp r0, #0x0
    ldreqsb r0, [r5, #0x1]
    orreq r0, r0, r7, lsl r4
    streqb r0, [r5, #0x1]
    b .L_02167e84
.L_02167e78:
    ldrsb r0, [r5, #0x1]
    orr r0, r0, r6, lsl r4
    strb r0, [r5, #0x1]
.L_02167e84:
    add r0, r4, #0x1
    and r4, r0, #0xff
    cmp r4, #0x4
    blo .L_02167e4c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02167e98:
    strb r4, [r5, #0x2]
    bl func_ov007_02167d6c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov007_02167e28

    .global func_ov007_02167ea4
    arm_func_start func_ov007_02167ea4
func_ov007_02167ea4: ; 0x02167ea4
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    strb r6, [r0, #0x0]
    add r5, r0, #0x4
    mov r4, #0xc
.L_02167eb8:
    mla r0, r6, r4, r5
    bl func_ov007_02167d38
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_02167eb8
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov007_02167ea4

    .global func_ov007_02167ed0
    arm_func_start func_ov007_02167ed0
func_ov007_02167ed0: ; 0x02167ed0
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    cmp r1, #0x0
    mov r8, r0
    mov r7, r2
    movlt r5, #0x0
    blt .L_02167ef8
    ldr r5, .L_02167fb4
    cmp r1, r5
    movle r0, r1, lsl #0x10
    movle r5, r0, lsr #0x10
.L_02167ef8:
    mov r0, #0xc
    mul r6, r7, r0
    add r2, r8, #0xc
    ldr r0, [r2, r6]
    add r4, r8, #0xa
    add r0, r0, r5
    str r0, [r2, r6]
    ldrh r0, [r4, r6]
    add r0, r0, #0x1
    strh r0, [r4, r6]
    ldrh r1, [r4, r6]
    ldr r0, [r2, r6]
    bl func_0200d338
    add r1, r8, r6
    strh r0, [r1, #0x4]
    ldrh r0, [r4, r6]
    cmp r0, #0x1
    streqh r5, [r1, #0x6]
    streqh r5, [r1, #0x8]
    beq .L_02167f68
    add r1, r8, #0x6
    ldrh r0, [r1, r6]
    cmp r5, r0
    strloh r5, [r1, r6]
    add r1, r8, #0x8
    ldrh r0, [r1, r6]
    cmp r5, r0
    strhih r5, [r1, r6]
.L_02167f68:
    ldrsb r1, [r8, #0x1]
    mov r0, #0x1
    orr r0, r1, r0, lsl r7
    strb r0, [r8, #0x1]
    ldrsb r0, [r8, #0x1]
    cmp r0, #0xf
    bne .L_02167fa8
    ldrsb r0, [r8, #0x0]
    sub r0, r0, #0x1
    strb r0, [r8, #0x0]
    ldrsb r0, [r8, #0x0]
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    bl func_ov007_02167e28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02167fa8:
    mov r0, r8
    bl func_ov007_02167d6c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02167fb4: .word 0xffff
    arm_func_end func_ov007_02167ed0

    .global func_ov007_02167fb8
    arm_func_start func_ov007_02167fb8
func_ov007_02167fb8: ; 0x02167fb8
    ldr r0, .L_02167fc8
    mov r1, #0x1
    strb r1, [r0, #0x0]
    bx lr
.L_02167fc8: .word data_ov007_0216c6e8
    arm_func_end func_ov007_02167fb8

    .global func_ov007_02167fcc
    arm_func_start func_ov007_02167fcc
func_ov007_02167fcc: ; 0x02167fcc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    bl func_02073778
    bl func_0207379c
    ldr r1, .L_02168310
    ldr r2, .L_02168314
    mov r0, #0x48
    mov r3, #0x5a
    bl func_0201a21c
    mov r5, r0
    mov r1, #0x0
    mov r2, #0x48
    bl func_020517fc
    bl func_02026f94
    str r0, [r5, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0xc]
    ldr r0, [r5, #0x4]
    add r1, sp, #0xc
    bl func_ov007_0214ed20
    ldr r0, [r5, #0x4]
    ldr r1, .L_02168318
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x4]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x0
    str r0, [r5, #0x24]
    bl func_02026f94
    str r0, [r5, #0x38]
    mov r0, #0x82000
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x38]
    add r1, sp, #0x8
    bl func_ov007_0214ed20
    ldr r0, [r5, #0x38]
    ldr r1, .L_0216831c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x38]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_02026f94
    str r0, [r5, #0x3c]
    mov r0, #0x81000
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x3c]
    add r1, sp, #0x4
    bl func_ov007_0214ed20
    ldr r0, [r5, #0x3c]
    ldr r1, .L_02168320
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x3c]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_020310f4
    ldr r2, .L_02168324
    str r0, [r5, #0x0]
    ldr r1, .L_02168328
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_0216832c
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    bl func_0203b404
    ldr r4, [r0, #0x88]
    ldr r0, .L_02168330
    ldr r3, .L_02168334
    ldr lr, [r4, #0x4]
    ldr r6, [r0, #0x0]
    ldr r2, [r3, #0x0]
    str lr, [r0, #0x0]
    sub ip, r2, #0x1
    mov r1, #0x0
    ldr r4, .L_02168338
    ldr r0, .L_0216833c
    mov r2, r1
    str r6, [r4, ip, lsl #0x2]
    str ip, [r3, #0x0]
    blx func_ov012_021caa0c
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    mov r6, r0
    ldr r1, [r6, #0x18]
    cmp r1, #0x0
    bne .L_0216816c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0216816c:
    ldr r0, [r4, #0x4]
    ldr r4, [r6, #0x18]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, .L_02168340
    mov r1, #0x0
    ldr r2, [r0, #0x8]
    b .L_02168194
.L_02168190:
    add r1, r1, #0x1
.L_02168194:
    ldrh r0, [r2], #0x2
    cmp r0, #0x0
    bne .L_02168190
    mov r0, #0xb
    mul r0, r1, r0
    ldr r1, [r4, #0x4]
    mov r0, r0, lsr #0x1
    rsb r0, r0, #0x80
    ldr r6, [r1, #0x50]
    mov r0, r0, lsl #0xc
    str r0, [r6, #0xc]
    mov r0, #0x52000
    str r0, [r6, #0x10]
    ldrb r0, [r6, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_021681e8
    mov r0, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_021681e8:
    ldrb r0, [r6, #0x24]
    orr r0, r0, #0x31
    strb r0, [r6, #0x24]
    ldr r6, [r4, #0x4]
    ldr r0, [r6, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02168344
    bl func_02028384
    mov r0, #0x80000
    str r0, [sp, #0x0]
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov007_0214ed20
    ldr r1, .L_02168334
    str r4, [r5, #0x34]
    ldr r4, [r1, #0x0]
    ldr r0, .L_02168348
    add r3, r4, #0x1
    str r3, [r1, #0x0]
    ldr r2, .L_02168338
    ldr r1, .L_02168330
    ldr r3, [r2, r4, lsl #0x2]
    ldrb r2, [r0, #0x0]
    str r3, [r1, #0x0]
    cmp r2, #0x0
    movne r1, #0x0
    strneb r1, [r0, #0x0]
    bne .L_021682c4
    ldr r0, [r5, #0x4]
    ldr r1, .L_0216834c
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl func_ov012_021ba49c
    str r0, [r5, #0x44]
    ldr r0, [r5, #0x34]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_021682c4:
    bl func_020750e0
    str r0, [r5, #0x40]
    mov r0, #0xa
    str r0, [r5, #0x28]
    mov r2, #0x0
    mov r0, #0x3
    mov r1, #0x1
    str r2, [r5, #0x30]
    bl func_02073ebc
    bl func_0207382c
    bl func_0207382c
    bl func_0207382c
    bl func_0207382c
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x0]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02168310: .word data_ov007_0216acac
.L_02168314: .word data_ov007_0216ac94
.L_02168318: .word func_ov007_021686a4
.L_0216831c: .word func_ov007_02168938
.L_02168320: .word func_ov007_02168944
.L_02168324: .word data_02093c04
.L_02168328: .word data_020a0e80
.L_0216832c: .word data_020a16c0
.L_02168330: .word data_020a0dd0
.L_02168334: .word data_02093c08
.L_02168338: .word data_020a16d0
.L_0216833c: .word data_ov007_0216acc4
.L_02168340: .word data_ov007_0216ac70
.L_02168344: .word func_ov007_0216889c
.L_02168348: .word data_ov007_0216c6e8
.L_0216834c: .word func_ov007_021684dc
    arm_func_end func_ov007_02167fcc

    .global func_ov007_02168350
    arm_func_start func_ov007_02168350
func_ov007_02168350: ; 0x02168350
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02168370
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02168370:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_02168388
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02168388:
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    beq .L_021683a0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021683a0:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_021683b8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021683b8:
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_021683d0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021683d0:
    ldr r0, [r4, #0x40]
    bl func_02075168
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_021683e8
    bl func_ov012_021bab64
.L_021683e8:
    ldr r1, .L_02168444
    ldr r2, .L_02168448
    ldr r3, [r1, #0x0]
    ldr r0, .L_0216844c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r1, [r4, #0x24]
    ldr r0, .L_02168450
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_02168444: .word data_02093c04
.L_02168448: .word data_020a16c0
.L_0216844c: .word data_020a0e80
.L_02168450: .word data_020afcb0
    arm_func_end func_ov007_02168350

    .global func_ov007_02168454
    arm_func_start func_ov007_02168454
func_ov007_02168454: ; 0x02168454
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    blx func_0208c220
    cmp r0, #0x0
    bne .L_0216847c
    blx func_0208c244
    cmp r0, #0x0
    beq .L_021684cc
.L_0216847c:
    ldr r0, .L_021684d4
    ldrb r0, [r0, #0x29]
    cmp r0, #0x0
    bne .L_021684a4
    mov r0, #0x1
    blx func_0208b784
    bl func_02086c24
    ldr r0, .L_021684d4
    mov r1, #0x0
    strb r1, [r0, #0x28]
.L_021684a4:
    ldr r0, .L_021684d4
    mov r1, #0x0
    strb r1, [r0, #0x29]
    mov r0, #0x2
    str r0, [r4, #0x24]
    ldr r0, [r5, #0x4]
    ldr r1, .L_021684d8
    bl func_02028384
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_021684cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021684d4: .word data_020afe90
.L_021684d8: .word func_ov007_02168858
    arm_func_end func_ov007_02168454

    .global func_ov007_021684dc
    arm_func_start func_ov007_021684dc
func_ov007_021684dc: ; 0x021684dc
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r4, [r1, #0x10]
    bl func_ov007_02168454
    cmp r0, #0x0
    bne .L_02168560
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0x28]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    bne .L_02168560
    bl func_0207382c
    cmp r0, #0x0
    beq .L_02168560
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r4, #0x44]
    mov r3, r2
    mov r1, #0x53
    bl func_ov012_021bac28
    ldr r0, [r4, #0x44]
    mov r1, #0x1
    bl func_ov012_021bad18
    ldr r0, [r5, #0x4]
    ldr r1, .L_02168568
    bl func_02028384
.L_02168560:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02168568: .word func_ov007_0216856c
    arm_func_end func_ov007_021684dc

    .global func_ov007_0216856c
    arm_func_start func_ov007_0216856c
func_ov007_0216856c: ; 0x0216856c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0x4]
    ldr r6, [r1, #0x10]
    bl func_ov007_02168454
    cmp r0, #0x0
    bne .L_0216865c
    ldr r0, [r6, #0x44]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_0216865c
    ldr r0, [r6, #0x44]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    bne .L_02168638
    blx func_0208bfdc
    mov r0, #0x2
    bl func_ov007_02168674
    blx func_0208c17c
    mov r0, #0x1
    blx func_0208b784
    ldr r0, .L_02168664
    mov r1, #0x0
    strb r1, [r0, #0x29]
    bl func_02086c24
    mov r0, #0x1e
    bl func_ov007_02168674
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r6, #0x44]
    mov r1, #0x52
    mov r3, r2
    bl func_ov012_021bac28
    ldr r5, .L_02168668
    b .L_02168610
.L_02168608:
    ldr r0, [r5, #0x0]
    blx r0
.L_02168610:
    ldr r0, [r6, #0x44]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_02168608
    mov r0, #0x1
    str r0, [r6, #0x24]
    ldr r0, [r4, #0x4]
    ldr r1, .L_0216866c
    bl func_02028384
    b .L_0216865c
.L_02168638:
    ldr r0, [r6, #0x34]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02168670
    bl func_02028384
.L_0216865c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02168664: .word data_020afe90
.L_02168668: .word data_020a0e18
.L_0216866c: .word func_ov007_02168858
.L_02168670: .word func_ov007_021686a4
    arm_func_end func_ov007_0216856c

    .global func_ov007_02168674
    arm_func_start func_ov007_02168674
func_ov007_02168674: ; 0x02168674
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_021686a0
    b .L_02168694
.L_02168688:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_02168694:
    cmp r5, r6
    blo .L_02168688
    ldmia sp!, {r4, r5, r6, pc}
.L_021686a0: .word data_020a0e18
    arm_func_end func_ov007_02168674

    .global func_ov007_021686a4
    arm_func_start func_ov007_021686a4
func_ov007_021686a4: ; 0x021686a4
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0x28]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    bne .L_021686d4
    bl func_0207382c
.L_021686d4:
    mov r6, #0x0
    bl func_020876f8
    cmp r0, #0x0
    beq .L_02168780
    mov r7, r6
    mov r8, #0x1
    b .L_02168704
.L_021686f0:
    mov r0, r8
    bl func_02088310
    cmp r0, #0x0
    addne r7, r7, #0x1
    add r8, r8, #0x1
.L_02168704:
    bl func_02086d80
    cmp r8, r0
    blo .L_021686f0
    bl func_02086d80
    sub r0, r0, #0x1
    cmp r7, r0
    bne .L_02168794
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    beq .L_02168794
    bl func_020876ac
    bl func_02070cdc
    mov r6, r0
    bl func_020876ac
    mov r1, r0
    mov r0, r6
    bl func_02086e04
    ldr r0, .L_0216884c
    ldr r0, [r0, #0x0]
    blx r0
    bl func_02054b44
    bl func_020870e8
    mov r0, #0x8
    bl func_ov007_02168674
    bl func_020872d4
    mov r0, #0x8
    bl func_ov007_02168674
    bl func_02087160
    bl func_020882e0
    mov r6, #0x1
    b .L_02168794
.L_02168780:
    bl func_02088360
    cmp r0, #0x0
    beq .L_02168794
    mov r6, #0x1
    bl func_02088330
.L_02168794:
    cmp r6, #0x0
    beq .L_021687ec
    mov r0, #0x1
    str r0, [r4, #0x2c]
    blx func_0208c1f0
    ldr r0, .L_02168850
    ldrsb r1, [r0, #0x33]
    ldr r2, [r0, #0x0]
    sub r3, r2, r1
    mov r2, #0x1
    b .L_021687d0
.L_021687c0:
    ldrb r1, [r0, #0x32]
    orr r1, r1, r2, lsl r3
    strb r1, [r0, #0x32]
    add r3, r3, #0x1
.L_021687d0:
    ldr r1, [r0, #0x0]
    cmp r3, r1
    blt .L_021687c0
    ldr r0, [r5, #0x4]
    ldr r1, .L_02168854
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021687ec:
    blx func_0208c220
    cmp r0, #0x0
    bne .L_02168804
    blx func_0208c244
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_02168804:
    ldr r0, .L_02168850
    ldrb r0, [r0, #0x29]
    cmp r0, #0x0
    bne .L_02168828
    mov r0, #0x1
    blx func_0208b784
    ldr r0, .L_02168850
    mov r1, #0x0
    strb r1, [r0, #0x28]
.L_02168828:
    mov r1, #0x2
    ldr r0, .L_02168850
    str r1, [r4, #0x24]
    mov r1, #0x0
    strb r1, [r0, #0x29]
    ldr r0, [r5, #0x4]
    ldr r1, .L_02168854
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0216884c: .word data_020a0e18
.L_02168850: .word data_020afe90
.L_02168854: .word func_ov007_02168858
    arm_func_end func_ov007_021686a4

    .global func_ov007_02168858
    arm_func_start func_ov007_02168858
func_ov007_02168858: ; 0x02168858
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    bne .L_02168888
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
.L_0216887c:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0216887c
.L_02168888:
    mov r0, #0x2
    bl func_ov007_02168674
    mov r0, r4
    bl func_ov007_02168350
    ldmia sp!, {r4, pc}
    arm_func_end func_ov007_02168858

    .global func_ov007_0216889c
    arm_func_start func_ov007_0216889c
func_ov007_0216889c: ; 0x0216889c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldr r5, [r4, #0x4]
    ldr r0, [r5, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_02168934
    ldr r0, [r0, #0x64]
    ldr r1, [r1, #0x8]
    ldr r3, [r0, #0x0]
    mvn r2, #0x0
    ldr r3, [r3, #0x6c]
    blx r3
    ldr r5, .L_02168934
    mov r8, #0x0
    mov r7, #0x14
    mvn r6, #0x0
.L_021688f8:
    mov r0, r7
    bl func_ov007_02168674
    ldr r0, [r4, #0x4]
    ldr r1, [r5, #0x0]
    ldr r0, [r0, #0x64]
    mov r2, r6
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
    add r8, r8, #0x1
    cmp r8, #0x3
    blt .L_021688f8
    mov r0, #0x14
    bl func_ov007_02168674
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02168934: .word data_ov007_0216ac70
    arm_func_end func_ov007_0216889c

    .global func_ov007_02168938
    arm_func_start func_ov007_02168938
func_ov007_02168938: ; 0x02168938
    ldr ip, .L_02168940
    bx ip
.L_02168940: .word func_0208c0f0
    arm_func_end func_ov007_02168938

    .global func_ov007_02168944
    arm_func_start func_ov007_02168944
func_ov007_02168944: ; 0x02168944
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x3c
    ldr r4, [r1, #0x10]
    bl func_ov007_02168674
    bl func_020876ac
    bl func_0208712c
    mov r0, #0x1
    str r0, [r4, #0x30]
    ldr r0, [r5, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov007_02168944

    .section .rodata, 4, 1, 4
data_ov007_02168978:
    .word data_ov007_02169454
    .word data_ov007_0216946c
    .word data_ov007_02169494
    .word data_ov007_02169440
    .word data_ov007_0216942c
    .byte 0x41, 0x03, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_021689b4:
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_0214da44
    .word func_ov007_0215a2bc
    .word func_ov007_0215c1a4
    .word func_ov007_0215c1f8
    .word func_ov007_02164344
    .word func_ov007_02161eec
    .word func_ov007_021624e8
    .word func_ov007_021629bc
    .word func_ov007_021629cc
    .word func_ov007_0215d1c0
    .word func_ov007_0216321c
    .word func_ov007_02163514
    .word func_ov007_02163568
    .word func_ov007_0214da60
    .word func_ov007_02154644
    .word func_ov007_0215579c
    .word func_ov007_02155efc
    .word func_ov007_02155f08
    .word func_ov007_0214da7c
    .word func_ov007_0215197c
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02152f5c
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02164ee8
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_02168a1c:
    .byte 0x01, 0x00, 0x01, 0x00
data_ov007_02168a20:
    .byte 0x57, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
data_ov007_02168a2c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x81, 0x00, 0x0f, 0x00, 0x81, 0x00, 0x0d, 0x00, 0x81, 0x00
data_ov007_02168a3c:
    .byte 0x5a, 0x00, 0x00, 0x00, 0x5b, 0x00, 0x00, 0x00, 0x5c, 0x00, 0x00, 0x00, 0x5d, 0x00, 0x00, 0x00
    .byte 0x5e, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
    .byte 0x20, 0x00, 0x00, 0x00
data_ov007_02168a60:
    .byte 0xa0, 0x86, 0x01, 0x00, 0x10, 0x27, 0x00, 0x00, 0xe8, 0x03, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
    .byte 0x0a, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
data_ov007_02168a78:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov007_02168a84:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov007_02168a90:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x63, 0x6f, 0x6d, 0x5f, 0x62, 0x67, 0x2e, 0x6e, 0x63, 0x6c
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_02168aa4:
    .byte 0x02, 0x03, 0x00, 0x00
data_ov007_02168aa8:
    .byte 0x6e, 0x00, 0x00, 0x00, 0x6f, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x71, 0x00, 0x00, 0x00
data_ov007_02168ab8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff
data_ov007_02168ac8:
    .byte 0x3e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
    .byte 0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
data_ov007_02168af8:
    .byte 0x62, 0x63, 0x64, 0x62, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11
    .byte 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x64, 0x62, 0x63, 0x5a, 0x5a, 0x5a, 0x5a, 0x26, 0x27
    .byte 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37
    .byte 0x38, 0x5a, 0x5a, 0x5a, 0x5a, 0x5a, 0x5a, 0x5a, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d
    .byte 0x4e, 0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x5a, 0x5a, 0x5a
data_ov007_02168b46:
    .byte 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62
    .byte 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24
    .byte 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24, 0x24
    .byte 0x24, 0x24, 0x24, 0x24, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64
    .byte 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x62, 0x63
data_ov007_02168b94:
    .byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
    .byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
data_ov007_02168bd4:
    .word func_ov007_02165e5c
    .word func_ov007_02165f3c
    .word func_ov007_02165fa8
    .word func_ov007_02166014
    .word func_ov007_02166080
    .word func_ov007_02166114
    .section .init, 4, 1, 4
    .global __sinit_ov007_02168bec
    thumb_func_start __sinit_ov007_02168bec
__sinit_ov007_02168bec: ; 0x02168bec
    push {lr}
    sub sp, sp, #0x1c
    mov r3, #0x0
    mov r1, r3
    mov r2, r3
    ldr r0, .L_02168c84
    sub r1, #0x30
    sub r2, #0x10
    str r3, [sp, #0x0]
    blx func_ov007_021502ec
    mov r2, #0x19
    mov r1, r2
    str r2, [sp, #0x0]
    ldr r0, .L_02168c88
    sub r1, #0x3b
    sub r2, #0x32
    mov r3, #0x21
    blx func_ov007_021502ec
    mov r2, #0x14
    mov r1, r2
    str r2, [sp, #0x0]
    ldr r0, .L_02168c8c
    sub r1, #0x29
    sub r2, #0x27
    mov r3, #0x15
    blx func_ov007_021502ec
    mov r2, #0xc
    mov r1, r2
    str r2, [sp, #0x0]
    ldr r0, .L_02168c90
    sub r1, #0x50
    sub r2, #0x18
    mov r3, #0x44
    blx func_ov007_021502ec
    mov r0, #0xa
    str r0, [sp, #0x0]
    add r0, sp, #0x14
    mov r1, #0x0
    mov r2, #0x3
    mov r3, #0x9
    blx func_ov007_021502ec
    ldr r0, .L_02168c94
    add r1, sp, #0x14
    blx func_ov007_02150664
    mov r0, #0x11
    str r0, [sp, #0x0]
    add r0, sp, #0xc
    mov r1, #0x0
    mov r2, #0xa
    mov r3, #0x9
    blx func_ov007_021502ec
    ldr r0, .L_02168c98
    add r1, sp, #0xc
    blx func_ov007_02150664
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    blx func_ov007_021502ec
    ldr r0, .L_02168c9c
    add r1, sp, #0x4
    blx func_ov007_02150664
    add sp, #0x1c
    pop {pc}
    mov r8, r8
.L_02168c84: .word data_ov007_02169544
.L_02168c88: .word data_ov007_0216954c
.L_02168c8c: .word data_ov007_02169554
.L_02168c90: .word data_ov007_0216955c
.L_02168c94: .word data_ov007_02169574
.L_02168c98: .word data_ov007_02169590
.L_02168c9c: .word data_ov007_021695ac
    thumb_func_end __sinit_ov007_02168bec

    .global __sinit_ov007_02168ca0
    thumb_func_start __sinit_ov007_02168ca0
__sinit_ov007_02168ca0: ; 0x02168ca0
    push {r3, lr}
    mov r0, #0x20
    str r0, [sp, #0x0]
    ldr r0, .L_02168ce8
    mov r1, #0xdd
    mov r2, #0x0
    mov r3, #0xed
    blx func_ov007_021502ec
    mov r0, #0x98
    str r0, [sp, #0x0]
    ldr r0, .L_02168cec
    mov r1, #0xdd
    mov r2, #0x8
    mov r3, #0xed
    blx func_ov007_021502ec
    mov r3, #0x0
    mov r1, r3
    mov r2, r3
    ldr r0, .L_02168cf0
    sub r1, #0x30
    sub r2, #0x10
    str r3, [sp, #0x0]
    blx func_ov007_021502ec
    mov r0, #0x20
    str r0, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_02168cf4
    mov r2, r1
    mov r3, #0xd8
    blx func_ov007_021502ec
    pop {r3, pc}
    mov r8, r8
.L_02168ce8: .word data_ov007_021698d8
.L_02168cec: .word data_ov007_021698e0
.L_02168cf0: .word data_ov007_021698e8
.L_02168cf4: .word data_ov007_021698f0
    thumb_func_end __sinit_ov007_02168ca0

    .global __sinit_ov007_02168cf8
    thumb_func_start __sinit_ov007_02168cf8
__sinit_ov007_02168cf8: ; 0x02168cf8
    push {r3, lr}
    mov r3, #0x0
    mov r1, r3
    mov r2, r3
    ldr r0, .L_02168d10
    sub r1, #0x30
    sub r2, #0x10
    str r3, [sp, #0x0]
    blx func_ov007_021502ec
    pop {r3, pc}
    mov r8, r8
.L_02168d10: .word data_ov007_02169ac4
    thumb_func_end __sinit_ov007_02168cf8

    .global __sinit_ov007_02168d14
    arm_func_start __sinit_ov007_02168d14
__sinit_ov007_02168d14: ; 0x02168d14
    stmdb sp!, {r3, lr}
    mov ip, #0x28
    ldr r0, .L_02168d38
    sub r1, ip, #0x44
    sub r2, ip, #0x50
    mov r3, #0x1c
    str ip, [sp, #0x0]
    bl func_ov007_021502ec
    ldmia sp!, {r3, pc}
.L_02168d38: .word data_ov007_02169b7c
    arm_func_end __sinit_ov007_02168d14

    .global __sinit_ov007_02168d3c
    thumb_func_start __sinit_ov007_02168d3c
__sinit_ov007_02168d3c: ; 0x02168d3c
    push {r3, lr}
    mov r3, #0x0
    mov r1, r3
    mov r2, r3
    ldr r0, .L_02168d54
    sub r1, #0x30
    sub r2, #0x10
    str r3, [sp, #0x0]
    blx func_ov007_021502ec
    pop {r3, pc}
    mov r8, r8
.L_02168d54: .word data_ov007_02169cc4
    thumb_func_end __sinit_ov007_02168d3c

    .global __sinit_ov007_02168d58
    thumb_func_start __sinit_ov007_02168d58
__sinit_ov007_02168d58: ; 0x02168d58
    push {r3, lr}
    mov r0, #0x10
    str r0, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_02168d6c
    mov r2, r1
    mov r3, #0x90
    blx func_ov007_021502ec
    pop {r3, pc}
.L_02168d6c: .word data_ov007_02169e00
    thumb_func_end __sinit_ov007_02168d58

    .global __sinit_ov007_02168d70
    thumb_func_start __sinit_ov007_02168d70
__sinit_ov007_02168d70: ; 0x02168d70
    push {r3, lr}
    mov r2, #0xb
    mov r1, r2
    str r2, [sp, #0x0]
    ldr r0, .L_02168d88
    sub r1, #0x80
    sub r2, #0x16
    mov r3, #0x0
    blx func_ov007_021502ec
    pop {r3, pc}
    mov r8, r8
.L_02168d88: .word data_ov007_02169f74
    thumb_func_end __sinit_ov007_02168d70

    .global __sinit_ov007_02168d8c
    thumb_func_start __sinit_ov007_02168d8c
__sinit_ov007_02168d8c: ; 0x02168d8c
    push {r3, lr}
    mov r0, #0x10
    str r0, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_02168dc0
    mov r2, r1
    mov r3, #0x80
    blx func_ov007_021502ec
    mov r0, #0x10
    str r0, [sp, #0x0]
    ldr r0, .L_02168dc4
    mov r1, #0x80
    mov r2, #0x0
    mov r3, #0xa8
    blx func_ov007_021502ec
    mov r0, #0x10
    str r0, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_02168dc8
    mov r2, r1
    mov r3, #0xa8
    blx func_ov007_021502ec
    pop {r3, pc}
.L_02168dc0: .word data_ov007_0216a200
.L_02168dc4: .word data_ov007_0216a210
.L_02168dc8: .word data_ov007_0216a208
    thumb_func_end __sinit_ov007_02168d8c

    .global __sinit_ov007_02168dcc
    thumb_func_start __sinit_ov007_02168dcc
__sinit_ov007_02168dcc: ; 0x02168dcc
    push {r3, lr}
    mov r3, #0x30
    mov r1, r3
    sub r1, #0x60
    ldr r0, .L_02168df4
    mov r2, r1
    str r3, [sp, #0x0]
    blx func_ov007_021502ec
    mov r2, #0x4
    mvn r2, r2
    mov r1, r2
    str r2, [sp, #0x0]
    ldr r0, .L_02168df8
    sub r1, #0x23
    sub r2, #0x1b
    mov r3, #0x2c
    blx func_ov007_021502ec
    pop {r3, pc}
.L_02168df4: .word data_ov007_0216a39c
.L_02168df8: .word data_ov007_0216a38c
    thumb_func_end __sinit_ov007_02168dcc

    .global __sinit_ov007_02168dfc
    arm_func_start __sinit_ov007_02168dfc
__sinit_ov007_02168dfc: ; 0x02168dfc
    stmdb sp!, {r3, lr}
    mov r3, #0x8
    sub r1, r3, #0x10
    ldr r0, .L_02168e1c
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_ov007_021502ec
    ldmia sp!, {r3, pc}
.L_02168e1c: .word data_ov007_0216a4e8
    arm_func_end __sinit_ov007_02168dfc

    .global __sinit_ov007_02168e20
    thumb_func_start __sinit_ov007_02168e20
__sinit_ov007_02168e20: ; 0x02168e20
    push {r3, lr}
    sub sp, sp, #0x120
    add r0, sp, #0x114
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x118
    mov r1, #0x30
    blx func_ov007_02163e78
    add r0, sp, #0x11c
    mov r1, #0x28
    blx func_ov007_02163e78
    ldr r0, .L_0216918c
    add r1, sp, #0x11c
    add r2, sp, #0x118
    add r3, sp, #0x114
    blx func_ov007_02163ee0
    add r0, sp, #0x108
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x10c
    mov r1, #0x50
    blx func_ov007_02163e78
    add r0, sp, #0x110
    mov r1, #0x65
    blx func_ov007_02163e78
    ldr r0, .L_02169190
    add r1, sp, #0x110
    add r2, sp, #0x10c
    add r3, sp, #0x108
    blx func_ov007_02163ee0
    add r0, sp, #0xfc
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x100
    mov r1, #0x50
    blx func_ov007_02163e78
    add r0, sp, #0x104
    mov r1, #0xc8
    blx func_ov007_02163e78
    ldr r0, .L_02169194
    add r1, sp, #0x104
    add r2, sp, #0x100
    add r3, sp, #0xfc
    blx func_ov007_02163ee0
    add r0, sp, #0xf0
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xf4
    mov r1, #0x63
    blx func_ov007_02163e78
    add r0, sp, #0xf8
    mov r1, #0x65
    blx func_ov007_02163e78
    ldr r0, .L_02169198
    add r1, sp, #0xf8
    add r2, sp, #0xf4
    add r3, sp, #0xf0
    blx func_ov007_02163ee0
    add r0, sp, #0xe4
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xe8
    mov r1, #0x63
    blx func_ov007_02163e78
    add r0, sp, #0xec
    mov r1, #0xc8
    blx func_ov007_02163e78
    ldr r0, .L_0216919c
    add r1, sp, #0xec
    add r2, sp, #0xe8
    add r3, sp, #0xe4
    blx func_ov007_02163ee0
    add r0, sp, #0xd8
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xdc
    mov r1, #0x8c
    blx func_ov007_02163e78
    add r0, sp, #0xe0
    mov r1, #0x60
    blx func_ov007_02163e78
    ldr r0, .L_021691a0
    add r1, sp, #0xe0
    add r2, sp, #0xdc
    add r3, sp, #0xd8
    blx func_ov007_02163ee0
    add r0, sp, #0xcc
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xd0
    mov r1, #0x8c
    blx func_ov007_02163e78
    add r0, sp, #0xd4
    mov r1, #0x82
    blx func_ov007_02163e78
    ldr r0, .L_021691a4
    add r1, sp, #0xd4
    add r2, sp, #0xd0
    add r3, sp, #0xcc
    blx func_ov007_02163ee0
    add r0, sp, #0xc0
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xc4
    mov r1, #0x8c
    blx func_ov007_02163e78
    add r0, sp, #0xc8
    mov r1, #0xa4
    blx func_ov007_02163e78
    ldr r0, .L_021691a8
    add r1, sp, #0xc8
    add r2, sp, #0xc4
    add r3, sp, #0xc0
    blx func_ov007_02163ee0
    add r0, sp, #0xb4
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xb8
    mov r1, #0x8c
    blx func_ov007_02163e78
    add r0, sp, #0xbc
    mov r1, #0xc6
    blx func_ov007_02163e78
    ldr r0, .L_021691ac
    add r1, sp, #0xbc
    add r2, sp, #0xb8
    add r3, sp, #0xb4
    blx func_ov007_02163ee0
    add r0, sp, #0xa8
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xac
    mov r1, #0x95
    blx func_ov007_02163e78
    add r0, sp, #0xb0
    mov r1, #0x60
    blx func_ov007_02163e78
    ldr r0, .L_021691b0
    add r1, sp, #0xb0
    add r2, sp, #0xac
    add r3, sp, #0xa8
    blx func_ov007_02163ee0
    add r0, sp, #0x9c
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0xa0
    mov r1, #0x95
    blx func_ov007_02163e78
    add r0, sp, #0xa4
    mov r1, #0x82
    blx func_ov007_02163e78
    ldr r0, .L_021691b4
    add r1, sp, #0xa4
    add r2, sp, #0xa0
    add r3, sp, #0x9c
    blx func_ov007_02163ee0
    add r0, sp, #0x90
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x94
    mov r1, #0x95
    blx func_ov007_02163e78
    add r0, sp, #0x98
    mov r1, #0xa4
    blx func_ov007_02163e78
    ldr r0, .L_021691b8
    add r1, sp, #0x98
    add r2, sp, #0x94
    add r3, sp, #0x90
    blx func_ov007_02163ee0
    add r0, sp, #0x84
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x88
    mov r1, #0x95
    blx func_ov007_02163e78
    add r0, sp, #0x8c
    mov r1, #0xc6
    blx func_ov007_02163e78
    ldr r0, .L_021691bc
    add r1, sp, #0x8c
    add r2, sp, #0x88
    add r3, sp, #0x84
    blx func_ov007_02163ee0
    add r0, sp, #0x78
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x7c
    mov r1, #0x95
    blx func_ov007_02163e78
    add r0, sp, #0x80
    mov r1, #0x2f
    blx func_ov007_02163e78
    ldr r0, .L_021691c0
    add r1, sp, #0x80
    add r2, sp, #0x7c
    add r3, sp, #0x78
    blx func_ov007_02163ee0
    add r0, sp, #0x6c
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x70
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x74
    mov r1, #0x0
    blx func_ov007_02163e78
    ldr r0, .L_021691c4
    add r1, sp, #0x74
    add r2, sp, #0x70
    add r3, sp, #0x6c
    blx func_ov007_02163ee0
    add r0, sp, #0x60
    mov r1, #0x0
    blx func_ov007_02163e78
    mov r1, #0xf
    add r0, sp, #0x64
    mvn r1, r1
    blx func_ov007_02163e78
    mov r1, #0xd
    add r0, sp, #0x68
    mvn r1, r1
    blx func_ov007_02163e78
    ldr r0, .L_021691c8
    add r1, sp, #0x68
    add r2, sp, #0x64
    add r3, sp, #0x60
    blx func_ov007_02163ee0
    add r0, sp, #0x54
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x58
    mov r1, #0x29
    blx func_ov007_02163e78
    add r0, sp, #0x5c
    mov r1, #0x40
    blx func_ov007_02163e78
    ldr r0, .L_021691cc
    add r1, sp, #0x5c
    add r2, sp, #0x58
    add r3, sp, #0x54
    blx func_ov007_02163ee0
    add r0, sp, #0x48
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x4c
    mov r1, #0x38
    blx func_ov007_02163e78
    add r0, sp, #0x50
    mov r1, #0x20
    blx func_ov007_02163e78
    ldr r0, .L_021691d0
    add r1, sp, #0x50
    add r2, sp, #0x4c
    add r3, sp, #0x48
    blx func_ov007_02163ee0
    add r0, sp, #0x3c
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x40
    mov r1, #0x58
    blx func_ov007_02163e78
    add r0, sp, #0x44
    mov r1, #0x65
    blx func_ov007_02163e78
    ldr r0, .L_021691d4
    add r1, sp, #0x44
    add r2, sp, #0x40
    add r3, sp, #0x3c
    blx func_ov007_02163ee0
    add r0, sp, #0x30
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x34
    mov r1, #0x58
    blx func_ov007_02163e78
    add r0, sp, #0x38
    mov r1, #0xc8
    blx func_ov007_02163e78
    ldr r0, .L_021691d8
    add r1, sp, #0x38
    add r2, sp, #0x34
    add r3, sp, #0x30
    blx func_ov007_02163ee0
    add r0, sp, #0x24
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x28
    mov r1, #0x6b
    blx func_ov007_02163e78
    add r0, sp, #0x2c
    mov r1, #0x65
    blx func_ov007_02163e78
    ldr r0, .L_021691dc
    add r1, sp, #0x2c
    add r2, sp, #0x28
    add r3, sp, #0x24
    blx func_ov007_02163ee0
    add r0, sp, #0x18
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x1c
    mov r1, #0x6b
    blx func_ov007_02163e78
    add r0, sp, #0x20
    mov r1, #0xc8
    blx func_ov007_02163e78
    ldr r0, .L_021691e0
    add r1, sp, #0x20
    add r2, sp, #0x1c
    add r3, sp, #0x18
    blx func_ov007_02163ee0
    add r0, sp, #0xc
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x10
    mov r1, #0x89
    blx func_ov007_02163e78
    add r0, sp, #0x14
    mov r1, #0xbe
    blx func_ov007_02163e78
    ldr r0, .L_021691e4
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    blx func_ov007_02163ee0
    add r0, sp, #0x0
    mov r1, #0x0
    blx func_ov007_02163e78
    add r0, sp, #0x4
    mov r1, #0x31
    blx func_ov007_02163e78
    add r0, sp, #0x8
    mov r1, #0x29
    blx func_ov007_02163e78
    ldr r0, .L_021691e8
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    blx func_ov007_02163ee0
    add sp, #0x120
    pop {r3, pc}
.L_0216918c: .word data_ov007_0216a848
.L_02169190: .word data_ov007_0216a854
.L_02169194: .word data_ov007_0216a860
.L_02169198: .word data_ov007_0216a86c
.L_0216919c: .word data_ov007_0216a878
.L_021691a0: .word data_ov007_0216a884
.L_021691a4: .word data_ov007_0216a890
.L_021691a8: .word data_ov007_0216a89c
.L_021691ac: .word data_ov007_0216a8a8
.L_021691b0: .word data_ov007_0216a8b4
.L_021691b4: .word data_ov007_0216a8c0
.L_021691b8: .word data_ov007_0216a8cc
.L_021691bc: .word data_ov007_0216a8d8
.L_021691c0: .word data_ov007_0216a8e4
.L_021691c4: .word data_ov007_0216a8f0
.L_021691c8: .word data_ov007_0216a8fc
.L_021691cc: .word data_ov007_0216a908
.L_021691d0: .word data_ov007_0216a7f4
.L_021691d4: .word data_ov007_0216a800
.L_021691d8: .word data_ov007_0216a80c
.L_021691dc: .word data_ov007_0216a818
.L_021691e0: .word data_ov007_0216a824
.L_021691e4: .word data_ov007_0216a830
.L_021691e8: .word data_ov007_0216a83c
    thumb_func_end __sinit_ov007_02168e20

    .section .ctor, 4, 1, 4
.p__sinit_ov007_02168bec:
    .word __sinit_ov007_02168bec
.p__sinit_ov007_02168ca0:
    .word __sinit_ov007_02168ca0
.p__sinit_ov007_02168cf8:
    .word __sinit_ov007_02168cf8
.p__sinit_ov007_02168d14:
    .word __sinit_ov007_02168d14
.p__sinit_ov007_02168d3c:
    .word __sinit_ov007_02168d3c
.p__sinit_ov007_02168d58:
    .word __sinit_ov007_02168d58
.p__sinit_ov007_02168d70:
    .word __sinit_ov007_02168d70
.p__sinit_ov007_02168d8c:
    .word __sinit_ov007_02168d8c
.p__sinit_ov007_02168dcc:
    .word __sinit_ov007_02168dcc
.p__sinit_ov007_02168dfc:
    .word __sinit_ov007_02168dfc
.p__sinit_ov007_02168e20:
    .word __sinit_ov007_02168e20
.p__sinit_ov007_021608f4:
    .word func_ov007_021608f4
.p__sinit_ov007_02161900:
    .word func_ov007_02161900
.p__sinit_ov007_02161d98:
    .word func_ov007_02161d98
    .section .data, 4, 1, 4
data_ov007_02169240:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x45
    .byte 0x4e, 0x44, 0x00, 0x00
data_ov007_02169254:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x4e
    .byte 0x4f, 0x4e, 0x45, 0x00
data_ov007_02169268:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x45
    .byte 0x52, 0x52, 0x4f, 0x52, 0x00, 0x00, 0x00, 0x00
data_ov007_02169280:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x4b
    .byte 0x49, 0x43, 0x4b, 0x45, 0x44, 0x00, 0x00, 0x00
data_ov007_02169298:
    .word data_ov007_0216acea
    .word data_ov007_0216acec
    .word data_ov007_0216acee
    .word data_ov007_0216acf0
    .word data_ov007_0216acf2
    .word data_ov007_0216acf4
    .word data_ov007_02169254
    .word data_ov007_021693ec
    .word data_ov007_02169308
    .word data_ov007_02169340
    .word data_ov007_02169280
    .word data_ov007_0216935c
    .word data_ov007_02169394
    .word data_ov007_021693cc
    .word data_ov007_021693b0
    .word data_ov007_0216940c
    .word data_ov007_021692ec
    .word data_ov007_02169324
    .word data_ov007_02169240
    .word data_ov007_02169268
    .word data_ov007_02169378
data_ov007_021692ec:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x52
    .byte 0x45, 0x51, 0x55, 0x45, 0x53, 0x54, 0x45, 0x44, 0x00, 0x00, 0x00, 0x00
data_ov007_02169308:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x43
    .byte 0x4f, 0x4e, 0x4e, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00, 0x00, 0x00, 0x00
data_ov007_02169324:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x4d
    .byte 0x45, 0x4d, 0x42, 0x45, 0x52, 0x5f, 0x46, 0x55, 0x4c, 0x4c, 0x00, 0x00
data_ov007_02169340:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x44
    .byte 0x49, 0x53, 0x43, 0x4f, 0x4e, 0x4e, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00
data_ov007_0216935c:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x52
    .byte 0x45, 0x51, 0x5f, 0x41, 0x43, 0x43, 0x45, 0x50, 0x54, 0x45, 0x44, 0x00
data_ov007_02169378:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x57
    .byte 0x41, 0x49, 0x54, 0x5f, 0x54, 0x4f, 0x5f, 0x53, 0x45, 0x4e, 0x44, 0x00
data_ov007_02169394:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x53
    .byte 0x45, 0x4e, 0x44, 0x5f, 0x50, 0x52, 0x4f, 0x43, 0x45, 0x45, 0x44, 0x00
data_ov007_021693b0:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x42
    .byte 0x4f, 0x4f, 0x54, 0x5f, 0x52, 0x45, 0x51, 0x55, 0x45, 0x53, 0x54, 0x00
data_ov007_021693cc:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x53
    .byte 0x45, 0x4e, 0x44, 0x5f, 0x43, 0x4f, 0x4d, 0x50, 0x4c, 0x45, 0x54, 0x45, 0x00, 0x00, 0x00, 0x00
data_ov007_021693ec:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x49
    .byte 0x4e, 0x49, 0x54, 0x5f, 0x43, 0x4f, 0x4d, 0x50, 0x4c, 0x45, 0x54, 0x45, 0x00, 0x00, 0x00, 0x00
data_ov007_0216940c:
    .byte 0x4d, 0x42, 0x5f, 0x43, 0x4f, 0x4d, 0x4d, 0x5f, 0x50, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5f, 0x42
    .byte 0x4f, 0x4f, 0x54, 0x5f, 0x53, 0x54, 0x41, 0x52, 0x54, 0x41, 0x42, 0x4c, 0x45, 0x00, 0x00, 0x00
data_ov007_0216942c:
    .byte 0x2f, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x6f, 0x6d, 0x2f, 0x69, 0x63, 0x6f, 0x6e, 0x2e, 0x70
    .byte 0x6c, 0x74, 0x00, 0x00
data_ov007_02169440:
    .byte 0x2f, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x6f, 0x6d, 0x2f, 0x69, 0x63, 0x6f, 0x6e, 0x2e, 0x63
    .byte 0x68, 0x61, 0x72, 0x00
data_ov007_02169454:
    .byte 0x2f, 0x43, 0x68, 0x69, 0x6c, 0x64, 0x52, 0x6f, 0x6d, 0x2f, 0x4a, 0x53, 0x53, 0x32, 0x43, 0x68
    .byte 0x69, 0x6c, 0x64, 0x2e, 0x73, 0x72, 0x6c, 0x00
data_ov007_0216946c:
    .byte 0x4a, 0x00, 0x55, 0x00, 0x4d, 0x00, 0x50, 0x00, 0x20, 0x00, 0x55, 0x00, 0x4c, 0x00, 0x54, 0x00
    .byte 0x49, 0x00, 0x4d, 0x00, 0x41, 0x00, 0x54, 0x00, 0x45, 0x00, 0x20, 0x00, 0x53, 0x00, 0x54, 0x00
    .byte 0x41, 0x00, 0x52, 0x00, 0x53, 0x00, 0x00, 0x00
data_ov007_02169494:
    .byte 0x42, 0x30, 0x44, 0x30, 0x66, 0x30, 0x92, 0x30, 0x4b, 0x00, 0x4f, 0x00, 0x57, 0x30, 0x66, 0x30
    .byte 0xdd, 0x30, 0xa4, 0x30, 0xf3, 0x30, 0xc8, 0x30, 0x92, 0x30, 0x68, 0x30, 0x8c, 0x30, 0x01, 0xff
    .byte 0x0d, 0x00, 0x0a, 0x00, 0xde, 0x30, 0xf3, 0x30, 0xac, 0x30, 0xc7, 0x30, 0xc3, 0x30, 0xad, 0x30
    .byte 0x6e, 0x30, 0x64, 0x30, 0x4b, 0x30, 0x44, 0x30, 0x4b, 0x30, 0x5f, 0x30, 0x4c, 0x30, 0xab, 0x30
    .byte 0xae, 0x30, 0x60, 0x30, 0x01, 0xff, 0x00, 0x00
data_ov007_021694dc:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x4d, 0x42, 0x4c, 0x69, 0x62, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_021694ec:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x5f, 0x41, 0x64, 0x64, 0x5f, 0x43, 0x6f
    .byte 0x72, 0x65, 0x00, 0x00
data_ov007_02169500:
    .byte 0x43, 0x6f, 0x6d, 0x6d
data_ov007_02169504:
    .byte 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_02169510:
    .word data_ov007_021696c0
    .word data_ov007_021696d4
data_ov007_02169518:
    .word data_ov007_021696ac
    .word data_ov007_021696e8
    .word data_ov007_02169700
    .word func_ov007_0214fdcc
    .word func_ov007_0214feb8
    .word func_ov007_0214fe30
    .word func_ov007_0214fe70
    .word func_ov007_0214ff30
    .word func_ov007_0214ffe8
    .word func_ov007_0214ff88
    .word func_ov007_021501f8
data_ov007_02169544:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216954c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169554:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216955c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169564:
    .byte 0x25, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
data_ov007_0216956c:
    .byte 0x52, 0x00, 0x00, 0x00
data_ov007_02169570:
    .byte 0x39, 0x00, 0x00, 0x00
data_ov007_02169574:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x06, 0x05, 0x00, 0x25, 0x00, 0x00, 0x00
    .byte 0x6a, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00, 0x6f, 0x00, 0x00, 0x00
data_ov007_02169590:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04, 0x06, 0x00, 0x24, 0x00, 0x00, 0x00
    .byte 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00
data_ov007_021695ac:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x05, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_021695c0:
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_0216962c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169634:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216963c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169644:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov007_02169654:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov007_02169664:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov007_02169674:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6c, 0x6c, 0x69, 0x73, 0x69, 0x6f, 0x6e, 0x2e, 0x69, 0x6e, 0x6c, 0x00
data_ov007_02169684:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x54, 0x6f, 0x70, 0x5f, 0x41, 0x64, 0x64
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_02169698:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov007_021696ac:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_021696c0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2e
    .byte 0x61, 0x74, 0x6d, 0x00
data_ov007_021696d4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2e
    .byte 0x64, 0x69, 0x67, 0x00
data_ov007_021696e8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x33, 0x64
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov007_02169700:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x6c, 0x65, 0x66, 0x74, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov007_0216971c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x54, 0x6f, 0x70, 0x2e, 0x63, 0x70, 0x70
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_02169730:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_0216973c:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169744:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216974c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169754:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov007_02169768:
    .byte 0x43, 0x4d, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x6d, 0x6e, 0x5f, 0x42, 0x61, 0x73, 0x65, 0x42, 0x47
    .byte 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov007_02169780:
    .byte 0x43, 0x4d, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x6d, 0x6e, 0x5f, 0x50, 0x61, 0x63, 0x6b, 0x41, 0x72
    .byte 0x63, 0x5f, 0x49, 0x6e, 0x69, 0x74, 0x4c, 0x6f, 0x61, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_02169810:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169820:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169830:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169840:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169850:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169860:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169870:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169880:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169890:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov007_021698a4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x63, 0x6f, 0x6d, 0x6d, 0x75, 0x5f, 0x70, 0x61, 0x63, 0x6b
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov007_021698bc:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x64, 0x73, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
data_ov007_021698cc:
    .word data_ov007_02169a48
data_ov007_021698d0:
    .word data_ov007_02169a04
    .word data_ov007_02169a60
data_ov007_021698d8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_021698e0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_021698e8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_021698f0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_021698f8:
    .word data_ov007_02169a30
    .word data_ov007_0216999c
data_ov007_02169900:
    .word data_ov007_02169a48
    .word data_ov007_021699a8
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_0216997c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169984:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216998c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169994:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216999c:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov007_021699a8:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov007_021699b4:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov007_021699c4:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov007_021699d4:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov007_021699e4:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov007_021699f4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov007_02169a04:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_02169a18:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x46, 0x72, 0x6e, 0x64, 0x4c, 0x69, 0x73
    .byte 0x74, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov007_02169a30:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x5f, 0x6c, 0x69, 0x73
    .byte 0x74, 0x30, 0x33, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov007_02169a48:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x5f, 0x6c, 0x69, 0x73
    .byte 0x74, 0x30, 0x32, 0x2e, 0x64, 0x74, 0x78, 0x00
data_ov007_02169a60:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov007_02169a78:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x46, 0x72, 0x6e, 0x64, 0x4c, 0x69, 0x73
    .byte 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_02169a90:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_02169a9c:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169aa4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169aac:
    .word data_ov007_02169b04
    .word data_ov007_02169b30
data_ov007_02169ab4:
    .word data_ov007_02169af4
    .word data_ov007_02169acc
data_ov007_02169abc:
    .word data_ov007_02169ae4
    .word data_ov007_02169ad8
data_ov007_02169ac4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169acc:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov007_02169ad8:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov007_02169ae4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x63, 0x6f, 0x64, 0x65, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov007_02169af4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x63, 0x6f, 0x64, 0x65, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov007_02169b04:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_02169b18:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x46, 0x72, 0x6e, 0x64, 0x43, 0x6f, 0x64
    .byte 0x65, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov007_02169b30:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x63, 0x6f, 0x64, 0x65, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x33
    .byte 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov007_02169b48:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x46, 0x72, 0x6e, 0x64, 0x43, 0x6f, 0x64
    .byte 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_02169b60:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_02169b6c:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169b74:
    .word data_ov007_02169c44
    .word data_ov007_02169c5c
data_ov007_02169b7c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169b84:
    .word data_ov007_02169c18
    .word data_ov007_02169c74
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_02169c00:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169c08:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169c10:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169c18:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_02169c2c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x46, 0x72, 0x6e, 0x64, 0x54, 0x6f, 0x70
    .byte 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov007_02169c44:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x5f, 0x63, 0x6f, 0x30
    .byte 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov007_02169c5c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x5f, 0x63, 0x6f, 0x30
    .byte 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov007_02169c74:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x5f, 0x63, 0x6f, 0x5f
    .byte 0x6f, 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov007_02169c90:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x46, 0x72, 0x6e, 0x64, 0x54, 0x6f, 0x70
    .byte 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169ca8:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_02169cb4:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169cbc:
    .word data_ov007_02169d04
    .word data_ov007_02169cf0
data_ov007_02169cc4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169ccc:
    .word data_ov007_02169cdc
    .word data_ov007_02169d18
data_ov007_02169cd4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169cdc:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_02169cf0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x61, 0x74, 0x63, 0x68, 0x6d, 0x61, 0x6b, 0x65, 0x2e
    .byte 0x61, 0x74, 0x6d, 0x00
data_ov007_02169d04:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x61, 0x74, 0x63, 0x68, 0x6d, 0x61, 0x6b, 0x65, 0x2e
    .byte 0x64, 0x69, 0x67, 0x00
data_ov007_02169d18:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x65, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov007_02169d30:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x41, 0x62, 0x4d
    .byte 0x61, 0x74, 0x63, 0x68, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov007_02169d4c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x41, 0x62, 0x4d
    .byte 0x61, 0x74, 0x63, 0x68, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169d68:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_02169d74:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169d7c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x46, 0x72, 0x4d
    .byte 0x61, 0x74, 0x63, 0x68, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov007_02169d98:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x46, 0x72, 0x4d
    .byte 0x61, 0x74, 0x63, 0x68, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169db4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x4d, 0x65, 0x6d
    .byte 0x62, 0x65, 0x72, 0x45, 0x6e, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_02169dd0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x4d, 0x65, 0x6d
    .byte 0x62, 0x65, 0x72, 0x45, 0x6e, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_02169dec:
    .word data_ov007_02169ec4
    .word data_ov007_02169ec4
    .word data_ov007_02169eb0
data_ov007_02169df8:
    .word data_ov007_02169e9c
    .word data_ov007_02169ed8
data_ov007_02169e00:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_02169e7c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169e84:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169e8c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169e94:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_02169e9c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_02169eb0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6c, 0x65, 0x61, 0x64, 0x65, 0x72, 0x30, 0x31, 0x2e, 0x61
    .byte 0x74, 0x6d, 0x00, 0x00
data_ov007_02169ec4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6c, 0x65, 0x61, 0x64, 0x65, 0x72, 0x30, 0x30, 0x2e, 0x64
    .byte 0x74, 0x78, 0x00, 0x00
data_ov007_02169ed8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6c, 0x65, 0x61, 0x64, 0x65, 0x72, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov007_02169ef0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x6d, 0x6e, 0x4c, 0x65, 0x61, 0x64
    .byte 0x65, 0x72, 0x53, 0x65, 0x6c, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov007_02169f0c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x4c, 0x65, 0x61, 0x64, 0x65, 0x72, 0x53
    .byte 0x65, 0x6c, 0x5f, 0x49, 0x6e, 0x69, 0x74, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x5f, 0x66, 0x6f
    .byte 0x72, 0x49, 0x74, 0x65, 0x6d, 0x00, 0x00, 0x00
data_ov007_02169f34:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x6d, 0x6e, 0x4c, 0x65, 0x61, 0x64
    .byte 0x65, 0x72, 0x53, 0x65, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_02169f50:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_02169f5c:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_02169f64:
    .word data_ov007_0216a074
    .word data_ov007_0216a01c
data_ov007_02169f6c:
    .word data_ov007_0216a008
data_ov007_02169f70:
    .word data_ov007_0216a044
data_ov007_02169f74:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_02169f7c:
    .word data_ov007_0216a030
    .word data_ov007_0216a05c
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_02169ff8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a000:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a008:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x65, 0x6d, 0x62, 0x65, 0x72, 0x2e, 0x61, 0x74, 0x6d
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a01c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x65, 0x6d, 0x62, 0x65, 0x72, 0x2e, 0x64, 0x69, 0x67
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a030:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_0216a044:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x65, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x64, 0x61, 0x74
    .byte 0x61, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov007_0216a05c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x65, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov007_0216a074:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6d, 0x65, 0x6d, 0x62, 0x65, 0x72, 0x5f, 0x77, 0x69, 0x72
    .byte 0x65, 0x6c, 0x65, 0x73, 0x73, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov007_0216a090:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x6d, 0x6e, 0x4d, 0x65, 0x6d, 0x62
    .byte 0x65, 0x72, 0x45, 0x6e, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov007_0216a0ac:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x6d, 0x6e, 0x4d, 0x65, 0x6d, 0x62
    .byte 0x65, 0x72, 0x45, 0x6e, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_0216a0c8:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a0d4:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a0dc:
    .byte 0x50, 0x6f, 0x73, 0x74, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x00
data_ov007_0216a0e8:
    .byte 0x41, 0x4c, 0x4f, 0x62, 0x6a, 0x65, 0x63, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov007_0216a0f8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x72, 0x6c, 0x73, 0x45, 0x6e, 0x74
    .byte 0x72, 0x79, 0x4f, 0x62, 0x6a, 0x5f, 0x49, 0x6e, 0x69, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a13c:
    .word func_ov007_0215998c
    .word func_ov007_02159984
    .word func_ov007_02159920
    .word func_ov007_02159918
    .word func_0201b448
    .word func_ov007_02159910
    .word func_ov007_02159994
    .word func_ov007_02159928
data_ov007_0216a15c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x72, 0x6c, 0x73, 0x45, 0x6e, 0x74
    .byte 0x72, 0x79, 0x4f, 0x62, 0x6a, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_0216a178:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x4c, 0x4c, 0x65, 0x61, 0x64, 0x65
    .byte 0x72, 0x53, 0x74, 0x61, 0x74, 0x65, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00
data_ov007_0216a198:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x4c, 0x4c, 0x65, 0x61, 0x64, 0x65
    .byte 0x72, 0x53, 0x74, 0x61, 0x74, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216a1b4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x4c, 0x43, 0x6d, 0x6e, 0x4d, 0x65
    .byte 0x6d, 0x45, 0x6e, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a1d0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x4c, 0x43, 0x6d, 0x6e, 0x4d, 0x65
    .byte 0x6d, 0x45, 0x6e, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a1ec:
    .word data_ov007_0216a310
    .word data_ov007_0216a310
    .word data_ov007_0216a2f4
data_ov007_0216a1f8:
    .word data_ov007_0216a2ac
    .word data_ov007_0216a2c0
data_ov007_0216a200:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a208:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a210:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_0216a28c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a294:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a29c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a2a4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a2ac:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_0216a2c0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6c, 0x65, 0x61, 0x64, 0x65, 0x72, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov007_0216a2d8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x72, 0x6c, 0x73, 0x4c, 0x65, 0x61
    .byte 0x64, 0x65, 0x72, 0x53, 0x65, 0x6c, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_0216a2f4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6c, 0x65, 0x61, 0x64, 0x65, 0x72, 0x5f, 0x77, 0x69, 0x72
    .byte 0x65, 0x6c, 0x65, 0x73, 0x73, 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov007_0216a310:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x6c, 0x65, 0x61, 0x64, 0x65, 0x72, 0x5f, 0x77, 0x69, 0x72
    .byte 0x65, 0x6c, 0x65, 0x73, 0x73, 0x30, 0x30, 0x2e, 0x64, 0x74, 0x78, 0x00
data_ov007_0216a32c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x4c, 0x4c, 0x65, 0x61, 0x64, 0x65
    .byte 0x72, 0x53, 0x65, 0x6c, 0x5f, 0x49, 0x6e, 0x69, 0x74, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x5f
    .byte 0x66, 0x6f, 0x72, 0x49, 0x74, 0x65, 0x6d, 0x00
data_ov007_0216a354:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x72, 0x6c, 0x73, 0x4c, 0x65, 0x61
    .byte 0x64, 0x65, 0x72, 0x53, 0x65, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216a370:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a37c:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a384:
    .word data_ov007_0216a43c
    .word data_ov007_0216a454
data_ov007_0216a38c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a394:
    .word data_ov007_0216a428
    .word data_ov007_0216a488
data_ov007_0216a39c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_0216a418:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a420:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a428:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_0216a43c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x62, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x5f, 0x73, 0x65, 0x6c
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a454:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x62, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x5f, 0x73, 0x65, 0x6c
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a46c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x4d, 0x61, 0x74
    .byte 0x63, 0x68, 0x53, 0x65, 0x6c, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov007_0216a488:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x62, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x5f, 0x73, 0x65, 0x6c
    .byte 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov007_0216a4a4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x4d, 0x61, 0x74
    .byte 0x63, 0x68, 0x53, 0x65, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_0216a4c0:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a4cc:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a4d4:
    .word data_ov007_0216a5a4
data_ov007_0216a4d8:
    .word data_ov007_0216a590
    .word data_ov007_0216a570
data_ov007_0216a4e0:
    .word data_ov007_0216a57c
    .word data_ov007_0216a564
data_ov007_0216a4e8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02150644
    .word func_ov007_02150650
    .word func_ov007_021505cc
    .word func_0201c8a0
    .word func_ov007_0214ed44
    .word func_ov012_021b0f50
    .word func_ov007_0215062c
    .word func_0202f668
    .word func_ov007_021505f8
    .word func_ov007_0214db74
    .word func_ov007_021505f0
    .word func_ov007_021505e8
    .word func_ov007_02150618
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov007_02150610
    .word func_ov007_02150600
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021505e0
    .word func_ov007_02150620
    .word func_ov007_02150634
data_ov007_0216a564:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov007_0216a570:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov007_0216a57c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x73, 0x75, 0x72, 0x65, 0x30, 0x32, 0x2e, 0x61, 0x74, 0x6d
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a590:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x73, 0x75, 0x72, 0x65, 0x30, 0x32, 0x2e, 0x64, 0x69, 0x67
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a5a4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x73, 0x75, 0x72, 0x65, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x32
    .byte 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov007_0216a5bc:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x53, 0x75, 0x72, 0x65, 0x74, 0x69, 0x67
    .byte 0x61, 0x69, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_0216a5d4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x53, 0x75, 0x72, 0x65, 0x74, 0x69, 0x67
    .byte 0x61, 0x69, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216a5ec:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a5f8:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a600:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x62, 0x61, 0x73, 0x65, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a61c:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x62, 0x61, 0x73, 0x65, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a638:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a64c:
    .byte 0x43, 0x4f, 0x4d, 0x4d, 0x4f, 0x4e, 0x00, 0x00
data_ov007_0216a654:
    .word data_ov007_0216a64c
    .word func_ov007_02160f84
    .word func_ov007_02160f7c
    .word func_ov007_02160f4c
    .word func_ov007_02160cf0
    .word func_ov007_02160908
    .word func_ov007_02160ef0
    .word func_ov007_02160e6c
    .word func_ov007_02160e58
    .word data_ov007_0216ada0
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a680:
    .byte 0x57, 0x50, 0x42, 0x00
data_ov007_0216a684:
    .word data_ov007_0216a680
    .word func_ov007_02161840
    .word func_ov007_02161804
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_021614d4
    .word func_ov007_021610f0
    .word func_ov007_02161098
    .word func_ov007_02160fbc
    .word func_ov007_02160fa8
    .word data_ov007_0216bfe4
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a6b0:
    .byte 0x70, 0x61, 0x72, 0x65, 0x6e, 0x74, 0x20, 0x72, 0x65, 0x63, 0x76, 0x00
data_ov007_0216a6bc:
    .byte 0x63, 0x68, 0x69, 0x6c, 0x64, 0x20, 0x72, 0x65, 0x63, 0x76, 0x00, 0x00
data_ov007_0216a6c8:
    .byte 0x57, 0x58, 0x43, 0x00
data_ov007_0216a6cc:
    .word data_ov007_0216a6c8
    .word func_ov007_02161d94
    .word func_ov007_02161d8c
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov007_02161cc4
    .word func_ov007_02161a30
    .word func_ov007_021619a4
    .word func_ov007_02161928
    .word func_ov007_02161914
    .word data_ov007_0216c574
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a6f8:
    .byte 0x43, 0x4f, 0x4d, 0x4d, 0x4f, 0x4e, 0x00, 0x00
data_ov007_0216a700:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x44, 0x77, 0x6c, 0x64, 0x4d, 0x65, 0x6d
    .byte 0x62, 0x65, 0x72, 0x45, 0x6e, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_0216a71c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x44, 0x77, 0x6c, 0x64, 0x4d, 0x65, 0x6d
    .byte 0x62, 0x65, 0x72, 0x45, 0x6e, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216a738:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x44, 0x61, 0x74, 0x61, 0x4c, 0x65, 0x61
    .byte 0x64, 0x65, 0x72, 0x53, 0x65, 0x6c, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_0216a754:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x44, 0x61, 0x74, 0x61, 0x4c, 0x65, 0x61
    .byte 0x64, 0x65, 0x72, 0x53, 0x65, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216a770:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x44, 0x61, 0x74, 0x61, 0x4d, 0x65, 0x6d
    .byte 0x62, 0x65, 0x72, 0x45, 0x6e, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x5f, 0x43, 0x6f, 0x72, 0x65, 0x00
data_ov007_0216a790:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x44, 0x61, 0x74, 0x61, 0x4d, 0x65, 0x6d
    .byte 0x62, 0x65, 0x72, 0x45, 0x6e, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216a7ac:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x51, 0x75, 0x69, 0x7a, 0x4c, 0x65, 0x61
    .byte 0x64, 0x65, 0x72, 0x53, 0x65, 0x6c, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_0216a7c8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x51, 0x75, 0x69, 0x7a, 0x4c, 0x65, 0x61
    .byte 0x64, 0x65, 0x72, 0x53, 0x65, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216a7e4:
    .word data_ov007_0216a978
    .word data_ov007_0216a990
data_ov007_0216a7ec:
    .word data_ov007_0216a938
    .word data_ov007_0216a9c4
data_ov007_0216a7f4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a800:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a80c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a818:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a824:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a830:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a83c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a848:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a84c:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a850:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216a854:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a860:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a86c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a878:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a884:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a890:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a89c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8a8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8b4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8c0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8cc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8d8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8e4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8f0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a8fc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a908:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a914:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a91c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a924:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov007_0216a92c:
    .byte 0x41, 0x4c, 0x4e, 0x6f, 0x64, 0x65, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00
data_ov007_0216a938:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov007_0216a94c:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov007_0216a960:
    .byte 0x53, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x53, 0x74, 0x61, 0x6e, 0x64, 0x62, 0x79, 0x5f, 0x43, 0x72
    .byte 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov007_0216a978:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x77, 0x61, 0x74, 0x63, 0x68, 0x5f, 0x62, 0x61, 0x74, 0x74
    .byte 0x6c, 0x65, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov007_0216a990:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x77, 0x61, 0x74, 0x63, 0x68, 0x5f, 0x62, 0x61, 0x74, 0x74
    .byte 0x6c, 0x65, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov007_0216a9a8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x72, 0x6c, 0x73, 0x57, 0x61, 0x74
    .byte 0x63, 0x68, 0x57, 0x61, 0x69, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_0216a9c4:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x77, 0x61, 0x74, 0x63, 0x68, 0x5f, 0x62, 0x61, 0x74, 0x74
    .byte 0x6c, 0x65, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov007_0216a9e4:
    .byte 0x53, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x53, 0x74, 0x61, 0x6e, 0x64, 0x62, 0x79, 0x2e, 0x63, 0x70
    .byte 0x70, 0x00, 0x00, 0x00
data_ov007_0216a9f8:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x73
    .byte 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov007_0216aa14:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x73, 0x74, 0x61, 0x6e, 0x64, 0x62, 0x79, 0x5f, 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov007_0216aa34:
    .byte 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x5f, 0x69, 0x63, 0x6f
    .byte 0x6e, 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov007_0216aa50:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov007_0216aa5c:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x73, 0x74, 0x61, 0x6e, 0x64, 0x62, 0x79, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov007_0216aa7c:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x73, 0x74, 0x61, 0x6e, 0x64, 0x62, 0x79, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov007_0216aa9c:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x73, 0x74, 0x61, 0x6e, 0x64, 0x62, 0x79, 0x30, 0x31, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov007_0216aabc:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x73, 0x74, 0x61, 0x6e, 0x64, 0x62, 0x79, 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov007_0216aadc:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216aaf0:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x72, 0x6c, 0x73, 0x57, 0x61, 0x74
    .byte 0x63, 0x68, 0x57, 0x61, 0x69, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216ab0c:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov007_0216ab14:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x45, 0x72, 0x72
    .byte 0x6f, 0x72, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov007_0216ab2c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x57, 0x69, 0x46, 0x69, 0x45, 0x72, 0x72
    .byte 0x6f, 0x72, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov007_0216ab44:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x5f, 0x57
    .byte 0x72, 0x6c, 0x73, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov007_0216ab5c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x5f, 0x57
    .byte 0x69, 0x46, 0x69, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov007_0216ab74:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x2e, 0x63
    .byte 0x70, 0x70, 0x00, 0x00
data_ov007_0216ab88:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x45, 0x6e, 0x74, 0x72, 0x79, 0x44, 0x61
    .byte 0x74, 0x61, 0x45, 0x6e, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x5f, 0x43, 0x6f, 0x72, 0x65, 0x00, 0x00
data_ov007_0216aba8:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x4d, 0x65, 0x6e, 0x75, 0x45, 0x6e, 0x74, 0x72, 0x79, 0x44, 0x61
    .byte 0x74, 0x61, 0x45, 0x6e, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_0216abc4:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x62, 0x61, 0x73, 0x65, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov007_0216abe0:
    .byte 0x64, 0x65, 0x63, 0x6b, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x64, 0x65, 0x63, 0x6b, 0x5f
    .byte 0x62, 0x61, 0x73, 0x65, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov007_0216abfc:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x2f, 0x65, 0x6e, 0x74, 0x72, 0x79, 0x5f, 0x33, 0x64, 0x2e, 0x61
    .byte 0x61, 0x72, 0x00, 0x00
data_ov007_0216ac10:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x64, 0x73, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
data_ov007_0216ac20:
    .word data_ov007_0216ac38
    .word data_ov007_0216ac28
data_ov007_0216ac28:
    .byte 0x6a, 0x75, 0x73, 0x5f, 0x77, 0x66, 0x6d, 0x61, 0x5f, 0x76, 0x65, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov007_0216ac38:
    .byte 0x76, 0x65, 0x72, 0x2e, 0x32, 0x30, 0x30, 0x36, 0x30, 0x39, 0x32, 0x36, 0x00, 0x00, 0x00, 0x00
data_ov007_0216ac48:
    .byte 0x6a, 0x75, 0x6d, 0x70, 0x73, 0x73, 0x74, 0x61, 0x72, 0x73, 0x32, 0x64, 0x73, 0x00, 0x00, 0x00
data_ov007_0216ac58:
    .byte 0x56, 0x58, 0x6b, 0x4f, 0x64, 0x58, 0x00, 0x00
data_ov007_0216ac60:
    .byte 0x25, 0x73, 0x20, 0x3d, 0x20, 0x27, 0x25, 0x73, 0x27, 0x00, 0x00, 0x00
data_ov007_0216ac6c:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov007_0216ac70:
    .word data_ov007_0216ac74
data_ov007_0216ac74:
    .byte 0x2e, 0x00, 0x00, 0x00
    .word data_ov007_0216ac7c
data_ov007_0216ac7c:
    .byte 0x57, 0x30, 0x70, 0x30, 0x89, 0x30, 0x4f, 0x30, 0x4a, 0x30, 0x7e, 0x30, 0x61, 0x30, 0x4f, 0x30
    .byte 0x60, 0x30, 0x55, 0x30, 0x44, 0x30, 0x00, 0x00
data_ov007_0216ac94:
    .byte 0x4d, 0x61, 0x69, 0x6e, 0x5f, 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x6e, 0x69, 0x63, 0x61, 0x74, 0x69
    .byte 0x6f, 0x6e, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov007_0216acac:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x75, 0x6e, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x57, 0x61, 0x69
    .byte 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov007_0216acc4:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x44, 0x53, 0x46, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .section .bss, 4, 1, 4
data_ov007_0216ace0: .space 0x8
data_ov007_0216ace8: .space 0x2
data_ov007_0216acea: .space 0x2
data_ov007_0216acec: .space 0x2
data_ov007_0216acee: .space 0x2
data_ov007_0216acf0: .space 0x2
data_ov007_0216acf2: .space 0x2
data_ov007_0216acf4: .space 0x2
data_ov007_0216acf6: .space 0x16
data_ov007_0216ad0c: .space 0x1
data_ov007_0216ad0d: .space 0x1
data_ov007_0216ad0e: .space 0x1
data_ov007_0216ad0f: .space 0x1
data_ov007_0216ad10: .space 0x1
data_ov007_0216ad11: .space 0x1
data_ov007_0216ad12: .space 0x3e
data_ov007_0216ad50: .space 0x2
data_ov007_0216ad52: .space 0x16
data_ov007_0216ad68: .space 0x4
data_ov007_0216ad6c: .space 0xc
data_ov007_0216ad78: .space 0x4
data_ov007_0216ad7c: .space 0x4
data_ov007_0216ad80: .space 0x4
data_ov007_0216ad84: .space 0x4
data_ov007_0216ad88: .space 0x4
data_ov007_0216ad8c: .space 0x14
data_ov007_0216ada0: .space 0x1040
data_ov007_0216bde0: .space 0x4
data_ov007_0216bde4: .space 0x200
data_ov007_0216bfe4: .space 0x590
data_ov007_0216c574: .space 0x174
data_ov007_0216c6e8: .space 0x18
