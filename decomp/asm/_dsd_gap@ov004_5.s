    .include "macros/function.inc"

    .text
    .global func_ov004_0214cd20
    arm_func_start func_ov004_0214cd20
func_ov004_0214cd20: ; 0x0214cd20
    ldr r0, .L_0214cd34
    ldr ip, .L_0214cd38
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x18]
    bx ip
.L_0214cd34: .word data_ov004_02161de0
.L_0214cd38: .word func_ov004_02150ff0
    arm_func_end func_ov004_0214cd20

    .global func_ov004_0214cd3c
    arm_func_start func_ov004_0214cd3c
func_ov004_0214cd3c: ; 0x0214cd3c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_0214cdf8
    ldr r2, .L_0214cdfc
    mov r0, #0x1c
    mov r3, #0x66
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x1c
    mov r4, r0
    bl func_020517fc
    ldr r0, .L_0214ce00
    str r4, [r0, #0x0]
    bl func_020310f4
    ldr r2, .L_0214ce04
    str r0, [r4, #0x0]
    ldr r3, [r2, #0x0]
    ldr r1, .L_0214ce08
    sub r3, r3, #0x1
    str r3, [r2, #0x0]
    ldr r2, [r1, #0x0]
    ldr r1, .L_0214ce0c
    str r2, [r1, r3, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    bl func_02026f94
    str r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, .L_0214ce10
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x0
    str r0, [r4, #0xc]
    str r7, [r4, #0x10]
    str r6, [r4, #0x14]
    str r5, [r4, #0x18]
    ldr r0, [r4, #0x0]
    bl func_ov004_0214efb0
    ldr r0, [r4, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214cdf8: .word data_ov004_021608b0
.L_0214cdfc: .word data_ov004_021608a0
.L_0214ce00: .word data_ov004_02161de0
.L_0214ce04: .word data_02093c04
.L_0214ce08: .word data_020a0e80
.L_0214ce0c: .word data_020a16c0
.L_0214ce10: .word func_ov004_0214cf9c
    arm_func_end func_ov004_0214cd3c

    .global func_ov004_0214ce14
    arm_func_start func_ov004_0214ce14
func_ov004_0214ce14: ; 0x0214ce14
    str r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov004_0214ce14

    .global func_ov004_0214ce1c
    arm_func_start func_ov004_0214ce1c
func_ov004_0214ce1c: ; 0x0214ce1c
    ldr ip, .L_0214ce30
    mov r0, #0x0
    mov r2, r0
    mov r1, #0x1
    bx ip
.L_0214ce30: .word func_ov004_0214cd3c
    arm_func_end func_ov004_0214ce1c

    .global func_ov004_0214ce34
    arm_func_start func_ov004_0214ce34
func_ov004_0214ce34: ; 0x0214ce34
    ldr ip, .L_0214ce48
    mov r0, #0x1
    mov r1, #0x5
    mov r2, #0x0
    bx ip
.L_0214ce48: .word func_ov004_0214cd3c
    arm_func_end func_ov004_0214ce34

    .global func_ov004_0214ce4c
    arm_func_start func_ov004_0214ce4c
func_ov004_0214ce4c: ; 0x0214ce4c
    ldr ip, .L_0214ce60
    mov r0, #0x2
    mov r1, #0x9
    mov r2, #0x0
    bx ip
.L_0214ce60: .word func_ov004_0214cd3c
    arm_func_end func_ov004_0214ce4c

    .global func_ov004_0214ce64
    arm_func_start func_ov004_0214ce64
func_ov004_0214ce64: ; 0x0214ce64
    ldr r0, .L_0214ce70
    ldr r0, [r0, #0x0]
    bx lr
.L_0214ce70: .word data_ov004_02161de0
    arm_func_end func_ov004_0214ce64

    .global func_ov004_0214ce74
    arm_func_start func_ov004_0214ce74
func_ov004_0214ce74: ; 0x0214ce74
    cmp r0, #0x0
    strne r1, [r0, #0x14]
    bx lr
    arm_func_end func_ov004_0214ce74

    .global func_ov004_0214ce80
    arm_func_start func_ov004_0214ce80
func_ov004_0214ce80: ; 0x0214ce80
    cmp r0, #0x0
    movne r2, #0xa
    strne r2, [r0, #0x14]
    strne r1, [r0, #0xc]
    bx lr
    arm_func_end func_ov004_0214ce80

    .global func_ov004_0214ce94
    arm_func_start func_ov004_0214ce94
func_ov004_0214ce94: ; 0x0214ce94
    cmp r0, #0x0
    strne r1, [r0, #0x18]
    bx lr
    arm_func_end func_ov004_0214ce94

    .global func_ov004_0214cea0
    arm_func_start func_ov004_0214cea0
func_ov004_0214cea0: ; 0x0214cea0
    cmp r0, #0x0
    ldrne r0, [r0, #0x10]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov004_0214cea0

    .global func_ov004_0214ceb0
    arm_func_start func_ov004_0214ceb0
func_ov004_0214ceb0: ; 0x0214ceb0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_0214cedc
    b .L_0214ced0
.L_0214cec4:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_0214ced0:
    cmp r5, r6
    blo .L_0214cec4
    ldmia sp!, {r4, r5, r6, pc}
.L_0214cedc: .word data_020a0e18
    arm_func_end func_ov004_0214ceb0

    .global func_ov004_0214cee0
    arm_func_start func_ov004_0214cee0
func_ov004_0214cee0: ; 0x0214cee0
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
    arm_func_end func_ov004_0214cee0

    .global func_ov004_0214cf0c
    arm_func_start func_ov004_0214cf0c
func_ov004_0214cf0c: ; 0x0214cf0c
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    str r1, [r2, #0x8f8]
    strb r0, [r2, #0x902]
    bx lr
    arm_func_end func_ov004_0214cf0c

    .global func_ov004_0214cf20
    arm_func_start func_ov004_0214cf20
func_ov004_0214cf20: ; 0x0214cf20
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
    arm_func_end func_ov004_0214cf20

    .global func_ov004_0214cf9c
    arm_func_start func_ov004_0214cf9c
func_ov004_0214cf9c: ; 0x0214cf9c
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    beq .L_0214cfc8
    ldr r0, [r1, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    beq .L_0214d1e4
.L_0214cfc8:
    cmp r1, #0x0
    beq .L_0214d144
    mov r0, #0x4
    bl func_ov004_0214ceb0
    mov r0, #0x2
    bl func_ov004_0214ceb0
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x3f
    mov r2, #0x0
    bl func_ov004_0214cee0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x3f
    mov r2, #0x0
    bl func_ov004_0214cee0
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mvn r1, #0xf
    bl func_ov004_0214cf0c
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mvn r1, #0xf
    bl func_ov004_0214cf0c
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0x4]
    str r0, [sp, #0x0]
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    add r1, sp, #0x0
    add r2, sp, #0x4
    add r3, sp, #0x8
    bl func_ov004_0214cf20
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x10]
    str r0, [sp, #0xc]
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    add r1, sp, #0xc
    add r2, sp, #0x10
    add r3, sp, #0x14
    bl func_ov004_0214cf20
    mov r0, #0x0
    bl func_02043264
    ldr r0, .L_0214d1ec
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
    bl func_ov004_0214ceb0
.L_0214d144:
    ldr r1, [r4, #0x14]
    ldr r0, .L_0214d1f0
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0214d160
    blx r0
.L_0214d160:
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x14]
    bne .L_0214d1e4
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x0]
    bl func_ov004_0214f108
    ldr r1, .L_0214d1f4
    ldr r2, .L_0214d1f8
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214d1fc
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r2, [r0, #0x0]
    str r3, [r1, #0x0]
    ldr r1, [r4, #0xc]
    ldr r0, .L_0214d200
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r1, .L_0214d204
    mov r2, #0x0
    mov r0, r4
    str r2, [r1, #0x0]
    bl func_0201b244
.L_0214d1e4:
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0214d1ec: .word data_020a0f64
.L_0214d1f0: .word data_ov004_0216038c
.L_0214d1f4: .word data_02093c04
.L_0214d1f8: .word data_020a16c0
.L_0214d1fc: .word data_020a0e80
.L_0214d200: .word data_020afcb0
.L_0214d204: .word data_ov004_02161de0
    arm_func_end func_ov004_0214cf9c

    .global func_ov004_0214d208
    arm_func_start func_ov004_0214d208
func_ov004_0214d208: ; 0x0214d208
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r0, #0x1
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
.L_0214d434:
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
    bl func_ov004_0214d4c8
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_0214d434
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov004_0214d208

    .global func_ov004_0214d4c8
    arm_func_start func_ov004_0214d4c8
func_ov004_0214d4c8: ; 0x0214d4c8
    stmdb sp!, {r3, lr}
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214d4c8

    .global func_ov004_0214d4ec
    arm_func_start func_ov004_0214d4ec
func_ov004_0214d4ec: ; 0x0214d4ec
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
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
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214d4ec

    .global func_ov004_0214d6f8
    arm_func_start func_ov004_0214d6f8
func_ov004_0214d6f8: ; 0x0214d6f8
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    mov r0, #0x0
    bl func_02043264
    bl func_ov004_0214d4ec
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
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    mov r0, #0x1000
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
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
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
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
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214d6f8

    .global func_ov004_0214d964
    arm_func_start func_ov004_0214d964
func_ov004_0214d964: ; 0x0214d964
    stmdb sp!, {r3, lr}
    mov r0, #0x0
    bl func_02043264
    ldr r0, .L_0214d988
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    bl func_ov004_0214d4ec
    ldmia sp!, {r3, pc}
.L_0214d988: .word data_020a0f64
    arm_func_end func_ov004_0214d964

    .global func_ov004_0214d98c
    arm_func_start func_ov004_0214d98c
func_ov004_0214d98c: ; 0x0214d98c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x14
    mov r0, #0x0
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
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r6, #0x1
    mov r8, #0x0
    mov r5, r6
    mov r4, #0x4
    mov r7, r8
.L_0214d9f0:
    mov r0, r6
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r5
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r6
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, r6
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r8
    ldr r0, [r0, #0x4]
    mov r2, r8
    bl func_0203cfbc
    mov r0, r6
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, r6
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, r6
    bl func_ov004_0214d4c8
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_0214d9f0
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
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    mov r0, #0x1000
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
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
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
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
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov004_0214d98c

    .global func_ov004_0214dcd4
    arm_func_start func_ov004_0214dcd4
func_ov004_0214dcd4: ; 0x0214dcd4
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x20
    mov r0, #0x0
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
    str r0, [sp, #0x1c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x1c
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
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x18]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x18
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
    mov r1, #0x2000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x14]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x14
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
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
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
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    mov r0, #0x1000
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r2, #0x1
    ldr r1, [r1, #0x4]
    mov r0, #0x2
    strb r2, [r1, #0x956]
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
    mov r1, #0x2000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
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
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214dcd4

    .global func_ov004_0214e168
    arm_func_start func_ov004_0214e168
func_ov004_0214e168: ; 0x0214e168
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
    bl func_ov004_0214e1b8
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214e168

    .global func_ov004_0214e1b8
    arm_func_start func_ov004_0214e1b8
func_ov004_0214e1b8: ; 0x0214e1b8
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
    beq .L_0214e1f4
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0214e1f4:
    ldrb r0, [r4, #0x24]
    orr r0, r0, #0x31
    strb r0, [r4, #0x24]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214e1b8

    .global func_ov004_0214e204
    arm_func_start func_ov004_0214e204
func_ov004_0214e204: ; 0x0214e204
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, .L_0214e380
    mov r4, r0
    ldr r2, .L_0214e384
    ldr r3, .L_0214e388
    mov r0, #0x8
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
    ldr r0, .L_0214e38c
    ldr r1, .L_0214e390
    mov r2, r4
    bl func_ov004_0214e880
    ldr r1, .L_0214e394
    mov r6, r0
    bl func_ov004_0214e92c
    mov r0, r7
    mov r1, #0x0
    bl func_ov004_0214ed84
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r1, .L_0214e398
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov004_0214e3a0
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
    ldr r1, .L_0214e39c
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
    bl func_ov004_0214e478
    str r5, [r7, #0x0]
    mov r0, r7
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214e380: .word data_ov004_02160a38
.L_0214e384: .word data_ov004_0216092c
.L_0214e388: .word 0x12d
.L_0214e38c: .word data_ov004_021603b8
.L_0214e390: .word data_ov004_021603c4
.L_0214e394: .word data_ov004_021603d0
.L_0214e398: .word data_ov012_021d5154
.L_0214e39c: .word func_ov004_0214e168
    arm_func_end func_ov004_0214e204

    .global func_ov004_0214e3a0
    arm_func_start func_ov004_0214e3a0
func_ov004_0214e3a0: ; 0x0214e3a0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r4, [r0, #0x4]
    ldr r1, .L_0214e3e0
    ldr r2, .L_0214e3e4
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214e3d8
    ldr r3, .L_0214e3e8
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_0214e3d8:
    bl func_ov004_0214e3ec
    ldmia sp!, {r3, r4, r5, pc}
.L_0214e3e0: .word data_ov004_021608d4
.L_0214e3e4: .word data_ov004_021608c4
.L_0214e3e8: .word func_ov004_0214e414
    arm_func_end func_ov004_0214e3a0

    .global func_ov004_0214e3ec
    arm_func_start func_ov004_0214e3ec
func_ov004_0214e3ec: ; 0x0214e3ec
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214e40c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214e40c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214e3ec

    .global func_ov004_0214e414
    arm_func_start func_ov004_0214e414
func_ov004_0214e414: ; 0x0214e414
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x44
    ldr r1, .L_0214e45c
    ldr r2, .L_0214e460
    add r3, r0, #0xc1
    bl func_0201a21c
    movs r4, r0
    beq .L_0214e454
    mov r1, r5
    mov r2, #0x0
    bl func_02014604
    ldr r1, .L_0214e464
    mov r0, #0x1
    str r1, [r4, #0x0]
    strb r0, [r4, #0x40]
.L_0214e454:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0214e45c: .word data_ov004_02160918
.L_0214e460: .word data_ov004_021608e4
.L_0214e464: .word data_ov012_021d2a24
    arm_func_end func_ov004_0214e414

    .global func_ov004_0214e468
    arm_func_start func_ov004_0214e468
func_ov004_0214e468: ; 0x0214e468
    ldr r1, [r1, #0x0]
    mov r1, r1, asr #0x4
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov004_0214e468

    .global func_ov004_0214e478
    arm_func_start func_ov004_0214e478
func_ov004_0214e478: ; 0x0214e478
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
    arm_func_end func_ov004_0214e478

    .global func_ov004_0214e4b0
    arm_func_start func_ov004_0214e4b0
func_ov004_0214e4b0: ; 0x0214e4b0
    ldr r0, [r0, #0x0]
    bx lr
    arm_func_end func_ov004_0214e4b0

    .global func_ov004_0214e4b8
    arm_func_start func_ov004_0214e4b8
func_ov004_0214e4b8: ; 0x0214e4b8
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0214e4dc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214e4dc:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214e4b8

    .global func_ov004_0214e4e8
    arm_func_start func_ov004_0214e4e8
func_ov004_0214e4e8: ; 0x0214e4e8
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
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214e4e8

    .global func_ov004_0214e548
    arm_func_start func_ov004_0214e548
func_ov004_0214e548: ; 0x0214e548
    stmdb sp!, {r4, lr}
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
    bl func_ov004_0214ee60
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
    mov r3, #0x0
    add r0, sp, #0x8
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov004_0214e6e4
    ldr r2, .L_0214e638
    mov r0, #0x0
    add r1, sp, #0x8
    bl func_ov004_0214e644
    mov r1, r0
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
    ldr r1, .L_0214e63c
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e640
    blx func_ov012_021b400c
    mov r0, r4
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0214e638: .word data_02093c8c
.L_0214e63c: .word 0x510001
.L_0214e640: .word 0x51002c
    arm_func_end func_ov004_0214e548

    .global func_ov004_0214e644
    arm_func_start func_ov004_0214e644
func_ov004_0214e644: ; 0x0214e644
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_0214e6bc
    ldr r2, .L_0214e6c0
    ldr r3, .L_0214e6c4
    mov r0, #0x70
    bl func_0201a21c
    movs r4, r0
    beq .L_0214e698
    mov r1, r7
    mov r2, r5
    blx func_ov012_021b054c
    ldr r2, .L_0214e6c8
    mov r1, r6
    add r0, r4, #0x68
    str r2, [r4, #0x0]
    bl func_ov004_0214e6d0
    ldr r0, .L_0214e6cc
    str r0, [r4, #0x0]
.L_0214e698:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214e6b4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214e6b4:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214e6bc: .word data_ov004_021608f4
.L_0214e6c0: .word data_ov004_021608bc
.L_0214e6c4: .word 0x1b2
.L_0214e6c8: .word data_ov004_0216094c
.L_0214e6cc: .word data_ov012_021d1c58
    arm_func_end func_ov004_0214e644

    .global func_ov004_0214e6d0
    arm_func_start func_ov004_0214e6d0
func_ov004_0214e6d0: ; 0x0214e6d0
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov004_0214e6d0

    .global func_ov004_0214e6e4
    arm_func_start func_ov004_0214e6e4
func_ov004_0214e6e4: ; 0x0214e6e4
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldr r1, [sp, #0x0]
    strh r3, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov004_0214e6e4

    .global func_ov004_0214e6fc
    arm_func_start func_ov004_0214e6fc
func_ov004_0214e6fc: ; 0x0214e6fc
    stmdb sp!, {r4, lr}
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
    mov r3, #0x14
    bl func_ov004_0214ee60
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
    mov r1, #0x10
    strb r2, [r0, #0xb1]
    ldr r0, [r4, #0x4]
    blx func_ov012_021b77a8
    mov r3, #0x0
    add r0, sp, #0x8
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov004_0214e6e4
    ldr r2, .L_0214e7e0
    mov r0, #0x0
    add r1, sp, #0x8
    bl func_ov004_0214e644
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e7e4
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e7e4
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214e7e8
    blx func_ov012_021b3fc4
    mov r0, r4
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0214e7e0: .word data_02093c8c
.L_0214e7e4: .word 0x510014
.L_0214e7e8: .word 0x510015
    arm_func_end func_ov004_0214e6fc

    .global func_ov004_0214e7ec
    arm_func_start func_ov004_0214e7ec
func_ov004_0214e7ec: ; 0x0214e7ec
    stmdb sp!, {r3, lr}
    ldr r2, .L_0214e81c
    ldr r1, .L_0214e820
    ldr ip, [r2, #0x0]
    ldr lr, [r0, #0x4]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r0, .L_0214e824
    str ip, [r2, #0x0]
    str r3, [r0, ip, lsl #0x2]
    str lr, [r1, #0x0]
    ldmia sp!, {r3, pc}
.L_0214e81c: .word data_02093c08
.L_0214e820: .word data_020a0dd0
.L_0214e824: .word data_020a16d0
    arm_func_end func_ov004_0214e7ec

    .global func_ov004_0214e828
    arm_func_start func_ov004_0214e828
func_ov004_0214e828: ; 0x0214e828
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0214e848
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214e848:
    ldr r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214e828

    .global func_ov004_0214e850
    arm_func_start func_ov004_0214e850
func_ov004_0214e850: ; 0x0214e850
    ldr r1, .L_0214e874
    ldr r2, .L_0214e878
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214e87c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bx lr
.L_0214e874: .word data_02093c08
.L_0214e878: .word data_020a16d0
.L_0214e87c: .word data_020a0dd0
    arm_func_end func_ov004_0214e850

    .global func_ov004_0214e880
    arm_func_start func_ov004_0214e880
func_ov004_0214e880: ; 0x0214e880
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    mov r0, r2
    bl func_ov004_0214e7ec
    mov r0, r4
    bl func_02035c90
    bl func_ov004_0214e828
    mov r4, r0
    bl func_02036ab8
    bl func_ov004_0214e3ec
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_0214e8ec
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_0214e904
.L_0214e8ec:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_0214e904:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    bl func_ov004_0214e850
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov004_0214e880

    .global func_ov004_0214e92c
    arm_func_start func_ov004_0214e92c
func_ov004_0214e92c: ; 0x0214e92c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r4, r1
    ldr r0, [r0, #0x64]
    ldr r0, [r0, #0x20]
    bl func_ov004_0214e828
    bl func_02034db8
    ldr r0, [r0, #0x4]
    mov r1, r4
    bl func_0201710c
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214e92c

    .global func_ov004_0214e958
    arm_func_start func_ov004_0214e958
func_ov004_0214e958: ; 0x0214e958
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
    b .L_0214e9e0
.L_0214e9a4:
    ldrsh r4, [r7, #0x0]
    b .L_0214e9d0
.L_0214e9ac:
    ldr r0, [r8, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x64]
    mov r2, r5
    ldr ip, [r0, #0x0]
    mov r3, r6
    ldr ip, [ip, #0x88]
    blx ip
    add r4, r4, #0x1
.L_0214e9d0:
    ldrsh r0, [r7, #0x4]
    cmp r4, r0
    blo .L_0214e9ac
    add r5, r5, #0x1
.L_0214e9e0:
    ldrsh r0, [r7, #0x6]
    cmp r5, r0
    blo .L_0214e9a4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov004_0214e958

    .global func_ov004_0214e9f0
    arm_func_start func_ov004_0214e9f0
func_ov004_0214e9f0: ; 0x0214e9f0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov004_0214e7ec
    mov r0, r7
    bl func_020329ec
    bl func_ov004_0214e3ec
    mov r4, r0
    ldr ip, .L_0214ea74
    ldr r3, [r4, #0x4]
    mov r2, r5, lsl #0xc
    str ip, [r3, #0x54]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    bl func_ov004_0214ea78
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
    bl func_ov004_0214e850
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214ea74: .word 0x31305053
    arm_func_end func_ov004_0214e9f0

    .global func_ov004_0214ea78
    arm_func_start func_ov004_0214ea78
func_ov004_0214ea78: ; 0x0214ea78
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
    arm_func_end func_ov004_0214ea78

    .global func_ov004_0214eaa0
    arm_func_start func_ov004_0214eaa0
func_ov004_0214eaa0: ; 0x0214eaa0
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x64
    ldr r4, .L_0214ec94
    mov r7, r0
    ldr r0, [r4, #0x0]
    mov r4, r1
    mov r6, r2
    mov r5, r3
    tst r0, #0x1
    bne .L_0214ebf8
    ldr r0, .L_0214ec98
    mov ip, #0x1000
    add r1, sp, #0x60
    add r2, sp, #0x5c
    add r3, sp, #0x58
    str ip, [sp, #0x58]
    str ip, [sp, #0x5c]
    str ip, [sp, #0x60]
    bl func_ov004_0214ecbc
    mov ip, #0x1000
    ldr r0, .L_0214ec9c
    add r1, sp, #0x54
    add r2, sp, #0x50
    add r3, sp, #0x4c
    str ip, [sp, #0x4c]
    str ip, [sp, #0x50]
    str ip, [sp, #0x54]
    bl func_ov004_0214ecbc
    mov r1, #0x1000
    ldr r0, .L_0214eca0
    str r1, [sp, #0x40]
    str r1, [sp, #0x44]
    str r1, [sp, #0x48]
    add r1, sp, #0x48
    add r2, sp, #0x44
    add r3, sp, #0x40
    bl func_ov004_0214ecbc
    mov r0, #0x1000
    str r0, [sp, #0x34]
    str r0, [sp, #0x38]
    str r0, [sp, #0x3c]
    ldr r0, .L_0214eca4
    add r1, sp, #0x3c
    add r2, sp, #0x38
    add r3, sp, #0x34
    bl func_ov004_0214ecbc
    mov r0, #0x1000
    str r0, [sp, #0x28]
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    ldr r0, .L_0214eca8
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    bl func_ov004_0214ecbc
    mov r0, #0x1000
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    ldr r0, .L_0214ecac
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    bl func_ov004_0214ecbc
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    ldr r0, .L_0214ecb0
    add r1, sp, #0x18
    add r2, sp, #0x14
    add r3, sp, #0x10
    bl func_ov004_0214ecbc
    mov ip, #0x0
    ldr r0, .L_0214ecb4
    add r1, sp, #0xc
    add r2, sp, #0x8
    add r3, sp, #0x4
    str ip, [sp, #0x4]
    str ip, [sp, #0x8]
    str ip, [sp, #0xc]
    bl func_ov004_0214ecbc
    ldr r0, .L_0214ec94
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
.L_0214ebf8:
    mov r0, r7
    bl func_ov004_0214e7ec
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov004_0214e3ec
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214ecb8
    str r1, [r0, #0x54]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    cmp r7, r0
    ldr r0, [r4, #0x4]
    bne .L_0214ec48
    ldr r2, [r0, #0x0]
    ldr r1, .L_0214ec98
    ldr r2, [r2, #0xfc]
    add r1, r1, r6, lsl #0x4
    blx r2
    b .L_0214ec5c
.L_0214ec48:
    ldr r0, [r0, #0x64]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
.L_0214ec5c:
    mov r2, r5, lsl #0xc
    add r1, sp, #0x0
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov004_0214ea78
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov004_0214e850
    mov r0, r4
    add sp, sp, #0x64
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0214ec94: .word data_ov004_02161de4
.L_0214ec98: .word data_ov004_021609b8
.L_0214ec9c: .word data_ov004_021609c8
.L_0214eca0: .word data_ov004_021609d8
.L_0214eca4: .word data_ov004_021609e8
.L_0214eca8: .word data_ov004_021609f8
.L_0214ecac: .word data_ov004_02160a08
.L_0214ecb0: .word data_ov004_02160a18
.L_0214ecb4: .word data_ov004_02160a28
.L_0214ecb8: .word 0x31305854
    arm_func_end func_ov004_0214eaa0

    .global func_ov004_0214ecbc
    arm_func_start func_ov004_0214ecbc
func_ov004_0214ecbc: ; 0x0214ecbc
    ldr ip, [r1, #0x0]
    mov r1, #0x1000
    str ip, [r0, #0x0]
    ldr r2, [r2, #0x0]
    str r2, [r0, #0x4]
    ldr r2, [r3, #0x0]
    str r2, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
    arm_func_end func_ov004_0214ecbc

    .global func_ov004_0214ece0
    arm_func_start func_ov004_0214ece0
func_ov004_0214ece0: ; 0x0214ece0
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
    beq .L_0214ed7c
    cmp r7, #0x0
    ble .L_0214ed60
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
.L_0214ed60:
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x64]
    mvn r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x6c]
    blx r3
.L_0214ed7c:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov004_0214ece0

    .global func_ov004_0214ed84
    arm_func_start func_ov004_0214ed84
func_ov004_0214ed84: ; 0x0214ed84
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr ip, .L_0214ee4c
    mov r6, r0
    ldr r1, .L_0214ee50
    ldr r2, .L_0214ee54
    ldr r3, .L_0214ee58
    mov r0, #0x14c
    ldr r4, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214edc4
    ldr r3, .L_0214ee5c
    mov r2, r4
    mov r1, #0x0
    blx func_ov012_021b7950
.L_0214edc4:
    bl func_ov004_0214e3ec
    mov r4, r0
    movs r1, #0x0
    bne .L_0214ede0
    ldr r0, [r4, #0x4]
    blx func_ov012_021b5898
    b .L_0214edf0
.L_0214ede0:
    mov r1, #0x4
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_0214edf0:
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
    beq .L_0214ee30
    mov r0, r4
    mov r1, r5
    blx func_ov012_021b3ba4
.L_0214ee30:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_0214ee4c: .word data_ov012_021d5154
.L_0214ee50: .word data_ov004_02160904
.L_0214ee54: .word data_ov004_021608cc
.L_0214ee58: .word 0x2a6
.L_0214ee5c: .word func_ov004_0214e414
    arm_func_end func_ov004_0214ed84

    .global func_ov004_0214ee60
    arm_func_start func_ov004_0214ee60
func_ov004_0214ee60: ; 0x0214ee60
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    ldr ip, .L_0214eef4
    mov r8, r1
    ldr r1, [ip, #0x0]
    mov r7, r2
    mov r6, r3
    ldr r5, [sp, #0x2c]
    bl func_ov004_0214e3a0
    mov r4, r0
    ldr r3, [sp, #0x28]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov004_0214e9f0
    mov r1, r0
    mov r0, r4
    bl func_ov004_0214e478
    ldr r1, [sp, #0x28]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x8]
    add r1, sp, #0x8
    bl func_ov004_0214ea78
    ldr r1, [r5, #0x4]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r2, [r5, #0x0]
    add r1, sp, #0x4
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x4]
    add r2, sp, #0x0
    bl func_ov004_0214e1b8
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0214eef4: .word data_ov012_021d5154
    arm_func_end func_ov004_0214ee60

    .global func_ov004_0214eef8
    arm_func_start func_ov004_0214eef8
func_ov004_0214eef8: ; 0x0214eef8
    ldrh r1, [r0, #0x4]
    add r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    bx lr
    arm_func_end func_ov004_0214eef8

    .global func_ov004_0214ef0c
    arm_func_start func_ov004_0214ef0c
func_ov004_0214ef0c: ; 0x0214ef0c
    str r1, [r0, #0x30]
    bx lr
    arm_func_end func_ov004_0214ef0c

    .global func_ov004_0214ef14
    arm_func_start func_ov004_0214ef14
func_ov004_0214ef14: ; 0x0214ef14
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_0214ef14

    .global func_ov004_0214ef1c
    arm_func_start func_ov004_0214ef1c
func_ov004_0214ef1c: ; 0x0214ef1c
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_0214ef1c

    .global func_ov004_0214ef24
    arm_func_start func_ov004_0214ef24
func_ov004_0214ef24: ; 0x0214ef24
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_0214ef24

    .global func_ov004_0214ef2c
    arm_func_start func_ov004_0214ef2c
func_ov004_0214ef2c: ; 0x0214ef2c
    ldr r2, [r0, #0x1c]
    cmp r2, r1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov004_0214ef2c

    .global func_ov004_0214ef3c
    arm_func_start func_ov004_0214ef3c
func_ov004_0214ef3c: ; 0x0214ef3c
    str r1, [r0, #0x1c]
    bx lr
    arm_func_end func_ov004_0214ef3c

    .global func_ov004_0214ef44
    arm_func_start func_ov004_0214ef44
func_ov004_0214ef44: ; 0x0214ef44
    mov r0, #0x1
    bx lr
    arm_func_end func_ov004_0214ef44

    .global func_ov004_0214ef4c
    arm_func_start func_ov004_0214ef4c
func_ov004_0214ef4c: ; 0x0214ef4c
    ldr r0, .L_0214ef54
    bx lr
.L_0214ef54: .word data_02093c74
    arm_func_end func_ov004_0214ef4c

    .global func_ov004_0214ef58
    arm_func_start func_ov004_0214ef58
func_ov004_0214ef58: ; 0x0214ef58
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_0214ef58

    .global func_ov004_0214ef60
    arm_func_start func_ov004_0214ef60
func_ov004_0214ef60: ; 0x0214ef60
    ldr ip, .L_0214ef6c
    add r0, r0, #0x68
    bx ip
.L_0214ef6c: .word func_ov004_0214e6d0
    arm_func_end func_ov004_0214ef60

    .global func_ov004_0214ef70
    arm_func_start func_ov004_0214ef70
func_ov004_0214ef70: ; 0x0214ef70
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214ef70

    .global func_ov004_0214ef84
    arm_func_start func_ov004_0214ef84
func_ov004_0214ef84: ; 0x0214ef84
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0214ef84

    .global func_ov004_0214efa0
    arm_func_start func_ov004_0214efa0
func_ov004_0214efa0: ; 0x0214efa0
    ldr r0, .L_0214efac
    ldr r0, [r0, #0x0]
    bx lr
.L_0214efac: .word data_ov004_02161de8
    arm_func_end func_ov004_0214efa0

    .global func_ov004_0214efb0
    arm_func_start func_ov004_0214efb0
func_ov004_0214efb0: ; 0x0214efb0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0214f0ec
    mov r4, r0
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, .L_0214f0f0
    ldr r0, .L_0214f0f4
    ldr r2, .L_0214f0f8
    mov r3, #0x2f
    bl func_0201a21c
    ldr r3, .L_0214f0ec
    ldr r2, .L_0214f0f4
    mov r1, #0x0
    str r0, [r3, #0x0]
    bl func_020517fc
    ldr r1, .L_0214f0ec
    ldr r0, .L_0214f0fc
    ldr r2, [r1, #0x0]
    mov r1, #0x0
    str r4, [r2, #0x0]
    blx func_020101f4
    ldr r2, .L_0214f0ec
    mov r1, #0x0
    ldr r2, [r2, #0x0]
    str r0, [r2, #0x48]
    ldr r0, .L_0214f100
    blx func_020101f4
    ldr r1, .L_0214f0ec
    ldr r1, [r1, #0x0]
    str r0, [r1, #0x4c]
    bl func_0207447c
    ldr r2, .L_0214f0ec
    mov r1, #0x0
    ldr r3, [r2, #0x0]
    mov r2, r1
    str r0, [r3, #0x38]
    ldr r0, .L_0214f104
    bl func_02033410
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne .L_0214f068
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214f068:
    ldr r0, .L_0214f0ec
    ldr r3, [r4, #0x1c]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    str r3, [r2, #0x3c]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x3c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    ldr r1, .L_0214f0ec
    ldr ip, [r0, #0x0]
    ldr r3, [r1, #0x0]
    add r2, r0, #0x4
    str ip, [r3, #0x44]
    ldr r0, [r1, #0x0]
    mvn r3, #0x0
    str r2, [r0, #0x40]
    ldr r0, [r1, #0x0]
    mov r2, #0x0
    strb r3, [r0, #0xd]
    ldr r0, [r1, #0x0]
    strb r2, [r0, #0xe]
    ldr r0, [r1, #0x0]
    strb r2, [r0, #0xf]
    bl func_02070d54
    cmp r0, #0x0
    ldrne r0, .L_0214f0ec
    movne r1, #0x1
    ldrne r0, [r0, #0x0]
    strneb r1, [r0, #0xe]
    ldmia sp!, {r4, pc}
.L_0214f0ec: .word data_ov004_02161de8
.L_0214f0f0: .word data_ov004_02160a98
.L_0214f0f4: .word 0x1850
.L_0214f0f8: .word data_ov004_02160a5c
.L_0214f0fc: .word data_ov004_02160aac
.L_0214f100: .word data_ov004_02160ac4
.L_0214f104: .word data_ov004_02160ad8
    arm_func_end func_ov004_0214efb0

    .global func_ov004_0214f108
    arm_func_start func_ov004_0214f108
func_ov004_0214f108: ; 0x0214f108
    stmdb sp!, {r3, lr}
    ldr r1, .L_0214f1b4
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x0]
    cmp r1, r0
    ldmneia sp!, {r3, pc}
    bl func_ov004_0214f29c
    ldr r0, .L_0214f1b4
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x38]
    bl func_02074504
    ldr r0, .L_0214f1b4
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_0214f158
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214f158:
    ldr r0, .L_0214f1b4
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    beq .L_0214f178
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214f178:
    ldr r0, .L_0214f1b4
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4c]
    cmp r0, #0x0
    beq .L_0214f198
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214f198:
    ldr r0, .L_0214f1b4
    ldr r0, [r0, #0x0]
    bl func_0201b244
    ldr r0, .L_0214f1b4
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldmia sp!, {r3, pc}
.L_0214f1b4: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f108

    .global func_ov004_0214f1b8
    arm_func_start func_ov004_0214f1b8
func_ov004_0214f1b8: ; 0x0214f1b8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, .L_0214f274
    ldr r4, [r1, #0x0]
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr ip, .L_0214f278
    ldr r3, .L_0214f27c
    ldr r2, [ip, #0x0]
    ldr r7, [r0, #0x4]
    ldr r5, [r3, #0x0]
    mov r1, #0x0
    sub r6, r2, #0x1
    ldr lr, .L_0214f280
    ldr r0, .L_0214f284
    mov r2, r1
    str r6, [ip, #0x0]
    str r5, [lr, r6, lsl #0x2]
    str r7, [r3, #0x0]
    blx func_ov012_021caa0c
    ldr r2, .L_0214f278
    str r0, [r4, #0x8]
    ldr r3, [r2, #0x0]
    ldr r1, .L_0214f280
    ldr r0, .L_0214f274
    add r4, r3, #0x1
    ldr r3, [r1, r3, lsl #0x2]
    ldr r1, .L_0214f27c
    ldr r0, [r0, #0x0]
    str r4, [r2, #0x0]
    str r3, [r1, #0x0]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0214f264
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214f264:
    ldr r0, [r4, #0x38]
    mov r1, #0x0
    bl func_02034d94
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214f274: .word data_ov004_02161de8
.L_0214f278: .word data_02093c08
.L_0214f27c: .word data_020a0dd0
.L_0214f280: .word data_020a16d0
.L_0214f284: .word data_ov004_02160ae8
    arm_func_end func_ov004_0214f1b8

    .global func_ov004_0214f288
    arm_func_start func_ov004_0214f288
func_ov004_0214f288: ; 0x0214f288
    ldr r0, .L_0214f298
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x8]
    bx lr
.L_0214f298: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f288

    .global func_ov004_0214f29c
    arm_func_start func_ov004_0214f29c
func_ov004_0214f29c: ; 0x0214f29c
    stmdb sp!, {r3, lr}
    ldr r0, .L_0214f2d8
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, .L_0214f2d8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x8]
    ldmia sp!, {r3, pc}
.L_0214f2d8: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f29c

    .global func_ov004_0214f2dc
    arm_func_start func_ov004_0214f2dc
func_ov004_0214f2dc: ; 0x0214f2dc
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldrle r0, .L_0214f308
    ldrle r0, [r0, #0x0]
    ldmleia sp!, {r3, pc}
    ldr r2, .L_0214f30c
    sub r1, r0, #0x1
    ldr r0, [r2, #0x0]
    ldr r0, [r0, #0x38]
    bl func_0207452c
    ldmia sp!, {r3, pc}
.L_0214f308: .word data_ov004_02160a48
.L_0214f30c: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f2dc

    .global func_ov004_0214f310
    arm_func_start func_ov004_0214f310
func_ov004_0214f310: ; 0x0214f310
    stmdb sp!, {r3, lr}
    ldrb r2, [r0, #0x0]
    cmp r2, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    cmp r2, #0xff
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, .L_0214f378
    mov ip, r2, lsr #0x5
    ldr r1, [r1, ip, lsl #0x2]
    and r2, r2, #0x1f
    mov r3, #0x1
    tst r1, r3, lsl r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, .L_0214f37c
    ldrb r0, [r0, #0x1]
    ldr r1, [r1, ip, lsl #0x2]
    mov lr, #0x0
    tst r1, r3, lsl r2
    movne lr, #0x2
    cmp r0, lr
    movhi r0, #0x0
    movls r0, #0x1
    ldmia sp!, {r3, pc}
.L_0214f378: .word data_020b0b9c
.L_0214f37c: .word data_020b0d20
    arm_func_end func_ov004_0214f310

    .global func_ov004_0214f380
    arm_func_start func_ov004_0214f380
func_ov004_0214f380: ; 0x0214f380
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    ldr r0, .L_0214f4fc
    ldr r1, .L_0214f500
    ldr r0, [r0, #0x0]
    ldr r2, .L_0214f504
    ldr r0, [r0, #0x44]
    mov r3, #0xd7
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
    mov r5, r8, lsl #0x1
    mov r0, r5
    bl func_0201a21c
    mov r4, r0
    ldr r1, .L_0214f500
    ldr r2, .L_0214f504
    mov r0, r5
    mov r3, #0xd8
    bl func_0201a21c
    ldr r2, .L_0214f4fc
    ldr r1, .L_0214f500
    ldr r3, [r2, #0x0]
    ldr r2, .L_0214f504
    ldrsh r6, [r3, #0x10]
    mov r5, r0
    mov r3, #0xd9
    mov r0, r6, lsl #0x1
    bl func_0201a21c
    mov r7, #0x0
    ldr r1, .L_0214f4fc
    mov r6, r0
    ldr r0, [r1, #0x0]
    mov r10, r7
    ldr r9, [r0, #0x40]
    b .L_0214f438
.L_0214f408:
    mov r0, r9
    bl func_ov004_0214f310
    cmp r0, #0x0
    addne r0, r7, #0x1
    movne r1, r7, lsl #0x1
    movne r0, r0, lsl #0x10
    movne r7, r0, asr #0x10
    add r0, r10, #0x1
    mov r0, r0, lsl #0x10
    strneh r10, [r4, r1]
    mov r10, r0, asr #0x10
    add r9, r9, #0x28
.L_0214f438:
    cmp r10, r8
    blt .L_0214f408
    ldr r9, .L_0214f4fc
    ldr r0, [r9, #0x0]
    ldrsh r1, [r0, #0x10]
    cmp r7, r1
    bge .L_0214f494
    cmp r7, #0x0
    ble .L_0214f494
    mov r8, r7
    b .L_0214f484
.L_0214f464:
    mov r0, r8
    mov r1, r7
    bl func_0200d12c
    mov r1, r1, lsl #0x1
    mov r0, r8, lsl #0x1
    ldrsh r1, [r4, r1]
    add r8, r8, #0x1
    strh r1, [r4, r0]
.L_0214f484:
    ldr r0, [r9, #0x0]
    ldrsh r1, [r0, #0x10]
    cmp r8, r1
    blt .L_0214f464
.L_0214f494:
    add r0, r1, r1, lsr #0x1f
    mov r0, r0, lsl #0xf
    mov r0, r0, asr #0x10
    cmp r0, #0x0
    movgt r0, #0x0
    sub r0, r1, r0
    mov r1, r0, lsl #0x10
    mov r0, r6
    mov r2, r4
    mov r3, r7
    mov r1, r1, asr #0x10
    bl func_ov004_021531d0
    ldr r0, .L_0214f4fc
    mov r2, r6
    ldr r0, [r0, #0x0]
    ldrsh r1, [r0, #0x10]
    add r0, r0, #0x50
    mov r3, r1
    bl func_ov004_021531d0
    mov r0, r4
    bl func_0201b268
    mov r0, r5
    bl func_0201b268
    mov r0, r6
    bl func_0201b268
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0214f4fc: .word data_ov004_02161de8
.L_0214f500: .word data_ov004_02160a98
.L_0214f504: .word data_ov004_02160a74
    arm_func_end func_ov004_0214f380

    .global func_ov004_0214f508
    arm_func_start func_ov004_0214f508
func_ov004_0214f508: ; 0x0214f508
    ldr ip, .L_0214f510
    bx ip
.L_0214f510: .word func_ov004_0214f380
    arm_func_end func_ov004_0214f508

    .global func_ov004_0214f514
    arm_func_start func_ov004_0214f514
func_ov004_0214f514: ; 0x0214f514
    bx lr
    arm_func_end func_ov004_0214f514

    .global func_ov004_0214f518
    arm_func_start func_ov004_0214f518
func_ov004_0214f518: ; 0x0214f518
    ldr r1, .L_0214f534
    ldr r2, .L_0214f538
    ldr r1, [r1, #0x0]
    ldr ip, .L_0214f53c
    strb r0, [r1, #0xc]
    ldr r0, [r2, r0, lsl #0x2]
    bx ip
.L_0214f534: .word data_ov004_02161de8
.L_0214f538: .word data_ov004_021603e4
.L_0214f53c: .word func_ov004_0214f568
    arm_func_end func_ov004_0214f518

    .global func_ov004_0214f540
    arm_func_start func_ov004_0214f540
func_ov004_0214f540: ; 0x0214f540
    ldr r0, .L_0214f550
    ldr r0, [r0, #0x0]
    ldrsb r0, [r0, #0xc]
    bx lr
.L_0214f550: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f540

    .global func_ov004_0214f554
    arm_func_start func_ov004_0214f554
func_ov004_0214f554: ; 0x0214f554
    ldr r1, .L_0214f564
    ldr r0, [r1, r0, lsl #0x2]
    and r0, r0, #0xff
    bx lr
.L_0214f564: .word data_ov004_021603e4
    arm_func_end func_ov004_0214f554

    .global func_ov004_0214f568
    arm_func_start func_ov004_0214f568
func_ov004_0214f568: ; 0x0214f568
    ldr r1, .L_0214f584
    mov r2, #0x0
    ldr r3, [r1, #0x0]
    strh r0, [r3, #0x10]
    ldr r0, [r1, #0x0]
    strh r2, [r0, #0x12]
    bx lr
.L_0214f584: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f568

    .global func_ov004_0214f588
    arm_func_start func_ov004_0214f588
func_ov004_0214f588: ; 0x0214f588
    ldr r1, .L_0214f598
    ldr r1, [r1, #0x0]
    strb r0, [r1, #0xd]
    bx lr
.L_0214f598: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f588

    .global func_ov004_0214f59c
    arm_func_start func_ov004_0214f59c
func_ov004_0214f59c: ; 0x0214f59c
    ldr r0, .L_0214f5b0
    mvn r1, #0x0
    ldr r0, [r0, #0x0]
    strb r1, [r0, #0xd]
    bx lr
.L_0214f5b0: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f59c

    .global func_ov004_0214f5b4
    arm_func_start func_ov004_0214f5b4
func_ov004_0214f5b4: ; 0x0214f5b4
    ldr r0, .L_0214f5c4
    ldr r0, [r0, #0x0]
    ldrsb r0, [r0, #0xd]
    bx lr
.L_0214f5c4: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f5b4

    .global func_ov004_0214f5c8
    arm_func_start func_ov004_0214f5c8
func_ov004_0214f5c8: ; 0x0214f5c8
    ldr r0, .L_0214f5d8
    ldr r0, [r0, #0x0]
    ldrsh r0, [r0, #0x10]
    bx lr
.L_0214f5d8: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f5c8

    .global func_ov004_0214f5dc
    arm_func_start func_ov004_0214f5dc
func_ov004_0214f5dc: ; 0x0214f5dc
    ldr r0, .L_0214f5f0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    strh r1, [r0, #0x12]
    bx lr
.L_0214f5f0: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f5dc

    .global func_ov004_0214f5f4
    arm_func_start func_ov004_0214f5f4
func_ov004_0214f5f4: ; 0x0214f5f4
    ldr r0, .L_0214f604
    ldr r0, [r0, #0x0]
    ldrsh r0, [r0, #0x12]
    bx lr
.L_0214f604: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f5f4

    .global func_ov004_0214f608
    arm_func_start func_ov004_0214f608
func_ov004_0214f608: ; 0x0214f608
    ldr r0, .L_0214f620
    ldr r1, [r0, #0x0]
    ldrsh r0, [r1, #0x12]
    add r0, r1, r0, lsl #0x1
    ldrsh r0, [r0, #0x50]
    bx lr
.L_0214f620: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f608

    .global func_ov004_0214f624
    arm_func_start func_ov004_0214f624
func_ov004_0214f624: ; 0x0214f624
    ldr r0, .L_0214f634
    ldr r0, [r0, #0x0]
    add r0, r0, #0x50
    bx lr
.L_0214f634: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f624

    .global func_ov004_0214f638
    arm_func_start func_ov004_0214f638
func_ov004_0214f638: ; 0x0214f638
    stmdb sp!, {r4, lr}
    ldr r0, .L_0214f658
    ldr r0, [r0, #0x0]
    ldr r4, [r0, #0x40]
    bl func_ov004_0214f608
    mov r1, #0x28
    smlabb r0, r0, r1, r4
    ldmia sp!, {r4, pc}
.L_0214f658: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f638

    .global func_ov004_0214f65c
    arm_func_start func_ov004_0214f65c
func_ov004_0214f65c: ; 0x0214f65c
    ldr r0, .L_0214f674
    ldr r1, [r0, #0x0]
    ldrsh r0, [r1, #0x12]
    add r0, r0, #0x1
    strh r0, [r1, #0x12]
    bx lr
.L_0214f674: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f65c

    .global func_ov004_0214f678
    arm_func_start func_ov004_0214f678
func_ov004_0214f678: ; 0x0214f678
    ldr r0, .L_0214f69c
    ldr r1, [r0, #0x0]
    ldrsh r0, [r1, #0x10]
    ldrsh r1, [r1, #0x12]
    sub r0, r0, #0x1
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_0214f69c: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f678

    .global func_ov004_0214f6a0
    arm_func_start func_ov004_0214f6a0
func_ov004_0214f6a0: ; 0x0214f6a0
    ldr r0, .L_0214f6c0
    ldr r0, [r0, #0x0]
    ldrsh r1, [r0, #0x12]
    ldrsh r0, [r0, #0x10]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.L_0214f6c0: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f6a0

    .global func_ov004_0214f6c4
    arm_func_start func_ov004_0214f6c4
func_ov004_0214f6c4: ; 0x0214f6c4
    ldr r0, .L_0214f6e0
    ldr r0, [r0, #0x0]
    ldrsb r0, [r0, #0xe]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0214f6e0: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f6c4

    .global func_ov004_0214f6e4
    arm_func_start func_ov004_0214f6e4
func_ov004_0214f6e4: ; 0x0214f6e4
    ldr r0, .L_0214f700
    ldr r0, [r0, #0x0]
    ldrsb r0, [r0, #0xf]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0214f700: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f6e4

    .global func_ov004_0214f704
    arm_func_start func_ov004_0214f704
func_ov004_0214f704: ; 0x0214f704
    ldr r0, .L_0214f714
    ldr r0, [r0, #0x0]
    ldrb r0, [r0, #0x14]
    bx lr
.L_0214f714: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f704

    .global func_ov004_0214f718
    arm_func_start func_ov004_0214f718
func_ov004_0214f718: ; 0x0214f718
    ldr r1, .L_0214f728
    ldr r1, [r1, #0x0]
    strb r0, [r1, #0x14]
    bx lr
.L_0214f728: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f718

    .global func_ov004_0214f72c
    arm_func_start func_ov004_0214f72c
func_ov004_0214f72c: ; 0x0214f72c
    ldr r0, .L_0214f73c
    ldr r0, [r0, #0x0]
    ldrb r0, [r0, #0x15]
    bx lr
.L_0214f73c: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f72c

    .global func_ov004_0214f740
    arm_func_start func_ov004_0214f740
func_ov004_0214f740: ; 0x0214f740
    ldr r1, .L_0214f750
    ldr r1, [r1, #0x0]
    strb r0, [r1, #0x15]
    bx lr
.L_0214f750: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f740

    .global func_ov004_0214f754
    arm_func_start func_ov004_0214f754
func_ov004_0214f754: ; 0x0214f754
    mov r3, #0x0
    ldr r0, .L_0214f77c
    mov r2, r3
.L_0214f760:
    ldr r1, [r0, #0x0]
    add r1, r1, r3
    add r3, r3, #0x1
    strb r2, [r1, #0x16]
    cmp r3, #0x4
    blt .L_0214f760
    bx lr
.L_0214f77c: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f754

    .global func_ov004_0214f780
    arm_func_start func_ov004_0214f780
func_ov004_0214f780: ; 0x0214f780
    ldr r0, .L_0214f798
    ldr r1, [r0, #0x0]
    ldrb r0, [r1, #0x14]
    add r0, r1, r0
    ldrb r0, [r0, #0x16]
    bx lr
.L_0214f798: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f780

    .global func_ov004_0214f79c
    arm_func_start func_ov004_0214f79c
func_ov004_0214f79c: ; 0x0214f79c
    ldr r1, .L_0214f7c4
    ldr r1, [r1, #0x0]
    ldrb ip, [r1, #0x14]
    add r3, r1, #0x16
    ldrb r2, [r3, ip]
    add r1, r1, ip
    add r0, r2, r0
    strb r0, [r3, ip]
    ldrb r0, [r1, #0x16]
    bx lr
.L_0214f7c4: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f79c

    .global func_ov004_0214f7c8
    arm_func_start func_ov004_0214f7c8
func_ov004_0214f7c8: ; 0x0214f7c8
    ldr r1, .L_0214f7dc
    ldr r1, [r1, #0x0]
    add r0, r1, r0
    ldrb r0, [r0, #0x16]
    bx lr
.L_0214f7dc: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f7c8

    .global func_ov004_0214f7e0
    arm_func_start func_ov004_0214f7e0
func_ov004_0214f7e0: ; 0x0214f7e0
    ldr r2, .L_0214f804
    ldr r2, [r2, #0x0]
    add ip, r2, #0x16
    ldrb r3, [ip, r0]
    add r2, r2, r0
    add r1, r3, r1
    strb r1, [ip, r0]
    ldrb r0, [r2, #0x16]
    bx lr
.L_0214f804: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f7e0

    .global func_ov004_0214f808
    arm_func_start func_ov004_0214f808
func_ov004_0214f808: ; 0x0214f808
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x20
    ldr r0, .L_0214f934
    mov r3, #0x0
    ldr r9, [r0, #0x0]
    mvn r2, #0x0
    ldrb lr, [r9, #0x15]
    add r1, sp, #0x10
    add r0, sp, #0x0
    b .L_0214f83c
.L_0214f830:
    str r2, [r1, r3, lsl #0x2]
    str r3, [r0, r3, lsl #0x2]
    add r3, r3, #0x1
.L_0214f83c:
    cmp r3, lr
    blt .L_0214f830
    mov r5, #0x0
    mov r4, lr
    add r2, sp, #0x10
    add r3, sp, #0x0
    mov ip, r5
    mov r1, r5
    b .L_0214f8ec
.L_0214f860:
    mov r6, ip
    mov r8, ip
    b .L_0214f898
.L_0214f86c:
    ldr r7, [r3, r8, lsl #0x2]
    cmp r7, #0x0
    blt .L_0214f894
    ldr r0, [r2, r7, lsl #0x2]
    cmp r0, #0x0
    bge .L_0214f894
    add r0, r9, r7
    ldrb r0, [r0, #0x16]
    cmp r6, r0
    movlo r6, r0
.L_0214f894:
    add r8, r8, #0x1
.L_0214f898:
    cmp r8, lr
    blt .L_0214f86c
    mov r7, r1
    mov r8, r1
    b .L_0214f8dc
.L_0214f8ac:
    ldr r0, [r3, r8, lsl #0x2]
    cmp r0, #0x0
    blt .L_0214f8d8
    ldr r10, [r2, r0, lsl #0x2]
    cmp r10, #0x0
    bge .L_0214f8d8
    add r10, r9, r0
    ldrb r10, [r10, #0x16]
    cmp r6, r10
    streq r5, [r2, r0, lsl #0x2]
    addeq r7, r7, #0x1
.L_0214f8d8:
    add r8, r8, #0x1
.L_0214f8dc:
    cmp r8, lr
    blt .L_0214f8ac
    add r5, r5, r7
    sub r4, r4, r7
.L_0214f8ec:
    cmp r4, #0x0
    bgt .L_0214f860
    mov r6, #0x0
    ldr r4, .L_0214f938
    add r2, sp, #0x10
    b .L_0214f924
.L_0214f904:
    add r0, r9, r6
    ldrb r5, [r0, #0x16]
    add r3, r4, r6, lsl #0x1
    ldr r1, [r2, r6, lsl #0x2]
    add r0, r4, r6
    strh r5, [r3, #0x16]
    strb r1, [r0, #0xa]
    add r6, r6, #0x1
.L_0214f924:
    cmp r6, lr
    blt .L_0214f904
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0214f934: .word data_ov004_02161de8
.L_0214f938: .word data_020afedc
    arm_func_end func_ov004_0214f808

    .global func_ov004_0214f93c
    arm_func_start func_ov004_0214f93c
func_ov004_0214f93c: ; 0x0214f93c
    ldr r0, .L_0214f950
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    str r1, [r0, #0x1c]
    bx lr
.L_0214f950: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f93c

    .global func_ov004_0214f954
    arm_func_start func_ov004_0214f954
func_ov004_0214f954: ; 0x0214f954
    ldr r0, .L_0214f964
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x1c]
    bx lr
.L_0214f964: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f954

    .global func_ov004_0214f968
    arm_func_start func_ov004_0214f968
func_ov004_0214f968: ; 0x0214f968
    ldr r1, .L_0214f980
    ldr r2, [r1, #0x0]
    ldr r1, [r2, #0x1c]
    add r0, r1, r0
    str r0, [r2, #0x1c]
    bx lr
.L_0214f980: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f968

    .global func_ov004_0214f984
    arm_func_start func_ov004_0214f984
func_ov004_0214f984: ; 0x0214f984
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, .L_0214f9d4
    mov r5, #0x0
.L_0214f990:
    ldr r0, [r4, #0x0]
    add r0, r0, r5, lsl #0x2
    ldr r1, [r0, #0x20]
    cmp r1, #0x0
    ble .L_0214f9ac
    mov r0, r5
    blx func_02072870
.L_0214f9ac:
    add r5, r5, #0x1
    cmp r5, #0x6
    blt .L_0214f990
    ldr r0, .L_0214f9d4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x18
    add r0, r0, #0x20
    bl func_020517fc
    ldmia sp!, {r3, r4, r5, pc}
.L_0214f9d4: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f984

    .global func_ov004_0214f9d8
    arm_func_start func_ov004_0214f9d8
func_ov004_0214f9d8: ; 0x0214f9d8
    ldr r1, .L_0214f9ec
    ldr r1, [r1, #0x0]
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x20]
    bx lr
.L_0214f9ec: .word data_ov004_02161de8
    arm_func_end func_ov004_0214f9d8

    .global func_ov004_0214f9f0
    arm_func_start func_ov004_0214f9f0
func_ov004_0214f9f0: ; 0x0214f9f0
    stmdb sp!, {r4, lr}
    ldr r0, .L_0214fad4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x18
    add r0, r0, #0x20
    bl func_020517fc
    ldr r0, .L_0214fad4
    ldr r0, [r0, #0x0]
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bls .L_0214fa48
    bl func_ov004_0214f780
    ldr r1, .L_0214fad4
    add r2, r0, r0, lsl #0x2
    ldr r0, [r1, #0x0]
    str r2, [r0, #0x20]
    ldr r0, [r1, #0x0]
    str r2, [r0, #0x24]
    ldr r0, [r1, #0x0]
    str r2, [r0, #0x28]
    ldmia sp!, {r4, pc}
.L_0214fa48:
    bl func_ov004_0214f780
    ldr r1, .L_0214fad4
    add r3, r0, r0, lsl #0x2
    ldr r2, [r1, #0x0]
    ldr r0, .L_0214fad8
    str r3, [r2, #0x20]
    ldr r2, [r1, #0x0]
    str r3, [r2, #0x24]
    ldr r2, [r1, #0x0]
    str r3, [r2, #0x28]
    ldr r1, [r1, #0x0]
    ldrsb r1, [r1, #0xc]
    ldr r0, [r0, r1, lsl #0x2]
    and r4, r0, #0xff
    bl func_ov004_0214f780
    cmp r0, r4
    ldmneia sp!, {r4, pc}
    ldr r0, .L_0214fad4
    ldr r1, [r0, #0x0]
    ldrsb r0, [r1, #0xc]
    cmp r0, #0x0
    beq .L_0214fab0
    cmp r0, #0x1
    beq .L_0214fabc
    cmp r0, #0x2
    beq .L_0214fac8
.L_0214fab0:
    mov r0, #0x32
    str r0, [r1, #0x30]
    ldmia sp!, {r4, pc}
.L_0214fabc:
    mov r0, #0x32
    str r0, [r1, #0x2c]
    ldmia sp!, {r4, pc}
.L_0214fac8:
    mov r0, #0x32
    str r0, [r1, #0x34]
    ldmia sp!, {r4, pc}
.L_0214fad4: .word data_ov004_02161de8
.L_0214fad8: .word data_ov004_021603e4
    arm_func_end func_ov004_0214f9f0

    .global func_ov004_0214fadc
    arm_func_start func_ov004_0214fadc
func_ov004_0214fadc: ; 0x0214fadc
    stmdb sp!, {r4, lr}
    mov r2, r1
    mov r1, #0x0
    mov r4, r0
    bl func_020517fc
    bl func_020310f4
    ldr r2, .L_0214fb3c
    str r0, [r4, #0x0]
    ldr r1, .L_0214fb40
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_0214fb44
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r0, #0x0
    bl func_02028920
    str r0, [r4, #0x10]
    blx func_ov012_021b65bc
    ldr r0, [r4, #0x0]
    bl func_ov004_0214efb0
    ldmia sp!, {r4, pc}
.L_0214fb3c: .word data_02093c04
.L_0214fb40: .word data_020a0e80
.L_0214fb44: .word data_020a16c0
    arm_func_end func_ov004_0214fadc

    .global func_ov004_0214fb48
    arm_func_start func_ov004_0214fb48
func_ov004_0214fb48: ; 0x0214fb48
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_020735e4
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0214fb6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214fb6c:
    bl func_ov004_0214f29c
    mov r5, #0x0
.L_0214fb74:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_0214fb88
    bl func_02034d7c
.L_0214fb88:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0214fb74
    mov r5, #0x0
.L_0214fb98:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_0214fbb4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214fbb4:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0214fb98
    ldr r0, [r4, #0x0]
    bl func_ov004_0214f108
    blx func_ov012_021b65cc
    ldr r1, .L_0214fc04
    ldr r2, .L_0214fc08
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214fc0c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_0214fc04: .word data_02093c04
.L_0214fc08: .word data_020a16c0
.L_0214fc0c: .word data_020a0e80
    arm_func_end func_ov004_0214fb48

    .global func_ov004_0214fc10
    arm_func_start func_ov004_0214fc10
func_ov004_0214fc10: ; 0x0214fc10
    stmdb sp!, {r3, lr}
    mov r0, #0x2
    bl func_020734e0
    mov r0, #0x2
    mov r1, #0x0
    bl func_0207361c
    mov r0, #0x7c
    bl func_02073744
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214fc10

    .global func_ov004_0214fc34
    arm_func_start func_ov004_0214fc34
func_ov004_0214fc34: ; 0x0214fc34
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    beq .L_0214fc58
    mov r0, #0x30
    bl func_020734e0
    mov r0, #0x30
    mov r1, #0x0
    bl func_0207361c
    b .L_0214fc6c
.L_0214fc58:
    mov r0, #0x31
    bl func_020734e0
    mov r0, #0x31
    mov r1, #0x0
    bl func_0207361c
.L_0214fc6c:
    mov r0, #0x7c
    bl func_02073744
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214fc34

    .global func_ov004_0214fc78
    arm_func_start func_ov004_0214fc78
func_ov004_0214fc78: ; 0x0214fc78
    stmdb sp!, {r3, lr}
    mov r0, #0x7
    bl func_020734e0
    mov r0, #0x7c
    bl func_02073744
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214fc78

    .global func_ov004_0214fc90
    arm_func_start func_ov004_0214fc90
func_ov004_0214fc90: ; 0x0214fc90
    stmdb sp!, {r3, lr}
    mov r0, #0x7
    bl func_020734e0
    mov r0, #0x38
    bl func_020736b4
    mov r0, #0x7c
    bl func_02073744
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0214fc90

    .global func_ov004_0214fcb0
    arm_func_start func_ov004_0214fcb0
func_ov004_0214fcb0: ; 0x0214fcb0
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r1
    mov r5, r2
    ldr ip, .L_0214fd54
    mov r4, r3
    ldr r7, [r0, #0x4]
    ldr r1, .L_0214fd58
    ldr r2, .L_0214fd5c
    mov r0, #0x134
    mov r3, #0x3e
    ldr r8, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0214fcfc
    ldr r3, .L_0214fd60
    mov r1, r7
    mov r2, r8
    blx func_ov012_021af0f8
.L_0214fcfc:
    bl func_ov004_0214e3ec
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x28]
    mov r0, r7
    str r1, [sp, #0x0]
    ldrsh r3, [sp, #0x2c]
    mov r1, r6
    mov r2, r5
    str r3, [sp, #0x4]
    ldrsh r5, [sp, #0x30]
    mov r3, r4
    ldr r4, [sp, #0x34]
    str r5, [sp, #0x8]
    str r4, [sp, #0xc]
    bl func_ov004_0214fd64
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0214fd54: .word data_ov012_021d5154
.L_0214fd58: .word data_ov004_021608d4
.L_0214fd5c: .word data_ov004_02160af8
.L_0214fd60: .word func_ov004_0214e414
    arm_func_end func_ov004_0214fcb0

    .global func_ov004_0214fd64
    arm_func_start func_ov004_0214fd64
func_ov004_0214fd64: ; 0x0214fd64
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r4, r1
    mov r6, r2
    mov r10, r0
    mov r5, r3
    ldr r1, .L_021500d8
    ldr r2, .L_021500dc
    mov r0, #0x44
    mov r3, #0x54
    bl func_0201a21c
    mov r7, r0
    mov r1, #0x0
    mov r2, #0x44
    bl func_020517fc
    strb r6, [r7, #0x18]
    ldr r1, [sp, #0x40]
    str r5, [r7, #0x38]
    str r1, [r7, #0x3c]
    mvn r1, #0x0
    str r1, [r7, #0x40]
    ldrsh r0, [sp, #0x44]
    ldrsh r1, [sp, #0x48]
    cmp r7, #0x0
    strh r0, [r7, #0x1c]
    strh r1, [r7, #0x1e]
    ldr r0, [sp, #0x4c]
    ldr r1, .L_021500d8
    str r0, [r7, #0x24]
    movne r0, #0xa
    strne r0, [r7, #0x34]
    ldrsb r0, [r7, #0x18]
    ldr r2, .L_021500dc
    mov r3, #0x63
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    strb r0, [r7, #0x19]
    ldrsb r0, [r7, #0x19]
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r7, #0x8]
    ldrsb r2, [r7, #0x19]
    mov r1, #0x0
    mov r2, r2, lsl #0x2
    bl func_020517fc
    ldrsb r0, [r7, #0x18]
    ldr r1, .L_021500d8
    ldr r2, .L_021500dc
    mov r3, #0x66
    bl func_0201a21c
    str r0, [r7, #0xc]
    ldrsb r2, [r7, #0x18]
    mov r1, #0x0
    bl func_020517fc
    ldrsb r0, [r7, #0x18]
    ldr r1, .L_021500d8
    ldr r2, .L_021500dc
    mov r3, #0x69
    bl func_0201a21c
    str r0, [r7, #0x10]
    ldrsb r2, [r7, #0x18]
    mov r1, #0x0
    bl func_020517fc
    ldrsb r0, [r7, #0x19]
    ldr r1, .L_021500d8
    ldr r2, .L_021500dc
    mov r3, #0x6c
    mov r0, r0, lsl #0x2
    bl func_0201a21c
    str r0, [r7, #0x14]
    ldrsb r2, [r7, #0x19]
    mov r1, #0x0
    mov r2, r2, lsl #0x2
    bl func_020517fc
    str r10, [r7, #0x4]
    ldr r1, .L_021500e0
    ldr r0, .L_021500e4
    ldr r3, [r1, #0x0]
    ldr r4, [r4, #0x4]
    sub r3, r3, #0x1
    ldr r2, [r0, #0x0]
    str r3, [r1, #0x0]
    ldr r1, .L_021500e8
    str r4, [r0, #0x0]
    str r2, [r1, r3, lsl #0x2]
    ldrsb r0, [r7, #0x18]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_0214ffd8
    ldrsh r11, [sp, #0x48]
    ldrsh r8, [sp, #0x44]
    add r0, r11, r11, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    add r0, r8, r8, lsr #0x1f
    str r0, [sp, #0x8]
    b .L_0214ffcc
.L_0214feec:
    mul r1, r8, r5
    ldr r0, [sp, #0x8]
    mov r9, r5, lsl #0x1
    add r0, r1, r0, asr #0x1
    rsb r0, r0, #0x0
    str r0, [sp, #0x4]
    mov r6, #0x0
.L_0214ff08:
    ldr r0, [r7, #0x38]
    bl func_020329ec
    bl func_ov004_0214e3ec
    mov r4, r0
    ldr r0, [r7, #0x8]
    add r1, r6, r9
    add r0, r0, r9, lsl #0x2
    str r4, [r0, r6, lsl #0x2]
    ldr r0, [r4, #0x4]
    ldr r3, [r7, #0x14]
    ldr r2, [r0, #0x0]
    add r1, r3, r1, lsl #0x1
    ldr r2, [r2, #0x24]
    blx r2
    ldr r3, [sp, #0x0]
    ldr r2, [sp, #0x4]
    mla r3, r11, r6, r3
    mov r0, r7
    mov r1, r4
    bl func_ov004_02150308
    ldr r1, [r7, #0x24]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x14]
    add r1, sp, #0x14
    bl func_ov004_0214ea78
    ldr r3, [r7, #0x38]
    ldr r1, [r7, #0x3c]
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    orr r1, r3, r1
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r4
    mov r0, r10
    bl func_ov004_0214e478
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_0214ff08
    add r5, r5, #0x1
.L_0214ffcc:
    ldrsb r0, [r7, #0x18]
    cmp r5, r0
    blt .L_0214feec
.L_0214ffd8:
    ldr r0, [r7, #0x38]
    bl func_020329ec
    bl func_ov004_0214e3ec
    ldrsb r1, [r7, #0x18]
    mov r4, r0
    ldr r2, [r7, #0x8]
    mov r0, r1, lsl #0x1
    str r4, [r2, r0, lsl #0x2]
    ldr r0, [r4, #0x4]
    ldrsb r1, [r7, #0x18]
    ldr r2, [r0, #0x0]
    ldr r3, [r7, #0x14]
    ldr r2, [r2, #0x24]
    add r1, r3, r1, lsl #0x2
    blx r2
    mov r2, #0x0
    mov r0, r7
    mov r1, r4
    mov r3, r2
    bl func_ov004_02150308
    ldr r1, [r7, #0x24]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x10]
    add r1, sp, #0x10
    bl func_ov004_0214ea78
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r10
    mov r1, r4
    bl func_ov004_0214e478
    ldr r1, .L_021500e0
    ldr r2, .L_021500e8
    ldr r3, [r1, #0x0]
    ldr r0, .L_021500e4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bl func_02026f94
    str r0, [r7, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0xc]
    ldr r0, [r0, #0x4]
    add r1, sp, #0xc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r7, #0x0]
    ldr r1, .L_021500ec
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x0]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r7
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021500d8: .word data_ov004_02160b20
.L_021500dc: .word data_ov004_02160b00
.L_021500e0: .word data_02093c08
.L_021500e4: .word data_020a0dd0
.L_021500e8: .word data_020a16d0
.L_021500ec: .word func_ov004_02150ad4
    arm_func_end func_ov004_0214fd64

    .global func_ov004_021500f0
    arm_func_start func_ov004_021500f0
func_ov004_021500f0: ; 0x021500f0
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02150114
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02150114:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_02150124
    bl func_0201b268
.L_02150124:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02150134
    bl func_0201b268
.L_02150134:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02150144
    bl func_0201b268
.L_02150144:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_02150154
    bl func_0201b268
.L_02150154:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021500f0

    .global func_ov004_02150160
    arm_func_start func_ov004_02150160
func_ov004_02150160: ; 0x02150160
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    str r1, [r5, #0x40]
    ldrsb r1, [r5, #0x18]
    ldr r4, [r5, #0x8]
    ldrsh lr, [sp, #0x10]
    mov r1, r1, lsl #0x1
    ldr r4, [r4, r1, lsl #0x2]
    add r2, r2, r2, lsr #0x1f
    ldrsh ip, [sp, #0x14]
    add r3, r3, r3, lsr #0x1f
    mov r1, r4
    add r2, lr, r2, asr #0x1
    sub r3, ip, r3, asr #0x1
    bl func_ov004_02150308
    ldr r2, [r5, #0x38]
    ldr r1, [r5, #0x40]
    ldr r0, [r4, #0x4]
    orr r1, r2, r1
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
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_02150160

    .global func_ov004_021501e4
    arm_func_start func_ov004_021501e4
func_ov004_021501e4: ; 0x021501e4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    movs r5, r0
    beq .L_02150268
    strh r1, [r5, #0x20]
    strh r2, [r5, #0x22]
    mov r4, #0x0
    add r7, sp, #0x0
    add r6, sp, #0x4
    b .L_02150254
.L_0215020c:
    ldr r0, [r5, #0x8]
    ldrsh r3, [r5, #0x22]
    ldr r0, [r0, r4, lsl #0x2]
    mov r1, r7
    ldr ip, [r0, #0x4]
    mov r2, r6
    ldr lr, [ip, #0x10]
    ldrsh ip, [lr, #0x2]
    add r3, ip, r3
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    ldrsh ip, [lr, #0x0]
    ldrsh r3, [r5, #0x20]
    add r3, ip, r3
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    bl func_ov004_0214e1b8
    add r4, r4, #0x1
.L_02150254:
    ldrsb r0, [r5, #0x18]
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    cmp r4, r0
    blt .L_0215020c
.L_02150268:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov004_021501e4

    .global func_ov004_02150270
    arm_func_start func_ov004_02150270
func_ov004_02150270: ; 0x02150270
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrsb r2, [r0, #0x1a]
    cmp r2, #0x0
    beq .L_021502c0
    ldr r3, [r0, #0x2c]
    ldr r2, [r0, #0x28]
    str r1, [r0, #0x2c]
    cmp r3, r2
    ldmneia sp!, {r3, pc}
    ldr r2, [r0, #0x28]
    mov r1, #0x64
    mul r1, r2, r1
    str r1, [r0, #0x30]
    ldr r0, [r0, #0x0]
    ldr r1, .L_021502d0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, pc}
.L_021502c0:
    str r1, [r0, #0x28]
    str r1, [r0, #0x2c]
    bl func_ov004_021503b4
    ldmia sp!, {r3, pc}
.L_021502d0: .word func_ov004_02150ad8
    arm_func_end func_ov004_02150270

    .global func_ov004_021502d4
    arm_func_start func_ov004_021502d4
func_ov004_021502d4: ; 0x021502d4
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    str r1, [r0, #0x28]
    str r1, [r0, #0x2c]
    bl func_ov004_021503b4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021502d4

    .global func_ov004_021502f0
    arm_func_start func_ov004_021502f0
func_ov004_021502f0: ; 0x021502f0
    cmp r0, #0x0
    strne r1, [r0, #0x34]
    bx lr
    arm_func_end func_ov004_021502f0

    .global func_ov004_021502fc
    arm_func_start func_ov004_021502fc
func_ov004_021502fc: ; 0x021502fc
    cmp r0, #0x0
    strneb r1, [r0, #0x1a]
    bx lr
    arm_func_end func_ov004_021502fc

    .global func_ov004_02150308
    arm_func_start func_ov004_02150308
func_ov004_02150308: ; 0x02150308
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr ip, [r1, #0x4]
    ldr lr, [ip, #0x10]
    strh r2, [lr, #0x0]
    strh r3, [lr, #0x2]
    ldrsh ip, [lr, #0x2]
    ldrsh r3, [r0, #0x22]
    add r2, sp, #0x0
    add r3, ip, r3
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldrsh r3, [r0, #0x20]
    ldrsh ip, [lr, #0x0]
    mov r0, r1
    add r1, sp, #0x4
    add r3, ip, r3
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02150308

    .global func_ov004_02150360
    arm_func_start func_ov004_02150360
func_ov004_02150360: ; 0x02150360
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r3, [r1, #0x4]
    ldr lr, [r3, #0x10]
    strh r2, [lr, #0x2]
    ldrsh ip, [lr, #0x2]
    ldrsh r3, [r0, #0x22]
    add r2, sp, #0x0
    add r3, ip, r3
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x0]
    ldrsh r3, [r0, #0x20]
    ldrsh ip, [lr, #0x0]
    mov r0, r1
    add r1, sp, #0x4
    add r3, ip, r3
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02150360

    .global func_ov004_021503b4
    arm_func_start func_ov004_021503b4
func_ov004_021503b4: ; 0x021503b4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r1, [r10, #0x28]
    mov r6, #0x0
    bl func_ov004_02150a2c
    ldrsb r0, [r10, #0x18]
    mov r5, r6
    mov r11, #0x1
    sub r7, r0, #0x1
    mov r4, #0x1000
    b .L_021504c0
.L_021503e0:
    ldr r0, [r10, #0x8]
    mov r9, r7, lsl #0x1
    cmp r6, #0x0
    ldr r8, [r0, r9, lsl #0x2]
    ldreq r0, [r10, #0x10]
    ldreqsb r0, [r0, r7]
    cmpeq r0, #0x0
    bne .L_02150408
    cmp r7, #0x0
    bne .L_02150488
.L_02150408:
    ldrsh r2, [r10, #0x1e]
    mov r0, r10
    mov r1, r8
    rsb r2, r2, #0x0
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    bl func_ov004_02150360
    ldr r3, [r10, #0x10]
    ldr r6, [r10, #0x3c]
    ldrsb r3, [r3, r7]
    ldr r1, [r10, #0x38]
    ldr r0, [r8, #0x4]
    add r3, r6, r3
    mov r2, r5
    orr r1, r1, r3
    bl func_02023894
    ldr r0, [r8, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r8, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    add r1, sp, #0x0
    str r4, [sp, #0x0]
    bl func_ov004_021504cc
    mov r6, #0x1
    b .L_0215049c
.L_02150488:
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215049c:
    ldr r0, [r10, #0x8]
    mov r1, #0x0
    add r0, r0, r9, lsl #0x2
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    sub r7, r7, #0x1
.L_021504c0:
    cmp r7, #0x0
    bge .L_021503e0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov004_021503b4

    .global func_ov004_021504cc
    arm_func_start func_ov004_021504cc
func_ov004_021504cc: ; 0x021504cc
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020235dc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021504cc

    .global func_ov004_021504e8
    arm_func_start func_ov004_021504e8
func_ov004_021504e8: ; 0x021504e8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r9, r0
    ldrsb r3, [r9, #0x1a]
    mov r8, r1
    ldr r1, [r9, #0x8]
    mov r6, r8, lsl #0x1
    mov r7, r2
    cmp r3, #0x1
    ldr r4, [r1, r6, lsl #0x2]
    beq .L_02150528
    cmp r3, #0x2
    beq .L_02150658
    cmp r3, #0x3
    beq .L_02150700
    b .L_0215081c
.L_02150528:
    ldrsh r5, [r9, #0x1e]
    mov r1, #0x64
    mul r0, r5, r7
    bl func_0200d12c
    rsb r1, r5, #0x0
    add r1, r1, r1, lsr #0x1f
    add r2, r0, r1, asr #0x1
    mov r0, r9
    mov r1, r4
    sub r2, r2, r5
    bl func_ov004_02150360
    ldr r0, [r9, #0x10]
    mov r1, #0xa
    ldrsb r0, [r0, r8]
    add r0, r0, #0x1
    bl func_0200d12c
    ldr r3, [r9, #0x3c]
    ldr r5, [r9, #0x38]
    add r1, r3, r1
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    orr r1, r5, r1
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x1000
    str r0, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    bl func_ov004_021504cc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldrsh r5, [r9, #0x1e]
    ldr r1, [r9, #0x8]
    add r0, r6, #0x1
    ldr r4, [r1, r0, lsl #0x2]
    mul r0, r5, r7
    mov r1, #0x64
    bl func_0200d12c
    rsb r1, r5, #0x0
    add r1, r1, r1, lsr #0x1f
    add r2, r0, r1, asr #0x1
    mov r0, r9
    mov r1, r4
    bl func_ov004_02150360
    ldr r1, [r9, #0x10]
    ldr r3, [r9, #0x3c]
    ldrsb r1, [r1, r8]
    ldr r5, [r9, #0x38]
    ldr r0, [r4, #0x4]
    add r1, r3, r1
    mov r2, #0x0
    orr r1, r5, r1
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x1000
    str r0, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    bl func_ov004_021504cc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0215081c
.L_02150658:
    ldrsh r2, [r9, #0x1e]
    mov r1, r4
    rsb r2, r2, #0x0
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    bl func_ov004_02150360
    ldr r0, [r9, #0x10]
    mov r1, #0xa
    ldrsb r0, [r0, r8]
    add r0, r0, #0x1
    bl func_0200d12c
    ldr r0, [r9, #0x3c]
    ldr r2, [r9, #0x38]
    add r1, r0, r1
    orr r1, r2, r1
    ldr r0, [r4, #0x4]
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
    mov r1, #0x1000
    str r1, [sp, #0x4]
    mov r0, r4
    add r1, sp, #0x4
    bl func_ov004_021504cc
    ldr r1, [r9, #0x8]
    add r0, r6, #0x1
    ldr r0, [r1, r0, lsl #0x2]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0215081c
.L_02150700:
    ldrsh r2, [r9, #0x1e]
    mov r1, r4
    rsb r2, r2, #0x0
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    bl func_ov004_02150360
    ldr r0, [r9, #0x10]
    mov r1, #0xa
    ldrsb r0, [r0, r8]
    add r0, r0, #0x1
    bl func_0200d12c
    ldr r0, [r9, #0x3c]
    ldr r2, [r9, #0x38]
    add r1, r0, r1
    ldr r0, [r4, #0x4]
    orr r1, r2, r1
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
    mov r0, r7, lsl #0xe
    mov r1, #0x64
    bl func_0200d12c
    mov r0, r0, lsl #0x1
    bl func_0200c954
    mov r1, r0
    ldr r0, .L_02150824
    bl func_0200c9e4
    ldr r1, .L_02150828
    bl func_0200c5ac
    mov r1, r0
    ldr r0, .L_0215082c
    bl func_0200c9e4
    bl func_0200c8e0
    bl func_0200c954
    ldr r1, .L_0215082c
    bl func_0200c5ac
    bl func_0200c85c
    blx func_02009838
    bl func_0200b6c4
    mov r1, r0
    ldr r0, .L_0215082c
    bl func_0200c9e4
    bl func_0200c8e0
    mov r1, r0, asr #0x1f
    mov r1, r1, lsl #0xb
    mov r2, r0, lsl #0xb
    orr r1, r1, r0, lsr #0x15
    mov r0, r2, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    add r0, r0, #0x1000
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x0
    bl func_020235dc
    ldr r1, [r9, #0x8]
    add r0, r6, #0x1
    ldr r0, [r1, r0, lsl #0x2]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215081c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02150824: .word 0x40490fdb
.L_02150828: .word 0x47800000
.L_0215082c: .word 0x45800000
    arm_func_end func_ov004_021504e8

    .global func_ov004_02150830
    arm_func_start func_ov004_02150830
func_ov004_02150830: ; 0x02150830
    sub ip, r1, #0x1
    mov r3, #0x0
    b .L_02150850
.L_0215083c:
    ldr r2, [r0, #0x10]
    ldrsb r2, [r2, ip]
    sub ip, ip, #0x1
    cmp r2, #0x9
    addeq r3, r3, #0x1
.L_02150850:
    cmp ip, #0x0
    bge .L_0215083c
    cmp r3, #0x0
    ble .L_0215086c
    cmp r3, r1
    moveq r0, #0x1
    bxeq lr
.L_0215086c:
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_02150830

    .global func_ov004_02150874
    arm_func_start func_ov004_02150874
func_ov004_02150874: ; 0x02150874
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r4, [r10, #0x30]
    mov r1, #0x64
    mov r0, r4
    mov r5, #0x0
    bl func_0200d338
    mov r9, r1
    mov r0, r4
    mov r1, #0x64
    bl func_0200d338
    mov r1, r0
    mov r0, r10
    bl func_ov004_02150a2c
    ldrsb r0, [r10, #0x18]
    mov r11, r5
    mov r4, #0x1000
    sub r6, r0, #0x1
    b .L_02150a20
.L_021508c0:
    ldr r0, [r10, #0x8]
    mov r8, r6, lsl #0x1
    cmp r5, #0x0
    ldr r7, [r0, r8, lsl #0x2]
    ldreq r0, [r10, #0x10]
    ldreqsb r0, [r0, r6]
    cmpeq r0, #0x0
    bne .L_021508e8
    cmp r6, #0x0
    bne .L_021509b8
.L_021508e8:
    cmp r6, #0x0
    beq .L_02150904
    mov r0, r10
    mov r1, r6
    bl func_ov004_02150830
    cmp r0, #0x0
    beq .L_02150918
.L_02150904:
    mov r0, r10
    mov r1, r6
    mov r2, r9
    bl func_ov004_021504e8
    b .L_021509b0
.L_02150918:
    ldrsh r2, [r10, #0x1e]
    mov r0, r10
    mov r1, r7
    rsb r2, r2, #0x0
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    bl func_ov004_02150360
    ldr r3, [r10, #0x10]
    ldr r5, [r10, #0x3c]
    ldrsb r3, [r3, r6]
    ldr r1, [r10, #0x38]
    ldr r0, [r7, #0x4]
    add r3, r5, r3
    mov r2, r11
    orr r1, r1, r3
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r7
    str r4, [sp, #0x0]
    add r1, sp, #0x0
    bl func_ov004_021504cc
    ldr r0, [r10, #0x8]
    mov r1, #0x0
    add r0, r0, r8, lsl #0x2
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_021509b0:
    mov r5, #0x1
    b .L_02150a1c
.L_021509b8:
    ble .L_021509e8
    mov r0, r10
    mov r1, r6
    bl func_ov004_02150830
    cmp r0, #0x0
    beq .L_021509e8
    mov r0, r10
    mov r1, r6
    mov r2, r9
    bl func_ov004_021504e8
    mov r5, #0x1
    b .L_021509fc
.L_021509e8:
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_021509fc:
    ldr r0, [r10, #0x8]
    mov r1, #0x0
    add r0, r0, r8, lsl #0x2
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02150a1c:
    sub r6, r6, #0x1
.L_02150a20:
    cmp r6, #0x0
    bge .L_021508c0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov004_02150874

    .global func_ov004_02150a2c
    arm_func_start func_ov004_02150a2c
func_ov004_02150a2c: ; 0x02150a2c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    mov r4, #0x1
    mov r6, r1
    mov r2, r4
    ldrsb r3, [r7, #0x18]
    mov r1, #0xa
    b .L_02150a58
.L_02150a4c:
    mul r0, r4, r1
    mov r4, r0
    add r2, r2, #0x1
.L_02150a58:
    cmp r2, r3
    blt .L_02150a4c
    mov r0, #0xa
    mul r0, r4, r0
    cmp r6, r0
    subhi r6, r0, #0x1
    mov r5, #0x0
    mov r8, #0xa
    b .L_02150ab8
.L_02150a7c:
    mov r0, r6
    mov r1, r4
    bl func_0200d338
    ldr r2, [r7, #0x10]
    sub r1, r9, r5
    strb r0, [r2, r1]
    mov r0, r6
    mov r1, r4
    bl func_0200d338
    mov r6, r1
    mov r0, r4
    mov r1, r8
    bl func_0200d338
    mov r4, r0
    add r5, r5, #0x1
.L_02150ab8:
    ldrsb r0, [r7, #0x18]
    sub r9, r0, #0x1
    cmp r5, r9
    blt .L_02150a7c
    ldr r0, [r7, #0x10]
    strb r6, [r0, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    arm_func_end func_ov004_02150a2c

    .global func_ov004_02150ad4
    arm_func_start func_ov004_02150ad4
func_ov004_02150ad4: ; 0x02150ad4
    bx lr
    arm_func_end func_ov004_02150ad4

    .global func_ov004_02150ad8
    arm_func_start func_ov004_02150ad8
func_ov004_02150ad8: ; 0x02150ad8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x64
    ldr r0, [r0, #0x10]
    ldr lr, [r0, #0x2c]
    ldr r3, [r0, #0x30]
    mul ip, lr, r1
    cmp r3, ip
    bls .L_02150b38
    ldr r2, [r0, #0x34]
    add r1, r2, ip
    cmp r3, r1
    bhi .L_02150b28
    str lr, [r0, #0x28]
    bl func_ov004_021503b4
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150b90
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02150b28:
    sub r1, r3, r2
    str r1, [r0, #0x30]
    bl func_ov004_02150874
    ldmia sp!, {r4, pc}
.L_02150b38:
    bhs .L_02150b78
    ldr r2, [r0, #0x34]
    add r3, r3, r2
    str r3, [r0, #0x30]
    ldr r2, [r0, #0x2c]
    mul r1, r2, r1
    cmp r3, r1
    blo .L_02150b70
    str r2, [r0, #0x28]
    bl func_ov004_021503b4
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150b90
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02150b70:
    bl func_ov004_02150874
    ldmia sp!, {r4, pc}
.L_02150b78:
    str lr, [r0, #0x28]
    bl func_ov004_021503b4
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150b90
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02150b90: .word func_ov004_02150ad4
    arm_func_end func_ov004_02150ad8

    .global func_ov004_02150b94
    arm_func_start func_ov004_02150b94
func_ov004_02150b94: ; 0x02150b94
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r5, r0
    mov r4, r1
    mov r7, r2
    ldr r1, .L_02150d58
    mov r0, #0x4c
    mov r6, r3
    ldr r2, .L_02150d5c
    mov r3, r0
    bl func_0201a21c
    mov r10, r0
    mov r1, #0x0
    mov r2, #0x4c
    bl func_020517fc
    str r7, [r10, #0x3c]
    ldr r1, [sp, #0x28]
    str r6, [r10, #0x40]
    str r1, [r10, #0x44]
    ldr r0, [sp, #0x2c]
    mov r8, #0x0
    str r0, [r10, #0x48]
    ldr r1, [sp, #0x3c]
    ldrsh r0, [sp, #0x30]
    str r1, [r10, #0x34]
    ldrsh r1, [sp, #0x34]
    strh r0, [r10, #0x28]
    ldrsh r0, [sp, #0x38]
    strh r1, [r10, #0x2a]
    ldr r1, .L_02150d60
    strh r0, [r10, #0x2c]
    str r5, [r10, #0x4]
    ldr r0, .L_02150d64
    ldr r2, [r1, #0x0]
    ldr r6, [r4, #0x4]
    sub r4, r2, #0x1
    ldr r3, [r0, #0x0]
    ldr r2, .L_02150d68
    str r6, [r0, #0x0]
    str r4, [r1, #0x0]
    str r3, [r2, r4, lsl #0x2]
    ldr r4, [r10, #0x44]
    mov r11, r8
    cmp r4, #0x0
    ldrlt r4, [r10, #0x40]
    mov r6, r8
    add r7, sp, #0x0
.L_02150c4c:
    ldr r0, [r10, #0x3c]
    bl func_020329ec
    bl func_ov004_0214e3ec
    mov r9, r0
    add r0, r10, r8, lsl #0x2
    str r9, [r0, #0x8]
    ldr r0, [r10, #0x34]
    ldr r1, [r9, #0x4]
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x64]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    cmp r8, #0x2
    cmpne r8, #0x5
    bne .L_02150cb0
    ldr r3, [r10, #0x3c]
    ldr r1, [r10, #0x48]
    ldr r0, [r9, #0x4]
    mov r2, r6
    orr r1, r3, r1
    bl func_02023894
    b .L_02150cc4
.L_02150cb0:
    ldr r1, [r10, #0x3c]
    ldr r0, [r9, #0x4]
    mov r2, r11
    orr r1, r1, r4
    bl func_02023894
.L_02150cc4:
    ldr r0, [r9, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r9, [r9, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r9
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_02150c4c
    mov r1, #0x0
    mov r0, r10
    mov r2, r1
    bl func_ov004_02150d9c
    ldr r2, .L_02150d60
    ldr r0, .L_02150d68
    ldr r4, [r2, #0x0]
    ldr r1, .L_02150d64
    ldr r3, [r0, r4, lsl #0x2]
    add r4, r4, #0x1
    mov r0, r10
    str r4, [r2, #0x0]
    str r3, [r1, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02150d58: .word data_ov004_02160b54
.L_02150d5c: .word data_ov004_02160b38
.L_02150d60: .word data_02093c08
.L_02150d64: .word data_020a0dd0
.L_02150d68: .word data_020a16d0
    arm_func_end func_ov004_02150b94

    .global func_ov004_02150d6c
    arm_func_start func_ov004_02150d6c
func_ov004_02150d6c: ; 0x02150d6c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02150d90
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02150d90:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02150d6c

    .global func_ov004_02150d9c
    arm_func_start func_ov004_02150d9c
func_ov004_02150d9c: ; 0x02150d9c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    movs r9, r0
    mov r8, r1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    strh r8, [r9, #0x2e]
    strh r2, [r9, #0x30]
    ldrsh r2, [r9, #0x28]
    mov r0, #0x6
    ldrsh r1, [r9, #0x2a]
    smulbb r0, r2, r0
    ldrsh r4, [r9, #0x2e]
    ldrsh r3, [r9, #0x2c]
    ldrsh r2, [r9, #0x30]
    sub r4, r4, r0
    add r0, r1, r1, lsr #0x1f
    sub r1, r2, r0, asr #0x1
    sub r3, r4, r3, lsl #0x1
    mov r0, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r8, r0, asr #0x10
    mov r7, r1, asr #0x4
    mov r5, #0x0
.L_02150df4:
    add r0, r9, r5, lsl #0x2
    cmp r5, #0x2
    ldr r1, [r0, #0x8]
    cmpne r5, #0x5
    ldreqsh r0, [r9, #0x2c]
    ldr r1, [r1, #0x4]
    addeq r0, r0, r0, lsr #0x1f
    moveq r0, r0, lsl #0xf
    moveq r4, r0, asr #0x10
    ldrnesh r0, [r9, #0x28]
    ldr r6, [r1, #0x50]
    addne r0, r0, r0, lsr #0x1f
    movne r0, r0, lsl #0xf
    movne r4, r0, asr #0x10
    add r0, r8, r4
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
    mov r0, r8, lsl #0xc
    str r0, [r6, #0xc]
    str r7, [r6, #0x10]
    ldrb r0, [r6, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_02150e64
    mov r0, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_02150e64:
    ldrb r1, [r6, #0x24]
    add r0, r8, r4
    mov r0, r0, lsl #0x10
    orr r1, r1, #0x31
    add r5, r5, #0x1
    strb r1, [r6, #0x24]
    cmp r5, #0x8
    mov r8, r0, asr #0x10
    blt .L_02150df4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    arm_func_end func_ov004_02150d9c

    .global func_ov004_02150e8c
    arm_func_start func_ov004_02150e8c
func_ov004_02150e8c: ; 0x02150e8c
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r0
    mov r6, r1
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    bne .L_02150ef4
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    blt .L_02150ef4
    mov r6, #0x0
    mov r5, r6
.L_02150eb8:
    add r0, r4, r6, lsl #0x2
    cmp r6, #0x2
    ldr r0, [r0, #0x8]
    cmpne r6, #0x5
    beq .L_02150ee4
    ldr r3, [r4, #0x3c]
    ldr r1, [r4, #0x44]
    ldr r0, [r0, #0x4]
    mov r2, r5
    orr r1, r3, r1
    bl func_02023894
.L_02150ee4:
    add r6, r6, #0x1
    cmp r6, #0x8
    blt .L_02150eb8
    ldmia sp!, {r4, r5, r6, pc}
.L_02150ef4:
    mov r0, r6
    mov r1, #0xe10
    bl func_0200d338
    mov r5, r0
    mov r0, r6
    mov r1, #0xe10
    bl func_0200d338
    mov r6, r1
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_ov004_02150f70
    mov r0, r6
    mov r1, #0x3c
    bl func_0200d338
    mov r2, r0
    mov r0, r4
    mov r1, #0x3
    bl func_ov004_02150f70
    mov r0, r6
    mov r1, #0x3c
    bl func_0200d338
    mov r0, #0x64
    mul r0, r1, r0
    mov r1, #0x3c
    bl func_0200d338
    mov r2, r0
    mov r0, r4
    mov r1, #0x6
    bl func_ov004_02150f70
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov004_02150e8c

    .global func_ov004_02150f70
    arm_func_start func_ov004_02150f70
func_ov004_02150f70: ; 0x02150f70
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    cmp r4, #0x63
    mov r5, r1
    movhi r4, #0x63
    mov r6, r0
    mov r0, r4
    mov r1, #0xa
    bl func_0200d338
    add r1, r6, r5, lsl #0x2
    ldr r3, [r1, #0x8]
    ldr r1, [r6, #0x40]
    ldr r2, [r6, #0x3c]
    add r1, r1, r0
    orr r1, r2, r1
    ldr r0, [r3, #0x4]
    mov r2, #0x0
    bl func_02023894
    mov r0, r4
    mov r1, #0xa
    bl func_0200d338
    add r0, r5, #0x1
    add r0, r6, r0, lsl #0x2
    ldr r3, [r0, #0x8]
    ldr r0, [r6, #0x40]
    ldr r2, [r6, #0x3c]
    add r1, r0, r1
    orr r1, r2, r1
    ldr r0, [r3, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov004_02150f70

    .global func_ov004_02150ff0
    arm_func_start func_ov004_02150ff0
func_ov004_02150ff0: ; 0x02150ff0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xcc
    ldr r1, .L_02151cf0
    mov r4, r0
    ldr r2, .L_02151cf4
    mov r0, #0xcc
    mov r3, #0xae
    bl func_0201a21c
    mov r1, #0xcc
    mov r8, r0
    bl func_ov004_0214fadc
    bl func_ov004_0214fc10
    cmp r4, #0x0
    moveq r4, #0x1
    str r4, [r8, #0xb8]
    blx func_ov012_021b65bc
    mov r0, #0x20
    mov r1, #0x40
    mov r2, #0x2000
    bl func_ov004_0214d208
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r8, #0x8]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_02151cf8
    ldr r1, .L_02151cfc
    bl func_ov004_0214e880
    str r0, [r8, #0x14]
    ldr r0, .L_02151d00
    mov r1, #0x0
    blx func_020101f4
    str r0, [r8, #0x24]
    ldr r0, .L_02151d04
    mov r1, #0x0
    blx func_020101f4
    str r0, [r8, #0x28]
    ldr r1, .L_02151d08
    ldr r2, .L_02151d0c
    ldr r3, .L_02151d10
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_021510c0
    ldr r1, .L_02151d14
    ldr r2, .L_02151d18
    ldr r3, .L_02151d1c
    blx func_ov012_021af26c
    mov r4, r0
.L_021510c0:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_021510dc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021510dc:
    ldr r4, [r4, #0x18]
    mov r1, #0x0
    ldr r6, [r4, #0x4]
    mov r0, #0x10
    mov r2, r4
    mov r3, r1
    strh r0, [r6, #0xbc]
    mov r5, #0x3
    mov r0, #0x1
    strh r5, [r6, #0xbe]
    blx func_ov012_021b3b7c
    ldr r2, .L_02151d20
    mov r3, #0x1
    ldr r1, .L_02151d24
    mov r0, r4
    str r3, [r2, #0x0]
    bl func_ov004_02151d90
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_02151140
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_02151140:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0215115c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215115c:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x11
    mov r2, #0x2
    mov r3, #0x5
    bl func_0206ad90
    mov r2, r0
    str r0, [r8, #0xbc]
    mov r1, #0x0
    strh r1, [r2, #0x18]
    ldr r0, .L_02151d28
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
    ldr r0, [r8, #0x8]
    bl func_ov004_0214e4b0
    str r0, [r8, #0x44]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    bl func_0203b404
    ldr r3, [r0, #0x88]
    ldr r0, [r8, #0x8]
    mov r1, #0x810000
    mov r2, #0x0
    bl func_ov004_0214e4e8
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    ldr r0, [r8, #0x8]
    bl func_ov004_0214e548
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02151d2c
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    str r4, [r8, #0x6c]
    ldr r0, [r8, #0x8]
    bl func_ov004_0214e4b0
    mov r1, r0
    mov r0, r8
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r8, #0x48]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_02151d30
    add r0, sp, #0x28
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_02151d34
    add r0, sp, #0x30
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0xc0000
    rsb r0, r0, #0x0
    str r0, [sp, #0x3c]
    mov r0, #0x0
    str r0, [sp, #0x38]
    mov r0, r4
    add r1, sp, #0x38
    add r2, sp, #0x3c
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x30]
    ldr r3, [sp, #0x34]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x8000
    str r0, [sp, #0x44]
    mov r0, #0x0
    str r0, [sp, #0x40]
    mov r0, r4
    add r1, sp, #0x40
    add r2, sp, #0x44
    bl func_ov004_0214e1b8
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
    ldr r2, .L_02151d38
    ldr r3, [sp, #0x2c]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    ldr r2, .L_02151d3c
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r3, .L_02151d20
    ldr r1, .L_02151d40
    ldr r2, .L_02151d44
    mov r0, #0x134
    ldr r5, [r3, #0x0]
    ldr r4, [r4, #0x4]
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021513ac
    ldr r3, .L_02151d48
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_021513ac:
    bl func_ov004_0214e3ec
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r8, #0x14]
    mov r0, r4
    bl func_ov004_0214e478
    mov r0, #0x0
    str r0, [sp, #0xc4]
    str r0, [sp, #0xc8]
    bl func_0203b404
    mov r1, #0x70
    str r1, [sp, #0x0]
    add r1, sp, #0xc4
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r0, [r8, #0x48]
    mov r2, #0x810000
    mov r3, #0x1
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_02151d30
    add r0, sp, #0xbc
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_02151d34
    add r0, sp, #0xb4
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x19000
    str r0, [sp, #0xa4]
    mov r0, #0x148000
    str r0, [sp, #0xa8]
    mov r0, r4
    add r1, sp, #0xa8
    add r2, sp, #0xa4
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xbc]
    ldr r3, [sp, #0xc0]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xb4]
    ldr r3, [sp, #0xb8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xb4]
    ldr r3, [sp, #0xb8]
    mov r2, #0x8
    bl func_02023c60
    mov r2, #0x19000
    mov r0, #0x88000
    str r2, [sp, #0x9c]
    str r0, [sp, #0xa0]
    add r1, sp, #0xa0
    add r2, sp, #0x9c
    mov r0, r4
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xbc]
    ldr r3, [sp, #0xc0]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xbc]
    ldr r2, .L_02151d38
    ldr r3, [sp, #0xc0]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r1, [r8, #0x48]
    mov r0, r8
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r8, #0x4c]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_02151d34
    add r0, sp, #0xac
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xac]
    ldr r3, [sp, #0xb0]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    mov r11, #0x10000
    mov r9, #0x0
    add r4, r8, #0xc0
    rsb r11, r11, #0x0
.L_021515f4:
    mov r0, #0x50
    mul r0, r9, r0
    add r0, r0, #0x30
    str r0, [sp, #0x1c]
    ldr r5, [r8, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x48]
    str r0, [sp, #0x4c]
    bl func_0203b404
    mov r1, #0x70
    str r1, [sp, #0x0]
    add r1, sp, #0x48
    str r1, [sp, #0x4]
    mov r1, r0
    ldr r1, [r1, #0x88]
    mov r0, r5
    mov r2, #0x810000
    add r3, r9, #0x2
    bl func_ov004_0214ee60
    mov r7, r0
    ldr r1, [r7, #0x4]
    add r2, r9, #0x40
    str r2, [r1, #0x124]
    add r0, r8, r9, lsl #0x2
    str r7, [r0, #0x70]
    ldr r1, .L_02151d4c
    ldr r2, .L_02151d50
    ldr r3, .L_02151d54
    mov r0, #0x70
    bl func_0201a21c
    movs r5, r0
    beq .L_0215169c
    ldr r2, .L_02151d58
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r0, .L_02151d5c
    ldr r1, .L_02151d60
    str r0, [r5, #0x0]
    add r0, r5, #0x68
    bl func_ov004_0214e6d0
    ldr r0, .L_02151d64
    str r0, [r5, #0x0]
.L_0215169c:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_021516b8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021516b8:
    ldr r1, [r5, #0x18]
    mov r0, r7
    bl func_02020e98
    ldr r0, .L_02151d60
    ldrsh r1, [r0, #0x2]
    ldrsh r0, [r0, #0x6]
    cmp r0, r1
    subgt r2, r0, r1
    suble r2, r1, r0
    ldr r0, .L_02151d60
    ldrsh r1, [r0, #0x0]
    ldrsh r0, [r0, #0x4]
    cmp r0, r1
    subgt r1, r0, r1
    suble r1, r1, r0
    ldr r0, [r7, #0x4]
    blx func_ov012_021b5900
    ldr r0, [r7, #0x4]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r2, .L_02151d68
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r7, #0x4]
    mov r2, #0x5
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, .L_02151d6c
    ldr r2, [r7, #0x4]
    add r1, r0, r9, lsl #0x1
    mov r0, #0x1
    strb r0, [r2, #0xb1]
    ldr r0, .L_02151d6c
    ldr r3, [r7, #0x4]
    add r2, r0, r9
    ldr r0, .L_02151d70
    add r1, r1, #0x7300
    str r0, [r3, #0xec]
    add r0, r2, #0x7000
    ldrb r6, [r0, #0x39c]
    add r0, r8, r9, lsl #0x2
    ldrh r10, [r1, #0xa0]
    ldr r5, [r0, #0x70]
    bl func_0203b404
    mov r1, #0x13
    str r1, [sp, #0x0]
    mov r1, #0x11
    str r1, [sp, #0x4]
    mov r1, #0x8
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    mov r1, #0x4
    str r1, [sp, #0x10]
    mov r1, #0x6f
    str r1, [sp, #0x14]
    ldr r1, [r0, #0x88]
    mov r0, r5
    mov r2, #0x810000
    mov r3, #0x6
    bl func_ov004_02150b94
    str r0, [r4, r9, lsl #0x2]
    mov r1, #0x1c
    mov r2, #0x3d
    bl func_ov004_02150d9c
    ldr r0, [r4, r9, lsl #0x2]
    mov r1, r10
    bl func_ov004_02150e8c
    bl func_0203b404
    ldr r2, [r0, #0x88]
    ldr r0, .L_02151d74
    ldr r1, [r0, #0x0]
    ldr r0, [r2, #0x4]
    sub r3, r1, #0x1
    ldr r1, .L_02151d74
    str r3, [r1, #0x0]
    ldr r1, .L_02151d78
    ldr r2, [r1, #0x0]
    ldr r1, .L_02151d7c
    str r2, [r1, r3, lsl #0x2]
    ldr r1, .L_02151d78
    str r0, [r1, #0x0]
    mov r0, r9
    bl func_ov004_0214f554
    cmp r6, r0
    ldreq r0, .L_02151d80
    streq r0, [sp, #0x18]
    ldrne r0, .L_02151d28
    strne r0, [sp, #0x18]
    cmp r6, #0x0
    moveq r0, #0x13
    streq r0, [sp, #0x20]
    moveq r6, r0
    beq .L_0215185c
    mov r0, r6
    mov r1, #0xa
    bl func_0200d12c
    add r0, r0, #0x6
    str r0, [sp, #0x20]
    mov r0, r6
    mov r1, #0xa
    bl func_0200d12c
    add r6, r1, #0x6
.L_0215185c:
    mov r0, #0x810000
    bl func_020329ec
    bl func_ov004_0214e3ec
    mov r10, r0
    mov r0, r5
    mov r1, r10
    bl func_ov004_0214e478
    mov r0, #0x2e000
    str r0, [sp, #0x94]
    mov r0, #0x0
    str r0, [sp, #0x98]
    mov r0, r10
    add r1, sp, #0x98
    add r2, sp, #0x94
    bl func_ov004_0214e1b8
    ldr r0, [r10, #0x4]
    ldr r1, [sp, #0x18]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x104]
    blx r2
    mov r0, #0x6f000
    str r0, [sp, #0x90]
    mov r0, r10
    add r1, sp, #0x90
    bl func_ov004_0214ea78
    ldr r0, [sp, #0x20]
    mov r2, #0x0
    orr r1, r0, #0x810000
    ldr r0, [r10, #0x4]
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
    mov r0, #0x810000
    bl func_020329ec
    bl func_ov004_0214e3ec
    mov r10, r0
    mov r0, r5
    mov r1, r10
    bl func_ov004_0214e478
    mov r0, #0x2e000
    str r0, [sp, #0x88]
    mov r0, #0x8000
    str r0, [sp, #0x8c]
    mov r0, r10
    add r1, sp, #0x8c
    add r2, sp, #0x88
    bl func_ov004_0214e1b8
    ldr r0, [r10, #0x4]
    ldr r1, [sp, #0x18]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x104]
    blx r2
    mov r0, #0x6f000
    str r0, [sp, #0x84]
    mov r0, r10
    add r1, sp, #0x84
    bl func_ov004_0214ea78
    ldr r0, [r10, #0x4]
    orr r1, r6, #0x810000
    mov r2, #0x0
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
    mov r0, #0x810000
    bl func_020329ec
    bl func_ov004_0214e3ec
    mov r6, r0
    mov r0, r5
    mov r1, r6
    bl func_ov004_0214e478
    mov r0, #0x2e000
    str r0, [sp, #0x7c]
    mov r0, #0x10000
    str r0, [sp, #0x80]
    mov r0, r6
    add r1, sp, #0x80
    add r2, sp, #0x7c
    bl func_ov004_0214e1b8
    ldr r0, [r6, #0x4]
    ldr r1, [sp, #0x18]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x104]
    blx r2
    mov r0, #0x6f000
    str r0, [sp, #0x78]
    mov r0, r6
    add r1, sp, #0x78
    bl func_ov004_0214ea78
    ldr r0, [r6, #0x4]
    ldr r1, .L_02151d84
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_02151d74
    ldr r2, [r0, #0x0]
    add r1, r2, #0x1
    str r1, [r0, #0x0]
    ldr r0, .L_02151d7c
    ldr r1, [r0, r2, lsl #0x2]
    ldr r0, .L_02151d78
    str r1, [r0, #0x0]
    bl func_ov004_0214f5b4
    cmp r9, r0
    bne .L_02151ab8
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x810000
    mov r2, #0x12
    mov r3, #0x6f
    bl func_ov004_0214e9f0
    mov r1, #0x2b000
    str r1, [sp, #0x70]
    str r11, [sp, #0x74]
    mov r6, r0
    add r1, sp, #0x74
    add r2, sp, #0x70
    bl func_ov004_0214e1b8
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r5
    mov r1, r6
    bl func_ov004_0214e478
    bl func_ov004_0214f59c
.L_02151ab8:
    ldr r0, [r7, #0x4]
    bl func_02023940
    ldr r2, .L_02151d30
    add r0, sp, #0x50
    mov r1, r7
    bl func_ov004_02151ebc
    ldr r2, .L_02151d34
    add r0, sp, #0x58
    mov r1, r7
    bl func_ov004_02151ebc
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x61000
    str r0, [sp, #0x64]
    mov r0, #0x128000
    str r0, [sp, #0x60]
    mov r0, r7
    add r1, sp, #0x60
    add r2, sp, #0x64
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r5, r9, lsl #0x3
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    add r2, r5, #0x10
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    add r2, r5, #0x10
    bl func_02023c60
    ldr r0, [sp, #0x1c]
    add r1, sp, #0x68
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x68]
    mov r0, #0x61000
    str r0, [sp, #0x6c]
    mov r0, r7
    add r2, sp, #0x6c
    bl func_ov004_0214e1b8
    add r2, r9, #0x1
    mov r2, r2, lsl #0x3
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r3, [sp, #0x54]
    add r2, r2, #0x10
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x50]
    ldr r2, .L_02151d38
    ldr r3, [sp, #0x54]
    bl func_02023c80
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_021515f4
    ldr r0, [r8, #0x70]
    ldr r2, .L_02151d88
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    blx func_ov012_021b6760
    mov r2, #0x1
    sub r3, r2, #0x2
    mov r0, #0x12
    mov r1, #0x2
    blx func_ov012_021bcf1c
    str r0, [r8, #0xb0]
    ldr r1, [r8, #0xb8]
    mov r2, #0x0
    add r1, r1, #0x3d
    blx func_ov012_021bd730
    bl func_02026f94
    str r0, [r8, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x24]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x24
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r1, .L_02151d8c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r8, #0x4]
    mov r1, r8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r8, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r8, #0xb8]
    mov r1, #0x1
    add r0, r0, #0x2
    add r0, r8, r0, lsl #0x2
    ldr r0, [r0, #0x64]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r8, #0x48]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r8, #0x0]
    add sp, sp, #0xcc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02151cf0: .word data_ov004_02160c1c
.L_02151cf4: .word data_ov004_02160bfc
.L_02151cf8: .word data_ov004_02160c2c
.L_02151cfc: .word data_ov004_02160c3c
.L_02151d00: .word data_ov004_02160c4c
.L_02151d04: .word data_ov004_02160c60
.L_02151d08: .word data_ov004_02160c0c
.L_02151d0c: .word data_ov004_02160b78
.L_02151d10: .word 0x1de
.L_02151d14: .word func_ov004_02151db8
.L_02151d18: .word func_ov004_02151e04
.L_02151d1c: .word func_ov004_02151eb8
.L_02151d20: .word data_ov012_021d5154
.L_02151d24: .word 0x31305053
.L_02151d28: .word 0x7fff
.L_02151d2c: .word func_ov004_02151f0c
.L_02151d30: .word data_ov004_02160c78
.L_02151d34: .word data_ov004_02160c84
.L_02151d38: .word 0x494c
.L_02151d3c: .word func_ov004_02151f8c
.L_02151d40: .word data_ov004_021608d4
.L_02151d44: .word data_ov004_02160b68
.L_02151d48: .word func_ov004_0214e414
.L_02151d4c: .word data_ov004_021608f4
.L_02151d50: .word data_ov004_02160b70
.L_02151d54: .word 0x1b2
.L_02151d58: .word data_02093c8c
.L_02151d5c: .word data_ov004_0216094c
.L_02151d60: .word data_ov004_02160b80
.L_02151d64: .word data_ov012_021d1c58
.L_02151d68: .word func_ov004_02151ff8
.L_02151d6c: .word data_020b02b8
.L_02151d70: .word func_ov004_02151f9c
.L_02151d74: .word data_02093c08
.L_02151d78: .word data_020a0dd0
.L_02151d7c: .word data_020a16d0
.L_02151d80: .word 0x1b5f
.L_02151d84: .word 0x810010
.L_02151d88: .word func_ov004_02151f90
.L_02151d8c: .word func_ov004_021520dc
    arm_func_end func_ov004_02150ff0

    .global func_ov004_02151d90
    arm_func_start func_ov004_02151d90
func_ov004_02151d90: ; 0x02151d90
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov004_0214e3ec
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02151d90

    .global func_ov004_02151db8
    arm_func_start func_ov004_02151db8
func_ov004_02151db8: ; 0x02151db8
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x810000
    mov r2, #0x5
    mov r3, #0x70
    bl func_ov004_0214e9f0
    mov r1, r0
    mov r0, r4
    bl func_ov004_0214e478
    mov r2, #0x70000
    add r1, sp, #0x0
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov004_0214ea78
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
    arm_func_end func_ov004_02151db8

    .global func_ov004_02151e04
    arm_func_start func_ov004_02151e04
func_ov004_02151e04: ; 0x02151e04
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, .L_02151eac
    mov r5, r0
    ldr r4, [r5, #0x4]
    bl func_ov004_02151d90
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x94]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02151e48
    bl func_ov004_0214e3ec
.L_02151e48:
    ldr r0, [r0, #0x4]
    ldrb r0, [r0, #0xa8]
    cmp r0, #0x0
    bne .L_02151e7c
    ldr r1, .L_02151eb0
    ldr r0, .L_02151eb4
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    cmp r1, r0
    bhi .L_02151e7c
    mov r0, #0x78
    mov r1, #0x3
    bl func_0207342c
.L_02151e7c:
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r0, r5
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02151eac: .word 0x31305053
.L_02151eb0: .word data_ov012_021d5160
.L_02151eb4: .word data_02093c24
    arm_func_end func_ov004_02151e04

    .global func_ov004_02151eb8
    arm_func_start func_ov004_02151eb8
func_ov004_02151eb8: ; 0x02151eb8
    bx lr
    arm_func_end func_ov004_02151eb8

    .global func_ov004_02151ebc
    arm_func_start func_ov004_02151ebc
func_ov004_02151ebc: ; 0x02151ebc
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
    arm_func_end func_ov004_02151ebc

    .global func_ov004_02151f0c
    arm_func_start func_ov004_02151f0c
func_ov004_02151f0c: ; 0x02151f0c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02151f84
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x1
    bl func_0207342c
    bl func_ov004_0214ce64
    mov r1, #0xa
    bl func_ov004_0214ce74
    blx func_ov012_021b65bc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02151f88
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02151f84: .word 0x80011001
.L_02151f88: .word func_ov004_02152110
    arm_func_end func_ov004_02151f0c

    .global func_ov004_02151f8c
    arm_func_start func_ov004_02151f8c
func_ov004_02151f8c: ; 0x02151f8c
    bx lr
    arm_func_end func_ov004_02151f8c

    .global func_ov004_02151f90
    arm_func_start func_ov004_02151f90
func_ov004_02151f90: ; 0x02151f90
    ldr ip, .L_02151f98
    bx ip
.L_02151f98: .word func_ov012_021b65cc
    arm_func_end func_ov004_02151f90

    .global func_ov004_02151f9c
    arm_func_start func_ov004_02151f9c
func_ov004_02151f9c: ; 0x02151f9c
    ldr r3, [r0, #0x4]
    tst r1, #0x8
    ldr r0, [r3, #0x124]
    ldr ip, [r3, #0x10]
    sub r3, r0, #0x40
    beq .L_02151fd0
    cmp r3, #0x0
    subgt r3, r3, #0x1
    movle r3, #0x2
    add r0, r3, #0x3
    add r0, ip, r0, lsl #0x2
    ldr r0, [r0, #0x64]
    str r0, [r2, #0x0]
.L_02151fd0:
    tst r1, #0x4
    bxeq lr
    cmp r3, #0x2
    addlt r3, r3, #0x1
    movge r3, #0x0
    add r0, r3, #0x3
    add r0, ip, r0, lsl #0x2
    ldr r0, [r0, #0x64]
    str r0, [r2, #0x0]
    bx lr
    arm_func_end func_ov004_02151f9c

    .global func_ov004_02151ff8
    arm_func_start func_ov004_02151ff8
func_ov004_02151ff8: ; 0x02151ff8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_021520d4
    cmp r0, r1
    beq .L_02152098
    add r1, r1, #0x1
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r3, [r5, #0x4]
    mov r0, #0x78
    ldr r2, [r3, #0x124]
    mov r1, #0x0
    sub r4, r2, #0x40
    ldr r5, [r3, #0x10]
    bl func_0207342c
    bl func_ov004_0214ce64
    add r1, r4, #0x1
    bl func_ov004_0214ce94
    mov r0, r4
    bl func_ov004_0214f518
    bl func_ov004_0214ce64
    mov r1, #0x2
    bl func_ov004_0214ce74
    blx func_ov012_021b65bc
    ldr r0, [r5, #0x4]
    ldr r1, .L_021520d8
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02152098:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x4]
    mov r2, #0x0
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x124]
    ldr r0, [r0, #0xb0]
    sub r1, r1, #0x40
    add r1, r1, #0x3e
    blx func_ov012_021bd730
    ldmia sp!, {r3, r4, r5, pc}
.L_021520d4: .word 0x80011000
.L_021520d8: .word func_ov004_02152110
    arm_func_end func_ov004_02151ff8

    .global func_ov004_021520dc
    arm_func_start func_ov004_021520dc
func_ov004_021520dc: ; 0x021520dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02152100
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02152100: .word func_ov004_02152104
    arm_func_end func_ov004_021520dc

    .global func_ov004_02152104
    arm_func_start func_ov004_02152104
func_ov004_02152104: ; 0x02152104
    ldr ip, .L_0215210c
    bx ip
.L_0215210c: .word func_ov004_0214f6c4
    arm_func_end func_ov004_02152104

    .global func_ov004_02152110
    arm_func_start func_ov004_02152110
func_ov004_02152110: ; 0x02152110
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x4]
    ldr r5, .L_021521dc
    ldr r4, [r0, #0x10]
    mov r6, #0x0
.L_02152124:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
    cmp r6, #0x4
    blo .L_02152124
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_021521dc
    b .L_02152154
.L_0215214c:
    ldr r0, [r5, #0x0]
    blx r0
.L_02152154:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215214c
    ldr r0, [r4, #0x8]
    bl func_ov004_0214e4b8
    mov r7, #0x0
    add r6, r4, #0xc0
    mov r5, r7
.L_02152174:
    ldr r0, [r6, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_02152188
    bl func_ov004_02150d6c
    str r5, [r6, r7, lsl #0x2]
.L_02152188:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_02152174
    ldr r0, .L_021521e0
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0xb0]
    cmp r0, #0x0
    beq .L_021521b8
    blx func_ov012_021bd500
.L_021521b8:
    ldr r0, [r4, #0xbc]
    cmp r0, #0x0
    beq .L_021521c8
    bl func_0206ae98
.L_021521c8:
    mov r0, r4
    bl func_ov004_0214fb48
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021521dc: .word data_020a0e18
.L_021521e0: .word data_ov012_021d5154
    arm_func_end func_ov004_02152110

    .global func_ov004_021521e4
    arm_func_start func_ov004_021521e4
func_ov004_021521e4: ; 0x021521e4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x38
    mov r5, r1
    mov r7, r2
    mov r8, r0
    mov r4, r3
    ldr r1, .L_02152610
    ldr r2, .L_02152614
    mov r0, #0x14
    mov r3, #0x28
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x14
    mov r6, r0
    bl func_020517fc
    ldr r0, .L_02152618
    ldr r1, .L_0215261c
    mov r2, r5
    bl func_ov004_0214e880
    ldr r1, .L_02152620
    mov r5, r0
    bl func_ov004_0214e92c
    mov r1, r4
    mov r0, r6
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r6, #0x0]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_02152624
    add r0, sp, #0x28
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_02152628
    add r0, sp, #0x20
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x10]
    sub r0, r0, #0x100000
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x10
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    bl func_02023c60
    mov r3, #0x0
    add r1, sp, #0xc
    add r2, sp, #0x8
    mov r0, r4
    str r3, [sp, #0x8]
    str r3, [sp, #0xc]
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x20]
    ldr r2, .L_0215262c
    ldr r3, [sp, #0x24]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    ldr r2, .L_02152630
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r6, #0x0]
    ldr r0, .L_02152634
    ldr r10, [r1, #0x4]
    ldr r9, [r0, #0x0]
    ldr r1, .L_02152638
    ldr r2, .L_0215263c
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    movs r4, r0
    beq .L_021523c0
    ldr r3, .L_02152640
    mov r1, r10
    mov r2, r9
    blx func_ov012_021af0f8
    mov r4, r0
.L_021523c0:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_021523dc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021523dc:
    ldr r4, [r4, #0x18]
    mov r1, #0x1
    str r4, [r6, #0x4]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r5, [r5, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0xa8
    str r0, [sp, #0x30]
    mov r0, #0x88
    str r0, [sp, #0x34]
    mov r0, #0xa0
    str r0, [sp, #0x0]
    add r0, sp, #0x30
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    add r3, r8, #0x6
    mov r1, r7
    mov r2, #0x820000
    bl func_ov004_0214ee60
    ldr r1, [r6, #0x4]
    mov r4, r0
    bl func_ov004_02152648
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x3b
    str r0, [sp, #0x30]
    mov r0, #0x60
    str r0, [sp, #0x34]
    mov r0, #0xa0
    str r0, [sp, #0x0]
    add r0, sp, #0x30
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, r7
    mov r2, #0x820000
    mov r3, #0x0
    bl func_ov004_0214ee60
    ldr r1, [r6, #0x4]
    mov r4, r0
    bl func_ov004_02152648
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_02152644
    add r0, sp, #0x18
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x4000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    mov r2, #0x1e
    ldr r3, [sp, #0x1c]
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    mov r2, #0x3c
    ldr r3, [sp, #0x1c]
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0xc000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    mov r2, #0x5a
    ldr r3, [sp, #0x1c]
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x10000
    bl func_02023738
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    mov r2, #0x78
    ldr r3, [sp, #0x1c]
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r2, .L_0215262c
    ldr r3, [sp, #0x1c]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, r6
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02152610: .word data_ov004_02160cb4
.L_02152614: .word data_ov004_02160c94
.L_02152618: .word data_ov004_02160ccc
.L_0215261c: .word data_ov004_02160ce4
.L_02152620: .word data_ov004_02160cfc
.L_02152624: .word data_ov004_02160d14
.L_02152628: .word data_ov004_02160d1c
.L_0215262c: .word 0x494c
.L_02152630: .word func_ov004_021526c4
.L_02152634: .word data_ov012_021d5154
.L_02152638: .word data_ov004_021608d4
.L_0215263c: .word data_ov004_02160c8c
.L_02152640: .word func_ov004_0214e414
.L_02152644: .word data_ov004_02160d28
    arm_func_end func_ov004_021521e4

    .global func_ov004_02152648
    arm_func_start func_ov004_02152648
func_ov004_02152648: ; 0x02152648
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215266c
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
.L_0215266c:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02152648

    .global func_ov004_02152680
    arm_func_start func_ov004_02152680
func_ov004_02152680: ; 0x02152680
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_0201b244
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02152680

    .global func_ov004_02152694
    arm_func_start func_ov004_02152694
func_ov004_02152694: ; 0x02152694
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x0]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02152694

    .global func_ov004_021526bc
    arm_func_start func_ov004_021526bc
func_ov004_021526bc: ; 0x021526bc
    ldrb r0, [r0, #0x10]
    bx lr
    arm_func_end func_ov004_021526bc

    .global func_ov004_021526c4
    arm_func_start func_ov004_021526c4
func_ov004_021526c4: ; 0x021526c4
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    strb r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov004_021526c4

    .global func_ov004_021526d8
    arm_func_start func_ov004_021526d8
func_ov004_021526d8: ; 0x021526d8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x68
    ldr r1, .L_02152c70
    mov r4, r0
    ldr r2, .L_02152c74
    mov r0, #0xd8
    mov r3, #0x63
    bl func_0201a21c
    mov r5, r0
    mov r1, #0xd8
    bl func_ov004_0214fadc
    bl func_ov004_0214fc90
    mov r0, r4
    add r1, r5, #0xc4
    mov r2, #0x14
    bl func_02051890
    bl func_ov004_0214d98c
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r5, #0x8]
    bl func_ov004_0214e4b0
    str r0, [r5, #0x44]
    ldr r0, .L_02152c78
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x24]
    ldr r0, .L_02152c7c
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x28]
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    ldr r0, [r5, #0x8]
    bl func_ov004_0214e6fc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02152c80
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    str r1, [r0, #0x124]
    str r4, [r5, #0x6c]
    bl func_0203b3f4
    ldr r4, [r0, #0x88]
    mov r0, #0x2
    bl func_0203b424
    ldr r6, [r0, #0x88]
    ldr r0, [r5, #0x8]
    bl func_ov004_0214e4b0
    mov r3, r0
    ldr r0, [r5, #0xc8]
    mov r1, r6
    mov r2, r4
    bl func_ov004_021521e4
    str r0, [r5, #0xb4]
    add r0, sp, #0x10
    bl func_0202c498
    add r0, sp, #0x18
    bl func_0202c498
    mov r0, #0xa8
    str r0, [sp, #0x8]
    mov r0, #0x44
    str r0, [sp, #0xc]
    bl func_0203b3f4
    mov r1, #0xa0
    str r1, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r0, [r5, #0x44]
    mov r2, #0x820000
    mov r3, #0x5
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_02152c84
    add r0, sp, #0x20
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x24]
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    ldr r2, .L_02152c88
    add r0, sp, #0x28
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x2c]
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x148000
    ldr r1, [sp, #0xc]
    str r0, [sp, #0x30]
    mov r0, r1, lsl #0xc
    str r0, [sp, #0x34]
    mov r0, r4
    add r1, sp, #0x30
    add r2, sp, #0x34
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x8
    bl func_02023c60
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x3c]
    str r0, [sp, #0x38]
    mov r0, r4
    add r1, sp, #0x38
    add r2, sp, #0x3c
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_02152c8c
    ldr r3, [sp, #0x14]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r5, #0x70]
    mov r0, #0xb0
    str r0, [sp, #0x8]
    mov r0, #0x60
    str r0, [sp, #0xc]
    bl func_0203b3f4
    mov r2, r0
    mov r1, #0xa0
    add r0, sp, #0x8
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r1, [r2, #0x88]
    ldr r0, [r5, #0x44]
    ldr r3, [r5, #0xcc]
    mov r2, #0x820000
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_02152c84
    add r0, sp, #0x40
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x40]
    ldr r0, [sp, #0x44]
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    ldr r2, .L_02152c88
    add r0, sp, #0x48
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x48]
    ldr r0, [sp, #0x4c]
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x148000
    ldr r1, [sp, #0xc]
    str r0, [sp, #0x50]
    mov r0, r1, lsl #0xc
    str r0, [sp, #0x54]
    mov r0, r4
    add r1, sp, #0x50
    add r2, sp, #0x54
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x10
    bl func_02023c60
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x8]
    mov ip, r1, lsl #0xc
    mov r3, r0, lsl #0xc
    add r1, sp, #0x58
    add r2, sp, #0x5c
    mov r0, r4
    str ip, [sp, #0x5c]
    str r3, [sp, #0x58]
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x18
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_02152c8c
    ldr r3, [sp, #0x14]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r5, #0x74]
    ldr r0, [r4, #0x4]
    ldr r2, .L_02152c90
    mov r1, #0x10
    blx func_ov012_021b6760
    mov r2, #0x0
    mov r0, #0x14
    mov r1, #0x2
    sub r3, r2, #0x1
    blx func_ov012_021bcf1c
    str r0, [r5, #0xb0]
    ldr r1, [r5, #0xd0]
    mov r2, #0x0
    blx func_ov012_021bd730
    bl func_02026f94
    str r0, [r5, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x64]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x64
    bl func_ov004_02152ca0
    ldr r0, [r5, #0x4]
    ldr r1, .L_02152c94
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x4]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_02026f94
    str r0, [r5, #0xb8]
    mov r0, #0x80000
    str r0, [sp, #0x60]
    ldr r0, [r5, #0xb8]
    add r1, sp, #0x60
    bl func_ov004_02152ca0
    ldr r0, [r5, #0xb8]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0xb8]
    ldr r1, .L_02152c98
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0xb8]
    ldr r2, .L_02152c9c
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    ldrsb r0, [r5, #0xd4]
    cmp r0, #0x0
    beq .L_02152c4c
    ldr r0, [r5, #0xb8]
    bl func_02086cac
.L_02152c4c:
    mov r0, #0x38
    mov r1, #0x0
    bl func_020736e4
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x0]
    add sp, sp, #0x68
    ldmia sp!, {r4, r5, r6, pc}
.L_02152c70: .word data_ov004_02160d44
.L_02152c74: .word data_ov004_02160d30
.L_02152c78: .word data_ov004_02160d60
.L_02152c7c: .word data_ov004_02160d74
.L_02152c80: .word func_ov004_02152e04
.L_02152c84: .word data_ov004_02160d8c
.L_02152c88: .word data_ov004_02160d98
.L_02152c8c: .word 0x494c
.L_02152c90: .word func_ov004_02152e68
.L_02152c94: .word func_ov004_02152e6c
.L_02152c98: .word func_ov004_02152f0c
.L_02152c9c: .word func_ov004_02152f70
    arm_func_end func_ov004_021526d8

    .global func_ov004_02152ca0
    arm_func_start func_ov004_02152ca0
func_ov004_02152ca0: ; 0x02152ca0
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02152ca0

    .global func_ov004_02152cc4
    arm_func_start func_ov004_02152cc4
func_ov004_02152cc4: ; 0x02152cc4
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r5, r1
    blx func_ov012_021b65bc
    mov r0, #0x38
    bl func_0207372c
    cmp r5, #0x0
    beq .L_02152d68
    ldrsb r0, [r4, #0xd4]
    cmp r0, #0x0
    beq .L_02152d48
    bl func_020876ac
    bl func_0208712c
    bl func_020876f8
    cmp r0, #0x0
    beq .L_02152d20
    bl func_020876ac
    ldrb r2, [r4, #0xbf]
    mov r1, #0x1
    orr r1, r2, r1, lsl r0
    mov r0, r4
    strb r1, [r4, #0xbf]
    bl func_ov004_0215308c
.L_02152d20:
    ldr r5, .L_02152e00
    b .L_02152d30
.L_02152d28:
    ldr r0, [r5, #0x0]
    blx r0
.L_02152d30:
    ldrsb r0, [r4, #0xbe]
    cmp r0, #0x0
    beq .L_02152d28
    bl func_020882e0
    bl func_02088330
    b .L_02152d74
.L_02152d48:
    ldr r5, .L_02152e00
    mov r6, #0x0
.L_02152d50:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
    cmp r6, #0x4
    blo .L_02152d50
    b .L_02152d74
.L_02152d68:
    bl func_ov004_0214ce64
    mov r1, #0x0
    bl func_ov004_0214ce74
.L_02152d74:
    ldrb r0, [r4, #0xc0]
    cmp r0, #0x0
    bne .L_02152d94
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x1
    strb r0, [r4, #0xc0]
.L_02152d94:
    ldr r5, .L_02152e00
    b .L_02152da4
.L_02152d9c:
    ldr r0, [r5, #0x0]
    blx r0
.L_02152da4:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_02152d9c
    ldrsb r0, [r4, #0xd4]
    cmp r0, #0x0
    beq .L_02152dc4
    mov r0, #0x0
    bl func_02086cac
.L_02152dc4:
    ldr r0, [r4, #0x8]
    bl func_ov004_0214e4b8
    ldr r0, [r4, #0xb0]
    cmp r0, #0x0
    beq .L_02152ddc
    blx func_ov012_021bd500
.L_02152ddc:
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    beq .L_02152dec
    bl func_ov004_02152680
.L_02152dec:
    mov r0, r4
    bl func_ov004_0214fb48
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_02152e00: .word data_020a0e18
    arm_func_end func_ov004_02152cc4

    .global func_ov004_02152e04
    arm_func_start func_ov004_02152e04
func_ov004_02152e04: ; 0x02152e04
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02152e64
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov004_021530d4
    ldmia sp!, {r3, r4, r5, pc}
.L_02152e64: .word 0x80011001
    arm_func_end func_ov004_02152e04

    .global func_ov004_02152e68
    arm_func_start func_ov004_02152e68
func_ov004_02152e68: ; 0x02152e68
    bx lr
    arm_func_end func_ov004_02152e68

    .global func_ov004_02152e6c
    arm_func_start func_ov004_02152e6c
func_ov004_02152e6c: ; 0x02152e6c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0xb4]
    bl func_ov004_02152694
    ldr r0, [r4, #0x70]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x74]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    mov r6, #0x0
    ldr r5, .L_02152f08
    b .L_02152ed8
.L_02152ecc:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
.L_02152ed8:
    cmp r6, #0x12c
    bhs .L_02152eec
    ldrsb r0, [r4, #0xbc]
    cmp r0, #0x0
    beq .L_02152ecc
.L_02152eec:
    bl func_ov004_0214ce64
    ldr r1, [r4, #0xc4]
    bl func_ov004_0214ce74
    mov r0, r4
    mov r1, #0x1
    bl func_ov004_02152cc4
    ldmia sp!, {r4, r5, r6, pc}
.L_02152f08: .word data_020a0e18
    arm_func_end func_ov004_02152e6c

    .global func_ov004_02152f0c
    arm_func_start func_ov004_02152f0c
func_ov004_02152f0c: ; 0x02152f0c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrsb r0, [r4, #0xbd]
    cmp r0, #0x0
    ldrne r0, .L_02152f6c
    ldrne r1, [r0, #0x0]
    addne r1, r1, #0x1
    strne r1, [r0, #0x0]
    ldrsb r0, [r4, #0xd4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_020882c4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02088290
    bl func_02086c94
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    mov r0, r4
    mov r1, #0x0
    bl func_ov004_02152cc4
    ldmia sp!, {r4, pc}
.L_02152f6c: .word data_020a0f10
    arm_func_end func_ov004_02152f0c

    .global func_ov004_02152f70
    arm_func_start func_ov004_02152f70
func_ov004_02152f70: ; 0x02152f70
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x70000004
    beq .L_02152fe8
    cmp r0, #0x70000005
    beq .L_02152fac
    cmp r0, #0x70000007
    beq .L_0215306c
    ldmia sp!, {r3, r4, r5, pc}
.L_02152fac:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    ldr r1, .L_02153088
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    strb r0, [r4, #0xbc]
    bl func_020876f8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov004_021530d4
    ldmia sp!, {r3, r4, r5, pc}
.L_02152fe8:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x2
    bne .L_0215300c
    mov r0, #0x1
    strb r0, [r4, #0xbe]
    bl func_020876ac
.L_0215300c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020876f8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldrb r2, [r4, #0xbf]
    mov r1, #0x1
    orr r1, r2, r1, lsl r0
    mov r0, r5
    strb r1, [r4, #0xbf]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r0, r4
    bl func_ov004_0215308c
    ldmia sp!, {r3, r4, r5, pc}
.L_0215306c:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    mov r0, r4
    mov r1, #0x0
    bl func_ov004_02152cc4
    ldmia sp!, {r3, r4, r5, pc}
.L_02153088: .word 0x2f2f
    arm_func_end func_ov004_02152f70

    .global func_ov004_0215308c
    arm_func_start func_ov004_0215308c
func_ov004_0215308c: ; 0x0215308c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02086d80
    mov r1, #0x1
    mov r0, r1, lsl r0
    ldrb r1, [r4, #0xbf]
    sub r0, r0, #0x1
    cmp r1, r0
    ldmneia sp!, {r4, pc}
    ldr r0, .L_021530d0
    ldr r0, [r0, #0x0]
    blx r0
    bl func_02087160
    mov r0, #0x1
    strb r0, [r4, #0xbe]
    bl func_020876ac
    ldmia sp!, {r4, pc}
.L_021530d0: .word data_020a0e18
    arm_func_end func_ov004_0215308c

    .global func_ov004_021530d4
    arm_func_start func_ov004_021530d4
func_ov004_021530d4: ; 0x021530d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsb r0, [r4, #0xd4]
    cmp r0, #0x0
    beq .L_0215310c
    ldr r0, .L_02153118
    ldr r1, .L_0215311c
    mov r2, #0x2
    bl func_02087214
    bl func_020876f8
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r4, #0xbc]
    ldmia sp!, {r4, pc}
.L_0215310c:
    mov r0, #0x1
    strb r0, [r4, #0xbc]
    ldmia sp!, {r4, pc}
.L_02153118: .word 0x2f2f
.L_0215311c: .word data_ov004_021603f0
    arm_func_end func_ov004_021530d4

    .global func_ov004_02153120
    arm_func_start func_ov004_02153120
func_ov004_02153120: ; 0x02153120
    stmdb sp!, {lr}
    sub sp, sp, #0x14
    bl func_ov004_0214f508
    bl func_ov004_0214f5dc
    bl func_ov004_0214f754
    bl func_ov004_0214f93c
    mov r0, #0x0
    bl func_ov004_0214f718
    mov r0, #0x1
    bl func_ov004_0214f740
    mov r1, #0x3
    mov r0, #0x0
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    bl func_ov004_0214f540
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    bl func_ov004_0214f540
    add r2, r0, #0x41
    mov r1, #0x0
    add r0, sp, #0x0
    str r2, [sp, #0xc]
    strb r1, [sp, #0x10]
    bl func_ov004_021526d8
    add sp, sp, #0x14
    ldmia sp!, {pc}
    arm_func_end func_ov004_02153120

    .global func_ov004_02153188
    arm_func_start func_ov004_02153188
func_ov004_02153188: ; 0x02153188
    stmdb sp!, {lr}
    sub sp, sp, #0x14
    bl func_ov004_0214f5dc
    bl func_ov004_0214f754
    bl func_ov004_0214f93c
    mov r3, #0x1
    mov ip, #0x7
    mov r2, #0x4
    mov r1, #0x76
    add r0, sp, #0x0
    str ip, [sp, #0x0]
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    strb r3, [sp, #0x10]
    bl func_ov004_021526d8
    add sp, sp, #0x14
    ldmia sp!, {pc}
    arm_func_end func_ov004_02153188

    .global func_ov004_021531d0
    arm_func_start func_ov004_021531d0
func_ov004_021531d0: ; 0x021531d0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r9, r1
    mov r8, r2
    mov r7, r3
    mov r10, r0
    ldr r1, .L_0215329c
    ldr r2, .L_021532a0
    mov r0, r7, lsl #0x1
    mov r3, #0x1e
    bl func_0201a21c
    mov r2, #0x0
    mov r6, r0
    mov r1, r2
    b .L_02153214
.L_02153208:
    mov r0, r2, lsl #0x1
    strh r1, [r6, r0]
    add r2, r2, #0x1
.L_02153214:
    cmp r2, r7
    blt .L_02153208
    mov r5, #0x0
    mov r4, #0x1
    ldr r11, .L_021532a4
    b .L_02153288
.L_0215322c:
    ldr r0, [r11, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    sub r1, r7, r5
    bl func_0200d338
    mov r2, #0x0
    b .L_02153268
.L_02153248:
    mov r0, r2, lsl #0x1
    ldrsh r0, [r6, r0]
    cmp r0, #0x0
    bne .L_02153264
    cmp r1, #0x0
    beq .L_02153270
    sub r1, r1, #0x1
.L_02153264:
    add r2, r2, #0x1
.L_02153268:
    cmp r2, r7
    blt .L_02153248
.L_02153270:
    mov r2, r2, lsl #0x1
    ldrsh r1, [r8, r2]
    mov r0, r5, lsl #0x1
    add r5, r5, #0x1
    strh r1, [r10, r0]
    strh r4, [r6, r2]
.L_02153288:
    cmp r5, r9
    blt .L_0215322c
    mov r0, r6
    bl func_0201b268
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215329c: .word data_ov004_02160de8
.L_021532a0: .word data_ov004_02160da0
.L_021532a4: .word data_020a0da8
    arm_func_end func_ov004_021531d0

    .global func_ov004_021532a8
    arm_func_start func_ov004_021532a8
func_ov004_021532a8: ; 0x021532a8
    stmdb sp!, {r4, lr}
    ldr r1, .L_021532d8
    ldr r2, .L_021532dc
    mov r0, #0x8
    mov r3, #0x48
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x8
    mov r4, r0
    bl func_020517fc
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_021532d8: .word data_ov004_02160de8
.L_021532dc: .word data_ov004_02160dc0
    arm_func_end func_ov004_021532a8

    .global func_ov004_021532e0
    arm_func_start func_ov004_021532e0
func_ov004_021532e0: ; 0x021532e0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_0201b244
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021532e0

    .global func_ov004_021532f4
    arm_func_start func_ov004_021532f4
func_ov004_021532f4: ; 0x021532f4
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    cmp r0, #0x0
    beq .L_02153334
    mov ip, #0x0
    add r2, sp, #0x0
.L_0215330c:
    add r1, ip, #0x1
    mov r3, ip, lsl #0x1
    mov r1, r1, lsl #0x18
    strh ip, [r2, r3]
    mov ip, r1, asr #0x18
    cmp ip, #0x4
    blt .L_0215330c
    mov r1, #0x4
    mov r3, r1
    bl func_ov004_021531d0
.L_02153334:
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021532f4

    .global func_ov004_0215333c
    arm_func_start func_ov004_0215333c
func_ov004_0215333c: ; 0x0215333c
    bx lr
    arm_func_end func_ov004_0215333c

    .global func_ov004_02153340
    arm_func_start func_ov004_02153340
func_ov004_02153340: ; 0x02153340
    cmp r0, #0x0
    beq .L_02153360
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_02153360:
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_02153340

    .global func_ov004_02153368
    arm_func_start func_ov004_02153368
func_ov004_02153368: ; 0x02153368
    mov r2, #0x0
    b .L_02153390
.L_02153370:
    mov r1, r2, lsl #0x1
    ldrsh r1, [r0, r1]
    cmp r1, #0x0
    moveq r0, r2
    bxeq lr
    add r1, r2, #0x1
    mov r1, r1, lsl #0x18
    mov r2, r1, asr #0x18
.L_02153390:
    cmp r2, #0x4
    blt .L_02153370
    mvn r0, #0x0
    bx lr
    arm_func_end func_ov004_02153368

    .global func_ov004_021533a0
    arm_func_start func_ov004_021533a0
func_ov004_021533a0: ; 0x021533a0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    mov r4, r1
    mov r10, r2
    mov r5, r0
    ldr r1, .L_0215376c
    ldr r2, .L_02153770
    mov r0, #0x38
    mov r3, #0x32
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x38
    mov r8, r0
    bl func_020517fc
    ldr r5, [r5, #0x4]
    ldr r1, .L_02153774
    mov r0, #0x134
    ldr r6, [r1, #0x0]
    ldr r1, .L_02153778
    ldr r2, .L_0215377c
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02153410
    ldr r3, .L_02153780
    mov r1, r5
    mov r2, r6
    blx func_ov012_021af0f8
.L_02153410:
    bl func_ov004_0214e3ec
    mov r7, r0
    str r7, [r8, #0x0]
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov004_0214f1b8
    bl func_ov004_0214f72c
    cmp r0, #0x1
    bls .L_02153454
    bl func_ov004_0214f6c4
    cmp r0, #0x0
    beq .L_021534a4
.L_02153454:
    bl func_0203b404
    ldr r5, [r0, #0x88]
    bl func_ov004_0214f288
    mov r1, r0
    mov r0, r5
    mov r2, #0x6
    mov r3, #0x6e
    bl func_ov004_0214eaa0
    str r0, [r8, #0x30]
    ldr r1, [r8, #0x30]
    mov r0, r7
    bl func_ov004_0214e478
    mov r0, #0x82000
    str r0, [sp, #0x28]
    mov r0, #0xa9000
    str r0, [sp, #0x2c]
    ldr r0, [r8, #0x30]
    add r1, sp, #0x2c
    add r2, sp, #0x28
    bl func_ov004_0214e1b8
.L_021534a4:
    mov r0, r4
    bl func_ov004_0214e7ec
    mov r3, #0x0
    ldr r2, .L_02153784
    mov r0, #0xe0
    mov r1, #0x20
    str r3, [sp, #0x0]
    bl func_ov012_021ca3a4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    mov r0, #0x20000
    str r0, [sp, #0x24]
    mov r0, r4
    add r1, sp, #0x24
    bl func_ov004_0214ea78
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
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x20000
    str r0, [sp, #0x1c]
    mov r0, #0x10000
    str r0, [sp, #0x20]
    mov r0, r4
    add r1, sp, #0x20
    add r2, sp, #0x1c
    bl func_ov004_0214e1b8
    mov r0, r7
    mov r1, r4
    bl func_ov004_0214e478
    str r4, [r8, #0x8]
    mov r6, #0x0
    mov r4, #0x20000
    mov r11, #0x10000
.L_02153580:
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_02153784
    mov r0, #0xe0
    mov r1, #0x10
    mov r3, #0x0
    bl func_ov012_021ca3a4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    str r4, [sp, #0x18]
    mov r0, r5
    add r1, sp, #0x18
    bl func_ov004_0214ea78
    ldr r9, [r5, #0x4]
    ldr r0, [r9, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r9
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r6, lsl #0x4
    add r0, r0, #0x40
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x10]
    mov r0, r5
    add r1, sp, #0x14
    add r2, sp, #0x10
    str r11, [sp, #0x14]
    bl func_ov004_0214e1b8
    mov r0, r7
    mov r1, r5
    bl func_ov004_0214e478
    add r0, r8, r6, lsl #0x2
    add r6, r6, #0x1
    str r5, [r0, #0xc]
    cmp r6, #0x4
    blt .L_02153580
    bl func_ov004_0214e850
    mov r0, r10
    bl func_ov004_0214e7ec
    mov r9, #0x0
    mov r5, #0x20000
    mov r4, #0x18000
    mov r11, #0x30
.L_02153678:
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_02153784
    mov r0, #0xe0
    mov r1, #0x10
    mov r3, #0x0
    bl func_ov012_021ca3a4
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa4]
    blx r2
    str r5, [sp, #0xc]
    mov r0, r6
    add r1, sp, #0xc
    bl func_ov004_0214ea78
    ldr r10, [r6, #0x4]
    ldr r0, [r10, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mul r0, r9, r11
    add r0, r0, #0x10
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x4]
    mov r0, r6
    add r1, sp, #0x8
    add r2, sp, #0x4
    str r4, [sp, #0x8]
    bl func_ov004_0214e1b8
    mov r0, r7
    mov r1, r6
    bl func_ov004_0214e478
    add r0, r8, r9, lsl #0x2
    add r9, r9, #0x1
    str r6, [r0, #0x1c]
    cmp r9, #0x4
    blt .L_02153678
    bl func_ov004_0214e850
    mov r1, #0x0
    mov r0, r8
    str r1, [r8, #0x2c]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215376c: .word data_ov004_02160e24
.L_02153770: .word data_ov004_02160e04
.L_02153774: .word data_ov012_021d5154
.L_02153778: .word data_ov004_021608d4
.L_0215377c: .word data_ov004_02160dfc
.L_02153780: .word func_ov004_0214e414
.L_02153784: .word data_ov004_02160e3c
    arm_func_end func_ov004_021533a0

    .global func_ov004_02153788
    arm_func_start func_ov004_02153788
func_ov004_02153788: ; 0x02153788
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    bl func_ov004_02153bb4
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02153788

    .global func_ov004_021537a4
    arm_func_start func_ov004_021537a4
func_ov004_021537a4: ; 0x021537a4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x48
    movs r10, r0
    mov r9, r1
    mov r8, r2
    beq .L_02153b3c
    str r9, [r10, #0x34]
    ldr r4, [r10, #0x8]
    ldrb r5, [r9, #0x0]
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
    mov r1, #0x0
    ldr r0, [r0, #0x64]
    mov r2, #0x2
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x80]
    blx r3
    cmp r5, #0xff
    moveq r5, #0x15
    mov r0, r5
    bl func_ov004_0214f2dc
    ldr r2, [r4, #0x4]
    mov r1, r0
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    add r0, r9, #0x4
    bl func_ov004_02153b58
    mov r4, r0
    mov r0, r10
    bl func_ov004_02153bb4
    cmp r4, #0x0
    ldrnesb r0, [r4, #0x0]
    cmpne r0, #0x0
    beq .L_02153918
    ldr r1, .L_02153b44
    add r0, sp, #0x14
    bl func_02074000
    add r0, sp, #0x14
    mov r1, r4
    bl func_020741bc
    ldr r1, .L_02153b48
    add r0, sp, #0x14
    bl func_020741bc
    add r0, sp, #0x14
    bl func_02033bb8
    cmp r0, #0x0
    bne .L_02153894
    ldr r1, .L_02153b4c
    add r0, sp, #0x14
    bl func_02074000
.L_02153894:
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e7ec
    add r0, sp, #0x14
    bl func_02032a1c
    bl func_ov004_0214e3ec
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x32000
    str r0, [sp, #0x4]
    mov r0, #0x8000
    str r0, [sp, #0x0]
    mov r0, r4
    add r1, sp, #0x0
    add r2, sp, #0x4
    bl func_ov004_0214e1b8
    mov r0, #0x5f000
    str r0, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    bl func_ov004_0214ea78
    ldr r0, [r10, #0x0]
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb4]
    blx r2
    str r4, [r10, #0x2c]
    bl func_ov004_0214e850
.L_02153918:
    ldr r0, [r10, #0x2c]
    mov r5, #0x0
    cmp r0, #0x0
    movne r0, #0x70
    moveq r0, #0x10
    mov r6, r0, lsl #0xc
    add r4, r9, #0x8
.L_02153934:
    add r0, r10, r5, lsl #0x2
    ldr r7, [r0, #0xc]
    ldr r11, [r7, #0x4]
    ldr r0, [r11, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r11
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    mov r0, r5, lsl #0x4
    add r0, r0, #0x40
    mov r0, r0, lsl #0xc
    str r0, [sp, #0xc]
    mov r0, r7
    add r1, sp, #0x10
    add r2, sp, #0xc
    str r6, [sp, #0x10]
    bl func_ov004_0214e1b8
    add r0, r4, r5, lsl #0x2
    bl func_ov004_02153b58
    ldr r2, [r7, #0x4]
    mov r1, r0
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_02153934
    mov r5, #0x0
    add r4, r9, #0x18
.L_021539b8:
    add r0, r10, r5, lsl #0x2
    ldr r7, [r0, #0x1c]
    ldr r6, [r7, #0x4]
    ldr r0, [r6, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    mov r0, r5, lsl #0x1
    ldrsh r0, [r8, r0]
    add r0, r4, r0, lsl #0x2
    bl func_ov004_02153b58
    ldr r2, [r7, #0x4]
    mov r1, r0
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_021539b8
    ldr r0, [r10, #0x30]
    cmp r0, #0x0
    beq .L_02153b3c
    add r0, sp, #0x36
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    bl func_ov004_0214f6e4
    cmp r0, #0x0
    beq .L_02153ac4
    ldrh r4, [r9, #0x2]
    ldr r0, .L_02153b50
    cmp r4, r0
    moveq r0, #0x2d
    streqh r0, [sp, #0x36]
    streqh r0, [sp, #0x38]
    streqh r0, [sp, #0x3a]
    beq .L_02153ab8
    mov r0, r4
    mov r1, #0x64
    bl func_0200d12c
    add r2, r0, #0x30
    mov r0, r4
    mov r1, #0x64
    strh r2, [sp, #0x36]
    bl func_0200d12c
    mov r0, r1, lsl #0x10
    mov r4, r0, lsr #0x10
    mov r0, r4
    mov r1, #0xa
    bl func_0200d12c
    add r2, r0, #0x30
    mov r0, r4
    mov r1, #0xa
    strh r2, [sp, #0x38]
    bl func_0200d12c
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    add r0, r0, #0x30
    strh r0, [sp, #0x3a]
.L_02153ab8:
    mov r0, #0x20
    strh r0, [sp, #0x3c]
    b .L_02153ae4
.L_02153ac4:
    mov r3, #0x0
    mov r2, #0x20
    add r0, sp, #0x36
.L_02153ad0:
    mov r1, r3, lsl #0x1
    add r3, r3, #0x1
    strh r2, [r0, r1]
    cmp r3, #0x4
    blt .L_02153ad0
.L_02153ae4:
    ldr r5, .L_02153b54
    mov r6, #0x0
    mov r7, #0x20
    add r4, sp, #0x36
.L_02153af4:
    bl func_ov004_0214f6c4
    cmp r0, #0x0
    beq .L_02153b18
    ldrb r1, [r9, #0x1]
    rsb r0, r6, #0x2
    cmp r1, r0
    addge r0, r4, r6, lsl #0x1
    strgeh r5, [r0, #0x8]
    bge .L_02153b20
.L_02153b18:
    add r0, r4, r6, lsl #0x1
    strh r7, [r0, #0x8]
.L_02153b20:
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_02153af4
    ldr r0, [r10, #0x30]
    add r1, sp, #0x36
    mov r2, #0x7
    bl func_ov004_0214ece0
.L_02153b3c:
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02153b44: .word data_ov004_02160e50
.L_02153b48: .word data_ov004_02160e5c
.L_02153b4c: .word data_ov004_02160e64
.L_02153b50: .word 0xffff
.L_02153b54: .word 0x2605
    arm_func_end func_ov004_021537a4

    .global func_ov004_02153b58
    arm_func_start func_ov004_02153b58
func_ov004_02153b58: ; 0x02153b58
    ldr r1, [r0, #0x0]
    cmp r1, #0x0
    moveq r0, #0x0
    addne r0, r0, r1
    bx lr
    arm_func_end func_ov004_02153b58

    .global func_ov004_02153b6c
    arm_func_start func_ov004_02153b6c
func_ov004_02153b6c: ; 0x02153b6c
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r1, #0x0
    ldr r0, [r0, #0x0]
    beq .L_02153b9c
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
.L_02153b9c:
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02153b6c

    .global func_ov004_02153bb4
    arm_func_start func_ov004_02153bb4
func_ov004_02153bb4: ; 0x02153bb4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    ldr r1, [r1, #0x4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0x2c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x2c]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02153bb4

    .global func_ov004_02153bfc
    arm_func_start func_ov004_02153bfc
func_ov004_02153bfc: ; 0x02153bfc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x44
    mov r5, r1
    mov r4, r2
    mov r6, r0
    ldr r1, .L_02154214
    ldr r2, .L_02154218
    mov r0, #0x58
    mov r3, #0x74
    bl func_0201a21c
    mov r9, r0
    mov r1, #0x0
    mov r2, #0x58
    bl func_020517fc
    mov r0, r9
    mov r1, r6
    strb r4, [r9, #0x42]
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r9, #0x8]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215421c
    add r0, sp, #0x34
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_02154220
    add r0, sp, #0x2c
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r0, #0x100000
    str r0, [sp, #0x28]
    mov r0, r4
    add r1, sp, #0x28
    add r2, sp, #0x24
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r3, [sp, #0x38]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x2c]
    ldr r3, [sp, #0x30]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    mov r0, r4
    add r1, sp, #0x20
    add r2, sp, #0x1c
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r3, [sp, #0x38]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x34]
    ldr r3, [sp, #0x38]
    ldr r2, .L_02154224
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x2c]
    mov r2, #0x0
    ldr r3, [sp, #0x30]
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x2c]
    mov r2, #0x0
    ldr r3, [sp, #0x30]
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    blx func_ov012_021b409c
    ldr r0, [r4, #0x4]
    ldr r2, .L_02154228
    mov r1, #0x10
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215422c
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r1, .L_02154230
    mov r0, r4
    ldr r1, [r1, #0x0]
    bl func_ov004_0214e3a0
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r6
    mov r1, r5
    bl func_ov004_0214e478
    str r5, [r9, #0x10]
    mov r0, r5
    str r6, [r9, #0x14]
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0xc5
    mov r2, #0x1
    mov r3, #0x6
    bl func_0206ad90
    mov r1, #0x1
    str r0, [r9, #0x3c]
    bl func_ov004_021545f8
    mov r1, r4
    mov r0, r9
    bl func_ov004_0214ed84
    mov r8, r0
    str r8, [r9, #0xc]
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r5, .L_02154234
    ldr r4, .L_02154238
    ldr r11, .L_02154230
    mov r7, #0x0
.L_02153eec:
    ldr r1, [r11, #0x0]
    mov r0, r8
    bl func_ov004_0214e3a0
    mov r10, r0
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x30
    mul r1, r7, r0
    add r0, r1, #0x2a
    str r0, [sp, #0x0]
    add r2, r1, #0x5
    add r0, sp, #0xc
    mov r1, #0x5
    mov r3, #0xfa
    bl func_ov004_0214e6e4
    ldr r1, .L_0215423c
    ldr r2, .L_02154240
    ldr r3, .L_02154244
    mov r0, #0x70
    bl func_0201a21c
    movs r6, r0
    beq .L_02153f70
    ldr r2, .L_02154248
    mov r1, #0x0
    blx func_ov012_021b054c
    add r0, r6, #0x68
    add r1, sp, #0xc
    str r5, [r6, #0x0]
    bl func_ov004_0214e6d0
    str r4, [r6, #0x0]
.L_02153f70:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02153f8c
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02153f8c:
    ldr r1, [r6, #0x18]
    mov r0, r10
    bl func_02020e98
    ldr r0, [r10, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x4]
    bl func_02023940
    ldr r2, .L_02154220
    add r0, sp, #0x4
    mov r1, r10
    bl func_ov004_02151ebc
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    add r7, r7, #0x1
    ldr r0, [r10, #0x4]
    cmp r7, #0x4
    str r7, [r0, #0x124]
    blt .L_02153eec
    mov r10, #0x0
    mov r7, #0x820000
    mov r11, #0x1
    mov r5, #0x80000
    mov r4, #0x2f
.L_02154044:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, r7
    mov r2, r11
    mov r3, #0x1f
    bl func_ov004_0214e9f0
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mul r0, r10, r4
    add r0, r0, #0x19
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x18]
    mov r0, r6
    add r1, sp, #0x14
    add r2, sp, #0x18
    str r5, [sp, #0x14]
    bl func_ov004_0214e1b8
    mov r0, r8
    mov r1, r6
    bl func_ov004_0214e478
    add r0, r9, r10, lsl #0x2
    add r10, r10, #0x1
    str r6, [r0, #0x18]
    cmp r10, #0x4
    blt .L_02154044
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x820000
    mov r2, #0x0
    mov r3, #0x20
    bl func_ov004_0214e9f0
    mov r10, r0
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r8
    mov r1, r10
    bl func_ov004_0214e478
    mov r5, #0x1
    str r10, [r9, #0x28]
    mov r7, #0x0
    mov r6, #0x80
    mov r4, #0x7
    mov r11, r5
.L_0215410c:
    mov r0, r10
    bl func_ov004_021545b0
    add r1, r7, #0x41
    mov r1, r1, lsl #0x10
    mov r2, r5
    mov r1, r1, lsr #0x10
    mov r3, r4
    str r6, [sp, #0x0]
    bl func_0206ad90
    add r1, r9, r7, lsl #0x2
    str r0, [r1, #0x30]
    mov r1, r11
    bl func_ov004_021545f8
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_0215410c
    mov r0, r10
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x41
    mov r2, #0x3
    mov r3, #0x6
    bl func_0206ad90
    str r0, [r9, #0x2c]
    mov r1, #0x1
    bl func_ov004_021545f8
    ldr r0, [r8, #0x4]
    blx func_ov012_021b65d8
    bl func_02026f94
    str r0, [r9, #0x0]
    mov r0, #0x80000
    str r0, [sp, #0x40]
    ldr r0, [r9, #0x0]
    add r1, sp, #0x40
    bl func_ov004_02152ca0
    ldr r0, [r9, #0x0]
    ldr r1, .L_0215424c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_02026f94
    str r0, [r9, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x3c]
    ldr r0, [r9, #0x4]
    add r1, sp, #0x3c
    bl func_ov004_02152ca0
    ldr r0, [r9, #0x4]
    ldr r1, .L_02154250
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x4]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r9
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02154214: .word data_ov004_02160ea4
.L_02154218: .word data_ov004_02160e80
.L_0215421c: .word data_ov004_02160ec0
.L_02154220: .word data_ov004_02160ecc
.L_02154224: .word 0x494c
.L_02154228: .word func_ov004_0215461c
.L_0215422c: .word func_ov004_02154720
.L_02154230: .word data_ov012_021d5154
.L_02154234: .word data_ov004_0216094c
.L_02154238: .word data_ov012_021d1c58
.L_0215423c: .word data_ov004_021608f4
.L_02154240: .word data_ov004_02160e78
.L_02154244: .word 0x1b2
.L_02154248: .word data_02093c8c
.L_0215424c: .word func_ov004_02154870
.L_02154250: .word func_ov004_021548d8
    arm_func_end func_ov004_02153bfc

    .global func_ov004_02154254
    arm_func_start func_ov004_02154254
func_ov004_02154254: ; 0x02154254
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_02154278
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02154278:
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_02154290
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02154290:
    ldr r0, [r5, #0x3c]
    cmp r0, #0x0
    beq .L_021542a0
    bl func_0206ae98
.L_021542a0:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_021542b0
    bl func_0206ae98
.L_021542b0:
    mov r4, #0x0
.L_021542b4:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    beq .L_021542c8
    bl func_0206ae98
.L_021542c8:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_021542b4
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_02154254

    .global func_ov004_021542e0
    arm_func_start func_ov004_021542e0
func_ov004_021542e0: ; 0x021542e0
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x8]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    mov r1, #0x0
    strb r1, [r4, #0x40]
    mov r0, r4
    strb r1, [r4, #0x41]
    bl func_ov004_02154ac4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021542e0

    .global func_ov004_0215431c
    arm_func_start func_ov004_0215431c
func_ov004_0215431c: ; 0x0215431c
    cmp r0, #0x0
    ldrneb r0, [r0, #0x40]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov004_0215431c

    .global func_ov004_0215432c
    arm_func_start func_ov004_0215432c
func_ov004_0215432c: ; 0x0215432c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x8]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    mov r1, #0x0
    strb r1, [r4, #0x40]
    mov r0, r4
    strb r1, [r4, #0x41]
    bl func_ov004_02154ac4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215432c

    .global func_ov004_02154368
    arm_func_start func_ov004_02154368
func_ov004_02154368: ; 0x02154368
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x1
    strb r1, [r4, #0x41]
    bl func_ov004_02154ac4
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02154368

    .global func_ov004_0215438c
    arm_func_start func_ov004_0215438c
func_ov004_0215438c: ; 0x0215438c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r0, #0x0
    strb r0, [r4, #0x41]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215438c

    .global func_ov004_021543ac
    arm_func_start func_ov004_021543ac
func_ov004_021543ac: ; 0x021543ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    bge .L_021543c4
    bl func_ov004_0214f704
    mov r1, r0
.L_021543c4:
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021543ac

    .global func_ov004_021543dc
    arm_func_start func_ov004_021543dc
func_ov004_021543dc: ; 0x021543dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    bge .L_021543f4
    bl func_ov004_0214f704
    mov r1, r0
.L_021543f4:
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x44]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021543dc

    .global func_ov004_02154400
    arm_func_start func_ov004_02154400
func_ov004_02154400: ; 0x02154400
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov004_021547c4
    ldr r0, [r4, #0x2c]
    ldr r1, .L_02154440
    mov r2, #0x6
    mov r3, #0x2
    bl func_ov004_021547f4
    ldr r0, [r4, #0x2c]
    mov r1, #0x0
    bl func_ov004_021547a0
    ldr r0, [r4, #0x0]
    ldr r1, .L_02154444
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02154440: .word 0x8df
.L_02154444: .word func_ov004_02154874
    arm_func_end func_ov004_02154400

    .global func_ov004_02154448
    arm_func_start func_ov004_02154448
func_ov004_02154448: ; 0x02154448
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x2c]
    mov r1, #0x0
    bl func_ov004_021545f8
    mov r0, r4
    mov r1, #0x1
    bl func_ov004_02154750
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02154448

    .global func_ov004_0215446c
    arm_func_start func_ov004_0215446c
func_ov004_0215446c: ; 0x0215446c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    ldr r0, [r7, #0x3c]
    ldr r1, .L_021544ec
    mov r2, #0x14
    mov r3, #0x1
    bl func_ov004_021547f4
    ldr r0, [r7, #0x3c]
    mov r1, #0x0
    bl func_ov004_021547a0
    mov r0, r7
    bl func_ov004_021547c4
    ldr r0, [r7, #0x2c]
    mov r1, #0x0
    bl func_ov004_021545f8
    mov r0, r7
    mov r1, r6
    mov r2, #0x1
    bl func_ov004_02154814
    mov r5, #0x0
    mov r4, r5
.L_021544c4:
    cmp r5, r6
    beq .L_021544dc
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov004_02154814
.L_021544dc:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_021544c4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021544ec: .word 0x7fff
    arm_func_end func_ov004_0215446c

    .global func_ov004_021544f0
    arm_func_start func_ov004_021544f0
func_ov004_021544f0: ; 0x021544f0
    stmdb sp!, {r4, lr}
    add r0, r0, r1, lsl #0x2
    cmp r2, #0x0
    ldr r4, [r0, #0x18]
    beq .L_02154518
    cmp r2, #0x1
    beq .L_02154530
    cmp r2, #0x2
    beq .L_0215456c
    ldmia sp!, {r4, pc}
.L_02154518:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r4, pc}
.L_02154530:
    ldr r0, [r4, #0x4]
    ldr r1, .L_021545a8
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
    ldmia sp!, {r4, pc}
.L_0215456c:
    ldr r0, [r4, #0x4]
    ldr r1, .L_021545ac
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
    ldmia sp!, {r4, pc}
.L_021545a8: .word 0x820002
.L_021545ac: .word 0x820001
    arm_func_end func_ov004_021544f0

    .global func_ov004_021545b0
    arm_func_start func_ov004_021545b0
func_ov004_021545b0: ; 0x021545b0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r4, [r0, #0x2c]
    cmp r4, #0x0
    bne .L_021545d4
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r4, r0
.L_021545d4:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_021545f0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_021545f0:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021545b0

    .global func_ov004_021545f8
    arm_func_start func_ov004_021545f8
func_ov004_021545f8: ; 0x021545f8
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0215460c
    bl func_0206af1c
.L_0215460c:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021545f8

    .global func_ov004_0215461c
    arm_func_start func_ov004_0215461c
func_ov004_0215461c: ; 0x0215461c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r5, #0x0
    ldr r4, [r0, #0x10]
    mov r7, #0x1
    b .L_0215468c
.L_02154638:
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, r6
    beq .L_0215466c
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xc0]
    blx r2
    bl func_ov004_0214e3ec
.L_0215466c:
    cmp r5, #0x0
    beq .L_02154688
    ldr r0, [r0, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02154688:
    add r5, r5, #0x1
.L_0215468c:
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r5, r0
    blo .L_02154638
    ldr r0, [r4, #0x28]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r6, #0x0
    mov r5, r6
.L_021546c4:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x18]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_021546c4
    ldr r0, [r4, #0x3c]
    mov r1, #0x1
    bl func_ov004_021545f8
    mov r6, #0x0
    mov r5, r6
.L_02154700:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov004_02154814
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_02154700
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov004_0215461c

    .global func_ov004_02154720
    arm_func_start func_ov004_02154720
func_ov004_02154720: ; 0x02154720
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x1
    ldr r4, [r1, #0x10]
    strb r0, [r4, #0x40]
    strb r0, [r4, #0x41]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    mov r0, r4
    bl func_ov004_02154ac4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02154720

    .global func_ov004_02154750
    arm_func_start func_ov004_02154750
func_ov004_02154750: ; 0x02154750
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, .L_0215479c
    mov r2, #0x6
    mla r5, r1, r2, r3
    mov r4, #0x0
    mov r6, r0
    mov r7, r4
.L_0215476c:
    mov r0, r4, lsl #0x1
    add r2, r6, r4, lsl #0x2
    ldrh r3, [r5, r0]
    ldr r0, [r2, #0x30]
    mov r1, r7
    strh r3, [r0, #0x16]
    ldr r0, [r2, #0x30]
    bl func_ov004_021547a0
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0215476c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215479c: .word data_ov004_021603f4
    arm_func_end func_ov004_02154750

    .global func_ov004_021547a0
    arm_func_start func_ov004_021547a0
func_ov004_021547a0: ; 0x021547a0
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_021547b4
    bl func_0206af1c
.L_021547b4:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021547a0

    .global func_ov004_021547c4
    arm_func_start func_ov004_021547c4
func_ov004_021547c4: ; 0x021547c4
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r6, r0
    mov r4, r5
.L_021547d4:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x30]
    mov r1, r4
    bl func_ov004_021545f8
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_021547d4
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov004_021547c4

    .global func_ov004_021547f4
    arm_func_start func_ov004_021547f4
func_ov004_021547f4: ; 0x021547f4
    strh r1, [r0, #0x16]
    strb r2, [r0, #0x18]
    mov r1, #0x1
    strb r1, [r0, #0x19]
    strb r3, [r0, #0x1b]
    mov r1, #0x0
    strb r1, [r0, #0x1a]
    bx lr
    arm_func_end func_ov004_021547f4

    .global func_ov004_02154814
    arm_func_start func_ov004_02154814
func_ov004_02154814: ; 0x02154814
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r3, #0x30
    mul r3, r1, r3
    mov r1, r3, asr #0x2
    add r1, r3, r1, lsr #0x1d
    cmp r2, #0x0
    mov r2, r1, asr #0x3
    add r1, r2, #0x6
    mov r5, r0
    movne r4, #0xc
    str r1, [sp, #0x0]
    add r0, sp, #0x4
    mov r1, #0x0
    mov r3, #0x20
    moveq r4, #0xb
    bl func_ov004_0214e6e4
    ldr r0, [r5, #0x10]
    add r1, sp, #0x4
    mov r2, r4
    bl func_ov004_0214e958
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov004_02154814

    .global func_ov004_02154870
    arm_func_start func_ov004_02154870
func_ov004_02154870: ; 0x02154870
    bx lr
    arm_func_end func_ov004_02154870

    .global func_ov004_02154874
    arm_func_start func_ov004_02154874
func_ov004_02154874: ; 0x02154874
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r2, #0x1
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x4]
    ldrb r0, [r1, #0x28]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r1, #0x34]
    ldreq r0, [r0, #0x244]
    cmpeq r0, #0x0
    moveq r2, #0x0
    cmp r2, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_ov004_02154750
    ldr r0, [r4, #0x0]
    ldr r1, .L_021548d4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021548d4: .word func_ov004_02154870
    arm_func_end func_ov004_02154874

    .global func_ov004_021548d8
    arm_func_start func_ov004_021548d8
func_ov004_021548d8: ; 0x021548d8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r0, [r4, #0x41]
    cmp r0, #0x0
    beq .L_02154abc
    mov r6, #0x0
    b .L_02154ab0
.L_021548fc:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bge .L_02154aac
    ldrb r0, [r4, #0x42]
    cmp r0, #0x0
    mov r0, r6
    beq .L_02154930
    bl func_020875b0
    mov r7, r0
    mov r0, r6
    bl func_020875d8
    b .L_02154940
.L_02154930:
    bl func_02028920
    mov r7, r0
    mov r0, r6
    bl func_020208ec
.L_02154940:
    ldr r2, [r7, #0x0]
    mov r5, r0
    ldr r0, [r2, #0x74]
    ldr r1, [r2, #0x70]
    add r0, r2, r0, lsl #0x2
    add r1, r2, r1, lsl #0x2
    ldr r0, [r0, #0x18]
    ldr r1, [r1, #0x18]
    mvn r0, r0
    and r0, r1, r0
    tst r0, #0x40
    movne r0, #0x0
    bne .L_02154a20
    tst r0, #0x80
    movne r0, #0x1
    bne .L_02154a20
    tst r0, #0x10
    movne r0, #0x2
    bne .L_02154a20
    tst r0, #0x20
    movne r0, #0x3
    bne .L_02154a20
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x130]
    blx r1
    cmp r0, #0x0
    beq .L_02154a1c
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    ldr r1, [r1, #0x50]
    ldr r3, [r1, #0x10]
    ldr r5, [r1, #0xc]
    mov r2, r3, asr #0xb
    mov r1, r5, asr #0xb
    add r1, r5, r1, lsr #0x14
    add r2, r3, r2, lsr #0x14
    mov ip, r1, asr #0xc
    mov r5, r2, asr #0xc
    mov r1, #0x2f
    b .L_02154a14
.L_021549e4:
    mul r2, r0, r1
    cmp ip, #0x5
    add r3, r2, #0x5
    add r2, r2, #0x2a
    blt .L_02154a10
    cmp ip, #0xfa
    bgt .L_02154a10
    cmp r5, r3
    blt .L_02154a10
    cmp r5, r2
    ble .L_02154a20
.L_02154a10:
    add r0, r0, #0x1
.L_02154a14:
    cmp r0, #0x4
    blt .L_021549e4
.L_02154a1c:
    mvn r0, #0x0
.L_02154a20:
    add r1, r4, r6, lsl #0x2
    str r0, [r1, #0x44]
    cmp r0, #0x0
    blt .L_02154aac
    bl func_ov004_0214f704
    cmp r6, r0
    bne .L_02154aac
    mov r0, #0x78
    mov r1, #0xb
    bl func_0207342c
    add r2, r4, r6, lsl #0x2
    mov r0, r4
    mov r1, #0x0
    ldr r5, [r2, #0x44]
    bl func_ov004_02154750
    ldr r0, [r4, #0x2c]
    mov r1, #0x0
    bl func_ov004_021545f8
    mov r0, #0x2f
    mul r0, r5, r0
    add r0, r0, #0x19
    mov r1, r0, lsl #0xc
    mov r0, #0x80000
    str r1, [sp, #0x4]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x28]
    add r1, sp, #0x0
    add r2, sp, #0x4
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x28]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02154aac:
    add r6, r6, #0x1
.L_02154ab0:
    bl func_ov004_0214f72c
    cmp r6, r0
    blt .L_021548fc
.L_02154abc:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov004_021548d8

    .global func_ov004_02154ac4
    arm_func_start func_ov004_02154ac4
func_ov004_02154ac4: ; 0x02154ac4
    mov r3, #0x0
    mvn r2, #0x0
.L_02154acc:
    add r1, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r1, #0x44]
    cmp r3, #0x4
    blt .L_02154acc
    bx lr
    arm_func_end func_ov004_02154ac4

    .global func_ov004_02154ae4
    arm_func_start func_ov004_02154ae4
func_ov004_02154ae4: ; 0x02154ae4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r5, r1
    mov r4, r0
    ldr r1, .L_02154cd4
    ldr r2, .L_02154cd8
    mov r0, #0xf8
    mov r3, #0xaa
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0xf8
    mov r9, r0
    bl func_020517fc
    ldr r1, .L_02154cdc
    ldr r0, .L_02154ce0
    ldr r2, [r1, #0x0]
    ldr r7, [r5, #0x4]
    sub r5, r2, #0x1
    ldr r3, [r0, #0x0]
    ldr r2, .L_02154ce4
    str r7, [r0, #0x0]
    ldr r6, .L_02154ce8
    str r5, [r1, #0x0]
    str r3, [r2, r5, lsl #0x2]
    mov r7, #0x0
    mov r5, #0x76000
    mov r11, #0x810000
.L_02154b50:
    mov r0, r11
    bl func_020329ec
    mov r8, r0
    ldr r1, [r8, #0x18]
    cmp r1, #0x0
    bne .L_02154b74
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02154b74:
    ldr r8, [r8, #0x18]
    add r1, sp, #0x4
    ldr r0, [r8, #0x4]
    str r5, [sp, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldrsb r1, [r6, #0x2]
    mov r0, r8
    mov r1, r1, lsl #0x2
    add r1, r1, #0x39
    bl func_ov004_02154cf0
    ldrsb r0, [r6, #0x0]
    ldrsb r2, [r6, #0x1]
    ldr r1, [r8, #0x4]
    add r0, r0, #0x80
    add r2, r2, #0x58
    ldr r10, [r1, #0x50]
    mov r0, r0, lsl #0xc
    mov r2, r2, lsl #0xc
    str r0, [r10, #0xc]
    str r2, [r10, #0x10]
    ldrb r0, [r10, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_02154bf0
    mov r0, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_02154bf0:
    ldrb r0, [r10, #0x24]
    mov r1, #0x1
    orr r0, r0, #0x31
    strb r0, [r10, #0x24]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r10, [r8, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r10
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r9, r7, lsl #0x2
    add r7, r7, #0x1
    str r8, [r0, #0x4]
    cmp r7, #0x3c
    add r6, r6, #0x4
    blt .L_02154b50
    ldr r1, .L_02154cdc
    ldr r2, .L_02154ce4
    ldr r3, [r1, #0x0]
    ldr r0, .L_02154ce0
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r2, [r0, #0x0]
    str r3, [r1, #0x0]
    mov r0, #0x3c
    strb r0, [r9, #0xf4]
    strb r0, [r9, #0xf5]
    bl func_02026f94
    str r0, [r9, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r9, #0x0]
    ldr r1, .L_02154cec
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r9
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02154cd4: .word data_ov004_02160ef4
.L_02154cd8: .word data_ov004_02160ed4
.L_02154cdc: .word data_02093c08
.L_02154ce0: .word data_020a0dd0
.L_02154ce4: .word data_020a16d0
.L_02154ce8: .word data_ov004_02160410
.L_02154cec: .word func_ov004_02154d68
    arm_func_end func_ov004_02154ae4

    .global func_ov004_02154cf0
    arm_func_start func_ov004_02154cf0
func_ov004_02154cf0: ; 0x02154cf0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    strh r1, [r0, #0x4a]
    bx lr
    arm_func_end func_ov004_02154cf0

    .global func_ov004_02154d00
    arm_func_start func_ov004_02154d00
func_ov004_02154d00: ; 0x02154d00
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02154d00

    .global func_ov004_02154d28
    arm_func_start func_ov004_02154d28
func_ov004_02154d28: ; 0x02154d28
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x3c
    smulbb r0, r1, r0
    add r0, r0, #0xe7
    add r0, r0, #0x300
    mov r1, #0x3e8
    bl func_0200d12c
    mov r0, r0, lsl #0x18
    movs r0, r0, asr #0x18
    movmi r0, #0x0
    cmp r0, #0x3c
    movgt r0, #0x3c
    strb r0, [r4, #0xf5]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02154d28

    .global func_ov004_02154d68
    arm_func_start func_ov004_02154d68
func_ov004_02154d68: ; 0x02154d68
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r0, [r0, #0x4]
    ldr r6, [r0, #0x10]
    ldrsb r1, [r6, #0xf5]
    ldrsb r0, [r6, #0xf4]
    cmp r0, r1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r1, #0x28
    ldr r4, .L_02154e40
    movgt r7, #0x1
    bgt .L_02154da0
    cmp r1, #0x14
    movgt r7, #0x2
    movle r7, #0x3
.L_02154da0:
    mov r5, #0x0
    b .L_02154de0
.L_02154da8:
    ldrsb r0, [r4, #0x2]
    add r1, r6, r5, lsl #0x2
    ldr r8, [r1, #0x4]
    mov r1, r0, lsl #0x2
    mov r0, r8
    add r9, r1, #0x38
    bl func_ov004_02154e44
    cmp r9, r0
    beq .L_02154dd8
    mov r0, r8
    mov r1, r9
    bl func_ov004_02154cf0
.L_02154dd8:
    add r5, r5, #0x1
    add r4, r4, #0x4
.L_02154de0:
    ldrsb r0, [r6, #0xf5]
    rsb r0, r0, #0x3c
    cmp r5, r0
    blt .L_02154da8
    b .L_02154e2c
.L_02154df4:
    ldrsb r0, [r4, #0x2]
    add r1, r6, r5, lsl #0x2
    ldr r8, [r1, #0x4]
    add r1, r7, r0, lsl #0x2
    mov r0, r8
    add r9, r1, #0x38
    bl func_ov004_02154e44
    cmp r9, r0
    beq .L_02154e24
    mov r0, r8
    mov r1, r9
    bl func_ov004_02154cf0
.L_02154e24:
    add r5, r5, #0x1
    add r4, r4, #0x4
.L_02154e2c:
    cmp r5, #0x3c
    blt .L_02154df4
    ldrsb r0, [r6, #0xf5]
    strb r0, [r6, #0xf4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02154e40: .word data_ov004_02160410
    arm_func_end func_ov004_02154d68

    .global func_ov004_02154e44
    arm_func_start func_ov004_02154e44
func_ov004_02154e44: ; 0x02154e44
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrsh r0, [r0, #0x4a]
    bx lr
    arm_func_end func_ov004_02154e44

    .global func_ov004_02154e54
    arm_func_start func_ov004_02154e54
func_ov004_02154e54: ; 0x02154e54
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02154f34
    mov r5, r0
    ldr r2, .L_02154f38
    mov r0, #0x4
    mov r3, #0x25
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x4
    mov r4, r0
    bl func_020517fc
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x20]
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    bne .L_02154ea8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02154ea8:
    ldr r0, [r5, #0x38]
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    mov r5, r0
    ldr r1, [r5, #0x18]
    cmp r1, #0x0
    bne .L_02154edc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02154edc:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0xcf
    mov r2, #0x1
    mov r3, #0x5
    bl func_0206ad90
    ldr r1, .L_02154f3c
    str r0, [r4, #0x0]
    strh r1, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x3
    strb r1, [r0, #0x1c]
    mov r1, #0x1
    strb r1, [r0, #0x1b]
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    bl func_ov004_02154f40
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02154f34: .word data_ov004_02160f30
.L_02154f38: .word data_ov004_02160f0c
.L_02154f3c: .word 0x7fff
    arm_func_end func_ov004_02154e54

    .global func_ov004_02154f40
    arm_func_start func_ov004_02154f40
func_ov004_02154f40: ; 0x02154f40
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_02154f54
    bl func_0206af1c
.L_02154f54:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02154f40

    .global func_ov004_02154f64
    arm_func_start func_ov004_02154f64
func_ov004_02154f64: ; 0x02154f64
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02154f80
    bl func_0206ae98
.L_02154f80:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02154f64

    .global func_ov004_02154f8c
    arm_func_start func_ov004_02154f8c
func_ov004_02154f8c: ; 0x02154f8c
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    mov r4, r1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, .L_02155004
    cmp r4, r0
    bgt .L_02154fb0
    cmp r4, #0x0
    bne .L_02154fc0
.L_02154fb0:
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    bl func_ov004_02154f40
    ldmia sp!, {r3, r4, r5, pc}
.L_02154fc0:
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    mov r0, r4
    mov r1, #0x32
    bl func_0200d12c
    rsb r1, r1, #0x31
    mov r0, #0x3c
    mul r0, r1, r0
    mov r1, #0x32
    bl func_0200d12c
    cmp r0, #0x1e
    ldr r1, [r5, #0x0]
    rsbge r0, r0, #0x3b
    strb r0, [r1, #0x11]
    ldmia sp!, {r3, r4, r5, pc}
.L_02155004: .word 0x18f
    arm_func_end func_ov004_02154f8c

    .global func_ov004_02155008
    arm_func_start func_ov004_02155008
func_ov004_02155008: ; 0x02155008
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_ov004_02154f40
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02155008

    .global func_ov004_02155024
    arm_func_start func_ov004_02155024
func_ov004_02155024: ; 0x02155024
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r5, r1
    mov r4, r0
    ldr r1, .L_02155228
    ldr r2, .L_0215522c
    mov r0, #0x1c
    mov r3, #0x58
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x1c
    mov r9, r0
    bl func_020517fc
    ldr r1, .L_02155230
    ldr r0, .L_02155234
    ldr r2, [r1, #0x0]
    ldr r7, [r5, #0x4]
    sub r5, r2, #0x1
    ldr r3, [r0, #0x0]
    ldr r2, .L_02155238
    str r7, [r0, #0x0]
    ldr r6, .L_0215523c
    str r5, [r1, #0x0]
    str r3, [r2, r5, lsl #0x2]
    mov r7, #0x0
    mov r5, #0x74000
    mov r11, #0x810000
.L_02155090:
    mov r0, r11
    bl func_020329ec
    mov r8, r0
    ldr r1, [r8, #0x18]
    cmp r1, #0x0
    bne .L_021550b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021550b4:
    ldr r8, [r8, #0x18]
    add r1, sp, #0x4
    ldr r0, [r8, #0x4]
    str r5, [sp, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldrsb r1, [r6, #0x2]
    ldr r0, [r8, #0x4]
    mov r2, #0x0
    orr r1, r1, #0x810000
    bl func_02023894
    ldr r0, [r8, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldrsb r0, [r6, #0x0]
    ldrsb r2, [r6, #0x1]
    ldr r1, [r8, #0x4]
    add r0, r0, #0x80
    add r2, r2, #0x17
    ldr r10, [r1, #0x50]
    mov r0, r0, lsl #0xc
    mov r2, r2, lsl #0xc
    str r0, [r10, #0xc]
    str r2, [r10, #0x10]
    ldrb r0, [r10, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_02155144
    mov r0, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_02155144:
    ldrb r0, [r10, #0x24]
    mov r1, #0x1
    orr r0, r0, #0x31
    strb r0, [r10, #0x24]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r10, [r8, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r10
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r9, r7, lsl #0x2
    add r7, r7, #0x1
    str r8, [r0, #0x4]
    cmp r7, #0x5
    add r6, r6, #0x3
    blt .L_02155090
    ldr r1, .L_02155230
    ldr r2, .L_02155238
    ldr r3, [r1, #0x0]
    ldr r0, .L_02155234
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r2, [r0, #0x0]
    str r3, [r1, #0x0]
    mov r0, #0x0
    strh r0, [r9, #0x18]
    strh r0, [r9, #0x1a]
    bl func_02026f94
    str r0, [r9, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r9, #0x0]
    ldr r1, .L_02155240
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r9
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02155228: .word data_ov004_02160f6c
.L_0215522c: .word data_ov004_02160f4c
.L_02155230: .word data_02093c08
.L_02155234: .word data_020a0dd0
.L_02155238: .word data_020a16d0
.L_0215523c: .word data_ov004_02160500
.L_02155240: .word func_ov004_02155294
    arm_func_end func_ov004_02155024

    .global func_ov004_02155244
    arm_func_start func_ov004_02155244
func_ov004_02155244: ; 0x02155244
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02155244

    .global func_ov004_0215526c
    arm_func_start func_ov004_0215526c
func_ov004_0215526c: ; 0x0215526c
    cmp r0, #0x0
    bxeq lr
    ldr r2, .L_02155290
    cmp r1, #0x0
    movlt r1, #0x0
    cmp r1, r2
    movgt r1, r2
    strh r1, [r0, #0x1a]
    bx lr
.L_02155290: .word 0x3e7
    arm_func_end func_ov004_0215526c

    .global func_ov004_02155294
    arm_func_start func_ov004_02155294
func_ov004_02155294: ; 0x02155294
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    ldr r0, [r0, #0x4]
    ldr r8, [r0, #0x10]
    ldrsh r4, [r8, #0x1a]
    ldrsh r0, [r8, #0x18]
    cmp r0, r4
    beq .L_021553f8
    ldr r0, .L_02155400
    cmp r4, r0
    movgt r9, #0x1000
    bgt .L_0215534c
    mov r0, r4
    mov r1, #0x64
    bl func_0200d12c
    mov r0, r1, lsl #0xe
    mov r1, #0x64
    bl func_0200d12c
    mov r0, r0, lsl #0x1
    bl func_0200c954
    mov r1, r0
    ldr r0, .L_02155404
    bl func_0200c9e4
    ldr r1, .L_02155408
    bl func_0200c5ac
    mov r1, r0
    ldr r0, .L_0215540c
    bl func_0200c9e4
    bl func_0200c8e0
    bl func_0200c954
    ldr r1, .L_0215540c
    bl func_0200c5ac
    bl func_0200c85c
    blx func_02009c54
    bl func_0200b6c4
    mov r1, r0
    ldr r0, .L_0215540c
    bl func_0200c9e4
    bl func_0200c8e0
    mov r1, r0, asr #0x1f
    mov r1, r1, lsl #0xb
    orr r1, r1, r0, lsr #0x15
    mov r0, r0, lsl #0xb
    mov r0, r0, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    add r9, r0, #0x1000
.L_0215534c:
    mov r0, r4
    mov r1, #0x64
    bl func_0200d12c
    str r0, [sp, #0x4]
    mov r0, r4
    mov r1, #0x64
    bl func_0200d12c
    mov r4, r1
    mov r0, r4
    mov r1, #0xa
    bl func_0200d12c
    str r0, [sp, #0x8]
    mov r0, r4
    mov r1, #0xa
    bl func_0200d12c
    mov r4, r1
    mov r7, #0x0
    str r4, [sp, #0xc]
    add r5, sp, #0x4
    mov r4, r7
.L_0215539c:
    add r0, r8, r7, lsl #0x2
    ldr r6, [r0, #0xc]
    ldr r1, [r5, r7, lsl #0x2]
    ldr r0, [r6, #0x4]
    add r1, r1, #0xe
    mov r2, r4
    orr r1, r1, #0x810000
    bl func_02023894
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_0215539c
    ldr r0, [r8, #0xc]
    add r1, sp, #0x0
    str r9, [sp, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020235dc
    ldrsh r0, [r8, #0x1a]
    strh r0, [r8, #0x18]
.L_021553f8:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02155400: .word 0x18f
.L_02155404: .word 0x40490fdb
.L_02155408: .word 0x47800000
.L_0215540c: .word 0x45800000
    arm_func_end func_ov004_02155294

    .global func_ov004_02155410
    arm_func_start func_ov004_02155410
func_ov004_02155410: ; 0x02155410
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr r1, .L_021554e0
    ldr r2, .L_021554e4
    mov r0, #0x4
    mov r3, #0x20
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x4
    mov r4, r0
    bl func_020517fc
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x91
    str r0, [r4, #0x0]
    str r1, [sp, #0x0]
    add r0, sp, #0x4
    mov r1, #0x9
    mov r2, #0x1f
    mov r3, #0xf7
    bl func_ov004_0214e6e4
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    add r2, sp, #0x4
    bl func_ov004_021554e8
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    mov r2, #0x1f
    bl func_ov004_02155520
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov004_02155538
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    bl func_ov004_02155550
    ldr r0, [r4, #0x0]
    mov r1, #0x1f
    bl func_ov004_02155564
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov004_02155578
    cmp r4, #0x0
    beq .L_021554d4
    ldr r0, [r4, #0x0]
    mov r1, #0x16
    mov r2, #0x0
    bl func_ov004_0214cee0
.L_021554d4:
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_021554e0: .word data_ov004_02160fc8
.L_021554e4: .word data_ov004_02160fa4
    arm_func_end func_ov004_02155410

    .global func_ov004_021554e8
    arm_func_start func_ov004_021554e8
func_ov004_021554e8: ; 0x021554e8
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
    arm_func_end func_ov004_021554e8

    .global func_ov004_02155520
    arm_func_start func_ov004_02155520
func_ov004_02155520: ; 0x02155520
    ldr r3, [r0, #0x4]
    mov r0, #0x1
    strb r0, [r3, #0x901]
    add r0, r3, r1, lsl #0x2
    str r2, [r0, #0x8c8]
    bx lr
    arm_func_end func_ov004_02155520

    .global func_ov004_02155538
    arm_func_start func_ov004_02155538
func_ov004_02155538: ; 0x02155538
    ldr r3, [r0, #0x4]
    mov r0, #0x1
    strb r0, [r3, #0x901]
    add r0, r3, r1
    strb r2, [r0, #0x8fd]
    bx lr
    arm_func_end func_ov004_02155538

    .global func_ov004_02155550
    arm_func_start func_ov004_02155550
func_ov004_02155550: ; 0x02155550
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    strb r1, [r2, #0x8ff]
    strb r0, [r2, #0x901]
    bx lr
    arm_func_end func_ov004_02155550

    .global func_ov004_02155564
    arm_func_start func_ov004_02155564
func_ov004_02155564: ; 0x02155564
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    strb r0, [r2, #0x901]
    str r1, [r2, #0x8d4]
    bx lr
    arm_func_end func_ov004_02155564

    .global func_ov004_02155578
    arm_func_start func_ov004_02155578
func_ov004_02155578: ; 0x02155578
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
    arm_func_end func_ov004_02155578

    .global func_ov004_021555a0
    arm_func_start func_ov004_021555a0
func_ov004_021555a0: ; 0x021555a0
    stmdb sp!, {r4, lr}
    movs r4, r0
    beq .L_021555bc
    ldr r0, [r4, #0x0]
    mov r1, #0x16
    mov r2, #0x0
    bl func_ov004_0214cee0
.L_021555bc:
    mov r1, #0x0
    ldr r0, [r4, #0x0]
    mov r2, r1
    bl func_ov004_02155578
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov004_02155578
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021555a0

    .global func_ov004_021555e8
    arm_func_start func_ov004_021555e8
func_ov004_021555e8: ; 0x021555e8
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r1, #0x0
    mov r1, #0x16
    ldr r0, [r0, #0x0]
    beq .L_02155610
    sub r2, r1, #0x1e
    bl func_ov004_0214cee0
    ldmia sp!, {r3, pc}
.L_02155610:
    mov r2, #0x0
    bl func_ov004_0214cee0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021555e8

    .global func_ov004_0215561c
    arm_func_start func_ov004_0215561c
func_ov004_0215561c: ; 0x0215561c
    stmdb sp!, {r4, lr}
    ldr r1, .L_021556b4
    ldr r2, .L_021556b8
    mov r0, #0x4
    mov r3, #0x60
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x4
    mov r4, r0
    bl func_020517fc
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    str r0, [r4, #0x0]
    mov r2, #0x1f
    bl func_ov004_02155520
    mov r1, #0x0
    ldr r0, [r4, #0x0]
    mov r2, r1
    bl func_ov004_02155538
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl func_ov004_02155550
    ldr r0, [r4, #0x0]
    mov r1, #0x1f
    bl func_ov004_02155564
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov004_02155578
    cmp r4, #0x0
    beq .L_021556ac
    ldr r0, [r4, #0x0]
    mov r1, #0x6
    mov r2, #0x0
    bl func_ov004_0214cee0
.L_021556ac:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_021556b4: .word data_ov004_02160fc8
.L_021556b8: .word data_ov004_02160f84
    arm_func_end func_ov004_0215561c

    .global func_ov004_021556bc
    arm_func_start func_ov004_021556bc
func_ov004_021556bc: ; 0x021556bc
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    beq .L_021556e0
    ldr r0, [r4, #0x0]
    mov r1, #0x6
    mov r2, #0x0
    bl func_ov004_0214cee0
.L_021556e0:
    mov r1, #0x0
    ldr r0, [r4, #0x0]
    mov r2, r1
    bl func_ov004_02155578
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov004_02155578
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021556bc

    .global func_ov004_0215570c
    arm_func_start func_ov004_0215570c
func_ov004_0215570c: ; 0x0215570c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    movs r4, r0
    beq .L_02155788
    cmp r1, #0x0
    blt .L_02155760
    mov r0, #0x30
    add r2, r1, #0x1
    mul r3, r2, r0
    mul r2, r1, r0
    sub r3, r3, #0x1
    str r3, [sp, #0x0]
    add r0, sp, #0xc
    mov r1, #0x0
    mov r3, #0xff
    bl func_ov004_0214e6e4
    ldr r0, [r4, #0x0]
    add r2, sp, #0xc
    mov r1, #0x0
    bl func_ov004_021554e8
    b .L_02155788
.L_02155760:
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    bl func_ov004_0214e6e4
    ldr r0, [r4, #0x0]
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov004_021554e8
.L_02155788:
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
    arm_func_end func_ov004_0215570c

    .global func_ov004_02155790
    arm_func_start func_ov004_02155790
func_ov004_02155790: ; 0x02155790
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r1, #0x0
    mov r1, #0x6
    ldr r0, [r0, #0x0]
    beq .L_021557b8
    sub r2, r1, #0xe
    bl func_ov004_0214cee0
    ldmia sp!, {r3, pc}
.L_021557b8:
    mov r2, #0x0
    bl func_ov004_0214cee0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02155790

    .global func_ov004_021557c4
    arm_func_start func_ov004_021557c4
func_ov004_021557c4: ; 0x021557c4
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r1, .L_021558cc
    mov r5, r0
    ldr r2, .L_021558d0
    mov r0, #0x10
    mov r3, #0x32
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    mov r0, r4
    mov r1, r5
    bl func_ov004_0214ed84
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r4, #0x4]
    mov r0, #0x80
    str r0, [sp, #0xc]
    mov r0, #0x60
    str r0, [sp, #0x10]
    bl func_0203b404
    mov r1, #0x70
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    mov r0, r5
    mov r2, #0x810000
    mov r3, #0x34
    bl func_ov004_0214ee60
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r4, #0x8]
    bl func_02026f94
    str r0, [r4, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r1, .L_021558d4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x0]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_021558cc: .word data_ov004_02161004
.L_021558d0: .word data_ov004_02160fe4
.L_021558d4: .word func_ov004_02155a88
    arm_func_end func_ov004_021557c4

    .global func_ov004_021558d8
    arm_func_start func_ov004_021558d8
func_ov004_021558d8: ; 0x021558d8
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_021558fc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021558fc:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021558d8

    .global func_ov004_02155908
    arm_func_start func_ov004_02155908
func_ov004_02155908: ; 0x02155908
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    movs r4, r0
    beq .L_02155964
    mov r1, #0x0
    strb r1, [r4, #0xc]
    bl func_ov004_02155a3c
    mov r2, #0x0
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    bl func_ov004_02155970
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    strb r0, [r4, #0xd]
    ldr r0, [r4, #0x0]
    ldr r1, .L_0215596c
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_02155964:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0215596c: .word func_ov004_02155a8c
    arm_func_end func_ov004_02155908

    .global func_ov004_02155970
    arm_func_start func_ov004_02155970
func_ov004_02155970: ; 0x02155970
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02023700
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02155970

    .global func_ov004_0215598c
    arm_func_start func_ov004_0215598c
func_ov004_0215598c: ; 0x0215598c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    movs r4, r0
    beq .L_021559e0
    mov r1, #0x1
    strb r1, [r4, #0xc]
    bl func_ov004_02155a3c
    mov r2, #0x1000
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    bl func_ov004_02155970
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r1, .L_021559e8
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_021559e0:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_021559e8: .word func_ov004_02155a88
    arm_func_end func_ov004_0215598c

    .global func_ov004_021559ec
    arm_func_start func_ov004_021559ec
func_ov004_021559ec: ; 0x021559ec
    cmp r0, #0x0
    ldrneb r0, [r0, #0xc]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov004_021559ec

    .global func_ov004_021559fc
    arm_func_start func_ov004_021559fc
func_ov004_021559fc: ; 0x021559fc
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    strb r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r1, .L_02155a38
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02155a38: .word func_ov004_02155a88
    arm_func_end func_ov004_021559fc

    .global func_ov004_02155a3c
    arm_func_start func_ov004_02155a3c
func_ov004_02155a3c: ; 0x02155a3c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x8]
    ldr r1, .L_02155a84
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02155a7c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02155a7c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
.L_02155a84: .word 0x31305053
    arm_func_end func_ov004_02155a3c

    .global func_ov004_02155a88
    arm_func_start func_ov004_02155a88
func_ov004_02155a88: ; 0x02155a88
    bx lr
    arm_func_end func_ov004_02155a88

    .global func_ov004_02155a8c
    arm_func_start func_ov004_02155a8c
func_ov004_02155a8c: ; 0x02155a8c
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrsb r0, [r4, #0xd]
    add r0, r0, #0x1
    strb r0, [r4, #0xd]
    ldrsb r1, [r4, #0xd]
    cmp r1, #0x8
    blt .L_02155ae8
    mov r1, #0x1000
    mov r0, r4
    str r1, [sp, #0x4]
    bl func_ov004_02155a3c
    add r1, sp, #0x4
    bl func_ov004_02155970
    mov r0, #0x1
    strb r0, [r4, #0xc]
    ldr r0, [r4, #0x0]
    ldr r1, .L_02155b18
    ldr r0, [r0, #0x4]
    bl func_02028384
    b .L_02155b10
.L_02155ae8:
    mov r0, #0x1000
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r1, r0, asr #0x3
    mov r0, r4
    str r1, [sp, #0x0]
    bl func_ov004_02155a3c
    add r1, sp, #0x0
    bl func_ov004_02155970
.L_02155b10:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02155b18: .word func_ov004_02155a88
    arm_func_end func_ov004_02155a8c

    .global func_ov004_02155b1c
    arm_func_start func_ov004_02155b1c
func_ov004_02155b1c: ; 0x02155b1c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x40
    ldr r1, .L_02155f20
    mov r4, r0
    ldr r2, .L_02155f24
    mov r0, #0x1c
    mov r3, #0x60
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x1c
    mov r9, r0
    bl func_020517fc
    mov r1, #0x0
    mov r0, #0xd
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x76
    str r0, [sp, #0x0]
    add r1, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r4
    mov r2, #0x810000
    mov r3, #0x38
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_02155f28
    ldr r5, [r4, #0x4]
    ldr r4, [r1, #0x0]
    ldr r1, .L_02155f2c
    ldr r2, .L_02155f30
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    movs r6, r0
    beq .L_02155bd8
    ldr r3, .L_02155f34
    mov r1, r5
    mov r2, r4
    blx func_ov012_021af0f8
    mov r6, r0
.L_02155bd8:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02155bf4
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02155bf4:
    ldr r7, [r6, #0x18]
    mov r0, #0x74000
    str r7, [r9, #0x8]
    ldr r2, [r7, #0x4]
    add r1, sp, #0x3c
    str r0, [sp, #0x3c]
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r8, #0x0
    mov r6, #0x810000
    mov r5, #0x26
    mov r4, #0x74
    mov r11, r8
.L_02155c30:
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov004_0214e9f0
    add r1, r9, r8, lsl #0x2
    str r0, [r1, #0xc]
    ldr r0, [r0, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r9, r8, lsl #0x2
    ldr r1, [r0, #0xc]
    ldr r0, [r7, #0x4]
    ldr r10, [r1, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r10
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r8, r8, #0x1
    cmp r8, #0x3
    blt .L_02155c30
    ldr r0, [r7, #0x4]
    bl func_02023940
    ldr r2, .L_02155f38
    add r0, sp, #0x14
    mov r1, r7
    bl func_ov004_02151ebc
    ldr r2, .L_02155f3c
    add r0, sp, #0x1c
    mov r1, r7
    bl func_ov004_02151ebc
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r7, #0x4]
    bl func_020239a0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0xd000
    str r0, [sp, #0x28]
    sub r0, r0, #0x45000
    str r0, [sp, #0x24]
    mov r0, r7
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    mov r4, #0xd000
    mov r3, #0x24000
    add r1, sp, #0x2c
    add r2, sp, #0x30
    mov r0, r7
    str r4, [sp, #0x30]
    str r3, [sp, #0x2c]
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x14]
    ldr r2, .L_02155f40
    ldr r3, [sp, #0x18]
    bl func_02023c80
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r7, #0x4]
    bl func_020239a0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    mov r0, r4
    str r0, [sp, #0x38]
    mov r0, #0x24000
    str r0, [sp, #0x34]
    mov r0, r7
    add r1, sp, #0x34
    add r2, sp, #0x38
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x2
    bl func_02023c70
    mov r1, #0x0
    ldr r0, [r7, #0x4]
    mov r2, r1
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mvn r0, #0x0
    strb r0, [r9, #0x18]
    mov r0, #0x0
    strb r0, [r9, #0x19]
    bl func_02026f94
    str r0, [r9, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r9, #0x0]
    ldr r1, .L_02155f44
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r9
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02155f20: .word data_ov004_02161048
.L_02155f24: .word data_ov004_02161024
.L_02155f28: .word data_ov012_021d5154
.L_02155f2c: .word data_ov004_021608d4
.L_02155f30: .word data_ov004_0216101c
.L_02155f34: .word func_ov004_0214e414
.L_02155f38: .word data_ov004_02161064
.L_02155f3c: .word data_ov004_02161070
.L_02155f40: .word 0x494c
.L_02155f44: .word func_ov004_021561a0
    arm_func_end func_ov004_02155b1c

    .global func_ov004_02155f48
    arm_func_start func_ov004_02155f48
func_ov004_02155f48: ; 0x02155f48
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02155f6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02155f6c:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02155f48

    .global func_ov004_02155f78
    arm_func_start func_ov004_02155f78
func_ov004_02155f78: ; 0x02155f78
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r1, r1, #0x1
    strb r1, [r0, #0x18]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02155fa0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, pc}
.L_02155fa0: .word func_ov004_021561a4
    arm_func_end func_ov004_02155f78

    .global func_ov004_02155fa4
    arm_func_start func_ov004_02155fa4
func_ov004_02155fa4: ; 0x02155fa4
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldrsb r0, [r4, #0x19]
    cmp r0, #0x0
    beq .L_02155fec
    mov r1, #0x0
    strb r1, [r4, #0x19]
    ldr r0, [r4, #0x8]
    mov r2, r1
    ldr r0, [r0, #0x4]
    bl func_02023894
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_02155fec:
    mvn r1, #0x0
    mov r0, r4
    strb r1, [r4, #0x18]
    bl func_ov004_02156014
    ldr r0, [r4, #0x0]
    ldr r1, .L_02156010
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02156010: .word func_ov004_021561a0
    arm_func_end func_ov004_02155fa4

    .global func_ov004_02156014
    arm_func_start func_ov004_02156014
func_ov004_02156014: ; 0x02156014
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldrsb r0, [r6, #0x18]
    mov r5, #0x0
    cmp r0, #0x0
    blt .L_02156114
    ldr r0, [r6, #0xc]
    ldr r1, .L_0215619c
    ldr r0, [r0, #0x4]
    mov r2, r5
    bl func_02023894
    ldrsb r0, [r6, #0x18]
    cmp r0, #0xa
    blt .L_021560dc
    ldr r5, [r6, #0x14]
    mov r1, #0xa
    bl func_0200d12c
    add r1, r0, #0x27
    ldr r0, [r5, #0x4]
    orr r1, r1, #0x810000
    mov r2, #0x0
    bl func_02023894
    mov r4, #0x0
    sub r3, r4, #0x6000
    add r1, sp, #0x14
    add r2, sp, #0x10
    mov r0, r5
    str r4, [sp, #0x10]
    str r3, [sp, #0x14]
    bl func_ov004_0214e1b8
    ldrsb r0, [r6, #0x18]
    ldr r4, [r6, #0x10]
    mov r1, #0xa
    bl func_0200d12c
    add r1, r1, #0x27
    ldr r0, [r4, #0x4]
    orr r1, r1, #0x810000
    mov r2, #0x0
    bl func_02023894
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, #0x6000
    str r1, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_ov004_0214e1b8
    mov r5, #0x3
    b .L_02156114
.L_021560dc:
    ldr r4, [r6, #0x10]
    add r1, r0, #0x27
    ldr r0, [r4, #0x4]
    orr r1, r1, #0x810000
    mov r2, r5
    bl func_02023894
    mov r3, r5
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r4
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    mov r5, #0x2
.L_02156114:
    mov r4, #0x0
    mov r7, #0x1
    b .L_0215615c
.L_02156120:
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0xc]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r4, r4, #0x1
.L_0215615c:
    cmp r4, r5
    blt .L_02156120
    mov r4, #0x0
    b .L_0215618c
.L_0215616c:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xc]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
.L_0215618c:
    cmp r5, #0x3
    blt .L_0215616c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215619c: .word 0x810026
    arm_func_end func_ov004_02156014

    .global func_ov004_021561a0
    arm_func_start func_ov004_021561a0
func_ov004_021561a0: ; 0x021561a0
    bx lr
    arm_func_end func_ov004_021561a0

    .global func_ov004_021561a4
    arm_func_start func_ov004_021561a4
func_ov004_021561a4: ; 0x021561a4
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r5, [r0, #0x10]
    mov r0, r5
    bl func_ov004_02156014
    ldrsb r0, [r5, #0x19]
    cmp r0, #0x0
    bne .L_02156204
    ldr r0, [r5, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_02156214
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02156204:
    ldr r0, [r4, #0x4]
    ldr r1, .L_02156218
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02156214: .word func_ov004_0215621c
.L_02156218: .word func_ov004_021561a0
    arm_func_end func_ov004_021561a4

    .global func_ov004_0215621c
    arm_func_start func_ov004_0215621c
func_ov004_0215621c: ; 0x0215621c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    strb r0, [r5, #0x19]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02156270
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02156270: .word func_ov004_021561a0
    arm_func_end func_ov004_0215621c

    .global func_ov004_02156274
    arm_func_start func_ov004_02156274
func_ov004_02156274: ; 0x02156274
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x48
    ldr r1, .L_02156804
    mov r4, r0
    ldr r2, .L_02156808
    mov r0, #0x20
    mov r3, #0x78
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x20
    mov r9, r0
    bl func_020517fc
    mov r0, r4
    bl func_ov004_02155b1c
    str r0, [r9, #0x18]
    mov r0, r4
    bl func_ov004_021557c4
    str r0, [r9, #0x1c]
    ldr r1, .L_0215680c
    ldr r5, [r4, #0x4]
    ldr r4, [r1, #0x0]
    ldr r1, .L_02156810
    ldr r2, .L_02156814
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    movs r6, r0
    beq .L_021562f8
    ldr r3, .L_02156818
    mov r1, r5
    mov r2, r4
    blx func_ov012_021af0f8
    mov r6, r0
.L_021562f8:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02156314
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02156314:
    ldr r7, [r6, #0x18]
    mov r0, #0x6e000
    str r7, [r9, #0x4]
    ldr r2, [r7, #0x4]
    add r1, sp, #0x44
    str r0, [sp, #0x44]
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r8, #0x0
    mov r6, #0x810000
    mov r5, #0x3
    mov r4, #0x6e
    mov r11, r8
.L_02156350:
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov004_0214e9f0
    add r1, r9, r8, lsl #0x2
    str r0, [r1, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r9, r8, lsl #0x2
    ldr r1, [r0, #0x8]
    ldr r0, [r7, #0x4]
    ldr r10, [r1, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r10
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r8, r8, #0x1
    cmp r8, #0x3
    blt .L_02156350
    ldr r0, [r7, #0x4]
    bl func_02023940
    ldr r2, .L_0215681c
    add r0, sp, #0x4
    mov r1, r7
    bl func_ov004_02151ebc
    ldr r2, .L_02156820
    add r0, sp, #0xc
    mov r1, r7
    bl func_ov004_02151ebc
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r7, #0x4]
    bl func_020239a0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x60000
    str r0, [sp, #0x18]
    sub r0, r0, #0xb0000
    str r0, [sp, #0x14]
    mov r0, r7
    add r1, sp, #0x14
    add r2, sp, #0x18
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x8
    bl func_02023c60
    mov r4, #0x60000
    mov r3, #0x80000
    add r1, sp, #0x1c
    add r2, sp, #0x20
    mov r0, r7
    str r4, [sp, #0x20]
    str r3, [sp, #0x1c]
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r2, .L_02156824
    ldr r3, [sp, #0x8]
    bl func_02023c80
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r7, #0x4]
    bl func_020239a0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x0
    bl func_02023c60
    mov r0, r4
    str r0, [sp, #0x28]
    mov r0, #0x80000
    str r0, [sp, #0x24]
    mov r0, r7
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x30
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x30
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r7, #0x4]
    bl func_020239a0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x0
    bl func_02023c60
    mov r0, r4
    str r0, [sp, #0x30]
    mov r0, #0x80000
    str r0, [sp, #0x2c]
    mov r0, r7
    add r1, sp, #0x2c
    add r2, sp, #0x30
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x30
    bl func_02023c60
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x30
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r7, #0x4]
    bl func_020239a0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x0
    bl func_02023c60
    mov r3, #0x80000
    add r1, sp, #0x34
    add r2, sp, #0x38
    mov r0, r7
    str r4, [sp, #0x38]
    str r3, [sp, #0x34]
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x0
    bl func_02023c60
    mov r0, r4
    mov r3, #0x150000
    str r0, [sp, #0x40]
    add r1, sp, #0x3c
    add r2, sp, #0x40
    mov r0, r7
    str r3, [sp, #0x3c]
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r7, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, [sp, #0x4]
    ldr r2, .L_02156824
    ldr r3, [sp, #0x8]
    bl func_02023c80
    ldr r0, [r7, #0x4]
    mov r1, #0x4
    bl func_02023c70
    mov r1, #0x0
    ldr r0, [r7, #0x4]
    mov r2, r1
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    bl func_02026f94
    str r0, [r9, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r9, #0x0]
    ldr r1, .L_02156828
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, #0x1
    mov r0, r9
    strb r1, [r9, #0x16]
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02156804: .word data_ov004_021610a0
.L_02156808: .word data_ov004_02161080
.L_0215680c: .word data_ov012_021d5154
.L_02156810: .word data_ov004_021608d4
.L_02156814: .word data_ov004_02161078
.L_02156818: .word func_ov004_0214e414
.L_0215681c: .word data_ov004_021610b8
.L_02156820: .word data_ov004_021610c4
.L_02156824: .word 0x494c
.L_02156828: .word func_ov004_02156bb8
    arm_func_end func_ov004_02156274

    .global func_ov004_0215682c
    arm_func_start func_ov004_0215682c
func_ov004_0215682c: ; 0x0215682c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_02156848
    bl func_ov004_021558d8
.L_02156848:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_02156858
    bl func_ov004_02155f48
.L_02156858:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02156870
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02156870:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215682c

    .global func_ov004_0215687c
    arm_func_start func_ov004_0215687c
func_ov004_0215687c: ; 0x0215687c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x0
    strb r0, [r4, #0x14]
    strb r0, [r4, #0x16]
    ldr r0, [r4, #0x18]
    bl func_ov004_02155fa4
    ldr r0, [r4, #0x0]
    ldr r1, .L_021568b0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021568b0: .word func_ov004_02156bbc
    arm_func_end func_ov004_0215687c

    .global func_ov004_021568b4
    arm_func_start func_ov004_021568b4
func_ov004_021568b4: ; 0x021568b4
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r2, #0x1
    add r1, r1, #0x1
    strb r2, [r0, #0x14]
    strb r1, [r0, #0x15]
    mov r1, #0x0
    strb r1, [r0, #0x16]
    ldr r0, [r0, #0x0]
    ldr r1, .L_021568ec
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, pc}
.L_021568ec: .word func_ov004_02156bbc
    arm_func_end func_ov004_021568b4

    .global func_ov004_021568f0
    arm_func_start func_ov004_021568f0
func_ov004_021568f0: ; 0x021568f0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r2, #0x2
    add r1, r1, #0x1
    strb r2, [r0, #0x14]
    strb r1, [r0, #0x15]
    mov r1, #0x0
    strb r1, [r0, #0x16]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02156928
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, pc}
.L_02156928: .word func_ov004_02156bbc
    arm_func_end func_ov004_021568f0

    .global func_ov004_0215692c
    arm_func_start func_ov004_0215692c
func_ov004_0215692c: ; 0x0215692c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x3
    strb r0, [r4, #0x14]
    mov r0, #0x0
    strb r0, [r4, #0x16]
    mov r0, #0x7c
    mov r1, #0x6
    bl func_0207342c
    ldr r0, [r4, #0x0]
    ldr r1, .L_02156968
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02156968: .word func_ov004_02156be8
    arm_func_end func_ov004_0215692c

    .global func_ov004_0215696c
    arm_func_start func_ov004_0215696c
func_ov004_0215696c: ; 0x0215696c
    cmp r0, #0x0
    beq .L_02156988
    ldrsb r0, [r0, #0x16]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02156988:
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_0215696c

    .global func_ov004_02156990
    arm_func_start func_ov004_02156990
func_ov004_02156990: ; 0x02156990
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldrsb r0, [r6, #0x14]
    mov r5, #0x1
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02156aec
.L_021569b0: ; jump table
    b .L_021569c0 ; case 0
    b .L_021569d8 ; case 1
    b .L_02156ac0 ; case 2
    b .L_02156ad8 ; case 3
.L_021569c0:
    ldr r0, [r6, #0x8]
    ldr r1, .L_02156b74
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    b .L_02156aec
.L_021569d8:
    ldr r0, [r6, #0x8]
    ldr r1, .L_02156b78
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldrsb r0, [r6, #0x15]
    cmp r0, #0xa
    blt .L_02156a84
    ldr r5, [r6, #0x10]
    mov r1, #0xa
    bl func_0200d12c
    add r1, r0, #0x4
    ldr r0, [r5, #0x4]
    orr r1, r1, #0x810000
    mov r2, #0x0
    bl func_02023894
    mov r4, #0x0
    sub r3, r4, #0x8000
    add r1, sp, #0x14
    add r2, sp, #0x10
    mov r0, r5
    str r4, [sp, #0x10]
    str r3, [sp, #0x14]
    bl func_ov004_0214e1b8
    ldrsb r0, [r6, #0x15]
    ldr r4, [r6, #0xc]
    mov r1, #0xa
    bl func_0200d12c
    add r1, r1, #0x4
    ldr r0, [r4, #0x4]
    orr r1, r1, #0x810000
    mov r2, #0x0
    bl func_02023894
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, #0x8000
    str r1, [sp, #0xc]
    mov r0, r4
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_ov004_0214e1b8
    mov r5, #0x3
    b .L_02156aec
.L_02156a84:
    ldr r4, [r6, #0xc]
    add r1, r0, #0x4
    ldr r0, [r4, #0x4]
    orr r1, r1, #0x810000
    mov r2, #0x0
    bl func_02023894
    mov r3, #0x0
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r4
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    mov r5, #0x2
    b .L_02156aec
.L_02156ac0:
    ldr r0, [r6, #0x8]
    ldr r1, .L_02156b7c
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    b .L_02156aec
.L_02156ad8:
    ldr r0, [r6, #0x8]
    ldr r1, .L_02156b80
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
.L_02156aec:
    mov r4, #0x0
    mov r7, #0x1
    b .L_02156b34
.L_02156af8:
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r4, r4, #0x1
.L_02156b34:
    cmp r4, r5
    blt .L_02156af8
    mov r4, #0x0
    b .L_02156b64
.L_02156b44:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
.L_02156b64:
    cmp r5, #0x3
    blt .L_02156b44
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02156b74: .word 0x810035
.L_02156b78: .word 0x810003
.L_02156b7c: .word 0x810036
.L_02156b80: .word 0x810037
    arm_func_end func_ov004_02156990

    .global func_ov004_02156b84
    arm_func_start func_ov004_02156b84
func_ov004_02156b84: ; 0x02156b84
    stmdb sp!, {r3, lr}
    ldrsb r1, [r0, #0x14]
    sub r1, r1, #0x1
    mov r1, r1, lsl #0x18
    mov r1, r1, asr #0x18
    and r1, r1, #0xff
    cmp r1, #0x1
    ldmhiia sp!, {r3, pc}
    ldrsb r1, [r0, #0x15]
    ldr r0, [r0, #0x18]
    sub r1, r1, #0x1
    bl func_ov004_02155f78
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02156b84

    .global func_ov004_02156bb8
    arm_func_start func_ov004_02156bb8
func_ov004_02156bb8: ; 0x02156bb8
    bx lr
    arm_func_end func_ov004_02156bb8

    .global func_ov004_02156bbc
    arm_func_start func_ov004_02156bbc
func_ov004_02156bbc: ; 0x02156bbc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x1c]
    bl func_ov004_02155908
    ldr r0, [r4, #0x4]
    ldr r1, .L_02156be4
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02156be4: .word func_ov004_02156c48
    arm_func_end func_ov004_02156bbc

    .global func_ov004_02156be8
    arm_func_start func_ov004_02156be8
func_ov004_02156be8: ; 0x02156be8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x1c]
    bl func_ov004_0215598c
    mov r0, r4
    bl func_ov004_02156990
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156c44
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02156c44: .word func_ov004_02156bb8
    arm_func_end func_ov004_02156be8

    .global func_ov004_02156c48
    arm_func_start func_ov004_02156c48
func_ov004_02156c48: ; 0x02156c48
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x1c]
    bl func_ov004_021559ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov004_02156990
    mov r0, r4
    bl func_ov004_02156b84
    ldrsb r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_02156cb4
    cmp r0, #0x1
    beq .L_02156c98
    cmp r0, #0x2
    beq .L_02156ca8
    b .L_02156cb4
.L_02156c98:
    mov r0, #0x7c
    mov r1, #0x0
    bl func_0207342c
    b .L_02156cb4
.L_02156ca8:
    mov r0, #0x7c
    mov r1, #0x1
    bl func_0207342c
.L_02156cb4:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156cf8
    bl func_02028384
    mov r0, #0x0
    strb r0, [r4, #0x17]
    ldmia sp!, {r3, r4, r5, pc}
.L_02156cf8: .word func_ov004_02156cfc
    arm_func_end func_ov004_02156c48

    .global func_ov004_02156cfc
    arm_func_start func_ov004_02156cfc
func_ov004_02156cfc: ; 0x02156cfc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0x4]
    bl func_ov004_02156d8c
    cmp r0, #0x0
    beq .L_02156d78
    ldrsb r0, [r5, #0x14]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, [r5, #0x4]
    bne .L_02156d44
    ldr r0, [r0, #0x4]
    mov r1, #0x3
    bl func_02023894
    b .L_02156d50
.L_02156d44:
    ldr r0, [r0, #0x4]
    mov r1, #0x2
    bl func_02023894
.L_02156d50:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_02156d88
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02156d78:
    ldrsb r0, [r5, #0x17]
    add r0, r0, #0x1
    strb r0, [r5, #0x17]
    ldmia sp!, {r3, r4, r5, pc}
.L_02156d88: .word func_ov004_02156dc0
    arm_func_end func_ov004_02156cfc

    .global func_ov004_02156d8c
    arm_func_start func_ov004_02156d8c
func_ov004_02156d8c: ; 0x02156d8c
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
    arm_func_end func_ov004_02156d8c

    .global func_ov004_02156dc0
    arm_func_start func_ov004_02156dc0
func_ov004_02156dc0: ; 0x02156dc0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x4]
    bl func_ov004_02156d8c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrsb r0, [r4, #0x14]
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    bne .L_02156e2c
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156e74
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02156e2c:
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x1c]
    bl func_ov004_021559fc
    mov r0, #0x1
    strb r0, [r4, #0x16]
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156e78
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02156e74: .word func_ov004_02156e7c
.L_02156e78: .word func_ov004_02156bb8
    arm_func_end func_ov004_02156dc0

    .global func_ov004_02156e7c
    arm_func_start func_ov004_02156e7c
func_ov004_02156e7c: ; 0x02156e7c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x4]
    bl func_ov004_02156d8c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x1
    strb r1, [r4, #0x15]
    mov r0, r4
    strb r1, [r4, #0x14]
    bl func_ov004_02156990
    mov r0, r4
    bl func_ov004_02156b84
    mov r0, #0x7c
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    ldr r1, .L_02156f0c
    bl func_02028384
    mov r0, #0x0
    strb r0, [r4, #0x17]
    ldmia sp!, {r3, r4, r5, pc}
.L_02156f0c: .word func_ov004_02156cfc
    arm_func_end func_ov004_02156e7c

    .global func_ov004_02156f10
    arm_func_start func_ov004_02156f10
func_ov004_02156f10: ; 0x02156f10
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x54
    ldr r1, .L_021573e0
    mov r4, r0
    ldr r2, .L_021573e4
    mov r0, #0x14
    mov r3, #0x4f
    bl func_0201a21c
    mov r5, r0
    mov r1, #0x0
    mov r2, #0x14
    bl func_020517fc
    mov r0, r5
    mov r1, r4
    bl func_ov004_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r5, #0x4]
    mov r0, #0x80
    str r0, [sp, #0xc]
    mov r0, #0x58
    str r0, [sp, #0x10]
    bl func_0203b404
    mov r1, #0x6e
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    mov r0, r4
    mov r2, #0x810000
    mov r3, #0x0
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r5, #0x8]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_021573e8
    add r0, sp, #0x14
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_021573ec
    add r0, sp, #0x1c
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x58000
    str r0, [sp, #0x28]
    sub r0, r0, #0x98000
    str r0, [sp, #0x24]
    mov r0, r4
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x8
    bl func_02023c60
    mov r0, #0x58000
    str r0, [sp, #0x30]
    mov r0, #0x80000
    str r0, [sp, #0x2c]
    mov r0, r4
    add r1, sp, #0x2c
    add r2, sp, #0x30
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r2, .L_021573f0
    ldr r3, [sp, #0x18]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x58000
    str r0, [sp, #0x38]
    mov r0, #0x80000
    str r0, [sp, #0x34]
    mov r0, r4
    add r1, sp, #0x34
    add r2, sp, #0x38
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x3c
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x58000
    str r0, [sp, #0x40]
    mov r0, #0x80000
    str r0, [sp, #0x3c]
    mov r0, r4
    add r1, sp, #0x3c
    add r2, sp, #0x40
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x28
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x58000
    str r0, [sp, #0x48]
    mov r0, #0x80000
    str r0, [sp, #0x44]
    mov r0, r4
    add r1, sp, #0x44
    add r2, sp, #0x48
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x58000
    str r0, [sp, #0x50]
    mov r0, #0x140000
    str r0, [sp, #0x4c]
    mov r0, r4
    add r1, sp, #0x4c
    add r2, sp, #0x50
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    ldr r2, .L_021573f0
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_02023c70
    mov r1, #0x0
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x1
    strb r0, [r5, #0x11]
    bl func_02026f94
    str r0, [r5, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r5, #0x0]
    ldr r1, .L_021573f4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x0]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r5
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, pc}
.L_021573e0: .word data_ov004_021610ec
.L_021573e4: .word data_ov004_021610cc
.L_021573e8: .word data_ov004_02161104
.L_021573ec: .word data_ov004_02161110
.L_021573f0: .word 0x494c
.L_021573f4: .word func_ov004_02157580
    arm_func_end func_ov004_02156f10

    .global func_ov004_021573f8
    arm_func_start func_ov004_021573f8
func_ov004_021573f8: ; 0x021573f8
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0215741c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215741c:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021573f8

    .global func_ov004_02157428
    arm_func_start func_ov004_02157428
func_ov004_02157428: ; 0x02157428
    stmdb sp!, {r4, lr}
    mov r1, #0x2
    mov r4, r0
    bl func_ov004_0215750c
    mov r0, #0x0
    strb r0, [r4, #0x11]
    ldr r0, [r4, #0x0]
    ldr r1, .L_02157454
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02157454: .word func_ov004_02157584
    arm_func_end func_ov004_02157428

    .global func_ov004_02157458
    arm_func_start func_ov004_02157458
func_ov004_02157458: ; 0x02157458
    stmdb sp!, {r4, lr}
    mov r1, #0x0
    mov r4, r0
    bl func_ov004_0215750c
    mov r0, #0x0
    strb r0, [r4, #0x11]
    ldr r0, [r4, #0x0]
    ldr r1, .L_02157484
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02157484: .word func_ov004_02157634
    arm_func_end func_ov004_02157458

    .global func_ov004_02157488
    arm_func_start func_ov004_02157488
func_ov004_02157488: ; 0x02157488
    stmdb sp!, {r4, lr}
    mov r1, #0x1
    mov r4, r0
    bl func_ov004_0215750c
    mov r0, #0x0
    strb r0, [r4, #0x11]
    ldr r0, [r4, #0x0]
    ldr r1, .L_021574b4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021574b4: .word func_ov004_02157634
    arm_func_end func_ov004_02157488

    .global func_ov004_021574b8
    arm_func_start func_ov004_021574b8
func_ov004_021574b8: ; 0x021574b8
    stmdb sp!, {r4, lr}
    mov r1, #0x1
    mov r4, r0
    bl func_ov004_0215750c
    mov r0, #0x0
    strb r0, [r4, #0x11]
    ldr r0, [r4, #0x0]
    ldr r1, .L_021574e4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021574e4: .word func_ov004_021575dc
    arm_func_end func_ov004_021574b8

    .global func_ov004_021574e8
    arm_func_start func_ov004_021574e8
func_ov004_021574e8: ; 0x021574e8
    cmp r0, #0x0
    beq .L_02157504
    ldrsb r0, [r0, #0x11]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02157504:
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_021574e8

    .global func_ov004_0215750c
    arm_func_start func_ov004_0215750c
func_ov004_0215750c: ; 0x0215750c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x8]
    mov r5, r1
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215757c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    movs r4, r0
    moveq r4, #0x0
    beq .L_02157554
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02157550
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02157550:
    ldr r4, [r4, #0x18]
.L_02157554:
    ldr r0, [r4, #0x4]
    orr r1, r5, #0x810000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_0215757c: .word 0x31305053
    arm_func_end func_ov004_0215750c

    .global func_ov004_02157580
    arm_func_start func_ov004_02157580
func_ov004_02157580: ; 0x02157580
    bx lr
    arm_func_end func_ov004_02157580

    .global func_ov004_02157584
    arm_func_start func_ov004_02157584
func_ov004_02157584: ; 0x02157584
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    ldr r5, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    bl func_02023894
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x1
    strb r0, [r5, #0x10]
    ldr r0, [r4, #0x4]
    ldr r1, .L_021575d8
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_021575d8: .word func_ov004_0215768c
    arm_func_end func_ov004_02157584

    .global func_ov004_021575dc
    arm_func_start func_ov004_021575dc
func_ov004_021575dc: ; 0x021575dc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    ldr r5, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    bl func_02023894
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x1
    strb r0, [r5, #0x10]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157630
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02157630: .word func_ov004_0215768c
    arm_func_end func_ov004_021575dc

    .global func_ov004_02157634
    arm_func_start func_ov004_02157634
func_ov004_02157634: ; 0x02157634
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    ldr r5, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    bl func_02023894
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x1
    strb r0, [r5, #0x10]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157688
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02157688: .word func_ov004_0215768c
    arm_func_end func_ov004_02157634

    .global func_ov004_0215768c
    arm_func_start func_ov004_0215768c
func_ov004_0215768c: ; 0x0215768c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0x8]
    bl func_ov004_02156d8c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrsb r0, [r5, #0x10]
    cmp r0, #0x0
    beq .L_021576cc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157708
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_021576cc:
    ldr r0, [r5, #0x8]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215770c
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02157708: .word func_ov004_02157748
.L_0215770c: .word func_ov004_02157710
    arm_func_end func_ov004_0215768c

    .global func_ov004_02157710
    arm_func_start func_ov004_02157710
func_ov004_02157710: ; 0x02157710
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x8]
    bl func_ov004_02156d8c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157744
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02157744: .word func_ov004_02157748
    arm_func_end func_ov004_02157710

    .global func_ov004_02157748
    arm_func_start func_ov004_02157748
func_ov004_02157748: ; 0x02157748
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r4, [r0, #0x10]
    mov r2, r1
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    bl func_02023894
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215779c
    bl func_02028384
    mov r0, #0x1
    strb r0, [r4, #0x11]
    ldmia sp!, {r3, r4, r5, pc}
.L_0215779c: .word func_ov004_02157580
    arm_func_end func_ov004_02157748

    .global func_ov004_021577a0
    arm_func_start func_ov004_021577a0
func_ov004_021577a0: ; 0x021577a0
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x24
    ldr r1, .L_021579f0
    mov r4, r0
    ldr r2, .L_021579f4
    mov r0, #0x20
    mov r3, #0x45
    bl func_0201a21c
    mov r5, r0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020517fc
    mov r0, r5
    mov r1, r4
    bl func_ov004_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r5, #0x4]
    bl func_0203b404
    mov r1, #0x1c
    str r1, [sp, #0x0]
    mov r1, #0xe
    str r1, [sp, #0x4]
    mov r1, #0x12
    str r1, [sp, #0x8]
    mov r1, #0x6e
    str r1, [sp, #0xc]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r2, #0x4
    mov r3, #0x810000
    bl func_ov004_0214fcb0
    str r0, [r5, #0x1c]
    mov r1, #0xda
    mov r2, #0xb5
    bl func_ov004_021501e4
    ldr r0, [r5, #0x1c]
    mov r1, #0x0
    bl func_ov004_02150270
    ldr r0, [r5, #0x1c]
    mov r1, #0x19
    bl func_ov004_021502f0
    ldr r0, [r5, #0x1c]
    mov r1, #0x3
    bl func_ov004_021502fc
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov004_0214f1b8
    bl func_0203b404
    ldr r6, [r0, #0x88]
    bl func_ov004_0214f288
    mov r1, r0
    mov r0, r6
    mov r2, #0x0
    mov r3, #0x6e
    bl func_ov004_0214eaa0
    mov r6, r0
    blx func_02071f08
    mov r1, r0
    mov r0, r6
    mov r2, #0xa
    bl func_ov004_0214ece0
    mov r2, #0xa4000
    mov r0, #0x46000
    str r2, [sp, #0x18]
    str r0, [sp, #0x14]
    add r1, sp, #0x14
    add r2, sp, #0x18
    mov r0, r6
    bl func_ov004_0214e1b8
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r6
    mov r0, r4
    bl func_ov004_0214e478
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x810000
    mov r2, #0x3a
    mov r3, #0x80
    bl func_ov004_0214e9f0
    mov r1, #0xac000
    str r1, [sp, #0x20]
    mov r1, #0xa0000
    str r1, [sp, #0x1c]
    mov r6, r0
    add r1, sp, #0x1c
    add r2, sp, #0x20
    bl func_ov004_0214e1b8
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    mov r1, r6
    bl func_ov004_0214e478
    mov r0, r6
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x21
    mov r2, #0x1
    mov r3, #0x7
    bl func_0206ad90
    mov r1, #0x1
    str r0, [r5, #0x10]
    bl func_ov004_02157ac8
    mov r0, r6
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x21
    mov r2, #0x1
    mov r3, #0x6
    bl func_0206ad90
    str r0, [r5, #0xc]
    mov r1, #0x1
    bl func_ov004_02157ac8
    bl func_02026f94
    str r0, [r5, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x10]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r5, #0x0]
    ldr r1, .L_021579f8
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x0]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r5
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021579f0: .word data_ov004_0216113c
.L_021579f4: .word data_ov004_02161118
.L_021579f8: .word func_ov004_02157b70
    arm_func_end func_ov004_021577a0

    .global func_ov004_021579fc
    arm_func_start func_ov004_021579fc
func_ov004_021579fc: ; 0x021579fc
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_02157a18
    bl func_ov004_021500f0
.L_02157a18:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_02157a28
    bl func_0206ae98
.L_02157a28:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02157a38
    bl func_0206ae98
.L_02157a38:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021579fc

    .global func_ov004_02157a44
    arm_func_start func_ov004_02157a44
func_ov004_02157a44: ; 0x02157a44
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x1c]
    bl func_ov004_02150270
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02157a44

    .global func_ov004_02157a5c
    arm_func_start func_ov004_02157a5c
func_ov004_02157a5c: ; 0x02157a5c
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x1c]
    bl func_ov004_021502d4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02157a5c

    .global func_ov004_02157a74
    arm_func_start func_ov004_02157a74
func_ov004_02157a74: ; 0x02157a74
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    mov r4, r1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x10]
    mov r1, #0x1
    bl func_ov004_02157ac8
    ldr r2, [r5, #0xc]
    ldr r1, .L_02157ac4
    mov r0, #0x6
    strh r1, [r2, #0x16]
    strb r0, [r2, #0x18]
    mov r0, #0x1
    strb r0, [r2, #0x19]
    strb r4, [r2, #0x1b]
    mov r1, #0x0
    strb r1, [r2, #0x1a]
    ldr r0, [r5, #0xc]
    bl func_ov004_02157aec
    ldmia sp!, {r3, r4, r5, pc}
.L_02157ac4: .word 0x7fff
    arm_func_end func_ov004_02157a74

    .global func_ov004_02157ac8
    arm_func_start func_ov004_02157ac8
func_ov004_02157ac8: ; 0x02157ac8
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_02157adc
    bl func_0206af1c
.L_02157adc:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02157ac8

    .global func_ov004_02157aec
    arm_func_start func_ov004_02157aec
func_ov004_02157aec: ; 0x02157aec
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_02157b00
    bl func_0206af1c
.L_02157b00:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02157aec

    .global func_ov004_02157b10
    arm_func_start func_ov004_02157b10
func_ov004_02157b10: ; 0x02157b10
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0xc]
    mov r1, #0x1
    bl func_ov004_02157ac8
    ldr r0, [r4, #0x10]
    ldr r2, .L_02157b44
    mov r1, #0x0
    strh r2, [r0, #0x16]
    ldr r0, [r4, #0x10]
    bl func_ov004_02157aec
    ldmia sp!, {r4, pc}
.L_02157b44: .word 0x7fff
    arm_func_end func_ov004_02157b10

    .global func_ov004_02157b48
    arm_func_start func_ov004_02157b48
func_ov004_02157b48: ; 0x02157b48
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0xc]
    mov r1, #0x1
    bl func_ov004_02157ac8
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    bl func_ov004_02157ac8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02157b48

    .global func_ov004_02157b70
    arm_func_start func_ov004_02157b70
func_ov004_02157b70: ; 0x02157b70
    bx lr
    arm_func_end func_ov004_02157b70

    .global func_ov004_02157b74
    arm_func_start func_ov004_02157b74
func_ov004_02157b74: ; 0x02157b74
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    mov r7, r1
    mov r5, r2
    mov r8, r0
    mov r4, r3
    ldr r1, .L_02157e30
    ldr r2, .L_02157e34
    mov r0, #0x1c
    mov r3, #0x4a
    bl func_0201a21c
    mov r6, r0
    mov r1, #0x0
    mov r2, #0x1c
    bl func_020517fc
    strb r7, [r6, #0x0]
    cmp r7, r5
    movlt r0, #0x1
    strb r4, [r6, #0x2]
    movge r0, #0x0
    strb r0, [r6, #0x1]
    mov r0, r6
    mov r1, r8
    bl func_ov004_0214ed84
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0xc0000
    str r0, [sp, #0x14]
    ldrsb r0, [r6, #0x0]
    add r1, sp, #0x10
    add r2, sp, #0x14
    mov r0, r0, lsl #0x6
    add r0, r0, #0x20
    mov r3, r0, lsl #0xc
    mov r0, r5
    str r3, [sp, #0x10]
    bl func_ov004_0214e1b8
    ldrsb r0, [r6, #0x1]
    cmp r0, #0x0
    beq .L_02157c9c
    bl func_0203b404
    mov r1, #0x8
    str r1, [sp, #0x0]
    mov r1, #0xb
    str r1, [sp, #0x4]
    mov r1, #0x10
    str r1, [sp, #0x8]
    mov r1, #0x6e
    str r1, [sp, #0xc]
    ldr r1, [r0, #0x88]
    ldr r3, .L_02157e38
    mov r0, r5
    mov r2, #0x3
    bl func_ov004_0214fcb0
    mov r1, #0x4
    str r0, [r6, #0x4]
    sub r2, r1, #0x8
    bl func_ov004_021501e4
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    bl func_ov004_02150270
    ldr r0, [r6, #0x4]
    mov r1, #0x19
    bl func_ov004_021502f0
    ldr r0, [r6, #0x4]
    mov r1, #0x3
    bl func_ov004_021502fc
    mov r0, r5
    bl func_ov004_021584d0
    str r0, [r6, #0x8]
.L_02157c9c:
    ldrsb r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_02157d04
    bl func_0203b404
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157e38
    mov r2, #0x7
    mov r3, #0x6e
    bl func_ov004_0214e9f0
    mov r4, #0x1c000
    rsb r4, r4, #0x0
    mov r3, #0x8000
    str r4, [sp, #0x1c]
    add r1, sp, #0x18
    add r2, sp, #0x1c
    mov r4, r0
    str r3, [sp, #0x18]
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r4
    mov r0, r5
    bl func_ov004_0214e478
.L_02157d04:
    ldrsb r0, [r6, #0x1]
    cmp r0, #0x0
    ldrnesb r0, [r6, #0x0]
    addne r4, r0, #0x2
    moveq r4, #0x6
    bl func_0203b404
    ldr r0, [r0, #0x88]
    ldr r1, .L_02157e38
    mov r2, r4
    mov r3, #0x80
    bl func_ov004_0214e9f0
    mov r3, #0x0
    add r1, sp, #0x20
    add r2, sp, #0x24
    mov r4, r0
    str r3, [sp, #0x24]
    str r3, [sp, #0x20]
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r5
    mov r1, r4
    str r4, [r6, #0xc]
    bl func_ov004_0214e478
    mov r0, r4
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    ldrsb r1, [r6, #0x0]
    mov r2, #0x1
    mov r3, #0x7
    mov r1, r1, lsl #0x4
    add r1, r1, #0x21
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_0206ad90
    mov r1, #0x1
    str r0, [r6, #0x14]
    bl func_ov004_02157ffc
    mov r0, r4
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    ldrsb r1, [r6, #0x0]
    mov r2, #0x1
    mov r3, #0x6
    mov r1, r1, lsl #0x4
    add r1, r1, #0x21
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_0206ad90
    mov r1, #0x1
    str r0, [r6, #0x10]
    bl func_ov004_02157ffc
    mov r0, r4
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    ldrsb r1, [r6, #0x0]
    mov r2, #0x1
    mov r3, #0x3
    mov r1, r1, lsl #0x4
    add r1, r1, #0x21
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_0206ad90
    mov r1, #0x1
    str r0, [r6, #0x18]
    bl func_ov004_02157ffc
    mov r0, r6
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02157e30: .word data_ov004_0216119c
.L_02157e34: .word data_ov004_02161178
.L_02157e38: .word 0x818000
    arm_func_end func_ov004_02157b74

    .global func_ov004_02157e3c
    arm_func_start func_ov004_02157e3c
func_ov004_02157e3c: ; 0x02157e3c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldrsb r0, [r4, #0x1]
    cmp r0, #0x0
    beq .L_02157e74
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02157e64
    bl func_ov004_021500f0
.L_02157e64:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_02157e74
    bl func_ov004_021586b0
.L_02157e74:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02157e84
    bl func_0206ae98
.L_02157e84:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_02157e94
    bl func_0206ae98
.L_02157e94:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_02157ea4
    bl func_0206ae98
.L_02157ea4:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02157e3c

    .global func_ov004_02157eb0
    arm_func_start func_ov004_02157eb0
func_ov004_02157eb0: ; 0x02157eb0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldrnesb r2, [r0, #0x1]
    cmpne r2, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    bl func_ov004_02150270
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02157eb0

    .global func_ov004_02157ed0
    arm_func_start func_ov004_02157ed0
func_ov004_02157ed0: ; 0x02157ed0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldrnesb r2, [r0, #0x1]
    cmpne r2, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    bl func_ov004_021502d4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02157ed0

    .global func_ov004_02157ef0
    arm_func_start func_ov004_02157ef0
func_ov004_02157ef0: ; 0x02157ef0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrsb r1, [r0, #0x1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x8]
    bl func_ov004_021587d8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02157ef0

    .global func_ov004_02157f1c
    arm_func_start func_ov004_02157f1c
func_ov004_02157f1c: ; 0x02157f1c
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldrsb r1, [r0, #0x1]
    cmp r1, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x8]
    bl func_ov004_0215880c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02157f1c

    .global func_ov004_02157f48
    arm_func_start func_ov004_02157f48
func_ov004_02157f48: ; 0x02157f48
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    ldrnesb r0, [r5, #0x1]
    mov r4, r1
    cmpne r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x14]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_02157f7c
    ldr r0, [r5, #0x14]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_02157f7c:
    ldr r0, [r5, #0x18]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_02157f98
    ldr r0, [r5, #0x18]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_02157f98:
    ldr r2, [r5, #0x10]
    ldr r1, .L_02157fcc
    mov r0, #0x6
    strh r1, [r2, #0x16]
    strb r0, [r2, #0x18]
    mov r0, #0x1
    strb r0, [r2, #0x19]
    strb r4, [r2, #0x1b]
    mov r1, #0x0
    strb r1, [r2, #0x1a]
    ldr r0, [r5, #0x10]
    bl func_ov004_02158020
    ldmia sp!, {r3, r4, r5, pc}
.L_02157fcc: .word 0x7fff
    arm_func_end func_ov004_02157f48

    .global func_ov004_02157fd0
    arm_func_start func_ov004_02157fd0
func_ov004_02157fd0: ; 0x02157fd0
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    ldr r2, [r1, #0x4]
    ldrb r1, [r2, #0x28]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    ldreq r1, [r2, #0x34]
    ldreq r1, [r1, #0x244]
    cmpeq r1, #0x0
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov004_02157fd0

    .global func_ov004_02157ffc
    arm_func_start func_ov004_02157ffc
func_ov004_02157ffc: ; 0x02157ffc
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_02158010
    bl func_0206af1c
.L_02158010:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02157ffc

    .global func_ov004_02158020
    arm_func_start func_ov004_02158020
func_ov004_02158020: ; 0x02158020
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_02158034
    bl func_0206af1c
.L_02158034:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02158020

    .global func_ov004_02158044
    arm_func_start func_ov004_02158044
func_ov004_02158044: ; 0x02158044
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldrnesb r0, [r4, #0x1]
    cmpne r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x10]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_02158074
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_02158074:
    ldr r0, [r4, #0x14]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_02158090
    ldr r0, [r4, #0x14]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_02158090:
    ldr r2, [r4, #0x18]
    ldr r1, .L_021580bc
    mov r0, #0xf
    strh r1, [r2, #0x16]
    strb r0, [r2, #0x18]
    mov r0, #0x1
    strb r0, [r2, #0x19]
    ldr r0, [r4, #0x18]
    mov r1, #0x0
    bl func_ov004_02158020
    ldmia sp!, {r4, pc}
.L_021580bc: .word 0x7fff
    arm_func_end func_ov004_02158044

    .global func_ov004_021580c0
    arm_func_start func_ov004_021580c0
func_ov004_021580c0: ; 0x021580c0
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldrnesb r0, [r4, #0x1]
    cmpne r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x10]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_021580f0
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_021580f0:
    ldr r0, [r4, #0x18]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_0215810c
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_0215810c:
    ldr r0, [r4, #0x14]
    ldr r2, .L_02158128
    mov r1, #0x0
    strh r2, [r0, #0x16]
    ldr r0, [r4, #0x14]
    bl func_ov004_02158020
    ldmia sp!, {r4, pc}
.L_02158128: .word 0x7fff
    arm_func_end func_ov004_021580c0

    .global func_ov004_0215812c
    arm_func_start func_ov004_0215812c
func_ov004_0215812c: ; 0x0215812c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldrnesb r0, [r4, #0x1]
    cmpne r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x10]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_0215815c
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_0215815c:
    ldr r0, [r4, #0x14]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    bne .L_02158178
    ldr r0, [r4, #0x14]
    mov r1, #0x1
    bl func_ov004_02157ffc
.L_02158178:
    ldr r0, [r4, #0x18]
    bl func_ov004_02157fd0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    bl func_ov004_02157ffc
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215812c

    .global func_ov004_02158198
    arm_func_start func_ov004_02158198
func_ov004_02158198: ; 0x02158198
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldrnesb r0, [r4, #0x1]
    cmpne r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrsb r0, [r4, #0x0]
    ldr r3, [r4, #0xc]
    mov r2, #0x0
    add r0, r0, #0x2
    orr r1, r0, #0x18000
    ldr r0, [r3, #0x4]
    orr r1, r1, #0x800000
    bl func_02023894
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02158198

    .global func_ov004_021581e8
    arm_func_start func_ov004_021581e8
func_ov004_021581e8: ; 0x021581e8
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldrnesb r0, [r4, #0x1]
    cmpne r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrsb r0, [r4, #0x0]
    ldr r3, [r4, #0xc]
    mov r2, #0x0
    add r0, r0, #0x21
    orr r1, r0, #0x18000
    ldr r0, [r3, #0x4]
    orr r1, r1, #0x800000
    bl func_02023894
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021581e8

    .global func_ov004_02158238
    arm_func_start func_ov004_02158238
func_ov004_02158238: ; 0x02158238
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r9, r1
    mov r8, r2
    mov r10, r0
    ldr r1, .L_021582c0
    ldr r2, .L_021582c4
    mov r0, #0x14
    mov r3, #0x144
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x14
    mov r7, r0
    bl func_020517fc
    strb r10, [r7, #0x0]
    mov r6, #0x0
    strb r9, [r7, #0x1]
    mov r4, r6
    mov r5, #0x1
.L_02158280:
    cmp r6, r10
    moveq r3, r5
    movne r3, r4
    mov r0, r8
    mov r1, r6
    mov r2, r9
    bl func_ov004_02157b74
    add r1, r6, #0x1
    add r2, r7, r6, lsl #0x2
    mov r1, r1, lsl #0x18
    mov r6, r1, asr #0x18
    str r0, [r2, #0x4]
    cmp r6, #0x4
    blt .L_02158280
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_021582c0: .word data_ov004_0216119c
.L_021582c4: .word data_ov004_02161158
    arm_func_end func_ov004_02158238

    .global func_ov004_021582c8
    arm_func_start func_ov004_021582c8
func_ov004_021582c8: ; 0x021582c8
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r4, #0x0
.L_021582d8:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_02157e3c
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_021582d8
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_021582c8

    .global func_ov004_021582fc
    arm_func_start func_ov004_021582fc
func_ov004_021582fc: ; 0x021582fc
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r1, r2
    bl func_ov004_02157eb0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021582fc

    .global func_ov004_0215831c
    arm_func_start func_ov004_0215831c
func_ov004_0215831c: ; 0x0215831c
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r5, #0x0
    mov r4, r5
.L_02158330:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r1, r4
    bl func_ov004_02157ed0
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_02158330
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov004_0215831c

    .global func_ov004_02158350
    arm_func_start func_ov004_02158350
func_ov004_02158350: ; 0x02158350
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    addne r0, r0, r1, lsl #0x2
    ldrne r1, [r0, #0x4]
    cmpne r1, #0x0
    ldrnesb r0, [r1, #0x1]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r1, #0x8]
    mov r1, r2
    mov r2, r3
    bl func_ov004_021586c4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02158350

    .global func_ov004_02158384
    arm_func_start func_ov004_02158384
func_ov004_02158384: ; 0x02158384
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_02157ef0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02158384

    .global func_ov004_021583a4
    arm_func_start func_ov004_021583a4
func_ov004_021583a4: ; 0x021583a4
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r4, #0x0
    b .L_021583d8
.L_021583bc:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_02157f1c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r4, r4, #0x1
.L_021583d8:
    cmp r4, #0x4
    blt .L_021583bc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_021583a4

    .global func_ov004_021583e8
    arm_func_start func_ov004_021583e8
func_ov004_021583e8: ; 0x021583e8
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r1, r2
    bl func_ov004_02157f48
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021583e8

    .global func_ov004_02158408
    arm_func_start func_ov004_02158408
func_ov004_02158408: ; 0x02158408
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_02158044
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02158408

    .global func_ov004_02158424
    arm_func_start func_ov004_02158424
func_ov004_02158424: ; 0x02158424
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_021580c0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02158424

    .global func_ov004_02158440
    arm_func_start func_ov004_02158440
func_ov004_02158440: ; 0x02158440
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_0215812c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02158440

    .global func_ov004_0215845c
    arm_func_start func_ov004_0215845c
func_ov004_0215845c: ; 0x0215845c
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r4, #0x0
.L_0215846c:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_0215812c
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_0215846c
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_0215845c

    .global func_ov004_02158488
    arm_func_start func_ov004_02158488
func_ov004_02158488: ; 0x02158488
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_021581e8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_02158488

    .global func_ov004_021584a4
    arm_func_start func_ov004_021584a4
func_ov004_021584a4: ; 0x021584a4
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r4, #0x0
.L_021584b4:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    bl func_ov004_02158198
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_021584b4
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_021584a4

    .global func_ov004_021584d0
    arm_func_start func_ov004_021584d0
func_ov004_021584d0: ; 0x021584d0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    ldr r1, .L_0215868c
    mov r5, r0
    ldr r2, .L_02158690
    mov r0, #0x20
    mov r3, #0x4d
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x20
    mov r9, r0
    bl func_020517fc
    ldr r3, .L_02158694
    ldr r1, .L_02158698
    ldr r4, [r3, #0x0]
    ldr r2, .L_0215869c
    mov r0, #0x134
    mov r3, #0x3e
    ldr r5, [r5, #0x4]
    bl func_0201a21c
    movs r6, r0
    beq .L_0215853c
    ldr r3, .L_021586a0
    mov r1, r5
    mov r2, r4
    blx func_ov012_021af0f8
    mov r6, r0
.L_0215853c:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02158558
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158558:
    ldr r7, [r6, #0x18]
    mov r1, #0x0
    ldr r0, [r7, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r7, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r2, #0x3b000
    rsb r2, r2, #0x0
    mov r0, #0x0
    str r2, [sp, #0x4]
    str r0, [sp, #0x0]
    add r1, sp, #0x0
    add r2, sp, #0x4
    mov r0, r7
    bl func_ov004_0214e1b8
    ldr r0, [r7, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, .L_021586a4
    bl func_02028384
    ldr r6, .L_021586a8
    ldr r5, .L_021586ac
    mov r8, #0x0
    mov r11, #0x20
.L_021585e4:
    bl func_0203b404
    add r4, r8, r8, lsl #0x1
    add r10, r6, r4
    ldrsb r3, [r10, #0x2]
    ldr r0, [r0, #0x88]
    mov r1, r5
    mov r2, r11
    bl func_ov004_0214e9f0
    ldrsb r1, [r6, r4]
    ldrsb r2, [r10, #0x1]
    mov r4, r0
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xc]
    str r1, [sp, #0x8]
    add r1, sp, #0x8
    add r2, sp, #0xc
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r10, [r4, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r10
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    add r0, r9, r8, lsl #0x2
    add r8, r8, #0x1
    str r4, [r0, #0x4]
    cmp r8, #0x5
    blt .L_021585e4
    mov r0, r9
    str r7, [r9, #0x0]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215868c: .word data_ov004_021611e0
.L_02158690: .word data_ov004_021611bc
.L_02158694: .word data_ov012_021d5154
.L_02158698: .word data_ov004_021608d4
.L_0215869c: .word data_ov004_021611b4
.L_021586a0: .word func_ov004_0214e414
.L_021586a4: .word func_ov004_02158820
.L_021586a8: .word data_ov004_02160510
.L_021586ac: .word 0x818000
    arm_func_end func_ov004_021584d0

    .global func_ov004_021586b0
    arm_func_start func_ov004_021586b0
func_ov004_021586b0: ; 0x021586b0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_0201b244
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_021586b0

    .global func_ov004_021586c4
    arm_func_start func_ov004_021586c4
func_ov004_021586c4: ; 0x021586c4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    movs r9, r0
    mov r8, r1
    mov r4, r2
    beq .L_021587c8
    ldr r5, [r9, #0x4]
    add r0, r8, #0x12
    orr r1, r0, #0x18000
    ldr r0, [r5, #0x4]
    orr r1, r1, #0x800000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, .L_021587d0
    mov r1, #0x64
    cmp r4, r0
    movgt r4, r0
    mov r0, r4
    bl func_0200d12c
    str r0, [sp, #0x0]
    mov r0, r4
    mov r1, #0x64
    bl func_0200d12c
    mov r4, r1
    mov r0, r4
    mov r1, #0xa
    bl func_0200d12c
    str r0, [sp, #0x4]
    mov r0, r4
    mov r1, #0xa
    bl func_0200d12c
    mov r6, #0x0
    ldr r10, .L_021587d4
    str r1, [sp, #0x8]
    add r5, sp, #0x0
    mov r4, r6
.L_02158768:
    add r0, r9, r6, lsl #0x2
    ldr r7, [r0, #0xc]
    ldr r1, [r5, r6, lsl #0x2]
    ldr r0, [r7, #0x4]
    add r1, r1, #0x16
    mov r2, r4
    orr r1, r1, r10
    bl func_02023894
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_02158768
    rsb r0, r8, #0x3
    mov r1, #0x1
    mov r0, r0, lsl #0x4
    strb r1, [r9, #0x18]
    mov r1, r8, lsl #0x4
    strh r1, [r9, #0x1a]
    add r0, r0, #0x3c
    strh r0, [r9, #0x1c]
.L_021587c8:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_021587d0: .word 0x3e7
.L_021587d4: .word 0x818000
    arm_func_end func_ov004_021586c4

    .global func_ov004_021587d8
    arm_func_start func_ov004_021587d8
func_ov004_021587d8: ; 0x021587d8
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrb r0, [r0, #0x10]
    mov r1, r0, lsl #0x18
    movs r1, r1, lsr #0x1f
    beq .L_02158804
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    bxne lr
.L_02158804:
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_021587d8

    .global func_ov004_0215880c
    arm_func_start func_ov004_0215880c
func_ov004_0215880c: ; 0x0215880c
    ldrsb r0, [r0, #0x18]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov004_0215880c

    .global func_ov004_02158820
    arm_func_start func_ov004_02158820
func_ov004_02158820: ; 0x02158820
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrsb r1, [r4, #0x18]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x1
    beq .L_0215884c
    cmp r1, #0x2
    beq .L_0215888c
    ldmia sp!, {r4, pc}
.L_0215884c:
    ldrsh r1, [r4, #0x1a]
    sub r1, r1, #0x1
    strh r1, [r4, #0x1a]
    ldrsh r1, [r4, #0x1a]
    cmp r1, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldrsh r1, [r4, #0x1c]
    mov r0, #0x2
    strh r1, [r4, #0x1a]
    strb r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
.L_0215888c:
    ldrsh r1, [r4, #0x1a]
    sub r1, r1, #0x1
    strh r1, [r4, #0x1a]
    ldrsh r1, [r4, #0x1a]
    cmp r1, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    strb r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02158820

    .global func_ov004_021588c4
    arm_func_start func_ov004_021588c4
func_ov004_021588c4: ; 0x021588c4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x40
    ldr r1, .L_02158ebc
    ldr r2, .L_02158ec0
    mov r0, #0x20
    mov r3, #0x3c
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x20
    mov r9, r0
    bl func_020517fc
    mvn r4, #0x0
    ldr r1, .L_02158ec4
    ldr r2, .L_02158ec8
    ldr r3, .L_02158ecc
    mov r0, #0xcc
    str r4, [r9, #0x1c]
    bl func_0201a21c
    movs r4, r0
    beq .L_02158928
    ldr r1, .L_02158ed0
    ldr r2, .L_02158ed4
    ldr r3, .L_02158ed8
    blx func_ov012_021af26c
    mov r4, r0
.L_02158928:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02158944
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158944:
    ldr r4, [r4, #0x18]
    mov r1, #0x0
    ldr r6, [r4, #0x4]
    mov r0, #0x10
    mov r2, r4
    mov r3, r1
    strh r0, [r6, #0xbc]
    mov r5, #0x3
    mov r0, #0x1
    strh r5, [r6, #0xbe]
    blx func_ov012_021b3b7c
    ldr r2, .L_02158edc
    mov r3, #0x1
    ldr r1, .L_02158ee0
    mov r0, r4
    str r3, [r2, #0x0]
    bl func_ov004_02151d90
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_021589a8
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_021589a8:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_021589c4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_021589c4:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x11
    mov r2, #0x3
    mov r3, #0x5
    bl func_0206ad90
    mov r2, r0
    str r0, [r9, #0x18]
    mov r1, #0x0
    strh r1, [r2, #0x18]
    ldr r0, .L_02158ee4
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
    mov r0, r9
    mov r1, #0x0
    bl func_ov004_0214ed84
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    str r8, [r9, #0x0]
    mov r0, #0x80
    str r0, [sp, #0x8]
    mov r0, #0x60
    str r0, [sp, #0xc]
    bl func_0203b3f4
    mov r2, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r8
    mov r2, #0x8f0000
    mov r3, #0x0
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r2, .L_02158ee8
    add r0, sp, #0x10
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02158eec
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fb0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    str r4, [r9, #0x4]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_02158edc
    mov r0, r8
    ldr r1, [r1, #0x0]
    bl func_ov004_0214e3a0
    mov r4, r0
    str r4, [r9, #0x8]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x10000
    str r0, [sp, #0x28]
    mov r0, r4
    add r1, sp, #0x28
    bl func_ov004_0214ea78
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x2c]
    mov r0, r4
    add r1, sp, #0x2c
    add r2, sp, #0x30
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x124]
    ldr r2, .L_02158ee8
    add r0, sp, #0x18
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_02158ef0
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fb0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    mov r0, #0x80
    str r0, [sp, #0x8]
    mov r0, #0x4e
    ldr r4, .L_02158ef4
    ldr r11, .L_02158ef8
    str r0, [sp, #0xc]
    mov r7, #0x0
    mov r5, #0x10000
.L_02158cfc:
    ldr r1, .L_02158edc
    mov r0, r8
    ldr r1, [r1, #0x0]
    bl func_ov004_0214e3a0
    mov r10, r0
    add r0, r9, r7, lsl #0x2
    str r10, [r0, #0xc]
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r10
    add r1, sp, #0x34
    str r5, [sp, #0x34]
    bl func_ov004_0214ea78
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x3c]
    str r0, [sp, #0x38]
    mov r0, r10
    add r1, sp, #0x38
    add r2, sp, #0x3c
    bl func_ov004_0214e1b8
    ldr r1, [r10, #0x4]
    ldr r2, .L_02158ee8
    str r7, [r1, #0x124]
    add r0, sp, #0x20
    mov r1, r10
    bl func_ov004_02151ebc
    ldr r0, [r10, #0x4]
    bl func_02023940
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x4]
    ldr r1, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r1, .L_02158efc
    ldr r2, .L_02158f00
    ldr r3, .L_02158f04
    mov r0, #0x70
    bl func_0201a21c
    movs r6, r0
    beq .L_02158e0c
    ldr r2, .L_02158f08
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r1, .L_02158f0c
    add r0, r6, #0x68
    str r4, [r6, #0x0]
    bl func_ov004_0214e6d0
    str r11, [r6, #0x0]
.L_02158e0c:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02158e28
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158e28:
    ldr r1, [r6, #0x18]
    mov r0, r10
    bl func_02020e98
    ldr r0, [r10, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x4]
    ldr r2, .L_02158ef0
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r10, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r2, [r10, #0x4]
    ldr r0, .L_02158f10
    mov r1, #0x0
    str r0, [r2, #0xec]
    ldr r0, [r10, #0x4]
    blx func_ov012_021b3f78
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fb0
    ldr r0, [r10, #0x4]
    mov r1, #0x0
    blx func_ov012_021b3fc4
    ldr r0, [sp, #0xc]
    add r7, r7, #0x1
    add r0, r0, #0x16
    str r0, [sp, #0xc]
    cmp r7, #0x3
    blt .L_02158cfc
    mov r0, r9
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02158ebc: .word data_ov004_021612b4
.L_02158ec0: .word data_ov004_02161290
.L_02158ec4: .word data_ov004_02160c0c
.L_02158ec8: .word data_ov004_021611fc
.L_02158ecc: .word 0x1de
.L_02158ed0: .word func_ov004_02158ff0
.L_02158ed4: .word func_ov004_02159050
.L_02158ed8: .word func_ov004_021590cc
.L_02158edc: .word data_ov012_021d5154
.L_02158ee0: .word 0x31305053
.L_02158ee4: .word 0x8df
.L_02158ee8: .word data_ov004_021612d0
.L_02158eec: .word func_ov004_0215921c
.L_02158ef0: .word func_ov004_02159184
.L_02158ef4: .word data_ov004_0216094c
.L_02158ef8: .word data_ov012_021d1c58
.L_02158efc: .word data_ov004_021608f4
.L_02158f00: .word data_ov004_02161204
.L_02158f04: .word 0x1b2
.L_02158f08: .word data_02093c8c
.L_02158f0c: .word data_ov004_02161214
.L_02158f10: .word func_ov004_0215912c
    arm_func_end func_ov004_021588c4

    .global func_ov004_02158f14
    arm_func_start func_ov004_02158f14
func_ov004_02158f14: ; 0x02158f14
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02158f38
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02158f38:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_02158f48
    bl func_0206ae98
.L_02158f48:
    ldr r1, .L_02158f68
    mov r2, #0x0
    mov r0, #0x1
    str r2, [r1, #0x0]
    blx func_ov012_021b526c
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
.L_02158f68: .word data_ov012_021d5154
    arm_func_end func_ov004_02158f14

    .global func_ov004_02158f6c
    arm_func_start func_ov004_02158f6c
func_ov004_02158f6c: ; 0x02158f6c
    stmdb sp!, {r4, lr}
    ldr r1, .L_02158fd0
    mov r4, r0
    ldr r0, [r1, #0x0]
    blx r0
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0xc]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    mvn r0, #0x0
    str r0, [r4, #0x1c]
    ldmia sp!, {r4, pc}
.L_02158fd0: .word data_020a0e18
    arm_func_end func_ov004_02158f6c

    .global func_ov004_02158fd4
    arm_func_start func_ov004_02158fd4
func_ov004_02158fd4: ; 0x02158fd4
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    arm_func_end func_ov004_02158fd4

    .global func_ov004_02158fe8
    arm_func_start func_ov004_02158fe8
func_ov004_02158fe8: ; 0x02158fe8
    ldr r0, [r0, #0x1c]
    bx lr
    arm_func_end func_ov004_02158fe8

    .global func_ov004_02158ff0
    arm_func_start func_ov004_02158ff0
func_ov004_02158ff0: ; 0x02158ff0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x8f0000
    mov r2, #0x1
    mov r3, #0x10
    bl func_ov004_0214e9f0
    ldr r4, [r0, #0x4]
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r1, #0x10000
    str r1, [sp, #0x0]
    mov r0, r5
    add r1, sp, #0x0
    bl func_ov004_0214ea78
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_02158ff0

    .global func_ov004_02159050
    arm_func_start func_ov004_02159050
func_ov004_02159050: ; 0x02159050
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, .L_021590c8
    mov r5, r0
    ldr r4, [r5, #0x4]
    bl func_ov004_02151d90
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrb r0, [r0, #0x10]
    mov r1, r0, lsl #0x18
    movs r1, r1, lsr #0x1f
    beq .L_02159098
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_02159098
    mov r0, #0x78
    mov r1, #0x3
    bl func_0207342c
.L_02159098:
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r0, r5
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_021590c8: .word 0x31305053
    arm_func_end func_ov004_02159050

    .global func_ov004_021590cc
    arm_func_start func_ov004_021590cc
func_ov004_021590cc: ; 0x021590cc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02159128
    mov r5, r0
    bl func_ov004_02151d90
    mov r4, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x128]
    blx r1
    and r0, r0, #0x3
    cmp r0, #0x3
    ldr r0, [r4, #0x4]
    bne .L_02159114
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_02159114:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_02159128: .word 0x31305053
    arm_func_end func_ov004_021590cc

    .global func_ov004_0215912c
    arm_func_start func_ov004_0215912c
func_ov004_0215912c: ; 0x0215912c
    ldr r0, [r0, #0x4]
    tst r1, #0x1
    ldr ip, [r0, #0x10]
    ldr r3, [r0, #0x124]
    beq .L_0215915c
    cmp r3, #0x0
    subgt r0, r3, #0x1
    addgt r0, ip, r0, lsl #0x2
    ldrgt r0, [r0, #0xc]
    strgt r0, [r2, #0x0]
    ldrle r0, [ip, #0x14]
    strle r0, [r2, #0x0]
.L_0215915c:
    tst r1, #0x2
    bxeq lr
    cmp r3, #0x2
    addlt r0, r3, #0x1
    addlt r0, ip, r0, lsl #0x2
    ldrlt r0, [r0, #0xc]
    strlt r0, [r2, #0x0]
    ldrge r0, [ip, #0xc]
    strge r0, [r2, #0x0]
    bx lr
    arm_func_end func_ov004_0215912c

    .global func_ov004_02159184
    arm_func_start func_ov004_02159184
func_ov004_02159184: ; 0x02159184
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_02159218
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    ldr r5, [r1, #0x124]
    mov r1, #0x0
    bl func_0207342c
    str r5, [r4, #0x1c]
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldmia sp!, {r3, r4, r5, pc}
.L_02159218: .word 0x80011001
    arm_func_end func_ov004_02159184

    .global func_ov004_0215921c
    arm_func_start func_ov004_0215921c
func_ov004_0215921c: ; 0x0215921c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_021592ac
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x1
    bl func_0207342c
    mov r1, #0x0
    str r1, [r4, #0x1c]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldmia sp!, {r3, r4, r5, pc}
.L_021592ac: .word 0x80011001
    arm_func_end func_ov004_0215921c

    .global func_ov004_021592b0
    arm_func_start func_ov004_021592b0
func_ov004_021592b0: ; 0x021592b0
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x20
    mov r0, #0xf4
    ldr r1, .L_02159770
    ldr r2, .L_02159774
    add r3, r0, #0x2f
    bl func_0201a21c
    mov r1, #0xf4
    mov r5, r0
    bl func_ov004_0214fadc
    bl func_ov004_0214fc78
    bl func_ov004_0214dcd4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r5, #0x8]
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r5, #0xc]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_02159778
    ldr r1, .L_0215977c
    bl func_ov004_0214e880
    str r0, [r5, #0x14]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_02159780
    ldr r1, .L_02159784
    bl func_ov004_0214e880
    str r0, [r5, #0x18]
    ldr r0, .L_02159788
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x24]
    ldr r0, .L_0215978c
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x28]
    ldr r0, .L_02159790
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x2c]
    ldr r0, .L_02159794
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x30]
    bl func_0203b404
    ldr r3, [r0, #0x88]
    ldr r2, .L_02159798
    ldr r1, .L_0215979c
    ldr r0, [r2, #0x0]
    ldr lr, [r3, #0x4]
    ldr r4, [r1, #0x0]
    sub ip, r0, #0x1
    ldr r3, .L_021597a0
    mov r0, #0x810000
    str ip, [r2, #0x0]
    str r4, [r3, ip, lsl #0x2]
    str lr, [r1, #0x0]
    bl func_02035e88
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_021593d4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021593d4:
    ldr r0, [r4, #0x38]
    mov r1, #0x1
    str r0, [r5, #0xe4]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x50]
    blx r2
    ldr r0, [r5, #0x28]
    ldr r0, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x50]
    blx r1
    ldr r1, .L_02159798
    ldr r2, .L_021597a0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215979c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r5, #0x8]
    bl func_ov004_0214e4b0
    mov r4, r0
    str r4, [r5, #0x44]
    ldr r0, .L_021597a4
    ldr r1, .L_021597a8
    ldr r6, [r0, #0x0]
    ldr r2, .L_021597ac
    mov r0, #0x134
    mov r3, #0x3e
    ldr r7, [r4, #0x4]
    bl func_0201a21c
    movs r8, r0
    beq .L_02159470
    ldr r3, .L_021597b0
    mov r1, r7
    mov r2, r6
    blx func_ov012_021af0f8
    mov r8, r0
.L_02159470:
    ldr r0, [r8, #0x18]
    cmp r0, #0x0
    bne .L_0215948c
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215948c:
    ldr r6, [r8, #0x18]
    mov r1, #0x1
    ldr r0, [r6, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, [r5, #0x14]
    ldr r2, [r0, #0x0]
    ldr r6, [r1, #0x4]
    ldr r2, [r2, #0xb4]
    mov r1, r6
    blx r2
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mvn r6, #0x0
    bl func_ov004_0214f5c8
    cmp r0, #0xa
    beq .L_0215950c
    cmp r0, #0x1e
    beq .L_02159514
    cmp r0, #0x32
    moveq r6, #0x33
    b .L_02159518
.L_0215950c:
    mov r6, #0x31
    b .L_02159518
.L_02159514:
    mov r6, #0x32
.L_02159518:
    cmp r6, #0x0
    blt .L_0215956c
    mov r1, #0xd4
    mov r0, #0xd
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    bl func_0203b404
    mov r2, #0x74
    str r2, [sp, #0x0]
    add r1, sp, #0x10
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r3, r6
    mov r2, #0x810000
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215956c:
    bl func_ov004_021532a8
    str r0, [r5, #0xd8]
    bl func_0203b404
    ldr r1, [r0, #0x88]
    mov r0, r4
    bl func_ov004_02154ae4
    str r0, [r5, #0xb4]
    bl func_0203b404
    ldr r1, [r0, #0x88]
    mov r0, r4
    bl func_ov004_02155024
    str r0, [r5, #0xbc]
    ldr r0, [r5, #0x14]
    bl func_ov004_02154e54
    str r0, [r5, #0xb8]
    bl func_ov004_02155410
    mov r1, #0x0
    str r0, [r5, #0xc0]
    bl func_ov004_021555e8
    bl func_ov004_0215561c
    mov r1, #0x0
    str r0, [r5, #0xc4]
    bl func_ov004_02155790
    mov r1, #0x258
    strh r1, [r5, #0xe8]
    mov r0, #0x1
    strb r0, [r5, #0xeb]
    mov r0, r5
    strh r1, [r5, #0xe8]
    bl func_ov004_02159930
    mov r0, r4
    bl func_ov004_02156274
    str r0, [r5, #0xc8]
    mov r0, r4
    bl func_ov004_02156f10
    str r0, [r5, #0xcc]
    mov r0, r4
    bl func_ov004_021577a0
    str r0, [r5, #0xd0]
    mov r0, #0x1
    bl func_0203b424
    ldr r6, [r0, #0x88]
    mov r0, #0x1
    bl func_0203b414
    mov r1, r0
    ldr r1, [r1, #0x88]
    mov r2, r6
    mov r0, r4
    bl func_ov004_021533a0
    str r0, [r5, #0xd4]
    ldr r4, [r5, #0x44]
    mov r0, #0x18
    str r0, [sp, #0x8]
    mov r0, #0xa8
    str r0, [sp, #0xc]
    bl func_0203b404
    mov r2, #0x78
    str r2, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r2, #0x810000
    mov r3, #0x3b
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r5, #0x44]
    mov r0, r5
    bl func_ov004_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r1, [r5, #0x18]
    mov r0, r4
    mov r2, #0x0
    bl func_ov004_02153bfc
    str r0, [r5, #0xdc]
    bl func_ov004_021588c4
    str r0, [r5, #0xf0]
    bl func_02026f94
    str r0, [r5, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x1c]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x1c
    bl func_ov004_02152ca0
    ldr r0, [r5, #0x4]
    ldr r1, .L_021597b4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x4]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_02026f94
    str r0, [r5, #0xe0]
    mov r0, #0x80000
    str r0, [sp, #0x18]
    ldr r0, [r5, #0xe0]
    add r1, sp, #0x18
    bl func_ov004_02152ca0
    ldr r0, [r5, #0xe0]
    ldr r1, .L_021597b8
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0xe0]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x0]
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02159770: .word data_ov004_021612f8
.L_02159774: .word data_ov004_021612e0
.L_02159778: .word data_ov004_02161310
.L_0215977c: .word data_ov004_02161324
.L_02159780: .word data_ov004_02161338
.L_02159784: .word data_ov004_0216134c
.L_02159788: .word data_ov004_02161360
.L_0215978c: .word data_ov004_02161374
.L_02159790: .word data_ov004_0216138c
.L_02159794: .word data_ov004_021613a4
.L_02159798: .word data_02093c08
.L_0215979c: .word data_020a0dd0
.L_021597a0: .word data_020a16d0
.L_021597a4: .word data_ov012_021d5154
.L_021597a8: .word data_ov004_021608d4
.L_021597ac: .word data_ov004_021612d8
.L_021597b0: .word func_ov004_0214e414
.L_021597b4: .word func_ov004_0215997c
.L_021597b8: .word func_ov004_0215a030
    arm_func_end func_ov004_021592b0

    .global func_ov004_021597bc
    arm_func_start func_ov004_021597bc
func_ov004_021597bc: ; 0x021597bc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    blx func_ov012_021b65bc
    mov r0, #0x4
    bl func_ov004_02159900
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r4, .L_021598fc
    b .L_021597ec
.L_021597e4:
    ldr r0, [r4, #0x0]
    blx r0
.L_021597ec:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_021597e4
    ldr r0, [r5, #0xd4]
    cmp r0, #0x0
    beq .L_02159808
    bl func_ov004_02153788
.L_02159808:
    ldr r0, [r5, #0x8]
    bl func_ov004_0214e4b8
    ldr r0, [r5, #0xc]
    bl func_ov004_0214e4b8
    ldr r0, [r5, #0xb0]
    cmp r0, #0x0
    beq .L_02159828
    blx func_ov012_021bd500
.L_02159828:
    ldr r0, [r5, #0xb4]
    cmp r0, #0x0
    beq .L_02159838
    bl func_ov004_02154d00
.L_02159838:
    ldr r0, [r5, #0xbc]
    cmp r0, #0x0
    beq .L_02159848
    bl func_ov004_02155244
.L_02159848:
    ldr r0, [r5, #0xb8]
    cmp r0, #0x0
    beq .L_02159858
    bl func_ov004_02154f64
.L_02159858:
    ldr r0, [r5, #0xc0]
    cmp r0, #0x0
    beq .L_02159868
    bl func_ov004_021555a0
.L_02159868:
    ldr r0, [r5, #0xc4]
    cmp r0, #0x0
    beq .L_02159878
    bl func_ov004_021556bc
.L_02159878:
    ldr r0, [r5, #0xc8]
    cmp r0, #0x0
    beq .L_02159888
    bl func_ov004_0215682c
.L_02159888:
    ldr r0, [r5, #0xcc]
    cmp r0, #0x0
    beq .L_02159898
    bl func_ov004_021573f8
.L_02159898:
    ldr r0, [r5, #0xd0]
    cmp r0, #0x0
    beq .L_021598a8
    bl func_ov004_021579fc
.L_021598a8:
    ldr r0, [r5, #0xd8]
    cmp r0, #0x0
    beq .L_021598b8
    bl func_ov004_021532e0
.L_021598b8:
    ldr r0, [r5, #0xdc]
    cmp r0, #0x0
    beq .L_021598c8
    bl func_ov004_02154254
.L_021598c8:
    ldr r0, [r5, #0xf0]
    cmp r0, #0x0
    beq .L_021598d8
    bl func_ov004_02158f14
.L_021598d8:
    ldr r0, [r5, #0xe4]
    cmp r0, #0x0
    beq .L_021598e8
    bl func_02034d7c
.L_021598e8:
    mov r0, r5
    bl func_ov004_0214fb48
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_021598fc: .word data_020a0e18
    arm_func_end func_ov004_021597bc

    .global func_ov004_02159900
    arm_func_start func_ov004_02159900
func_ov004_02159900: ; 0x02159900
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_0215992c
    b .L_02159920
.L_02159914:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_02159920:
    cmp r5, r6
    blo .L_02159914
    ldmia sp!, {r4, r5, r6, pc}
.L_0215992c: .word data_020a0e18
    arm_func_end func_ov004_02159900

    .global func_ov004_02159930
    arm_func_start func_ov004_02159930
func_ov004_02159930: ; 0x02159930
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrsh r2, [r5, #0xe8]
    mov r0, #0x64
    mov r1, #0x3c
    smulbb r0, r2, r0
    bl func_0200d12c
    mov r0, r0, lsl #0x10
    mov r4, r0, asr #0x10
    ldr r0, [r5, #0xb4]
    mov r1, r4
    bl func_ov004_02154d28
    ldr r0, [r5, #0xbc]
    mov r1, r4
    bl func_ov004_0215526c
    ldr r0, [r5, #0xb8]
    mov r1, r4
    bl func_ov004_02154f8c
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_02159930

    .global func_ov004_0215997c
    arm_func_start func_ov004_0215997c
func_ov004_0215997c: ; 0x0215997c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x4]
    ldr r1, .L_021599a4
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_021599a4: .word func_ov004_021599a8
    arm_func_end func_ov004_0215997c

    .global func_ov004_021599a8
    arm_func_start func_ov004_021599a8
func_ov004_021599a8: ; 0x021599a8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_ov004_0214f754
    bl func_ov004_0214f780
    mov r1, r0
    ldr r0, [r4, #0xd0]
    bl func_ov004_02157a5c
    bl func_ov004_0214f93c
    mov r0, #0x7
    mov r1, #0x0
    bl func_0207361c
    ldr r0, [r4, #0xc8]
    bl func_ov004_0215687c
    ldr r0, [r5, #0x4]
    ldr r1, .L_021599f4
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_021599f4: .word func_ov004_021599f8
    arm_func_end func_ov004_021599a8

    .global func_ov004_021599f8
    arm_func_start func_ov004_021599f8
func_ov004_021599f8: ; 0x021599f8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0xc8]
    bl func_ov004_0215696c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0xd8]
    bl func_ov004_021532f4
    bl func_ov004_0214f638
    mov r4, r0
    ldr r0, [r5, #0xd8]
    bl func_ov004_0215333c
    mov r2, r0
    ldr r0, [r5, #0xd4]
    mov r1, r4
    bl func_ov004_021537a4
    ldr r0, [r5, #0xdc]
    bl func_ov004_021542e0
    ldr r0, [r6, #0x4]
    ldr r1, .L_02159a58
    bl func_02028384
    ldmia sp!, {r4, r5, r6, pc}
.L_02159a58: .word func_ov004_02159a5c
    arm_func_end func_ov004_021599f8

    .global func_ov004_02159a5c
    arm_func_start func_ov004_02159a5c
func_ov004_02159a5c: ; 0x02159a5c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xdc]
    bl func_ov004_0215431c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xd4]
    mov r1, #0x1
    bl func_ov004_02153b6c
    ldr r0, [r4, #0xe0]
    ldr r1, .L_02159ab0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0xdc]
    bl func_ov004_02154368
    ldr r0, [r5, #0x4]
    ldr r1, .L_02159ab4
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02159ab0: .word func_ov004_0215a034
.L_02159ab4: .word func_ov004_02159ab8
    arm_func_end func_ov004_02159a5c

    .global func_ov004_02159ab8
    arm_func_start func_ov004_02159ab8
func_ov004_02159ab8: ; 0x02159ab8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xd8]
    bl func_ov004_02153368
    mov r7, r0
    ldr r0, [r4, #0xdc]
    mvn r1, #0x0
    bl func_ov004_021543ac
    cmp r0, #0x0
    beq .L_02159c3c
    ldr r0, [r4, #0xdc]
    mvn r1, #0x0
    bl func_ov004_021543dc
    mov r8, r0
    ldr r0, [r4, #0xc4]
    mov r1, r8
    bl func_ov004_0215570c
    ldr r0, [r4, #0xc4]
    mov r1, #0x1
    bl func_ov004_02155790
    ldr r0, [r4, #0xd0]
    bl func_ov004_02157b10
    ldr r0, [r4, #0xe0]
    ldr r1, .L_02159d64
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0xb8]
    bl func_ov004_02155008
    mov r0, #0x1e
    bl func_ov004_02159900
    bl func_ov004_0214ce64
    bl func_ov004_0214cea0
    cmp r0, #0x2
    bne .L_02159b64
    bl func_ov004_0214f5f4
    mov r6, r0
    bl func_ov004_0214f5c8
    sub r0, r0, #0x1
    cmp r6, r0
    moveq r0, #0x1
    beq .L_02159b70
.L_02159b64:
    ldr r0, [r4, #0xd8]
    mov r1, r8
    bl func_ov004_02153340
.L_02159b70:
    cmp r0, #0x0
    ldr r0, [r4, #0xcc]
    beq .L_02159be4
    bl func_ov004_02157458
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    bl func_ov004_021555e8
    mov r0, #0x7c
    mov r1, #0x2
    bl func_0207342c
    ldr r0, [r4, #0xd0]
    mov r1, #0x2
    bl func_ov004_02157a74
    mov r0, #0x1
    bl func_ov004_0214f79c
    bl func_ov004_0214f780
    mov r1, r0
    ldr r0, [r4, #0xd0]
    bl func_ov004_02157a44
    ldr r0, [r4, #0xdc]
    bl func_ov004_02154400
    ldr r0, [r4, #0xdc]
    mov r1, r8
    mov r2, #0x2
    bl func_ov004_021544f0
    ldr r0, [r5, #0x4]
    ldr r1, .L_02159d68
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02159be4:
    bl func_ov004_02157488
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    bl func_ov004_021555e8
    mov r0, #0x7c
    mov r1, #0x3
    bl func_0207342c
    ldr r0, [r4, #0xd0]
    bl func_ov004_02157b48
    ldr r0, [r4, #0xc4]
    mov r1, r7
    bl func_ov004_0215570c
    ldr r0, [r4, #0xdc]
    bl func_ov004_02154448
    ldr r0, [r4, #0xdc]
    mov r1, r8
    mov r2, #0x1
    bl func_ov004_021544f0
    ldr r0, [r5, #0x4]
    ldr r1, .L_02159d6c
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02159c3c:
    ldrsb r0, [r4, #0xea]
    cmp r0, #0x0
    beq .L_02159cb4
    ldr r0, [r4, #0xcc]
    bl func_ov004_02157428
    mov r0, #0x7c
    mov r1, #0x5
    bl func_0207342c
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    bl func_ov004_021555e8
    ldr r0, [r4, #0xc4]
    mov r1, r7
    bl func_ov004_0215570c
    ldr r0, [r4, #0xc4]
    mov r1, #0x1
    bl func_ov004_02155790
    ldr r0, [r4, #0xdc]
    mov r1, r7
    bl func_ov004_0215446c
    ldr r0, [r4, #0xe0]
    ldr r1, .L_02159d64
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0xb8]
    bl func_ov004_02155008
    ldr r0, [r5, #0x4]
    ldr r1, .L_02159d70
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02159cb4:
    ldr r0, [r4, #0x10]
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
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov004_0214ce64
    bl func_ov004_0214cea0
    cmp r0, #0x2
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0xcc]
    bl func_ov004_021574b8
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    bl func_ov004_021555e8
    ldr r0, [r4, #0xdc]
    bl func_ov004_0215432c
    ldr r0, [r4, #0xd4]
    mov r1, #0x0
    bl func_ov004_02153b6c
    ldr r0, [r4, #0xc4]
    mov r1, #0x0
    bl func_ov004_02155790
    mov r0, #0x7c
    mov r1, #0x3
    bl func_0207342c
    ldr r0, [r4, #0xd0]
    bl func_ov004_02157b48
    ldr r0, [r4, #0xe0]
    ldr r1, .L_02159d64
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0xb8]
    bl func_ov004_02155008
    ldr r0, [r5, #0x4]
    ldr r1, .L_02159d74
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02159d64: .word func_ov004_0215a030
.L_02159d68: .word func_ov004_02159e58
.L_02159d6c: .word func_ov004_02159e80
.L_02159d70: .word func_ov004_02159ea8
.L_02159d74: .word func_ov004_02159f38
    arm_func_end func_ov004_02159ab8

    .global func_ov004_02159d78
    arm_func_start func_ov004_02159d78
func_ov004_02159d78: ; 0x02159d78
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xdc]
    bl func_ov004_0215432c
    ldr r0, [r4, #0xd4]
    mov r1, #0x0
    bl func_ov004_02153b6c
    ldr r0, .L_02159e4c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, [r4, #0xc4]
    mov r1, #0x0
    bl func_ov004_02155790
    ldrsh r0, [r4, #0xe8]
    rsb r0, r0, #0x258
    bl func_ov004_0214f968
    bl func_ov004_0214f65c
    bl func_ov004_0214f6a0
    cmp r0, #0x0
    beq .L_02159dec
    ldr r0, [r4, #0xc8]
    bl func_ov004_0215692c
    mov r0, #0x7
    bl func_0207367c
    ldr r0, [r4, #0x4]
    ldr r1, .L_02159e50
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02159dec:
    ldr r0, [r4, #0xc0]
    mov r1, #0x0
    bl func_ov004_021555e8
    mov r1, #0x258
    mov r0, r4
    strh r1, [r4, #0xe8]
    bl func_ov004_02159930
    bl func_ov004_0214f678
    cmp r0, #0x0
    beq .L_02159e28
    bl func_ov004_0214f5f4
    mov r1, r0
    ldr r0, [r4, #0xc8]
    bl func_ov004_021568f0
    b .L_02159e38
.L_02159e28:
    bl func_ov004_0214f5f4
    mov r1, r0
    ldr r0, [r4, #0xc8]
    bl func_ov004_021568b4
.L_02159e38:
    ldr r0, [r4, #0x4]
    ldr r1, .L_02159e54
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02159e4c: .word data_020a0e18
.L_02159e50: .word func_ov004_02159ed0
.L_02159e54: .word func_ov004_021599f8
    arm_func_end func_ov004_02159d78

    .global func_ov004_02159e58
    arm_func_start func_ov004_02159e58
func_ov004_02159e58: ; 0x02159e58
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xcc]
    bl func_ov004_021574e8
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_02159d78
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02159e58

    .global func_ov004_02159e80
    arm_func_start func_ov004_02159e80
func_ov004_02159e80: ; 0x02159e80
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xcc]
    bl func_ov004_021574e8
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_02159d78
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02159e80

    .global func_ov004_02159ea8
    arm_func_start func_ov004_02159ea8
func_ov004_02159ea8: ; 0x02159ea8
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xcc]
    bl func_ov004_021574e8
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_02159d78
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02159ea8

    .global func_ov004_02159ed0
    arm_func_start func_ov004_02159ed0
func_ov004_02159ed0: ; 0x02159ed0
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x3c
    ldr r4, [r1, #0x10]
    bl func_ov004_02159900
    bl func_ov004_0214ce64
    bl func_ov004_0214cea0
    cmp r0, #0x2
    bne .L_02159f20
    bl func_ov004_0214f780
    cmp r0, #0x0
    beq .L_02159f10
    bl func_ov004_0214ce64
    mov r1, #0x2
    bl func_ov004_0214ce80
    b .L_02159f2c
.L_02159f10:
    bl func_ov004_0214ce64
    mov r1, #0x3
    bl func_ov004_0214ce80
    b .L_02159f2c
.L_02159f20:
    bl func_ov004_0214ce64
    mov r1, #0x4
    bl func_ov004_0214ce74
.L_02159f2c:
    mov r0, r4
    bl func_ov004_021597bc
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02159ed0

    .global func_ov004_02159f38
    arm_func_start func_ov004_02159f38
func_ov004_02159f38: ; 0x02159f38
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xcc]
    bl func_ov004_021574e8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x7
    bl func_0207367c
    ldr r0, [r4, #0xf0]
    bl func_ov004_02158f6c
    ldr r0, [r5, #0x4]
    ldr r1, .L_02159f78
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02159f78: .word func_ov004_02159f7c
    arm_func_end func_ov004_02159f38

    .global func_ov004_02159f7c
    arm_func_start func_ov004_02159f7c
func_ov004_02159f7c: ; 0x02159f7c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xf0]
    bl func_ov004_02158fd4
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xf0]
    bl func_ov004_02158fe8
    cmp r0, #0x0
    beq .L_02159fc0
    cmp r0, #0x1
    beq .L_02159fe0
    cmp r0, #0x2
    beq .L_0215a014
    ldmia sp!, {r3, r4, r5, pc}
.L_02159fc0:
    mov r1, #0x0
    mov r0, r4
    strh r1, [r4, #0xe8]
    bl func_ov004_02159d78
    mov r0, #0x7
    mov r1, #0x0
    bl func_0207361c
    ldmia sp!, {r3, r4, r5, pc}
.L_02159fe0:
    bl func_ov004_0214f5dc
    bl func_ov004_0214f508
    ldr r0, [r4, #0xc0]
    mov r1, #0x0
    bl func_ov004_021555e8
    mov r1, #0x258
    mov r0, r4
    strh r1, [r4, #0xe8]
    bl func_ov004_02159930
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215a02c
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215a014:
    bl func_ov004_0214ce64
    mov r1, #0x1
    bl func_ov004_0214ce74
    mov r0, r4
    bl func_ov004_021597bc
    ldmia sp!, {r3, r4, r5, pc}
.L_0215a02c: .word func_ov004_021599a8
    arm_func_end func_ov004_02159f7c

    .global func_ov004_0215a030
    arm_func_start func_ov004_0215a030
func_ov004_0215a030: ; 0x0215a030
    bx lr
    arm_func_end func_ov004_0215a030

    .global func_ov004_0215a034
    arm_func_start func_ov004_0215a034
func_ov004_0215a034: ; 0x0215a034
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x10]
    mov r0, #0x258
    strb r1, [r2, #0xea]
    strh r0, [r2, #0xe8]
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215a06c
    bl func_02028384
    mov r0, r4
    bl func_ov004_0215a070
    ldmia sp!, {r4, pc}
.L_0215a06c: .word func_ov004_0215a070
    arm_func_end func_ov004_0215a034

    .global func_ov004_0215a070
    arm_func_start func_ov004_0215a070
func_ov004_0215a070: ; 0x0215a070
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_ov004_0214ce64
    bl func_ov004_0214cea0
    cmp r0, #0x2
    bne .L_0215a0a8
    bl func_ov004_0214f5f4
    mov r6, r0
    bl func_ov004_0214f5c8
    sub r0, r0, #0x1
    cmp r6, r0
    beq .L_0215a118
.L_0215a0a8:
    ldrsh r0, [r4, #0xe8]
    sub r0, r0, #0x1
    strh r0, [r4, #0xe8]
    ldrsh r6, [r4, #0xe8]
    cmp r6, #0x0
    bgt .L_0215a0e0
    mov r0, #0x1
    strb r0, [r4, #0xea]
    ldr r0, [r4, #0xdc]
    bl func_ov004_0215438c
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215a124
    bl func_02028384
    b .L_0215a118
.L_0215a0e0:
    mov r0, r6
    mov r1, #0x3c
    bl func_0200d12c
    mov r5, r0
    mov r0, r6
    mov r1, #0x3c
    bl func_0200d12c
    cmp r1, #0x0
    bne .L_0215a118
    cmp r5, #0x4
    bgt .L_0215a118
    mov r0, #0x7c
    mov r1, #0x4
    bl func_0207342c
.L_0215a118:
    mov r0, r4
    bl func_ov004_02159930
    ldmia sp!, {r4, r5, r6, pc}
.L_0215a124: .word func_ov004_0215a030
    arm_func_end func_ov004_0215a070

    .global func_ov004_0215a128
    arm_func_start func_ov004_0215a128
func_ov004_0215a128: ; 0x0215a128
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    ldr r1, .L_0215a3f4
    ldr r2, .L_0215a3f8
    mov r0, #0x28
    mov r3, #0x3d
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x28
    mov r8, r0
    bl func_020517fc
    mov r0, #0xa
    bl func_ov004_0214f568
    ldr r2, .L_0215a3fc
    mov r0, r8
    mov r1, #0x9
    mov r3, #0xa
    bl func_ov004_021531d0
    mov r0, #0xff
    mov r10, #0x0
    strh r0, [r8, #0x12]
    mov r11, #0x1
    mov r4, #0x17
    mov r5, r10
.L_0215a188:
    mov r0, r10, lsl #0x1
    ldrsh r9, [r8, r0]
    bl func_ov004_0214efa0
    mov r6, r5
    ldr r7, [r0, #0x40]
    b .L_0215a1b8
.L_0215a1a0:
    ldrb r0, [r7, #0x0]
    cmp r9, r0
    moveq r0, r11
    beq .L_0215a1cc
    add r6, r6, #0x1
    add r7, r7, #0x28
.L_0215a1b8:
    bl func_ov004_0214efa0
    ldr r0, [r0, #0x44]
    cmp r6, r0
    blo .L_0215a1a0
    mov r0, #0x0
.L_0215a1cc:
    cmp r0, #0x0
    moveq r0, r10, lsl #0x1
    add r10, r10, #0x1
    streqh r4, [r8, r0]
    cmp r10, #0xa
    blt .L_0215a188
    mov r10, #0x0
.L_0215a1e8:
    add r0, r8, r10, lsl #0x1
    ldrsh r0, [r0, #0x14]
    mov r2, r10, lsl #0x1
    cmp r0, #0x0
    bne .L_0215a390
    add r3, r10, #0x1
    mov r4, #0x1
    b .L_0215a228
.L_0215a208:
    mov r0, r3, lsl #0x1
    ldrsh r1, [r8, r0]
    ldrsh r0, [r8, r2]
    add r3, r3, #0x1
    cmp r1, r0
    addeq r0, r4, #0x1
    moveq r0, r0, lsl #0x10
    moveq r4, r0, asr #0x10
.L_0215a228:
    cmp r3, #0xa
    blt .L_0215a208
    mov r0, r10, lsl #0x1
    mov r5, #0x0
    ldrsh r9, [r8, r0]
    bl func_ov004_0214efa0
    ldr r7, [r0, #0x40]
    mov r6, r5
    b .L_0215a274
.L_0215a24c:
    ldrb r0, [r7, #0x0]
    cmp r9, r0
    bne .L_0215a26c
    ldrb r0, [r7, #0x1]
    cmp r0, #0x0
    addls r0, r5, #0x1
    movls r0, r0, lsl #0x10
    movls r5, r0, asr #0x10
.L_0215a26c:
    add r6, r6, #0x1
    add r7, r7, #0x28
.L_0215a274:
    bl func_ov004_0214efa0
    ldr r0, [r0, #0x44]
    cmp r6, r0
    blo .L_0215a24c
    ldr r1, .L_0215a3f4
    ldr r2, .L_0215a3f8
    mov r0, r5, lsl #0x1
    mov r3, #0x5c
    bl func_0201a21c
    str r0, [sp, #0x4]
    ldr r1, .L_0215a3f4
    ldr r2, .L_0215a3f8
    mov r0, r4, lsl #0x1
    mov r3, #0x5d
    bl func_0201a21c
    mov r9, r0
    ldr r0, [sp, #0x4]
    mov r1, r10, lsl #0x1
    str r0, [sp, #0x0]
    ldrsh r11, [r8, r1]
    bl func_ov004_0214efa0
    ldr r7, [r0, #0x40]
    mov r6, #0x0
    b .L_0215a2fc
.L_0215a2d4:
    ldrb r0, [r7, #0x0]
    cmp r11, r0
    bne .L_0215a2f4
    ldrb r0, [r7, #0x1]
    cmp r0, #0x0
    ldrls r0, [sp, #0x0]
    strlsh r6, [r0], #0x2
    strls r0, [sp, #0x0]
.L_0215a2f4:
    add r6, r6, #0x1
    add r7, r7, #0x28
.L_0215a2fc:
    bl func_ov004_0214efa0
    ldr r0, [r0, #0x44]
    cmp r6, r0
    blo .L_0215a2d4
    ldr r2, [sp, #0x4]
    mov r0, r9
    mov r1, r4
    mov r3, r5
    bl func_ov004_021531d0
    ldrsh r2, [r9, #0x0]
    add r1, r8, r10, lsl #0x1
    mov r0, r10, lsl #0x1
    add r2, r2, #0x1
    strh r2, [r1, #0x14]
    add r1, r10, #0x1
    mov r4, #0x1
    b .L_0215a378
.L_0215a340:
    mov r5, r1, lsl #0x1
    ldrsh r3, [r8, r5]
    ldrsh r2, [r8, r0]
    cmp r3, r2
    bne .L_0215a374
    mov r2, r4, lsl #0x1
    ldrsh r3, [r9, r2]
    add r2, r4, #0x1
    mov r2, r2, lsl #0x10
    add r4, r3, #0x1
    add r3, r8, r5
    strh r4, [r3, #0x14]
    mov r4, r2, asr #0x10
.L_0215a374:
    add r1, r1, #0x1
.L_0215a378:
    cmp r1, #0xa
    blt .L_0215a340
    mov r0, r9
    bl func_0201b268
    ldr r0, [sp, #0x4]
    bl func_0201b268
.L_0215a390:
    add r10, r10, #0x1
    cmp r10, #0xa
    blt .L_0215a1e8
    mov r4, #0x0
.L_0215a3a0:
    bl func_ov004_0214efa0
    add r1, r8, r4, lsl #0x1
    ldrsh r1, [r1, #0x14]
    add r0, r0, r4, lsl #0x1
    add r4, r4, #0x1
    sub r1, r1, #0x1
    strh r1, [r0, #0x50]
    cmp r4, #0xa
    blt .L_0215a3a0
    bl func_ov004_0214f514
    bl func_ov004_0214f754
    bl func_ov004_0214f93c
    mov r0, #0x0
    bl func_ov004_0214f718
    mov r0, #0x1
    bl func_ov004_0214f740
    mov r0, r8
    bl func_0201b244
    bl func_ov004_021592b0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215a3f4: .word data_ov004_021613d4
.L_0215a3f8: .word data_ov004_021613bc
.L_0215a3fc: .word data_ov004_02160520
    arm_func_end func_ov004_0215a128

    .global func_ov004_0215a400
    arm_func_start func_ov004_0215a400
func_ov004_0215a400: ; 0x0215a400
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r6, r0
    ldr r1, .L_0215a53c
    ldr r2, .L_0215a540
    mov r0, #0x14
    mov r3, #0x28
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x14
    bl func_020517fc
    strb r6, [r4, #0x10]
    strb r5, [r4, #0x11]
    ldrsb r0, [r4, #0x11]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    ldrsb r0, [r4, #0x11]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    bl func_0203d478
    ldrsb r0, [r4, #0x11]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    ldrsb r0, [r4, #0x11]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    ldrsb r0, [r4, #0x11]
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldrsb r0, [r4, #0x10]
    cmp r0, #0x0
    ldrsb r0, [r4, #0x11]
    beq .L_0215a508
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215a544
    ldr r1, .L_0215a548
    bl func_ov004_0214e880
    str r0, [r4, #0x0]
    ldr r0, .L_0215a54c
    mov r1, #0x0
    blx func_020101f4
    b .L_0215a52c
.L_0215a508:
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215a550
    ldr r1, .L_0215a554
    bl func_ov004_0214e880
    str r0, [r4, #0x0]
    ldr r0, .L_0215a558
    mov r1, #0x0
    blx func_020101f4
.L_0215a52c:
    str r0, [r4, #0x4]
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0215a53c: .word data_ov004_02161418
.L_0215a540: .word data_ov004_021613f4
.L_0215a544: .word data_ov004_02161434
.L_0215a548: .word data_ov004_02161448
.L_0215a54c: .word data_ov004_0216145c
.L_0215a550: .word data_ov004_02161474
.L_0215a554: .word data_ov004_02161488
.L_0215a558: .word data_ov004_0216149c
    arm_func_end func_ov004_0215a400

    .global func_ov004_0215a55c
    arm_func_start func_ov004_0215a55c
func_ov004_0215a55c: ; 0x0215a55c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_0215a57c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215a57c:
    mov r4, #0x0
    b .L_0215a59c
.L_0215a584:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_0215a598
    bl func_0206ae98
.L_0215a598:
    add r4, r4, #0x1
.L_0215a59c:
    cmp r4, #0x2
    blo .L_0215a584
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_0215a55c

    .global func_ov004_0215a5b0
    arm_func_start func_ov004_0215a5b0
func_ov004_0215a5b0: ; 0x0215a5b0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r6, r1
    ldr r4, .L_0215a794
    mov r7, r0
    ldr r1, .L_0215a798
    ldr r2, .L_0215a79c
    mov r0, #0x134
    mov r3, #0x3e
    ldr r4, [r4, #0x0]
    ldr r5, [r6, #0x4]
    bl func_0201a21c
    movs r8, r0
    beq .L_0215a5fc
    ldr r3, .L_0215a7a0
    mov r1, r5
    mov r2, r4
    blx func_ov012_021af0f8
    mov r8, r0
.L_0215a5fc:
    ldr r0, [r8, #0x18]
    cmp r0, #0x0
    bne .L_0215a618
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215a618:
    ldr r4, [r8, #0x18]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r7, #0x0]
    mov r0, r4
    bl func_ov004_0214e478
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, #0x880000
    mov r2, #0x0
    mov r3, #0x81
    bl func_ov004_0214e9f0
    ldrsb r1, [r7, #0x10]
    mov r4, r0
    mov r2, #0x800
    cmp r1, #0x0
    beq .L_0215a690
    add r1, sp, #0x8
    str r2, [sp, #0x8]
    bl func_ov004_0215a7a4
    b .L_0215a69c
.L_0215a690:
    add r1, sp, #0x4
    str r2, [sp, #0x4]
    bl func_ov004_0215a7a4
.L_0215a69c:
    ldr r0, [r4, #0x4]
    mov r1, #0x80000
    ldr r5, [r0, #0x50]
    mov r0, #0x38000
    str r1, [r5, #0xc]
    str r0, [r5, #0x10]
    ldrb r0, [r5, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_0215a6d4
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0215a6d4:
    ldrb r2, [r5, #0x24]
    mov r0, r6
    mov r1, r4
    orr r2, r2, #0x31
    strb r2, [r5, #0x24]
    bl func_ov004_0214e478
    ldrsb r0, [r7, #0x10]
    cmp r0, #0x0
    beq .L_0215a75c
    ldr r0, [r7, #0x0]
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x0
    bl func_0206ad90
    mov r1, #0x10
    mov r2, #0x1
    str r0, [r7, #0x8]
    bl func_ov004_0215a7c8
    mov r0, r4
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x1
    mov r2, #0xb
    mov r3, #0x0
    bl func_0206ad90
    mov r1, #0x8
    mov r2, #0x2
    str r0, [r7, #0xc]
    bl func_ov004_0215a7c8
    b .L_0215a78c
.L_0215a75c:
    mov r0, r4
    bl func_ov004_021545b0
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x1
    mov r2, #0x6
    mov r3, #0x0
    bl func_0206ad90
    mov r1, #0x8
    mov r2, #0x1
    str r0, [r7, #0x8]
    bl func_ov004_0215a7c8
.L_0215a78c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0215a794: .word data_ov012_021d5154
.L_0215a798: .word data_ov004_021608d4
.L_0215a79c: .word data_ov004_021613ec
.L_0215a7a0: .word func_ov004_0214e414
    arm_func_end func_ov004_0215a5b0

    .global func_ov004_0215a7a4
    arm_func_start func_ov004_0215a7a4
func_ov004_0215a7a4: ; 0x0215a7a4
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xf8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0215a7a4

    .global func_ov004_0215a7c8
    arm_func_start func_ov004_0215a7c8
func_ov004_0215a7c8: ; 0x0215a7c8
    strb r1, [r0, #0x17]
    strb r2, [r0, #0x16]
    mov r1, #0x1
    strb r1, [r0, #0x19]
    bx lr
    arm_func_end func_ov004_0215a7c8

    .global func_ov004_0215a7dc
    arm_func_start func_ov004_0215a7dc
func_ov004_0215a7dc: ; 0x0215a7dc
    stmdb sp!, {r4, lr}
    ldrsb r0, [r0, #0x11]
    mov r1, #0x1
    mov r4, r1, lsl r0
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    mov r0, #0x1
    ldr r1, [r1, #0x4]
    str r0, [r1, #0x8e8]
    str r4, [r1, #0x8ec]
    str r0, [r1, #0x8f0]
    strb r0, [r1, #0x902]
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x8
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    str r1, [r2, #0x8c0]
    str r1, [r2, #0x8c4]
    str r0, [r2, #0x8f0]
    strb r0, [r2, #0x902]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215a7dc

    .global func_ov004_0215a834
    arm_func_start func_ov004_0215a834
func_ov004_0215a834: ; 0x0215a834
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    ldr r1, .L_0215a874
    ldr r2, .L_0215a878
    mov r0, #0x8
    mov r3, #0x21
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x8
    mov r4, r0
    bl func_020517fc
    strb r6, [r4, #0x4]
    mov r0, r4
    strb r5, [r4, #0x5]
    ldmia sp!, {r4, r5, r6, pc}
.L_0215a874: .word data_ov004_021614d8
.L_0215a878: .word data_ov004_021614b4
    arm_func_end func_ov004_0215a834

    .global func_ov004_0215a87c
    arm_func_start func_ov004_0215a87c
func_ov004_0215a87c: ; 0x0215a87c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0215a894
    bl func_ov004_021500f0
.L_0215a894:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215a87c

    .global func_ov004_0215a8a0
    arm_func_start func_ov004_0215a8a0
func_ov004_0215a8a0: ; 0x0215a8a0
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0203b404
    mov r1, #0x4
    str r1, [sp, #0x0]
    mov r1, #0x10
    str r1, [sp, #0x4]
    mov r1, #0x18
    str r1, [sp, #0x8]
    mov r1, #0x6e
    str r1, [sp, #0xc]
    ldr r1, [r0, #0x88]
    mov r0, r6
    mov r2, #0x3
    mov r3, #0x830000
    bl func_ov004_0214fcb0
    mov r1, r5, lsl #0x10
    mov r2, r4, lsl #0x10
    str r0, [r7, #0x0]
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov004_021501e4
    ldrb r1, [r7, #0x4]
    ldr r0, [r7, #0x0]
    bl func_ov004_02150270
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r7, #0x0]
    mov r1, #0xe
    mov r2, #0x20
    mov r3, #0x10
    bl func_ov004_02150160
    ldrb r1, [r7, #0x4]
    ldrb r0, [r7, #0x5]
    cmp r1, r0
    bne .L_0215aa54
    add r1, r5, #0x10
    sub r0, r4, #0x20
    str r1, [sp, #0x1c]
    str r0, [sp, #0x20]
    bl func_0203b404
    mov r2, #0x6d
    str r2, [sp, #0x0]
    add r1, sp, #0x1c
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r6
    mov r2, #0x830000
    mov r3, #0xf
    bl func_ov004_0214ee60
    mov r5, r0
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r4, [r5, #0x4]
    ldr r0, .L_0215aa5c
    bl func_020326b0
    mov r3, r0
    mov r0, r4
    ldr r4, [r0, #0x0]
    ldr r1, .L_0215aa5c
    ldr r4, [r4, #0x40]
    add r2, sp, #0x10
    blx r4
    mov r1, r0
    ldr r2, [sp, #0x10]
    add r0, sp, #0x14
    bl func_0202c4a4
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x38]
    ldr r3, [sp, #0x18]
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215aa54:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0215aa5c: .word data_ov004_021614f4
    arm_func_end func_ov004_0215a8a0

    .global func_ov004_0215aa60
    arm_func_start func_ov004_0215aa60
func_ov004_0215aa60: ; 0x0215aa60
    stmdb sp!, {r4, lr}
    ldr r1, .L_0215aa90
    ldr r2, .L_0215aa94
    mov r0, #0x18
    mov r3, #0x1f
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x18
    mov r4, r0
    bl func_020517fc
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0215aa90: .word data_ov004_02161520
.L_0215aa94: .word data_ov004_021614fc
    arm_func_end func_ov004_0215aa60

    .global func_ov004_0215aa98
    arm_func_start func_ov004_0215aa98
func_ov004_0215aa98: ; 0x0215aa98
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_0215aaa4:
    ldr r0, [r5, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_0215aab4
    bl func_ov004_021500f0
.L_0215aab4:
    add r4, r4, #0x1
    cmp r4, #0x6
    blt .L_0215aaa4
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_0215aa98

    .global func_ov004_0215aacc
    arm_func_start func_ov004_0215aacc
func_ov004_0215aacc: ; 0x0215aacc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r10, r0
    mov r4, r1
    str r2, [sp, #0x10]
    str r3, [sp, #0x14]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x10
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r2, #0x830000
    mov r3, #0x10
    bl func_ov004_0214ee60
    ldr r4, .L_0215ab90
    mov r8, r0
    mov r9, #0x0
    mov r7, #0x11
    mov r6, #0xb
    mov r5, #0xe
    mov r11, #0x7f
.L_0215ab28:
    bl func_0203b404
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    str r11, [sp, #0xc]
    ldr r1, [r0, #0x88]
    mov r0, r8
    mov r2, #0x3
    mov r3, #0x830000
    bl func_ov004_0214fd64
    str r0, [r10, r9, lsl #0x2]
    mov r1, r9, lsl #0x2
    add r2, r4, r9, lsl #0x2
    ldrsh r1, [r4, r1]
    ldrsh r2, [r2, #0x2]
    bl func_ov004_021501e4
    mov r0, r9
    bl func_ov004_0214f9d8
    mov r1, r0
    ldr r0, [r10, r9, lsl #0x2]
    bl func_ov004_02150270
    add r9, r9, #0x1
    cmp r9, #0x6
    blt .L_0215ab28
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215ab90: .word data_ov004_02160534
    arm_func_end func_ov004_0215aacc

    .global func_ov004_0215ab94
    arm_func_start func_ov004_0215ab94
func_ov004_0215ab94: ; 0x0215ab94
    ldr ip, .L_0215aba4
    mov r0, #0x0
    mov r1, #0x1
    bx ip
.L_0215aba4: .word func_ov004_0215aba8
    arm_func_end func_ov004_0215ab94

    .global func_ov004_0215aba8
    arm_func_start func_ov004_0215aba8
func_ov004_0215aba8: ; 0x0215aba8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x114
    mov r4, r1
    mov r5, r0
    ldr r1, .L_0215bb70
    ldr r2, .L_0215bb74
    mov r0, #0xd8
    mov r3, #0xa6
    bl func_0201a21c
    mov r1, #0xd8
    mov r10, r0
    bl func_ov004_0214fadc
    cmp r5, #0x0
    beq .L_0215abf8
    cmp r4, #0x0
    beq .L_0215abf4
    mov r0, #0x1
    bl func_ov004_0214f79c
    b .L_0215abf8
.L_0215abf4:
    bl func_ov004_0214f754
.L_0215abf8:
    bl func_ov004_0214f9f0
    bl func_ov004_0214f780
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    strb r0, [r10, #0xb4]
    ldrb r0, [r10, #0xb4]
    bl func_ov004_0214fc34
    bl func_ov004_0214f540
    bl func_ov004_0214f540
    bl func_ov004_0214f540
    bl func_ov004_0214f540
    mov r5, r0
    bl func_ov004_0214f780
    mov r4, r0
    bl func_ov004_0214f954
    mov r2, r0
    mov r2, r2, lsl #0x10
    mov r1, r4
    mov r0, r5
    mov r2, r2, lsr #0x10
    blx func_02071b64
    strb r0, [r10, #0xb5]
    bl func_ov004_0214f540
    bl func_ov004_0214f780
    bl func_ov004_0214f954
    bl func_ov004_0214f540
    bl func_ov004_0214f540
    bl func_ov004_0214f540
    ldrb r0, [r10, #0xb5]
    cmp r0, #0x0
    beq .L_0215ac80
    bl func_ov004_0214f540
    bl func_ov004_0214f588
.L_0215ac80:
    bl func_ov004_0214d6f8
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r10, #0x8]
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r10, #0xc]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215bb78
    ldr r1, .L_0215bb7c
    bl func_ov004_0214e880
    str r0, [r10, #0x14]
    ldr r0, .L_0215bb80
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x28]
    ldr r0, .L_0215bb84
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x2c]
    ldr r1, .L_0215bb88
    ldr r2, .L_0215bb8c
    ldr r3, .L_0215bb90
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_0215ad18
    ldr r1, .L_0215bb94
    ldr r2, .L_0215bb98
    ldr r3, .L_0215bb9c
    blx func_ov012_021af26c
    mov r4, r0
.L_0215ad18:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215ad34
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215ad34:
    ldr r4, [r4, #0x18]
    mov r1, #0x0
    ldr r6, [r4, #0x4]
    mov r0, #0x10
    mov r2, r4
    mov r3, r1
    strh r0, [r6, #0xbc]
    mov r5, #0x3
    mov r0, #0x1
    strh r5, [r6, #0xbe]
    blx func_ov012_021b3b7c
    ldr r2, .L_0215bba0
    mov r3, #0x1
    ldr r1, .L_0215bba4
    mov r0, r4
    str r3, [r2, #0x0]
    bl func_ov004_02151d90
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_0215ad98
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_0215ad98:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0215adb4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215adb4:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x21
    mov r2, #0x2
    mov r3, #0x5
    bl func_0206ad90
    mov r2, r0
    str r0, [r10, #0xd4]
    mov r1, #0x0
    ldr r0, .L_0215bba8
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
    ldrb r0, [r10, #0xb4]
    mov r1, #0x1
    bl func_ov004_0215a400
    str r0, [r10, #0xb8]
    bl func_ov004_0214f780
    mov r4, r0
    bl func_ov004_0214f540
    bl func_ov004_0214f554
    mov r1, r0
    mov r0, r4
    bl func_ov004_0215a834
    str r0, [r10, #0xbc]
    bl func_ov004_0215aa60
    str r0, [r10, #0xc0]
    ldr r0, [r10, #0x8]
    bl func_ov004_0214e4b0
    mov r4, r0
    str r4, [r10, #0x44]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_0203b404
    mov r4, r0
    bl func_ov004_0214f540
    ldr r3, [r4, #0x88]
    mov r2, r0
    ldr r0, [r10, #0x8]
    mov r1, #0x830000
    bl func_ov004_0214e4e8
    mov r0, r10
    ldr r1, [r10, #0x44]
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r10, #0x4c]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215bbac
    add r0, sp, #0xdc
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_0215bbb0
    add r0, sp, #0xd4
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0xcc]
    sub r0, r0, #0x100000
    str r0, [sp, #0xd0]
    mov r0, r4
    add r1, sp, #0xd0
    add r2, sp, #0xcc
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xdc]
    ldr r3, [sp, #0xe0]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xd4]
    ldr r3, [sp, #0xd8]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0xc4]
    str r0, [sp, #0xc8]
    mov r0, r4
    add r1, sp, #0xc8
    add r2, sp, #0xc4
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xdc]
    ldr r3, [sp, #0xe0]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xdc]
    ldr r2, .L_0215bbb4
    ldr r3, [sp, #0xe0]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r5, .L_0215bba0
    ldr r1, .L_0215bbb8
    ldr r2, .L_0215bbbc
    mov r0, #0x134
    mov r3, #0x3e
    ldr r5, [r5, #0x0]
    ldr r4, [r4, #0x4]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215afec
    ldr r3, .L_0215bbc0
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_0215afec:
    bl func_ov004_0214e3ec
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0xbc]
    str r0, [sp, #0xc0]
    ldr r0, [r10, #0x14]
    add r1, sp, #0xc0
    add r2, sp, #0xbc
    bl func_ov004_0214e1b8
    ldr r1, [r10, #0x14]
    mov r0, r4
    bl func_ov004_0214e478
    mov r1, #0x10000
    str r1, [sp, #0xb4]
    mov r1, #0x0
    str r1, [sp, #0xb8]
    mov r0, r4
    add r1, sp, #0xb8
    add r2, sp, #0xb4
    bl func_ov004_0214e1b8
    ldr r1, [r10, #0x44]
    mov r0, r10
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r10, #0x50]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215bbac
    add r0, sp, #0x24
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_0215bbb0
    add r0, sp, #0x2c
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x38]
    mov r0, #0x100000
    str r0, [sp, #0x34]
    mov r0, r4
    add r1, sp, #0x34
    add r2, sp, #0x38
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x24]
    ldr r3, [sp, #0x28]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x2c]
    ldr r3, [sp, #0x30]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x2c]
    ldr r3, [sp, #0x30]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x24]
    ldr r3, [sp, #0x28]
    mov r2, #0x8
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x40]
    str r0, [sp, #0x3c]
    mov r0, r4
    add r1, sp, #0x3c
    add r2, sp, #0x40
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x24]
    ldr r3, [sp, #0x28]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x24]
    ldr r2, .L_0215bbb4
    ldr r3, [sp, #0x28]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215bbc4
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0xb8]
    mov r1, r4
    bl func_ov004_0215a5b0
    mov r0, #0x80
    str r0, [sp, #0x1c]
    mov r0, #0x3b
    str r0, [sp, #0x20]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r1, sp, #0x1c
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r4
    mov r2, #0x830000
    mov r3, #0x3
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r5, [r10, #0x50]
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov004_0214f1b8
    bl func_0203b404
    ldr r6, [r0, #0x88]
    bl func_ov004_0214f288
    mov r1, r0
    mov r0, r6
    mov r2, #0x0
    mov r3, #0x6e
    bl func_ov004_0214eaa0
    mov r6, r0
    blx func_02071f08
    mov r1, r0
    mov r0, r6
    mov r2, #0xa
    bl func_ov004_0214ece0
    mov r0, #0x5c000
    str r0, [sp, #0x44]
    mov r0, #0x18000
    str r0, [sp, #0x48]
    mov r0, r6
    add r1, sp, #0x48
    add r2, sp, #0x44
    bl func_ov004_0214e1b8
    ldr r0, [r6, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, r6
    mov r0, r5
    bl func_ov004_0214e478
    mov r0, #0x58
    str r0, [sp, #0x4c]
    mov r0, #0x6a
    str r0, [sp, #0x50]
    bl func_0203b404
    mov r1, #0x80
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0x4c
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    mov r0, r5
    mov r2, #0x830000
    mov r3, #0x27
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x18
    str r0, [sp, #0x0]
    ldr r0, [r10, #0xbc]
    mov r1, r4
    mov r2, #0xc0
    mov r3, #0x70
    bl func_ov004_0215a8a0
    ldr r0, [r10, #0xc0]
    mov r1, r4
    mov r2, #0xa0
    mov r3, #0x90
    bl func_ov004_0215aacc
    ldr r4, [r10, #0x50]
    mov r1, #0xa0
    mov r0, #0xb0
    str r1, [sp, #0x54]
    str r0, [sp, #0x58]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x54
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r2, #0x830000
    mov r3, #0x1b
    bl func_ov004_0214ee60
    mov r4, r0
    bl func_0203b404
    mvn r1, #0x0
    str r1, [sp, #0x0]
    mov r1, #0x26
    str r1, [sp, #0x4]
    mov r1, #0xa
    str r1, [sp, #0x8]
    mov r1, #0xc
    str r1, [sp, #0xc]
    mov r1, #0x5
    mov r2, r0
    str r1, [sp, #0x10]
    mov r1, #0x6f
    str r1, [sp, #0x14]
    ldr r1, [r2, #0x88]
    mov r0, r4
    mov r2, #0x830000
    mov r3, #0x1c
    bl func_ov004_02150b94
    str r0, [r10, #0xc4]
    mov r1, #0x43
    mov r2, #0x6
    bl func_ov004_02150d9c
    bl func_ov004_0214f954
    mov r1, r0
    ldr r0, [r10, #0xc4]
    bl func_ov004_02150e8c
    add r0, sp, #0xa4
    bl func_0202c498
    add r0, sp, #0x9c
    bl func_0202c498
    add r0, sp, #0x94
    bl func_0202c498
    ldrb r0, [r10, #0xb5]
    cmp r0, #0x0
    beq .L_0215b82c
    ldr r5, [r10, #0x50]
    mov r1, #0x80
    mov r0, #0x3c
    str r1, [sp, #0xac]
    str r0, [sp, #0xb0]
    bl func_0203b404
    mov r2, #0x2
    str r2, [sp, #0x0]
    add r1, sp, #0xac
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r5
    mov r2, #0x830000
    mov r3, #0x28
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215bbb0
    add r0, sp, #0x8c
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x8c]
    ldr r0, [sp, #0x90]
    str r1, [sp, #0xa4]
    str r0, [sp, #0xa8]
    ldr r2, .L_0215bbc8
    add r0, sp, #0x84
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x84]
    ldr r0, [sp, #0x88]
    str r1, [sp, #0x94]
    str r0, [sp, #0x98]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x80]
    mov r0, r4
    add r1, sp, #0x80
    bl func_ov004_02155970
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xa4]
    ldr r3, [sp, #0xa8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x94]
    ldr r3, [sp, #0x98]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xa4]
    ldr r3, [sp, #0xa8]
    mov r2, #0x1e
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x94]
    ldr r3, [sp, #0x98]
    mov r2, #0x1e
    bl func_02023c60
    mov r2, #0x1000
    add r1, sp, #0x7c
    mov r0, r4
    str r2, [sp, #0x7c]
    bl func_ov004_02155970
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x94]
    ldr r3, [sp, #0x98]
    mov r2, #0x22
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x94]
    ldr r3, [sp, #0x98]
    mov r2, #0x5a
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x78]
    mov r0, r4
    add r1, sp, #0x78
    bl func_ov004_02155970
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x94]
    ldr r3, [sp, #0x98]
    mov r2, #0x5e
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xa4]
    ldr r3, [sp, #0xa8]
    mov r2, #0x5e
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x94]
    ldr r2, .L_0215bbb4
    ldr r3, [sp, #0x98]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x80
    str r0, [sp, #0xac]
    mov r0, #0x3c
    str r0, [sp, #0xb0]
    bl func_0203b404
    mov r2, #0x1
    str r2, [sp, #0x0]
    add r1, sp, #0xac
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r5
    mov r2, #0x830000
    mov r3, #0x29
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215bbb0
    add r0, sp, #0x70
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x70]
    ldr r0, [sp, #0x74]
    str r1, [sp, #0xa4]
    str r0, [sp, #0xa8]
    ldr r2, .L_0215bbcc
    add r0, sp, #0x68
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x68]
    ldr r0, [sp, #0x6c]
    str r1, [sp, #0x9c]
    str r0, [sp, #0xa0]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x38000
    rsb r0, r0, #0x0
    str r0, [sp, #0x64]
    mov r0, r4
    add r1, sp, #0x64
    bl func_ov004_0215be58
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xa4]
    ldr r3, [sp, #0xa8]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x9c]
    ldr r3, [sp, #0xa0]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xa4]
    ldr r3, [sp, #0xa8]
    mov r2, #0x22
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x9c]
    ldr r3, [sp, #0xa0]
    mov r2, #0x22
    bl func_02023c60
    mov r0, #0x80000
    str r0, [sp, #0x60]
    mov r0, r4
    add r1, sp, #0x60
    bl func_ov004_0215be58
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x9c]
    ldr r3, [sp, #0xa0]
    mov r2, #0x26
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x9c]
    ldr r3, [sp, #0xa0]
    mov r2, #0x56
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x138000
    str r0, [sp, #0x5c]
    mov r0, r4
    add r1, sp, #0x5c
    bl func_ov004_0215be58
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0xa4]
    ldr r3, [sp, #0xa8]
    mov r2, #0x5a
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x9c]
    ldr r3, [sp, #0xa0]
    mov r2, #0x5a
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x9c]
    ldr r2, .L_0215bbb4
    ldr r3, [sp, #0xa0]
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
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r2, .L_0215bbd0
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215bbc4
    mov r1, #0x10
    blx func_ov012_021b6760
.L_0215b82c:
    bl func_0203b3f4
    ldr r5, [r0, #0x88]
    mov r0, #0x2
    bl func_0203b424
    ldr r6, [r0, #0x88]
    bl func_ov004_0214f540
    mov r4, r0
    ldr r0, [r10, #0x8]
    bl func_ov004_0214e4b0
    mov r3, r0
    ldr r0, .L_0215bbd4
    mov r1, r6
    ldr r0, [r0, r4, lsl #0x2]
    mov r2, r5
    bl func_ov004_021521e4
    str r0, [r10, #0xc8]
    ldr r1, [r10, #0x44]
    mov r0, r10
    bl func_ov004_0214ed84
    mov r9, r0
    str r9, [r10, #0x54]
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    ldr r0, [r9, #0x4]
    bl func_02023940
    ldr r2, .L_0215bbac
    add r0, sp, #0xec
    mov r1, r9
    bl func_ov004_02151ebc
    ldr r2, .L_0215bbb0
    add r0, sp, #0xf4
    mov r1, r9
    bl func_ov004_02151ebc
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x108]
    mov r0, #0x100000
    str r0, [sp, #0x104]
    mov r0, r9
    add r1, sp, #0x104
    add r2, sp, #0x108
    bl func_ov004_0214e1b8
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0xec]
    ldr r3, [sp, #0xf0]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0xf4]
    ldr r3, [sp, #0xf8]
    mov r2, #0x0
    bl func_02023c60
    mov r3, #0x0
    add r1, sp, #0x10c
    add r2, sp, #0x110
    mov r0, r9
    str r3, [sp, #0x110]
    str r3, [sp, #0x10c]
    bl func_ov004_0214e1b8
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0xec]
    ldr r3, [sp, #0xf0]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0xec]
    ldr r2, .L_0215bbb4
    ldr r3, [sp, #0xf0]
    bl func_02023c80
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r9, #0x4]
    ldr r2, .L_0215bbd8
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mvn r0, #0x37
    strh r0, [sp, #0xfc]
    add r0, r0, #0x28
    strh r0, [sp, #0xfe]
    mov r1, #0x38
    add r0, sp, #0x18
    strh r1, [r0, #0xe8]
    mov r1, #0x10
    strh r1, [r0, #0xea]
    mov r0, #0xa8
    str r0, [sp, #0xe4]
    mov r0, #0x50
    ldr r11, .L_0215bbdc
    str r0, [sp, #0xe8]
    mov r7, #0x0
    mov r5, #0x80
    add r4, sp, #0xe4
.L_0215b9f8:
    bl func_0203b3f4
    str r5, [sp, #0x0]
    str r4, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r9
    mov r2, #0x820000
    add r3, r7, #0xb
    bl func_ov004_0214ee60
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_0215bbe0
    ldr r2, .L_0215bbe4
    ldr r3, .L_0215bbe8
    mov r0, #0x70
    bl func_0201a21c
    movs r6, r0
    beq .L_0215ba70
    ldr r2, .L_0215bbec
    mov r1, #0x0
    blx func_ov012_021b054c
    add r0, r6, #0x68
    add r1, sp, #0xfc
    str r11, [r6, #0x0]
    bl func_ov004_0214e6d0
    ldr r0, .L_0215bbf0
    str r0, [r6, #0x0]
.L_0215ba70:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_0215ba8c
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215ba8c:
    ldr r1, [r6, #0x18]
    mov r0, r8
    bl func_02020e98
    ldr r0, [r8, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r8, #0x4]
    ldr r2, .L_0215bbf4
    str r7, [r0, #0x124]
    ldr r3, [r8, #0x4]
    ldr r0, .L_0215bbf8
    mov r1, #0x8
    str r0, [r3, #0xec]
    ldr r0, [r8, #0x4]
    bl func_02027834
    ldr r0, [r8, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    add r1, r10, r7, lsl #0x2
    add r7, r7, #0x1
    ldr r2, [r8, #0x4]
    mov r0, #0x1
    strb r0, [r2, #0xae]
    str r8, [r1, #0x70]
    ldr r0, [sp, #0xe8]
    cmp r7, #0x2
    add r0, r0, #0x20
    str r0, [sp, #0xe8]
    blt .L_0215b9f8
    bl func_02026f94
    str r0, [r10, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x18]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x18
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r10, #0x4]
    ldr r1, .L_0215bbfc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x4]
    mov r1, r10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r10, #0x0]
    add sp, sp, #0x114
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215bb70: .word data_ov004_02161574
.L_0215bb74: .word data_ov004_02161554
.L_0215bb78: .word data_ov004_02161590
.L_0215bb7c: .word data_ov004_021615a4
.L_0215bb80: .word data_ov004_021615b8
.L_0215bb84: .word data_ov004_021615d4
.L_0215bb88: .word data_ov004_02160c0c
.L_0215bb8c: .word data_ov004_0216153c
.L_0215bb90: .word 0x1de
.L_0215bb94: .word func_ov004_0215be78
.L_0215bb98: .word func_ov004_0215bed0
.L_0215bb9c: .word func_ov004_0215bf4c
.L_0215bba0: .word data_ov012_021d5154
.L_0215bba4: .word 0x31305053
.L_0215bba8: .word 0x7fff
.L_0215bbac: .word data_ov004_021615ec
.L_0215bbb0: .word data_ov004_021615f8
.L_0215bbb4: .word 0x494c
.L_0215bbb8: .word data_ov004_021608d4
.L_0215bbbc: .word data_ov004_0216154c
.L_0215bbc0: .word func_ov004_0214e414
.L_0215bbc4: .word func_ov004_0215bfb0
.L_0215bbc8: .word data_ov004_02161600
.L_0215bbcc: .word data_ov004_02161608
.L_0215bbd0: .word func_ov004_0215bfac
.L_0215bbd4: .word data_ov004_0216055c
.L_0215bbd8: .word func_ov004_0215bc3c
.L_0215bbdc: .word data_ov004_0216094c
.L_0215bbe0: .word data_ov004_021608f4
.L_0215bbe4: .word data_ov004_02161544
.L_0215bbe8: .word 0x1b2
.L_0215bbec: .word data_02093c8c
.L_0215bbf0: .word data_ov012_021d1c58
.L_0215bbf4: .word func_ov004_0215bc6c
.L_0215bbf8: .word func_ov004_0215be00
.L_0215bbfc: .word func_ov004_0215bfc4
    arm_func_end func_ov004_0215aba8

    .global func_ov004_0215bc00
    arm_func_start func_ov004_0215bc00
func_ov004_0215bc00: ; 0x0215bc00
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r2, [r5, #0x24]
    mov r4, r1
    orr r1, r2, r4
    cmp r2, r1
    beq .L_0215bc28
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0215bc28:
    ldrb r0, [r5, #0x24]
    orr r0, r0, r4
    orr r0, r0, #0x30
    strb r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_0215bc00

    .global func_ov004_0215bc3c
    arm_func_start func_ov004_0215bc3c
func_ov004_0215bc3c: ; 0x0215bc3c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x54]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x70]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215bc3c

    .global func_ov004_0215bc6c
    arm_func_start func_ov004_0215bc6c
func_ov004_0215bc6c: ; 0x0215bc6c
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215bdf4
    cmp r0, r1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, [r5, #0x4]
    mov r0, #0x78
    mov r1, #0x0
    ldr r4, [r2, #0x10]
    bl func_0207342c
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x124]
    cmp r0, #0x0
    bne .L_0215bce0
    bl func_ov004_0214ce64
    mov r1, #0x2
    bl func_ov004_0214ce74
    b .L_0215bcec
.L_0215bce0:
    bl func_ov004_0214ce64
    mov r1, #0x1
    bl func_ov004_0214ce74
.L_0215bcec:
    bl func_ov004_0214f984
    blx func_ov012_021b65bc
    ldr r5, .L_0215bdf8
    mov r6, #0x0
.L_0215bcfc:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
    cmp r6, #0x4
    blo .L_0215bcfc
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215bdf8
    b .L_0215bd2c
.L_0215bd24:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215bd2c:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215bd24
    ldr r0, [r4, #0x8]
    bl func_ov004_0214e4b8
    ldr r0, [r4, #0xc]
    bl func_ov004_0214e4b8
    ldr r0, .L_0215bdfc
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    beq .L_0215bd6c
    bl func_ov004_0215a55c
.L_0215bd6c:
    ldr r0, [r4, #0xbc]
    cmp r0, #0x0
    beq .L_0215bd7c
    bl func_ov004_0215a87c
.L_0215bd7c:
    ldr r0, [r4, #0xc0]
    cmp r0, #0x0
    beq .L_0215bd8c
    bl func_ov004_0215aa98
.L_0215bd8c:
    ldr r0, [r4, #0xc4]
    cmp r0, #0x0
    beq .L_0215bd9c
    bl func_ov004_02150d6c
.L_0215bd9c:
    ldr r0, [r4, #0xc8]
    cmp r0, #0x0
    beq .L_0215bdac
    bl func_ov004_02152680
.L_0215bdac:
    mov r5, #0x0
.L_0215bdb0:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xcc]
    cmp r0, #0x0
    beq .L_0215bdc4
    bl func_0206ae98
.L_0215bdc4:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215bdb0
    ldr r0, [r4, #0xd4]
    cmp r0, #0x0
    beq .L_0215bde0
    bl func_0206ae98
.L_0215bde0:
    mov r0, r4
    bl func_ov004_0214fb48
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_0215bdf4: .word 0x80011000
.L_0215bdf8: .word data_020a0e18
.L_0215bdfc: .word data_ov012_021d5154
    arm_func_end func_ov004_0215bc6c

    .global func_ov004_0215be00
    arm_func_start func_ov004_0215be00
func_ov004_0215be00: ; 0x0215be00
    ldr r0, [r0, #0x4]
    tst r1, #0x1
    ldr ip, [r0, #0x10]
    ldr r3, [r0, #0x124]
    beq .L_0215be30
    cmp r3, #0x0
    subgt r3, r3, #0x1
    movle r3, #0x1
    add r0, r3, #0x3
    add r0, ip, r0, lsl #0x2
    ldr r0, [r0, #0x64]
    str r0, [r2, #0x0]
.L_0215be30:
    tst r1, #0x2
    bxeq lr
    cmp r3, #0x1
    addlt r3, r3, #0x1
    movge r3, #0x0
    add r0, r3, #0x3
    add r0, ip, r0, lsl #0x2
    ldr r0, [r0, #0x64]
    str r0, [r2, #0x0]
    bx lr
    arm_func_end func_ov004_0215be00

    .global func_ov004_0215be58
    arm_func_start func_ov004_0215be58
func_ov004_0215be58: ; 0x0215be58
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0215be74
    mov r1, #0x1
    str r2, [r0, #0xc]
    bx ip
.L_0215be74: .word func_ov004_0215bc00
    arm_func_end func_ov004_0215be58

    .global func_ov004_0215be78
    arm_func_start func_ov004_0215be78
func_ov004_0215be78: ; 0x0215be78
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x820000
    mov r2, #0xd
    mov r3, #0x7f
    bl func_ov004_0214e9f0
    mov r1, r0
    mov r0, r4
    bl func_ov004_0214e478
    ldr r1, [r4, #0x4]
    mov r0, #0x7f000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x64]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
    arm_func_end func_ov004_0215be78

    .global func_ov004_0215bed0
    arm_func_start func_ov004_0215bed0
func_ov004_0215bed0: ; 0x0215bed0
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, .L_0215bf48
    mov r5, r0
    ldr r4, [r5, #0x4]
    bl func_ov004_02151d90
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrb r0, [r0, #0x10]
    mov r1, r0, lsl #0x18
    movs r1, r1, lsr #0x1f
    beq .L_0215bf18
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_0215bf18
    mov r0, #0x78
    mov r1, #0x3
    bl func_0207342c
.L_0215bf18:
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r0, r5
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0215bf48: .word 0x31305053
    arm_func_end func_ov004_0215bed0

    .global func_ov004_0215bf4c
    arm_func_start func_ov004_0215bf4c
func_ov004_0215bf4c: ; 0x0215bf4c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0215bfa8
    mov r5, r0
    bl func_ov004_02151d90
    mov r4, r0
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x128]
    blx r1
    and r0, r0, #0x3
    cmp r0, #0x3
    ldr r0, [r4, #0x4]
    bne .L_0215bf94
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_0215bf94:
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_0215bfa8: .word 0x31305053
    arm_func_end func_ov004_0215bf4c

    .global func_ov004_0215bfac
    arm_func_start func_ov004_0215bfac
func_ov004_0215bfac: ; 0x0215bfac
    bx lr
    arm_func_end func_ov004_0215bfac

    .global func_ov004_0215bfb0
    arm_func_start func_ov004_0215bfb0
func_ov004_0215bfb0: ; 0x0215bfb0
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    strb r1, [r0, #0xb6]
    bx lr
    arm_func_end func_ov004_0215bfb0

    .global func_ov004_0215bfc4
    arm_func_start func_ov004_0215bfc4
func_ov004_0215bfc4: ; 0x0215bfc4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0xb8]
    bl func_ov004_0215a7dc
    ldr r0, [r4, #0x4c]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x50]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldrb r0, [r4, #0xb5]
    cmp r0, #0x0
    beq .L_0215c054
    mov r7, #0x22
    ldr r6, .L_0215c0bc
    b .L_0215c03c
.L_0215c034:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215c03c:
    cmp r7, #0x0
    sub r7, r7, #0x1
    bgt .L_0215c034
    mov r0, #0x7c
    mov r1, #0x7
    bl func_0207342c
.L_0215c054:
    ldr r6, .L_0215c0bc
    b .L_0215c064
.L_0215c05c:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215c064:
    ldrb r0, [r4, #0xb6]
    cmp r0, #0x0
    beq .L_0215c05c
    ldr r0, [r4, #0xc8]
    bl func_ov004_02152694
    ldr r6, .L_0215c0bc
    b .L_0215c088
.L_0215c080:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215c088:
    ldr r0, [r4, #0xc8]
    bl func_ov004_021526bc
    cmp r0, #0x0
    beq .L_0215c080
    ldr r0, [r4, #0x54]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r5, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215c0bc: .word data_020a0e18
    arm_func_end func_ov004_0215bfc4

    .global func_ov004_0215c0c0
    thumb_func_start func_ov004_0215c0c0
func_ov004_0215c0c0: ; 0x0215c0c0
    push {r4, r5, r6, r7, lr}
    sub sp, sp, #0x13c
    ldr r1, .L_0215c440
    mov r4, r0
    ldr r2, .L_0215c444
    mov r0, #0x50
    mov r3, #0x88
    blx func_0201a21c
    mov r5, r0
    mov r1, #0x0
    mov r2, #0x50
    blx func_020517fc
    mov r0, r5
    add r0, #0x48
    strb r4, [r0, #0x0]
    ldr r0, .L_0215c448
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    blx func_02041f7c
    mov r0, #0x0
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x0
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x0
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    blx func_0203cfbc
    mov r0, #0x0
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x0
    blx func_0203b424
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x0
    str r0, [sp, #0xc8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x1
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x1
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    blx func_0203cfbc
    mov r0, #0x1
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x1
    blx func_0203b424
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x1
    lsl r0, r0, #0xc
    str r0, [sp, #0xcc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xcc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x2
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x2
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    blx func_0203cfbc
    mov r0, #0x2
    blx func_0203b424
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
    blx func_0203b424
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x2
    lsl r0, r0, #0xc
    str r0, [sp, #0xd0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xd0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    cmp r4, #0x2
    bne .L_0215c2aa
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x20
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
    mov r0, #0x3
    lsl r0, r0, #0xc
    str r0, [sp, #0xd4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xd4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x94
    ldr r2, [r2, #0x0]
    blx r2
    b .L_0215c328
.L_0215c2aa:
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_0203d0b4
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_0203d478
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    blx func_0203cfbc
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x90
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r1, [r0, #0x0]
    mov r0, #0x3
    lsl r0, r0, #0xc
    str r0, [sp, #0xd8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xd8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x94
    ldr r2, [r2, #0x0]
    blx r2
.L_0215c328:
    ldr r0, .L_0215c44c
    mov r1, #0x0
    bl func_020101f4
    str r0, [r5, #0x0]
    ldr r0, .L_0215c450
    mov r1, #0x0
    bl func_020101f4
    str r0, [r5, #0x4]
    ldr r0, .L_0215c454
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_0215c348
    ldr r0, .L_0215c458
    b .L_0215c34a
.L_0215c348:
    ldr r0, .L_0215c45c
.L_0215c34a:
    ldr r1, .L_0215c460
    str r0, [r5, #0x4c]
    ldr r2, .L_0215c464
    ldr r3, .L_0215c468
    mov r0, #0x78
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_0215c364
    ldr r1, .L_0215c46c
    mov r2, #0x1
    blx func_02024064
.L_0215c364:
    blx func_ov004_0214e3ec
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r2, .L_0215c470
    add r0, sp, #0x7c
    mov r1, r7
    blx func_ov004_02151ebc
    mov r6, #0x0
.L_0215c382:
    ldr r1, .L_0215c460
    ldr r2, .L_0215c464
    ldr r3, .L_0215c468
    mov r0, #0x78
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_0215c39a
    ldr r1, .L_0215c46c
    mov r2, #0x1
    blx func_02024064
.L_0215c39a:
    blx func_ov004_0214e3ec
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    mov r1, r7
    blx func_ov004_02152648
    mov r0, r7
    mov r1, r4
    blx func_ov004_0214e478
    add r1, r6, #0x1
    mov r2, #0xc
    mul r2, r1
    ldr r1, .L_0215c474
    add r0, sp, #0xdc
    add r1, r1, r2
    blx func_ov004_0215cc14
    ldr r0, [r4, #0x4]
    blx func_02023940
    ldr r2, .L_0215c470
    add r0, sp, #0x74
    mov r1, r4
    blx func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    add r2, #0xac
    ldr r2, [r2, #0x0]
    blx r2
    ldr r1, [sp, #0xe0]
    mov r0, #0x3
    lsl r0, r0, #0x12
    str r1, [sp, #0x6c]
    add r0, r1, r0
    str r0, [sp, #0x6c]
    ldr r0, [sp, #0xdc]
    add r1, sp, #0x70
    str r0, [sp, #0x70]
    mov r0, r4
    add r2, sp, #0x6c
    blx func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x74]
    ldr r3, [sp, #0x78]
    mov r2, #0x0
    blx func_02023c60
    mov r2, #0x6
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x74]
    ldr r3, [sp, #0x78]
    mul r2, r6
    blx func_02023c60
    mov r0, r4
    add r1, sp, #0xdc
    blx func_ov004_0215cc30
    add r3, r6, #0x1
    mov r2, #0x6
    mul r2, r3
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x74]
    ldr r3, [sp, #0x78]
    blx func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x74]
    ldr r2, .L_0215c478
    b .L_0215c47c
    mov r8, r8
.L_0215c440: .word data_ov004_0216171c
.L_0215c444: .word data_ov004_0216164c
.L_0215c448: .word data_020a0f64
.L_0215c44c: .word data_ov004_0216172c
.L_0215c450: .word data_ov004_02161740
.L_0215c454: .word data_020afeb0
.L_0215c458: .word func_ov004_0215cbf4
.L_0215c45c: .word func_ov004_0215cc04
.L_0215c460: .word data_ov004_0216162c
.L_0215c464: .word data_ov004_02161614
.L_0215c468: .word 0x4c3
.L_0215c46c: .word func_02024a30
.L_0215c470: .word data_ov004_0216175c
.L_0215c474: .word data_ov004_02161674
.L_0215c478: .word 0x494c
.L_0215c47c:
    ldr r3, [sp, #0x78]
    blx func_02023c80
    ldr r1, [sp, #0xe0]
    mov r0, #0x3
    lsl r0, r0, #0x12
    str r1, [sp, #0x64]
    add r0, r1, r0
    str r0, [sp, #0x64]
    ldr r0, [sp, #0xdc]
    add r1, sp, #0x68
    str r0, [sp, #0x68]
    mov r0, r4
    add r2, sp, #0x64
    blx func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    lsl r0, r6, #0x2
    add r0, r5, r0
    add r6, r6, #0x1
    str r4, [r0, #0x14]
    cmp r6, #0x4
    bge .L_0215c4b4
    b .L_0215c382
.L_0215c4b4:
    ldr r0, [r7, #0x4]
    ldr r1, .L_0215c818
    blx func_02028384
    ldr r0, [r7, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r5
    str r7, [r5, #0x10]
    add r0, #0x48
    ldrb r0, [r0, #0x0]
    cmp r0, #0x2
    beq .L_0215c508
    mov r0, #0x2
    blx func_0203b424
    mov r1, r0
    add r1, #0x88
    ldr r0, .L_0215c81c
    ldr r1, [r1, #0x0]
    bl func_ov004_0215cccc
    str r0, [r5, #0x8]
    mov r0, r5
    add r0, #0x48
    ldrb r0, [r0, #0x0]
    cmp r0, #0x1
    bne .L_0215c5c0
    ldr r0, [r5, #0x8]
    ldr r4, .L_0215c820
    mov r1, #0x0
    blx func_ov004_0215cc60
    blx func_02034db8
    ldr r0, [r0, #0x4]
    mov r1, r4
    blx func_0201710c
    b .L_0215c5c0
.L_0215c508:
    mov r0, #0x3
    blx func_0203b424
    mov r1, r0
    add r1, #0x88
    ldr r0, .L_0215c824
    ldr r1, [r1, #0x0]
    bl func_ov004_0215cccc
    str r0, [r5, #0xc]
    mov r4, r0
    mov r0, #0x1
    lsl r0, r0, #0x14
    str r0, [sp, #0xa8]
    ldr r0, .L_0215c828
    add r1, sp, #0xa8
    str r0, [sp, #0xa4]
    mov r0, #0x0
    str r0, [sp, #0xa0]
    add r0, sp, #0xf4
    add r2, sp, #0xa4
    add r3, sp, #0xa0
    blx func_ov004_0215cca4
    mov r0, #0x0
    str r0, [sp, #0xb4]
    str r0, [sp, #0xb0]
    str r0, [sp, #0xac]
    add r0, sp, #0x100
    add r1, sp, #0xb4
    add r2, sp, #0xb0
    add r3, sp, #0xac
    blx func_ov004_0215cca4
    ldr r2, .L_0215c82c
    add r0, sp, #0xb8
    mov r1, r4
    blx func_ov004_02151ebc
    ldr r1, .L_0215c830
    ldr r2, .L_0215c834
    ldr r3, .L_0215c838
    mov r0, #0x4c
    ldr r7, [sp, #0xbc]
    ldr r6, [sp, #0xb8]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_0215c58a
    ldr r1, .L_0215c83c
    mov r2, r6
    str r1, [sp, #0x0]
    add r1, sp, #0x100
    str r1, [sp, #0x4]
    add r1, sp, #0xf4
    str r1, [sp, #0x8]
    mov r1, #0x1
    lsl r1, r1, #0xa
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x0
    mov r3, r7
    blx func_02013264
.L_0215c58a:
    blx func_ov004_0215cc7c
    mov r1, r0
    mov r0, r4
    blx func_02020f38
    mov r0, #0x2
    blx func_0203b424
    mov r1, r0
    add r1, #0x88
    ldr r0, .L_0215c840
    ldr r1, [r1, #0x0]
    bl func_ov004_0215cccc
    str r0, [r5, #0x8]
    ldr r6, .L_0215c844
    mov r0, r4
    mov r1, #0x0
    blx func_ov004_0215cc60
    blx func_02034db8
    ldr r0, [r0, #0x4]
    mov r1, r6
    blx func_0201710c
.L_0215c5c0:
    mov r0, #0x0
    str r0, [sp, #0x98]
    mov r0, #0x1
    lsl r0, r0, #0x14
    str r0, [sp, #0x9c]
    ldr r0, [r5, #0x8]
    add r1, sp, #0x9c
    add r2, sp, #0x98
    blx func_ov004_0214e1b8
    mov r0, #0x0
    str r0, [sp, #0x8c]
    str r0, [sp, #0x88]
    str r0, [sp, #0x84]
    add r0, sp, #0xe8
    add r1, sp, #0x8c
    add r2, sp, #0x88
    add r3, sp, #0x84
    blx func_ov004_0215cca4
    ldr r1, [r5, #0x8]
    ldr r2, .L_0215c82c
    add r0, sp, #0x90
    add r7, sp, #0xe8
    blx func_ov004_02151ebc
    ldr r1, .L_0215c848
    ldr r2, .L_0215c84c
    ldr r3, .L_0215c850
    mov r0, #0x4c
    ldr r6, [sp, #0x94]
    ldr r4, [sp, #0x90]
    blx func_0201a21c
    cmp r0, #0x0
    beq .L_0215c622
    ldr r1, .L_0215c83c
    mov r2, #0x1
    str r1, [sp, #0x0]
    str r7, [sp, #0x4]
    mov r1, #0x8
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    mov r2, r4
    mov r3, r6
    blx func_02013b14
.L_0215c622:
    blx func_ov004_0215cc7c
    mov r1, r0
    ldr r0, [r5, #0x8]
    blx func_02020f38
    mov r2, #0x0
    mov r1, #0x4
    add r0, sp, #0xc0
.L_0215c634:
    strb r1, [r0, r2]
    add r2, r2, #0x1
    cmp r2, #0x5
    blt .L_0215c634
    ldr r0, .L_0215c854
    ldr r0, [r0, #0x0]
    subs r6, r0, #0x1
    b .L_0215c67a
.L_0215c644:
    mov r7, r6
    mov r4, #0x0
    b .L_0215c674
.L_0215c64a:
    add r0, sp, #0xc0
    ldrb r0, [r0, r4]
    str r0, [sp, #0x20]
    cmp r0, #0x4
    beq .L_0215c668
    ldr r1, [r5, #0x4c]
    mov r0, r7
    blx r1
    str r0, [sp, #0x5c]
    ldr r0, [sp, #0x20]
    ldr r1, [r5, #0x4c]
    blx r1
    ldr r1, [sp, #0x5c]
    cmp r1, r0
    bgt .L_0215c66e
.L_0215c668:
    add r0, sp, #0xc0
    strb r7, [r0, r4]
    ldr r7, [sp, #0x20]
.L_0215c66e:
    cmp r7, #0x4
    beq .L_0215c678
    add r4, r4, #0x1
.L_0215c674:
    cmp r4, #0x4
    blt .L_0215c64a
.L_0215c678:
    subs r6, r6, #0x1
.L_0215c67a:
    cmp r6, #0x0
    bge .L_0215c644
    mov r0, r5
    add r0, #0x48
    ldrb r0, [r0, #0x0]
    cmp r0, #0x2
    beq .L_0215c6aa
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215c858
    mov r1, #0x81
    str r0, [sp, #0x0]
    mov r0, #0xa2
    str r0, [sp, #0x4]
    ldr r0, .L_0215c854
    add r2, #0x88
    ldr r0, [r0, #0x10]
    lsl r1, r1, #0x10
    ldr r2, [r2, #0x0]
    ldr r3, [r5, #0x10]
    add r0, r0, r1
    bl func_ov004_0215cd80
.L_0215c6aa:
    ldr r1, .L_0215c85c
    mov r7, #0x0
    ldr r0, [r1, #0x78]
    str r0, [sp, #0x2c]
    ldr r0, [r1, #0x7c]
    str r0, [sp, #0x28]
    ldr r0, .L_0215c860
    ldr r0, [r0, #0x0]
    str r0, [sp, #0x24]
.L_0215c6bc:
    ldr r0, .L_0215c854
    ldr r0, [r0, #0x0]
    cmp r7, r0
    blt .L_0215c6c6
    b .L_0215cab2
.L_0215c6c6:
    lsl r0, r7, #0x2
    add r0, r5, r0
    ldr r6, [r0, #0x14]
    add r0, sp, #0xc0
    ldrb r4, [r0, r7]
    blx func_0203b3f4
    str r0, [sp, #0x60]
    ldr r1, [r5, #0x4c]
    mov r0, r4
    blx r1
    ldr r1, .L_0215c864
    ldr r2, [sp, #0x60]
    str r1, [sp, #0x0]
    mov r1, #0xab
    str r1, [sp, #0x4]
    ldr r1, .L_0215c868
    add r2, #0x88
    str r2, [sp, #0x60]
    add r0, r0, r1
    ldr r2, [r2, #0x0]
    subs r1, r1, #0x6
    mov r3, r6
    bl func_ov004_0215cd80
    ldr r1, [r5, #0x4c]
    mov r0, r4
    blx r1
    cmp r0, #0x0
    bne .L_0215c71e
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215c86c
    add r2, #0x88
    str r0, [sp, #0x0]
    mov r0, #0xa9
    str r0, [sp, #0x4]
    ldr r0, .L_0215c870
    ldr r2, [r2, #0x0]
    subs r1, r0, #0x5
    mov r3, r6
    bl func_ov004_0215cd80
.L_0215c71e:
    blx func_02087724
    cmp r0, #0x2
    bne .L_0215c72a
    mov r0, #0x1
    b .L_0215c72c
.L_0215c72a:
    mov r0, #0x0
.L_0215c72c:
    cmp r0, #0x0
    bne .L_0215c7c0
    ldr r0, .L_0215c854
    ldr r0, [r0, #0x8]
    cmp r4, r0
    bne .L_0215c7c0
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215c874
    ldr r1, .L_0215c878
    str r0, [sp, #0x0]
    mov r0, #0xa4
    str r0, [sp, #0x4]
    add r2, #0x88
    mov r0, r1
    ldr r2, [r2, #0x0]
    sub r1, #0xf
    mov r3, r6
    bl func_ov004_0215cd80
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215c864
    ldr r1, .L_0215c87c
    str r0, [sp, #0x0]
    mov r0, #0xaa
    str r0, [sp, #0x4]
    add r2, #0x88
    mov r0, r1
    ldr r2, [r2, #0x0]
    sub r1, #0x27
    mov r3, r6
    bl func_ov004_0215cd80
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x64]
    add r1, #0x14
    ldr r0, [r1, #0x18]
    str r0, [sp, #0x14]
    cmp r0, #0x0
    bne .L_0215c78a
    ldr r0, [r1, #0xc]
    blx func_02036430
    str r0, [sp, #0x14]
.L_0215c78a:
    ldr r0, [sp, #0x14]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    bne .L_0215c79a
    ldr r0, [sp, #0x14]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215c79a:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [sp, #0x14]
    mov r1, #0x21
    ldr r0, [r0, #0x18]
    mov r2, #0xe
    mov r3, #0x5
    blx func_0206ad90
    str r0, [r5, #0x44]
    mov r1, #0x0
    strh r1, [r0, #0x18]
    ldr r1, .L_0215c880
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
.L_0215c7c0:
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215c884
    ldr r1, .L_0215c888
    str r0, [sp, #0x0]
    mov r0, #0xa6
    str r0, [sp, #0x4]
    add r2, #0x88
    add r0, r4, r1
    ldr r2, [r2, #0x0]
    sub r1, #0xb
    mov r3, r6
    bl func_ov004_0215cd80
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215c88c
    ldr r1, .L_0215c890
    str r0, [sp, #0x0]
    mov r0, #0xa5
    str r0, [sp, #0x4]
    add r2, #0x88
    mov r0, r1
    ldr r2, [r2, #0x0]
    sub r1, #0x28
    mov r3, r6
    bl func_ov004_0215cd80
    str r0, [sp, #0x34]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, .L_0215c854
    ldr r0, [r0, #0x8]
    cmp r4, r0
    bne .L_0215c89c
    ldr r0, [sp, #0x34]
    ldr r1, .L_0215c894
    b .L_0215c898
.L_0215c818: .word func_ov004_0215ce7c
.L_0215c81c: .word data_ov004_02161768
.L_0215c820: .word data_ov004_0216177c
.L_0215c824: .word data_ov004_02161798
.L_0215c828: .word 0xfff00000
.L_0215c82c: .word data_ov004_0216175c
.L_0215c830: .word data_ov004_02161638
.L_0215c834: .word data_ov004_02161624
.L_0215c838: .word 0x2b9
.L_0215c83c: .word 0x494c
.L_0215c840: .word data_ov004_021617a0
.L_0215c844: .word data_ov004_021617b8
.L_0215c848: .word data_ov004_02161660
.L_0215c84c: .word data_ov004_0216161c
.L_0215c850: .word 0x2ef
.L_0215c854: .word data_020afe90
.L_0215c858: .word data_ov004_02161674
.L_0215c85c: .word data_ov004_02161674
.L_0215c860: .word data_ov004_021616f4
.L_0215c864: .word data_02093c8c
.L_0215c868: .word 0x810006
.L_0215c86c: .word data_ov004_021616b0
.L_0215c870: .word 0x810005
.L_0215c874: .word data_ov004_021616c8
.L_0215c878: .word 0x81000f
.L_0215c87c: .word 0x810027
.L_0215c880: .word 0x79f
.L_0215c884: .word data_ov004_021616d4
.L_0215c888: .word 0x81000b
.L_0215c88c: .word data_ov004_02161704
.L_0215c890: .word 0x810028
.L_0215c894: .word data_ov004_02161710
.L_0215c898:
    blx func_ov004_0215cc30
.L_0215c89c:
    lsl r0, r4, #0x2
    add r1, r5, r0
    ldr r0, [sp, #0x34]
    str r0, [r1, #0x24]
    mov r0, r5
    add r0, #0x48
    ldrb r0, [r0, #0x0]
    lsl r1, r4, #0x1
    str r0, [sp, #0x38]
    ldr r0, .L_0215cb00
    add r1, r0, r1
    mov r0, #0x16
    ldrsh r0, [r1, r0]
    ldr r1, .L_0215cb04
    str r0, [sp, #0x30]
    add r0, sp, #0x124
    blx func_ov004_0215cc14
    mov r0, #0x0
    str r0, [sp, #0x58]
.L_0215c8c4:
    blx func_0203b3f4
    mov r2, r0
    add r0, sp, #0x124
    str r0, [sp, #0x0]
    mov r0, #0xa8
    str r0, [sp, #0x4]
    ldr r0, .L_0215cb08
    add r2, #0x88
    mov r1, r0
    ldr r2, [r2, #0x0]
    sub r1, #0x10
    mov r3, r6
    bl func_ov004_0215cd80
    ldr r1, [sp, #0x58]
    lsl r2, r1, #0x2
    add r1, sp, #0x130
    str r0, [r1, r2]
    mov r0, #0xb
    ldr r1, [sp, #0x124]
    lsl r0, r0, #0xc
    add r0, r1, r0
    str r0, [sp, #0x124]
    ldr r0, [sp, #0x58]
    add r0, r0, #0x1
    str r0, [sp, #0x58]
    cmp r0, #0x3
    blt .L_0215c8c4
    ldr r0, [sp, #0x38]
    cmp r0, #0x2
    beq .L_0215c93c
    ldr r0, .L_0215cb0c
    ldr r0, [r0, #0x10]
    cmp r0, #0x1
    bne .L_0215c93c
    mov r0, #0x0
    str r0, [sp, #0x54]
.L_0215c910:
    ldr r0, [sp, #0x54]
    mov r2, #0x0
    lsl r1, r0, #0x2
    add r0, sp, #0x130
    ldr r0, [r0, r1]
    ldr r1, .L_0215cb10
    str r0, [sp, #0x1c]
    ldr r0, [r0, #0x4]
    blx func_02023894
    ldr r0, [sp, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [sp, #0x54]
    add r0, r0, #0x1
    str r0, [sp, #0x54]
    cmp r0, #0x3
    blt .L_0215c910
    b .L_0215ca46
.L_0215c93c:
    ldr r0, [sp, #0x30]
    mov r3, #0xa
    str r0, [sp, #0x50]
    mov r0, #0x0
    str r0, [sp, #0x3c]
    mov r0, #0x1
    str r0, [sp, #0x40]
    ldr r0, [sp, #0x3c]
    ldr r2, [sp, #0x40]
    str r0, [sp, #0x44]
.L_0215c950:
    ldr r0, [sp, #0x40]
    add r2, r2, #0x1
    mov r1, r0
    mul r1, r3
    str r1, [sp, #0x40]
    cmp r2, #0x3
    blt .L_0215c950
    mov r0, #0x0
    str r0, [sp, #0x48]
.L_0215c962:
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x40]
    blx func_0200d12c
    str r0, [sp, #0x4c]
    ldr r0, [sp, #0x48]
    lsl r1, r0, #0x2
    add r0, sp, #0x130
    ldr r0, [r0, r1]
    ldr r1, [sp, #0x4c]
    str r0, [sp, #0x18]
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    bge .L_0215c982
    neg r2, r1
    b .L_0215c984
.L_0215c982:
    mov r2, r1
.L_0215c984:
    ldr r1, .L_0215cb08
    add r1, r2, r1
    mov r2, #0x0
    blx func_02023894
    ldr r0, [sp, #0x18]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [sp, #0x3c]
    cmp r0, #0x0
    bne .L_0215c9a6
    ldr r0, [sp, #0x4c]
    cmp r0, #0x0
    beq .L_0215c9c4
.L_0215c9a6:
    ldr r0, [sp, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, #0x1
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x44]
    add r0, r0, #0x1
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    str r0, [sp, #0x44]
    b .L_0215c9d2
.L_0215c9c4:
    ldr r0, [sp, #0x18]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215c9d2:
    ldr r1, [sp, #0x4c]
    ldr r0, [sp, #0x40]
    mov r2, r1
    mul r2, r0
    ldr r0, [sp, #0x50]
    mov r1, #0xa
    sub r0, r0, r2
    str r0, [sp, #0x50]
    ldr r0, [sp, #0x40]
    blx func_0200d12c
    str r0, [sp, #0x40]
    ldr r0, [sp, #0x48]
    add r0, r0, #0x1
    str r0, [sp, #0x48]
    cmp r0, #0x3
    blt .L_0215c962
    ldr r0, [sp, #0x138]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bge .L_0215ca46
    ldr r0, [sp, #0x2c]
    mov r1, #0x2
    str r0, [sp, #0x124]
    ldr r0, [sp, #0x28]
    str r0, [sp, #0x128]
    ldr r0, [sp, #0x24]
    str r0, [sp, #0x12c]
    ldr r0, [sp, #0x44]
    sub r1, r1, r0
    mov r0, #0xb
    lsl r0, r0, #0xc
    mov r2, r1
    mul r2, r0
    ldr r0, [sp, #0x2c]
    add r0, r0, r2
    str r0, [sp, #0x124]
    blx func_0203b3f4
    mov r2, r0
    add r0, sp, #0x124
    str r0, [sp, #0x0]
    mov r0, #0xa8
    str r0, [sp, #0x4]
    ldr r1, .L_0215cb10
    add r2, #0x88
    mov r0, r1
    ldr r2, [r2, #0x0]
    sub r1, #0x1b
    mov r3, r6
    bl func_ov004_0215cd80
.L_0215ca46:
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215cb14
    ldr r1, .L_0215cb18
    str r0, [sp, #0x0]
    mov r0, #0xa8
    str r0, [sp, #0x4]
    add r2, #0x88
    mov r0, r1
    ldr r2, [r2, #0x0]
    sub r1, #0x1a
    mov r3, r6
    bl func_ov004_0215cd80
    ldr r0, .L_0215cb1c
    ldrb r1, [r0, #0x12]
    mov r0, #0x1
    lsl r0, r4
    tst r0, r1
    beq .L_0215ca88
    ldr r1, [r5, #0x4c]
    mov r0, r4
    blx r1
    mov r0, #0xe
    ldr r1, .L_0215cb20
    mul r0, r4
    add r0, r1, r0
    ldr r1, .L_0215cb24
    mov r2, r6
    bl func_ov004_0215cdf0
    b .L_0215cad4
.L_0215ca88:
    ldr r1, [r5, #0x4c]
    mov r0, r4
    blx r1
    add r0, sp, #0x10c
    mov r1, #0x0
    mov r2, #0x16
    blx func_020517fc
    mov r0, r4
    blx func_02070cdc
    add r1, sp, #0x10c
    mov r2, #0x14
    blx func_02051890
    ldr r1, .L_0215cb24
    add r0, sp, #0x10c
    mov r2, r6
    bl func_ov004_0215cdf0
    b .L_0215cad4
.L_0215cab2:
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215cb28
    lsl r3, r7, #0x2
    str r0, [sp, #0x0]
    mov r0, #0xab
    str r0, [sp, #0x4]
    ldr r0, .L_0215cb2c
    add r2, #0x88
    add r3, r5, r3
    mov r1, r0
    ldr r2, [r2, #0x0]
    ldr r3, [r3, #0x14]
    sub r1, #0xa
    bl func_ov004_0215cd80
.L_0215cad4:
    add r7, r7, #0x1
    cmp r7, #0x4
    bge .L_0215cadc
    b .L_0215c6bc
.L_0215cadc:
    blx func_0203b3f4
    mov r2, r0
    ldr r0, .L_0215cb30
    add r2, #0x88
    str r0, [sp, #0x0]
    mov r0, #0xa3
    str r0, [sp, #0x4]
    ldr r0, .L_0215cb34
    ldr r2, [r2, #0x0]
    ldr r3, [r5, #0x14]
    subs r1, r0, #0x4
    bl func_ov004_0215cd80
    mov r0, r5
    add sp, #0x13c
    pop {r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215cb00: .word data_020afedc
.L_0215cb04: .word data_ov004_021616ec
.L_0215cb08: .word 0x810010
.L_0215cb0c: .word data_020afe90
.L_0215cb10: .word 0x81001b
.L_0215cb14: .word data_ov004_021616f8
.L_0215cb18: .word 0x81001a
.L_0215cb1c: .word data_020afeb0
.L_0215cb20: .word data_ov004_02160568
.L_0215cb24: .word data_ov004_021616e0
.L_0215cb28: .word data_02093c8c
.L_0215cb2c: .word 0x81000a
.L_0215cb30: .word data_ov004_021616bc
.L_0215cb34: .word 0x810004
    thumb_func_end func_ov004_0215c0c0

    .global func_ov004_0215cb38
    thumb_func_start func_ov004_0215cb38
func_ov004_0215cb38: ; 0x0215cb38
    push {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, .L_0215cba8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    blx func_02041f7c
    mov r0, #0x3
    blx func_0203b424
    add r0, #0x88
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    add r2, #0x94
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_0215cb66
    blx func_0206ae98
.L_0215cb66:
    mov r5, #0x0
.L_0215cb68:
    lsl r0, r5, #0x2
    add r0, r4, r0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_0215cb78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215cb78:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215cb68
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0215cb8a
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215cb8a:
    mov r5, #0x0
.L_0215cb8c:
    lsl r0, r5, #0x2
    ldr r0, [r4, r0]
    cmp r0, #0x0
    beq .L_0215cb9a
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215cb9a:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215cb8c
    mov r0, r4
    blx func_0201b244
    pop {r3, r4, r5, pc}
.L_0215cba8: .word data_020a0f64
    thumb_func_end func_ov004_0215cb38

    .global func_ov004_0215cbac
    thumb_func_start func_ov004_0215cbac
func_ov004_0215cbac: ; 0x0215cbac
    push {r4, r5, r6, lr}
    mov r6, r0
    mov r4, #0x0
    b .L_0215cbe2
.L_0215cbb4:
    ldr r5, [r6, #0x10]
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xa8
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x0
    beq .L_0215cbd6
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    add r2, #0xc0
    ldr r2, [r2, #0x0]
    blx r2
    blx func_ov004_0214e3ec
    mov r5, r0
.L_0215cbd6:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r4, r4, #0x1
.L_0215cbe2:
    ldr r0, [r6, #0x10]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    add r1, #0xac
    ldr r1, [r1, #0x0]
    blx r1
    cmp r4, r0
    blo .L_0215cbb4
    pop {r4, r5, r6, pc}
    thumb_func_end func_ov004_0215cbac

    .global func_ov004_0215cbf4
    arm_func_start func_ov004_0215cbf4
func_ov004_0215cbf4: ; 0x0215cbf4
    ldr r1, .L_0215cc00
    ldrsb r0, [r1, r0]
    bx lr
.L_0215cc00: .word data_020afeea
    arm_func_end func_ov004_0215cbf4

    .global func_ov004_0215cc04
    arm_func_start func_ov004_0215cc04
func_ov004_0215cc04: ; 0x0215cc04
    ldr r1, .L_0215cc10
    ldrsb r0, [r1, r0]
    bx lr
.L_0215cc10: .word data_020afee6
    arm_func_end func_ov004_0215cc04

    .global func_ov004_0215cc14
    arm_func_start func_ov004_0215cc14
func_ov004_0215cc14: ; 0x0215cc14
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov004_0215cc14

    .global func_ov004_0215cc30
    arm_func_start func_ov004_0215cc30
func_ov004_0215cc30: ; 0x0215cc30
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0215cc5c
    str r2, [r0, #0xc]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x10]
    ldr r2, [r1, #0x8]
    mov r1, #0x1
    str r2, [r0, #0x14]
    bx ip
.L_0215cc5c: .word func_ov004_0215bc00
    arm_func_end func_ov004_0215cc30

    .global func_ov004_0215cc60
    arm_func_start func_ov004_0215cc60
func_ov004_0215cc60: ; 0x0215cc60
    ldr r0, [r0, #0x4]
    ldr ip, .L_0215cc78
    ldr r0, [r0, #0x64]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x20]
    bx ip
.L_0215cc78: .word func_ov004_0214e828
    arm_func_end func_ov004_0215cc60

    .global func_ov004_0215cc7c
    arm_func_start func_ov004_0215cc7c
func_ov004_0215cc7c: ; 0x0215cc7c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0215cc9c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215cc9c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215cc7c

    .global func_ov004_0215cca4
    arm_func_start func_ov004_0215cca4
func_ov004_0215cca4: ; 0x0215cca4
    ldr r1, [r1, #0x0]
    str r1, [r0, #0x0]
    ldr r1, [r2, #0x0]
    str r1, [r0, #0x4]
    ldr r1, [r3, #0x0]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov004_0215cca4

    .global func_ov004_0215ccc0
    arm_func_start func_ov004_0215ccc0
func_ov004_0215ccc0: ; 0x0215ccc0
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov004_0215ccc0

    .global func_ov004_0215cccc
    thumb_func_start func_ov004_0215cccc
func_ov004_0215cccc: ; 0x0215cccc
    push {r3, r4, r5, lr}
    sub sp, sp, #0x1fc
    sub sp, sp, #0x4
    mov r2, #0x1
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x100
    mov r1, #0x0
    lsl r2, r2, #0x8
    blx func_020517fc
    mov r2, #0x1
    add r0, sp, #0x0
    mov r1, #0x0
    lsl r2, r2, #0x8
    blx func_020517fc
    add r0, sp, #0x100
    mov r1, r5
    blx func_02074000
    ldr r1, .L_0215cd78
    add r0, sp, #0x100
    blx func_020741bc
    add r0, sp, #0x0
    mov r1, r5
    blx func_02074000
    ldr r1, .L_0215cd7c
    add r0, sp, #0x0
    blx func_020741bc
    mov r0, r4
    blx func_ov004_0214e7ec
    add r0, sp, #0x0
    blx func_02035c90
    blx func_ov004_0214e828
    mov r4, r0
    blx func_02036ab8
    blx func_ov004_0214e3ec
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r2, #0x13
    ldr r3, [r0, #0x0]
    lsl r2, r2, #0x4
    ldr r3, [r3, r2]
    add r1, sp, #0x100
    blx r3
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_0215cd4c
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_0215cd58
.L_0215cd4c:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_0215cd58:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    mov r0, r4
    blx func_02034d7c
    blx func_ov004_0214e850
    mov r0, r5
    add sp, #0x1fc
    add sp, #0x4
    pop {r3, r4, r5, pc}
    mov r8, r8
.L_0215cd78: .word data_ov004_021617cc
.L_0215cd7c: .word data_ov004_021617d4
    thumb_func_end func_ov004_0215cccc

    .global func_ov004_0215cd80
    thumb_func_start func_ov004_0215cd80
func_ov004_0215cd80: ; 0x0215cd80
    push {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r4, r1
    mov r0, r2
    mov r5, r3
    blx func_ov004_0214e7ec
    mov r0, r4
    blx func_020329ec
    blx func_ov004_0214e3ec
    ldr r1, [sp, #0x1c]
    mov r4, r0
    lsl r1, r1, #0xc
    str r1, [sp, #0x0]
    add r1, sp, #0x0
    blx func_ov004_0214ea78
    ldr r0, [r4, #0x4]
    mov r1, r6
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r1, [sp, #0x18]
    mov r0, r4
    blx func_ov004_0215cc30
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    cmp r5, #0x0
    beq .L_0215cde4
    mov r0, r5
    mov r1, r4
    blx func_ov004_0214e478
    mov r0, r4
    mov r1, r5
    blx func_ov004_02152648
.L_0215cde4:
    blx func_ov004_0214e850
    mov r0, r4
    add sp, #0x4
    pop {r3, r4, r5, r6, pc}
    thumb_func_end func_ov004_0215cd80

    .byte 0x00, 0x00

    .global func_ov004_0215cdf0
    thumb_func_start func_ov004_0215cdf0
func_ov004_0215cdf0: ; 0x0215cdf0
    push {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    str r1, [sp, #0x0]
    mov r5, r2
    blx func_0203b3f4
    add r0, #0x88
    ldr r0, [r0, #0x0]
    blx func_ov004_0214e7ec
    mov r1, #0x0
    ldr r0, .L_0215ce78
    mov r2, r1
    bl func_ov012_021caa0c
    mov r6, r0
    ldr r0, [r6, #0x4]
    bl func_ov012_021c5fb4
    blx func_ov004_0214e3ec
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    ldr r0, [r0, #0x64]
    mov r1, r7
    ldr r3, [r0, #0x0]
    mvn r2, r2
    ldr r3, [r3, #0x6c]
    blx r3
    ldr r1, [sp, #0x0]
    mov r0, r4
    blx func_ov004_0215cc30
    mov r0, #0xa7
    lsl r0, r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r4
    add r1, sp, #0x4
    blx func_ov004_0214ea78
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    cmp r5, #0x0
    beq .L_0215ce64
    mov r0, r5
    mov r1, r4
    blx func_ov004_0214e478
    mov r0, r4
    mov r1, r5
    blx func_ov004_02152648
.L_0215ce64:
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    blx func_ov004_0214e850
    mov r0, r4
    add sp, #0x8
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215ce78: .word data_ov004_021617dc
    thumb_func_end func_ov004_0215cdf0

    .global func_ov004_0215ce7c
    thumb_func_start func_ov004_0215ce7c
func_ov004_0215ce7c: ; 0x0215ce7c
    push {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x4]
    mov r4, #0x0
    ldr r7, [r0, #0x10]
    b .L_0215cf0c
.L_0215ce86:
    lsl r0, r4, #0x2
    add r6, r7, r0
    ldr r5, [r6, #0x24]
    mov r0, r4
    blx func_020872b0
    cmp r5, #0x0
    beq .L_0215cf0a
    ldr r1, [r6, #0x34]
    cmp r0, r1
    beq .L_0215cf0a
    str r0, [r6, #0x34]
    cmp r0, #0x0
    beq .L_0215ceac
    cmp r0, #0x1
    beq .L_0215ceba
    cmp r0, #0x2
    beq .L_0215cedc
    b .L_0215cefe
.L_0215ceac:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    b .L_0215cf0a
.L_0215ceba:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215cf18
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    b .L_0215cf0a
.L_0215cedc:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215cf1c
    mov r2, #0x0
    blx func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    b .L_0215cf0a
.L_0215cefe:
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    add r2, #0xd8
    ldr r2, [r2, #0x0]
    blx r2
.L_0215cf0a:
    add r4, r4, #0x1
.L_0215cf0c:
    ldr r0, .L_0215cf20
    ldr r0, [r0, #0x0]
    cmp r4, r0
    blt .L_0215ce86
    pop {r3, r4, r5, r6, r7, pc}
    mov r8, r8
.L_0215cf18: .word 0x810028
.L_0215cf1c: .word 0x810029
.L_0215cf20: .word data_020afe90
    thumb_func_end func_ov004_0215ce7c

    .global func_ov004_0215cf24
    arm_func_start func_ov004_0215cf24
func_ov004_0215cf24: ; 0x0215cf24
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x78
    ldr r1, .L_0215d6e0
    ldr r2, .L_0215d6e4
    mov r0, #0xd4
    mov r3, #0x87
    bl func_0201a21c
    mov r1, #0xd4
    mov r6, r0
    bl func_ov004_0214fadc
    bl func_ov004_0214f9f0
    bl func_ov004_0214f704
    ldr r1, .L_0215d6e8
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    strb r0, [r6, #0xb4]
    ldrb r0, [r6, #0xb4]
    bl func_ov004_0214fc34
    bl func_ov004_0214f540
    bl func_ov004_0214f540
    bl func_ov004_0214f540
    bl func_ov004_0214d964
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r6, #0x8]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215d6ec
    ldr r1, .L_0215d6f0
    bl func_ov004_0214e880
    str r0, [r6, #0x14]
    ldr r0, .L_0215d6f4
    mov r1, #0x0
    blx func_020101f4
    str r0, [r6, #0x24]
    ldr r0, .L_0215d6f8
    mov r1, #0x0
    blx func_020101f4
    str r0, [r6, #0x28]
    ldr r0, .L_0215d6fc
    mov r1, #0x0
    blx func_020101f4
    str r0, [r6, #0x2c]
    ldrb r0, [r6, #0xb4]
    mov r1, #0x1
    bl func_ov004_0215a400
    str r0, [r6, #0xb8]
    bl func_ov004_0214f704
    mov r2, r0, lsl #0x1
    ldr r0, .L_0215d700
    mov r1, #0x64
    ldrsh r0, [r0, r2]
    and r0, r0, #0xff
    bl func_ov004_0215a834
    str r0, [r6, #0xbc]
    bl func_ov004_0215aa60
    str r0, [r6, #0xc0]
    ldr r0, [r6, #0x8]
    bl func_ov004_0214e4b0
    mov r4, r0
    str r4, [r6, #0x44]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_0203b404
    mov r1, r0
    ldr r3, [r1, #0x88]
    ldr r0, [r6, #0x8]
    ldr r1, .L_0215d704
    mov r2, #0x0
    bl func_ov004_0214e4e8
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    ldr r0, [r6, #0x8]
    bl func_ov004_0214e6fc
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215d708
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    str r2, [r1, #0x124]
    str r4, [r6, #0x6c]
    ldr r1, [r6, #0x44]
    mov r0, r6
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r6, #0x4c]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215d70c
    add r0, sp, #0x68
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_0215d710
    add r0, sp, #0x60
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x58]
    sub r0, r0, #0x100000
    str r0, [sp, #0x5c]
    mov r0, r4
    add r1, sp, #0x5c
    add r2, sp, #0x58
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x60]
    ldr r3, [sp, #0x64]
    mov r2, #0x0
    bl func_02023c60
    mov r3, #0x0
    add r1, sp, #0x54
    add r2, sp, #0x50
    mov r0, r4
    str r3, [sp, #0x50]
    str r3, [sp, #0x54]
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x68]
    ldr r2, .L_0215d714
    ldr r3, [sp, #0x6c]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_0215d718
    ldr r5, [r4, #0x4]
    ldr r4, [r1, #0x0]
    ldr r1, .L_0215d71c
    ldr r2, .L_0215d720
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    movs r7, r0
    beq .L_0215d21c
    ldr r3, .L_0215d724
    mov r1, r5
    mov r2, r4
    blx func_ov012_021af0f8
    mov r7, r0
.L_0215d21c:
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    bne .L_0215d238
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215d238:
    ldr r4, [r7, #0x18]
    mov r1, #0x1
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x48]
    str r0, [sp, #0x4c]
    ldr r0, [r6, #0x14]
    add r1, sp, #0x4c
    add r2, sp, #0x48
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [r6, #0x14]
    ldr r2, [r0, #0x0]
    ldr r5, [r1, #0x4]
    ldr r2, [r2, #0xb4]
    mov r1, r5
    blx r2
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r1, #0x10000
    str r1, [sp, #0x40]
    mov r1, #0x0
    str r1, [sp, #0x44]
    mov r0, r4
    add r1, sp, #0x44
    add r2, sp, #0x40
    bl func_ov004_0214e1b8
    ldr r1, [r6, #0x44]
    mov r0, r6
    bl func_ov004_0214ed84
    mov r4, r0
    str r4, [r6, #0x50]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215d70c
    add r0, sp, #0x10
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_0215d710
    add r0, sp, #0x18
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r0, #0x100000
    str r0, [sp, #0x20]
    mov r0, r4
    add r1, sp, #0x20
    add r2, sp, #0x24
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x8
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x2c]
    str r0, [sp, #0x28]
    mov r0, r4
    add r1, sp, #0x28
    add r2, sp, #0x2c
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r2, #0x10
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x10]
    ldr r2, .L_0215d714
    ldr r3, [sp, #0x14]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215d728
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xb8]
    mov r1, r4
    bl func_ov004_0215a5b0
    mov r1, #0x80
    mov r0, #0x3b
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    mov r0, r4
    mov r2, #0x830000
    mov r3, #0x3
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r5, [r6, #0x50]
    mov r0, #0x30
    str r0, [sp, #0x30]
    mov r0, #0x64
    str r0, [sp, #0x34]
    bl func_0203b404
    ldr r7, [r0, #0x88]
    bl func_ov004_0214f704
    add r3, r0, #0x1
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r2, sp, #0x30
    str r2, [sp, #0x4]
    ldr r2, .L_0215d704
    mov r1, r7
    mov r0, r5
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x60
    str r0, [sp, #0x30]
    mov r0, #0x64
    str r0, [sp, #0x34]
    bl func_ov004_0214f704
    ldr r1, .L_0215d6e8
    ldrsb r7, [r1, r0]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r1, sp, #0x30
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    ldr r2, .L_0215d704
    add r3, r7, #0x5
    mov r0, r5
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, #0x84
    mov r0, #0x64
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    bl func_0203b404
    mov r2, #0x80
    str r2, [sp, #0x0]
    add r1, sp, #0x30
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r2, .L_0215d704
    mov r0, r5
    mov r3, #0xa
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x18
    str r0, [sp, #0x0]
    ldr r0, [r6, #0xbc]
    mov r1, r4
    mov r2, #0xc0
    mov r3, #0x70
    bl func_ov004_0215a8a0
    ldr r4, [r6, #0x50]
    mov r0, #0x85
    str r0, [sp, #0x38]
    mov r0, #0x88
    str r0, [sp, #0x3c]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x80
    str r0, [sp, #0x0]
    add r1, sp, #0x38
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    ldr r2, .L_0215d704
    mov r0, r4
    mov r3, #0x9
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xc0]
    mov r1, r4
    mov r2, #0xa0
    mov r3, #0xa4
    bl func_ov004_0215aacc
    mov r0, #0x2
    blx func_ov004_0215c0c0
    str r0, [r6, #0xc8]
    bl func_02026f94
    str r0, [r6, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x74]
    ldr r0, [r6, #0x4]
    add r1, sp, #0x74
    bl func_ov004_02152ca0
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215d72c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r6, #0x4]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_02026f94
    str r0, [r6, #0xcc]
    mov r0, #0x80000
    str r0, [sp, #0x70]
    ldr r0, [r6, #0xcc]
    add r1, sp, #0x70
    bl func_ov004_02152ca0
    ldr r0, [r6, #0xcc]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r6, #0xcc]
    ldr r1, .L_0215d730
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r6, #0xcc]
    ldr r2, .L_0215d734
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r6, #0xcc]
    bl func_02086cac
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r6, #0x0]
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215d6e0: .word data_ov004_02161810
.L_0215d6e4: .word data_ov004_021617f4
.L_0215d6e8: .word data_020afee6
.L_0215d6ec: .word data_ov004_0216182c
.L_0215d6f0: .word data_ov004_02161840
.L_0215d6f4: .word data_ov004_02161854
.L_0215d6f8: .word data_ov004_02161868
.L_0215d6fc: .word data_ov004_02161884
.L_0215d700: .word data_020afef2
.L_0215d704: .word 0x838000
.L_0215d708: .word func_ov004_0215d824
.L_0215d70c: .word data_ov004_021618a4
.L_0215d710: .word data_ov004_021618b0
.L_0215d714: .word 0x494c
.L_0215d718: .word data_ov012_021d5154
.L_0215d71c: .word data_ov004_021608d4
.L_0215d720: .word data_ov004_021617ec
.L_0215d724: .word func_ov004_0214e414
.L_0215d728: .word func_ov004_0215d974
.L_0215d72c: .word func_ov004_0215d988
.L_0215d730: .word func_ov004_0215d8a8
.L_0215d734: .word func_ov004_0215d8e8
    arm_func_end func_ov004_0215cf24

    .global func_ov004_0215d738
    arm_func_start func_ov004_0215d738
func_ov004_0215d738: ; 0x0215d738
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl func_ov004_0214f984
    blx func_ov012_021b65bc
    ldr r5, .L_0215d81c
    mov r6, #0x0
.L_0215d750:
    ldr r0, [r5, #0x0]
    blx r0
    add r6, r6, #0x1
    cmp r6, #0x4
    blo .L_0215d750
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r5, .L_0215d81c
    b .L_0215d780
.L_0215d778:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215d780:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215d778
    mov r0, #0x0
    bl func_02086cac
    ldr r0, [r4, #0x8]
    bl func_ov004_0214e4b8
    ldr r0, [r4, #0xc]
    bl func_ov004_0214e4b8
    ldr r0, .L_0215d820
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    beq .L_0215d7c8
    bl func_ov004_0215a55c
.L_0215d7c8:
    ldr r0, [r4, #0xbc]
    cmp r0, #0x0
    beq .L_0215d7d8
    bl func_ov004_0215a87c
.L_0215d7d8:
    ldr r0, [r4, #0xc0]
    cmp r0, #0x0
    beq .L_0215d7e8
    bl func_ov004_0215aa98
.L_0215d7e8:
    ldr r0, [r4, #0xc4]
    cmp r0, #0x0
    beq .L_0215d7f8
    bl func_ov004_02150d6c
.L_0215d7f8:
    ldr r0, [r4, #0xc8]
    cmp r0, #0x0
    beq .L_0215d808
    blx func_ov004_0215cb38
.L_0215d808:
    mov r0, r4
    bl func_ov004_0214fb48
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_0215d81c: .word data_020a0e18
.L_0215d820: .word data_ov012_021d5154
    arm_func_end func_ov004_0215d738

    .global func_ov004_0215d824
    arm_func_start func_ov004_0215d824
func_ov004_0215d824: ; 0x0215d824
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215d89c
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r5, #0x4]
    mov r0, #0x78
    mov r1, #0x0
    ldr r4, [r2, #0x10]
    bl func_0207342c
    bl func_020876f8
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r4, #0xd0]
    ldr r0, .L_0215d8a0
    ldr r1, .L_0215d8a4
    mov r2, #0x2
    bl func_02087214
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d89c: .word 0x80011001
.L_0215d8a0: .word 0x3f3f
.L_0215d8a4: .word data_ov004_021605a0
    arm_func_end func_ov004_0215d824

    .global func_ov004_0215d8a8
    arm_func_start func_ov004_0215d8a8
func_ov004_0215d8a8: ; 0x0215d8a8
    stmdb sp!, {r4, lr}
    ldr r1, .L_0215d8e4
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    add r0, r0, #0x1
    str r0, [r1, #0x0]
    bl func_020882c4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02088290
    bl func_02086c94
    mov r0, r4
    bl func_ov004_0215d738
    ldmia sp!, {r4, pc}
.L_0215d8e4: .word data_020a0f10
    arm_func_end func_ov004_0215d8a8

    .global func_ov004_0215d8e8
    arm_func_start func_ov004_0215d8e8
func_ov004_0215d8e8: ; 0x0215d8e8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x70000005
    beq .L_0215d91c
    cmp r0, #0x70000007
    beq .L_0215d960
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d91c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    ldr r1, .L_0215d96c
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1
    strb r0, [r4, #0xd0]
    bl func_020876f8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, .L_0215d96c
    ldr r1, .L_0215d970
    mov r2, #0x2
    bl func_02087214
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d960:
    mov r0, r4
    bl func_ov004_0215d738
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d96c: .word 0x3f3f
.L_0215d970: .word data_ov004_021605a0
    arm_func_end func_ov004_0215d8e8

    .global func_ov004_0215d974
    arm_func_start func_ov004_0215d974
func_ov004_0215d974: ; 0x0215d974
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    strb r1, [r0, #0xb5]
    bx lr
    arm_func_end func_ov004_0215d974

    .global func_ov004_0215d988
    arm_func_start func_ov004_0215d988
func_ov004_0215d988: ; 0x0215d988
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0xb8]
    bl func_ov004_0215a7dc
    ldr r0, [r4, #0x4c]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x50]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0xc8]
    blx func_ov004_0215cbac
    ldr r5, .L_0215da34
    b .L_0215d9f4
.L_0215d9ec:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215d9f4:
    ldrb r0, [r4, #0xb5]
    cmp r0, #0x0
    beq .L_0215d9ec
    ldr r5, .L_0215da34
    b .L_0215da10
.L_0215da08:
    ldr r0, [r5, #0x0]
    blx r0
.L_0215da10:
    ldrsb r0, [r4, #0xd0]
    cmp r0, #0x0
    beq .L_0215da08
    bl func_ov004_0214ce64
    mov r1, #0x5
    bl func_ov004_0214ce74
    mov r0, r4
    bl func_ov004_0215d738
    ldmia sp!, {r3, r4, r5, pc}
.L_0215da34: .word data_020a0e18
    arm_func_end func_ov004_0215d988

    .global func_ov004_0215da38
    arm_func_start func_ov004_0215da38
func_ov004_0215da38: ; 0x0215da38
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x74
    ldr r1, .L_0215e180
    ldr r2, .L_0215e184
    mov r0, #0xc4
    mov r3, #0x8c
    bl func_0201a21c
    mov r10, r0
    mov r1, #0xc4
    bl func_ov004_0214fadc
    bl func_ov004_0214fc10
    bl func_02086d80
    strb r0, [r10, #0xb8]
    bl func_020876ac
    strb r0, [r10, #0xb9]
    ldrb r0, [r10, #0xb8]
    bl func_ov004_0214f740
    ldrb r0, [r10, #0xb9]
    bl func_ov004_0214f718
    bl func_ov004_0214f72c
    ldr r1, .L_0215e188
    str r0, [r1, #0x0]
    bl func_ov004_0214f72c
    ldr r1, .L_0215e188
    str r0, [r1, #0x4]
    bl func_ov004_0214f704
    ldr r2, .L_0215e188
    mov r1, #0x40
    str r0, [r2, #0x8]
    mov r0, #0x20
    mov r2, #0x4000
    bl func_ov004_0214d208
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    mov r2, #0x1
    str r0, [r10, #0x8]
    mov r0, #0x13
    mov r1, #0x2
    sub r3, r2, #0x2
    blx func_ov012_021bcf1c
    str r0, [r10, #0xb0]
    ldrsb r0, [r10, #0xb9]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, [r10, #0xb0]
    bne .L_0215db04
    mov r1, #0x74
    blx func_ov012_021bd730
    b .L_0215db0c
.L_0215db04:
    mov r1, #0x75
    blx func_ov012_021bd730
.L_0215db0c:
    mov r1, #0x1
    mov r2, r1
    mov r0, #0x0
    bl func_ov012_021ba49c
    str r0, [r10, #0xb4]
    ldr r2, .L_0215e18c
    ldr r0, .L_0215e190
    ldr r1, .L_0215e194
    str r0, [sp, #0x6c]
    str r10, [sp, #0x60]
    str r2, [sp, #0x64]
    str r1, [sp, #0x68]
    ldr r1, [r10, #0xb4]
    add r0, sp, #0x60
    str r1, [sp, #0x70]
    blx func_02086798
    str r0, [r10, #0xc0]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215e198
    ldr r1, .L_0215e19c
    bl func_ov004_0214e880
    str r0, [r10, #0x14]
    ldr r0, .L_0215e1a0
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x30]
    ldr r0, .L_0215e1a4
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x24]
    ldr r0, .L_0215e1a8
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x28]
    ldr r0, .L_0215e1ac
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x2c]
    ldr r0, [r10, #0x8]
    bl func_ov004_0214e4b0
    str r0, [r10, #0x44]
    bl func_0203b404
    ldr r3, [r0, #0x88]
    ldr r0, [r10, #0x8]
    mov r1, #0x810000
    mov r2, #0x0
    bl func_ov004_0214e4e8
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    ldr r0, [r10, #0x8]
    bl func_ov004_0214e548
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215e1b0
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r1, [r4, #0x4]
    mov r2, #0x2
    str r2, [r1, #0x124]
    str r4, [r10, #0x6c]
    ldr r1, [r10, #0x44]
    ldr r0, .L_0215e1b4
    ldr r5, [r1, #0x4]
    ldr r4, [r0, #0x0]
    ldr r1, .L_0215e1b8
    ldr r2, .L_0215e1bc
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    movs r6, r0
    beq .L_0215dc68
    ldr r3, .L_0215e1c0
    mov r1, r5
    mov r2, r4
    blx func_ov012_021af0f8
    mov r6, r0
.L_0215dc68:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_0215dc84
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215dc84:
    ldr r9, [r6, #0x18]
    mov r1, #0x1
    ldr r0, [r9, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r10, #0x14]
    mov r0, r9
    bl func_ov004_0214e478
    add r0, sp, #0x40
    bl func_0202c498
    add r0, sp, #0x38
    bl func_0202c498
    ldr r0, [r9, #0x4]
    bl func_02023940
    ldr r2, .L_0215e1c4
    add r0, sp, #0x30
    mov r1, r9
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x30]
    ldr r0, [sp, #0x34]
    str r1, [sp, #0x40]
    str r0, [sp, #0x44]
    ldr r2, .L_0215e1c8
    add r0, sp, #0x28
    mov r1, r9
    bl func_ov004_02151ebc
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x2c]
    str r1, [sp, #0x38]
    str r0, [sp, #0x3c]
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0xc0000
    str r0, [sp, #0x20]
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r0, r9
    add r1, sp, #0x24
    add r2, sp, #0x20
    bl func_ov004_0214e1b8
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    mov r0, r9
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_ov004_0214e1b8
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0x40]
    ldr r3, [sp, #0x44]
    ldr r2, .L_0215e1cc
    bl func_02023c80
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r9, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r1, #0x0
    ldr r0, .L_0215e1d0
    mov r2, r1
    blx func_ov012_021caa0c
    mov r7, r0
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, r7
    mov r2, #0x0
    mov r3, #0x80
    bl func_ov004_0214eaa0
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    mov r0, #0x1c000
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x10
    bl func_ov004_0214e1b8
    ldrsb r2, [r10, #0xb8]
    ldr r0, [r4, #0x4]
    mov r1, #0x24
    sub r2, r2, #0x2
    mul r3, r2, r1
    ldr r0, [r0, #0x64]
    ldr r1, .L_0215e1d4
    ldr r2, [r0, #0x0]
    ldr r1, [r1, r3]
    ldr r2, [r2, #0x68]
    blx r2
    mov r1, r4
    mov r0, r9
    bl func_ov004_0214e478
    ldr r4, .L_0215e1d4
    mov r8, #0x1
    mov r5, #0x18000
    mov r11, #0x24
.L_0215dea8:
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, r7
    mov r2, #0x0
    mov r3, #0x80
    bl func_ov004_0214eaa0
    sub r1, r8, #0x1
    mov r1, r1, lsl #0x4
    add r1, r1, #0x2f
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x8]
    str r5, [sp, #0xc]
    add r1, sp, #0xc
    add r2, sp, #0x8
    mov r6, r0
    bl func_ov004_0214e1b8
    ldrsb r2, [r10, #0xb8]
    ldr r0, [r6, #0x4]
    mla r1, r2, r11, r4
    ldr r0, [r0, #0x64]
    add r1, r1, r8, lsl #0x2
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #-0x48]
    ldr r2, [r2, #0x68]
    blx r2
    mov r1, r6
    mov r0, r9
    bl func_ov004_0214e478
    add r8, r8, #0x1
    cmp r8, #0x9
    blt .L_0215dea8
    ldr r0, [r7, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldrsb r0, [r10, #0xb9]
    cmp r0, #0x0
    bne .L_0215e098
    mov r1, #0xff
    mov r0, #0xf
    str r1, [sp, #0x50]
    str r0, [sp, #0x54]
    bl func_0203b404
    mov r4, r0
    ldr r0, [r10, #0x8]
    bl func_ov004_0214e4b0
    mov r2, #0x20
    str r2, [sp, #0x0]
    add r1, sp, #0x50
    str r1, [sp, #0x4]
    ldr r1, [r4, #0x88]
    mov r2, #0x850000
    mov r3, #0x2
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    blx func_ov012_021b77a8
    mvn r0, #0x7f
    strh r0, [sp, #0x48]
    mov r0, #0x0
    strh r0, [sp, #0x4a]
    strh r0, [sp, #0x4c]
    mov r0, #0x18
    strh r0, [sp, #0x4e]
    ldr r1, .L_0215e1d8
    ldr r2, .L_0215e1dc
    ldr r3, .L_0215e1e0
    mov r0, #0x70
    add r6, sp, #0x48
    bl func_0201a21c
    movs r5, r0
    beq .L_0215e014
    ldr r2, .L_0215e1e4
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_0215e1e8
    mov r1, r6
    add r0, r5, #0x68
    str r2, [r5, #0x0]
    bl func_ov004_0214e6d0
    ldr r0, .L_0215e1ec
    str r0, [r5, #0x0]
.L_0215e014:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0215e030
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215e030:
    ldr r1, [r5, #0x18]
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e1f0
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e1f0
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e1f4
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    mov r1, #0x8
    ldr r2, .L_0215e1f8
    bl func_02027834
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
.L_0215e098:
    bl func_02026f94
    str r0, [r10, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x5c]
    ldr r0, [r10, #0x4]
    add r1, sp, #0x5c
    bl func_ov004_02152ca0
    ldr r0, [r10, #0x4]
    ldr r1, .L_0215e1fc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x4]
    mov r1, r10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x14
    bl func_ov004_0214f568
    bl func_ov004_0214f5dc
    bl func_02026f94
    str r0, [r10, #0xbc]
    mov r0, #0x80000
    str r0, [sp, #0x58]
    ldr r0, [r10, #0xbc]
    add r1, sp, #0x58
    bl func_ov004_02152ca0
    ldr r0, [r10, #0xbc]
    ldr r1, .L_0215e200
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0xbc]
    ldr r2, .L_0215e204
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r10, #0xbc]
    mov r1, r10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0xbc]
    bl func_02086cac
    ldrsb r0, [r10, #0xb9]
    cmp r0, #0x0
    bne .L_0215e168
    bl func_ov004_0214f508
    ldr r0, [r10, #0xbc]
    ldr r1, .L_0215e208
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_0215e168:
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r10, #0x0]
    add sp, sp, #0x74
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215e180: .word data_ov004_02161b00
.L_0215e184: .word data_ov004_02161944
.L_0215e188: .word data_020afe90
.L_0215e18c: .word func_ov004_0215e2c0
.L_0215e190: .word func_ov004_0215e2f4
.L_0215e194: .word func_ov004_0215e2e0
.L_0215e198: .word data_ov004_02161b18
.L_0215e19c: .word data_ov004_02161b30
.L_0215e1a0: .word data_ov004_02161b48
.L_0215e1a4: .word data_ov004_02161b64
.L_0215e1a8: .word data_ov004_02161b78
.L_0215e1ac: .word data_ov004_02161b94
.L_0215e1b0: .word func_ov004_0215e308
.L_0215e1b4: .word data_ov012_021d5154
.L_0215e1b8: .word data_ov004_021608d4
.L_0215e1bc: .word data_ov004_021618c4
.L_0215e1c0: .word func_ov004_0214e414
.L_0215e1c4: .word data_ov004_02161bb0
.L_0215e1c8: .word data_ov004_02161bbc
.L_0215e1cc: .word 0x494c
.L_0215e1d0: .word data_ov004_02161bc4
.L_0215e1d4: .word data_ov004_02161a20
.L_0215e1d8: .word data_ov004_021608f4
.L_0215e1dc: .word data_ov004_021618bc
.L_0215e1e0: .word 0x1b2
.L_0215e1e4: .word data_02093c8c
.L_0215e1e8: .word data_ov004_0216094c
.L_0215e1ec: .word data_ov012_021d1c58
.L_0215e1f0: .word 0x850002
.L_0215e1f4: .word 0x850004
.L_0215e1f8: .word func_ov004_0215e36c
.L_0215e1fc: .word func_ov004_0215e3dc
.L_0215e200: .word func_ov004_0215e480
.L_0215e204: .word func_ov004_0215e56c
.L_0215e208: .word func_ov004_0215e484
    arm_func_end func_ov004_0215da38

    .global func_ov004_0215e20c
    arm_func_start func_ov004_0215e20c
func_ov004_0215e20c: ; 0x0215e20c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    blx func_ov012_021b65bc
    mov r0, #0x4
    bl func_ov004_0215e290
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r4, .L_0215e28c
    b .L_0215e23c
.L_0215e234:
    ldr r0, [r4, #0x0]
    blx r0
.L_0215e23c:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215e234
    ldr r0, [r5, #0xc0]
    blx func_02086838
    ldr r0, [r5, #0x8]
    bl func_ov004_0214e4b8
    ldr r0, [r5, #0xb0]
    cmp r0, #0x0
    beq .L_0215e268
    blx func_ov012_021bd500
.L_0215e268:
    ldr r0, [r5, #0xb4]
    cmp r0, #0x0
    beq .L_0215e278
    bl func_ov012_021bab64
.L_0215e278:
    mov r0, r5
    bl func_ov004_0214fb48
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215e28c: .word data_020a0e18
    arm_func_end func_ov004_0215e20c

    .global func_ov004_0215e290
    arm_func_start func_ov004_0215e290
func_ov004_0215e290: ; 0x0215e290
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_0215e2bc
    b .L_0215e2b0
.L_0215e2a4:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_0215e2b0:
    cmp r5, r6
    blo .L_0215e2a4
    ldmia sp!, {r4, r5, r6, pc}
.L_0215e2bc: .word data_020a0e18
    arm_func_end func_ov004_0215e290

    .global func_ov004_0215e2c0
    arm_func_start func_ov004_0215e2c0
func_ov004_0215e2c0: ; 0x0215e2c0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov004_0214ce64
    mov r1, #0xa
    bl func_ov004_0214ce74
    mov r0, r4
    bl func_ov004_0215e20c
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215e2c0

    .global func_ov004_0215e2e0
    arm_func_start func_ov004_0215e2e0
func_ov004_0215e2e0: ; 0x0215e2e0
    ldr r0, [r0, #0x44]
    ldr ip, .L_0215e2f0
    ldr r0, [r0, #0x4]
    bx ip
.L_0215e2f0: .word func_ov012_021b65d8
    arm_func_end func_ov004_0215e2e0

    .global func_ov004_0215e2f4
    arm_func_start func_ov004_0215e2f4
func_ov004_0215e2f4: ; 0x0215e2f4
    ldr r0, [r0, #0x44]
    ldr ip, .L_0215e304
    ldr r0, [r0, #0x4]
    bx ip
.L_0215e304: .word func_ov012_021b65e0
    arm_func_end func_ov004_0215e2f4

    .global func_ov004_0215e308
    arm_func_start func_ov004_0215e308
func_ov004_0215e308: ; 0x0215e308
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215e368
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x1
    bl func_0207342c
    ldr r0, [r4, #0xc0]
    blx func_020869ec
    ldmia sp!, {r3, r4, r5, pc}
.L_0215e368: .word 0x80011001
    arm_func_end func_ov004_0215e308

    .global func_ov004_0215e36c
    arm_func_start func_ov004_0215e36c
func_ov004_0215e36c: ; 0x0215e36c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215e3d8
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    tst r0, #0x4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mvn r2, #0x0
    mov r0, #0x78
    mov r1, #0x0
    strb r2, [r4, #0xba]
    bl func_0207342c
    ldmia sp!, {r3, r4, r5, pc}
.L_0215e3d8: .word 0x80011000
    arm_func_end func_ov004_0215e36c

    .global func_ov004_0215e3dc
    arm_func_start func_ov004_0215e3dc
func_ov004_0215e3dc: ; 0x0215e3dc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, .L_0215e434
    ldr r2, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r5, [r2, #0x10]
    add r1, r1, #0x1
    str r1, [r0, #0x0]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    blx func_ov012_021b65cc
    ldr r0, [r5, #0x44]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215e438
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215e434: .word data_020a0f10
.L_0215e438: .word func_ov004_0215e43c
    arm_func_end func_ov004_0215e3dc

    .global func_ov004_0215e43c
    arm_func_start func_ov004_0215e43c
func_ov004_0215e43c: ; 0x0215e43c
    stmdb sp!, {r4, lr}
    ldr r1, .L_0215e47c
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    add r0, r0, #0x1
    str r0, [r1, #0x0]
    ldrsb r0, [r4, #0xba]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    bl func_ov004_0214ce64
    mov r1, #0x6
    bl func_ov004_0214ce74
    mov r0, r4
    bl func_ov004_0215e20c
    ldmia sp!, {r4, pc}
.L_0215e47c: .word data_020a0f10
    arm_func_end func_ov004_0215e43c

    .global func_ov004_0215e480
    arm_func_start func_ov004_0215e480
func_ov004_0215e480: ; 0x0215e480
    bx lr
    arm_func_end func_ov004_0215e480

    .global func_ov004_0215e484
    arm_func_start func_ov004_0215e484
func_ov004_0215e484: ; 0x0215e484
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    mov r0, #0x14
    bl func_ov004_0215e290
    bl func_ov004_0214f624
    ldr r7, .L_0215e4f8
    mov r4, r0
    mov r5, #0x0
    mov r8, #0xc
.L_0215e4a8:
    and r0, r5, #0xff
    orr r0, r0, #0x1e00
    mov r0, r0, lsl #0x10
    mov r1, r4
    mov r2, r8
    mov r0, r0, lsr #0x10
    bl func_02087214
    ldr r0, [r7, #0x0]
    add r4, r4, #0xc
    blx r0
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0215e4a8
    ldr r0, .L_0215e4f8
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215e4fc
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0215e4f8: .word data_020a0e18
.L_0215e4fc: .word func_ov004_0215e500
    arm_func_end func_ov004_0215e484

    .global func_ov004_0215e500
    arm_func_start func_ov004_0215e500
func_ov004_0215e500: ; 0x0215e500
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xc0]
    blx func_020869b8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrsb r0, [r4, #0xba]
    cmp r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    blx func_020869c8
    ldr r0, .L_0215e560
    ldr r1, .L_0215e564
    mov r2, #0x2
    bl func_02087214
    mov r0, #0x1
    strb r0, [r4, #0xba]
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215e568
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215e560: .word 0x1f1f
.L_0215e564: .word data_ov004_021605a4
.L_0215e568: .word func_ov004_0215e480
    arm_func_end func_ov004_0215e500

    .global func_ov004_0215e56c
    arm_func_start func_ov004_0215e56c
func_ov004_0215e56c: ; 0x0215e56c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    sub r0, r0, #0x70000004
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215e59c: ; jump table
    b .L_0215e63c ; case 0
    b .L_0215e5ac ; case 1
    ldmia sp!, {r3, r4, r5, r6, r7, pc} ; case 2
    b .L_0215e650 ; case 3
.L_0215e5ac:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    and r0, r0, #0xff00
    cmp r0, #0x1e00
    bne .L_0215e608
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    and r7, r0, #0xff
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    mov r6, r0
    bl func_ov004_0214f624
    mov r1, r0
    mov r0, r6
    mov r2, #0xc
    mla r1, r7, r2, r1
    bl func_02051890
.L_0215e608:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    ldr r1, .L_0215e65c
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r0, #0x1
    strb r0, [r4, #0xba]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215e63c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215e650:
    mov r0, r4
    bl func_ov004_0215e20c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215e65c: .word 0x1f1f
    arm_func_end func_ov004_0215e56c

    .global func_ov004_0215e660
    arm_func_start func_ov004_0215e660
func_ov004_0215e660: ; 0x0215e660
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x34
    ldr r1, .L_0215e908
    mov r4, r0
    ldr r2, .L_0215e90c
    mov r0, #0x14
    mov r3, #0x45
    bl func_0201a21c
    mov r9, r0
    mov r1, #0x0
    mov r2, #0x14
    bl func_020517fc
    mov r0, r9
    mov r1, r4
    bl func_ov004_0214ed84
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r6, .L_0215e910
    str r8, [r9, #0x4]
    mov r7, #0x0
    mov r5, #0x58
    mov r11, #0x6e
.L_0215e6c8:
    ldr r10, [r6, r7, lsl #0x2]
    str r5, [sp, #0x10]
    str r10, [sp, #0xc]
    bl func_0203b404
    str r11, [sp, #0x0]
    add r1, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x88]
    ldr r2, .L_0215e914
    mov r0, r8
    mov r3, r7
    bl func_ov004_0214ee60
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r9, r7, lsl #0x2
    str r4, [r0, #0x8]
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r2, .L_0215e918
    add r0, sp, #0x14
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r2, .L_0215e91c
    add r0, sp, #0x1c
    mov r1, r4
    bl func_ov004_02151ebc
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r10, lsl #0xc
    str r0, [sp, #0x24]
    mov r0, #0x58000
    str r0, [sp, #0x28]
    mov r0, r4
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x58000
    str r0, [sp, #0x30]
    ldr r0, .L_0215e920
    add r2, sp, #0x30
    ldr r1, [r0, r7, lsl #0x2]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x2c]
    add r1, sp, #0x2c
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r3, [sp, #0x18]
    mov r2, #0x44
    bl func_02023c60
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x14]
    ldr r2, .L_0215e924
    ldr r3, [sp, #0x18]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    mov r1, #0x0
    ldr r0, [r4, #0x4]
    mov r2, r1
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_0215e6c8
    mov r0, #0x1
    strb r0, [r9, #0x10]
    bl func_02026f94
    str r0, [r9, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r9, #0x0]
    ldr r1, .L_0215e928
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    mov r1, r9
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, r9
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215e908: .word data_ov004_02161bf8
.L_0215e90c: .word data_ov004_02161bd8
.L_0215e910: .word data_ov004_021605a8
.L_0215e914: .word 0x818000
.L_0215e918: .word data_ov004_02161c10
.L_0215e91c: .word data_ov004_02161c1c
.L_0215e920: .word data_ov004_021605b0
.L_0215e924: .word 0x494c
.L_0215e928: .word func_ov004_0215e9fc
    arm_func_end func_ov004_0215e660

    .global func_ov004_0215e92c
    arm_func_start func_ov004_0215e92c
func_ov004_0215e92c: ; 0x0215e92c
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0215e950
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215e950:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0215e92c

    .global func_ov004_0215e95c
    arm_func_start func_ov004_0215e95c
func_ov004_0215e95c: ; 0x0215e95c
    mov r1, #0x0
    strb r1, [r0, #0x10]
    ldr r0, [r0, #0x0]
    ldr ip, .L_0215e978
    ldr r1, .L_0215e97c
    ldr r0, [r0, #0x4]
    bx ip
.L_0215e978: .word func_02028384
.L_0215e97c: .word func_ov004_0215ea00
    arm_func_end func_ov004_0215e95c

    .global func_ov004_0215e980
    arm_func_start func_ov004_0215e980
func_ov004_0215e980: ; 0x0215e980
    cmp r0, #0x0
    beq .L_0215e99c
    ldrsb r0, [r0, #0x10]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0215e99c:
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_0215e980

    .global func_ov004_0215e9a4
    arm_func_start func_ov004_0215e9a4
func_ov004_0215e9a4: ; 0x0215e9a4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, #0x0
    mov r7, r0
    mov r6, r1
    mov r4, r5
.L_0215e9b8:
    add r0, r7, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, r6
    ldr r0, [r0, #0x4]
    mov r2, r4
    bl func_02023894
    add r0, r7, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215e9b8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov004_0215e9a4

    .global func_ov004_0215e9fc
    arm_func_start func_ov004_0215e9fc
func_ov004_0215e9fc: ; 0x0215e9fc
    bx lr
    arm_func_end func_ov004_0215e9fc

    .global func_ov004_0215ea00
    arm_func_start func_ov004_0215ea00
func_ov004_0215ea00: ; 0x0215ea00
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    bl func_ov004_0215e9a4
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215ea28
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215ea28: .word func_ov004_0215ea2c
    arm_func_end func_ov004_0215ea00

    .global func_ov004_0215ea2c
    arm_func_start func_ov004_0215ea2c
func_ov004_0215ea2c: ; 0x0215ea2c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    mov r4, #0x0
    ldr r5, [r0, #0x10]
    mov r7, r4
    mov r8, #0x1
    b .L_0215ea84
.L_0215ea4c:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    moveq r0, r8
    movne r0, r7
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_0215ea90
    add r4, r4, #0x1
.L_0215ea84:
    cmp r4, #0x2
    blt .L_0215ea4c
    mov r0, #0x1
.L_0215ea90:
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r5
    mov r1, #0x0
    bl func_ov004_0215e9a4
    mov r0, #0x1
    strb r0, [r5, #0x10]
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215eabc
    bl func_02028384
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0215eabc: .word func_ov004_0215e9fc
    arm_func_end func_ov004_0215ea2c

    .global func_ov004_0215eac0
    arm_func_start func_ov004_0215eac0
func_ov004_0215eac0: ; 0x0215eac0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, .L_0215eba8
    mov r4, r0
    ldr r2, .L_0215ebac
    mov r0, #0x20
    mov r3, #0x2b
    bl func_0201a21c
    mov r9, r0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020517fc
    mov r0, r9
    mov r1, r4
    bl func_ov004_0214ed84
    mov r7, r0
    str r7, [r9, #0x0]
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r8, #0x0
    mov r6, #0x820000
    mov r11, #0x3
    mvn r4, #0x0
.L_0215eb24:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, r6
    mov r2, r11
    mov r3, #0x20
    bl func_ov004_0214e9f0
    mov r5, r0
    ldr r0, [r7, #0x4]
    ldr r10, [r5, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r10
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r9, r8, lsl #0x2
    str r5, [r0, #0x4]
    add r0, r9, r8
    add r8, r8, #0x1
    strb r4, [r0, #0x14]
    cmp r8, #0x4
    blt .L_0215eb24
    mov r1, #0x0
    mov r0, r9
    strb r1, [r9, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215eba8: .word data_ov004_02161c48
.L_0215ebac: .word data_ov004_02161c24
    arm_func_end func_ov004_0215eac0

    .global func_ov004_0215ebb0
    arm_func_start func_ov004_0215ebb0
func_ov004_0215ebb0: ; 0x0215ebb0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_0201b244
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0215ebb0

    .global func_ov004_0215ebc4
    arm_func_start func_ov004_0215ebc4
func_ov004_0215ebc4: ; 0x0215ebc4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, #0x0
    mov r5, r0
    mov r7, r4
    mvn r6, #0x0
.L_0215ebd8:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r5, r4
    add r4, r4, #0x1
    strb r6, [r0, #0x14]
    cmp r4, #0x4
    blt .L_0215ebd8
    mov r0, #0x0
    strb r0, [r5, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov004_0215ebc4

    .global func_ov004_0215ec14
    arm_func_start func_ov004_0215ec14
func_ov004_0215ec14: ; 0x0215ec14
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r6, r1
    mov r5, r2
    add r0, r4, r6
    strb r5, [r0, #0x14]
    bl func_ov004_0214f704
    cmp r6, r0
    ldrnesb r1, [r4, #0x1c]
    addne r0, r1, #0x1
    strneb r0, [r4, #0x1c]
    addne r0, r4, r1
    strneb r6, [r0, #0x18]
    bne .L_0215ecc0
    add r0, r4, r6, lsl #0x2
    ldr r4, [r0, #0x4]
    add r1, r6, #0x3
    ldr r0, [r4, #0x4]
    orr r1, r1, #0x820000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x2f
    mul r0, r5, r0
    add r0, r0, #0xb
    mov r5, r0, lsl #0xc
    mov r3, #0xe8000
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r4
    str r5, [sp, #0x0]
    str r3, [sp, #0x4]
    bl func_ov004_0214e1b8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215ecc0:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov004_0215ec14

    .global func_ov004_0215ecc8
    arm_func_start func_ov004_0215ecc8
func_ov004_0215ecc8: ; 0x0215ecc8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r10, r0
    mov r5, #0x0
    add r4, sp, #0x8
    mov r6, #0x2f
.L_0215ece0:
    mul r0, r5, r6
    add r0, r0, #0x5
    str r0, [r4, r5, lsl #0x2]
    bl func_ov004_0214f704
    add r0, r10, r0
    ldrsb r0, [r0, #0x14]
    cmp r5, r0
    ldreq r0, [r4, r5, lsl #0x2]
    addeq r0, r0, #0xc
    streq r0, [r4, r5, lsl #0x2]
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0215ece0
    mov r7, #0x0
    mov r6, r7
    add r5, sp, #0x8
    mov r4, #0xe8000
    add r11, sp, #0x4
    b .L_0215edb4
.L_0215ed2c:
    add r0, r10, r7
    ldrsb r3, [r0, #0x18]
    mov r2, r6
    add r0, r10, r3, lsl #0x2
    ldr r9, [r0, #0x4]
    add r1, r3, #0x7
    ldr r0, [r9, #0x4]
    add r3, r10, r3
    orr r1, r1, #0x820000
    ldrsb r8, [r3, #0x14]
    bl func_02023894
    ldr r0, [r9, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r1, [r5, r8, lsl #0x2]
    str r4, [sp, #0x4]
    add r1, r1, #0x6
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    mov r0, r9
    mov r1, r11
    add r2, sp, #0x0
    bl func_ov004_0214e1b8
    ldr r0, [r9, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, r8, lsl #0x2]
    add r7, r7, #0x1
    add r0, r0, #0xc
    str r0, [r5, r8, lsl #0x2]
.L_0215edb4:
    ldrsb r0, [r10, #0x1c]
    cmp r7, r0
    blt .L_0215ed2c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov004_0215ecc8

    .global func_ov004_0215edc8
    arm_func_start func_ov004_0215edc8
func_ov004_0215edc8: ; 0x0215edc8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r1, .L_0215ee5c
    mov r5, r0
    ldr r2, .L_0215ee60
    mov r0, #0x4
    mov r3, #0x1e
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x4
    mov r4, r0
    bl func_020517fc
    mov r1, #0xc0
    mov r0, #0xb4
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    bl func_0203b3f4
    mov r1, #0x20
    mov r3, r0
    str r1, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r3, #0x88]
    mov r0, r5
    mov r2, #0x820000
    mov r3, #0xb
    bl func_ov004_0214ee60
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r4, #0x0]
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0215ee5c: .word data_ov004_02161c88
.L_0215ee60: .word data_ov004_02161c64
    arm_func_end func_ov004_0215edc8

    .global func_ov004_0215ee64
    arm_func_start func_ov004_0215ee64
func_ov004_0215ee64: ; 0x0215ee64
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_0201b244
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0215ee64

    .global func_ov004_0215ee78
    arm_func_start func_ov004_0215ee78
func_ov004_0215ee78: ; 0x0215ee78
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0215ee78

    .global func_ov004_0215eea0
    arm_func_start func_ov004_0215eea0
func_ov004_0215eea0: ; 0x0215eea0
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0215eea0

    .global func_ov004_0215eec8
    arm_func_start func_ov004_0215eec8
func_ov004_0215eec8: ; 0x0215eec8
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0215ef08
    mov r5, r0
    ldr r2, .L_0215ef0c
    mov r0, #0x12
    mov r3, #0x2a
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x12
    bl func_020517fc
    mov r0, r4
    strb r5, [r4, #0x10]
    bl func_ov004_0215ef24
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0215ef08: .word data_ov004_02161cc4
.L_0215ef0c: .word data_ov004_02161ca4
    arm_func_end func_ov004_0215eec8

    .global func_ov004_0215ef10
    arm_func_start func_ov004_0215ef10
func_ov004_0215ef10: ; 0x0215ef10
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_0201b244
    ldmia sp!, {r3, pc}
    arm_func_end func_ov004_0215ef10

    .global func_ov004_0215ef24
    arm_func_start func_ov004_0215ef24
func_ov004_0215ef24: ; 0x0215ef24
    mov r3, #0x0
    mvn r2, #0x0
    b .L_0215ef38
.L_0215ef30:
    strb r2, [r0, r3, lsl #0x2]
    add r3, r3, #0x1
.L_0215ef38:
    ldrsb r1, [r0, #0x10]
    cmp r3, r1
    blt .L_0215ef30
    bx lr
    arm_func_end func_ov004_0215ef24

    .global func_ov004_0215ef48
    arm_func_start func_ov004_0215ef48
func_ov004_0215ef48: ; 0x0215ef48
    strb r2, [r0, r1, lsl #0x2]
    add r0, r0, r1, lsl #0x2
    strh r3, [r0, #0x2]
    bx lr
    arm_func_end func_ov004_0215ef48

    .global func_ov004_0215ef58
    arm_func_start func_ov004_0215ef58
func_ov004_0215ef58: ; 0x0215ef58
    ldrsb r3, [r0, #0x10]
    mov r2, #0x0
    b .L_0215ef7c
.L_0215ef64:
    mov r1, r2, lsl #0x2
    ldrsb r1, [r0, r1]
    cmp r1, #0x0
    movlt r0, #0x0
    bxlt lr
    add r2, r2, #0x1
.L_0215ef7c:
    cmp r2, r3
    blt .L_0215ef64
    mov r0, #0x1
    bx lr
    arm_func_end func_ov004_0215ef58

    .global func_ov004_0215ef8c
    arm_func_start func_ov004_0215ef8c
func_ov004_0215ef8c: ; 0x0215ef8c
    ldrsb ip, [r0, #0x10]
    mov r3, #0x0
    b .L_0215efb0
.L_0215ef98:
    mov r2, r3, lsl #0x2
    ldrsb r2, [r0, r2]
    cmp r1, r2
    moveq r0, #0x1
    bxeq lr
    add r3, r3, #0x1
.L_0215efb0:
    cmp r3, ip
    blt .L_0215ef98
    mov r0, #0x0
    bx lr
    arm_func_end func_ov004_0215ef8c

    .global func_ov004_0215efc0
    arm_func_start func_ov004_0215efc0
func_ov004_0215efc0: ; 0x0215efc0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x4
    mov lr, #0x0
    mov r5, lr
    add r3, sp, #0x0
    mvn r4, #0x0
    b .L_0215f004
.L_0215efdc:
    add r2, r0, r5, lsl #0x2
    strb r4, [r2, #0x1]
    mov r2, r5, lsl #0x2
    ldrsb r2, [r0, r2]
    cmp r1, r2
    addeq r2, lr, #0x1
    streqb r5, [r3, lr]
    moveq r2, r2, lsl #0x18
    moveq lr, r2, asr #0x18
    add r5, r5, #0x1
.L_0215f004:
    ldrsb r2, [r0, #0x10]
    cmp r5, r2
    blt .L_0215efdc
    mov r4, #0x0
    mov r8, lr
    add r2, sp, #0x0
    ldr ip, .L_0215f0d8
    mov r3, r4
    mov r1, r4
    b .L_0215f0c8
.L_0215f02c:
    mov r5, ip
    mov r9, r3
    b .L_0215f064
.L_0215f038:
    ldrsb r6, [r2, r9]
    cmp r6, #0x0
    blt .L_0215f060
    add r7, r0, r6, lsl #0x2
    ldrsb r6, [r7, #0x1]
    cmp r6, #0x0
    bge .L_0215f060
    ldrh r6, [r7, #0x2]
    cmp r5, r6
    movhi r5, r6
.L_0215f060:
    add r9, r9, #0x1
.L_0215f064:
    cmp r9, r8
    blt .L_0215f038
    mov r6, r1
    mov r7, r1
    b .L_0215f0a8
.L_0215f078:
    ldrsb r9, [r2, r7]
    cmp r9, #0x0
    blt .L_0215f0a4
    add r10, r0, r9, lsl #0x2
    ldrsb r9, [r10, #0x1]
    cmp r9, #0x0
    bge .L_0215f0a4
    ldrh r9, [r10, #0x2]
    cmp r5, r9
    streqb r4, [r10, #0x1]
    addeq r6, r6, #0x1
.L_0215f0a4:
    add r7, r7, #0x1
.L_0215f0a8:
    cmp r7, r8
    blt .L_0215f078
    add r4, r4, r6
    sub r5, lr, r6
    mov r4, r4, lsl #0x18
    mov r5, r5, lsl #0x18
    mov r4, r4, asr #0x18
    mov lr, r5, asr #0x18
.L_0215f0c8:
    cmp lr, #0x0
    bgt .L_0215f02c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0215f0d8: .word 0xffff
    arm_func_end func_ov004_0215efc0

    .global func_ov004_0215f0dc
    arm_func_start func_ov004_0215f0dc
func_ov004_0215f0dc: ; 0x0215f0dc
    mov r1, r1, lsl #0x2
    ldrsb r0, [r0, r1]
    bx lr
    arm_func_end func_ov004_0215f0dc

    .global func_ov004_0215f0e8
    arm_func_start func_ov004_0215f0e8
func_ov004_0215f0e8: ; 0x0215f0e8
    add r0, r0, r1, lsl #0x2
    ldrh r0, [r0, #0x2]
    bx lr
    arm_func_end func_ov004_0215f0e8

    .global func_ov004_0215f0f4
    arm_func_start func_ov004_0215f0f4
func_ov004_0215f0f4: ; 0x0215f0f4
    add r0, r0, r1, lsl #0x2
    ldrsb r0, [r0, #0x1]
    bx lr
    arm_func_end func_ov004_0215f0f4

    .global func_ov004_0215f100
    arm_func_start func_ov004_0215f100
func_ov004_0215f100: ; 0x0215f100
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02086c08
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov010_0219b730
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    mvn r1, #0x80000000
    ldr r0, [r0, #0x4]
    bl func_020314c0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f148
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215f148: .word func_ov004_0215f14c
    arm_func_end func_ov004_0215f100

    .global func_ov004_0215f14c
    arm_func_start func_ov004_0215f14c
func_ov004_0215f14c: ; 0x0215f14c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02086c08
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov010_0219b730
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031520
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f190
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215f190: .word func_ov004_0215f100
    arm_func_end func_ov004_0215f14c

    .global func_ov004_0215f194
    arm_func_start func_ov004_0215f194
func_ov004_0215f194: ; 0x0215f194
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x1c
    ldr r1, .L_0215f6a8
    ldr r2, .L_0215f6ac
    mov r0, #0x108
    mov r3, #0xbe
    bl func_0201a21c
    mov r1, #0x108
    mov r5, r0
    bl func_ov004_0214fadc
    bl func_ov004_0214fc78
    bl func_020876ac
    and r0, r0, #0xff
    bl func_ov004_0214f718
    bl func_02086d80
    and r0, r0, #0xff
    bl func_ov004_0214f740
    bl func_ov004_0214f72c
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    bl func_ov004_0215eec8
    str r0, [r5, #0xfc]
    bl func_ov004_0214dcd4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r5, #0x8]
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    bl func_ov004_0214e204
    str r0, [r5, #0xc]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215f6b0
    ldr r1, .L_0215f6b4
    bl func_ov004_0214e880
    str r0, [r5, #0x14]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215f6b8
    ldr r1, .L_0215f6bc
    bl func_ov004_0214e880
    str r0, [r5, #0x18]
    ldr r0, .L_0215f6c0
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x24]
    ldr r0, .L_0215f6c4
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x28]
    ldr r0, .L_0215f6c8
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x2c]
    ldr r0, .L_0215f6cc
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x30]
    bl func_0203b404
    ldr r3, [r0, #0x88]
    ldr r1, .L_0215f6d0
    ldr r0, .L_0215f6d4
    ldr r2, [r1, #0x0]
    ldr r6, [r3, #0x4]
    ldr r3, [r0, #0x0]
    sub r4, r2, #0x1
    ldr r2, .L_0215f6d8
    str r6, [r0, #0x0]
    mov r0, #0x810000
    str r4, [r1, #0x0]
    str r3, [r2, r4, lsl #0x2]
    bl func_02035e88
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0215f2e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215f2e4:
    ldr r0, [r4, #0x38]
    mov r1, #0x1
    str r0, [r5, #0xf0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x50]
    blx r2
    ldr r0, [r5, #0x28]
    ldr r0, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x50]
    blx r1
    ldr r1, .L_0215f6d0
    ldr r2, .L_0215f6d8
    ldr r3, [r1, #0x0]
    ldr r0, .L_0215f6d4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r0, [r5, #0x8]
    bl func_ov004_0214e4b0
    mov r4, r0
    str r4, [r5, #0x44]
    ldr r0, .L_0215f6dc
    ldr r1, .L_0215f6e0
    ldr r6, [r0, #0x0]
    ldr r2, .L_0215f6e4
    mov r0, #0x134
    mov r3, #0x3e
    ldr r7, [r4, #0x4]
    bl func_0201a21c
    movs r8, r0
    beq .L_0215f380
    ldr r3, .L_0215f6e8
    mov r1, r7
    mov r2, r6
    blx func_ov012_021af0f8
    mov r8, r0
.L_0215f380:
    ldr r0, [r8, #0x18]
    cmp r0, #0x0
    bne .L_0215f39c
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215f39c:
    ldr r6, [r8, #0x18]
    mov r1, #0x1
    ldr r0, [r6, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x14]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x4]
    ldr r1, [r5, #0x14]
    ldr r2, [r0, #0x0]
    ldr r6, [r1, #0x4]
    ldr r2, [r2, #0xb4]
    mov r1, r6
    blx r2
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0xd4
    str r0, [sp, #0x8]
    mov r0, #0xd
    str r0, [sp, #0xc]
    bl func_0203b404
    mov r2, r0
    mov r0, #0x74
    str r0, [sp, #0x0]
    add r1, sp, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r2, #0x88]
    mov r0, r4
    mov r2, #0x810000
    mov r3, #0x3c
    bl func_ov004_0214ee60
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov004_021532a8
    str r0, [r5, #0xdc]
    bl func_0203b404
    ldr r1, [r0, #0x88]
    mov r0, r4
    bl func_ov004_02154ae4
    str r0, [r5, #0xb4]
    bl func_0203b404
    ldr r1, [r0, #0x88]
    mov r0, r4
    bl func_ov004_02155024
    str r0, [r5, #0xbc]
    ldr r0, [r5, #0x14]
    bl func_ov004_02154e54
    str r0, [r5, #0xb8]
    bl func_ov004_02155410
    mov r1, #0x0
    str r0, [r5, #0xc0]
    bl func_ov004_021555e8
    bl func_ov004_0215561c
    mov r1, #0x0
    str r0, [r5, #0xc4]
    bl func_ov004_02155790
    mov r1, #0x258
    strh r1, [r5, #0xf4]
    mov r0, #0x1
    strb r0, [r5, #0xf7]
    mov r0, r5
    strh r1, [r5, #0xf4]
    bl func_ov004_0215f8ec
    mov r0, r4
    bl func_ov004_02156274
    str r0, [r5, #0xc8]
    mov r0, r4
    bl func_ov004_02156f10
    str r0, [r5, #0xcc]
    mov r0, r4
    bl func_ov004_0215e660
    str r0, [r5, #0xd0]
    bl func_ov004_0214f704
    mov r6, r0
    bl func_ov004_0214f72c
    mov r1, r6, lsl #0x18
    mov r2, r0
    mov r0, r1, asr #0x18
    mov r1, r2, lsl #0x18
    mov r1, r1, asr #0x18
    mov r2, r4
    bl func_ov004_02158238
    str r0, [r5, #0xd4]
    mov r0, #0x1
    bl func_0203b424
    ldr r6, [r0, #0x88]
    mov r0, #0x1
    bl func_0203b414
    mov r1, r0
    ldr r1, [r1, #0x88]
    mov r2, r6
    mov r0, r4
    bl func_ov004_021533a0
    str r0, [r5, #0xd8]
    ldr r1, [r5, #0x44]
    mov r0, r5
    bl func_ov004_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r1, [r5, #0x18]
    mov r0, r4
    mov r2, #0x1
    bl func_ov004_02153bfc
    str r0, [r5, #0xe0]
    mov r0, r4
    bl func_ov004_0215eac0
    str r0, [r5, #0xe4]
    mov r0, r4
    bl func_ov004_0215edc8
    str r0, [r5, #0xe8]
    mov r0, #0x0
    mov r1, #0xf7
    mov r2, #0xd
    blx func_020879dc
    bl func_02026f94
    str r0, [r5, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x18]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x18
    bl func_ov004_02152ca0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f6ec
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x4]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_02026f94
    str r0, [r5, #0xec]
    mov r0, #0x81000
    str r0, [sp, #0x14]
    ldr r0, [r5, #0xec]
    add r1, sp, #0x14
    bl func_ov004_02152ca0
    ldr r0, [r5, #0xec]
    ldr r1, .L_0215f6f0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0xec]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_02026f94
    str r0, [r5, #0x100]
    mov r0, #0x82000
    str r0, [sp, #0x10]
    ldr r0, [r5, #0x100]
    add r1, sp, #0x10
    bl func_ov004_02152ca0
    ldr r0, [r5, #0x100]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x100]
    ldr r1, .L_0215f6f4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x100]
    ldr r2, .L_0215f6f8
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    ldr r0, [r5, #0x100]
    bl func_02086cac
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r5, #0x0]
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0215f6a8: .word data_ov004_02161cfc
.L_0215f6ac: .word data_ov004_02161ce4
.L_0215f6b0: .word data_ov004_02161d14
.L_0215f6b4: .word data_ov004_02161d28
.L_0215f6b8: .word data_ov004_02161d3c
.L_0215f6bc: .word data_ov004_02161d50
.L_0215f6c0: .word data_ov004_02161d64
.L_0215f6c4: .word data_ov004_02161d78
.L_0215f6c8: .word data_ov004_02161d90
.L_0215f6cc: .word data_ov004_02161da8
.L_0215f6d0: .word data_02093c08
.L_0215f6d4: .word data_020a0dd0
.L_0215f6d8: .word data_020a16d0
.L_0215f6dc: .word data_ov012_021d5154
.L_0215f6e0: .word data_ov004_021608d4
.L_0215f6e4: .word data_ov004_02161cdc
.L_0215f6e8: .word func_ov004_0214e414
.L_0215f6ec: .word func_ov004_0215f938
.L_0215f6f0: .word func_ov004_0216024c
.L_0215f6f4: .word func_ov004_0216031c
.L_0215f6f8: .word func_ov004_0216035c
    arm_func_end func_ov004_0215f194

    .global func_ov004_0215f6fc
    arm_func_start func_ov004_0215f6fc
func_ov004_0215f6fc: ; 0x0215f6fc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    blx func_ov012_021b65bc
    mov r0, #0x4
    bl func_ov004_0215f8bc
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r4, .L_0215f8b8
    b .L_0215f72c
.L_0215f724:
    ldr r0, [r4, #0x0]
    blx r0
.L_0215f72c:
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215f724
    mov r0, #0x0
    bl func_02086cac
    blx func_020879f8
    ldr r0, [r5, #0x104]
    cmp r0, #0x0
    beq .L_0215f75c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215f75c:
    mov r0, #0x0
    str r0, [r5, #0x104]
    ldr r0, [r5, #0xfc]
    cmp r0, #0x0
    beq .L_0215f774
    bl func_ov004_0215ef10
.L_0215f774:
    ldr r0, [r5, #0xd8]
    cmp r0, #0x0
    beq .L_0215f784
    bl func_ov004_02153788
.L_0215f784:
    ldr r0, [r5, #0x8]
    bl func_ov004_0214e4b8
    ldr r0, [r5, #0xc]
    bl func_ov004_0214e4b8
    ldr r0, [r5, #0xb4]
    cmp r0, #0x0
    beq .L_0215f7a4
    bl func_ov004_02154d00
.L_0215f7a4:
    ldr r0, [r5, #0xbc]
    cmp r0, #0x0
    beq .L_0215f7b4
    bl func_ov004_02155244
.L_0215f7b4:
    ldr r0, [r5, #0xb8]
    cmp r0, #0x0
    beq .L_0215f7c4
    bl func_ov004_02154f64
.L_0215f7c4:
    ldr r0, [r5, #0xc0]
    cmp r0, #0x0
    beq .L_0215f7d4
    bl func_ov004_021555a0
.L_0215f7d4:
    ldr r0, [r5, #0xc4]
    cmp r0, #0x0
    beq .L_0215f7e4
    bl func_ov004_021556bc
.L_0215f7e4:
    ldr r0, [r5, #0xc8]
    cmp r0, #0x0
    beq .L_0215f7f4
    bl func_ov004_0215682c
.L_0215f7f4:
    ldr r0, [r5, #0xcc]
    cmp r0, #0x0
    beq .L_0215f804
    bl func_ov004_021573f8
.L_0215f804:
    ldr r0, [r5, #0xd0]
    cmp r0, #0x0
    beq .L_0215f814
    bl func_ov004_0215e92c
.L_0215f814:
    ldr r0, [r5, #0xd4]
    cmp r0, #0x0
    beq .L_0215f824
    bl func_ov004_021582c8
.L_0215f824:
    ldr r0, [r5, #0xdc]
    cmp r0, #0x0
    beq .L_0215f834
    bl func_ov004_021532e0
.L_0215f834:
    ldr r0, [r5, #0xe0]
    cmp r0, #0x0
    beq .L_0215f844
    bl func_ov004_02154254
.L_0215f844:
    ldr r0, [r5, #0xe4]
    cmp r0, #0x0
    beq .L_0215f854
    bl func_ov004_0215ebb0
.L_0215f854:
    ldr r0, [r5, #0xe8]
    cmp r0, #0x0
    beq .L_0215f864
    bl func_ov004_0215ee64
.L_0215f864:
    ldr r0, [r5, #0xf0]
    cmp r0, #0x0
    beq .L_0215f874
    bl func_02034d7c
.L_0215f874:
    ldr r0, [r5, #0xec]
    cmp r0, #0x0
    beq .L_0215f88c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215f88c:
    ldr r0, [r5, #0x100]
    cmp r0, #0x0
    beq .L_0215f8a4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215f8a4:
    mov r0, r5
    bl func_ov004_0214fb48
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_0215f8b8: .word data_020a0e18
    arm_func_end func_ov004_0215f6fc

    .global func_ov004_0215f8bc
    arm_func_start func_ov004_0215f8bc
func_ov004_0215f8bc: ; 0x0215f8bc
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    ldr r4, .L_0215f8e8
    b .L_0215f8dc
.L_0215f8d0:
    ldr r0, [r4, #0x0]
    blx r0
    add r5, r5, #0x1
.L_0215f8dc:
    cmp r5, r6
    blo .L_0215f8d0
    ldmia sp!, {r4, r5, r6, pc}
.L_0215f8e8: .word data_020a0e18
    arm_func_end func_ov004_0215f8bc

    .global func_ov004_0215f8ec
    arm_func_start func_ov004_0215f8ec
func_ov004_0215f8ec: ; 0x0215f8ec
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrsh r2, [r5, #0xf4]
    mov r0, #0x64
    mov r1, #0x3c
    smulbb r0, r2, r0
    bl func_0200d12c
    mov r0, r0, lsl #0x10
    mov r4, r0, asr #0x10
    ldr r0, [r5, #0xb4]
    mov r1, r4
    bl func_ov004_02154d28
    ldr r0, [r5, #0xbc]
    mov r1, r4
    bl func_ov004_0215526c
    ldr r0, [r5, #0xb8]
    mov r1, r4
    bl func_ov004_02154f8c
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_0215f8ec

    .global func_ov004_0215f938
    arm_func_start func_ov004_0215f938
func_ov004_0215f938: ; 0x0215f938
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    beq .L_0215fa10
    blx func_ov012_021b65cc
    bl func_020876f8
    cmp r0, #0x0
    beq .L_0215f988
    ldr r0, .L_0215fa18
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    bl func_020870e8
    bl func_02087160
    bl func_020872d4
    b .L_0215f9a4
.L_0215f988:
    ldr r6, .L_0215fa1c
    b .L_0215f998
.L_0215f990:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215f998:
    bl func_02088360
    cmp r0, #0x0
    beq .L_0215f990
.L_0215f9a4:
    bl func_02088330
    bl func_02087390
    bl func_02026f94
    str r0, [r4, #0x104]
    bl func_02031124
    ldr r2, [r4, #0x104]
    ldr r1, [r0, #0x4]
    ldr r0, [r2, #0x4]
    bl func_02027db0
    mov r0, #0x80000
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x104]
    add r1, sp, #0x0
    bl func_ov004_02152ca0
    ldr r0, [r4, #0x104]
    ldr r1, .L_0215fa20
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x104]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215fa24
    bl func_02028384
.L_0215fa10:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0215fa18: .word data_020a0da8
.L_0215fa1c: .word data_020a0e18
.L_0215fa20: .word func_ov004_0215f100
.L_0215fa24: .word func_ov004_0215fa28
    arm_func_end func_ov004_0215f938

    .global func_ov004_0215fa28
    arm_func_start func_ov004_0215fa28
func_ov004_0215fa28: ; 0x0215fa28
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0xa
    ldr r4, [r1, #0x10]
    bl func_ov004_0215f8bc
    bl func_ov004_0214f754
    ldr r0, [r4, #0xd4]
    bl func_ov004_0215831c
    ldr r0, [r4, #0xd4]
    bl func_ov004_021584a4
    ldr r0, [r4, #0xd4]
    bl func_ov004_0215845c
    bl func_ov004_0214f93c
    mov r0, #0x7
    mov r1, #0x0
    bl func_0207361c
    ldr r0, [r4, #0xc8]
    bl func_ov004_0215687c
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215fa84
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215fa84: .word func_ov004_0215fa88
    arm_func_end func_ov004_0215fa28

    .global func_ov004_0215fa88
    arm_func_start func_ov004_0215fa88
func_ov004_0215fa88: ; 0x0215fa88
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0xc8]
    bl func_ov004_0215696c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0xdc]
    bl func_ov004_021532f4
    bl func_ov004_0214f638
    mov r4, r0
    ldr r0, [r5, #0xdc]
    bl func_ov004_0215333c
    mov r2, r0
    ldr r0, [r5, #0xd8]
    mov r1, r4
    bl func_ov004_021537a4
    ldr r0, [r5, #0xfc]
    bl func_ov004_0215ef24
    ldr r0, [r5, #0xe0]
    bl func_ov004_021542e0
    ldr r0, [r6, #0x4]
    ldr r1, .L_0215faf0
    bl func_02028384
    ldmia sp!, {r4, r5, r6, pc}
.L_0215faf0: .word func_ov004_0215faf4
    arm_func_end func_ov004_0215fa88

    .global func_ov004_0215faf4
    arm_func_start func_ov004_0215faf4
func_ov004_0215faf4: ; 0x0215faf4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xe0]
    bl func_ov004_0215431c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xd8]
    mov r1, #0x1
    bl func_ov004_02153b6c
    ldr r0, [r4, #0xec]
    ldr r1, .L_0215fb48
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0xe0]
    bl func_ov004_02154368
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215fb4c
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215fb48: .word func_ov004_02160250
.L_0215fb4c: .word func_ov004_0215fb94
    arm_func_end func_ov004_0215faf4

    .global func_ov004_0215fb50
    arm_func_start func_ov004_0215fb50
func_ov004_0215fb50: ; 0x0215fb50
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
    b .L_0215fb84
.L_0215fb60:
    ldr r0, [r5, #0xfc]
    mov r1, r4
    bl func_ov004_0215f0dc
    cmp r0, #0x0
    blt .L_0215fb80
    ldr r0, [r5, #0xd4]
    mov r1, r4
    bl func_ov004_02158424
.L_0215fb80:
    add r4, r4, #0x1
.L_0215fb84:
    bl func_ov004_0214f72c
    cmp r4, r0
    blt .L_0215fb60
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_0215fb50

    .global func_ov004_0215fb94
    arm_func_start func_ov004_0215fb94
func_ov004_0215fb94: ; 0x0215fb94
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xdc]
    bl func_ov004_02153368
    ldrsh r2, [r4, #0xf4]
    mov r0, #0x64
    mov r1, #0x3c
    smulbb r0, r2, r0
    bl func_0200d12c
    ldr r1, .L_0215fdbc
    mov r0, r0, lsl #0x10
    sub r0, r1, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    mov r9, #0x0
    mov r6, #0x1
    b .L_0215fc7c
.L_0215fbe0:
    ldr r0, [r4, #0xfc]
    mov r1, r9
    bl func_ov004_0215f0dc
    cmp r0, #0x0
    bge .L_0215fc78
    ldr r0, [r4, #0xe0]
    mov r1, r9
    bl func_ov004_021543ac
    cmp r0, #0x0
    beq .L_0215fc78
    ldr r0, [r4, #0xe0]
    mov r1, r9
    bl func_ov004_021543dc
    mov r7, r0
    mov r2, r7, lsl #0x18
    ldr r0, [r4, #0xfc]
    mov r1, r9
    mov r3, r8
    mov r2, r2, asr #0x18
    bl func_ov004_0215ef48
    ldr r0, [r4, #0xd4]
    mov r1, r9
    bl func_ov004_02158408
    ldr r0, [r4, #0xe4]
    mov r1, r9
    mov r2, r7
    bl func_ov004_0215ec14
    bl func_ov004_0214f704
    cmp r9, r0
    bne .L_0215fc78
    ldr r0, [r4, #0xc4]
    mov r1, r7
    bl func_ov004_0215570c
    ldr r0, [r4, #0xc4]
    mov r1, r6
    bl func_ov004_02155790
    ldr r0, [r4, #0xe8]
    bl func_ov004_0215ee78
.L_0215fc78:
    add r9, r9, #0x1
.L_0215fc7c:
    bl func_ov004_0214f72c
    cmp r9, r0
    blt .L_0215fbe0
    ldr r0, [r4, #0xfc]
    bl func_ov004_0215ef58
    cmp r0, #0x0
    beq .L_0215fce4
    ldr r0, [r4, #0xd0]
    bl func_ov004_0215e95c
    ldr r0, [r4, #0xe8]
    bl func_ov004_0215eea0
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    bl func_ov004_021555e8
    mov r0, r4
    bl func_ov004_0215fb50
    ldr r0, [r4, #0xec]
    ldr r1, .L_0215fdc0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0xb8]
    bl func_ov004_02155008
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215fdc4
    bl func_02028384
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0215fce4:
    ldrsb r0, [r4, #0xf6]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r4, #0xcc]
    bl func_ov004_02157428
    mov r0, #0x7c
    mov r1, #0x5
    bl func_0207342c
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    bl func_ov004_021555e8
    mov r0, r4
    bl func_ov004_0215fb50
    mov r6, #0x0
    b .L_0215fd50
.L_0215fd20:
    ldr r0, [r4, #0xfc]
    mov r1, r6
    bl func_ov004_0215f0dc
    cmp r0, #0x0
    bge .L_0215fd4c
    ldr r0, [r4, #0xd4]
    mov r1, r6
    bl func_ov004_02158488
    ldr r0, [r4, #0xd4]
    mov r1, r6
    bl func_ov004_02158440
.L_0215fd4c:
    add r6, r6, #0x1
.L_0215fd50:
    bl func_ov004_0214f72c
    cmp r6, r0
    blt .L_0215fd20
    ldr r0, [r4, #0xe8]
    bl func_ov004_0215eea0
    bl func_ov004_0214f704
    mov r1, r0
    ldr r0, [r4, #0xfc]
    bl func_ov004_0215f0dc
    cmp r0, #0x0
    bge .L_0215fd94
    ldr r0, [r4, #0xc4]
    mvn r1, #0x0
    bl func_ov004_0215570c
    ldr r0, [r4, #0xc4]
    mov r1, #0x1
    bl func_ov004_02155790
.L_0215fd94:
    ldr r0, [r4, #0xec]
    ldr r1, .L_0215fdc0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0xb8]
    bl func_ov004_02155008
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215fdc8
    bl func_02028384
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0215fdbc: .word 0x3e7
.L_0215fdc0: .word func_ov004_0216024c
.L_0215fdc4: .word func_ov004_021601c0
.L_0215fdc8: .word func_ov004_021601e8
    arm_func_end func_ov004_0215fb94

    .global func_ov004_0215fdcc
    arm_func_start func_ov004_0215fdcc
func_ov004_0215fdcc: ; 0x0215fdcc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xe0]
    bl func_ov004_0215432c
    ldr r0, [r4, #0xd8]
    mov r1, #0x0
    bl func_ov004_02153b6c
    ldr r0, [r4, #0xe4]
    bl func_ov004_0215ebc4
    ldr r0, .L_0215feb8
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, [r4, #0xc4]
    mov r1, #0x0
    bl func_ov004_02155790
    ldrsh r0, [r4, #0xf4]
    rsb r0, r0, #0x258
    bl func_ov004_0214f968
    bl func_ov004_0214f65c
    bl func_ov004_0214f6a0
    cmp r0, #0x0
    beq .L_0215fe48
    ldr r0, [r4, #0xc8]
    bl func_ov004_0215692c
    mov r0, #0x7
    bl func_0207367c
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215febc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215fe48:
    ldr r0, [r4, #0xc0]
    mov r1, #0x0
    bl func_ov004_021555e8
    mov r1, #0x258
    mov r0, r4
    strh r1, [r4, #0xf4]
    bl func_ov004_0215f8ec
    ldr r0, [r4, #0xd4]
    bl func_ov004_021584a4
    ldr r0, [r4, #0xd4]
    bl func_ov004_0215845c
    bl func_ov004_0214f678
    cmp r0, #0x0
    beq .L_0215fe94
    bl func_ov004_0214f5f4
    mov r1, r0
    ldr r0, [r4, #0xc8]
    bl func_ov004_021568f0
    b .L_0215fea4
.L_0215fe94:
    bl func_ov004_0214f5f4
    mov r1, r0
    ldr r0, [r4, #0xc8]
    bl func_ov004_021568b4
.L_0215fea4:
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215fec0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215feb8: .word data_020a0e18
.L_0215febc: .word func_ov004_02160210
.L_0215fec0: .word func_ov004_0215fa88
    arm_func_end func_ov004_0215fdcc

    .global func_ov004_0215fec4
    arm_func_start func_ov004_0215fec4
func_ov004_0215fec4: ; 0x0215fec4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    ldr r0, [r4, #0xdc]
    bl func_ov004_02153368
    mov r8, r0
    ldr r0, [r4, #0xe4]
    bl func_ov004_0215ecc8
    ldr r0, [r4, #0xfc]
    mov r1, r8
    bl func_ov004_0215ef8c
    cmp r0, #0x0
    beq .L_02160088
    bl func_ov004_0214f704
    mov r1, r0
    ldr r0, [r4, #0xfc]
    bl func_ov004_0215f0dc
    cmp r8, r0
    ldr r0, [r4, #0xcc]
    bne .L_0215ff24
    bl func_ov004_02157458
    mov r0, #0x7c
    mov r1, #0x2
    bl func_0207342c
    b .L_0215ff34
.L_0215ff24:
    bl func_ov004_02157488
    mov r0, #0x7c
    mov r1, #0x3
    bl func_0207342c
.L_0215ff34:
    ldr r0, [r4, #0xfc]
    mov r1, r8
    bl func_ov004_0215efc0
    mov r9, #0x0
    ldr r7, .L_02160110
    mov r6, #0x2
    b .L_0215ffdc
.L_0215ff50:
    ldr r0, [r4, #0xfc]
    mov r1, r9
    bl func_ov004_0215f0dc
    cmp r8, r0
    bne .L_0215ffc0
    ldr r0, [r4, #0xfc]
    mov r1, r9
    bl func_ov004_0215f0f4
    ldrb r1, [r7, r0]
    mov r0, r9
    bl func_ov004_0214f7e0
    ldr r0, [r4, #0xd4]
    mov r1, r9
    mov r2, r6
    bl func_ov004_021583e8
    ldr r0, [r4, #0xfc]
    mov r1, r9
    bl func_ov004_0215f0f4
    mov r5, r0
    ldr r0, [r4, #0xfc]
    mov r1, r9
    bl func_ov004_0215f0e8
    mov r2, r5
    mov r3, r0
    ldr r0, [r4, #0xd4]
    mov r1, r9
    bl func_ov004_02158350
    b .L_0215ffd8
.L_0215ffc0:
    ldr r0, [r4, #0xd4]
    mov r1, r9
    bl func_ov004_02158488
    ldr r0, [r4, #0xd4]
    mov r1, r9
    bl func_ov004_02158440
.L_0215ffd8:
    add r9, r9, #0x1
.L_0215ffdc:
    bl func_ov004_0214f72c
    cmp r9, r0
    blt .L_0215ff50
    mov r7, #0x0
    mov r5, #0x1
    mov r6, #0x2
.L_0215fff4:
    ldr r0, [r4, #0xfc]
    mov r1, r7
    bl func_ov004_0215ef8c
    cmp r0, #0x0
    beq .L_02160020
    cmp r7, r8
    moveq r2, r6
    ldr r0, [r4, #0xe0]
    movne r2, r5
    mov r1, r7
    bl func_ov004_021544f0
.L_02160020:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0215fff4
    bl func_ov004_0214f704
    mov r1, r0
    ldr r0, [r4, #0xfc]
    bl func_ov004_0215f0dc
    cmp r8, r0
    bne .L_02160050
    ldr r0, [r4, #0xe0]
    bl func_ov004_02154400
    b .L_02160074
.L_02160050:
    ldr r0, [r4, #0xc4]
    mov r1, r8
    bl func_ov004_0215570c
    ldr r0, [r4, #0xc4]
    mov r1, #0x1
    bl func_ov004_02155790
    ldr r0, [r4, #0xe0]
    mov r1, r8
    bl func_ov004_0215446c
.L_02160074:
    ldr r0, [r4, #0x4]
    ldr r1, .L_02160114
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02160088:
    ldr r0, [r4, #0xcc]
    bl func_ov004_02157488
    ldr r0, [r4, #0xc0]
    mov r1, #0x1
    bl func_ov004_021555e8
    mov r0, #0x7c
    mov r1, #0x3
    bl func_0207342c
    mov r5, #0x0
    b .L_021600cc
.L_021600b0:
    ldr r0, [r4, #0xd4]
    mov r1, r5
    bl func_ov004_02158488
    ldr r0, [r4, #0xd4]
    mov r1, r5
    bl func_ov004_02158440
    add r5, r5, #0x1
.L_021600cc:
    bl func_ov004_0214f72c
    cmp r5, r0
    blt .L_021600b0
    ldr r0, [r4, #0xc4]
    mov r1, r8
    bl func_ov004_0215570c
    ldr r0, [r4, #0xc4]
    mov r1, #0x1
    bl func_ov004_02155790
    ldr r0, [r4, #0xe0]
    mov r1, r8
    bl func_ov004_0215446c
    ldr r0, [r4, #0x4]
    ldr r1, .L_02160118
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02160110: .word data_ov004_021605b8
.L_02160114: .word func_ov004_0216011c
.L_02160118: .word func_ov004_02160198
    arm_func_end func_ov004_0215fec4

    .global func_ov004_0216011c
    arm_func_start func_ov004_0216011c
func_ov004_0216011c: ; 0x0216011c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    mov r4, #0x0
    ldr r5, [r0, #0x10]
    b .L_02160160
.L_02160130:
    ldr r0, [r5, #0xd4]
    mov r1, r4
    bl func_ov004_02158384
    cmp r0, #0x0
    beq .L_0216015c
    mov r0, r4
    bl func_ov004_0214f7c8
    mov r2, r0
    ldr r0, [r5, #0xd4]
    mov r1, r4
    bl func_ov004_021582fc
.L_0216015c:
    add r4, r4, #0x1
.L_02160160:
    bl func_ov004_0214f72c
    cmp r4, r0
    blt .L_02160130
    ldr r0, [r5, #0xd4]
    bl func_ov004_021583a4
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0xcc]
    bl func_ov004_021574e8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov004_0215fdcc
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov004_0216011c

    .global func_ov004_02160198
    arm_func_start func_ov004_02160198
func_ov004_02160198: ; 0x02160198
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xcc]
    bl func_ov004_021574e8
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_0215fdcc
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02160198

    .global func_ov004_021601c0
    arm_func_start func_ov004_021601c0
func_ov004_021601c0: ; 0x021601c0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xd0]
    bl func_ov004_0215e980
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_0215fec4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021601c0

    .global func_ov004_021601e8
    arm_func_start func_ov004_021601e8
func_ov004_021601e8: ; 0x021601e8
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xcc]
    bl func_ov004_021574e8
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_0215fec4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_021601e8

    .global func_ov004_02160210
    arm_func_start func_ov004_02160210
func_ov004_02160210: ; 0x02160210
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x3c
    ldr r4, [r1, #0x10]
    bl func_ov004_0215f8bc
    bl func_0208730c
    mov r0, #0x4
    bl func_ov004_0215f8bc
    bl func_ov004_0214f808
    bl func_ov004_0214ce64
    mov r1, #0x8
    bl func_ov004_0214ce74
    mov r0, r4
    bl func_ov004_0215f6fc
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_02160210

    .global func_ov004_0216024c
    arm_func_start func_ov004_0216024c
func_ov004_0216024c: ; 0x0216024c
    bx lr
    arm_func_end func_ov004_0216024c

    .global func_ov004_02160250
    arm_func_start func_ov004_02160250
func_ov004_02160250: ; 0x02160250
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x10]
    mov r0, #0x258
    strb r1, [r2, #0xf6]
    strh r0, [r2, #0xf4]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02160288
    bl func_02028384
    mov r0, r4
    bl func_ov004_0216028c
    ldmia sp!, {r4, pc}
.L_02160288: .word func_ov004_0216028c
    arm_func_end func_ov004_02160250

    .global func_ov004_0216028c
    arm_func_start func_ov004_0216028c
func_ov004_0216028c: ; 0x0216028c
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r5, [r0, #0x10]
    ldrsh r0, [r5, #0xf4]
    sub r0, r0, #0x1
    strh r0, [r5, #0xf4]
    ldrsh r6, [r5, #0xf4]
    cmp r6, #0x0
    bgt .L_021602d4
    mov r0, #0x1
    strb r0, [r5, #0xf6]
    ldr r0, [r5, #0xe0]
    bl func_ov004_0215438c
    ldr r0, [r4, #0x4]
    ldr r1, .L_02160318
    bl func_02028384
    b .L_0216030c
.L_021602d4:
    mov r0, r6
    mov r1, #0x3c
    bl func_0200d12c
    mov r4, r0
    mov r0, r6
    mov r1, #0x3c
    bl func_0200d12c
    cmp r1, #0x0
    bne .L_0216030c
    cmp r4, #0x4
    bgt .L_0216030c
    mov r0, #0x7c
    mov r1, #0x4
    bl func_0207342c
.L_0216030c:
    mov r0, r5
    bl func_ov004_0215f8ec
    ldmia sp!, {r4, r5, r6, pc}
.L_02160318: .word func_ov004_0216024c
    arm_func_end func_ov004_0216028c

    .global func_ov004_0216031c
    arm_func_start func_ov004_0216031c
func_ov004_0216031c: ; 0x0216031c
    stmdb sp!, {r4, lr}
    ldr r1, .L_02160358
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    ldr r4, [r2, #0x10]
    add r0, r0, #0x1
    str r0, [r1, #0x0]
    bl func_020882c4
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02088290
    bl func_02086c94
    mov r0, r4
    bl func_ov004_0215f6fc
    ldmia sp!, {r4, pc}
.L_02160358: .word data_020a0f10
    arm_func_end func_ov004_0216031c

    .global func_ov004_0216035c
    arm_func_start func_ov004_0216035c
func_ov004_0216035c: ; 0x0216035c
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x4]
    mov r0, r1
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x70000007
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov004_0215f6fc
    ldmia sp!, {r4, pc}
    arm_func_end func_ov004_0216035c

    .section .rodata, 4, 1, 4
data_ov004_0216038c:
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214cd20
    .word func_ov004_02153120
    .word func_ov004_021592b0
    .word func_ov004_0215ab94
    .word func_ov004_0215da38
    .word func_ov004_02153188
    .word func_ov004_0215f194
    .word func_ov004_0215cf24
    .word func_ov004_0215a128
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021603b8:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov004_021603c4:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov004_021603d0:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x62, 0x67, 0x2e, 0x6e, 0x63
    .byte 0x6c, 0x00, 0x00, 0x00
data_ov004_021603e4:
    .byte 0x0a, 0x00, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
data_ov004_021603f0:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021603f4:
    .byte 0xdf, 0x08, 0xdf, 0x08, 0xdf, 0x08, 0x6f, 0x04, 0x6f, 0x04, 0x6f, 0x04, 0x40, 0x00, 0x00, 0x00
    .byte 0x80, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
data_ov004_02160410:
    .byte 0x06, 0xc3, 0x00, 0x01, 0x12, 0xc3, 0x00, 0x01, 0x1e, 0xc3, 0x00, 0x01, 0x2a, 0xc3, 0x00, 0x01
    .byte 0x36, 0xc3, 0x00, 0x01, 0x42, 0xc3, 0x00, 0x01, 0x4e, 0xc3, 0x00, 0x01, 0x5a, 0xc3, 0x00, 0x01
    .byte 0x66, 0xc3, 0x00, 0x01, 0x74, 0xc3, 0x01, 0x01, 0x7b, 0xc9, 0x02, 0x01, 0x7b, 0xd6, 0x03, 0x01
    .byte 0x7b, 0xe2, 0x03, 0x01, 0x7b, 0xee, 0x03, 0x01, 0x7b, 0xfa, 0x03, 0x01, 0x7b, 0x06, 0x03, 0x01
    .byte 0x7b, 0x12, 0x03, 0x01, 0x7b, 0x1e, 0x03, 0x01, 0x7b, 0x2a, 0x03, 0x01, 0x7b, 0x37, 0x04, 0x01
    .byte 0x74, 0x3d, 0x05, 0x02, 0x66, 0x3d, 0x00, 0x02, 0x5a, 0x3d, 0x00, 0x02, 0x4e, 0x3d, 0x00, 0x02
    .byte 0x42, 0x3d, 0x00, 0x02, 0x36, 0x3d, 0x00, 0x02, 0x2a, 0x3d, 0x00, 0x02, 0x1e, 0x3d, 0x00, 0x02
    .byte 0x12, 0x3d, 0x00, 0x02, 0x06, 0x3d, 0x00, 0x02, 0xfa, 0x3d, 0x00, 0x02, 0xee, 0x3d, 0x00, 0x02
    .byte 0xe2, 0x3d, 0x00, 0x02, 0xd6, 0x3d, 0x00, 0x02, 0xca, 0x3d, 0x00, 0x02, 0xbe, 0x3d, 0x00, 0x02
    .byte 0xb2, 0x3d, 0x00, 0x02, 0xa6, 0x3d, 0x00, 0x02, 0x9a, 0x3d, 0x00, 0x02, 0x8c, 0x3d, 0x06, 0x02
    .byte 0x85, 0x37, 0x07, 0x03, 0x85, 0x2a, 0x03, 0x03, 0x85, 0x1e, 0x03, 0x03, 0x85, 0x12, 0x03, 0x03
    .byte 0x85, 0x06, 0x03, 0x03, 0x85, 0xfa, 0x03, 0x03, 0x85, 0xee, 0x03, 0x03, 0x85, 0xe2, 0x03, 0x03
    .byte 0x85, 0xd6, 0x03, 0x03, 0x85, 0xc9, 0x08, 0x03, 0x8c, 0xc3, 0x09, 0x03, 0x9a, 0xc3, 0x00, 0x03
    .byte 0xa6, 0xc3, 0x00, 0x03, 0xb2, 0xc3, 0x00, 0x03, 0xbe, 0xc3, 0x00, 0x03, 0xca, 0xc3, 0x00, 0x03
    .byte 0xd6, 0xc3, 0x00, 0x03, 0xe2, 0xc3, 0x00, 0x03, 0xee, 0xc3, 0x00, 0x03, 0xfa, 0xc3, 0x00, 0x03
data_ov004_02160500:
    .byte 0x00, 0x00, 0x39, 0x0b, 0xf6, 0x18, 0x03, 0xf6, 0x0e, 0x13, 0xf6, 0x0e, 0x1f, 0xf6, 0x0e, 0x00
data_ov004_02160510:
    .byte 0x00, 0x00, 0x7f, 0x03, 0xf0, 0x7e, 0xfe, 0xf0, 0x7e, 0x08, 0xf0, 0x7e, 0x0f, 0xf0, 0x7e, 0x00
data_ov004_02160520:
    .byte 0x17, 0x00, 0x18, 0x00, 0x29, 0x00, 0x06, 0x00, 0x24, 0x00, 0x22, 0x00, 0x13, 0x00, 0x20, 0x00
    .byte 0x10, 0x00, 0x07, 0x00
data_ov004_02160534:
    .byte 0xe8, 0xff, 0xfc, 0xff, 0x18, 0x00, 0xfc, 0xff, 0x48, 0x00, 0xfc, 0xff, 0xe8, 0xff, 0x0e, 0x00
    .byte 0x18, 0x00, 0x0e, 0x00, 0x48, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x3c, 0x00, 0x00, 0x00
data_ov004_0216055c:
    .byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
data_ov004_02160568:
    .byte 0xe9, 0x30, 0xa4, 0x30, 0xd0, 0x30, 0xeb, 0x30, 0x31, 0x00, 0x50, 0x00, 0x00, 0x00, 0xe9, 0x30
    .byte 0xa4, 0x30, 0xd0, 0x30, 0xeb, 0x30, 0x32, 0x00, 0x50, 0x00, 0x00, 0x00, 0xe9, 0x30, 0xa4, 0x30
    .byte 0xd0, 0x30, 0xeb, 0x30, 0x33, 0x00, 0x50, 0x00, 0x00, 0x00, 0xe9, 0x30, 0xa4, 0x30, 0xd0, 0x30
    .byte 0xeb, 0x30, 0x34, 0x00, 0x50, 0x00, 0x00, 0x00
data_ov004_021605a0:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021605a4:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021605a8:
    .byte 0xd0, 0xff, 0xff, 0xff, 0x30, 0x01, 0x00, 0x00
data_ov004_021605b0:
    .byte 0x68, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00
data_ov004_021605b8:
    .byte 0x05, 0x03, 0x02, 0x01
    .section .init, 4, 1, 4
    .global __sinit_ov004_021605bc
    arm_func_start __sinit_ov004_021605bc
__sinit_ov004_021605bc: ; 0x021605bc
    stmdb sp!, {r3, lr}
    mov ip, #0x40
    ldr r0, .L_021605e0
    sub r1, ip, #0x64
    sub r2, ip, #0x7c
    mov r3, #0x24
    str ip, [sp, #0x0]
    bl func_ov004_0214e6e4
    ldmia sp!, {r3, pc}
.L_021605e0: .word data_ov004_02160b80
    arm_func_end __sinit_ov004_021605bc

    .global __sinit_ov004_021605e4
    arm_func_start __sinit_ov004_021605e4
__sinit_ov004_021605e4: ; 0x021605e4
    stmdb sp!, {r3, lr}
    mov ip, #0x2d
    ldr r0, .L_02160624
    sub r1, ip, #0x73
    sub r2, ip, #0x5b
    mov r3, #0x44
    str ip, [sp, #0x0]
    bl func_ov004_0214e6e4
    mov ip, #0x8
    ldr r0, .L_02160628
    sub r1, ip, #0x4b
    sub r2, ip, #0x11
    mov r3, #0x41
    str ip, [sp, #0x0]
    bl func_ov004_0214e6e4
    ldmia sp!, {r3, pc}
.L_02160624: .word data_ov004_0216120c
.L_02160628: .word data_ov004_02161214
    arm_func_end __sinit_ov004_021605e4

    .global __sinit_ov004_0216062c
    thumb_func_start __sinit_ov004_0216062c
__sinit_ov004_0216062c: ; 0x0216062c
    push {r3, lr}
    sub sp, sp, #0xa8
    add r0, sp, #0x9c
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0xa0
    mov r1, #0x8
    blx func_ov004_0215ccc0
    add r0, sp, #0xa4
    mov r1, #0x80
    blx func_ov004_0215ccc0
    ldr r0, .L_02160840
    add r1, sp, #0xa4
    add r2, sp, #0xa0
    add r3, sp, #0x9c
    blx func_ov004_0215cca4
    add r0, sp, #0x90
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x94
    mov r1, #0x24
    blx func_ov004_0215ccc0
    add r0, sp, #0x98
    mov r1, #0x80
    blx func_ov004_0215ccc0
    ldr r0, .L_02160844
    add r1, sp, #0x98
    add r2, sp, #0x94
    add r3, sp, #0x90
    blx func_ov004_0215cca4
    add r0, sp, #0x84
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x88
    mov r1, #0x4c
    blx func_ov004_0215ccc0
    add r0, sp, #0x8c
    mov r1, #0x80
    blx func_ov004_0215ccc0
    ldr r0, .L_02160848
    add r1, sp, #0x8c
    add r2, sp, #0x88
    add r3, sp, #0x84
    blx func_ov004_0215cca4
    add r0, sp, #0x78
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x7c
    mov r1, #0x74
    blx func_ov004_0215ccc0
    add r0, sp, #0x80
    mov r1, #0x80
    blx func_ov004_0215ccc0
    ldr r0, .L_0216084c
    add r1, sp, #0x80
    add r2, sp, #0x7c
    add r3, sp, #0x78
    blx func_ov004_0215cca4
    add r0, sp, #0x6c
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x70
    mov r1, #0x9c
    blx func_ov004_0215ccc0
    add r0, sp, #0x74
    mov r1, #0x80
    blx func_ov004_0215ccc0
    ldr r0, .L_02160850
    add r1, sp, #0x74
    add r2, sp, #0x70
    add r3, sp, #0x6c
    blx func_ov004_0215cca4
    add r0, sp, #0x60
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x64
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x68
    mov r1, #0x0
    blx func_ov004_0215ccc0
    ldr r0, .L_02160854
    add r1, sp, #0x68
    add r2, sp, #0x64
    add r3, sp, #0x60
    blx func_ov004_0215cca4
    add r0, sp, #0x54
    mov r1, #0x0
    blx func_ov004_0215ccc0
    mov r1, #0xf
    add r0, sp, #0x58
    mvn r1, r1
    blx func_ov004_0215ccc0
    add r0, sp, #0x5c
    mov r1, #0x48
    blx func_ov004_0215ccc0
    ldr r0, .L_02160858
    add r1, sp, #0x5c
    add r2, sp, #0x58
    add r3, sp, #0x54
    blx func_ov004_0215cca4
    add r0, sp, #0x48
    mov r1, #0x0
    blx func_ov004_0215ccc0
    mov r1, #0x8
    add r0, sp, #0x4c
    mvn r1, r1
    blx func_ov004_0215ccc0
    mov r1, #0x2b
    add r0, sp, #0x50
    mvn r1, r1
    blx func_ov004_0215ccc0
    ldr r0, .L_0216085c
    add r1, sp, #0x50
    add r2, sp, #0x4c
    add r3, sp, #0x48
    blx func_ov004_0215cca4
    add r0, sp, #0x3c
    mov r1, #0x0
    blx func_ov004_0215ccc0
    mov r1, #0x7
    add r0, sp, #0x40
    mvn r1, r1
    blx func_ov004_0215ccc0
    mov r1, #0x43
    add r0, sp, #0x44
    mvn r1, r1
    blx func_ov004_0215ccc0
    ldr r0, .L_02160860
    add r1, sp, #0x44
    add r2, sp, #0x40
    add r3, sp, #0x3c
    blx func_ov004_0215cca4
    add r0, sp, #0x30
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x34
    mov r1, #0x0
    blx func_ov004_0215ccc0
    mov r1, #0x4b
    add r0, sp, #0x38
    mvn r1, r1
    blx func_ov004_0215ccc0
    ldr r0, .L_02160864
    add r1, sp, #0x38
    add r2, sp, #0x34
    add r3, sp, #0x30
    blx func_ov004_0215cca4
    add r0, sp, #0x24
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x28
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x2c
    mov r1, #0x37
    blx func_ov004_0215ccc0
    ldr r0, .L_02160868
    add r1, sp, #0x2c
    add r2, sp, #0x28
    add r3, sp, #0x24
    blx func_ov004_0215cca4
    add r0, sp, #0x18
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x1c
    mov r1, #0x0
    blx func_ov004_0215ccc0
    add r0, sp, #0x20
    mov r1, #0x62
    blx func_ov004_0215ccc0
    ldr r0, .L_0216086c
    add r1, sp, #0x20
    add r2, sp, #0x1c
    add r3, sp, #0x18
    blx func_ov004_0215cca4
    add r0, sp, #0xc
    mov r1, #0x0
    blx func_ov004_0215ccc0
    mov r1, #0x8
    add r0, sp, #0x10
    mvn r1, r1
    blx func_ov004_0215ccc0
    mov r1, #0x31
    add r0, sp, #0x14
    mvn r1, r1
    blx func_ov004_0215ccc0
    ldr r0, .L_02160870
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    blx func_ov004_0215cca4
    add r0, sp, #0x0
    mov r1, #0x0
    blx func_ov004_0215ccc0
    mov r1, #0x8
    add r0, sp, #0x4
    mvn r1, r1
    blx func_ov004_0215ccc0
    mov r1, #0x15
    add r0, sp, #0x8
    mvn r1, r1
    blx func_ov004_0215ccc0
    ldr r0, .L_02160874
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    blx func_ov004_0215cca4
    add sp, #0xa8
    pop {r3, pc}
.L_02160840: .word data_ov004_02161674
.L_02160844: .word data_ov004_02161680
.L_02160848: .word data_ov004_0216168c
.L_0216084c: .word data_ov004_02161698
.L_02160850: .word data_ov004_021616a4
.L_02160854: .word data_ov004_021616b0
.L_02160858: .word data_ov004_021616bc
.L_0216085c: .word data_ov004_021616c8
.L_02160860: .word data_ov004_021616d4
.L_02160864: .word data_ov004_021616e0
.L_02160868: .word data_ov004_021616ec
.L_0216086c: .word data_ov004_021616f8
.L_02160870: .word data_ov004_02161704
.L_02160874: .word data_ov004_02161710
    thumb_func_end __sinit_ov004_0216062c

    .section .ctor, 4, 1, 4
.p__sinit_ov004_021605bc:
    .word __sinit_ov004_021605bc
.p__sinit_ov004_021605e4:
    .word __sinit_ov004_021605e4
.p__sinit_ov004_0216062c:
    .word __sinit_ov004_0216062c
    .section .data, 4, 1, 4
data_ov004_021608a0:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x5f, 0x41, 0x64, 0x64, 0x5f, 0x43, 0x6f, 0x72, 0x65, 0x00, 0x00
data_ov004_021608b0:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov004_021608bc:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021608c4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021608cc:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021608d4:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov004_021608e4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov004_021608f4:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6c, 0x6c, 0x69, 0x73, 0x69, 0x6f, 0x6e, 0x2e, 0x69, 0x6e, 0x6c, 0x00
data_ov004_02160904:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov004_02160918:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov004_0216092c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6d, 0x6e, 0x5f, 0x42, 0x61, 0x73, 0x65, 0x42, 0x47, 0x5f
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_0216094c:
    .word func_ov004_0214ef70
    .word func_ov004_0214ef84
    .word func_ov004_0214eef8
    .word func_0201c8a0
    .word func_ov004_0214e468
    .word func_ov012_021b0f50
    .word func_ov004_0214ef58
    .word func_0202f668
    .word func_ov004_0214ef24
    .word func_ov004_0214ce14
    .word func_ov004_0214ef1c
    .word func_ov004_0214ef14
    .word func_ov004_0214ef44
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov004_0214ef3c
    .word func_ov004_0214ef2c
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214ef0c
    .word func_ov004_0214ef4c
    .word func_ov004_0214ef60
data_ov004_021609b8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021609c8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021609d8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021609e8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021609f8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02160a08:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02160a18:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02160a28:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02160a38:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02160a48:
    .word data_ov004_02160a4c
data_ov004_02160a4c:
    .byte 0x83, 0x57, 0x83, 0x83, 0x83, 0x93, 0x83, 0x76, 0x91, 0x53, 0x94, 0xca, 0x00, 0x00, 0x00, 0x00
data_ov004_02160a5c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x57, 0x6f, 0x72, 0x6b, 0x5f
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160a74:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x57, 0x6f, 0x72, 0x6b, 0x5f
    .byte 0x51, 0x75, 0x69, 0x7a, 0x5f, 0x53, 0x68, 0x75, 0x66, 0x66, 0x6c, 0x65, 0x5f, 0x43, 0x6f, 0x72
    .byte 0x65, 0x00, 0x00, 0x00
data_ov004_02160a98:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x57, 0x6f, 0x72, 0x6b, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov004_02160aac:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x70, 0x61, 0x63, 0x6b
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov004_02160ac4:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02160ad8:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2e, 0x62, 0x69, 0x6e, 0x00
data_ov004_02160ae8:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x64, 0x73, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
data_ov004_02160af8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160b00:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x53, 0x63, 0x6f, 0x72, 0x65
    .byte 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov004_02160b20:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x53, 0x63, 0x6f, 0x72, 0x65
    .byte 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160b38:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x43
    .byte 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_02160b54:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov004_02160b68:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160b70:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160b78:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160b80:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214ef70
    .word func_ov004_0214ef84
    .word func_ov004_0214eef8
    .word func_0201c8a0
    .word func_ov004_0214e468
    .word func_ov012_021b0f50
    .word func_ov004_0214ef58
    .word func_0202f668
    .word func_ov004_0214ef24
    .word func_ov004_0214ce14
    .word func_ov004_0214ef1c
    .word func_ov004_0214ef14
    .word func_ov004_0214ef44
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov004_0214ef3c
    .word func_ov004_0214ef2c
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214ef0c
    .word func_ov004_0214ef4c
    .word func_ov004_0214ef60
data_ov004_02160bfc:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x54, 0x6f, 0x70, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov004_02160c0c:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov004_02160c1c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x54, 0x6f, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160c2c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x74, 0x6f, 0x70, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov004_02160c3c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x74, 0x6f, 0x70, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov004_02160c4c:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02160c60:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x33, 0x64
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov004_02160c78:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02160c84:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160c8c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160c94:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x53, 0x74, 0x61, 0x72, 0x74, 0x42, 0x61, 0x63, 0x6b, 0x50, 0x6c
    .byte 0x61, 0x74, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_02160cb4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x53, 0x74, 0x61, 0x72, 0x74, 0x42, 0x61, 0x63, 0x6b, 0x50, 0x6c
    .byte 0x61, 0x74, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02160ccc:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov004_02160ce4:
    .byte 0x4a, 0x41, 0x72, 0x65, 0x6e, 0x61, 0x2f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f, 0x6e
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov004_02160cfc:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x5f, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x69, 0x6f
    .byte 0x6e, 0x30, 0x30, 0x2e, 0x6e, 0x63, 0x6c, 0x00
data_ov004_02160d14:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160d1c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02160d28:
    .byte 0x32, 0x44, 0x52, 0x6f, 0x74, 0x00, 0x00, 0x00
data_ov004_02160d30:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x53, 0x74, 0x61, 0x72, 0x74, 0x43, 0x6f, 0x72, 0x65, 0x5f, 0x41
    .byte 0x64, 0x64, 0x00, 0x00
data_ov004_02160d44:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x53, 0x74, 0x61, 0x72, 0x74, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65
    .byte 0x50, 0x6c, 0x61, 0x79, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160d60:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02160d74:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x32, 0x64
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov004_02160d8c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02160d98:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160da0:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x5f
    .byte 0x4c, 0x69, 0x73, 0x74, 0x52, 0x61, 0x6e, 0x64, 0x6f, 0x6d, 0x4d, 0x69, 0x78, 0x00, 0x00, 0x00
data_ov004_02160dc0:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x41
    .byte 0x6e, 0x73, 0x77, 0x65, 0x72, 0x4d, 0x69, 0x78, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72
    .byte 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov004_02160de8:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov004_02160dfc:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160e04:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x65, 0x78, 0x74, 0x51, 0x44, 0x69
    .byte 0x73, 0x70, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160e24:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x65, 0x78, 0x74, 0x51, 0x44, 0x69
    .byte 0x73, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_02160e3c:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x5f, 0x71, 0x2e, 0x61
    .byte 0x66, 0x74, 0x00, 0x00
data_ov004_02160e50:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x69, 0x6d, 0x67, 0x2f, 0x00, 0x00
data_ov004_02160e5c:
    .byte 0x2e, 0x64, 0x74, 0x78, 0x00, 0x00, 0x00, 0x00
data_ov004_02160e64:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x69, 0x6d, 0x67, 0x2f, 0x64, 0x6e, 0x30, 0x30, 0x2e, 0x64
    .byte 0x74, 0x78, 0x00, 0x00
data_ov004_02160e78:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160e80:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x75, 0x62, 0x53, 0x63, 0x72, 0x65
    .byte 0x65, 0x6e, 0x50, 0x6c, 0x61, 0x74, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65
    .byte 0x61, 0x74, 0x65, 0x00
data_ov004_02160ea4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x75, 0x62, 0x53, 0x63, 0x72, 0x65
    .byte 0x65, 0x6e, 0x50, 0x6c, 0x61, 0x74, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02160ec0:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02160ecc:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160ed4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x47, 0x61, 0x75
    .byte 0x67, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160ef4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x47, 0x61, 0x75
    .byte 0x67, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_02160f0c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x47, 0x61, 0x75
    .byte 0x67, 0x65, 0x42, 0x47, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_02160f30:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x47, 0x61, 0x75
    .byte 0x67, 0x65, 0x42, 0x47, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02160f4c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x50, 0x6c, 0x61
    .byte 0x74, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02160f6c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x54, 0x69, 0x6d, 0x65, 0x50, 0x6c, 0x61
    .byte 0x74, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_02160f84:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x41, 0x6e, 0x73, 0x77, 0x65, 0x72, 0x4d
    .byte 0x61, 0x73, 0x6b, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_02160fa4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x51, 0x75, 0x65, 0x73, 0x74, 0x69, 0x6f
    .byte 0x6e, 0x4d, 0x61, 0x73, 0x6b, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74
    .byte 0x65, 0x00, 0x00, 0x00
data_ov004_02160fc8:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x51, 0x75, 0x65, 0x73, 0x74, 0x69, 0x6f
    .byte 0x6e, 0x4d, 0x61, 0x73, 0x6b, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov004_02160fe4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x42, 0x6c, 0x61, 0x63, 0x6b, 0x42, 0x65
    .byte 0x6c, 0x74, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161004:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x42, 0x6c, 0x61, 0x63, 0x6b, 0x42, 0x65
    .byte 0x6c, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_0216101c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161024:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x51, 0x75, 0x69, 0x7a, 0x4e, 0x6f, 0x53
    .byte 0x6d, 0x61, 0x6c, 0x6c, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_02161048:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x51, 0x75, 0x69, 0x7a, 0x4e, 0x6f, 0x53
    .byte 0x6d, 0x61, 0x6c, 0x6c, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02161064:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02161070:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02161078:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161080:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x51, 0x75, 0x69, 0x7a, 0x4e, 0x6f, 0x44
    .byte 0x69, 0x73, 0x70, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_021610a0:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x51, 0x75, 0x69, 0x7a, 0x4e, 0x6f, 0x44
    .byte 0x69, 0x73, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_021610b8:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_021610c4:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_021610cc:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x44
    .byte 0x69, 0x73, 0x70, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_021610ec:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x44
    .byte 0x69, 0x73, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02161104:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02161110:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02161118:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65, 0x53
    .byte 0x63, 0x6f, 0x72, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_0216113c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65, 0x53
    .byte 0x63, 0x6f, 0x72, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02161158:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x4d, 0x75, 0x6c, 0x74, 0x69, 0x53, 0x63
    .byte 0x6f, 0x72, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_02161178:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x4d, 0x75, 0x6c
data_ov004_02161184: ; ambiguous
    .byte 0x74, 0x69, 0x53, 0x63, 0x6f, 0x72, 0x65, 0x4f, 0x6e, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_0216119c:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x4d, 0x75, 0x6c, 0x74, 0x69, 0x53, 0x63
    .byte 0x6f, 0x72, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_021611b4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021611bc:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x4d, 0x75, 0x6c, 0x74, 0x69, 0x52, 0x61
    .byte 0x6e, 0x6b, 0x46, 0x75, 0x6b, 0x69, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov004_021611e0:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x4d, 0x75, 0x6c, 0x74, 0x69, 0x52, 0x61
    .byte 0x6e, 0x6b, 0x46, 0x75, 0x6b, 0x69, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_021611fc:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161204:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_0216120c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02161214:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214ef70
    .word func_ov004_0214ef84
    .word func_ov004_0214eef8
    .word func_0201c8a0
    .word func_ov004_0214e468
    .word func_ov012_021b0f50
    .word func_ov004_0214ef58
    .word func_0202f668
    .word func_ov004_0214ef24
    .word func_ov004_0214ce14
    .word func_ov004_0214ef1c
    .word func_ov004_0214ef14
    .word func_ov004_0214ef44
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov004_0214ef3c
    .word func_ov004_0214ef2c
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214ef0c
    .word func_ov004_0214ef4c
    .word func_ov004_0214ef60
data_ov004_02161290:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65, 0x50
    .byte 0x61, 0x75, 0x73, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021612b4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65, 0x50
    .byte 0x61, 0x75, 0x73, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_021612d0:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_021612d8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021612e0:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65, 0x50
    .byte 0x6c, 0x61, 0x79, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov004_021612f8:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x69, 0x6e, 0x67, 0x6c, 0x65, 0x50
    .byte 0x6c, 0x61, 0x79, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02161310:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_02161324:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_02161338:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x5f, 0x62, 0x2e, 0x61
    .byte 0x74, 0x6d, 0x00, 0x00
data_ov004_0216134c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x5f, 0x62, 0x2e, 0x64
    .byte 0x69, 0x67, 0x00, 0x00
data_ov004_02161360:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02161374:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x61
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov004_0216138c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x62
    .byte 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov004_021613a4:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x70, 0x6f, 0x73, 0x65, 0x5f
    .byte 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov004_021613bc:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x4d, 0x6f, 0x64, 0x65
    .byte 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov004_021613d4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4a, 0x47, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x4d, 0x6f, 0x64, 0x65
    .byte 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_021613ec:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021613f4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x57, 0x69, 0x6e, 0x4c, 0x6f
    .byte 0x73, 0x65, 0x50, 0x6c, 0x61, 0x74, 0x65, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65
    .byte 0x61, 0x74, 0x65, 0x00
data_ov004_02161418:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x57, 0x69, 0x6e, 0x4c, 0x6f
    .byte 0x73, 0x65, 0x50, 0x6c, 0x61, 0x74, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02161434:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x5f, 0x77, 0x69, 0x6e, 0x30, 0x30, 0x2e, 0x61, 0x74
    .byte 0x6d, 0x00, 0x00, 0x00
data_ov004_02161448:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x5f, 0x77, 0x69, 0x6e, 0x30, 0x30, 0x2e, 0x64, 0x69
    .byte 0x67, 0x00, 0x00, 0x00
data_ov004_0216145c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x5f, 0x77, 0x69, 0x6e, 0x5f, 0x6f, 0x62, 0x6a, 0x5f
    .byte 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov004_02161474:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x5f, 0x6c, 0x6f, 0x73, 0x73, 0x30, 0x30, 0x2e, 0x61
    .byte 0x74, 0x6d, 0x00, 0x00
data_ov004_02161488:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x5f, 0x6c, 0x6f, 0x73, 0x73, 0x30, 0x30, 0x2e, 0x64
    .byte 0x69, 0x67, 0x00, 0x00
data_ov004_0216149c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x5f, 0x6c, 0x6f, 0x73, 0x73, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov004_021614b4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x53, 0x63, 0x6f, 0x72, 0x65
    .byte 0x44, 0x69, 0x73, 0x70, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021614d8:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x53, 0x63, 0x6f, 0x72, 0x65
    .byte 0x44, 0x69, 0x73, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_021614f4:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_021614fc:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x4a, 0x50, 0x6f, 0x77, 0x65
    .byte 0x72, 0x47, 0x72, 0x61, 0x70, 0x68, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov004_02161520:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x4a, 0x50, 0x6f, 0x77, 0x65
    .byte 0x72, 0x47, 0x72, 0x61, 0x70, 0x68, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_0216153c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161544:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_0216154c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161554:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x53, 0x69, 0x6e, 0x67, 0x6c
    .byte 0x65, 0x50, 0x6c, 0x61, 0x79, 0x5f, 0x41, 0x64, 0x64, 0x5f, 0x43, 0x6f, 0x72, 0x65, 0x00, 0x00
data_ov004_02161574:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x53, 0x69, 0x6e, 0x67, 0x6c
    .byte 0x65, 0x50, 0x6c, 0x61, 0x79, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov004_02161590:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x30, 0x30, 0x2e, 0x61
    .byte 0x74, 0x6d, 0x00, 0x00
data_ov004_021615a4:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x30, 0x30, 0x2e, 0x64
    .byte 0x69, 0x67, 0x00, 0x00
data_ov004_021615b8:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x61, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov004_021615d4:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x64, 0x69, 0x72, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x32, 0x64
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov004_021615ec:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_021615f8:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02161600:
    .byte 0x53, 0x63, 0x61, 0x6c, 0x65, 0x2e, 0x79, 0x00
data_ov004_02161608:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x78, 0x00, 0x00
data_ov004_02161614:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_0216161c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161624:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_0216162c:
    .byte 0x41, 0x4c, 0x4e, 0x6f, 0x64, 0x65, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00
data_ov004_02161638:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov004_0216164c:
    .byte 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x52, 0x61, 0x6e, 0x6b, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74
    .byte 0x65, 0x00, 0x00, 0x00
data_ov004_02161660:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov004_02161674:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02161680:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_0216168c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02161698:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616a4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616b0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616bc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616c8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616d4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616e0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616ec:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_021616f4:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021616f8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02161704:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_02161710:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov004_0216171c:
    .byte 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x52, 0x61, 0x6e, 0x6b, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_0216172c:
    .byte 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02161740:
    .byte 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f, 0x72, 0x61
    .byte 0x6e, 0x6b, 0x5f, 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov004_0216175c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02161768:
    .byte 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f, 0x72, 0x61
    .byte 0x6e, 0x6b, 0x00, 0x00
data_ov004_0216177c:
    .byte 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x2f, 0x74, 0x5f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f
    .byte 0x72, 0x61, 0x6e, 0x6b, 0x2e, 0x6e, 0x63, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov004_02161798:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x00
data_ov004_021617a0:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x63, 0x6f, 0x6d, 0x5f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74
    .byte 0x30, 0x30, 0x5f, 0x62, 0x00, 0x00, 0x00, 0x00
data_ov004_021617b8:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x62, 0x67, 0x2e, 0x6e, 0x63
    .byte 0x6c, 0x00, 0x00, 0x00
data_ov004_021617cc:
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov004_021617d4:
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov004_021617dc:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x44, 0x53, 0x46, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74, 0x00
data_ov004_021617ec:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021617f4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x4d, 0x75, 0x6c, 0x74, 0x69
    .byte 0x50, 0x6c, 0x61, 0x79, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00, 0x00
data_ov004_02161810:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x52, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x4d, 0x75, 0x6c, 0x74, 0x69
    .byte 0x50, 0x6c, 0x61, 0x79, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_0216182c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x30, 0x30, 0x2e, 0x61
    .byte 0x74, 0x6d, 0x00, 0x00
data_ov004_02161840:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x30, 0x30, 0x2e, 0x64
    .byte 0x69, 0x67, 0x00, 0x00
data_ov004_02161854:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02161868:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x5f, 0x6f, 0x62, 0x6a
    .byte 0x5f, 0x61, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov004_02161884:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x63, 0x6f, 0x6d, 0x5f, 0x72, 0x65, 0x73, 0x75, 0x6c, 0x74
    .byte 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x61, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov004_021618a4:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_021618b0:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_021618b8:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021618bc:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021618c4:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_021618cc:
    .byte 0x82, 0x53, 0x88, 0xca, 0x81, 0x40, 0x81, 0x46, 0x81, 0x40, 0x82, 0x50, 0x83, 0x7c, 0x83, 0x43
    .byte 0x83, 0x93, 0x83, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov004_021618e4:
    .byte 0x91, 0x81, 0x82, 0xad, 0x90, 0xb3, 0x89, 0xf0, 0x82, 0xb5, 0x82, 0xbd, 0x8f, 0x87, 0x94, 0xd4
    .byte 0x82, 0xc9, 0x81, 0x41, 0x00, 0x00, 0x00, 0x00
data_ov004_021618fc:
    .byte 0x82, 0x50, 0x88, 0xca, 0x81, 0x40, 0x81, 0x46, 0x81, 0x40, 0x82, 0x54, 0x83, 0x7c, 0x83, 0x43
    .byte 0x83, 0x93, 0x83, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov004_02161914:
    .byte 0x82, 0x51, 0x88, 0xca, 0x81, 0x40, 0x81, 0x46, 0x81, 0x40, 0x82, 0x52, 0x83, 0x7c, 0x83, 0x43
    .byte 0x83, 0x93, 0x83, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov004_0216192c:
    .byte 0x82, 0x52, 0x88, 0xca, 0x81, 0x40, 0x81, 0x46, 0x81, 0x40, 0x82, 0x51, 0x83, 0x7c, 0x83, 0x43
    .byte 0x83, 0x93, 0x83, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov004_02161944:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x52, 0x75, 0x6c, 0x65, 0x44
    .byte 0x69, 0x73, 0x70, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov004_0216195c:
    .byte 0x83, 0x7c, 0x83, 0x43, 0x83, 0x93, 0x83, 0x67, 0x82, 0xaa, 0x89, 0xc1, 0x8e, 0x5a, 0x82, 0xb3
    .byte 0x82, 0xea, 0x82, 0xe9, 0x82, 0xbc, 0x81, 0x49, 0x81, 0x49, 0x00, 0x00
data_ov004_02161978:
    .byte 0x91, 0x81, 0x89, 0x9f, 0x82, 0xb5, 0x83, 0x4e, 0x83, 0x43, 0x83, 0x59, 0x83, 0x6f, 0x83, 0x67
    .byte 0x83, 0x8b, 0x81, 0x79, 0x82, 0x53, 0x90, 0x6c, 0x91, 0xce, 0x90, 0xed, 0x81, 0x7a, 0x00, 0x00
data_ov004_02161998:
    .byte 0x91, 0x81, 0x89, 0x9f, 0x82, 0xb5, 0x83, 0x4e, 0x83, 0x43, 0x83, 0x59, 0x83, 0x6f, 0x83, 0x67
    .byte 0x83, 0x8b, 0x81, 0x79, 0x82, 0x51, 0x90, 0x6c, 0x91, 0xce, 0x90, 0xed, 0x81, 0x7a, 0x00, 0x00
data_ov004_021619b8:
    .byte 0x91, 0x81, 0x89, 0x9f, 0x82, 0xb5, 0x83, 0x4e, 0x83, 0x43, 0x83, 0x59, 0x83, 0x6f, 0x83, 0x67
    .byte 0x83, 0x8b, 0x81, 0x79, 0x82, 0x52, 0x90, 0x6c, 0x91, 0xce, 0x90, 0xed, 0x81, 0x7a, 0x00, 0x00
data_ov004_021619d8:
    .byte 0x95, 0x73, 0x90, 0xb3, 0x89, 0xf0, 0x82, 0xa9, 0x8e, 0x9e, 0x8a, 0xd4, 0x90, 0xd8, 0x82, 0xea
    .byte 0x82, 0xcd, 0x82, 0x4f, 0x83, 0x7c, 0x83, 0x43, 0x83, 0x93, 0x83, 0x67, 0x82, 0xbe, 0x81, 0x42
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_021619fc:
    .byte 0x82, 0x51, 0x82, 0x4f, 0x96, 0xe2, 0x93, 0x9a, 0x82, 0xa6, 0x82, 0xc4, 0x81, 0x41, 0x82, 0x50
    .byte 0x88, 0xca, 0x82, 0xf0, 0x96, 0xda, 0x8e, 0x77, 0x82, 0xb7, 0x82, 0xcc, 0x82, 0xbe, 0x81, 0x49
    .byte 0x81, 0x49, 0x00, 0x00
data_ov004_02161a20:
    .word data_ov004_02161998
    .word data_ov004_021618e4
    .word data_ov004_0216195c
    .word data_ov004_021618fc
    .word data_ov004_02161914
    .word data_ov004_021619d8
    .word data_ov004_021619fc
    .word data_ov004_021618b8
    .word data_ov004_021618b8
    .word data_ov004_021619b8
    .word data_ov004_021618e4
    .word data_ov004_0216195c
    .word data_ov004_021618fc
    .word data_ov004_02161914
    .word data_ov004_0216192c
    .word data_ov004_021619d8
    .word data_ov004_021619fc
    .word data_ov004_021618b8
    .word data_ov004_02161978
    .word data_ov004_021618e4
    .word data_ov004_0216195c
    .word data_ov004_021618fc
    .word data_ov004_02161914
    .word data_ov004_0216192c
    .word data_ov004_021618cc
    .word data_ov004_021619d8
    .word data_ov004_021619fc
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214ef70
    .word func_ov004_0214ef84
    .word func_ov004_0214eef8
    .word func_0201c8a0
    .word func_ov004_0214e468
    .word func_ov012_021b0f50
    .word func_ov004_0214ef58
    .word func_0202f668
    .word func_ov004_0214ef24
    .word func_ov004_0214ce14
    .word func_ov004_0214ef1c
    .word func_ov004_0214ef14
    .word func_ov004_0214ef44
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov004_0214ef3c
    .word func_ov004_0214ef2c
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov004_0214ef0c
    .word func_ov004_0214ef4c
    .word func_ov004_0214ef60
data_ov004_02161b00:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x52, 0x75, 0x6c, 0x65, 0x44
    .byte 0x69, 0x73, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02161b18:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x63, 0x6f, 0x6d, 0x5f, 0x72, 0x75, 0x6c, 0x65, 0x30, 0x30
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov004_02161b30:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x63, 0x6f, 0x6d, 0x5f, 0x72, 0x75, 0x6c, 0x65, 0x30, 0x30
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov004_02161b48:
    .byte 0x72, 0x75, 0x6c, 0x65, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x72, 0x75, 0x6c, 0x65, 0x73
    .byte 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov004_02161b64:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02161b78:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x63, 0x6f, 0x6d, 0x5f, 0x72, 0x75, 0x6c, 0x65, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov004_02161b94:
    .byte 0x72, 0x75, 0x6c, 0x65, 0x73, 0x65, 0x6c, 0x65, 0x63, 0x74, 0x2f, 0x72, 0x75, 0x6c, 0x65, 0x5f
    .byte 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov004_02161bb0:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02161bbc:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02161bc4:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x5f, 0x71, 0x2e, 0x61
    .byte 0x66, 0x74, 0x00, 0x00
data_ov004_02161bd8:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x41, 0x6e, 0x73, 0x77, 0x65, 0x72, 0x44
    .byte 0x69, 0x73, 0x70, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_02161bf8:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x41, 0x6e, 0x73, 0x77, 0x65, 0x72, 0x44
    .byte 0x69, 0x73, 0x70, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02161c10:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov004_02161c1c:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov004_02161c24:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x75, 0x62, 0x50, 0x6c, 0x61, 0x79
    .byte 0x65, 0x72, 0x4d, 0x61, 0x72, 0x6b, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov004_02161c48:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x75, 0x62, 0x50, 0x6c, 0x61, 0x79
    .byte 0x65, 0x72, 0x4d, 0x61, 0x72, 0x6b, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_02161c64:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x75, 0x62, 0x57, 0x61, 0x69, 0x74
    .byte 0x50, 0x6c, 0x61, 0x79, 0x65, 0x72, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov004_02161c88:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x53, 0x75, 0x62, 0x57, 0x61, 0x69, 0x74
    .byte 0x50, 0x6c, 0x61, 0x79, 0x65, 0x72, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov004_02161ca4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x49
    .byte 0x6e, 0x66, 0x6f, 0x43, 0x6c, 0x61, 0x73, 0x73, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov004_02161cc4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x4d, 0x61, 0x69, 0x6e, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x49
    .byte 0x6e, 0x66, 0x6f, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02161cdc:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov004_02161ce4:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x4d, 0x61, 0x69, 0x6e, 0x50
    .byte 0x6c, 0x61, 0x79, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov004_02161cfc:
    .byte 0x4a, 0x51, 0x75, 0x69, 0x7a, 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x4d, 0x61, 0x69, 0x6e, 0x50
    .byte 0x6c, 0x61, 0x79, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov004_02161d14:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_02161d28:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67
    .byte 0x00, 0x00, 0x00, 0x00
data_ov004_02161d3c:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x5f, 0x62, 0x2e, 0x61
    .byte 0x74, 0x6d, 0x00, 0x00
data_ov004_02161d50:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x30, 0x30, 0x5f, 0x62, 0x2e, 0x64
    .byte 0x69, 0x67, 0x00, 0x00
data_ov004_02161d64:
    .byte 0x43, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov004_02161d78:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x61
    .byte 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov004_02161d90:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x6f, 0x62, 0x6a, 0x5f, 0x62
    .byte 0x5f, 0x32, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov004_02161da8:
    .byte 0x6a, 0x71, 0x75, 0x69, 0x7a, 0x2f, 0x63, 0x6f, 0x6d, 0x5f, 0x71, 0x75, 0x69, 0x7a, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x5f, 0x33, 0x64, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .section .bss, 4, 1, 4
data_ov004_02161de0: .space 0x4
data_ov004_02161de4: .space 0x4
data_ov004_02161de8: .space 0x18
