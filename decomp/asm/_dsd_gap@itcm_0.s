    .include "macros/function.inc"

    .text
    .global func_01ff8000
    arm_func_start func_01ff8000
func_01ff8000: ; 0x01ff8000
    stmdb sp!, {r4, lr}
    ldr r1, .L_01ff8048
    mov r4, r0
    ldr r2, [r1, #0x1e4]
    str r2, [r1, #0x68]
    ldr r2, [r1, #0x42c]
    str r2, [r1, #0x1e4]
    str r4, [r1, #0x46c]
    bl func_02015b68
    ldr r0, .L_01ff8048
    ldr r0, [r0, #0x1e4]
    blx r0
    mov r0, r4
    bl func_02015af4
    ldr r0, .L_01ff8048
    ldr r1, [r0, #0x68]
    str r1, [r0, #0x1e4]
    ldmia sp!, {r4, pc}
.L_01ff8048: .word data_020a0c34
    arm_func_end func_01ff8000

    .global func_01ff804c
    arm_func_start func_01ff804c
func_01ff804c: ; 0x01ff804c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc8
    mov r10, r0
    ldrsh r1, [r10, #0x4a]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_01ff8acc
    add r0, sp, #0xb0
    add r1, r10, #0x14
    bl func_0202534c
    add r0, sp, #0xb0
    ldr r0, [r0, #0x0]
    rsb r0, r0, r0, lsl #0x5
    movs r5, r0, lsr #0xc
    ldrne r0, .L_01ff8ad4
    ldrne r4, [r10, #0x20]
    ldrne r0, [r0, #0x420]
    cmpne r4, r0
    beq .L_01ff8acc
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x34]
    blx r2
    mov r0, #0x0
    str r5, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x1f
    str r0, [sp, #0x4]
    bl func_0203ae18
    add r0, r10, #0x14
    bl func_02019ddc
    mov r6, r0
    add r0, r10, #0x14
    bl func_02019ddc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    ldr r0, [r10, #0x38]
    ldr r0, [r0, #0x50]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4c]
    blx r1
    mov r5, r0
    ldrh r2, [r10, #0x24]
    ldr r0, .L_01ff8ad8
    ldr r1, .L_01ff8adc
    and r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0x0]
    ldrsh r1, [r10, #0x4a]
    mov r0, r4
    bl func_02043c18
    str r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_01ff8acc
    ldrsh r1, [r10, #0x4a]
    mov r0, r4
    bl func_02043c5c
    ldr r2, [r10, #0x38]
    str r0, [sp, #0x58]
    ldr r2, [r2, #0x50]
    ldrb r1, [r4, #0x7c]
    ldrb r0, [r2, #0x25]
    cmp r1, #0x0
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1f
    str r0, [sp, #0x40]
    beq .L_01ff8288
    ldr r0, [sp, #0x40]
    cmp r0, #0x0
    bne .L_01ff8288
    ldr r1, [sp, #0x5c]
    ldr r0, [sp, #0x58]
    mov r2, #0x6
    ldrb r3, [r10, #0x49]
    mla r7, r1, r2, r0
    mov r8, r3, lsl #0x1
    add r0, r8, #0x1
    mov r0, r0, lsl #0x1
    ldrsh r2, [r7, r0]
    add r0, sp, #0xac
    add r1, r5, #0xc
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xac]
    bl func_02018ac8
    ldr r2, [sp, #0xac]
    ldr r0, [r5, #0x14]
    rsb r1, r8, #0x1
    mla r0, r2, r1, r0
    cmp r0, #0xc0000
    bge .L_01ff8acc
    ldrb r8, [r10, #0x49]
    add r0, sp, #0xa8
    add r1, r5, #0xc
    rsb r2, r8, #0x1
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    mov r2, r2, lsl #0x1
    ldrsh r2, [r7, r2]
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xa8]
    bl func_02018ac8
    mov r1, r8, lsl #0x1
    ldr r2, [sp, #0xa8]
    ldr r0, [r5, #0x14]
    rsb r1, r1, #0x1
    mla r0, r2, r1, r0
    cmp r0, #0x0
    ble .L_01ff8acc
    ldrb r2, [r10, #0x48]
    add r0, sp, #0xa4
    mov r1, r5
    mov r8, r2, lsl #0x1
    mov r2, r8, lsl #0x1
    ldrsh r2, [r7, r2]
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xa4]
    bl func_02018ac8
    ldr r2, [sp, #0xa4]
    ldr r0, [r5, #0x10]
    rsb r1, r8, #0x1
    mla r0, r2, r1, r0
    cmp r0, #0x100000
    bge .L_01ff8acc
    ldrb r8, [r10, #0x48]
    add r0, sp, #0xa0
    mov r1, r5
    rsb r2, r8, #0x1
    mov r2, r2, lsl #0x2
    ldrsh r2, [r7, r2]
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xa0]
    bl func_02018ac8
    mov r1, r8, lsl #0x1
    ldr r2, [sp, #0xa0]
    ldr r0, [r5, #0x10]
    rsb r1, r1, #0x1
    mla r0, r2, r1, r0
    cmp r0, #0x0
    ble .L_01ff8acc
.L_01ff8288:
    ldr r0, .L_01ff8ae0
    mov r1, #0x1
    mov r9, #0x0
    str r1, [r0, #0x0]
    str r9, [r0, #0x14]
    ldr r1, [r10, #0x34]
    ldr r3, [r5, #0x10]
    sub r2, r9, #0x1000
    ldr r8, [r1, #0x4bc]
    mov r1, r2
    ldr r7, [r5, #0x14]
    and r2, r3, r2
    str r2, [r0, #0x30]
    and r1, r7, r1
    str r1, [r0, #0x30]
    mov r1, r8, lsl #0x8
    str r1, [r0, #0x30]
    ldr r1, [sp, #0x40]
    cmp r1, #0x0
    beq .L_01ff82f0
    mov r1, #0x100000
    str r1, [r0, #0x2c]
    str r1, [r0, #0x2c]
    mov r1, #0x1000
    str r1, [r0, #0x2c]
    b .L_01ff8330
.L_01ff82f0:
    ldr r1, [r5, #0x0]
    ldr r2, [r5, #0xc]
    mov r3, r1, lsl #0xc
    mov r7, r2, lsl #0xc
    mov r2, r3, asr #0x5
    mov r1, r7, asr #0x5
    add r2, r3, r2, lsr #0x1a
    add r1, r7, r1, lsr #0x1a
    mov r2, r2, asr #0x6
    mov r3, r1, asr #0x6
    mov r1, r2, lsl #0x2
    str r1, [r0, #0x2c]
    mov r1, r3, lsl #0x2
    str r1, [r0, #0x2c]
    mov r1, #0x1000
    str r1, [r0, #0x2c]
.L_01ff8330:
    ldr r0, [sp, #0x5c]
    mov r1, r0, lsl #0x6
    ldr r0, [r10, #0x68]
    add r7, r1, #0x8
    cmp r0, r7
    ldr r0, [r6, #0x20]
    str r0, [sp, #0x54]
    ldr r0, [r4, #0x50]
    str r0, [sp, #0x3c]
    bhs .L_01ff8390
    ldr r6, [r10, #0x64]
    cmp r6, #0x0
    beq .L_01ff8380
    mov r0, r6
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_01ff8380
    mov r0, r6
    mov r1, #0x1
    bl func_0201a958
.L_01ff8380:
    mov r0, r7
    bl func_0201a228
    str r0, [r10, #0x64]
    str r7, [r10, #0x68]
.L_01ff8390:
    ldrb r2, [r10, #0x48]
    ldrb r1, [r10, #0x49]
    ldr r0, [sp, #0x40]
    cmp r0, #0x0
    orr r1, r2, r1, lsl #0x1
    ldreqsh r2, [r10, #0x4a]
    ldreqsh r0, [r10, #0x4c]
    ldreq r3, [r10, #0x58]
    addeq r0, r2, r0
    cmpeq r3, r0
    ldreq r0, [r10, #0x20]
    ldreq r2, [r10, #0x5c]
    ldreq r0, [r0, #0x8]
    cmpeq r2, r0
    ldreq r2, [r10, #0x50]
    ldreq r0, [sp, #0x54]
    cmpeq r0, r2
    ldreq r0, [r10, #0x60]
    cmpeq r0, r1
    ldreq r2, [r10, #0x54]
    ldreq r0, [sp, #0x3c]
    cmpeq r0, r2
    beq .L_01ff8aa4
    ldrsh r3, [r10, #0x4a]
    ldrsh r2, [r10, #0x4c]
    add r0, sp, #0xb4
    add r2, r3, r2
    str r2, [r10, #0x58]
    ldr r2, [r10, #0x20]
    ldr r2, [r2, #0x8]
    str r2, [r10, #0x5c]
    str r1, [r10, #0x60]
    ldr r1, [r10, #0x64]
    ldr r2, [r10, #0x68]
    blx func_02067278
    add r0, sp, #0xb4
    mov r1, #0x1
    blx func_02066080
    mov r0, #0x0
    str r0, [sp, #0x50]
    b .L_01ff8a64
.L_01ff8434:
    ldr r2, [sp, #0x50]
    ldr r0, [sp, #0x58]
    mov r1, #0x6
    mla r9, r2, r1, r0
    ldrb r0, [r9, #0x4]
    ldr r1, [r4, #0x78]
    tst r0, #0x40
    str r1, [sp, #0x0]
    add r0, sp, #0xb4
    mov r1, #0x0
    bne .L_01ff84a4
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    ldr r2, [r4, #0x50]
    mov r1, #0x3
    str r2, [sp, #0x10]
    ldr r3, [r4, #0x74]
    mov r2, #0x1
    blx func_020660d0
    ldrb r3, [r9, #0x5]
    ldr r1, [sp, #0x54]
    add r0, sp, #0xb4
    mov r2, #0x3
    add r1, r1, r3, lsl #0x5
    blx func_0206609c
    b .L_01ff84e8
.L_01ff84a4:
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    ldr r2, [r4, #0x50]
    mov r1, #0x2
    str r2, [sp, #0x10]
    ldr r3, [r4, #0x74]
    mov r2, #0x1
    add r3, r3, #0x1
    blx func_020660d0
    ldrb r3, [r9, #0x5]
    ldr r1, [sp, #0x54]
    add r0, sp, #0xb4
    mov r2, #0x2
    add r1, r1, r3, lsl #0x5
    blx func_0206609c
.L_01ff84e8:
    ldrh r3, [r9, #0x0]
    ldrb r0, [r9, #0x4]
    ldrb r1, [r10, #0x48]
    mov r2, r3, lsl #0x1b
    mov r2, r2, lsr #0x18
    mov r6, r2, lsl #0xc
    mov r2, r3, asr #0x5
    mov r7, r2, lsl #0xf
    ldr r2, .L_01ff8ae4
    and r3, r0, #0xf
    ldr r8, [r2, r3, lsl #0x2]
    ldr r2, .L_01ff8ae8
    add r11, r6, r8, lsl #0xf
    ldr r3, [r2, r3, lsl #0x2]
    mov r2, r8, lsl #0x7
    str r2, [sp, #0x30]
    mov r2, r3, lsl #0x7
    str r2, [sp, #0x2c]
    ldr ip, [sp, #0x30]
    mov r2, r1, lsl #0x1
    add r8, r7, r3, lsl #0xf
    rsb r3, r2, #0x1
    ldrsb r2, [r9, #0x2]
    mul ip, r1, ip
    mov r2, r2, lsl #0x4
    mul r2, r3, r2
    sub r2, r2, ip
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    ldrsb r3, [r9, #0x3]
    mov r2, r2, asr #0x10
    ldrb ip, [r10, #0x49]
    str r2, [sp, #0x14]
    mov r3, r3, lsl #0x4
    mov r2, ip, lsl #0x1
    rsb r2, r2, #0x1
    mul r3, r2, r3
    ldr r2, [sp, #0x2c]
    tst r0, #0x10
    mul r2, ip, r2
    sub r2, r3, r2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    str r2, [sp, #0x18]
    movne r2, #0x1
    moveq r2, #0x0
    str r6, [sp, #0x38]
    eors r1, r1, r2
    ldrne r2, [sp, #0x38]
    subne r6, r11, #0x800
    subne r11, r2, #0x800
    tst r0, #0x20
    movne r0, #0x1
    moveq r0, #0x0
    str r7, [sp, #0x34]
    eors r0, ip, r0
    ldrne r2, [sp, #0x34]
    subne r7, r8, #0x800
    subne r8, r2, #0x800
    ldr r2, [sp, #0x40]
    cmp r2, #0x0
    beq .L_01ff895c
    ldr r3, [sp, #0x14]
    ldr r2, [sp, #0x30]
    add r2, r3, r2
    str r2, [sp, #0x4c]
    ldr r3, [sp, #0x18]
    ldr r2, [sp, #0x2c]
    add r2, r3, r2
    str r2, [sp, #0x48]
    mov r2, #0x0
    str r2, [sp, #0x44]
    mov r9, r2
    ldr r2, .L_01ff8ad4
    ldrb r2, [r2, #0x19]
    cmp r2, #0x0
    beq .L_01ff86b0
    cmp r1, #0x0
    beq .L_01ff8654
    ldr r2, [r5, #0x0]
    ldr r1, [r5, #0x4]
    sub r6, r6, #0x1000
    add r1, r2, r1
    rsb r1, r1, #0x0
    mov r1, r1, asr #0x1
    add r11, r11, #0x1000
    str r1, [sp, #0x44]
    b .L_01ff8670
.L_01ff8654:
    ldr r2, [r5, #0x0]
    ldr r1, [r5, #0x4]
    add r6, r6, #0x1000
    add r1, r2, r1
    mov r1, r1, asr #0x1
    sub r11, r11, #0x1000
    str r1, [sp, #0x44]
.L_01ff8670:
    cmp r0, #0x0
    beq .L_01ff8698
    sub r7, r7, #0x1000
    add r8, r8, #0x1000
    ldr r1, [r5, #0x8]
    ldr r0, [r5, #0xc]
    add r0, r1, r0
    rsb r0, r0, #0x0
    mov r9, r0, asr #0x1
    b .L_01ff86b0
.L_01ff8698:
    add r7, r7, #0x1000
    sub r8, r8, #0x1000
    ldr r1, [r5, #0x8]
    ldr r0, [r5, #0xc]
    add r0, r1, r0
    mov r9, r0, asr #0x1
.L_01ff86b0:
    ldr r1, [sp, #0x44]
    add r0, sp, #0xb4
    add r1, r1, r6
    add r2, r9, r7
    blx func_02066178
    ldr r0, [sp, #0x18]
    add r1, r5, #0xc
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x28]
    str r0, [sp, #0x90]
    add r0, sp, #0x90
    bl func_02018ac8
    ldr r0, [sp, #0x14]
    add r1, r5, #0x4
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x24]
    str r0, [sp, #0x94]
    add r0, sp, #0x94
    bl func_02018ac8
    ldr r0, [sp, #0x28]
    ldr r2, [sp, #0x94]
    ldr r1, [sp, #0x90]
    str r0, [sp, #0x98]
    add r1, r2, r1
    str r1, [sp, #0x1c]
    add r0, sp, #0x98
    add r1, r5, #0x8
    bl func_02018ac8
    ldr r0, [sp, #0x24]
    mov r1, r5
    str r0, [sp, #0x9c]
    add r0, sp, #0x9c
    bl func_02018ac8
    ldr r2, [sp, #0x9c]
    ldr r1, [sp, #0x98]
    add r0, sp, #0xb4
    add r2, r2, r1
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    ldr r2, [sp, #0x1c]
    mov r1, r1, lsl #0x4
    mov r3, r2, asr #0xb
    add r2, r2, r3, lsr #0x14
    mov r2, r2, lsl #0x4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    blx func_02066124
    ldr r1, [sp, #0x44]
    add r2, r9, r7
    add r0, sp, #0xb4
    add r1, r1, r11
    blx func_02066178
    ldr r0, [sp, #0x28]
    add r1, r5, #0xc
    str r0, [sp, #0x80]
    add r0, sp, #0x80
    bl func_02018ac8
    ldr r0, [sp, #0x4c]
    add r1, r5, #0x4
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x20]
    str r0, [sp, #0x84]
    add r0, sp, #0x84
    bl func_02018ac8
    ldr r0, [sp, #0x28]
    ldr r2, [sp, #0x84]
    ldr r1, [sp, #0x80]
    str r0, [sp, #0x88]
    add r7, r2, r1
    add r0, sp, #0x88
    add r1, r5, #0x8
    bl func_02018ac8
    ldr r0, [sp, #0x20]
    mov r1, r5
    str r0, [sp, #0x8c]
    add r0, sp, #0x8c
    bl func_02018ac8
    ldr r2, [sp, #0x8c]
    ldr r1, [sp, #0x88]
    add r0, sp, #0xb4
    add r2, r2, r1
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r2, r7, asr #0xb
    add r2, r7, r2, lsr #0x14
    mov r1, r1, lsl #0x4
    mov r2, r2, lsl #0x4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    blx func_02066124
    ldr r0, [sp, #0x44]
    add r2, r9, r8
    add r1, r0, r11
    add r0, sp, #0xb4
    blx func_02066178
    ldr r0, [sp, #0x48]
    add r1, r5, #0xc
    mov r7, r0, lsl #0xc
    add r0, sp, #0x70
    str r7, [sp, #0x70]
    bl func_02018ac8
    ldr r0, [sp, #0x20]
    add r1, r5, #0x4
    str r0, [sp, #0x74]
    add r0, sp, #0x74
    bl func_02018ac8
    ldr r2, [sp, #0x74]
    ldr r1, [sp, #0x70]
    add r0, sp, #0x78
    add r11, r2, r1
    add r1, r5, #0x8
    str r7, [sp, #0x78]
    bl func_02018ac8
    ldr r0, [sp, #0x20]
    mov r1, r5
    str r0, [sp, #0x7c]
    add r0, sp, #0x7c
    bl func_02018ac8
    ldr r2, [sp, #0x7c]
    ldr r1, [sp, #0x78]
    add r0, sp, #0xb4
    add r2, r2, r1
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r2, r11, asr #0xb
    add r2, r11, r2, lsr #0x14
    mov r1, r1, lsl #0x4
    mov r2, r2, lsl #0x4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    blx func_02066124
    ldr r0, [sp, #0x44]
    add r2, r9, r8
    add r1, r0, r6
    add r0, sp, #0xb4
    blx func_02066178
    add r0, sp, #0x60
    add r1, r5, #0xc
    str r7, [sp, #0x60]
    bl func_02018ac8
    ldr r0, [sp, #0x24]
    add r1, r5, #0x4
    str r0, [sp, #0x64]
    add r0, sp, #0x64
    bl func_02018ac8
    ldr r2, [sp, #0x64]
    ldr r1, [sp, #0x60]
    add r0, sp, #0x68
    add r6, r2, r1
    add r1, r5, #0x8
    str r7, [sp, #0x68]
    bl func_02018ac8
    ldr r0, [sp, #0x24]
    mov r1, r5
    str r0, [sp, #0x6c]
    add r0, sp, #0x6c
    bl func_02018ac8
    ldr r2, [sp, #0x6c]
    ldr r1, [sp, #0x68]
    add r0, sp, #0xb4
    add r2, r2, r1
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r2, r6, asr #0xb
    add r2, r6, r2, lsr #0x14
    mov r1, r1, lsl #0x4
    mov r2, r2, lsl #0x4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    blx func_02066124
    b .L_01ff8a44
.L_01ff895c:
    add r0, sp, #0xb4
    mov r1, r6
    mov r2, r7
    blx func_02066178
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    add r0, sp, #0xb4
    blx func_02066124
    mov r2, r7
    add r0, sp, #0xb4
    mov r1, r11
    blx func_02066178
    ldrb r1, [r9, #0x4]
    ldr r2, [sp, #0x18]
    add r0, sp, #0xb4
    and r3, r1, #0xf
    ldr r1, .L_01ff8ae4
    ldr r3, [r1, r3, lsl #0x2]
    ldr r1, [sp, #0x14]
    add r1, r1, r3, lsl #0x7
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    blx func_02066124
    mov r1, r11
    add r0, sp, #0xb4
    mov r2, r8
    blx func_02066178
    ldrb r1, [r9, #0x4]
    add r0, sp, #0xb4
    and r3, r1, #0xf
    ldr r1, .L_01ff8ae4
    ldr r2, [r1, r3, lsl #0x2]
    ldr r1, .L_01ff8ae8
    ldr r3, [r1, r3, lsl #0x2]
    ldr r1, [sp, #0x14]
    add r1, r1, r2, lsl #0x7
    ldr r2, [sp, #0x18]
    mov r1, r1, lsl #0x10
    add r2, r2, r3, lsl #0x7
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    blx func_02066124
    mov r1, r6
    mov r2, r8
    add r0, sp, #0xb4
    blx func_02066178
    ldrb r2, [r9, #0x4]
    ldr r1, [sp, #0x14]
    add r0, sp, #0xb4
    and r3, r2, #0xf
    ldr r2, .L_01ff8ae8
    ldr r3, [r2, r3, lsl #0x2]
    ldr r2, [sp, #0x18]
    add r2, r2, r3, lsl #0x7
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    blx func_02066124
.L_01ff8a44:
    mov r1, #0x0
    add r0, sp, #0xb4
    mov r2, r1
    mov r3, #0x100
    blx func_020661c4
    ldr r0, [sp, #0x50]
    add r0, r0, #0x1
    str r0, [sp, #0x50]
.L_01ff8a64:
    ldr r1, [sp, #0x50]
    ldr r0, [sp, #0x5c]
    cmp r1, r0
    blo .L_01ff8434
    add r0, sp, #0xb4
    blx func_02066068
    add r0, sp, #0xb4
    bl func_020671c8
    str r0, [r10, #0x6c]
    ldr r0, [r10, #0x64]
    ldr r1, [r10, #0x6c]
    bl func_0205401c
    ldr r0, [sp, #0x54]
    str r0, [r10, #0x50]
    ldr r0, [sp, #0x3c]
    str r0, [r10, #0x54]
.L_01ff8aa4:
    ldr r0, .L_01ff8aec
    ldr r1, [r10, #0x64]
    ldr r0, [r0, #0x0]
    ldr r2, [r10, #0x6c]
    bl func_01ff8d20
    ldr r2, [r10, #0x34]
    ldr r0, [sp, #0x5c]
    ldr r1, [r2, #0x4bc]
    add r0, r0, r1
    str r0, [r2, #0x4bc]
.L_01ff8acc:
    add sp, sp, #0xc8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_01ff8ad4: .word data_020a0c34
.L_01ff8ad8: .word 0x7fff
.L_01ff8adc: .word 0x4000480
.L_01ff8ae0: .word 0x4000440
.L_01ff8ae4: .word data_02094740
.L_01ff8ae8: .word data_02094770
.L_01ff8aec: .word data_0209dd40
    arm_func_end func_01ff804c

    .global func_01ff8af0
    arm_func_start func_01ff8af0
func_01ff8af0: ; 0x01ff8af0
    stmdb sp!, {r3, lr}
    ldr r0, .L_01ff8bb4
    ldr r1, [r0, #0x214]
    ldr r3, [r0, #0x384]
    ldr r1, [r1, #0x0]
    add r1, r1, r3, lsl #0x2
    ldr r2, [r1, #0x14]
    cmp r2, #0x0
    bne .L_01ff8b50
    ldr r1, [r1, #0x24]
    ldr r2, .L_01ff8bb8
    str r1, [r2, #0x0]
    ldr r1, [r0, #0x214]
    ldr r1, [r1, #0x0]
    add r1, r1, r3, lsl #0x2
    ldr r1, [r1, #0x2c]
    str r1, [r2, #0x4]
    ldr r0, [r0, #0x214]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x34]
    mov r0, r0, lsr #0x1
    orr r0, r0, #0x90000000
    str r0, [r2, #0x8]
    b .L_01ff8b5c
.L_01ff8b50:
    ldr r0, [r1, #0xc]
    ldr r1, [r1, #0x1c]
    blx r2
.L_01ff8b5c:
    ldr r0, .L_01ff8bb4
    ldr r1, [r0, #0x214]
    add r2, r1, #0x4
    str r2, [r0, #0x214]
    ldr r1, [r1, #0x4]
    cmp r1, #0x0
    ldreq r1, .L_01ff8bbc
    ldreqh r0, [r1, #0x0]
    biceq r0, r0, #0x20
    streqh r0, [r1, #0x0]
    beq .L_01ff8b9c
    ldr r0, [r0, #0x384]
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0xc]
    sub r0, r0, #0x1
    blx func_02064f20
.L_01ff8b9c:
    ldr r0, .L_01ff8bc0
    add r0, r0, #0x3000
    ldr r1, [r0, #0xff8]
    orr r1, r1, #0x4
    str r1, [r0, #0xff8]
    ldmia sp!, {r3, pc}
.L_01ff8bb4: .word data_020a0c34
.L_01ff8bb8: .word 0x40000b0
.L_01ff8bbc: .word 0x4000004
.L_01ff8bc0: .word data_027c0000
    arm_func_end func_01ff8af0

    .global func_01ff8bc4
    arm_func_start func_01ff8bc4
func_01ff8bc4: ; 0x01ff8bc4
    stmdb sp!, {r4, lr}
    mov ip, #0xc
    mul r4, r0, ip
    add ip, r4, #0x4000000
    ldr lr, .L_01ff8c1c
    str r1, [ip, #0xb0]
    add r4, r4, lr
    str r2, [r4, #0x4]
    str r3, [r4, #0x8]
    ldr r1, [lr, #0x0]
    cmp r0, #0x0
    ldr r0, [lr, #0x0]
    moveq r1, #0x0
    streq r1, [r4, #0x0]
    streq r1, [r4, #0x4]
    ldreq r0, .L_01ff8c20
    ldr r1, .L_01ff8c1c
    streq r0, [r4, #0x8]
    ldr r0, [r1, #0x0]
    ldr r0, [r1, #0x0]
    ldmia sp!, {r4, lr}
    bx lr
.L_01ff8c1c: .word 0x40000b0
.L_01ff8c20: .word 0x81400001
    arm_func_end func_01ff8bc4

    .global func_01ff8c24
    arm_func_start func_01ff8c24
func_01ff8c24: ; 0x01ff8c24
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    mov ip, #0xc
    mul lr, r0, ip
    ldr r0, .L_01ff8c58
    add ip, lr, #0x4000000
    str r1, [ip, #0xb0]
    add r0, lr, r0
    str r2, [r0, #0x4]
    str r3, [r0, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {lr}
    bx lr
.L_01ff8c58: .word 0x40000b0
    arm_func_end func_01ff8c24

    .global func_01ff8c5c
    arm_func_start func_01ff8c5c
func_01ff8c5c: ; 0x01ff8c5c
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02055238
    mov r1, #0xc
    mul r3, r7, r1
    add r1, r3, #0x4000000
    ldr r2, .L_01ff8cc8
    str r6, [r1, #0xb0]
    add r3, r3, r2
    str r5, [r3, #0x4]
    str r4, [r3, #0x8]
    ldr r1, [r2, #0x0]
    cmp r7, #0x0
    ldr r1, [r2, #0x0]
    moveq r2, #0x0
    streq r2, [r3, #0x0]
    ldreq r1, .L_01ff8ccc
    streq r2, [r3, #0x4]
    streq r1, [r3, #0x8]
    bl func_0205524c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_01ff8cc8: .word 0x40000b0
.L_01ff8ccc: .word 0x81400001
    arm_func_end func_01ff8c5c

    .global func_01ff8cd0
    arm_func_start func_01ff8cd0
func_01ff8cd0: ; 0x01ff8cd0
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02055238
    mov r1, #0xc
    mul r3, r7, r1
    ldr r1, .L_01ff8d1c
    add r2, r3, #0x4000000
    str r6, [r2, #0xb0]
    add r1, r3, r1
    str r5, [r1, #0x4]
    str r4, [r1, #0x8]
    bl func_0205524c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_01ff8d1c: .word 0x40000b0
    arm_func_end func_01ff8cd0

    .global func_01ff8d20
    arm_func_start func_01ff8d20
func_01ff8d20: ; 0x01ff8d20
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4
    movs r8, r2
    mov r10, r0
    mov r9, r1
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bxeq lr
    mov r3, #0x0
    bl func_0205116c
    mov r0, #0x3
    mul r1, r10, r0
    ldr r0, .L_01ff8dc0
    add r1, r1, #0x2
    add r7, r0, r1, lsl #0x2
.L_01ff8d5c:
    ldr r0, [r7, #0x0]
    ands r0, r0, #0x80000000
    bne .L_01ff8d5c
    cmp r8, #0x0
    beq .L_01ff8da8
    ldr r11, .L_01ff8dc4
    mov r5, #0x1d8
    ldr r4, .L_01ff8dc8
.L_01ff8d7c:
    cmp r8, #0x1d8
    movhi r6, r5
    movls r6, r8
    mov r0, r10
    mov r1, r9
    mov r2, r11
    orr r3, r4, r6, lsr #0x2
    bl func_01ff8cd0
    subs r8, r8, r6
    add r9, r9, r6
    bne .L_01ff8d7c
.L_01ff8da8:
    ldr r0, [r7, #0x0]
    ands r0, r0, #0x80000000
    bne .L_01ff8da8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bx lr
.L_01ff8dc0: .word 0x40000b0
.L_01ff8dc4: .word 0x4000400
.L_01ff8dc8: .word 0x84400000
    arm_func_end func_01ff8d20

    .global func_01ff8dcc
    arm_func_start func_01ff8dcc
func_01ff8dcc: ; 0x01ff8dcc
    stmdb sp!, {lr}
    mov ip, #0x4000000
    add ip, ip, #0x210
    ldr r1, [ip, #-0x8]
    cmp r1, #0x0
    ldmeqia sp!, {pc}
    ldmia ip, {r1, r2}
    ands r1, r1, r2
    ldmeqia sp!, {pc}
    mov r3, #0x80000000
.L_01ff8df4:
    clz r0, r1
    bics r1, r1, r3, lsr r0
    bne .L_01ff8df4
    mov r1, r3, lsr r0
    str r1, [ip, #0x4]
    rsbs r0, r0, #0x1f
    ldr r1, .L_01ff8e1c
    ldr r0, [r1, r0, lsl #0x2]
    ldr lr, .L_01ff8e20
    bx r0
.L_01ff8e1c: .word data_027c0000
.L_01ff8e20: .word func_01ff8e24
    arm_func_end func_01ff8dcc

    .global func_01ff8e24
    arm_func_start func_01ff8e24
func_01ff8e24: ; 0x01ff8e24
    mov r2, #0x1
    mov r3, #0x0
    ldr ip, .L_01ff8f70
    ldr ip, [ip, #0x0]
    cmp ip, #0x0
    beq .L_01ff8e74
.L_01ff8e3c:
    str r2, [ip, #0x64]
    str r3, [ip, #0x78]
    str r3, [ip, #0x7c]
    ldr r0, [ip, #0x80]
    str r3, [ip, #0x80]
    mov ip, r0
    cmp ip, #0x0
    bne .L_01ff8e3c
    ldr ip, .L_01ff8f70
    str r3, [ip, #0x0]
    str r3, [ip, #0x4]
    ldr ip, .L_01ff8f74
    mov r1, #0x1
    strh r1, [ip, #0x0]
.L_01ff8e74:
    ldr ip, .L_01ff8f74
    ldrh r1, [ip, #0x0]
    cmp r1, #0x0
    ldreq pc, [sp], #0x4
    mov r1, #0x0
    strh r1, [ip, #0x0]
    mov r3, #0xd2
    msr cpsr_c, r3
    add r2, ip, #0x8
    ldr r1, [r2, #0x0]
.L_01ff8e9c:
    cmp r1, #0x0
    ldrneh r0, [r1, #0x64]
    cmpne r0, #0x1
    ldrne r1, [r1, #0x68]
    bne .L_01ff8e9c
    cmp r1, #0x0
    bne .L_01ff8ec4
.L_01ff8eb8:
    mov r3, #0x92
    msr cpsr_c, r3
    ldr pc, [sp], #0x4
.L_01ff8ec4:
    ldr r0, [ip, #0x4]
    cmp r1, r0
    beq .L_01ff8eb8
    ldr r3, [ip, #0xc]
    cmp r3, #0x0
    beq .L_01ff8eec
    stmdb sp!, {r0, r1, ip}
    mov lr, pc
    bx r3
    ldmia sp!, {r0, r1, ip}
.L_01ff8eec:
    str r1, [ip, #0x4]
    mrs r2, spsr
    str r2, [r0, #0x0]!
    stmdb sp!, {r0, r1}
    add r0, r0, #0x0
    add r0, r0, #0x48
    ldr r1, .L_01ff8f78
    blx r1
    ldmia sp!, {r0, r1}
    ldmib sp!, {r2, r3}
    stmib r0!, {r2, r3}
    ldmib sp!, {r2, r3, ip, lr}
    stmib r0!, {r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, ip, sp, lr}^
    stmib r0!, {lr}
    mov r3, #0xd3
    msr cpsr_c, r3
    stmib r0!, {sp}
    stmdb sp!, {r1}
    add r0, r1, #0x0
    add r0, r0, #0x48
    ldr r1, .L_01ff8f7c
    blx r1
    ldmia sp!, {r1}
    ldr sp, [r1, #0x44]
    mov r3, #0xd2
    msr cpsr_c, r3
    ldr r2, [r1, #0x0]!
    msr spsr_fc, r2
    ldr lr, [r1, #0x40]
    ldmib r1!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, ip, sp, lr}^
    mov r0, r0
    stmda sp!, {r0, r1, r2, r3, ip, lr}
    ldmia sp!, {pc}
.L_01ff8f70: .word data_027c1040
.L_01ff8f74: .word data_020aab74
.L_01ff8f78: .word func_0204f8d0
.L_01ff8f7c: .word func_0204f864
    arm_func_end func_01ff8e24

    .global func_01ff8f80
    arm_func_start func_01ff8f80
func_01ff8f80: ; 0x01ff8f80
    mov ip, #0x4000000
    str ip, [ip, #0x208]
    ldr r1, .L_01ff9018
    add r1, r1, #0x3fc0
    add r1, r1, #0x3c
    mov r0, #0x0
    str r0, [r1, #0x0]
    ldr r1, .L_01ff901c
.L_01ff8fa0:
    ldrh r0, [r1, #0x0]
    and r0, r0, #0xf
    cmp r0, #0x1
    bne .L_01ff8fa0
    mov r0, #0x100
    strh r0, [r1, #0x0]
    mov r0, #0x0
    ldr r3, .L_01ff9020
    ldr r4, [r3, #0x0]
    ldr r1, .L_01ff9024
    mov r2, #0x80
    bl func_01ff9030
    str r4, [r3, #0x0]
    ldr r1, .L_01ff9028
    mov r2, #0x80
    bl func_01ff9030
    ldr r1, .L_01ff901c
.L_01ff8fe4:
    ldrh r0, [r1, #0x0]
    and r0, r0, #0xf
    cmp r0, #0x1
    beq .L_01ff8fe4
    mov r0, #0x0
    strh r0, [r1, #0x0]
    ldr r3, .L_01ff902c
    ldr ip, [r3, #0x24]
    mov lr, ip
    ldr r11, .L_01ff9028
    ldmia r11, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10}
    mov r11, #0x0
    bx ip
.L_01ff9018: .word data_027c0000
.L_01ff901c: .word 0x4000180
.L_01ff9020: .word 0x27ffd9c
.L_01ff9024: .word 0x27ffd80
.L_01ff9028: .word 0x27fff80
.L_01ff902c: .word 0x27ffe00
    arm_func_end func_01ff8f80

    .global func_01ff9030
    arm_func_start func_01ff9030
func_01ff9030: ; 0x01ff9030
    add ip, r1, r2
.L_01ff9034:
    cmp r1, ip
    stmltia r1!, {r0}
    blt .L_01ff9034
    bx lr
    arm_func_end func_01ff9030

    .global func_01ff9044
    arm_func_start func_01ff9044
func_01ff9044: ; 0x01ff9044
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4
    ldr r4, .L_01ff9140
    ldr r3, .L_01ff9144
    ldr r4, [r4, #0x0]
    and r3, r0, r3
    bic r4, r4, #0x7000000
    orr r10, r4, #0xa1000000
    rsb r9, r3, #0x0
    ldr r4, .L_01ff9148
.L_01ff906c:
    ldr r3, [r4, #0x0]
    ands r3, r3, #0x80000000
    bne .L_01ff906c
    ldr r3, .L_01ff914c
    mov r4, #0x80
    cmp r9, r2
    addge sp, sp, #0x4
    strb r4, [r3, #0x0]
    add r0, r0, r9
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bxge lr
    ldr r3, .L_01ff9150
    ldr ip, .L_01ff9148
    ldr r5, .L_01ff9154
    ldr r4, .L_01ff9158
    mov r7, r0, lsr #0x8
    mov r6, #0xb7
    mov lr, #0x0
.L_01ff90b4:
    strb r6, [r5, #0x0]
    mov r8, r0, lsr #0x18
    strb r8, [r4, #0x0]
    ldr r8, .L_01ff915c
    mov r11, r0, lsr #0x10
    strb r11, [r8, #0x0]
    ldr r8, .L_01ff9160
    strb r7, [r8, #0x0]
    ldr r8, .L_01ff9164
    strb r0, [r8, #0x0]
    ldr r8, .L_01ff9168
    strb lr, [r8, #0x0]
    ldr r8, .L_01ff916c
    strb lr, [r8, #0x0]
    ldr r8, .L_01ff9170
    strb lr, [r8, #0x0]
    str r10, [ip, #0x0]
.L_01ff90f8:
    ldr r8, [ip, #0x0]
    ands r11, r8, #0x800000
    beq .L_01ff911c
    cmp r9, #0x0
    ldr r11, [r3, #0x0]
    blt .L_01ff9118
    cmp r9, r2
    strlt r11, [r1, r9]
.L_01ff9118:
    add r9, r9, #0x4
.L_01ff911c:
    ands r8, r8, #0x80000000
    bne .L_01ff90f8
    cmp r9, r2
    add r7, r7, #0x2
    add r0, r0, #0x200
    blt .L_01ff90b4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bx lr
.L_01ff9140: .word 0x27ffe60
.L_01ff9144: .word 0x1ff
.L_01ff9148: .word 0x40001a4
.L_01ff914c: .word 0x40001a1
.L_01ff9150: .word 0x4100010
.L_01ff9154: .word 0x40001a8
.L_01ff9158: .word 0x40001a9
.L_01ff915c: .word 0x40001aa
.L_01ff9160: .word 0x40001ab
.L_01ff9164: .word 0x40001ac
.L_01ff9168: .word 0x40001ad
.L_01ff916c: .word 0x40001ae
.L_01ff9170: .word 0x40001af
    arm_func_end func_01ff9044

    .global func_01ff9174
    arm_func_start func_01ff9174
func_01ff9174: ; 0x01ff9174
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4
    ldr r0, .L_01ff9234
    ldr r10, [r0, #0x0]
    cmp r10, #0x8000
    blo .L_01ff919c
    ldr r1, .L_01ff9238
    mov r0, r10
    mov r2, #0x160
    bl func_01ff9044
.L_01ff919c:
    ldr r5, .L_01ff923c
    ldr r4, .L_01ff9240
    ldr r3, .L_01ff9244
    ldr r2, .L_01ff9248
    ldr r1, .L_01ff924c
    ldr r9, [r5, #0x0]
    ldr r0, .L_01ff9250
    ldr r8, [r4, #0x0]
    ldr r7, [r3, #0x0]
    ldr r6, [r2, #0x0]
    ldr r5, [r1, #0x0]
    ldr r4, [r0, #0x0]
    bl func_02055238
    mov r11, r0
    bl func_02053f84
    bl func_02053f78
    mov r0, r11
    bl func_0205524c
    bl func_0205404c
    bl func_02054040
    add r9, r9, r10
    cmp r9, #0x8000
    rsblo r0, r9, #0x8000
    addlo r8, r8, r0
    sublo r7, r7, r0
    movlo r9, #0x8000
    add r6, r6, r10
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_01ff9044
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_01ff9044
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bx lr
.L_01ff9234: .word 0x27ffc2c
.L_01ff9238: .word 0x27ffe00
.L_01ff923c: .word 0x27ffe20
.L_01ff9240: .word 0x27ffe28
.L_01ff9244: .word 0x27ffe2c
.L_01ff9248: .word 0x27ffe30
.L_01ff924c: .word 0x27ffe38
.L_01ff9250: .word 0x27ffe3c
    arm_func_end func_01ff9174

    .global func_01ff9254
    arm_func_start func_01ff9254
func_01ff9254: ; 0x01ff9254
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, .L_01ff928c
.L_01ff9260:
    ldrh r1, [r0, #0x0]
    cmp r1, #0x0
    beq .L_01ff9260
    ldr r0, .L_01ff9290
    mov r1, #0x0
    strh r1, [r0, #0x0]
    bl func_01ff9174
    bl func_01ff8f80
    add sp, sp, #0x4
    ldmia sp!, {lr}
    bx lr
.L_01ff928c: .word data_020aaebc
.L_01ff9290: .word 0x4000208
    arm_func_end func_01ff9254

    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

    .global func_01ff92a0
    arm_func_start func_01ff92a0
func_01ff92a0: ; 0x01ff92a0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, ip, lr}
    ldr r1, [r0, #0x0]
    mov r2, #0x0
    ldrh r3, [r1], #0x2
    add r0, r0, #0x24
    mov r3, r3, lsl #0x10
    ldmia r0, {r4, r5, r6, r7, r8}
    stmdb sp!, {r4, r5, r6, r7, r8}
    ldr ip, [r0, #0x58]
.L_01ff92c4:
    stmdb sp!, {ip}
    ldr r11, [r0, #0x54]
.L_01ff92cc:
    stmdb sp!, {r11}
    stmia r0, {r4, r5, r6, r7, r8}
    ldr r8, [r0, #0x10]
    mov r4, #0x0
    str r4, [r8, #0x0]
    ldr r4, [r8, #-0x4]
    ldr r6, [r8, #-0x48]
    ldr r8, [r8, #-0x44]
    mov r5, r4, asr #0x8
    mov r4, r4, lsl #0x18
    movs r4, r4, asr #0x18
    addlt r5, r5, #0x1
    mov r7, r6, asr #0x8
    mov r6, r6, lsl #0x18
    movs r6, r6, asr #0x18
    addlt r7, r7, #0x1
    mov r9, r8, asr #0x8
    mov r8, r8, lsl #0x18
    movs r8, r8, asr #0x18
    addlt r9, r9, #0x1
    add r10, r5, r7
    add r10, r10, r9
    cmp r5, r7
    movle r11, r5
    movle ip, r7
    movgt r11, r7
    movgt ip, r5
    cmp r11, r9
    movgt r11, r9
    cmp ip, r9
    movle ip, r9
    sub r10, r10, r11
    sub r10, r10, ip
    add r5, r4, r6
    add r5, r5, r8
    cmp r4, r6
    movle r11, r4
    movle ip, r6
    movgt r11, r6
    movgt ip, r4
    cmp r11, r8
    movgt r11, r8
    cmp ip, r8
    movle ip, r8
    sub r5, r5, r11
    sub r5, r5, ip
    mov r11, r5
    mov ip, r10
    bl func_01ffaa4c
    ldmia r0, {r4, r5, r6, r7, r8}
    add r4, r4, #0x10
    add r5, r5, #0x10
    add r6, r6, #0x4
    add r7, r7, #0x2
    add r8, r8, #0x4
    ldmia sp!, {r11}
    subs r11, r11, #0x10
    bne .L_01ff92cc
    ldr r9, [r0, #0x54]
    add r4, r4, #0x1000
    mov r9, r9, asr #0x4
    sub r4, r4, r9, lsl #0x4
    add r5, r5, #0x800
    sub r5, r5, r9, lsl #0x4
    add r6, r6, #0x104
    sub r6, r6, r9, lsl #0x2
    add r7, r7, #0x42
    sub r7, r7, r9, lsl #0x1
    add r8, r8, #0x48
    sub r8, r8, r9, lsl #0x2
    ldmia sp!, {ip}
    subs ip, ip, #0x10
    bne .L_01ff92c4
    ldmia sp!, {r4, r5, r6, r7, r8}
    stmia r0, {r4, r5, r6, r7, r8}
    ldr r2, [r0, #-0x24]
    sub r0, r1, r2
    sub r0, r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, ip, lr}
    mov pc, lr
    arm_func_end func_01ff92a0

    .global func_01ff940c
    arm_func_start func_01ff940c
func_01ff940c: ; 0x01ff940c
    clz r10, r3
    mov r3, r3, lsl r10
    add r3, r3, r3
    rsb r9, r10, #0x20
    mov r6, r3, lsr r9
    mov r9, #0x1
    add r6, r6, r9, lsl r10
    sub r6, r6, #0x1
    mov r3, r3, lsl r10
    sub r2, r2, r10, lsl #0x1
    subs r2, r2, #0x1
    movge pc, lr
.L_01ff943c:
    ldrh r10, [r1], #0x2
    add r2, r2, #0x10
    rsb r9, r2, #0x10
    orr r3, r3, r10, lsl r9
    mov pc, lr
    arm_func_end func_01ff940c

    .global func_01ff9450
    arm_func_start func_01ff9450
func_01ff9450: ; 0x01ff9450
    clz r10, r3
    mov r3, r3, lsl r10
    add r3, r3, r3
    rsb r9, r10, #0x20
    mov r6, r3, lsr r9
    mov r9, #0x1
    add r6, r6, r9, lsl r10
    tst r6, #0x1
    rsbne r6, r6, #0x1
    mov r6, r6, asr #0x1
    mov r3, r3, lsl r10
    sub r2, r2, r10, lsl #0x1
    subs r2, r2, #0x1
    movge pc, lr
    b .L_01ff943c
    arm_func_end func_01ff9450

    .byte 0xc4, 0x95, 0xff, 0x01, 0x10, 0x96, 0xff, 0x01, 0x60, 0x96, 0xff, 0x01, 0xa8, 0x97, 0xff, 0x01
    .byte 0x08, 0x98, 0xff, 0x01, 0x90, 0x99, 0xff, 0x01, 0xd4, 0x99, 0xff, 0x01, 0x44, 0x9a, 0xff, 0x01

    .global func_01ff94ac
    arm_func_start func_01ff94ac
func_01ff94ac: ; 0x01ff94ac
    stmdb sp!, {r11, ip, lr}
    bl func_01ff940c
    mov r11, r6
    bl func_01ff940c
    mov ip, r6
    sub r8, pc, #0x3c
    ldr r8, [r8, r11, lsl #0x2]
    mov lr, pc
    mov pc, r8
    arm_func_end func_01ff94ac

    .global func_01ff94d0
    arm_func_start func_01ff94d0
func_01ff94d0: ; 0x01ff94d0
    sub r8, pc, #0x3c
    ldr r8, [r8, ip, lsl #0x2]
    mov lr, pc
    mov pc, r8
    arm_func_end func_01ff94d0

    .global func_01ff94e0
    arm_func_start func_01ff94e0
func_01ff94e0: ; 0x01ff94e0
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ff94e0

    .byte 0xcc, 0x9a, 0xff, 0x01, 0xec, 0x9a, 0xff, 0x01, 0x90, 0x9b, 0xff, 0x01, 0xe0, 0x9b, 0xff, 0x01
    .byte 0xc4, 0x9c, 0xff, 0x01, 0xac, 0x9d, 0xff, 0x01, 0xb0, 0x9e, 0xff, 0x01, 0xb4, 0x9f, 0xff, 0x01
    .byte 0xb0, 0xa0, 0xff, 0x01

    .global func_01ff9508
    arm_func_start func_01ff9508
func_01ff9508: ; 0x01ff9508
    stmdb sp!, {r11, ip, lr}
    sub r11, pc, #0x30
    add ip, r0, #0x3a
    ldr r8, [r0, #0x0]
    mov r7, r5, lsr #0x2
.L_01ff951c:
    mov r6, r4, lsr #0x2
.L_01ff9520:
    ldrb r10, [ip, #-0x5]
    ldrb r9, [ip, #-0x1]
    cmp r10, r9
    movgt r10, r9
    cmp r10, #0x9
    moveq r10, #0x2
    adds r3, r3, r3
    blo .L_01ff9554
    sub r2, r2, #0x1
    strb r10, [ip], #0x1
    ldr r9, [r11, r10, lsl #0x2]
    add lr, pc, #0x24
    mov pc, r9
.L_01ff9554:
    mov r9, r3, lsr #0x1d
    mov r3, r3, lsl #0x3
    sub r2, r2, #0x4
    cmp r9, r10
    addge r9, r9, #0x1
    strb r9, [ip], #0x1
    ldr r9, [r11, r9, lsl #0x2]
    mov lr, pc
    mov pc, r9
    arm_func_end func_01ff9508

    .global func_01ff9578
    arm_func_start func_01ff9578
func_01ff9578: ; 0x01ff9578
    cmn r2, #0xc
    bllt .L_01ff943c
    add r8, r8, #0x4
    subs r6, r6, #0x1
    bne .L_01ff9520
    sub ip, ip, r4, lsr #0x2
    add ip, ip, #0x5
    sub r8, r8, r4
    add r8, r8, #0x400
    subs r7, r7, #0x1
    bne .L_01ff951c
    cmp r2, #0x0
    bllt .L_01ff943c
    bl func_01ff940c
    sub r8, pc, #0x11c
    ldr r8, [r8, r6, lsl #0x2]
    mov lr, pc
    mov pc, r8
    arm_func_end func_01ff9578

    .global func_01ff95c0
    arm_func_start func_01ff95c0
func_01ff95c0: ; 0x01ff95c0
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ff95c0

    .global func_01ff95c4
    arm_func_start func_01ff95c4
func_01ff95c4: ; 0x01ff95c4
    ldr r7, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    mov r10, r5
    add r7, r7, r9
    sub r6, r7, #0x100
    mov r8, r4
.L_01ff95dc:
    ldr r9, [r6], #0x4
    subs r8, r8, #0x4
    str r9, [r7, #0x300]
    str r9, [r7, #0x200]
    str r9, [r7, #0x100]
    str r9, [r7], #0x4
    bne .L_01ff95dc
    subs r10, r10, #0x4
    moveq pc, lr
    add r7, r7, #0x400
    sub r6, r6, r4
    sub r7, r7, r4
    b #-0x34
    arm_func_end func_01ff95c4

    .global func_01ff9610
    arm_func_start func_01ff9610
func_01ff9610: ; 0x01ff9610
    ldr r7, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    mov r10, r5
    add r7, r7, r9
    sub r6, r7, #0x1
    ldrb r9, [r6, #0x0]
    mov r8, r4
    orr r9, r9, r9, lsl #0x8
    orr r9, r9, r9, lsl #0x10
.L_01ff9634:
    str r9, [r7], #0x4
    subs r8, r8, #0x4
    bne .L_01ff9634
    subs r10, r10, #0x1
    moveq pc, lr
    add r6, r6, #0x100
    add r7, r7, #0x100
    sub r7, r7, r4
    b #-0x30
    arm_func_end func_01ff9610

    .byte 0x00, 0x02, 0x03, 0x00, 0x04, 0x00, 0x00, 0x00

    .global func_01ff9660
    arm_func_start func_01ff9660
func_01ff9660: ; 0x01ff9660
    ldr r7, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r7, r7, r9
    cmp r9, #0x0
    moveq r8, #0x80
    beq .L_01ff974c
    movs r11, r9, lsl #0x18
    beq .L_01ff96f0
    movs r11, r9, lsr #0x8
    beq .L_01ff9720
    mov r11, #0x0
    sub r6, r7, #0x100
    mov r10, r4
.L_01ff9694:
    ldrb r9, [r6], #0x1
    subs r10, r10, #0x1
    add r11, r11, r9
    bne .L_01ff9694
    add r11, r11, r4, lsr #0x1
    sub r9, pc, #0x58
    ldrb r9, [r9, r4, lsr #0x2]
    mov r8, #0x0
    sub r6, r7, #0x1
    mov r11, r11, lsr r9
    mov r10, r5
.L_01ff96c0:
    ldrb r9, [r6], #0x100
    subs r10, r10, #0x1
    add r8, r8, r9
    bne .L_01ff96c0
    add r8, r8, r5, lsr #0x1
    sub r9, pc, #0x84
    ldrb r9, [r9, r5, lsr #0x2]
    mov r8, r8, lsr r9
    add r8, r8, r11
    add r8, r8, #0x1
    mov r8, r8, lsr #0x1
    b .L_01ff974c
.L_01ff96f0:
    mov r8, #0x0
    sub r6, r7, #0x100
    mov r10, r4
.L_01ff96fc:
    ldrb r9, [r6], #0x1
    subs r10, r10, #0x1
    add r8, r8, r9
    bne .L_01ff96fc
    add r8, r8, r4, lsr #0x1
    sub r9, pc, #0xc0
    ldrb r9, [r9, r4, lsr #0x2]
    mov r8, r8, lsr r9
    b .L_01ff974c
.L_01ff9720:
    mov r8, #0x0
    sub r6, r7, #0x1
    mov r10, r5
.L_01ff972c:
    ldrb r9, [r6], #0x100
    subs r10, r10, #0x1
    add r8, r8, r9
    bne .L_01ff972c
    add r8, r8, r5, lsr #0x1
    sub r9, pc, #0xf0
    ldrb r9, [r9, r5, lsr #0x2]
    mov r8, r8, lsr r9
.L_01ff974c:
    orr r9, r8, r8, lsl #0x8
    orr r9, r9, r9, lsl #0x10
    mov r10, r5
.L_01ff9758: ; inline table
    .byte 0x04, 0x80, 0xa0, 0xe1, 0x04, 0x90, 0x87, 0xe4, 0x04, 0x80, 0x58, 0xe2, 0xfc, 0xff, 0xff, 0x1a
    .byte 0x01, 0xa0, 0x5a, 0xe2, 0x0e, 0xf0, 0xa0, 0x01, 0x01, 0x7c, 0x87, 0xe2, 0x04, 0x70, 0x47, 0xe0
    .byte 0xf6, 0xff, 0xff, 0xea
    .word func_01ffd26c
    .word func_01ffc3dc
    .word func_01ffafe4
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_01ffd014
    .word func_01ffbfa0
    .word func_01ffaae4
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_01ffcd74
    .word func_01ffbabc
    .word func_01ffa664
    .byte 0x08, 0x70, 0x10, 0xe5, 0x00, 0x90, 0x90, 0xe5, 0x09, 0x70, 0x87, 0xe0, 0x04, 0x80, 0x87, 0xe0
    .byte 0x01, 0x91, 0x58, 0xe5, 0x05, 0xa4, 0x87, 0xe0, 0x01, 0xb1, 0x5a, 0xe5, 0x0b, 0x60, 0x89, 0xe0
    .byte 0x01, 0x60, 0x86, 0xe2, 0xa6, 0x60, 0xa0, 0xe1, 0x04, 0x80, 0x8a, 0xe0, 0x01, 0x61, 0x48, 0xe5
    .byte 0x10, 0x40, 0x2d, 0xe9, 0x68, 0x80, 0x4f, 0xe2, 0xa4, 0x91, 0xa0, 0xe1, 0xa5, 0xa1, 0xa0, 0xe1
    .byte 0x0a, 0x91, 0x89, 0xe0, 0x09, 0x81, 0x98, 0xe7, 0x07, 0x40, 0xa0, 0xe1, 0x0f, 0xe0, 0xa0, 0xe1
    .byte 0x08, 0xf0, 0xa0, 0xe1, 0x10, 0x80, 0xbd, 0xe8, 0x00, 0x01, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00
    .byte 0x00, 0x40, 0x2d, 0xe9, 0x04, 0x70, 0x10, 0xe5, 0x04, 0x90, 0x90, 0xe5, 0x09, 0x70, 0x87, 0xe0
    .byte 0x00, 0x00, 0x59, 0xe3, 0x80, 0x80, 0xa0, 0x03, 0x80, 0xc0, 0xa0, 0x03, 0x4d, 0x00, 0x00, 0x0a
    .byte 0x09, 0x8c, 0xb0, 0xe1, 0x29, 0x00, 0x00, 0x0a, 0x29, 0x84, 0xb0, 0xe1, 0x38, 0x00, 0x00, 0x0a
    .byte 0x00, 0x80, 0xa0, 0xe3, 0x00, 0xc0, 0xa0, 0xe3, 0x01, 0x6c, 0x47, 0xe2, 0xa4, 0xa0, 0xa0, 0xe1
    .byte 0xb2, 0x90, 0xd6, 0xe0, 0x01, 0xa0, 0x5a, 0xe2, 0x29, 0xc4, 0x8c, 0xe0, 0xff, 0x90, 0x09, 0xe2
    add r8, r8, r9
    bne .L_01ff9848
    add r8, r8, r4, lsr #0x2
    add ip, ip, r4, lsr #0x2
    sub r9, pc, #0x70
    ldrb r9, [r9, r4, lsr #0x2]
    mov lr, #0x0
    mov r11, #0x0
    mov r8, r8, lsr r9
    mov ip, ip, lsr r9
    sub r6, r7, #0x2
    mov r10, r5, lsr #0x1
.L_01ff9888:
    ldrh r9, [r6, #0x0]
    add r6, r6, #0x100
    subs r10, r10, #0x1
    add r11, r11, r9, lsr #0x8
    and r9, r9, #0xff
    add lr, lr, r9
    bne .L_01ff9888
    add lr, lr, r5, lsr #0x2
    add r11, r11, r5, lsr #0x2
    sub r9, pc, #0xb4
    ldrb r9, [r9, r5, lsr #0x2]
    mov lr, lr, lsr r9
    mov r11, r11, lsr r9
    add r8, r8, lr
    add ip, ip, r11
    add r8, r8, #0x1
    add ip, ip, #0x1
    mov r8, r8, lsr #0x1
    mov ip, ip, lsr #0x1
    b .L_01ff9960
    mov r8, #0x0
    mov ip, #0x0
    sub r6, r7, #0x100
    mov r10, r4, lsr #0x1
.L_01ff98e8:
    ldrh r9, [r6], #0x2
    subs r10, r10, #0x1
    add ip, ip, r9, lsr #0x8
    and r9, r9, #0xff
    add r8, r8, r9
    bne .L_01ff98e8
.L_01ff9900: ; inline table
    .byte 0x24, 0x81, 0x88, 0xe0, 0x24, 0xc1, 0x8c, 0xe0, 0x11, 0x9e, 0x4f, 0xe2, 0x24, 0x91, 0xd9, 0xe7
    .byte 0x38, 0x89, 0xa0, 0xe1, 0x3c, 0xc9, 0xa0, 0xe1, 0x10, 0x00, 0x00, 0xea, 0x00, 0x80, 0xa0, 0xe3
    .byte 0x00, 0xc0, 0xa0, 0xe3, 0x02, 0x60, 0x47, 0xe2, 0xa5, 0xa0, 0xa0, 0xe1, 0xb0, 0x90, 0xd6, 0xe1
    .byte 0x01, 0x6c, 0x86, 0xe2, 0x01, 0xa0, 0x5a, 0xe2, 0x29, 0xc4, 0x8c, 0xe0, 0xff, 0x90, 0x09, 0xe2
    .byte 0x09, 0x80, 0x88, 0xe0, 0xf8, 0xff, 0xff, 0x1a, 0x25, 0x81, 0x88, 0xe0, 0x25, 0xc1, 0x8c, 0xe0
    .byte 0x56, 0x9f, 0x4f, 0xe2, 0x25, 0x91, 0xd9, 0xe7, 0x38, 0x89, 0xa0, 0xe1, 0x3c, 0xc9, 0xa0, 0xe1
    .byte 0x0c, 0x84, 0x88, 0xe1, 0x08, 0x88, 0x88, 0xe1, 0xa5, 0xa0, 0xa0, 0xe1, 0xa4, 0xb0, 0xa0, 0xe1
    .byte 0x04, 0x80, 0x87, 0xe4, 0x02, 0xb0, 0x5b, 0xe2, 0xfc, 0xff, 0xff, 0x1a, 0x01, 0xa0, 0x5a, 0xe2
    .byte 0x00, 0x80, 0xbd, 0x08, 0x01, 0x7c, 0x87, 0xe2, 0x04, 0x70, 0x47, 0xe0, 0xf6, 0xff, 0xff, 0xea
    .byte 0x04, 0x70, 0x10, 0xe5, 0x04, 0x90, 0x90, 0xe5, 0xa5, 0xa0, 0xa0, 0xe1, 0x09, 0x70, 0x87, 0xe0
    .byte 0x02, 0x60, 0x47, 0xe2, 0xb0, 0x90, 0xd6, 0xe1, 0xa4, 0x80, 0xa0, 0xe1, 0x09, 0x98, 0x89, 0xe1
    .byte 0x04, 0x90, 0x87, 0xe4, 0x02, 0x80, 0x58, 0xe2, 0xfc, 0xff, 0xff, 0x1a, 0x01, 0xa0, 0x5a, 0xe2
    .byte 0x0e, 0xf0, 0xa0, 0x01, 0x01, 0x6c, 0x86, 0xe2, 0x01, 0x7c, 0x87, 0xe2, 0x04, 0x70, 0x47, 0xe0
    .byte 0xf3, 0xff, 0xff, 0xea, 0x04, 0x70, 0x10, 0xe5, 0x04, 0x90, 0x90, 0xe5, 0xa5, 0xa0, 0xa0, 0xe1
    .byte 0x09, 0x70, 0x87, 0xe0, 0x01, 0x6c, 0x47, 0xe2, 0xa4, 0x80, 0xa0, 0xe1, 0x04, 0x90, 0x96, 0xe4
    .byte 0x02, 0x80, 0x58, 0xe2, 0x00, 0x91, 0x87, 0xe5, 0x04, 0x90, 0x87, 0xe4, 0xfa, 0xff, 0xff, 0x1a
    subs r10, r10, #0x2
    moveq pc, lr
    add r7, r7, #0x200
    sub r6, r6, r4
    sub r7, r7, r4
    b #-0x2c
    arm_func_end func_01ff9660

.L_01ff9758: ; ambiguous
    .byte 0x04, 0x80, 0xa0, 0xe1, 0x04, 0x90, 0x87, 0xe4, 0x04, 0x80, 0x58, 0xe2, 0xfc, 0xff, 0xff, 0x1a
    .byte 0x01, 0xa0, 0x5a, 0xe2, 0x0e, 0xf0, 0xa0, 0x01, 0x01, 0x7c, 0x87, 0xe2, 0x04, 0x70, 0x47, 0xe0
    .byte 0xf6, 0xff, 0xff, 0xea
    .word func_01ffd26c
    .word func_01ffc3dc
    .word func_01ffafe4
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_01ffd014
    .word func_01ffbfa0
    .word func_01ffaae4
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_01ffcd74
    .word func_01ffbabc
    .word func_01ffa664
    .byte 0x08, 0x70, 0x10, 0xe5, 0x00, 0x90, 0x90, 0xe5, 0x09, 0x70, 0x87, 0xe0, 0x04, 0x80, 0x87, 0xe0
    .byte 0x01, 0x91, 0x58, 0xe5, 0x05, 0xa4, 0x87, 0xe0, 0x01, 0xb1, 0x5a, 0xe5, 0x0b, 0x60, 0x89, 0xe0
    .byte 0x01, 0x60, 0x86, 0xe2, 0xa6, 0x60, 0xa0, 0xe1, 0x04, 0x80, 0x8a, 0xe0, 0x01, 0x61, 0x48, 0xe5
    .byte 0x10, 0x40, 0x2d, 0xe9, 0x68, 0x80, 0x4f, 0xe2, 0xa4, 0x91, 0xa0, 0xe1, 0xa5, 0xa1, 0xa0, 0xe1
    .byte 0x0a, 0x91, 0x89, 0xe0, 0x09, 0x81, 0x98, 0xe7, 0x07, 0x40, 0xa0, 0xe1, 0x0f, 0xe0, 0xa0, 0xe1
    .byte 0x08, 0xf0, 0xa0, 0xe1, 0x10, 0x80, 0xbd, 0xe8, 0x00, 0x01, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00
    .byte 0x00, 0x40, 0x2d, 0xe9, 0x04, 0x70, 0x10, 0xe5, 0x04, 0x90, 0x90, 0xe5, 0x09, 0x70, 0x87, 0xe0
    .byte 0x00, 0x00, 0x59, 0xe3, 0x80, 0x80, 0xa0, 0x03, 0x80, 0xc0, 0xa0, 0x03, 0x4d, 0x00, 0x00, 0x0a
    .byte 0x09, 0x8c, 0xb0, 0xe1, 0x29, 0x00, 0x00, 0x0a, 0x29, 0x84, 0xb0, 0xe1, 0x38, 0x00, 0x00, 0x0a
    .byte 0x00, 0x80, 0xa0, 0xe3, 0x00, 0xc0, 0xa0, 0xe3, 0x01, 0x6c, 0x47, 0xe2, 0xa4, 0xa0, 0xa0, 0xe1
    .byte 0xb2, 0x90, 0xd6, 0xe0, 0x01, 0xa0, 0x5a, 0xe2, 0x29, 0xc4, 0x8c, 0xe0, 0xff, 0x90, 0x09, 0xe2
.L_01ff9900: ; ambiguous
    .byte 0x24, 0x81, 0x88, 0xe0, 0x24, 0xc1, 0x8c, 0xe0, 0x11, 0x9e, 0x4f, 0xe2, 0x24, 0x91, 0xd9, 0xe7
    .byte 0x38, 0x89, 0xa0, 0xe1, 0x3c, 0xc9, 0xa0, 0xe1, 0x10, 0x00, 0x00, 0xea, 0x00, 0x80, 0xa0, 0xe3
    .byte 0x00, 0xc0, 0xa0, 0xe3, 0x02, 0x60, 0x47, 0xe2, 0xa5, 0xa0, 0xa0, 0xe1, 0xb0, 0x90, 0xd6, 0xe1
    .byte 0x01, 0x6c, 0x86, 0xe2, 0x01, 0xa0, 0x5a, 0xe2, 0x29, 0xc4, 0x8c, 0xe0, 0xff, 0x90, 0x09, 0xe2
    .byte 0x09, 0x80, 0x88, 0xe0, 0xf8, 0xff, 0xff, 0x1a, 0x25, 0x81, 0x88, 0xe0, 0x25, 0xc1, 0x8c, 0xe0
    .byte 0x56, 0x9f, 0x4f, 0xe2, 0x25, 0x91, 0xd9, 0xe7, 0x38, 0x89, 0xa0, 0xe1, 0x3c, 0xc9, 0xa0, 0xe1
    .byte 0x0c, 0x84, 0x88, 0xe1, 0x08, 0x88, 0x88, 0xe1, 0xa5, 0xa0, 0xa0, 0xe1, 0xa4, 0xb0, 0xa0, 0xe1
    .byte 0x04, 0x80, 0x87, 0xe4, 0x02, 0xb0, 0x5b, 0xe2, 0xfc, 0xff, 0xff, 0x1a, 0x01, 0xa0, 0x5a, 0xe2
    .byte 0x00, 0x80, 0xbd, 0x08, 0x01, 0x7c, 0x87, 0xe2, 0x04, 0x70, 0x47, 0xe0, 0xf6, 0xff, 0xff, 0xea
    .byte 0x04, 0x70, 0x10, 0xe5, 0x04, 0x90, 0x90, 0xe5, 0xa5, 0xa0, 0xa0, 0xe1, 0x09, 0x70, 0x87, 0xe0
    .byte 0x02, 0x60, 0x47, 0xe2, 0xb0, 0x90, 0xd6, 0xe1, 0xa4, 0x80, 0xa0, 0xe1, 0x09, 0x98, 0x89, 0xe1
    .byte 0x04, 0x90, 0x87, 0xe4, 0x02, 0x80, 0x58, 0xe2, 0xfc, 0xff, 0xff, 0x1a, 0x01, 0xa0, 0x5a, 0xe2
    .byte 0x0e, 0xf0, 0xa0, 0x01, 0x01, 0x6c, 0x86, 0xe2, 0x01, 0x7c, 0x87, 0xe2, 0x04, 0x70, 0x47, 0xe0
    .byte 0xf3, 0xff, 0xff, 0xea, 0x04, 0x70, 0x10, 0xe5, 0x04, 0x90, 0x90, 0xe5, 0xa5, 0xa0, 0xa0, 0xe1
    .byte 0x09, 0x70, 0x87, 0xe0, 0x01, 0x6c, 0x47, 0xe2, 0xa4, 0x80, 0xa0, 0xe1, 0x04, 0x90, 0x96, 0xe4
    .byte 0x02, 0x80, 0x58, 0xe2, 0x00, 0x91, 0x87, 0xe5, 0x04, 0x90, 0x87, 0xe4, 0xfa, 0xff, 0xff, 0x1a
    .byte 0x02, 0xa0, 0x5a, 0xe2, 0x0e, 0xf0, 0xa0, 0x01, 0x02, 0x7c, 0x87, 0xe2, 0x04, 0x60, 0x46, 0xe0
    .byte 0x04, 0x70, 0x47, 0xe0, 0xf3, 0xff, 0xff, 0xea, 0x0c, 0xd2, 0xff, 0x01, 0x28, 0xc3, 0xff, 0x01
    .byte 0x94, 0xae, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x60, 0xcf, 0xff, 0x01, 0x70, 0xbe, 0xff, 0x01
    .byte 0x60, 0xaa, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x24, 0xcc, 0xff, 0x01, 0x34, 0xba, 0xff, 0x01
    .byte 0xdc, 0xa5, 0xff, 0x01

    .global func_01ff9a44
    arm_func_start func_01ff9a44
func_01ff9a44: ; 0x01ff9a44
    stmdb sp!, {lr}
    ldr r7, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r7, r7, r9
    add r8, r7, r4
    ldrb r9, [r8, #-0x102]
    ldrb r10, [r8, #-0x101]
    add r8, r7, r5, lsl #0x7
    ldrb r11, [r8, #-0x102]
    ldrb ip, [r8, #-0x101]
    add r9, r9, r11
    add r10, r10, ip
    add r9, r9, #0x1
    add r10, r10, #0x1
    mov r11, r9, lsr #0x1
    mov ip, r10, lsr #0x1
    add r8, r7, r4
    add r8, r8, r5, lsl #0x7
    strb r11, [r8, #-0x102]
    strb ip, [r8, #-0x101]
    sub r8, pc, #0x84
    mov r9, r4, lsr #0x3
    mov r10, r5, lsr #0x3
    add r9, r9, r10, lsl #0x2
    ldr r5, [r8, r9, lsl #0x2]
    mov r4, r7
    mov r6, r11
    mov lr, pc
    mov pc, r5
    arm_func_end func_01ff9a44

    .global func_01ff9ab8
    arm_func_start func_01ff9ab8
func_01ff9ab8: ; 0x01ff9ab8
    add r4, r4, #0x1
    mov r6, ip
    mov lr, pc
    mov pc, r5
    arm_func_end func_01ff9ab8

    .global func_01ff9ac8
    arm_func_start func_01ff9ac8
func_01ff9ac8: ; 0x01ff9ac8
    ldmia sp!, {pc}
    arm_func_end func_01ff9ac8

    .global func_01ff9acc
    arm_func_start func_01ff9acc
func_01ff9acc: ; 0x01ff9acc
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldr r10, [r9, #-0x100]
    str r10, [r9, #0x0]
    str r10, [r9, #0x100]
    str r10, [r9, #0x200]
    str r10, [r9, #0x300]
    mov pc, lr
    arm_func_end func_01ff9acc

    .global func_01ff9aec
    arm_func_start func_01ff9aec
func_01ff9aec: ; 0x01ff9aec
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldrb r10, [r9, #-0x1]
    orr r10, r10, r10, lsl #0x8
    orr r10, r10, r10, lsl #0x10
    str r10, [r9, #0x0]
    ldrb r10, [r9, #0xff]
    orr r10, r10, r10, lsl #0x8
    orr r10, r10, r10, lsl #0x10
    str r10, [r9, #0x100]
    ldrb r10, [r9, #0x1ff]
    orr r10, r10, r10, lsl #0x8
    orr r10, r10, r10, lsl #0x10
    str r10, [r9, #0x200]
    ldrb r10, [r9, #0x2ff]
    orr r10, r10, r10, lsl #0x8
    orr r10, r10, r10, lsl #0x10
    str r10, [r9, #0x300]
    mov pc, lr
    arm_func_end func_01ff9aec

    .global func_01ff9b38
    arm_func_start func_01ff9b38
func_01ff9b38: ; 0x01ff9b38
    ldrb r10, [r9, #-0x100]
    add r6, r6, r10
    ldrb r10, [r9, #-0xff]
    add r6, r6, r10
    ldrb r10, [r9, #-0xfe]
    add r6, r6, r10
    ldrb r10, [r9, #-0xfd]
    add r6, r6, r10
    add r6, r6, #0x2
    add r7, r7, #0x1
    mov pc, lr
    arm_func_end func_01ff9b38

    .global func_01ff9b64
    arm_func_start func_01ff9b64
func_01ff9b64: ; 0x01ff9b64
    ldrb r10, [r9, #-0x1]
    add r6, r6, r10
    ldrb r10, [r9, #0xff]
    add r6, r6, r10
    ldrb r10, [r9, #0x1ff]
    add r6, r6, r10
    ldrb r10, [r9, #0x2ff]
    add r6, r6, r10
    add r6, r6, #0x2
    add r7, r7, #0x1
    mov pc, lr
    arm_func_end func_01ff9b64

    .global func_01ff9b90
    arm_func_start func_01ff9b90
func_01ff9b90: ; 0x01ff9b90
    stmdb sp!, {r6, r7, r8, lr}
    ldr r9, [r0, #-0x8]
    cmp r8, #0x0
    add r9, r9, r8
    moveq r6, #0x80
    beq .L_01ff9bc4
    mov r6, #0x0
    mov r7, #0x1
    movs r10, r8, lsl #0x18
    blne func_01ff9b64
    movs r10, r8, lsr #0x8
    blne func_01ff9b38
    mov r6, r6, lsr r7
.L_01ff9bc4:
    orr r6, r6, r6, lsl #0x8
    orr r6, r6, r6, lsl #0x10
    str r6, [r9, #0x0]
    str r6, [r9, #0x100]
    str r6, [r9, #0x200]
    str r6, [r9, #0x300]
    ldmia sp!, {r6, r7, r8, pc}
    arm_func_end func_01ff9b90

    .global func_01ff9be0
    arm_func_start func_01ff9be0
func_01ff9be0: ; 0x01ff9be0
    stmdb sp!, {r6, r7}
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldrb r6, [r9, #-0x100]
    ldrb r7, [r9, #-0xff]
    ldrb r10, [r9, #-0xfe]
    add r6, r6, r10
    add r6, r6, r7, lsl #0x1
    add r6, r6, #0x2
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x0]
    ldrb r6, [r9, #-0xfd]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x1]
    strb r7, [r9, #0x100]
    ldrb r7, [r9, #-0xfc]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x2]
    strb r10, [r9, #0x101]
    strb r10, [r9, #0x200]
    ldrb r10, [r9, #-0xfb]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x3]
    strb r6, [r9, #0x102]
    strb r6, [r9, #0x201]
    strb r6, [r9, #0x300]
    ldrb r6, [r9, #-0xfa]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x103]
    strb r7, [r9, #0x202]
    strb r7, [r9, #0x301]
    ldrb r7, [r9, #-0xf9]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x203]
    strb r10, [r9, #0x302]
    add r6, r6, r7
    add r6, r6, r7, lsl #0x1
    add r6, r6, #0x2
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x303]
    ldmia sp!, {r6, r7}
    mov pc, lr
    arm_func_end func_01ff9be0

    .global func_01ff9cc4
    arm_func_start func_01ff9cc4
func_01ff9cc4: ; 0x01ff9cc4
    stmdb sp!, {r6, r7}
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldrb r6, [r9, #0x2ff]
    ldrb r7, [r9, #0x1ff]
    ldrb r10, [r9, #0xff]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x300]
    ldrb r6, [r9, #-0x1]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x200]
    strb r7, [r9, #0x301]
    ldrb r7, [r9, #-0x101]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x100]
    strb r10, [r9, #0x201]
    strb r10, [r9, #0x302]
    ldrb r10, [r9, #-0x100]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x0]
    strb r6, [r9, #0x101]
    strb r6, [r9, #0x202]
    strb r6, [r9, #0x303]
    ldrb r6, [r9, #-0xff]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x1]
    strb r7, [r9, #0x102]
    strb r7, [r9, #0x203]
    ldrb r7, [r9, #-0xfe]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x2]
    strb r10, [r9, #0x103]
    ldrb r10, [r9, #-0xfd]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x3]
    ldmia sp!, {r6, r7}
    mov pc, lr
    arm_func_end func_01ff9cc4

    .global func_01ff9dac
    arm_func_start func_01ff9dac
func_01ff9dac: ; 0x01ff9dac
    stmdb sp!, {r6, r7}
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldrb r6, [r9, #0x1ff]
    ldrb r7, [r9, #0xff]
    ldrb r10, [r9, #-0x1]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x300]
    ldrb r6, [r9, #-0x101]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x200]
    ldrb r7, [r9, #-0x100]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x100]
    strb r10, [r9, #0x301]
    add r10, r6, r7
    add r10, r10, #0x1
    mov r10, r10, lsr #0x1
    strb r10, [r9, #0x0]
    strb r10, [r9, #0x201]
    ldrb r10, [r9, #-0xff]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x101]
    strb r6, [r9, #0x302]
    add r6, r7, r10
    add r6, r6, #0x1
    mov r6, r6, lsr #0x1
    strb r6, [r9, #0x1]
    strb r6, [r9, #0x202]
    ldrb r6, [r9, #-0xfe]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x102]
    strb r7, [r9, #0x303]
    add r7, r6, r10
    add r7, r7, #0x1
    mov r7, r7, lsr #0x1
    strb r7, [r9, #0x2]
    strb r7, [r9, #0x203]
    ldrb r7, [r9, #-0xfd]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x103]
    add r10, r6, r7
    add r10, r10, #0x1
    mov r10, r10, lsr #0x1
    strb r10, [r9, #0x3]
    ldmia sp!, {r6, r7}
    mov pc, lr
    arm_func_end func_01ff9dac

    .global func_01ff9eb0
    arm_func_start func_01ff9eb0
func_01ff9eb0: ; 0x01ff9eb0
    stmdb sp!, {r6, r7}
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldrb r6, [r9, #0x2ff]
    ldrb r7, [r9, #0x1ff]
    add r10, r6, r7
    add r10, r10, #0x1
    mov r10, r10, lsr #0x1
    strb r10, [r9, #0x300]
    ldrb r10, [r9, #0xff]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x301]
    add r6, r7, r10
    add r6, r6, #0x1
    mov r6, r6, lsr #0x1
    strb r6, [r9, #0x200]
    strb r6, [r9, #0x302]
    ldrb r6, [r9, #-0x1]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x201]
    strb r7, [r9, #0x303]
    add r7, r6, r10
    add r7, r7, #0x1
    mov r7, r7, lsr #0x1
    strb r7, [r9, #0x100]
    strb r7, [r9, #0x202]
    ldrb r7, [r9, #-0x101]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x101]
    strb r10, [r9, #0x203]
    add r10, r6, r7
    add r10, r10, #0x1
    mov r10, r10, lsr #0x1
    strb r10, [r9, #0x0]
    strb r10, [r9, #0x102]
    ldrb r10, [r9, #-0x100]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x1]
    strb r6, [r9, #0x103]
    ldrb r6, [r9, #-0xff]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x2]
    ldrb r7, [r9, #-0xfe]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x3]
    ldmia sp!, {r6, r7}
    mov pc, lr
    arm_func_end func_01ff9eb0

    .global func_01ff9fb4
    arm_func_start func_01ff9fb4
func_01ff9fb4: ; 0x01ff9fb4
    stmdb sp!, {r6, r7}
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldrb r6, [r9, #-0xfa]
    ldrb r7, [r9, #-0xfb]
    ldrb r10, [r9, #-0xfc]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x303]
    add r6, r7, r10
    add r6, r6, #0x1
    mov r6, r6, lsr #0x1
    strb r6, [r9, #0x203]
    ldrb r6, [r9, #-0xfd]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x103]
    strb r7, [r9, #0x302]
    add r7, r6, r10
    add r7, r7, #0x1
    mov r7, r7, lsr #0x1
    strb r7, [r9, #0x3]
    strb r7, [r9, #0x202]
    ldrb r7, [r9, #-0xfe]
    add r10, r10, #0x2
    add r10, r10, r6, lsl #0x1
    add r10, r10, r7
    mov r10, r10, lsr #0x2
    strb r10, [r9, #0x102]
    strb r10, [r9, #0x301]
    add r10, r6, r7
    add r10, r10, #0x1
    mov r10, r10, lsr #0x1
    strb r10, [r9, #0x2]
    strb r10, [r9, #0x201]
    ldrb r10, [r9, #-0xff]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x101]
    strb r6, [r9, #0x300]
    add r6, r7, r10
    add r6, r6, #0x1
    mov r6, r6, lsr #0x1
    strb r6, [r9, #0x1]
    strb r6, [r9, #0x200]
    ldrb r6, [r9, #-0x100]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x100]
    add r7, r6, r10
    add r7, r7, #0x1
    mov r7, r7, lsr #0x1
    strb r7, [r9, #0x0]
    ldmia sp!, {r6, r7}
    mov pc, lr
    arm_func_end func_01ff9fb4

    .global func_01ffa0b0
    arm_func_start func_01ffa0b0
func_01ffa0b0: ; 0x01ffa0b0
    stmdb sp!, {r6, r7}
    ldr r9, [r0, #-0x8]
    add r9, r9, r8
    ldrb r6, [r9, #-0x1]
    ldrb r7, [r9, #0xff]
    add r10, r6, r7
    add r10, r10, #0x1
    mov r10, r10, lsr #0x1
    strb r10, [r9, #0x0]
    ldrb r10, [r9, #0x1ff]
    add r6, r6, #0x2
    add r6, r6, r7, lsl #0x1
    add r6, r6, r10
    mov r6, r6, lsr #0x2
    strb r6, [r9, #0x1]
    add r6, r7, r10
    add r6, r6, #0x1
    mov r6, r6, lsr #0x1
    strb r6, [r9, #0x2]
    strb r6, [r9, #0x100]
    ldrb r6, [r9, #0x2ff]
    add r7, r7, #0x2
    add r7, r7, r10, lsl #0x1
    add r7, r7, r6
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x3]
    strb r7, [r9, #0x101]
    add r7, r6, r10
    add r7, r7, #0x1
    mov r7, r7, lsr #0x1
    strb r7, [r9, #0x102]
    strb r7, [r9, #0x200]
    add r7, r6, r10
    add r7, r7, r6, lsl #0x1
    add r7, r7, #0x2
    mov r7, r7, lsr #0x2
    strb r7, [r9, #0x103]
    strb r7, [r9, #0x201]
    strb r6, [r9, #0x300]
    strb r6, [r9, #0x202]
    strb r6, [r9, #0x203]
    strb r6, [r9, #0x301]
    strb r6, [r9, #0x302]
    strb r6, [r9, #0x303]
    ldmia sp!, {r6, r7}
    mov pc, lr
    arm_func_end func_01ffa0b0

    .byte 0xe0, 0xa1, 0xff, 0x01, 0x50, 0xa2, 0xff, 0x01, 0xe8, 0xa2, 0xff, 0x01, 0xa0, 0xa3, 0xff, 0x01

    .global func_01ffa178
    arm_func_start func_01ffa178
func_01ffa178: ; 0x01ffa178
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    and r4, r11, #0x3
    sub r8, pc, #0x38
    ldr r8, [r8, r4, lsl #0x2]
    mov pc, r8
    arm_func_end func_01ffa178

    .global func_01ffa1a4
    arm_func_start func_01ffa1a4
func_01ffa1a4: ; 0x01ffa1a4
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bl func_01ff9450
    add r11, r11, r6
    bl func_01ff9450
    add ip, ip, r6
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    and r4, r11, #0x3
    sub r8, pc, #0x74
    ldr r8, [r8, r4, lsl #0x2]
    mov pc, r8
    arm_func_end func_01ffa1a4

    .global func_01ffa1e0
    arm_func_start func_01ffa1e0
func_01ffa1e0: ; 0x01ffa1e0
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffa1fc:
    ldmia r4, {r6, r7, r8, r9}
    add r4, r4, #0x100
    subs r11, r11, #0x1
    stmia r5, {r6, r7, r8, r9}
    add r5, r5, #0x100
    bne .L_01ffa1fc
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffa234:
    ldmia r4, {r6, r7, r8, r9}
    add r4, r4, #0x100
    subs r11, r11, #0x1
    stmia r5, {r6, r7, r8, r9}
    add r5, r5, #0x100
    bne .L_01ffa234
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffa1e0

    .global func_01ffa250
    arm_func_start func_01ffa250
func_01ffa250: ; 0x01ffa250
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    sub r4, r4, #0x1
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffa270:
    ldmia r4, {r6, r7, r8, r9}
    ldrb r10, [r4, #0x10]
    mov r6, r6, lsr #0x8
    orr r6, r6, r7, lsl #0x18
    mov r7, r7, lsr #0x8
    orr r7, r7, r8, lsl #0x18
    mov r8, r8, lsr #0x8
    orr r8, r8, r9, lsl #0x18
    mov r9, r9, lsr #0x8
    orr r9, r9, r10, lsl #0x18
    stmia r5, {r6, r7, r8, r9}
    add r4, r4, #0x100
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffa270
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffa2cc:
    ldmia r4, {r6, r7, r8, r9}
    add r4, r4, #0x100
    subs r11, r11, #0x1
    stmia r5, {r6, r7, r8, r9}
    add r5, r5, #0x100
    bne .L_01ffa2cc
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffa250

    .global func_01ffa2e8
    arm_func_start func_01ffa2e8
func_01ffa2e8: ; 0x01ffa2e8
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffa304:
    ldrh r6, [r4], #0x2
    ldmia r4, {r7, r8, r9}
    ldrh r10, [r4, #0xc]
    orr r6, r6, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    orr r7, r7, r8, lsl #0x10
    mov r8, r8, lsr #0x10
    orr r8, r8, r9, lsl #0x10
    mov r9, r9, lsr #0x10
    orr r9, r9, r10, lsl #0x10
    stmia r5, {r6, r7, r8, r9}
    add r4, r4, #0xfe
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffa304
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffa360:
    ldrh r6, [r4], #0x2
    ldmia r4, {r7, r8, r9}
    ldrh r10, [r4, #0xc]
    orr r6, r6, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    orr r7, r7, r8, lsl #0x10
    mov r8, r8, lsr #0x10
    orr r8, r8, r9, lsl #0x10
    mov r9, r9, lsr #0x10
    orr r9, r9, r10, lsl #0x10
    stmia r5, {r6, r7, r8, r9}
    add r4, r4, #0xfe
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffa360
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffa2e8

    .global func_01ffa3a0
    arm_func_start func_01ffa3a0
func_01ffa3a0: ; 0x01ffa3a0
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffa3bc:
    ldrb r6, [r4], #0x1
    ldmia r4, {r7, r8, r9, r10}
    orr r6, r6, r7, lsl #0x8
    mov r7, r7, lsr #0x18
    orr r7, r7, r8, lsl #0x8
    mov r8, r8, lsr #0x18
    orr r8, r8, r9, lsl #0x8
    mov r9, r9, lsr #0x18
    orr r9, r9, r10, lsl #0x8
    stmia r5, {r6, r7, r8, r9}
    add r4, r4, #0xff
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffa3bc
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffa414:
    ldrh r6, [r4], #0x2
    ldmia r4, {r7, r8, r9}
    ldrh r10, [r4, #0xc]
    orr r6, r6, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    orr r7, r7, r8, lsl #0x10
    mov r8, r8, lsr #0x10
    orr r8, r8, r9, lsl #0x10
    mov r9, r9, lsr #0x10
    orr r9, r9, r10, lsl #0x10
    stmia r5, {r6, r7, r8, r9}
    add r4, r4, #0xfe
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffa414
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffa3a0

    .global func_01ffa454
    arm_func_start func_01ffa454
func_01ffa454: ; 0x01ffa454
    stmdb sp!, {r4, r11, ip, lr}
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    add r11, r7, r6, lsl #0x8
    bic r6, r6, #0x1
    bic r7, r7, #0x1
    add ip, r7, r6, lsl #0x7
    bl func_01ff9450
    mov r8, r6
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    ldr r4, [r0, #-0x20]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldmia sp, {r11}
    add r4, r4, r9
    add r5, r5, r9
.L_01ffa4a4:
    stmdb sp!, {r11}
    mov r11, #0x4
.L_01ffa4ac:
    ldrb r9, [r4], #0x4
    ldrb r10, [r4, #-0x3]
    adds r9, r9, r8, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x8
    ldrb r10, [r4, #-0x2]
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x10
    ldrb r10, [r4, #-0x1]
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x18
    str r9, [r5], #0x4
    subs r11, r11, #0x1
    bne .L_01ffa4ac
    ldmia sp!, {r11}
    add r4, r4, #0xf0
    add r5, r5, #0xf0
    subs r11, r11, #0x1
    bne .L_01ffa4a4
    ldr r4, [r0, #-0x1c]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldmia sp!, {r11}
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffa548:
    stmdb sp!, {r11}
    mov r11, #0x4
.L_01ffa550:
    ldrh r8, [r4, #0x0]
    ldrh r10, [r4, #0x2]
    add r4, r4, #0x4
    and r9, r8, #0xff
    mov r8, r8, lsr #0x8
    adds r9, r9, r7, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r8, r8, r6, lsl #0x1
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    orr r9, r9, r8, lsl #0x8
    and ip, r10, #0xff
    mov r10, r10, lsr #0x8
    adds ip, ip, r7, lsl #0x1
    movlt ip, #0x0
    cmp ip, #0xff
    movgt ip, #0xff
    adds r10, r10, r6, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    orr r9, r9, ip, lsl #0x10
    orr r9, r9, r10, lsl #0x18
    str r9, [r5], #0x4
    subs r11, r11, #0x1
    bne .L_01ffa550
    ldmia sp!, {r11}
    add r4, r4, #0xf0
    add r5, r5, #0xf0
    subs r11, r11, #0x1
    bne .L_01ffa548
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffa454

    .global func_01ffa5dc
    arm_func_start func_01ffa5dc
func_01ffa5dc: ; 0x01ffa5dc
    stmdb sp!, {lr}
    ldrb r7, [r4, #0x6fe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x706]
    ldrb r8, [r4, #-0xf2]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x30e]
    ldrb r6, [r4, #-0xfa]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x306]
    bl func_01ffbe70
    add r4, r4, #0x8
    bl func_01ffbe70
    add r4, r4, #0x3f8
    bl func_01ffbe70
    add r4, r4, #0x8
    bl func_01ffbe70
    sub r4, r4, #0x400
    sub r4, r4, #0x8
    ldmia sp!, {pc}
    arm_func_end func_01ffa5dc

    .global func_01ffa638
    arm_func_start func_01ffa638
func_01ffa638: ; 0x01ffa638
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xf2]
    ldrb r10, [r4, #0x6fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x70e]
    bl func_01ffa5dc
    ldmia sp!, {pc}
    arm_func_end func_01ffa638

    .global func_01ffa664
    arm_func_start func_01ffa664
func_01ffa664: ; 0x01ffa664
    stmdb sp!, {lr}
    ldrb r7, [r4, #0xeff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0xf07]
    ldrb r8, [r4, #-0xf1]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x70f]
    ldrb r6, [r4, #-0xf9]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x707]
    bl func_01ffbfa0
    add r4, r4, #0x8
    bl func_01ffbfa0
    add r4, r4, #0x800
    sub r4, r4, #0x8
    bl func_01ffbfa0
    add r4, r4, #0x8
    bl func_01ffbfa0
    ldmia sp!, {pc}
    arm_func_end func_01ffa664

    .global func_01ffa6bc
    arm_func_start func_01ffa6bc
func_01ffa6bc: ; 0x01ffa6bc
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf1]
    ldrb r10, [r4, #0xeff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0xf0f]
    bl func_01ffa664
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffa638
    add r4, r4, #0x1
    bl func_01ffa638
    ldmia sp!, {pc}
    arm_func_end func_01ffa6bc

    .global func_01ffa70c
    arm_func_start func_01ffa70c
func_01ffa70c: ; 0x01ffa70c
    mov r9, #0x0
    ldr r4, [r0, #0x8]
    strb r9, [r4, #0x0]
    strb r9, [r4, #0x1]
    strb r9, [r4, #0x2]
    strb r9, [r4, #0x3]
    strb r9, [r4, #0x41]
    strb r9, [r4, #0x42]
    strb r9, [r4, #0x43]
    strb r9, [r4, #0x44]
    strb r9, [r4, #0x82]
    strb r9, [r4, #0x83]
    strb r9, [r4, #0x84]
    strb r9, [r4, #0x85]
    strb r9, [r4, #0xc3]
    strb r9, [r4, #0xc4]
    strb r9, [r4, #0xc5]
    strb r9, [r4, #0xc6]
    ldr r4, [r0, #0xc]
    strb r9, [r4, #0x0]
    strb r9, [r4, #0x1]
    strb r9, [r4, #0x21]
    strb r9, [r4, #0x22]
    ldmia sp!, {pc}
    arm_func_end func_01ffa70c

    .global func_01ffa76c
    arm_func_start func_01ffa76c
func_01ffa76c: ; 0x01ffa76c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffa790
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffa790
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffa790
.L_01ffa790:
    mov r4, #0x10
    bl func_01ffa178
    b func_01ffa70c
    arm_func_end func_01ffa76c

    .global func_01ffa79c
    arm_func_start func_01ffa79c
func_01ffa79c: ; 0x01ffa79c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffa7c0
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffa7c0
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffa7c0
.L_01ffa7c0:
    mov r4, #0x10
    bl func_01ffa1a4
    b func_01ffa70c
    arm_func_end func_01ffa79c

    .global func_01ffa7cc
    arm_func_start func_01ffa7cc
func_01ffa7cc: ; 0x01ffa7cc
    stmdb sp!, {r11, ip}
    bl func_01ffa6bc
    ldmia sp!, {r11, ip}
    b func_01ffa70c
    arm_func_end func_01ffa7cc

    .global func_01ffa7dc
    arm_func_start func_01ffa7dc
func_01ffa7dc: ; 0x01ffa7dc
    mov r4, #0x10
    bl func_01ffa454
    b func_01ffa70c
    arm_func_end func_01ffa7dc

    .global func_01ffa7e8
    arm_func_start func_01ffa7e8
func_01ffa7e8: ; 0x01ffa7e8
    mov r4, #0x10
    mov r5, #0x10
    bl func_01ff94ac
    b func_01ffa70c
    arm_func_end func_01ffa7e8

    .global func_01ffa7f8
    arm_func_start func_01ffa7f8
func_01ffa7f8: ; 0x01ffa7f8
    mov r4, #0x10
    mov r5, #0x10
    bl func_01ff9508
    b func_01ffa70c
    arm_func_end func_01ffa7f8

    .global func_01ffa808
    arm_func_start func_01ffa808
func_01ffa808: ; 0x01ffa808
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffa82c
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffa82c
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffa82c
.L_01ffa82c:
    mov r4, #0x10
    bl func_01ffa178
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x10
    b .L_01ffe420
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffa868
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffa868
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffa868
.L_01ffa868:
    mov r4, #0x10
    bl func_01ffa1a4
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x10
    b .L_01ffe420
    stmdb sp!, {r11, ip}
    bl func_01ffa6bc
    mov r11, #0x10
    mov ip, #0x10
    b .L_01ffe420
    mov r4, #0x10
    bl func_01ffa454
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x10
    b .L_01ffe420
    mov r4, #0x10
    mov r5, #0x10
    bl func_01ff94ac
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x10
    b .L_01ffe420
    mov r4, #0x10
    mov r5, #0x10
    bl func_01ff9508
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x10
    b .L_01ffe420
    bl func_01ffae80
    ldmia r0, {r4, r5, r6, r7}
    add r4, r4, #0x800
    add r5, r5, #0x400
    add r6, r6, #0x82
    add r7, r7, #0x21
    stmia r0, {r4, r5, r6, r7}
    bl func_01ffae80
    ldmia r0, {r4, r5, r6, r7}
    sub r4, r4, #0x800
    sub r5, r5, #0x400
    sub r6, r6, #0x82
    sub r7, r7, #0x21
    stmia r0, {r4, r5, r6, r7}
    ldmia sp!, {pc}
    arm_func_end func_01ffa808

    .global func_01ffa920
    arm_func_start func_01ffa920
func_01ffa920: ; 0x01ffa920
    bl func_01ffbe5c
    ldmia r0, {r4, r5, r6, r7}
    add r4, r4, #0x8
    add r5, r5, #0x8
    add r6, r6, #0x2
    add r7, r7, #0x1
    stmia r0, {r4, r5, r6, r7}
    bl func_01ffbe5c
    ldmia r0, {r4, r5, r6, r7}
    sub r4, r4, #0x8
    sub r5, r5, #0x8
    sub r6, r6, #0x2
    sub r7, r7, #0x1
    stmia r0, {r4, r5, r6, r7}
    ldmia sp!, {pc}
    arm_func_end func_01ffa920

    .byte 0x47, 0x01, 0x00, 0xeb, 0xf0, 0x00, 0x90, 0xe8, 0x02, 0x4b, 0x84, 0xe2, 0x01, 0x5b, 0x85, 0xe2
    .byte 0x82, 0x60, 0x86, 0xe2, 0x21, 0x70, 0x87, 0xe2, 0xf0, 0x00, 0x80, 0xe8, 0x40, 0x01, 0x00, 0xeb
    .byte 0xf0, 0x00, 0x90, 0xe8, 0x02, 0x4b, 0x44, 0xe2, 0x01, 0x5b, 0x45, 0xe2, 0x82, 0x60, 0x46, 0xe2
    .byte 0x21, 0x70, 0x47, 0xe2, 0xf0, 0x00, 0x80, 0xe8, 0x00, 0x18, 0x2d, 0xe9, 0x10, 0xb0, 0xa0, 0xe3
    .byte 0x10, 0xc0, 0xa0, 0xe3, 0x9e, 0x0e, 0x00, 0xea, 0x2c, 0x05, 0x00, 0xeb, 0xf0, 0x00, 0x90, 0xe8
    .byte 0x08, 0x40, 0x84, 0xe2, 0x08, 0x50, 0x85, 0xe2, 0x02, 0x60, 0x86, 0xe2, 0x01, 0x70, 0x87, 0xe2
    .byte 0xf0, 0x00, 0x80, 0xe8, 0x25, 0x05, 0x00, 0xeb, 0xf0, 0x00, 0x90, 0xe8, 0x08, 0x40, 0x44, 0xe2
    .byte 0x08, 0x50, 0x45, 0xe2, 0x02, 0x60, 0x46, 0xe2, 0x01, 0x70, 0x47, 0xe2, 0xf0, 0x00, 0x80, 0xe8
    .byte 0x00, 0x18, 0x2d, 0xe9, 0x10, 0xb0, 0xa0, 0xe3, 0x10, 0xc0, 0xa0, 0xe3, 0x8c, 0x0e, 0x00, 0xea
    .byte 0x20, 0xa9, 0xff, 0x01, 0x6c, 0xa7, 0xff, 0x01, 0xe4, 0xa8, 0xff, 0x01, 0xdc, 0xa7, 0xff, 0x01
    .byte 0x9c, 0xa7, 0xff, 0x01, 0xa8, 0xa7, 0xff, 0x01, 0xb4, 0xa7, 0xff, 0x01, 0xcc, 0xa7, 0xff, 0x01
    .byte 0xa4, 0xa9, 0xff, 0x01, 0x78, 0xa7, 0xff, 0x01, 0x94, 0xa8, 0xff, 0x01, 0xe8, 0xa7, 0xff, 0x01
    .byte 0x08, 0xa8, 0xff, 0x01, 0x5c, 0xa9, 0xff, 0x01, 0x84, 0xa7, 0xff, 0x01, 0xf8, 0xa7, 0xff, 0x01
    .byte 0x44, 0xa8, 0xff, 0x01, 0x50, 0xa8, 0xff, 0x01, 0x5c, 0xa8, 0xff, 0x01, 0xc8, 0xa8, 0xff, 0x01
    .byte 0x14, 0xa8, 0xff, 0x01, 0x20, 0xa8, 0xff, 0x01, 0xac, 0xa8, 0xff, 0x01, 0x80, 0xa8, 0xff, 0x01

    .global func_01ffaa4c
    arm_func_start func_01ffaa4c
func_01ffaa4c: ; 0x01ffaa4c
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x70
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffaa4c

    .global func_01ffaa60
    arm_func_start func_01ffaa60
func_01ffaa60: ; 0x01ffaa60
    stmdb sp!, {lr}
    ldrb r7, [r4, #0x2fe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x306]
    ldrb r8, [r4, #-0xf2]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10e]
    ldrb r6, [r4, #0xfe]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x106]
    bl func_01ffc328
    add r4, r4, #0x8
    bl func_01ffc328
    add r4, r4, #0x1f8
    bl func_01ffc328
    add r4, r4, #0x8
    bl func_01ffc328
    sub r4, r4, #0x208
    ldmia sp!, {pc}
    arm_func_end func_01ffaa60

    .global func_01ffaab8
    arm_func_start func_01ffaab8
func_01ffaab8: ; 0x01ffaab8
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xf2]
    ldrb r10, [r4, #0x2fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x30e]
    bl func_01ffaa60
    ldmia sp!, {pc}
    arm_func_end func_01ffaab8

    .global func_01ffaae4
    arm_func_start func_01ffaae4
func_01ffaae4: ; 0x01ffaae4
    stmdb sp!, {lr}
    ldrb r7, [r4, #0x6ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x707]
    ldrb r8, [r4, #-0xf1]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x30f]
    ldrb r6, [r4, #0x2ff]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x307]
    bl func_01ffc3dc
    add r4, r4, #0x8
    bl func_01ffc3dc
    add r4, r4, #0x3f8
    bl func_01ffc3dc
    add r4, r4, #0x8
    bl func_01ffc3dc
    ldmia sp!, {pc}
    arm_func_end func_01ffaae4

    .global func_01ffab38
    arm_func_start func_01ffab38
func_01ffab38: ; 0x01ffab38
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf1]
    ldrb r10, [r4, #0x6ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x70f]
    bl func_01ffaae4
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffaab8
    add r4, r4, #0x1
    bl func_01ffaab8
    ldmia sp!, {pc}
    arm_func_end func_01ffab38

    .global func_01ffab88
    arm_func_start func_01ffab88
func_01ffab88: ; 0x01ffab88
    mov r9, #0x0
    ldr r4, [r0, #0x8]
    strb r9, [r4, #0x0]
    strb r9, [r4, #0x1]
    strb r9, [r4, #0x2]
    strb r9, [r4, #0x3]
    strb r9, [r4, #0x41]
    strb r9, [r4, #0x42]
    strb r9, [r4, #0x43]
    strb r9, [r4, #0x44]
    ldr r4, [r0, #0xc]
    strb r9, [r4, #0x0]
    strb r9, [r4, #0x1]
    ldmia sp!, {pc}
    arm_func_end func_01ffab88

    .global func_01ffabc0
    arm_func_start func_01ffabc0
func_01ffabc0: ; 0x01ffabc0
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffabe4
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffabe4
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffabe4
.L_01ffabe4:
    mov r4, #0x8
    bl func_01ffa178
    b func_01ffab88
    arm_func_end func_01ffabc0

    .global func_01ffabf0
    arm_func_start func_01ffabf0
func_01ffabf0: ; 0x01ffabf0
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffac14
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffac14
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffac14
.L_01ffac14:
    mov r4, #0x8
    bl func_01ffa1a4
    b func_01ffab88
    arm_func_end func_01ffabf0

    .global func_01ffac20
    arm_func_start func_01ffac20
func_01ffac20: ; 0x01ffac20
    stmdb sp!, {r11, ip}
    bl func_01ffab38
    ldmia sp!, {r11, ip}
    b func_01ffab88
    arm_func_end func_01ffac20

    .global func_01ffac30
    arm_func_start func_01ffac30
func_01ffac30: ; 0x01ffac30
    mov r4, #0x8
    bl func_01ffa454
    b func_01ffab88
    arm_func_end func_01ffac30

    .global func_01ffac3c
    arm_func_start func_01ffac3c
func_01ffac3c: ; 0x01ffac3c
    mov r4, #0x10
    mov r5, #0x8
    bl func_01ff94ac
    b func_01ffab88
    arm_func_end func_01ffac3c

    .global func_01ffac4c
    arm_func_start func_01ffac4c
func_01ffac4c: ; 0x01ffac4c
    mov r4, #0x10
    mov r5, #0x8
    bl func_01ff9508
    b func_01ffab88
    arm_func_end func_01ffac4c

    .global func_01ffac5c
    arm_func_start func_01ffac5c
func_01ffac5c: ; 0x01ffac5c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffac80
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffac80
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffac80
.L_01ffac80:
    mov r4, #0x8
    bl func_01ffa178
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x8
    b .L_01ffe420
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffacbc
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffacbc
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffacbc
.L_01ffacbc:
    mov r4, #0x8
    bl func_01ffa1a4
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x8
    b .L_01ffe420
    stmdb sp!, {r11, ip}
    bl func_01ffab38
    mov r11, #0x10
    mov ip, #0x8
    b .L_01ffe420
    mov r4, #0x8
    bl func_01ffa454
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x8
    b .L_01ffe420
    mov r4, #0x10
    mov r5, #0x8
    bl func_01ff94ac
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x8
    b .L_01ffe420
    mov r4, #0x10
    mov r5, #0x8
    bl func_01ff9508
    stmdb sp!, {r11, ip}
    mov r11, #0x10
    mov ip, #0x8
    b .L_01ffe420
    bl func_01ffb1b8
    ldmia r0, {r4, r5}
    add r4, r4, #0x400
    add r5, r5, #0x200
    stmia r0, {r4, r5}
    bl func_01ffb1b8
    ldmia r0, {r4, r5}
    sub r4, r4, #0x400
    sub r5, r5, #0x200
    stmia r0, {r4, r5}
    b func_01ffab88
    arm_func_end func_01ffac5c

    .global func_01ffad64
    arm_func_start func_01ffad64
func_01ffad64: ; 0x01ffad64
    bl func_01ffc314
    ldmia r0, {r4, r5, r6, r7}
    add r4, r4, #0x8
    add r5, r5, #0x8
    add r6, r6, #0x2
    add r7, r7, #0x1
    stmia r0, {r4, r5, r6, r7}
    bl func_01ffc314
    ldmia r0, {r4, r5, r6, r7}
    sub r4, r4, #0x8
    sub r5, r5, #0x8
    sub r6, r6, #0x2
    sub r7, r7, #0x1
    stmia r0, {r4, r5, r6, r7}
    ldmia sp!, {pc}
    arm_func_end func_01ffad64

    .byte 0x04, 0x01, 0x00, 0xeb, 0x30, 0x00, 0x90, 0xe8, 0x01, 0x4b, 0x84, 0xe2, 0x02, 0x5c, 0x85, 0xe2
    .byte 0x30, 0x00, 0x80, 0xe8, 0xff, 0x00, 0x00, 0xeb, 0x30, 0x00, 0x90, 0xe8, 0x01, 0x4b, 0x44, 0xe2
    .byte 0x02, 0x5c, 0x45, 0xe2, 0x30, 0x00, 0x80, 0xe8, 0x00, 0x18, 0x2d, 0xe9, 0x10, 0xb0, 0xa0, 0xe3
    .byte 0x08, 0xc0, 0xa0, 0xe3, 0x91, 0x0d, 0x00, 0xea, 0x4d, 0x05, 0x00, 0xeb, 0xf0, 0x00, 0x90, 0xe8
    .byte 0x08, 0x40, 0x84, 0xe2, 0x08, 0x50, 0x85, 0xe2, 0x02, 0x60, 0x86, 0xe2, 0x01, 0x70, 0x87, 0xe2
    .byte 0xf0, 0x00, 0x80, 0xe8, 0x46, 0x05, 0x00, 0xeb, 0xf0, 0x00, 0x90, 0xe8, 0x08, 0x40, 0x44, 0xe2
    .byte 0x08, 0x50, 0x45, 0xe2, 0x02, 0x60, 0x46, 0xe2, 0x01, 0x70, 0x47, 0xe2, 0xf0, 0x00, 0x80, 0xe8
    .byte 0x00, 0x18, 0x2d, 0xe9, 0x10, 0xb0, 0xa0, 0xe3, 0x08, 0xc0, 0xa0, 0xe3, 0x7f, 0x0d, 0x00, 0xea
    .byte 0x64, 0xad, 0xff, 0x01, 0xc0, 0xab, 0xff, 0x01, 0x38, 0xad, 0xff, 0x01, 0x30, 0xac, 0xff, 0x01
    .byte 0xf0, 0xab, 0xff, 0x01, 0xfc, 0xab, 0xff, 0x01, 0x08, 0xac, 0xff, 0x01, 0x20, 0xac, 0xff, 0x01
    .byte 0xd8, 0xad, 0xff, 0x01, 0xcc, 0xab, 0xff, 0x01, 0xe8, 0xac, 0xff, 0x01, 0x3c, 0xac, 0xff, 0x01
    .byte 0x5c, 0xac, 0xff, 0x01, 0xa0, 0xad, 0xff, 0x01, 0xd8, 0xab, 0xff, 0x01, 0x4c, 0xac, 0xff, 0x01
    .byte 0x98, 0xac, 0xff, 0x01, 0xa4, 0xac, 0xff, 0x01, 0xb0, 0xac, 0xff, 0x01, 0x1c, 0xad, 0xff, 0x01
    .byte 0x68, 0xac, 0xff, 0x01, 0x74, 0xac, 0xff, 0x01, 0x00, 0xad, 0xff, 0x01, 0xd4, 0xac, 0xff, 0x01

    .global func_01ffae80
    arm_func_start func_01ffae80
func_01ffae80: ; 0x01ffae80
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x70
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffae80

    .global func_01ffae94
    arm_func_start func_01ffae94
func_01ffae94: ; 0x01ffae94
    ldrb r7, [r4, #0xfe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x106]
    ldrb r8, [r4, #-0xf2]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xe]
    ldrb r6, [r4, #-0xfa]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x6]
    ldrb r7, [r4, #-0x2]
    ldrb r8, [r4, #0x6]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r7, [r4, #0xfe]
    ldrb r8, [r4, #0x106]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x102]
    ldrb r7, [r4, #-0x2]
    ldrb r8, [r4, #0x2]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #0xfe]
    ldrb r8, [r4, #0x102]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #0x2]
    ldrb r8, [r4, #0x6]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x4]
    ldrb r7, [r4, #0x102]
    ldrb r8, [r4, #0x106]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x104]
    ldrb r7, [r4, #0x6]
    ldrb r8, [r4, #0xe]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xa]
    ldrb r7, [r4, #0x106]
    ldrb r8, [r4, #0x10e]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10a]
    ldrb r7, [r4, #0x6]
    ldrb r8, [r4, #0xa]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x8]
    ldrb r7, [r4, #0x106]
    ldrb r8, [r4, #0x10a]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x108]
    ldrb r7, [r4, #0xa]
    ldrb r8, [r4, #0xe]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xc]
    ldrb r7, [r4, #0x10a]
    ldrb r8, [r4, #0x10e]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10c]
    mov pc, lr
    arm_func_end func_01ffae94

    .global func_01ffafb8
    arm_func_start func_01ffafb8
func_01ffafb8: ; 0x01ffafb8
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xf2]
    ldrb r10, [r4, #0xfe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x10e]
    bl func_01ffae94
    ldmia sp!, {pc}
    arm_func_end func_01ffafb8

    .global func_01ffafe4
    arm_func_start func_01ffafe4
func_01ffafe4: ; 0x01ffafe4
    stmdb sp!, {lr}
    ldrb r7, [r4, #0x2ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x307]
    ldrb r8, [r4, #-0xf1]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10f]
    ldrb r6, [r4, #-0xf9]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x107]
    bl func_01ffc628
    add r4, r4, #0x8
    bl func_01ffc628
    add r4, r4, #0x1f8
    bl func_01ffc628
    add r4, r4, #0x8
    bl func_01ffc628
    ldmia sp!, {pc}
    arm_func_end func_01ffafe4

    .global func_01ffb038
    arm_func_start func_01ffb038
func_01ffb038: ; 0x01ffb038
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf1]
    ldrb r10, [r4, #0x2ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x30f]
    bl func_01ffafe4
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffafb8
    add r4, r4, #0x1
    bl func_01ffafb8
    ldmia sp!, {pc}
    arm_func_end func_01ffb038

    .global func_01ffb088
    arm_func_start func_01ffb088
func_01ffb088: ; 0x01ffb088
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffb0ac
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffb0ac
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffb0ac
.L_01ffb0ac:
    mov r4, #0x4
    bl func_01ffa178
    ldmia sp!, {pc}
    arm_func_end func_01ffb088

    .global func_01ffb0b8
    arm_func_start func_01ffb0b8
func_01ffb0b8: ; 0x01ffb0b8
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffb0dc
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffb0dc
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffb0dc
.L_01ffb0dc:
    mov r4, #0x4
    bl func_01ffa1a4
    ldmia sp!, {pc}
    arm_func_end func_01ffb0b8

    .global func_01ffb0e8
    arm_func_start func_01ffb0e8
func_01ffb0e8: ; 0x01ffb0e8
    stmdb sp!, {r11, ip}
    bl func_01ffb038
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffb0e8

    .global func_01ffb0f4
    arm_func_start func_01ffb0f4
func_01ffb0f4: ; 0x01ffb0f4
    mov r4, #0x4
    bl func_01ffa454
    ldmia sp!, {pc}
    arm_func_end func_01ffb0f4

    .global func_01ffb100
    arm_func_start func_01ffb100
func_01ffb100: ; 0x01ffb100
    mov r4, #0x10
    mov r5, #0x4
    bl func_01ff94ac
    ldmia sp!, {pc}
    arm_func_end func_01ffb100

    .global func_01ffb110
    arm_func_start func_01ffb110
func_01ffb110: ; 0x01ffb110
    mov r4, #0x10
    mov r5, #0x4
    bl func_01ff9508
    ldmia sp!, {pc}
    arm_func_end func_01ffb110

    .global func_01ffb120
    arm_func_start func_01ffb120
func_01ffb120: ; 0x01ffb120
    bl func_01ffb608
    ldmia r0, {r4, r5}
    add r4, r4, #0x200
    add r5, r5, #0x100
    stmia r0, {r4, r5}
    bl func_01ffb608
    ldmia r0, {r4, r5}
    sub r4, r4, #0x200
    sub r5, r5, #0x100
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffb120

    .global func_01ffb14c
    arm_func_start func_01ffb14c
func_01ffb14c: ; 0x01ffb14c
    bl func_01ffc5b8
    ldmia r0, {r4, r5}
    add r4, r4, #0x8
    add r5, r5, #0x8
    stmia r0, {r4, r5}
    bl func_01ffc5b8
    ldmia r0, {r4, r5}
    sub r4, r4, #0x8
    sub r5, r5, #0x8
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffb14c

    .byte 0x4c, 0xb1, 0xff, 0x01, 0x88, 0xb0, 0xff, 0x01, 0x20, 0xb1, 0xff, 0x01, 0xf4, 0xb0, 0xff, 0x01
    .byte 0xb8, 0xb0, 0xff, 0x01, 0xc4, 0xb0, 0xff, 0x01, 0xd0, 0xb0, 0xff, 0x01, 0xe8, 0xb0, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x94, 0xb0, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb1, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa0, 0xb0, 0xff, 0x01, 0x10, 0xb1, 0xff, 0x01

    .global func_01ffb1b8
    arm_func_start func_01ffb1b8
func_01ffb1b8: ; 0x01ffb1b8
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffb1b8

    .global func_01ffb1cc
    arm_func_start func_01ffb1cc
func_01ffb1cc: ; 0x01ffb1cc
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xf2]
    ldrb r10, [r4, #-0x2]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0xe]
    ldrb r7, [r4, #-0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x6]
    ldrb r7, [r4, #-0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x2]
    ldrb r7, [r4, #-0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldrb r6, [r4, #0x6]
    ldrb r7, [r4, #0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x4]
    ldrb r6, [r4, #0xe]
    ldrb r7, [r4, #0x6]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0xa]
    ldrb r7, [r4, #0x6]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x8]
    ldrb r6, [r4, #0xe]
    ldrb r7, [r4, #0xa]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0xc]
    ldmia sp!, {pc}
    arm_func_end func_01ffb1cc

    .global func_01ffb270
    arm_func_start func_01ffb270
func_01ffb270: ; 0x01ffb270
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf1]
    ldrb r10, [r4, #0xff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x10f]
    ldrb r7, [r4, #0xff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x107]
    ldrb r8, [r4, #-0xf1]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xf]
    ldrb r6, [r4, #-0x1]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x7]
    ldrb r7, [r4, #-0x1]
    ldrb r8, [r4, #0x7]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x3]
    ldrb r7, [r4, #0xff]
    ldrb r8, [r4, #0x107]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x103]
    ldrb r7, [r4, #-0x1]
    ldrb r8, [r4, #0x3]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x1]
    ldrb r7, [r4, #0xff]
    ldrb r8, [r4, #0x103]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x101]
    ldrb r7, [r4, #-0x1]
    ldrb r8, [r4, #0x1]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #0xff]
    ldrb r8, [r4, #0x101]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #0x1]
    ldrb r8, [r4, #0x3]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r7, [r4, #0x101]
    ldrb r8, [r4, #0x103]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x102]
    ldrb r7, [r4, #0x3]
    ldrb r8, [r4, #0x7]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x5]
    ldrb r7, [r4, #0x103]
    ldrb r8, [r4, #0x107]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x105]
    ldrb r7, [r4, #0x3]
    ldrb r8, [r4, #0x5]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x4]
    ldrb r7, [r4, #0x103]
    ldrb r8, [r4, #0x105]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x104]
    ldrb r7, [r4, #0x5]
    ldrb r8, [r4, #0x7]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x6]
    ldrb r7, [r4, #0x105]
    ldrb r8, [r4, #0x107]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x106]
    ldrb r7, [r4, #0x7]
    ldrb r8, [r4, #0xf]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xb]
    ldrb r7, [r4, #0x107]
    ldrb r8, [r4, #0x10f]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10b]
    ldrb r7, [r4, #0x7]
    ldrb r8, [r4, #0xb]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x9]
    ldrb r7, [r4, #0x107]
    ldrb r8, [r4, #0x10b]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x109]
    ldrb r7, [r4, #0x7]
    ldrb r8, [r4, #0x9]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x8]
    ldrb r7, [r4, #0x107]
    ldrb r8, [r4, #0x109]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x108]
    ldrb r7, [r4, #0x9]
    ldrb r8, [r4, #0xb]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xa]
    ldrb r7, [r4, #0x109]
    ldrb r8, [r4, #0x10b]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10a]
    ldrb r7, [r4, #0xb]
    ldrb r8, [r4, #0xf]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xd]
    ldrb r7, [r4, #0x10b]
    ldrb r8, [r4, #0x10f]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10d]
    ldrb r7, [r4, #0xb]
    ldrb r8, [r4, #0xd]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xc]
    ldrb r7, [r4, #0x10b]
    ldrb r8, [r4, #0x10d]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10c]
    ldrb r7, [r4, #0xd]
    ldrb r8, [r4, #0xf]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xe]
    ldrb r7, [r4, #0x10d]
    ldrb r8, [r4, #0x10f]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x10e]
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffb1cc
    add r4, r4, #0x1
    bl func_01ffb1cc
    ldmia sp!, {pc}
    arm_func_end func_01ffb270

    .global func_01ffb51c
    arm_func_start func_01ffb51c
func_01ffb51c: ; 0x01ffb51c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffb540
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffb540
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffb540
.L_01ffb540:
    mov r4, #0x2
    bl func_01ffa178
    ldmia sp!, {pc}
    arm_func_end func_01ffb51c

    .global func_01ffb54c
    arm_func_start func_01ffb54c
func_01ffb54c: ; 0x01ffb54c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffb570
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffb570
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffb570
.L_01ffb570:
    mov r4, #0x2
    bl func_01ffa1a4
    ldmia sp!, {pc}
    arm_func_end func_01ffb54c

    .global func_01ffb57c
    arm_func_start func_01ffb57c
func_01ffb57c: ; 0x01ffb57c
    stmdb sp!, {r11, ip}
    bl func_01ffb270
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffb57c

    .global func_01ffb588
    arm_func_start func_01ffb588
func_01ffb588: ; 0x01ffb588
    mov r4, #0x2
    bl func_01ffa454
    ldmia sp!, {pc}
    arm_func_end func_01ffb588

    .global func_01ffb594
    arm_func_start func_01ffb594
func_01ffb594: ; 0x01ffb594
    ldmia sp!, {pc}
    arm_func_end func_01ffb594

    .global func_01ffb598
    arm_func_start func_01ffb598
func_01ffb598: ; 0x01ffb598
    ldmia sp!, {pc}
    arm_func_end func_01ffb598

    .global func_01ffb59c
    arm_func_start func_01ffb59c
func_01ffb59c: ; 0x01ffb59c
    bl func_01ffc88c
    ldmia r0, {r4, r5}
    add r4, r4, #0x8
    add r5, r5, #0x8
    stmia r0, {r4, r5}
    bl func_01ffc88c
    ldmia r0, {r4, r5}
    sub r4, r4, #0x8
    sub r5, r5, #0x8
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffb59c

    .byte 0x9c, 0xb5, 0xff, 0x01, 0x1c, 0xb5, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x88, 0xb5, 0xff, 0x01
    .byte 0x4c, 0xb5, 0xff, 0x01, 0x58, 0xb5, 0xff, 0x01, 0x64, 0xb5, 0xff, 0x01, 0x7c, 0xb5, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x28, 0xb5, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x94, 0xb5, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0xb5, 0xff, 0x01, 0x98, 0xb5, 0xff, 0x01

    .global func_01ffb608
    arm_func_start func_01ffb608
func_01ffb608: ; 0x01ffb608
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffb608

    .byte 0x94, 0xb6, 0xff, 0x01, 0x04, 0xb7, 0xff, 0x01, 0x8c, 0xb7, 0xff, 0x01, 0x1c, 0xb8, 0xff, 0x01

    .global func_01ffb62c
    arm_func_start func_01ffb62c
func_01ffb62c: ; 0x01ffb62c
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    and r4, r11, #0x3
    sub r8, pc, #0x38
    ldr r8, [r8, r4, lsl #0x2]
    mov pc, r8
    arm_func_end func_01ffb62c

    .global func_01ffb658
    arm_func_start func_01ffb658
func_01ffb658: ; 0x01ffb658
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bl func_01ff9450
    add r11, r11, r6
    bl func_01ff9450
    add ip, ip, r6
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    and r4, r11, #0x3
    sub r8, pc, #0x74
    ldr r8, [r8, r4, lsl #0x2]
    mov pc, r8
    arm_func_end func_01ffb658

    .global func_01ffb694
    arm_func_start func_01ffb694
func_01ffb694: ; 0x01ffb694
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffb6b0:
    ldmia r4, {r6, r7}
    add r4, r4, #0x100
    subs r11, r11, #0x1
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    bne .L_01ffb6b0
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffb6e8:
    ldmia r4, {r6, r7}
    add r4, r4, #0x100
    subs r11, r11, #0x1
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    bne .L_01ffb6e8
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffb694

    .global func_01ffb704
    arm_func_start func_01ffb704
func_01ffb704: ; 0x01ffb704
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    sub r4, r4, #0x1
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffb724:
    ldmia r4, {r6, r7}
    ldrb r8, [r4, #0x8]
    add r4, r4, #0x100
    mov r6, r6, lsr #0x8
    orr r6, r6, r7, lsl #0x18
    mov r7, r7, lsr #0x8
    orr r7, r7, r8, lsl #0x18
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffb724
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffb770:
    ldmia r4, {r6, r7}
    add r4, r4, #0x100
    subs r11, r11, #0x1
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    bne .L_01ffb770
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffb704

    .global func_01ffb78c
    arm_func_start func_01ffb78c
func_01ffb78c: ; 0x01ffb78c
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffb7a8:
    ldrh r6, [r4], #0x2
    ldrh r8, [r4, #0x4]
    ldr r7, [r4], #0xfe
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    orr r7, r7, r8, lsl #0x10
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    bne .L_01ffb7a8
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffb7f0:
    ldrh r6, [r4], #0x2
    ldrh r8, [r4, #0x4]
    ldr r7, [r4], #0xfe
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    orr r7, r7, r8, lsl #0x10
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    bne .L_01ffb7f0
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffb78c

    .global func_01ffb81c
    arm_func_start func_01ffb81c
func_01ffb81c: ; 0x01ffb81c
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffb838:
    ldrb r6, [r4], #0x1
    ldmia r4, {r7, r8}
    add r4, r4, #0xff
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x8
    mov r7, r7, lsr #0x18
    orr r7, r7, r8, lsl #0x8
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    bne .L_01ffb838
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffb880:
    ldrh r6, [r4], #0x2
    ldrh r8, [r4, #0x4]
    ldr r7, [r4], #0xfe
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x10
    mov r7, r7, lsr #0x10
    orr r7, r7, r8, lsl #0x10
    stmia r5, {r6, r7}
    add r5, r5, #0x100
    bne .L_01ffb880
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffb81c

    .global func_01ffb8ac
    arm_func_start func_01ffb8ac
func_01ffb8ac: ; 0x01ffb8ac
    stmdb sp!, {r4, r11, ip, lr}
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    add r11, r7, r6, lsl #0x8
    bic r6, r6, #0x1
    bic r7, r7, #0x1
    add ip, r7, r6, lsl #0x7
    bl func_01ff9450
    mov r8, r6
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    ldr r4, [r0, #-0x20]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldmia sp, {r11}
    add r4, r4, r9
    add r5, r5, r9
.L_01ffb8fc:
    stmdb sp!, {r11}
    mov r11, #0x2
.L_01ffb904:
    ldrb r9, [r4], #0x4
    ldrb r10, [r4, #-0x3]
    adds r9, r9, r8, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x8
    ldrb r10, [r4, #-0x2]
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x10
    ldrb r10, [r4, #-0x1]
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x18
    str r9, [r5], #0x4
    subs r11, r11, #0x1
    bne .L_01ffb904
    ldmia sp!, {r11}
    add r4, r4, #0xf8
    add r5, r5, #0xf8
    subs r11, r11, #0x1
    bne .L_01ffb8fc
    ldr r4, [r0, #-0x1c]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldmia sp!, {r11}
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffb9a0:
    stmdb sp!, {r11}
    mov r11, #0x2
.L_01ffb9a8:
    ldrh r8, [r4, #0x0]
    ldrh r10, [r4, #0x2]
    add r4, r4, #0x4
    and r9, r8, #0xff
    mov r8, r8, lsr #0x8
    adds r9, r9, r7, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r8, r8, r6, lsl #0x1
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    orr r9, r9, r8, lsl #0x8
    and ip, r10, #0xff
    mov r10, r10, lsr #0x8
    adds ip, ip, r7, lsl #0x1
    movlt ip, #0x0
    cmp ip, #0xff
    movgt ip, #0xff
    adds r10, r10, r6, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    orr r9, r9, ip, lsl #0x10
    orr r9, r9, r10, lsl #0x18
    str r9, [r5], #0x4
    subs r11, r11, #0x1
    bne .L_01ffb9a8
    ldmia sp!, {r11}
    add r4, r4, #0xf8
    add r5, r5, #0xf8
    subs r11, r11, #0x1
    bne .L_01ffb9a0
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffb8ac

    .global func_01ffba34
    arm_func_start func_01ffba34
func_01ffba34: ; 0x01ffba34
    stmdb sp!, {lr}
    ldrb r7, [r4, #0x6fe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x702]
    ldrb r8, [r4, #-0xfa]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x306]
    ldrb r6, [r4, #0x2fe]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x302]
    bl func_01ffcf60
    add r4, r4, #0x4
    bl func_01ffcf60
    add r4, r4, #0x3fc
    bl func_01ffcf60
    add r4, r4, #0x4
    bl func_01ffcf60
    sub r4, r4, #0x400
    sub r4, r4, #0x4
    ldmia sp!, {pc}
    arm_func_end func_01ffba34

    .global func_01ffba90
    arm_func_start func_01ffba90
func_01ffba90: ; 0x01ffba90
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfa]
    ldrb r10, [r4, #0x6fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x706]
    bl func_01ffba34
    ldmia sp!, {pc}
    arm_func_end func_01ffba90

    .global func_01ffbabc
    arm_func_start func_01ffbabc
func_01ffbabc: ; 0x01ffbabc
    stmdb sp!, {lr}
    ldrb r7, [r4, #0xeff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0xf03]
    ldrb r8, [r4, #-0xf9]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x707]
    ldrb r6, [r4, #0x6ff]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x703]
    bl func_01ffd014
    add r4, r4, #0x4
    bl func_01ffd014
    add r4, r4, #0x800
    sub r4, r4, #0x4
    bl func_01ffd014
    add r4, r4, #0x4
    bl func_01ffd014
    ldmia sp!, {pc}
    arm_func_end func_01ffbabc

    .global func_01ffbb14
    arm_func_start func_01ffbb14
func_01ffbb14: ; 0x01ffbb14
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf9]
    ldrb r10, [r4, #0xeff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0xf07]
    bl func_01ffbabc
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffba90
    add r4, r4, #0x1
    bl func_01ffba90
    ldmia sp!, {pc}
    arm_func_end func_01ffbb14

    .global func_01ffbb64
    arm_func_start func_01ffbb64
func_01ffbb64: ; 0x01ffbb64
    mov r9, #0x0
    ldr r4, [r0, #0x8]
    strb r9, [r4, #0x0]
    strb r9, [r4, #0x1]
    strb r9, [r4, #0x41]
    strb r9, [r4, #0x42]
    strb r9, [r4, #0x82]
    strb r9, [r4, #0x83]
    strb r9, [r4, #0xc3]
    strb r9, [r4, #0xc4]
    ldr r4, [r0, #0xc]
    strb r9, [r4, #0x0]
    strb r9, [r4, #0x21]
    ldmia sp!, {pc}
    arm_func_end func_01ffbb64

    .global func_01ffbb9c
    arm_func_start func_01ffbb9c
func_01ffbb9c: ; 0x01ffbb9c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffbbc0
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffbbc0
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffbbc0
.L_01ffbbc0:
    mov r4, #0x10
    bl func_01ffb62c
    b func_01ffbb64
    arm_func_end func_01ffbb9c

    .global func_01ffbbcc
    arm_func_start func_01ffbbcc
func_01ffbbcc: ; 0x01ffbbcc
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffbbf0
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffbbf0
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffbbf0
.L_01ffbbf0:
    mov r4, #0x10
    bl func_01ffb658
    b func_01ffbb64
    arm_func_end func_01ffbbcc

    .global func_01ffbbfc
    arm_func_start func_01ffbbfc
func_01ffbbfc: ; 0x01ffbbfc
    stmdb sp!, {r11, ip}
    bl func_01ffbb14
    ldmia sp!, {r11, ip}
    b func_01ffbb64
    arm_func_end func_01ffbbfc

    .global func_01ffbc0c
    arm_func_start func_01ffbc0c
func_01ffbc0c: ; 0x01ffbc0c
    mov r4, #0x10
    bl func_01ffb8ac
    b func_01ffbb64
    arm_func_end func_01ffbc0c

    .global func_01ffbc18
    arm_func_start func_01ffbc18
func_01ffbc18: ; 0x01ffbc18
    mov r4, #0x8
    mov r5, #0x10
    bl func_01ff94ac
    b func_01ffbb64
    arm_func_end func_01ffbc18

    .global func_01ffbc28
    arm_func_start func_01ffbc28
func_01ffbc28: ; 0x01ffbc28
    mov r4, #0x8
    mov r5, #0x10
    bl func_01ff9508
    b func_01ffbb64
    arm_func_end func_01ffbc28

    .global func_01ffbc38
    arm_func_start func_01ffbc38
func_01ffbc38: ; 0x01ffbc38
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffbc5c
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffbc5c
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffbc5c
.L_01ffbc5c:
    mov r4, #0x10
    bl func_01ffb62c
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x10
    b .L_01ffe420
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffbc98
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffbc98
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffbc98
.L_01ffbc98:
    mov r4, #0x10
    bl func_01ffb658
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x10
    b .L_01ffe420
    stmdb sp!, {r11, ip}
    bl func_01ffbb14
    mov r11, #0x8
    mov ip, #0x10
    b .L_01ffe420
    mov r4, #0x10
    bl func_01ffb8ac
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x10
    b .L_01ffe420
    mov r4, #0x8
    mov r5, #0x10
    bl func_01ff94ac
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x10
    b .L_01ffe420
    mov r4, #0x8
    mov r5, #0x10
    bl func_01ff9508
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x10
    b .L_01ffe420
    bl func_01ffc314
    ldmia r0, {r4, r5, r6, r7}
    add r4, r4, #0x800
    add r5, r5, #0x400
    add r6, r6, #0x82
    add r7, r7, #0x21
    stmia r0, {r4, r5, r6, r7}
    bl func_01ffc314
    ldmia r0, {r4, r5, r6, r7}
    sub r4, r4, #0x800
    sub r5, r5, #0x400
    sub r6, r6, #0x82
    sub r7, r7, #0x21
    stmia r0, {r4, r5, r6, r7}
    ldmia sp!, {pc}
    arm_func_end func_01ffbc38

    .global func_01ffbd50
    arm_func_start func_01ffbd50
func_01ffbd50: ; 0x01ffbd50
    bl func_01ffcf4c
    ldmia r0, {r4, r5}
    add r4, r4, #0x4
    add r5, r5, #0x4
    stmia r0, {r4, r5}
    bl func_01ffcf4c
    ldmia r0, {r4, r5}
    sub r4, r4, #0x4
    sub r5, r5, #0x4
    stmia r0, {r4, r5}
    b func_01ffbb64
    arm_func_end func_01ffbd50

    .byte 0x64, 0x01, 0x00, 0xeb, 0xf0, 0x00, 0x90, 0xe8, 0x02, 0x4b, 0x84, 0xe2, 0x01, 0x5b, 0x85, 0xe2
    .byte 0x82, 0x60, 0x86, 0xe2, 0x21, 0x70, 0x87, 0xe2, 0xf0, 0x00, 0x80, 0xe8, 0x5d, 0x01, 0x00, 0xeb
    .byte 0xf0, 0x00, 0x90, 0xe8, 0x02, 0x4b, 0x44, 0xe2, 0x01, 0x5b, 0x45, 0xe2, 0x82, 0x60, 0x46, 0xe2
    .byte 0x21, 0x70, 0x47, 0xe2, 0xf0, 0x00, 0x80, 0xe8, 0x00, 0x18, 0x2d, 0xe9, 0x08, 0xb0, 0xa0, 0xe3
    .byte 0x10, 0xc0, 0xa0, 0xe3, 0x96, 0x09, 0x00, 0xea, 0x60, 0x04, 0x00, 0xeb, 0x30, 0x00, 0x90, 0xe8
    .byte 0x04, 0x40, 0x84, 0xe2, 0x04, 0x50, 0x85, 0xe2, 0x30, 0x00, 0x80, 0xe8, 0x5b, 0x04, 0x00, 0xeb
    .byte 0x30, 0x00, 0x90, 0xe8, 0x04, 0x40, 0x44, 0xe2, 0x04, 0x50, 0x45, 0xe2, 0x30, 0x00, 0x80, 0xe8
    .byte 0x00, 0x18, 0x2d, 0xe9, 0x08, 0xb0, 0xa0, 0xe3, 0x10, 0xc0, 0xa0, 0xe3, 0x88, 0x09, 0x00, 0xea
    .byte 0x50, 0xbd, 0xff, 0x01, 0x9c, 0xbb, 0xff, 0x01, 0x14, 0xbd, 0xff, 0x01, 0x0c, 0xbc, 0xff, 0x01
    .byte 0xcc, 0xbb, 0xff, 0x01, 0xd8, 0xbb, 0xff, 0x01, 0xe4, 0xbb, 0xff, 0x01, 0xfc, 0xbb, 0xff, 0x01
    .byte 0xc4, 0xbd, 0xff, 0x01, 0xa8, 0xbb, 0xff, 0x01, 0xc4, 0xbc, 0xff, 0x01, 0x18, 0xbc, 0xff, 0x01
    .byte 0x38, 0xbc, 0xff, 0x01, 0x7c, 0xbd, 0xff, 0x01, 0xb4, 0xbb, 0xff, 0x01, 0x28, 0xbc, 0xff, 0x01
    .byte 0x74, 0xbc, 0xff, 0x01, 0x80, 0xbc, 0xff, 0x01, 0x8c, 0xbc, 0xff, 0x01, 0xf8, 0xbc, 0xff, 0x01
    .byte 0x44, 0xbc, 0xff, 0x01, 0x50, 0xbc, 0xff, 0x01, 0xdc, 0xbc, 0xff, 0x01, 0xb0, 0xbc, 0xff, 0x01

    .global func_01ffbe5c
    arm_func_start func_01ffbe5c
func_01ffbe5c: ; 0x01ffbe5c
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x70
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffbe5c

    .global func_01ffbe70
    arm_func_start func_01ffbe70
func_01ffbe70: ; 0x01ffbe70
    ldrb r6, [r4, #0x306]
    ldrb r7, [r4, #0x2fe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x302]
    ldrb r8, [r4, #-0xfa]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x106]
    ldrb r6, [r4, #-0xfe]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x102]
    ldrb r7, [r4, #0xfe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x100]
    ldrb r8, [r4, #-0xfe]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r6, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldrb r6, [r4, #0x106]
    ldrb r7, [r4, #0x102]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x104]
    ldrb r8, [r4, #-0xfa]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x6]
    ldrb r6, [r4, #-0xfc]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x4]
    ldrb r6, [r4, #0x302]
    ldrb r7, [r4, #0x2fe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x300]
    ldrb r8, [r4, #0x102]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x202]
    ldrb r6, [r4, #0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x200]
    ldrb r6, [r4, #0x306]
    ldrb r7, [r4, #0x302]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x304]
    ldrb r8, [r4, #0x106]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x206]
    ldrb r6, [r4, #0x104]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x204]
    mov pc, lr
    arm_func_end func_01ffbe70

    .global func_01ffbf74
    arm_func_start func_01ffbf74
func_01ffbf74: ; 0x01ffbf74
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfa]
    ldrb r10, [r4, #0x2fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x306]
    bl func_01ffbe70
    ldmia sp!, {pc}
    arm_func_end func_01ffbf74

    .global func_01ffbfa0
    arm_func_start func_01ffbfa0
func_01ffbfa0: ; 0x01ffbfa0
    stmdb sp!, {lr}
    ldrb r6, [r4, #0x707]
    ldrb r7, [r4, #0x6ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x703]
    ldrb r8, [r4, #-0xf9]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x307]
    ldrb r6, [r4, #-0xfd]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x303]
    bl func_01ffd26c
    add r4, r4, #0x4
    bl func_01ffd26c
    add r4, r4, #0x3fc
    bl func_01ffd26c
    add r4, r4, #0x4
    bl func_01ffd26c
    sub r4, r4, #0x400
    sub r4, r4, #0x4
    ldmia sp!, {pc}
    arm_func_end func_01ffbfa0

    .global func_01ffc000
    arm_func_start func_01ffc000
func_01ffc000: ; 0x01ffc000
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf9]
    ldrb r10, [r4, #0x6ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x707]
    bl func_01ffbfa0
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffbf74
    add r4, r4, #0x1
    bl func_01ffbf74
    ldmia sp!, {pc}
    arm_func_end func_01ffc000

    .global func_01ffc050
    arm_func_start func_01ffc050
func_01ffc050: ; 0x01ffc050
    mov r9, #0x0
    ldr r4, [r0, #0x8]
    strb r9, [r4, #0x0]
    strb r9, [r4, #0x1]
    strb r9, [r4, #0x41]
    strb r9, [r4, #0x42]
    ldr r4, [r0, #0xc]
    strb r9, [r4, #0x0]
    ldmia sp!, {pc}
    arm_func_end func_01ffc050

    .global func_01ffc074
    arm_func_start func_01ffc074
func_01ffc074: ; 0x01ffc074
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc098
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc098
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc098
.L_01ffc098:
    mov r4, #0x8
    bl func_01ffb62c
    b func_01ffc050
    arm_func_end func_01ffc074

    .global func_01ffc0a4
    arm_func_start func_01ffc0a4
func_01ffc0a4: ; 0x01ffc0a4
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc0c8
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc0c8
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc0c8
.L_01ffc0c8:
    mov r4, #0x8
    bl func_01ffb658
    b func_01ffc050
    arm_func_end func_01ffc0a4

    .global func_01ffc0d4
    arm_func_start func_01ffc0d4
func_01ffc0d4: ; 0x01ffc0d4
    stmdb sp!, {r11, ip}
    bl func_01ffc000
    ldmia sp!, {r11, ip}
    b func_01ffc050
    arm_func_end func_01ffc0d4

    .global func_01ffc0e4
    arm_func_start func_01ffc0e4
func_01ffc0e4: ; 0x01ffc0e4
    mov r4, #0x8
    bl func_01ffb8ac
    b func_01ffc050
    arm_func_end func_01ffc0e4

    .global func_01ffc0f0
    arm_func_start func_01ffc0f0
func_01ffc0f0: ; 0x01ffc0f0
    mov r4, #0x8
    mov r5, #0x8
    bl func_01ff94ac
    b func_01ffc050
    arm_func_end func_01ffc0f0

    .global func_01ffc100
    arm_func_start func_01ffc100
func_01ffc100: ; 0x01ffc100
    mov r4, #0x8
    mov r5, #0x8
    bl func_01ff9508
    b func_01ffc050
    arm_func_end func_01ffc100

    .global func_01ffc110
    arm_func_start func_01ffc110
func_01ffc110: ; 0x01ffc110
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc134
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc134
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc134
.L_01ffc134:
    mov r4, #0x8
    bl func_01ffb62c
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x8
    b .L_01ffe420
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc170
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc170
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc170
.L_01ffc170:
    mov r4, #0x8
    bl func_01ffb658
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x8
    b .L_01ffe420
    stmdb sp!, {r11, ip}
    bl func_01ffc000
    mov r11, #0x8
    mov ip, #0x8
    b .L_01ffe420
    mov r4, #0x8
    bl func_01ffb8ac
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x8
    b .L_01ffe420
    mov r4, #0x8
    mov r5, #0x8
    bl func_01ff94ac
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x8
    b .L_01ffe420
    mov r4, #0x8
    mov r5, #0x8
    bl func_01ff9508
    stmdb sp!, {r11, ip}
    mov r11, #0x8
    mov ip, #0x8
    b .L_01ffe420
    bl func_01ffc5b8
    ldmia r0, {r4, r5}
    add r4, r4, #0x400
    add r5, r5, #0x200
    stmia r0, {r4, r5}
    bl func_01ffc5b8
    ldmia r0, {r4, r5}
    sub r4, r4, #0x400
    sub r5, r5, #0x200
    stmia r0, {r4, r5}
    b func_01ffc050
    arm_func_end func_01ffc110

    .global func_01ffc218
    arm_func_start func_01ffc218
func_01ffc218: ; 0x01ffc218
    bl func_01ffd1f8
    ldmia r0, {r4, r5}
    add r4, r4, #0x4
    add r5, r5, #0x4
    stmia r0, {r4, r5}
    bl func_01ffd1f8
    ldmia r0, {r4, r5}
    sub r4, r4, #0x4
    sub r5, r5, #0x4
    stmia r0, {r4, r5}
    b func_01ffc050
    arm_func_end func_01ffc218

    .byte 0xdb, 0x00, 0x00, 0xeb, 0x30, 0x00, 0x90, 0xe8, 0x01, 0x4b, 0x84, 0xe2, 0x02, 0x5c, 0x85, 0xe2
    .byte 0x30, 0x00, 0x80, 0xe8, 0xd6, 0x00, 0x00, 0xeb, 0x30, 0x00, 0x90, 0xe8, 0x01, 0x4b, 0x44, 0xe2
    .byte 0x02, 0x5c, 0x45, 0xe2, 0x30, 0x00, 0x80, 0xe8, 0x00, 0x18, 0x2d, 0xe9, 0x08, 0xb0, 0xa0, 0xe3
    .byte 0x08, 0xc0, 0xa0, 0xe3, 0x68, 0x08, 0x00, 0xea, 0xdd, 0x03, 0x00, 0xeb, 0x30, 0x00, 0x90, 0xe8
    .byte 0x04, 0x40, 0x84, 0xe2, 0x04, 0x50, 0x85, 0xe2, 0x30, 0x00, 0x80, 0xe8, 0xd8, 0x03, 0x00, 0xeb
    .byte 0x30, 0x00, 0x90, 0xe8, 0x04, 0x40, 0x44, 0xe2, 0x04, 0x50, 0x45, 0xe2, 0x30, 0x00, 0x80, 0xe8
    .byte 0x00, 0x18, 0x2d, 0xe9, 0x08, 0xb0, 0xa0, 0xe3, 0x08, 0xc0, 0xa0, 0xe3, 0x5a, 0x08, 0x00, 0xea
    .byte 0x18, 0xc2, 0xff, 0x01, 0x74, 0xc0, 0xff, 0x01, 0xec, 0xc1, 0xff, 0x01, 0xe4, 0xc0, 0xff, 0x01
    .byte 0xa4, 0xc0, 0xff, 0x01, 0xb0, 0xc0, 0xff, 0x01, 0xbc, 0xc0, 0xff, 0x01, 0xd4, 0xc0, 0xff, 0x01
    .byte 0x7c, 0xc2, 0xff, 0x01, 0x80, 0xc0, 0xff, 0x01, 0x9c, 0xc1, 0xff, 0x01, 0xf0, 0xc0, 0xff, 0x01
    .byte 0x10, 0xc1, 0xff, 0x01, 0x44, 0xc2, 0xff, 0x01, 0x8c, 0xc0, 0xff, 0x01, 0x00, 0xc1, 0xff, 0x01
    .byte 0x4c, 0xc1, 0xff, 0x01, 0x58, 0xc1, 0xff, 0x01, 0x64, 0xc1, 0xff, 0x01, 0xd0, 0xc1, 0xff, 0x01
    .byte 0x1c, 0xc1, 0xff, 0x01, 0x28, 0xc1, 0xff, 0x01, 0xb4, 0xc1, 0xff, 0x01, 0x88, 0xc1, 0xff, 0x01

    .global func_01ffc314
    arm_func_start func_01ffc314
func_01ffc314: ; 0x01ffc314
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x70
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffc314

    .global func_01ffc328
    arm_func_start func_01ffc328
func_01ffc328: ; 0x01ffc328
    ldrb r6, [r4, #0x106]
    ldrb r7, [r4, #0xfe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x102]
    ldrb r8, [r4, #-0xfa]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x6]
    ldrb r6, [r4, #-0x2]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x2]
    ldrb r7, [r4, #-0x2]
    ldrb r8, [r4, #0x2]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #0xfe]
    ldrb r8, [r4, #0x102]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #0x2]
    ldrb r8, [r4, #0x6]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x4]
    ldrb r7, [r4, #0x102]
    ldrb r8, [r4, #0x106]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x104]
    mov pc, lr
    arm_func_end func_01ffc328

    .global func_01ffc3b0
    arm_func_start func_01ffc3b0
func_01ffc3b0: ; 0x01ffc3b0
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfa]
    ldrb r10, [r4, #0xfe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x106]
    bl func_01ffc328
    ldmia sp!, {pc}
    arm_func_end func_01ffc3b0

    .global func_01ffc3dc
    arm_func_start func_01ffc3dc
func_01ffc3dc: ; 0x01ffc3dc
    stmdb sp!, {lr}
    ldrb r6, [r4, #0x307]
    ldrb r7, [r4, #0x2ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x303]
    ldrb r8, [r4, #-0xf9]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x107]
    ldrb r6, [r4, #0xff]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x103]
    bl func_01ffd53c
    add r4, r4, #0x4
    bl func_01ffd53c
    add r4, r4, #0x1fc
    bl func_01ffd53c
    add r4, r4, #0x4
    bl func_01ffd53c
    sub r4, r4, #0x204
    ldmia sp!, {pc}
    arm_func_end func_01ffc3dc

    .global func_01ffc438
    arm_func_start func_01ffc438
func_01ffc438: ; 0x01ffc438
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf9]
    ldrb r10, [r4, #0x2ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x307]
    bl func_01ffc3dc
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffc3b0
    add r4, r4, #0x1
    bl func_01ffc3b0
    ldmia sp!, {pc}
    arm_func_end func_01ffc438

    .global func_01ffc488
    arm_func_start func_01ffc488
func_01ffc488: ; 0x01ffc488
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc4ac
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc4ac
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc4ac
.L_01ffc4ac:
    mov r4, #0x4
    bl func_01ffb62c
    ldmia sp!, {pc}
    arm_func_end func_01ffc488

    .global func_01ffc4b8
    arm_func_start func_01ffc4b8
func_01ffc4b8: ; 0x01ffc4b8
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc4dc
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc4dc
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc4dc
.L_01ffc4dc:
    mov r4, #0x4
    bl func_01ffb658
    ldmia sp!, {pc}
    arm_func_end func_01ffc4b8

    .global func_01ffc4e8
    arm_func_start func_01ffc4e8
func_01ffc4e8: ; 0x01ffc4e8
    stmdb sp!, {r11, ip}
    bl func_01ffc438
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffc4e8

    .global func_01ffc4f4
    arm_func_start func_01ffc4f4
func_01ffc4f4: ; 0x01ffc4f4
    mov r4, #0x4
    bl func_01ffb8ac
    ldmia sp!, {pc}
    arm_func_end func_01ffc4f4

    .global func_01ffc500
    arm_func_start func_01ffc500
func_01ffc500: ; 0x01ffc500
    mov r4, #0x8
    mov r5, #0x4
    bl func_01ff94ac
    ldmia sp!, {pc}
    arm_func_end func_01ffc500

    .global func_01ffc510
    arm_func_start func_01ffc510
func_01ffc510: ; 0x01ffc510
    mov r4, #0x8
    mov r5, #0x4
    bl func_01ff9508
    ldmia sp!, {pc}
    arm_func_end func_01ffc510

    .global func_01ffc520
    arm_func_start func_01ffc520
func_01ffc520: ; 0x01ffc520
    bl func_01ffc88c
    ldmia r0, {r4, r5}
    add r4, r4, #0x200
    add r5, r5, #0x100
    stmia r0, {r4, r5}
    bl func_01ffc88c
    ldmia r0, {r4, r5}
    sub r4, r4, #0x200
    sub r5, r5, #0x100
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffc520

    .global func_01ffc54c
    arm_func_start func_01ffc54c
func_01ffc54c: ; 0x01ffc54c
    bl func_01ffd4f0
    ldmia r0, {r4, r5}
    add r4, r4, #0x4
    add r5, r5, #0x4
    stmia r0, {r4, r5}
    bl func_01ffd4f0
    ldmia r0, {r4, r5}
    sub r4, r4, #0x4
    sub r5, r5, #0x4
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffc54c

    .byte 0x4c, 0xc5, 0xff, 0x01, 0x88, 0xc4, 0xff, 0x01, 0x20, 0xc5, 0xff, 0x01, 0xf4, 0xc4, 0xff, 0x01
    .byte 0xb8, 0xc4, 0xff, 0x01, 0xc4, 0xc4, 0xff, 0x01, 0xd0, 0xc4, 0xff, 0x01, 0xe8, 0xc4, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x94, 0xc4, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc5, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa0, 0xc4, 0xff, 0x01, 0x10, 0xc5, 0xff, 0x01

    .global func_01ffc5b8
    arm_func_start func_01ffc5b8
func_01ffc5b8: ; 0x01ffc5b8
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffc5b8

    .global func_01ffc5cc
    arm_func_start func_01ffc5cc
func_01ffc5cc: ; 0x01ffc5cc
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfa]
    ldrb r10, [r4, #-0x2]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x6]
    ldrb r7, [r4, #-0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x2]
    ldrb r7, [r4, #-0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldrb r6, [r4, #0x6]
    ldrb r7, [r4, #0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x4]
    ldmia sp!, {pc}
    arm_func_end func_01ffc5cc

    .global func_01ffc628
    arm_func_start func_01ffc628
func_01ffc628: ; 0x01ffc628
    ldrb r6, [r4, #0x107]
    ldrb r7, [r4, #0xff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x103]
    ldrb r8, [r4, #-0xf9]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x7]
    ldrb r6, [r4, #-0xfd]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x3]
    ldrb r7, [r4, #-0x1]
    ldrb r8, [r4, #0x3]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x1]
    ldrb r7, [r4, #0xff]
    ldrb r8, [r4, #0x103]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x101]
    ldrb r7, [r4, #-0x1]
    ldrb r8, [r4, #0x1]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #0xff]
    ldrb r8, [r4, #0x101]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #0x1]
    ldrb r8, [r4, #0x3]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r7, [r4, #0x101]
    ldrb r8, [r4, #0x103]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x102]
    ldrb r7, [r4, #0x3]
    ldrb r8, [r4, #0x7]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x5]
    ldrb r7, [r4, #0x103]
    ldrb r8, [r4, #0x107]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x105]
    ldrb r7, [r4, #0x3]
    ldrb r8, [r4, #0x5]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x4]
    ldrb r7, [r4, #0x103]
    ldrb r8, [r4, #0x105]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x104]
    ldrb r7, [r4, #0x5]
    ldrb r8, [r4, #0x7]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x6]
    ldrb r7, [r4, #0x105]
    ldrb r8, [r4, #0x107]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x106]
    mov pc, lr
    arm_func_end func_01ffc628

    .global func_01ffc750
    arm_func_start func_01ffc750
func_01ffc750: ; 0x01ffc750
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xf9]
    ldrb r10, [r4, #0xff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x107]
    bl func_01ffc628
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffc5cc
    add r4, r4, #0x1
    bl func_01ffc5cc
    ldmia sp!, {pc}
    arm_func_end func_01ffc750

    .global func_01ffc7a0
    arm_func_start func_01ffc7a0
func_01ffc7a0: ; 0x01ffc7a0
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc7c4
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc7c4
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc7c4
.L_01ffc7c4:
    mov r4, #0x2
    bl func_01ffb62c
    ldmia sp!, {pc}
    arm_func_end func_01ffc7a0

    .global func_01ffc7d0
    arm_func_start func_01ffc7d0
func_01ffc7d0: ; 0x01ffc7d0
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffc7f4
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffc7f4
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffc7f4
.L_01ffc7f4:
    mov r4, #0x2
    bl func_01ffb658
    ldmia sp!, {pc}
    arm_func_end func_01ffc7d0

    .global func_01ffc800
    arm_func_start func_01ffc800
func_01ffc800: ; 0x01ffc800
    stmdb sp!, {r11, ip}
    bl func_01ffc750
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffc800

    .global func_01ffc80c
    arm_func_start func_01ffc80c
func_01ffc80c: ; 0x01ffc80c
    mov r4, #0x2
    bl func_01ffb8ac
    ldmia sp!, {pc}
    arm_func_end func_01ffc80c

    .global func_01ffc818
    arm_func_start func_01ffc818
func_01ffc818: ; 0x01ffc818
    ldmia sp!, {pc}
    arm_func_end func_01ffc818

    .global func_01ffc81c
    arm_func_start func_01ffc81c
func_01ffc81c: ; 0x01ffc81c
    ldmia sp!, {pc}
    arm_func_end func_01ffc81c

    .global func_01ffc820
    arm_func_start func_01ffc820
func_01ffc820: ; 0x01ffc820
    bl func_01ffd700
    ldmia r0, {r4, r5}
    add r4, r4, #0x4
    add r5, r5, #0x4
    stmia r0, {r4, r5}
    bl func_01ffd700
    ldmia r0, {r4, r5}
    sub r4, r4, #0x4
    sub r5, r5, #0x4
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffc820

    .byte 0x20, 0xc8, 0xff, 0x01, 0xa0, 0xc7, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x0c, 0xc8, 0xff, 0x01
    .byte 0xd0, 0xc7, 0xff, 0x01, 0xdc, 0xc7, 0xff, 0x01, 0xe8, 0xc7, 0xff, 0x01, 0x00, 0xc8, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0xac, 0xc7, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x18, 0xc8, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb8, 0xc7, 0xff, 0x01, 0x1c, 0xc8, 0xff, 0x01

    .global func_01ffc88c
    arm_func_start func_01ffc88c
func_01ffc88c: ; 0x01ffc88c
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffc88c

    .byte 0x18, 0xc9, 0xff, 0x01, 0x78, 0xc9, 0xff, 0x01, 0xe8, 0xc9, 0xff, 0x01, 0x60, 0xca, 0xff, 0x01

    .global func_01ffc8b0
    arm_func_start func_01ffc8b0
func_01ffc8b0: ; 0x01ffc8b0
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    and r4, r11, #0x3
    sub r8, pc, #0x38
    ldr r8, [r8, r4, lsl #0x2]
    mov pc, r8
    arm_func_end func_01ffc8b0

    .global func_01ffc8dc
    arm_func_start func_01ffc8dc
func_01ffc8dc: ; 0x01ffc8dc
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bl func_01ff9450
    add r11, r11, r6
    bl func_01ff9450
    add ip, ip, r6
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    and r4, r11, #0x3
    sub r8, pc, #0x74
    ldr r8, [r8, r4, lsl #0x2]
    mov pc, r8
    arm_func_end func_01ffc8dc

    .global func_01ffc918
    arm_func_start func_01ffc918
func_01ffc918: ; 0x01ffc918
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffc934:
    ldr r6, [r4], #0x100
    subs r11, r11, #0x1
    str r6, [r5], #0x100
    bne .L_01ffc934
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffc964:
    ldr r6, [r4], #0x100
    subs r11, r11, #0x1
    str r6, [r5], #0x100
    bne .L_01ffc964
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffc918

    .global func_01ffc978
    arm_func_start func_01ffc978
func_01ffc978: ; 0x01ffc978
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    sub r4, r4, #0x1
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffc998:
    ldr r6, [r4], #0x100
    ldrb r7, [r4, #-0xfc]
    subs r11, r11, #0x1
    mov r6, r6, lsr #0x8
    orr r6, r6, r7, lsl #0x18
    str r6, [r5], #0x100
    bne .L_01ffc998
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffc9d4:
    ldr r6, [r4], #0x100
    subs r11, r11, #0x1
    str r6, [r5], #0x100
    bne .L_01ffc9d4
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffc978

    .global func_01ffc9e8
    arm_func_start func_01ffc9e8
func_01ffc9e8: ; 0x01ffc9e8
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffca04:
    ldrh r6, [r4, #0x0]
    ldrh r7, [r4, #0x2]
    add r4, r4, #0x100
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x10
    str r6, [r5], #0x100
    bne .L_01ffca04
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffca40:
    ldrh r6, [r4, #0x0]
    ldrh r7, [r4, #0x2]
    add r4, r4, #0x100
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x10
    str r6, [r5], #0x100
    bne .L_01ffca40
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffc9e8

    .global func_01ffca60
    arm_func_start func_01ffca60
func_01ffca60: ; 0x01ffca60
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffca7c:
    ldrb r6, [r4], #0x1
    ldr r7, [r4], #0xff
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x8
    str r6, [r5], #0x100
    bne .L_01ffca7c
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffcab4:
    ldrh r6, [r4, #0x0]
    ldrh r7, [r4, #0x2]
    add r4, r4, #0x100
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x10
    str r6, [r5], #0x100
    bne .L_01ffcab4
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffca60

    .global func_01ffcad4
    arm_func_start func_01ffcad4
func_01ffcad4: ; 0x01ffcad4
    stmdb sp!, {r4, r11, ip, lr}
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    add r11, r7, r6, lsl #0x8
    bic r6, r6, #0x1
    bic r7, r7, #0x1
    add ip, r7, r6, lsl #0x7
    bl func_01ff9450
    mov r8, r6
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    ldr r4, [r0, #-0x20]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldmia sp, {r11}
    add r4, r4, r9
    add r5, r5, r9
.L_01ffcb24:
    ldrb r9, [r4], #0x100
    ldrb r10, [r4, #-0xff]
    adds r9, r9, r8, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x8
    ldrb r10, [r4, #-0xfe]
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x10
    ldrb r10, [r4, #-0xfd]
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x18
    str r9, [r5], #0x100
    subs r11, r11, #0x1
    bne .L_01ffcb24
    ldr r4, [r0, #-0x1c]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldmia sp!, {r11}
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffcbac:
    ldrh r8, [r4, #0x0]
    ldrh r10, [r4, #0x2]
    add r4, r4, #0x100
    and r9, r8, #0xff
    mov r8, r8, lsr #0x8
    adds r9, r9, r7, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r8, r8, r6, lsl #0x1
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    orr r9, r9, r8, lsl #0x8
    and ip, r10, #0xff
    mov r10, r10, lsr #0x8
    adds ip, ip, r7, lsl #0x1
    movlt ip, #0x0
    cmp ip, #0xff
    movgt ip, #0xff
    adds r10, r10, r6, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    orr r9, r9, ip, lsl #0x10
    orr r9, r9, r10, lsl #0x18
    str r9, [r5], #0x100
    subs r11, r11, #0x1
    bne .L_01ffcbac
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffcad4

    .global func_01ffcc24
    arm_func_start func_01ffcc24
func_01ffcc24: ; 0x01ffcc24
    ldrb r7, [r4, #0x6fe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x700]
    ldrb r8, [r4, #-0xfe]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x302]
    ldrb r6, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x300]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #-0xfe]
    ldrb r8, [r4, #0x302]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x102]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x100]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #-0xfe]
    ldrb r8, [r4, #0x102]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r7, [r4, #0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x200]
    ldrb r7, [r4, #0x102]
    ldrb r8, [r4, #0x302]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x202]
    ldrb r7, [r4, #0x300]
    ldrb r8, [r4, #0x700]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x500]
    ldrb r7, [r4, #0x302]
    ldrb r8, [r4, #0x702]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x502]
    ldrb r7, [r4, #0x300]
    ldrb r8, [r4, #0x500]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x400]
    ldrb r7, [r4, #0x302]
    ldrb r8, [r4, #0x502]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x402]
    ldrb r7, [r4, #0x500]
    ldrb r8, [r4, #0x700]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x600]
    ldrb r7, [r4, #0x502]
    ldrb r8, [r4, #0x702]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x602]
    mov pc, lr
    arm_func_end func_01ffcc24

    .global func_01ffcd48
    arm_func_start func_01ffcd48
func_01ffcd48: ; 0x01ffcd48
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfe]
    ldrb r10, [r4, #0x6fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x702]
    bl func_01ffcc24
    ldmia sp!, {pc}
    arm_func_end func_01ffcd48

    .global func_01ffcd74
    arm_func_start func_01ffcd74
func_01ffcd74: ; 0x01ffcd74
    stmdb sp!, {lr}
    ldrb r7, [r4, #0xeff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0xf01]
    ldrb r8, [r4, #-0xfd]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x703]
    ldrb r6, [r4, #-0xff]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x701]
    bl func_01ffde00
    add r4, r4, #0x2
    bl func_01ffde00
    add r4, r4, #0x800
    sub r4, r4, #0x2
    bl func_01ffde00
    add r4, r4, #0x2
    bl func_01ffde00
    ldmia sp!, {pc}
    arm_func_end func_01ffcd74

    .global func_01ffcdcc
    arm_func_start func_01ffcdcc
func_01ffcdcc: ; 0x01ffcdcc
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xfd]
    ldrb r10, [r4, #0xeff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0xf03]
    bl func_01ffcd74
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffcd48
    add r4, r4, #0x1
    bl func_01ffcd48
    ldmia sp!, {pc}
    arm_func_end func_01ffcdcc

    .global func_01ffce1c
    arm_func_start func_01ffce1c
func_01ffce1c: ; 0x01ffce1c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffce40
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffce40
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffce40
.L_01ffce40:
    mov r4, #0x10
    bl func_01ffc8b0
    ldmia sp!, {pc}
    arm_func_end func_01ffce1c

    .global func_01ffce4c
    arm_func_start func_01ffce4c
func_01ffce4c: ; 0x01ffce4c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffce70
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffce70
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffce70
.L_01ffce70:
    mov r4, #0x10
    bl func_01ffc8dc
    ldmia sp!, {pc}
    arm_func_end func_01ffce4c

    .global func_01ffce7c
    arm_func_start func_01ffce7c
func_01ffce7c: ; 0x01ffce7c
    stmdb sp!, {r11, ip}
    bl func_01ffcdcc
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffce7c

    .global func_01ffce88
    arm_func_start func_01ffce88
func_01ffce88: ; 0x01ffce88
    mov r4, #0x10
    bl func_01ffcad4
    ldmia sp!, {pc}
    arm_func_end func_01ffce88

    .global func_01ffce94
    arm_func_start func_01ffce94
func_01ffce94: ; 0x01ffce94
    mov r4, #0x4
    mov r5, #0x10
    bl func_01ff94ac
    ldmia sp!, {pc}
    arm_func_end func_01ffce94

    .global func_01ffcea4
    arm_func_start func_01ffcea4
func_01ffcea4: ; 0x01ffcea4
    mov r4, #0x4
    mov r5, #0x10
    bl func_01ff9508
    ldmia sp!, {pc}
    arm_func_end func_01ffcea4

    .global func_01ffceb4
    arm_func_start func_01ffceb4
func_01ffceb4: ; 0x01ffceb4
    bl func_01ffd1f8
    ldmia r0, {r4, r5}
    add r4, r4, #0x800
    add r5, r5, #0x400
    stmia r0, {r4, r5}
    bl func_01ffd1f8
    ldmia r0, {r4, r5}
    sub r4, r4, #0x800
    sub r5, r5, #0x400
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffceb4

    .global func_01ffcee0
    arm_func_start func_01ffcee0
func_01ffcee0: ; 0x01ffcee0
    bl func_01ffdd90
    ldmia r0, {r4, r5}
    add r4, r4, #0x2
    add r5, r5, #0x2
    stmia r0, {r4, r5}
    bl func_01ffdd90
    ldmia r0, {r4, r5}
    sub r4, r4, #0x2
    sub r5, r5, #0x2
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffcee0

    .byte 0xe0, 0xce, 0xff, 0x01, 0x1c, 0xce, 0xff, 0x01, 0xb4, 0xce, 0xff, 0x01, 0x88, 0xce, 0xff, 0x01
    .byte 0x4c, 0xce, 0xff, 0x01, 0x58, 0xce, 0xff, 0x01, 0x64, 0xce, 0xff, 0x01, 0x7c, 0xce, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x28, 0xce, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x94, 0xce, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0xce, 0xff, 0x01, 0xa4, 0xce, 0xff, 0x01

    .global func_01ffcf4c
    arm_func_start func_01ffcf4c
func_01ffcf4c: ; 0x01ffcf4c
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffcf4c

    .global func_01ffcf60
    arm_func_start func_01ffcf60
func_01ffcf60: ; 0x01ffcf60
    ldrb r6, [r4, #0x302]
    ldrb r7, [r4, #0x2fe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x300]
    ldrb r8, [r4, #-0xfe]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x102]
    ldrb r6, [r4, #0xfe]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x100]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x100]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #-0xfe]
    ldrb r8, [r4, #0x102]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r7, [r4, #0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x200]
    ldrb r7, [r4, #0x102]
    ldrb r8, [r4, #0x302]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x202]
    mov pc, lr
    arm_func_end func_01ffcf60

    .global func_01ffcfe8
    arm_func_start func_01ffcfe8
func_01ffcfe8: ; 0x01ffcfe8
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfe]
    ldrb r10, [r4, #0x2fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x302]
    bl func_01ffcf60
    ldmia sp!, {pc}
    arm_func_end func_01ffcfe8

    .global func_01ffd014
    arm_func_start func_01ffd014
func_01ffd014: ; 0x01ffd014
    stmdb sp!, {lr}
    ldrb r6, [r4, #0x703]
    ldrb r7, [r4, #0x6ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x701]
    ldrb r8, [r4, #-0xfd]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x303]
    ldrb r6, [r4, #0x2ff]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x301]
    bl func_01ffe0b0
    add r4, r4, #0x2
    bl func_01ffe0b0
    add r4, r4, #0x400
    sub r4, r4, #0x2
    bl func_01ffe0b0
    add r4, r4, #0x2
    bl func_01ffe0b0
    sub r4, r4, #0x400
    sub r4, r4, #0x2
    ldmia sp!, {pc}
    arm_func_end func_01ffd014

    .global func_01ffd078
    arm_func_start func_01ffd078
func_01ffd078: ; 0x01ffd078
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xfd]
    ldrb r10, [r4, #0x6ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x703]
    bl func_01ffd014
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffcfe8
    add r4, r4, #0x1
    bl func_01ffcfe8
    ldmia sp!, {pc}
    arm_func_end func_01ffd078

    .global func_01ffd0c8
    arm_func_start func_01ffd0c8
func_01ffd0c8: ; 0x01ffd0c8
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffd0ec
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffd0ec
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffd0ec
.L_01ffd0ec:
    mov r4, #0x8
    bl func_01ffc8b0
    ldmia sp!, {pc}
    arm_func_end func_01ffd0c8

    .global func_01ffd0f8
    arm_func_start func_01ffd0f8
func_01ffd0f8: ; 0x01ffd0f8
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffd11c
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffd11c
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffd11c
.L_01ffd11c:
    mov r4, #0x8
    bl func_01ffc8dc
    ldmia sp!, {pc}
    arm_func_end func_01ffd0f8

    .global func_01ffd128
    arm_func_start func_01ffd128
func_01ffd128: ; 0x01ffd128
    stmdb sp!, {r11, ip}
    bl func_01ffd078
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffd128

    .global func_01ffd134
    arm_func_start func_01ffd134
func_01ffd134: ; 0x01ffd134
    mov r4, #0x8
    bl func_01ffcad4
    ldmia sp!, {pc}
    arm_func_end func_01ffd134

    .global func_01ffd140
    arm_func_start func_01ffd140
func_01ffd140: ; 0x01ffd140
    mov r4, #0x4
    mov r5, #0x8
    bl func_01ff94ac
    ldmia sp!, {pc}
    arm_func_end func_01ffd140

    .global func_01ffd150
    arm_func_start func_01ffd150
func_01ffd150: ; 0x01ffd150
    mov r4, #0x4
    mov r5, #0x8
    bl func_01ff9508
    ldmia sp!, {pc}
    arm_func_end func_01ffd150

    .global func_01ffd160
    arm_func_start func_01ffd160
func_01ffd160: ; 0x01ffd160
    bl func_01ffd4f0
    ldmia r0, {r4, r5}
    add r4, r4, #0x400
    add r5, r5, #0x200
    stmia r0, {r4, r5}
    bl func_01ffd4f0
    ldmia r0, {r4, r5}
    sub r4, r4, #0x400
    sub r5, r5, #0x200
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffd160

    .global func_01ffd18c
    arm_func_start func_01ffd18c
func_01ffd18c: ; 0x01ffd18c
    bl func_01ffe064
    ldmia r0, {r4, r5}
    add r4, r4, #0x2
    add r5, r5, #0x2
    stmia r0, {r4, r5}
    bl func_01ffe064
    ldmia r0, {r4, r5}
    sub r4, r4, #0x2
    sub r5, r5, #0x2
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffd18c

    .byte 0x8c, 0xd1, 0xff, 0x01, 0xc8, 0xd0, 0xff, 0x01, 0x60, 0xd1, 0xff, 0x01, 0x34, 0xd1, 0xff, 0x01
    .byte 0xf8, 0xd0, 0xff, 0x01, 0x04, 0xd1, 0xff, 0x01, 0x10, 0xd1, 0xff, 0x01, 0x28, 0xd1, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0xd4, 0xd0, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x40, 0xd1, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0xd0, 0xff, 0x01, 0x50, 0xd1, 0xff, 0x01

    .global func_01ffd1f8
    arm_func_start func_01ffd1f8
func_01ffd1f8: ; 0x01ffd1f8
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffd1f8

    .global func_01ffd20c
    arm_func_start func_01ffd20c
func_01ffd20c: ; 0x01ffd20c
    ldrb r7, [r4, #0xfe]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x100]
    ldrb r8, [r4, #-0xfe]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r6, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    mov pc, lr
    arm_func_end func_01ffd20c

    .global func_01ffd240
    arm_func_start func_01ffd240
func_01ffd240: ; 0x01ffd240
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfe]
    ldrb r10, [r4, #0xfe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x102]
    bl func_01ffd20c
    ldmia sp!, {pc}
    arm_func_end func_01ffd240

    .global func_01ffd26c
    arm_func_start func_01ffd26c
func_01ffd26c: ; 0x01ffd26c
    ldrb r6, [r4, #0x303]
    ldrb r7, [r4, #0x2ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x301]
    ldrb r8, [r4, #-0xfd]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x103]
    ldrb r6, [r4, #-0xff]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x101]
    ldrb r7, [r4, #0xff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x100]
    ldrb r8, [r4, #-0xff]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x1]
    ldrb r6, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldrb r6, [r4, #0x103]
    ldrb r7, [r4, #0x101]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x102]
    ldrb r8, [r4, #-0xfd]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x3]
    ldrb r6, [r4, #-0xfe]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x2]
    ldrb r6, [r4, #0x301]
    ldrb r7, [r4, #0x2ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x300]
    ldrb r8, [r4, #0x101]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x201]
    ldrb r6, [r4, #0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x200]
    ldrb r6, [r4, #0x303]
    ldrb r7, [r4, #0x301]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x302]
    ldrb r8, [r4, #0x103]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x203]
    ldrb r6, [r4, #0x102]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x202]
    mov pc, lr
    arm_func_end func_01ffd26c

    .global func_01ffd370
    arm_func_start func_01ffd370
func_01ffd370: ; 0x01ffd370
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xfd]
    ldrb r10, [r4, #0x2ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x303]
    bl func_01ffd26c
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffd240
    add r4, r4, #0x1
    bl func_01ffd240
    ldmia sp!, {pc}
    arm_func_end func_01ffd370

    .global func_01ffd3c0
    arm_func_start func_01ffd3c0
func_01ffd3c0: ; 0x01ffd3c0
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffd3e4
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffd3e4
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffd3e4
.L_01ffd3e4:
    mov r4, #0x4
    bl func_01ffc8b0
    ldmia sp!, {pc}
    arm_func_end func_01ffd3c0

    .global func_01ffd3f0
    arm_func_start func_01ffd3f0
func_01ffd3f0: ; 0x01ffd3f0
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffd414
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffd414
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffd414
.L_01ffd414:
    mov r4, #0x4
    bl func_01ffc8dc
    ldmia sp!, {pc}
    arm_func_end func_01ffd3f0

    .global func_01ffd420
    arm_func_start func_01ffd420
func_01ffd420: ; 0x01ffd420
    stmdb sp!, {r11, ip}
    bl func_01ffd370
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffd420

    .global func_01ffd42c
    arm_func_start func_01ffd42c
func_01ffd42c: ; 0x01ffd42c
    mov r4, #0x4
    bl func_01ffcad4
    ldmia sp!, {pc}
    arm_func_end func_01ffd42c

    .global func_01ffd438
    arm_func_start func_01ffd438
func_01ffd438: ; 0x01ffd438
    mov r4, #0x4
    mov r5, #0x4
    bl func_01ff94ac
    ldmia sp!, {pc}
    arm_func_end func_01ffd438

    .global func_01ffd448
    arm_func_start func_01ffd448
func_01ffd448: ; 0x01ffd448
    mov r4, #0x4
    mov r5, #0x4
    bl func_01ff9508
    ldmia sp!, {pc}
    arm_func_end func_01ffd448

    .global func_01ffd458
    arm_func_start func_01ffd458
func_01ffd458: ; 0x01ffd458
    bl func_01ffd700
    ldmia r0, {r4, r5}
    add r4, r4, #0x200
    add r5, r5, #0x100
    stmia r0, {r4, r5}
    bl func_01ffd700
    ldmia r0, {r4, r5}
    sub r4, r4, #0x200
    sub r5, r5, #0x100
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffd458

    .global func_01ffd484
    arm_func_start func_01ffd484
func_01ffd484: ; 0x01ffd484
    bl func_01ffe274
    ldmia r0, {r4, r5}
    add r4, r4, #0x2
    add r5, r5, #0x2
    stmia r0, {r4, r5}
    bl func_01ffe274
    ldmia r0, {r4, r5}
    sub r4, r4, #0x2
    sub r5, r5, #0x2
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffd484

    .byte 0x84, 0xd4, 0xff, 0x01, 0xc0, 0xd3, 0xff, 0x01, 0x58, 0xd4, 0xff, 0x01, 0x2c, 0xd4, 0xff, 0x01
    .byte 0xf0, 0xd3, 0xff, 0x01, 0xfc, 0xd3, 0xff, 0x01, 0x08, 0xd4, 0xff, 0x01, 0x20, 0xd4, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0xcc, 0xd3, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x38, 0xd4, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xd8, 0xd3, 0xff, 0x01, 0x48, 0xd4, 0xff, 0x01

    .global func_01ffd4f0
    arm_func_start func_01ffd4f0
func_01ffd4f0: ; 0x01ffd4f0
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffd4f0

    .global func_01ffd504
    arm_func_start func_01ffd504
func_01ffd504: ; 0x01ffd504
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0xfe]
    ldrb r10, [r4, #-0x2]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x2]
    ldrb r7, [r4, #-0x2]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldmia sp!, {pc}
    arm_func_end func_01ffd504

    .global func_01ffd53c
    arm_func_start func_01ffd53c
func_01ffd53c: ; 0x01ffd53c
    ldrb r6, [r4, #0x103]
    ldrb r7, [r4, #0xff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x101]
    ldrb r8, [r4, #-0xfd]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x3]
    ldrb r6, [r4, #-0x1]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x1]
    ldrb r7, [r4, #-0x1]
    ldrb r8, [r4, #0x1]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #0xff]
    ldrb r8, [r4, #0x101]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #0x1]
    ldrb r8, [r4, #0x3]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x2]
    ldrb r7, [r4, #0x101]
    ldrb r8, [r4, #0x103]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x102]
    mov pc, lr
    arm_func_end func_01ffd53c

    .global func_01ffd5c4
    arm_func_start func_01ffd5c4
func_01ffd5c4: ; 0x01ffd5c4
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xfd]
    ldrb r10, [r4, #0xff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x103]
    bl func_01ffd53c
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffd504
    add r4, r4, #0x1
    bl func_01ffd504
    ldmia sp!, {pc}
    arm_func_end func_01ffd5c4

    .global func_01ffd614
    arm_func_start func_01ffd614
func_01ffd614: ; 0x01ffd614
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffd638
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffd638
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffd638
.L_01ffd638:
    mov r4, #0x2
    bl func_01ffc8b0
    ldmia sp!, {pc}
    arm_func_end func_01ffd614

    .global func_01ffd644
    arm_func_start func_01ffd644
func_01ffd644: ; 0x01ffd644
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffd668
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffd668
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffd668
.L_01ffd668:
    mov r4, #0x2
    bl func_01ffc8dc
    ldmia sp!, {pc}
    arm_func_end func_01ffd644

    .global func_01ffd674
    arm_func_start func_01ffd674
func_01ffd674: ; 0x01ffd674
    stmdb sp!, {r11, ip}
    bl func_01ffd5c4
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffd674

    .global func_01ffd680
    arm_func_start func_01ffd680
func_01ffd680: ; 0x01ffd680
    mov r4, #0x2
    bl func_01ffcad4
    ldmia sp!, {pc}
    arm_func_end func_01ffd680

    .global func_01ffd68c
    arm_func_start func_01ffd68c
func_01ffd68c: ; 0x01ffd68c
    ldmia sp!, {pc}
    arm_func_end func_01ffd68c

    .global func_01ffd690
    arm_func_start func_01ffd690
func_01ffd690: ; 0x01ffd690
    ldmia sp!, {pc}
    arm_func_end func_01ffd690

    .global func_01ffd694
    arm_func_start func_01ffd694
func_01ffd694: ; 0x01ffd694
    bl func_01ffe3ec
    ldmia r0, {r4, r5}
    add r4, r4, #0x2
    add r5, r5, #0x2
    stmia r0, {r4, r5}
    bl func_01ffe3ec
    ldmia r0, {r4, r5}
    sub r4, r4, #0x2
    sub r5, r5, #0x2
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffd694

    .byte 0x94, 0xd6, 0xff, 0x01, 0x14, 0xd6, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80, 0xd6, 0xff, 0x01
    .byte 0x44, 0xd6, 0xff, 0x01, 0x50, 0xd6, 0xff, 0x01, 0x5c, 0xd6, 0xff, 0x01, 0x74, 0xd6, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x20, 0xd6, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x8c, 0xd6, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2c, 0xd6, 0xff, 0x01, 0x90, 0xd6, 0xff, 0x01

    .global func_01ffd700
    arm_func_start func_01ffd700
func_01ffd700: ; 0x01ffd700
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffd700

    .global func_01ffd714
    arm_func_start func_01ffd714
func_01ffd714: ; 0x01ffd714
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    ands r4, r11, #0x1
    beq .L_01ffd774
    b .L_01ffd7e4
    arm_func_end func_01ffd714

    .global func_01ffd73c
    arm_func_start func_01ffd73c
func_01ffd73c: ; 0x01ffd73c
    stmdb sp!, {r4, r5, r6, r11, ip, lr}
    bl func_01ff9450
    add r11, r11, r6
    bl func_01ff9450
    add ip, ip, r6
    bic r6, r11, #0x1
    bic r7, ip, #0x1
    ldr r8, [r0, #0x10]
    add r11, r11, ip, lsl #0x8
    add ip, r6, r7, lsl #0x7
    str r11, [r8, #0x0]
    ands r4, r11, #0x1
    beq .L_01ffd774
    b .L_01ffd7e4
.L_01ffd774:
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffd790:
    ldrh r6, [r4, #0x0]
    add r4, r4, #0x100
    subs r11, r11, #0x1
    strh r6, [r5, #0x0]
    add r5, r5, #0x100
    bne .L_01ffd790
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffd7c8:
    ldrh r6, [r4, #0x0]
    add r4, r4, #0x100
    subs r11, r11, #0x1
    strh r6, [r5, #0x0]
    add r5, r5, #0x100
    bne .L_01ffd7c8
    ldmia sp!, {r11, ip, pc}
.L_01ffd7e4:
    ldr r4, [sp, #0x4]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldr r11, [sp, #0x0]
    add r4, r4, r9
    add r5, r5, r9
.L_01ffd800:
    ldrb r6, [r4, #0x0]
    ldrb r7, [r4, #0x1]
    add r4, r4, #0x100
    subs r11, r11, #0x1
    orr r6, r6, r7, lsl #0x8
    strh r6, [r5, #0x0]
    add r5, r5, #0x100
    bne .L_01ffd800
    ldr r4, [sp, #0x8]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldr r11, [sp], #0xc
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffd840:
    ldrh r6, [r4, #0x0]
    add r4, r4, #0x100
    subs r11, r11, #0x1
    strh r6, [r5, #0x0]
    add r5, r5, #0x100
    bne .L_01ffd840
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffd73c

    .global func_01ffd85c
    arm_func_start func_01ffd85c
func_01ffd85c: ; 0x01ffd85c
    stmdb sp!, {r4, r11, ip, lr}
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    add r11, r7, r6, lsl #0x8
    bic r6, r6, #0x1
    bic r7, r7, #0x1
    add ip, r7, r6, lsl #0x7
    bl func_01ff9450
    mov r8, r6
    bl func_01ff9450
    mov r7, r6
    bl func_01ff9450
    ldr r4, [r0, #-0x20]
    ldr r5, [r0, #-0x8]
    add r4, r4, r11
    ldr r9, [r0, #0x0]
    ldmia sp, {r11}
    add r4, r4, r9
    add r5, r5, r9
.L_01ffd8ac:
    ldrb r9, [r4, #0x0]
    ldrb r10, [r4, #0x1]
    add r4, r4, #0x100
    adds r9, r9, r8, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r10, r10, r8, lsl #0x1
    movlt r10, #0x0
    cmp r10, #0xff
    movgt r10, #0xff
    add r9, r9, r10, lsl #0x8
    strh r9, [r5, #0x0]
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffd8ac
    ldr r4, [r0, #-0x1c]
    ldr r5, [r0, #-0x4]
    add r4, r4, ip
    ldr r9, [r0, #0x4]
    ldmia sp!, {r11}
    add r4, r4, r9
    add r5, r5, r9
    mov r11, r11, lsr #0x1
.L_01ffd90c:
    ldrh r8, [r4, #0x0]
    add r4, r4, #0x100
    and r9, r8, #0xff
    mov r8, r8, lsr #0x8
    adds r9, r9, r7, lsl #0x1
    movlt r9, #0x0
    cmp r9, #0xff
    movgt r9, #0xff
    adds r8, r8, r6, lsl #0x1
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    orr r9, r9, r8, lsl #0x8
    strh r9, [r5, #0x0]
    add r5, r5, #0x100
    subs r11, r11, #0x1
    bne .L_01ffd90c
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffd85c

    .global func_01ffd954
    arm_func_start func_01ffd954
func_01ffd954: ; 0x01ffd954
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0x100]
    ldrb r10, [r4, #0x6fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x700]
    ldrb r7, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x300]
    ldrb r7, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x100]
    ldrb r7, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldrb r6, [r4, #0x300]
    ldrb r7, [r4, #0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x200]
    ldrb r6, [r4, #0x700]
    ldrb r7, [r4, #0x300]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x500]
    ldrb r7, [r4, #0x300]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x400]
    ldrb r6, [r4, #0x700]
    ldrb r7, [r4, #0x500]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x600]
    ldmia sp!, {pc}
    arm_func_end func_01ffd954

    .global func_01ffd9f8
    arm_func_start func_01ffd9f8
func_01ffd9f8: ; 0x01ffd9f8
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xff]
    ldrb r10, [r4, #0xeff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0xf01]
    ldrb r7, [r4, #0xeff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0xf00]
    ldrb r8, [r4, #-0xff]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x701]
    ldrb r6, [r4, #0x6ff]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x700]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x700]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x300]
    ldrb r7, [r4, #-0xff]
    ldrb r8, [r4, #0x701]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x301]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #-0xff]
    ldrb r8, [r4, #0x301]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x101]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x100]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #-0xff]
    ldrb r8, [r4, #0x101]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x1]
    ldrb r7, [r4, #0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x200]
    ldrb r7, [r4, #0x101]
    ldrb r8, [r4, #0x301]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x201]
    ldrb r7, [r4, #0x300]
    ldrb r8, [r4, #0x700]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x500]
    ldrb r7, [r4, #0x301]
    ldrb r8, [r4, #0x701]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x501]
    ldrb r7, [r4, #0x300]
    ldrb r8, [r4, #0x500]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x400]
    ldrb r7, [r4, #0x301]
    ldrb r8, [r4, #0x501]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x401]
    ldrb r7, [r4, #0x500]
    ldrb r8, [r4, #0x700]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x600]
    ldrb r7, [r4, #0x501]
    ldrb r8, [r4, #0x701]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x601]
    ldrb r7, [r4, #0x700]
    ldrb r8, [r4, #0xf00]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xb00]
    ldrb r7, [r4, #0x701]
    ldrb r8, [r4, #0xf01]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xb01]
    ldrb r7, [r4, #0x700]
    ldrb r8, [r4, #0xb00]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x900]
    ldrb r7, [r4, #0x701]
    ldrb r8, [r4, #0xb01]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x901]
    ldrb r7, [r4, #0x700]
    ldrb r8, [r4, #0x900]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x800]
    ldrb r7, [r4, #0x701]
    ldrb r8, [r4, #0x901]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x801]
    ldrb r7, [r4, #0x900]
    ldrb r8, [r4, #0xb00]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xa00]
    ldrb r7, [r4, #0x901]
    ldrb r8, [r4, #0xb01]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xa01]
    ldrb r7, [r4, #0xb00]
    ldrb r8, [r4, #0xf00]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xd00]
    ldrb r7, [r4, #0xb01]
    ldrb r8, [r4, #0xf01]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xd01]
    ldrb r7, [r4, #0xb00]
    ldrb r8, [r4, #0xd00]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xc00]
    ldrb r7, [r4, #0xb01]
    ldrb r8, [r4, #0xd01]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xc01]
    ldrb r7, [r4, #0xd00]
    ldrb r8, [r4, #0xf00]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xe00]
    ldrb r7, [r4, #0xd01]
    ldrb r8, [r4, #0xf01]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0xe01]
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffd954
    add r4, r4, #0x1
    bl func_01ffd954
    ldmia sp!, {pc}
    arm_func_end func_01ffd9f8

    .global func_01ffdca4
    arm_func_start func_01ffdca4
func_01ffdca4: ; 0x01ffdca4
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffdcc8
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffdcc8
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffdcc8
.L_01ffdcc8:
    mov r4, #0x10
    bl func_01ffd714
    ldmia sp!, {pc}
    arm_func_end func_01ffdca4

    .global func_01ffdcd4
    arm_func_start func_01ffdcd4
func_01ffdcd4: ; 0x01ffdcd4
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffdcf8
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffdcf8
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffdcf8
.L_01ffdcf8:
    mov r4, #0x10
    bl func_01ffd73c
    ldmia sp!, {pc}
    arm_func_end func_01ffdcd4

    .global func_01ffdd04
    arm_func_start func_01ffdd04
func_01ffdd04: ; 0x01ffdd04
    stmdb sp!, {r11, ip}
    bl func_01ffd9f8
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffdd04

    .global func_01ffdd10
    arm_func_start func_01ffdd10
func_01ffdd10: ; 0x01ffdd10
    mov r4, #0x10
    bl func_01ffd85c
    ldmia sp!, {pc}
    arm_func_end func_01ffdd10

    .global func_01ffdd1c
    arm_func_start func_01ffdd1c
func_01ffdd1c: ; 0x01ffdd1c
    ldmia sp!, {pc}
    arm_func_end func_01ffdd1c

    .global func_01ffdd20
    arm_func_start func_01ffdd20
func_01ffdd20: ; 0x01ffdd20
    ldmia sp!, {pc}
    arm_func_end func_01ffdd20

    .global func_01ffdd24
    arm_func_start func_01ffdd24
func_01ffdd24: ; 0x01ffdd24
    bl func_01ffe064
    ldmia r0, {r4, r5}
    add r4, r4, #0x800
    add r5, r5, #0x400
    stmia r0, {r4, r5}
    bl func_01ffe064
    ldmia r0, {r4, r5}
    sub r4, r4, #0x800
    sub r5, r5, #0x400
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffdd24

    .byte 0x00, 0x00, 0x00, 0x00, 0xa4, 0xdc, 0xff, 0x01, 0x24, 0xdd, 0xff, 0x01, 0x10, 0xdd, 0xff, 0x01
    .byte 0xd4, 0xdc, 0xff, 0x01, 0xe0, 0xdc, 0xff, 0x01, 0xec, 0xdc, 0xff, 0x01, 0x04, 0xdd, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0xb0, 0xdc, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x1c, 0xdd, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xbc, 0xdc, 0xff, 0x01, 0x20, 0xdd, 0xff, 0x01

    .global func_01ffdd90
    arm_func_start func_01ffdd90
func_01ffdd90: ; 0x01ffdd90
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffdd90

    .global func_01ffdda4
    arm_func_start func_01ffdda4
func_01ffdda4: ; 0x01ffdda4
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0x100]
    ldrb r10, [r4, #0x2fe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x300]
    ldrb r7, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x100]
    ldrb r7, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldrb r6, [r4, #0x300]
    ldrb r7, [r4, #0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x200]
    ldmia sp!, {pc}
    arm_func_end func_01ffdda4

    .global func_01ffde00
    arm_func_start func_01ffde00
func_01ffde00: ; 0x01ffde00
    ldrb r6, [r4, #0x701]
    ldrb r7, [r4, #0x6ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x700]
    ldrb r8, [r4, #-0xff]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x301]
    ldrb r6, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x300]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x100]
    ldrb r7, [r4, #-0xff]
    ldrb r8, [r4, #0x301]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x101]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x100]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #-0xff]
    ldrb r8, [r4, #0x101]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x1]
    ldrb r7, [r4, #0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x200]
    ldrb r7, [r4, #0x101]
    ldrb r8, [r4, #0x301]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x201]
    ldrb r7, [r4, #0x300]
    ldrb r8, [r4, #0x700]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x500]
    ldrb r7, [r4, #0x301]
    ldrb r8, [r4, #0x701]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x501]
    ldrb r7, [r4, #0x300]
    ldrb r8, [r4, #0x500]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x400]
    ldrb r7, [r4, #0x301]
    ldrb r8, [r4, #0x501]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x401]
    ldrb r7, [r4, #0x500]
    ldrb r8, [r4, #0x700]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x600]
    ldrb r7, [r4, #0x501]
    ldrb r8, [r4, #0x701]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x601]
    mov pc, lr
    arm_func_end func_01ffde00

    .global func_01ffdf28
    arm_func_start func_01ffdf28
func_01ffdf28: ; 0x01ffdf28
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xff]
    ldrb r10, [r4, #0x6ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x701]
    bl func_01ffde00
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffdda4
    add r4, r4, #0x1
    bl func_01ffdda4
    ldmia sp!, {pc}
    arm_func_end func_01ffdf28

    .global func_01ffdf78
    arm_func_start func_01ffdf78
func_01ffdf78: ; 0x01ffdf78
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffdf9c
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffdf9c
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffdf9c
.L_01ffdf9c:
    mov r4, #0x8
    bl func_01ffd714
    ldmia sp!, {pc}
    arm_func_end func_01ffdf78

    .global func_01ffdfa8
    arm_func_start func_01ffdfa8
func_01ffdfa8: ; 0x01ffdfa8
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffdfcc
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffdfcc
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffdfcc
.L_01ffdfcc:
    mov r4, #0x8
    bl func_01ffd73c
    ldmia sp!, {pc}
    arm_func_end func_01ffdfa8

    .global func_01ffdfd8
    arm_func_start func_01ffdfd8
func_01ffdfd8: ; 0x01ffdfd8
    stmdb sp!, {r11, ip}
    bl func_01ffdf28
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffdfd8

    .global func_01ffdfe4
    arm_func_start func_01ffdfe4
func_01ffdfe4: ; 0x01ffdfe4
    mov r4, #0x8
    bl func_01ffd85c
    ldmia sp!, {pc}
    arm_func_end func_01ffdfe4

    .global func_01ffdff0
    arm_func_start func_01ffdff0
func_01ffdff0: ; 0x01ffdff0
    ldmia sp!, {pc}
    arm_func_end func_01ffdff0

    .global func_01ffdff4
    arm_func_start func_01ffdff4
func_01ffdff4: ; 0x01ffdff4
    ldmia sp!, {pc}
    arm_func_end func_01ffdff4

    .global func_01ffdff8
    arm_func_start func_01ffdff8
func_01ffdff8: ; 0x01ffdff8
    bl func_01ffe274
    ldmia r0, {r4, r5}
    add r4, r4, #0x400
    add r5, r5, #0x200
    stmia r0, {r4, r5}
    bl func_01ffe274
    ldmia r0, {r4, r5}
    sub r4, r4, #0x400
    sub r5, r5, #0x200
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffdff8

    .byte 0x00, 0x00, 0x00, 0x00, 0x78, 0xdf, 0xff, 0x01, 0xf8, 0xdf, 0xff, 0x01, 0xe4, 0xdf, 0xff, 0x01
    .byte 0xa8, 0xdf, 0xff, 0x01, 0xb4, 0xdf, 0xff, 0x01, 0xc0, 0xdf, 0xff, 0x01, 0xd8, 0xdf, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x84, 0xdf, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0xf0, 0xdf, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0xdf, 0xff, 0x01, 0xf4, 0xdf, 0xff, 0x01

    .global func_01ffe064
    arm_func_start func_01ffe064
func_01ffe064: ; 0x01ffe064
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffe064

    .global func_01ffe078
    arm_func_start func_01ffe078
func_01ffe078: ; 0x01ffe078
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0x100]
    ldrb r10, [r4, #0xfe]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x100]
    ldrb r7, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldmia sp!, {pc}
    arm_func_end func_01ffe078

    .global func_01ffe0b0
    arm_func_start func_01ffe0b0
func_01ffe0b0: ; 0x01ffe0b0
    ldrb r6, [r4, #0x301]
    ldrb r7, [r4, #0x2ff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x300]
    ldrb r8, [r4, #-0xff]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x101]
    ldrb r6, [r4, #0xff]
    add r8, r8, r6
    mov r6, r8, asr #0x1
    strb r6, [r4, #0x100]
    ldrb r7, [r4, #-0x100]
    ldrb r8, [r4, #0x100]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x0]
    ldrb r7, [r4, #-0xff]
    ldrb r8, [r4, #0x101]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x1]
    ldrb r7, [r4, #0x100]
    ldrb r8, [r4, #0x300]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x200]
    ldrb r7, [r4, #0x101]
    ldrb r8, [r4, #0x301]
    add r8, r8, r7
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x201]
    mov pc, lr
    arm_func_end func_01ffe0b0

    .global func_01ffe138
    arm_func_start func_01ffe138
func_01ffe138: ; 0x01ffe138
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xff]
    ldrb r10, [r4, #0x2ff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x301]
    bl func_01ffe0b0
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffe078
    add r4, r4, #0x1
    bl func_01ffe078
    ldmia sp!, {pc}
    arm_func_end func_01ffe138

    .global func_01ffe188
    arm_func_start func_01ffe188
func_01ffe188: ; 0x01ffe188
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffe1ac
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffe1ac
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffe1ac
.L_01ffe1ac:
    mov r4, #0x4
    bl func_01ffd714
    ldmia sp!, {pc}
    arm_func_end func_01ffe188

    .global func_01ffe1b8
    arm_func_start func_01ffe1b8
func_01ffe1b8: ; 0x01ffe1b8
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffe1dc
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffe1dc
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffe1dc
.L_01ffe1dc:
    mov r4, #0x4
    bl func_01ffd73c
    ldmia sp!, {pc}
    arm_func_end func_01ffe1b8

    .global func_01ffe1e8
    arm_func_start func_01ffe1e8
func_01ffe1e8: ; 0x01ffe1e8
    stmdb sp!, {r11, ip}
    bl func_01ffe138
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffe1e8

    .global func_01ffe1f4
    arm_func_start func_01ffe1f4
func_01ffe1f4: ; 0x01ffe1f4
    mov r4, #0x4
    bl func_01ffd85c
    ldmia sp!, {pc}
    arm_func_end func_01ffe1f4

    .global func_01ffe200
    arm_func_start func_01ffe200
func_01ffe200: ; 0x01ffe200
    ldmia sp!, {pc}
    arm_func_end func_01ffe200

    .global func_01ffe204
    arm_func_start func_01ffe204
func_01ffe204: ; 0x01ffe204
    ldmia sp!, {pc}
    arm_func_end func_01ffe204

    .global func_01ffe208
    arm_func_start func_01ffe208
func_01ffe208: ; 0x01ffe208
    bl func_01ffe3ec
    ldmia r0, {r4, r5}
    add r4, r4, #0x200
    add r5, r5, #0x100
    stmia r0, {r4, r5}
    bl func_01ffe3ec
    ldmia r0, {r4, r5}
    sub r4, r4, #0x200
    sub r5, r5, #0x100
    stmia r0, {r4, r5}
    ldmia sp!, {pc}
    arm_func_end func_01ffe208

    .byte 0x00, 0x00, 0x00, 0x00, 0x88, 0xe1, 0xff, 0x01, 0x08, 0xe2, 0xff, 0x01, 0xf4, 0xe1, 0xff, 0x01
    .byte 0xb8, 0xe1, 0xff, 0x01, 0xc4, 0xe1, 0xff, 0x01, 0xd0, 0xe1, 0xff, 0x01, 0xe8, 0xe1, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x94, 0xe1, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe2, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa0, 0xe1, 0xff, 0x01, 0x04, 0xe2, 0xff, 0x01

    .global func_01ffe274
    arm_func_start func_01ffe274
func_01ffe274: ; 0x01ffe274
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffe274

    .global func_01ffe288
    arm_func_start func_01ffe288
func_01ffe288: ; 0x01ffe288
    stmdb sp!, {lr}
    ldrb r9, [r4, #-0x100]
    ldrb r10, [r4, #-0x2]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x0]
    ldmia sp!, {pc}
    arm_func_end func_01ffe288

    .global func_01ffe2b0
    arm_func_start func_01ffe2b0
func_01ffe2b0: ; 0x01ffe2b0
    stmdb sp!, {lr}
    ldr r4, [r0, #-0x8]
    ldr r9, [r0, #0x0]
    add r4, r4, r9
    ldrb r9, [r4, #-0xff]
    ldrb r10, [r4, #0xff]
    add r9, r9, r10
    add r9, r9, #0x1
    mov r5, r9, lsr #0x1
    bl func_01ff9450
    add r6, r5, r6, lsl #0x1
    strb r6, [r4, #0x101]
    ldrb r7, [r4, #0xff]
    add r7, r7, r6
    mov r7, r7, asr #0x1
    strb r7, [r4, #0x100]
    ldrb r8, [r4, #-0xff]
    add r8, r8, r6
    mov r8, r8, asr #0x1
    strb r8, [r4, #0x1]
    ldrb r6, [r4, #-0x100]
    add r7, r7, r6
    mov r6, r7, asr #0x1
    strb r6, [r4, #0x0]
    ldr r4, [r0, #-0x4]
    ldr r9, [r0, #0x4]
    add r4, r4, r9
    bl func_01ffe288
    add r4, r4, #0x1
    bl func_01ffe288
    ldmia sp!, {pc}
    arm_func_end func_01ffe2b0

    .global func_01ffe32c
    arm_func_start func_01ffe32c
func_01ffe32c: ; 0x01ffe32c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffe350
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffe350
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffe350
.L_01ffe350:
    mov r4, #0x2
    bl func_01ffd714
    ldmia sp!, {pc}
    arm_func_end func_01ffe32c

    .global func_01ffe35c
    arm_func_start func_01ffe35c
func_01ffe35c: ; 0x01ffe35c
    ldr r5, [r0, #-0x20]
    ldr r6, [r0, #-0x1c]
    b .L_01ffe380
    ldr r5, [r0, #-0x18]
    ldr r6, [r0, #-0x14]
    b .L_01ffe380
    ldr r5, [r0, #-0x10]
    ldr r6, [r0, #-0xc]
    b .L_01ffe380
.L_01ffe380:
    mov r4, #0x2
    bl func_01ffd73c
    ldmia sp!, {pc}
    arm_func_end func_01ffe35c

    .global func_01ffe38c
    arm_func_start func_01ffe38c
func_01ffe38c: ; 0x01ffe38c
    stmdb sp!, {r11, ip}
    bl func_01ffe2b0
    ldmia sp!, {r11, ip, pc}
    arm_func_end func_01ffe38c

    .global func_01ffe398
    arm_func_start func_01ffe398
func_01ffe398: ; 0x01ffe398
    mov r4, #0x2
    bl func_01ffd85c
    ldmia sp!, {pc}
    arm_func_end func_01ffe398

    .global func_01ffe3a4
    arm_func_start func_01ffe3a4
func_01ffe3a4: ; 0x01ffe3a4
    ldmia sp!, {pc}
    arm_func_end func_01ffe3a4

    .global func_01ffe3a8
    arm_func_start func_01ffe3a8
func_01ffe3a8: ; 0x01ffe3a8
    ldmia sp!, {pc}
    arm_func_end func_01ffe3a8

    .byte 0x00, 0x00, 0x00, 0x00, 0x2c, 0xe3, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x98, 0xe3, 0xff, 0x01
    .byte 0x5c, 0xe3, 0xff, 0x01, 0x68, 0xe3, 0xff, 0x01, 0x74, 0xe3, 0xff, 0x01, 0x8c, 0xe3, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x38, 0xe3, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0xa4, 0xe3, 0xff, 0x01
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0xe3, 0xff, 0x01, 0xa8, 0xe3, 0xff, 0x01

    .global func_01ffe3ec
    arm_func_start func_01ffe3ec
func_01ffe3ec: ; 0x01ffe3ec
    stmdb sp!, {lr}
    bl func_01ff940c
    sub r7, pc, #0x50
    ldr r6, [r7, r6, lsl #0x2]
    mov pc, r6
    arm_func_end func_01ffe3ec

    .byte 0x00, 0x08, 0x04, 0x02, 0x01, 0x1f, 0x0f, 0x0a, 0x05, 0x0c, 0x03, 0x10, 0x0e, 0x0d, 0x0b, 0x07
    .byte 0x09, 0x06, 0x1e, 0x1b, 0x1a, 0x1d, 0x17, 0x15, 0x18, 0x12, 0x11, 0x1c, 0x14, 0x13, 0x16, 0x19
    .byte 0x04, 0x50, 0x10, 0xe5, 0x0c, 0x60, 0x90, 0xe5, 0x08, 0x70, 0x10, 0xe5, 0x08, 0x80, 0x90, 0xe5
    .byte 0x04, 0x90, 0x90, 0xe5, 0x00, 0xa0, 0x90, 0xe5, 0x09, 0x50, 0x85, 0xe0, 0x0a, 0x70, 0x87, 0xe0
    .byte 0xe0, 0x19, 0x2d, 0xe9, 0xe0, 0x09, 0x2d, 0xe9, 0xef, 0xeb, 0xff, 0xeb, 0x54, 0xb0, 0x4f, 0xe2
    .byte 0x06, 0x40, 0xdb, 0xe7, 0x07, 0xb0, 0xa0, 0xe1, 0x08, 0xc0, 0xa0, 0xe1, 0x01, 0x00, 0x14, 0xe3
    .byte 0x00, 0x90, 0xa0, 0x03, 0x00, 0x90, 0xcc, 0x05, 0x08, 0x00, 0x00, 0x0a, 0x10, 0x00, 0x2d, 0xe9
    .byte 0x01, 0x90, 0x5c, 0xe5, 0x41, 0xa0, 0x5c, 0xe5, 0x09, 0xa0, 0x8a, 0xe0, 0x01, 0xa0, 0x8a, 0xe2
    .byte 0xaa, 0xa0, 0xa0, 0xe1, 0x01, 0x40, 0xa0, 0xe3, 0x71, 0x00, 0x00, 0xeb, 0x10, 0x00, 0xbd, 0xe8
    .byte 0x04, 0xb0, 0x8b, 0xe2, 0x01, 0xc0, 0x8c, 0xe2, 0x02, 0x00, 0x14, 0xe3, 0x00, 0x90, 0xa0, 0x03
    .byte 0x00, 0x90, 0xcc, 0x05, 0x08, 0x00, 0x00, 0x0a, 0x10, 0x00, 0x2d, 0xe9, 0x01, 0x90, 0x5c, 0xe5
    .byte 0x41, 0xa0, 0x5c, 0xe5, 0x09, 0xa0, 0x8a, 0xe0, 0x01, 0xa0, 0x8a, 0xe2, 0xaa, 0xa0, 0xa0, 0xe1
    .byte 0x01, 0x40, 0xa0, 0xe3, 0x62, 0x00, 0x00, 0xeb, 0x10, 0x00, 0xbd, 0xe8, 0xff, 0xbf, 0x8b, 0xe2
    .byte 0x40, 0xc0, 0x8c, 0xe2, 0x04, 0x00, 0x14, 0xe3, 0x00, 0x90, 0xa0, 0x03, 0x00, 0x90, 0xcc, 0x05
    .byte 0x08, 0x00, 0x00, 0x0a, 0x10, 0x00, 0x2d, 0xe9, 0x01, 0x90, 0x5c, 0xe5, 0x41, 0xa0, 0x5c, 0xe5
    .byte 0x09, 0xa0, 0x8a, 0xe0, 0x01, 0xa0, 0x8a, 0xe2, 0xaa, 0xa0, 0xa0, 0xe1, 0x01, 0x40, 0xa0, 0xe3
    .byte 0x53, 0x00, 0x00, 0xeb, 0x10, 0x00, 0xbd, 0xe8, 0x04, 0xb0, 0x8b, 0xe2, 0x01, 0xc0, 0x8c, 0xe2
    .byte 0x08, 0x00, 0x14, 0xe3, 0x00, 0x90, 0xa0, 0x03, 0x00, 0x90, 0xcc, 0x05, 0x08, 0x00, 0x00, 0x0a
    .byte 0x10, 0x00, 0x2d, 0xe9, 0x01, 0x90, 0x5c, 0xe5, 0x41, 0xa0, 0x5c, 0xe5, 0x09, 0xa0, 0x8a, 0xe0
    .byte 0x01, 0xa0, 0x8a, 0xe2, 0xaa, 0xa0, 0xa0, 0xe1, 0x01, 0x40, 0xa0, 0xe3, 0x44, 0x00, 0x00, 0xeb
    .byte 0x10, 0x00, 0xbd, 0xe8, 0x00, 0x18, 0x9d, 0xe8, 0x10, 0x00, 0x14, 0xe3, 0x00, 0x90, 0xa0, 0x03
    .byte 0x00, 0x90, 0xcc, 0x05, 0x13, 0x00, 0x00, 0x0a, 0x01, 0x90, 0x5c, 0xe5, 0x21, 0xa0, 0x5c, 0xe5
    .byte 0x09, 0xa0, 0x8a, 0xe0, 0x01, 0xa0, 0x8a, 0xe2, 0xaa, 0xa0, 0xa0, 0xe1, 0x00, 0x04, 0x2d, 0xe9
    .byte 0x02, 0x40, 0xa0, 0xe3, 0x36, 0x00, 0x00, 0xeb, 0x00, 0x04, 0xbd, 0xe8, 0x00, 0x90, 0xdc, 0xe5
    .byte 0x01, 0xb0, 0x8b, 0xe2, 0x02, 0x40, 0xa0, 0xe3, 0x00, 0x02, 0x2d, 0xe9, 0x30, 0x00, 0x00, 0xeb
    .byte 0x00, 0xa0, 0xdc, 0xe5, 0x00, 0x02, 0xbd, 0xe8, 0x0a, 0x90, 0x89, 0xe0, 0x01, 0x90, 0x89, 0xe2
    .byte 0xa9, 0x90, 0xa0, 0xe1, 0x00, 0x90, 0xcc, 0xe5, 0xe0, 0x09, 0xbd, 0xe8, 0x08, 0xb0, 0x5b, 0xe2
    .byte 0x08, 0x70, 0x87, 0xe2, 0x08, 0x50, 0x85, 0xe2, 0x02, 0x80, 0x88, 0xe2, 0x01, 0x60, 0x86, 0xe2
    .byte 0x9f, 0xff, 0xff, 0x1a, 0xe0, 0x19, 0xbd, 0xe8, 0x02, 0x7b, 0x87, 0xe2, 0x82, 0x80, 0x88, 0xe2
    .byte 0x01, 0x5b, 0x85, 0xe2, 0x21, 0x60, 0x86, 0xe2, 0x08, 0xc0, 0x5c, 0xe2, 0x97, 0xff, 0xff, 0x1a
    .byte 0x00, 0x98, 0xbd, 0xe8, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00
    .byte 0x17, 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00

    .global func_01ffe5fc
    arm_func_start func_01ffe5fc
func_01ffe5fc: ; 0x01ffe5fc
    mov r4, r3, lsr #0x1a
    mov r3, r3, lsl #0x6
    subs r2, r2, #0x6
    bllt .L_01ff943c
    and r5, r4, #0x3
    mov r4, r4, lsr #0x2
    add r4, r4, #0x1
    cmp r5, r4
    movgt r4, #0x0
    strb r4, [ip, #0x0]
    ldmgtia sp!, {r4, ip, pc}
    b .L_01ffe6f0
.L_01ffe62c:
    clz r9, r3
    add r9, r9, #0x1
    cmp r9, #0x4
    addge r8, r9, #0x3
    bge .L_01ffe7f0
    mov r8, r3, lsr #0x1d
    rsb r8, r8, #0x7
    mov r3, r3, lsl #0x3
    subs r2, r2, #0x3
    b .L_01ffe7f8
    arm_func_end func_01ffe5fc

    .global func_01ffe654
    arm_func_start func_01ffe654
func_01ffe654: ; 0x01ffe654
    stmdb sp!, {r4, ip, lr}
    cmp r10, #0x8
    bge func_01ffe5fc
    ldr r9, .L_01ffec68
    mov r4, r3
    add r10, r10, r9
    ldrb r7, [r10, #0x8]
    ldrb r6, [r10, #0x0]
    add r7, r7, r9
    ldr r9, .L_01ffec6c
    mov r5, r4, lsr #0x1c
    add r10, r9, r6, lsl #0x4
    ldrsb r6, [r10, r5]
    cmp r6, #0x0
    bge .L_01ffe6d0
    mov r4, r4, lsl #0x4
    sub r10, r9, r6, lsl #0x4
    mov r5, r4, lsr #0x1c
    ldrsb r6, [r10, r5]
    cmp r6, #0x0
    bge .L_01ffe6d0
    mov r4, r4, lsl #0x4
    sub r10, r9, r6, lsl #0x4
    mov r5, r4, lsr #0x1c
    ldrsb r6, [r10, r5]
    cmp r6, #0x0
    bge .L_01ffe6d0
    mov r4, r4, lsl #0x4
    sub r10, r9, r6, lsl #0x4
    mov r5, r4, lsr #0x1c
    ldrsb r6, [r10, r5]
.L_01ffe6d0:
    ldrb r8, [r7, r6]
    and r5, r6, #0x3
    mov r3, r3, lsl r8
    subs r2, r2, r8
    bllt .L_01ff943c
    movs r4, r6, lsr #0x2
    strb r4, [ip, #0x0]
    ldmeqia sp!, {r4, ip, pc}
.L_01ffe6f0:
    sub r7, sp, #0x40
    cmp r4, #0x10
    moveq r6, #0x0
    beq .L_01ffe750
    ldr r9, .L_01ffec70
    sub r10, r4, #0x1
    ldrb r8, [r9, r10]
    add r10, r10, #0x4
    ldr r9, [r9, r10, lsl #0x2]
    rsb r10, r8, #0x20
    mov r8, r3, lsr r10
    add r8, r8, #0x10
    ldrb r6, [r9, r8]
    ldrb r8, [r9, r6]
    mov r3, r3, lsl r8
    subs r2, r2, r8
    bllt .L_01ff943c
    add r9, r4, r6
    rsbs r9, r9, #0x10
    beq .L_01ffe750
    mov r10, #0x0
.L_01ffe744:
    str r10, [r7, #-0x4]!
    subs r9, r9, #0x1
    bne .L_01ffe744
.L_01ffe750:
    mov ip, #0x0
.L_01ffe754:
    subs r5, r5, #0x1
    bge .L_01ffe81c
    clz r8, r3
    mov r3, r3, lsl r8
    add r3, r3, r3
    sub r2, r2, r8
    subs r2, r2, #0x1
    bllt .L_01ff943c
    cmp r8, #0xf
    beq .L_01ffe838
    rsb r9, ip, #0x20
    mov r9, r3, lsr r9
    add r9, r9, r8, lsl ip
    sub r8, pc, #0x1ac
    ldr r8, [r8, ip, lsl #0x2]
    add r10, ip, #0x1
    cmp r9, r8
    addgt ip, ip, #0x1
    movs r3, r3, lsl r10
    add r9, r9, #0x1
    rsbhs r9, r9, #0x0
    str r9, [r7, #-0x4]!
    subs r2, r2, r10
    bllt .L_01ff943c
.L_01ffe7b4:
    subs r4, r4, #0x1
    beq .L_01ffe870
    subs r10, r6, #0x1
    blt .L_01ffe754
    cmp r10, #0x6
    bge .L_01ffe62c
    ldr r9, .L_01ffec74
    ldrb r8, [r9, r10]
    add r10, r10, #0x2
    ldr r9, [r9, r10, lsl #0x2]
    rsb r10, r8, #0x20
    mov r8, r3, lsr r10
    add r8, r8, #0x10
    ldrb r8, [r9, r8]
    ldrb r9, [r9, r8]
.L_01ffe7f0:
    mov r3, r3, lsl r9
    subs r2, r2, r9
.L_01ffe7f8:
    bllt .L_01ff943c
    cmp r8, #0x0
    beq .L_01ffe754
    sub r6, r6, r8
    mov r9, #0x0
.L_01ffe80c:
    str r9, [r7, #-0x4]!
    subs r8, r8, #0x1
    bne .L_01ffe80c
    b .L_01ffe754
.L_01ffe81c:
    adds r3, r3, r3
    mvnhs r10, #0x0
    movlo r10, #0x1
    str r10, [r7, #-0x4]!
    subs r2, r2, #0x1
    bllt .L_01ff943c
    b .L_01ffe7b4
.L_01ffe838:
    mov r9, r3, lsr #0x15
    mov r8, #0xf
    add r9, r9, r8, lsl ip
    sub r8, pc, #0x268
    ldr r8, [r8, ip, lsl #0x2]
    cmp r9, r8
    addgt ip, ip, #0x1
    movs r3, r3, lsl #0xc
    add r9, r9, #0x1
    rsbhs r9, r9, #0x0
    str r9, [r7, #-0x4]!
    subs r2, r2, #0xc
    bllt .L_01ff943c
    b .L_01ffe7b4
.L_01ffe870:
    cmp r6, #0x0
    beq .L_01ffe888
    mov r9, #0x0
.L_01ffe87c:
    str r9, [r7, #-0x4]!
    subs r6, r6, #0x1
    bne .L_01ffe87c
.L_01ffe888:
    ldr r5, [r0, #0x14]
    ldr r4, [r7, #0x0]
    ldr ip, [r7, #0xc]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    add r6, r9, r10
    sub r8, r9, r10
    ldr r5, [r0, #0x24]
    ldr r4, [r7, #0x8]
    ldr ip, [r7, #0x24]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    rsb r4, r10, r9, asr #0x1
    add ip, r9, r10, asr #0x1
    add r9, r6, ip
    add r10, r8, r4
    str r9, [r7, #0x40]
    str r10, [r7, #0x50]
    sub r9, r8, r4
    sub r10, r6, ip
    str r9, [r7, #0x60]
    str r10, [r7, #0x70]
    ldr r5, [r0, #0x18]
    ldr r4, [r7, #0x4]
    ldr ip, [r7, #0x20]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    add r6, r9, r10
    sub r8, r9, r10
    ldr r5, [r0, #0x28]
    ldr r4, [r7, #0x10]
    ldr ip, [r7, #0x28]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    rsb r4, r10, r9, asr #0x1
    add ip, r9, r10, asr #0x1
    add r9, r6, ip
    add r10, r8, r4
    str r9, [r7, #0x44]
    str r10, [r7, #0x54]
    sub r9, r8, r4
    sub r10, r6, ip
    str r9, [r7, #0x64]
    str r10, [r7, #0x74]
    ldr r5, [r0, #0x1c]
    ldr r4, [r7, #0x14]
    ldr ip, [r7, #0x2c]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    add r6, r9, r10
    sub r8, r9, r10
    ldr r5, [r0, #0x2c]
    ldr r4, [r7, #0x1c]
    ldr ip, [r7, #0x38]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    rsb r4, r10, r9, asr #0x1
    add ip, r9, r10, asr #0x1
    add r9, r6, ip
    add r10, r8, r4
    str r9, [r7, #0x48]
    str r10, [r7, #0x58]
    sub r9, r8, r4
    sub r10, r6, ip
    str r9, [r7, #0x68]
    str r10, [r7, #0x78]
    ldr r5, [r0, #0x20]
    ldr r4, [r7, #0x18]
    ldr ip, [r7, #0x34]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    add r6, r9, r10
    sub r8, r9, r10
    ldr r5, [r0, #0x30]
    ldr r4, [r7, #0x30]
    ldr ip, [r7, #0x3c]
    smulbb r9, r4, r5
    smulbb r10, ip, r5
    rsb r4, r10, r9, asr #0x1
    add ip, r9, r10, asr #0x1
    add r9, r6, ip
    add r10, r8, r4
    str r9, [r7, #0x4c]
    str r10, [r7, #0x5c]
    sub r9, r8, r4
    sub r10, r6, ip
    str r9, [r7, #0x6c]
    str r10, [r7, #0x7c]
    add r7, r7, #0x40
    ldr ip, [sp, #0x0]
    ldmia r7!, {r4, r5, r6, r8}
    add r9, r4, r6
    sub r10, r4, r6
    rsb r4, r8, r5, asr #0x1
    add r6, r5, r8, asr #0x1
    ldrb r8, [r11, #0x0]
    add r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    add r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    add r11, r11, #0x100
    sub r11, r11, ip, lsl #0x2
    ldmia r7!, {r4, r5, r6, r8}
    add r9, r4, r6
    sub r10, r4, r6
    rsb r4, r8, r5, asr #0x1
    add r6, r5, r8, asr #0x1
    ldrb r8, [r11, #0x0]
    add r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    add r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    add r11, r11, #0x100
    sub r11, r11, ip, lsl #0x2
    ldmia r7!, {r4, r5, r6, r8}
    add r9, r4, r6
    sub r10, r4, r6
    rsb r4, r8, r5, asr #0x1
    add r6, r5, r8, asr #0x1
    ldrb r8, [r11, #0x0]
    add r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    add r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    add r11, r11, #0x100
    sub r11, r11, ip, lsl #0x2
    ldmia r7!, {r4, r5, r6, r8}
    add r9, r4, r6
    sub r10, r4, r6
    rsb r4, r8, r5, asr #0x1
    add r6, r5, r8, asr #0x1
    ldrb r8, [r11, #0x0]
    add r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    add r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r10, r4
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    ldrb r8, [r11, #0x0]
    sub r5, r9, r6
    add r5, r5, #0x20
    adds r8, r8, r5, asr #0x6
    movlt r8, #0x0
    cmp r8, #0xff
    movgt r8, #0xff
    strb r8, [r11], ip
    add r11, r11, #0x100
    sub r11, r11, ip, lsl #0x2
    sub r11, r11, #0x400
    ldmia sp!, {r4, ip, pc}
.L_01ffec68: .word data_027c00cc
.L_01ffec6c: .word data_027c01a8
.L_01ffec70: .word data_027c0060
.L_01ffec74: .word data_027c00ac
    arm_func_end func_01ffe654

    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

    .global func_01ffec80
    arm_func_start func_01ffec80
func_01ffec80: ; 0x01ffec80
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, ip, lr}
    ldr r8, [r0, #0xc]
    ldr r9, [r0, #0x10]
    ldr r10, [r0, #0x14]
    rsb r5, r9, #0x200
    rsb r6, r9, #0x100
    sub r7, r8, r9
    mov r7, r7, lsl #0x1
    stmdb sp!, {r5, r6, r7, r8, r9, r10}
    ldr r1, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r0, [r0, #0x0]
    ldr r3, .L_01fff1dc
    add lr, r2, r8
.L_01ffecb8:
    str r10, [sp, #-0x4]!
    ldr r10, [sp, #0x14]
.L_01ffecc0:
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    ldrb r5, [r1, #0x1]
    ldrb r6, [r1], #0x2
    ldrb r4, [r0], #0x1
    sub r5, r5, #0x80
    sub r6, r6, #0x80
    add r7, r5, r6, asr #0x1
    sub r7, r3, r7
    add r5, r3, r5, lsl #0x1
    add r6, r3, r6, lsl #0x1
    add r6, r6, #0x300
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    sub r4, r4, #0x4
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #0x1
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [r2], #0x4
    sub r4, r4, #0x4
    ldrb r8, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    ldrb r4, [r0], #-0xff
    add r8, r11, r8, lsl #0x5
    add r8, r8, ip, lsl #0xa
    ldrb r9, [r7, r4]
    ldrb r11, [r5, r4]
    ldrb ip, [r6, r4]
    add r8, r8, r9, lsl #0x15
    add r8, r8, r11, lsl #0x10
    add r8, r8, ip, lsl #0x1a
    str r8, [lr], #0x4
    subs r10, r10, #0x10
    bgt .L_01ffecc0
    ldr r10, [sp], #0x4
    ldr r5, [sp, #0x0]
    ldr r6, [sp, #0x4]
    ldr r7, [sp, #0x8]
    add r0, r0, r5
    add r1, r1, r6
    add r2, r2, r7
    add lr, lr, r7
    subs r10, r10, #0x2
    bgt .L_01ffecb8
    ldmia sp!, {r5, r6, r7, r8, r9, r10}
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, ip, lr}
    bx lr
.L_01fff1dc: .word data_027c0b40
    arm_func_end func_01ffec80

    .global func_01fff1e0
    arm_func_start func_01fff1e0
func_01fff1e0: ; 0x01fff1e0
    mov r6, #0x20
    add r7, r3, #0x200
    mov r8, #0x0
    mov r9, #0x0
    mov r10, #0x0
    mov r11, #0x0
.L_01fff1f8:
    stmia r7!, {r8, r9, r10, r11}
    subs r6, r6, #0x1
    bne .L_01fff1f8
    mov pc, lr
    arm_func_end func_01fff1e0

    .global func_01fff208
    arm_func_start func_01fff208
func_01fff208: ; 0x01fff208
    stmdb sp!, {r1, r3, r4}
    add r3, r3, #0x200
    rsb ip, r6, #0x7f
    add r4, r4, ip, lsl #0x2
    ldr r2, [r4], #0x4
    mov r1, #0x2
    mov r2, r2, asr #0x4
    str r2, [r3], #0x4
    ldr r2, [r4], #0x4
    ldr r7, [r4], #0x4
    ldr r8, [r4], #0x4
    ldr r9, [r4], #0x4
    ldr r10, [r4], #0x4
    ldr r11, [r4], #0x4
    mul ip, r2, r1
    add r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r7, r1
    add r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r8, r1
    add r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r9, r1
    add r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r10, r1
    add r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r11, r1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mov ip, #0x72
.L_01fff2a0:
    ldmia r4!, {r6, r7, r8, r9, r10, r11}
    mov r6, r6, asr #0x1
    mov r7, r7, asr #0x1
    mov r8, r8, asr #0x1
    mov r9, r9, asr #0x1
    mov r10, r10, asr #0x1
    mov r11, r11, asr #0x1
    stmia r3!, {r6, r7, r8, r9, r10, r11}
    subs ip, ip, #0x6
    bne .L_01fff2a0
    ldr r2, [r4], #0x4
    ldr r7, [r4], #0x4
    ldr r8, [r4], #0x4
    ldr r9, [r4], #0x4
    ldr r10, [r4], #0x4
    ldr r11, [r4], #0x4
    mul ip, r2, r1
    sub r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r7, r1
    sub r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r8, r1
    sub r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r9, r1
    sub r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r10, r1
    sub r1, r1, #0x1
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mul ip, r11, r1
    ldr r2, [r4], #0x4
    mov ip, ip, asr #0x4
    str ip, [r3], #0x4
    mov r2, r2, asr #0x4
    str r2, [r3], #0x4
    ldmia sp!, {r1, r3, r4}
    mov pc, lr
    arm_func_end func_01fff208

    .global func_01fff350
    arm_func_start func_01fff350
func_01fff350: ; 0x01fff350
    add r1, r3, #0x200
    add r1, r1, r7, lsl #0x2
    rsb r7, r6, #0x0
    mov r6, r6, lsl #0x1
    sub r7, r7, r6
.L_01fff364:
    ldrh r5, [r0], #0x2
    mov r11, #0xe
.L_01fff36c:
    ldr r10, [r1, #0x0]
    mov r2, r5, lsr r11
    and r2, r2, #0x3
    mla r2, r6, r2, r7
    add r10, r10, r2
    str r10, [r1], r9
    subs r11, r11, #0x2
    bge .L_01fff36c
    subs r8, r8, #0x1
    bne .L_01fff364
    ldmia sp!, {r1, pc}
    arm_func_end func_01fff350

    .global func_01fff398
    arm_func_start func_01fff398
func_01fff398: ; 0x01fff398
    add r1, r3, #0x200
    add r1, r1, r7, lsl #0x2
    rsb r7, r6, #0x0
    mov r6, r6, lsl #0x1
    sub r7, r7, r6, lsl #0x1
    sub r7, r7, r6
    mov r9, #0x0
    mov r8, #0x8
.L_01fff3b8:
    ldrh r5, [r0], #0x2
    mov r11, #0xd
.L_01fff3c0:
    ldr r10, [r1, #0x0]
    mov r2, r5, lsr r11
    and r2, r2, #0x7
    mla r2, r6, r2, r7
    add r10, r10, r2
    str r10, [r1], #0xc
    subs r11, r11, #0x3
    bge .L_01fff3c0
    and r5, r5, #0x1
    orr r9, r5, r9, lsl #0x1
    subs r8, r8, #0x1
    bne .L_01fff3b8
    ldr r10, [r1, #0x0]
    mov r2, r9, lsr #0x5
    and r2, r2, #0x7
    mla r2, r6, r2, r7
    add r10, r10, r2
    str r10, [r1], #0xc
    ldr r10, [r1, #0x0]
    mov r2, r9, lsr #0x2
    and r2, r2, #0x7
    mla r2, r6, r2, r7
    add r10, r10, r2
    str r10, [r1, #0x0]
    ldmia sp!, {r1, pc}
    arm_func_end func_01fff398

    .global func_01fff424
    arm_func_start func_01fff424
func_01fff424: ; 0x01fff424
    stmdb sp!, {r3, r4, lr}
    ldmia r2, {r5, r6, r7, r8, r9, r10, r11, ip}
    add r3, r1, #0x70
    ldrb r4, [r3, #0x0]
    add r2, r1, #0x8c0
    add r4, r2, r4, lsl #0x4
    bl func_01fff594
    add r3, r1, #0x71
    ldrb r4, [r3, #0x0]
    add r2, r1, #0xcc0
    add r4, r2, r4, lsl #0x4
    bl func_01fff594
    add r3, r1, #0x72
    ldrb r4, [r3, #0x0]
    add r2, r1, #0x10c0
    add r4, r2, r4, lsl #0x4
    bl func_01fff594
    add r2, r1, #0x8
    stmia r2, {r5, r6, r7, r8, r9, r10, r11, ip}
    mul r3, r5, r6
    add r5, r5, r3, asr #0xf
    mul r3, r6, r7
    mul r4, r5, r7
    add r5, r5, r3, asr #0xf
    add r6, r6, r4, asr #0xf
    mul r3, r7, r8
    mul r4, r5, r8
    add r5, r5, r3, asr #0xf
    mul r3, r6, r8
    add r7, r7, r4, asr #0xf
    add r6, r6, r3, asr #0xf
    mul r3, r8, r9
    mul r4, r5, r9
    add r5, r5, r3, asr #0xf
    add r8, r8, r4, asr #0xf
    mul r3, r7, r9
    mul r4, r6, r9
    add r6, r6, r3, asr #0xf
    add r7, r7, r4, asr #0xf
    mul r3, r9, r10
    mul r4, r5, r10
    add r5, r5, r3, asr #0xf
    add r9, r9, r4, asr #0xf
    mul r3, r8, r10
    mul r4, r6, r10
    add r6, r6, r3, asr #0xf
    mul r3, r7, r10
    add r8, r8, r4, asr #0xf
    add r7, r7, r3, asr #0xf
    mul r3, r10, r11
    mul r4, r5, r11
    add r5, r5, r3, asr #0xf
    add r10, r10, r4, asr #0xf
    mul r3, r9, r11
    mul r4, r6, r11
    add r6, r6, r3, asr #0xf
    add r9, r9, r4, asr #0xf
    mul r3, r8, r11
    mul r4, r7, r11
    add r7, r7, r3, asr #0xf
    add r8, r8, r4, asr #0xf
    mul r3, r11, ip
    mul r4, r5, ip
    add r5, r5, r3, asr #0xf
    add r11, r11, r4, asr #0xf
    mul r3, r10, ip
    mul r4, r6, ip
    add r6, r6, r3, asr #0xf
    add r10, r10, r4, asr #0xf
    mul r3, r9, ip
    mul r4, r7, ip
    add r7, r7, r3, asr #0xf
    mul r3, r8, ip
    add r9, r9, r4, asr #0xf
    add r8, r8, r3, asr #0xf
    mov r5, r5, asr #0x1
    rsb r5, r5, #0x0
    mov r6, r6, asr #0x1
    rsb r6, r6, #0x0
    mov r7, r7, asr #0x1
    rsb r7, r7, #0x0
    mov r8, r8, asr #0x1
    rsb r8, r8, #0x0
    mov r9, r9, asr #0x1
    rsb r9, r9, #0x0
    mov r10, r10, asr #0x1
    rsb r10, r10, #0x0
    mov r11, r11, asr #0x1
    rsb r11, r11, #0x0
    mov ip, ip, asr #0x1
    rsb ip, ip, #0x0
    ldmia sp!, {r3, r4, pc}
    arm_func_end func_01fff424

    .global func_01fff594
    arm_func_start func_01fff594
func_01fff594: ; 0x01fff594
    ldrsh r0, [r4], #0x2
    ldrsh r3, [r4], #0x2
    ldrsh r2, [r4], #0x2
    add r5, r5, r0
    add r6, r6, r3
    add r7, r7, r2
    ldrsh r0, [r4], #0x2
    ldrsh r3, [r4], #0x2
    ldrsh r2, [r4], #0x2
    add r8, r8, r0
    add r9, r9, r3
    add r10, r10, r2
    ldrsh r0, [r4], #0x2
    ldrsh r3, [r4], #0x2
    add r11, r11, r0
    add ip, ip, r3
    mov pc, lr
    arm_func_end func_01fff594

    .global func_01fff5d8
    arm_func_start func_01fff5d8
func_01fff5d8: ; 0x01fff5d8
    stmdb sp!, {r1, r3, r4, lr}
    add lr, r1, #0x78
    ldr r1, [r1, #0x74]
.L_01fff5e4:
    str r2, [sp, #-0x4]!
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0x1c]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0x18]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0x14]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0x10]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0xc]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0x8]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0x4]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0x0]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0x0]
    str r4, [r1], #0x4
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0x0]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0x1c]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0x18]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0x14]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0x10]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0xc]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0x8]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0x4]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0x4]
    str r4, [r1], #0x4
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0x4]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0x0]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0x1c]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0x18]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0x14]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0x10]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0xc]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0x8]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0x8]
    str r4, [r1], #0x4
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0x8]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0x4]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0x0]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0x1c]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0x18]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0x14]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0x10]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0xc]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0xc]
    str r4, [r1], #0x4
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0xc]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0x8]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0x4]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0x0]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0x1c]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0x18]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0x14]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0x10]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0x10]
    str r4, [r1], #0x4
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0x10]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0xc]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0x8]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0x4]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0x0]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0x1c]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0x18]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0x14]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0x14]
    str r4, [r1], #0x4
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0x14]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0x10]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0xc]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0x8]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0x4]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0x0]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0x1c]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0x18]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0x18]
    str r4, [r1], #0x4
    ldr r4, [r0], #0x4
    ldr r3, [lr, #0x18]
    mov r4, r4, lsl #0xe
    ldr r2, [lr, #0x14]
    mla r4, r5, r3, r4
    ldr r3, [lr, #0x10]
    mla r4, r6, r2, r4
    ldr r2, [lr, #0xc]
    mla r4, r7, r3, r4
    ldr r3, [lr, #0x8]
    mla r4, r8, r2, r4
    ldr r2, [lr, #0x4]
    mla r4, r9, r3, r4
    ldr r3, [lr, #0x0]
    mla r4, r10, r2, r4
    ldr r2, [lr, #0x1c]
    mla r4, r11, r3, r4
    mla r4, ip, r2, r4
    mov r4, r4, asr #0xe
    str r4, [lr, #0x1c]
    str r4, [r1], #0x4
    ldr r2, [sp], #0x4
    subs r2, r2, #0x8
    bne .L_01fff5e4
    ldr r4, [sp, #0x0]
    str r1, [r4, #0x74]
    ldmia sp!, {r1, r3, r4, pc}
    arm_func_end func_01fff5d8

    .global func_01fff8a0
    arm_func_start func_01fff8a0
func_01fff8a0: ; 0x01fff8a0
    stmdb sp!, {r0, lr}
    ldr r0, [r2], #0x4
    ldr lr, [r2], #0x4
    add r5, r5, r0
    add r6, r6, lr
    ldr r0, [r2], #0x4
    ldr lr, [r2], #0x4
    add r7, r7, r0
    add r8, r8, lr
    ldr r0, [r2], #0x4
    ldr lr, [r2], #0x4
    add r9, r9, r0
    add r10, r10, lr
    ldr r0, [r2], #0x4
    ldr lr, [r2], #0x4
    add r11, r11, r0
    add ip, ip, lr
    mov r5, r5, asr #0x1
    mov r6, r6, asr #0x1
    mov r7, r7, asr #0x1
    mov r8, r8, asr #0x1
    mov r9, r9, asr #0x1
    mov r10, r10, asr #0x1
    mov r11, r11, asr #0x1
    mov ip, ip, asr #0x1
    ldmia sp!, {r0, pc}
    arm_func_end func_01fff8a0

    .global func_01fff908
    arm_func_start func_01fff908
func_01fff908: ; 0x01fff908
    stmdb sp!, {r1, r4, lr}
    ldr r2, [r1, #0x6c]
    cmp r2, #0x1
    add r0, r3, #0x200
    str r4, [r1, #0x74]
    addne r3, r1, #0x28
    addne r4, r3, #0x20
    addeq r4, r1, #0x28
    addeq r3, r4, #0x20
    stmia r3, {r5, r6, r7, r8, r9, r10, r11, ip}
    mov r2, r4
    bl func_01fff8a0
    stmdb sp!, {r5, r6, r7, r8, r9, r10, r11, ip}
    mov r2, r4
    bl func_01fff8a0
    mov r2, #0x20
    bl func_01fff5d8
    ldmia sp!, {r5, r6, r7, r8, r9, r10, r11, ip}
    mov r2, #0x20
    bl func_01fff5d8
    mov r2, r3
    bl func_01fff8a0
    mov r2, #0x20
    bl func_01fff5d8
    ldmia r3, {r5, r6, r7, r8, r9, r10, r11, ip}
    mov r2, #0x20
    bl func_01fff5d8
    ldmia sp!, {r1, r4, pc}
    arm_func_end func_01fff908

    .global func_01fff978
    arm_func_start func_01fff978
func_01fff978: ; 0x01fff978
    add r8, r1, #0x8c0
    ldr r7, [r8, #0xc30]
    mov r9, #0x1
    str r7, [r1, #0x68]
    mov r7, #0x8
    str r9, [r1, #0x6c]
    add r8, r1, #0x78
    mov r9, #0x0
.L_01fff998:
    str r9, [r8], #0x4
    subs r7, r7, #0x1
    bne .L_01fff998
    mov pc, lr
    arm_func_end func_01fff978

    .global func_01fff9a8
    arm_func_start func_01fff9a8
func_01fff9a8: ; 0x01fff9a8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, ip, lr}
    mov r1, r0
    ldr r0, [r0, #0x0]
    ldrh r5, [r0], #0x2
    mov r6, r5, lsr #0x9
    cmp r6, #0x7f
    bleq #0xdc
    blne #0x118
    ldr r7, [r1, #0x6c]
    eor r7, r7, #0x1
    str r7, [r1, #0x6c]
    ldr r2, [r1, #0x4]
    mov r0, #0x80
    ldr r5, .L_01fffb34
    ldr r6, .L_01fffb38
.L_01fff9e4:
    ldr r7, [r4], #0x4
    cmp r7, r5
    movgt r7, r5
    cmp r7, r6
    movlt r7, r6
    strh r7, [r2], #0x2
    subs r0, r0, #0x1
    bne .L_01fff9e4
    ldrb r0, [r1, #0x73]
    add r2, pc, #0xe
    ldrb r0, [r2, r0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, ip, lr}
    mov pc, lr
    andne r0, r4, r5, lsl #0x18
    cdpeq p4, #1, c1, c4, c3, #0
    andeq r0, r0, ip, lsl #0x14
    stmdb sp!, {r1, lr}
    add ip, r1, #0x70
    mov r6, r5, lsr #0x6
    and r6, r6, #0x7
    and r5, r5, #0x3f
    strb r5, [ip], #0x1
    ldrh r5, [r0], #0x2
    add r8, r1, #0x14c0
    mov r7, r5, lsr #0xe
    and r7, r7, #0x3
    add r6, r8, r6, lsl #0x1
    ldrsh r8, [r6, #0x0]
    ldr r6, [r1, #0x68]
    mov r11, r5, lsr #0xc
    mul r6, r8, r6
    mov r10, r5, lsr #0x6
    mov r6, r6, asr #0xd
    str r6, [r1, #0x68]
    and r10, r10, #0x3f
    strb r10, [ip], #0x1
    and r5, r5, #0x3f
    strb r5, [ip, #0x0]
    ands r11, r11, #0x3
    strb r11, [r1, #0x73]
    beq func_01fff398
    sub r10, pc, #0x7a
    add r10, r10, r11, lsl #0x1
    ldrb r8, [r10, #0x0]
    ldrb r9, [r10, #0x1]
    b func_01fff350
    stmdb sp!, {r1, lr}
    bl func_01fff978
    add r4, r1, #0xc0
    add r3, r4, #0x400
    bl func_01fff1e0
    bl #-0x8c
    add r2, r1, #0x8c0
    add r2, r2, #0xc10
    bl func_01fff424
    add r2, r1, #0x48
    stmia r2, {r5, r6, r7, r8, r9, r10, r11, ip}
    str r4, [r1, #0x74]
    add r0, r3, #0x200
    mov r2, #0x80
    bl func_01fff5d8
    ldmia sp!, {r1, pc}
    stmdb sp!, {r1, lr}
    mov r7, #0x400
    ldr r2, [r1, #0x6c]
    add r8, r1, #0xc0
    mla r3, r2, r7, r8
    eor r2, r2, #0x1
    mla r4, r2, r7, r8
    mov r8, r3
    add r7, r4, #0x200
    mov r2, #0x20
    ldmia r7!, {r9, r10, r11, ip}
    stmia r8!, {r9, r10, r11, ip}
    subs r2, r2, #0x1
    bne #-0xc
    cmp r6, #0x7e
    bleq func_01fff1e0
    blne func_01fff208
    bl #-0xfc
    add r2, r1, #0x8
    bl func_01fff424
    bl func_01fff908
    ldmia sp!, {r1, pc}
.L_01fffb34: .word 0x7fff
.L_01fffb38: .word 0xffff8000
    arm_func_end func_01fff9a8

