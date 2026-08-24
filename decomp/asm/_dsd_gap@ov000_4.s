    .include "macros/function.inc"

    .text
    .global func_ov000_0214cd20
    arm_func_start func_ov000_0214cd20
func_ov000_0214cd20: ; 0x0214cd20
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r1, .L_0214d090
    ldr r2, .L_0214d094
    mov r0, #0x18
    mov r3, #0x23
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x18
    mov r4, r0
    bl func_020517fc
    mov r0, #0x0
    bl func_0206dcdc
    bl func_02026f94
    str r0, [r4, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214d098
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_020310f4
    ldr r2, .L_0214d09c
    str r0, [r4, #0x0]
    ldr r1, .L_0214d0a0
    ldr r5, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r5, r5, #0x1
    ldr r1, .L_0214d0a4
    str r5, [r2, #0x0]
    str r3, [r1, r5, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r0, #0x0
    bl func_02028920
    str r0, [r4, #0x8]
    ldr r0, [r0, #0x0]
    bl func_02029284
    mov r0, #0x0
    bl func_020208ec
    str r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    bl func_02020c44
    ldr r1, .L_0214d0a8
    ldr r0, .L_0214d0ac
    ldr r3, [r1, #0x0]
    ldr r2, [r0, #0x0]
    sub r3, r3, #0x1
    str r3, [r1, #0x0]
    ldr r1, .L_0214d0b0
    mov r0, #0x0
    str r2, [r1, r3, lsl #0x2]
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
    mov r1, #0x2000
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
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r1, .L_0214d0ac
    ldr r2, [r0, #0x4]
    ldr r0, .L_0214d0b4
    str r2, [r1, #0x0]
    bl func_ov000_0214d0dc
    mov r6, r0
    bl func_ov000_0214d108
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0214d0b8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    mov r0, r5
    mov r1, r6
    mov r2, #0x0
    bl func_ov000_0214d134
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r6
    bl func_02034d7c
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
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    ldr r1, .L_0214d0ac
    ldr r2, [r0, #0x4]
    ldr r0, .L_0214d0bc
    str r2, [r1, #0x0]
    bl func_ov000_0214d0dc
    mov r6, r0
    bl func_ov000_0214d108
    mov r7, r0
    ldr r0, [r7, #0x4]
    ldr r1, .L_0214d0c0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    mov r0, r7
    mov r1, r6
    mov r2, #0x0
    bl func_ov000_0214d134
    ldr r1, [r7, #0x4]
    mov r0, #0x0
    ldr r5, [r1, #0x50]
    str r0, [r5, #0xc]
    str r0, [r5, #0x10]
    ldrb r0, [r5, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_0214d030
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0214d030:
    ldrb r0, [r5, #0x24]
    mov r1, #0x1
    orr r0, r0, #0x31
    strb r0, [r5, #0x24]
    ldr r0, [r7, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r6
    bl func_02034d7c
    ldr r3, .L_0214d0a8
    ldr r0, .L_0214d0b0
    ldr r1, [r3, #0x0]
    ldr r2, .L_0214d0ac
    ldr r5, [r0, r1, lsl #0x2]
    add r6, r1, #0x1
    mov r0, #0x0
    mov r1, #0x1
    str r6, [r3, #0x0]
    str r5, [r2, #0x0]
    bl func_02073ebc
    ldr r0, [r4, #0x0]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0214d090: .word data_ov000_02160b50
.L_0214d094: .word data_ov000_02160b40
.L_0214d098: .word func_ov000_0214d174
.L_0214d09c: .word data_02093c04
.L_0214d0a0: .word data_020a0e80
.L_0214d0a4: .word data_020a16c0
.L_0214d0a8: .word data_02093c08
.L_0214d0ac: .word data_020a0dd0
.L_0214d0b0: .word data_020a16d0
.L_0214d0b4: .word data_ov000_02160b60
.L_0214d0b8: .word data_ov000_02160b78
.L_0214d0bc: .word data_ov000_02160b90
.L_0214d0c0: .word data_ov000_02160ba8
    arm_func_end func_ov000_0214cd20

    .global func_ov000_0214d0c4
    arm_func_start func_ov000_0214d0c4
func_ov000_0214d0c4: ; 0x0214d0c4
    ldr r1, [r1, #0x0]
    mov r1, r1, asr #0x4
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov000_0214d0c4

    .global func_ov000_0214d0d4
    arm_func_start func_ov000_0214d0d4
func_ov000_0214d0d4: ; 0x0214d0d4
    str r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov000_0214d0d4

    .global func_ov000_0214d0dc
    arm_func_start func_ov000_0214d0dc
func_ov000_0214d0dc: ; 0x0214d0dc
    stmdb sp!, {r4, lr}
    bl func_02035c90
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0214d100
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d100:
    ldr r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214d0dc

    .global func_ov000_0214d108
    arm_func_start func_ov000_0214d108
func_ov000_0214d108: ; 0x0214d108
    stmdb sp!, {r4, lr}
    bl func_02036ab8
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214d12c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d12c:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214d108

    .global func_ov000_0214d134
    arm_func_start func_ov000_0214d134
func_ov000_0214d134: ; 0x0214d134
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214d15c
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x50]
    blx r3
    ldmia sp!, {r3, pc}
.L_0214d15c:
    ldr r0, [r0, #0x64]
    ldr r1, [r1, #0x4]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x50]
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_0214d134

    .global func_ov000_0214d174
    arm_func_start func_ov000_0214d174
func_ov000_0214d174: ; 0x0214d174
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214d198
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0214d198: .word func_ov000_0214d19c
    arm_func_end func_ov000_0214d174

    .global func_ov000_0214d19c
    arm_func_start func_ov000_0214d19c
func_ov000_0214d19c: ; 0x0214d19c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r1, [r7, #0x4]
    ldr r0, .L_0214d344
    ldr r4, [r1, #0x10]
    mov r5, #0x0
    ldr r1, [r4, #0x8]
    ldr r3, [r1, #0x0]
    ldr r1, [r3, #0x74]
    ldr r2, [r3, #0x70]
    add r1, r3, r1, lsl #0x2
    add r2, r3, r2, lsl #0x2
    ldr r1, [r1, #0x18]
    ldr r2, [r2, #0x18]
    mvn r1, r1
    and r6, r2, r1
    tst r6, r0
    ldr r0, [r4, #0xc]
    movne r5, #0x1
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x130]
    blx r1
    tst r0, #0x1
    ldr r0, [r4, #0x10]
    movne r5, #0x1
    add r0, r0, #0x1
    str r0, [r4, #0x10]
    cmp r0, #0xb4
    bgt .L_0214d21c
    cmp r5, #0x0
    beq .L_0214d234
.L_0214d21c:
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r7, #0x4]
    ldr r1, .L_0214d348
    bl func_02028384
.L_0214d234:
    ldr r0, [r4, #0x14]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d244: ; jump table
    b .L_0214d264 ; case 0
    b .L_0214d284 ; case 1
    b .L_0214d2a4 ; case 2
    b .L_0214d2c4 ; case 3
    b .L_0214d2e4 ; case 4
    b .L_0214d304 ; case 5
    b .L_0214d324 ; case 6
    ldmia sp!, {r3, r4, r5, r6, r7, pc} ; case 7
.L_0214d264:
    tst r6, #0x4
    addne r0, r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0xb
    movne r0, #0x0
    strne r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d284:
    tst r6, #0x1
    addne r0, r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0xe
    movne r0, #0x0
    strne r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d2a4:
    tst r6, #0x8
    addne r0, r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0x7
    movne r0, #0x0
    strne r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d2c4:
    tst r6, #0x2
    addne r0, r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0xd
    movne r0, #0x0
    strne r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d2e4:
    tst r6, #0x4
    addne r0, r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0xb
    movne r0, #0x0
    strne r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d304:
    tst r6, #0x8
    addne r0, r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0x7
    movne r0, #0x0
    strne r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d324:
    mov r0, #0x78
    mov r1, #0xb
    bl func_0207342c
    bl func_02070d40
    ldr r0, [r4, #0x14]
    add r0, r0, #0x1
    str r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214d344: .word 0x8010
.L_0214d348: .word func_ov000_0214d34c
    arm_func_end func_ov000_0214d19c

    .global func_ov000_0214d34c
    arm_func_start func_ov000_0214d34c
func_ov000_0214d34c: ; 0x0214d34c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, .L_0214d3bc
    ldr r2, .L_0214d3c0
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214d3c4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
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
    mov r0, #0x1
    bl func_0206dcdc
    ldmia sp!, {r4, pc}
.L_0214d3bc: .word data_02093c04
.L_0214d3c0: .word data_020a16c0
.L_0214d3c4: .word data_020a0e80
    arm_func_end func_ov000_0214d34c

    .global func_ov000_0214d3c8
    arm_func_start func_ov000_0214d3c8
func_ov000_0214d3c8: ; 0x0214d3c8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    ldr r1, .L_0214d8d0
    ldr r2, .L_0214d8d4
    mov r0, #0x60
    mov r3, #0x91
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x60
    bl func_020517fc
    bl func_02073410
    bl func_02026f94
    str r0, [r4, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0x14]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x14
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x0
    ldr r1, .L_0214d8d8
    mov r2, r0
    bl func_ov000_02151c20
    ldr r2, .L_0214d8dc
    str r0, [r4, #0x44]
    str r2, [r0, #0xd4]
    str r4, [r0, #0xdc]
    ldr r1, .L_0214d8e0
    ldr r2, [r4, #0x44]
    mov r0, #0x0
    str r1, [r2, #0xd8]
    str r4, [r2, #0xdc]
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
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
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
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x4
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
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
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
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0x974]
    bl func_020310f4
    ldr r2, .L_0214d8e4
    str r0, [r4, #0x0]
    ldr r1, .L_0214d8e8
    ldr r5, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r5, r5, #0x1
    ldr r1, .L_0214d8ec
    str r5, [r2, #0x0]
    str r3, [r1, r5, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r0, #0x0
    bl func_02028920
    str r0, [r4, #0x8]
    mov r0, #0x0
    bl func_020208ec
    str r0, [r4, #0xc]
    mov r1, #0x0
    ldr r0, .L_0214d8f0
    strb r1, [r4, #0x50]
    blx func_020101f4
    ldr r5, .L_0214d8f4
    str r0, [r4, #0x10]
    mov r6, #0x0
.L_0214d730:
    ldr r0, [r5, r6, lsl #0x2]
    bl func_02035c90
    bl func_ov000_0214d908
    add r1, r4, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x24]
    cmp r6, #0x3
    blt .L_0214d730
    mov r0, #0x1
    bl func_0203b424
    ldr r1, .L_0214d8f8
    ldr r0, [r0, #0x88]
    ldr r1, [r1, #0xc]
    ldr r2, [r4, #0x24]
    bl func_ov000_0214d930
    str r0, [r4, #0x18]
    mov r0, #0x2
    bl func_0203b424
    ldr r1, .L_0214d8f8
    ldr r0, [r0, #0x88]
    ldr r1, [r1, #0x10]
    ldr r2, [r4, #0x28]
    bl func_ov000_0214d930
    str r0, [r4, #0x1c]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, .L_0214d8f8
    ldr r0, [r0, #0x88]
    ldr r2, [r4, #0x2c]
    ldr r1, [r1, #0x14]
    bl func_ov000_0214d930
    str r0, [r4, #0x20]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x20]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r0, [r0, #0x20]
    bl func_ov000_0214d908
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    mov r5, r0
    ldr r1, [r5, #0x18]
    cmp r1, #0x0
    bne .L_0214d81c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214d81c:
    ldr r0, [r5, #0x18]
    ldr r1, .L_0214d8fc
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r4, #0x34]
    bl func_ov000_02151570
    ldr r1, .L_0214d900
    str r0, [r4, #0x3c]
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x3c]
    str r4, [r0, #0xc]
    ldr r0, [r4, #0x3c]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    bl func_020758f4
    str r0, [r4, #0x40]
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_ov012_021ba49c
    str r0, [r4, #0x38]
    ldr r1, .L_0214d904
    mov r0, #0xb1
    str r1, [r4, #0x48]
    strh r0, [r4, #0x52]
    add r0, r4, #0x30
    bl func_02075f60
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    mov r0, #0x0
    str r0, [sp, #0x0]
    sub r1, r0, #0x10
    mov r0, r4
    mov r2, #0x2
    mov r3, #0x8
    bl func_ov000_0214e5b8
    mov r0, #0x1
    blx func_02064790
    ldr r0, [r4, #0x0]
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_0214d8d0: .word data_ov000_02160c64
.L_0214d8d4: .word data_ov000_02160bc0
.L_0214d8d8: .word data_ov000_02160c70
.L_0214d8dc: .word func_ov000_0214da58
.L_0214d8e0: .word func_ov000_0214de18
.L_0214d8e4: .word data_02093c04
.L_0214d8e8: .word data_020a0e80
.L_0214d8ec: .word data_020a16c0
.L_0214d8f0: .word data_ov000_02160c84
.L_0214d8f4: .word data_ov000_02160bcc
.L_0214d8f8: .word data_ov000_02160bcc
.L_0214d8fc: .word data_ov000_02160c98
.L_0214d900: .word func_ov000_0214e6d0
.L_0214d904: .word func_ov000_0214de6c
    arm_func_end func_ov000_0214d3c8

    .global func_ov000_0214d908
    arm_func_start func_ov000_0214d908
func_ov000_0214d908: ; 0x0214d908
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0214d928
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d928:
    ldr r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214d908

    .global func_ov000_0214d930
    arm_func_start func_ov000_0214d930
func_ov000_0214d930: ; 0x0214d930
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, .L_0214da18
    ldr r3, .L_0214da1c
    ldr r5, [r4, #0x0]
    ldr r6, [r3, #0x0]
    sub ip, r5, #0x1
    ldr r5, .L_0214da20
    str ip, [r4, #0x0]
    str r6, [r5, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    mov r6, r1
    mov r5, r2
    str r0, [r3, #0x0]
    bl func_02036ab8
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214d984
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214d984:
    ldr r4, [r4, #0x18]
    mov r1, r6
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r5, #0x0
    ldr r0, [r4, #0x4]
    bne .L_0214d9c4
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_0214d9dc
.L_0214d9c4:
    ldr r0, [r0, #0x64]
    ldr r1, [r5, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_0214d9dc:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r2, .L_0214da18
    ldr r0, .L_0214da20
    ldr r5, [r2, #0x0]
    ldr r1, .L_0214da1c
    ldr r3, [r0, r5, lsl #0x2]
    add r5, r5, #0x1
    mov r0, r4
    str r5, [r2, #0x0]
    str r3, [r1, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_0214da18: .word data_02093c08
.L_0214da1c: .word data_020a0dd0
.L_0214da20: .word data_020a16d0
    arm_func_end func_ov000_0214d930

    .global func_ov000_0214da24
    arm_func_start func_ov000_0214da24
func_ov000_0214da24: ; 0x0214da24
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldrb r0, [r4, #0xe4]
    orr r0, r0, #0x2
    strb r0, [r4, #0xe4]
    tst r0, #0x4
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov000_02152980
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214da24

    .global func_ov000_0214da58
    arm_func_start func_ov000_0214da58
func_ov000_0214da58: ; 0x0214da58
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    bl func_02028930
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x124]
    blx r1
    mov r0, r4
    bl func_ov000_0214e4e4
    mov r0, r4
    bl func_ov000_0214e55c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r2, #0x0
    strh r2, [r4, #0x54]
    ldr r3, [r4, #0x44]
    ldr r1, .L_0214dac0
    ldr r0, .L_0214dac4
    str r1, [r3, #0xd4]
    str r4, [r3, #0xdc]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_0201ad30
    ldmia sp!, {r4, pc}
.L_0214dac0: .word func_ov000_0214dac8
.L_0214dac4: .word data_020a0dd8
    arm_func_end func_ov000_0214da58

    .global func_ov000_0214dac8
    arm_func_start func_ov000_0214dac8
func_ov000_0214dac8: ; 0x0214dac8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    bl func_02028930
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x124]
    blx r1
    mov r0, r4
    bl func_ov000_0214e4e4
    ldrb r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_0214db30
    ldr r0, [r4, #0x8]
    bl func_ov000_0214db5c
    ldr r1, .L_0214db54
    tst r0, r1
    beq .L_0214db30
    ldr r0, .L_0214db58
    ldr r0, [r0, #0x8d8]
    tst r0, #0x1
    beq .L_0214db30
    mov r0, r4
    bl func_ov000_0214dd90
    ldmia sp!, {r4, pc}
.L_0214db30:
    ldrb r0, [r4, #0x56]
    tst r0, #0x2
    beq .L_0214db44
    mov r0, r4
    bl func_ov000_0214e55c
.L_0214db44:
    ldr r1, [r4, #0x48]
    mov r0, r4
    blx r1
    ldmia sp!, {r4, pc}
.L_0214db54: .word 0x8010
.L_0214db58: .word data_020b02b8
    arm_func_end func_ov000_0214dac8

    .global func_ov000_0214db5c
    arm_func_start func_ov000_0214db5c
func_ov000_0214db5c: ; 0x0214db5c
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
    arm_func_end func_ov000_0214db5c

    .global func_ov000_0214db84
    arm_func_start func_ov000_0214db84
func_ov000_0214db84: ; 0x0214db84
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, .L_0214dd70
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0201ad30
    ldr r0, [r4, #0x44]
    bl func_ov000_0214da24
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    beq .L_0214dbc8
    bl func_0206b138
.L_0214dbc8:
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x948]
    blx r0
    mov r1, #0x0
    mov r2, #0xc000
    bl func_020517fc
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r0, [r0, #0x4]
    bl func_0203d288
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0x974]
    ldrb r0, [r4, #0x56]
    tst r0, #0x4
    beq .L_0214dc44
    ldr r0, .L_0214dd74
    ldr r1, .L_0214dd78
    ldr r0, [r0, #0x0]
    mov r2, r4
    bl func_020428dc
    ldrb r0, [r4, #0x56]
    bic r0, r0, #0x4
    strb r0, [r4, #0x56]
.L_0214dc44:
    mov r0, #0x1
    mov r1, #0x0
    blx func_0207120c
    ldr r0, [r4, #0x38]
    bl func_ov012_021bab64
    ldr r0, [r4, #0x44]
    bl func_ov000_02152360
    ldr r0, [r4, #0x40]
    bl func_0207597c
    ldr r0, [r4, #0x3c]
    bl func_ov000_021517b8
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_0214dc8c
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214dc8c:
    mov r5, #0x0
.L_0214dc90:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_0214dcac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0214dcac:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0214dc90
    mov r5, #0x0
.L_0214dcbc:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_0214dcd0
    bl func_02034d7c
.L_0214dcd0:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0214dcbc
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214dcf4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214dcf4:
    mvn r0, #0x0
    blx func_02064790
    ldr r0, .L_0214dd7c
    ldrb r2, [r4, #0x57]
    ldr r1, .L_0214dd80
    ldr r0, [r0, #0x0]
    str r2, [r1, #0x8]
    blx r0
    ldr r0, .L_0214dd7c
    ldr r0, [r0, #0x0]
    blx r0
    ldr r1, .L_0214dd84
    ldr r2, .L_0214dd88
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214dd8c
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
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
.L_0214dd70: .word data_020a0dd8
.L_0214dd74: .word data_020a0f64
.L_0214dd78: .word func_ov000_0214e61c
.L_0214dd7c: .word data_020a0e18
.L_0214dd80: .word data_020afcb0
.L_0214dd84: .word data_02093c04
.L_0214dd88: .word data_020a16c0
.L_0214dd8c: .word data_020a0e80
    arm_func_end func_ov000_0214db84

    .global func_ov000_0214dd90
    arm_func_start func_ov000_0214dd90
func_ov000_0214dd90: ; 0x0214dd90
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x56]
    tst r0, #0x2
    bne .L_0214ddb0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
.L_0214ddb0:
    ldr r2, [r4, #0x44]
    mov r0, #0x0
    ldrb r1, [r2, #0xe4]
    orr r1, r1, #0x8
    strb r1, [r2, #0xe4]
    strb r0, [r2, #0xe5]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214ddf8
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r1, [r4, #0x44]
    ldr r0, .L_0214ddfc
    str r0, [r1, #0xd4]
    str r4, [r1, #0xdc]
    ldmia sp!, {r4, pc}
.L_0214ddf8: .word func_ov000_0214db84
.L_0214ddfc: .word func_ov000_0214de00
    arm_func_end func_ov000_0214dd90

    .global func_ov000_0214de00
    arm_func_start func_ov000_0214de00
func_ov000_0214de00: ; 0x0214de00
    stmdb sp!, {r3, lr}
    ldr r0, .L_0214de14
    ldr r0, [r0, #0x0]
    blx r0
    ldmia sp!, {r3, pc}
.L_0214de14: .word data_020a0e18
    arm_func_end func_ov000_0214de00

    .global func_ov000_0214de18
    arm_func_start func_ov000_0214de18
func_ov000_0214de18: ; 0x0214de18
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x56]
    tst r0, #0x2
    bne .L_0214de38
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
.L_0214de38:
    ldr r0, [r4, #0x44]
    bl func_ov000_0214da24
    mov r0, #0x0
    strb r0, [r4, #0x57]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214de68
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0214de68: .word func_ov000_0214db84
    arm_func_end func_ov000_0214de18

    .global func_ov000_0214de6c
    arm_func_start func_ov000_0214de6c
func_ov000_0214de6c: ; 0x0214de6c
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x54]
    add r1, r2, #0x1
    strh r1, [r0, #0x54]
    cmp r2, #0x3c
    ldmlsia sp!, {r3, pc}
    ldr r1, .L_0214deac
    mov ip, #0x1
    str r1, [r0, #0x48]
    mov r1, #0x0
    strh r1, [r0, #0x54]
    sub r2, ip, #0x2
    mov r3, #0x10
    str ip, [sp, #0x0]
    bl func_ov000_0214e5b8
    ldmia sp!, {r3, pc}
.L_0214deac: .word func_ov000_0214e3c0
    arm_func_end func_ov000_0214de6c

    .global func_ov000_0214deb0
    arm_func_start func_ov000_0214deb0
func_ov000_0214deb0: ; 0x0214deb0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x1c
    mov r4, r0
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x128]
    blx r1
    mov r5, r0
    ldr r1, [r4, #0xc]
    add r0, sp, #0x8
    bl func_ov000_0214e290
    add r0, sp, #0x8
    ldr r3, [r0, #0x0]
    ldr r1, [r4, #0xc]
    mov r2, r3, asr #0xb
    add r2, r3, r2, lsr #0x14
    add r0, sp, #0xc
    mov r6, r2, asr #0xc
    bl func_ov000_0214e27c
    add r0, sp, #0xc
    ldr r2, [r0, #0x0]
    cmp r5, #0x0
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    movne r3, #0x1
    ldr r0, [r4, #0x3c]
    moveq r3, #0x0
    mov r2, r6
    mov r1, r1, asr #0xc
    bl func_ov000_021518c4
    ldr r0, [r4, #0x8]
    bl func_ov000_0214e2a4
    tst r0, #0x100
    beq .L_0214df54
    ldr r0, [r4, #0x8]
    bl func_ov000_0214e2a4
    tst r0, #0x200
    movne r0, #0xb1
    strneh r0, [r4, #0x52]
    bne .L_0214dfb0
.L_0214df54:
    ldr r0, [r4, #0x8]
    bl func_ov000_0214db5c
    tst r0, #0x100
    beq .L_0214df84
    ldrh r0, [r4, #0x52]
    add r0, r0, #0x1
    strh r0, [r4, #0x52]
    ldrh r0, [r4, #0x52]
    cmp r0, #0xb9
    movhi r0, #0xb1
    strhih r0, [r4, #0x52]
    b .L_0214dfb0
.L_0214df84:
    ldr r0, [r4, #0x8]
    bl func_ov000_0214db5c
    tst r0, #0x200
    beq .L_0214dfb0
    ldrh r0, [r4, #0x52]
    sub r0, r0, #0x1
    strh r0, [r4, #0x52]
    ldrh r0, [r4, #0x52]
    cmp r0, #0xb1
    movlo r0, #0xb9
    strloh r0, [r4, #0x52]
.L_0214dfb0:
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x128]
    blx r1
    cmp r0, #0x0
    ldrb r0, [r4, #0x56]
    beq .L_0214e224
    tst r0, #0x1
    beq .L_0214e1c8
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x50]
    ldr r3, [r0, #0xc]
    str r3, [sp, #0x10]
    ldr r1, [r0, #0x10]
    str r1, [sp, #0x14]
    ldr r0, [r0, #0x14]
    str r0, [sp, #0x18]
    ldrsh r7, [r4, #0x4e]
    ldrsh r6, [r4, #0x4c]
    rsb r2, r1, r7, lsl #0xc
    mov r1, r2, asr #0xb
    rsb r3, r3, r6, lsl #0xc
    add r1, r2, r1, lsr #0x14
    mov r0, r3, asr #0xb
    mov r1, r1, asr #0xc
    add r0, r3, r0, lsr #0x14
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x4
    movs r3, r2, asr #0x10
    mov r1, r0, asr #0x10
    rsbmi r0, r3, #0x0
    movpl r0, r3
    cmp r1, #0x0
    rsblt r2, r1, #0x0
    movge r2, r1
    cmp r2, r0
    ble .L_0214e0fc
    mov r0, r3, lsl #0x8
    bl func_0200d12c
    mov r5, r0, lsl #0x10
    add r0, sp, #0x10
    mov r1, r6
    bl func_ov000_0214e2b8
    cmp r0, #0x0
    beq .L_0214e0ac
    ldr r3, [sp, #0x10]
    ldr r2, [sp, #0x14]
    mov r0, r3, asr #0xb
    mov r1, r2, asr #0xb
    add r0, r3, r0, lsr #0x14
    add r1, r2, r1, lsr #0x14
    mov r0, r0, lsl #0x4
    mov r1, r1, asr #0xc
    mov r6, r0, asr #0x10
    mov r8, r1, lsl #0x8
    ldrsh r7, [r4, #0x4c]
    b .L_0214e0f0
.L_0214e0ac:
    ldr r2, [sp, #0x10]
    ldrsh r1, [r4, #0x4e]
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, lsl #0x4
    ldrsh r6, [r4, #0x4c]
    mov r7, r0, asr #0x10
    mov r8, r1, lsl #0x8
    b .L_0214e0f0
.L_0214e0d0:
    mov r1, r6, lsl #0x10
    mov r2, r8, lsl #0x8
    mov r0, r4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov000_0214e2cc
    add r8, r8, r5, asr #0x10
    add r6, r6, #0x1
.L_0214e0f0:
    cmp r6, r7
    ble .L_0214e0d0
    b .L_0214e19c
.L_0214e0fc:
    mov r0, r1, lsl #0x8
    mov r1, r3
    bl func_0200d12c
    mov r5, r0, lsl #0x10
    add r0, sp, #0x14
    mov r1, r7
    bl func_ov000_0214e2b8
    cmp r0, #0x0
    beq .L_0214e150
    ldr r3, [sp, #0x14]
    ldr r2, [sp, #0x10]
    mov r0, r3, asr #0xb
    mov r1, r2, asr #0xb
    add r0, r3, r0, lsr #0x14
    add r1, r2, r1, lsr #0x14
    mov r0, r0, lsl #0x4
    mov r1, r1, asr #0xc
    mov r6, r0, asr #0x10
    mov r8, r1, lsl #0x8
    ldrsh r7, [r4, #0x4e]
    b .L_0214e194
.L_0214e150:
    ldr r2, [sp, #0x14]
    ldrsh r1, [r4, #0x4c]
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, lsl #0x4
    ldrsh r6, [r4, #0x4e]
    mov r7, r0, asr #0x10
    mov r8, r1, lsl #0x8
    b .L_0214e194
.L_0214e174:
    mov r1, r8, lsl #0x8
    mov r2, r6, lsl #0x10
    mov r0, r4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_ov000_0214e2cc
    add r8, r8, r5, asr #0x10
    add r6, r6, #0x1
.L_0214e194:
    cmp r6, r7
    ble .L_0214e174
.L_0214e19c:
    ldr r1, [sp, #0x10]
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [r4, #0x4c]
    ldr r1, [sp, #0x14]
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [r4, #0x4e]
    b .L_0214e218
.L_0214e1c8:
    orr r0, r0, #0x1
    strb r0, [r4, #0x56]
    ldr r1, [r4, #0xc]
    add r0, sp, #0x4
    bl func_ov000_0214e27c
    add r1, sp, #0x4
    ldr r2, [r1, #0x0]
    add r0, sp, #0x0
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r1, r1, asr #0xc
    strh r1, [r4, #0x4c]
    ldr r1, [r4, #0xc]
    bl func_ov000_0214e290
    add r0, sp, #0x0
    ldr r1, [r0, #0x0]
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [r4, #0x4e]
.L_0214e218:
    mov r0, #0x0
    strh r0, [r4, #0x54]
    b .L_0214e22c
.L_0214e224:
    bic r0, r0, #0x1
    strb r0, [r4, #0x56]
.L_0214e22c:
    ldrh r1, [r4, #0x54]
    add r0, r1, #0x1
    strh r0, [r4, #0x54]
    cmp r1, #0x5a
    bls .L_0214e274
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x948]
    blx r0
    mov r1, #0x0
    mov r2, #0xc000
    bl func_020517fc
    ldr r0, [r4, #0x3c]
    bl func_ov000_02151898
    mov r0, #0x0
    strh r0, [r4, #0x54]
.L_0214e274:
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov000_0214deb0

    .global func_ov000_0214e27c
    arm_func_start func_ov000_0214e27c
func_ov000_0214e27c: ; 0x0214e27c
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x50]
    ldr r1, [r1, #0xc]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov000_0214e27c

    .global func_ov000_0214e290
    arm_func_start func_ov000_0214e290
func_ov000_0214e290: ; 0x0214e290
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0x50]
    ldr r1, [r1, #0x10]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov000_0214e290

    .global func_ov000_0214e2a4
    arm_func_start func_ov000_0214e2a4
func_ov000_0214e2a4: ; 0x0214e2a4
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0x70]
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x18]
    bx lr
    arm_func_end func_ov000_0214e2a4

    .global func_ov000_0214e2b8
    arm_func_start func_ov000_0214e2b8
func_ov000_0214e2b8: ; 0x0214e2b8
    ldr r0, [r0, #0x0]
    cmp r0, r1, lsl #0xc
    movlt r0, #0x1
    movge r0, #0x0
    bx lr
    arm_func_end func_ov000_0214e2b8

    .global func_ov000_0214e2cc
    arm_func_start func_ov000_0214e2cc
func_ov000_0214e2cc: ; 0x0214e2cc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r0, #0x3
    mov r5, r1
    mov r4, r2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x948]
    blx r0
    cmp r5, #0x0
    subgt r1, r5, #0x1
    movgt r1, r1, lsl #0x10
    movgt r5, r1, asr #0x10
    mov r1, r5, asr #0x1
    and r3, r5, #0x3
    add r1, r5, r1, lsr #0x1e
    mov r2, r4, lsl #0x6
    add r2, r2, r1, asr #0x2
    mov r1, r3, lsl #0x3
    mov r5, #0xff
    mvn r7, r5, lsl r1
    ldr r5, [r0, r2, lsl #0x2]
    cmp r4, #0x0
    and ip, r5, r7
    str ip, [r0, r2, lsl #0x2]
    ldrh r5, [r6, #0x52]
    orr r5, ip, r5, lsl r1
    str r5, [r0, r2, lsl #0x2]
    beq .L_0214e360
    sub lr, r2, #0x40
    ldr r5, [r0, lr, lsl #0x2]
    and ip, r5, r7
    str ip, [r0, lr, lsl #0x2]
    ldrh r5, [r6, #0x52]
    orr r1, ip, r5, lsl r1
    str r1, [r0, lr, lsl #0x2]
.L_0214e360:
    add r1, r3, #0x1
    and r3, r1, #0xff
    cmp r3, #0x3
    movhi r3, #0x0
    addhi r2, r2, #0x1
    mov r1, r3, lsl #0x3
    mov r3, #0xff
    mvn r5, r3, lsl r1
    ldr r3, [r0, r2, lsl #0x2]
    cmp r4, #0x0
    and r4, r3, r5
    str r4, [r0, r2, lsl #0x2]
    ldrh r3, [r6, #0x52]
    orr r3, r4, r3, lsl r1
    str r3, [r0, r2, lsl #0x2]
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    sub r4, r2, #0x40
    ldr r2, [r0, r4, lsl #0x2]
    and r3, r2, r5
    str r3, [r0, r4, lsl #0x2]
    ldrh r2, [r6, #0x52]
    orr r1, r3, r2, lsl r1
    str r1, [r0, r4, lsl #0x2]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov000_0214e2cc

    .global func_ov000_0214e3c0
    arm_func_start func_ov000_0214e3c0
func_ov000_0214e3c0: ; 0x0214e3c0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov000_0214e55c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_0214e474
    mov r1, #0x0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x18]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x1c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x20]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    mov r2, #0x1
    ldr r1, [r0, #0x88]
    mov r0, #0x3
    ldr r1, [r1, #0x4]
    strb r2, [r1, #0x974]
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x948]
    blx r0
    mov r1, #0x0
    mov r2, #0xc000
    bl func_020517fc
    mov r0, #0x1
    strb r0, [r4, #0x50]
    mov r0, #0x0
    strh r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
.L_0214e474: .word func_ov000_0214e478
    arm_func_end func_ov000_0214e3c0

    .global func_ov000_0214e478
    arm_func_start func_ov000_0214e478
func_ov000_0214e478: ; 0x0214e478
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x54]
    add r1, r2, #0x1
    strh r1, [r0, #0x54]
    cmp r2, #0x4
    bls .L_0214e4ac
    ldr r1, .L_0214e4bc
    mov r2, #0x1
    str r1, [r0, #0x48]
    sub r1, r2, #0x11
    mov r3, #0x10
    str r2, [sp, #0x0]
    bl func_ov000_0214e5b8
.L_0214e4ac:
    ldr r0, .L_0214e4c0
    ldr r0, [r0, #0x0]
    blx r0
    ldmia sp!, {r3, pc}
.L_0214e4bc: .word func_ov000_0214e4c4
.L_0214e4c0: .word data_020a0e18
    arm_func_end func_ov000_0214e478

    .global func_ov000_0214e4c4
    arm_func_start func_ov000_0214e4c4
func_ov000_0214e4c4: ; 0x0214e4c4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov000_0214e55c
    cmp r0, #0x0
    ldrne r0, .L_0214e4e0
    strne r0, [r4, #0x48]
    ldmia sp!, {r4, pc}
.L_0214e4e0: .word func_ov000_0214deb0
    arm_func_end func_ov000_0214e4c4

    .global func_ov000_0214e4e4
    arm_func_start func_ov000_0214e4e4
func_ov000_0214e4e4: ; 0x0214e4e4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    bl func_ov000_0214e2a4
    cmp r0, #0xc300
    bne .L_0214e514
    ldr r0, [r4, #0x8]
    bl func_ov000_0214db5c
    tst r0, #0xc300
    beq .L_0214e514
    mov r0, #0x0
    bl func_0206dcec
.L_0214e514:
    ldrb r0, [r4, #0x51]
    cmp r0, #0x0
    ldreq r0, .L_0214e558
    ldreqh r0, [r0, #0x0]
    andeq r0, r0, #0x8000
    moveq r0, r0, asr #0xf
    cmpeq r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x44]
    bl func_ov000_0214da24
    mov r0, r4
    bl func_ov000_0214dd90
    mov r1, #0x0
    mov r2, r1
    mov r0, #0xc
    blx func_020616a8
    ldmia sp!, {r4, pc}
.L_0214e558: .word 0x27fffa8
    arm_func_end func_ov000_0214e4e4

    .global func_ov000_0214e55c
    arm_func_start func_ov000_0214e55c
func_ov000_0214e55c: ; 0x0214e55c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r1, [r4, #0x5b]
    ldrb r0, [r4, #0x59]
    cmp r1, r0
    bhs .L_0214e5a8
    ldrb r0, [r4, #0x56]
    tst r0, #0x4
    beq .L_0214e5a0
    ldr r0, .L_0214e5b0
    ldr r1, .L_0214e5b4
    ldr r0, [r0, #0x0]
    mov r2, r4
    bl func_020428dc
    ldrb r0, [r4, #0x56]
    bic r0, r0, #0x4
    strb r0, [r4, #0x56]
.L_0214e5a0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0214e5a8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0214e5b0: .word data_020a0f64
.L_0214e5b4: .word func_ov000_0214e61c
    arm_func_end func_ov000_0214e55c

    .global func_ov000_0214e5b8
    arm_func_start func_ov000_0214e5b8
func_ov000_0214e5b8: ; 0x0214e5b8
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    strb r0, [r4, #0x59]
    strb r1, [r4, #0x58]
    strb r3, [r4, #0x5b]
    ldrb r0, [sp, #0x8]
    strb r2, [r4, #0x5a]
    strb r0, [r4, #0x5c]
    ldrb r0, [r4, #0x56]
    tst r0, #0x4
    bne .L_0214e608
    ldr r0, .L_0214e614
    ldr r1, .L_0214e618
    ldr r0, [r0, #0x0]
    mov r2, r4
    bl func_0204267c
    ldrb r0, [r4, #0x56]
    orr r0, r0, #0x4
    strb r0, [r4, #0x56]
.L_0214e608:
    mov r0, r4
    bl func_ov000_0214e55c
    ldmia sp!, {r4, pc}
.L_0214e614: .word data_020a0f64
.L_0214e618: .word func_ov000_0214e61c
    arm_func_end func_ov000_0214e5b8

    .global func_ov000_0214e61c
    arm_func_start func_ov000_0214e61c
func_ov000_0214e61c: ; 0x0214e61c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x5c]
    cmp r0, #0x1
    bne .L_0214e650
    bl func_0203b3f4
    ldrsb r1, [r4, #0x58]
    ldr r0, [r0, #0x88]
    bl func_ov000_0214e6bc
    ldrsb r1, [r4, #0x58]
    ldr r0, .L_0214e6b4
    blx func_02064e00
    b .L_0214e688
.L_0214e650:
    bl func_0203b3e4
    ldrsb r1, [r4, #0x58]
    ldr r0, [r0, #0x88]
    bl func_ov000_0214e6bc
    bl func_0203b3f4
    ldrsb r1, [r4, #0x58]
    ldr r0, [r0, #0x88]
    bl func_ov000_0214e6bc
    ldrsb r1, [r4, #0x58]
    ldr r0, .L_0214e6b8
    blx func_02064e00
    ldrsb r1, [r4, #0x58]
    ldr r0, .L_0214e6b4
    blx func_02064e00
.L_0214e688:
    ldrb r0, [r4, #0x59]
    add r1, r0, #0x1
    strb r1, [r4, #0x59]
    ldrb r0, [r4, #0x5b]
    and r1, r1, #0xff
    cmp r1, r0
    ldrlssb r1, [r4, #0x58]
    ldrlssb r0, [r4, #0x5a]
    addls r0, r1, r0
    strlsb r0, [r4, #0x58]
    ldmia sp!, {r4, pc}
.L_0214e6b4: .word 0x400106c
.L_0214e6b8: .word 0x400006c
    arm_func_end func_ov000_0214e61c

    .global func_ov000_0214e6bc
    arm_func_start func_ov000_0214e6bc
func_ov000_0214e6bc: ; 0x0214e6bc
    ldr r2, [r0, #0x4]
    mov r0, #0x1
    str r1, [r2, #0x8f8]
    strb r0, [r2, #0x902]
    bx lr
    arm_func_end func_ov000_0214e6bc

    .global func_ov000_0214e6d0
    arm_func_start func_ov000_0214e6d0
func_ov000_0214e6d0: ; 0x0214e6d0
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    ldr r5, [r0, #0xc]
    add r2, sp, #0x14
    ldr r0, [r5, #0x40]
    bl func_020759a4
    cmp r0, #0x0
    beq .L_0214e808
    ldr r0, .L_0214e810
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0201ad30
    ldr r0, [r5, #0x44]
    bl func_ov000_0214da24
    mov r1, #0x0
    ldr r3, [r5, #0x44]
    ldr r2, .L_0214e814
    ldr r0, .L_0214e818
    str r2, [r3, #0xd4]
    mov r2, r1
    str r5, [r3, #0xdc]
    bl func_02033410
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne .L_0214e748
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214e748:
    ldr r6, [r4, #0x1c]
    mov r1, #0x0
    ldr r0, [r6, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r1, #0x0
    ldr r3, [sp, #0x14]
    ldr lr, [r5, #0x30]
    mov r2, #0xc
    mul ip, r3, r2
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r4, r0
    ldr r2, [lr, ip]
    add ip, lr, ip
    ldr r0, [r5, #0x38]
    mov r3, r1
    add r2, ip, r2
    bl func_ov012_021bac78
    ldr r1, [sp, #0x14]
    mov r0, #0xc
    mla r0, r1, r0, r4
    bl func_02075f98
    ldr r0, [r6, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x78
    mov r1, #0x9
    bl func_0207342c
    mov r0, #0x1
    strb r0, [r5, #0x57]
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r5, #0x4]
    ldr r1, .L_0214e81c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, .L_0214e810
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0201ad30
.L_0214e808:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_0214e810: .word data_020a0dd8
.L_0214e814: .word func_ov000_0214de00
.L_0214e818: .word data_ov000_02160cac
.L_0214e81c: .word func_ov000_0214e820
    arm_func_end func_ov000_0214e6d0

    .global func_ov000_0214e820
    arm_func_start func_ov000_0214e820
func_ov000_0214e820: ; 0x0214e820
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x38]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov000_0214dd90
    ldr r0, .L_0214e85c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0201ad30
    ldmia sp!, {r4, pc}
.L_0214e85c: .word data_020a0dd8
    arm_func_end func_ov000_0214e820

    .global func_ov000_0214e860
    arm_func_start func_ov000_0214e860
func_ov000_0214e860: ; 0x0214e860
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0214e988
    ldr r2, .L_0214e98c
    mov r0, #0x20
    mov r3, #0x39
    bl func_0201a21c
    mov r4, r0
    mov r1, #0x0
    mov r2, #0x20
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
    ldr r1, .L_0214e990
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_020310f4
    ldr r2, .L_0214e994
    str r0, [r4, #0x0]
    ldr r1, .L_0214e998
    ldr ip, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r1, .L_0214e99c
    str ip, [r2, #0x0]
    str r3, [r1, ip, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r1, #0x0
    strb r1, [r4, #0x19]
    ldr r0, .L_0214e9a0
    strb r1, [r4, #0x1a]
    blx func_020101f4
    str r0, [r4, #0x8]
    mov r0, r4
    bl func_ov000_0215b084
    str r0, [r4, #0xc]
    mov r0, r4
    bl func_ov000_0215e1bc
    str r0, [r4, #0x10]
    mov r0, r4
    bl func_ov000_0215f64c
    str r0, [r4, #0x14]
    ldr r0, .L_0214e9a4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    mov r0, #0x1
    bl func_020734e0
    mov r0, #0x1
    mov r1, #0x0
    bl func_0207361c
    ldr r0, [r4, #0xc]
    bl func_ov000_0215b8b8
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x0]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0214e988: .word data_ov000_02160cc8
.L_0214e98c: .word data_ov000_02160cbc
.L_0214e990: .word func_ov000_0214e9a8
.L_0214e994: .word data_02093c04
.L_0214e998: .word data_020a0e80
.L_0214e99c: .word data_020a16c0
.L_0214e9a0: .word data_ov000_02160cd4
.L_0214e9a4: .word data_020a0f64
    arm_func_end func_ov000_0214e860

    .global func_ov000_0214e9a8
    arm_func_start func_ov000_0214e9a8
func_ov000_0214e9a8: ; 0x0214e9a8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0x19]
    cmp r0, #0x0
    beq .L_0214e9e4
    cmp r0, #0x1
    beq .L_0214e9f0
    cmp r0, #0x2
    beq .L_0214e9fc
    b .L_0214ea04
.L_0214e9e4:
    ldr r0, [r4, #0xc]
    bl func_ov000_0215bda0
    b .L_0214ea04
.L_0214e9f0:
    ldr r0, [r4, #0x10]
    bl func_ov000_0215ebc4
    b .L_0214ea04
.L_0214e9fc:
    ldr r0, [r4, #0x14]
    bl func_ov000_0215fda0
.L_0214ea04:
    mov r0, #0x0
    strb r0, [r4, #0x18]
    ldrb r0, [r4, #0x19]
    cmp r0, #0x2
    ldr r0, [r5, #0x4]
    blo .L_0214ea24
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, pc}
.L_0214ea24:
    ldr r1, .L_0214ea30
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0214ea30: .word func_ov000_0214ea34
    arm_func_end func_ov000_0214e9a8

    .global func_ov000_0214ea34
    arm_func_start func_ov000_0214ea34
func_ov000_0214ea34: ; 0x0214ea34
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x4]
    ldr r1, .L_0214eabc
    ldr r4, [r2, #0x10]
    ldr r0, [r1, #0x8d8]
    tst r0, #0x8
    ldmeqia sp!, {r4, pc}
    mov r0, #0x0
    bl func_02028920
    ldr r2, [r0, #0x0]
    ldr r0, [r2, #0x74]
    ldr r1, [r2, #0x70]
    add r0, r2, r0, lsl #0x2
    add r1, r2, r1, lsl #0x2
    ldr r0, [r0, #0x18]
    ldr r1, [r1, #0x18]
    mvn r0, r0
    and r0, r1, r0
    cmp r0, #0x8000
    beq .L_0214eaa4
    mov r0, #0x0
    bl func_020208ec
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x130]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_0214eaa4:
    mov r0, r4
    mov r1, #0x2
    bl func_ov000_0214ec4c
    mov r0, #0x1
    strb r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
.L_0214eabc: .word data_020b02b8
    arm_func_end func_ov000_0214ea34

    .global func_ov000_0214eac0
    arm_func_start func_ov000_0214eac0
func_ov000_0214eac0: ; 0x0214eac0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrb r0, [r4, #0x19]
    cmp r0, #0x0
    beq .L_0214eaf8
    cmp r0, #0x1
    beq .L_0214eb04
    cmp r0, #0x2
    beq .L_0214eb10
    b .L_0214eb18
.L_0214eaf8:
    ldr r0, [r4, #0xc]
    bl func_ov000_0215beb4
    b .L_0214eb18
.L_0214eb04:
    ldr r0, [r4, #0x10]
    bl func_ov000_0215ed2c
    b .L_0214eb18
.L_0214eb10:
    ldr r0, [r4, #0x14]
    bl func_ov000_0215fe08
.L_0214eb18:
    ldrb r0, [r4, #0x1a]
    strb r0, [r4, #0x19]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0214ec0c
.L_0214eb2c: ; jump table
    b .L_0214eb3c ; case 0
    b .L_0214eb48 ; case 1
    b .L_0214eb54 ; case 2
    b .L_0214eb60 ; case 3
.L_0214eb3c:
    ldr r0, [r4, #0xc]
    bl func_ov000_0215b8b8
    b .L_0214ec0c
.L_0214eb48:
    ldr r0, [r4, #0x10]
    bl func_ov000_0215e2bc
    b .L_0214ec0c
.L_0214eb54:
    ldr r0, [r4, #0x14]
    bl func_ov000_0215f6e4
    b .L_0214ec0c
.L_0214eb60:
    ldr r0, .L_0214ec38
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02041f7c
    bl func_020735e4
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214eb84
    bl func_ov000_0215b760
.L_0214eb84:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214eb94
    bl func_ov000_0215e1fc
.L_0214eb94:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_0214eba4
    bl func_ov000_0215f68c
.L_0214eba4:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0214ebbc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0214ebbc:
    ldr r1, .L_0214ec3c
    ldr r2, .L_0214ec40
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214ec44
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
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
    ldmia sp!, {r4, pc}
.L_0214ec0c:
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x4]
    ldr r1, .L_0214ec48
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0214ec38: .word data_020a0f64
.L_0214ec3c: .word data_02093c04
.L_0214ec40: .word data_020a16c0
.L_0214ec44: .word data_020a0e80
.L_0214ec48: .word func_ov000_0214e9a8
    arm_func_end func_ov000_0214eac0

    .global func_ov000_0214ec4c
    arm_func_start func_ov000_0214ec4c
func_ov000_0214ec4c: ; 0x0214ec4c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r0, [r5, #0x18]
    mov r4, r1
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    strb r4, [r5, #0x1a]
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r5, #0x4]
    ldr r1, .L_0214ec94
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0214ec94: .word func_ov000_0214eac0
    arm_func_end func_ov000_0214ec4c

    .global func_ov000_0214ec98
    arm_func_start func_ov000_0214ec98
func_ov000_0214ec98: ; 0x0214ec98
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    mov r0, r2
    bl func_ov000_0214ed48
    mov r0, r4
    bl func_02035c90
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_0214ecd0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214ecd0:
    ldr r4, [r4, #0x38]
    bl func_02036ab8
    bl func_ov000_0214ed84
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_0214ed1c
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_0214ed34
.L_0214ed1c:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_0214ed34:
    mov r0, r4
    bl func_02034d7c
    bl func_ov000_0214edac
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_0214ec98

    .global func_ov000_0214ed48
    arm_func_start func_ov000_0214ed48
func_ov000_0214ed48: ; 0x0214ed48
    stmdb sp!, {r3, lr}
    ldr r2, .L_0214ed78
    ldr r1, .L_0214ed7c
    ldr ip, [r2, #0x0]
    ldr lr, [r0, #0x4]
    ldr r3, [r1, #0x0]
    sub ip, ip, #0x1
    ldr r0, .L_0214ed80
    str ip, [r2, #0x0]
    str r3, [r0, ip, lsl #0x2]
    str lr, [r1, #0x0]
    ldmia sp!, {r3, pc}
.L_0214ed78: .word data_02093c08
.L_0214ed7c: .word data_020a0dd0
.L_0214ed80: .word data_020a16d0
    arm_func_end func_ov000_0214ed48

    .global func_ov000_0214ed84
    arm_func_start func_ov000_0214ed84
func_ov000_0214ed84: ; 0x0214ed84
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_0214eda4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0214eda4:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214ed84

    .global func_ov000_0214edac
    arm_func_start func_ov000_0214edac
func_ov000_0214edac: ; 0x0214edac
    ldr r1, .L_0214edd0
    ldr r2, .L_0214edd4
    ldr r3, [r1, #0x0]
    ldr r0, .L_0214edd8
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bx lr
.L_0214edd0: .word data_02093c08
.L_0214edd4: .word data_020a16d0
.L_0214edd8: .word data_020a0dd0
    arm_func_end func_ov000_0214edac

    .global func_ov000_0214eddc
    arm_func_start func_ov000_0214eddc
func_ov000_0214eddc: ; 0x0214eddc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r4, r1
    mov r0, r2
    mov r6, r3
    ldr r5, [sp, #0x18]
    bl func_ov000_0214ed48
    mov r0, r4
    bl func_020329ec
    bl func_ov000_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r7
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r2, .L_0214eecc
    ldr r1, [r4, #0x4]
    mov r0, r4
    str r2, [r1, #0x54]
    ldr r2, [r6, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    bl func_ov000_0214eed0
    cmp r5, #0x0
    beq .L_0214eeac
    ldr r0, [r5, #0x4]
    ldr r6, [r4, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    cmp r5, #0x0
    ldr r0, [r4, #0x4]
    bne .L_0214ee9c
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_0214eeac
.L_0214ee9c:
    ldr r2, [r0, #0x0]
    ldr r1, [r5, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_0214eeac:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov000_0214edac
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214eecc: .word 0x31305053
    arm_func_end func_ov000_0214eddc

    .global func_ov000_0214eed0
    arm_func_start func_ov000_0214eed0
func_ov000_0214eed0: ; 0x0214eed0
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
    arm_func_end func_ov000_0214eed0

    .global func_ov000_0214eef8
    arm_func_start func_ov000_0214eef8
func_ov000_0214eef8: ; 0x0214eef8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r4, r2
    mov r6, r3
    bl func_ov000_0214ed48
    mov r1, #0x0
    ldr r0, .L_0214efa8
    mov r2, r1
    blx func_ov012_021caa0c
    mov r5, r0
    ldr r0, [r5, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov000_0214ed84
    add r1, r4, #0x1
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x88]
    blx r2
    mov r0, r7, lsl #0xc
    str r0, [sp, #0x0]
    mov r0, r4
    add r1, sp, #0x0
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x84]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    bl func_ov000_0214edac
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0214efa8: .word data_ov000_02160ce8
    arm_func_end func_ov000_0214eef8

    .global func_ov000_0214efac
    arm_func_start func_ov000_0214efac
func_ov000_0214efac: ; 0x0214efac
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x240
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov000_0214f4c0
    mvn r0, #0x0
    strh r0, [r8, #0x1e]
    mov r2, #0x0
    strb r2, [r8, #0x1c]
    ldr r1, .L_0214f3b8
    b .L_0214f034
.L_0214efe0:
    add r0, r1, r2, lsl #0x3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsr #0xe
    and r0, r0, #0x3f
    cmp r7, r0
    bne .L_0214f030
    ldr r1, .L_0214f3bc
    strh r2, [r8, #0x1e]
    mov r4, #0x0
.L_0214f004:
    mov r2, r4, lsl #0x2
    ldrsh r3, [r8, #0x1e]
    ldrsh r0, [r1, r2]
    add r4, r4, #0x1
    cmp r3, r0
    addeq r0, r1, r2
    ldreqsh r0, [r0, #0x2]
    streqh r0, [r8, #0x1e]
    cmp r4, #0x2
    blt .L_0214f004
    b .L_0214f03c
.L_0214f030:
    add r2, r2, #0x1
.L_0214f034:
    cmp r2, #0x4a
    blt .L_0214efe0
.L_0214f03c:
    ldrsh r1, [r8, #0x1e]
    mvn r0, #0x0
    cmp r1, r0
    moveq r0, #0x1
    streqb r0, [r8, #0x1c]
    ldrb r0, [r8, #0x1c]
    cmp r0, #0x0
    beq .L_0214f324
    ldr r1, .L_0214f3c0
    add r0, sp, #0x140
    bl func_02074000
    ldr r1, .L_0214f3c4
    add r0, sp, #0x140
    ldr r1, [r1, r7, lsl #0x2]
    bl func_020741bc
    add r0, sp, #0x40
    add r1, sp, #0x140
    bl func_02074000
    ldr r1, .L_0214f3c8
    add r0, sp, #0x40
    bl func_020741bc
    ldr r1, .L_0214f3cc
    add r0, sp, #0x140
    bl func_020741bc
    ldr r1, .L_0214f3cc
    add r0, sp, #0x40
    bl func_020741bc
    add r0, sp, #0x140
    mov r1, #0x0
    blx func_020101f4
    str r0, [r8, #0x8]
    add r0, sp, #0x40
    mov r1, #0x0
    blx func_020101f4
    str r0, [r8, #0x4]
    ldrb r0, [sp, #0x258]
    mov r4, r7, lsl #0x4
    cmp r0, #0x0
    beq .L_0214f108
    ldr r0, .L_0214f3d0
    mov r2, #0x83000
    add r1, r4, #0x204000
    str r2, [sp, #0x3c]
    mov ip, #0x0
    add r3, sp, #0x3c
    mov r2, r6
    add r0, r0, r7, lsl #0x4
    add r1, r1, #0x800000
    str ip, [sp, #0x0]
    bl func_ov000_0214eddc
    b .L_0214f130
.L_0214f108:
    mov r0, #0x83000
    mov r2, r6
    add r1, r4, #0x204000
    str r0, [sp, #0x38]
    mov r6, #0x0
    add r0, r1, #0x800000
    add r3, sp, #0x38
    add r1, r1, #0x800000
    str r6, [sp, #0x0]
    bl func_ov000_0214eddc
.L_0214f130:
    str r0, [r8, #0xc]
    ldr r0, [r8, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, [r8, #0xc]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0xc]
    mov r1, r5
    bl func_ov000_0214f3e0
    mov r0, #0x70000
    str r0, [sp, #0x30]
    mov r0, #0x80000
    str r0, [sp, #0x34]
    ldr r0, [r8, #0xc]
    add r1, sp, #0x34
    add r2, sp, #0x30
    bl func_ov000_0214f418
    ldrb r0, [sp, #0x25c]
    cmp r0, #0x0
    beq .L_0214f3b0
    ldrb r0, [sp, #0x258]
    cmp r0, #0x0
    mov r0, #0x82000
    beq .L_0214f20c
    str r0, [sp, #0x2c]
    bl func_0203b404
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r1, .L_0214f3d4
    ldr r2, [r0, #0x88]
    add r6, r4, #0x5000
    add r0, r4, r1
    add r3, sp, #0x2c
    add r1, r6, #0xa00000
    bl func_ov000_0214eddc
    str r0, [r8, #0x10]
    mov r0, #0x81000
    str r0, [sp, #0x28]
    bl func_0203b404
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0214f3d8
    add r1, r6, #0xa00000
    add r3, sp, #0x28
    add r0, r4, r0
    bl func_ov000_0214eddc
    b .L_0214f264
.L_0214f20c:
    str r0, [sp, #0x24]
    bl func_0203b404
    mov r1, #0x0
    str r1, [sp, #0x0]
    add r6, r4, #0x5000
    ldr r2, [r0, #0x88]
    add r0, r6, #0xa00000
    add r3, sp, #0x24
    mov r1, r0
    bl func_ov000_0214eddc
    str r0, [r8, #0x10]
    mov r0, #0x81000
    str r0, [sp, #0x20]
    bl func_0203b404
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0214f3dc
    add r1, r6, #0xa00000
    add r3, sp, #0x20
    add r0, r4, r0
    bl func_ov000_0214eddc
.L_0214f264:
    str r0, [r8, #0x14]
    ldr r0, [r8, #0x10]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, [r8, #0x14]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, [r8, #0x10]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x14]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r8, #0x10]
    mov r1, r5
    bl func_ov000_0214f3e0
    ldr r0, [r8, #0x14]
    mov r1, r5
    bl func_ov000_0214f3e0
    mov r0, #0x70000
    str r0, [sp, #0x18]
    mov r0, #0x80000
    str r0, [sp, #0x1c]
    ldr r0, [r8, #0x10]
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_ov000_0214f418
    mov r0, #0x70000
    str r0, [sp, #0x10]
    mov r0, #0x80000
    str r0, [sp, #0x14]
    ldr r0, [r8, #0x14]
    add r1, sp, #0x14
    add r2, sp, #0x10
    bl func_ov000_0214f418
    b .L_0214f3b0
.L_0214f324:
    mov r3, #0x0
    str r3, [sp, #0x0]
    ldrsh r1, [r8, #0x1e]
    mov r2, r6
    mov r0, #0x3
    bl func_02074580
    ldrb r1, [sp, #0x258]
    str r0, [r8, #0x0]
    bl func_0207506c
    ldr r0, [r8, #0x0]
    mov r1, #0x0
    bl func_ov000_0214f464
    ldr r1, [r8, #0x0]
    mov r0, #0x83000
    ldr r2, [r1, #0x8]
    add r1, sp, #0x4
    ldr r2, [r2, #0x4]
    str r0, [sp, #0x4]
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r0, [r8, #0x0]
    mov r1, r5
    ldr r0, [r0, #0x8]
    bl func_ov000_0214f3e0
    mov r0, #0x70000
    str r0, [sp, #0x8]
    mov r0, #0x80000
    str r0, [sp, #0xc]
    ldr r0, [r8, #0x0]
    add r1, sp, #0xc
    ldr r0, [r0, #0x8]
    add r2, sp, #0x8
    bl func_ov000_0214f418
.L_0214f3b0:
    add sp, sp, #0x240
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0214f3b8: .word data_020924b0
.L_0214f3bc: .word data_ov000_0215ff5c
.L_0214f3c0: .word data_ov000_02160cfc
.L_0214f3c4: .word data_0209e840
.L_0214f3c8: .word data_ov000_02160d04
.L_0214f3cc: .word data_ov000_02160d08
.L_0214f3d0: .word 0xa04001
.L_0214f3d4: .word 0xa05002
.L_0214f3d8: .word 0xa05003
.L_0214f3dc: .word 0xa05001
    arm_func_end func_ov000_0214efac

    .global func_ov000_0214f3e0
    arm_func_start func_ov000_0214f3e0
func_ov000_0214f3e0: ; 0x0214f3e0
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0214f404
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
.L_0214f404:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_0214f3e0

    .global func_ov000_0214f418
    arm_func_start func_ov000_0214f418
func_ov000_0214f418: ; 0x0214f418
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
    beq .L_0214f454
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0214f454:
    ldrb r0, [r4, #0x24]
    orr r0, r0, #0x31
    strb r0, [r4, #0x24]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214f418

    .global func_ov000_0214f464
    arm_func_start func_ov000_0214f464
func_ov000_0214f464: ; 0x0214f464
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    ldr r0, [r4, #0x8]
    beq .L_0214f49c
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
.L_0214f49c:
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214f464

    .global func_ov000_0214f4c0
    arm_func_start func_ov000_0214f4c0
func_ov000_0214f4c0: ; 0x0214f4c0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_0214f4e0
    bl func_0206ae98
    mov r0, #0x0
    str r0, [r4, #0x18]
.L_0214f4e0:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0214f504
    ldr r0, [r0, #0xc]
    bl func_0206c650
    ldr r0, [r4, #0x0]
    bl func_02074608
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_0214f504:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0214f524
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0214f524:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0214f544
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_0214f544:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214f564
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_0214f564:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214f584
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x10]
.L_0214f584:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214f4c0

    .global func_ov000_0214f5a8
    arm_func_start func_ov000_0214f5a8
func_ov000_0214f5a8: ; 0x0214f5a8
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldrb r0, [r5, #0x1c]
    mov r4, #0x0
    cmp r0, #0x0
    beq .L_0214f658
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_0214f614
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r5, #0xc]
    add r0, sp, #0x10
    bl func_ov000_0214f70c
    add r0, sp, #0x10
    ldr r0, [r0, #0x0]
    bl func_02019db8
    ldr r1, [r5, #0xc]
    add r0, sp, #0xc
    bl func_ov000_0214f70c
    add r0, sp, #0xc
    bl func_ov000_0214f724
    mov r4, r0
.L_0214f614:
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    beq .L_0214f634
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0214f634:
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    beq .L_0214f6b0
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0214f6b0
.L_0214f658:
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_0214f6b0
    mov r1, #0x1
    bl func_ov000_0214f464
    ldr r0, [r5, #0x0]
    mov r1, r4
    bl func_ov000_0214f768
    ldr r1, [r5, #0x0]
    add r0, sp, #0x4
    ldr r1, [r1, #0x8]
    bl func_ov000_0214f70c
    add r0, sp, #0x4
    ldr r0, [r0, #0x0]
    bl func_02019db8
    ldr r1, [r5, #0x0]
    add r0, sp, #0x8
    ldr r1, [r1, #0x8]
    bl func_ov000_0214f70c
    add r0, sp, #0x8
    bl func_ov000_0214f724
    mov r4, r0
.L_0214f6b0:
    cmp r4, #0x0
    beq .L_0214f700
    mov r0, #0x81
    str r0, [sp, #0x0]
    ldr r1, [r4, #0x4]
    mov r0, r4
    ldrh r2, [r1, #0x8]
    mov r1, #0x1
    mov r3, #0x9
    sub r2, r2, #0x1
    and r2, r2, #0xff
    bl func_0206ad90
    ldr r2, .L_0214f708
    str r0, [r5, #0x18]
    mov r1, #0x10
    strh r2, [r0, #0x16]
    strb r1, [r0, #0x18]
    strb r1, [r0, #0x11]
    sub r1, r1, #0x11
    strb r1, [r0, #0x19]
.L_0214f700:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_0214f708: .word 0xffff
    arm_func_end func_ov000_0214f5a8

    .global func_ov000_0214f70c
    arm_func_start func_ov000_0214f70c
func_ov000_0214f70c: ; 0x0214f70c
    ldr r1, [r1, #0x4]
    ldr ip, .L_0214f720
    ldr r1, [r1, #0x64]
    add r1, r1, #0x14
    bx ip
.L_0214f720: .word func_020193f0
    arm_func_end func_ov000_0214f70c

    .global func_ov000_0214f724
    arm_func_start func_ov000_0214f724
func_ov000_0214f724: ; 0x0214f724
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x0]
    ldr r4, [r0, #0x18]
    cmp r4, #0x0
    bne .L_0214f744
    ldr r0, [r0, #0xc]
    bl func_02036430
    mov r4, r0
.L_0214f744:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0214f760
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0214f760:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214f724

    .global func_ov000_0214f768
    arm_func_start func_ov000_0214f768
func_ov000_0214f768: ; 0x0214f768
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
    arm_func_end func_ov000_0214f768

    .global func_ov000_0214f7a4
    arm_func_start func_ov000_0214f7a4
func_ov000_0214f7a4: ; 0x0214f7a4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0214f81c
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214f7d8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214f7d8:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214f7f8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214f7f8:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldmia sp!, {r4, pc}
.L_0214f81c:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x19
    bl func_ov000_0214f768
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214f7a4

    .global func_ov000_0214f834
    arm_func_start func_ov000_0214f834
func_ov000_0214f834: ; 0x0214f834
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0214f8ac
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214f868
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
.L_0214f868:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214f888
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
.L_0214f888:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldmia sp!, {r4, pc}
.L_0214f8ac:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0xc]
    bl func_0206c650
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214f834

    .global func_ov000_0214f8e0
    arm_func_start func_ov000_0214f8e0
func_ov000_0214f8e0: ; 0x0214f8e0
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldrb r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0214fa00
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214f950
    mov r1, #0x0
    bl func_ov000_0214fa08
    cmp r0, #0x0
    beq .L_0214f950
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xc]
    add r1, sp, #0x8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214f950:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214f9a8
    mov r1, #0x0
    bl func_ov000_0214fa08
    cmp r0, #0x0
    beq .L_0214f9a8
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x10]
    add r1, sp, #0x4
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214f9a8:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_0214fa00
    mov r1, #0x0
    bl func_ov000_0214fa08
    cmp r0, #0x0
    beq .L_0214fa00
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x14]
    add r1, sp, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_0214fa00:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
    arm_func_end func_ov000_0214f8e0

    .global func_ov000_0214fa08
    arm_func_start func_ov000_0214fa08
func_ov000_0214fa08: ; 0x0214fa08
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
    arm_func_end func_ov000_0214fa08

    .global func_ov000_0214fa3c
    arm_func_start func_ov000_0214fa3c
func_ov000_0214fa3c: ; 0x0214fa3c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_0214fa8c
    mov r1, #0x8
    bl func_0206aeec
    ldr r2, [r4, #0x18]
    ldr r1, .L_0214fad8
    mov r0, #0x10
    strh r1, [r2, #0x16]
    strb r0, [r2, #0x18]
    mov r0, #0x1
    strb r0, [r2, #0x19]
    ldr r5, [r4, #0x18]
    mov r0, r5
    bl func_0206af1c
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
.L_0214fa8c:
    mov r0, r4
    bl func_ov000_0214f834
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214fab4
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0214fab4:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_0214fad8: .word 0xffff
    arm_func_end func_ov000_0214fa3c

    .global func_ov000_0214fadc
    arm_func_start func_ov000_0214fadc
func_ov000_0214fadc: ; 0x0214fadc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0214fb54
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0214fb10
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0214fb10:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0214fb30
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0214fb30:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r4, pc}
.L_0214fb54:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    bl func_ov000_0214f464
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0214fadc

    .global func_ov000_0214fb6c
    arm_func_start func_ov000_0214fb6c
func_ov000_0214fb6c: ; 0x0214fb6c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xf8
    ldr r1, .L_02150a78
    ldr r2, .L_02150a7c
    mov r0, #0x84
    mov r3, #0x79
    bl func_0201a21c
    mov r7, r0
    mov r1, #0x0
    mov r2, #0x84
    bl func_020517fc
    bl func_02026f94
    str r0, [r7, #0x4]
    mov r1, #0x80000
    str r1, [sp, #0xac]
    ldr r0, [r0, #0x4]
    add r1, sp, #0xac
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, .L_02150a80
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x4]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_020310f4
    ldr r2, .L_02150a84
    str r0, [r7, #0x0]
    ldr r1, .L_02150a88
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_02150a8c
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x8c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8c
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
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x90]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x90
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8
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
    mov r1, #0x10000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x94]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x94
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
    mov r1, #0xc000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x98]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x98
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
    mov r1, #0x20
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
    mov r0, #0x1000
    str r0, [sp, #0x9c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x9c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
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
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0xa0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xa0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
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
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x10000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0xa4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xa4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
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
    mov r1, #0xc000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0xa8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xa8
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
    ldr r0, .L_02150a90
    mov r1, #0x0
    blx func_020101f4
    str r0, [r7, #0x28]
    ldr r0, .L_02150a94
    mov r1, #0x0
    blx func_020101f4
    str r0, [r7, #0x2c]
    ldr r0, .L_02150a98
    mov r1, #0x0
    blx func_020101f4
    str r0, [r7, #0x30]
    ldr r0, .L_02150a9c
    mov r1, #0x0
    blx func_020101f4
    str r0, [r7, #0x34]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150aa0
    ldr r1, .L_02150aa4
    bl func_ov000_021511a0
    str r0, [r7, #0x8]
    mov r0, #0x3
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150aa8
    ldr r1, .L_02150aac
    bl func_ov000_021511a0
    str r0, [r7, #0xc]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150ab0
    ldr r1, .L_02150ab4
    bl func_ov000_021511a0
    str r0, [r7, #0x10]
    mov r0, #0x3
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150ab8
    ldr r1, .L_02150abc
    bl func_ov000_021511a0
    str r0, [r7, #0x14]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150ab0
    ldr r1, .L_02150ab4
    bl func_ov000_021511a0
    str r0, [r7, #0x18]
    mov r0, #0x3
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150ab8
    ldr r1, .L_02150abc
    bl func_ov000_021511a0
    str r0, [r7, #0x1c]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150aa0
    ldr r1, .L_02150aa4
    bl func_ov000_021511a0
    str r0, [r7, #0x20]
    mov r0, #0x3
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150aa8
    ldr r1, .L_02150aac
    bl func_ov000_021511a0
    str r0, [r7, #0x24]
    ldr r0, [r7, #0x8]
    ldr r1, .L_02150ac0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0xc]
    ldr r1, .L_02150ac4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x10]
    ldr r1, .L_02150ac0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x14]
    ldr r1, .L_02150ac4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x18]
    ldr r1, .L_02150ac0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x1c]
    ldr r1, .L_02150ac4
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x20]
    ldr r1, .L_02150ac0
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r7, #0x24]
    ldr r1, .L_02150ac4
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [sp, #0x20]
    ldr r0, [r7, #0x8]
    add r1, sp, #0x20
    bl func_ov000_02150f98
    mov r0, #0x100000
    str r0, [sp, #0x1c]
    ldr r0, [r7, #0xc]
    add r1, sp, #0x1c
    bl func_ov000_02150f98
    mov r0, #0x100000
    str r0, [sp, #0x18]
    ldr r0, [r7, #0x10]
    add r1, sp, #0x18
    bl func_ov000_02150f98
    mov r0, #0x200000
    str r0, [sp, #0x14]
    ldr r0, [r7, #0x14]
    add r1, sp, #0x14
    bl func_ov000_02150f98
    mov r0, #0x0
    str r0, [sp, #0x10]
    ldr r0, [r7, #0x18]
    add r1, sp, #0x10
    bl func_ov000_02150f98
    mov r0, #0x100000
    str r0, [sp, #0xc]
    ldr r0, [r7, #0x1c]
    add r1, sp, #0xc
    bl func_ov000_02150f98
    mov r0, #0x100000
    str r0, [sp, #0x8]
    ldr r0, [r7, #0x20]
    add r1, sp, #0x8
    bl func_ov000_02150f98
    mov r0, #0x200000
    str r0, [sp, #0x4]
    ldr r0, [r7, #0x24]
    add r1, sp, #0x4
    bl func_ov000_02150f98
    ldr r0, [r7, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0xc]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x1c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x8]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150ac8
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x54]
    ldr r0, [r7, #0xc]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150acc
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x58]
    ldr r0, [r7, #0x10]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150acc
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x5c]
    ldr r0, [r7, #0x14]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150ac8
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x60]
    ldr r0, [r7, #0x18]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150acc
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x64]
    ldr r0, [r7, #0x1c]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150ac8
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x68]
    ldr r0, [r7, #0x20]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150ac8
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x6c]
    ldr r0, [r7, #0x24]
    mov r1, #0x0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02150acc
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x70]
    mov r0, #0x0
    str r0, [sp, #0x6c]
    mov r0, #0x48000
    str r0, [sp, #0x70]
    mov r0, #0x80000
    str r0, [sp, #0x74]
    add r0, sp, #0xe0
    add r1, sp, #0x74
    add r2, sp, #0x70
    add r3, sp, #0x6c
    bl func_ov000_02151038
    bl func_0203b3e4
    ldr r2, [r0, #0x88]
    mov r0, #0x710000
    mov r1, r0
    add r3, sp, #0xe0
    bl func_ov000_02151238
    str r0, [r7, #0x38]
    mov r0, #0x0
    str r0, [sp, #0x60]
    mov r0, #0xa8000
    str r0, [sp, #0x64]
    mov r0, #0x80000
    str r0, [sp, #0x68]
    add r0, sp, #0xd4
    add r1, sp, #0x68
    add r2, sp, #0x64
    add r3, sp, #0x60
    bl func_ov000_02151038
    bl func_0203b3e4
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150ad0
    mov r1, #0x710000
    add r3, sp, #0xd4
    bl func_ov000_02151238
    str r0, [r7, #0x3c]
    mov r6, #0x0
    mov r5, #0x60000
    mov r4, #0x80000
    add r0, sp, #0xc8
    add r1, sp, #0x5c
    add r2, sp, #0x58
    add r3, sp, #0x54
    str r6, [sp, #0x54]
    str r5, [sp, #0x58]
    str r4, [sp, #0x5c]
    bl func_ov000_02151038
    bl func_0203b3f4
    mov r1, r0
    mov r0, #0x700000
    ldr r2, [r1, #0x88]
    add r3, sp, #0xc8
    mov r1, r0
    bl func_ov000_02151238
    str r0, [r7, #0x40]
    mov r0, r6
    str r0, [sp, #0x48]
    mov r0, #0x48000
    str r0, [sp, #0x4c]
    mov r0, r4
    str r0, [sp, #0x50]
    add r0, sp, #0xbc
    add r1, sp, #0x50
    add r2, sp, #0x4c
    add r3, sp, #0x48
    bl func_ov000_02151038
    bl func_0203b404
    ldr r2, [r0, #0x88]
    mov r0, #0x720000
    mov r1, r0
    add r3, sp, #0xbc
    bl func_ov000_02151238
    str r0, [r7, #0x44]
    mov r0, r6
    str r0, [sp, #0x3c]
    mov r0, #0x48000
    str r0, [sp, #0x40]
    mov r0, r4
    str r0, [sp, #0x44]
    add r0, sp, #0xb0
    add r1, sp, #0x44
    add r2, sp, #0x40
    add r3, sp, #0x3c
    bl func_ov000_02151038
    bl func_0203b404
    ldr r2, [r0, #0x88]
    ldr r0, .L_02150ad4
    mov r1, #0x720000
    add r3, sp, #0xb0
    bl func_ov000_02151238
    str r0, [r7, #0x48]
    ldr r0, [r7, #0x40]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldr r0, .L_02150ad8
    add r1, sp, #0x38
    str r0, [sp, #0x38]
    ldr r0, [r7, #0x44]
    bl func_ov000_02151054
    ldr r0, .L_02150adc
    add r1, sp, #0x34
    str r0, [sp, #0x34]
    ldr r0, [r7, #0x48]
    bl func_ov000_02151054
    mov r0, r6
    str r0, [sp, #0x30]
    ldr r0, [r7, #0x44]
    add r1, sp, #0x30
    bl func_ov000_02151078
    mov r0, r6
    str r0, [sp, #0x2c]
    ldr r0, [r7, #0x48]
    add r1, sp, #0x2c
    bl func_ov000_02151078
    ldr r0, [r7, #0x44]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r7, #0x48]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_02150ae0
    add r1, sp, #0x28
    str r0, [sp, #0x28]
    ldr r0, [r7, #0x44]
    bl func_ov000_02151078
    ldr r0, .L_02150ae0
    add r1, sp, #0x24
    str r0, [sp, #0x24]
    ldr r0, [r7, #0x48]
    bl func_ov000_02151078
    ldr r0, [r7, #0x40]
    bl func_ov000_02151094
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x11
    mov r2, #0xf
    mov r3, #0x5
    bl func_0206ad90
    mov r1, r6
    strh r1, [r0, #0x18]
    ldr r2, .L_02150ae4
    mov r1, #0x1e
    strh r2, [r0, #0x16]
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    str r0, [r7, #0x50]
    ldr r0, [r7, #0x44]
    bl func_ov000_02151094
    ldr r1, .L_02150ae8
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x74]
    ldr r4, .L_02150aec
    mvn r5, #0x0
    ldr r1, .L_02150af0
    ldr r2, .L_02150af4
    ldr r3, .L_02150af8
    mov r0, #0x14c
    str r5, [r4, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021507cc
    mov r1, r6
    ldr r3, .L_02150afc
    sub r2, r1, #0x1
    blx func_ov012_021b7950
.L_021507cc:
    bl func_ov000_0214ed84
    mov r5, r0
    movs r1, #0x0
    bne .L_021507e8
    ldr r0, [r5, #0x4]
    blx func_ov012_021b5898
    b .L_021507f8
.L_021507e8:
    mov r1, #0x4
    ldr r0, [r5, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_021507f8:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_02150aec
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov000_02151110
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mvn r0, #0x57
    strh r0, [sp, #0x84]
    add r0, r0, #0x40
    strh r0, [sp, #0x86]
    mov r0, #0x58
    strh r0, [sp, #0x88]
    mov r0, #0x18
    strh r0, [sp, #0x8a]
    ldr r1, .L_02150b00
    ldr r2, .L_02150b04
    ldr r3, .L_02150b08
    mov r0, #0x70
    add r8, sp, #0x84
    bl func_0201a21c
    movs r6, r0
    beq .L_021508a8
    ldr r2, .L_02150b0c
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_02150b10
    mov r1, r8
    add r0, r6, #0x68
    str r2, [r6, #0x0]
    bl func_ov000_0215115c
    ldr r0, .L_02150b14
    str r0, [r6, #0x0]
.L_021508a8:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_021508c4
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021508c4:
    ldr r1, [r6, #0x18]
    mov r0, r4
    bl func_02020e98
    mov lr, #0x0
    mov ip, #0x60000
    mov r6, #0x80000
    add r0, sp, #0xec
    add r1, sp, #0x80
    add r2, sp, #0x7c
    add r3, sp, #0x78
    str lr, [sp, #0x78]
    str ip, [sp, #0x7c]
    str r6, [sp, #0x80]
    bl func_ov000_02151038
    add r1, sp, #0xec
    mov r0, r4
    bl func_ov000_02151170
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x8000
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    ldr r2, .L_02150b18
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_02150aec
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov000_02151110
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x10
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    ldr r2, .L_02150b18
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_02150aec
    mov r0, r5
    ldr r1, [r1, #0x0]
    bl func_ov000_02151110
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    ldr r2, .L_02150b1c
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, .L_02150aec
    str r5, [r7, #0x4c]
    mov r0, #0x0
    str r0, [r1, #0x0]
    bl func_020734e0
    mov r0, #0x0
    mov r1, r0
    bl func_0207361c
    bl func_02054b44
    str r0, [r7, #0x78]
    str r1, [r7, #0x7c]
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r2, [r0, #0x4]
    mov r0, #0x3e
    str r1, [r2, #0x8e8]
    str r0, [r2, #0x8ec]
    str r1, [r2, #0x8f0]
    strb r1, [r2, #0x902]
    blx func_ov012_021b65bc
    ldr r0, [r7, #0x0]
    add sp, sp, #0xf8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02150a78: .word data_ov000_02160e1c
.L_02150a7c: .word data_ov000_02160d30
.L_02150a80: .word func_ov000_02150b20
.L_02150a84: .word data_02093c04
.L_02150a88: .word data_020a0e80
.L_02150a8c: .word data_020a16c0
.L_02150a90: .word data_ov000_02160e28
.L_02150a94: .word data_ov000_02160e38
.L_02150a98: .word data_ov000_02160e4c
.L_02150a9c: .word data_ov000_02160e5c
.L_02150aa0: .word data_ov000_02160e74
.L_02150aa4: .word data_ov000_02160e8c
.L_02150aa8: .word data_ov000_02160ea4
.L_02150aac: .word data_ov000_02160ebc
.L_02150ab0: .word data_ov000_02160ed4
.L_02150ab4: .word data_ov000_02160eec
.L_02150ab8: .word data_ov000_02160f04
.L_02150abc: .word data_ov000_02160f1c
.L_02150ac0: .word func_ov000_021512e8
.L_02150ac4: .word func_ov000_021513b0
.L_02150ac8: .word data_ov000_02160f34
.L_02150acc: .word data_ov000_02160f4c
.L_02150ad0: .word 0x710002
.L_02150ad4: .word 0x720001
.L_02150ad8: .word 0xe66
.L_02150adc: .word 0xccc
.L_02150ae0: .word 0x1333
.L_02150ae4: .word 0x8df
.L_02150ae8: .word data_ov000_02160f64
.L_02150aec: .word data_ov012_021d5154
.L_02150af0: .word data_ov000_02160d80
.L_02150af4: .word data_ov000_02160d18
.L_02150af8: .word 0x2a6
.L_02150afc: .word func_ov000_021510bc
.L_02150b00: .word data_ov000_02160d5c
.L_02150b04: .word data_ov000_02160d10
.L_02150b08: .word 0x1b2
.L_02150b0c: .word data_02093c8c
.L_02150b10: .word data_ov000_02160db0
.L_02150b14: .word data_ov012_021d1c58
.L_02150b18: .word func_ov000_02151470
.L_02150b1c: .word func_ov000_0215149c
    arm_func_end func_ov000_0214fb6c

    .global func_ov000_02150b20
    arm_func_start func_ov000_02150b20
func_ov000_02150b20: ; 0x02150b20
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    mov r0, #0x0
    strh r0, [r4, #0x80]
    ldr r0, [r5, #0x4]
    ldr r1, .L_02150b70
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02150b70: .word func_ov000_02150b74
    arm_func_end func_ov000_02150b20

    .global func_ov000_02150b74
    arm_func_start func_ov000_02150b74
func_ov000_02150b74: ; 0x02150b74
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02150c9c
    ldr r0, [r4, #0x38]
    ldr r1, .L_02150ca4
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x44]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [r4, #0x44]
    ldr r2, .L_02150ca8
    add r0, sp, #0x10
    bl func_ov000_02150d54
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r1, .L_02150cac
    ldr r2, .L_02150cb0
    add r0, sp, #0x10
    mov r3, #0x4
    bl func_ov000_02150cb8
    mov r1, r0
    ldr r0, [r4, #0x44]
    bl func_02020f38
    ldr r1, [r4, #0x48]
    ldr r2, .L_02150ca8
    add r0, sp, #0x8
    bl func_ov000_02150d54
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r1, .L_02150cac
    ldr r2, .L_02150cb0
    add r0, sp, #0x8
    mov r3, #0x4
    bl func_ov000_02150cb8
    mov r1, r0
    ldr r0, [r4, #0x48]
    bl func_02020f38
    ldr r0, [r5, #0x4]
    ldr r1, .L_02150cb4
    bl func_02028384
.L_02150c9c:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_02150ca4: .word 0x710001
.L_02150ca8: .word data_ov000_02160f7c
.L_02150cac: .word 0x494c
.L_02150cb0: .word data_02093c98
.L_02150cb4: .word func_ov000_02150da4
    arm_func_end func_ov000_02150b74

    .global func_ov000_02150cb8
    arm_func_start func_ov000_02150cb8
func_ov000_02150cb8: ; 0x02150cb8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r9, r1
    mov r8, r2
    mov r7, r3
    ldr r1, .L_02150d48
    ldr r2, .L_02150d4c
    ldr r3, .L_02150d50
    ldr r4, [r0, #0x4]
    ldr r5, [r0, #0x0]
    mov r0, #0x4c
    bl func_0201a21c
    movs r6, r0
    beq .L_02150d20
    str r9, [sp, #0x0]
    str r8, [sp, #0x4]
    ldrb r1, [sp, #0x30]
    str r7, [sp, #0x8]
    ldrb ip, [sp, #0x34]
    str r1, [sp, #0xc]
    mov r2, r5
    mov r3, r4
    mov r1, #0x0
    str ip, [sp, #0x10]
    bl func_02013b14
    mov r6, r0
.L_02150d20:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02150d3c
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02150d3c:
    ldr r0, [r6, #0x18]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02150d48: .word data_ov000_02160d6c
.L_02150d4c: .word data_ov000_02160d20
.L_02150d50: .word 0x2ef
    arm_func_end func_ov000_02150cb8

    .global func_ov000_02150d54
    arm_func_start func_ov000_02150d54
func_ov000_02150d54: ; 0x02150d54
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
    arm_func_end func_ov000_02150d54

    .global func_ov000_02150da4
    arm_func_start func_ov000_02150da4
func_ov000_02150da4: ; 0x02150da4
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02054b44
    ldr r3, [r4, #0x78]
    ldr r2, [r4, #0x7c]
    subs r3, r0, r3
    sbc r1, r1, r2
    ldr r0, .L_02150de8
    cmp r1, #0x0
    cmpeq r3, r0
    ldmlsia sp!, {r4, pc}
    mov r1, #0x1
    mov r0, r4
    strb r1, [r4, #0x82]
    bl func_ov000_02150f48
    ldmia sp!, {r4, pc}
.L_02150de8: .word 0x297ffa5
    arm_func_end func_ov000_02150da4

    .global func_ov000_02150dec
    arm_func_start func_ov000_02150dec
func_ov000_02150dec: ; 0x02150dec
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020735e4
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_02150e20
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02150e20:
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_02150e30
    bl func_0206ae98
.L_02150e30:
    mov r5, #0x0
.L_02150e34:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    beq .L_02150e48
    bl func_0206b138
.L_02150e48:
    add r5, r5, #0x1
    cmp r5, #0x9
    blt .L_02150e34
    mov r5, #0x0
.L_02150e58:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_02150e74
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02150e74:
    add r5, r5, #0x1
    cmp r5, #0x8
    blt .L_02150e58
    mov r5, #0x0
.L_02150e84:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_02150ea0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02150ea0:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_02150e84
    mov r5, #0x0
.L_02150eb0:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02150ecc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02150ecc:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_02150eb0
    blx func_ov012_021b65cc
    ldr r1, .L_02150f38
    ldr r2, .L_02150f3c
    ldr r3, [r1, #0x0]
    ldr r0, .L_02150f40
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldrb r1, [r4, #0x82]
    ldr r0, .L_02150f44
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
    ldmia sp!, {r3, r4, r5, pc}
.L_02150f38: .word data_02093c04
.L_02150f3c: .word data_020a16c0
.L_02150f40: .word data_020a0e80
.L_02150f44: .word data_020afcb0
    arm_func_end func_ov000_02150dec

    .global func_ov000_02150f48
    arm_func_start func_ov000_02150f48
func_ov000_02150f48: ; 0x02150f48
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b65bc
    ldrb r0, [r4, #0x82]
    cmp r0, #0x1
    bne .L_02150f68
    mov r0, #0x8
    bl func_0207367c
.L_02150f68:
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x4]
    ldr r1, .L_02150f94
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02150f94: .word func_ov000_02150dec
    arm_func_end func_ov000_02150f48

    .global func_ov000_02150f98
    arm_func_start func_ov000_02150f98
func_ov000_02150f98: ; 0x02150f98
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_02150fb4
    mov r1, #0x1
    str r2, [r0, #0x10]
    bx ip
.L_02150fb4: .word func_ov000_02150fb8
    arm_func_end func_ov000_02150f98

    .global func_ov000_02150fb8
    arm_func_start func_ov000_02150fb8
func_ov000_02150fb8: ; 0x02150fb8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r2, [r5, #0x24]
    mov r4, r1
    orr r1, r2, r4
    cmp r2, r1
    beq .L_02150fe0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_02150fe0:
    ldrb r0, [r5, #0x24]
    orr r0, r0, r4
    orr r0, r0, #0x30
    strb r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_02150fb8

    .global func_ov000_02150ff4
    arm_func_start func_ov000_02150ff4
func_ov000_02150ff4: ; 0x02150ff4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02151014
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02151014:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02150ff4

    .global func_ov000_0215101c
    arm_func_start func_ov000_0215101c
func_ov000_0215101c: ; 0x0215101c
    ldr r0, [r0, #0x4]
    ldr ip, .L_02151034
    ldr r0, [r0, #0x64]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x20]
    bx ip
.L_02151034: .word func_ov000_0214d908
    arm_func_end func_ov000_0215101c

    .global func_ov000_02151038
    arm_func_start func_ov000_02151038
func_ov000_02151038: ; 0x02151038
    ldr r1, [r1, #0x0]
    str r1, [r0, #0x0]
    ldr r1, [r2, #0x0]
    str r1, [r0, #0x4]
    ldr r1, [r3, #0x0]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov000_02151038

    .global func_ov000_02151054
    arm_func_start func_ov000_02151054
func_ov000_02151054: ; 0x02151054
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xf8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02151054

    .global func_ov000_02151078
    arm_func_start func_ov000_02151078
func_ov000_02151078: ; 0x02151078
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020235dc
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02151078

    .global func_ov000_02151094
    arm_func_start func_ov000_02151094
func_ov000_02151094: ; 0x02151094
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x64]
    ldr r0, [r1, #0x2c]
    cmp r0, #0x0
    bne .L_021510b4
    ldr r0, [r1, #0x20]
    bl func_02036430
.L_021510b4:
    bl func_ov000_02150ff4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02151094

    .global func_ov000_021510bc
    arm_func_start func_ov000_021510bc
func_ov000_021510bc: ; 0x021510bc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x44
    ldr r1, .L_02151104
    ldr r2, .L_02151108
    add r3, r0, #0xc1
    bl func_0201a21c
    movs r4, r0
    beq .L_021510fc
    mov r1, r5
    mov r2, #0x0
    bl func_02014604
    ldr r1, .L_0215110c
    mov r0, #0x1
    str r1, [r4, #0x0]
    strb r0, [r4, #0x40]
.L_021510fc:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02151104: .word data_ov000_02160d94
.L_02151108: .word data_ov000_02160d4c
.L_0215110c: .word data_ov012_021d2a24
    arm_func_end func_ov000_021510bc

    .global func_ov000_02151110
    arm_func_start func_ov000_02151110
func_ov000_02151110: ; 0x02151110
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r4, [r0, #0x4]
    ldr r1, .L_02151150
    ldr r2, .L_02151154
    mov r0, #0x134
    mov r3, #0x3e
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02151148
    ldr r3, .L_02151158
    mov r1, r4
    mov r2, r5
    blx func_ov012_021af0f8
.L_02151148:
    bl func_ov000_0214ed84
    ldmia sp!, {r3, r4, r5, pc}
.L_02151150: .word data_ov000_02160d3c
.L_02151154: .word data_ov000_02160d28
.L_02151158: .word func_ov000_021510bc
    arm_func_end func_ov000_02151110

    .global func_ov000_0215115c
    arm_func_start func_ov000_0215115c
func_ov000_0215115c: ; 0x0215115c
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov000_0215115c

    .global func_ov000_02151170
    arm_func_start func_ov000_02151170
func_ov000_02151170: ; 0x02151170
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0215119c
    str r2, [r0, #0xc]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x10]
    ldr r2, [r1, #0x8]
    mov r1, #0x1
    str r2, [r0, #0x14]
    bx ip
.L_0215119c: .word func_ov000_02150fb8
    arm_func_end func_ov000_02151170

    .global func_ov000_021511a0
    arm_func_start func_ov000_021511a0
func_ov000_021511a0: ; 0x021511a0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r1
    mov r0, r2
    bl func_ov000_0214ed48
    mov r0, r4
    bl func_02035c90
    bl func_ov000_0214d908
    mov r4, r0
    bl func_02036ab8
    bl func_ov000_0214ed84
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_0215120c
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_02151224
.L_0215120c:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_02151224:
    mov r0, r4
    bl func_02034d7c
    bl func_ov000_0214edac
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_021511a0

    .global func_ov000_02151238
    arm_func_start func_ov000_02151238
func_ov000_02151238: ; 0x02151238
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r4, r1
    mov r0, r2
    mov r5, r3
    bl func_ov000_0214ed48
    mov r0, r4
    bl func_020329ec
    bl func_ov000_0214ed84
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
    ldr r3, .L_021512e4
    ldr r2, [r4, #0x4]
    mov r1, r5
    mov r0, r4
    str r3, [r2, #0x54]
    bl func_ov000_02151170
    ldr r1, [r4, #0x4]
    mov r0, #0x60000
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
    bl func_ov000_0214edac
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021512e4: .word 0x31305053
    arm_func_end func_ov000_02151238

    .global func_ov000_021512e8
    arm_func_start func_ov000_021512e8
func_ov000_021512e8: ; 0x021512e8
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, sp, #0x10
    mov r1, r4
    bl func_ov000_0214e290
    ldr r0, [sp, #0x10]
    add r1, sp, #0x14
    sub r2, r0, #0x800
    mov r0, r4
    str r2, [sp, #0x14]
    bl func_ov000_02150f98
    add r0, sp, #0xc
    mov r1, r4
    bl func_ov000_0214e290
    mov r0, #0x100000
    ldr r1, [sp, #0xc]
    rsb r0, r0, #0x0
    cmp r1, r0
    bgt .L_0215137c
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, sp, #0x4
    mov r1, r4
    bl func_ov000_0214e290
    add r0, sp, #0x4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x8
    add r2, r2, #0x100000
    add r2, r2, #0x100000
    mov r0, r4
    str r2, [sp, #0x8]
    bl func_ov000_02150f98
    b .L_021513a8
.L_0215137c:
    add r0, sp, #0x0
    mov r1, r4
    bl func_ov000_0214e290
    ldr r0, [sp, #0x0]
    cmp r0, #0x0
    bgt .L_021513a8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_021513a8:
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021512e8

    .global func_ov000_021513b0
    arm_func_start func_ov000_021513b0
func_ov000_021513b0: ; 0x021513b0
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, sp, #0x10
    mov r1, r4
    bl func_ov000_0214e290
    ldr r0, [sp, #0x10]
    add r1, sp, #0x14
    sub r2, r0, #0x800
    mov r0, r4
    str r2, [sp, #0x14]
    bl func_ov000_02150f98
    add r0, sp, #0xc
    mov r1, r4
    bl func_ov000_0214e290
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bgt .L_0215143c
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, sp, #0x4
    mov r1, r4
    bl func_ov000_0214e290
    add r0, sp, #0x4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x8
    add r2, r2, #0x100000
    add r2, r2, #0x100000
    mov r0, r4
    str r2, [sp, #0x8]
    bl func_ov000_02150f98
    b .L_02151468
.L_0215143c:
    add r0, sp, #0x0
    mov r1, r4
    bl func_ov000_0214e290
    ldr r0, [sp, #0x0]
    cmp r0, #0xc0000
    bgt .L_02151468
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_02151468:
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021513b0

    .global func_ov000_02151470
    arm_func_start func_ov000_02151470
func_ov000_02151470: ; 0x02151470
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    mov r1, #0x0
    mov r0, r4
    strb r1, [r4, #0x82]
    bl func_ov000_02150f48
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02151470

    .global func_ov000_0215149c
    arm_func_start func_ov000_0215149c
func_ov000_0215149c: ; 0x0215149c
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x1
    bl func_0207342c
    mov r1, #0x1
    mov r0, r4
    strb r1, [r4, #0x82]
    bl func_ov000_02150f48
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215149c

    .global func_ov000_021514c8
    arm_func_start func_ov000_021514c8
func_ov000_021514c8: ; 0x021514c8
    ldrh r1, [r0, #0x4]
    add r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    bx lr
    arm_func_end func_ov000_021514c8

    .global func_ov000_021514dc
    arm_func_start func_ov000_021514dc
func_ov000_021514dc: ; 0x021514dc
    str r1, [r0, #0x30]
    bx lr
    arm_func_end func_ov000_021514dc

    .global func_ov000_021514e4
    arm_func_start func_ov000_021514e4
func_ov000_021514e4: ; 0x021514e4
    mov r0, #0x0
    bx lr
    arm_func_end func_ov000_021514e4

    .global func_ov000_021514ec
    arm_func_start func_ov000_021514ec
func_ov000_021514ec: ; 0x021514ec
    mov r0, #0x0
    bx lr
    arm_func_end func_ov000_021514ec

    .global func_ov000_021514f4
    arm_func_start func_ov000_021514f4
func_ov000_021514f4: ; 0x021514f4
    mov r0, #0x0
    bx lr
    arm_func_end func_ov000_021514f4

    .global func_ov000_021514fc
    arm_func_start func_ov000_021514fc
func_ov000_021514fc: ; 0x021514fc
    ldr r2, [r0, #0x1c]
    cmp r2, r1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov000_021514fc

    .global func_ov000_0215150c
    arm_func_start func_ov000_0215150c
func_ov000_0215150c: ; 0x0215150c
    str r1, [r0, #0x1c]
    bx lr
    arm_func_end func_ov000_0215150c

    .global func_ov000_02151514
    arm_func_start func_ov000_02151514
func_ov000_02151514: ; 0x02151514
    mov r0, #0x1
    bx lr
    arm_func_end func_ov000_02151514

    .global func_ov000_0215151c
    arm_func_start func_ov000_0215151c
func_ov000_0215151c: ; 0x0215151c
    ldr r0, .L_02151524
    bx lr
.L_02151524: .word data_02093c74
    arm_func_end func_ov000_0215151c

    .global func_ov000_02151528
    arm_func_start func_ov000_02151528
func_ov000_02151528: ; 0x02151528
    mov r0, #0x0
    bx lr
    arm_func_end func_ov000_02151528

    .global func_ov000_02151530
    arm_func_start func_ov000_02151530
func_ov000_02151530: ; 0x02151530
    ldr ip, .L_0215153c
    add r0, r0, #0x68
    bx ip
.L_0215153c: .word func_ov000_0215115c
    arm_func_end func_ov000_02151530

    .global func_ov000_02151540
    arm_func_start func_ov000_02151540
func_ov000_02151540: ; 0x02151540
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02151540

    .global func_ov000_02151554
    arm_func_start func_ov000_02151554
func_ov000_02151554: ; 0x02151554
    stmdb sp!, {r4, lr}
    mov r4, r0
    blx func_ov012_021b0644
    mov r0, r4
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02151554

    .global func_ov000_02151570
    arm_func_start func_ov000_02151570
func_ov000_02151570: ; 0x02151570
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr r1, .L_02151770
    ldr r0, .L_02151774
    ldr r2, .L_02151778
    mov r3, #0x47
    bl func_0201a21c
    movs r4, r0
    moveq r0, #0x0
    beq .L_02151768
    ldr r2, .L_02151774
    mov r1, #0x0
    bl func_020517fc
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
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x0]
    ldr r1, .L_0215177c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    mov r0, #0x0
    bl func_020208ec
    str r0, [r4, #0x4]
    ldr r1, .L_02151780
    ldr r0, .L_02151784
    str r1, [r4, #0x8]
    mov r1, #0x0
    mov r2, r1
    bl func_ov000_0215178c
    str r0, [r4, #0x10]
    mov r1, #0x0
    ldr r0, .L_02151788
    mov r2, r1
    bl func_ov000_0215178c
    str r0, [r4, #0x14]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r4, #0x18]
    add r0, r0, #0x14
    str r0, [r4, #0x28]
    ldr r1, [r4, #0x18]
    mov r0, #0x18
    ldr r1, [r1, #0x0]
    str r1, [r4, #0x2c]
    ldr r1, [r4, #0x18]
    ldr r2, [r4, #0x28]
    ldr r1, [r1, #0x0]
    add r1, r2, r1, lsl #0x2
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x18]
    ldr r1, [r1, #0x8]
    str r1, [r4, #0x24]
    ldr r1, [r4, #0x18]
    ldr r1, [r1, #0x10]
    str r1, [r4, #0x30]
    ldr r1, [r4, #0x18]
    ldr r2, [r4, #0x20]
    ldr r1, [r1, #0x8]
    mla r0, r1, r0, r2
    str r0, [r4, #0x1c]
    blx func_ov012_021c1668
    mov r2, #0x0
    mov r3, r2
    add r0, r4, #0x20
    mvn r1, #0x0
    blx func_ov012_021c20a0
    bl func_ov000_02151bcc
    add r1, r4, #0x1000
    mov r2, #0x0
    str r0, [r1, #0x40]
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    add r0, r4, #0x44
    sub r3, r2, #0x1
    ldr r1, [r1, #0x40]
    add r0, r0, #0x1000
    add r2, r4, #0x20
    blx func_ov012_021c2024
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02151754
    mov r0, #0x40
    mov r1, #0x8
    blx func_ov012_021c201c
    bl func_ov000_02151bcc
    add r1, r4, #0x1000
    add r2, r4, #0x44
    str r0, [r1, #0x8c]
    add r2, r2, #0x1000
    mov r0, #0x40
    mov r1, #0x8
    mov r3, #0x0
    blx func_ov012_021c2484
    bl func_ov000_02151bcc
    add r1, r4, #0x1000
    str r0, [r1, #0x90]
    add r0, r4, #0x40
    str r0, [r4, #0x34]
    mov r0, #0x400
    str r0, [r4, #0x3c]
    mov r0, #0x0
    str r0, [r4, #0x38]
    mov r0, #0x1
.L_02151754:
    cmp r0, #0x0
    mov r0, r4
    bne .L_02151768
    bl func_ov000_021517b8
    mov r0, #0x0
.L_02151768:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_02151770: .word data_ov000_02160f94
.L_02151774: .word 0x1098
.L_02151778: .word data_ov000_02160f84
.L_0215177c: .word func_ov000_02151b88
.L_02151780: .word func_ov000_02151b84
.L_02151784: .word data_ov000_02160fa4
.L_02151788: .word data_ov000_02160fbc
    arm_func_end func_ov000_02151570

    .global func_ov000_0215178c
    arm_func_start func_ov000_0215178c
func_ov000_0215178c: ; 0x0215178c
    stmdb sp!, {r4, lr}
    bl func_02033410
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne .L_021517b0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_021517b0:
    ldr r0, [r4, #0x1c]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215178c

    .global func_ov000_021517b8
    arm_func_start func_ov000_021517b8
func_ov000_021517b8: ; 0x021517b8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x1000
    ldr r5, [r0, #0x40]
    cmp r5, #0x0
    beq .L_021517ec
    mov r0, r5
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_021517ec
    mov r0, r5
    mov r1, #0x1
    bl func_0201a958
.L_021517ec:
    add r0, r4, #0x1000
    ldr r5, [r0, #0x8c]
    cmp r5, #0x0
    beq .L_02151818
    mov r0, r5
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_02151818
    mov r0, r5
    mov r1, #0x1
    bl func_0201a958
.L_02151818:
    add r0, r4, #0x1000
    ldr r5, [r0, #0x90]
    cmp r5, #0x0
    beq .L_02151844
    mov r0, r5
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_02151844
    mov r0, r5
    mov r1, #0x1
    bl func_0201a958
.L_02151844:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02151860
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02151860:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_0215187c
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215187c:
    ldr r0, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_021517b8

    .global func_ov000_02151898
    arm_func_start func_ov000_02151898
func_ov000_02151898: ; 0x02151898
    mov r2, #0x0
    str r2, [r0, #0x38]
    add r1, r0, #0x1000
    str r2, [r1, #0x94]
    ldr r0, [r0, #0x0]
    ldr ip, .L_021518bc
    ldr r1, .L_021518c0
    ldr r0, [r0, #0x4]
    bx ip
.L_021518bc: .word func_02028384
.L_021518c0: .word func_ov000_02151b88
    arm_func_end func_ov000_02151898

    .global func_ov000_021518c4
    arm_func_start func_ov000_021518c4
func_ov000_021518c4: ; 0x021518c4
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    add r0, r5, #0x1000
    ldr r4, [r0, #0x94]
    tst r4, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r3, #0x0
    beq .L_02151914
    orr r3, r4, #0x2
    str r3, [r0, #0x94]
    ldr r3, [r5, #0x38]
    ldr r0, [r5, #0x3c]
    cmp r3, r0
    movhs r0, #0x1
    movlo r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x34
    bl func_ov000_02151a2c
    ldmia sp!, {r4, r5, r6, pc}
.L_02151914:
    tst r4, #0x2
    ldmeqia sp!, {r4, r5, r6, pc}
    bic r1, r4, #0x2
    str r1, [r0, #0x94]
    ldr r1, [r5, #0x38]
    ldr r0, [r5, #0x3c]
    cmp r1, r0
    movhs r0, #0x1
    movlo r0, #0x0
    cmp r0, #0x0
    bne .L_02151950
    mvn r1, #0x0
    mov r2, r1
    add r0, r5, #0x34
    bl func_ov000_02151a2c
.L_02151950:
    ldr r0, [r5, #0x10]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    ldr r1, [r5, #0x10]
    ldr r4, [r0, #0x0]
    ldr r0, [r1, #0x4]
    mov r1, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r6, r0
    mov r0, r5
    bl func_ov000_02151ac0
    mov r3, #0x0
    b .L_021519b8
.L_02151998:
    ldr r1, [r5, #0x1c]
    ldr r2, [r6, #0x4]
    ldr r1, [r1, r0, lsl #0x2]
    cmp r2, r1
    ldreq r1, [r6, #0x0]
    beq .L_021519c4
    add r6, r6, #0x8
    add r3, r3, #0x1
.L_021519b8:
    cmp r3, r4
    blo .L_02151998
    mvn r1, #0x0
.L_021519c4:
    mvn r0, #0x0
    cmp r1, r0
    beq .L_02151a04
    ldr r2, [r5, #0x8]
    cmp r2, #0x0
    beq .L_021519e4
    mov r0, r5
    blx r2
.L_021519e4:
    add r0, r5, #0x1000
    ldr r1, [r0, #0x94]
    orr r1, r1, #0x1
    str r1, [r0, #0x94]
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, r5, r6, pc}
.L_02151a04:
    add r0, r5, #0x1000
    ldr r2, [r0, #0x94]
    ldr r1, .L_02151a28
    orr r2, r2, #0x1
    str r2, [r0, #0x94]
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r4, r5, r6, pc}
.L_02151a28: .word func_ov000_02151bc8
    arm_func_end func_ov000_021518c4

    .global func_ov000_02151a2c
    arm_func_start func_ov000_02151a2c
func_ov000_02151a2c: ; 0x02151a2c
    ldr r3, [r0, #0x4]
    ldr ip, [r0, #0x0]
    mov r3, r3, lsl #0x2
    strh r1, [ip, r3]
    ldr r3, [r0, #0x0]
    ldr r1, [r0, #0x4]
    add r1, r3, r1, lsl #0x2
    strh r2, [r1, #0x2]
    ldr r1, [r0, #0x4]
    add r1, r1, #0x1
    str r1, [r0, #0x4]
    bx lr
    arm_func_end func_ov000_02151a2c

    .global func_ov000_02151a5c
    arm_func_start func_ov000_02151a5c
func_ov000_02151a5c: ; 0x02151a5c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x128]
    blx r1
    cmp r0, #0x0
    ldr r1, [r4, #0x4]
    movne r3, #0x1
    ldr r0, [r1, #0x4]
    moveq r3, #0x0
    ldr r0, [r0, #0x50]
    ldr ip, [r0, #0x10]
    ldr r1, [r0, #0xc]
    mov r2, ip, asr #0xb
    mov r0, r1, asr #0xb
    add r1, r1, r0, lsr #0x14
    add r2, ip, r2, lsr #0x14
    mov r0, r4
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl func_ov000_021518c4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02151a5c

    .global func_ov000_02151ac0
    arm_func_start func_ov000_02151ac0
func_ov000_02151ac0: ; 0x02151ac0
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x64
    mov r2, #0x0
    mov r1, #0x3
    mov r4, r0
    mov r0, #0x2
    str r2, [sp, #0x18]
    str r1, [sp, #0x1c]
    str r0, [sp, #0x20]
    mov r1, #0x8
    add r0, sp, #0x18
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    add r0, r4, #0x1000
    ldr r1, [r0, #0x8c]
    add r0, sp, #0x24
    add r2, r4, #0x34
    mov r3, #0x40
    blx func_ov012_021c1fc4
    cmp r0, #0x0
    beq .L_02151b74
    mov r2, #0x0
    add r0, r4, #0x44
    add r1, sp, #0x24
    str r2, [sp, #0x14]
    str r1, [sp, #0x0]
    add r0, r0, #0x1000
    str r0, [sp, #0x4]
    sub r0, r2, #0x1
    str r0, [sp, #0x8]
    str r2, [sp, #0xc]
    add r0, r4, #0x1000
    ldr r3, [r0, #0x90]
    add r0, sp, #0x14
    add r1, sp, #0x10
    mov r2, #0x1
    blx func_ov012_021c20cc
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x10]
    cmp r1, #0x0
    beq .L_02151b74
    ldr r0, .L_02151b80
    cmp r2, r0
    ldrgth r0, [r1, #0x8]
    bgt .L_02151b78
.L_02151b74:
    mvn r0, #0x0
.L_02151b78:
    add sp, sp, #0x64
    ldmia sp!, {r3, r4, pc}
.L_02151b80: .word 0xccc
    arm_func_end func_ov000_02151ac0

    .global func_ov000_02151b84
    arm_func_start func_ov000_02151b84
func_ov000_02151b84: ; 0x02151b84
    bx lr
    arm_func_end func_ov000_02151b84

    .global func_ov000_02151b88
    arm_func_start func_ov000_02151b88
func_ov000_02151b88: ; 0x02151b88
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x130]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_02151bc4
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_02151bc4: .word func_ov000_02151a5c
    arm_func_end func_ov000_02151b88

    .global func_ov000_02151bc8
    arm_func_start func_ov000_02151bc8
func_ov000_02151bc8: ; 0x02151bc8
    bx lr
    arm_func_end func_ov000_02151bc8

    .global func_ov000_02151bcc
    arm_func_start func_ov000_02151bcc
func_ov000_02151bcc: ; 0x02151bcc
    stmdb sp!, {r3, lr}
    ldr r1, .L_02151c18
    mov r2, r0
    cmp r2, #0x100
    ldr r0, [r1, #0x0]
    bhi .L_02151c0c
    ldrb r1, [r0, #0x414]
    cmp r1, #0x0
    beq .L_02151c0c
    ldr r0, .L_02151c1c
    mov r1, r2
    ldr r0, [r0, #0x0]
    bl func_0201a6d8
    movs r1, #0x0
    strne r0, [r1, #0x0]
    ldmia sp!, {r3, pc}
.L_02151c0c:
    mov r1, #0x0
    bl func_0201a418
    ldmia sp!, {r3, pc}
.L_02151c18: .word data_020a0dd8
.L_02151c1c: .word data_020a0f60
    arm_func_end func_ov000_02151bcc

    .global func_ov000_02151c20
    arm_func_start func_ov000_02151c20
func_ov000_02151c20: ; 0x02151c20
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x24
    mov r8, r1
    mov r7, r2
    mov r4, r0
    ldr r1, .L_02152340
    ldr r2, .L_02152344
    mov r0, #0xe8
    mov r3, #0x5a
    bl func_0201a21c
    mov r5, r0
    mov r1, #0x0
    mov r2, #0xe8
    bl func_020517fc
    cmp r5, #0x0
    moveq r0, #0x0
    beq .L_02152338
    bl func_02026f94
    str r0, [r5, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x20]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x20
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r5, #0x0]
    ldr r1, .L_02152348
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x0]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldrb r0, [r5, #0xe4]
    orr r0, r0, r4
    strb r0, [r5, #0xe4]
    bl func_020432b8
    mov r1, #0x0
    movs r4, r0
    str r1, [r5, #0x8]
    beq .L_02151d6c
    mov r0, r1
    mov r4, r1
    bl func_0205431c
    mov r6, r0
    mov r0, r4
    bl func_02054330
    ldr r1, .L_0215234c
    add r2, r6, #0x1f
    ldrb r1, [r1, #0x0]
    add r0, r0, #0x1f
    bic r6, r2, #0x1f
    cmp r1, #0x0
    bic r2, r0, #0x1f
    bne .L_02151d40
    mov r1, r6
    mov r0, r4
    mov r3, #0x1
    bl func_02054654
    mov r6, r0
    mov r1, r6
    mov r0, r4
    bl func_020540d8
    ldr r0, .L_0215234c
    mov r1, #0x1
    strb r1, [r0, #0x0]
.L_02151d40:
    mov r1, r6
    add r2, r6, #0x10000
    mov r0, #0x0
    bl func_020545b4
    str r0, [r5, #0x4]
    mov r1, r0
    mov r2, r6
    add r3, r6, #0x10000
    mov r0, #0x0
    bl func_020544dc
    b .L_02151da4
.L_02151d6c:
    ldr r0, .L_02152350
    mov r2, #0x10000
    ldr r0, [r0, #0x0]
    bl func_0201a418
    mov r1, r0
    str r0, [r5, #0x8]
    mov r0, r4
    add r2, r1, #0x10000
    bl func_020545b4
    str r0, [r5, #0x4]
    ldmib r5, {r1, r2}
    mov r0, r4
    add r3, r2, #0x10000
    bl func_020544dc
.L_02151da4:
    ldr r1, [r5, #0x4]
    mov r0, r4
    bl func_02054710
    bl func_0203d4e4
    blx func_020651b0
    blx func_02065150
    mov r0, #0xb
    blx func_02065490
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02051778
    blx func_02065110
    mov r0, #0x3
    blx func_02065978
    mov r0, #0x8
    blx func_02065660
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
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
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x5
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    bl func_0203d478
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r2, #0x1
    ldr r1, [r1, #0x4]
    mov r0, #0x3
    strb r2, [r1, #0x974]
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x5
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x20000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    cmp r7, #0x0
    strb r1, [r0, #0x974]
    beq .L_0215223c
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
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x0
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x0
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x10
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
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x14]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x14
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
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x18]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x18
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x5
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x1c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x1c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x20000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0x974]
.L_0215223c:
    add r0, r5, #0xc
    blx func_02064744
    mov r1, r8
    add r0, r5, #0xc
    blx func_0206451c
    cmp r0, #0x0
    beq .L_021522b0
    ldrb r2, [r5, #0xe4]
    add r0, r5, #0xc
    mov r1, #0xc
    and r2, r2, #0x1
    bl func_ov000_02152bb4
    cmp r0, #0x0
    str r0, [r5, #0x9c]
    cmpne r7, #0x0
    beq .L_021522b0
    add r0, r5, #0x54
    blx func_02064744
    mov r1, r7
    add r0, r5, #0x54
    blx func_0206451c
    cmp r0, #0x0
    beq .L_021522b0
    ldrb r2, [r5, #0xe4]
    add r0, r5, #0x54
    mov r1, #0xc
    and r2, r2, #0x1
    bl func_ov000_02152bb4
    str r0, [r5, #0xa0]
.L_021522b0:
    ldr r0, [r5, #0x9c]
    bl func_ov000_02152b6c
    mov r4, r0
    ldr r0, [r5, #0x9c]
    bl func_ov000_02152b48
    mov r1, r0
    mov r0, r4, lsl #0x10
    mov r1, r1, lsl #0x7
    bl func_0200d338
    add r1, r0, #0x1
    mov r0, #0xc
    mul r0, r1, r0
    add r0, r0, #0x1
    str r1, [r5, #0xa4]
    str r0, [r5, #0xa8]
    mov r0, r0, lsl #0x8
    bl func_ov000_02151bcc
    str r0, [r5, #0xac]
    ldr r0, [r5, #0x9c]
    bl func_ov000_02152b48
    mov r2, r0, lsr #0x10
    ldr r0, .L_02152354
    mov r1, #0x3c
    mul r0, r2, r0
    bl func_0200d338
    str r0, [r5, #0xc4]
    mov r0, #0x0
    str r0, [r5, #0xc8]
    ldr r0, .L_02152358
    ldr r1, .L_0215235c
    ldr r0, [r0, #0x0]
    mov r2, r5
    bl func_0204267c
    mov r0, r5
.L_02152338:
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02152340: .word data_ov000_02160fe8
.L_02152344: .word data_ov000_02160fd8
.L_02152348: .word func_ov000_021524c4
.L_0215234c: .word data_020b02a4
.L_02152350: .word data_020a0dd8
.L_02152354: .word 0x7fd88
.L_02152358: .word data_020a0f64
.L_0215235c: .word func_ov000_02152868
    arm_func_end func_ov000_02151c20

    .global func_ov000_02152360
    arm_func_start func_ov000_02152360
func_ov000_02152360: ; 0x02152360
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_021524bc
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_021524c0
    mov r2, r4
    bl func_020428dc
    ldrb r0, [r4, #0xe4]
    tst r0, #0x4
    beq .L_02152390
    mov r0, r4
    bl func_ov000_02152980
.L_02152390:
    ldr r5, [r4, #0xac]
    cmp r5, #0x0
    beq .L_021523b8
    mov r0, r5
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_021523b8
    mov r0, r5
    mov r1, #0x1
    bl func_0201a958
.L_021523b8:
    bl func_020733a8
    mov r1, r0
    mov r0, #0x1
    mov r2, #0x0
    bl func_020567e8
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    beq .L_021523dc
    bl func_ov000_02152b90
.L_021523dc:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq .L_021523ec
    bl func_ov000_02152b90
.L_021523ec:
    ldr r0, [r4, #0x18]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0215240c
    add r0, r4, #0xc
    blx func_020644ec
.L_0215240c:
    ldr r0, [r4, #0x60]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0215242c
    add r0, r4, #0x54
    blx func_020644ec
.L_0215242c:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    bl func_0205455c
    ldr r5, [r4, #0x8]
    cmp r5, #0x0
    beq .L_02152468
    mov r0, r5
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_02152460
    mov r0, r5
    mov r1, #0x1
    bl func_0201a958
.L_02152460:
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_02152468:
    bl func_0204329c
    blx func_020651b0
    blx func_02065150
    mov r0, #0xb
    blx func_02065490
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02051778
    blx func_02065110
    mov r0, #0x1
    blx func_02065978
    mov r0, #0xa
    blx func_02065660
    ldr r0, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_021524bc: .word data_020a0f64
.L_021524c0: .word func_ov000_02152868
    arm_func_end func_ov000_02152360

    .global func_ov000_021524c4
    arm_func_start func_ov000_021524c4
func_ov000_021524c4: ; 0x021524c4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x4]
    mov r7, #0x0
    ldr r6, [r0, #0x10]
    ldr r0, [r6, #0x9c]
    bl func_ov000_02152b48
.L_021524e0:
    ldrb r0, [r6, #0xe4]
    tst r0, #0x2
    bne .L_021524fc
    ldr r0, [r6, #0x9c]
    bl func_ov000_02152b18
    cmp r0, #0x0
    bne .L_02152534
.L_021524fc:
    ldrb r0, [r6, #0xe4]
    tst r0, #0x2
    bne .L_0215251c
    ldr r1, [r6, #0xd8]
    cmp r1, #0x0
    beq .L_0215251c
    ldr r0, [r6, #0xdc]
    blx r1
.L_0215251c:
    ldrb r0, [r6, #0xe4]
    orr r0, r0, #0x2
    strb r0, [r6, #0xe4]
    ldr r0, [r10, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02152534:
    ldr r0, [r6, #0x9c]
    bl func_ov000_02152ae8
    ldr r0, [r6, #0xa0]
    cmp r0, #0x0
    beq .L_02152554
    bl func_ov000_02152b18
    ldr r0, [r6, #0xa0]
    bl func_ov000_02152ae8
.L_02152554:
    ldr r0, [r6, #0x9c]
    bl func_ov000_02152a64
    mov r9, #0x0
    mov r8, r0
    mov r5, r9
    mov r4, r9
    mov r11, r9
    b .L_02152614
.L_02152574:
    ldrb r0, [r6, #0xe4]
    tst r0, #0x4
    beq .L_021525b0
    ldr r1, [r6, #0xb0]
    ldr r0, [r6, #0xb4]
    ldr r2, [r6, #0xa8]
.L_0215258c:
    ldr r3, [r6, #0xb8]
    ldr ip, [r6, #0xbc]
    subs r3, r1, r3
    sbc ip, r0, ip
    subs r3, r2, r3
    rsc ip, ip, #0x0
    cmp ip, r4
    cmpeq r3, r11
    beq .L_0215258c
.L_021525b0:
    ldr r2, [r6, #0xac]
    ldr r1, [r6, #0xc0]
    ldr r0, [r6, #0x9c]
    add r1, r2, r1, lsl #0x1
    bl func_ov000_02152a34
    ldr r2, [r6, #0xac]
    ldr r0, [r6, #0xc0]
    mov r1, #0x100
    add r0, r2, r0, lsl #0x1
    bl func_02054000
    ldr r0, [r6, #0xc0]
    add r9, r9, #0x1
    add r1, r0, #0x80
    str r1, [r6, #0xc0]
    ldr r0, [r6, #0xa8]
    cmp r1, r0, lsl #0x7
    streq r5, [r6, #0xc0]
    ldr r2, [r6, #0xb0]
    mov r0, #0x1
    ldr r1, [r6, #0xb4]
    adds r0, r2, r0
    str r0, [r6, #0xb0]
    mov r0, #0x0
    adc r0, r1, r0
    str r0, [r6, #0xb4]
.L_02152614:
    mov r0, r9, asr #0x1f
    cmp r0, #0x0
    cmpeq r9, r8
    blo .L_02152574
    ldrb r0, [r6, #0xe4]
    tst r0, #0x4
    bne .L_021526b8
    cmp r7, #0x4
    blt .L_021526a4
    ldr r0, [r6, #0x9c]
    bl func_ov000_02152b6c
    cmp r0, #0x0
    beq .L_021526a4
    ldr r0, [r6, #0x9c]
    bl func_ov000_02152b6c
    mov r1, r0
    mov r0, r6
    bl func_ov000_02152894
    ldrb r0, [r6, #0xe4]
    orr r0, r0, #0x4
    strb r0, [r6, #0xe4]
    bl func_02054b44
    ldr r3, [r6, #0xc4]
    ldr r2, [r6, #0xc8]
    subs r0, r0, r3
    str r0, [r6, #0xcc]
    sbc r0, r1, r2
    mov r1, #0x1
    str r0, [r6, #0xd0]
    mov r0, #0x0
    str r0, [r6, #0xe0]
    ldr r0, .L_0215285c
    mov r2, r1
    ldr r0, [r0, #0x0]
    bl func_0201ad30
    b .L_021526b8
.L_021526a4:
    ldr r1, [r6, #0xd4]
    cmp r1, #0x0
    beq .L_021526b8
    ldr r0, [r6, #0xdc]
    blx r1
.L_021526b8:
    cmp r7, #0x4
    blt .L_021527e0
    ldr r1, [r6, #0xb8]
    ldr r4, [r6, #0xb0]
    ldr r0, [r6, #0xa4]
    ldr r3, [r6, #0xb4]
    ldr r2, [r6, #0xbc]
    subs r4, r4, r1
    add r1, r0, r0, lsl #0x1
    sbc r2, r3, r2
    subs r0, r1, r4
    rscs r0, r2, r1, asr #0x1f
    blt .L_02152748
    ldrb r0, [r6, #0xe4]
    tst r0, #0x4
    beq .L_02152748
    ldr r0, [r6, #0x9c]
    bl func_ov000_02152a88
    ldr r3, [r6, #0xcc]
    ldr r1, [r6, #0xc4]
    ldr r2, [r6, #0xd0]
    ldr r0, [r6, #0xc8]
    adds r1, r3, r1
    str r1, [r6, #0xcc]
    adc r0, r2, r0
    str r0, [r6, #0xd0]
    ldr r0, [r6, #0xa0]
    cmp r0, #0x0
    beq .L_02152730
    bl func_ov000_02152a88
.L_02152730:
    ldr r1, [r6, #0xd4]
    cmp r1, #0x0
    beq .L_021524e0
    ldr r0, [r6, #0xdc]
    blx r1
    b .L_021524e0
.L_02152748:
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x948]
    blx r0
    mov r1, r0
    ldr r0, [r6, #0x9c]
    mov r2, #0x100
    bl func_ov000_02152ab8
    ldr r3, [r6, #0xcc]
    ldr r1, [r6, #0xc4]
    ldr r2, [r6, #0xd0]
    ldr r0, [r6, #0xc8]
    adds r1, r3, r1
    str r1, [r6, #0xcc]
    adc r0, r2, r0
    str r0, [r6, #0xd0]
    ldr r1, [r6, #0xd4]
    cmp r1, #0x0
    beq .L_021527a4
    ldr r0, [r6, #0xdc]
    blx r1
.L_021527a4:
    ldr r0, [r6, #0xa0]
    cmp r0, #0x0
    beq .L_021527d8
    mov r0, #0x3
    bl func_0203b424
    ldr r0, [r0, #0x88]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x948]
    blx r0
    mov r1, r0
    ldr r0, [r6, #0xa0]
    mov r2, #0x100
    bl func_ov000_02152ab8
.L_021527d8:
    ldr r0, .L_02152860
    ldr r0, [r0, #0x0]
.L_021527e0:
    ldrb r0, [r6, #0xe4]
    add r7, r7, #0x1
    tst r0, #0x8
    beq .L_021524e0
    tst r0, #0x4
    beq .L_021524e0
    bl func_020733a8
    ldrb r2, [r6, #0xe5]
    ldr r1, .L_02152864
    mov r5, r0
    ldrb r0, [r1, r2]
    bl func_0200c99c
    mov r1, #0x43000000
    bl func_0200c5ac
    mov r4, r0
    mov r0, r5
    bl func_0200c99c
    mov r1, r0
    mov r0, r4
    bl func_0200c9e4
    bl func_0200c8e0
    mov r1, r0
    mov r0, #0x1
    mov r2, #0x0
    bl func_020567e8
    ldrb r0, [r6, #0xe5]
    cmp r0, #0x7
    addlo r0, r0, #0x1
    strlob r0, [r6, #0xe5]
    b .L_021524e0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215285c: .word data_020a0dd8
.L_02152860: .word 0x27ffc3c
.L_02152864: .word data_ov000_02160fd0
    arm_func_end func_ov000_021524c4

    .global func_ov000_02152868
    arm_func_start func_ov000_02152868
func_ov000_02152868: ; 0x02152868
    ldr r1, [r0, #0xe0]
    add r1, r1, #0x1
    str r1, [r0, #0xe0]
    bx lr
    arm_func_end func_ov000_02152868

    .global func_ov000_02152878
    arm_func_start func_ov000_02152878
func_ov000_02152878: ; 0x02152878
    ldr r2, [r0, #0xb8]
    ldr r1, [r0, #0xbc]
    adds r2, r2, #0x1
    str r2, [r0, #0xb8]
    adc r1, r1, #0x0
    str r1, [r0, #0xbc]
    bx lr
    arm_func_end func_ov000_02152878

    .global func_ov000_02152894
    arm_func_start func_ov000_02152894
func_ov000_02152894: ; 0x02152894
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r4, r1
    mov r5, r0
    mov r1, #0x0
    str r1, [r5, #0xb8]
    str r1, [r5, #0xbc]
    ldr r2, [r5, #0xa8]
    ldr r0, [r5, #0xac]
    mov r2, r2, lsl #0x8
    bl func_0201b28c
    ldr r1, [r5, #0xa8]
    ldr r0, [r5, #0xac]
    mov r1, r1, lsl #0x8
    bl func_02054000
    ldr r0, .L_02152978
    mov r1, r4
    bl func_0200d338
    mov r6, r0
    mov r4, r6, lsl #0x2
    mov r0, #0x1
    bl func_0205b0e0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, [r5, #0xa8]
    mov r1, #0x7f
    mov r2, r2, lsl #0x7
    mov r2, r2, lsr #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    str r6, [sp, #0x10]
    mov r1, #0x40
    str r1, [sp, #0x14]
    mov r1, #0x1
    ldr r2, [r5, #0xac]
    mov r3, r1
    bl func_02056790
    str r5, [sp, #0x0]
    mov r0, #0x0
    mov r1, r4
    mov r2, r4
    ldr r3, .L_0215297c
    bl func_020568a0
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    mov r3, r1
    bl func_02056954
    bl func_020733a8
    mov r1, r0
    mov r0, #0x1
    mov r2, #0x0
    bl func_020567e8
    bl func_0205af34
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02152978: .word 0xffb0ff
.L_0215297c: .word func_ov000_02152878
    arm_func_end func_ov000_02152894

    .global func_ov000_02152980
    arm_func_start func_ov000_02152980
func_ov000_02152980: ; 0x02152980
    stmdb sp!, {r4, lr}
    mov r1, #0x0
    mov r4, r0
    mov r2, r1
    mov r0, #0x1
    bl func_020567e8
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    mov r3, r1
    bl func_020568e4
    mov r0, #0x1
    bl func_0205b0b0
    bl func_02073410
    mov r0, #0x1
    bl func_02056e74
    bl func_0205af34
    ldrb r0, [r4, #0xe4]
    bic r0, r0, #0x4
    strb r0, [r4, #0xe4]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02152980

    .global func_ov000_021529d4
    arm_func_start func_ov000_021529d4
func_ov000_021529d4: ; 0x021529d4
    ldr ip, .L_021529dc
    bx ip
.L_021529dc: .word func_ov000_02151bcc
    arm_func_end func_ov000_021529d4

    .global func_ov000_021529e0
    arm_func_start func_ov000_021529e0
func_ov000_021529e0: ; 0x021529e0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201a9ec
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_0201a958
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021529e0

    .global func_ov000_02152a04
    arm_func_start func_ov000_02152a04
func_ov000_02152a04: ; 0x02152a04
    ldr r1, .L_02152a10
    str r1, [r0, #0x0]
    bx lr
.L_02152a10: .word data_ov000_02160ffc
    arm_func_end func_ov000_02152a04

    .global func_ov000_02152a14
    arm_func_start func_ov000_02152a14
func_ov000_02152a14: ; 0x02152a14
    stmdb sp!, {r4, lr}
    ldr r1, .L_02152a30
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02152a30: .word data_ov000_02160ffc
    arm_func_end func_ov000_02152a14

    .global func_ov000_02152a34
    arm_func_start func_ov000_02152a34
func_ov000_02152a34: ; 0x02152a34
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_02152d1c
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152a34

    .global func_ov000_02152a64
    arm_func_start func_ov000_02152a64
func_ov000_02152a64: ; 0x02152a64
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_02152db4
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152a64

    .global func_ov000_02152a88
    arm_func_start func_ov000_02152a88
func_ov000_02152a88: ; 0x02152a88
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_02152dc4
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152a88

    .global func_ov000_02152ab8
    arm_func_start func_ov000_02152ab8
func_ov000_02152ab8: ; 0x02152ab8
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_02152e08
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152ab8

    .global func_ov000_02152ae8
    arm_func_start func_ov000_02152ae8
func_ov000_02152ae8: ; 0x02152ae8
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_02152ea8
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152ae8

    .global func_ov000_02152b18
    arm_func_start func_ov000_02152b18
func_ov000_02152b18: ; 0x02152b18
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_02153148
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152b18

    .global func_ov000_02152b48
    arm_func_start func_ov000_02152b48
func_ov000_02152b48: ; 0x02152b48
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_021532e0
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152b48

    .global func_ov000_02152b6c
    arm_func_start func_ov000_02152b6c
func_ov000_02152b6c: ; 0x02152b6c
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {pc}
    bl func_ov000_021532e8
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02152b6c

    .global func_ov000_02152b90
    arm_func_start func_ov000_02152b90
func_ov000_02152b90: ; 0x02152b90
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov000_02153704
    mov r0, r4
    bl func_ov000_02153748
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02152b90

    .global func_ov000_02152bb4
    arm_func_start func_ov000_02152bb4
func_ov000_02152bb4: ; 0x02152bb4
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r0, #0x14
    mov r7, r1
    mov r6, r2
    bl func_ov000_02153cb8
    movs r5, r0
    beq .L_02152bf4
    ldr r0, .L_02152ca8
    mov r1, #0x0
    str r0, [r5, #0x0]
    str r1, [r5, #0x4]
    ldr r0, .L_02152cac
    str r1, [r5, #0x8]
    str r0, [r5, #0x0]
.L_02152bf4:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov000_02153c70
    cmp r0, #0x0
    bne .L_02152c3c
    cmp r5, #0x0
    beq .L_02152c30
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02152c30:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02152c3c:
    mov r0, #0x130
    bl func_ov000_02153754
    movs r4, r0
    beq .L_02152c54
    bl func_ov000_02153718
    mov r4, r0
.L_02152c54:
    cmp r6, #0x0
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov000_02152cdc
    cmp r0, #0x0
    bne .L_02152c9c
    cmp r4, #0x0
    beq .L_02152c90
    mov r0, r4
    bl func_ov000_02153704
    mov r0, r4
    bl func_ov000_02153748
.L_02152c90:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02152c9c:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02152ca8: .word data_ov000_02160ffc
.L_02152cac: .word data_ov000_02161020
    arm_func_end func_ov000_02152bb4

    .global func_ov000_02152cb0
    arm_func_start func_ov000_02152cb0
func_ov000_02152cb0: ; 0x02152cb0
    stmdb sp!, {r4, lr}
    ldr r2, .L_02152cd4
    mov r4, r0
    ldr r1, .L_02152cd8
    str r2, [r4, #0x0]
    str r1, [r4, #0x0]
    bl func_ov000_02153cac
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02152cd4: .word data_ov000_02161020
.L_02152cd8: .word data_ov000_02160ffc
    arm_func_end func_ov000_02152cb0

    .global func_ov000_02152cdc
    arm_func_start func_ov000_02152cdc
func_ov000_02152cdc: ; 0x02152cdc
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, .L_02152d18
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02000b54
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov000_021533cc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02152d18: .word 0x2000bcc
    arm_func_end func_ov000_02152cdc

    .global func_ov000_02152d1c
    arm_func_start func_ov000_02152d1c
func_ov000_02152d1c: ; 0x02152d1c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x100]
    ldr r0, [r4, #0xfc]
    cmp r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r2, [r4, #0x104]
    ldr r0, .L_02152db0
    ldr ip, [r4, #0x34]
    mul r3, r2, r0
    ldr r2, [r4, #0xb4]
    str ip, [r2, r3]
    ldr r2, [r4, #0xb4]
    ldr r3, [r4, #0x104]
    mla r2, r3, r0, r2
    str r1, [r2, #0x4]
    ldr r2, [r4, #0xb4]
    ldr r1, [r4, #0x104]
    mla r0, r1, r0, r2
    bl func_01fff9a8
    ldr r1, [r4, #0x34]
    add r0, r1, r0
    str r0, [r4, #0x34]
    ldr r0, [r4, #0x104]
    add r0, r0, #0x1
    str r0, [r4, #0x104]
    ldr r1, [r4, #0x104]
    ldr r0, [r4, #0x20]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x104]
    ldr r1, [r4, #0x100]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0x100]
    ldmia sp!, {r4, pc}
.L_02152db0: .word 0x14f4
    arm_func_end func_ov000_02152d1c

    .global func_ov000_02152db4
    arm_func_start func_ov000_02152db4
func_ov000_02152db4: ; 0x02152db4
    ldr r1, [r0, #0xf0]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0xe8]
    bx lr
    arm_func_end func_ov000_02152db4

    .global func_ov000_02152dc4
    arm_func_start func_ov000_02152dc4
func_ov000_02152dc4: ; 0x02152dc4
    ldr r2, [r0, #0x114]
    ldr r1, [r0, #0x110]
    cmp r2, r1
    movhs r0, #0x0
    bxhs lr
    add r1, r2, #0x1
    str r1, [r0, #0x114]
    ldr r1, [r0, #0x128]
    add r1, r1, #0x1
    str r1, [r0, #0x128]
    ldr r2, [r0, #0x128]
    ldr r1, [r0, #0xcc]
    cmp r2, r1
    moveq r1, #0x0
    streq r1, [r0, #0x128]
    mov r0, #0x1
    bx lr
    arm_func_end func_ov000_02152dc4

    .global func_ov000_02152e08
    arm_func_start func_ov000_02152e08
func_ov000_02152e08: ; 0x02152e08
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r3, [r4, #0x114]
    ldr r0, [r4, #0x110]
    cmp r3, r0
    addhs sp, sp, #0x18
    movhs r0, #0x0
    ldmhsia sp!, {r4, pc}
    ldr r3, [r4, #0xb8]
    ldr r0, [r4, #0x128]
    mov r2, r2, lsl #0x1
    ldr r3, [r3, r0, lsl #0x2]
    add r0, sp, #0x0
    str r3, [sp, #0x0]
    ldr ip, [r4, #0xbc]
    ldr r3, [r4, #0x128]
    ldr r3, [ip, r3, lsl #0x2]
    str r3, [sp, #0x4]
    str r2, [sp, #0xc]
    str r1, [sp, #0x8]
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x10]
    ldr r1, [r4, #0x10]
    str r1, [sp, #0x14]
    bl func_01ffec80
    ldr r0, [r4, #0x114]
    add r0, r0, #0x1
    str r0, [r4, #0x114]
    ldr r0, [r4, #0x128]
    add r0, r0, #0x1
    str r0, [r4, #0x128]
    ldr r1, [r4, #0x128]
    ldr r0, [r4, #0xcc]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x128]
    mov r0, #0x1
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02152e08

    .global func_ov000_02152ea8
    arm_func_start func_ov000_02152ea8
func_ov000_02152ea8: ; 0x02152ea8
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x84
    mov r4, r0
    ldr r1, [r4, #0x114]
    ldr r0, [r4, #0x110]
    cmp r1, r0
    addhi sp, sp, #0x84
    movhi r0, #0x0
    ldmhiia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x10c]
    add r6, sp, #0x38
    add r0, r0, #0x1
    str r0, [r4, #0x10c]
    ldr r0, [r4, #0x110]
    add r7, r4, #0x6c
    add r0, r0, #0x1
    str r0, [r4, #0x110]
    ldr r0, [r4, #0x118]
    add lr, sp, #0x58
    add r0, r0, #0x1
    str r0, [r4, #0x118]
    ldr r0, [r4, #0x11c]
    add r5, r4, #0x8c
    add r0, r0, #0x1
    str r0, [r4, #0x11c]
    ldr r0, [r4, #0x120]
    mov ip, #0x10
    add r0, r0, #0x1
    str r0, [r4, #0x120]
    ldr r0, [r4, #0x124]
    add r0, r0, #0x1
    str r0, [r4, #0x124]
    ldr r1, [r4, #0x118]
    ldr r0, [r4, #0xcc]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x118]
    ldr r1, [r4, #0x11c]
    ldr r0, [r4, #0xcc]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x11c]
    ldr r1, [r4, #0x120]
    ldr r0, [r4, #0xcc]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x120]
    ldr r1, [r4, #0x124]
    ldr r0, [r4, #0xcc]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x124]
    ldr r0, [r4, #0x34]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x38]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x3c]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x40]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x44]
    str r0, [sp, #0x10]
    ldr r0, [r4, #0x48]
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x4c]
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x50]
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x54]
    str r0, [sp, #0x20]
    ldr r0, [r4, #0x58]
    str r0, [sp, #0x24]
    ldr r0, [r4, #0x5c]
    str r0, [sp, #0x28]
    ldr r0, [r4, #0x60]
    str r0, [sp, #0x2c]
    ldr r0, [r4, #0x64]
    str r0, [sp, #0x30]
    ldr r0, [r4, #0x68]
    str r0, [sp, #0x34]
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7, {r0, r1, r2, r3}
    stmia r6, {r0, r1, r2, r3}
.L_02152ff8:
    ldrb r1, [r5], #0x1
    ldrb r0, [r5], #0x1
    subs ip, ip, #0x1
    strb r1, [lr], #0x1
    strb r0, [lr], #0x1
    bne .L_02152ff8
    ldr r1, [r4, #0xac]
    add r0, sp, #0x0
    str r1, [sp, #0x78]
    ldr r1, [r4, #0xb0]
    str r1, [sp, #0x7c]
    bl func_01ff92a0
    ldr r2, [r4, #0x34]
    mov r1, #0x0
    add r0, r2, r0
    str r0, [r4, #0x34]
    str r1, [r4, #0x100]
    str r1, [r4, #0x104]
    mov r0, #0x1
    add sp, sp, #0x84
    ldmia sp!, {r4, r5, r6, r7, pc}
    arm_func_end func_ov000_02152ea8

    .global func_ov000_0215304c
    arm_func_start func_ov000_0215304c
func_ov000_0215304c: ; 0x0215304c
    ldr ip, .L_02153058
    mov r1, #0x0
    bx ip
.L_02153058: .word func_ov000_0215305c
    arm_func_end func_ov000_0215304c

    .global func_ov000_0215305c
    arm_func_start func_ov000_0215305c
func_ov000_0215305c: ; 0x0215305c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r1
    mov r5, r0
    bmi .L_0215307c
    ldr r0, [r5, #0x30]
    cmp r4, r0
    blo .L_02153088
.L_0215307c:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_02153088:
    ldr r0, [r5, #0x0]
    ldr r1, [r5, #0xf4]
    ldr r2, [r0, #0x0]
    add r1, r1, r4, lsl #0x3
    ldr r3, [r5, #0x108]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0x8]
    add r1, r3, r1
    blx r2
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r5, #0xf4]
    ldr r0, [r0, r4, lsl #0x3]
    str r0, [r5, #0xf8]
    ldr r0, [r5, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    mov r0, #0x1
    str r0, [r5, #0xf0]
    ldr r0, [r5, #0x0]
    add r1, sp, #0x0
    ldr r3, [r0, #0x0]
    mov r2, #0x4
    ldr r3, [r3, #0xc]
    blx r3
    ldr r2, [sp, #0x0]
    ldr r0, .L_02153144
    mov r1, #0x0
    and r0, r2, r0
    str r0, [r5, #0xd8]
    ldr r0, [sp, #0x0]
    mov r0, r0, lsr #0x10
    str r0, [r5, #0xe8]
    str r1, [r5, #0xe0]
    ldr r0, [r5, #0x0]
    ldr r2, [r5, #0xd8]
    ldr r3, [r0, #0x0]
    ldr r1, [r5, #0xd0]
    ldr r3, [r3, #0xc]
    add r2, r2, #0x2
    blx r3
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_02153144: .word 0xffff
    arm_func_end func_ov000_0215305c

    .global func_ov000_02153148
    arm_func_start func_ov000_02153148
func_ov000_02153148: ; 0x02153148
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r2, [r5, #0xf8]
    ldr r1, [r5, #0x8]
    cmp r2, r1
    bne .L_0215317c
    ldrb r1, [r5, #0x12c]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    bl func_ov000_0215304c
.L_0215317c:
    ldr r0, [r5, #0xf8]
    ldr r2, .L_021532dc
    add r0, r0, #0x1
    str r0, [r5, #0xf8]
    ldr r4, [r5, #0xf0]
    add r0, r4, #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    str r0, [r5, #0xf0]
    ldr r0, [r5, #0xf0]
    add r1, r5, r4, lsl #0x2
    add ip, r5, r0, lsl #0x2
    ldr r3, [ip, #0xe0]
    ldr r0, [ip, #0xd8]
    ldr ip, [ip, #0xd0]
    add r0, r3, r0
    add r0, ip, r0
    ldr r3, [r0, #-0x2]
    and r0, r3, r2
    str r0, [r1, #0xd8]
    mov r0, r3, lsr #0x10
    str r0, [r1, #0xe8]
    ldr r0, [r5, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    ldr r0, [r5, #0xf0]
    add r0, r5, r0, lsl #0x2
    ldr r1, [r0, #0xd0]
    ldr r0, [r0, #0xe0]
    add r0, r1, r0
    str r0, [r5, #0x34]
    ldr r1, [r5, #0xf8]
    ldr r0, [r5, #0x8]
    cmp r1, r0
    bhs .L_02153238
    ldr r0, [r5, #0x0]
    add r1, r5, r4, lsl #0x2
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0xd8]
    ldr r1, [r1, #0xd0]
    ldr r3, [r3, #0x10]
    add r2, r2, #0x2
    blx r3
    add r1, r5, r4, lsl #0x2
    str r0, [r1, #0xe0]
.L_02153238:
    ldr r2, [r5, #0xb8]
    ldr r1, [r5, #0x118]
    mov r0, #0x1
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x38]
    ldr r2, [r5, #0xbc]
    ldr r1, [r5, #0x118]
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x3c]
    ldr r2, [r5, #0xb8]
    ldr r1, [r5, #0x11c]
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x40]
    ldr r2, [r5, #0xbc]
    ldr r1, [r5, #0x11c]
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x44]
    ldr r2, [r5, #0xb8]
    ldr r1, [r5, #0x120]
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x48]
    ldr r2, [r5, #0xbc]
    ldr r1, [r5, #0x120]
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x4c]
    ldr r2, [r5, #0xb8]
    ldr r1, [r5, #0x124]
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x50]
    ldr r2, [r5, #0xbc]
    ldr r1, [r5, #0x124]
    ldr r1, [r2, r1, lsl #0x2]
    str r1, [r5, #0x54]
    ldr r1, [r5, #0xf0]
    ldr r2, [r5, #0x20]
    add r1, r5, r1, lsl #0x2
    ldr r1, [r1, #0xe8]
    mul r1, r2, r1
    str r1, [r5, #0xfc]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_021532dc: .word 0xffff
    arm_func_end func_ov000_02153148

    .global func_ov000_021532e0
    arm_func_start func_ov000_021532e0
func_ov000_021532e0: ; 0x021532e0
    ldr r0, [r0, #0x14]
    bx lr
    arm_func_end func_ov000_021532e0

    .global func_ov000_021532e8
    arm_func_start func_ov000_021532e8
func_ov000_021532e8: ; 0x021532e8
    ldr r0, [r0, #0x1c]
    bx lr
    arm_func_end func_ov000_021532e8

    .global func_ov000_021532f0
    arm_func_start func_ov000_021532f0
func_ov000_021532f0: ; 0x021532f0
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0215332c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0215332c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0215332c:
    ldr r0, [r4, #0xc4]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0xc8]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0xcc]
    ldr r1, [r4, #0xb8]
    ldr r2, [r4, #0xbc]
    ldr r3, [r4, #0xc0]
    bl func_ov000_02153760
    mov r6, #0x0
    mov r5, r6
.L_02153358:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0xd0]
    cmp r0, #0x0
    beq .L_0215336c
    bl func_ov000_021529e0
.L_0215336c:
    add r0, r4, r6, lsl #0x2
    add r6, r6, #0x1
    str r5, [r0, #0xd0]
    cmp r6, #0x2
    blt .L_02153358
    ldr r0, [r4, #0xf4]
    cmp r0, #0x0
    beq .L_02153390
    bl func_ov000_021529e0
.L_02153390:
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    beq .L_021533a0
    bl func_ov000_021529e0
.L_021533a0:
    mov r0, #0x0
    str r0, [r4, #0x0]
    str r0, [r4, #0xb4]
    str r0, [r4, #0xb8]
    str r0, [r4, #0xbc]
    str r0, [r4, #0xc0]
    str r0, [r4, #0xc4]
    str r0, [r4, #0xc8]
    str r0, [r4, #0xf4]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_021532f0

    .global func_ov000_021533cc
    arm_func_start func_ov000_021533cc
func_ov000_021533cc: ; 0x021533cc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x1c
    cmp r2, #0x3
    mov r8, r0
    addlo sp, sp, #0x1c
    movlo r0, #0x0
    ldmloia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, r2, #0x1
    str r0, [r8, #0xcc]
    str r1, [r8, #0x0]
    ldr r0, [r8, #0x0]
    add r1, r8, #0x4
    ldr r0, [r0, #0x8]
    mov r2, #0x30
    str r0, [r8, #0x108]
    strb r3, [r8, #0x12c]
    ldr r0, [r8, #0x0]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r8, #0x4]
    ldr r0, .L_021536f4
    cmp r1, r0
    addne sp, sp, #0x1c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r8, #0xc]
    mov r0, #0x0
    str r1, [r8, #0xac]
    ldr r1, [r8, #0x10]
    str r1, [r8, #0xb0]
    str r0, [r8, #0x58]
    str r0, [r8, #0x5c]
    ldr r4, [r8, #0xc]
    cmp r4, #0x100
    addhi sp, sp, #0x1c
    ldmhiia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, r8, #0xb8
    str r0, [sp, #0x0]
    add r0, r8, #0xbc
    str r0, [sp, #0x4]
    add r0, r8, #0xc0
    str r0, [sp, #0x8]
    add r0, r8, #0xc4
    str r0, [sp, #0xc]
    add r0, r8, #0xc8
    str r0, [sp, #0x10]
    add r0, r8, #0x34
    str r0, [sp, #0x14]
    ldr r1, [r8, #0x10]
    ldr r2, [r8, #0x18]
    ldr r3, [r8, #0xcc]
    mov r0, r4
    bl func_ov000_021537fc
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r4, #0x0
.L_021534c8:
    ldr r0, [r8, #0x24]
    add r0, r0, #0x400
    bl func_ov000_021529d4
    add r1, r8, r4, lsl #0x2
    str r0, [r1, #0xd0]
    ldr r0, [r1, #0xd0]
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_021534c8
    ldr r1, [r8, #0x20]
    cmp r1, #0x0
    beq .L_0215352c
    ldr r0, .L_021536f8
    mul r0, r1, r0
    bl func_ov000_021529d4
    str r0, [r8, #0xb4]
    ldr r0, [r8, #0xb4]
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_0215352c:
    mov r2, #0x0
    str r2, [r8, #0x58]
    str r2, [r8, #0x5c]
    ldr r1, [r8, #0xcc]
    mov r0, #0x1
    str r1, [r8, #0x10c]
    ldr r1, [r8, #0xcc]
    add r1, r1, #0x1
    str r1, [r8, #0x110]
    ldr r1, [r8, #0x110]
    str r1, [r8, #0x114]
    str r2, [r8, #0x118]
    ldr r1, [r8, #0xcc]
    sub r1, r1, #0x1
    str r1, [r8, #0x11c]
    ldr r1, [r8, #0xcc]
    sub r1, r1, #0x2
    str r1, [r8, #0x120]
    str r0, [r8, #0x124]
    ldr r0, [r8, #0x124]
    str r0, [r8, #0x128]
    str r2, [r8, #0xf8]
    ldr r0, [r8, #0x0]
    ldr r3, [r8, #0x2c]
    ldr r2, [r0, #0x0]
    ldr r1, [r8, #0x108]
    ldr r2, [r2, #0x8]
    add r1, r3, r1
    ldr r4, [r0, #0x8]
    blx r2
    ldr r0, [r8, #0x30]
    mov r0, r0, lsl #0x3
    bl func_ov000_021529d4
    str r0, [r8, #0xf4]
    ldr r0, [r8, #0x0]
    ldr r2, [r8, #0x30]
    ldr r3, [r0, #0x0]
    ldr r1, [r8, #0xf4]
    ldr r3, [r3, #0xc]
    mov r2, r2, lsl #0x3
    blx r3
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r8, #0x0]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x8]
    blx r2
    ldr r0, [r8, #0x0]
    ldr r3, [r8, #0x28]
    ldr r2, [r0, #0x0]
    ldr r1, [r8, #0x108]
    ldr r2, [r2, #0x8]
    add r1, r3, r1
    ldr r6, [r0, #0x8]
    blx r2
    ldr r0, [r8, #0x20]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_02153674
    ldr r4, .L_021536fc
    ldr r9, .L_021536f8
    mov r5, r7
.L_02153630:
    ldr r0, [r8, #0x0]
    ldr r1, [r8, #0xb4]
    ldr r3, [r0, #0x0]
    add r1, r1, r5
    ldr r3, [r3, #0xc]
    mov r2, r4
    add r1, r1, #0x8c0
    blx r3
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r8, #0x20]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, r9
    blo .L_02153630
.L_02153674:
    ldr r0, [r8, #0x0]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x8]
    blx r2
    mov r0, #0x1
    str r0, [r8, #0xf0]
    ldr r0, [r8, #0x0]
    add r1, sp, #0x18
    ldr r3, [r0, #0x0]
    mov r2, #0x4
    ldr r3, [r3, #0xc]
    blx r3
    ldr r2, [sp, #0x18]
    ldr r0, .L_02153700
    mov r1, #0x0
    and r0, r2, r0
    str r0, [r8, #0xd8]
    ldr r0, [sp, #0x18]
    mov r0, r0, lsr #0x10
    str r0, [r8, #0xe8]
    str r1, [r8, #0xe0]
    ldr r0, [r8, #0x0]
    ldr r2, [r8, #0xd8]
    ldr r3, [r0, #0x0]
    ldr r1, [r8, #0xd0]
    ldr r3, [r3, #0xc]
    add r2, r2, #0x2
    blx r3
    mov r0, #0x1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_021536f4: .word 0x53445856
.L_021536f8: .word 0x14f4
.L_021536fc: .word 0xc34
.L_02153700: .word 0xffff
    arm_func_end func_ov000_021533cc

    .global func_ov000_02153704
    arm_func_start func_ov000_02153704
func_ov000_02153704: ; 0x02153704
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov000_021532f0
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02153704

    .global func_ov000_02153718
    arm_func_start func_ov000_02153718
func_ov000_02153718: ; 0x02153718
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0xb8]
    str r1, [r0, #0xbc]
    str r1, [r0, #0xc0]
    str r1, [r0, #0xc4]
    str r1, [r0, #0xc8]
    str r1, [r0, #0xd0]
    str r1, [r0, #0xd4]
    str r1, [r0, #0xb4]
    str r1, [r0, #0xf4]
    bx lr
    arm_func_end func_ov000_02153718

    .global func_ov000_02153748
    arm_func_start func_ov000_02153748
func_ov000_02153748: ; 0x02153748
    ldr ip, .L_02153750
    bx ip
.L_02153750: .word func_ov000_021529e0
    arm_func_end func_ov000_02153748

    .global func_ov000_02153754
    arm_func_start func_ov000_02153754
func_ov000_02153754: ; 0x02153754
    ldr ip, .L_0215375c
    bx ip
.L_0215375c: .word func_ov000_021529d4
    arm_func_end func_ov000_02153754

    .global func_ov000_02153760
    arm_func_start func_ov000_02153760
func_ov000_02153760: ; 0x02153760
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    beq .L_021537c8
    cmp r6, #0x0
    beq .L_021537c8
    cmp r8, #0x0
    mov r4, #0x0
    bls .L_021537b8
.L_0215378c:
    ldr r0, [r7, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_0215379c
    bl func_ov000_021529e0
.L_0215379c:
    ldr r0, [r6, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_021537ac
    bl func_ov000_021529e0
.L_021537ac:
    add r4, r4, #0x1
    cmp r4, r8
    blo .L_0215378c
.L_021537b8:
    mov r0, r7
    bl func_ov000_021529e0
    mov r0, r6
    bl func_ov000_021529e0
.L_021537c8:
    cmp r5, #0x0
    beq .L_021537d8
    mov r0, r5
    bl func_ov000_021529e0
.L_021537d8:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    beq .L_021537e8
    bl func_ov000_021529e0
.L_021537e8:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov000_021529e0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov000_02153760

    .global func_ov000_021537fc
    arm_func_start func_ov000_021537fc
func_ov000_021537fc: ; 0x021537fc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    cmp r0, #0x100
    ldr r0, [sp, #0x38]
    ldr r9, [sp, #0x30]
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x3c]
    ldr r8, [sp, #0x34]
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x40]
    ldr r7, [sp, #0x44]
    str r0, [sp, #0x40]
    str r1, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r10, r3
    addhi sp, sp, #0xc
    movhi r0, #0x0
    ldmhiia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r4, r10, lsl #0x2
    mov r0, r4
    bl func_ov000_021529d4
    str r0, [r9, #0x0]
    mov r0, r4
    bl func_ov000_021529d4
    str r0, [r8, #0x0]
    cmp r10, #0x0
    mov r6, #0x0
    bls .L_0215390c
    ldr r0, [sp, #0x0]
    str r6, [sp, #0x8]
    mov r1, r0, lsr #0x1
    mov r5, r0, lsl #0x8
    mov r4, r1, lsl #0x8
    mov r11, #0x80
.L_02153884:
    mov r0, r5
    bl func_ov000_021529d4
    ldr r1, [r9, #0x0]
    str r0, [r1, r6, lsl #0x2]
    ldr r0, [r9, #0x0]
    ldr r0, [r0, r6, lsl #0x2]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, r4
    bl func_ov000_021529d4
    ldr r1, [r8, #0x0]
    mov r2, r6, lsl #0x2
    str r0, [r1, r6, lsl #0x2]
    ldr r0, [r8, #0x0]
    ldr r0, [r0, r6, lsl #0x2]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r9, #0x0]
    ldr r1, [sp, #0x8]
    ldr r0, [r0, r2]
    mov r2, r5
    blx func_02002488
    ldr r0, [r8, #0x0]
    mov r1, r11
    ldr r0, [r0, r6, lsl #0x2]
    mov r2, r4
    blx func_02002488
    add r6, r6, #0x1
    cmp r6, r10
    blo .L_02153884
.L_0215390c:
    ldr r0, [sp, #0x0]
    mov r0, r0, lsr #0x2
    add r1, r0, #0x1
    mov r0, #0x41
    mul r5, r1, r0
    mov r0, r5
    bl func_ov000_021529d4
    ldr r1, [sp, #0x38]
    str r0, [r1, #0x0]
    mov r0, r1
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [sp, #0x0]
    mov r0, r0, lsr #0x3
    add r1, r0, #0x1
    mov r0, #0x21
    mul r4, r1, r0
    mov r0, r4
    bl func_ov000_021529d4
    ldr r1, [sp, #0x3c]
    str r0, [r1, #0x0]
    mov r0, r1
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [sp, #0x38]
    mov r2, r5
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    blx func_02002488
    ldr r0, [sp, #0x3c]
    mov r2, r4
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    blx func_02002488
    ldr r0, [sp, #0x0]
    mov r0, r0, lsr #0x4
    add r1, r0, #0x1
    mov r0, #0x48
    mul r4, r1, r0
    mov r0, r4
    bl func_ov000_021529d4
    ldr r1, [sp, #0x40]
    str r0, [r1, #0x0]
    mov r0, r1
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r2, r4
    mov r1, #0x0
    blx func_02002488
    ldr r0, [sp, #0x38]
    ldr r3, .L_02153ac0
    ldr r1, [sp, #0x4]
    ldr r4, [r0, #0x0]
    umull r2, r0, r1, r3
    add r1, r4, #0x42
    str r1, [r7, #0x2c]
    ldr r1, [sp, #0x3c]
    mov r0, r0, lsr #0x2
    ldr r4, [r1, #0x0]
    ldr r1, [sp, #0x4]
    umull r2, r3, r1, r3
    add r1, r4, #0x22
    str r1, [r7, #0x30]
    ldr r1, [sp, #0x40]
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    mov r3, r3, lsr #0x2
    add r5, r1, #0x4c
    ldr r1, .L_02153ac4
    str r5, [r7, #0x34]
    umull r4, r0, r1, r0
    ldr r0, [sp, #0x4]
    mov r1, r2
    sub r0, r0, r4
    ldr r4, .L_02153ac8
    mov r8, r2
    add r6, r4, r0, lsl #0x5
.L_02153a64:
    mov r9, r8
    add r5, r6, r1, lsl #0x4
.L_02153a6c:
    ldr r4, [r5, r9, lsl #0x2]
    add r0, r7, r2, lsl #0x2
    mov r4, r4, lsl r3
    add r9, r9, #0x1
    str r4, [r0, #0x38]
    cmp r9, #0x4
    add r2, r2, #0x1
    blt .L_02153a6c
    add r1, r1, #0x1
    cmp r1, #0x2
    blt .L_02153a64
    mov r2, #0x0
    mov r1, #0x9
.L_02153aa0:
    add r0, r7, r2
    add r2, r2, #0x1
    strb r1, [r0, #0x58]
    cmp r2, #0x19
    blt .L_02153aa0
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02153ac0: .word 0xaaaaaaab
.L_02153ac4: .word 0x6
.L_02153ac8: .word data_ov000_0215ff64
    arm_func_end func_ov000_021537fc

    .global func_ov000_02153acc
    arm_func_start func_ov000_02153acc
func_ov000_02153acc: ; 0x02153acc
    ldr r2, .L_02153ae0
    ldr r1, .L_02153ae4
    str r2, [r0, #0x0]
    str r1, [r0, #0x0]
    bx lr
.L_02153ae0: .word data_ov000_02161020
.L_02153ae4: .word data_ov000_02160ffc
    arm_func_end func_ov000_02153acc

    .global func_ov000_02153ae8
    arm_func_start func_ov000_02153ae8
func_ov000_02153ae8: ; 0x02153ae8
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    add sp, sp, #0x4
    ldmia sp!, {pc}
    arm_func_end func_ov000_02153ae8

    .global func_ov000_02153b04
    arm_func_start func_ov000_02153b04
func_ov000_02153b04: ; 0x02153b04
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x10]
    cmp r0, #0x1
    bne .L_02153b20
    ldr r0, [r4, #0xc]
    blx func_02064450
.L_02153b20:
    mov r0, #0x0
    strb r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02153b04

    .global func_ov000_02153b2c
    arm_func_start func_ov000_02153b2c
func_ov000_02153b2c: ; 0x02153b2c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r0, #0x200
    ldr r3, [r8, #0x8]
    rsb r0, r0, #0x0
    mov r7, r1
    and r1, r3, r0
    mov r6, r2
    sub r5, r3, r1
    ldr r2, .L_02153bac
    add r4, r6, r5
    ands r2, r4, r2
    andne r0, r4, r0
    addne r4, r0, #0x200
    ldr r0, [r8, #0xc]
    mov r2, #0x0
    blx func_020643f4
    ldr r0, [r8, #0xc]
    mov r1, r7
    mov r2, r4
    blx func_02064440
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r8, #0x8]
    mov r1, #0x1
    add r0, r0, r6
    str r0, [r8, #0x8]
    mov r0, r5
    strb r1, [r8, #0x10]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02153bac: .word 0x1ff
    arm_func_end func_ov000_02153b2c

    .global func_ov000_02153bb0
    arm_func_start func_ov000_02153bb0
func_ov000_02153bb0: ; 0x02153bb0
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrb r0, [r4, #0x10]
    mov r6, r1
    mov r5, r2
    cmp r0, #0x1
    bne .L_02153bec
    ldr r0, [r4, #0xc]
    blx func_02064450
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    blx func_020643f4
    mov r0, #0x0
    strb r0, [r4, #0x10]
.L_02153bec:
    ldr r0, [r4, #0xc]
    mov r1, r6
    mov r2, r5
    blx func_02064430
    mvn r1, #0x0
    cmp r0, r1
    ldrne r1, [r4, #0x8]
    moveq r0, #0x0
    addne r1, r1, r5
    movne r0, #0x1
    strne r1, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_02153bb0

    .global func_ov000_02153c1c
    arm_func_start func_ov000_02153c1c
func_ov000_02153c1c: ; 0x02153c1c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrb r0, [r5, #0x10]
    mov r4, r1
    cmp r0, #0x1
    bne .L_02153c48
    ldr r0, [r5, #0xc]
    blx func_02064450
    mov r0, #0x0
    strb r0, [r5, #0x10]
.L_02153c48:
    ldr r0, [r5, #0xc]
    mov r1, r4
    mov r2, #0x0
    blx func_020643f4
    cmp r0, #0x0
    moveq r0, #0x0
    strne r4, [r5, #0x8]
    movne r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
    arm_func_end func_ov000_02153c1c

    .global func_ov000_02153c70
    arm_func_start func_ov000_02153c70
func_ov000_02153c70: ; 0x02153c70
    str r1, [r0, #0xc]
    ldr r2, [r0, #0xc]
    mov r1, #0x0
    ldr r3, [r2, #0x28]
    ldr r2, [r2, #0x24]
    sub r2, r3, r2
    str r2, [r0, #0x4]
    ldr r2, [r0, #0xc]
    ldr r3, [r2, #0x2c]
    ldr r2, [r2, #0x24]
    sub r2, r3, r2
    str r2, [r0, #0x8]
    strb r1, [r0, #0x10]
    mov r0, #0x1
    bx lr
    arm_func_end func_ov000_02153c70

    .global func_ov000_02153cac
    arm_func_start func_ov000_02153cac
func_ov000_02153cac: ; 0x02153cac
    ldr ip, .L_02153cb4
    bx ip
.L_02153cb4: .word func_ov000_021529e0
    arm_func_end func_ov000_02153cac

    .global func_ov000_02153cb8
    arm_func_start func_ov000_02153cb8
func_ov000_02153cb8: ; 0x02153cb8
    ldr ip, .L_02153cc0
    bx ip
.L_02153cc0: .word func_ov000_021529d4
    arm_func_end func_ov000_02153cb8

    .global func_ov000_02153cc4
    arm_func_start func_ov000_02153cc4
func_ov000_02153cc4: ; 0x02153cc4
    ldr r0, .L_02153cdc
    ldr r0, [r0, #0x8d8]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02153cdc: .word data_020b02b8
    arm_func_end func_ov000_02153cc4

    .global func_ov000_02153ce0
    arm_func_start func_ov000_02153ce0
func_ov000_02153ce0: ; 0x02153ce0
    ldr r0, .L_02153cf8
    ldr r0, [r0, #0x8d8]
    tst r0, #0x20
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02153cf8: .word data_020b02b8
    arm_func_end func_ov000_02153ce0

    .global func_ov000_02153cfc
    arm_func_start func_ov000_02153cfc
func_ov000_02153cfc: ; 0x02153cfc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xdc
    ldr r1, .L_02154c1c
    mov r4, r0
    ldr r2, .L_02154c20
    mov r0, #0xa8
    mov r3, #0x140
    bl func_0201a21c
    mov r7, r0
    mov r1, #0x0
    mov r2, #0xa8
    bl func_020517fc
    str r4, [r7, #0x7c]
    bl func_020310f4
    ldr r2, .L_02154c24
    str r0, [r7, #0x0]
    ldr r1, .L_02154c28
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_02154c2c
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    bl func_02026f94
    str r0, [r7, #0x4]
    ldr r0, [r0, #0x4]
    ldr r1, .L_02154c30
    bl func_02028384
    ldr r0, [r7, #0x4]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r7, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0xc0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
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
    mov r0, #0x2000
    str r0, [sp, #0xac]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xac
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
    str r0, [sp, #0xb0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xb0
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
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0xb4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xb4
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
    mov r0, #0x3000
    str r0, [sp, #0xb8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xb8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r10, #0x0
    mov r9, #0x1
    mov r8, #0x4
    mov r6, r10
    mov r5, r10
    add r4, sp, #0xbc
.L_02153fc8:
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r9
    ldr r0, [r0, #0x4]
    bl func_0203d0b4
    mov r0, r10
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, r8
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
    str r0, [sp, #0xbc]
    ldr r0, [r1, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add r10, r10, #0x1
    cmp r10, #0x4
    blt .L_02153fc8
    mov r6, #0x0
    ldr r5, .L_02154c34
    mov r4, r6
.L_02154074:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r4
    blx func_020101f4
    add r1, r7, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x8]
    cmp r6, #0x5
    blt .L_02154074
    mov r4, #0x0
    ldr r8, .L_02154c38
    ldr r6, .L_02154c3c
    mov r11, r4
    mov r5, r4
.L_021540a8:
    add r0, r4, #0x2
    bl func_0203b414
    ldr r9, [r8, r4, lsl #0x2]
    ldr r0, [r0, #0x88]
    ldr r10, [r6, r4, lsl #0x2]
    bl func_ov000_0214ed48
    mov r0, r9
    bl func_02035c90
    bl func_ov000_0214d908
    mov r9, r0
    bl func_02036ab8
    bl func_ov000_0214ed84
    mov r1, r10
    mov r10, r0
    ldr r0, [r10, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r9, #0x0
    ldr r0, [r10, #0x4]
    bne .L_02154118
    ldr r0, [r0, #0x64]
    mov r1, r5
    ldr r3, [r0, #0x0]
    mov r2, r5
    ldr r3, [r3, #0x50]
    blx r3
    b .L_02154130
.L_02154118:
    ldr r0, [r0, #0x64]
    ldr r1, [r9, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, r11
    ldr r3, [r3, #0x50]
    blx r3
.L_02154130:
    ldr r0, [r10, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r9
    bl func_02034d7c
    bl func_ov000_0214edac
    add r0, r7, r4, lsl #0x2
    add r4, r4, #0x1
    str r10, [r0, #0x1c]
    cmp r4, #0x2
    blt .L_021540a8
    bl func_0203b404
    ldr r0, [r0, #0x88]
    bl func_ov000_0214ed48
    mov r0, #0x500000
    bl func_02035e88
    bl func_ov000_0214d908
    str r0, [r7, #0x24]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x50]
    blx r2
    ldr r0, [r7, #0xc]
    ldr r0, [r0, #0x8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x50]
    blx r1
    bl func_ov000_0214edac
    ldr r1, .L_02154c40
    ldr r2, .L_02154c44
    ldr r3, .L_02154c48
    mov r0, #0xcc
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021541d8
    ldr r1, .L_02154c4c
    ldr r2, .L_02154c50
    mov r3, #0x0
    blx func_ov012_021af26c
.L_021541d8:
    bl func_ov000_021553e8
    mov r4, r0
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x1
    blx func_ov012_021b3b7c
    ldr r0, .L_02154c54
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x4]
    ldr r1, .L_02154c58
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02154224
    bl func_ov000_0214ed84
.L_02154224:
    bl func_ov000_02151094
    mov r1, #0x80
    str r1, [sp, #0x0]
    mov r1, #0x22
    mov r2, #0xe
    mov r3, #0x5
    bl func_0206ad90
    mov r2, r0
    str r0, [r7, #0x64]
    mov r1, #0x0
    strh r1, [r2, #0x18]
    ldr r0, .L_02154c5c
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
    mov r0, r7
    mov r1, #0x0
    bl func_ov000_02155410
    str r0, [r7, #0x2c]
    ldr r1, [r7, #0x2c]
    mov r0, r7
    bl func_ov000_02155410
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r2, #0x4
    str r2, [r0, #0x140]
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    bl func_020152d4
    mov r1, #0x20000
    str r1, [sp, #0x74]
    mov r4, r0
    add r1, sp, #0x74
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r4, [r7, #0x5c]
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r2, .L_02154c60
    add r0, sp, #0x78
    mov r1, r5
    bl func_ov000_02150d54
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x78]
    ldr r3, [sp, #0x7c]
    mov r2, #0x0
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x78]
    ldr r3, [sp, #0x7c]
    mov r2, #0x3c
    bl func_02023c60
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    bl func_02023c70
    ldr r0, [r5, #0x4]
    bl func_020239a0
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x78]
    ldr r3, [sp, #0x7c]
    mov r2, #0x0
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
    mov r1, #0x0
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b3fb0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b3fc4
    ldr r11, .L_02154c64
    str r5, [r7, #0x30]
    mov r10, #0x0
.L_021543b8:
    mov r0, #0x18
    mul r8, r10, r0
    ldr r0, .L_02154c68
    add r9, r11, r8
    str r0, [sp, #0x28]
    ldr r0, [r9, #0x10]
    ldr r6, [r9, #0x8]
    mov r5, r10
    blx r0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r0, .L_02154c6c
    ldrne r5, [r9, #0x14]
    strne r0, [sp, #0x28]
    addne r0, r5, #0xc
    addne r6, r0, #0x500000
    bl func_0203b404
    ldr r1, [r0, #0x88]
    add r2, r11, r8
    str r1, [sp, #0x0]
    mov r1, #0x80
    str r1, [sp, #0x4]
    mov r1, #0x500000
    str r1, [sp, #0x8]
    ldr r3, [r7, #0x30]
    mov r0, r7
    mov r1, r6
    bl func_ov000_021554fc
    mov r8, r0
    ldr r0, [r8, #0x4]
    sub r1, r6, #0xc
    blx func_ov012_021b4034
    ldr r0, [r8, #0x4]
    mov r1, r6
    blx func_ov012_021b3fc4
    mov r0, #0x18000
    str r0, [sp, #0x38]
    ldr r1, .L_02154c70
    ldr r2, .L_02154c74
    mov r0, #0x10
    mov r3, #0xd7
    bl func_0201a21c
    movs r1, r0
    beq .L_02154490
    add r1, sp, #0x38
    ldr r2, [r1, #0x0]
    ldr r3, .L_02154c78
    str r2, [sp, #0x64]
    mov r1, #0x0
    add r2, sp, #0x64
    blx func_ov012_021b0f78
    mov r1, r0
.L_02154490:
    mov r0, r8
    bl func_02020e98
    ldr r2, [sp, #0x28]
    ldr r0, [r8, #0x4]
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r2, [r8, #0x4]
    ldr r1, .L_02154c7c
    add r0, sp, #0xd0
    str r1, [r2, #0xdc]
    ldr r3, [r8, #0x4]
    ldr r2, .L_02154c80
    add r1, sp, #0x50
    str r2, [r3, #0xe0]
    ldr r3, [r8, #0x4]
    add r2, sp, #0x54
    str r5, [r3, #0x124]
    ldr r3, .L_02154c84
    str r3, [sp, #0x50]
    str r3, [sp, #0x54]
    mov r3, #0x0
    str r3, [sp, #0x58]
    add r3, sp, #0x58
    bl func_ov000_02151038
    mov r0, #0x1000
    str r0, [sp, #0x44]
    str r0, [sp, #0x48]
    mov r0, #0x0
    str r0, [sp, #0x4c]
    add r0, sp, #0xc4
    add r1, sp, #0x44
    add r2, sp, #0x48
    add r3, sp, #0x4c
    bl func_ov000_02151038
    ldr r2, .L_02154c88
    add r0, sp, #0x3c
    mov r1, r8
    bl func_ov000_02150d54
    ldr r1, .L_02154c8c
    ldr r2, .L_02154c90
    ldr r3, .L_02154c94
    mov r0, #0x4c
    ldr r5, [sp, #0x40]
    ldr r9, [sp, #0x3c]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02154580
    ldr r1, .L_02154c98
    mov r2, r9
    str r1, [sp, #0x0]
    add r1, sp, #0xc4
    str r1, [sp, #0x4]
    add r1, sp, #0xd0
    str r1, [sp, #0x8]
    mov r1, #0x1e
    str r1, [sp, #0xc]
    mov r1, #0x0
    mov r3, r5
    str r1, [sp, #0x10]
    bl func_02013264
.L_02154580:
    bl func_ov000_021556a0
    ldr r1, [r0, #0x0]
    mov r5, r0
    ldr r1, [r1, #0x38]
    blx r1
    mov r1, r5
    mov r0, r8
    bl func_02020f38
    add r0, r7, r10, lsl #0x2
    str r8, [r0, #0x34]
    bl func_0203b404
    mov r1, r0
    ldr r1, [r1, #0x88]
    add r0, r6, #0xc
    mov r2, #0x20
    mov r3, #0x0
    bl func_ov000_02155334
    mov r1, #0x18
    mul r1, r10, r1
    add r2, r11, r1
    ldr r2, [r2, #0x4]
    ldr r1, [r11, r1]
    add r2, r2, #0x14
    mov r2, r2, lsl #0xc
    mov r1, r1, lsl #0xc
    str r2, [sp, #0x60]
    str r1, [sp, #0x5c]
    mov r5, r0
    add r1, sp, #0x5c
    add r2, sp, #0x60
    bl func_ov000_0214f418
    mov r1, r5
    mov r0, r4
    bl func_ov000_021552fc
    add r10, r10, #0x1
    cmp r10, #0x8
    blt .L_021543b8
    mov r11, #0x1
    ldr r6, .L_02154c64
    mov r10, #0x0
    mov r5, r11
    mov r4, #0x18
.L_02154628:
    mla r8, r10, r4, r6
    ldrb r9, [r8, #0xc]
    add r0, r7, r10, lsl #0x2
    ldr r0, [r0, #0x34]
    add r1, r7, r9, lsl #0x2
    ldr r1, [r1, #0x34]
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    bne .L_02154660
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x164]
    blx r2
    b .L_02154674
.L_02154660:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, r11
    blx r3
.L_02154674:
    add r0, r7, r9, lsl #0x2
    ldr r1, [r0, #0x34]
    add r0, r7, r10, lsl #0x2
    ldr r0, [r0, #0x34]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_021546a4
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x164]
    blx r2
    b .L_021546b8
.L_021546a4:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x2
    blx r3
.L_021546b8:
    ldrb r1, [r8, #0xd]
    add r0, r7, r10, lsl #0x2
    ldr r0, [r0, #0x34]
    add r1, r7, r1, lsl #0x2
    ldr r1, [r1, #0x34]
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    bne .L_021546ec
    ldr r2, [r0, #0x0]
    mov r1, #0x8
    ldr r2, [r2, #0x164]
    blx r2
    b .L_02154700
.L_021546ec:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x8
    blx r3
.L_02154700:
    ldrb r1, [r8, #0xe]
    add r0, r7, r10, lsl #0x2
    ldr r0, [r0, #0x34]
    add r1, r7, r1, lsl #0x2
    ldr r1, [r1, #0x34]
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    bne .L_02154734
    ldr r2, [r0, #0x0]
    mov r1, #0x4
    ldr r2, [r2, #0x164]
    blx r2
    b .L_02154748
.L_02154734:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x4
    blx r3
.L_02154748:
    add r10, r10, #0x1
    cmp r10, #0x8
    blt .L_02154628
    ldr r0, [r7, #0x50]
    ldr r2, .L_02154c9c
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r5, .L_02154ca0
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    mov r0, #0x60
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r1, #0x530000
    str r1, [sp, #0x8]
    ldr r3, [r7, #0x2c]
    mov r2, r5
    mov r0, r7
    bl func_ov000_021554fc
    mov r4, r0
    str r4, [r7, #0x54]
    mov r0, #0xd000
    str r0, [sp, #0x70]
    ldr r1, .L_02154c70
    ldr r2, .L_02154c74
    mov r0, #0x10
    mov r3, #0xd7
    add r6, sp, #0x70
    bl func_0201a21c
    movs r1, r0
    beq .L_021547e4
    ldr r6, [r6, #0x0]
    ldr r3, .L_02154c78
    add r2, sp, #0x34
    mov r1, #0x0
    str r6, [sp, #0x34]
    blx func_ov012_021b0f78
    mov r1, r0
.L_021547e4:
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_02154ca4
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    ldr r1, [r5, #0x8]
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    ldr r1, .L_02154ca8
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    ldr r2, .L_02154cac
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    strb r2, [r0, #0xab]
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r4, .L_02154cb0
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    mov r0, #0x61
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x510000
    str r0, [sp, #0x8]
    ldr r1, [r4, #0x8]
    ldr r3, [r7, #0x2c]
    mov r0, r7
    mov r2, r4
    bl func_ov000_021554fc
    mov r4, r0
    str r4, [r7, #0x58]
    mvn r0, #0x2f
    strh r0, [sp, #0x68]
    add r0, r0, #0x20
    strh r0, [sp, #0x6a]
    mov r0, #0x0
    ldr r1, .L_02154cb4
    ldr r2, .L_02154cb8
    ldr r3, .L_02154cbc
    strh r0, [sp, #0x6c]
    strh r0, [sp, #0x6e]
    mov r0, #0x70
    add r6, sp, #0x68
    bl func_0201a21c
    movs r5, r0
    beq .L_021548f0
    ldr r2, .L_02154c78
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_02154cc0
    mov r1, r6
    add r0, r5, #0x68
    str r2, [r5, #0x0]
    bl func_ov000_0215115c
    ldr r0, .L_02154cc4
    str r0, [r5, #0x0]
.L_021548f0:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0215490c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215490c:
    ldr r1, [r5, #0x18]
    mov r0, r4
    bl func_02020e98
    ldr r0, [r4, #0x4]
    ldr r2, .L_02154cc8
    mov r1, #0x4
    blx func_ov012_021b6760
    ldr r0, [r4, #0x4]
    ldr r1, .L_02154ccc
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    blx func_ov012_021b4034
    mov r3, #0x1
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    strb r3, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    strb r2, [r0, #0xab]
    ldr r0, [r4, #0x4]
    strb r3, [r0, #0xb1]
    ldr r0, [r4, #0x4]
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x78
    ldr r1, .L_02154cd0
    ldr r2, .L_02154cd4
    ldr r3, .L_02154cd8
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021549a8
    ldr r1, .L_02154cdc
    mov r2, #0x1
    bl func_02024064
.L_021549a8:
    bl func_ov000_0214ed84
    str r0, [r7, #0x28]
    ldr r0, [r0, #0x4]
    ldr r1, .L_02154ce0
    bl func_02028384
    ldr r0, [r7, #0x28]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0xe0000
    str r0, [sp, #0xa8]
    ldr r0, [r7, #0x28]
    add r1, sp, #0xa8
    bl func_ov000_0214eed0
    mov r0, #0x2000
    str r0, [r7, #0x80]
    ldr r0, [r7, #0x20]
    ldr r1, [r7, #0x28]
    bl func_ov000_0214f3e0
    bl func_0203b404
    ldr r1, [r0, #0x88]
    mov r0, #0x520000
    mov r2, #0xe0
    mov r3, r0
    bl func_ov000_02155334
    mov r4, r0
    ldr r0, [r7, #0x28]
    mov r1, r4
    bl func_ov000_021552fc
    ldr r1, [r7, #0x28]
    mov r0, r4
    bl func_ov000_0214f3e0
    mov r0, #0xb8000
    str r0, [sp, #0xa0]
    mov r0, #0x104000
    str r0, [sp, #0xa4]
    mov r0, r4
    add r1, sp, #0xa4
    add r2, sp, #0xa0
    bl func_ov000_0214f418
    ldr r2, .L_02154ce4
    mov r0, r4
    add r1, sp, #0x9c
    str r2, [sp, #0x9c]
    bl func_ov000_02151054
    bl func_0203b404
    ldr r1, [r0, #0x88]
    ldr r0, .L_02154ce8
    mov r2, #0xe0
    mov r3, #0x520000
    bl func_ov000_02155334
    mov r4, r0
    ldr r0, [r7, #0x28]
    mov r1, r4
    bl func_ov000_021552fc
    ldr r1, [r7, #0x28]
    mov r0, r4
    bl func_ov000_0214f3e0
    mov r0, #0xeb000
    str r0, [sp, #0x94]
    mov r3, #0x9f000
    add r1, sp, #0x98
    add r2, sp, #0x94
    mov r0, r4
    str r3, [sp, #0x98]
    bl func_ov000_0214f418
    ldr r2, .L_02154ce4
    add r1, sp, #0x90
    mov r0, r4
    str r2, [sp, #0x90]
    bl func_ov000_02151054
    bl func_0203b404
    ldr r1, [r0, #0x88]
    ldr r0, .L_02154cec
    mov r2, #0xe0
    mov r3, #0x520000
    bl func_ov000_02155334
    mov r4, r0
    ldr r0, [r7, #0x28]
    mov r1, r4
    bl func_ov000_021552fc
    ldr r1, [r7, #0x28]
    mov r0, r4
    bl func_ov000_0214f3e0
    mov r1, #0x60000
    str r1, [sp, #0x88]
    mov r1, #0x100000
    str r1, [sp, #0x8c]
    mov r0, r4
    add r1, sp, #0x8c
    add r2, sp, #0x88
    bl func_ov000_0214f418
    bl func_0203b404
    ldr r1, [r0, #0x88]
    ldr r0, .L_02154cf0
    mov r2, #0xe0
    mov r3, #0x520000
    bl func_ov000_02155334
    mov r4, r0
    ldr r0, [r7, #0x28]
    mov r1, r4
    bl func_ov000_021552fc
    ldr r1, [r7, #0x28]
    mov r0, r4
    bl func_ov000_0214f3e0
    mov r0, #0x48000
    str r0, [sp, #0x80]
    mov r0, #0xc0000
    str r0, [sp, #0x84]
    mov r0, r4
    add r1, sp, #0x84
    add r2, sp, #0x80
    bl func_ov000_0214f418
    ldr r0, [r7, #0x20]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r0, [r0, #0x20]
    bl func_ov000_0214d908
    bl func_02034db8
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x64]
    blx r1
    bl func_ov000_02150ff4
    ldr r1, .L_02154cf4
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x68]
    mov r0, r4
    bl func_ov000_02151094
    ldr r1, .L_02154cf8
    mov r2, #0x80
    bl func_0206afd0
    str r0, [r7, #0x6c]
    mov r0, #0x0
    sub r1, r0, #0x1
    mov r2, #0x1
    mov r3, r1
    blx func_ov012_021bcf1c
    str r0, [r7, #0x60]
    mov r0, #0x0
    mov r1, #0x1
    mov r2, r1
    bl func_ov012_021ba49c
    str r0, [r7, #0x70]
    bl func_020758f4
    str r0, [r7, #0x78]
    ldr r0, .L_02154cfc
    ldr r0, [r0, #0x8d8]
    tst r0, #0x8
    beq .L_02154f7c
    mvn r0, #0x0
    str r0, [sp, #0x30]
    mov r5, #0x6
    b .L_02154f74
.L_02154c1c: .word data_ov000_02161258
.L_02154c20: .word data_ov000_0216113c
.L_02154c24: .word data_02093c04
.L_02154c28: .word data_020a0e80
.L_02154c2c: .word data_020a16c0
.L_02154c30: .word func_ov000_0215500c
.L_02154c34: .word data_ov000_02161084
.L_02154c38: .word data_ov000_0216107c
.L_02154c3c: .word data_ov000_02161074
.L_02154c40: .word data_ov000_02161154
.L_02154c44: .word data_ov000_0216105c
.L_02154c48: .word 0x1de
.L_02154c4c: .word func_ov000_021556c8
.L_02154c50: .word func_ov000_02155800
.L_02154c54: .word data_ov012_021d5154
.L_02154c58: .word 0x31305053
.L_02154c5c: .word 0x8df
.L_02154c60: .word data_ov000_02161264
.L_02154c64: .word data_ov000_0216003c
.L_02154c68: .word func_ov000_02155b94
.L_02154c6c: .word func_ov000_02155c54
.L_02154c70: .word data_ov000_02161164
.L_02154c74: .word data_ov000_02161054
.L_02154c78: .word data_02093c8c
.L_02154c7c: .word func_ov000_02155a24
.L_02154c80: .word func_ov000_02155b28
.L_02154c84: .word 0x111e
.L_02154c88: .word data_ov000_0216126c
.L_02154c8c: .word data_ov000_02161174
.L_02154c90: .word data_ov000_02161044
.L_02154c94: .word 0x2b9
.L_02154c98: .word 0x494c
.L_02154c9c: .word func_ov000_02155c8c
.L_02154ca0: .word data_ov000_02160024
.L_02154ca4: .word func_ov000_02155c30
.L_02154ca8: .word 0x530001
.L_02154cac: .word func_ov000_02155b74
.L_02154cb0: .word data_ov000_02160030
.L_02154cb4: .word data_ov000_02160d5c
.L_02154cb8: .word data_ov000_0216103c
.L_02154cbc: .word 0x1b2
.L_02154cc0: .word data_ov000_02160db0
.L_02154cc4: .word data_ov012_021d1c58
.L_02154cc8: .word func_ov000_02155c00
.L_02154ccc: .word 0x510001
.L_02154cd0: .word data_ov000_02161148
.L_02154cd4: .word data_ov000_0216106c
.L_02154cd8: .word 0x4c3
.L_02154cdc: .word func_02024a30
.L_02154ce0: .word func_ov000_02155890
.L_02154ce4: .word 0xb33
.L_02154ce8: .word 0x520001
.L_02154cec: .word 0x520002
.L_02154cf0: .word 0x520003
.L_02154cf4: .word data_ov000_02161274
.L_02154cf8: .word data_ov000_0216128c
.L_02154cfc: .word data_020b02b8
    andeqs r1, r6, #0x4000000a
    andeqs r1, r6, #0x8000000b
.L_02154d08:
    ldr r0, [r7, #0x78]
    add r2, sp, #0x30
    mov r1, r5
    bl #-0xdf308
    cmp r0, #0x0
    beq #0x254
    ldr r9, [sp, #0x30]
    ldr r0, .L_02154cfc
    mov r1, r9, lsr #0x5
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0xa70]
    and r1, r9, #0x1f
    mov r2, #0x1
    tst r0, r2, lsl r1
    movne r0, #0x0
    bne #0x21c
    mov r0, r9
    blx #-0xe35fc
    ldr r0, [pc, #-0x58]
    mov r1, #0x0
    blx #-0x144b64
    str r0, [sp, #0x24]
    mov r1, #0x0
    ldr r0, [pc, #-0x68]
    mov r2, r1
    bl #-0x12195c
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne #0x10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    ldr r4, [r4, #0x1c]
    mov r1, #0x0
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r8, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r8, #0x8]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r6, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r8, #0xc]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x4]
    ldr r1, [r8, #0x10]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x4]
    ldr r1, [r8, #0x14]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r1, #0x3c
    mla r1, r9, r1, r6
    mvn r2, #0x0
    mov r3, #0x0
    ldrb lr, [r1, #0x2c]
    str r2, [sp, #0x2c]
    b #0x118
    add r2, r1, r3
    ldrb r9, [r2, #0x2d]
    ldr r2, [sp, #0x18]
    mov r8, #0x48
    mla r2, r9, r8, r2
    mov r6, #0x0
    str r2, [sp, #0x20]
    ldrb r10, [r2, #0x44]
    b #0xe8
    ldr r2, [sp, #0x20]
    mov r8, #0x0
    add r2, r2, r6
    ldrb r9, [r2, #0x38]
    ldr r2, [sp, #0x14]
    add r2, r2, r9, lsl #0x6
    str r2, [sp, #0x1c]
    ldrb r11, [r2, #0x30]
    b #0xb8
    ldr r2, [sp, #0x1c]
    mov r9, #0x88
    add r2, r2, r8
    ldrb r2, [r2, #0x31]
    mla r9, r2, r9, r0
    ldrb ip, [r9, #0xb]
    cmp ip, #0x5
    bls #0x94
    ldr ip, .L_02154cfc
    add r2, ip, r2
    add r2, r2, #0x3000
    ldrb r2, [r2, #0xdcc]
    tst r2, #0x20
    movne r2, #0x1
    moveq r2, #0x0
    cmp r2, #0x0
    bne #0x70
    ldrsh r9, [r9, #0x76]
    ldr r2, [sp, #0x2c]
    cmp r9, r2
    beq #0x60
    and r2, r9, #0x1f
    mov ip, r9, lsr #0x5
    ldr r9, .L_02154cfc
    add r9, r9, ip, lsl #0x2
    ldr ip, [r9, #0x8f4]
    mov r9, #0x1
    tst ip, r9, lsl r2
    movne r2, r9
    moveq r2, #0x0
    cmp r2, #0x0
    bne #0x34
    add r0, r7, #0x85
    bl #-0xe0eec
    ldr r0, [sp, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x1
    b #0x4c
    add r8, r8, #0x1
    cmp r8, r11
    blt #-0xb8
    add r6, r6, #0x1
    cmp r6, r10
    blt #-0xe8
    add r3, r3, #0x1
    cmp r3, lr
    blt #-0x118
    ldr r0, [sp, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r7, #0x84]
    bne .L_02154f7c
    add r5, r5, #0x1
.L_02154f74:
    cmp r5, #0xa
    ble .L_02154d08
.L_02154f7c:
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    mov r0, #0x2
    bl func_020734e0
    mov r0, #0x2
    mov r1, #0x0
    bl func_0207361c
    ldr r0, [r7, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldrb r0, [r7, #0x84]
    cmp r0, #0x0
    bne .L_02154fd0
    ldr r0, [r7, #0x30]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_02154fd0:
    ldr r0, [r7, #0x7c]
    mov r1, #0x1
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r1, [r7, #0x7c]
    mov r0, r7
    bl func_ov000_02155c68
    blx func_ov012_021b65bc
    bl func_ov000_02155cb4
    str r0, [r7, #0x74]
    ldr r0, [r7, #0x0]
    add sp, sp, #0xdc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov000_02153cfc

    .global func_ov000_0215500c
    arm_func_start func_ov000_0215500c
func_ov000_0215500c: ; 0x0215500c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0x84]
    cmp r0, #0x0
    beq .L_02155044
    ldr r0, [r5, #0x4]
    ldr r1, .L_02155058
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_02155044:
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, pc}
.L_02155058: .word func_ov000_0215505c
    arm_func_end func_ov000_0215500c

    .global func_ov000_0215505c
    arm_func_start func_ov000_0215505c
func_ov000_0215505c: ; 0x0215505c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    str r3, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r0, [r4, #0x70]
    add r2, r4, #0x85
    mov r1, #0xc
    bl func_ov012_021bac78
    mov r0, #0x78
    mov r1, #0x9
    bl func_0207342c
    ldr r6, .L_02155128
    b .L_021550c4
.L_021550bc:
    ldr r0, [r6, #0x0]
    blx r0
.L_021550c4:
    ldr r0, [r4, #0x70]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_021550bc
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x30]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x30]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r5, #0x4]
    bl func_020282f4
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02155128: .word data_020a0e18
    arm_func_end func_ov000_0215505c

    .global func_ov000_0215512c
    arm_func_start func_ov000_0215512c
func_ov000_0215512c: ; 0x0215512c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq .L_02155154
    bl func_ov000_0215608c
.L_02155154:
    bl func_020735e4
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_02155170
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02155170:
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_02155180
    bl func_0207597c
.L_02155180:
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    beq .L_02155190
    bl func_ov012_021bab64
.L_02155190:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_021551a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021551a8:
    ldr r0, .L_021552e8
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_021551cc
    blx func_ov012_021bd500
.L_021551cc:
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq .L_021551dc
    bl func_0206ae98
.L_021551dc:
    mov r5, #0x0
.L_021551e0:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x68]
    cmp r0, #0x0
    beq .L_021551f4
    bl func_0206b138
.L_021551f4:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_021551e0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02155218
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02155218:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_02155230
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02155230:
    mov r5, #0x0
.L_02155234:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_02155250
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02155250:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02155234
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_0215526c
    bl func_02034d7c
.L_0215526c:
    mov r5, #0x0
.L_02155270:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_0215528c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215528c:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_02155270
    blx func_ov012_021b65cc
    ldr r1, .L_021552ec
    ldr r2, .L_021552f0
    ldr r3, [r1, #0x0]
    ldr r0, .L_021552f4
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r4, #0x7c]
    ldr r0, .L_021552f8
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
.L_021552e8: .word data_ov012_021d5154
.L_021552ec: .word data_02093c04
.L_021552f0: .word data_020a16c0
.L_021552f4: .word data_020a0e80
.L_021552f8: .word data_020afcb0
    arm_func_end func_ov000_0215512c

    .global func_ov000_021552fc
    arm_func_start func_ov000_021552fc
func_ov000_021552fc: ; 0x021552fc
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
    arm_func_end func_ov000_021552fc

    .global func_ov000_02155334
    arm_func_start func_ov000_02155334
func_ov000_02155334: ; 0x02155334
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r4, r3
    mov r0, r1
    mov r5, r2
    bl func_ov000_0214ed48
    cmp r4, #0x0
    beq .L_02155368
    mov r0, r4
    bl func_020329ec
    bl func_ov000_0214ed84
    b .L_02155370
.L_02155368:
    bl func_020329d4
    bl func_ov000_0214ed84
.L_02155370:
    mov r4, r0
    ldr r2, [r4, #0x4]
    ldr r3, .L_021553e4
    add r1, sp, #0x0
    str r3, [r2, #0x54]
    mov r2, r5, lsl #0xc
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov000_0214eed0
    cmp r6, #0x0
    beq .L_021553c0
    ldr r0, [r4, #0x4]
    mov r1, r6
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
.L_021553c0:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov000_0214edac
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021553e4: .word 0x31305053
    arm_func_end func_ov000_02155334

    .global func_ov000_021553e8
    arm_func_start func_ov000_021553e8
func_ov000_021553e8: ; 0x021553e8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02155408
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02155408:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021553e8

    .global func_ov000_02155410
    arm_func_start func_ov000_02155410
func_ov000_02155410: ; 0x02155410
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r1
    ldr ip, .L_021554e8
    mov r6, r0
    ldr r1, .L_021554ec
    ldr r2, .L_021554f0
    ldr r3, .L_021554f4
    mov r0, #0x14c
    ldr r4, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02155454
    ldr r3, .L_021554f8
    mov r2, r4
    mov r1, #0x0
    blx func_ov012_021b7950
.L_02155454:
    bl func_ov000_0214ed84
    mov r4, r0
    movs r1, #0x0
    bne .L_02155470
    ldr r0, [r4, #0x4]
    blx func_ov012_021b5898
    b .L_02155480
.L_02155470:
    mov r1, #0x4
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_02155480:
    mov r2, #0x80000
    add r1, sp, #0x0
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    cmp r5, #0x0
    beq .L_021554bc
    mov r0, r4
    mov r1, r5
    blx func_ov012_021b3ba4
.L_021554bc:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021554e8: .word data_ov012_021d5154
.L_021554ec: .word data_ov000_02160d80
.L_021554f0: .word data_ov000_0216104c
.L_021554f4: .word 0x2a6
.L_021554f8: .word func_ov000_021510bc
    arm_func_end func_ov000_02155410

    .global func_ov000_021554fc
    arm_func_start func_ov000_021554fc
func_ov000_021554fc: ; 0x021554fc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    mov r7, r1
    mov r6, r2
    mov r10, r3
    mov r8, r0
    ldr r1, [sp, #0x30]
    ldr r2, [sp, #0x34]
    ldr r3, [sp, #0x38]
    mov r0, #0x0
    bl func_ov000_02155334
    mov r4, r0
    cmp r10, #0x0
    mov r0, #0x134
    mov r3, #0x3e
    beq .L_02155578
    ldr r5, .L_02155684
    ldr r1, .L_02155688
    ldr r9, [r5, #0x0]
    ldr r2, .L_0215568c
    ldr r5, [r10, #0x4]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215556c
    ldr r3, .L_02155690
    mov r1, r5
    mov r2, r9
    blx func_ov012_021af0f8
.L_0215556c:
    bl func_ov000_0214ed84
    mov r5, r0
    b .L_021555ac
.L_02155578:
    ldr r5, .L_02155684
    ldr r1, .L_02155688
    ldr r2, .L_0215568c
    ldr r5, [r5, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021555a4
    ldr r3, .L_02155690
    mov r2, r5
    mov r1, #0x0
    blx func_ov012_021af0f8
.L_021555a4:
    bl func_ov000_0214ed84
    mov r5, r0
.L_021555ac:
    ldr r2, [sp, #0x34]
    ldr r3, [r4, #0x4]
    ldr ip, .L_02155694
    add r1, sp, #0x8
    mov r0, r5
    str ip, [r3, #0x54]
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x8]
    bl func_ov000_0214eed0
    mov r0, r5
    mov r1, r4
    bl func_ov000_021552fc
    ldr r0, [r5, #0x4]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, r7
    blx func_ov012_021b3f78
    ldr r0, [r5, #0x4]
    mov r1, r7
    blx func_ov012_021b3fb0
    ldr r0, [r5, #0x4]
    mov r1, r7
    blx func_ov012_021b3fc4
    ldr r0, [r5, #0x4]
    mov r1, r7
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r1, [r6, #0x4]
    mov r0, r5
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r2, [r6, #0x0]
    add r1, sp, #0x4
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x4]
    add r2, sp, #0x0
    bl func_ov000_0214f418
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_02155684: .word data_ov012_021d5154
.L_02155688: .word data_ov000_02160d3c
.L_0215568c: .word data_ov000_02161064
.L_02155690: .word func_ov000_021510bc
.L_02155694: .word 0x31305053
    arm_func_end func_ov000_021554fc

    .global func_ov000_02155698
    arm_func_start func_ov000_02155698
func_ov000_02155698: ; 0x02155698
    mov r0, #0x1
    bx lr
    arm_func_end func_ov000_02155698

    .global func_ov000_021556a0
    arm_func_start func_ov000_021556a0
func_ov000_021556a0: ; 0x021556a0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_021556c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021556c0:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021556a0

    .global func_ov000_021556c8
    arm_func_start func_ov000_021556c8
func_ov000_021556c8: ; 0x021556c8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x50
    mov r4, r0
    bl func_0203b404
    ldr r1, [r0, #0x88]
    ldr r0, .L_021557e0
    mov r2, #0x80
    mov r3, #0x0
    bl func_ov000_02155334
    mov r1, r0
    ldr r2, [r1, #0x4]
    ldr r3, .L_021557e4
    mov r0, r4
    str r3, [r2, #0x54]
    bl func_ov000_021552fc
    mov r0, #0x81000
    str r0, [sp, #0x34]
    mov r0, r4
    add r1, sp, #0x34
    bl func_ov000_0214eed0
    ldr r1, .L_021557e8
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r1, [sp, #0x1c]
    str r1, [sp, #0x18]
    add r0, sp, #0x38
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov000_02151038
    mov r0, #0x1000
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    mov r0, #0x0
    str r0, [sp, #0x20]
    add r0, sp, #0x44
    add r1, sp, #0x28
    add r2, sp, #0x24
    add r3, sp, #0x20
    add r6, sp, #0x38
    bl func_ov000_02151038
    ldr r2, .L_021557ec
    add r0, sp, #0x2c
    mov r1, r4
    add r5, sp, #0x44
    bl func_ov000_02150d54
    ldr r1, .L_021557f0
    ldr r2, .L_021557f4
    ldr r3, .L_021557f8
    mov r0, #0x4c
    ldr r7, [sp, #0x30]
    ldr r8, [sp, #0x2c]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021557c8
    ldr r2, .L_021557fc
    mov r1, #0x1e
    stmia sp, {r2, r5, r6}
    str r1, [sp, #0xc]
    mov r1, #0x0
    mov r2, r8
    mov r3, r7
    str r1, [sp, #0x10]
    bl func_02013264
.L_021557c8:
    bl func_ov000_021556a0
    mov r1, r0
    mov r0, r4
    bl func_02020f38
    add sp, sp, #0x50
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021557e0: .word 0x500024
.L_021557e4: .word 0x31305053
.L_021557e8: .word 0x111e
.L_021557ec: .word data_ov000_0216126c
.L_021557f0: .word data_ov000_02161174
.L_021557f4: .word data_ov000_02161044
.L_021557f8: .word 0x2b9
.L_021557fc: .word 0x494c
    arm_func_end func_ov000_021556c8

    .global func_ov000_02155800
    arm_func_start func_ov000_02155800
func_ov000_02155800: ; 0x02155800
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    cmp r1, #0x0
    ldr r5, [r4, #0x4]
    beq .L_02155840
    ldrsh r3, [r5, #0xa2]
    add r1, sp, #0xc
    add r2, sp, #0x8
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x8]
    ldrsh r3, [r5, #0xa0]
    mov r3, r3, lsl #0xc
    str r3, [sp, #0xc]
    bl func_ov000_0214f418
    b .L_02155874
.L_02155840:
    mov r0, #0x78
    mov r1, #0x3
    bl func_0207342c
    ldrsh r0, [r5, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r5, #0xa0]
    mov r0, r4
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov000_0214f418
.L_02155874:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_02155888
    bl func_ov000_0214ed84
.L_02155888:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_02155800

    .global func_ov000_02155890
    arm_func_start func_ov000_02155890
func_ov000_02155890: ; 0x02155890
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x80]
    add r0, r0, #0x1b
    str r0, [r4, #0x80]
    cmp r0, #0x10000
    ldrgt r0, [r4, #0x80]
    subgt r0, r0, #0x10000
    strgt r0, [r4, #0x80]
    ldr r1, [r4, #0x80]
    add r0, sp, #0x0
    bl func_ov000_021559dc
    add r0, sp, #0x0
    ldr r0, [r0, #0x0]
    bl func_0200c954
    ldr r1, .L_021559b4
    bl func_0200c5ac
    bl func_0200c85c
    blx func_02009838
    bl func_0200b6c4
    mov r1, r0
    ldr r0, .L_021559b4
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x8]
    add r0, sp, #0xc
    mov r1, #0x64
    add r2, sp, #0x8
    bl func_ov000_021559bc
    mov r2, #0x60000
    ldr r1, [sp, #0xc]
    rsb r2, r2, #0x0
    add r1, r2, r1
    str r1, [sp, #0x10]
    ldr r1, [r4, #0x80]
    add r0, sp, #0x4
    bl func_ov000_021559dc
    add r0, sp, #0x4
    ldr r0, [r0, #0x0]
    bl func_0200c954
    ldr r1, .L_021559b4
    bl func_0200c5ac
    bl func_0200c85c
    blx func_02009c54
    bl func_0200b6c4
    mov r1, r0
    ldr r0, .L_021559b4
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [sp, #0x14]
    add r0, sp, #0x18
    add r2, sp, #0x14
    mvn r1, #0x63
    bl func_ov000_021559bc
    add r0, sp, #0x18
    ldr r0, [r0, #0x0]
    bl func_0200c954
    ldr r1, .L_021559b8
    bl func_0200c9e4
    bl func_0200c8e0
    mov r1, #0x40000
    rsb r1, r1, #0x0
    add r0, r1, r0
    str r0, [sp, #0x1c]
    mov r0, r5
    add r1, sp, #0x1c
    add r2, sp, #0x10
    bl func_ov000_0214f418
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_021559b4: .word 0x45800000
.L_021559b8: .word 0x3f19999a
    arm_func_end func_ov000_02155890

    .global func_ov000_021559bc
    arm_func_start func_ov000_021559bc
func_ov000_021559bc: ; 0x021559bc
    mov r3, r1, lsl #0xc
    str r3, [r0, #0x0]
    ldr r1, [r2, #0x0]
    smull r1, r2, r3, r1
    mov r1, r1, lsr #0xc
    orr r1, r1, r2, lsl #0x14
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov000_021559bc

    .global func_ov000_021559dc
    arm_func_start func_ov000_021559dc
func_ov000_021559dc: ; 0x021559dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, r1, lsl #0x1
    bl func_0200c954
    mov r1, r0
    ldr r0, .L_02155a18
    bl func_0200c9e4
    ldr r1, .L_02155a1c
    bl func_0200c5ac
    mov r1, r0
    ldr r0, .L_02155a20
    bl func_0200c9e4
    bl func_0200c8e0
    str r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02155a18: .word 0x40490fdb
.L_02155a1c: .word 0x47800000
.L_02155a20: .word 0x45800000
    arm_func_end func_ov000_021559dc

    .global func_ov000_02155a24
    arm_func_start func_ov000_02155a24
func_ov000_02155a24: ; 0x02155a24
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r0, [r1, #0x10]
    ldr r1, [r1, #0x124]
    bl func_ov000_02155c68
    mov r1, #0x1000
    mov r0, r5
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    bl func_ov000_02155ae0
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov000_02155ab0
    ldr r1, .L_02155aac
    mov r0, r5
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x34]
    blx r1
    ldr r0, [r4, #0x4]
    bl func_02013aec
    mov r0, r5
    bl func_ov000_02155ae0
    ldr r1, .L_02155aac
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    bl func_02013aec
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02155aac: .word 0x54435049
    arm_func_end func_ov000_02155a24

    .global func_ov000_02155ab0
    arm_func_start func_ov000_02155ab0
func_ov000_02155ab0: ; 0x02155ab0
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r3, [r2, #0x0]
    add r2, sp, #0x0
    str r3, [sp, #0x0]
    ldr r3, [r1, #0x0]
    add r1, sp, #0x4
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02023630
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02155ab0

    .global func_ov000_02155ae0
    arm_func_start func_ov000_02155ae0
func_ov000_02155ae0: ; 0x02155ae0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x154]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov000_021553e8
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02155ae0

    .global func_ov000_02155b08
    arm_func_start func_ov000_02155b08
func_ov000_02155b08: ; 0x02155b08
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    bl func_02023fb0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov000_021556a0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02155b08

    .global func_ov000_02155b28
    arm_func_start func_ov000_02155b28
func_ov000_02155b28: ; 0x02155b28
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r3, #0x1000
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r4, r0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    bl func_ov000_02155ab0
    ldr r1, .L_02155b70
    mov r0, r4
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02155b70: .word 0x54435049
    arm_func_end func_ov000_02155b28

    .global func_ov000_02155b74
    arm_func_start func_ov000_02155b74
func_ov000_02155b74: ; 0x02155b74
    ldr r0, [r0, #0x4]
    ldr ip, .L_02155b90
    ldr r0, [r0, #0x10]
    mov r1, #0x1
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bx ip
.L_02155b90: .word func_ov012_021b6214
    arm_func_end func_ov000_02155b74

    .global func_ov000_02155b94
    arm_func_start func_ov000_02155b94
func_ov000_02155b94: ; 0x02155b94
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov000_02155bb8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02155b94

    .global func_ov000_02155bb8
    arm_func_start func_ov000_02155bb8
func_ov000_02155bb8: ; 0x02155bb8
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    blx func_ov012_021b65bc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02155bfc
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r4, pc}
.L_02155bfc: .word func_ov000_0215512c
    arm_func_end func_ov000_02155bb8

    .global func_ov000_02155c00
    arm_func_start func_ov000_02155c00
func_ov000_02155c00: ; 0x02155c00
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    blx func_ov012_021b65cc
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    mov r1, #0x8
    mov r0, r4
    str r1, [r4, #0x7c]
    bl func_ov000_02155bb8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02155c00

    .global func_ov000_02155c30
    arm_func_start func_ov000_02155c30
func_ov000_02155c30: ; 0x02155c30
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r4, #0x74]
    bl func_ov000_02156180
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02155c30

    .global func_ov000_02155c54
    arm_func_start func_ov000_02155c54
func_ov000_02155c54: ; 0x02155c54
    ldr ip, .L_02155c64
    mov r0, #0x78
    mov r1, #0x2
    bx ip
.L_02155c64: .word func_0207342c
    arm_func_end func_ov000_02155c54

    .global func_ov000_02155c68
    arm_func_start func_ov000_02155c68
func_ov000_02155c68: ; 0x02155c68
    ldr r2, .L_02155c84
    ldr ip, .L_02155c88
    str r1, [r0, #0x7c]
    ldr r1, [r2, r1, lsl #0x2]
    ldr r0, [r0, #0x60]
    mov r2, #0x0
    bx ip
.L_02155c84: .word data_ov000_02161098
.L_02155c88: .word func_ov012_021bd730
    arm_func_end func_ov000_02155c68

    .global func_ov000_02155c8c
    arm_func_start func_ov000_02155c8c
func_ov000_02155c8c: ; 0x02155c8c
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x5c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02155c8c

    .global func_ov000_02155cb4
    arm_func_start func_ov000_02155cb4
func_ov000_02155cb4: ; 0x02155cb4
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    ldr r1, .L_02156018
    ldr r2, .L_0215601c
    mov r0, #0x224
    mov r3, #0x73
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x224
    mov r5, r0
    bl func_020517fc
    ldr r0, .L_02156020
    mov r1, #0x0
    blx func_020101f4
    str r0, [r5, #0x13c]
    bl func_02026f94
    str r0, [r5, #0x124]
    mov r1, #0x80000
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r5, #0x124]
    ldr r1, .L_02156024
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x124]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x0
    mov r1, #0x1
    bl func_02075fbc
    str r0, [r5, #0x134]
    bl func_02076908
    str r0, [r5, #0x138]
    mov r4, #0x0
    str r4, [r5, #0x208]
    b .L_02155da0
.L_02155d60:
    mov r0, r4
    blx func_02071f10
    mov r1, r0
    ldr r0, [r5, #0x138]
    bl func_020769cc
    ldr r0, [r5, #0x138]
    bl func_0207879c
    cmp r0, #0x0
    bne .L_02155d9c
    ldr r0, [r5, #0x208]
    mov r1, r0
    add r0, r0, #0x1
    str r0, [r5, #0x208]
    add r0, r5, r1, lsl #0x2
    str r4, [r0, #0x140]
.L_02155d9c:
    add r4, r4, #0x1
.L_02155da0:
    blx func_02071f54
    cmp r4, r0
    blo .L_02155d60
    ldr r0, [r5, #0x138]
    bl func_02076c18
    ldr r0, [r5, #0x138]
    ldr r1, .L_02156028
    bl func_02076c7c
    ldr r0, [r5, #0x208]
    cmp r0, #0x0
    beq .L_02155dec
    bl func_ov000_02156060
    add r1, r5, r0, lsl #0x2
    str r0, [r5, #0x20c]
    ldr r0, [r1, #0x140]
    blx func_02071f10
    mov r1, r0
    ldr r0, [r5, #0x138]
    bl func_020769cc
.L_02155dec:
    mov r0, #0x0
    strb r0, [r5, #0x21f]
    bl func_0206c244
    ldr r0, .L_0215602c
    mov r1, #0x1
    strb r1, [r0, #0x0]
    bl func_0203b3e4
    ldr r4, [r0, #0x88]
    ldr r3, .L_02156030
    ldr r0, .L_02156034
    ldr r2, [r3, #0x0]
    mov r1, #0x0
    ldr r6, [r4, #0x4]
    ldr ip, [r0, #0x0]
    sub lr, r2, #0x1
    ldr r4, .L_02156038
    str r6, [r0, #0x0]
    ldr r0, .L_0215603c
    mov r2, r1
    str ip, [r4, lr, lsl #0x2]
    str lr, [r3, #0x0]
    blx func_ov012_021caa0c
    mov r4, r0
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    mov r6, r0
    ldr r1, [r6, #0x18]
    cmp r1, #0x0
    bne .L_02155e6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02155e6c:
    ldr r0, [r6, #0x18]
    mov r1, #0x100
    str r0, [r5, #0x130]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x88]
    blx r2
    ldr r0, [r5, #0x130]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x84]
    blx r2
    ldr r0, [r5, #0x130]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    mov r0, #0xb8000
    str r0, [sp, #0x10]
    mov r0, #0x100000
    str r0, [sp, #0x14]
    ldr r0, [r5, #0x130]
    add r1, sp, #0x14
    add r2, sp, #0x10
    bl func_ov000_0214f418
    mov r0, #0x60000
    str r0, [sp, #0xc]
    ldr r0, [r5, #0x130]
    add r1, sp, #0xc
    bl func_ov000_0214eed0
    ldr r0, [r5, #0x130]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x130]
    ldr r1, .L_02156040
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r5, #0x130]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r1, .L_02156030
    ldr r2, .L_02156038
    ldr r3, [r1, #0x0]
    ldr r0, .L_02156034
    ldr r2, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    str r3, [r1, #0x0]
    str r2, [r0, #0x0]
    bl func_02020d90
    str r0, [r5, #0x12c]
    mov r0, #0xb6000
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x12c]
    add r1, sp, #0x8
    add r2, sp, #0x4
    bl func_ov000_0214f418
    ldr r0, [r5, #0x12c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_02026f94
    str r0, [r5, #0x128]
    ldr r0, [r0, #0x4]
    ldr r1, .L_02156044
    bl func_02028384
    ldr r0, [r5, #0x128]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r4, #0x0
    mov r3, #0x20
    mov r2, #0x30
    mov r0, #0x48
.L_02155fe4:
    mla r1, r4, r0, r5
    strh r3, [r1, #0xc]
    strh r2, [r1, #0xe]
    add r1, r5, r4
    strb r4, [r1, #0x218]
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_02155fe4
    mov r0, r5
    bl func_ov000_02156180
    mov r0, r5
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02156018: .word data_ov000_021612f4
.L_0215601c: .word data_ov000_021612cc
.L_02156020: .word data_ov000_02161308
.L_02156024: .word func_ov000_021561d0
.L_02156028: .word data_ov000_02161318
.L_0215602c: .word data_020afc41
.L_02156030: .word data_02093c08
.L_02156034: .word data_020a0dd0
.L_02156038: .word data_020a16d0
.L_0215603c: .word data_ov000_0216131c
.L_02156040: .word func_ov000_021566c8
.L_02156044: .word func_ov000_02156e64
    arm_func_end func_ov000_02155cb4

    .global func_ov000_02156048
    arm_func_start func_ov000_02156048
func_ov000_02156048: ; 0x02156048
    mov r2, #0x0
    str r2, [r0, #0x0]
    ldrh r1, [r1, #0x6]
    mov r1, r1, lsl #0x4
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov000_02156048

    .global func_ov000_02156060
    arm_func_start func_ov000_02156060
func_ov000_02156060: ; 0x02156060
    stmdb sp!, {r4, lr}
    ldr r1, .L_02156088
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r4
    bl func_0200d338
    mov r0, r1
    ldmia sp!, {r4, pc}
.L_02156088: .word data_020a0da8
    arm_func_end func_ov000_02156060

    .global func_ov000_0215608c
    arm_func_start func_ov000_0215608c
func_ov000_0215608c: ; 0x0215608c
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r0, #0x1
    strb r0, [r4, #0x221]
    ldr r5, .L_02156178
    b .L_021560ac
.L_021560a4:
    ldr r0, [r5, #0x0]
    blx r0
.L_021560ac:
    ldrb r0, [r4, #0x220]
    cmp r0, #0x0
    bne .L_021560a4
    ldr r0, .L_0215617c
    mov r1, #0x0
    strb r1, [r0, #0x0]
    bl func_0206c5b4
    ldr r0, [r4, #0x130]
    cmp r0, #0x0
    beq .L_021560e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_021560e0:
    ldr r0, [r4, #0x138]
    cmp r0, #0x0
    beq .L_021560f0
    bl func_0207698c
.L_021560f0:
    ldr r0, [r4, #0x134]
    cmp r0, #0x0
    beq .L_02156100
    bl func_020763e0
.L_02156100:
    mov r6, #0x0
    mov r5, #0x48
    b .L_02156118
.L_0215610c:
    mla r0, r6, r5, r4
    bl func_ov000_02156918
    add r6, r6, #0x1
.L_02156118:
    ldr r0, [r4, #0x214]
    cmp r6, r0
    blt .L_0215610c
    ldr r0, [r4, #0x128]
    cmp r0, #0x0
    beq .L_0215613c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215613c:
    ldr r0, [r4, #0x12c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x124]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x13c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, r5, r6, pc}
.L_02156178: .word data_020a0e18
.L_0215617c: .word data_020afc41
    arm_func_end func_ov000_0215608c

    .global func_ov000_02156180
    arm_func_start func_ov000_02156180
func_ov000_02156180: ; 0x02156180
    stmdb sp!, {r3, lr}
    mov ip, #0x0
    mov r3, ip
    mov r1, #0x48
    b .L_021561a0
.L_02156194:
    mla r2, ip, r1, r0
    strb r3, [r2, #0x35]
    add ip, ip, #0x1
.L_021561a0:
    ldr r2, [r0, #0x214]
    cmp ip, r2
    blt .L_02156194
    mov r1, #0x1
    strb r1, [r0, #0x21e]
    ldr r0, [r0, #0x124]
    ldr r1, .L_021561c8
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldmia sp!, {r3, pc}
.L_021561c8: .word func_ov000_02156378
    arm_func_end func_ov000_02156180

    .global func_ov000_021561cc
    arm_func_start func_ov000_021561cc
func_ov000_021561cc: ; 0x021561cc
    bx lr
    arm_func_end func_ov000_021561cc

    .global func_ov000_021561d0
    arm_func_start func_ov000_021561d0
func_ov000_021561d0: ; 0x021561d0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    ldr r0, [r0, #0x4]
    mov r6, #0x0
    ldr r7, [r0, #0x10]
    add r11, sp, #0x0
    mov r8, r7
    ldr r9, [r7, #0x214]
    add r5, sp, #0x8
    add r4, sp, #0x10
    b .L_021562c0
.L_021561fc:
    ldr r0, [r8, #0x4]
    ldr r2, [r8, #0x0]
    ldr r10, [r0, #0x8]
    mov r0, r7
    mov r1, r8
    blx r2
    str r6, [r8, #0x10]
    ldr r1, [r8, #0x1c]
    mov r0, r10
    mov r1, r1, asr #0x3
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x4]
    ldr r2, [r8, #0x18]
    mov r1, r11
    mov r2, r2, asr #0x3
    mov r2, r2, lsl #0xc
    str r2, [sp, #0x0]
    add r2, sp, #0x4
    bl func_ov000_0214f418
    ldr r1, [r7, #0x12c]
    add r0, sp, #0xc
    bl func_ov000_0214e27c
    mov r0, r5
    mov r1, r10
    bl func_ov000_0214e27c
    ldr r2, [r5, #0x0]
    ldr r1, [sp, #0xc]
    add r0, sp, #0x14
    add r1, r2, r1
    sub r2, r1, #0x10000
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r1, r1, asr #0xc
    strh r1, [r8, #0x8]
    ldr r1, [r7, #0x12c]
    bl func_ov000_0214e290
    mov r1, r10
    mov r0, r4
    bl func_ov000_0214e290
    ldr r1, [r4, #0x0]
    ldr r0, [sp, #0x14]
    sub r9, r9, #0x1
    add r0, r1, r0
    sub r1, r0, #0x30000
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [r8, #0xa]
    add r8, r8, #0x48
.L_021562c0:
    cmp r9, #0x0
    bne .L_021561fc
    mov r2, r7
    ldr r1, [r7, #0x214]
    mov r4, #0x0
    b .L_02156330
.L_021562d8:
    ldrb r0, [r2, #0x32]
    cmp r0, #0x0
    beq .L_02156328
    add r0, r7, #0x218
    ldrb r3, [r0, r4]
    mov r2, #0x0
    strb r2, [r0, r4]
    b .L_02156318
.L_021562f8:
    cmp r4, r2
    beq .L_02156314
    add r1, r7, r2
    ldrb r0, [r1, #0x218]
    cmp r3, r0
    addgt r0, r0, #0x1
    strgtb r0, [r1, #0x218]
.L_02156314:
    add r2, r2, #0x1
.L_02156318:
    ldr r0, [r7, #0x214]
    cmp r2, r0
    blt .L_021562f8
    b .L_02156338
.L_02156328:
    add r4, r4, #0x1
    add r2, r2, #0x48
.L_02156330:
    cmp r4, r1
    blt .L_021562d8
.L_02156338:
    mov r5, #0x0
    mov r6, r7
    mov r4, r5
    b .L_02156364
.L_02156348:
    strb r4, [r6, #0x32]
    add r0, r7, r5
    ldrb r1, [r0, #0x218]
    mov r0, r6
    bl func_ov000_02156960
    add r5, r5, #0x1
    add r6, r6, #0x48
.L_02156364:
    ldr r0, [r7, #0x214]
    cmp r5, r0
    blt .L_02156348
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov000_021561d0

    .global func_ov000_02156378
    arm_func_start func_ov000_02156378
func_ov000_02156378: ; 0x02156378
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x34
    str r0, [sp, #0x4]
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    ldr r7, [r0, #0x10]
    mov r0, #0x48
    ldr r3, [r7, #0x214]
    b .L_021563b4
.L_0215639c:
    mla r1, r2, r0, r7
    ldrb r1, [r1, #0x44]
    cmp r1, #0x0
    moveq r0, #0x0
    beq .L_021563e8
    add r2, r2, #0x1
.L_021563b4:
    cmp r2, r3
    blt .L_0215639c
    mov r3, #0x0
    mov r2, r3
    mov r0, #0x48
    b .L_021563d8
.L_021563cc:
    mla r1, r3, r0, r7
    strb r2, [r1, #0x44]
    add r3, r3, #0x1
.L_021563d8:
    ldr r1, [r7, #0x214]
    cmp r3, r1
    blt .L_021563cc
    mov r0, #0x1
.L_021563e8:
    cmp r0, #0x0
    beq .L_021566a0
    mov r0, #0x1
    strb r0, [r7, #0x220]
    ldr r0, [r7, #0x208]
    cmp r0, #0x1
    ble .L_0215643c
    ldr r0, [r7, #0x20c]
    b .L_02156414
.L_0215640c:
    ldr r0, [r7, #0x208]
    bl func_ov000_02156060
.L_02156414:
    ldr r1, [r7, #0x20c]
    cmp r1, r0
    beq .L_0215640c
    add r1, r7, r0, lsl #0x2
    str r0, [r7, #0x20c]
    ldr r0, [r1, #0x140]
    blx func_02071f10
    mov r1, r0
    ldr r0, [r7, #0x138]
    bl func_020769cc
.L_0215643c:
    add r0, sp, #0x10
    str r0, [sp, #0x0]
    ldr r0, [r7, #0x138]
    add r1, sp, #0x24
    add r2, sp, #0x14
    add r3, r7, #0x214
    bl func_02078c34
    mov r0, #0x1
    strb r0, [r7, #0x21f]
    mov r5, #0x0
    mov r4, #0x48
.L_02156468:
    mla r0, r5, r4, r7
    bl func_ov000_02156918
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_02156468
    ldr r0, .L_021566b0
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_021566b0
    ldr r0, [r0, #0x0]
    blx r0
    mov r5, #0x0
    ldr r0, .L_021566b4
    mov r1, #0x1000
    str r1, [r0, #0x0]
    mov r11, r5
    mvn r6, #0xff
    b .L_02156670
.L_021564b0:
    ldr r4, [r7, #0x214]
    cmp r5, r4
    bge .L_02156638
    add r0, sp, #0x14
    ldr r9, [r0, r5, lsl #0x2]
    add r0, sp, #0x24
    ldr r10, [r7, #0x12c]
    ldr r8, [r0, r5, lsl #0x2]
    bl func_0203b3e4
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r2, r0
    mov r3, #0x48
    mov r0, r9
    mla r9, r5, r3, r7
    ldr r2, [r2, #0x88]
    mov r1, r8
    mov r3, #0x0
    bl func_02074580
    str r0, [r9, #0x4]
    mov r1, #0x0
    bl func_ov000_021568dc
    ldr r0, [r9, #0x4]
    cmp r10, #0x0
    ldr r8, [r0, #0x8]
    bne .L_02156530
    ldr r0, [r8, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_02156544
.L_02156530:
    ldr r1, [r10, #0x4]
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd4]
    blx r2
.L_02156544:
    mov r0, #0x48
    mla r10, r5, r0, r7
    mov r0, r10
    mov r1, #0x0
    bl func_ov000_02156960
    str r5, [r10, #0x14]
    mov r0, #0x80
    str r0, [r10, #0x18]
    ldr r0, .L_021566b8
    ldr r1, [r0, r4, lsl #0x2]
    mov r0, #0x90
    bl func_0200d12c
    ldr r1, [r10, #0x18]
    mov r0, r0, lsl #0x3
    mla r0, r5, r0, r1
    str r0, [r10, #0x18]
    cmp r0, #0x80
    movlt r0, #0x80
    strlt r0, [r9, #0x18]
    ldr r0, [r9, #0x18]
    mov r1, #0x1
    cmp r0, #0x500
    movgt r0, #0x500
    strgt r0, [r9, #0x18]
    ldr r0, [r10, #0x18]
    cmp r11, #0x0
    str r0, [r10, #0x38]
    ldr r0, [r10, #0x18]
    sub r0, r6, r0
    str r0, [r10, #0x18]
    str r11, [r10, #0x1c]
    strlt r11, [r9, #0x1c]
    ldr r0, [r9, #0x1c]
    cmp r0, #0x400
    movgt r0, #0x400
    strgt r0, [r9, #0x1c]
    mov r0, #0x1
    strb r0, [r10, #0x31]
    ldr r0, .L_021566bc
    str r0, [r10, #0x0]
    ldr r4, [r10, #0x4]
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r2, [r10, #0x1c]
    mov r0, r8
    mov r2, r2, asr #0x3
    mov r2, r2, lsl #0xc
    str r2, [sp, #0xc]
    ldr r3, [r10, #0x18]
    add r1, sp, #0x8
    mov r3, r3, asr #0x3
    mov r3, r3, lsl #0xc
    add r2, sp, #0xc
    str r3, [sp, #0x8]
    bl func_ov000_0214f418
.L_02156638:
    ldrb r0, [r7, #0x221]
    cmp r0, #0x0
    beq .L_0215666c
    ldr r0, .L_021566b4
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r7, #0x124]
    ldr r1, .L_021566c0
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    strb r0, [r7, #0x220]
    b .L_021566a8
.L_0215666c:
    add r5, r5, #0x1
.L_02156670:
    cmp r5, #0x4
    blt .L_021564b0
    ldr r0, .L_021566b4
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r7, #0x124]
    ldr r1, .L_021566c4
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    strb r0, [r7, #0x21e]
    strb r0, [r7, #0x220]
.L_021566a0:
    ldr r0, [sp, #0x4]
    bl func_ov000_021561d0
.L_021566a8:
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021566b0: .word data_020a0e18
.L_021566b4: .word data_020a10a8
.L_021566b8: .word data_ov000_021612e0
.L_021566bc: .word func_ov000_02156d48
.L_021566c0: .word func_ov000_021561cc
.L_021566c4: .word func_ov000_021561d0
    arm_func_end func_ov000_02156378

    .global func_ov000_021566c8
    arm_func_start func_ov000_021566c8
func_ov000_021566c8: ; 0x021566c8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r0, [r4, #0x21f]
    cmp r0, #0x0
    beq .L_021567c8
    ldr r1, [r4, #0x130]
    add r0, sp, #0x1c
    bl func_ov000_0214e27c
    ldr r0, [sp, #0x1c]
    cmp r0, #0x100000
    blt .L_021567c8
    mov r1, #0xb8000
    sub r0, r1, #0x1b8000
    str r1, [sp, #0x14]
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x130]
    add r1, sp, #0x18
    add r2, sp, #0x14
    bl func_ov000_0214f418
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r1, [r4, #0x130]
    ldr r2, .L_021567d0
    add r0, sp, #0xc
    bl func_ov000_02150d54
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r3, #0x1
    str r3, [sp, #0x4]
    ldr r1, .L_021567d4
    add r0, sp, #0xc
    add r2, sp, #0x8
    mov r3, #0xf
    bl func_ov000_021567dc
    mov r1, r0
    ldr r0, [r4, #0x130]
    bl func_02020f38
    ldr r0, [r4, #0x130]
    ldr r5, [r0, #0x4]
    ldr r0, [r5, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r1, [r4, #0x130]
    ldr r0, [r4, #0x138]
    ldr r2, [r1, #0x4]
    add r1, r0, #0xfe
    ldr r0, [r2, #0x64]
    add r1, r1, #0x500
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, #0x0
    strb r0, [r4, #0x21f]
    ldr r0, [r4, #0x130]
    ldr r1, .L_021567d8
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_021567c8:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_021567d0: .word data_ov000_02161330
.L_021567d4: .word 0x494c
.L_021567d8: .word func_ov000_0215683c
    arm_func_end func_ov000_021566c8

    .global func_ov000_021567dc
    arm_func_start func_ov000_021567dc
func_ov000_021567dc: ; 0x021567dc
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr ip, [r2, #0x0]
    ldrb r2, [sp, #0x18]
    str ip, [sp, #0xc]
    str r3, [sp, #0x0]
    ldrb r3, [sp, #0x1c]
    str r2, [sp, #0x4]
    mov r2, r1
    str r3, [sp, #0x8]
    mov r1, r0
    add r3, sp, #0xc
    ldmia r1, {r0, r1}
    bl func_02013bd4
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02156830
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02156830:
    ldr r0, [r4, #0x18]
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021567dc

    .global func_ov000_0215683c
    arm_func_start func_ov000_0215683c
func_ov000_0215683c: ; 0x0215683c
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldrb r0, [r4, #0x21f]
    cmp r0, #0x0
    beq .L_021568c8
    ldr r1, [r4, #0x130]
    add r0, sp, #0x14
    bl func_ov000_0214e27c
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    blt .L_021568c8
    mov r0, #0x100000
    str r0, [sp, #0x8]
    ldr r1, [r4, #0x130]
    ldr r2, .L_021568d0
    add r0, sp, #0xc
    bl func_ov000_02150d54
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r3, #0x1
    str r3, [sp, #0x4]
    ldr r1, .L_021568d4
    add r0, sp, #0xc
    add r2, sp, #0x8
    mov r3, #0xf
    bl func_ov000_021567dc
    mov r1, r0
    ldr r0, [r4, #0x130]
    bl func_02020f38
    ldr r0, [r4, #0x130]
    ldr r1, .L_021568d8
    ldr r0, [r0, #0x4]
    bl func_02028384
.L_021568c8:
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_021568d0: .word data_ov000_02161330
.L_021568d4: .word 0x494c
.L_021568d8: .word func_ov000_021566c8
    arm_func_end func_ov000_0215683c

    .global func_ov000_021568dc
    arm_func_start func_ov000_021568dc
func_ov000_021568dc: ; 0x021568dc
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
    arm_func_end func_ov000_021568dc

    .global func_ov000_02156918
    arm_func_start func_ov000_02156918
func_ov000_02156918: ; 0x02156918
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02156938
    bl func_02074608
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_02156938:
    mov r0, #0x0
    strb r0, [r4, #0x35]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02156918

    .global func_ov000_02156944
    arm_func_start func_ov000_02156944
func_ov000_02156944: ; 0x02156944
    ldrb r1, [r0, #0x31]
    cmp r1, #0x0
    movne r1, #0x0
    strneb r1, [r0, #0x31]
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov000_02156944

    .global func_ov000_02156960
    arm_func_start func_ov000_02156960
func_ov000_02156960: ; 0x02156960
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    add r1, r1, #0x60
    ldr r0, [r0, #0x8]
    mov r2, r1, lsl #0xc
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    bl func_ov000_0214eed0
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02156960

    .global func_ov000_02156984
    arm_func_start func_ov000_02156984
func_ov000_02156984: ; 0x02156984
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_ov000_02156944
    cmp r0, #0x0
    beq .L_021569ac
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_ov000_021568dc
.L_021569ac:
    ldrb r0, [r5, #0x21e]
    cmp r0, #0x0
    movne r1, #0x1
    ldrne r0, .L_02156a14
    strneb r1, [r4, #0x31]
    strne r0, [r4, #0x0]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x10]
    cmp r0, #0x1
    moveq r1, #0x1
    ldreq r0, .L_02156a18
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r0, #0x3
    moveq r1, #0x1
    ldreq r0, .L_02156a1c
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r0, #0x2
    moveq r1, #0x1
    ldreq r0, .L_02156a20
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
.L_02156a14: .word func_ov000_02156cd4
.L_02156a18: .word func_ov000_02156a24
.L_02156a1c: .word func_ov000_02156b74
.L_02156a20: .word func_ov000_02156a84
    arm_func_end func_ov000_02156984

    .global func_ov000_02156a24
    arm_func_start func_ov000_02156a24
func_ov000_02156a24: ; 0x02156a24
    stmdb sp!, {r4, lr}
    mov r4, r1
    mov r0, r4
    bl func_ov000_02156944
    cmp r0, #0x0
    beq .L_02156a48
    ldr r0, [r4, #0x4]
    mov r1, #0x3
    bl func_ov000_021568dc
.L_02156a48:
    ldr r0, [r4, #0x10]
    cmp r0, #0x2
    moveq r1, #0x1
    ldreq r0, .L_02156a7c
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmeqia sp!, {r4, pc}
    cmp r0, #0x0
    moveq r1, #0x1
    ldreq r0, .L_02156a80
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02156a7c: .word func_ov000_02156a84
.L_02156a80: .word func_ov000_02156984
    arm_func_end func_ov000_02156a24

    .global func_ov000_02156a84
    arm_func_start func_ov000_02156a84
func_ov000_02156a84: ; 0x02156a84
    stmdb sp!, {r4, lr}
    mov r4, r1
    mov r0, r4
    bl func_ov000_02156944
    cmp r0, #0x0
    beq .L_02156aa8
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov000_021568dc
.L_02156aa8:
    ldr r0, [r4, #0x10]
    cmp r0, #0x3
    moveq r1, #0x1
    ldreq r0, .L_02156b08
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov000_02156b10
    cmp r0, #0x0
    movne r1, #0x1
    ldrne r0, .L_02156b0c
    strneb r1, [r4, #0x31]
    strne r0, [r4, #0x0]
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    ldreq r0, [r4, #0x28]
    cmpeq r0, #0x0
    moveq r1, #0x1
    ldreq r0, .L_02156b0c
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02156b08: .word func_ov000_02156b74
.L_02156b0c: .word func_ov000_02156984
    arm_func_end func_ov000_02156a84

    .global func_ov000_02156b10
    arm_func_start func_ov000_02156b10
func_ov000_02156b10: ; 0x02156b10
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov000_02156db4
    ldr r0, [r4, #0x18]
    cmp r0, #0x80
    bge .L_02156b40
    mov r0, #0x80
    str r0, [r4, #0x18]
    mov r0, #0x0
    str r0, [r4, #0x28]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02156b40:
    cmp r0, #0x500
    ble .L_02156b60
    mov r0, #0x500
    str r0, [r4, #0x18]
    mov r0, #0x0
    str r0, [r4, #0x28]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02156b60:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02156b10

    .global func_ov000_02156b74
    arm_func_start func_ov000_02156b74
func_ov000_02156b74: ; 0x02156b74
    stmdb sp!, {r4, lr}
    mov r4, r1
    mov r0, r4
    bl func_ov000_02156944
    cmp r0, #0x0
    beq .L_02156ba4
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    bl func_ov000_021568dc
    mov r0, #0x1
    strb r0, [r4, #0x33]
    strb r0, [r4, #0x34]
.L_02156ba4:
    ldr r1, [r4, #0x1c]
    mov r0, r4
    str r1, [r4, #0x20]
    ldr r2, [r4, #0x1c]
    ldr r1, [r4, #0x24]
    add r1, r2, r1
    str r1, [r4, #0x1c]
    ldr r1, [r4, #0x24]
    add r1, r1, #0x5
    str r1, [r4, #0x24]
    bl func_ov000_02156b10
    ldrb r0, [r4, #0x34]
    cmp r0, #0x0
    beq .L_02156c14
    ldr r1, [r4, #0x1c]
    ldr r0, [r4, #0x20]
    sub r0, r1, r0
    cmp r0, #0x0
    ble .L_02156c14
    mov r0, #0x0
    strb r0, [r4, #0x34]
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xfc]
    blx r1
.L_02156c14:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    mov r0, #0x0
    str r0, [r4, #0x1c]
    str r0, [r4, #0x24]
    strb r0, [r4, #0x33]
    mov r1, #0x1
    ldr r0, .L_02156c44
    strb r1, [r4, #0x31]
    str r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02156c44: .word func_ov000_02156c48
    arm_func_end func_ov000_02156b74

    .global func_ov000_02156c48
    arm_func_start func_ov000_02156c48
func_ov000_02156c48: ; 0x02156c48
    stmdb sp!, {r4, lr}
    mov r4, r1
    mov r0, r4
    bl func_ov000_02156944
    cmp r0, #0x0
    beq .L_02156c7c
    ldr r0, [r4, #0x4]
    mov r1, #0x7
    bl func_ov000_021568dc
    mov r0, #0x0
    str r0, [r4, #0x28]
    str r0, [r4, #0x24]
    strb r0, [r4, #0x30]
.L_02156c7c:
    ldrsb r1, [r4, #0x30]
    add r0, r1, #0x1
    strb r0, [r4, #0x30]
    cmp r1, #0x10
    ldmltia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r1, #0x1
    ldreq r0, .L_02156cd0
    streqb r1, [r4, #0x31]
    streq r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02156cd0: .word func_ov000_02156984
    arm_func_end func_ov000_02156c48

    .global func_ov000_02156cd4
    arm_func_start func_ov000_02156cd4
func_ov000_02156cd4: ; 0x02156cd4
    stmdb sp!, {r4, lr}
    mov r4, r1
    mov r0, r4
    bl func_ov000_02156944
    cmp r0, #0x0
    beq .L_02156cf8
    ldr r0, [r4, #0x4]
    mov r1, #0x6
    bl func_ov000_021568dc
.L_02156cf8:
    ldr r1, [r4, #0x1c]
    ldr r0, [r4, #0x24]
    add r0, r1, r0
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x24]
    add r0, r0, #0x5
    str r0, [r4, #0x24]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x880
    ldmleia sp!, {r4, pc}
    mov r0, #0x0
    str r0, [r4, #0x24]
    mov r1, #0x1
    strb r1, [r4, #0x44]
    ldr r0, .L_02156d40
    strb r1, [r4, #0x31]
    str r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02156d40: .word func_ov000_02156d44
    arm_func_end func_ov000_02156cd4

    .global func_ov000_02156d44
    arm_func_start func_ov000_02156d44
func_ov000_02156d44: ; 0x02156d44
    bx lr
    arm_func_end func_ov000_02156d44

    .global func_ov000_02156d48
    arm_func_start func_ov000_02156d48
func_ov000_02156d48: ; 0x02156d48
    stmdb sp!, {r4, lr}
    mov r4, r1
    mov r0, r4
    bl func_ov000_02156944
    cmp r0, #0x0
    beq .L_02156d74
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_ov000_021568dc
    mov r0, #0x50
    str r0, [r4, #0x28]
.L_02156d74:
    mov r0, r4
    bl func_ov000_02156db4
    ldr r1, [r4, #0x38]
    ldr r0, [r4, #0x18]
    cmp r1, r0
    ldmgeia sp!, {r4, pc}
    str r1, [r4, #0x18]
    mov r0, #0x0
    str r0, [r4, #0x28]
    mov r1, #0x1
    ldr r0, .L_02156db0
    strb r1, [r4, #0x31]
    str r0, [r4, #0x0]
    strb r1, [r4, #0x35]
    ldmia sp!, {r4, pc}
.L_02156db0: .word func_ov000_02156984
    arm_func_end func_ov000_02156d48

    .global func_ov000_02156db4
    arm_func_start func_ov000_02156db4
func_ov000_02156db4: ; 0x02156db4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    ldr r0, [r4, #0x28]
    add r0, r1, r0
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    ble .L_02156df8
    bl func_ov000_02156e50
    cmp r0, #0x0
    beq .L_02156e10
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_0207506c
    b .L_02156e10
.L_02156df8:
    bl func_ov000_02156e50
    cmp r0, #0x0
    bne .L_02156e10
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_0207506c
.L_02156e10:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    bge .L_02156e30
    add r0, r0, #0x1
    str r0, [r4, #0x28]
    cmp r0, #0x0
    movgt r0, #0x0
    strgt r0, [r4, #0x28]
.L_02156e30:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    subs r0, r0, #0x1
    str r0, [r4, #0x28]
    movmi r0, #0x0
    strmi r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02156db4

    .global func_ov000_02156e50
    arm_func_start func_ov000_02156e50
func_ov000_02156e50: ; 0x02156e50
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrb r0, [r0, #0x48]
    bx lr
    arm_func_end func_ov000_02156e50

    .global func_ov000_02156e64
    arm_func_start func_ov000_02156e64
func_ov000_02156e64: ; 0x02156e64
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    ldr r1, [r0, #0x4]
    mov r0, #0x0
    ldr r4, [r1, #0x10]
    bl func_020208ec
    mov r11, r0
    ldr r0, [r11, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x128]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x120]
    beq .L_02157108
    ldr r0, [r4, #0x120]
    cmp r0, #0x0
    ldrneb r0, [r0, #0x35]
    cmpne r0, #0x0
    bne .L_02156fcc
    mov r0, #0x0
    bl func_020208ec
    mov r9, r0
    ldr r0, [r9, #0x4]
    mvn r8, #0x0
    ldr r1, [r0, #0x0]
    mov r7, #0x0
    ldr r1, [r1, #0x130]
    blx r1
    cmp r0, #0x0
    beq .L_02156fc8
    mov r6, r7
    b .L_02156fbc
.L_02156ee8:
    mov r0, #0x48
    mla r5, r6, r0, r4
    ldrb r0, [r5, #0x35]
    cmp r0, #0x0
    beq .L_02156fb8
    ldr r1, [r5, #0x4]
    add r0, sp, #0x0
    ldr r10, [r1, #0x8]
    mov r1, r9
    bl func_ov000_0214e27c
    ldrsh r0, [r5, #0x8]
    add r1, sp, #0x0
    bl func_ov000_02157110
    cmp r0, #0x0
    beq .L_02156fb8
    add r0, sp, #0x4
    mov r1, r9
    bl func_ov000_0214e27c
    ldrsh r2, [r5, #0x8]
    ldrsh r1, [r5, #0xc]
    add r0, sp, #0x4
    add r1, r2, r1
    bl func_ov000_02157124
    cmp r0, #0x0
    beq .L_02156fb8
    add r0, sp, #0x8
    mov r1, r9
    bl func_ov000_0214e290
    ldrsh r0, [r5, #0xa]
    add r1, sp, #0x8
    bl func_ov000_02157110
    cmp r0, #0x0
    beq .L_02156fb8
    add r0, sp, #0xc
    mov r1, r9
    bl func_ov000_0214e290
    ldrsh r2, [r5, #0xa]
    ldrsh r1, [r5, #0xe]
    add r0, sp, #0xc
    add r1, r2, r1
    bl func_ov000_02157124
    cmp r0, #0x0
    beq .L_02156fb8
    ldr r1, [r10, #0x4]
    add r0, sp, #0x10
    ldr r1, [r1, #0x64]
    bl func_ov000_02156048
    ldr r0, [sp, #0x10]
    cmp r8, r0, lsr #0xc
    mov r0, r0, lsr #0xc
    movhs r7, r5
    movhs r8, r0
.L_02156fb8:
    add r6, r6, #0x1
.L_02156fbc:
    ldr r0, [r4, #0x214]
    cmp r6, r0
    blt .L_02156ee8
.L_02156fc8:
    str r7, [r4, #0x120]
.L_02156fcc:
    ldr r4, [r4, #0x120]
    cmp r4, #0x0
    beq .L_02157108
    add r0, sp, #0x18
    mov r1, r11
    bl func_ov000_0214e27c
    add r1, sp, #0x18
    ldr r3, [r1, #0x0]
    add r0, sp, #0x14
    mov r2, r3, asr #0xb
    add r2, r3, r2, lsr #0x14
    mov r2, r2, asr #0xc
    mov r1, r11
    strh r2, [r4, #0x2c]
    bl func_ov000_0214e290
    add r0, sp, #0x14
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r0, r0, asr #0xc
    strh r0, [r4, #0x2e]
    strb r1, [r4, #0x32]
    ldrb r0, [r4, #0x33]
    ldrsh r2, [r4, #0x2e]
    ldr r1, [r4, #0x1c]
    ldrsh r3, [r4, #0x2c]
    ldr r5, [r4, #0x18]
    sub r1, r2, r1, asr #0x3
    cmp r0, #0x0
    sub r2, r3, r5, asr #0x3
    sub r0, r1, #0xb6
    beq .L_02157094
    cmp r2, #0x8
    ble .L_02157070
    cmp r5, #0x500
    movlt r0, r2, asr #0x2
    strlt r0, [r4, #0x28]
    movlt r0, #0x2
    strlt r0, [r4, #0x10]
    blt .L_02157108
.L_02157070:
    mvn r0, #0x7
    cmp r2, r0
    bge .L_02157108
    cmp r5, #0x80
    movgt r0, r2, asr #0x2
    strgt r0, [r4, #0x28]
    movgt r0, #0x2
    strgt r0, [r4, #0x10]
    b .L_02157108
.L_02157094:
    cmp r2, #0x8
    ble .L_021570b4
    cmp r5, #0x500
    addlt r0, r2, #0x6
    strlt r0, [r4, #0x28]
    movlt r0, #0x2
    strlt r0, [r4, #0x10]
    blt .L_02157108
.L_021570b4:
    mvn r1, #0x7
    cmp r2, r1
    bge .L_021570d8
    cmp r5, #0x80
    subgt r0, r2, #0x6
    strgt r0, [r4, #0x28]
    movgt r0, #0x2
    strgt r0, [r4, #0x10]
    bgt .L_02157108
.L_021570d8:
    mvn r1, #0x27
    cmp r0, r1
    bge .L_02157108
    mov r1, #0x3
    bl func_0200d12c
    sub r1, r0, #0x10
    mvn r0, #0x4f
    str r1, [r4, #0x24]
    cmp r1, r0
    strlt r0, [r4, #0x24]
    mov r0, #0x3
    str r0, [r4, #0x10]
.L_02157108:
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov000_02156e64

    .global func_ov000_02157110
    arm_func_start func_ov000_02157110
func_ov000_02157110: ; 0x02157110
    ldr r1, [r1, #0x0]
    cmp r1, r0, lsl #0xc
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    arm_func_end func_ov000_02157110

    .global func_ov000_02157124
    arm_func_start func_ov000_02157124
func_ov000_02157124: ; 0x02157124
    ldr r0, [r0, #0x0]
    cmp r0, r1, lsl #0xc
    movle r0, #0x1
    movgt r0, #0x0
    bx lr
    arm_func_end func_ov000_02157124

    .global func_ov000_02157138
    arm_func_start func_ov000_02157138
func_ov000_02157138: ; 0x02157138
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x84
    ldr r1, .L_02157e04
    ldr r2, .L_02157e08
    mov r0, #0xac
    mov r3, #0xde
    bl func_0201a21c
    mov r10, r0
    mov r1, #0x0
    mov r2, #0xac
    bl func_020517fc
    bl func_02026f94
    str r0, [r10, #0x0]
    mov r1, #0x80000
    str r1, [sp, #0x68]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x68
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r10, #0x0]
    ldr r1, .L_02157e0c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x0]
    mov r1, r10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    bl func_020310f4
    ldr r2, .L_02157e10
    str r0, [r10, #0x4]
    ldr r1, .L_02157e14
    ldr r4, [r2, #0x0]
    ldr r3, [r1, #0x0]
    sub r4, r4, #0x1
    ldr r1, .L_02157e18
    str r4, [r2, #0x0]
    str r3, [r1, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_020314a0
    mov r0, #0x1
    bl func_02043264
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x58]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x58
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
    mov r2, #0x40
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
    mov r0, #0x2000
    str r0, [sp, #0x5c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x5c
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
    str r0, [sp, #0x60]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x60
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
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
    bl func_0203cfbc
    mov r0, #0x3
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x4000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x64]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x64
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1e
    sub r1, r0, #0x1f
    mov r2, #0x1
    mov r3, r1
    blx func_ov012_021bcf1c
    str r0, [r10, #0x88]
    blx func_ov012_021bd58c
    str r0, [r10, #0xa8]
    ldr r0, .L_02157e1c
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x8]
    ldr r0, .L_02157e20
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x14]
    ldr r0, .L_02157e24
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0xc]
    ldr r0, .L_02157e28
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x18]
    ldr r0, .L_02157e2c
    mov r1, #0x0
    blx func_020101f4
    ldr r1, .L_02157e30
    str r0, [r10, #0x10]
    ldr r0, [r1, #0x8d8]
    tst r0, #0x100000
    movne r0, #0x1
    moveq r0, #0x0
    strb r0, [r10, #0x98]
    bl func_020733a8
    bl func_ov000_02158750
    strb r0, [r10, #0x99]
    bl func_020733f4
    bl func_ov000_02158750
    ldr r1, .L_02157e30
    strb r0, [r10, #0x9a]
    add r1, r1, #0x800
    ldrsb r3, [r1, #0xde]
    ldr r1, .L_02157e34
    ldr r2, .L_02157e38
    strb r3, [r10, #0x9b]
    ldrb r4, [r10, #0x98]
    ldr r3, .L_02157e3c
    mov r0, #0x78
    strb r4, [r10, #0x9d]
    ldrb r4, [r10, #0x99]
    strb r4, [r10, #0x9e]
    ldrb r4, [r10, #0x9a]
    strb r4, [r10, #0x9f]
    ldrsb r4, [r10, #0x9b]
    strb r4, [r10, #0xa0]
    ldrb r4, [r10, #0x9c]
    strb r4, [r10, #0xa1]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021574ec
    ldr r1, .L_02157e40
    mov r2, #0x1
    bl func_02024064
.L_021574ec:
    bl func_ov000_0214ed84
    str r0, [r10, #0x1c]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x1
    bl func_0203b414
    ldr r1, [r0, #0x88]
    ldr r0, .L_02157e44
    bl func_ov000_021582d8
    str r0, [r10, #0x20]
    mov r0, #0x2
    bl func_0203b414
    ldr r1, [r0, #0x88]
    ldr r0, .L_02157e48
    bl func_ov000_021582d8
    str r0, [r10, #0x24]
    mov r4, r0
    mov r0, #0x0
    str r0, [sp, #0x1c]
    sub r0, r0, #0x100000
    str r0, [sp, #0x20]
    mov r0, #0x100000
    str r0, [sp, #0x24]
    add r0, sp, #0x78
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    bl func_ov000_02151038
    ldr r2, .L_02157e4c
    add r0, sp, #0x28
    mov r1, r4
    bl func_ov000_02150d54
    mov r0, #0x400
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r1, .L_02157e50
    ldr r2, .L_02157e54
    add r0, sp, #0x28
    add r3, sp, #0x78
    bl func_ov000_021580b0
    mov r1, r0
    mov r0, r4
    bl func_02020f38
    ldr r0, [r10, #0x20]
    ldr r1, [r10, #0x1c]
    bl func_ov000_0214f3e0
    bl func_0203b3e4
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r1, #0xa0
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    mov r0, #0xb00000
    ldr r3, .L_02157e58
    mov r1, r0
    bl func_ov000_021583dc
    str r0, [r10, #0x28]
    ldr r0, [r10, #0x1c]
    ldr r1, [r10, #0x28]
    bl func_ov000_021552fc
    ldr r6, .L_02157e5c
    ldr r4, .L_02157e58
    mov r7, #0x1
    mov r5, #0xb00000
    mov r8, #0xc
.L_02157600:
    bl func_0203b3e4
    ldr r1, [r10, #0x1c]
    add r3, r6, r7, lsl #0x3
    str r1, [sp, #0x0]
    ldrb r2, [r3, #0x5]
    mov r11, r0
    mov r1, r5
    str r2, [sp, #0x4]
    ldrb r9, [r3, #0x4]
    ldr r0, [r6, r7, lsl #0x3]
    ldr r2, [r11, #0x88]
    mla r3, r9, r8, r4
    bl func_ov000_021583dc
    add r1, r10, r7, lsl #0x2
    add r7, r7, #0x1
    str r0, [r1, #0x28]
    cmp r7, #0x9
    blt .L_02157600
    ldr r0, [r10, #0x34]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x98]
    blx r1
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x3c]
    ldr r0, [r10, #0x34]
    add r1, sp, #0x3c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r10, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x98]
    blx r1
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x38]
    ldr r0, [r10, #0x38]
    add r1, sp, #0x38
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r10, #0x40]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x98]
    blx r1
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x34]
    ldr r0, [r10, #0x40]
    add r1, sp, #0x34
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r10, #0x44]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x98]
    blx r1
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x30]
    ldr r0, [r10, #0x44]
    add r1, sp, #0x30
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldrb r0, [r10, #0x9d]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, [r10, #0x2c]
    beq .L_0215775c
    ldr r1, .L_02157e60
    ldr r0, [r0, #0x4]
    bl func_02023894
    b .L_02157768
.L_0215775c:
    ldr r1, .L_02157e64
    ldr r0, [r0, #0x4]
    bl func_02023894
.L_02157768:
    ldrb r0, [r10, #0x9e]
    ldr r3, [r10, #0x30]
    mov r2, #0x0
    add r1, r0, #0x3
    ldr r0, [r3, #0x4]
    add r1, r1, #0xb00000
    bl func_02023894
    ldrb r0, [r10, #0x9f]
    ldr r3, [r10, #0x3c]
    mov r2, #0x0
    add r1, r0, #0x3
    ldr r0, [r3, #0x4]
    add r1, r1, #0xb00000
    bl func_02023894
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    bl func_ov000_0214ed48
    mov r1, #0x0
    ldr r0, .L_02157e68
    mov r2, r1
    blx func_ov012_021c5f88
    bl func_ov000_0214ed84
    ldr r1, .L_02157e6c
    mov r4, r0
    bl func_ov000_02151170
    ldr r0, [r4, #0x4]
    mov r1, #0x90
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x88]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x84]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    mov r0, #0xa7000
    str r0, [sp, #0x40]
    mov r0, r4
    add r1, sp, #0x40
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_ov000_0214edac
    ldr r1, [r10, #0x1c]
    mov r0, r4
    bl func_ov000_0214f3e0
    ldr r0, [r10, #0x1c]
    mov r1, r4
    bl func_ov000_021552fc
    str r4, [r10, #0x4c]
    ldrsb r1, [r10, #0xa0]
    ldr r0, [r10, #0x88]
    blx func_ov012_021bd710
    mov r1, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r1, .L_02157e70
    ldr r2, .L_02157e74
    ldr r3, .L_02157e78
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_021578b0
    ldr r1, .L_02157e7c
    ldr r2, .L_02157e80
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r4, r0
.L_021578b0:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_021578cc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021578cc:
    ldr r4, [r4, #0x18]
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x1
    blx func_ov012_021b3b7c
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157e84
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02157908
    bl func_ov000_0214ed84
.L_02157908:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_02157928
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_02157928:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02157944
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02157944:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x11
    mov r2, #0xf
    mov r3, #0x5
    bl func_0206ad90
    mov r2, #0x0
    ldr r1, .L_02157e88
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    str r0, [r10, #0x8c]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, .L_02157e8c
    mvn r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x0
    bl func_ov000_021584a4
    str r0, [r10, #0x50]
    mov r0, #0xa9000
    str r0, [sp, #0x54]
    ldr r0, [r10, #0x50]
    add r1, sp, #0x54
    bl func_ov000_0214eed0
    ldr r0, [r10, #0x50]
    bl func_ov000_021584a4
    str r0, [r10, #0x58]
    mov r0, #0xa9000
    str r0, [sp, #0x50]
    ldr r0, [r10, #0x58]
    add r1, sp, #0x50
    bl func_ov000_0214eed0
    ldr r1, [r10, #0x58]
    ldr r2, .L_02157e90
    ldr r3, .L_02157e94
    mov r0, r10
    bl func_ov000_0215858c
    mov r4, r0
    bl func_0203b3e4
    str r4, [sp, #0x0]
    mov r1, #0x60
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    mov r0, #0x510000
    ldr r3, .L_02157e54
    mov r1, r0
    bl func_ov000_021583dc
    ldr r0, [r4, #0x4]
    ldr r1, .L_02157e98
    blx func_ov012_021b3fc4
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    blx func_ov012_021b3f78
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    blx func_ov012_021b3fb0
    ldr r0, [r4, #0x4]
    mov r1, #0x510000
    mov r2, #0x0
    bl func_02023894
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    ldr r2, .L_02157e9c
    mov r1, #0x4
    blx func_ov012_021b6760
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    bl func_ov000_0214ed48
    ldr r0, .L_02157e8c
    mov r1, #0x1
    str r1, [r0, #0x0]
    ldr r0, [r10, #0x50]
    bl func_ov000_021584a4
    str r0, [r10, #0x54]
    mov r0, #0xa9000
    str r0, [sp, #0x4c]
    ldr r0, [r10, #0x54]
    add r1, sp, #0x4c
    bl func_ov000_0214eed0
    ldr r0, [r10, #0x54]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b7744
    ldr r8, .L_02157e58
    ldr r7, .L_02157ea0
    ldr r6, .L_02157e94
    mov r9, #0x0
    mov r5, #0xa9000
    add r11, sp, #0x48
    mov r4, #0xc
.L_02157b00:
    add r1, r7, r9, lsl #0x3
    ldrb r0, [r1, #0x4]
    ldrb r3, [r1, #0x5]
    ldr r1, [r10, #0x54]
    mla r2, r0, r4, r8
    mov r0, r10
    add r3, r6, r3, lsl #0x3
    bl func_ov000_0215858c
    add r3, r10, r9, lsl #0x2
    str r0, [r3, #0x5c]
    ldr r2, [r7, r9, lsl #0x3]
    ldr r0, [r0, #0x4]
    mov r1, r11
    str r2, [r0, #0xdc]
    str r5, [sp, #0x48]
    ldr r0, [r3, #0x5c]
    bl func_ov000_0214eed0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x5c]
    ldr r0, [r0, #0x4]
    str r9, [r0, #0x124]
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_02157b00
    bl func_ov000_0214edac
    ldr r0, [r10, #0x68]
    ldr r2, .L_02157ea4
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r0, [r10, #0x6c]
    ldr r2, .L_02157ea8
    ldr r0, [r0, #0x4]
    mov r1, #0x4
    blx func_ov012_021b65e8
    mov r4, #0x0
.L_02157b90:
    cmp r4, #0x0
    bne .L_02157bac
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x5c]
    ldr r1, [r10, #0x6c]
    bl func_ov000_02158158
    b .L_02157bbc
.L_02157bac:
    add r1, r10, r4, lsl #0x2
    ldr r0, [r1, #0x5c]
    ldr r1, [r1, #0x58]
    bl func_ov000_02158158
.L_02157bbc:
    cmp r4, #0x4
    bne .L_02157bd8
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x5c]
    ldr r1, [r10, #0x5c]
    bl func_ov000_02158194
    b .L_02157be8
.L_02157bd8:
    add r1, r10, r4, lsl #0x2
    ldr r0, [r1, #0x5c]
    ldr r1, [r1, #0x60]
    bl func_ov000_02158194
.L_02157be8:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_02157b90
    ldr r0, .L_02157e8c
    mvn r1, #0x0
    ldr r8, .L_02157e58
    ldr r7, .L_02157ea0
    ldr r6, .L_02157e94
    str r1, [r0, #0x0]
    mov r9, #0x5
    mov r5, #0x1
    mov r4, #0x0
    mov r11, #0xa8000
.L_02157c1c:
    add r0, r7, r9, lsl #0x3
    ldrb ip, [r0, #0x4]
    ldrb r3, [r0, #0x5]
    mov r0, #0xc
    mla r2, ip, r0, r8
    ldr r1, [r10, #0x54]
    add r3, r6, r3, lsl #0x3
    mov r0, r10
    bl func_ov000_0215858c
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x5c]
    ldr r0, [r0, #0x4]
    ldr r2, [r7, r9, lsl #0x3]
    mov r1, #0x4
    blx func_ov012_021b65e8
    add r0, r10, r9, lsl #0x2
    ldr r2, [r0, #0x5c]
    add r1, sp, #0x44
    ldr r2, [r2, #0x4]
    strb r5, [r2, #0xaa]
    ldr r2, [r0, #0x5c]
    ldr r2, [r2, #0x4]
    strb r4, [r2, #0xab]
    str r11, [sp, #0x44]
    ldr r0, [r0, #0x5c]
    bl func_ov000_0214eed0
    add r9, r9, #0x1
    cmp r9, #0xb
    blt .L_02157c1c
    ldr r0, [r10, #0x78]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0xa5]
    ldr r0, [r10, #0x7c]
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0xa5]
    ldr r0, [r10, #0x80]
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0xa5]
    ldr r0, [r10, #0x84]
    ldr r0, [r0, #0x4]
    strb r1, [r0, #0xa5]
    ldr r0, [r10, #0x54]
    ldr r1, [r10, #0x1c]
    bl func_ov000_0214f3e0
    ldr r3, .L_02157e8c
    mov r5, #0x0
    ldr r4, .L_02157eac
    ldr r2, .L_02157eb0
    ldr r1, .L_02157eb4
    mov r0, #0x1
    str r5, [r3, #0x0]
    str r4, [r2, #0x0]
    blx func_ov012_021b7260
    ldr r1, .L_02157eb4
    mov r0, #0x2
    blx func_ov012_021b7260
    ldr r1, .L_02157eb4
    mov r0, #0x8
    blx func_ov012_021b7260
    ldr r1, .L_02157eb4
    mov r0, #0x4
    blx func_ov012_021b7260
    ldr r1, .L_02157eb4
    mov r0, #0x10000
    blx func_ov012_021b7260
    mov r0, r10
    bl func_ov000_0215a0e4
    str r0, [r10, #0x90]
    mov r0, r10
    bl func_ov000_02158e74
    str r0, [r10, #0x94]
    mov r0, #0x3
    bl func_020734e0
    mov r0, #0x3
    mov r1, r5
    bl func_0207361c
    blx func_ov012_021b65bc
    mov r0, #0x2
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r10, #0x50]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r10, #0x54]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r10, #0x5c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    mov r0, r5
    str r0, [sp, #0x18]
    str r0, [sp, #0x10]
    sub r0, r0, #0xc0000
    str r0, [sp, #0x14]
    add r0, sp, #0x6c
    add r1, sp, #0x10
    add r2, sp, #0x14
    add r3, sp, #0x18
    bl func_ov000_02151038
    ldr r1, [r10, #0x1c]
    ldr r2, .L_02157e4c
    add r0, sp, #0x8
    bl func_ov000_02150d54
    mov r0, #0x8
    str r0, [sp, #0x0]
    mov r4, #0xb
    ldr r1, .L_02157e50
    ldr r3, .L_02157e54
    add r0, sp, #0x8
    add r2, sp, #0x6c
    str r4, [sp, #0x4]
    bl func_ov000_021580b0
    mov r1, r0
    ldr r0, [r10, #0x1c]
    bl func_02020f38
    ldr r0, [r10, #0x4]
    add sp, sp, #0x84
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02157e04: .word data_ov000_021614f0
.L_02157e08: .word data_ov000_0216136c
.L_02157e0c: .word func_ov000_02157eb8
.L_02157e10: .word data_02093c04
.L_02157e14: .word data_020a0e80
.L_02157e18: .word data_020a16c0
.L_02157e1c: .word data_ov000_021614fc
.L_02157e20: .word data_ov000_02161510
.L_02157e24: .word data_ov000_02161528
.L_02157e28: .word data_ov000_02161540
.L_02157e2c: .word data_ov000_02161554
.L_02157e30: .word data_020b02b8
.L_02157e34: .word data_ov000_02161148
.L_02157e38: .word data_ov000_0216133c
.L_02157e3c: .word 0x4c3
.L_02157e40: .word func_02024a30
.L_02157e44: .word data_ov000_02161568
.L_02157e48: .word data_ov000_02161578
.L_02157e4c: .word data_ov000_02161580
.L_02157e50: .word 0x494c
.L_02157e54: .word data_02093c8c
.L_02157e58: .word data_ov000_02161424
.L_02157e5c: .word data_ov000_02160104
.L_02157e60: .word 0xb00002
.L_02157e64: .word 0xb00001
.L_02157e68: .word data_ov000_0216158c
.L_02157e6c: .word data_ov000_02161460
.L_02157e70: .word data_ov000_02161154
.L_02157e74: .word data_ov000_02161354
.L_02157e78: .word 0x1de
.L_02157e7c: .word func_ov000_021581d0
.L_02157e80: .word func_ov000_02158224
.L_02157e84: .word 0x31305053
.L_02157e88: .word 0x8df
.L_02157e8c: .word data_ov012_021d5154
.L_02157e90: .word data_ov000_0216146c
.L_02157e94: .word data_ov000_02161378
.L_02157e98: .word 0x510001
.L_02157e9c: .word func_ov000_02158e38
.L_02157ea0: .word data_ov000_0216014c
.L_02157ea4: .word func_ov000_02158d60
.L_02157ea8: .word func_ov000_02158dcc
.L_02157eac: .word func_ov000_021582c0
.L_02157eb0: .word data_ov012_021d514c
.L_02157eb4: .word 0x30078
    arm_func_end func_ov000_02157138

    .global func_ov000_02157eb8
    arm_func_start func_ov000_02157eb8
func_ov000_02157eb8: ; 0x02157eb8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    blx func_ov012_021b65cc
    ldr r0, [r4, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02157eb8

    .global func_ov000_02157edc
    arm_func_start func_ov000_02157edc
func_ov000_02157edc: ; 0x02157edc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    bl func_0207382c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    blx func_ov012_021b65cc
    ldr r2, [r4, #0xa4]
    ldr r1, .L_0215809c
    mov r0, #0x0
    str r2, [r1, #0x8]
    bl func_02043264
    mov r0, #0x2
    bl func_0203b414
    ldr r0, [r0, #0x88]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    bl func_020735e4
    ldr r0, .L_021580a0
    mov r1, #0x0
    str r1, [r0, #0x0]
    mov r0, #0x1
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
    mov r0, #0x1
    blx func_ov012_021b526c
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    beq .L_02157f8c
    bl func_ov000_0215a86c
.L_02157f8c:
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    beq .L_02157f9c
    bl func_ov000_0215955c
.L_02157f9c:
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_02157fb4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02157fb4:
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    beq .L_02157fc4
    bl func_0206ae98
.L_02157fc4:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_02157fdc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02157fdc:
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    beq .L_02157fec
    blx func_ov012_021bd500
.L_02157fec:
    mov r5, #0x0
.L_02157ff0:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_0215800c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215800c:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_02157ff0
    mov r5, #0x0
.L_0215801c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_02158038
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02158038:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_0215801c
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0215805c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215805c:
    ldr r1, .L_021580a4
    ldr r2, .L_021580a8
    ldr r3, [r1, #0x0]
    ldr r0, .L_021580ac
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
.L_0215809c: .word data_020afcb0
.L_021580a0: .word data_ov012_021d514c
.L_021580a4: .word data_02093c04
.L_021580a8: .word data_020a16c0
.L_021580ac: .word data_020a0e80
    arm_func_end func_ov000_02157edc

    .global func_ov000_021580b0
    arm_func_start func_ov000_021580b0
func_ov000_021580b0: ; 0x021580b0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r9, r1
    mov r8, r2
    mov r7, r3
    ldr r1, .L_02158140
    ldr r2, .L_02158144
    ldr r3, .L_02158148
    ldr r4, [r0, #0x4]
    ldr r5, [r0, #0x0]
    mov r0, #0x4c
    bl func_0201a21c
    movs r6, r0
    beq .L_02158118
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
.L_02158118:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02158134
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158134:
    ldr r0, [r6, #0x18]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02158140: .word data_ov000_02161174
.L_02158144: .word data_ov000_0216135c
.L_02158148: .word 0x2b9
    arm_func_end func_ov000_021580b0

    .global func_ov000_0215814c
    arm_func_start func_ov000_0215814c
func_ov000_0215814c: ; 0x0215814c
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov000_0215814c

    .global func_ov000_02158158
    arm_func_start func_ov000_02158158
func_ov000_02158158: ; 0x02158158
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215817c
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_0215817c:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x1
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02158158

    .global func_ov000_02158194
    arm_func_start func_ov000_02158194
func_ov000_02158194: ; 0x02158194
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_021581b8
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    ldr r2, [r2, #0x164]
    blx r2
    ldmia sp!, {r3, pc}
.L_021581b8:
    ldr r3, [r0, #0x0]
    ldr r2, [r1, #0x4]
    ldr r3, [r3, #0x160]
    mov r1, #0x2
    blx r3
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02158194

    .global func_ov000_021581d0
    arm_func_start func_ov000_021581d0
func_ov000_021581d0: ; 0x021581d0
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0203b3e4
    str r4, [sp, #0x0]
    mov r1, #0xa4
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215821c
    ldr r3, .L_02158220
    mov r1, #0xb00000
    bl func_ov000_021583dc
    mov r2, #0xa4000
    add r1, sp, #0x8
    mov r0, r4
    str r2, [sp, #0x8]
    bl func_ov000_0214eed0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_0215821c: .word 0xb0000d
.L_02158220: .word data_02093c8c
    arm_func_end func_ov000_021581d0

    .global func_ov000_02158224
    arm_func_start func_ov000_02158224
func_ov000_02158224: ; 0x02158224
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x94]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02158244
    bl func_ov000_0214ed84
.L_02158244:
    ldr r3, [r4, #0x4]
    ldr r0, [r0, #0x4]
    ldrsh r1, [r3, #0xa0]
    ldrsh r2, [r3, #0xa2]
    ldr r5, [r0, #0x124]
    ldr r0, [r3, #0x50]
    mov r1, r1, lsl #0xc
    str r1, [r0, #0xc]
    mov r2, r2, lsl #0xc
    mov r1, #0x1
    str r2, [r0, #0x10]
    bl func_ov000_02150fb8
    cmp r5, #0x3
    mov r2, #0x0
    bne .L_02158290
    ldr r0, [r4, #0x4]
    ldr r1, .L_021582b4
    bl func_02023894
    ldmia sp!, {r3, r4, r5, pc}
.L_02158290:
    cmp r5, #0x4
    ldr r0, [r4, #0x4]
    bne .L_021582a8
    ldr r1, .L_021582b8
    bl func_02023894
    ldmia sp!, {r3, r4, r5, pc}
.L_021582a8:
    ldr r1, .L_021582bc
    bl func_02023894
    ldmia sp!, {r3, r4, r5, pc}
.L_021582b4: .word 0xb0000e
.L_021582b8: .word 0xb0000f
.L_021582bc: .word 0xb0000d
    arm_func_end func_ov000_02158224

    .global func_ov000_021582c0
    arm_func_start func_ov000_021582c0
func_ov000_021582c0: ; 0x021582c0
    ldr ip, .L_021582d4
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bx ip
.L_021582d4: .word func_0207342c
    arm_func_end func_ov000_021582c0

    .global func_ov000_021582d8
    arm_func_start func_ov000_021582d8
func_ov000_021582d8: ; 0x021582d8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x200
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x100
    mov r1, r5
    bl func_02074000
    ldr r1, .L_021583d4
    add r0, sp, #0x100
    bl func_020741bc
    add r0, sp, #0x0
    mov r1, r5
    bl func_02074000
    ldr r1, .L_021583d8
    add r0, sp, #0x0
    bl func_020741bc
    mov r0, r4
    bl func_ov000_0214ed48
    add r0, sp, #0x0
    bl func_02035c90
    mov r4, r0
    ldr r1, [r4, #0x38]
    cmp r1, #0x0
    bne .L_02158344
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158344:
    ldr r4, [r4, #0x38]
    bl func_02036ab8
    bl func_ov000_0214ed84
    mov r5, r0
    ldr r0, [r5, #0x4]
    add r1, sp, #0x100
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x130]
    blx r2
    cmp r4, #0x0
    ldr r0, [r5, #0x4]
    bne .L_02158390
    ldr r0, [r0, #0x64]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, r1
    ldr r3, [r3, #0x50]
    blx r3
    b .L_021583a8
.L_02158390:
    ldr r0, [r0, #0x64]
    ldr r1, [r4, #0x4]
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x50]
    blx r3
.L_021583a8:
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    bl func_02034d7c
    bl func_ov000_0214edac
    mov r0, r5
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
.L_021583d4: .word data_ov000_021615a0
.L_021583d8: .word data_ov000_021615a8
    arm_func_end func_ov000_021582d8

    .global func_ov000_021583dc
    arm_func_start func_ov000_021583dc
func_ov000_021583dc: ; 0x021583dc
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r4, r1
    mov r0, r2
    mov r5, r3
    bl func_ov000_0214ed48
    mov r0, r4
    bl func_020329ec
    bl func_ov000_0214ed84
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
    ldr r3, .L_021584a0
    ldr r2, [r4, #0x4]
    mov r1, r5
    mov r0, r4
    str r3, [r2, #0x54]
    bl func_ov000_02151170
    ldr r1, [sp, #0x1c]
    mov r0, r4
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x0]
    add r1, sp, #0x0
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r1, [sp, #0x18]
    cmp r1, #0x0
    beq .L_02158490
    mov r0, r4
    bl func_ov000_0214f3e0
    ldr r0, [sp, #0x18]
    mov r1, r4
    bl func_ov000_021552fc
.L_02158490:
    bl func_ov000_0214edac
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_021584a0: .word 0x31305053
    arm_func_end func_ov000_021583dc

    .global func_ov000_021584a4
    arm_func_start func_ov000_021584a4
func_ov000_021584a4: ; 0x021584a4
    stmdb sp!, {r3, r4, r5, lr}
    cmp r0, #0x0
    ldr r3, .L_02158578
    beq .L_021584f4
    ldr ip, .L_0215857c
    ldr r4, [r0, #0x4]
    ldr r1, .L_02158580
    ldr r2, .L_02158584
    mov r0, #0x14c
    ldr r5, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021584e8
    ldr r3, .L_02158588
    mov r1, r4
    mov r2, r5
    blx func_ov012_021b7950
.L_021584e8:
    bl func_ov000_0214ed84
    mov r4, r0
    b .L_0215852c
.L_021584f4:
    ldr ip, .L_0215857c
    ldr r1, .L_02158580
    ldr r2, .L_02158584
    mov r0, #0x14c
    ldr r4, [ip, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_02158524
    ldr r3, .L_02158588
    mov r2, r4
    mov r1, #0x0
    blx func_ov012_021b7950
.L_02158524:
    bl func_ov000_0214ed84
    mov r4, r0
.L_0215852c:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b7744
    movs r1, #0x0
    bne .L_0215854c
    ldr r0, [r4, #0x4]
    blx func_ov012_021b5898
    b .L_0215855c
.L_0215854c:
    mov r1, #0x4
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_0215855c:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02158578: .word 0x2a6
.L_0215857c: .word data_ov012_021d5154
.L_02158580: .word data_ov000_02160d80
.L_02158584: .word data_ov000_02161344
.L_02158588: .word func_ov000_021510bc
    arm_func_end func_ov000_021584a4

    .global func_ov000_0215858c
    arm_func_start func_ov000_0215858c
func_ov000_0215858c: ; 0x0215858c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r2
    ldr r5, [r1, #0x4]
    ldr r4, .L_02158684
    mov r8, r0
    mov r6, r3
    ldr r1, .L_02158688
    ldr r2, .L_0215868c
    mov r0, #0x134
    mov r3, #0x3e
    ldr r4, [r4, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_021585d4
    ldr r3, .L_02158690
    mov r1, r5
    mov r2, r4
    blx func_ov012_021af0f8
.L_021585d4:
    bl func_ov000_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, .L_02158694
    ldr r2, .L_02158698
    ldr r3, .L_0215869c
    mov r0, #0x70
    bl func_0201a21c
    movs r5, r0
    beq .L_02158634
    ldr r2, .L_021586a0
    mov r1, #0x0
    blx func_ov012_021b054c
    ldr r2, .L_021586a4
    mov r1, r6
    add r0, r5, #0x68
    str r2, [r5, #0x0]
    bl func_ov000_0215115c
    ldr r0, .L_021586a8
    str r0, [r5, #0x0]
.L_02158634:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_02158650
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02158650:
    ldr r1, [r5, #0x18]
    mov r0, r4
    bl func_02020e98
    mov r0, r4
    mov r1, r7
    bl func_ov000_02151170
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02158684: .word data_ov012_021d5154
.L_02158688: .word data_ov000_02160d3c
.L_0215868c: .word data_ov000_02161364
.L_02158690: .word func_ov000_021510bc
.L_02158694: .word data_ov000_02160d5c
.L_02158698: .word data_ov000_0216134c
.L_0215869c: .word 0x1b2
.L_021586a0: .word data_02093c8c
.L_021586a4: .word data_ov000_02160db0
.L_021586a8: .word data_ov012_021d1c58
    arm_func_end func_ov000_0215858c

    .global func_ov000_021586ac
    arm_func_start func_ov000_021586ac
func_ov000_021586ac: ; 0x021586ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r1, [r4, #0x9d]
    ldrb r0, [r4, #0x98]
    cmp r1, r0
    ldreqsb r1, [r4, #0xa0]
    ldreqsb r0, [r4, #0x9b]
    cmpeq r1, r0
    ldreqb r1, [r4, #0x9e]
    ldreqb r0, [r4, #0x99]
    cmpeq r1, r0
    ldreqb r1, [r4, #0x9f]
    ldreqb r0, [r4, #0x9a]
    cmpeq r1, r0
    beq .L_02158718
    ldrb r0, [r4, #0x9d]
    blx func_02071e24
    ldrb r1, [r4, #0x9e]
    ldr r0, .L_02158748
    ldrb r0, [r0, r1]
    blx func_02071ea8
    ldrb r1, [r4, #0x9f]
    ldr r0, .L_02158748
    ldrb r0, [r0, r1]
    blx func_02071ed8
    ldrsb r0, [r4, #0xa0]
    blx func_02071ad4
.L_02158718:
    mov r0, #0x3
    mov r1, #0x1
    bl func_02073ebc
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x0]
    ldr r1, .L_0215874c
    ldr r0, [r0, #0x4]
    bl func_02028384
    blx func_ov012_021b65bc
    ldmia sp!, {r4, pc}
.L_02158748: .word data_ov000_021600fc
.L_0215874c: .word func_ov000_02157edc
    arm_func_end func_ov000_021586ac

    .global func_ov000_02158750
    arm_func_start func_ov000_02158750
func_ov000_02158750: ; 0x02158750
    mov r3, #0x0
    ldr r2, .L_02158784
    b .L_02158774
.L_0215875c:
    ldrb r1, [r2, r3]
    cmp r0, r1
    movls r0, r3
    bxls lr
    add r1, r3, #0x1
    and r3, r1, #0xff
.L_02158774:
    cmp r3, #0x7
    blo .L_0215875c
    mov r0, #0x0
    bx lr
.L_02158784: .word data_ov000_021600fc
    arm_func_end func_ov000_02158750

    .global func_ov000_02158788
    arm_func_start func_ov000_02158788
func_ov000_02158788: ; 0x02158788
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x5
.L_02158794:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x5c]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77dc
    add r0, r4, #0x1
    and r4, r0, #0xff
    cmp r4, #0xb
    blo .L_02158794
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_02158788

    .global func_ov000_021587b8
    arm_func_start func_ov000_021587b8
func_ov000_021587b8: ; 0x021587b8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x8
    mov r1, #0x0
    mov r2, #0x36
    bl func_02073f64
    ldr r4, .L_0215881c
    b .L_021587e0
.L_021587d8:
    ldr r0, [r4, #0x0]
    blx r0
.L_021587e0:
    bl func_02073854
    cmp r0, #0x0
    beq .L_021587d8
    ldr r0, [r5, #0x50]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r5, #0x50]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x88]
    mov r1, #0x1c
    mov r2, #0x0
    blx func_ov012_021bd730
    ldmia sp!, {r3, r4, r5, pc}
.L_0215881c: .word data_020a0e18
    arm_func_end func_ov000_021587b8

    .global func_ov000_02158820
    arm_func_start func_ov000_02158820
func_ov000_02158820: ; 0x02158820
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r0, #0x8
    mov r1, #0x0
    mov r2, #0x36
    bl func_02073f64
    ldr r5, .L_021588ac
    b .L_02158848
.L_02158840:
    ldr r0, [r5, #0x0]
    blx r0
.L_02158848:
    bl func_02073854
    cmp r0, #0x0
    beq .L_02158840
    ldr r5, .L_021588ac
    b .L_02158864
.L_0215885c:
    ldr r0, [r5, #0x0]
    blx r0
.L_02158864:
    ldr r0, [r4, #0x94]
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    bne .L_0215885c
    ldr r0, [r4, #0x50]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r4, #0x50]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x94]
    ldrsb r0, [r0, #0x1d]
    strb r0, [r4, #0xa0]
    ldr r0, [r4, #0x88]
    blx func_ov012_021bd58c
    str r0, [r4, #0xa8]
    ldmia sp!, {r3, r4, r5, pc}
.L_021588ac: .word data_020a0e18
    arm_func_end func_ov000_02158820

    .global func_ov000_021588b0
    arm_func_start func_ov000_021588b0
func_ov000_021588b0: ; 0x021588b0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x18
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x88]
    blx func_ov012_021bd730
    mov r0, r4
    bl func_ov000_02158788
    ldr r0, [r4, #0x70]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x74]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021588b0

    .global func_ov000_021588f8
    arm_func_start func_ov000_021588f8
func_ov000_021588f8: ; 0x021588f8
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x19
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x88]
    blx func_ov012_021bd730
    mov r0, r4
    bl func_ov000_02158788
    ldr r0, [r4, #0x78]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x7c]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021588f8

    .global func_ov000_02158940
    arm_func_start func_ov000_02158940
func_ov000_02158940: ; 0x02158940
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1a
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x88]
    blx func_ov012_021bd730
    mov r0, r4
    bl func_ov000_02158788
    ldr r0, [r4, #0x80]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x84]
    mov r1, #0x4
    ldr r0, [r0, #0x4]
    blx func_ov012_021b77a8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02158940

    .global func_ov000_02158988
    arm_func_start func_ov000_02158988
func_ov000_02158988: ; 0x02158988
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1b
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x88]
    blx func_ov012_021bd730
    mov r0, r4
    bl func_ov000_02158788
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02158988

    .global func_ov000_021589b0
    arm_func_start func_ov000_021589b0
func_ov000_021589b0: ; 0x021589b0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x1c
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x88]
    blx func_ov012_021bd730
    mov r0, r4
    bl func_ov000_02158788
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021589b0

    .global func_ov000_021589d8
    arm_func_start func_ov000_021589d8
func_ov000_021589d8: ; 0x021589d8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x3
    bl func_0207342c
    ldr r0, [r4, #0x2c]
    ldr r1, .L_02158a30
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    mov r0, #0x0
    strb r0, [r4, #0x9d]
    bl func_02073404
    ldr r0, [r4, #0x5c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r3, r4, r5, pc}
.L_02158a30: .word 0xb00001
    arm_func_end func_ov000_021589d8

    .global func_ov000_02158a34
    arm_func_start func_ov000_02158a34
func_ov000_02158a34: ; 0x02158a34
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x3
    bl func_0207342c
    ldr r0, [r4, #0x2c]
    ldr r1, .L_02158a8c
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    bl func_02023894
    mov r0, #0x1
    strb r0, [r4, #0x9d]
    bl func_02073404
    ldr r0, [r4, #0x5c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r3, r4, r5, pc}
.L_02158a8c: .word 0xb00002
    arm_func_end func_ov000_02158a34

    .global func_ov000_02158a90
    arm_func_start func_ov000_02158a90
func_ov000_02158a90: ; 0x02158a90
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x3
    bl func_0207342c
    ldrb r0, [r4, #0x9e]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r4, #0x9e]
    ldrb r1, [r4, #0x9e]
    ldr r0, .L_02158b40
    ldrb r0, [r0, r1]
    bl func_0207336c
    ldrb r0, [r4, #0x9e]
    ldr r3, [r4, #0x30]
    mov r2, #0x0
    add r1, r0, #0x3
    ldr r0, [r3, #0x4]
    add r1, r1, #0xb00000
    bl func_02023894
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x34]
    add r1, sp, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0x34]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x60]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r3, r4, r5, pc}
.L_02158b40: .word data_ov000_021600fc
    arm_func_end func_ov000_02158a90

    .global func_ov000_02158b44
    arm_func_start func_ov000_02158b44
func_ov000_02158b44: ; 0x02158b44
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x3
    bl func_0207342c
    ldrb r0, [r4, #0x9e]
    cmp r0, #0x6
    addlo r0, r0, #0x1
    strlob r0, [r4, #0x9e]
    ldrb r1, [r4, #0x9e]
    ldr r0, .L_02158bf4
    ldrb r0, [r0, r1]
    bl func_0207336c
    ldrb r0, [r4, #0x9e]
    ldr r3, [r4, #0x30]
    mov r2, #0x0
    add r1, r0, #0x3
    ldr r0, [r3, #0x4]
    add r1, r1, #0xb00000
    bl func_02023894
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x38]
    add r1, sp, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x60]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r3, r4, r5, pc}
.L_02158bf4: .word data_ov000_021600fc
    arm_func_end func_ov000_02158b44

    .global func_ov000_02158bf8
    arm_func_start func_ov000_02158bf8
func_ov000_02158bf8: ; 0x02158bf8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x3
    bl func_0207342c
    ldrb r0, [r4, #0x9f]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r4, #0x9f]
    ldrb r1, [r4, #0x9f]
    ldr r0, .L_02158ca8
    ldrb r0, [r0, r1]
    bl func_020733b8
    ldrb r0, [r4, #0x9f]
    ldr r3, [r4, #0x3c]
    mov r2, #0x0
    add r1, r0, #0x3
    ldr r0, [r3, #0x4]
    add r1, r1, #0xb00000
    bl func_02023894
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x40]
    add r1, sp, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0x40]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x64]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r3, r4, r5, pc}
.L_02158ca8: .word data_ov000_021600fc
    arm_func_end func_ov000_02158bf8

    .global func_ov000_02158cac
    arm_func_start func_ov000_02158cac
func_ov000_02158cac: ; 0x02158cac
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x3
    bl func_0207342c
    ldrb r0, [r4, #0x9f]
    cmp r0, #0x6
    addlo r0, r0, #0x1
    strlob r0, [r4, #0x9f]
    ldrb r1, [r4, #0x9f]
    ldr r0, .L_02158d5c
    ldrb r0, [r0, r1]
    bl func_020733b8
    ldrb r0, [r4, #0x9f]
    ldr r3, [r4, #0x3c]
    mov r2, #0x0
    add r1, r0, #0x3
    ldr r0, [r3, #0x4]
    add r1, r1, #0xb00000
    bl func_02023894
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x44]
    add r1, sp, #0x0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb8]
    blx r2
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x6c]
    blx r1
    ldr r0, [r4, #0x64]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r3, r4, r5, pc}
.L_02158d5c: .word data_ov000_021600fc
    arm_func_end func_ov000_02158cac

    .global func_ov000_02158d60
    arm_func_start func_ov000_02158d60
func_ov000_02158d60: ; 0x02158d60
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r1, [r6, #0x4]
    mov r0, #0x78
    ldr r5, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r5, #0x50]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r0, #0x9
    mov r1, #0x0
    mov r2, #0x36
    bl func_02073f64
    ldr r4, .L_02158dc8
    b .L_02158da8
.L_02158da0:
    ldr r0, [r4, #0x0]
    blx r0
.L_02158da8:
    bl func_02073854
    cmp r0, #0x0
    beq .L_02158da0
    ldr r0, [r5, #0x94]
    bl func_ov000_021595a8
    ldr r0, [r6, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r4, r5, r6, pc}
.L_02158dc8: .word data_020a0e18
    arm_func_end func_ov000_02158d60

    .global func_ov000_02158dcc
    arm_func_start func_ov000_02158dcc
func_ov000_02158dcc: ; 0x02158dcc
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r1, [r6, #0x4]
    mov r0, #0x78
    ldr r5, [r1, #0x10]
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r5, #0x50]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r0, #0x9
    mov r1, #0x0
    mov r2, #0x36
    bl func_02073f64
    ldr r4, .L_02158e34
    b .L_02158e14
.L_02158e0c:
    ldr r0, [r4, #0x0]
    blx r0
.L_02158e14:
    bl func_02073854
    cmp r0, #0x0
    beq .L_02158e0c
    ldr r0, [r5, #0x90]
    bl func_ov000_0215a8d8
    ldr r0, [r6, #0x4]
    blx func_ov012_021b7170
    ldmia sp!, {r4, r5, r6, pc}
.L_02158e34: .word data_020a0e18
    arm_func_end func_ov000_02158dcc

    .global func_ov000_02158e38
    arm_func_start func_ov000_02158e38
func_ov000_02158e38: ; 0x02158e38
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    mov r0, #0x78
    ldr r4, [r1, #0x10]
    mov r1, #0x1
    bl func_0207342c
    mov r0, r4
    bl func_ov000_021586ac
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02158e38

    .global func_ov000_02158e5c
    arm_func_start func_ov000_02158e5c
func_ov000_02158e5c: ; 0x02158e5c
    strh r1, [r0, #0x0]
    strh r2, [r0, #0x2]
    ldr r1, [sp, #0x0]
    strh r3, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
    arm_func_end func_ov000_02158e5c

    .global func_ov000_02158e74
    arm_func_start func_ov000_02158e74
func_ov000_02158e74: ; 0x02158e74
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x58
    ldr r1, .L_021594e4
    mov r4, r0
    ldr r2, .L_021594e8
    mov r0, #0x4c
    mov r3, #0x90
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x4c
    mov r7, r0
    bl func_020517fc
    mov r3, #0x0
    str r4, [r7, #0x0]
    add r0, r3, #0x1
    str r0, [r7, #0x18]
    sub r1, r3, #0x1
    add r0, r7, #0x0
    strb r1, [r0, #0x20]
    ldr r2, [r7, #0x18]
    mov r0, #0x1
    add r1, r2, #0x1
    str r1, [r7, #0x18]
    add r1, r7, r2
    strb r3, [r1, #0x20]
    ldr r3, .L_021594ec
    mov r4, r0
.L_02158ee0:
    mov r1, r0, lsr #0x5
    add r1, r3, r1, lsl #0x2
    ldr r1, [r1, #0x8ec]
    and r2, r0, #0x1f
    tst r1, r4, lsl r2
    beq .L_02158f10
    ldr r1, [r7, #0x18]
    mov r2, r1
    add r1, r1, #0x1
    str r1, [r7, #0x18]
    add r1, r7, r2
    strb r0, [r1, #0x20]
.L_02158f10:
    add r0, r0, #0x1
    cmp r0, #0x2a
    blt .L_02158ee0
    ldr r0, [r7, #0x18]
    cmp r0, #0x2
    moveq r0, #0x0
    streqb r0, [r7, #0x20]
    moveq r0, #0x1
    streq r0, [r7, #0x18]
    mov r0, #0x0
    bl func_ov000_021584a4
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x4]
    bl func_02023940
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r4, [r5, #0x4]
    ldr r0, .L_021594f0
    bl func_020326b0
    mov r3, r0
    mov r0, r4
    ldr r4, [r0, #0x0]
    ldr r1, .L_021594f0
    ldr r4, [r4, #0x40]
    add r2, sp, #0x20
    blx r4
    mov r1, r0
    ldr r2, [sp, #0x20]
    add r0, sp, #0x44
    bl func_0202c4a4
    mov r0, #0x0
    str r0, [sp, #0x3c]
    mov r0, #0x100000
    str r0, [sp, #0x40]
    mov r0, r5
    add r1, sp, #0x40
    add r2, sp, #0x3c
    bl func_ov000_0214f418
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x44]
    ldr r3, [sp, #0x48]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x34]
    str r0, [sp, #0x38]
    mov r0, r5
    add r1, sp, #0x38
    add r2, sp, #0x34
    bl func_ov000_0214f418
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x44]
    ldr r3, [sp, #0x48]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x44]
    ldr r2, .L_021594f4
    ldr r3, [sp, #0x48]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r5, #0x4]
    bl func_020239a0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    mov r0, #0x0
    add r1, sp, #0x30
    add r2, sp, #0x2c
    str r0, [sp, #0x2c]
    str r0, [sp, #0x30]
    mov r0, r5
    bl func_ov000_0214f418
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x44]
    ldr r3, [sp, #0x48]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r0, #0x100000
    str r0, [sp, #0x28]
    mov r0, r5
    add r1, sp, #0x28
    add r2, sp, #0x24
    bl func_ov000_0214f418
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x44]
    ldr r3, [sp, #0x48]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r5, #0x4]
    ldr r1, [sp, #0x44]
    ldr r2, .L_021594f4
    ldr r3, [sp, #0x48]
    bl func_02023c80
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r5, #0x4]
    mov r1, #0x2
    blx func_ov012_021b409c
    ldr r0, [r5, #0x4]
    ldr r2, .L_021594f8
    mov r1, #0x10
    blx func_ov012_021b6760
    ldr r0, [r5, #0x4]
    ldr r2, .L_021594fc
    mov r1, #0x20
    blx func_ov012_021b6760
    str r5, [r7, #0x8]
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    blx func_ov012_021b65d8
    ldr r1, .L_02159500
    ldr r2, .L_02159504
    ldr r3, .L_02159508
    mov r0, #0xcc
    bl func_0201a21c
    mov r4, r0
    cmp r4, #0x0
    beq .L_02159160
    ldr r1, .L_0215950c
    ldr r2, .L_02159510
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r4, r0
.L_02159160:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215917c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215917c:
    ldr r1, .L_02159514
    ldr r2, .L_02159518
    ldr r3, .L_0215951c
    mov r0, #0xbc
    ldr r4, [r4, #0x18]
    bl func_0201a21c
    movs r6, r0
    beq .L_021591ac
    ldr r1, .L_02159520
    mov r2, #0x0
    blx func_ov012_021af358
    mov r6, r0
.L_021591ac:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_021591c8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021591c8:
    ldr r6, [r6, #0x18]
    mov r0, #0x12
    ldr r1, [r6, #0x4]
    mov r2, r4
    str r0, [r1, #0x94]
    str r0, [r1, #0x98]
    ldr ip, [r6, #0x4]
    mov lr, #0xd
    mov r3, r6
    mov r0, #0x3
    mov r1, #0x0
    str lr, [ip, #0x9c]
    blx func_ov012_021b3b7c
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r2, #0x3
    ldr r1, .L_02159524
    mov r0, #0x190
    str r2, [r1, #0x0]
    ldr r2, [r7, #0x8]
    ldr r1, .L_02159528
    ldr r4, [r2, #0x4]
    ldr r2, .L_0215952c
    sub r3, r0, #0x37
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215925c
    ldr r3, .L_02159530
    mov r1, r4
    mov r2, #0x3
    blx func_ov012_021ae114
.L_0215925c:
    bl func_ov000_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x88
    mov r2, #0x70
    blx func_ov012_021b5900
    mov r6, #0x28000
    mov r3, #0x48000
    add r1, sp, #0x14
    add r2, sp, #0x18
    mov r0, r4
    str r6, [sp, #0x18]
    str r3, [sp, #0x14]
    bl func_ov000_0214f418
    ldr r1, [r4, #0x4]
    mov r0, #0x88
    str r0, [r1, #0x170]
    mov r0, #0x10
    str r0, [r1, #0x174]
    ldr r0, [r4, #0x4]
    mov r1, #0x7
    str r1, [r0, #0x180]
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0x114]
    ldr r0, [r4, #0x4]
    strb r1, [r0, #0x140]
    ldr r0, [r4, #0x4]
    strb r1, [r0, #0x141]
    ldr r0, [r4, #0x4]
    str r1, [r0, #0x13c]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1a8]
    blx r2
    mov r0, #0xa2000
    str r0, [sp, #0x1c]
    mov r0, r4
    add r1, sp, #0x1c
    bl func_ov000_0214eed0
    str r4, [r7, #0xc]
    bl func_0203b404
    ldr r1, .L_02159534
    ldr r0, [r0, #0x88]
    ldr r2, [r1, #0x0]
    ldr r4, [r0, #0x4]
    sub r3, r2, #0x1
    ldr r0, .L_02159538
    str r3, [r1, #0x0]
    ldr r2, [r0, #0x0]
    ldr r1, .L_0215953c
    str r4, [r0, #0x0]
    str r2, [r1, r3, lsl #0x2]
    mov r1, #0x0
    ldr r0, .L_02159540
    mov r2, r1
    blx func_ov012_021caa0c
    mov r4, r0
    mov r6, #0x0
    b .L_02159394
.L_02159360:
    add r0, r7, r6
    ldr r2, [r7, #0x0]
    ldrsb r1, [r0, #0x20]
    ldr r0, [r2, #0x88]
    blx func_ov012_021bd710
    mov r2, r0
    mov r0, r7
    mov r1, r4
    mov r3, r6
    bl func_ov000_02159784
    ldr r0, [r0, #0x4]
    str r6, [r0, #0x124]
    add r6, r6, #0x1
.L_02159394:
    ldr r3, [r7, #0x18]
    cmp r6, r3
    blo .L_02159360
    ldr r2, .L_02159544
    mov r0, r7
    mov r1, r4
    bl func_ov000_02159784
    ldr r1, [r7, #0x18]
    ldr r0, [r0, #0x4]
    str r1, [r0, #0x124]
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r2, .L_02159534
    ldr r0, .L_02159548
    ldr r4, [r2, #0x0]
    ldr r3, [r0, #0x0]
    add r0, r4, #0x1
    str r0, [r2, #0x0]
    ldr r2, .L_0215953c
    ldr r0, .L_02159538
    ldr r2, [r2, r4, lsl #0x2]
    mov r4, #0x0
    str r2, [r0, #0x0]
    ldr r2, .L_02159524
    mov r1, r5
    str r4, [r2, #0x0]
    ldr r2, .L_0215954c
    mov r0, r7
    bl func_ov000_0215858c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r2, #0x1
    strb r2, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    bl func_02023820
    ldr r0, [r4, #0x4]
    ldr r2, .L_02159550
    mov r1, #0x4
    blx func_ov012_021b65e8
    mov r0, #0x0
    str r0, [sp, #0x10]
    mov r0, #0x60000
    str r0, [sp, #0xc]
    mov r0, #0x98000
    str r0, [sp, #0x8]
    add r0, sp, #0x4c
    add r1, sp, #0x8
    add r2, sp, #0xc
    add r3, sp, #0x10
    bl func_ov000_02151038
    bl func_0203b404
    ldr r2, [r7, #0x8]
    mov r1, #0x85
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02159554
    mov r1, #0xb20000
    add r3, sp, #0x4c
    bl func_ov000_021583dc
    bl func_02026f94
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_02159558
    bl func_02028384
    str r4, [r7, #0x4]
    mov r1, #0x0
    mov r0, r7
    str r1, [r7, #0x14]
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021594e4: .word data_ov000_02161640
.L_021594e8: .word data_ov000_02161628
.L_021594ec: .word data_020b02b8
.L_021594f0: .word data_ov000_02161654
.L_021594f4: .word 0x494c
.L_021594f8: .word func_ov000_02159e8c
.L_021594fc: .word func_ov000_02159e9c
.L_02159500: .word data_ov000_02161154
.L_02159504: .word data_ov000_021615b0
.L_02159508: .word 0x1de
.L_0215950c: .word func_ov000_021599c4
.L_02159510: .word func_ov000_02159a40
.L_02159514: .word data_ov000_021615e8
.L_02159518: .word data_ov000_021615c0
.L_0215951c: .word 0x212
.L_02159520: .word func_ov000_02159aa4
.L_02159524: .word data_ov012_021d5154
.L_02159528: .word data_ov000_021615f8
.L_0215952c: .word data_ov000_021615b8
.L_02159530: .word func_ov000_02159720
.L_02159534: .word data_02093c08
.L_02159538: .word data_020a0dd0
.L_0215953c: .word data_020a16d0
.L_02159540: .word data_ov000_02161660
.L_02159544: .word data_ov000_02161674
.L_02159548: .word data_02093bf4
.L_0215954c: .word data_02093c8c
.L_02159550: .word func_ov000_0215a0ac
.L_02159554: .word 0xb20001
.L_02159558: .word func_ov000_02159e2c
    arm_func_end func_ov000_02158e74

    .global func_ov000_0215955c
    arm_func_start func_ov000_0215955c
func_ov000_0215955c: ; 0x0215955c
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x3
    blx func_ov012_021b526c
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02159584
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02159584:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215959c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215959c:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215955c

    .global func_ov000_021595a8
    arm_func_start func_ov000_021595a8
func_ov000_021595a8: ; 0x021595a8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x8]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    ldr r1, [r5, #0x0]
    mvn r0, #0x0
    ldrsb r1, [r1, #0xa0]
    mov r4, #0x0
    strb r1, [r5, #0x1d]
    ldr r1, [r5, #0x0]
    ldr r1, [r1, #0xa8]
    strb r1, [r5, #0x1e]
    ldrsb r1, [r5, #0x1d]
    strb r1, [r5, #0x1c]
    ldrsb r1, [r5, #0x1d]
    strb r1, [r5, #0x1f]
    ldrsb r1, [r5, #0x1d]
    cmp r1, r0
    moveq r0, #0x25
    movne r0, #0x24
    str r0, [r5, #0x10]
    ldr r2, [r5, #0x18]
    b .L_021596cc
.L_02159678:
    ldr r1, [r5, #0x0]
    add r0, r5, r4
    ldrsb r1, [r1, #0xa0]
    ldrsb r0, [r0, #0x20]
    cmp r1, r0
    bne .L_021596c8
    ldr r0, [r5, #0xc]
    mov r1, r4
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x1a0]
    blx r3
    ldr r0, [r5, #0xc]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x198]
    blx r2
    b .L_021596d4
.L_021596c8:
    add r4, r4, #0x1
.L_021596cc:
    cmp r4, r2
    blo .L_02159678
.L_021596d4:
    ldr r0, [r5, #0x0]
    ldr r1, [r5, #0x10]
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    blx func_ov012_021bd730
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_021595a8

    .global func_ov000_021596f0
    arm_func_start func_ov000_021596f0
func_ov000_021596f0: ; 0x021596f0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x8]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_021596f0

    .global func_ov000_02159720
    arm_func_start func_ov000_02159720
func_ov000_02159720: ; 0x02159720
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02159770
    mov r5, r0
    ldr r2, .L_02159774
    ldr r3, .L_02159778
    mov r0, #0x44
    bl func_0201a21c
    movs r4, r0
    beq .L_02159768
    mov r1, r5
    mov r2, #0x0
    bl func_02014604
    ldr r0, .L_0215977c
    mov r1, #0x1
    str r0, [r4, #0x0]
    ldr r0, .L_02159780
    strb r1, [r4, #0x40]
    str r0, [r4, #0x0]
.L_02159768:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02159770: .word data_ov000_02161608
.L_02159774: .word data_ov000_02161618
.L_02159778: .word 0x14e
.L_0215977c: .word data_ov012_021d2a24
.L_02159780: .word data_ov012_021d080c
    arm_func_end func_ov000_02159720

    .global func_ov000_02159784
    arm_func_start func_ov000_02159784
func_ov000_02159784: ; 0x02159784
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x34
    mov r7, r0
    ldr r0, [r7, #0xc]
    mov r4, r1
    ldr r0, [r0, #0x4]
    mov r8, r2
    mov r6, r3
    blx func_ov012_021ae3a4
    bl func_ov000_0214ed84
    mov r2, #0xa2000
    add r1, sp, #0x24
    str r2, [sp, #0x24]
    mov r5, r0
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    blx func_ov012_021c5fb4
    bl func_ov000_0214ed84
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r8
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r0, [r4, #0x4]
    mov r1, #0x6
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    ldr r2, .L_021599b0
    ldr r0, [r5, #0x4]
    movs r1, #0x0
    str r2, [r0, #0xdc]
    bne .L_02159820
    ldr r0, [r5, #0x4]
    blx func_ov012_021b5898
    b .L_02159830
.L_02159820:
    mov r1, #0x4
    ldr r0, [r5, #0x4]
    ldr r1, [r1, #0x0]
    blx func_ov012_021b5898
.L_02159830:
    ldr r0, [r5, #0x4]
    ldr r8, [r4, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, r8
    ldr r2, [r2, #0xb4]
    blx r2
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x83000
    str r0, [sp, #0x20]
    add r1, sp, #0x20
    mov r0, r4
    bl func_ov000_0214eed0
    cmp r5, #0x0
    ldr r0, [r4, #0x4]
    bne .L_021598a0
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_021598b0
.L_021598a0:
    ldr r2, [r0, #0x0]
    ldr r1, [r5, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_021598b0:
    mov lr, #0x0
    mov ip, #0x8000
    mov r4, #0x4c000
    add r0, sp, #0x28
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    str lr, [sp, #0x14]
    str ip, [sp, #0x18]
    str r4, [sp, #0x1c]
    bl func_ov000_02151038
    bl func_0203b404
    mov r2, r0
    str r5, [sp, #0x0]
    mov r1, #0x84
    str r1, [sp, #0x4]
    mov r0, #0xb20000
    ldr r2, [r2, #0x88]
    add r3, sp, #0x28
    mov r1, r0
    bl func_ov000_021583dc
    ldr r0, [r5, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0x10
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, sp, #0xc
    mov r2, r1
    mov r3, #0x88
    bl func_ov000_02158e5c
    ldr r2, .L_021599b4
    mov r0, r7
    mov r1, r5
    add r3, sp, #0xc
    bl func_ov000_0215858c
    mov r1, #0xa2000
    str r1, [sp, #0x8]
    mov r4, r0
    add r1, sp, #0x8
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    ldr r2, .L_021599b8
    mov r1, #0x4
    blx func_ov012_021b65e8
    ldr r1, .L_021599bc
    ldr r0, [r4, #0x4]
    ldr r2, .L_021599c0
    str r1, [r0, #0xdc]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    str r2, [r0, #0xe0]
    ldr r0, [r4, #0x4]
    str r6, [r0, #0x124]
    ldr r0, [r4, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    blx func_ov012_021b6214
    mov r0, r5
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_021599b0: .word func_ov000_02159ee4
.L_021599b4: .word data_02093c8c
.L_021599b8: .word func_ov000_02159f98
.L_021599bc: .word func_ov000_02159f18
.L_021599c0: .word func_ov000_02159ed0
    arm_func_end func_ov000_02159784

    .global func_ov000_021599c4
    arm_func_start func_ov000_021599c4
func_ov000_021599c4: ; 0x021599c4
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r4, #0x0
    mov lr, #0x8000
    mov ip, #0x46000
    mov r5, r0
    add r0, sp, #0x18
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    str r4, [sp, #0xc]
    str lr, [sp, #0x10]
    str ip, [sp, #0x14]
    bl func_ov000_02151038
    bl func_0203b404
    str r5, [sp, #0x0]
    mov r1, #0x82
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02159a3c
    add r3, sp, #0x18
    mov r1, #0xb10000
    bl func_ov000_021583dc
    mov r0, #0x82000
    str r0, [sp, #0x8]
    add r1, sp, #0x8
    mov r0, r5
    bl func_ov000_0214eed0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
.L_02159a3c: .word 0xb10006
    arm_func_end func_ov000_021599c4

    .global func_ov000_02159a40
    arm_func_start func_ov000_02159a40
func_ov000_02159a40: ; 0x02159a40
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0x4]
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    beq .L_02159a60
    bl func_ov000_0214ed84
.L_02159a60:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_02159a74
    bl func_ov000_0214ed84
.L_02159a74:
    ldrsh r0, [r4, #0xa2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r4, #0xa0]
    mov r0, r5
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov000_0214f418
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_02159a40

    .global func_ov000_02159aa4
    arm_func_start func_ov000_02159aa4
func_ov000_02159aa4: ; 0x02159aa4
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4c
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x90]
    bl func_ov000_0214ed84
    ldr r0, [r0, #0x4]
    mov r3, #0x6000
    ldrsh r0, [r0, #0xcc]
    rsb r3, r3, #0x0
    add r1, sp, #0x30
    mov ip, r0, lsl #0xc
    add r2, sp, #0x2c
    mov r0, r4
    str ip, [sp, #0x30]
    str r3, [sp, #0x2c]
    bl func_ov000_0214f418
    mov r2, #0x81000
    add r1, sp, #0x28
    mov r0, r4
    str r2, [sp, #0x28]
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    mov r1, #0x87
    str r1, [r0, #0x98]
    ldr r5, [r4, #0x4]
    ldr r1, .L_02159c68
    ldr r0, [r5, #0xac]
    ldr r2, .L_02159c6c
    and r0, r0, #0x1
    cmp r0, #0x1
    moveq r7, #0x1
    ldr r3, .L_02159c70
    mov r0, #0xb4
    movne r7, #0x0
    ldr r5, [r5, #0x94]
    bl func_0201a21c
    movs r6, r0
    beq .L_02159b64
    ldr r2, .L_02159c74
    mov r1, #0x0
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r1, [r4, #0x4]
    mov r2, r5
    mov r3, r7
    blx func_ov012_021af494
    mov r6, r0
.L_02159b64:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_02159b80
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02159b80:
    ldr r1, [r6, #0x18]
    ldr r0, [r4, #0x4]
    ldr r1, [r1, #0x4]
    blx func_ov012_021b8efc
    mov lr, #0x0
    mov ip, #0xd000
    add r0, sp, #0x40
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    str lr, [sp, #0x1c]
    str ip, [sp, #0x20]
    str lr, [sp, #0x24]
    bl func_ov000_02151038
    bl func_0203b404
    str r4, [sp, #0x0]
    mov r1, #0x81
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    mov r0, #0xb10000
    mov r1, r0
    add r3, sp, #0x40
    bl func_ov000_021583dc
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x18]
    mov r0, #0x7a000
    str r0, [sp, #0x14]
    add r0, sp, #0x34
    add r1, sp, #0x18
    add r2, sp, #0x14
    add r3, sp, #0x10
    bl func_ov000_02151038
    bl func_0203b404
    str r4, [sp, #0x0]
    mov r1, #0x81
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02159c78
    mov r1, #0xb10000
    add r3, sp, #0x34
    bl func_ov000_021583dc
    mov r0, #0x87
    str r0, [sp, #0x0]
    sub r1, r0, #0x90
    add r0, sp, #0x8
    mov r2, #0x0
    mov r3, #0x9
    bl func_ov000_02158e5c
    ldr r2, .L_02159c7c
    mov r0, #0x0
    add r1, sp, #0x8
    bl func_ov000_02159c80
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02159c68: .word data_ov000_021615d8
.L_02159c6c: .word data_ov000_021615d0
.L_02159c70: .word 0x226
.L_02159c74: .word func_ov000_02159d0c
.L_02159c78: .word 0xb10004
.L_02159c7c: .word data_02093c8c
    arm_func_end func_ov000_02159aa4

    .global func_ov000_02159c80
    arm_func_start func_ov000_02159c80
func_ov000_02159c80: ; 0x02159c80
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    ldr r1, .L_02159cf8
    ldr r2, .L_02159cfc
    ldr r3, .L_02159d00
    mov r0, #0x70
    bl func_0201a21c
    movs r4, r0
    beq .L_02159cd4
    mov r1, r7
    mov r2, r5
    blx func_ov012_021b054c
    ldr r2, .L_02159d04
    mov r1, r6
    add r0, r4, #0x68
    str r2, [r4, #0x0]
    bl func_ov000_0215115c
    ldr r0, .L_02159d08
    str r0, [r4, #0x0]
.L_02159cd4:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02159cf0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02159cf0:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02159cf8: .word data_ov000_02160d5c
.L_02159cfc: .word data_ov000_021615c8
.L_02159d00: .word 0x1b2
.L_02159d04: .word data_ov000_02160db0
.L_02159d08: .word data_ov012_021d1c58
    arm_func_end func_ov000_02159c80

    .global func_ov000_02159d0c
    arm_func_start func_ov000_02159d0c
func_ov000_02159d0c: ; 0x02159d0c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xac]
    blx r1
    cmp r0, #0x1
    bne .L_02159dc8
    mov lr, #0x0
    mov ip, #0x12000
    add r0, sp, #0x20
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    str lr, [sp, #0x14]
    str ip, [sp, #0x18]
    str lr, [sp, #0x1c]
    bl func_ov000_02151038
    bl func_0203b404
    str r4, [sp, #0x0]
    mov r1, #0x81
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_02159ddc
    add r3, sp, #0x20
    mov r1, #0xb10000
    bl func_ov000_021583dc
    mov r0, #0x25
    str r0, [sp, #0x0]
    sub r1, r0, #0x2e
    add r0, sp, #0xc
    mov r2, #0x0
    mov r3, #0x9
    bl func_ov000_02158e5c
    ldr r2, .L_02159de0
    mov r0, #0x0
    add r1, sp, #0xc
    bl func_ov000_02159c80
    mov r1, r0
    mov r0, r4
    bl func_02020e98
    mov r0, #0x80000
    str r0, [sp, #0x8]
    mov r0, r4
    add r1, sp, #0x8
    bl func_ov000_0214eed0
.L_02159dc8:
    ldr r0, [r4, #0x4]
    mov r1, #0x25
    str r1, [r0, #0x98]
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
.L_02159ddc: .word 0xb10002
.L_02159de0: .word data_02093c8c
    arm_func_end func_ov000_02159d0c

    .global func_ov000_02159de4
    arm_func_start func_ov000_02159de4
func_ov000_02159de4: ; 0x02159de4
    stmdb sp!, {r3, lr}
    str r2, [r0, #0x10]
    ldrsb r2, [r0, #0x1c]
    cmp r2, r1
    strneb r1, [r0, #0x1c]
    movne r2, #0x10
    strne r2, [r0, #0x14]
    ldr r2, [r0, #0x14]
    cmp r2, #0x0
    ldrnesb r2, [r0, #0x1f]
    cmpne r2, r1
    ldmneia sp!, {r3, pc}
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x10]
    ldr r0, [r2, #0x88]
    mov r2, #0x0
    blx func_ov012_021bd730
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02159de4

    .global func_ov000_02159e2c
    arm_func_start func_ov000_02159e2c
func_ov000_02159e2c: ; 0x02159e2c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    subs r0, r0, #0x1
    str r0, [r4, #0x14]
    ldmneia sp!, {r4, pc}
    ldrsb r1, [r4, #0x1c]
    ldrsb r0, [r4, #0x1f]
    cmp r1, r0
    ldmeqia sp!, {r4, pc}
    strb r1, [r4, #0x1f]
    ldr r0, [r4, #0x0]
    ldrsb r1, [r4, #0x1c]
    ldr r0, [r0, #0x88]
    bl func_ov012_021bd590
    ldr r0, [r4, #0x0]
    ldr r1, [r4, #0x10]
    ldr r0, [r0, #0x88]
    mov r2, #0x0
    blx func_ov012_021bd730
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_02159e2c

    .global func_ov000_02159e8c
    arm_func_start func_ov000_02159e8c
func_ov000_02159e8c: ; 0x02159e8c
    ldr ip, .L_02159e98
    ldr r0, [r0, #0x4]
    bx ip
.L_02159e98: .word func_ov012_021b65e0
    arm_func_end func_ov000_02159e8c

    .global func_ov000_02159e9c
    arm_func_start func_ov000_02159e9c
func_ov000_02159e9c: ; 0x02159e9c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r4, [r0, #0x10]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    blx func_ov012_021b65d8
    ldr r0, [r4, #0x0]
    bl func_ov000_02158820
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_02159e9c

    .global func_ov000_02159ed0
    arm_func_start func_ov000_02159ed0
func_ov000_02159ed0: ; 0x02159ed0
    ldr ip, .L_02159ee0
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    bx ip
.L_02159ee0: .word func_ov012_021b6214
    arm_func_end func_ov000_02159ed0

    .global func_ov000_02159ee4
    arm_func_start func_ov000_02159ee4
func_ov000_02159ee4: ; 0x02159ee4
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x170]
    blx r2
    bl func_ov000_0214ed84
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    blx func_ov012_021b6214
    ldmia sp!, {r3, pc}
    arm_func_end func_ov000_02159ee4

    .global func_ov000_02159f18
    arm_func_start func_ov000_02159f18
func_ov000_02159f18: ; 0x02159f18
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r5, [r0, #0x124]
    ldr r0, [r4, #0xc]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x198]
    blx r2
    ldr r0, [r4, #0x18]
    cmp r5, r0
    bne .L_02159f60
    ldrsb r1, [r4, #0x1e]
    mov r0, r4
    mov r2, #0x26
    bl func_ov000_02159de4
    ldmia sp!, {r3, r4, r5, pc}
.L_02159f60:
    add r0, r4, r5
    ldrsb r1, [r0, #0x20]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_02159f88
    ldrsb r1, [r4, #0x1e]
    mov r0, r4
    mov r2, #0x25
    bl func_ov000_02159de4
    ldmia sp!, {r3, r4, r5, pc}
.L_02159f88:
    mov r0, r4
    mov r2, #0x24
    bl func_ov000_02159de4
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_02159f18

    .global func_ov000_02159f98
    arm_func_start func_ov000_02159f98
func_ov000_02159f98: ; 0x02159f98
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x194]
    blx r1
    mov r5, r0
    ldr r0, [r6, #0x4]
    blx func_ov012_021b7170
    mvn r0, #0x0
    cmp r5, r0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x18]
    mov r1, #0x0
    cmp r5, r0
    mov r0, #0x78
    bne .L_0215a008
    bl func_0207342c
    ldrsb r1, [r4, #0x1e]
    mov r0, r4
    mov r2, #0x1b
    bl func_ov000_02159de4
    mov r0, r4
    bl func_ov000_021596f0
    ldmia sp!, {r4, r5, r6, pc}
.L_0215a008:
    bl func_0207342c
    add r0, r4, r5
    ldrsb r1, [r0, #0x20]
    ldrsb r0, [r4, #0x1d]
    mov r2, #0x1b
    cmp r0, r1
    bne .L_0215a034
    ldrsb r1, [r4, #0x1e]
    mov r0, r4
    bl func_ov000_02159de4
    b .L_0215a044
.L_0215a034:
    strb r1, [r4, #0x1d]
    ldrsb r1, [r4, #0x1d]
    mov r0, r4
    bl func_ov000_02159de4
.L_0215a044:
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4c]
    ldr r5, [r0, #0x4]
    ldr r0, [r5, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r0, [r4, #0x0]
    ldrsb r1, [r4, #0x1d]
    ldr r0, [r0, #0x88]
    blx func_ov012_021bd710
    ldr r2, [r4, #0x0]
    mov r1, r0
    ldr r0, [r2, #0x4c]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    mov r0, r4
    bl func_ov000_021596f0
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_02159f98

    .global func_ov000_0215a0ac
    arm_func_start func_ov000_0215a0ac
func_ov000_0215a0ac: ; 0x0215a0ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    ldr r0, [r4, #0x4]
    mov r2, #0x1b
    ldr r4, [r0, #0x10]
    ldrsb r1, [r4, #0x1e]
    mov r0, r4
    bl func_ov000_02159de4
    mov r0, r4
    bl func_ov000_021596f0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215a0ac

    .global func_ov000_0215a0e4
    arm_func_start func_ov000_0215a0e4
func_ov000_0215a0e4: ; 0x0215a0e4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x3c
    ldr r1, .L_0215a7f8
    mov r4, r0
    ldr r2, .L_0215a7fc
    mov r0, #0x2c
    mov r3, #0xbb
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x2c
    mov r9, r0
    bl func_020517fc
    ldr r1, .L_0215a800
    ldr r2, .L_0215a804
    ldr r3, .L_0215a808
    mov r0, #0x78
    str r4, [r9, #0x0]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215a140
    ldr r1, .L_0215a80c
    mov r2, #0x1
    bl func_02024064
.L_0215a140:
    bl func_ov000_0214ed84
    str r0, [r9, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_0203b404
    ldr r2, [r9, #0x4]
    mov r1, #0x82
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215a810
    ldr r3, .L_0215a814
    mov r1, #0xb10000
    bl func_ov000_021583dc
    ldr r0, .L_0215a818
    ldr r0, [r0, #0x8d8]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0215a218
    bl func_0203b404
    ldr r1, [r9, #0x4]
    ldr r3, .L_0215a814
    str r1, [sp, #0x0]
    mov r1, #0x81
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215a81c
    mov r1, #0xb10000
    bl func_ov000_021583dc
    bl func_0203b404
    ldr r1, [r9, #0x4]
    ldr r3, .L_0215a814
    str r1, [sp, #0x0]
    mov r1, #0x81
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215a820
    mov r1, #0xb10000
    bl func_ov000_021583dc
    bl func_0203b404
    ldr r2, [r9, #0x4]
    mov r1, #0x81
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215a824
    ldr r3, .L_0215a814
    mov r1, #0xb10000
    bl func_ov000_021583dc
.L_0215a218:
    ldr r0, .L_0215a818
    ldr r0, [r0, #0x8d8]
    tst r0, #0x20
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0215a25c
    bl func_0203b404
    ldr r1, [r9, #0x4]
    ldr r3, .L_0215a814
    str r1, [sp, #0x0]
    mov r1, #0x81
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215a828
    mov r1, #0xb10000
    bl func_ov000_021583dc
.L_0215a25c:
    ldr r1, .L_0215a82c
    ldr r2, .L_0215a830
    ldr r3, .L_0215a834
    mov r0, #0xcc
    bl func_0201a21c
    movs r4, r0
    beq .L_0215a28c
    ldr r1, .L_0215a838
    ldr r2, .L_0215a83c
    mov r3, #0x0
    blx func_ov012_021af26c
    mov r4, r0
.L_0215a28c:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215a2a8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215a2a8:
    ldr r4, [r4, #0x18]
    mov r1, #0x0
    mov r2, r4
    mov r3, r1
    mov r0, #0x2
    blx func_ov012_021b3b7c
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215a840
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xb0]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0215a2e4
    bl func_ov000_0214ed84
.L_0215a2e4:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0x2c]
    cmp r5, #0x0
    bne .L_0215a304
    ldr r0, [r0, #0x20]
    bl func_02036430
    mov r5, r0
.L_0215a304:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_0215a320
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215a320:
    mov r0, #0x80
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x18]
    mov r1, #0x11
    mov r2, #0xf
    mov r3, #0x5
    bl func_0206ad90
    mov r2, #0x0
    ldr r1, .L_0215a844
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x16]
    mov r1, #0x1e
    strb r1, [r0, #0x1a]
    mov r1, #0x1
    strb r1, [r0, #0x1c]
    strb r1, [r0, #0x1b]
    str r0, [r9, #0x24]
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215a848
    mov r2, #0x2
    mov r0, #0x0
    str r2, [r1, #0x0]
    bl func_ov000_021584a4
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r0, #0xa1000
    str r0, [sp, #0x10]
    mov r0, r4
    add r1, sp, #0x10
    bl func_ov000_0214eed0
    ldr r0, [r4, #0x4]
    bl func_02023940
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    ldr r5, [r4, #0x4]
    ldr r0, .L_0215a84c
    bl func_020326b0
    mov r3, r0
    mov r0, r5
    ldr r5, [r0, #0x0]
    ldr r1, .L_0215a84c
    ldr r5, [r5, #0x40]
    add r2, sp, #0x34
    blx r5
    mov r1, r0
    ldr r2, [sp, #0x34]
    add r0, sp, #0x8
    bl func_0202c4a4
    mov r0, #0x0
    str r0, [sp, #0x18]
    mov r0, #0x100000
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    add r2, sp, #0x18
    bl func_ov000_0214f418
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x0
    bl func_02023c60
    mov r3, #0x0
    add r1, sp, #0x1c
    add r2, sp, #0x20
    mov r0, r4
    str r3, [sp, #0x20]
    str r3, [sp, #0x1c]
    bl func_ov000_0214f418
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    ldr r2, .L_0215a850
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    bl func_02023c70
    ldr r0, [r4, #0x4]
    bl func_020239a0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0x68]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xac]
    blx r2
    mov r0, #0x0
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    mov r0, r4
    add r1, sp, #0x24
    add r2, sp, #0x28
    bl func_ov000_0214f418
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x0
    bl func_02023c60
    mov r0, #0x0
    str r0, [sp, #0x30]
    mov r0, #0x100000
    str r0, [sp, #0x2c]
    mov r0, r4
    add r1, sp, #0x2c
    add r2, sp, #0x30
    bl func_ov000_0214f418
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r2, #0x8
    bl func_02023c60
    ldr r0, [r4, #0x4]
    ldr r1, [sp, #0x8]
    ldr r2, .L_0215a850
    ldr r3, [sp, #0xc]
    bl func_02023c80
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_02023c70
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    blx func_ov012_021b4034
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    blx func_ov012_021b409c
    ldr r0, [r4, #0x4]
    mov r2, #0x30
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215a854
    mov r1, #0x8
    bl func_02027834
    str r4, [r9, #0x8]
    ldr r7, .L_0215a858
    ldr r5, .L_0215a814
    ldr r4, .L_0215a85c
    mov r8, #0x0
    mov r11, #0xa1000
.L_0215a584:
    mov r0, #0xc
    mul r6, r8, r0
    add r10, r7, r6
    ldrb r3, [r10, #0x4]
    mov r2, #0xc
    ldr r1, [r9, #0x8]
    mla r2, r3, r2, r5
    ldrb r3, [r10, #0x5]
    mov r0, r9
    add r3, r4, r3, lsl #0x3
    bl func_ov000_0215858c
    add r1, r9, r8, lsl #0x2
    str r0, [r1, #0xc]
    ldr r0, [r0, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0xc]
    ldr r2, [r10, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, #0x8
    bl func_02027834
    add r2, r9, r8, lsl #0x2
    ldr r0, [r2, #0xc]
    ldr r3, [r7, r6]
    ldr r0, [r0, #0x4]
    add r1, sp, #0x38
    str r3, [r0, #0xdc]
    ldr r0, [r2, #0xc]
    ldr r0, [r0, #0x4]
    str r8, [r0, #0x124]
    str r11, [sp, #0x38]
    ldr r0, [r2, #0xc]
    bl func_ov000_0214eed0
    add r8, r8, #0x1
    cmp r8, #0x6
    blt .L_0215a584
    mov r4, #0x0
.L_0215a620:
    cmp r4, #0x0
    bne .L_0215a63c
    add r0, r9, r4, lsl #0x2
    ldr r0, [r0, #0xc]
    ldr r1, [r9, #0x20]
    bl func_ov000_02158158
    b .L_0215a64c
.L_0215a63c:
    add r1, r9, r4, lsl #0x2
    ldr r0, [r1, #0xc]
    ldr r1, [r1, #0x8]
    bl func_ov000_02158158
.L_0215a64c:
    cmp r4, #0x5
    bne .L_0215a668
    add r0, r9, r4, lsl #0x2
    ldr r0, [r0, #0xc]
    ldr r1, [r9, #0xc]
    bl func_ov000_02158194
    b .L_0215a678
.L_0215a668:
    add r1, r9, r4, lsl #0x2
    ldr r0, [r1, #0xc]
    ldr r1, [r1, #0x10]
    bl func_ov000_02158194
.L_0215a678:
    add r4, r4, #0x1
    cmp r4, #0x6
    blt .L_0215a620
    ldr r0, .L_0215a818
    ldr r0, [r0, #0x8d8]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0215a6e8
    ldr r0, [r9, #0x10]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r9, #0xc]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r9, #0x14]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_0215a6e8:
    ldr r0, .L_0215a818
    ldr r0, [r0, #0x8d8]
    tst r0, #0x20
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0215a71c
    ldr r0, [r9, #0x18]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
.L_0215a71c:
    ldr r0, .L_0215a860
    ldr r1, [r9, #0x8]
    ldr r3, [r0, #0x0]
    ldr r2, .L_0215a864
    mov r0, r9
    bl func_ov000_0215858c
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02023820
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0xaa]
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    strb r1, [r0, #0xab]
    ldr r0, [r4, #0x4]
    mov r1, #0x20
    blx func_ov012_021b77a8
    ldr r0, [r4, #0x4]
    mov r2, #0x4
    mov r1, r0
    blx func_ov012_021b4104
    ldr r0, [r4, #0x4]
    ldr r2, .L_0215a868
    mov r1, #0x8
    bl func_02027834
    ldmib r9, {r0, r1}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_0215a7ac
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_0215a7bc
.L_0215a7ac:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_0215a7bc:
    ldr r1, .L_0215a848
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r1, #0x3
    mov r2, #0x1
    bl func_ov012_021ba49c
    str r0, [r9, #0x28]
    mov r1, #0x0
    bl func_ov012_021bad80
    ldr r0, [r9, #0x8]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    mov r0, r9
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215a7f8: .word data_ov000_02161708
.L_0215a7fc: .word data_ov000_021616f0
.L_0215a800: .word data_ov000_02161148
.L_0215a804: .word data_ov000_0216167c
.L_0215a808: .word 0x4c3
.L_0215a80c: .word func_02024a30
.L_0215a810: .word 0xb10009
.L_0215a814: .word data_ov000_0216169c
.L_0215a818: .word data_020b02b8
.L_0215a81c: .word 0xb1000a
.L_0215a820: .word 0xb1000b
.L_0215a824: .word 0xb1000c
.L_0215a828: .word 0xb1000d
.L_0215a82c: .word data_ov000_02161154
.L_0215a830: .word data_ov000_02161684
.L_0215a834: .word 0x1de
.L_0215a838: .word func_ov000_0215a9a0
.L_0215a83c: .word func_ov000_0215aa18
.L_0215a840: .word 0x31305053
.L_0215a844: .word 0x8df
.L_0215a848: .word data_ov012_021d5154
.L_0215a84c: .word data_ov000_02161720
.L_0215a850: .word 0x494c
.L_0215a854: .word func_ov000_0215ac08
.L_0215a858: .word data_ov000_021601a4
.L_0215a85c: .word data_ov000_0216168c
.L_0215a860: .word data_02093bf4
.L_0215a864: .word data_02093c8c
.L_0215a868: .word func_ov000_0215b008
    arm_func_end func_ov000_0215a0e4

    .global func_ov000_0215a86c
    arm_func_start func_ov000_0215a86c
func_ov000_0215a86c: ; 0x0215a86c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_0215a884
    bl func_ov012_021bab64
.L_0215a884:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_0215a894
    bl func_0206ae98
.L_0215a894:
    mov r0, #0x2
    blx func_ov012_021b526c
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215a8b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215a8b4:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0215a8cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215a8cc:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215a86c

    .global func_ov000_0215a8d8
    arm_func_start func_ov000_0215a8d8
func_ov000_0215a8d8: ; 0x0215a8d8
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    ldr r0, [r4, #0x8]
    mov r1, #0x10
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
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
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r2, #0x0
    b .L_0215a990
.L_0215a964:
    add r0, r4, r2, lsl #0x2
    ldr r0, [r0, #0xc]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x90]
    and r1, r1, #0x8
    cmp r1, #0x8
    beq .L_0215a98c
    mov r1, #0x1
    blx func_ov012_021b6214
    b .L_0215a998
.L_0215a98c:
    add r2, r2, #0x1
.L_0215a990:
    cmp r2, #0x6
    blt .L_0215a964
.L_0215a998:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215a8d8

    .global func_ov000_0215a9a0
    arm_func_start func_ov000_0215a9a0
func_ov000_0215a9a0: ; 0x0215a9a0
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x24
    mov lr, #0x0
    mov ip, #0x1000
    mov r4, r0
    add r0, sp, #0x18
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    str lr, [sp, #0xc]
    str lr, [sp, #0x10]
    str ip, [sp, #0x14]
    bl func_ov000_02151038
    bl func_0203b404
    str r4, [sp, #0x0]
    mov r1, #0x80
    str r1, [sp, #0x4]
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215aa14
    add r3, sp, #0x18
    mov r1, #0xb10000
    bl func_ov000_021583dc
    mov r0, #0x80000
    str r0, [sp, #0x8]
    add r1, sp, #0x8
    mov r0, r4
    bl func_ov000_0214eed0
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, pc}
.L_0215aa14: .word 0xb10007
    arm_func_end func_ov000_0215a9a0

    .global func_ov000_0215aa18
    arm_func_start func_ov000_0215aa18
func_ov000_0215aa18: ; 0x0215aa18
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x94]
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_0215aa40
    bl func_ov000_0214ed84
    mov r5, r0
.L_0215aa40:
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_0215aa54
    bl func_ov000_0214ed84
.L_0215aa54:
    ldr r2, [r4, #0x4]
    ldr r1, [r5, #0x4]
    ldrsh r0, [r2, #0xa2]
    ldr r5, [r1, #0x124]
    add r1, sp, #0x4
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x0]
    ldrsh r3, [r2, #0xa0]
    add r2, sp, #0x0
    mov r0, r4
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x4]
    bl func_ov000_0214f418
    cmp r5, #0x5
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    bne .L_0215aaa4
    ldr r1, .L_0215aab4
    bl func_02023894
    b .L_0215aaac
.L_0215aaa4:
    ldr r1, .L_0215aab8
    bl func_02023894
.L_0215aaac:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0215aab4: .word 0xb10008
.L_0215aab8: .word 0xb10007
    arm_func_end func_ov000_0215aa18

    .global func_ov000_0215aabc
    arm_func_start func_ov000_0215aabc
func_ov000_0215aabc: ; 0x0215aabc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x8]
    mov r4, #0x0
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    bl func_0203b3e4
    mov r1, #0x37
    ldr r0, [r0, #0x88]
    sub r2, r1, #0x3f
    bl func_ov000_0215abdc
    mov r2, r4
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0x28]
    mov r1, #0x79
    mov r3, r2
    bl func_ov012_021bac28
    ldr r6, .L_0215abd8
    b .L_0215ab20
.L_0215ab18:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215ab20:
    ldr r0, [r5, #0x28]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_0215ab18
    ldr r0, [r5, #0x28]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    beq .L_0215ab94
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0x28]
    mov r3, r2
    mov r1, #0x7a
    bl func_ov012_021bac28
    ldr r6, .L_0215abd8
    b .L_0215ab74
.L_0215ab6c:
    ldr r0, [r6, #0x0]
    blx r0
.L_0215ab74:
    ldr r0, [r5, #0x28]
    bl func_ov012_021bad2c
    cmp r0, #0x0
    beq .L_0215ab6c
    ldr r0, [r5, #0x28]
    bl func_ov012_021bacfc
    cmp r0, #0x0
    movne r4, #0x1
.L_0215ab94:
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65e0
    ldr r0, [r5, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    blx func_ov012_021b6214
    cmp r4, #0x0
    bne .L_0215abcc
    bl func_0203b3e4
    mov r1, #0x36
    ldr r0, [r0, #0x88]
    sub r2, r1, #0x3e
    bl func_ov000_0215abdc
.L_0215abcc:
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0215abd8: .word data_020a0e18
    arm_func_end func_ov000_0215aabc

    .global func_ov000_0215abdc
    arm_func_start func_ov000_0215abdc
func_ov000_0215abdc: ; 0x0215abdc
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
    arm_func_end func_ov000_0215abdc

    .global func_ov000_0215ac08
    arm_func_start func_ov000_0215ac08
func_ov000_0215ac08: ; 0x0215ac08
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r4, r0
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215acd0
    cmp r0, r1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x10
    beq .L_0215ac54
    cmp r0, #0x20
    beq .L_0215ac60
    ldmia sp!, {r4, r5, r6, pc}
.L_0215ac54:
    ldr r0, [r4, #0x4]
    blx func_ov012_021b65e0
    ldmia sp!, {r4, r5, r6, pc}
.L_0215ac60:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r5, [r0, #0x10]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x4]
    blx func_ov012_021b65d8
    mov r6, #0x0
    b .L_0215acac
.L_0215ac88:
    ldr r0, [r4, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x170]
    blx r2
    bl func_ov000_0214ed84
    ldr r0, [r0, #0x4]
    blx func_ov012_021b7210
    add r6, r6, #0x1
.L_0215acac:
    ldr r0, [r4, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x16c]
    blx r1
    cmp r6, r0
    blo .L_0215ac88
    ldr r0, [r5, #0x0]
    bl func_ov000_021587b8
    ldmia sp!, {r4, r5, r6, pc}
.L_0215acd0: .word 0x80011001
    arm_func_end func_ov000_0215ac08

    .global func_ov000_0215acd4
    arm_func_start func_ov000_0215acd4
func_ov000_0215acd4: ; 0x0215acd4
    ldr r0, [r0, #0x4]
    ldr ip, .L_0215acf8
    ldr r1, [r0, #0x10]
    ldr r0, [r0, #0x124]
    ldr r3, [r1, #0x0]
    add r1, r0, #0x1d
    mov r2, #0x0
    ldr r0, [r3, #0x88]
    bx ip
.L_0215acf8: .word func_ov012_021bd730
    arm_func_end func_ov000_0215acd4

    .global func_ov000_0215acfc
    arm_func_start func_ov000_0215acfc
func_ov000_0215acfc: ; 0x0215acfc
    ldr r0, [r0, #0x4]
    ldr ip, .L_0215ad1c
    ldr r0, [r0, #0x10]
    mov r1, #0x23
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    ldr r0, [r0, #0x88]
    bx ip
.L_0215ad1c: .word func_ov012_021bd730
    arm_func_end func_ov000_0215acfc

    .global func_ov000_0215ad20
    arm_func_start func_ov000_0215ad20
func_ov000_0215ad20: ; 0x0215ad20
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215ad98
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov000_0215aabc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    str r1, [r0, #0xa4]
    ldr r0, [r4, #0x0]
    bl func_ov000_021586ac
    ldmia sp!, {r3, r4, r5, pc}
.L_0215ad98: .word 0x80011000
    arm_func_end func_ov000_0215ad20

    .global func_ov000_0215ad9c
    arm_func_start func_ov000_0215ad9c
func_ov000_0215ad9c: ; 0x0215ad9c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215ae14
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov000_0215aabc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    mov r1, #0x2
    str r1, [r0, #0xa4]
    ldr r0, [r4, #0x0]
    bl func_ov000_021586ac
    ldmia sp!, {r3, r4, r5, pc}
.L_0215ae14: .word 0x80011000
    arm_func_end func_ov000_0215ad9c

    .global func_ov000_0215ae18
    arm_func_start func_ov000_0215ae18
func_ov000_0215ae18: ; 0x0215ae18
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215ae90
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov000_0215aabc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    mov r1, #0x3
    str r1, [r0, #0xa4]
    ldr r0, [r4, #0x0]
    bl func_ov000_021586ac
    ldmia sp!, {r3, r4, r5, pc}
.L_0215ae90: .word 0x80011000
    arm_func_end func_ov000_0215ae18

    .global func_ov000_0215ae94
    arm_func_start func_ov000_0215ae94
func_ov000_0215ae94: ; 0x0215ae94
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215af0c
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov000_0215aabc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    mov r1, #0x4
    str r1, [r0, #0xa4]
    ldr r0, [r4, #0x0]
    bl func_ov000_021586ac
    ldmia sp!, {r3, r4, r5, pc}
.L_0215af0c: .word 0x80011000
    arm_func_end func_ov000_0215ae94

    .global func_ov000_0215af10
    arm_func_start func_ov000_0215af10
func_ov000_0215af10: ; 0x0215af10
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215af88
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    mov r0, r4
    bl func_ov000_0215aabc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x0]
    mov r1, #0x5
    str r1, [r0, #0xa4]
    ldr r0, [r4, #0x0]
    bl func_ov000_021586ac
    ldmia sp!, {r3, r4, r5, pc}
.L_0215af88: .word 0x80011000
    arm_func_end func_ov000_0215af10

    .global func_ov000_0215af8c
    arm_func_start func_ov000_0215af8c
func_ov000_0215af8c: ; 0x0215af8c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215b004
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x0
    bl func_0207342c
    ldr r0, [r4, #0x8]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldmia sp!, {r3, r4, r5, pc}
.L_0215b004: .word 0x80011000
    arm_func_end func_ov000_0215af8c

    .global func_ov000_0215b008
    arm_func_start func_ov000_0215b008
func_ov000_0215b008: ; 0x0215b008
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r0, #0x4]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r4, [r2, #0x10]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r1, .L_0215b080
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x78
    mov r1, #0x1
    bl func_0207342c
    ldr r0, [r4, #0x8]
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    blx func_ov012_021b65d8
    ldmia sp!, {r3, r4, r5, pc}
.L_0215b080: .word 0x80011000
    arm_func_end func_ov000_0215b008

    .global func_ov000_0215b084
    arm_func_start func_ov000_0215b084
func_ov000_0215b084: ; 0x0215b084
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x54
    ldr r1, .L_0215b70c
    mov r4, r0
    ldr r2, .L_0215b710
    mov r0, #0x1e4
    mov r3, #0xa0
    bl func_0201a21c
    movs r10, r0
    movne r0, #0x0
    strne r0, [r10, #0x68]
    strne r0, [r10, #0xc4]
    strne r0, [r10, #0x120]
    strne r0, [r10, #0x17c]
    mov r0, r10
    mov r1, #0x0
    mov r2, #0x1e4
    bl func_020517fc
    mov r1, #0x0
    ldr r0, .L_0215b714
    mov r2, r1
    str r4, [r10, #0x0]
    bl func_02033410
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne .L_0215b0fc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215b0fc:
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    str r0, [r10, #0xc]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r10, #0x40]
    mov r1, #0x0
    strb r1, [r10, #0x1b4]
    mov r0, #0x1
    ldr r5, .L_0215b718
    mov r2, #0x58
    b .L_0215b168
.L_0215b134:
    mov r3, r4, lsr #0x5
    add r3, r5, r3, lsl #0x2
    ldr r3, [r3, #0x8e4]
    and r4, r4, #0x1f
    tst r3, r0, lsl r4
    beq .L_0215b164
    ldrb r3, [r10, #0x1b4]
    add r3, r10, r3
    strb r1, [r3, #0x1b8]
    ldrb r3, [r10, #0x1b4]
    add r3, r3, #0x1
    strb r3, [r10, #0x1b4]
.L_0215b164:
    add r1, r1, #0x1
.L_0215b168:
    mul r3, r1, r2
    ldr r4, [r10, #0x40]
    ldr r4, [r4, r3]
    cmp r4, #0x0
    bne .L_0215b134
    bl func_02020d90
    str r0, [r10, #0x4]
    ldr r0, [r0, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x4]
    ldr r1, .L_0215b71c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    bl func_02026f94
    str r0, [r10, #0x8]
    ldr r0, [r0, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x8]
    ldr r1, .L_0215b720
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x8]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r0, .L_0215b724
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x1c]
    ldr r0, .L_0215b728
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x10]
    ldr r0, .L_0215b72c
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x14]
    ldr r0, .L_0215b730
    mov r1, #0x0
    blx func_020101f4
    str r0, [r10, #0x18]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215b734
    ldr r1, .L_0215b738
    bl func_ov000_0214ec98
    str r0, [r10, #0x24]
    mov r0, #0x1
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215b73c
    ldr r1, .L_0215b740
    bl func_ov000_0214ec98
    str r0, [r10, #0x28]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215b734
    ldr r1, .L_0215b738
    bl func_ov000_0214ec98
    str r0, [r10, #0x2c]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215b744
    ldr r1, .L_0215b738
    bl func_ov000_0214ec98
    str r0, [r10, #0x34]
    mov r0, #0x1
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215b73c
    ldr r1, .L_0215b740
    bl func_ov000_0214ec98
    str r0, [r10, #0x38]
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215b744
    ldr r1, .L_0215b738
    bl func_ov000_0214ec98
    str r0, [r10, #0x3c]
    ldr r4, [r10, #0x28]
    mov r0, #0x100000
    str r0, [sp, #0x30]
    sub r0, r0, #0x200000
    str r0, [sp, #0x2c]
    mov r0, #0x0
    str r0, [sp, #0x28]
    add r0, sp, #0x48
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    bl func_ov000_02151038
    ldr r2, .L_0215b748
    add r0, sp, #0x34
    mov r1, r4
    add r7, sp, #0x48
    bl func_ov000_02150d54
    ldr r1, .L_0215b74c
    ldr r2, .L_0215b750
    ldr r3, .L_0215b754
    mov r0, #0x4c
    ldr r5, [sp, #0x38]
    ldr r6, [sp, #0x34]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215b380
    ldr r2, .L_0215b758
    ldr r1, .L_0215b75c
    str r2, [sp, #0x0]
    stmib sp, {r1, r7}
    mov r1, #0x400
    mov r3, r5
    str r1, [sp, #0xc]
    mov r5, #0x2
    mov r2, r6
    mov r1, #0x0
    str r5, [sp, #0x10]
    bl func_02013264
.L_0215b380:
    bl func_ov000_021556a0
    mov r1, r0
    mov r0, r4
    bl func_02020f38
    mov r1, #0x100000
    ldr r6, [r10, #0x38]
    sub r2, r1, #0x200000
    mov r3, #0x0
    str r1, [sp, #0x1c]
    str r2, [sp, #0x18]
    str r3, [sp, #0x14]
    add r0, sp, #0x3c
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov000_02151038
    ldr r2, .L_0215b748
    add r0, sp, #0x20
    mov r1, r6
    add r7, sp, #0x3c
    bl func_ov000_02150d54
    ldr r1, .L_0215b74c
    ldr r2, .L_0215b750
    ldr r3, .L_0215b754
    mov r0, #0x4c
    ldr r4, [sp, #0x24]
    ldr r5, [sp, #0x20]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215b428
    ldr r2, .L_0215b758
    ldr r1, .L_0215b75c
    str r2, [sp, #0x0]
    stmib sp, {r1, r7}
    mov r1, #0x400
    mov r3, r4
    str r1, [sp, #0xc]
    mov r4, #0x2
    mov r2, r5
    mov r1, #0x0
    str r4, [sp, #0x10]
    bl func_02013264
.L_0215b428:
    bl func_ov000_021556a0
    mov r1, r0
    mov r0, r6
    bl func_02020f38
    bl func_0203b3e4
    ldr r2, [r0, #0x88]
    mov r0, r10
    add r1, r10, #0x44
    bl func_ov000_0215c04c
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    mov r0, #0x3
    str r1, [r10, #0x94]
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r1, [r10, #0x98]
    strb r0, [r10, #0x9d]
    mov r0, #0x1
    strb r0, [r10, #0x9e]
    bl func_0203b3f4
    ldr r2, [r0, #0x88]
    mov r0, r10
    add r1, r10, #0xa0
    bl func_ov000_0215c35c
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    mov r0, #0x3
    str r1, [r10, #0xf0]
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1
    str r1, [r10, #0xf4]
    strb r0, [r10, #0xf9]
    mov r0, #0x0
    strb r0, [r10, #0xfa]
    bl func_0203b3f4
    ldr r2, [r0, #0x88]
    mov r0, r10
    add r1, r10, #0xfc
    bl func_ov000_0215c04c
    ldr r0, [r10, #0xfc]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_0203b3f4
    ldr r1, [r0, #0x88]
    mov r0, #0x3
    str r1, [r10, #0x14c]
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r1, [r10, #0x150]
    strb r0, [r10, #0x155]
    strb r0, [r10, #0x156]
    bl func_0203b3e4
    ldr r2, [r0, #0x88]
    mov r0, r10
    add r1, r10, #0x158
    bl func_ov000_0215c35c
    ldr r0, [r10, #0x158]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    bl func_0203b3e4
    ldr r1, [r0, #0x88]
    mov r0, #0x3
    str r1, [r10, #0x1a8]
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r8, #0x60
    mov r7, #0x78
    mov r0, #0x1
    str r1, [r10, #0x1ac]
    strb r0, [r10, #0x1b1]
    strb r0, [r10, #0x1b2]
    mov r9, #0x0
    mov r6, #0x2
    mov r5, #0x8
    mov r4, r8
    mov r11, r7
.L_0215b57c:
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl func_ov000_0214eef8
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x5c]
    mov r1, r0
    ldr r0, [r10, #0x44]
    bl func_ov000_021552fc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x5c]
    ldr r1, [r10, #0x44]
    bl func_ov000_0214f3e0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x5c]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, r4
    mov r2, r11
    mov r3, #0x2
    bl func_ov000_0214eef8
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0xb8]
    mov r1, r0
    ldr r0, [r10, #0xa0]
    bl func_ov000_021552fc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xb8]
    ldr r1, [r10, #0xa0]
    bl func_ov000_0214f3e0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xb8]
    mov r1, #0x2
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    bl func_0203b3e4
    ldr r0, [r0, #0x88]
    mov r1, #0x60
    mov r2, #0x78
    mov r3, #0x2
    bl func_ov000_0214eef8
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x114]
    mov r1, r0
    ldr r0, [r10, #0xfc]
    bl func_ov000_021552fc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x114]
    ldr r1, [r10, #0xfc]
    bl func_ov000_0214f3e0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x114]
    mov r1, #0x8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x60
    mov r2, #0x78
    mov r3, #0x2
    bl func_ov000_0214eef8
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x170]
    mov r1, r0
    ldr r0, [r10, #0x158]
    bl func_ov000_021552fc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x170]
    ldr r1, [r10, #0x158]
    bl func_ov000_0214f3e0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x170]
    mov r1, #0x2
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_0215b57c
    ldr r0, [r10, #0x4]
    bl func_0206c244
    mov r0, r10
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215b70c: .word data_ov000_021617c4
.L_0215b710: .word data_ov000_02161744
.L_0215b714: .word data_ov000_021617d4
.L_0215b718: .word data_020b02b8
.L_0215b71c: .word func_ov000_0215cbbc
.L_0215b720: .word func_ov000_0215c7a8
.L_0215b724: .word data_ov000_021617ec
.L_0215b728: .word data_ov000_021617fc
.L_0215b72c: .word data_ov000_0216180c
.L_0215b730: .word data_ov000_02161824
.L_0215b734: .word data_ov000_0216183c
.L_0215b738: .word data_ov000_02161850
.L_0215b73c: .word data_ov000_02161860
.L_0215b740: .word data_ov000_0216186c
.L_0215b744: .word data_ov000_02161878
.L_0215b748: .word data_ov000_0216188c
.L_0215b74c: .word data_ov000_02161174
.L_0215b750: .word data_ov000_02161734
.L_0215b754: .word 0x2b9
.L_0215b758: .word 0x494c
.L_0215b75c: .word data_02093c8c
    arm_func_end func_ov000_0215b084

    .global func_ov000_0215b760
    arm_func_start func_ov000_0215b760
func_ov000_0215b760: ; 0x0215b760
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_0206c5b4
    add r0, r4, #0x44
    bl func_ov000_0215cb48
    add r0, r4, #0xa0
    bl func_ov000_0215cb48
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_0215b794
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b794:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq .L_0215b7ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b7ac:
    add r0, r4, #0xfc
    bl func_ov000_0215cb48
    add r0, r4, #0x158
    bl func_ov000_0215cb48
    ldr r0, [r4, #0xfc]
    cmp r0, #0x0
    beq .L_0215b7d4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b7d4:
    ldr r0, [r4, #0x158]
    cmp r0, #0x0
    beq .L_0215b7ec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b7ec:
    mov r5, #0x0
.L_0215b7f0:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0215b80c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b80c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    beq .L_0215b828
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b828:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0215b7f0
    mov r5, #0x0
.L_0215b838:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_0215b854
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215b854:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0215b838
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0215b87c
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215b87c:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215b894
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b894:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0215b8ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215b8ac:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_0215b760

    .global func_ov000_0215b8b8
    arm_func_start func_ov000_0215b8b8
func_ov000_0215b8b8: ; 0x0215b8b8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r6, r0
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
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
    mov r1, #0xc000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
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
    mov r1, #0x20
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
    mov r0, #0x1000
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x10
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
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x14]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x14
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    str r0, [sp, #0x18]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x18
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
    mov r1, #0xc000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x1c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x1c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r4, #0x1
    mov r5, #0x0
    mov r7, r4
.L_0215bd44:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0215bd68
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215bd68:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    beq .L_0215bd8c
    ldr r0, [r0, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215bd8c:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215bd44
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov000_0215b8b8

    .global func_ov000_0215bda0
    arm_func_start func_ov000_0215bda0
func_ov000_0215bda0: ; 0x0215bda0
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x44]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0xa0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_0215beac
    mov r1, #0xc00
    str r1, [r0, #0x0]
    mov r0, #0x3
    bl func_0203b424
    ldr r5, [r0, #0x88]
    bl func_0203b3e4
    str r5, [sp, #0x0]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0x44
    mov r2, #0x0
    bl func_ov000_0215c628
    ldrb r1, [r4, #0x1b5]
    mov r0, #0x3
    sub r1, r1, #0x1
    strb r1, [r4, #0x1b5]
    bl func_0203b414
    ldr r5, [r0, #0x88]
    bl func_0203b3f4
    str r5, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0xfc
    bl func_ov000_0215c628
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, .L_0215beb0
    mov r1, #0x0
    str r0, [r4, #0x68]
    str r0, [r4, #0x17c]
    ldr r0, [r4, #0xfc]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x158]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0215beac: .word data_020a10a8
.L_0215beb0: .word 0x3999
    arm_func_end func_ov000_0215bda0

    .global func_ov000_0215beb4
    arm_func_start func_ov000_0215beb4
func_ov000_0215beb4: ; 0x0215beb4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, [r6, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r4, .L_0215c044
    b .L_0215bed8
.L_0215bed0:
    ldr r0, [r4, #0x0]
    blx r0
.L_0215bed8:
    ldrb r0, [r6, #0x9c]
    cmp r0, #0x0
    bne .L_0215bed0
    ldr r4, .L_0215c044
    b .L_0215bef4
.L_0215beec:
    ldr r0, [r4, #0x0]
    blx r0
.L_0215bef4:
    ldrb r0, [r6, #0xf8]
    cmp r0, #0x0
    bne .L_0215beec
    ldr r4, .L_0215c044
    b .L_0215bf10
.L_0215bf08:
    ldr r0, [r4, #0x0]
    blx r0
.L_0215bf10:
    ldrb r0, [r6, #0x154]
    cmp r0, #0x0
    bne .L_0215bf08
    ldr r4, .L_0215c044
    b .L_0215bf2c
.L_0215bf24:
    ldr r0, [r4, #0x0]
    blx r0
.L_0215bf2c:
    ldrb r0, [r6, #0x1b0]
    cmp r0, #0x0
    bne .L_0215bf24
    ldr r0, .L_0215c048
    mov r1, #0x0
    str r1, [r0, #0x0]
    ldr r0, [r6, #0x8]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    mov r0, #0x0
    bl func_02043264
    mov r5, #0x0
    mov r4, r5
    mov r7, r5
.L_0215bf64:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x20]
    cmp r0, #0x0
    beq .L_0215bf88
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215bf88:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    beq .L_0215bfac
    ldr r0, [r0, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215bfac:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0215bf64
    ldr r0, [r6, #0x44]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xa0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, #0x44
    bl func_ov000_0215cb48
    add r0, r6, #0xa0
    bl func_ov000_0215cb48
    ldr r0, [r6, #0xfc]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x158]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, #0xfc
    bl func_ov000_0215cb48
    add r0, r6, #0x158
    bl func_ov000_0215cb48
    bl func_020737d4
    bl func_02073800
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215c044: .word data_020a0e18
.L_0215c048: .word data_020a10a8
    arm_func_end func_ov000_0215beb4

    .global func_ov000_0215c04c
    arm_func_start func_ov000_0215c04c
func_ov000_0215c04c: ; 0x0215c04c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x58
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl func_ov000_0215c2f8
    str r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r5, #0x0]
    mov r0, #0xaf000
    str r0, [sp, #0x18]
    ldr r0, .L_0215c2d8
    str r1, [sp, #0x0]
    mov r2, r4
    mov r1, r0
    add r3, sp, #0x18
    bl func_ov000_0214eddc
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r7, [r5, #0xc]
    ldr r1, [r5, #0x0]
    mov r0, #0x83000
    str r0, [sp, #0x14]
    ldr r0, .L_0215c2dc
    str r1, [sp, #0x0]
    mov r2, r4
    sub r1, r0, #0x2
    add r3, sp, #0x14
    bl func_ov000_0214eddc
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r7, [r5, #0x14]
    mov r0, #0x60000
    str r0, [sp, #0x44]
    sub r0, r0, #0xe0000
    str r0, [sp, #0x48]
    ldr r0, [r5, #0xc]
    add r1, sp, #0x48
    add r2, sp, #0x44
    bl func_ov000_0214f418
    mov r0, #0xb4000
    str r0, [sp, #0x3c]
    mov r0, #0x128000
    str r0, [sp, #0x40]
    ldr r0, [r5, #0x14]
    add r1, sp, #0x40
    add r2, sp, #0x3c
    bl func_ov000_0214f418
    ldr r0, [r5, #0x14]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x14]
    ldr r1, .L_0215c2e0
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x80000
    rsb r0, r0, #0x0
    str r0, [sp, #0x30]
    mov r0, #0x60000
    mov r7, #0x0
    str r0, [sp, #0x2c]
    add r0, sp, #0x4c
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    str r7, [sp, #0x28]
    bl func_ov000_02151038
    ldr r1, [r5, #0xc]
    ldr r2, .L_0215c2e4
    add r0, sp, #0x34
    add r7, sp, #0x4c
    bl func_ov000_02150d54
    ldr r1, .L_0215c2e8
    ldr r2, .L_0215c2ec
    ldr r3, .L_0215c2f0
    mov r0, #0x4c
    ldr r8, [sp, #0x38]
    ldr r9, [sp, #0x34]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215c1f4
    ldr r2, .L_0215c2f4
    mov r1, #0x1e
    stmia sp, {r2, r7}
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r9
    mov r3, r8
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215c1f4:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r5, #0xc]
    bl func_02020f38
    mov r10, #0x0
    mov r8, #0xb4000
    mov r11, #0x58
    mov r7, #0x30
    b .L_0215c2c4
.L_0215c218:
    add r0, r6, r10
    ldrb r1, [r0, #0x1b8]
    rsb r0, r10, #0xae
    ldr r3, [r6, #0x40]
    mul r2, r1, r11
    ldr r2, [r3, r2]
    mov r0, r0, lsl #0xc
    sub r9, r2, #0x1
    str r0, [sp, #0x24]
    mov r1, #0xe
    mov r0, r9
    bl func_0200d338
    sub r1, r9, r1
    ldr r2, [r5, #0x0]
    mov r0, r9, lsl #0x1
    mov r1, r1, lsl #0x1
    add r0, r0, #0x1000
    add r1, r1, #0x1000
    str r2, [sp, #0x0]
    add r0, r0, #0xa00000
    add r1, r1, #0xa00000
    mov r2, r4
    add r3, sp, #0x24
    bl func_ov000_0214eddc
    add r1, r10, #0x1
    mul r2, r1, r7
    add r1, r2, #0x128
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x20]
    str r8, [sp, #0x1c]
    mov r9, r0
    add r1, sp, #0x20
    add r2, sp, #0x1c
    bl func_ov000_0214f418
    ldr r0, [r9, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x4]
    ldr r1, .L_0215c2e0
    bl func_02028384
    add r10, r10, #0x1
.L_0215c2c4:
    ldrb r0, [r6, #0x1b4]
    cmp r10, r0
    blt .L_0215c218
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215c2d8: .word 0xa03000
.L_0215c2dc: .word 0xa03002
.L_0215c2e0: .word func_ov000_0215dfe8
.L_0215c2e4: .word data_ov000_0216188c
.L_0215c2e8: .word data_ov000_02160d6c
.L_0215c2ec: .word data_ov000_0216173c
.L_0215c2f0: .word 0x2ef
.L_0215c2f4: .word 0x3244
    arm_func_end func_ov000_0215c04c

    .global func_ov000_0215c2f8
    arm_func_start func_ov000_0215c2f8
func_ov000_0215c2f8: ; 0x0215c2f8
    stmdb sp!, {r4, lr}
    ldr r1, .L_0215c34c
    ldr r2, .L_0215c350
    ldr r3, .L_0215c354
    mov r0, #0x78
    bl func_0201a21c
    movs r4, r0
    beq .L_0215c328
    ldr r1, .L_0215c358
    mov r2, #0x1
    bl func_02024064
    mov r4, r0
.L_0215c328:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215c344
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215c344:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
.L_0215c34c: .word data_ov000_02161148
.L_0215c350: .word data_ov000_0216172c
.L_0215c354: .word 0x4c3
.L_0215c358: .word func_02024a30
    arm_func_end func_ov000_0215c2f8

    .global func_ov000_0215c35c
    arm_func_start func_ov000_0215c35c
func_ov000_0215c35c: ; 0x0215c35c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x60
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl func_ov000_0215c2f8
    str r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r5, #0x0]
    mov r0, #0xaf000
    str r0, [sp, #0x18]
    ldr r0, .L_0215c604
    str r1, [sp, #0x0]
    mov r2, r4
    sub r1, r0, #0x1
    add r3, sp, #0x18
    bl func_ov000_0214eddc
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r7, [r5, #0xc]
    ldr r1, [r5, #0x0]
    mov r0, #0x83000
    str r0, [sp, #0x14]
    ldr r0, .L_0215c608
    str r1, [sp, #0x0]
    mov r2, r4
    sub r1, r0, #0x3
    add r3, sp, #0x14
    bl func_ov000_0214eddc
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r7, [r5, #0x14]
    mov r0, #0x60000
    str r0, [sp, #0x4c]
    mov r0, #0x80000
    str r0, [sp, #0x50]
    ldr r0, [r5, #0xc]
    add r1, sp, #0x50
    add r2, sp, #0x4c
    bl func_ov000_0214f418
    mov r0, #0x60000
    str r0, [sp, #0x44]
    mov r0, #0x180000
    str r0, [sp, #0x48]
    ldr r0, [r5, #0xc]
    add r1, sp, #0x48
    add r2, sp, #0x44
    bl func_ov000_0214f418
    mov r0, #0xb4000
    str r0, [sp, #0x3c]
    sub r0, r0, #0xdc000
    str r0, [sp, #0x40]
    ldr r0, [r5, #0x14]
    add r1, sp, #0x40
    add r2, sp, #0x3c
    bl func_ov000_0214f418
    ldr r0, [r5, #0x14]
    mov r1, r6
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r5, #0x14]
    ldr r1, .L_0215c60c
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r9, #0x180000
    mov r8, #0x60000
    mov r7, #0x0
    add r0, sp, #0x54
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    str r9, [sp, #0x30]
    str r8, [sp, #0x2c]
    str r7, [sp, #0x28]
    bl func_ov000_02151038
    ldr r1, [r5, #0xc]
    ldr r2, .L_0215c610
    add r0, sp, #0x34
    add r7, sp, #0x54
    bl func_ov000_02150d54
    ldr r1, .L_0215c614
    ldr r2, .L_0215c618
    ldr r3, .L_0215c61c
    mov r0, #0x4c
    ldr r8, [sp, #0x38]
    ldr r9, [sp, #0x34]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215c520
    ldr r2, .L_0215c620
    mov r1, #0x1e
    stmia sp, {r2, r7}
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r9
    mov r3, r8
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215c520:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r5, #0xc]
    bl func_02020f38
    mov r10, #0x0
    mov r8, #0xb4000
    mov r11, #0x30
    mvn r7, #0x27
    b .L_0215c5f0
.L_0215c544:
    add r1, r6, r10
    ldrb r3, [r1, #0x1b8]
    rsb r1, r10, #0xae
    mov r2, r1, lsl #0xc
    mov r1, #0x58
    ldr r0, [r6, #0x40]
    smulbb r1, r3, r1
    ldr r0, [r0, r1]
    mov r1, #0xe
    sub r9, r0, #0x1
    mov r0, r9
    str r2, [sp, #0x24]
    bl func_0200d338
    sub r1, r9, r1
    ldr r2, [r5, #0x0]
    ldr r0, .L_0215c624
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1000
    str r2, [sp, #0x0]
    add r0, r0, r9, lsl #0x1
    add r1, r1, #0xa00000
    mov r2, r4
    add r3, sp, #0x24
    bl func_ov000_0214eddc
    add r1, r10, #0x1
    mul r2, r1, r11
    sub r1, r7, r2
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x20]
    str r8, [sp, #0x1c]
    mov r9, r0
    add r1, sp, #0x20
    add r2, sp, #0x1c
    bl func_ov000_0214f418
    ldr r0, [r9, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x4]
    ldr r1, .L_0215c60c
    bl func_02028384
    add r10, r10, #0x1
.L_0215c5f0:
    ldrb r0, [r6, #0x1b4]
    cmp r10, r0
    blt .L_0215c544
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215c604: .word 0xa03001
.L_0215c608: .word 0xa03003
.L_0215c60c: .word func_ov000_0215e0c8
.L_0215c610: .word data_ov000_0216188c
.L_0215c614: .word data_ov000_02160d6c
.L_0215c618: .word data_ov000_0216173c
.L_0215c61c: .word 0x2ef
.L_0215c620: .word 0x3244
.L_0215c624: .word 0xa01001
    arm_func_end func_ov000_0215c35c

    .global func_ov000_0215c628
    arm_func_start func_ov000_0215c628
func_ov000_0215c628: ; 0x0215c628
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r1
    mov r8, r0
    mov r0, r7
    bl func_ov000_0215cb48
    ldrb r1, [r8, #0x1b5]
    ldrb r0, [r8, #0x1b4]
    mov r4, #0x0
    cmp r1, r0
    bhs .L_0215c738
    mov r0, #0x1
    strb r0, [r7, #0x58]
    ldrb r0, [r8, #0x1b5]
    ldr r2, [r8, #0x40]
    mov r5, r4
    add r0, r8, r0
    ldrb r1, [r0, #0x1b8]
    mov r0, #0x58
    mov r9, #0x1c
    mla r0, r1, r0, r2
    str r0, [r7, #0x4c]
.L_0215c67c:
    add r0, r7, r5, lsl #0x2
    ldr r0, [r0, #0x18]
    bl func_ov000_0215c77c
    add r0, r7, r5, lsl #0x2
    ldr r0, [r0, #0x18]
    mul r6, r5, r9
    ldr r0, [r0, #0x4]
    ldr r1, [r7, #0x4c]
    ldr r0, [r0, #0x64]
    add r1, r1, #0x4
    ldr r2, [r0, #0x0]
    add r1, r1, r6
    ldr r2, [r2, #0x68]
    blx r2
    ldr r0, [r7, #0x4c]
    add r5, r5, #0x1
    add r0, r0, r6
    ldrsb r0, [r0, #0x4]
    cmp r0, #0x0
    addne r4, r4, #0x1
    cmp r5, #0x3
    blt .L_0215c67c
    ldr r2, .L_0215c778
    sub r1, r4, #0x1
    mov r0, #0x24
    mla r5, r1, r0, r2
    mov r4, #0x0
    mov r9, #0x1
    mov r6, #0xc
.L_0215c6f0:
    mul r0, r4, r6
    add r1, r7, r4, lsl #0x2
    ldr r1, [r1, #0x18]
    ldr r2, [r5, r0]
    ldr r1, [r1, #0x4]
    add r3, r5, r0
    ldr r0, [r1, #0x50]
    mov r1, r9
    str r2, [r0, #0xc]
    ldr r2, [r3, #0x4]
    str r2, [r0, #0x10]
    ldr r2, [r3, #0x8]
    str r2, [r0, #0x14]
    bl func_ov000_02150fb8
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0215c6f0
    b .L_0215c768
.L_0215c738:
    ldr r0, [r7, #0xc]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215c750:
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0x18]
    bl func_ov000_0215c77c
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0215c750
.L_0215c768:
    ldrb r0, [r8, #0x1b5]
    add r0, r0, #0x1
    strb r0, [r8, #0x1b5]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0215c778: .word data_ov000_02161758
    arm_func_end func_ov000_0215c628

    .global func_ov000_0215c77c
    arm_func_start func_ov000_0215c77c
func_ov000_0215c77c: ; 0x0215c77c
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
    arm_func_end func_ov000_0215c77c

    .global func_ov000_0215c7a8
    arm_func_start func_ov000_0215c7a8
func_ov000_0215c7a8: ; 0x0215c7a8
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    add r0, r4, #0x44
    bl func_ov000_0215c7d8
    add r0, r4, #0xfc
    bl func_ov000_0215c7d8
    add r0, r4, #0xa0
    bl func_ov000_0215c7d8
    add r0, r4, #0x158
    bl func_ov000_0215c7d8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215c7a8

    .global func_ov000_0215c7d8
    arm_func_start func_ov000_0215c7d8
func_ov000_0215c7d8: ; 0x0215c7d8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x440
    mov r4, r0
    ldrb r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_0215caec
    ldr r0, [r4, #0x4c]
    mov r1, #0x3
    ldr r0, [r0, #0x0]
    sub r5, r0, #0x1
    mov r0, r5
    bl func_0200d338
    mov r1, #0xa
    mov r2, #0x1
    smulbb r9, r2, r1
    add r6, sp, #0x30
    mov r7, r0
    mov r8, #0x0
    mov r10, r1
.L_0215c824:
    mov r0, r7
    mov r1, r9
    bl func_0200d338
    mul r2, r0, r9
    add r3, r0, #0x30
    mov r0, r9
    mov r1, r10
    strb r3, [r6], #0x1
    sub r7, r7, r2
    bl func_0200d338
    add r8, r8, #0x1
    mov r9, r0
    cmp r8, #0x2
    blt .L_0215c824
    ldr r1, .L_0215caf4
    mov r2, #0x0
    add r0, sp, #0x340
    strb r2, [r6, #0x0]
    bl func_02074000
    add r0, sp, #0x340
    add r1, sp, #0x30
    bl func_020741bc
    ldr r1, .L_0215caf8
    add r0, sp, #0x340
    bl func_020741bc
    add r0, sp, #0x340
    mov r1, #0x0
    blx func_020101f4
    str r0, [r4, #0x8]
    ldr r1, .L_0215cafc
    add r0, sp, #0x240
    bl func_02074000
    ldr r0, [r4, #0x4c]
    ldr r1, .L_0215cb00
    ldr r2, [r0, #0x0]
    add r0, sp, #0x240
    ldr r1, [r1, r2, lsl #0x2]
    bl func_020741bc
    ldr r1, .L_0215cb04
    add r0, sp, #0x240
    bl func_020741bc
    add r0, sp, #0x140
    add r1, sp, #0x240
    bl func_02074000
    ldr r1, .L_0215cb08
    add r0, sp, #0x140
    bl func_020741bc
    add r0, sp, #0x40
    add r1, sp, #0x240
    bl func_02074000
    ldr r1, .L_0215cb0c
    add r0, sp, #0x40
    bl func_020741bc
    ldrb r0, [r4, #0x59]
    ldr r6, [r4, #0x50]
    mov r2, #0xb0000
    cmp r0, #0x0
    mov r0, r5
    mov r1, #0x3
    beq .L_0215ca00
    str r2, [sp, #0xc]
    bl func_0200d338
    mov r0, r5, lsl #0x1
    sub r1, r5, r1
    add r0, r0, #0x1
    mov r1, r1, lsl #0x1
    mov r5, #0x0
    add r3, sp, #0xc
    mov r2, r6
    add r0, r0, #0xa00000
    add r1, r1, #0xa00000
    str r5, [sp, #0x0]
    bl func_ov000_0214eddc
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r4, #0x10]
    ldr r1, [r4, #0xc]
    mov r0, r5
    bl func_ov000_0214f3e0
    ldr r2, [r4, #0x54]
    add r0, sp, #0x140
    add r1, sp, #0x40
    bl func_ov000_0214ec98
    str r0, [r4, #0x4]
    mov r0, #0x60000
    str r0, [sp, #0x28]
    mov r0, #0x80000
    str r0, [sp, #0x2c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x2c
    add r2, sp, #0x28
    bl func_ov000_0215cb10
    mov r0, #0x48000
    str r0, [sp, #0x20]
    mov r0, #0x80000
    str r0, [sp, #0x24]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x24
    add r2, sp, #0x20
    bl func_ov000_0214f418
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x0]
    bl func_ov000_0214f3e0
    ldrb r1, [r4, #0x5a]
    cmp r1, #0x0
    beq .L_0215cae4
    mov r0, #0x1
    stmia sp, {r0, r1}
    ldr r0, [r4, #0x4c]
    ldr r2, [r4, #0x50]
    ldr r1, [r0, #0x0]
    ldr r3, [r4, #0x0]
    add r0, r4, #0x28
    bl func_ov000_0214efac
    b .L_0215cae4
.L_0215ca00:
    str r2, [sp, #0x8]
    bl func_0200d338
    sub r0, r5, r1
    mov r1, r0, lsl #0x1
    mov r5, r5, lsl #0x1
    mov r7, #0x0
    add r3, sp, #0x8
    mov r2, r6
    add r0, r5, #0xa00000
    add r1, r1, #0xa00000
    str r7, [sp, #0x0]
    bl func_ov000_0214eddc
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r4, #0x10]
    ldr r1, [r4, #0xc]
    mov r0, r5
    bl func_ov000_0214f3e0
    ldr r2, [r4, #0x54]
    add r0, sp, #0x140
    add r1, sp, #0x40
    bl func_ov000_0214ec98
    str r0, [r4, #0x4]
    mov r0, #0x48000
    str r0, [sp, #0x18]
    mov r0, #0x80000
    str r0, [sp, #0x1c]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_ov000_0214f418
    mov r0, #0x60000
    str r0, [sp, #0x10]
    mov r0, #0x80000
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x14
    add r2, sp, #0x10
    bl func_ov000_0215cb10
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x0]
    bl func_ov000_0214f3e0
    ldrb r1, [r4, #0x5a]
    cmp r1, #0x0
    beq .L_0215cae4
    mov r0, r7
    stmia sp, {r0, r1}
    ldr r0, [r4, #0x4c]
    ldr r2, [r4, #0x50]
    ldr r1, [r0, #0x0]
    ldr r3, [r4, #0x0]
    add r0, r4, #0x28
    bl func_ov000_0214efac
.L_0215cae4:
    mov r0, #0x0
    strb r0, [r4, #0x58]
.L_0215caec:
    add sp, sp, #0x440
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0215caf4: .word data_ov000_02161898
.L_0215caf8: .word data_ov000_021618a8
.L_0215cafc: .word data_ov000_021618b0
.L_0215cb00: .word data_0209e840
.L_0215cb04: .word data_ov000_021618b8
.L_0215cb08: .word data_ov000_021618c0
.L_0215cb0c: .word data_ov000_021618c8
    arm_func_end func_ov000_0215c7d8

    .global func_ov000_0215cb10
    arm_func_start func_ov000_0215cb10
func_ov000_0215cb10: ; 0x0215cb10
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
    arm_func_end func_ov000_0215cb10

    .global func_ov000_0215cb48
    arm_func_start func_ov000_0215cb48
func_ov000_0215cb48: ; 0x0215cb48
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0215cb70
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x10]
.L_0215cb70:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0215cb90
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0215cb90:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0215cbb0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_0215cbb0:
    add r0, r4, #0x28
    bl func_ov000_0214f4c0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215cb48

    .global func_ov000_0215cbbc
    arm_func_start func_ov000_0215cbbc
func_ov000_0215cbbc: ; 0x0215cbbc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    add r0, sp, #0x0
    ldr r4, [r1, #0x10]
    ldr r1, [r4, #0x58]
    bl func_ov000_0214e27c
    mov r0, #0x18000
    ldr r1, [sp, #0x0]
    rsb r0, r0, #0x0
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215cc64
    bl func_02028384
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r0, .L_0215cc68
    mov r1, #0x0
    str r0, [r4, #0x68]
    add r0, r0, #0x2800
    str r0, [r4, #0xc4]
    ldr r0, [r4, #0x110]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x110]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r0, .L_0215cc68
    str r0, [r4, #0x120]
    add r0, r0, #0x2800
    str r0, [r4, #0x17c]
    ldmia sp!, {r3, r4, r5, pc}
.L_0215cc64: .word func_ov000_0215cc6c
.L_0215cc68: .word 0x1199
    arm_func_end func_ov000_0215cbbc

    .global func_ov000_0215cc6c
    arm_func_start func_ov000_0215cc6c
func_ov000_0215cc6c: ; 0x0215cc6c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x34
    mov r5, r0
    ldr r1, [r5, #0x4]
    add r0, sp, #0x18
    ldr r4, [r1, #0x10]
    ldr r1, [r4, #0xb4]
    bl func_ov000_0214e27c
    ldr r0, [sp, #0x18]
    cmp r0, #0x118000
    ble .L_0215cda0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215cda8
    bl func_02028384
    ldr r0, [r4, #0xb4]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0xb4]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r1, .L_0215cdac
    mov r0, #0x0
    str r1, [r4, #0xc4]
    str r0, [sp, #0xc]
    mov r0, #0x60000
    str r0, [sp, #0x10]
    mov r0, #0x80000
    str r0, [sp, #0x14]
    add r0, sp, #0x28
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    bl func_ov000_02151038
    ldr r0, [r4, #0x50]
    ldr r1, .L_0215cdb0
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x28
    mov r2, #0x0
    bl func_02013c48
    ldr r0, [r4, #0x16c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r4, #0x16c]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r1, .L_0215cdac
    mov r0, #0x0
    str r1, [r4, #0x17c]
    str r0, [sp, #0x0]
    mov r0, #0x60000
    str r0, [sp, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x8]
    add r0, sp, #0x1c
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov000_02151038
    ldr r0, [r4, #0x108]
    ldr r1, .L_0215cdb0
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x1c
    mov r2, #0x0
    bl func_02013c48
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215cdb4
    bl func_02028384
.L_0215cda0:
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, pc}
.L_0215cda8: .word func_ov000_0215cdb8
.L_0215cdac: .word 0x1199
.L_0215cdb0: .word 0x564d5049
.L_0215cdb4: .word func_ov000_0215ce88
    arm_func_end func_ov000_0215cc6c

    .global func_ov000_0215cdb8
    arm_func_start func_ov000_0215cdb8
func_ov000_0215cdb8: ; 0x0215cdb8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215ce80
    ldr r6, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r6, #0x50]
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215ce84
    bl func_02028384
    mov r4, #0x1
    mov r5, #0x0
    mov r7, r4
.L_0215ce08:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x5c]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xb8]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215ce08
    add r0, r6, #0x6c
    bl func_ov000_0214f5a8
    add r0, r6, #0xc8
    bl func_ov000_0214f5a8
    mov r0, #0x4
    mov r1, #0x2
    mov r2, #0x8
    bl func_02073f64
    mov r0, #0xd
    mov r1, #0x2
    mov r2, #0x8
    bl func_02073fa4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215ce80: .word 0x564d5049
.L_0215ce84: .word func_ov000_0215d1b4
    arm_func_end func_ov000_0215cdb8

    .global func_ov000_0215ce88
    arm_func_start func_ov000_0215ce88
func_ov000_0215ce88: ; 0x0215ce88
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d014
    ldr r6, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r6, #0x50]
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d018
    bl func_02028384
    mov r4, #0x1
    mov r5, #0x0
    mov r7, r4
.L_0215ced8:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x5c]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x114]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215ced8
    add r0, r6, #0x6c
    bl func_ov000_0214f5a8
    add r0, r6, #0x124
    bl func_ov000_0214f5a8
    ldr r0, [r6, #0x24]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x34]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x2c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x3c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x44]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xa0]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x158]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xfc]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_0215d01c
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x0
    bl func_02043264
    mov r0, #0xd
    mov r1, #0x2
    mov r2, #0x8
    bl func_02073fa4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215d014: .word 0x564d5049
.L_0215d018: .word func_ov000_0215d20c
.L_0215d01c: .word data_020a0e18
    arm_func_end func_ov000_0215ce88

    .global func_ov000_0215d020
    arm_func_start func_ov000_0215d020
func_ov000_0215d020: ; 0x0215d020
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d1a8
    ldr r6, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r6, #0xac]
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d1ac
    bl func_02028384
    mov r4, #0x1
    mov r5, #0x0
    mov r7, r4
.L_0215d070:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xb8]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x170]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215d070
    add r0, r6, #0xc8
    bl func_ov000_0214f5a8
    add r0, r6, #0x180
    bl func_ov000_0214f5a8
    ldr r0, [r6, #0x24]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x34]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x2c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x3c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x44]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xa0]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x158]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xfc]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, .L_0215d1b0
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x1
    bl func_02043264
    add r0, r6, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xb6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215d1a8: .word 0x564d5049
.L_0215d1ac: .word func_ov000_0215d2e4
.L_0215d1b0: .word data_020a0e18
    arm_func_end func_ov000_0215d020

    .global func_ov000_0215d1b4
    arm_func_start func_ov000_0215d1b4
func_ov000_0215d1b4: ; 0x0215d1b4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    bl func_02073854
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02073868
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215d208
    bl func_02028384
    add r0, r4, #0x6c
    bl func_ov000_0214f7a4
    add r0, r4, #0xc8
    bl func_ov000_0214f7a4
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xb6]
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d208: .word func_ov000_0215d6c4
    arm_func_end func_ov000_0215d1b4

    .global func_ov000_0215d20c
    arm_func_start func_ov000_0215d20c
func_ov000_0215d20c: ; 0x0215d20c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    add r1, r4, #0x100
    ldrh r2, [r1, #0xb6]
    add r2, r2, #0x1
    strh r2, [r1, #0xb6]
    ldrh r1, [r1, #0xb6]
    cmp r1, #0x10
    blo .L_0215d2d8
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215d2e0
    bl func_02028384
    add r0, r4, #0x6c
    bl func_ov000_0214f7a4
    add r0, r4, #0x124
    bl func_ov000_0214f7a4
    add r0, r4, #0xa0
    bl func_ov000_0215cb48
    add r0, r4, #0x158
    bl func_ov000_0215cb48
    mov r0, #0x3
    bl func_0203b414
    ldr r5, [r0, #0x88]
    bl func_0203b3f4
    str r5, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0xa0
    mov r2, #0x1
    bl func_ov000_0215c628
    ldrb r1, [r4, #0x1b5]
    mov r0, #0x3
    sub r1, r1, #0x1
    strb r1, [r4, #0x1b5]
    bl func_0203b424
    ldr r5, [r0, #0x88]
    bl func_0203b3e4
    str r5, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0x158
    bl func_ov000_0215c628
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xb6]
.L_0215d2d8:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d2e0: .word func_ov000_0215d3bc
    arm_func_end func_ov000_0215d20c

    .global func_ov000_0215d2e4
    arm_func_start func_ov000_0215d2e4
func_ov000_0215d2e4: ; 0x0215d2e4
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    add r1, r4, #0x100
    ldrh r2, [r1, #0xb6]
    add r2, r2, #0x1
    strh r2, [r1, #0xb6]
    ldrh r1, [r1, #0xb6]
    cmp r1, #0x10
    blo .L_0215d3b0
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215d3b8
    bl func_02028384
    add r0, r4, #0xc8
    bl func_ov000_0214f7a4
    add r0, r4, #0x180
    bl func_ov000_0214f7a4
    add r0, r4, #0x44
    bl func_ov000_0215cb48
    add r0, r4, #0xfc
    bl func_ov000_0215cb48
    mov r0, #0x3
    bl func_0203b424
    ldr r5, [r0, #0x88]
    bl func_0203b3e4
    str r5, [sp, #0x0]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0x44
    mov r2, #0x0
    bl func_ov000_0215c628
    ldrb r1, [r4, #0x1b5]
    mov r0, #0x3
    sub r1, r1, #0x1
    strb r1, [r4, #0x1b5]
    bl func_0203b414
    ldr r5, [r0, #0x88]
    bl func_0203b3f4
    str r5, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0xfc
    bl func_ov000_0215c628
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0xb6]
.L_0215d3b0:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d3b8: .word func_ov000_0215d488
    arm_func_end func_ov000_0215d2e4

    .global func_ov000_0215d3bc
    arm_func_start func_ov000_0215d3bc
func_ov000_0215d3bc: ; 0x0215d3bc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, [r0, #0x4]
    ldr r6, [r1, #0x10]
    add r1, r6, #0x100
    ldrh r2, [r1, #0xb6]
    add r2, r2, #0x1
    strh r2, [r1, #0xb6]
    ldrh r1, [r1, #0xb6]
    cmp r1, #0x2c
    ldmloia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215d484
    bl func_02028384
    mov r5, #0x0
    mov r4, r5
    mov r7, r5
.L_0215d3fc:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x5c]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x114]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215d3fc
    mov r0, #0xd
    mov r1, #0x2
    mov r2, #0x8
    bl func_02073fa4
    ldr r0, [r6, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x100]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215d484: .word func_ov000_0215d554
    arm_func_end func_ov000_0215d3bc

    .global func_ov000_0215d488
    arm_func_start func_ov000_0215d488
func_ov000_0215d488: ; 0x0215d488
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, [r0, #0x4]
    ldr r6, [r1, #0x10]
    add r1, r6, #0x100
    ldrh r2, [r1, #0xb6]
    add r2, r2, #0x1
    strh r2, [r1, #0xb6]
    ldrh r1, [r1, #0xb6]
    cmp r1, #0x2c
    ldmloia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215d550
    bl func_02028384
    mov r5, #0x0
    mov r4, r5
    mov r7, r5
.L_0215d4c8:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xb8]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x170]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215d4c8
    mov r0, #0xd
    mov r1, #0x2
    mov r2, #0x8
    bl func_02073fa4
    ldr r0, [r6, #0xa4]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x15c]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215d550: .word func_ov000_0215d594
    arm_func_end func_ov000_0215d488

    .global func_ov000_0215d554
    arm_func_start func_ov000_0215d554
func_ov000_0215d554: ; 0x0215d554
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    add r0, r0, #0x100
    ldrh r1, [r0, #0xb6]
    add r1, r1, #0x1
    strh r1, [r0, #0xb6]
    bl func_02073868
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d590
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215d590: .word func_ov000_0215d5d4
    arm_func_end func_ov000_0215d554

    .global func_ov000_0215d594
    arm_func_start func_ov000_0215d594
func_ov000_0215d594: ; 0x0215d594
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    add r0, r0, #0x100
    ldrh r1, [r0, #0xb6]
    add r1, r1, #0x1
    strh r1, [r0, #0xb6]
    bl func_02073868
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d5d0
    bl func_02028384
    ldmia sp!, {r4, pc}
.L_0215d5d0: .word func_ov000_0215d64c
    arm_func_end func_ov000_0215d594

    .global func_ov000_0215d5d4
    arm_func_start func_ov000_0215d5d4
func_ov000_0215d5d4: ; 0x0215d5d4
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r5, [r0, #0x10]
    add r0, r5, #0x6c
    bl func_ov000_0214f8e0
    add r0, r5, #0x124
    bl func_ov000_0214f8e0
    add r3, r5, #0x100
    ldrh r0, [r3, #0xb6]
    add r0, r0, #0x1
    strh r0, [r3, #0xb6]
    ldrh r0, [r3, #0xb6]
    cmp r0, #0x78
    ldmlsia sp!, {r3, r4, r5, pc}
    mov ip, #0x0
    mov r0, #0xe
    mov r1, #0x2
    mov r2, #0x8
    strh ip, [r3, #0xb6]
    bl func_02073fa4
    add r0, r5, #0x6c
    bl func_ov000_0214fa3c
    add r0, r5, #0x124
    bl func_ov000_0214fa3c
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d648
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d648: .word func_ov000_0215d8b8
    arm_func_end func_ov000_0215d5d4

    .global func_ov000_0215d64c
    arm_func_start func_ov000_0215d64c
func_ov000_0215d64c: ; 0x0215d64c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r5, [r0, #0x10]
    add r0, r5, #0xc8
    bl func_ov000_0214f8e0
    add r0, r5, #0x180
    bl func_ov000_0214f8e0
    add r3, r5, #0x100
    ldrh r0, [r3, #0xb6]
    add r0, r0, #0x1
    strh r0, [r3, #0xb6]
    ldrh r0, [r3, #0xb6]
    cmp r0, #0x78
    ldmlsia sp!, {r3, r4, r5, pc}
    mov ip, #0x0
    mov r0, #0xe
    mov r1, #0x2
    mov r2, #0x8
    strh ip, [r3, #0xb6]
    bl func_02073fa4
    add r0, r5, #0xc8
    bl func_ov000_0214fa3c
    add r0, r5, #0x180
    bl func_ov000_0214fa3c
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d6c0
    bl func_02028384
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d6c0: .word func_ov000_0215db1c
    arm_func_end func_ov000_0215d64c

    .global func_ov000_0215d6c4
    arm_func_start func_ov000_0215d6c4
func_ov000_0215d6c4: ; 0x0215d6c4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    add r0, r4, #0x6c
    bl func_ov000_0214f8e0
    add r0, r4, #0xc8
    bl func_ov000_0214f8e0
    add r0, r4, #0x100
    ldrh r2, [r0, #0xb6]
    add r1, r2, #0x1
    strh r1, [r0, #0xb6]
    cmp r2, #0x78
    ldmlsia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215d73c
    bl func_02028384
    mov r0, #0x5
    mov r1, #0x2
    mov r2, #0x8
    bl func_02073f64
    mov r0, #0xe
    mov r1, #0x2
    mov r2, #0x8
    bl func_02073fa4
    add r0, r4, #0x6c
    bl func_ov000_0214fa3c
    add r0, r4, #0xc8
    bl func_ov000_0214fa3c
    ldmia sp!, {r3, r4, r5, pc}
.L_0215d73c: .word func_ov000_0215d740
    arm_func_end func_ov000_0215d6c4

    .global func_ov000_0215d740
    arm_func_start func_ov000_0215d740
func_ov000_0215d740: ; 0x0215d740
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r6, [r0, #0x10]
    bl func_02073854
    cmp r0, #0x0
    beq .L_0215d8a8
    bl func_02073868
    cmp r0, #0x0
    beq .L_0215d8a8
    ldr r0, [r4, #0x4]
    ldr r1, .L_0215d8b0
    bl func_02028384
    mov r5, #0x0
    mov r4, r5
    mov r7, r5
.L_0215d784:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x5c]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xb8]
    mov r1, r7
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215d784
    ldr r0, [r6, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0xa4]
    cmp r0, #0x0
    beq .L_0215d800
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215d800:
    add r0, r6, #0x6c
    bl func_ov000_0214fadc
    add r0, r6, #0xc8
    bl func_ov000_0214fadc
    mov r2, #0x0
    mov r3, #0x60000
    mov r4, #0x180000
    str r2, [sp, #0xc]
    str r3, [sp, #0x10]
    add r0, sp, #0x24
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    str r4, [sp, #0x14]
    bl func_ov000_02151038
    ldr r0, [r6, #0x50]
    ldr r1, .L_0215d8b4
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x24
    mov r2, #0x0
    bl func_02013c48
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x60000
    str r0, [sp, #0x4]
    sub r0, r0, #0xe0000
    str r0, [sp, #0x8]
    add r0, sp, #0x18
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov000_02151038
    ldr r0, [r6, #0xac]
    ldr r1, .L_0215d8b4
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x18
    mov r2, #0x0
    bl func_02013c48
.L_0215d8a8:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215d8b0: .word func_ov000_0215dd68
.L_0215d8b4: .word 0x564d5049
    arm_func_end func_ov000_0215d740

    .global func_ov000_0215d8b8
    arm_func_start func_ov000_0215d8b8
func_ov000_0215d8b8: ; 0x0215d8b8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x68
    mov r7, r0
    ldr r0, [r7, #0x4]
    ldr r6, [r0, #0x10]
    bl func_02073868
    cmp r0, #0x0
    beq .L_0215dae8
    mov r5, #0x0
    mov r4, r5
    mov r8, r5
.L_0215d8e4:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x5c]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x114]
    mov r1, r8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215d8e4
    ldr r0, [r6, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x100]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, #0x6c
    bl func_ov000_0214fadc
    add r0, r6, #0x124
    bl func_ov000_0214fadc
    mov r0, #0x0
    str r0, [sp, #0x2c]
    mov r0, #0x60000
    str r0, [sp, #0x30]
    mov r0, #0x180000
    str r0, [sp, #0x34]
    add r0, sp, #0x5c
    add r1, sp, #0x34
    add r2, sp, #0x30
    add r3, sp, #0x2c
    bl func_ov000_02151038
    ldr r0, [r6, #0x50]
    ldr r1, .L_0215daf0
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x5c
    mov r2, #0x0
    bl func_02013c48
    mov r0, #0x0
    str r0, [sp, #0x20]
    mov r0, #0x60000
    str r0, [sp, #0x24]
    mov r0, #0x180000
    str r0, [sp, #0x28]
    add r0, sp, #0x50
    add r1, sp, #0x28
    add r2, sp, #0x24
    add r3, sp, #0x20
    bl func_ov000_02151038
    ldr r0, [r6, #0x108]
    ldr r1, .L_0215daf0
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x50
    mov r2, #0x0
    bl func_02013c48
    ldrb r1, [r6, #0x1b4]
    ldrb r0, [r6, #0x1b5]
    cmp r1, r0
    ldr r0, [r7, #0x4]
    bhs .L_0215da20
    ldr r1, .L_0215daf4
    bl func_02028384
    b .L_0215dae8
.L_0215da20:
    ldr r1, .L_0215daf8
    bl func_02028384
    mov r0, #0x180000
    str r0, [sp, #0x1c]
    ldr r0, [r6, #0xac]
    add r1, sp, #0x1c
    bl func_ov000_0215dafc
    mov r0, #0x180000
    str r0, [sp, #0x18]
    ldr r0, [r6, #0x164]
    add r1, sp, #0x18
    bl func_ov000_0215dafc
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x60000
    str r0, [sp, #0x10]
    mov r0, #0x80000
    str r0, [sp, #0x14]
    add r0, sp, #0x44
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    bl func_ov000_02151038
    ldr r0, [r6, #0xac]
    ldr r1, .L_0215daf0
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x44
    mov r2, #0x0
    bl func_02013c48
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x60000
    str r0, [sp, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x8]
    add r0, sp, #0x38
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov000_02151038
    ldr r0, [r6, #0x164]
    ldr r1, .L_0215daf0
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x38
    mov r2, #0x0
    bl func_02013c48
.L_0215dae8:
    add sp, sp, #0x68
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0215daf0: .word 0x564d5049
.L_0215daf4: .word func_ov000_0215df38
.L_0215daf8: .word func_ov000_0215d020
    arm_func_end func_ov000_0215d8b8

    .global func_ov000_0215dafc
    arm_func_start func_ov000_0215dafc
func_ov000_0215dafc: ; 0x0215dafc
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x0]
    ldr r0, [r0, #0x50]
    ldr ip, .L_0215db18
    mov r1, #0x1
    str r2, [r0, #0xc]
    bx ip
.L_0215db18: .word func_ov000_02150fb8
    arm_func_end func_ov000_0215dafc

    .global func_ov000_0215db1c
    arm_func_start func_ov000_0215db1c
func_ov000_0215db1c: ; 0x0215db1c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x68
    mov r7, r0
    ldr r0, [r7, #0x4]
    ldr r6, [r0, #0x10]
    bl func_02073868
    cmp r0, #0x0
    beq .L_0215dd54
    mov r5, #0x0
    mov r4, r5
    mov r8, r5
.L_0215db48:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xb8]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x170]
    mov r1, r8
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215db48
    ldr r0, [r6, #0xa4]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x15c]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r6, #0xc8
    bl func_ov000_0214fadc
    add r0, r6, #0x180
    bl func_ov000_0214fadc
    mov r0, #0x0
    str r0, [sp, #0x2c]
    mov r0, #0x60000
    str r0, [sp, #0x30]
    sub r0, r0, #0xe0000
    str r0, [sp, #0x34]
    add r0, sp, #0x5c
    add r1, sp, #0x34
    add r2, sp, #0x30
    add r3, sp, #0x2c
    bl func_ov000_02151038
    ldr r0, [r6, #0xac]
    ldr r1, .L_0215dd5c
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x5c
    mov r2, #0x0
    bl func_02013c48
    mov r0, #0x0
    str r0, [sp, #0x20]
    mov r0, #0x60000
    str r0, [sp, #0x24]
    sub r0, r0, #0xe0000
    str r0, [sp, #0x28]
    add r0, sp, #0x50
    add r1, sp, #0x28
    add r2, sp, #0x24
    add r3, sp, #0x20
    bl func_ov000_02151038
    ldr r0, [r6, #0x164]
    ldr r1, .L_0215dd5c
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x50
    mov r2, #0x0
    bl func_02013c48
    ldrb r1, [r6, #0x1b4]
    ldrb r0, [r6, #0x1b5]
    cmp r1, r0
    ldr r0, [r7, #0x4]
    bhs .L_0215dc84
    ldr r1, .L_0215dd60
    bl func_02028384
    b .L_0215dd54
.L_0215dc84:
    ldr r1, .L_0215dd64
    bl func_02028384
    mov r0, #0x80000
    rsb r0, r0, #0x0
    str r0, [sp, #0x1c]
    ldr r0, [r6, #0x50]
    add r1, sp, #0x1c
    bl func_ov000_0215dafc
    mov r0, #0x80000
    rsb r0, r0, #0x0
    str r0, [sp, #0x18]
    ldr r0, [r6, #0x108]
    add r1, sp, #0x18
    bl func_ov000_0215dafc
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x60000
    str r0, [sp, #0x10]
    mov r0, #0x80000
    str r0, [sp, #0x14]
    add r0, sp, #0x44
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    bl func_ov000_02151038
    ldr r0, [r6, #0x50]
    ldr r1, .L_0215dd5c
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x44
    mov r2, #0x0
    bl func_02013c48
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x60000
    str r0, [sp, #0x4]
    mov r0, #0x80000
    str r0, [sp, #0x8]
    add r0, sp, #0x38
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov000_02151038
    ldr r0, [r6, #0x108]
    ldr r1, .L_0215dd5c
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x38
    mov r2, #0x0
    bl func_02013c48
.L_0215dd54:
    add sp, sp, #0x68
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0215dd5c: .word 0x564d5049
.L_0215dd60: .word func_ov000_0215df38
.L_0215dd64: .word func_ov000_0215ce88
    arm_func_end func_ov000_0215db1c

    .global func_ov000_0215dd68
    arm_func_start func_ov000_0215dd68
func_ov000_0215dd68: ; 0x0215dd68
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x40
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215df2c
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x50]
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    beq .L_0215df24
    ldrb r1, [r4, #0x1b4]
    ldrb r0, [r4, #0x1b5]
    cmp r1, r0
    bhs .L_0215ddcc
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl func_ov000_0214ec4c
    ldr r0, [r5, #0x4]
    bl func_020282f4
    b .L_0215df24
.L_0215ddcc:
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215df30
    bl func_02028384
    mov r0, #0x80000
    rsb r0, r0, #0x0
    str r0, [sp, #0x24]
    ldr r0, [r4, #0x50]
    add r1, sp, #0x24
    bl func_ov000_0215dafc
    mov r0, #0x180000
    str r0, [sp, #0x20]
    ldr r0, [r4, #0xac]
    add r1, sp, #0x20
    bl func_ov000_0215dafc
    mov r0, #0x0
    str r0, [sp, #0x14]
    mov r0, #0x60000
    str r0, [sp, #0x18]
    mov r0, #0x80000
    str r0, [sp, #0x1c]
    add r0, sp, #0x34
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov000_02151038
    ldr r0, [r4, #0x50]
    ldr r1, .L_0215df2c
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x34
    mov r2, #0x0
    bl func_02013c48
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, #0x60000
    str r0, [sp, #0xc]
    mov r0, #0x80000
    str r0, [sp, #0x10]
    add r0, sp, #0x28
    add r1, sp, #0x10
    add r2, sp, #0xc
    add r3, sp, #0x8
    bl func_ov000_02151038
    ldr r0, [r4, #0xac]
    ldr r1, .L_0215df2c
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    add r1, sp, #0x28
    mov r2, #0x0
    bl func_02013c48
    add r0, r4, #0x44
    bl func_ov000_0215cb48
    add r0, r4, #0xa0
    bl func_ov000_0215cb48
    ldr r0, .L_0215df34
    ldr r0, [r0, #0x0]
    blx r0
    ldr r0, .L_0215df34
    ldr r0, [r0, #0x0]
    blx r0
    mov r0, #0x3
    bl func_0203b424
    ldr r5, [r0, #0x88]
    bl func_0203b3e4
    str r5, [sp, #0x0]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0x44
    mov r2, #0x0
    bl func_ov000_0215c628
    mov r0, #0x3
    bl func_0203b414
    ldr r5, [r0, #0x88]
    bl func_0203b3f4
    str r5, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r3, [r0, #0x88]
    mov r0, r4
    add r1, r4, #0xa0
    mov r2, #0x1
    bl func_ov000_0215c628
.L_0215df24:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, pc}
.L_0215df2c: .word 0x564d5049
.L_0215df30: .word func_ov000_0215cdb8
.L_0215df34: .word data_020a0e18
    arm_func_end func_ov000_0215dd68

    .global func_ov000_0215df38
    arm_func_start func_ov000_0215df38
func_ov000_0215df38: ; 0x0215df38
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r6, #0x0
    ldr r4, [r0, #0x10]
    ldr r1, .L_0215dfe4
    ldr r0, [r4, #0x50]
    mov r2, r6
    mov r7, r6
    bl func_ov000_02155b08
    cmp r0, #0x0
    beq .L_0215df80
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    movne r6, #0x1
.L_0215df80:
    ldr r0, [r4, #0xac]
    ldr r1, .L_0215dfe4
    mov r2, #0x0
    bl func_ov000_02155b08
    cmp r0, #0x0
    beq .L_0215dfb0
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    movne r7, #0x1
.L_0215dfb0:
    cmp r6, #0x0
    cmpne r7, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrb r1, [r4, #0x1b4]
    ldrb r0, [r4, #0x1b5]
    cmp r1, r0
    ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl func_ov000_0214ec4c
    ldr r0, [r5, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0215dfe4: .word 0x564d5049
    arm_func_end func_ov000_0215df38

    .global func_ov000_0215dfe8
    arm_func_start func_ov000_0215dfe8
func_ov000_0215dfe8: ; 0x0215dfe8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r2, [r5, #0x4]
    add r0, sp, #0x14
    mov r1, r5
    ldr r4, [r2, #0x10]
    bl func_ov000_0214e27c
    mov r0, #0x18000
    ldr r1, [sp, #0x14]
    rsb r0, r0, #0x0
    cmp r1, r0
    bge .L_0215e068
    ldrb r3, [r4, #0x1b4]
    mov r2, #0x30
    add r0, sp, #0xc
    mov r1, r5
    smulbb r6, r3, r2
    bl func_ov000_0214e27c
    add r0, sp, #0xc
    ldr r2, [r0, #0x0]
    add r1, sp, #0x10
    add r2, r2, r6, lsl #0xc
    mov r0, r5
    str r2, [sp, #0x10]
    bl func_ov000_0215dafc
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0215e094
.L_0215e068:
    add r0, sp, #0x8
    mov r1, r5
    bl func_ov000_0214e27c
    ldr r0, [sp, #0x8]
    cmp r0, #0x128000
    bge .L_0215e094
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215e094:
    add r0, sp, #0x0
    mov r1, r5
    bl func_ov000_0214e27c
    ldr r3, [sp, #0x0]
    add r1, sp, #0x4
    str r3, [sp, #0x4]
    ldr r2, [r4, #0x68]
    mov r0, r5
    sub r2, r3, r2
    str r2, [sp, #0x4]
    bl func_ov000_0215dafc
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_0215dfe8

    .global func_ov000_0215e0c8
    arm_func_start func_ov000_0215e0c8
func_ov000_0215e0c8: ; 0x0215e0c8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r2, [r5, #0x4]
    add r0, sp, #0x14
    mov r1, r5
    ldr r4, [r2, #0x10]
    bl func_ov000_0214e27c
    ldr r0, [sp, #0x14]
    cmp r0, #0x118000
    ble .L_0215e13c
    ldrb r3, [r4, #0x1b4]
    mov r2, #0x30
    add r0, sp, #0xc
    mov r1, r5
    smulbb r6, r3, r2
    bl func_ov000_0214e27c
    ldr r0, [sp, #0xc]
    add r1, sp, #0x10
    sub r2, r0, r6, lsl #0xc
    mov r0, r5
    str r2, [sp, #0x10]
    bl func_ov000_0215dafc
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0215e170
.L_0215e13c:
    add r0, sp, #0x8
    mov r1, r5
    bl func_ov000_0214e27c
    mov r0, #0x28000
    ldr r1, [sp, #0x8]
    rsb r0, r0, #0x0
    cmp r1, r0
    ble .L_0215e170
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215e170:
    add r0, sp, #0x0
    mov r1, r5
    bl func_ov000_0214e27c
    add r0, sp, #0x0
    ldr r3, [r0, #0x0]
    add r1, sp, #0x4
    str r3, [sp, #0x4]
    ldr r2, [r4, #0xc4]
    mov r0, r5
    add r2, r3, r2
    str r2, [sp, #0x4]
    bl func_ov000_0215dafc
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_0215e0c8

    .global func_ov000_0215e1a8
    arm_func_start func_ov000_0215e1a8
func_ov000_0215e1a8: ; 0x0215e1a8
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
    arm_func_end func_ov000_0215e1a8

    .global func_ov000_0215e1bc
    arm_func_start func_ov000_0215e1bc
func_ov000_0215e1bc: ; 0x0215e1bc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0215e1f4
    mov r5, r0
    ldr r2, .L_0215e1f8
    mov r0, #0x70
    mov r3, #0x61
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x70
    mov r4, r0
    bl func_020517fc
    mov r0, r4
    str r5, [r4, #0x60]
    ldmia sp!, {r3, r4, r5, pc}
.L_0215e1f4: .word data_ov000_021619cc
.L_0215e1f8: .word data_ov000_02161904
    arm_func_end func_ov000_0215e1bc

    .global func_ov000_0215e1fc
    arm_func_start func_ov000_0215e1fc
func_ov000_0215e1fc: ; 0x0215e1fc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_0215e21c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215e21c:
    mov r5, #0x0
.L_0215e220:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_0215e23c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215e23c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_0215e258
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215e258:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215e220
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_0215e280
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215e280:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0215e298
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_0215e298:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0215e2b0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215e2b0:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_0215e1fc

    .global func_ov000_0215e2bc
    arm_func_start func_ov000_0215e2bc
func_ov000_0215e2bc: ; 0x0215e2bc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x84
    mov r10, r0
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x4c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x4c
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
    str r0, [sp, #0x50]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x50
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    str r0, [sp, #0x54]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x54
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
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
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
    mov r0, #0x1000
    str r0, [sp, #0x58]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x58
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
    mov r1, #0x20
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
    mov r0, #0x1000
    str r0, [sp, #0x5c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x5c
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
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x3000
    str r0, [sp, #0x60]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x60
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    str r0, [sp, #0x64]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x64
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
    mov r1, #0x40
    ldr r0, [r0, #0x4]
    mov r2, #0x20
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
    mov r0, #0x0
    str r0, [sp, #0x68]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x68
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    bl func_02026f94
    str r0, [r10, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r10
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r10, #0x0]
    ldr r1, .L_0215eb7c
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r10, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215eb80
    ldr r1, .L_0215eb84
    bl func_ov000_0214ec98
    str r0, [r10, #0x8]
    mov r0, #0x1
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215eb88
    ldr r1, .L_0215eb8c
    bl func_ov000_0214ec98
    str r0, [r10, #0xc]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215eb90
    ldr r1, .L_0215eb84
    bl func_ov000_0214ec98
    str r0, [r10, #0x14]
    mov r0, #0x1
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215eb88
    ldr r1, .L_0215eb8c
    bl func_ov000_0214ec98
    str r0, [r10, #0x18]
    mov r1, #0x100000
    ldr r4, [r10, #0xc]
    sub r6, r1, #0x200000
    str r1, [sp, #0x30]
    mov r5, #0x0
    add r0, sp, #0x78
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    str r6, [sp, #0x2c]
    str r5, [sp, #0x28]
    bl func_ov000_02151038
    ldr r2, .L_0215eb94
    add r0, sp, #0x34
    mov r1, r4
    add r7, sp, #0x78
    bl func_ov000_02150d54
    ldr r1, .L_0215eb98
    ldr r2, .L_0215eb9c
    ldr r3, .L_0215eba0
    mov r0, #0x4c
    ldr r5, [sp, #0x38]
    ldr r6, [sp, #0x34]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215e87c
    ldr r2, .L_0215eba4
    ldr r1, .L_0215eba8
    str r2, [sp, #0x0]
    stmib sp, {r1, r7}
    mov r1, #0x400
    mov r3, r5
    str r1, [sp, #0xc]
    mov r5, #0x2
    mov r2, r6
    mov r1, #0x0
    str r5, [sp, #0x10]
    bl func_02013264
.L_0215e87c:
    bl func_ov000_021556a0
    mov r1, r0
    mov r0, r4
    bl func_02020f38
    mov r1, #0x100000
    ldr r6, [r10, #0x18]
    sub r2, r1, #0x200000
    mov r3, #0x0
    str r1, [sp, #0x1c]
    str r2, [sp, #0x18]
    str r3, [sp, #0x14]
    add r0, sp, #0x6c
    add r1, sp, #0x1c
    add r2, sp, #0x18
    add r3, sp, #0x14
    bl func_ov000_02151038
    ldr r2, .L_0215eb94
    add r0, sp, #0x20
    mov r1, r6
    add r7, sp, #0x6c
    bl func_ov000_02150d54
    ldr r1, .L_0215eb98
    ldr r2, .L_0215eb9c
    ldr r3, .L_0215eba0
    mov r0, #0x4c
    ldr r4, [sp, #0x24]
    ldr r5, [sp, #0x20]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215e924
    ldr r2, .L_0215eba4
    ldr r1, .L_0215eba8
    str r2, [sp, #0x0]
    stmib sp, {r1, r7}
    mov r1, #0x400
    mov r3, r4
    str r1, [sp, #0xc]
    mov r4, #0x2
    mov r2, r5
    mov r1, #0x0
    str r4, [sp, #0x10]
    bl func_02013264
.L_0215e924:
    bl func_ov000_021556a0
    mov r1, r0
    mov r0, r6
    bl func_02020f38
    mov r0, #0x0
    strb r0, [r10, #0x6a]
    mov r4, #0x2
    ldr r1, .L_0215ebac
    ldr r2, .L_0215ebb0
    ldr r3, .L_0215ebb4
    mov r0, #0x78
    strb r4, [r10, #0x6b]
    bl func_0201a21c
    movs r4, r0
    beq .L_0215e970
    ldr r1, .L_0215ebb8
    mov r2, #0x1
    bl func_02024064
    mov r4, r0
.L_0215e970:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215e98c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215e98c:
    ldr r0, [r4, #0x18]
    mov r1, #0x0
    str r0, [r10, #0x20]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r4, #0x14000
    ldr r6, .L_0215ebbc
    mov r8, #0x0
    mov r7, #0x20
    mov r11, #0xd8
    mov r5, r4
.L_0215e9c0:
    bl func_0203b404
    ldr r0, [r0, #0x88]
    mov r1, r7
    mov r2, r11
    mov r3, #0x2
    bl func_ov000_0214eef8
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x24]
    ldr r0, [r0, #0x4]
    mov r1, #0x9
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x24]
    ldr r1, [r10, #0x20]
    bl func_ov000_0214f3e0
    add r1, r10, r8, lsl #0x2
    ldr r0, [r10, #0x20]
    ldr r1, [r1, #0x24]
    bl func_ov000_021552fc
    bl func_0203b3f4
    ldr r0, [r0, #0x88]
    mov r1, #0x20
    mov r2, #0xd8
    mov r3, #0x2
    bl func_ov000_0214eef8
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x40]
    ldr r0, [r0, #0x4]
    mov r1, #0xb
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa8]
    blx r2
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x40]
    ldr r1, [r10, #0x20]
    bl func_ov000_0214f3e0
    add r1, r10, r8, lsl #0x2
    ldr r0, [r10, #0x20]
    ldr r1, [r1, #0x40]
    bl func_ov000_021552fc
    add r0, r6, r8, lsl #0x2
    ldr r1, [r0, #0x54]
    str r5, [sp, #0x48]
    mov r9, r1, lsl #0xc
    add r0, r10, r8, lsl #0x2
    str r9, [sp, #0x44]
    ldr r0, [r0, #0x24]
    add r1, sp, #0x48
    add r2, sp, #0x44
    bl func_ov000_0214f418
    str r9, [sp, #0x3c]
    str r4, [sp, #0x40]
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x40]
    add r1, sp, #0x40
    add r2, sp, #0x3c
    bl func_ov000_0214f418
    add r8, r8, #0x1
    cmp r8, #0x7
    blt .L_0215e9c0
    mov r1, #0x0
    ldr r0, .L_0215ebc0
    mov r2, r1
    bl func_02033410
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne .L_0215eaec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_0215eaec:
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    str r0, [r10, #0x5c]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r10, #0x64]
    mov r0, r10
    bl func_ov000_0215edbc
    mov r4, #0x1
    mov r5, #0x0
    mov r6, r4
.L_0215eb20:
    add r0, r10, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_0215eb44
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215eb44:
    add r0, r10, r5, lsl #0x2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_0215eb68
    ldr r0, [r0, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215eb68:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215eb20
    add sp, sp, #0x84
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215eb7c: .word func_ov000_0215ef44
.L_0215eb80: .word data_ov000_021619e0
.L_0215eb84: .word data_ov000_021619f8
.L_0215eb88: .word data_ov000_02161a0c
.L_0215eb8c: .word data_ov000_02161a18
.L_0215eb90: .word data_ov000_02161a24
.L_0215eb94: .word data_ov000_02161a3c
.L_0215eb98: .word data_ov000_02161174
.L_0215eb9c: .word data_ov000_021618e0
.L_0215eba0: .word 0x2b9
.L_0215eba4: .word 0x494c
.L_0215eba8: .word data_02093c8c
.L_0215ebac: .word data_ov000_02161148
.L_0215ebb0: .word data_ov000_021618d0
.L_0215ebb4: .word 0x4c3
.L_0215ebb8: .word func_02024a30
.L_0215ebbc: .word data_ov000_021601ec
.L_0215ebc0: .word data_ov000_02161a48
    arm_func_end func_ov000_0215e2bc

    .global func_ov000_0215ebc4
    arm_func_start func_ov000_0215ebc4
func_ov000_0215ebc4: ; 0x0215ebc4
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x24
    mov r4, r0
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r1, [r4, #0x10]
    ldr r2, .L_0215ed08
    add r0, sp, #0x1c
    bl func_ov000_02150d54
    ldr r1, .L_0215ed0c
    ldr r2, .L_0215ed10
    ldr r3, .L_0215ed14
    mov r0, #0x4c
    ldr r5, [sp, #0x20]
    ldr r6, [sp, #0x1c]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215ec40
    ldr r2, .L_0215ed18
    ldr r1, .L_0215ed1c
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x1e
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215ec40:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r4, #0x10]
    bl func_02020f38
    ldr r1, [r4, #0x1c]
    ldr r2, .L_0215ed08
    add r0, sp, #0x14
    bl func_ov000_02150d54
    ldr r1, .L_0215ed0c
    ldr r2, .L_0215ed10
    ldr r3, .L_0215ed14
    mov r0, #0x4c
    ldr r5, [sp, #0x18]
    ldr r6, [sp, #0x14]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215ecb4
    ldr r2, .L_0215ed18
    ldr r1, .L_0215ed1c
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x1e
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215ecb4:
    bl func_ov000_021556a0
    ldr r5, [r0, #0x4]
    ldr r1, .L_0215ed20
    ldr r2, .L_0215ed24
    ldr r3, .L_0215ed28
    mov r0, #0x48
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215ecf0
    mov ip, #0x1
    mov r2, r5
    mov r1, #0x0
    mov r3, #0xa
    str ip, [sp, #0x0]
    bl func_02014150
.L_0215ecf0:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r4, #0x1c]
    bl func_02020f38
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0215ed08: .word data_ov000_02161a3c
.L_0215ed0c: .word data_ov000_02160d6c
.L_0215ed10: .word data_ov000_021618e8
.L_0215ed14: .word 0x2ef
.L_0215ed18: .word 0x3244
.L_0215ed1c: .word data_02093c8c
.L_0215ed20: .word data_ov000_021618f0
.L_0215ed24: .word data_ov000_021618d8
.L_0215ed28: .word 0x3e3
    arm_func_end func_ov000_0215ebc4

    .global func_ov000_0215ed2c
    arm_func_start func_ov000_0215ed2c
func_ov000_0215ed2c: ; 0x0215ed2c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, #0x0
    mov r6, r0
    mov r4, r5
    mov r7, r5
.L_0215ed40:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_0215ed64
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215ed64:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_0215ed88
    ldr r0, [r0, #0x4]
    mov r1, r7
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215ed88:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_0215ed40
    ldr r0, [r6, #0x20]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r6, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov000_0215ed2c

    .global func_ov000_0215edbc
    arm_func_start func_ov000_0215edbc
func_ov000_0215edbc: ; 0x0215edbc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0215ede0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215ede0:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0215edf8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215edf8:
    mov r0, #0x3
    bl func_0203b414
    mov r3, r0
    ldrb r2, [r4, #0x6a]
    ldr r0, .L_0215ef34
    ldr r1, .L_0215ef38
    ldr r0, [r0, r2, lsl #0x3]
    ldr r1, [r1, r2, lsl #0x3]
    ldr r2, [r3, #0x88]
    bl func_ov000_0214ec98
    ldr r6, .L_0215ef3c
    mov r1, #0x0
    mov r5, r0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    mov r1, r6
    bl func_0201710c
    mov r0, #0x0
    str r0, [sp, #0x8]
    sub r0, r0, #0x100000
    str r0, [sp, #0xc]
    mov r0, r5
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_ov000_0214f418
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r4, #0x10]
    mov r0, #0x3
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldrb r3, [r4, #0x6b]
    ldr r0, .L_0215ef34
    ldr r1, .L_0215ef38
    ldr r0, [r0, r3, lsl #0x3]
    ldr r1, [r1, r3, lsl #0x3]
    bl func_ov000_0214ec98
    ldr r6, .L_0215ef40
    mov r1, #0x0
    mov r5, r0
    bl func_ov000_0215101c
    bl func_02034db8
    ldr r0, [r0, #0x4]
    mov r1, r6
    bl func_0201710c
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x100000
    str r0, [sp, #0x4]
    mov r0, r5
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov000_0214f418
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    str r5, [r4, #0x1c]
    ldrb r0, [r4, #0x6a]
    add r0, r0, #0x1
    strb r0, [r4, #0x6a]
    ldrb r0, [r4, #0x6b]
    add r0, r0, #0x1
    strb r0, [r4, #0x6b]
    ldrb r0, [r4, #0x6a]
    cmp r0, #0x4
    movhs r0, #0x0
    strhsb r0, [r4, #0x6a]
    ldrb r0, [r4, #0x6b]
    cmp r0, #0x4
    movhs r0, #0x0
    strhsb r0, [r4, #0x6b]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0215ef34: .word data_ov000_021619ac
.L_0215ef38: .word data_ov000_021619b0
.L_0215ef3c: .word data_ov000_02161a60
.L_0215ef40: .word data_ov000_02161a78
    arm_func_end func_ov000_0215edbc

    .global func_ov000_0215ef44
    arm_func_start func_ov000_0215ef44
func_ov000_0215ef44: ; 0x0215ef44
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f004
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x10]
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x1c]
    ldr r1, .L_0215f004
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f008
    bl func_02028384
    mov r2, #0xb4
    mov r0, r4
    add r1, r4, #0x24
    strh r2, [r4, #0x6c]
    bl func_ov000_0215f4e4
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r4, #0x68]
    mov r0, r4
    add r1, r4, #0x40
    bl func_ov000_0215f4e4
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r4, #0x68]
    ldr r0, [r4, #0x20]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_0215f004: .word 0x564d5049
.L_0215f008: .word func_ov000_0215f00c
    arm_func_end func_ov000_0215ef44

    .global func_ov000_0215f00c
    arm_func_start func_ov000_0215f00c
func_ov000_0215f00c: ; 0x0215f00c
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x54
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x10]
    ldrh r1, [r4, #0x6c]
    sub r0, r1, #0x1
    strh r0, [r4, #0x6c]
    cmp r1, #0x0
    bne .L_0215f204
    ldr r0, [r4, #0x20]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldrb r0, [r4, #0x69]
    cmp r0, #0x0
    beq .L_0215f1d8
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f20c
    bl func_02028384
    mov r5, #0x0
    mov ip, #0x100000
    add r0, sp, #0x48
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    str ip, [sp, #0x30]
    str r5, [sp, #0x2c]
    str r5, [sp, #0x28]
    bl func_ov000_02151038
    ldr r1, [r4, #0x10]
    ldr r2, .L_0215f210
    add r0, sp, #0x34
    add r5, sp, #0x48
    bl func_ov000_02150d54
    ldr r1, .L_0215f214
    ldr r2, .L_0215f218
    ldr r3, .L_0215f21c
    mov r0, #0x4c
    ldr r6, [sp, #0x38]
    ldr r7, [sp, #0x34]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215f0ec
    ldr r2, .L_0215f220
    mov r1, #0x1e
    stmia sp, {r2, r5}
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r7
    mov r3, r6
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215f0ec:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r4, #0x10]
    bl func_02020f38
    mov r3, #0x0
    mov r2, #0x100000
    rsb r2, r2, #0x0
    str r2, [sp, #0x1c]
    add r0, sp, #0x3c
    add r1, sp, #0x1c
    add r2, sp, #0x18
    str r3, [sp, #0x18]
    str r3, [sp, #0x14]
    add r3, sp, #0x14
    bl func_ov000_02151038
    ldr r1, [r4, #0x1c]
    ldr r2, .L_0215f210
    add r0, sp, #0x20
    add r5, sp, #0x3c
    bl func_ov000_02150d54
    ldr r1, .L_0215f214
    ldr r2, .L_0215f218
    ldr r3, .L_0215f21c
    mov r0, #0x4c
    ldr r6, [sp, #0x24]
    ldr r7, [sp, #0x20]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215f188
    ldr r2, .L_0215f220
    mov r1, #0x1e
    stmia sp, {r2, r5}
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r7
    mov r3, r6
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215f188:
    bl func_ov000_021556a0
    ldr r6, [r0, #0x4]
    ldr r1, .L_0215f224
    ldr r2, .L_0215f228
    ldr r3, .L_0215f22c
    mov r0, #0x48
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215f1c4
    mov r5, #0x1
    mov r2, r6
    mov r1, #0x0
    mov r3, #0xa
    str r5, [sp, #0x0]
    bl func_02014150
.L_0215f1c4:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r4, #0x1c]
    bl func_02020f38
    b .L_0215f204
.L_0215f1d8:
    mov r0, #0x1e
    strh r0, [r4, #0x6c]
    ldr r0, [r4, #0x20]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f230
    bl func_02028384
.L_0215f204:
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0215f20c: .word func_ov000_0215f2b8
.L_0215f210: .word data_ov000_02161a3c
.L_0215f214: .word data_ov000_02160d6c
.L_0215f218: .word data_ov000_021618e8
.L_0215f21c: .word 0x2ef
.L_0215f220: .word 0x3244
.L_0215f224: .word data_ov000_021618f0
.L_0215f228: .word data_ov000_021618d8
.L_0215f22c: .word 0x3e3
.L_0215f230: .word func_ov000_0215f234
    arm_func_end func_ov000_0215f00c

    .global func_ov000_0215f234
    arm_func_start func_ov000_0215f234
func_ov000_0215f234: ; 0x0215f234
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrh r2, [r4, #0x6c]
    sub r1, r2, #0x1
    strh r1, [r4, #0x6c]
    cmp r2, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    ldr r1, .L_0215f2b4
    bl func_02028384
    mov r2, #0xb4
    mov r0, r4
    add r1, r4, #0x24
    strh r2, [r4, #0x6c]
    bl func_ov000_0215f4e4
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r4, #0x68]
    mov r0, r4
    add r1, r4, #0x40
    bl func_ov000_0215f4e4
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r4, #0x68]
    ldr r0, [r4, #0x20]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r4, pc}
.L_0215f2b4: .word func_ov000_0215f00c
    arm_func_end func_ov000_0215f234

    .global func_ov000_0215f2b8
    arm_func_start func_ov000_0215f2b8
func_ov000_0215f2b8: ; 0x0215f2b8
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f4b8
    ldr r4, [r0, #0x10]
    mov r2, #0x0
    ldr r0, [r4, #0x10]
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    beq .L_0215f4b0
    ldr r0, [r4, #0x1c]
    ldr r1, .L_0215f4b8
    mov r2, #0x0
    bl func_ov000_02155b08
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    beq .L_0215f4b0
    ldrb r0, [r4, #0x68]
    cmp r0, #0x0
    bne .L_0215f338
    ldr r0, [r4, #0x64]
    ldr r0, [r0, #0x0]
    cmp r0, #0x3
    bne .L_0215f34c
.L_0215f338:
    ldr r0, [r4, #0x60]
    mov r1, #0x2
    bl func_ov000_0214ec4c
    ldr r0, [r5, #0x4]
    bl func_020282f4
.L_0215f34c:
    ldr r0, [r5, #0x4]
    ldr r1, .L_0215f4bc
    bl func_02028384
    mov r0, r4
    bl func_ov000_0215edbc
    mov r0, #0x100000
    rsb r0, r0, #0x0
    str r0, [sp, #0x28]
    ldr r0, [r4, #0x10]
    add r1, sp, #0x28
    bl func_ov000_0215dafc
    mov r0, #0x100000
    str r0, [sp, #0x24]
    ldr r0, [r4, #0x1c]
    add r1, sp, #0x24
    bl func_ov000_0215dafc
    ldr r1, [r4, #0x10]
    ldr r2, .L_0215f4c0
    add r0, sp, #0x1c
    bl func_ov000_02150d54
    ldr r1, .L_0215f4c4
    ldr r2, .L_0215f4c8
    ldr r3, .L_0215f4cc
    mov r0, #0x4c
    ldr r5, [sp, #0x20]
    ldr r6, [sp, #0x1c]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215f3f0
    ldr r2, .L_0215f4d0
    ldr r1, .L_0215f4d4
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x1e
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215f3f0:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r4, #0x10]
    bl func_02020f38
    ldr r1, [r4, #0x1c]
    ldr r2, .L_0215f4c0
    add r0, sp, #0x14
    bl func_ov000_02150d54
    ldr r1, .L_0215f4c4
    ldr r2, .L_0215f4c8
    ldr r3, .L_0215f4cc
    mov r0, #0x4c
    ldr r5, [sp, #0x18]
    ldr r6, [sp, #0x14]
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215f464
    ldr r2, .L_0215f4d0
    ldr r1, .L_0215f4d4
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x1e
    str r1, [sp, #0x8]
    mov r1, #0x0
    str r1, [sp, #0xc]
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x10]
    bl func_02013b14
.L_0215f464:
    bl func_ov000_021556a0
    ldr r6, [r0, #0x4]
    ldr r1, .L_0215f4d8
    ldr r2, .L_0215f4dc
    ldr r3, .L_0215f4e0
    mov r0, #0x48
    bl func_0201a21c
    cmp r0, #0x0
    beq .L_0215f4a0
    mov r5, #0x1
    mov r2, r6
    mov r1, #0x0
    mov r3, #0xa
    str r5, [sp, #0x0]
    bl func_02014150
.L_0215f4a0:
    bl func_ov000_021556a0
    mov r1, r0
    ldr r0, [r4, #0x1c]
    bl func_02020f38
.L_0215f4b0:
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0215f4b8: .word 0x564d5049
.L_0215f4bc: .word func_ov000_0215ef44
.L_0215f4c0: .word data_ov000_02161a3c
.L_0215f4c4: .word data_ov000_02160d6c
.L_0215f4c8: .word data_ov000_021618e8
.L_0215f4cc: .word 0x2ef
.L_0215f4d0: .word 0x3244
.L_0215f4d4: .word data_02093c8c
.L_0215f4d8: .word data_ov000_021618f0
.L_0215f4dc: .word data_ov000_021618d8
.L_0215f4e0: .word 0x3e3
    arm_func_end func_ov000_0215f2b8

    .global func_ov000_0215f4e4
    arm_func_start func_ov000_0215f4e4
func_ov000_0215f4e4: ; 0x0215f4e4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r5, r0
    ldrb r0, [r5, #0x68]
    mov r6, #0x0
    mov r10, r1
    cmp r0, #0x0
    mov r7, r6
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r4, r6
    b .L_0215f5b4
.L_0215f510:
    ldr r2, [r5, #0x64]
    ldr r1, [r2, #0x0]
    sub r0, r1, #0x2
    cmp r0, #0x1
    bhi .L_0215f558
    cmp r1, #0x3
    moveq r7, #0x1
    beq .L_0215f548
    ldr r0, [r2, #0x4]
    cmp r0, #0x1
    moveq r0, #0x0
    streqb r0, [r5, #0x69]
    movne r0, #0x1
    strneb r0, [r5, #0x69]
.L_0215f548:
    ldr r0, [r5, #0x64]
    add r0, r0, #0x34
    str r0, [r5, #0x64]
    b .L_0215f5bc
.L_0215f558:
    ldr r0, [r10, r4, lsl #0x2]
    ldr r8, [r0, #0x4]
    ldr r0, [r8, #0x64]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r1, [r10, r4, lsl #0x2]
    ldr r0, [r5, #0x64]
    ldr r2, [r1, #0x4]
    add r1, r0, #0x4
    ldr r0, [r2, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x68]
    blx r2
    ldr r0, [r5, #0x64]
    add r6, r6, #0x1
    add r0, r0, #0x34
    str r0, [r5, #0x64]
    add r4, r4, #0x1
.L_0215f5b4:
    cmp r4, #0x8
    blt .L_0215f510
.L_0215f5bc:
    ldr r2, .L_0215f648
    sub r1, r6, #0x1
    mov r0, #0x1c
    mla r9, r1, r0, r2
    mov r8, #0x0
    mov r5, #0x1
    mov r11, r8
    mov r4, r5
.L_0215f5dc:
    cmp r8, r6
    ldr r0, [r10, r8, lsl #0x2]
    bhs .L_0215f620
    ldr r0, [r0, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r10, r8, lsl #0x2]
    ldr r2, [r9, r8, lsl #0x2]
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r0, [r0, #0x50]
    mov r2, r2, lsl #0xc
    str r2, [r0, #0x10]
    bl func_ov000_02150fb8
    b .L_0215f634
.L_0215f620:
    ldr r0, [r0, #0x4]
    mov r1, r11
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215f634:
    add r8, r8, #0x1
    cmp r8, #0x7
    blt .L_0215f5dc
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0215f648: .word data_ov000_021601ec
    arm_func_end func_ov000_0215f4e4

    .global func_ov000_0215f64c
    arm_func_start func_ov000_0215f64c
func_ov000_0215f64c: ; 0x0215f64c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0215f684
    mov r5, r0
    ldr r2, .L_0215f688
    mov r0, #0x24
    mov r3, #0x32
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x24
    mov r4, r0
    bl func_020517fc
    mov r0, r4
    str r5, [r4, #0x20]
    ldmia sp!, {r3, r4, r5, pc}
.L_0215f684: .word data_ov000_02161ab0
.L_0215f688: .word data_ov000_02161a98
    arm_func_end func_ov000_0215f64c

    .global func_ov000_0215f68c
    arm_func_start func_ov000_0215f68c
func_ov000_0215f68c: ; 0x0215f68c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_0215f698:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_0215f6b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215f6b4:
    add r4, r4, #0x1
    cmp r4, #0x7
    blt .L_0215f698
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_0215f6d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0215f6d8:
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_0215f68c

    .global func_ov000_0215f6e4
    arm_func_start func_ov000_0215f6e4
func_ov000_0215f6e4: ; 0x0215f6e4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x28
    mov r9, r0
    bl func_02026f94
    str r0, [r9, #0x0]
    ldr r0, [r0, #0x4]
    mov r1, r9
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r9, #0x0]
    ldr r1, .L_0215fd50
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, [r9, #0x0]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r1, .L_0215fd54
    ldr r2, .L_0215fd58
    ldr r3, .L_0215fd5c
    mov r0, #0x78
    bl func_0201a21c
    movs r4, r0
    beq .L_0215f754
    ldr r1, .L_0215fd60
    mov r2, #0x1
    bl func_02024064
    mov r4, r0
.L_0215f754:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_0215f770
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_0215f770:
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    mov r0, #0x2
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215fd64
    ldr r1, .L_0215fd68
    bl func_ov000_0214ec98
    str r0, [r9, #0x4]
    mov r0, #0x3
    bl func_0203b414
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215fd6c
    ldr r1, .L_0215fd70
    bl func_ov000_0214ec98
    str r0, [r9, #0x8]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215fd74
    ldr r1, .L_0215fd78
    bl func_ov000_0214ec98
    str r0, [r9, #0xc]
    mov r0, #0x3
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215fd7c
    ldr r1, .L_0215fd80
    bl func_ov000_0214ec98
    str r0, [r9, #0x10]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215fd84
    ldr r1, .L_0215fd88
    bl func_ov000_0214ec98
    str r0, [r9, #0x14]
    mov r0, #0x3
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215fd8c
    ldr r1, .L_0215fd90
    bl func_ov000_0214ec98
    str r0, [r9, #0x18]
    mov r0, #0x2
    bl func_0203b424
    ldr r2, [r0, #0x88]
    ldr r0, .L_0215fd94
    ldr r1, .L_0215fd98
    bl func_ov000_0214ec98
    ldr r6, .L_0215fd9c
    str r0, [r9, #0x1c]
    mov r8, #0x2
    add r7, sp, #0x20
    mov r5, #0x8a000
    add r4, sp, #0x24
.L_0215f860:
    sub r0, r8, #0x2
    mov r0, r0, lsl #0x8
    add r0, r0, #0xc0
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x20]
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r1, r7
    bl func_ov000_02150f98
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r1, r6
    ldr r0, [r0, #0x4]
    bl func_02028384
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r1, r4
    str r5, [sp, #0x24]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    add r0, r9, r8, lsl #0x2
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    add r8, r8, #0x1
    cmp r8, #0x6
    ble .L_0215f860
    mov r0, #0x0
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x0
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, r1
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
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
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
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x3
    bl func_0203b414
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0xc]
    ldr r0, [r1, #0x4]
    add r1, sp, #0xc
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
    mov r1, #0x20
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
    str r0, [sp, #0x10]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x10
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
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x1000
    str r0, [sp, #0x14]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x14
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    mov r0, #0x1
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
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
    mov r1, #0x20
    ldr r0, [r0, #0x4]
    mov r2, #0x40
    bl func_0203cfbc
    mov r0, #0x2
    bl func_0203b424
    ldr r0, [r0, #0x88]
    mov r1, #0x8000
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x90]
    blx r2
    mov r0, #0x2
    bl func_0203b424
    ldr r1, [r0, #0x88]
    mov r0, #0x2000
    str r0, [sp, #0x18]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x18
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
    mov r2, #0x40
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
    str r0, [sp, #0x1c]
    ldr r0, [r1, #0x4]
    add r1, sp, #0x1c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0215fd50: .word func_ov000_0215fe4c
.L_0215fd54: .word data_ov000_02161148
.L_0215fd58: .word data_ov000_02161a90
.L_0215fd5c: .word 0x4c3
.L_0215fd60: .word func_02024a30
.L_0215fd64: .word data_ov000_02161ac4
.L_0215fd68: .word data_ov000_02161adc
.L_0215fd6c: .word data_ov000_02161af4
.L_0215fd70: .word data_ov000_02161b10
.L_0215fd74: .word data_ov000_02161b2c
.L_0215fd78: .word data_ov000_02161b44
.L_0215fd7c: .word data_ov000_02161b5c
.L_0215fd80: .word data_ov000_02161b74
.L_0215fd84: .word data_ov000_02161b8c
.L_0215fd88: .word data_ov000_02161ba4
.L_0215fd8c: .word data_ov000_02161bbc
.L_0215fd90: .word data_ov000_02161bd4
.L_0215fd94: .word data_ov000_02161bec
.L_0215fd98: .word data_ov000_02161c04
.L_0215fd9c: .word func_ov000_0215fec0
    arm_func_end func_ov000_0215f6e4

    .global func_ov000_0215fda0
    arm_func_start func_ov000_0215fda0
func_ov000_0215fda0: ; 0x0215fda0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02028330
    mov r4, #0x2
.L_0215fdb8:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    bl func_02028330
    add r4, r4, #0x1
    cmp r4, #0x6
    ble .L_0215fdb8
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldr r0, [r5, #0x8]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov000_0215fda0

    .global func_ov000_0215fe08
    arm_func_start func_ov000_0215fe08
func_ov000_0215fe08: ; 0x0215fe08
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r6, r0
    mov r4, r5
.L_0215fe18:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_0215fe3c
    ldr r0, [r0, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215fe3c:
    add r5, r5, #0x1
    cmp r5, #0x7
    blt .L_0215fe18
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov000_0215fe08

    .global func_ov000_0215fe4c
    arm_func_start func_ov000_0215fe4c
func_ov000_0215fe4c: ; 0x0215fe4c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    mov r0, #0x1
    ldr r2, [r1, #0x10]
    mov r1, #0x2
    mov r3, #0x0
.L_0215fe68:
    add ip, r2, r1, lsl #0x2
    ldr ip, [ip, #0x4]
    ldr ip, [ip, #0x4]
    ldr ip, [ip, #0x64]
    ldrb ip, [ip, #0x10]
    mov lr, ip, lsl #0x18
    movs lr, lr, lsr #0x1f
    beq .L_0215fe94
    mov ip, ip, lsl #0x1e
    movs ip, ip, lsr #0x1f
    movne r0, r3
.L_0215fe94:
    add r1, r1, #0x1
    cmp r1, #0x6
    ble .L_0215fe68
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r2, #0x20]
    mov r1, #0x3
    bl func_ov000_0214ec4c
    ldr r0, [r4, #0x4]
    bl func_020282f4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215fe4c

    .global func_ov000_0215fec0
    arm_func_start func_ov000_0215fec0
func_ov000_0215fec0: ; 0x0215fec0
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x8
    mov r1, r4
    bl func_ov000_0214e290
    ldr r0, [sp, #0x8]
    add r1, sp, #0xc
    sub r2, r0, #0x800
    mov r0, r4
    str r2, [sp, #0xc]
    bl func_ov000_02150f98
    add r0, sp, #0x4
    mov r1, r4
    bl func_ov000_0214e290
    mov r0, #0x100000
    ldr r1, [sp, #0x4]
    rsb r0, r0, #0x0
    cmp r1, r0
    ble .L_0215ff40
    add r0, sp, #0x0
    mov r1, r4
    bl func_ov000_0214e290
    ldr r0, [sp, #0x0]
    cmp r0, #0xc0000
    bge .L_0215ff40
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_0215ff54
.L_0215ff40:
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
.L_0215ff54:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    arm_func_end func_ov000_0215fec0

    .section .rodata, 4, 1, 4
data_ov000_0215ff5c:
    .byte 0x25, 0x00, 0x26, 0x00, 0x42, 0x00, 0x43, 0x00
data_ov000_0215ff64:
    .byte 0x0a, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00
    .byte 0x0d, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
    .byte 0x0b, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00
    .byte 0x0e, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
    .byte 0x0d, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
    .byte 0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
    .byte 0x0e, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
    .byte 0x12, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
    .byte 0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
    .byte 0x14, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
    .byte 0x12, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
    .byte 0x17, 0x00, 0x00, 0x00, 0x1d, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x1d, 0x00, 0x00, 0x00
data_ov000_02160024:
    .byte 0xf0, 0x00, 0x00, 0x00, 0xa0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x53, 0x00
data_ov000_02160030:
    .byte 0xff, 0x00, 0x00, 0x00, 0xbf, 0x00, 0x00, 0x00, 0x00, 0x00, 0x51, 0x00
data_ov000_0216003c:
    .byte 0x24, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x50, 0x00, 0x04, 0x03, 0x01, 0x00
    .word func_ov000_02155698
    .byte 0x00, 0x00, 0x00, 0x00, 0x5c, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
    .byte 0x0d, 0x00, 0x50, 0x00, 0x05, 0x00, 0x02, 0x00
    .word func_ov000_02153cc4
    .byte 0x09, 0x00, 0x00, 0x00
    .byte 0x94, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x50, 0x00, 0x06, 0x01, 0x03, 0x00
    .word func_ov000_02155698
    .byte 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
    .byte 0x0f, 0x00, 0x50, 0x00, 0x07, 0x02, 0x00, 0x00
    .word func_ov000_02153ce0
    .byte 0x08, 0x00, 0x00, 0x00
    .byte 0x24, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x10, 0x00, 0x50, 0x00, 0x00, 0x07, 0x05, 0x00
    .word func_ov000_02153cc4
    .byte 0x0a, 0x00, 0x00, 0x00, 0x5c, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00
    .byte 0x11, 0x00, 0x50, 0x00, 0x01, 0x04, 0x06, 0x00
    .word func_ov000_02153cc4
    .byte 0x0b, 0x00, 0x00, 0x00
    .byte 0x94, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x12, 0x00, 0x50, 0x00, 0x02, 0x05, 0x07, 0x00
    .word func_ov000_02155698
    .byte 0x00, 0x00, 0x00, 0x00, 0xcc, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00
    .byte 0x13, 0x00, 0x50, 0x00, 0x03, 0x06, 0x04, 0x00
    .word func_ov000_02155698
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_021600fc:
    .byte 0x00, 0x16, 0x2b, 0x40, 0x55, 0x6a, 0x7f, 0x00
data_ov000_02160104:
    .byte 0x00, 0x00, 0xb0, 0x00, 0x00, 0xa0, 0x00, 0x00, 0x01, 0x00, 0xb0, 0x00, 0x01, 0xa6, 0x00, 0x00
    .byte 0x03, 0x00, 0xb0, 0x00, 0x02, 0xa6, 0x00, 0x00, 0x0a, 0x00, 0xb0, 0x00, 0x02, 0xa5, 0x00, 0x00
    .byte 0x0b, 0x00, 0xb0, 0x00, 0x02, 0xa5, 0x00, 0x00, 0x03, 0x00, 0xb0, 0x00, 0x03, 0xa6, 0x00, 0x00
    .byte 0x0a, 0x00, 0xb0, 0x00, 0x03, 0xa5, 0x00, 0x00, 0x0b, 0x00, 0xb0, 0x00, 0x03, 0xa5, 0x00, 0x00
    .byte 0x0c, 0x00, 0xb0, 0x00, 0x04, 0xa3, 0x00, 0x00
data_ov000_0216014c:
    .word func_ov000_021588b0
    .byte 0x01, 0x01, 0x00, 0x00
    .word func_ov000_021588f8
    .byte 0x07, 0x01, 0x00, 0x00
    .word func_ov000_02158940
    .byte 0x08, 0x01, 0x00, 0x00
    .word func_ov000_02158988
    .byte 0x09, 0x02, 0x00, 0x00
    .word func_ov000_021589b0
    .byte 0x0a, 0x03, 0x00, 0x00
    .word func_ov000_021589d8
    .byte 0x0b, 0x04, 0x00, 0x00
    .word func_ov000_02158a34
    .byte 0x0c, 0x04, 0x00, 0x00
    .word func_ov000_02158a90
    .byte 0x0d, 0x05, 0x00, 0x00
    .word func_ov000_02158b44
    .byte 0x0e, 0x06, 0x00, 0x00
    .word func_ov000_02158bf8
    .byte 0x0f, 0x05, 0x00, 0x00
    .word func_ov000_02158cac
    .byte 0x10, 0x06, 0x00, 0x00
data_ov000_021601a4:
    .word func_ov000_0215acd4
    .byte 0x01, 0x00, 0x00, 0x00
    .word func_ov000_0215ad9c
    .word func_ov000_0215acd4
    .byte 0x02, 0x00, 0x00, 0x00
    .word func_ov000_0215ad20
    .word func_ov000_0215acd4
    .byte 0x03, 0x00, 0x00, 0x00
    .word func_ov000_0215ae18
    .word func_ov000_0215acd4
    .byte 0x04, 0x00, 0x00, 0x00
    .word func_ov000_0215ae94
    .word func_ov000_0215acd4
    .byte 0x05, 0x00, 0x00, 0x00
    .word func_ov000_0215af10
    .word func_ov000_0215acfc
    .byte 0x06, 0x01, 0x00, 0x00
    .word func_ov000_0215af8c
data_ov000_021601ec:
    .byte 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
    .byte 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00
    .byte 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
    .byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x28, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
    .byte 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
    .byte 0x3b, 0x00, 0x00, 0x00, 0x4e, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00
    .byte 0x87, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00
    .byte 0x48, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
    .byte 0x88, 0x00, 0x00, 0x00
    .section .init, 4, 1, 4
    .global __sinit_ov000_021602b0
    arm_func_start __sinit_ov000_021602b0
__sinit_ov000_021602b0: ; 0x021602b0
    stmdb sp!, {r3, lr}
    sub sp, sp, #0xd0
    add r0, sp, #0xc4
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0xc8
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0xcc
    mov r1, #0x80
    bl func_ov000_0215814c
    ldr r0, .L_02160734
    add r1, sp, #0xcc
    add r2, sp, #0xc8
    add r3, sp, #0xc4
    bl func_ov000_02151038
    add r0, sp, #0xb8
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0xbc
    mov r1, #0x33
    bl func_ov000_0215814c
    add r0, sp, #0xc0
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160738
    add r1, sp, #0xc0
    add r2, sp, #0xbc
    add r3, sp, #0xb8
    bl func_ov000_02151038
    add r0, sp, #0xac
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0xb0
    mov r1, #0x46
    bl func_ov000_0215814c
    add r0, sp, #0xb4
    mov r1, #0xb8
    bl func_ov000_0215814c
    ldr r0, .L_0216073c
    add r1, sp, #0xb4
    add r2, sp, #0xb0
    add r3, sp, #0xac
    bl func_ov000_02151038
    add r0, sp, #0xa0
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0xa4
    mov r1, #0x59
    bl func_ov000_0215814c
    add r0, sp, #0xa8
    mov r1, #0xb8
    bl func_ov000_0215814c
    ldr r0, .L_02160740
    add r1, sp, #0xa8
    add r2, sp, #0xa4
    add r3, sp, #0xa0
    bl func_ov000_02151038
    add r0, sp, #0x94
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x98
    mov r1, #0x70
    bl func_ov000_0215814c
    add r0, sp, #0x9c
    mov r1, #0x78
    bl func_ov000_0215814c
    ldr r0, .L_02160744
    add r1, sp, #0x9c
    add r2, sp, #0x98
    add r3, sp, #0x94
    bl func_ov000_02151038
    add r0, sp, #0x88
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x8c
    mov r1, #0x7a
    bl func_ov000_0215814c
    add r0, sp, #0x90
    mov r1, #0x50
    bl func_ov000_0215814c
    ldr r0, .L_02160748
    add r1, sp, #0x90
    add r2, sp, #0x8c
    add r3, sp, #0x88
    bl func_ov000_02151038
    add r0, sp, #0x7c
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x80
    mov r1, #0xc0
    bl func_ov000_0215814c
    add r0, sp, #0x84
    mov r1, #0x100
    bl func_ov000_0215814c
    ldr r0, .L_0216074c
    add r1, sp, #0x84
    add r2, sp, #0x80
    add r3, sp, #0x7c
    bl func_ov000_02151038
    add r0, sp, #0x70
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x74
    mov r1, #0x46
    bl func_ov000_0215814c
    add r0, sp, #0x78
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160750
    add r1, sp, #0x78
    add r2, sp, #0x74
    add r3, sp, #0x70
    bl func_ov000_02151038
    add r0, sp, #0x64
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x68
    mov r1, #0x59
    bl func_ov000_0215814c
    add r0, sp, #0x6c
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160754
    add r1, sp, #0x6c
    add r2, sp, #0x68
    add r3, sp, #0x64
    bl func_ov000_02151038
    add r0, sp, #0x58
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x5c
    mov r1, #0x7e
    bl func_ov000_0215814c
    add r0, sp, #0x60
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160758
    add r1, sp, #0x60
    add r2, sp, #0x5c
    add r3, sp, #0x58
    bl func_ov000_02151038
    add r0, sp, #0x4c
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x50
    mov r1, #0x9c
    bl func_ov000_0215814c
    add r0, sp, #0x54
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_0216075c
    add r1, sp, #0x54
    add r2, sp, #0x50
    add r3, sp, #0x4c
    bl func_ov000_02151038
    add r0, sp, #0x40
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x44
    mov r1, #0x33
    bl func_ov000_0215814c
    add r0, sp, #0x48
    mov r1, #0x78
    bl func_ov000_0215814c
    ldr r0, .L_02160760
    add r1, sp, #0x48
    add r2, sp, #0x44
    add r3, sp, #0x40
    bl func_ov000_02151038
    add r0, sp, #0x34
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x38
    mov r1, #0x33
    bl func_ov000_0215814c
    add r0, sp, #0x3c
    mov r1, #0xba
    bl func_ov000_0215814c
    ldr r0, .L_02160764
    add r1, sp, #0x3c
    add r2, sp, #0x38
    add r3, sp, #0x34
    bl func_ov000_02151038
    add r0, sp, #0x28
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x2c
    mov r1, #0x46
    bl func_ov000_0215814c
    add r0, sp, #0x30
    mov r1, #0x96
    bl func_ov000_0215814c
    ldr r0, .L_02160768
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    bl func_ov000_02151038
    add r0, sp, #0x1c
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x20
    mov r1, #0x46
    bl func_ov000_0215814c
    add r0, sp, #0x24
    mov r1, #0xc4
    bl func_ov000_0215814c
    ldr r0, .L_0216076c
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    bl func_ov000_02151038
    add r0, sp, #0x10
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x14
    mov r1, #0x59
    bl func_ov000_0215814c
    add r0, sp, #0x18
    mov r1, #0x96
    bl func_ov000_0215814c
    ldr r0, .L_02160770
    add r1, sp, #0x18
    add r2, sp, #0x14
    add r3, sp, #0x10
    bl func_ov000_02151038
    add r0, sp, #0x4
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x8
    mov r1, #0x59
    bl func_ov000_0215814c
    add r0, sp, #0xc
    mov r1, #0xc4
    bl func_ov000_0215814c
    ldr r0, .L_02160774
    add r1, sp, #0xc
    add r2, sp, #0x8
    add r3, sp, #0x4
    bl func_ov000_02151038
    mov r3, #0x0
    ldr r0, .L_02160778
    sub r1, r3, #0x30
    sub r2, r3, #0x10
    str r3, [sp, #0x0]
    bl func_ov000_02158e5c
    mov r2, #0xa
    ldr r0, .L_0216077c
    str r2, [sp, #0x0]
    sub r1, r2, #0x5a
    sub r2, r2, #0x14
    mov r3, #0x50
    bl func_ov000_02158e5c
    mov r2, #0x10
    ldr r0, .L_02160780
    str r2, [sp, #0x0]
    sub r1, r2, #0x64
    sub r2, r2, #0x20
    mov r3, #0x54
    bl func_ov000_02158e5c
    mov r2, #0xc
    ldr r0, .L_02160784
    str r2, [sp, #0x0]
    sub r1, r2, #0x60
    sub r2, r2, #0x18
    mov r3, #0x54
    bl func_ov000_02158e5c
    mov ip, #0xa
    ldr r0, .L_02160788
    sub r1, ip, #0x28
    sub r2, ip, #0x14
    mov r3, #0x1e
    str ip, [sp, #0x0]
    bl func_ov000_02158e5c
    mov r3, #0xa
    ldr r0, .L_0216078c
    sub r1, r3, #0x1a
    sub r2, r3, #0x14
    str r3, [sp, #0x0]
    bl func_ov000_02158e5c
    mov ip, #0xa
    sub r1, ip, #0x14
    ldr r0, .L_02160790
    mov r2, r1
    mov r3, #0x10
    str ip, [sp, #0x0]
    bl func_ov000_02158e5c
    add sp, sp, #0xd0
    ldmia sp!, {r3, pc}
.L_02160734: .word data_ov000_02161424
.L_02160738: .word data_ov000_02161430
.L_0216073c: .word data_ov000_0216143c
.L_02160740: .word data_ov000_02161448
.L_02160744: .word data_ov000_02161454
.L_02160748: .word data_ov000_02161460
.L_0216074c: .word data_ov000_0216146c
.L_02160750: .word data_ov000_02161478
.L_02160754: .word data_ov000_02161484
.L_02160758: .word data_ov000_02161490
.L_0216075c: .word data_ov000_0216149c
.L_02160760: .word data_ov000_021614a8
.L_02160764: .word data_ov000_021614b4
.L_02160768: .word data_ov000_021614c0
.L_0216076c: .word data_ov000_021614cc
.L_02160770: .word data_ov000_021614d8
.L_02160774: .word data_ov000_021614e4
.L_02160778: .word data_ov000_02161378
.L_0216077c: .word data_ov000_02161380
.L_02160780: .word data_ov000_02161388
.L_02160784: .word data_ov000_02161390
.L_02160788: .word data_ov000_02161398
.L_0216078c: .word data_ov000_021613a0
.L_02160790: .word data_ov000_021613a8
    arm_func_end __sinit_ov000_021602b0

    .global __sinit_ov000_02160794
    arm_func_start __sinit_ov000_02160794
__sinit_ov000_02160794: ; 0x02160794
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x58
    add r0, sp, #0x4c
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x50
    mov r1, #0x60
    bl func_ov000_0215814c
    add r0, sp, #0x54
    mov r1, #0x98
    bl func_ov000_0215814c
    ldr r0, .L_02160964
    add r1, sp, #0x54
    add r2, sp, #0x50
    add r3, sp, #0x4c
    bl func_ov000_02151038
    add r0, sp, #0x40
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x44
    mov r1, #0x2f
    bl func_ov000_0215814c
    add r0, sp, #0x48
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160968
    add r1, sp, #0x48
    add r2, sp, #0x44
    add r3, sp, #0x40
    bl func_ov000_02151038
    add r0, sp, #0x34
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x38
    mov r1, #0x46
    bl func_ov000_0215814c
    add r0, sp, #0x3c
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_0216096c
    add r1, sp, #0x3c
    add r2, sp, #0x38
    add r3, sp, #0x34
    bl func_ov000_02151038
    add r0, sp, #0x28
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x2c
    mov r1, #0x5d
    bl func_ov000_0215814c
    add r0, sp, #0x30
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160970
    add r1, sp, #0x30
    add r2, sp, #0x2c
    add r3, sp, #0x28
    bl func_ov000_02151038
    add r0, sp, #0x1c
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x20
    mov r1, #0x74
    bl func_ov000_0215814c
    add r0, sp, #0x24
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160974
    add r1, sp, #0x24
    add r2, sp, #0x20
    add r3, sp, #0x1c
    bl func_ov000_02151038
    add r0, sp, #0x10
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x14
    mov r1, #0x8b
    bl func_ov000_0215814c
    add r0, sp, #0x18
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_02160978
    add r1, sp, #0x18
    add r2, sp, #0x14
    add r3, sp, #0x10
    bl func_ov000_02151038
    add r0, sp, #0x4
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x8
    mov r1, #0xa0
    bl func_ov000_0215814c
    add r0, sp, #0xc
    mov r1, #0x99
    bl func_ov000_0215814c
    ldr r0, .L_0216097c
    add r1, sp, #0xc
    add r2, sp, #0x8
    add r3, sp, #0x4
    bl func_ov000_02151038
    mov r2, #0xa
    ldr r0, .L_02160980
    str r2, [sp, #0x0]
    sub r1, r2, #0x5c
    sub r2, r2, #0x15
    mov r3, #0x52
    bl func_ov000_02158e5c
    mov ip, #0xa
    ldr r0, .L_02160984
    sub r1, ip, #0x2a
    sub r2, ip, #0x15
    mov r3, #0x20
    str ip, [sp, #0x0]
    bl func_ov000_02158e5c
    add sp, sp, #0x58
    ldmia sp!, {r3, pc}
.L_02160964: .word data_ov000_0216169c
.L_02160968: .word data_ov000_021616a8
.L_0216096c: .word data_ov000_021616b4
.L_02160970: .word data_ov000_021616c0
.L_02160974: .word data_ov000_021616cc
.L_02160978: .word data_ov000_021616d8
.L_0216097c: .word data_ov000_021616e4
.L_02160980: .word data_ov000_0216168c
.L_02160984: .word data_ov000_02161694
    arm_func_end __sinit_ov000_02160794

    .global __sinit_ov000_02160988
    arm_func_start __sinit_ov000_02160988
__sinit_ov000_02160988: ; 0x02160988
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x48
    add r0, sp, #0x3c
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x40
    mov r1, #0x48
    bl func_ov000_0215814c
    add r0, sp, #0x44
    mov r1, #0x40
    bl func_ov000_0215814c
    ldr r0, .L_02160b00
    add r1, sp, #0x44
    add r2, sp, #0x40
    add r3, sp, #0x3c
    bl func_ov000_02151038
    ldr r0, .L_02160b04
    bl func_ov000_0215e1a8
    ldr r0, .L_02160b08
    bl func_ov000_0215e1a8
    add r0, sp, #0x30
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x34
    mov r1, #0x3c
    bl func_ov000_0215814c
    add r0, sp, #0x38
    mov r1, #0x40
    bl func_ov000_0215814c
    ldr r0, .L_02160b0c
    add r1, sp, #0x38
    add r2, sp, #0x34
    add r3, sp, #0x30
    bl func_ov000_02151038
    add r0, sp, #0x24
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x28
    mov r1, #0x54
    bl func_ov000_0215814c
    add r0, sp, #0x2c
    mov r1, #0x40
    bl func_ov000_0215814c
    ldr r0, .L_02160b10
    add r1, sp, #0x2c
    add r2, sp, #0x28
    add r3, sp, #0x24
    bl func_ov000_02151038
    ldr r0, .L_02160b14
    bl func_ov000_0215e1a8
    add r0, sp, #0x18
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x1c
    mov r1, #0x66
    bl func_ov000_0215814c
    add r0, sp, #0x20
    mov r1, #0x40
    bl func_ov000_0215814c
    ldr r0, .L_02160b18
    add r1, sp, #0x20
    add r2, sp, #0x1c
    add r3, sp, #0x18
    bl func_ov000_02151038
    add r0, sp, #0xc
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x10
    mov r1, #0x78
    bl func_ov000_0215814c
    add r0, sp, #0x14
    mov r1, #0x40
    bl func_ov000_0215814c
    ldr r0, .L_02160b1c
    add r1, sp, #0x14
    add r2, sp, #0x10
    add r3, sp, #0xc
    bl func_ov000_02151038
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_ov000_0215814c
    add r0, sp, #0x4
    mov r1, #0x8a
    bl func_ov000_0215814c
    add r0, sp, #0x8
    mov r1, #0x40
    bl func_ov000_0215814c
    ldr r0, .L_02160b20
    add r1, sp, #0x8
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov000_02151038
    add sp, sp, #0x48
    ldmia sp!, {r3, pc}
.L_02160b00: .word data_ov000_02161758
.L_02160b04: .word data_ov000_02161764
.L_02160b08: .word data_ov000_02161770
.L_02160b0c: .word data_ov000_0216177c
.L_02160b10: .word data_ov000_02161788
.L_02160b14: .word data_ov000_02161794
.L_02160b18: .word data_ov000_021617a0
.L_02160b1c: .word data_ov000_021617ac
.L_02160b20: .word data_ov000_021617b8
    arm_func_end __sinit_ov000_02160988

    .section .ctor, 4, 1, 4
.p__sinit_ov000_021602b0:
    .word __sinit_ov000_021602b0
.p__sinit_ov000_02160794:
    .word __sinit_ov000_02160794
.p__sinit_ov000_02160988:
    .word __sinit_ov000_02160988
    .section .data, 4, 1, 4
data_ov000_02160b40:
    .byte 0x43, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov000_02160b50:
    .byte 0x43, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov000_02160b60:
    .byte 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2f, 0x67, 0x61, 0x6e, 0x62, 0x61, 0x72
    .byte 0x69, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov000_02160b78:
    .byte 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2f, 0x67, 0x61, 0x6e, 0x62, 0x61, 0x72
    .byte 0x69, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov000_02160b90:
    .byte 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2f, 0x6e, 0x69, 0x6e, 0x74, 0x65, 0x6e
    .byte 0x64, 0x6f, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov000_02160ba8:
    .byte 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2f, 0x6e, 0x69, 0x6e, 0x74, 0x65, 0x6e
    .byte 0x64, 0x6f, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02160bc0:
    .byte 0x4f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov000_02160bcc:
    .word data_ov000_02160c34
    .word data_ov000_02160bf8
    .word data_ov000_02160c20
    .word data_ov000_02160c4c
    .word data_ov000_02160be4
    .word data_ov000_02160c0c
data_ov000_02160be4:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x2e, 0x61, 0x74
    .byte 0x6d, 0x00, 0x00, 0x00
data_ov000_02160bf8:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x2e, 0x64, 0x69
    .byte 0x67, 0x00, 0x00, 0x00
data_ov000_02160c0c:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x72, 0x30, 0x30, 0x2e, 0x61
    .byte 0x74, 0x6d, 0x00, 0x00
data_ov000_02160c20:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x72, 0x30, 0x30, 0x2e, 0x64
    .byte 0x69, 0x67, 0x00, 0x00
data_ov000_02160c34:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x61, 0x63, 0x74, 0x69, 0x6d, 0x61, 0x67, 0x69
    .byte 0x6e, 0x65, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov000_02160c4c:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x61, 0x63, 0x74, 0x69, 0x6d, 0x61, 0x67, 0x69
    .byte 0x6e, 0x65, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02160c64:
    .byte 0x4f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov000_02160c70:
    .byte 0x4f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2e
    .byte 0x76, 0x78, 0x00, 0x00
data_ov000_02160c84:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2e
    .byte 0x61, 0x61, 0x72, 0x00
data_ov000_02160c98:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x72, 0x2e, 0x62, 0x69, 0x6e
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02160cac:
    .byte 0x62, 0x69, 0x6e, 0x2f, 0x6b, 0x6f, 0x6d, 0x61, 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_02160cbc:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov000_02160cc8:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov000_02160cd4:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov000_02160ce8:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02160cfc:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x00
data_ov000_02160d04:
    .byte 0x5f, 0x65, 0x00, 0x00
data_ov000_02160d08:
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov000_02160d10:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02160d18:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02160d20:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02160d28:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02160d30:
    .byte 0x54, 0x69, 0x74, 0x6c, 0x65, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00, 0x00
data_ov000_02160d3c:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov000_02160d4c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov000_02160d5c:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6c, 0x6c, 0x69, 0x73, 0x69, 0x6f, 0x6e, 0x2e, 0x69, 0x6e, 0x6c, 0x00
data_ov000_02160d6c:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov000_02160d80:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov000_02160d94:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x42, 0x61, 0x73, 0x65, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02160db0:
    .word func_ov000_02151540
    .word func_ov000_02151554
    .word func_ov000_021514c8
    .word func_0201c8a0
    .word func_ov000_0214d0c4
    .word func_ov012_021b0f50
    .word func_ov000_02151528
    .word func_0202f668
    .word func_ov000_021514f4
    .word func_ov000_0214d0d4
    .word func_ov000_021514ec
    .word func_ov000_021514e4
    .word func_ov000_02151514
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov000_0215150c
    .word func_ov000_021514fc
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov000_021514dc
    .word func_ov000_0215151c
    .word func_ov000_02151530
data_ov000_02160e1c:
    .byte 0x54, 0x69, 0x74, 0x6c, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00
data_ov000_02160e28:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov000_02160e38:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x6c, 0x6f, 0x67, 0x6f, 0x5f, 0x63, 0x6f, 0x70, 0x79, 0x2e
    .byte 0x61, 0x61, 0x72, 0x00
data_ov000_02160e4c:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x74, 0x61, 0x72, 0x74, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov000_02160e5c:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x5f, 0x65, 0x66, 0x66, 0x65
    .byte 0x63, 0x74, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov000_02160e74:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x74, 0x6f, 0x70, 0x30
    .byte 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov000_02160e8c:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x74, 0x6f, 0x70, 0x30
    .byte 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov000_02160ea4:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x74, 0x6f, 0x70, 0x30
    .byte 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00
data_ov000_02160ebc:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x74, 0x6f, 0x70, 0x30
    .byte 0x31, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov000_02160ed4:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x75, 0x6e, 0x64, 0x65
    .byte 0x72, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_02160eec:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x75, 0x6e, 0x64, 0x65
    .byte 0x72, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov000_02160f04:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x75, 0x6e, 0x64, 0x65
    .byte 0x72, 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_02160f1c:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x75, 0x6e, 0x64, 0x65
    .byte 0x72, 0x30, 0x31, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov000_02160f34:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x74, 0x6f, 0x70, 0x30
    .byte 0x30, 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00
data_ov000_02160f4c:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x73, 0x70, 0x61, 0x63, 0x65, 0x5f, 0x75, 0x6e, 0x64, 0x65
    .byte 0x72, 0x30, 0x30, 0x2e, 0x62, 0x69, 0x6e, 0x00
data_ov000_02160f64:
    .byte 0x74, 0x69, 0x74, 0x6c, 0x65, 0x2f, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x5f, 0x65, 0x66, 0x66, 0x65
    .byte 0x63, 0x74, 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00
data_ov000_02160f7c:
    .byte 0x53, 0x63, 0x61, 0x6c, 0x65, 0x00, 0x00, 0x00
data_ov000_02160f84:
    .byte 0x50, 0x61, 0x73, 0x73, 0x4d, 0x61, 0x72, 0x6b, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov000_02160f94:
    .byte 0x50, 0x61, 0x73, 0x73, 0x4d, 0x61, 0x72, 0x6b, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov000_02160fa4:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x50, 0x61, 0x73, 0x73, 0x4d, 0x61, 0x72, 0x6b
    .byte 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_02160fbc:
    .byte 0x6f, 0x70, 0x65, 0x6e, 0x69, 0x6e, 0x67, 0x2f, 0x70, 0x61, 0x74, 0x74, 0x65, 0x72, 0x6e, 0x2e
    .byte 0x62, 0x69, 0x6e, 0x00
data_ov000_02160fd0:
    .byte 0x6c, 0x58, 0x44, 0x30, 0x1c, 0x00, 0x00, 0x00
data_ov000_02160fd8:
    .byte 0x4d, 0x6f, 0x76, 0x69, 0x65, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov000_02160fe8:
    .byte 0x4d, 0x6f, 0x76, 0x69, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02160ffc:
    .word func_ov000_02152a04
    .word func_ov000_02152a14
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02161020:
    .word func_ov000_02153acc
    .word func_ov000_02152cb0
    .word func_ov000_02153c1c
    .word func_ov000_02153bb0
    .word func_ov000_02153b2c
    .word func_ov000_02153b04
    .word func_ov000_02153ae8
data_ov000_0216103c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161044:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216104c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161054:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216105c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161064:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216106c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161074:
    .word data_ov000_021611c4
    .word data_ov000_021611dc
data_ov000_0216107c:
    .word data_ov000_021611f4
    .word data_ov000_0216120c
data_ov000_02161084:
    .word data_ov000_021611b0
    .word data_ov000_0216123c
    .word data_ov000_02161224
    .word data_ov000_0216119c
    .word data_ov000_02161188
data_ov000_02161098:
    .byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
    .byte 0x06, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
    .byte 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov000_02151540
    .word func_ov000_02151554
    .word func_ov000_021514c8
    .word func_0201c8a0
    .word func_ov000_0214d0c4
    .word func_ov012_021b0f50
    .word func_ov000_02151528
    .word func_0202f668
    .word func_ov000_021514f4
    .word func_ov000_0214d0d4
    .word func_ov000_021514ec
    .word func_ov000_021514e4
    .word func_ov000_02151514
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov000_0215150c
    .word func_ov000_021514fc
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov000_021514dc
    .word func_ov000_0215151c
    .word func_ov000_02151530
data_ov000_0216113c:
    .byte 0x54, 0x6f, 0x70, 0x4d, 0x65, 0x6e, 0x75, 0x5f, 0x41, 0x64, 0x64, 0x00
data_ov000_02161148:
    .byte 0x41, 0x4c, 0x4e, 0x6f, 0x64, 0x65, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00
data_ov000_02161154:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov000_02161164:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6c, 0x6c, 0x69, 0x73, 0x69, 0x6f, 0x6e, 0x2e, 0x69, 0x6e, 0x6c, 0x00
data_ov000_02161174:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
data_ov000_02161184: ; ambiguous
    .byte 0x68, 0x00, 0x00, 0x00
data_ov000_02161188:
    .byte 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov000_0216119c:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x6a, 0x70, 0x2e, 0x61
    .byte 0x61, 0x72, 0x00, 0x00
data_ov000_021611b0:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2e
    .byte 0x61, 0x61, 0x72, 0x00
data_ov000_021611c4:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x62, 0x67, 0x30, 0x31
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov000_021611dc:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x62, 0x67, 0x30, 0x30
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov000_021611f4:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x62, 0x67, 0x30, 0x31
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov000_0216120c:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x62, 0x67, 0x30, 0x30
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov000_02161224:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov000_0216123c:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x62, 0x75, 0x74, 0x74
    .byte 0x6f, 0x6e, 0x30, 0x30, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov000_02161258:
    .byte 0x54, 0x6f, 0x70, 0x4d, 0x65, 0x6e, 0x75, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov000_02161264:
    .byte 0x44, 0x69, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov000_0216126c:
    .byte 0x53, 0x63, 0x61, 0x6c, 0x65, 0x00, 0x00, 0x00
data_ov000_02161274:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x74, 0x6f, 0x70, 0x5f, 0x62, 0x67, 0x30, 0x30
    .byte 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_0216128c:
    .byte 0x74, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x75, 0x2f, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x5f, 0x6f
    .byte 0x62, 0x6a, 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2f
    .byte 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x6a, 0x67, 0x61, 0x6c
    .byte 0x61, 0x78, 0x79, 0x2f, 0x6a, 0x67, 0x61, 0x6c, 0x61, 0x78, 0x79, 0x2e, 0x62, 0x69, 0x6e, 0x00
data_ov000_021612cc:
    .byte 0x54, 0x6f, 0x70, 0x4d, 0x65, 0x6e, 0x75, 0x5f, 0x43, 0x68, 0x61, 0x72, 0x61, 0x43, 0x72, 0x65
    .byte 0x61, 0x74, 0x65, 0x00
data_ov000_021612e0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
    .byte 0x03, 0x00, 0x00, 0x00
data_ov000_021612f4:
    .byte 0x54, 0x6f, 0x70, 0x4d, 0x65, 0x6e, 0x75, 0x43, 0x68, 0x61, 0x72, 0x61, 0x2e, 0x63, 0x70, 0x70
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02161308:
    .byte 0x63, 0x68, 0x72, 0x2f, 0x43, 0x68, 0x72, 0x41, 0x72, 0x63, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov000_02161318:
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_0216131c:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x38, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02161330:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x78, 0x00, 0x00
data_ov000_0216133c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161344:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216134c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161354:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216135c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161364:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216136c:
    .byte 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x5f, 0x41, 0x64, 0x64, 0x00, 0x00
data_ov000_02161378:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161380:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161388:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161390:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161398:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021613a0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021613a8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov000_02151540
    .word func_ov000_02151554
    .word func_ov000_021514c8
    .word func_0201c8a0
    .word func_ov000_0214d0c4
    .word func_ov012_021b0f50
    .word func_ov000_02151528
    .word func_0202f668
    .word func_ov000_021514f4
    .word func_ov000_0214d0d4
    .word func_ov000_021514ec
    .word func_ov000_021514e4
    .word func_ov000_02151514
    .word func_0202f6ac
    .word func_0202f6c4
    .word func_0202f6dc
    .word func_0202f6f8
    .word func_0202f730
    .word func_0202f768
    .word func_0202f7a0
    .word func_ov000_0215150c
    .word func_ov000_021514fc
    .word func_ov012_021b0c34
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov000_021514dc
    .word func_ov000_0215151c
    .word func_ov000_02151530
data_ov000_02161424:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161430:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_0216143c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161448:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161454:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161460:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_0216146c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161478:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161484:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161490:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_0216149c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021614a8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021614b4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021614c0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021614cc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021614d8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021614e4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021614f0:
    .byte 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov000_021614fc:
    .byte 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov000_02161510:
    .byte 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x5f, 0x6f, 0x62
    .byte 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov000_02161528:
    .byte 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x64, 0x65, 0x6c, 0x5f, 0x69, 0x6e, 0x66, 0x6f, 0x5f
    .byte 0x6f, 0x62, 0x6a, 0x2e, 0x61, 0x61, 0x72, 0x00
data_ov000_02161540:
    .byte 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2f, 0x62, 0x75, 0x74, 0x74, 0x6f, 0x6e, 0x2e, 0x61, 0x61
    .byte 0x72, 0x00, 0x00, 0x00
data_ov000_02161554:
    .byte 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x69, 0x6e, 0x66, 0x6f, 0x5f, 0x6f, 0x62, 0x6a, 0x2e
    .byte 0x61, 0x61, 0x72, 0x00
data_ov000_02161568:
    .byte 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x2f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00
data_ov000_02161578:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x00
data_ov000_02161580:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_0216158c:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_021615a0:
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov000_021615a8:
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov000_021615b0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021615b8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021615c0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021615c8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021615d0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021615d8:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov000_021615e8:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x2e, 0x69, 0x6e, 0x6c, 0x00, 0x00, 0x00, 0x00
data_ov000_021615f8:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov000_02161608:
    .byte 0x41, 0x4c, 0x57, 0x69, 0x64, 0x67, 0x65, 0x74, 0x49, 0x6d, 0x70, 0x2e, 0x68, 0x00, 0x00, 0x00
data_ov000_02161618:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x61, 0x77, 0x46, 0x75, 0x6e, 0x63, 0x00, 0x00
data_ov000_02161628:
    .byte 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x49, 0x6e, 0x66, 0x6f, 0x43, 0x68, 0x61, 0x72, 0x61, 0x5f
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161640:
    .byte 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x49, 0x6e, 0x66, 0x6f, 0x43, 0x68, 0x61, 0x72, 0x61, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov000_02161654:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_02161660:
    .byte 0x66, 0x6f, 0x6e, 0x74, 0x2f, 0x6a, 0x73, 0x6b, 0x66, 0x6f, 0x6e, 0x74, 0x2e, 0x61, 0x66, 0x74
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02161674:
    .byte 0x82, 0xc6, 0x82, 0xb6, 0x82, 0xe9, 0x00, 0x00
data_ov000_0216167c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161684:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216168c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161694:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_0216169c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021616a8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021616b4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021616c0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021616cc:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021616d8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021616e4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021616f0:
    .byte 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x53, 0x61, 0x76, 0x65, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65
    .byte 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov000_02161708:
    .byte 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x53, 0x61, 0x76, 0x65, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65
    .byte 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov000_02161720:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_0216172c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161734:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216173c:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161744:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x50, 0x69, 0x65, 0x63, 0x65, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x00, 0x00
data_ov000_02161758:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161764:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161770:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_0216177c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161788:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_02161794:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021617a0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021617ac:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021617b8:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov000_021617c4:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x50, 0x69, 0x65, 0x63, 0x65, 0x2e, 0x63, 0x70, 0x70, 0x00
data_ov000_021617d4:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x54, 0x69, 0x74, 0x6c, 0x65, 0x4f, 0x72, 0x64, 0x65
    .byte 0x72, 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00
data_ov000_021617ec:
    .byte 0x63, 0x68, 0x72, 0x2f, 0x43, 0x68, 0x72, 0x41, 0x72, 0x63, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov000_021617fc:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x64, 0x65, 0x6d, 0x6f, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00
data_ov000_0216180c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x77, 0x69, 0x6e, 0x64, 0x6f, 0x77, 0x5f, 0x30, 0x30
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov000_02161824:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x61, 0x6b, 0x75, 0x68, 0x69, 0x6e, 0x5f, 0x63
    .byte 0x68, 0x72, 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00
data_ov000_0216183c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x62, 0x67, 0x5f, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_02161850:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00
data_ov000_02161860:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_0216186c:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov000_02161878:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x62, 0x67, 0x5f, 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d
    .byte 0x00, 0x00, 0x00, 0x00
data_ov000_0216188c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_02161898:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x69, 0x6c, 0x6c, 0x75, 0x73, 0x74, 0x5f, 0x00, 0x00
data_ov000_021618a8:
    .byte 0x2e, 0x61, 0x61, 0x72, 0x00, 0x00, 0x00, 0x00
data_ov000_021618b0:
    .byte 0x64, 0x65, 0x6d, 0x6f, 0x2f, 0x00, 0x00, 0x00
data_ov000_021618b8:
    .byte 0x5f, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x00, 0x00
data_ov000_021618c0:
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov000_021618c8:
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov000_021618d0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021618d8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021618e0:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021618e8:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_021618f0:
    .byte 0x41, 0x4c, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x6f, 0x6c, 0x6c, 0x65, 0x72, 0x49, 0x6d, 0x70, 0x2e
    .byte 0x68, 0x00, 0x00, 0x00
data_ov000_02161904:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x53, 0x74, 0x61, 0x66, 0x66, 0x52, 0x6f, 0x6c, 0x6c, 0x5f
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_0216191c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x30, 0x32, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_02161934:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x30, 0x32, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov000_0216194c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x30, 0x33, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_02161964:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_0216197c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_02161994:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov000_021619ac:
    .word data_ov000_02161964
data_ov000_021619b0:
    .word data_ov000_02161994
    .word data_ov000_0216197c
    .word data_ov000_02161994
    .word data_ov000_0216191c
    .word data_ov000_02161934
    .word data_ov000_0216194c
    .word data_ov000_02161934
data_ov000_021619cc:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x53, 0x74, 0x61, 0x66, 0x66, 0x52, 0x6f, 0x6c, 0x6c, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov000_021619e0:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x62, 0x67, 0x5f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f
    .byte 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_021619f8:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x62, 0x67, 0x5f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x2e
    .byte 0x64, 0x69, 0x67, 0x00
data_ov000_02161a0c:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x61, 0x74, 0x6d, 0x00
data_ov000_02161a18:
    .byte 0x69, 0x6e, 0x66, 0x6f, 0x2f, 0x62, 0x67, 0x2e, 0x64, 0x69, 0x67, 0x00
data_ov000_02161a24:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x62, 0x67, 0x5f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f
    .byte 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02161a3c:
    .byte 0x50, 0x6f, 0x73, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_02161a48:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x53, 0x74, 0x61, 0x66, 0x66, 0x52, 0x6f, 0x6c, 0x6c
    .byte 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov000_02161a60:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x5f, 0x79, 0x2e, 0x6e, 0x63, 0x6c, 0x00
data_ov000_02161a78:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x73, 0x74, 0x61, 0x66, 0x66, 0x5f, 0x62, 0x61, 0x63
    .byte 0x6b, 0x5f, 0x62, 0x2e, 0x6e, 0x63, 0x6c, 0x00
data_ov000_02161a90:
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161a98:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x43, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x5f
    .byte 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00, 0x00
data_ov000_02161ab0:
    .byte 0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x43, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74, 0x2e
    .byte 0x63, 0x70, 0x70, 0x00
data_ov000_02161ac4:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x68, 0x79, 0x6f, 0x75, 0x6b, 0x69, 0x5f, 0x62, 0x67
    .byte 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov000_02161adc:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x68, 0x79, 0x6f, 0x75, 0x6b, 0x69, 0x5f, 0x62, 0x67
    .byte 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov000_02161af4:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x68, 0x79, 0x6f, 0x75, 0x6b, 0x69, 0x5f, 0x67, 0x61
    .byte 0x6c, 0x61, 0x78, 0x79, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov000_02161b10:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x68, 0x79, 0x6f, 0x75, 0x6b, 0x69, 0x5f, 0x67, 0x61
    .byte 0x6c, 0x61, 0x78, 0x79, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00
data_ov000_02161b2c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x30, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02161b44:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x30, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov000_02161b5c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x31, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02161b74:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x31, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov000_02161b8c:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x32, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02161ba4:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x32, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov000_02161bbc:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x33, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02161bd4:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x33, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00
data_ov000_02161bec:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x34, 0x2e, 0x61, 0x74, 0x6d, 0x00, 0x00
data_ov000_02161c04:
    .byte 0x65, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x2f, 0x63, 0x6f, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68, 0x74
    .byte 0x30, 0x34, 0x2e, 0x64, 0x69, 0x67, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
