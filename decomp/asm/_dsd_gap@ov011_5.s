    .include "macros/function.inc"

    .text
    .global func_ov011_02172a60
    arm_func_start func_ov011_02172a60
func_ov011_02172a60: ; 0x02172a60
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    ldr r4, .L_02172de4
    ldr r2, .L_02172de8
    mov r0, r4
    mov r1, #0x0
    bl func_020517fc
    bl func_02020d90
    str r0, [r4, #0x28]
    ldr r0, [r0, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r0, [r4, #0x28]
    mov r1, r4
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r2, #0x8d000
    ldr r0, [r4, #0x28]
    add r1, sp, #0x4
    str r2, [sp, #0x4]
    bl func_ov011_02172e14
    ldr r0, [r4, #0x28]
    ldr r1, .L_02172dec
    ldr r0, [r0, #0x4]
    bl func_02028384
    ldr r0, .L_02172df0
    ldr r1, .L_02172df4
    ldr r2, [r0, #0x0]
    ldr r0, .L_02172df8
    ldr r2, [r2, #0x158]
    ldr r0, [r0, #0x4]
    str r1, [r4, #0x0]
    and r6, r2, #0xff
    bl func_02033bb8
    cmp r0, #0x0
    beq .L_02172b3c
    ldr r0, .L_02172df8
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    bl func_02033410
    mov r5, r0
    ldr r1, [r5, #0x1c]
    cmp r1, #0x0
    bne .L_02172b30
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02172b30:
    ldr r0, [r5, #0x1c]
    str r0, [r4, #0x24]
    b .L_02172b44
.L_02172b3c:
    mov r0, #0x0
    str r0, [r4, #0x24]
.L_02172b44:
    add r0, r4, #0xd8
    add r5, r0, #0x400
    mov r7, #0x0
.L_02172b50:
    mov r1, r5
    add r0, r4, #0xc
    bl func_02037b98
    add r7, r7, #0x1
    cmp r7, #0x60
    add r5, r5, #0x38
    blt .L_02172b50
    add r0, r4, #0x1d8
    add r5, r0, #0x1800
    mov r7, #0x0
.L_02172b78:
    mov r1, r5
    add r0, r4, #0x1c
    bl func_02037b98
    add r7, r7, #0x1
    cmp r7, #0x80
    add r5, r5, #0xc
    blt .L_02172b78
    cmp r6, #0x0
    add r5, r4, #0xa8
    mov r7, #0x0
    bls .L_02172dd0
    ldr r10, .L_02172dfc
    b .L_02172dc8
.L_02172bac:
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    beq .L_02172bc4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02172bc4:
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    beq .L_02172be8
    bl func_0202899c
    ldr r0, [r5, #0x14]
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02172be8:
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    beq .L_02172c08
    bl func_02020934
    ldr r0, [r5, #0x18]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02172c08:
    bl func_02020d90
    str r0, [r5, #0x1c]
    ldr r0, [r0, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r0, [r5, #0x1c]
    ldr r1, .L_02172e00
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r1, #0x8f000
    str r1, [sp, #0x0]
    ldr r0, [r5, #0x1c]
    add r1, sp, #0x0
    bl func_ov011_02172e14
    ldr r0, [r5, #0x1c]
    mov r1, r5
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r4, #0x28]
    ldr r0, [r5, #0x1c]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02172c88
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_02172c98
.L_02172c88:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_02172c98:
    ldr r0, [r5, #0x1c]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r2, .L_02172e04
    mov r1, r10
    mov r0, #0x4
    mov r3, #0xf9
    bl func_0201a21c
    movs r8, r0
    beq .L_02172d28
    ldr r1, .L_02172dfc
    ldr r2, .L_02172e04
    mov r0, #0x134
    mov r3, #0xf9
    bl func_0201a21c
    movs r9, r0
    beq .L_02172d18
    bl func_02028b90
    ldr r0, .L_02172e08
    mov r2, #0x0
    str r0, [r9, #0x0]
    str r7, [r9, #0xe0]
    str r2, [r9, #0x12c]
    str r2, [r9, #0xe8]
    str r2, [r9, #0xe4]
    str r2, [r9, #0x130]
    mov r1, r2
.L_02172d04:
    add r0, r9, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0xec]
    cmp r2, #0x10
    blt .L_02172d04
.L_02172d18:
    mov r0, r8
    mov r1, r9
    bl func_020288dc
    mov r8, r0
.L_02172d28:
    mov r0, r8
    str r8, [r5, #0x14]
    bl func_0202894c
    ldr r2, .L_02172e04
    mov r1, r10
    mov r0, #0x14
    mov r3, #0xfd
    bl func_0201a21c
    movs r8, r0
    beq .L_02172d70
    bl func_02020860
    ldr r1, .L_02172e0c
    mov r0, #0x0
    str r1, [r8, #0x0]
    str r7, [r8, #0x8]
    strb r0, [r8, #0x10]
    strh r0, [r8, #0xe]
    strh r0, [r8, #0xc]
.L_02172d70:
    mov r0, r8
    str r8, [r5, #0x18]
    bl func_02020910
    mov r0, r5
    bl func_ov011_0217d798
    mov r0, r5
    bl func_ov011_0217ced0
    mov r0, r5
    bl func_ov011_0217e2d8
    ldr r0, [r5, #0xd4]
    mov r2, #0x1
    orr r0, r0, r7, lsl #0x1c
    str r0, [r5, #0xd4]
    add r0, r7, #0x1
    ldr r1, .L_02172e10
    strb r2, [r5, #0x108]
    str r1, [r5, #0x0]
    sub r1, r2, #0x2
    strb r1, [r5, #0x38]
    strb r1, [r5, #0x10b]
    and r7, r0, #0xff
    add r5, r5, #0x10c
.L_02172dc8:
    cmp r7, r6
    blo .L_02172bac
.L_02172dd0:
    ldr r0, [r4, #0x28]
    bl func_ov011_02176518
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02172de4: .word data_ov011_02181a60
.L_02172de8: .word 0x1fd8
.L_02172dec: .word func_ov011_02173410
.L_02172df0: .word data_ov006_02172960
.L_02172df4: .word 0x4e414d41
.L_02172df8: .word data_ov011_021816c0
.L_02172dfc: .word data_ov011_021817c0
.L_02172e00: .word func_ov011_02173c54
.L_02172e04: .word data_ov011_0218179c
.L_02172e08: .word data_ov011_02181700
.L_02172e0c: .word data_ov011_02181740
.L_02172e10: .word 0x4a424f41
    arm_func_end func_ov011_02172a60

    .global func_ov011_02172e14
    arm_func_start func_ov011_02172e14
func_ov011_02172e14: ; 0x02172e14
    stmdb sp!, {r3, lr}
    ldr r2, [r1, #0x0]
    add r1, sp, #0x0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02172e14

    .global func_ov011_02172e38
    arm_func_start func_ov011_02172e38
func_ov011_02172e38: ; 0x02172e38
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov011_02172e60
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    bl func_02027560
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02172e38

    .global func_ov011_02172e60
    arm_func_start func_ov011_02172e60
func_ov011_02172e60: ; 0x02172e60
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x34]
    ldr r0, [r4, #0x25c]
    cmp r0, #0x0
    bne .L_02172e88
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02172e88:
    ldr r0, [r4, #0x25c]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02172e60

    .global func_ov011_02172e90
    arm_func_start func_ov011_02172e90
func_ov011_02172e90: ; 0x02172e90
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov011_02172e60
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x224]
    cmp r0, #0x0
    ldr r0, [r4, #0x4]
    ldrneh r0, [r0, #0x4]
    ldmneia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02172e90

    .global func_ov011_02172ec4
    arm_func_start func_ov011_02172ec4
func_ov011_02172ec4: ; 0x02172ec4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r4, r0
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_02172ef0
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x24]
.L_02172ef0:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_02172f10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x28]
.L_02172f10:
    mov r9, #0x0
    add r8, r4, #0xa8
    mov r7, r9
    mov r6, r9
    mov r5, r9
    mov r4, r9
    mov r10, r9
.L_02172f2c:
    mov r0, r8
    bl func_ov011_0217d888
    mov r0, r8
    bl func_ov011_0217cfc0
    mov r0, r8
    bl func_ov011_0217e370
    ldr r0, [r8, #0x24]
    cmp r0, #0x0
    beq .L_02172f58
    bl func_ov011_02174e1c
    str r7, [r8, #0x24]
.L_02172f58:
    ldr r0, [r8, #0x2c]
    cmp r0, #0x0
    beq .L_02172f6c
    bl func_ov011_021790fc
    str r6, [r8, #0x2c]
.L_02172f6c:
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    beq .L_02172f88
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    str r5, [r8, #0x1c]
.L_02172f88:
    ldr r0, [r8, #0x14]
    cmp r0, #0x0
    beq .L_02172fb0
    bl func_0202899c
    ldr r0, [r8, #0x14]
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    str r4, [r8, #0x14]
.L_02172fb0:
    ldr r0, [r8, #0x18]
    cmp r0, #0x0
    beq .L_02172fd4
    bl func_02020934
    ldr r0, [r8, #0x18]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    str r10, [r8, #0x18]
.L_02172fd4:
    add r9, r9, #0x1
    cmp r9, #0x4
    add r8, r8, #0x10c
    blo .L_02172f2c
    bl func_ov011_02176830
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    arm_func_end func_ov011_02172ec4

    .global func_ov011_02172fec
    arm_func_start func_ov011_02172fec
func_ov011_02172fec: ; 0x02172fec
    ldr ip, .L_02173000
    mov r2, r0
    mov r0, r1
    ldr r1, [r2, #0x24]
    bx ip
.L_02173000: .word func_ov011_021793a8
    arm_func_end func_ov011_02172fec

    .global func_ov011_02173004
    arm_func_start func_ov011_02173004
func_ov011_02173004: ; 0x02173004
    mov r2, #0x10c
    mla r0, r1, r2, r0
    ldr r0, [r0, #0xbc]
    bx lr
    arm_func_end func_ov011_02173004

    .global func_ov011_02173014
    arm_func_start func_ov011_02173014
func_ov011_02173014: ; 0x02173014
    mov r2, #0x10c
    mla r0, r1, r2, r0
    ldr r0, [r0, #0xc0]
    bx lr
    arm_func_end func_ov011_02173014

    .global func_ov011_02173024
    arm_func_start func_ov011_02173024
func_ov011_02173024: ; 0x02173024
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r2
    add r2, r7, #0xa8
    mov r0, #0x10c
    mla r4, r6, r0, r2
    str r1, [r4, #0x20]
    ldr r0, [r4, #0x1c]
    mov r5, r3
    ldr r0, [r0, #0x4]
    bl func_02028330
    cmp r5, #0x0
    beq .L_02173080
    ldr r0, [r4, #0xd4]
    mov r1, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0xd4]
    ldrb r2, [r7, #0x34]
    mov r0, r4
    orr r1, r2, r1, lsl r6
    strb r1, [r7, #0x34]
    bl func_ov011_0217d008
    b .L_021730a8
.L_02173080:
    ldr r1, [r4, #0xd4]
    mov r0, #0x1
    bic r1, r1, #0x1
    str r1, [r4, #0xd4]
    ldrb r1, [r7, #0x34]
    mvn r0, r0, lsl r6
    and r1, r1, r0
    mov r0, r4
    strb r1, [r7, #0x34]
    bl func_ov011_0217d04c
.L_021730a8:
    mov r0, #0x1
    strb r0, [r4, #0x105]
    mov r0, #0x0
    str r0, [r4, #0xd8]
    ldr r0, [r4, #0x1c]
    mov r1, r6
    bl func_ov011_02174330
    mov r1, r5
    str r0, [r4, #0x24]
    bl func_ov011_02173144
    mov r0, r6
    bl func_02070cdc
    ldr r1, .L_02173140
    ldrb r2, [r0, #0x34]
    ldr r0, [r1, #0x0]
    ldr r1, [r7, #0x24]
    ldr r0, [r0, #0x154]
    cmp r0, #0x5
    ldr r0, [r4, #0x1c]
    moveq r2, #0x0
    bl func_ov011_02178ff8
    str r0, [r4, #0x2c]
    ldrb r0, [r0, #0x2e]
    add r1, r7, r6, lsl #0x2
    strb r0, [r4, #0x104]
    cmp r0, #0x8
    movhs r0, #0x7
    strhsb r0, [r4, #0x104]
    mov r0, #0x0
    strb r0, [r4, #0x109]
    ldr r0, [r4, #0x20]
    ldr r2, [r0, #0x1a8]
    mov r0, r4
    ldr r2, [r2, #0x10]
    ldr r2, [r2, #0x5c]
    add r2, r2, #0xc
    str r2, [r1, #0x98]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02173140: .word data_ov006_02172960
    arm_func_end func_ov011_02173024

    .global func_ov011_02173144
    arm_func_start func_ov011_02173144
func_ov011_02173144: ; 0x02173144
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r1, [r0, #0x24]
    beq .L_02173178
    orr r1, r1, #0x1
    str r1, [r0, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r3, pc}
.L_02173178:
    bic r1, r1, #0x1
    str r1, [r0, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02173144

    .global func_ov011_0217319c
    arm_func_start func_ov011_0217319c
func_ov011_0217319c: ; 0x0217319c
    cmp r1, #0x3
    bxeq lr
    cmp r1, #0x4
    blt .L_021731cc
    ldrb r1, [r0, #0x104]
    add r2, r1, #0x3
    and r1, r2, #0xff
    cmp r1, #0x7
    strb r2, [r0, #0x104]
    movhi r1, #0x7
    strhib r1, [r0, #0x104]
    bx lr
.L_021731cc:
    cmp r1, #0x3
    bxgt lr
    ldrb r1, [r0, #0x104]
    cmp r1, #0x2
    movlo r1, #0x0
    strlob r1, [r0, #0x104]
    subhs r1, r1, #0x3
    strhsb r1, [r0, #0x104]
    bx lr
    arm_func_end func_ov011_0217319c

    .global func_ov011_021731f0
    arm_func_start func_ov011_021731f0
func_ov011_021731f0: ; 0x021731f0
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    strb r5, [r6, #0x108]
    ldr r0, [r6, #0x24]
    bl func_ov011_0217325c
    movs r4, r0
    beq .L_02173250
    cmp r5, #0x1
    ldr r0, [r6, #0x24]
    bne .L_02173234
    mov r1, #0x1
    bl func_ov011_02173144
    mov r0, r4
    mov r1, #0x1
    bl func_ov011_02173270
    b .L_02173250
.L_02173234:
    mov r1, #0x0
    bl func_ov011_02173144
    mov r0, r4
    mov r1, #0x0
    bl func_ov011_02173270
    mov r0, r4
    bl func_ov011_02176d14
.L_02173250:
    mov r0, #0x0
    str r0, [r6, #0xd8]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_021731f0

    .global func_ov011_0217325c
    arm_func_start func_ov011_0217325c
func_ov011_0217325c: ; 0x0217325c
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x8]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217325c

    .global func_ov011_02173270
    arm_func_start func_ov011_02173270
func_ov011_02173270: ; 0x02173270
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    beq .L_02173294
    bl func_02028330
    ldmia sp!, {r3, pc}
.L_02173294:
    bl func_020282f4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02173270

    .global func_ov011_0217329c
    arm_func_start func_ov011_0217329c
func_ov011_0217329c: ; 0x0217329c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, [r0, #0x2c]
    cmp r3, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov ip, #0x0
    mov r3, #0x1
.L_021732b4:
    tst r1, r3, lsl ip
    beq .L_02173304
    cmp r2, #0x0
    ldr r5, [r0, #0x2c]
    mov r4, ip, asr #0x5
    beq .L_021732e8
    add lr, r5, r4, lsl #0x2
    bic r4, ip, #0x1f
    ldr r5, [lr, #0x34]
    sub r4, ip, r4
    orr r4, r5, r3, lsl r4
    str r4, [lr, #0x34]
    b .L_02173304
.L_021732e8:
    bic lr, ip, #0x1f
    add r5, r5, r4, lsl #0x2
    sub lr, ip, lr
    mvn lr, r3, lsl lr
    ldr r4, [r5, #0x34]
    and r4, r4, lr
    str r4, [r5, #0x34]
.L_02173304:
    add ip, ip, #0x1
    cmp ip, #0x16
    blt .L_021732b4
    bl func_ov011_0217aad4
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_0217329c

    .global func_ov011_02173318
    arm_func_start func_ov011_02173318
func_ov011_02173318: ; 0x02173318
    stmdb sp!, {r3, lr}
    mov ip, #0x0
    ldr r3, .L_02173358
    mov lr, ip
.L_02173328:
    ldrsb r2, [r3, lr]
    cmp r2, #0x0
    blt .L_02173350
    ldr r1, [r0, #0x20]
    ldrsb r1, [r1, #0x18]
    cmp r2, r1
    moveq ip, #0x1
    beq .L_02173350
    add lr, lr, #0x1
    b .L_02173328
.L_02173350:
    mov r0, ip
    ldmia sp!, {r3, pc}
.L_02173358: .word data_ov011_021810a8
    arm_func_end func_ov011_02173318

    .global func_ov011_0217335c
    arm_func_start func_ov011_0217335c
func_ov011_0217335c: ; 0x0217335c
    stmdb sp!, {r3, lr}
    ldr r3, .L_021733b0
    mov ip, #0x0
    ldrsb lr, [r3, ip]
    cmp lr, #0x0
    movlt r0, #0x1
    ldmltia sp!, {r3, pc}
    cmp r1, #0x0
    beq .L_02173390
    cmp lr, #0x9
    cmpne lr, #0xa
    cmpne lr, #0xb
    beq .L_021733a4
.L_02173390:
    ldr r2, [r0, #0x20]
    ldrsb r2, [r2, #0x18]
    cmp lr, r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
.L_021733a4:
    add ip, ip, #0x1
    b #-0x40
    ldmia sp!, {r3, pc}
.L_021733b0: .word data_ov011_021810ec
    arm_func_end func_ov011_0217335c

    .global func_ov011_021733b4
    arm_func_start func_ov011_021733b4
func_ov011_021733b4: ; 0x021733b4
    cmp r0, #0x0
    ldrlt r1, .L_021733d4
    ldrlt r2, [r1, #0x0]
    addlt r2, r2, #0x1
    strlt r2, [r1, #0x0]
    ldr r1, .L_021733d8
    ldrsb r0, [r1, r0]
    bx lr
.L_021733d4: .word data_ov011_021816c0
.L_021733d8: .word data_ov011_02181100
    arm_func_end func_ov011_021733b4

    .global func_ov011_021733dc
    arm_func_start func_ov011_021733dc
func_ov011_021733dc: ; 0x021733dc
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0x1a8]
    ldr r1, [r0, #0x10]
    ldr r0, [r1, #0x3c]
    tst r0, #0x10000000
    bne .L_02173400
    ldr r0, [r1, #0x40]
    tst r0, #0x18000000
    beq .L_02173408
.L_02173400:
    mov r0, #0x1
    bx lr
.L_02173408:
    mov r0, #0x0
    bx lr
    arm_func_end func_ov011_021733dc

    .global func_ov011_02173410
    arm_func_start func_ov011_02173410
func_ov011_02173410: ; 0x02173410
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    ldr r0, [r0, #0x4]
    ldr r9, [r0, #0x10]
    ldrb r0, [r9, #0x34]
    tst r0, #0xf
    beq .L_02173c24
    ldr r0, .L_02173c2c
    mov r8, #0x7f
    ldr r0, [r0, #0x0]
    mov r6, #0x0
    ldr r3, [r0, #0x8]
    mov r0, #0x200
    ldr r1, .L_02173c30
    mov r2, r6
    sub r7, r8, #0xff
    str r0, [sp, #0x0]
.L_02173454:
    ldr r0, [r1, r2, lsl #0x2]
    cmp r0, #0x0
    blt .L_02173474
    cmp r3, r0
    moveq r6, #0x1
    beq .L_02173474
    add r2, r2, #0x1
    b .L_02173454
.L_02173474:
    mvn r0, #0x0
    strb r0, [r9, #0x36]
    ldrsb r0, [r9, #0x36]
    add r5, r9, #0xa8
    mov r4, #0x0
    strb r0, [r9, #0x35]
.L_0217348c:
    mov r2, #0x0
    mvn r1, #0x0
.L_02173494:
    add r0, r5, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0xdc]
    cmp r2, #0x4
    blt .L_02173494
    ldr r0, [r5, #0x20]
    cmp r0, #0x0
    streqb r1, [r5, #0x106]
    beq .L_021735fc
    cmp r6, #0x0
    beq .L_02173510
    ldr r1, .L_02173c2c
    add r0, r5, #0x100
    ldr r1, [r1, #0x0]
    add r1, r1, r4, lsl #0x2
    ldr r1, [r1, #0x4c]
    strb r1, [r5, #0x106]
    ldrsb r0, [r0, #0x6]
    cmp r0, #0x0
    blt .L_02173514
    cmp r0, #0x4
    bge .L_02173514
    cmp r0, r7
    strgtb r0, [r9, #0x36]
    add r0, r5, #0x100
    ldrgtsb r7, [r9, #0x36]
    ldrsb r0, [r0, #0x6]
    cmp r0, r8
    strltb r0, [r9, #0x35]
    ldrltsb r8, [r9, #0x35]
    b .L_02173514
.L_02173510:
    strb r1, [r5, #0x106]
.L_02173514:
    ldr r0, [r5, #0x24]
    mvn r1, #0x0
    cmp r0, #0x0
    beq .L_0217352c
    bl func_ov011_02173c40
    mov r1, r0
.L_0217352c:
    cmp r1, #0x0
    ble .L_02173544
    ldr r0, [sp, #0x0]
    cmp r1, r0
    strlt r1, [sp, #0x0]
    strltb r4, [r9, #0x37]
.L_02173544:
    add r0, r9, r4, lsl #0x2
    ldr r2, [r0, #0x98]
    ldr r0, .L_02173c34
    add r1, r9, #0xa8
    add r10, r0, r4
    mvn r11, #0x80000000
    mov ip, #0x0
.L_02173560:
    cmp r4, ip
    ldrne r0, [r1, #0x20]
    cmpne r0, #0x0
    beq .L_021735ec
    add r0, r9, ip, lsl #0x2
    ldr r0, [r0, #0x98]
    ldr lr, [r2, #0x0]
    ldr r3, [r0, #0x0]
    ldr r0, [r0, #0x4]
    subs r3, lr, r3
    ldr lr, [r2, #0x4]
    rsbmi r3, r3, #0x0
    subs r0, lr, r0
    rsbmi r0, r0, #0x0
    add r3, r3, r0
    add r0, r5, ip, lsl #0x2
    str r3, [r0, #0xdc]
    cmp r11, r3
    ble .L_021735ec
    ldr r0, .L_02173c2c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x154]
    cmp r0, #0x5
    ldrne r0, .L_02173c34
    ldrneb r0, [r0, #0x2d]
    cmpne r0, #0x0
    beq .L_021735e4
    ldr lr, .L_02173c34
    ldrsb r0, [r10, #0x2e]
    add lr, lr, ip
    ldrsb lr, [lr, #0x2e]
    cmp r0, lr
    beq .L_021735ec
.L_021735e4:
    mov r11, r3
    strb ip, [r5, #0x107]
.L_021735ec:
    add ip, ip, #0x1
    cmp ip, #0x4
    add r1, r1, #0x10c
    blt .L_02173560
.L_021735fc:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r5, r5, #0x10c
    blt .L_0217348c
    mov r2, #0x0
    mov r0, r2
    add r1, sp, #0x4
.L_02173618:
    strb r0, [r1, r2]
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_02173618
    add r7, r9, #0xa8
.L_0217362c:
    ldr r3, [r7, #0x24]
    cmp r3, #0x0
    beq .L_021736d8
    add r1, r9, #0xa8
    mov r2, #0x0
    add r6, sp, #0x4
.L_02173644:
    ldr r4, [r1, #0x24]
    add r1, r1, #0x10c
    cmp r4, #0x0
    cmpne r0, r2
    ldrne r4, [r4, #0x0]
    add r2, r2, #0x1
    cmpne r4, #0x0
    ldrne r4, [r4, #0x0]
    ldrneb r5, [r4, #0x13]
    ldrnesb r4, [r6, r5]
    addne r4, r4, #0x1
    strneb r4, [r6, r5]
    cmp r2, #0x4
    blt .L_02173644
    ldr r6, [r3, #0x14]
    add r3, sp, #0x4
    ldr r1, .L_02173c38
    mov r5, #0x0
    b .L_021736d0
.L_02173690:
    ldr r8, [r6, #0x8]
    mov r10, r5
    strb r5, [r8, #0xc6]
.L_0217369c:
    ldr r4, [r8, #0x0]
    ldrsb r2, [r3, r10]
    ldrb r11, [r4, #0x13]
    ldrsb r4, [r8, #0xc6]
    add r11, r1, r11, lsl #0x2
    ldrsb r11, [r10, r11]
    add r10, r10, #0x1
    cmp r10, #0x3
    smulbb r2, r2, r11
    add r2, r4, r2, lsl #0x1
    strb r2, [r8, #0xc6]
    blt .L_0217369c
    ldr r6, [r6, #0x0]
.L_021736d0:
    cmp r6, #0x0
    bne .L_02173690
.L_021736d8:
    add r0, r0, #0x1
    cmp r0, #0x4
    add r7, r7, #0x10c
    blt .L_0217362c
    bl func_ov011_021768dc
    ldr r6, [r9, #0x14]
    mov r5, #0x0
    mov r4, #0xc
    b .L_02173728
.L_021736fc:
    mov r1, r6
    add r0, r9, #0x14
    bl func_02037c24
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_020517fc
    mov r1, r6
    add r0, r9, #0x1c
    bl func_02037b98
    ldr r6, [r9, #0x14]
.L_02173728:
    cmp r6, #0x0
    bne .L_021736fc
    mov r0, #0x0
    bl func_0208369c
    mov r4, r0
    b .L_02173790
.L_02173740:
    ldr r5, [r4, #0x8]
    ldr r0, [r5, #0x2c]
    tst r0, #0x9
    bne .L_0217378c
    ldr r1, [r5, #0x10]
    ldr r0, [r1, #0x70]
    cmp r0, #0x0
    beq .L_0217378c
    ldr r0, [r1, #0x34]
    tst r0, #0x2000
    beq .L_0217378c
    ldr r6, [r9, #0x1c]
    add r0, r9, #0x1c
    mov r1, r6
    bl func_02037c24
    mov r1, r6
    add r0, r9, #0x14
    bl func_02037b98
    str r5, [r6, #0x8]
.L_0217378c:
    ldr r4, [r4, #0x0]
.L_02173790:
    cmp r4, #0x0
    bne .L_02173740
    mov r0, #0x5
    bl func_0208369c
    mov r5, r0
    b .L_021737ec
.L_021737a8:
    ldr r4, [r5, #0x8]
    ldr r0, [r4, #0x2c]
    tst r0, #0x9
    bne .L_021737e8
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x70]
    cmp r0, #0x0
    beq .L_021737e8
    ldr r6, [r9, #0x1c]
    add r0, r9, #0x1c
    mov r1, r6
    bl func_02037c24
    mov r1, r6
    add r0, r9, #0x14
    bl func_02037b98
    str r4, [r6, #0x8]
.L_021737e8:
    ldr r5, [r5, #0x0]
.L_021737ec:
    cmp r5, #0x0
    bne .L_021737a8
    ldr r6, [r9, #0x14]
    b .L_02173b1c
.L_021737fc:
    bl func_ov011_02176834
    ldr r1, [r6, #0x8]
    mov r5, r0
    cmp r1, #0x0
    beq .L_02173b18
    ldr r0, [r1, #0x10]
    ldr r7, [r0, #0x70]
    ldr r4, [r0, #0x5c]
    cmp r7, #0x0
    bne .L_0217383c
    mov r0, #0x0
    strh r0, [r5, #0xe]
    strh r0, [r5, #0xa]
    strh r0, [r5, #0xc]
    strh r0, [r5, #0x8]
    b .L_02173b18
.L_0217383c:
    ldrsb r0, [r1, #0x39]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    b .L_02173b08
.L_0217384c: ; jump table
    b .L_02173b08 ; case 0
    b .L_02173a84 ; case 1
    b .L_02173afc ; case 2
    b .L_02173a84 ; case 3
    b .L_02173b08 ; case 4
    b .L_0217387c ; case 5
    b .L_02173a0c ; case 6
    b .L_02173a0c ; case 7
    b .L_02173afc ; case 8
    b .L_02173afc ; case 9
    b .L_02173b08 ; case 10
    b .L_02173a84 ; case 11
.L_0217387c:
    bl func_ov011_02176848
    b .L_02173980
.L_02173884:
    ldrsb r1, [r0, #0x18]
    cmp r1, #0x5
    bne .L_0217397c
    ldrsh r10, [r0, #0x8]
    ldr r8, [r4, #0xc]
    cmp r10, r8, asr #0x8
    bgt .L_0217397c
    ldrsh r1, [r0, #0xc]
    cmp r1, r8, asr #0x8
    blt .L_0217397c
    ldrsh r11, [r7, #0x0]
    ldrsh r5, [r7, #0x4]
    ldrsh r1, [r7, #0x6]
    ldrsh r2, [r7, #0x2]
    ldr r3, [r4, #0x10]
    add r8, r11, r8, asr #0x8
    add r5, r5, #0x10
    sub r11, r8, r5
    mov r11, r11, lsl #0x10
    add r3, r2, r3, asr #0x8
    add r2, r1, #0x8
    sub r1, r3, r2
    add r2, r2, r3
    add r5, r5, r8
    mov r1, r1, lsl #0x10
    mov r5, r5, lsl #0x10
    mov r3, r11, asr #0x10
    cmp r10, r11, asr #0x10
    mov r2, r2, lsl #0x10
    strgth r3, [r0, #0x8]
    mov r8, r1, asr #0x10
    ldrsh r1, [r0, #0xc]
    mov r5, r5, asr #0x10
    mov r2, r2, asr #0x10
    cmp r1, r5
    strlth r5, [r0, #0xc]
    ldrsh r1, [r0, #0xa]
    mov r5, #0x0
    cmp r1, r8
    strgth r8, [r0, #0xa]
    ldrsh r1, [r0, #0xe]
    cmp r1, r2
    strlth r2, [r0, #0xe]
    ldrsh r2, [r0, #0xc]
    ldrsh r1, [r0, #0x8]
    sub r1, r2, r1
    mov r1, r1, asr #0x1
    strh r1, [r0, #0x14]
    ldrsh r2, [r0, #0xe]
    ldrsh r1, [r0, #0xa]
    sub r1, r2, r1
    mov r1, r1, asr #0x1
    strh r1, [r0, #0x16]
    ldrsh r2, [r0, #0x8]
    ldrsh r1, [r0, #0x14]
    add r1, r2, r1
    strh r1, [r0, #0x10]
    ldrsh r2, [r0, #0xa]
    ldrsh r1, [r0, #0x16]
    add r1, r2, r1
    strh r1, [r0, #0x12]
    b .L_02173988
.L_0217397c:
    ldr r0, [r0, #0x0]
.L_02173980:
    cmp r0, #0x0
    bne .L_02173884
.L_02173988:
    cmp r5, #0x0
    beq .L_02173b08
    mov r0, #0x5
    strb r0, [r5, #0x18]
    ldrsh r0, [r7, #0x4]
    ldrsh r1, [r7, #0x0]
    ldr r2, [r4, #0xc]
    add r0, r0, #0x8
    add r1, r1, r2, asr #0x8
    sub r0, r1, r0
    strh r0, [r5, #0x8]
    ldrsh r2, [r7, #0x4]
    ldrsh r0, [r7, #0x0]
    ldr r1, [r4, #0xc]
    add r2, r2, #0x8
    add r0, r0, r1, asr #0x8
    add r0, r2, r0
    strh r0, [r5, #0xc]
    ldrsh r0, [r7, #0x6]
    ldrsh r1, [r7, #0x2]
    ldr r2, [r4, #0x10]
    add r0, r0, #0x8
    add r1, r1, r2, asr #0x8
    sub r0, r1, r0
    strh r0, [r5, #0xa]
    ldrsh r2, [r7, #0x6]
    ldrsh r0, [r7, #0x2]
    ldr r1, [r4, #0x10]
    add r2, r2, #0x8
    add r0, r0, r1, asr #0x8
    add r0, r2, r0
    strh r0, [r5, #0xe]
    b .L_02173b08
.L_02173a0c:
    strb r0, [r5, #0x18]
    ldrsh r0, [r7, #0x4]
    ldrsh r1, [r7, #0x0]
    ldr r2, [r4, #0xc]
    add r0, r0, #0x10
    add r1, r1, r2, asr #0x8
    sub r0, r1, r0
    strh r0, [r5, #0x8]
    ldrsh r2, [r7, #0x4]
    ldrsh r0, [r7, #0x0]
    ldr r1, [r4, #0xc]
    add r2, r2, #0x10
    add r0, r0, r1, asr #0x8
    add r0, r2, r0
    strh r0, [r5, #0xc]
    ldrsh r0, [r7, #0x6]
    ldrsh r1, [r7, #0x2]
    ldr r2, [r4, #0x10]
    add r0, r0, #0x10
    add r1, r1, r2, asr #0x8
    sub r0, r1, r0
    strh r0, [r5, #0xa]
    ldrsh r2, [r7, #0x6]
    ldrsh r0, [r7, #0x2]
    ldr r1, [r4, #0x10]
    add r2, r2, #0x40
    add r0, r0, r1, asr #0x8
    add r0, r2, r0
    strh r0, [r5, #0xe]
    b .L_02173b08
.L_02173a84:
    strb r0, [r5, #0x18]
    ldrsh r0, [r7, #0x4]
    ldrsh r1, [r7, #0x0]
    ldr r2, [r4, #0xc]
    add r0, r0, #0x8
    sub r0, r1, r0
    add r0, r0, r2, asr #0x8
    strh r0, [r5, #0x8]
    ldrsh r0, [r7, #0x4]
    ldrsh r1, [r7, #0x0]
    ldr r2, [r4, #0xc]
    add r0, r0, #0x8
    add r0, r1, r0
    add r0, r0, r2, asr #0x8
    strh r0, [r5, #0xc]
    ldrsh r0, [r7, #0x6]
    ldrsh r1, [r7, #0x2]
    ldr r2, [r4, #0x10]
    add r0, r0, #0x8
    sub r0, r1, r0
    add r0, r0, r2, asr #0x8
    strh r0, [r5, #0xa]
    ldrsh r0, [r7, #0x6]
    ldrsh r1, [r7, #0x2]
    ldr r2, [r4, #0x10]
    add r0, r0, #0x8
    add r0, r1, r0
    add r0, r0, r2, asr #0x8
    strh r0, [r5, #0xe]
    b .L_02173b08
.L_02173afc:
    ldrb r0, [r9, #0x34]
    orr r0, r0, #0x10
    strb r0, [r9, #0x34]
.L_02173b08:
    cmp r5, #0x0
    beq .L_02173b18
    mov r0, r5
    bl func_ov011_0217685c
.L_02173b18:
    ldr r6, [r6, #0x0]
.L_02173b1c:
    cmp r6, #0x0
    bne .L_021737fc
    mov r0, #0x3
    bl func_0208369c
    mov r7, r0
    mov r4, #0x4
    mov r5, #0x10
    mov r6, #0x30
    b .L_02173c08
.L_02173b40:
    bl func_ov011_02176834
    ldr r2, [r7, #0x8]
    ldr r1, [r2, #0x2c]
    tst r1, #0x9
    bne .L_02173c04
    ldr r1, [r2, #0x10]
    ldr r3, [r1, #0x70]
    cmp r3, #0x0
    beq .L_02173c04
    cmp r3, #0x0
    ldr r1, [r1, #0x5c]
    beq .L_02173c04
    ldr r2, [r2, #0x30]
    ldrsh r2, [r2, #0x20]
    cmp r2, #0x0
    movle r2, r6
    ble .L_02173b90
    cmp r2, #0x3c
    movlt r2, r5
    movge r2, r4
.L_02173b90:
    ldrsh r8, [r3, #0x4]
    ldrsh r10, [r3, #0x0]
    ldr r11, [r1, #0xc]
    add r8, r8, r2
    add r10, r10, r11, asr #0x8
    sub r8, r10, r8
    strh r8, [r0, #0x8]
    ldrsh r8, [r3, #0x6]
    ldrsh r10, [r3, #0x2]
    ldr r11, [r1, #0x10]
    add r8, r8, r2
    add r10, r10, r11, asr #0x8
    sub r8, r10, r8
    strh r8, [r0, #0xa]
    ldrsh r8, [r3, #0x4]
    ldrsh r10, [r3, #0x0]
    ldr r11, [r1, #0xc]
    add r8, r8, r2
    add r10, r10, r11, asr #0x8
    add r8, r10, r8
    strh r8, [r0, #0xc]
    ldrsh r8, [r3, #0x6]
    ldrsh r3, [r3, #0x2]
    ldr r10, [r1, #0x10]
    add r1, r8, r2
    add r2, r3, r10, asr #0x8
    add r1, r2, r1
    strh r1, [r0, #0xe]
    bl func_ov011_0217685c
.L_02173c04:
    ldr r7, [r7, #0x0]
.L_02173c08:
    cmp r7, #0x0
    bne .L_02173b40
    mov r0, r9
    bl func_ov011_0217f244
    ldr r0, .L_02173c3c
    ldr r0, [r0, #0x0]
    str r0, [r9, #0x30]
.L_02173c24:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02173c2c: .word data_ov006_02172960
.L_02173c30: .word data_ov011_021810c0
.L_02173c34: .word data_020afe90
.L_02173c38: .word data_ov011_021810b0
.L_02173c3c: .word data_020a0f10
    arm_func_end func_ov011_02173410

    .global func_ov011_02173c40
    arm_func_start func_ov011_02173c40
func_ov011_02173c40: ; 0x02173c40
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x64]
    mvneq r0, #0x0
    bx lr
    arm_func_end func_ov011_02173c40

    .global func_ov011_02173c54
    arm_func_start func_ov011_02173c54
func_ov011_02173c54: ; 0x02173c54
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0x24]
    ldr r1, [r5, #0x20]
    ldr r0, [r0, #0x0]
    ldr r6, [r1, #0x1a8]
    cmp r0, #0x0
    beq .L_02173f34
    ldr r0, [r6, #0x10]
    add r2, r5, #0xb0
    ldr r4, [r0, #0x5c]
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x10]
    bl func_020837e0
    strh r0, [r5, #0xc0]
    mov r0, r0, lsr #0x10
    strb r0, [r5, #0xc4]
    ldrsh r1, [r5, #0xc0]
    ldrsh r0, [r5, #0xc2]
    cmp r1, r0
    strneh r1, [r5, #0xc2]
    ldrsb r0, [r5, #0xc4]
    bl func_02083acc
    cmp r0, #0x0
    ldrb r0, [r5, #0xc5]
    bicne r0, r0, #0x1
    orreq r0, r0, #0x1
    strb r0, [r5, #0xc5]
    ldr r0, [r5, #0xd4]
    bic r0, r0, #0xf000000
    str r0, [r5, #0xd4]
    ldr r0, [r6, #0x10]
    ldrb r0, [r0, #0x9c]
    cmp r0, #0xb
    bne .L_02173cf8
    ldr r0, [r5, #0xd4]
    tst r0, #0x2
    orreq r0, r0, #0x1000000
    streq r0, [r5, #0xd4]
.L_02173cf8:
    ldrsb r0, [r5, #0xc4]
    cmp r0, #0x7
    bne .L_02173d50
    ldr r1, [r5, #0xd4]
    ldr r0, .L_02173f3c
    orr r1, r1, #0x2000000
    str r1, [r5, #0xd4]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x154]
    mov r0, r1, lsl r0
    tst r0, #0x380
    ldrne r0, [r5, #0xd4]
    orrne r0, r0, #0x1000000
    strne r0, [r5, #0xd4]
    ldr r1, [r5, #0xb4]
    ldr r0, [r4, #0x10]
    sub r0, r1, r0
    cmp r0, #0x6000
    ldrlt r0, [r5, #0xd4]
    orrlt r0, r0, #0x4000000
    strlt r0, [r5, #0xd4]
.L_02173d50:
    ldr r0, [r5, #0xd4]
    tst r0, #0x2
    beq .L_02173da4
    ldrsb r0, [r5, #0xc4]
    cmp r0, #0xc
    bne .L_02173da4
    ldr r1, [r4, #0x10]
    ldr r0, [r4, #0xc]
    add r2, sp, #0x0
    add r1, r1, #0x1000
    bl func_020837e0
    mov r0, r0, lsr #0x10
    cmp r0, #0x7
    bne .L_02173da4
    ldr r1, [sp, #0x4]
    ldr r0, [r5, #0xb4]
    sub r0, r1, r0
    cmp r0, #0x6000
    ldrlt r0, [r5, #0xd4]
    orrlt r0, r0, #0x4000000
    strlt r0, [r5, #0xd4]
.L_02173da4:
    ldr r0, [r6, #0x8]
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrb r0, [r0, #0x48]
    cmp r0, #0x0
    ldr r0, [r5, #0xd4]
    orrne r0, r0, #0x80
    biceq r0, r0, #0x80
    str r0, [r5, #0xd4]
    ldr r0, [r5, #0x24]
    bl func_ov011_02173c40
    ldr r1, [r5, #0x24]
    ldr r1, [r1, #0x0]
    cmp r1, #0x0
    ldrne r1, [r1, #0x60]
    mvneq r1, #0x0
    cmp r1, r0, lsl #0x1
    ldrgt r0, [r5, #0x2c]
    ldrgtb r0, [r0, #0x15]
    strgtb r0, [r5, #0x10a]
    bgt .L_02173e18
    add r0, r5, #0x100
    ldrsb r0, [r0, #0x6]
    cmp r0, #0x0
    ldr r0, [r5, #0x2c]
    ldreqb r0, [r0, #0x16]
    streqb r0, [r5, #0x10a]
    ldrneb r0, [r0, #0x14]
    strneb r0, [r5, #0x10a]
.L_02173e18:
    ldr r0, [r5, #0xd4]
    tst r0, #0x1
    mov r0, r5
    bne .L_02173e34
    mov r1, #0x1
    bl func_ov011_0217fbcc
    b .L_02173f34
.L_02173e34:
    bl func_ov011_02180924
    mov r0, r5
    bl func_ov011_02173318
    cmp r0, #0x0
    ldrneb r0, [r5, #0x105]
    cmpne r0, #0xa
    beq .L_02173e94
    ldr r0, [r5, #0x24]
    bl func_ov011_0217325c
    bl func_ov011_02176d14
    mov r0, r5
    bl func_ov011_0217aa58
    mov r0, r5
    bl func_ov011_0217e3a0
    mov r0, r5
    bl func_ov011_0217f890
    mov r0, r5
    bl func_ov011_0217fe30
    mov r0, r5
    bl func_ov011_02180be4
    mov r0, r5
    bl func_ov011_02180680
    mov r0, #0x1
    strb r0, [r5, #0x105]
.L_02173e94:
    ldr r0, [r5, #0x24]
    ldr r1, [r0, #0x24]
    tst r1, #0x2
    beq .L_02173ed4
    ldr r1, [r5, #0x20]
    ldr r1, [r1, #0x128]
    tst r1, #0x2
    movne r4, #0x1
    moveq r4, #0x0
    bl func_ov011_0217325c
    ldr r1, [r0, #0x180]
    cmp r4, #0x0
    orrne r1, r1, #0x2
    strne r1, [r0, #0x180]
    biceq r1, r1, #0x2
    streq r1, [r0, #0x180]
.L_02173ed4:
    ldrb r0, [r5, #0x108]
    cmp r0, #0x1
    bne .L_02173ee8
    mov r0, r5
    bl func_ov011_0217f5b8
.L_02173ee8:
    mov r0, r5
    mov r1, #0x0
    bl func_ov011_0217fbcc
    cmp r0, #0x0
    bne .L_02173f34
    ldrb r2, [r5, #0x105]
    ldr r1, .L_02173f40
    mov r0, r5
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldrh r0, [r5, #0x3c]
    add r0, r0, #0x1
    strh r0, [r5, #0x3c]
    ldrb r0, [r5, #0x52]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r5, #0x52]
    mov r0, r5
    bl func_ov011_0217e2a4
.L_02173f34:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02173f3c: .word data_ov006_02172960
.L_02173f40: .word data_ov011_021816c8
    arm_func_end func_ov011_02173c54

    .global func_ov011_02173f44
    arm_func_start func_ov011_02173f44
func_ov011_02173f44: ; 0x02173f44
    ldr r2, [r0, #0xd8]
    add r1, r2, #0x1
    str r1, [r0, #0xd8]
    cmp r2, #0x28
    movgt r1, #0x0
    strgt r1, [r0, #0xd8]
    movgt r1, #0x1
    strgtb r1, [r0, #0x105]
    ldr r1, [r0, #0x14]
    ldr r2, [r1, #0x0]
    ldr r1, [r2, #0xe4]
    cmp r1, #0x0
    bxeq lr
    ldr r0, [r0, #0xd8]
    cmp r0, #0x10
    movgt r0, #0x0
    strgt r0, [r2, #0xe4]
    bx lr
    arm_func_end func_ov011_02173f44

    .global func_ov011_02173f8c
    arm_func_start func_ov011_02173f8c
func_ov011_02173f8c: ; 0x02173f8c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r4, r1
    bl func_0202f628
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x0]
    ldr r2, [r2, #0x40]
    blx r2
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02173f8c

    .global func_ov011_02173fb0
    arm_func_start func_ov011_02173fb0
func_ov011_02173fb0: ; 0x02173fb0
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r4, r1
    bl func_0202f628
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x4c]
    blx r2
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02173fb0

    .global func_ov011_02173fd4
    arm_func_start func_ov011_02173fd4
func_ov011_02173fd4: ; 0x02173fd4
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r4, r1
    bl func_0202f628
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x0]
    ldr r2, [r2, #0x3c]
    blx r2
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02173fd4

    .global func_ov011_02173ff8
    arm_func_start func_ov011_02173ff8
func_ov011_02173ff8: ; 0x02173ff8
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x14]
    bx lr
    arm_func_end func_ov011_02173ff8

    .global func_ov011_02174004
    arm_func_start func_ov011_02174004
func_ov011_02174004: ; 0x02174004
    bx lr
    arm_func_end func_ov011_02174004

    .global func_ov011_02174008
    arm_func_start func_ov011_02174008
func_ov011_02174008: ; 0x02174008
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02174008

    .global func_ov011_02174020
    arm_func_start func_ov011_02174020
func_ov011_02174020: ; 0x02174020
    ldrh r1, [r0, #0x4]
    add r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldrh r0, [r0, #0x4]
    bx lr
    arm_func_end func_ov011_02174020

    .global func_ov011_02174034
    arm_func_start func_ov011_02174034
func_ov011_02174034: ; 0x02174034
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x9c]
    blx r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02174034

    .global func_ov011_0217404c
    arm_func_start func_ov011_0217404c
func_ov011_0217404c: ; 0x0217404c
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x64]
    ldr r3, [r4, #0x34]
    add r0, r4, #0x14
    bl func_02019bec
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217404c

    .global func_ov011_02174070
    arm_func_start func_ov011_02174070
func_ov011_02174070: ; 0x02174070
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x64]
    ldr r3, [r4, #0x34]
    add r0, r4, #0x14
    bl func_02019c74
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02174070

    .global func_ov011_02174098
    arm_func_start func_ov011_02174098
func_ov011_02174098: ; 0x02174098
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x78]
    blx r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02174098

    .global func_ov011_021740b0
    arm_func_start func_ov011_021740b0
func_ov011_021740b0: ; 0x021740b0
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x74]
    blx r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_021740b0

    .global func_ov011_021740c8
    arm_func_start func_ov011_021740c8
func_ov011_021740c8: ; 0x021740c8
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x70]
    blx r1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_021740c8

    .global func_ov011_021740e0
    arm_func_start func_ov011_021740e0
func_ov011_021740e0: ; 0x021740e0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020208e8
    mov r0, r4
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_021740e0

    .global func_ov011_021740fc
    arm_func_start func_ov011_021740fc
func_ov011_021740fc: ; 0x021740fc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldrsh r2, [r4, #0xc]
    ldr r0, [r0, #0x50]
    mov r1, #0x1
    mov r2, r2, lsl #0xc
    str r2, [r0, #0xc]
    bl func_ov011_02174174
    ldr r0, [r4, #0x4]
    ldrsh r2, [r4, #0xe]
    ldr r0, [r0, #0x50]
    mov r1, #0x1
    mov r2, r2, lsl #0xc
    str r2, [r0, #0x10]
    bl func_ov011_02174174
    ldrb r0, [r4, #0x10]
    cmp r0, #0x0
    movne r1, #0x1
    ldr r0, [r4, #0x4]
    moveq r1, #0x0
    str r1, [r0, #0x80]
    ldrsb r1, [r4, #0x11]
    sub r0, r1, #0x1
    strb r0, [r4, #0x11]
    cmp r1, #0x0
    movle r0, #0x0
    strleb r0, [r4, #0x11]
    strleb r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_021740fc

    .global func_ov011_02174174
    arm_func_start func_ov011_02174174
func_ov011_02174174: ; 0x02174174
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r2, [r5, #0x24]
    mov r4, r1
    orr r1, r2, r4
    cmp r2, r1
    beq .L_0217419c
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_0217419c:
    ldrb r0, [r5, #0x24]
    orr r0, r0, r4
    orr r0, r0, #0x30
    strb r0, [r5, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_02174174

    .global func_ov011_021741b0
    arm_func_start func_ov011_021741b0
func_ov011_021741b0: ; 0x021741b0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020208e8
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_021741b0

    .global func_ov011_021741c4
    arm_func_start func_ov011_021741c4
func_ov011_021741c4: ; 0x021741c4
    mov r0, #0x1
    bx lr
    arm_func_end func_ov011_021741c4

    .global func_ov011_021741cc
    arm_func_start func_ov011_021741cc
func_ov011_021741cc: ; 0x021741cc
    strb r1, [r0, #0x7c]
    bx lr
    arm_func_end func_ov011_021741cc

    .global func_ov011_021741d4
    arm_func_start func_ov011_021741d4
func_ov011_021741d4: ; 0x021741d4
    add r1, r1, r2, lsl #0x2
    ldr r1, [r1, #0x88]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov011_021741d4

    .global func_ov011_021741e4
    arm_func_start func_ov011_021741e4
func_ov011_021741e4: ; 0x021741e4
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x80]
    bx lr
    arm_func_end func_ov011_021741e4

    .global func_ov011_021741f0
    arm_func_start func_ov011_021741f0
func_ov011_021741f0: ; 0x021741f0
    add r1, r1, r2, lsl #0x2
    ldr r1, [r1, #0x90]
    str r1, [r0, #0x0]
    bx lr
    arm_func_end func_ov011_021741f0

    .global func_ov011_02174200
    arm_func_start func_ov011_02174200
func_ov011_02174200: ; 0x02174200
    str r1, [r0, #0x14]
    bx lr
    arm_func_end func_ov011_02174200

    .global func_ov011_02174208
    arm_func_start func_ov011_02174208
func_ov011_02174208: ; 0x02174208
    str r1, [r0, #0x10]
    bx lr
    arm_func_end func_ov011_02174208

    .global func_ov011_02174210
    arm_func_start func_ov011_02174210
func_ov011_02174210: ; 0x02174210
    mov r0, #0x0
    bx lr
    arm_func_end func_ov011_02174210

    .global func_ov011_02174218
    arm_func_start func_ov011_02174218
func_ov011_02174218: ; 0x02174218
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02028e08
    mov r0, r4
    bl func_0201b244
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02174218

    .global func_ov011_02174234
    arm_func_start func_ov011_02174234
func_ov011_02174234: ; 0x02174234
    ldr r1, [r0, #0x78]
    ldr r3, [r0, #0xe4]
    ldr r2, [r0, #0xe8]
    add r1, r0, r1, lsl #0x2
    orr r2, r3, r2
    str r2, [r1, #0x18]
    ldr r1, [r0, #0x130]
    ldr r3, [r0, #0xe4]
    ldr r2, [r0, #0xe8]
    mov r1, r1, lsl #0x1c
    orr r2, r3, r2
    add r1, r0, r1, lsr #0x1a
    str r2, [r1, #0xec]
    ldr r1, [r0, #0x130]
    mov r3, #0x0
    add r1, r1, #0x1
    str r1, [r0, #0x130]
    str r3, [r0, #0x12c]
    str r3, [r0, #0xe8]
.L_02174280:
    add r1, r0, r3, lsl #0x2
    ldr r2, [r0, #0x12c]
    ldr r1, [r1, #0xec]
    add r3, r3, #0x1
    orr r1, r2, r1
    str r1, [r0, #0x12c]
    cmp r3, #0x10
    blt .L_02174280
    bx lr
    arm_func_end func_ov011_02174234

    .global func_ov011_021742a4
    arm_func_start func_ov011_021742a4
func_ov011_021742a4: ; 0x021742a4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02028e08
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_021742a4

    .global func_ov011_021742b8
    arm_func_start func_ov011_021742b8
func_ov011_021742b8: ; 0x021742b8
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
    add r1, r0, #0xd8
    add r3, r0, #0xa8
    add r1, r1, #0x400
    mov r2, #0x0
.L_021742ec:
    str r2, [r3, #0x4]
    str r2, [r3, #0x8]
    str r2, [r3, #0xc]
    str r2, [r3, #0x10]
    add r3, r3, #0x10c
    cmp r3, r1
    blo .L_021742ec
    add r1, r0, #0x1d8
    add r3, r1, #0x1800
    add r1, r0, #0x3d8
    add r1, r1, #0x1c00
    mov r2, #0x0
.L_0217431c:
    str r2, [r3, #0x8]
    add r3, r3, #0xc
    cmp r3, r1
    blo .L_0217431c
    bx lr
    arm_func_end func_ov011_021742b8

    .global func_ov011_02174330
    arm_func_start func_ov011_02174330
func_ov011_02174330: ; 0x02174330
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x110
    mov r5, r1
    mov r6, r0
    ldr r1, .L_02174d9c
    ldr r2, .L_02174da0
    mov r0, #0x40
    mov r3, #0x94
    bl func_0201a21c
    movs r4, r0
    movne r0, #0x0
    strne r0, [r4, #0x14]
    strne r0, [r4, #0x18]
    strne r0, [r4, #0x1c]
    strne r0, [r4, #0x20]
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x40
    bl func_020517fc
    bl func_02020d90
    mov r7, r0
    ldr r0, [r7, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x91000
    str r0, [sp, #0xc]
    mov r0, r7
    add r1, sp, #0xc
    bl func_ov011_02172e14
    ldr r0, [r7, #0x4]
    ldr r1, .L_02174da4
    bl func_02028384
    ldr r0, [r7, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r6
    mov r0, r7
    bl func_ov011_02174de4
    ldr r0, .L_02174da8
    str r7, [r4, #0x10]
    ldr r0, [r0, #0x0]
    mov r6, #0xcc
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0x118]
    ldr r1, .L_02174d9c
    str r0, [r4, #0xc]
    add r0, r0, #0x500
    ldrsb r0, [r0, #0xe0]
    ldr r2, .L_02174da0
    mov r3, #0xb1
    strb r0, [r4, #0x38]
    ldr r0, [r4, #0xc]
    add r0, r0, #0x500
    ldrsb r0, [r0, #0xe1]
    strb r0, [r4, #0x39]
    ldrb r5, [r4, #0x38]
    and r0, r0, #0xff
    add r5, r5, r0
    mul r0, r5, r6
    bl func_0201a21c
    str r0, [r4, #0x8]
    ldrb r5, [r4, #0x38]
    ldrb r3, [r4, #0x39]
    mov r2, r6
    mov r1, #0x0
    add r3, r5, r3
    mul r2, r3, r2
    bl func_020517fc
    ldr r0, [r4, #0xc]
    ldr r6, [r4, #0x8]
    ldr r5, [r0, #0x558]
    b .L_02174d5c
.L_02174460:
    ldrb r7, [r5, #0x40]
    cmp r7, #0x0
    cmpne r7, #0x1
    beq .L_02174478
    cmp r7, #0x2
    b .L_02174d58
.L_02174478:
    ldr r1, .L_02174d9c
    ldr r2, .L_02174da0
    mov r0, #0xc
    mov r3, #0xc7
    bl func_0201a21c
    movs r8, r0
    movne r0, #0x0
    strne r0, [r8, #0x8]
    mov r0, r8
    mov r1, #0x0
    mov r2, #0xc
    bl func_020517fc
    str r6, [r8, #0x8]
    cmp r7, #0x0
    mov r1, r8
    bne .L_021744c4
    add r0, r4, #0x14
    bl func_02037b98
    b .L_021744d8
.L_021744c4:
    add r0, r4, #0x1c
    bl func_02037b98
    ldr r0, [r6, #0xa8]
    orr r0, r0, #0x200
    str r0, [r6, #0xa8]
.L_021744d8:
    bl func_02020d90
    mov r8, r0
    ldr r0, [r8, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x92000
    str r0, [sp, #0x8]
    add r1, sp, #0x8
    mov r0, r8
    bl func_ov011_02172e14
    ldr r0, [r8, #0x4]
    ldr r1, .L_02174dac
    bl func_02028384
    ldr r0, [r8, #0x4]
    mov r1, r6
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r4, #0x10]
    mov r0, r8
    bl func_ov011_02174de4
    ldr r0, [r8, #0x4]
    bl func_020282f4
    str r8, [r6, #0x30]
    ldr r8, [r4, #0xc]
    mov r1, #0x30
    str r5, [r6, #0x0]
    ldrb r0, [r5, #0xe]
    ldrb r2, [r5, #0x43]
    and r0, r0, #0xf
    add r0, r2, r0
    mul r2, r0, r1
    add r0, r2, #0x18
    strb r0, [r6, #0xc2]
    ldrb r0, [r5, #0xe]
    ldrb r2, [r5, #0x44]
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    add r0, r2, r0
    mul r2, r0, r1
    add r0, r2, #0x18
    strb r0, [r6, #0xc3]
    ldrsh r0, [r5, #0x18]
    str r0, [r6, #0x64]
    ldrsh r0, [r5, #0x16]
    str r0, [r6, #0x60]
    ldrb r0, [r6, #0xc2]
    sub r0, r0, #0x18
    bl func_0200d12c
    mov r9, r0
    ldrb r0, [r6, #0xc3]
    mov r1, #0x30
    sub r0, r0, #0x18
    bl func_0200d12c
    mov r2, r0
    and r1, r9, #0xff
    mov r0, r8
    and r2, r2, #0xff
    bl func_02076ce0
    str r0, [r6, #0x4]
    ldr r1, [r5, #0x34]
    cmp r7, #0x0
    ldreq r0, .L_02174db0
    ldrb r1, [r1, #0x7]
    ldrne r0, .L_02174db4
    ldr r8, [r0, r1, lsl #0x3]
    ldr r1, .L_02174db8
    add r0, sp, #0x10
    ldr r1, [r1, #0x4]
    bl func_02074000
    add r0, sp, #0x10
    mov r1, r8
    bl func_020741bc
    ldr r1, .L_02174db8
    add r0, sp, #0x10
    ldr r1, [r1, #0x0]
    bl func_020741bc
    add r0, sp, #0x10
    bl func_02033bb8
    cmp r0, #0x0
    beq .L_02174678
    mov r1, #0x0
    add r0, sp, #0x10
    mov r2, r1
    bl func_02033410
    mov r8, r0
    ldr r1, [r8, #0x1c]
    cmp r1, #0x0
    bne .L_02174654
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02174654:
    ldr r8, [r8, #0x1c]
    mov r1, #0x0
    ldr r0, [r8, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    str r0, [r6, #0xc]
    str r8, [r6, #0x3c]
    b .L_02174684
.L_02174678:
    mov r0, #0x0
    str r0, [r6, #0xc]
    str r0, [r6, #0x3c]
.L_02174684:
    cmp r7, #0x0
    bne .L_021749f0
    ldr r0, [r6, #0x4]
    mov r10, #0x0
    ldrb r1, [r0, #0x8]
    mov r3, #0x1
    ldr r0, .L_02174dbc
    sub r1, r1, #0x3
    mov r2, r1, lsl #0x1
    add r1, r2, #0xe
    mov r1, r3, lsl r1
    add r2, r2, #0xd
    orr r1, r1, r3, lsl r2
    mvn r1, r1
    ldr r8, [r6, #0x74]
    and r0, r1, r0
    orr r0, r8, r0
    ldr r9, .L_02174dc0
    str r0, [r6, #0x74]
    mov r8, r3
    mov r11, r10
.L_021746d8:
    ldr r0, [r6, #0x0]
    mov r1, r10
    bl func_02078514
    mov r1, r11
    add r3, r6, r10, lsl #0x1
.L_021746ec:
    ldrsb r2, [r9, r1]
    add ip, r9, r1
    cmp r2, #0x0
    blt .L_02174710
    ldrsb ip, [ip, #0xe]
    tst r0, r8, lsl ip
    ldrneh r2, [r3, #0xac]
    orrne r2, r2, r8, lsl ip
    strneh r2, [r3, #0xac]
.L_02174710:
    add r1, r1, #0x1
    cmp r1, #0xe
    blt .L_021746ec
    ldr r0, [r6, #0x0]
    mov r1, r10
    bl func_0207853c
    add r1, r6, r10, lsl #0x1
    add r10, r10, #0x1
    strh r0, [r1, #0xb4]
    cmp r10, #0x4
    blt .L_021746d8
    mov r9, #0x0
.L_02174740:
    add r10, r9, #0x1
    add r8, r6, r9, lsl #0x1
    b .L_02174780
.L_0217474c:
    add r2, r6, r10, lsl #0x1
    ldrh r3, [r8, #0xb4]
    ldrh r0, [r2, #0xb4]
    cmp r0, r3
    bls .L_0217477c
    ldrh r1, [r8, #0xac]
    ldrh r0, [r2, #0xac]
    strh r0, [r8, #0xac]
    ldrh r0, [r2, #0xb4]
    strh r0, [r8, #0xb4]
    strh r1, [r8, #0xac]
    strh r3, [r8, #0xb4]
.L_0217477c:
    add r10, r10, #0x1
.L_02174780:
    cmp r10, #0x4
    blt .L_0217474c
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_02174740
    ldrsb r0, [r5, #0x11]
    ldr r2, .L_02174da8
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x34]
    ldr r2, [r2, #0x0]
    ldrb r1, [r0, #0x7]
    ldrsb r3, [r5, #0x10]
    ldr r0, [r6, #0x30]
    ldr r2, [r2, #0x160]
    bl func_ov011_0217693c
    str r0, [r6, #0x8]
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    beq .L_02174920
    mov r8, #0x1
    mov r9, #0x0
    mov r10, r8
.L_021747ec:
    ldr r0, [r6, #0x74]
    tst r0, r10, lsl r8
    bne .L_02174914
    mov r0, r8, lsl #0x18
    mov r0, r0, asr #0x18
    bl func_ov011_021733b4
    mov r1, r0
    ldr r0, [r6, #0xc]
    bl func_ov011_02174f58
    cmp r0, #0x0
    beq .L_02174914
    mov r2, r9
    add r1, r0, #0x9c
    b .L_02174908
.L_02174824:
    ldrsh r11, [r1, #0x0]
    ldrsh r3, [r1, #0x4]
    add r3, r11, r3
    cmp r3, #0xa0
    ldrge r3, [r6, #0x8c]
    orrge r3, r3, r10, lsl r8
    strge r3, [r6, #0x8c]
    bge .L_0217486c
    cmp r3, #0x50
    blt .L_02174860
    cmp r3, #0xa0
    ldrlt r3, [r6, #0x88]
    orrlt r3, r3, r10, lsl r8
    strlt r3, [r6, #0x88]
    blt .L_0217486c
.L_02174860:
    ldr r3, [r6, #0x84]
    orr r3, r3, r10, lsl r8
    str r3, [r6, #0x84]
.L_0217486c:
    ldrsh r11, [r1, #0x2]
    ldrsh r3, [r1, #0x6]
    sub r3, r11, r3
    cmp r3, #0xa0
    ldrge r3, [r6, #0x98]
    orrge r3, r3, r10, lsl r8
    strge r3, [r6, #0x98]
    bge .L_021748b4
    cmp r3, #0x50
    blt .L_021748a8
    cmp r3, #0xa0
    ldrlt r3, [r6, #0x94]
    orrlt r3, r3, r10, lsl r8
    strlt r3, [r6, #0x94]
    blt .L_021748b4
.L_021748a8:
    ldr r3, [r6, #0x90]
    orr r3, r3, r10, lsl r8
    str r3, [r6, #0x90]
.L_021748b4:
    ldrsh r11, [r1, #0x2]
    ldrsh r3, [r1, #0x6]
    add r3, r11, r3
    cmp r3, #0xa0
    ldrge r3, [r6, #0xa4]
    orrge r3, r3, r10, lsl r8
    strge r3, [r6, #0xa4]
    bge .L_021748fc
    cmp r3, #0x50
    blt .L_021748f0
    cmp r3, #0xa0
    ldrlt r3, [r6, #0xa0]
    orrlt r3, r3, r10, lsl r8
    strlt r3, [r6, #0xa0]
    blt .L_021748fc
.L_021748f0:
    ldr r3, [r6, #0x9c]
    orr r3, r3, r10, lsl r8
    str r3, [r6, #0x9c]
.L_021748fc:
    add r2, r2, #0x1
    and r2, r2, #0xff
    add r1, r1, #0x20
.L_02174908:
    ldrb r3, [r0, #0xc]
    cmp r2, r3
    blo .L_02174824
.L_02174914:
    add r8, r8, #0x1
    cmp r8, #0x18
    blt .L_021747ec
.L_02174920:
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    beq .L_021749dc
    mvn r8, #0x0
    add r9, r8, #0x8000
    mov r10, #0x1
    str r9, [sp, #0x4]
.L_0217493c:
    cmp r10, #0x9
    cmpne r10, #0xa
    beq .L_021749cc
    ldr r1, [r6, #0x74]
    mov r0, #0x1
    tst r1, r0, lsl r10
    bne .L_021749cc
    mov r0, r10, lsl #0x18
    mov r0, r0, asr #0x18
    bl func_ov011_021733b4
    mov r1, r0
    ldr r0, [r6, #0xc]
    bl func_ov011_02174f58
    cmp r0, #0x0
    beq .L_021749cc
    add r1, r0, #0x9c
    ldr r2, [sp, #0x4]
    mov r3, #0x0
    ldrb r0, [r0, #0xc]
    b .L_021749b8
.L_0217498c:
    ldrsh ip, [r1, #0x0]
    ldrsh r11, [r1, #0x4]
    add r11, ip, r11
    cmp r11, #0x50
    blt .L_021749ac
    ldrsh r11, [r1, #0x14]
    cmp r2, r11
    movgt r2, r11
.L_021749ac:
    add r3, r3, #0x1
    and r3, r3, #0xff
    add r1, r1, #0x20
.L_021749b8:
    cmp r3, r0
    blo .L_0217498c
    cmp r9, r2
    movgt r9, r2
    movgt r8, r10
.L_021749cc:
    add r10, r10, #0x1
    cmp r10, #0xd
    blt .L_0217493c
    strb r8, [r6, #0xc5]
.L_021749dc:
    ldrb r0, [r5, #0xf]
    tst r0, #0x10
    ldrne r0, [r6, #0x68]
    orrne r0, r0, #0x17
    strne r0, [r6, #0x68]
.L_021749f0:
    ldr r0, [r6, #0xc]
    mov lr, #0x0
    cmp r0, #0x0
    beq .L_02174b60
    cmp r7, #0x0
    moveq r8, #0x4
    ldr r11, .L_02174dc4
    movne r8, #0x5
    mov r3, #0x0
.L_02174a14:
    cmp r7, #0x0
    bne .L_02174a48
    ldr r0, .L_02174dc8
    ldrsb r2, [r0, r3]
    add r9, r0, r3
    cmp r2, #0x0
    blt .L_02174b60
    ldr r1, [r6, #0x74]
    mov r0, #0x1
    tst r1, r0, lsl r2
    bne .L_02174b58
    ldrsb r0, [r9, #0xb]
    b .L_02174a5c
.L_02174a48:
    ldr r0, [r6, #0x4]
    ldrsb r0, [r0, #0x8]
    cmp r0, #0x1
    moveq r0, #0x0
    movne r0, #0x1
.L_02174a5c:
    ldr r2, [r6, #0xc]
    add r1, r6, lr, lsl #0x4
    add r0, r2, r0, lsl #0x2
    ldr r0, [r0, #0x8]
    add r2, r2, r0
    mov r0, #0x0
    str r0, [r1, #0x48]
    str r0, [r1, #0x44]
    str r0, [r1, #0x40]
    mov ip, r0
    b .L_02174acc
.L_02174a88:
    add r0, r2, ip, lsl #0x5
    ldr r10, [r1, #0x44]
    ldr r9, [r0, #0xa8]
    add ip, ip, #0x1
    add r9, r10, r9
    str r9, [r1, #0x44]
    ldr r10, [r1, #0x48]
    ldr r9, [r0, #0xac]
    add r9, r10, r9
    str r9, [r1, #0x48]
    ldrsb r10, [r0, #0xb6]
    ldr r9, [r1, #0x40]
    mov r0, #0x1
    cmp r10, #0x0
    rsblt r10, r10, #0x0
    orr r0, r9, r0, lsl r10
    str r0, [r1, #0x40]
.L_02174acc:
    ldrb r0, [r2, #0xc]
    cmp ip, r0
    blt .L_02174a88
    add r1, r6, lr, lsl #0x4
    ldr r9, [r1, #0x44]
    ldr r0, [r1, #0x48]
    mov r2, #0x0
    add r0, r0, r9, lsl #0x1
    strh r0, [r1, #0x4e]
    ldrsh r0, [r1, #0x4e]
    strh r0, [r1, #0x4c]
.L_02174af8:
    ldr r9, [r1, #0x40]
    mov r0, #0x1
    tst r9, r0, lsl r2
    beq .L_02174b40
    ldrsh r0, [r1, #0x4c]
    mov r9, r2, lsl #0x1
    ldrsb r9, [r11, r9]
    add r10, r11, r2, lsl #0x1
    mul r9, r8, r9
    mov r9, r9, lsl #0x10
    add r0, r0, r9, asr #0x10
    strh r0, [r1, #0x4c]
    ldrsb r9, [r10, #0x1]
    ldrsh r0, [r1, #0x4e]
    mul r9, r8, r9
    mov r9, r9, lsl #0x10
    add r0, r0, r9, asr #0x10
    strh r0, [r1, #0x4e]
.L_02174b40:
    add r2, r2, #0x1
    cmp r2, #0x2a
    blt .L_02174af8
    cmp r7, #0x0
    bne .L_02174b60
    add lr, lr, #0x1
.L_02174b58:
    add r3, r3, #0x1
    b .L_02174a14
.L_02174b60:
    mov r8, #0x0
    str r8, [r6, #0x68]
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    beq .L_02174d44
    ldr r7, .L_02174dcc
    mov r9, #0x1
    mvn r10, #0x0
.L_02174b80:
    ldr r1, [r6, #0x74]
    mov r0, #0x1
    tst r1, r0, lsl r9
    bne .L_02174d38
    mov r0, r9, lsl #0x18
    mov r0, r0, asr #0x18
    bl func_ov011_021733b4
    mov r1, r0
    ldr r0, [r6, #0xc]
    bl func_ov011_02174f58
    cmp r0, #0x0
    beq .L_02174d38
    ldr r1, [r6, #0xa8]
    tst r1, #0x200
    addne r1, r9, #0x1
    andne r8, r1, #0xff
    bne .L_02174c18
    cmp r9, #0xb
    moveq r8, #0x0
    beq .L_02174bd8
    cmp r9, #0xd
    movge r8, #0x1
.L_02174bd8:
    ldrsh r1, [r0, #0x90]
    cmp r1, #0x0
    ldrneb r2, [r7, r8]
    ldrne r3, [r6, #0x68]
    movne r1, #0x1
    orrne r1, r3, r1, lsl r2
    strne r1, [r6, #0x68]
    ldrsh r1, [r0, #0x92]
    cmp r1, #0x0
    beq .L_02174c18
    ldr r1, .L_02174dd0
    ldr r3, [r6, #0x68]
    ldrb r2, [r1, r8]
    mov r1, #0x1
    orr r1, r3, r1, lsl r2
    str r1, [r6, #0x68]
.L_02174c18:
    ldrb r1, [r0, #0x85]
    cmp r1, #0x0
    ldreqb r1, [r0, #0x86]
    cmpeq r1, #0x0
    ldreqb r1, [r0, #0x87]
    cmpeq r1, #0x0
    ldrneb r2, [r7, r8]
    ldrne r3, [r6, #0x68]
    movne r1, #0x1
    orrne r1, r3, r1, lsl r2
    strne r1, [r6, #0x68]
    ldrsb r1, [r0, #0x8f]
    cmp r1, #0x0
    ble .L_02174c68
    ldr r1, .L_02174dd4
    ldr r3, [r6, #0x68]
    ldrb r2, [r1, r8]
    mov r1, #0x1
    orr r1, r3, r1, lsl r2
    str r1, [r6, #0x68]
.L_02174c68:
    mov r2, #0x0
    b .L_02174ca0
.L_02174c70:
    ldr r1, [r0, #0x7c]
    cmp r1, r3
    bne .L_02174c98
    ldr r1, .L_02174dd4
    ldr r3, [r6, #0x68]
    ldrb r2, [r1, r8]
    mov r1, #0x1
    orr r1, r3, r1, lsl r2
    str r1, [r6, #0x68]
    b .L_02174cb0
.L_02174c98:
    add r1, r2, #0x1
    and r2, r1, #0xff
.L_02174ca0:
    ldr r1, .L_02174dd8
    ldrsb r3, [r1, r2]
    cmp r3, r10
    bne .L_02174c70
.L_02174cb0:
    add r2, r0, #0x9c
    mov r3, #0x0
    b .L_02174d2c
.L_02174cbc:
    ldrb r1, [r2, #0x1b]
    cmp r1, #0x0
    beq .L_02174ce0
    ldr r11, .L_02174ddc
    ldr r1, [r6, #0x68]
    ldrb ip, [r11, r8]
    mov r11, #0x1
    orr r1, r1, r11, lsl ip
    str r1, [r6, #0x68]
.L_02174ce0:
    ldr r1, [r2, #0xc]
    cmp r1, #0x0
    ldrltb r11, [r7, r8]
    ldrlt ip, [r6, #0x68]
    movlt r1, #0x1
    orrlt r1, ip, r1, lsl r11
    strlt r1, [r6, #0x68]
    ldrsb r1, [r2, #0x1a]
    cmp r1, #0x6
    bne .L_02174d20
    ldr r11, .L_02174de0
    ldr r1, [r6, #0x68]
    ldrb ip, [r11, r8]
    mov r11, #0x1
    orr r1, r1, r11, lsl ip
    str r1, [r6, #0x68]
.L_02174d20:
    add r1, r3, #0x1
    and r3, r1, #0xff
    add r2, r2, #0x20
.L_02174d2c:
    ldrb r1, [r0, #0xc]
    cmp r3, r1
    blo .L_02174cbc
.L_02174d38:
    add r9, r9, #0x1
    cmp r9, #0x18
    blt .L_02174b80
.L_02174d44:
    ldr r0, [r6, #0x68]
    ldr r1, [r4, #0x28]
    add r6, r6, #0xcc
    orr r0, r1, r0
    str r0, [r4, #0x28]
.L_02174d58:
    ldr r5, [r5, #0x0]
.L_02174d5c:
    cmp r5, #0x0
    bne .L_02174460
    ldr r1, [r4, #0xc]
    mov r0, r4
    ldr r1, [r1, #0x5c8]
    str r1, [r4, #0x30]
    ldr r1, [r4, #0xc]
    add r1, r1, #0x500
    ldrsb r1, [r1, #0xcd]
    strb r1, [r4, #0x36]
    ldr r1, [r4, #0xc]
    add r1, r1, #0x500
    ldrsb r1, [r1, #0xcc]
    strb r1, [r4, #0x37]
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02174d9c: .word data_ov011_02181820
.L_02174da0: .word data_ov011_021817e8
.L_02174da4: .word func_ov011_0217569c
.L_02174da8: .word data_ov006_02172960
.L_02174dac: .word func_ov011_02175ad0
.L_02174db0: .word data_020924b0
.L_02174db4: .word data_02092700
.L_02174db8: .word data_ov011_021817d0
.L_02174dbc: .word 0x7fe000
.L_02174dc0: .word data_ov011_0218114a
.L_02174dc4: .word data_ov011_02181166
.L_02174dc8: .word data_ov011_02181134
.L_02174dcc: .word data_ov011_02181124
.L_02174dd0: .word data_ov011_02181118
.L_02174dd4: .word data_ov011_02181128
.L_02174dd8: .word data_ov011_021811bc
.L_02174ddc: .word data_ov011_02181120
.L_02174de0: .word data_ov011_0218111c
    arm_func_end func_ov011_02174330

    .global func_ov011_02174de4
    arm_func_start func_ov011_02174de4
func_ov011_02174de4: ; 0x02174de4
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    bne .L_02174e08
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
.L_02174e08:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02174de4

    .global func_ov011_02174e1c
    arm_func_start func_ov011_02174e1c
func_ov011_02174e1c: ; 0x02174e1c
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r4, [r5, #0x14]
    b .L_02174e50
.L_02174e30:
    ldr r0, [r4, #0x8]
    bl func_ov011_02175008
    mov r1, r4
    add r0, r5, #0x14
    bl func_02037c24
    mov r0, r4
    bl func_0201b244
    ldr r4, [r5, #0x14]
.L_02174e50:
    cmp r4, #0x0
    bne .L_02174e30
    ldr r4, [r5, #0x1c]
    b .L_02174e80
.L_02174e60:
    ldr r0, [r4, #0x8]
    bl func_ov011_02175008
    mov r1, r4
    add r0, r5, #0x1c
    bl func_02037c24
    mov r0, r4
    bl func_0201b244
    ldr r4, [r5, #0x1c]
.L_02174e80:
    cmp r4, #0x0
    bne .L_02174e60
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    beq .L_02174ea8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r5, #0x10]
.L_02174ea8:
    ldr r0, [r5, #0x8]
    bl func_0201b268
    mov r0, r5
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_02174e1c

    .global func_ov011_02174ebc
    arm_func_start func_ov011_02174ebc
func_ov011_02174ebc: ; 0x02174ebc
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r5, r1
    mov r1, r4
    mov r6, r0
    bl func_ov011_02175144
    cmp r5, #0xd
    blt .L_02174ef4
    sub r0, r5, #0xd
    cmp r0, #0x1
    ldrls r0, [r6, #0x4]
    ldrlssb r0, [r0, #0x8]
    subls r0, r0, #0x3
    addls r5, r5, r0, lsl #0x1
.L_02174ef4:
    mov r0, r6
    mov r1, r5
    mov r2, #0x0
    bl func_ov011_021751cc
    cmp r0, #0x0
    moveq r0, #0x0
    addne r1, r6, r4, lsl #0x2
    strne r0, [r1, #0x14]
    addne r0, r6, r4
    strneb r5, [r0, #0xc0]
    movne r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_02174ebc

    .global func_ov011_02174f24
    arm_func_start func_ov011_02174f24
func_ov011_02174f24: ; 0x02174f24
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
.L_02174f30:
    mov r0, r5
    mov r1, r4
    bl func_ov011_02175144
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_02174f30
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_02174f24

    .global func_ov011_02174f4c
    arm_func_start func_ov011_02174f4c
func_ov011_02174f4c: ; 0x02174f4c
    ldr r0, [r0, #0x4]
    ldrb r0, [r0, #0x8]
    bx lr
    arm_func_end func_ov011_02174f4c

    .global func_ov011_02174f58
    arm_func_start func_ov011_02174f58
func_ov011_02174f58: ; 0x02174f58
    cmp r1, #0x0
    movlt r0, #0x0
    bxlt lr
    add r1, r0, r1, lsl #0x2
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    movlt r0, #0x0
    addge r0, r0, r1
    bx lr
    arm_func_end func_ov011_02174f58

    .global func_ov011_02174f7c
    arm_func_start func_ov011_02174f7c
func_ov011_02174f7c: ; 0x02174f7c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r5, .L_02174fb8
    mov r7, r0
    mov r6, #0x0
    mov r4, #0x1
.L_02174f90:
    ldr r1, [r5, r6, lsl #0x2]
    mov r0, r7
    mov r2, r4
    bl func_ov011_021751cc
    add r1, r7, r6, lsl #0x2
    add r6, r6, #0x1
    str r0, [r1, #0x28]
    cmp r6, #0x2
    blt .L_02174f90
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02174fb8: .word data_ov011_0218112c
    arm_func_end func_ov011_02174f7c

    .global func_ov011_02174fbc
    arm_func_start func_ov011_02174fbc
func_ov011_02174fbc: ; 0x02174fbc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, #0x0
    mov r7, r0
    mov r4, r6
    mov r5, r6
.L_02174fd0:
    mov r0, r7
    mov r2, r5
    add r1, r6, #0x9
    bl func_ov011_021751cc
    add r1, r7, r6, lsl #0x2
    str r0, [r1, #0x1c]
    cmp r0, #0x0
    beq .L_02174ff8
    mov r1, r4
    bl func_0207b310
.L_02174ff8:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02174fd0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov011_02174fbc

    .global func_ov011_02175008
    arm_func_start func_ov011_02175008
func_ov011_02175008: ; 0x02175008
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    beq .L_02175030
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x30]
.L_02175030:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_02175048
    bl func_ov011_02176bfc
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_02175048:
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_0217506c
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x3c]
.L_0217506c:
    mov r5, #0x0
.L_02175070:
    mov r0, r4
    mov r1, r5
    bl func_ov011_02175144
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02175070
    mov r6, #0x0
    mov r5, r6
.L_02175090:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_021750bc
    bl func_02083ab8
    add r1, r4, r6, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r1, [r1, #0x1c]
    bl func_0207b000
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x1c]
.L_021750bc:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175090
    mov r6, #0x0
    mov r5, r6
.L_021750d0:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_021750fc
    bl func_02083ab8
    add r1, r4, r6, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r1, [r1, #0x28]
    bl func_0207b000
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x28]
.L_021750fc:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_021750d0
    mov r6, #0x0
    mov r5, r6
.L_02175110:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_02175134
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x34]
.L_02175134:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175110
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_02175008

    .global func_ov011_02175144
    arm_func_start func_ov011_02175144
func_ov011_02175144: ; 0x02175144
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02083ab8
    add r1, r5, r4, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r1, [r1, #0x14]
    bl func_0207b000
    mov r3, #0x0
    add r2, r5, r4, lsl #0x2
    str r3, [r2, #0x14]
    sub r1, r3, #0x1
    add r0, r5, r4
    strb r1, [r0, #0xc0]
    str r3, [r2, #0x6c]
    ldr r0, [r5, #0xa8]
    tst r0, #0x200
    ldrne r0, [r2, #0x34]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0x4]
    bl func_020282f4
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x34]
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_02175144

    .global func_ov011_021751cc
    arm_func_start func_ov011_021751cc
func_ov011_021751cc: ; 0x021751cc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    mov r9, r1
    mov r1, r9, lsl #0x18
    mov r10, r0
    mov r0, r1, asr #0x18
    str r2, [sp, #0x0]
    bl func_ov011_021733b4
    ldr r2, [r10, #0xc]
    mov r9, r0
    cmp r2, #0x0
    moveq r0, #0x0
    beq .L_0217560c
    add r0, r2, r9, lsl #0x2
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    movlt r0, #0x0
    blt .L_0217560c
    ldr r0, [r10, #0x30]
    add r4, r2, r1
    bl func_ov011_02175628
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    ldr r0, [r10, #0xa8]
    ldr r1, [r1, #0x10]
    tst r0, #0x200
    ldr r0, [r1, #0x20]
    ldr r7, [r0, #0x1a8]
    ldr r8, [r7, #0x8]
    beq .L_021753f0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_0217527c
    ldr r0, [r0, #0x4]
    bl func_02028330
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x34]
    mov r1, #0x1
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    b .L_021752b8
.L_0217527c:
    bl func_020329d4
    bl func_ov011_02175648
    mov r5, r0
    mov r0, r8
    bl func_ov011_02175628
    mov r1, r0
    mov r0, r5
    bl func_ov011_02174de4
    ldr r0, [r5, #0x4]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd8]
    blx r2
    add r0, r10, r9, lsl #0x2
    str r5, [r0, #0x34]
.L_021752b8:
    ldr r0, .L_02175614
    ldr r1, [r10, #0x0]
    ldr r0, [r0, #0x0]
    ldrb r1, [r1, #0x41]
    ldr r2, [r0, #0x48]
    mov r0, #0x14
    mla r3, r1, r0, r2
    ldr r0, [r10, #0x4]
    ldr r2, [r7, #0x10]
    ldrb r1, [r0, #0x8]
    ldr r5, [r2, #0x5c]
    mov r0, r7
    add r1, r3, r1, lsl #0x3
    ldrsb r3, [r1, #0x2]
    ldrsb r1, [r1, #0x3]
    ldr r2, [r5, #0x10]
    mov r6, r3, lsl #0x8
    str r1, [sp, #0x10]
    add r11, r2, r1, lsl #0x8
    bl func_ov011_02175670
    cmp r0, #0x0
    ldr r0, [r5, #0xc]
    rsbne r6, r6, #0x0
    add r0, r0, r6
    str r0, [sp, #0xc]
    sub r1, r11, #0x400
    add r0, r0, #0x800
    bl func_020836b4
    cmp r0, #0x0
    beq .L_02175348
    ldr r0, [sp, #0xc]
    sub r1, r11, #0x400
    sub r0, r0, #0x800
    bl func_020836b4
    cmp r0, #0x0
    bne .L_02175358
.L_02175348:
    mov r0, r7
    bl func_ov011_02175670
    cmp r0, #0x0
    rsbeq r6, r6, #0x0
.L_02175358:
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0x34]
    ldr r0, [r5, #0xc]
    ldr r2, [r1, #0x4]
    ldr r3, [r5, #0x10]
    add r1, r0, r6
    ldr r0, [sp, #0x10]
    ldr r5, [r2, #0x50]
    add r3, r3, r0, lsl #0x8
    mov r0, r1, asr #0x8
    mov r0, r0, lsl #0xc
    mov r1, r3, asr #0x8
    str r0, [r5, #0xc]
    mov r0, r1, lsl #0xc
    str r0, [r5, #0x10]
    ldrb r0, [r5, #0x24]
    orr r1, r0, #0x1
    cmp r0, r1
    beq .L_021753b4
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
.L_021753b4:
    ldrb r1, [r5, #0x24]
    mov r0, r8
    orr r1, r1, #0x31
    strb r1, [r5, #0x24]
    bl func_ov011_0217568c
    add r1, r10, r9, lsl #0x2
    ldr r2, [r1, #0x34]
    mov r1, r0
    ldr r0, [r2, #0x4]
    ldr r0, [r0, #0x64]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x5c]
    blx r2
    add r0, r10, r9, lsl #0x2
    ldr r8, [r0, #0x34]
.L_021753f0:
    bl func_02083ab8
    ldr r0, [r0, #0xec]
    mov r1, r8
    bl func_0207aedc
    mov r11, r0
    ldr r0, .L_02175618
    str r10, [r11, #0x28]
    str r0, [r11, #0x1c]
    ldr r1, .L_0217561c
    mov r8, #0x0
    ldr r0, .L_02175620
    str r1, [r11, #0x20]
    str r0, [r11, #0x24]
    ldrb r0, [r4, #0xc]
    str r8, [sp, #0x4]
    cmp r0, #0x4
    movhs r0, #0x4
    and r0, r0, #0xff
    str r0, [sp, #0x8]
    b .L_021755fc
.L_02175440:
    add r0, r4, r8, lsl #0x5
    ldr r0, [r0, #0xa4]
    mov r5, #0x1
    and r3, r0, #0xff
    ldr r0, [sp, #0x4]
    tst r0, r5, lsl r3
    bne .L_021755f4
    ldr r2, [sp, #0x4]
    mov r1, r9, lsl #0x10
    orr r2, r2, r5, lsl r3
    mov r0, r11
    mov r1, r1, lsr #0x10
    str r2, [sp, #0x4]
    bl func_0207b11c
    mov r5, r0
    ldr r0, [sp, #0x0]
    mov r6, r8
    cmp r0, #0x0
    ldrne r1, [r5, #0x14]
    ldrne r0, .L_02175624
    orrne r0, r1, r0
    ldreq r0, [r5, #0x14]
    orreq r0, r0, #0x700
    str r0, [r5, #0x14]
    ldr r0, [r10, #0xa8]
    ldr r7, [r5, #0x1c]
    tst r0, #0x200
    ldrneb r0, [r7, #0x20]
    orrne r0, r0, #0x4
    strneb r0, [r7, #0x20]
    mov r0, #0x0
    strb r0, [r7, #0x22]
    mvn r0, #0x0
    str r0, [sp, #0x1c]
    add r0, r4, r8, lsl #0x5
    str r0, [sp, #0x14]
    add r0, r4, #0x9c
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1000
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1000
    str r0, [sp, #0x20]
    b .L_021755e8
.L_021754f4:
    ldr r1, [sp, #0x14]
    add r0, r4, r6, lsl #0x5
    ldr r2, [r1, #0xa4]
    ldr r0, [r0, #0xa4]
    ldr r1, [sp, #0x24]
    and r3, r0, r1
    ldr r1, [sp, #0x20]
    and r1, r2, r1
    cmp r3, r1
    andeq r1, r0, #0xf000
    subeq r0, r6, r8
    cmpeq r0, r1, lsr #0xc
    bne .L_021755f4
    ldrb r1, [r7, #0x22]
    ldr r0, [sp, #0x18]
    add r2, r0, r6, lsl #0x5
    add r1, r7, r1, lsl #0x2
    str r2, [r1, #0x8]
    ldrb r1, [r7, #0x22]
    mov r0, r5
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_0207b25c
    mov r0, r5
    mov r1, #0x1
    bl func_0207b2d0
    ldrb r3, [r7, #0x22]
    ldrb r0, [r7, #0x21]
    add r1, sp, #0x28
    add r3, r7, r3, lsl #0x2
    cmp r0, #0x0
    ldr r3, [r3, #0x8]
    ldrne r2, [sp, #0x1c]
    ldrsh r3, [r3, #0x0]
    moveq r2, #0x1
    mov r0, r5
    mul r2, r3, r2
    strh r2, [sp, #0x28]
    ldrb r2, [r7, #0x22]
    add r2, r7, r2, lsl #0x2
    ldr r2, [r2, #0x8]
    ldrsh r2, [r2, #0x2]
    strh r2, [sp, #0x2a]
    ldrb r2, [r7, #0x22]
    add r2, r7, r2, lsl #0x2
    ldr r2, [r2, #0x8]
    ldrsh r2, [r2, #0x4]
    strh r2, [sp, #0x2c]
    ldrb r2, [r7, #0x22]
    add r2, r7, r2, lsl #0x2
    ldr r2, [r2, #0x8]
    ldrsh r2, [r2, #0x6]
    strh r2, [sp, #0x2e]
    ldrb r2, [r7, #0x22]
    bl func_0207b22c
    add r0, r6, #0x1
    ldrb r1, [r7, #0x22]
    and r6, r0, #0xff
    add r0, r1, #0x1
    strb r0, [r7, #0x22]
.L_021755e8:
    ldr r0, [sp, #0x8]
    cmp r6, r0
    blo .L_021754f4
.L_021755f4:
    add r0, r8, #0x1
    and r8, r0, #0xff
.L_021755fc:
    ldr r0, [sp, #0x8]
    cmp r8, r0
    blo .L_02175440
    mov r0, r11
.L_0217560c:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02175614: .word data_0214bd80
.L_02175618: .word func_ov011_02176300
.L_0217561c: .word func_ov011_02176404
.L_02175620: .word func_ov011_02176438
.L_02175624: .word 0xdffff8ff
    arm_func_end func_ov011_021751cc

    .global func_ov011_02175628
    arm_func_start func_ov011_02175628
func_ov011_02175628: ; 0x02175628
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov011_02175648
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02175628

    .global func_ov011_02175648
    arm_func_start func_ov011_02175648
func_ov011_02175648: ; 0x02175648
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    bne .L_02175668
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02175668:
    ldr r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02175648

    .global func_ov011_02175670
    arm_func_start func_ov011_02175670
func_ov011_02175670: ; 0x02175670
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_ov011_0217568c
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02175670

    .global func_ov011_0217568c
    arm_func_start func_ov011_0217568c
func_ov011_0217568c: ; 0x0217568c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x64]
    ldrb r0, [r0, #0x48]
    bx lr
    arm_func_end func_ov011_0217568c

    .global func_ov011_0217569c
    arm_func_start func_ov011_0217569c
func_ov011_0217569c: ; 0x0217569c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r1, [r10, #0x4]
    mov r0, #0x0
    ldr r8, [r1, #0x10]
    ldr r1, [r8, #0x24]
    bic r1, r1, #0x2
    str r1, [r8, #0x24]
    strb r0, [r8, #0x3c]
    ldr r0, [r8, #0xc]
    ldr r6, [r8, #0x14]
    ldr r7, [r0, #0x56c]
    b .L_021758c0
.L_021756d0:
    ldr r9, [r6, #0x8]
    ldr r0, [r9, #0x0]
    ldrsh r0, [r0, #0x18]
    str r0, [r9, #0x64]
    cmp r0, #0x0
    ble .L_02175714
    ldr r0, [r9, #0x0]
    ldr r0, [r0, #0x3c]
    tst r0, #0x1000
    bne .L_02175714
    ldrb r0, [r8, #0x3c]
    add r0, r0, #0x1
    strb r0, [r8, #0x3c]
    ldr r0, [r9, #0xa8]
    orr r0, r0, #0x800
    str r0, [r9, #0xa8]
    b .L_02175720
.L_02175714:
    ldr r0, [r9, #0xa8]
    bic r0, r0, #0x800
    str r0, [r9, #0xa8]
.L_02175720:
    ldr r0, [r9, #0x0]
    cmp r7, r0
    bne .L_021758bc
    ldr r0, [r8, #0x0]
    cmp r0, r9
    beq .L_0217585c
    cmp r0, #0x0
    beq .L_021757f4
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldr r0, [r8, #0x0]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    bl func_ov011_02175aa4
    ldr r0, [r8, #0x0]
    ldr r0, [r0, #0x8]
    bl func_ov011_02176d14
    mov r4, #0x0
    ldr r5, [r8, #0x0]
    mov r11, r4
.L_02175774:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_021757a4
    bl func_02083ab8
    add r1, r5, r4, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r1, [r1, #0x28]
    bl func_0207b000
    add r0, r5, r4, lsl #0x2
    str r11, [r0, #0x28]
    str r11, [r0, #0x7c]
.L_021757a4:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_02175774
    mov r4, #0x0
    ldr r5, [r8, #0x0]
    mov r11, r4
.L_021757bc:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_021757e8
    bl func_02083ab8
    add r1, r5, r4, lsl #0x2
    ldr r0, [r0, #0xec]
    ldr r1, [r1, #0x1c]
    bl func_0207b000
    add r0, r5, r4, lsl #0x2
    str r11, [r0, #0x1c]
.L_021757e8:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_021757bc
.L_021757f4:
    mov r0, r10
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldrb r0, [r0, #0x108]
    cmp r0, #0x1
    bne .L_02175840
    ldr r0, [r9, #0x30]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldr r0, [r9, #0x8]
    mov r1, #0x1
    bl func_ov011_02175aa4
    ldr r0, [r9, #0x8]
    bl func_ov011_02176d14
    mov r0, r9
    bl func_ov011_02174f7c
    mov r0, r9
    bl func_ov011_02174fbc
.L_02175840:
    str r9, [r8, #0x0]
    ldr r1, [r8, #0x24]
    mov r0, #0x0
    orr r1, r1, #0x2
    str r1, [r8, #0x24]
    str r0, [r8, #0x2c]
    b .L_021758bc
.L_0217585c:
    ldr r3, [r9, #0x30]
    mov r2, #0x1
    ldr r1, [r3, #0x4]
    ldrb r0, [r1, #0x28]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r1, #0x34]
    ldreq r0, [r0, #0x244]
    cmpeq r0, #0x0
    moveq r2, #0x0
    cmp r2, #0x0
    beq .L_02175894
    ldr r0, [r3, #0x4]
    bl func_02028330
.L_02175894:
    ldr r0, [r9, #0x1c]
    cmp r0, #0x0
    bne .L_021758a8
    mov r0, r9
    bl func_ov011_02174fbc
.L_021758a8:
    ldr r0, [r9, #0x28]
    cmp r0, #0x0
    bne .L_021758bc
    mov r0, r9
    bl func_ov011_02174f7c
.L_021758bc:
    ldr r6, [r6, #0x0]
.L_021758c0:
    cmp r6, #0x0
    bne .L_021756d0
    ldr r0, [r10, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0xc]
    ldr r2, [r0, #0x570]
    cmp r2, #0x0
    beq .L_02175a14
    ldr r3, [r4, #0x4]
    cmp r3, #0x0
    bne .L_02175a5c
    ldr r1, [r4, #0x1c]
    b .L_02175a08
.L_021758f4:
    ldr r5, [r1, #0x8]
    ldr r0, [r5, #0x0]
    cmp r2, r0
    bne .L_02175a04
    cmp r3, #0x0
    beq .L_02175918
    ldr r0, [r3, #0x30]
    ldr r0, [r0, #0x4]
    bl func_020282f4
.L_02175918:
    str r5, [r4, #0x4]
    ldr r0, [r5, #0x30]
    ldr r0, [r0, #0x4]
    bl func_02028330
    mov r2, #0x0
    str r2, [r5, #0x78]
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_02175a5c
    ldr r1, [r5, #0x4]
    mov r0, r5
    ldrb r6, [r1, #0x8]
    mov r1, r6
    bl func_ov011_021751cc
    mov r1, r6, lsl #0x18
    str r0, [r5, #0x24]
    mov r0, r1, asr #0x18
    strb r0, [r5, #0xc4]
    bl func_ov011_021733b4
    ldr r1, [r5, #0xc]
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    blt .L_02175a5c
    adds r2, r1, r0
    str r2, [r5, #0x10]
    beq .L_02175a5c
    mov r1, #0x0
    mov r0, r1
    add r2, r2, #0x9c
    b .L_021759e0
.L_02175994:
    ldrb r3, [r2, #0x1b]
    cmp r3, #0x0
    ldrne r3, [r5, #0xa8]
    orrne r3, r3, #0x100
    strne r3, [r5, #0xa8]
    ldrsb r3, [r2, #0x1a]
    cmp r3, #0x0
    blt .L_021759d8
    ldrb r3, [r2, #0x18]
    cmp r3, #0x1
    bne .L_021759d8
    ldr r3, [r2, #0x10]
    cmp r3, #0x0
    ldrle r3, [r2, #0xc]
    cmple r3, #0x0
    movle r1, #0x1
    ble .L_021759f0
.L_021759d8:
    add r0, r0, #0x1
    add r2, r2, #0x20
.L_021759e0:
    ldr r3, [r5, #0x10]
    ldrb r3, [r3, #0xc]
    cmp r0, r3
    blt .L_02175994
.L_021759f0:
    cmp r1, #0x0
    ldrne r0, [r4, #0x24]
    orrne r0, r0, #0x4
    strne r0, [r4, #0x24]
    b .L_02175a5c
.L_02175a04:
    ldr r1, [r1, #0x0]
.L_02175a08:
    cmp r1, #0x0
    bne .L_021758f4
    b .L_02175a5c
.L_02175a14:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02175a54
    ldr r0, [r4, #0x24]
    bic r0, r0, #0x4
    str r0, [r4, #0x24]
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0xa8]
    bic r0, r0, #0x100
    str r0, [r1, #0xa8]
    ldr r0, [r4, #0x4]
    bl func_ov011_021760a4
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x4]
    bl func_020282f4
.L_02175a54:
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_02175a5c:
    ldr r0, [r8, #0xc]
    ldr r0, [r0, #0x5c8]
    str r0, [r8, #0x30]
    ldr r0, [r8, #0xc]
    add r0, r0, #0x500
    ldrsb r0, [r0, #0xcd]
    strb r0, [r8, #0x36]
    ldr r0, [r8, #0xc]
    ldrb r1, [r8, #0x37]
    add r0, r0, #0x500
    ldrsb r0, [r0, #0xcd]
    mov r0, r0, lsl #0x8
    bl func_0200d12c
    strh r0, [r8, #0x34]
    ldr r0, [r8, #0x2c]
    add r0, r0, #0x1
    str r0, [r8, #0x2c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov011_0217569c

    .global func_ov011_02175aa4
    arm_func_start func_ov011_02175aa4
func_ov011_02175aa4: ; 0x02175aa4
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    beq .L_02175ac8
    bl func_02028330
    ldmia sp!, {r3, pc}
.L_02175ac8:
    bl func_020282f4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02175aa4

    .global func_ov011_02175ad0
    arm_func_start func_ov011_02175ad0
func_ov011_02175ad0: ; 0x02175ad0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    ldr r0, [r4, #0x30]
    bl func_ov011_02175628
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    ldr r0, [r0, #0x10]
    mov r6, r2
.L_02175af8:
    add r1, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r6, [r1, #0x6c]
    cmp r2, #0x2
    blt .L_02175af8
    ldr r1, [r0, #0xd4]
    tst r1, #0x2
    bne .L_02175b24
    ldr r1, [r4, #0xa8]
    tst r1, #0x40
    beq .L_02175bd0
.L_02175b24:
    ldr r0, [r4, #0xa8]
    mov r6, #0x0
    tst r0, #0x2
    beq .L_02175b68
    mov r5, r6
.L_02175b38:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_02175b58
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov011_021760e4
.L_02175b58:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175b38
    b .L_02175cbc
.L_02175b68:
    mov r5, #0x1
.L_02175b6c:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_02175b84
    mov r1, r5
    bl func_0207b310
.L_02175b84:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175b6c
    mov r6, #0x0
    mov r5, r6
.L_02175b98:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_02175bb0
    mov r1, r5
    bl func_0207b310
.L_02175bb0:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175b98
    ldr r0, [r4, #0xa8]
    orr r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0xa8]
    b .L_02175cbc
.L_02175bd0:
    tst r1, #0x4
    beq .L_02175c58
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    beq .L_02175c14
    mov r6, #0x0
    mov r5, r6
.L_02175bec:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_02175c04
    mov r1, r5
    bl func_0207b310
.L_02175c04:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175bec
    b .L_02175cbc
.L_02175c14:
    mov r6, #0x1
    mov r7, #0x0
    mov r5, r6
.L_02175c20:
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_02175c48
    mov r1, r6
    bl func_0207b310
    mov r0, r4
    mov r1, r7
    mov r2, r5
    bl func_ov011_021760e4
.L_02175c48:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_02175c20
    b .L_02175cbc
.L_02175c58:
    mov r5, #0x1
.L_02175c5c:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq .L_02175c74
    mov r1, r5
    bl func_0207b310
.L_02175c74:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175c5c
    mov r6, #0x0
    mov r5, r6
.L_02175c88:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq .L_02175ca0
    mov r1, r5
    bl func_0207b310
.L_02175ca0:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175c88
    ldr r0, [r4, #0xa8]
    orr r0, r0, #0x4
    bic r0, r0, #0x2
    str r0, [r4, #0xa8]
.L_02175cbc:
    ldr r0, [r4, #0xa8]
    tst r0, #0x200
    beq .L_02175d80
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_02175ce4
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x2
    bl func_ov011_021760e4
.L_02175ce4:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02175d70
    mov r2, #0x0
    add r5, r0, #0x9c
    ldrb r6, [r0, #0xc]
    mov r3, #0x1
    mov r0, r2
    b .L_02175d40
.L_02175d08:
    ldrsh ip, [r5, #0x14]
    ldrh r7, [r4, #0xbe]
    cmp r7, ip
    blt .L_02175d30
    ldrsh r1, [r5, #0x16]
    cmp r7, r1
    ldrle r0, [r4, #0xa8]
    orrle r0, r0, #0x8
    strle r0, [r4, #0xa8]
    ble .L_02175d48
.L_02175d30:
    cmp r7, ip
    movlt r3, r0
    add r2, r2, #0x1
    add r5, r5, #0x20
.L_02175d40:
    cmp r2, r6
    blt .L_02175d08
.L_02175d48:
    ldr r0, [r4, #0xa8]
    tst r0, #0x8
    bne .L_02175d64
    cmp r3, #0x0
    orrne r0, r0, #0x10
    strne r0, [r4, #0xa8]
    bne .L_02175d70
.L_02175d64:
    ldr r0, [r4, #0xa8]
    bic r0, r0, #0x10
    str r0, [r4, #0xa8]
.L_02175d70:
    ldrh r0, [r4, #0xbe]
    add r0, r0, #0x1
    strh r0, [r4, #0xbe]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02175d80:
    mov r0, #0x0
    str r0, [r4, #0x78]
    ldr r0, [r4, #0x30]
    bl func_ov011_02175628
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    mov r0, r5
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    ldr r0, [r4, #0x24]
    beq .L_02175f70
    cmp r0, #0x0
    ldr r0, [r5, #0x20]
    beq .L_02175e38
    ldrsb r1, [r4, #0xc4]
    ldrsb r0, [r0, #0xca]
    cmp r1, r0
    beq .L_02175e24
    bl func_02083ab8
    ldr r0, [r0, #0xec]
    ldr r1, [r4, #0x24]
    bl func_0207b000
    ldr r0, [r5, #0x20]
    mov r2, #0x0
    ldrb r0, [r0, #0xca]
    strb r0, [r4, #0xc4]
    ldrsb r1, [r4, #0xc4]
    cmp r1, #0xd
    ldrge r0, [r4, #0x4]
    ldrgesb r0, [r0, #0x8]
    subge r0, r0, #0x3
    addge r0, r1, r0, lsl #0x1
    strgeb r0, [r4, #0xc4]
    ldrsb r1, [r4, #0xc4]
    mov r0, r4
    bl func_ov011_021751cc
    str r0, [r4, #0x24]
    mov r0, #0x0
    strh r0, [r4, #0xbe]
    b .L_02175e9c
.L_02175e24:
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x2
    bl func_ov011_021760e4
    b .L_02175e9c
.L_02175e38:
    ldrb r0, [r0, #0xca]
    mov r2, #0x0
    strb r0, [r4, #0xc4]
    ldrsb r1, [r4, #0xc4]
    cmp r1, #0xd
    ldrge r0, [r4, #0x4]
    ldrgesb r0, [r0, #0x8]
    subge r0, r0, #0x3
    addge r0, r1, r0, lsl #0x1
    strgeb r0, [r4, #0xc4]
    ldrsb r1, [r4, #0xc4]
    mov r0, r4
    bl func_ov011_021751cc
    str r0, [r4, #0x24]
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x10]
    beq .L_02175e9c
    ldrsb r0, [r4, #0xc4]
    bl func_ov011_021733b4
    mov r1, r0
    ldr r0, [r4, #0xc]
    bl func_ov011_02174f58
    str r0, [r4, #0x10]
.L_02175e9c:
    ldr r0, [r4, #0xa8]
    bic r0, r0, #0x8
    str r0, [r4, #0xa8]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02175f60
    add r2, r0, #0x9c
    mov r0, #0x0
    mov r1, #0x1
    mov r5, r0
    b .L_02175f28
.L_02175ec8:
    ldrb r3, [r2, #0x1b]
    cmp r3, #0x0
    beq .L_02175ef0
    ldrb r3, [r2, #0x18]
    cmp r3, #0x4
    ldr r3, [r4, #0xa8]
    orrhs r3, r3, #0x100
    strhs r3, [r4, #0xa8]
    orrlo r3, r3, #0x80
    strlo r3, [r4, #0xa8]
.L_02175ef0:
    ldrsh r7, [r2, #0x14]
    ldrh r6, [r4, #0xbe]
    cmp r6, r7
    blt .L_02175f18
    ldrsh r3, [r2, #0x16]
    cmp r6, r3
    ldrle r0, [r4, #0xa8]
    orrle r0, r0, #0x8
    strle r0, [r4, #0xa8]
    ble .L_02175f38
.L_02175f18:
    cmp r6, r7
    movlt r1, r5
    add r0, r0, #0x1
    add r2, r2, #0x20
.L_02175f28:
    ldr r3, [r4, #0x10]
    ldrb r3, [r3, #0xc]
    cmp r0, r3
    blt .L_02175ec8
.L_02175f38:
    ldr r0, [r4, #0xa8]
    tst r0, #0x8
    bne .L_02175f54
    cmp r1, #0x0
    orrne r0, r0, #0x10
    strne r0, [r4, #0xa8]
    bne .L_02175f60
.L_02175f54:
    ldr r0, [r4, #0xa8]
    bic r0, r0, #0x10
    str r0, [r4, #0xa8]
.L_02175f60:
    ldrh r0, [r4, #0xbe]
    add r0, r0, #0x1
    strh r0, [r4, #0xbe]
    b .L_02175f8c
.L_02175f70:
    cmp r0, #0x0
    beq .L_02175f8c
    mov r0, r4
    bl func_ov011_021760a4
    ldr r0, [r4, #0xa8]
    bic r0, r0, #0x180
    str r0, [r4, #0xa8]
.L_02175f8c:
    mov r2, #0x0
    mov r1, r2
.L_02175f94:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x7c]
    cmp r2, #0x2
    blt .L_02175f94
    ldr r0, [r4, #0x30]
    bl func_ov011_02175628
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r5, [r0, #0x10]
    mov r0, r5
    bl func_ov011_0217335c
    cmp r0, #0x0
    beq .L_02176048
    ldr r0, [r5, #0xd4]
    tst r0, #0x2
    beq .L_02176048
    ldr r0, [r4, #0xa8]
    tst r0, #0x20
    bne .L_02176020
    mov r6, #0x0
    mov r5, #0x1
.L_02175ff0:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02176008
    mov r1, r5
    bl func_0207b310
.L_02176008:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02175ff0
    ldr r0, [r4, #0xa8]
    orr r0, r0, #0x20
    str r0, [r4, #0xa8]
.L_02176020:
    mov r6, #0x0
    mov r5, #0x3
.L_02176028:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov011_021760e4
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_02176028
    b .L_0217608c
.L_02176048:
    ldr r0, [r4, #0xa8]
    tst r0, #0x20
    beq .L_0217608c
    mov r6, #0x0
    mov r5, r6
.L_0217605c:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x28]
    cmp r0, #0x0
    beq .L_02176074
    mov r1, r5
    bl func_0207b310
.L_02176074:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_0217605c
    ldr r0, [r4, #0xa8]
    bic r0, r0, #0x20
    str r0, [r4, #0xa8]
.L_0217608c:
    ldr r0, [r4, #0x64]
    ldr r1, [r4, #0x60]
    mov r0, r0, lsl #0x8
    bl func_0200d12c
    strh r0, [r4, #0xbc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov011_02175ad0

    .global func_ov011_021760a4
    arm_func_start func_ov011_021760a4
func_ov011_021760a4: ; 0x021760a4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02083ab8
    ldr r0, [r0, #0xec]
    ldr r1, [r4, #0x24]
    bl func_0207b000
    mov r1, #0x0
    str r1, [r4, #0x24]
    str r1, [r4, #0x10]
    sub r0, r1, #0x1
    strb r0, [r4, #0xc4]
    strh r1, [r4, #0xbe]
    ldr r0, [r4, #0xa8]
    bic r0, r0, #0x18
    str r0, [r4, #0xa8]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_021760a4

    .global func_ov011_021760e4
    arm_func_start func_ov011_021760e4
func_ov011_021760e4: ; 0x021760e4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r6, r0
    ldr r0, [r6, #0x30]
    mov r5, r1
    mov r4, r2
    mov r7, #0x0
    bl func_ov011_02175628
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r8, [r0, #0x10]
    ldr r0, [r8, #0x1c]
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    ldr r0, [r8, #0xd4]
    cmp r4, #0x3
    mov r2, r0, lsr #0x1c
    ldr r0, [r1, #0x10]
    addls pc, pc, r4, lsl #0x2
    b .L_0217616c
.L_02176130: ; jump table
    b .L_02176140 ; case 0
    b .L_0217614c ; case 1
    b .L_02176158 ; case 2
    b .L_02176160 ; case 3
.L_02176140:
    add r1, r6, r5, lsl #0x2
    ldr r8, [r1, #0x14]
    b .L_02176170
.L_0217614c:
    add r1, r6, r5, lsl #0x2
    ldr r8, [r1, #0x1c]
    b .L_02176170
.L_02176158:
    ldr r8, [r6, #0x24]
    b .L_02176170
.L_02176160:
    add r1, r6, r5, lsl #0x2
    ldr r8, [r1, #0x28]
    b .L_02176170
.L_0217616c:
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02176170:
    cmp r8, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r9, [r8, #0x8]
    b .L_02176194
.L_02176180:
    ldr r3, [r9, #0x1c]
    ldrb r1, [r3, #0x20]
    bic r1, r1, #0x1
    strb r1, [r3, #0x20]
    ldr r9, [r9, #0x0]
.L_02176194:
    cmp r9, #0x0
    bne .L_02176180
    ldr r9, [r8, #0x10]
    b .L_021762bc
.L_021761a4:
    ldrb r1, [r9, #0x10]
    tst r1, #0x4
    bne .L_021762b8
    ldr r8, [r9, #0xc]
    ldr r1, [r9, #0x8]
    ldr r3, [r8, #0x10]
    tst r3, #0x20000000
    beq .L_021762b8
    cmp r4, #0x3
    ldr r1, [r1, #0x1c]
    bne .L_02176234
    ldr r8, [r8, #0x1c]
    ldr ip, [r0, #0x4]
    ldr lr, [r8, #0xc]
    mov r8, #0x0
    b .L_02176218
.L_021761e4:
    ldrb r10, [ip, #0x14]
    cmp r10, #0x1
    bne .L_02176200
    add r10, ip, r2, lsl #0x1
    ldrsh r10, [r10, #0xc]
    cmp r10, #0x0
    bgt .L_02176214
.L_02176200:
    ldr r10, [ip, #0x8]
    ldr r10, [r10, #0x10]
    cmp r10, lr
    moveq r8, #0x1
    beq .L_02176220
.L_02176214:
    ldr ip, [ip, #0x0]
.L_02176218:
    cmp ip, #0x0
    bne .L_021761e4
.L_02176220:
    cmp r8, #0x0
    beq .L_021762b8
    and r3, r3, #0x700
    orr r7, r7, r3
    b .L_021762ac
.L_02176234:
    cmp r4, #0x2
    bne .L_021762a4
    mov r8, #0x0
    mov lr, r8
    mov r10, #0x1
.L_02176248:
    add r11, r1, lr, lsl #0x2
    ldr ip, [r11, #0x8]
    cmp ip, #0x0
    beq .L_02176284
    ldr r11, [ip, #0xc]
    cmp r11, #0x0
    ldrle r11, [ip, #0x10]
    cmple r11, #0x0
    bgt .L_02176284
    ldrsb r11, [ip, #0x1a]
    cmp r11, #0x0
    blt .L_02176284
    ldrb ip, [ip, #0x1b]
    cmp ip, #0x0
    movne r8, r10
.L_02176284:
    add lr, lr, #0x1
    cmp lr, #0x5
    blt .L_02176248
    cmp r8, #0x0
    bne .L_021762b8
    and r3, r3, #0xff
    orr r7, r7, r3
    b .L_021762ac
.L_021762a4:
    and r3, r3, #0xff
    orr r7, r7, r3
.L_021762ac:
    ldrb r3, [r1, #0x20]
    orr r3, r3, #0x1
    strb r3, [r1, #0x20]
.L_021762b8:
    ldr r9, [r9, #0x0]
.L_021762bc:
    cmp r9, #0x0
    bne .L_021761a4
    cmp r4, #0x2
    ldreq r0, [r6, #0x78]
    orreq r0, r0, r7
    streq r0, [r6, #0x78]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r4, #0x3
    addeq r1, r6, #0x7c
    ldreq r0, [r1, r5, lsl #0x2]
    orreq r0, r0, r7
    streq r0, [r1, r5, lsl #0x2]
    addne r1, r6, #0x6c
    ldrne r0, [r1, r5, lsl #0x2]
    orrne r0, r0, r7
    strne r0, [r1, r5, lsl #0x2]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov011_021760e4

    .global func_ov011_02176300
    arm_func_start func_ov011_02176300
func_ov011_02176300: ; 0x02176300
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r4, [r6, #0x28]
    mov r5, r1
    ldr r0, [r4, #0x30]
    bl func_ov011_02175628
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    mov r2, #0x1
    ldr r0, [r0, #0x10]
    ldr r3, [r5, #0x10]
    ldr r1, [r0, #0xd4]
    ldr r0, .L_021763f0
    mov r1, r1, lsr #0x1c
    mov r1, r2, lsl r1
    orr r2, r1, #0x200000
    add r0, r0, #0x800
    orr r1, r1, r1, lsl #0x4
    orr r2, r2, #0x10000000
    orr r0, r1, r0
    orr r1, r3, r2
    str r1, [r5, #0x10]
    ldr r2, [r5, #0x14]
    ldr r1, .L_021763f4
    orr r0, r2, r0
    str r0, [r5, #0x14]
    ldr r2, .L_021763f8
    ldr r3, .L_021763fc
    mov r0, #0x24
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x24
    mov r8, r0
    bl func_020517fc
    bl func_02020d90
    ldr r1, [r6, #0x18]
    mov r7, r0
    bl func_ov011_02174de4
    ldr r0, [r7, #0x4]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r0, [r7, #0x4]
    ldr r1, .L_02176400
    bl func_02028384
    mov r0, #0x8f000
    str r0, [sp, #0x0]
    mov r0, r7
    add r1, sp, #0x0
    bl func_ov011_02172e14
    str r7, [r8, #0x1c]
    stmia r8, {r4, r5}
    ldr r0, [r6, #0x18]
    bl func_ov011_0217568c
    strb r0, [r8, #0x21]
    mov r0, r8
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_021763f0: .word 0x10200000
.L_021763f4: .word data_ov011_02181820
.L_021763f8: .word data_ov011_021817fc
.L_021763fc: .word 0x9f5
.L_02176400: .word func_ov011_02176460
    arm_func_end func_ov011_02176300

    .global func_ov011_02176404
    arm_func_start func_ov011_02176404
func_ov011_02176404: ; 0x02176404
    stmdb sp!, {r4, lr}
    mov r4, r2
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0217642c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x1c]
.L_0217642c:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02176404

    .global func_ov011_02176438
    arm_func_start func_ov011_02176438
func_ov011_02176438: ; 0x02176438
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x8]
    b .L_02176454
.L_02176448:
    mov r0, r4
    bl func_0207b1c0
    ldr r1, [r4, #0x8]
.L_02176454:
    cmp r1, #0x0
    bne .L_02176448
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02176438

    .global func_ov011_02176460
    arm_func_start func_ov011_02176460
func_ov011_02176460: ; 0x02176460
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x4]
    ldr r7, [r1, #0x10]
    bl func_ov011_02175628
    mov r4, r0
    bl func_ov011_0217568c
    ldrb r1, [r7, #0x21]
    cmp r1, r0
    beq .L_02176510
    mov r0, r4
    bl func_ov011_0217568c
    strb r0, [r7, #0x21]
    mov r6, #0x0
    mov r4, #0x1
    mvn r5, #0x0
    add r8, sp, #0x0
    b .L_02176504
.L_021764a8:
    ldrb r0, [r7, #0x21]
    mov r1, r8
    cmp r0, #0x0
    add r0, r7, r6, lsl #0x2
    ldr r2, [r0, #0x8]
    movne ip, r5
    ldrsh r3, [r2, #0x0]
    moveq ip, r4
    mov r2, r6
    mul ip, r3, ip
    strh ip, [sp, #0x0]
    ldr r3, [r0, #0x8]
    ldrsh r3, [r3, #0x2]
    strh r3, [sp, #0x2]
    ldr r3, [r0, #0x8]
    ldrsh r3, [r3, #0x4]
    strh r3, [sp, #0x4]
    ldr r0, [r0, #0x8]
    ldrsh r0, [r0, #0x6]
    strh r0, [sp, #0x6]
    ldr r0, [r7, #0x4]
    bl func_0207b22c
    add r6, r6, #0x1
.L_02176504:
    ldrb r0, [r7, #0x22]
    cmp r6, r0
    blt .L_021764a8
.L_02176510:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov011_02176460

    .global func_ov011_02176518
    arm_func_start func_ov011_02176518
func_ov011_02176518: ; 0x02176518
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    ldr r0, .L_0217681c
    ldr r3, .L_02176820
    ldr r2, .L_02176824
    mov r1, #0x0
    str r0, [r3, #0x0]
    bl func_020517fc
    bl func_02020d90
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r2, #0x8e000
    add r1, sp, #0x0
    mov r0, r4
    str r2, [sp, #0x0]
    bl func_ov011_02172e14
    ldr r0, [r4, #0x4]
    ldr r1, .L_02176828
    bl func_02028384
    ldr r0, [r4, #0x4]
    ldr r1, .L_02176820
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r5
    mov r0, r4
    bl func_ov011_02174de4
    ldr r6, .L_02176820
    mov r5, #0x0
    ldr r0, [r6, #0x0]
    str r4, [r0, #0x38]
    ldr r0, [r6, #0x0]
    add r0, r0, #0x23c
    add r4, r0, #0x400
.L_021765b4:
    ldr r0, [r6, #0x0]
    mov r1, r4
    add r0, r0, #0x18
    bl func_02037b98
    add r5, r5, #0x1
    cmp r5, #0x300
    add r4, r4, #0x48
    blt .L_021765b4
    ldr r4, .L_02176820
    mov r6, #0x0
    ldr r0, [r4, #0x0]
    add r0, r0, #0x23c
    add r5, r0, #0xdc00
.L_021765e8:
    ldr r0, [r4, #0x0]
    mov r1, r5
    add r0, r0, #0x20
    bl func_02037b98
    add r6, r6, #0x1
    cmp r6, #0xc0
    add r5, r5, #0x10
    blt .L_021765e8
    ldr r4, .L_02176820
    mov r6, #0x0
    ldr r0, [r4, #0x0]
    add r0, r0, #0x37c
    add r5, r0, #0xec00
.L_0217661c:
    ldr r0, [r4, #0x0]
    mov r1, r5
    add r0, r0, #0x28
    bl func_02037b98
    add r6, r6, #0x1
    cmp r6, #0x2100
    add r5, r5, #0xc
    blt .L_0217661c
    ldr r4, .L_02176820
    mov r6, #0x0
    ldr r0, [r4, #0x0]
    add r0, r0, #0x23c
    add r5, r0, #0xe800
.L_02176650:
    ldr r0, [r4, #0x0]
    mov r1, r5
    add r0, r0, #0x30
    bl func_02037b98
    add r6, r6, #0x1
    cmp r6, #0x30
    add r5, r5, #0x1c
    blt .L_02176650
    ldr r0, .L_02176820
    ldr r0, [r0, #0x0]
    add r5, r0, #0x3c
    bl func_02083ab8
    bl func_0207d2a8
    mvn r4, #0x0
    mov r6, r0
    mov r7, #0x0
    add r8, r4, #0x100000
    ldr r9, .L_02176820
    b .L_02176738
.L_0217669c:
    mov r0, r7
    add r1, r5, #0xc
    bl func_02083760
    strb r0, [r5, #0x1e]
    ldrsb r0, [r5, #0x1e]
    bl func_02083acc
    cmp r0, #0x0
    beq .L_02176724
    mov r0, r7
    strh r7, [r5, #0x1c]
    bl func_02083aec
    cmp r0, #0x0
    beq .L_021766f0
    ldr r0, [r5, #0x8]
    mov r1, r5
    and r0, r0, r4, lsl #0x14
    orr r0, r0, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r9, #0x0]
    bl func_02037b98
    b .L_02176728
.L_021766f0:
    ldr r2, [r5, #0x8]
    mov r1, r5
    mov r0, r2, lsl #0xc
    mov r0, r0, lsr #0xc
    bic r0, r0, #0x1
    and r2, r2, r4, lsl #0x14
    and r0, r0, r8
    orr r0, r2, r0
    str r0, [r5, #0x8]
    ldr r0, [r9, #0x0]
    add r0, r0, #0x10
    bl func_02037b98
    b .L_02176728
.L_02176724:
    strh r4, [r5, #0x1c]
.L_02176728:
    add r0, r7, #0x1
    mov r0, r0, lsl #0x10
    mov r7, r0, asr #0x10
    add r5, r5, #0x20
.L_02176738:
    cmp r7, r6
    blt .L_0217669c
    ldr r0, .L_02176820
    mov r4, #0x100000
    ldr r0, [r0, #0x0]
    mov r7, #0x0
    add r8, r0, #0x3c
    rsb r4, r4, #0x0
    ldr r5, .L_0217682c
    b .L_02176810
.L_02176760:
    mov r0, r7
    bl func_02083b0c
    ldr r2, [r8, #0x8]
    mov r1, r0, lsl #0x10
    bic r2, r2, #0x3f00000
    orr r3, r2, #0x3f00000
    bic r2, r3, #0xfc000000
    orr r2, r2, #0xfc000000
    str r2, [r8, #0x8]
    movs r1, r1, asr #0x10
    bmi .L_021767c0
    cmp r1, r6
    bge .L_021767c0
    ldr r3, [r8, #0x8]
    mov r1, r1, lsl #0x1a
    mov r2, r3, lsl #0xc
    mov r2, r2, lsr #0xc
    orr r2, r2, #0x2
    and r3, r3, r4
    and r2, r2, r5
    orr r3, r3, r2
    bic r2, r3, #0x3f00000
    orr r1, r2, r1, lsr #0x6
    str r1, [r8, #0x8]
.L_021767c0:
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x10
    bmi .L_02176800
    cmp r0, r6
    bge .L_02176800
    ldr r2, [r8, #0x8]
    mov r1, r2, lsl #0xc
    mov r1, r1, lsr #0xc
    orr r1, r1, #0x4
    and r2, r2, r4
    and r1, r1, r5
    orr r2, r2, r1
    bic r1, r2, #0xfc000000
    orr r0, r1, r0, lsl #0x1a
    str r0, [r8, #0x8]
.L_02176800:
    add r0, r7, #0x1
    mov r0, r0, lsl #0x10
    mov r7, r0, asr #0x10
    add r8, r8, #0x20
.L_02176810:
    cmp r7, r6
    blt .L_02176760
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0217681c: .word data_ov011_02183a3c
.L_02176820: .word data_ov011_02183a38
.L_02176824: .word 0x2877c
.L_02176828: .word func_ov011_021771d0
.L_0217682c: .word 0xfffff
    arm_func_end func_ov011_02176518

    .global func_ov011_02176830
    arm_func_start func_ov011_02176830
func_ov011_02176830: ; 0x02176830
    bx lr
    arm_func_end func_ov011_02176830

    .global func_ov011_02176834
    arm_func_start func_ov011_02176834
func_ov011_02176834: ; 0x02176834
    ldr r0, .L_02176844
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x30]
    bx lr
.L_02176844: .word data_ov011_02183a38
    arm_func_end func_ov011_02176834

    .global func_ov011_02176848
    arm_func_start func_ov011_02176848
func_ov011_02176848: ; 0x02176848
    ldr r0, .L_02176858
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x8]
    bx lr
.L_02176858: .word data_ov011_02183a38
    arm_func_end func_ov011_02176848

    .global func_ov011_0217685c
    arm_func_start func_ov011_0217685c
func_ov011_0217685c: ; 0x0217685c
    stmdb sp!, {r4, lr}
    ldr r1, .L_021768d8
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, r4
    add r0, r0, #0x30
    bl func_02037c24
    ldr r0, .L_021768d8
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x8
    bl func_02037b98
    ldrsh r1, [r4, #0xc]
    ldrsh r0, [r4, #0x8]
    sub r0, r1, r0
    mov r0, r0, asr #0x1
    strh r0, [r4, #0x14]
    ldrsh r1, [r4, #0xe]
    ldrsh r0, [r4, #0xa]
    sub r0, r1, r0
    mov r0, r0, asr #0x1
    strh r0, [r4, #0x16]
    ldrsh r1, [r4, #0x8]
    ldrsh r0, [r4, #0x14]
    add r0, r1, r0
    strh r0, [r4, #0x10]
    ldrsh r1, [r4, #0xa]
    ldrsh r0, [r4, #0x16]
    add r0, r1, r0
    strh r0, [r4, #0x12]
    ldmia sp!, {r4, pc}
.L_021768d8: .word data_ov011_02183a38
    arm_func_end func_ov011_0217685c

    .global func_ov011_021768dc
    arm_func_start func_ov011_021768dc
func_ov011_021768dc: ; 0x021768dc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, .L_02176938
    mov r6, #0x0
    ldr r0, [r4, #0x0]
    mov r5, #0x1c
    ldr r7, [r0, #0x8]
    b .L_0217692c
.L_021768f8:
    mov r1, r7
    add r0, r0, #0x8
    bl func_02037c24
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_020517fc
    ldr r0, [r4, #0x0]
    mov r1, r7
    add r0, r0, #0x30
    bl func_02037b98
    ldr r0, [r4, #0x0]
    ldr r7, [r0, #0x8]
.L_0217692c:
    cmp r7, #0x0
    bne .L_021768f8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02176938: .word data_ov011_02183a38
    arm_func_end func_ov011_021768dc

    .global func_ov011_0217693c
    arm_func_start func_ov011_0217693c
func_ov011_0217693c: ; 0x0217693c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x98
    mov r7, r0
    mov r6, r2
    ldr r1, .L_02176bec
    mov r0, #0x190
    mov r5, r3
    ldr r2, .L_02176bf0
    add r3, r0, #0x91
    bl func_0201a21c
    movs r8, r0
    movne r0, #0x0
    strne r0, [r8, #0x0]
    strne r0, [r8, #0x4]
    strne r0, [r8, #0x8]
    strne r0, [r8, #0xc]
    mov r0, r8
    mov r1, #0x0
    mov r2, #0x190
    bl func_020517fc
    bl func_02020d90
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x93000
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, sp, #0x14
    bl func_ov011_02172e14
    ldr r0, [r4, #0x4]
    ldr r1, .L_02176bf4
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r8
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r7
    mov r0, r4
    bl func_ov011_02174de4
    ldr r0, [r4, #0x4]
    bl func_020282f4
    str r4, [r8, #0x10]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r3, [sp, #0xc0]
    mov r1, r6
    mov r2, r5
    add r0, sp, #0x18
    bl func_ov011_02177060
    mov r1, #0x0
    add r0, sp, #0x18
    mov r2, r1
    bl func_02033410
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    bne .L_02176a3c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
.L_02176a3c:
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r0, #0x4]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r6, #0x28
    mov r9, r0
    mov r4, #0x0
    add r7, r8, #0x14
    mov r5, r6
.L_02176a6c:
    mla r1, r4, r5, r7
    add r0, r9, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    mov r2, r6
    add r0, r9, r0
    bl func_02051890
    add r4, r4, #0x1
    cmp r4, #0x7
    blt .L_02176a6c
    bl func_02083ab8
    bl func_0207d2a8
    mov r6, #0x0
    ldr r4, .L_02176bf8
    mov r10, r0
    ldr r0, [r4, #0x0]
    mov r11, r6
    add r7, r0, #0x3c
    b .L_02176afc
.L_02176ab4:
    ldrsh r0, [r7, #0x1c]
    cmp r0, #0x0
    blt .L_02176aec
    ldr r0, [r4, #0x0]
    add r0, r0, #0x18
    bl func_ov011_021771b0
    mov r5, r0
    mov r1, r11
    mov r2, #0x48
    bl func_020517fc
    add r0, r8, #0x8
    mov r1, r5
    bl func_02037b98
    str r7, [r5, #0x40]
.L_02176aec:
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, asr #0x10
    add r7, r7, #0x20
.L_02176afc:
    cmp r6, r10
    blt .L_02176ab4
    ldr r10, [r8, #0x8]
    mov r6, #0x0
    b .L_02176bc4
.L_02176b10:
    add r0, r9, r6, lsl #0x2
    ldr r0, [r0, #0x20]
    mov r5, #0x0
    add r11, r9, r0
    add r0, r10, #0x8
    str r0, [sp, #0xc]
.L_02176b28:
    ldr r0, [sp, #0xc]
    mov r4, #0x0
    add r0, r0, r5, lsl #0x3
    str r0, [sp, #0x4]
    add r0, r11, r5, lsl #0x4
    str r0, [sp, #0x10]
    b .L_02176ba8
.L_02176b44:
    ldr r0, [sp, #0x10]
    add r0, r0, r4
    ldrsb r1, [r0, #0x8]
    cmp r1, #0x0
    blt .L_02176bb0
    ldr r7, [r8, #0x8]
    b .L_02176b74
.L_02176b60:
    ldr r0, [r7, #0x40]
    ldrsh r0, [r0, #0x1c]
    cmp r0, r1
    beq .L_02176b7c
    ldr r7, [r7, #0x0]
.L_02176b74:
    cmp r7, #0x0
    bne .L_02176b60
.L_02176b7c:
    cmp r7, #0x0
    beq .L_02176ba4
    ldr r0, .L_02176bf8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x28
    bl func_ov011_021771b0
    mov r1, r0
    ldr r0, [sp, #0x4]
    str r7, [r1, #0x8]
    bl func_02037b98
.L_02176ba4:
    add r4, r4, #0x1
.L_02176ba8:
    cmp r4, #0x10
    blt .L_02176b44
.L_02176bb0:
    add r5, r5, #0x1
    cmp r5, #0x7
    blt .L_02176b28
    ldr r10, [r10, #0x0]
    add r6, r6, #0x1
.L_02176bc4:
    cmp r10, #0x0
    bne .L_02176b10
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, r8
    add sp, sp, #0x98
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02176bec: .word data_ov011_0218189c
.L_02176bf0: .word data_ov011_02181888
.L_02176bf4: .word func_ov011_02177444
.L_02176bf8: .word data_ov011_02183a38
    arm_func_end func_ov011_0217693c

    .global func_ov011_02176bfc
    arm_func_start func_ov011_02176bfc
func_ov011_02176bfc: ; 0x02176bfc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r7, [r10, #0x0]
    mov r6, #0x0
    mov r5, #0x10
    ldr r4, .L_02176d10
    b .L_02176c48
.L_02176c18:
    mov r0, r10
    mov r1, r7
    bl func_02037c24
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_020517fc
    ldr r0, [r4, #0x0]
    mov r1, r7
    add r0, r0, #0x20
    bl func_02037b98
    ldr r7, [r10, #0x0]
.L_02176c48:
    cmp r7, #0x0
    bne .L_02176c18
    mov r11, #0x0
    ldr r6, [r10, #0x8]
    mov r5, r11
    ldr r4, .L_02176d10
    b .L_02176cec
.L_02176c64:
    mov r8, r5
    add r7, r6, #0x8
.L_02176c6c:
    ldr r9, [r7, #0x0]
    b .L_02176ca4
.L_02176c74:
    mov r0, r7
    mov r1, r9
    bl func_02037c24
    mov r0, r9
    mov r1, r11
    mov r2, #0xc
    bl func_020517fc
    ldr r0, [r4, #0x0]
    mov r1, r9
    add r0, r0, #0x28
    bl func_02037b98
    ldr r9, [r7, #0x0]
.L_02176ca4:
    cmp r9, #0x0
    bne .L_02176c74
    add r8, r8, #0x1
    cmp r8, #0x7
    add r7, r7, #0x8
    blt .L_02176c6c
    mov r1, r6
    add r0, r10, #0x8
    bl func_02037c24
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x48
    bl func_020517fc
    ldr r0, [r4, #0x0]
    mov r1, r6
    add r0, r0, #0x18
    bl func_02037b98
    ldr r6, [r10, #0x8]
.L_02176cec:
    cmp r6, #0x0
    bne .L_02176c64
    ldr r0, [r10, #0x10]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r10
    bl func_0201b244
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02176d10: .word data_ov011_02183a38
    arm_func_end func_ov011_02176bfc

    .global func_ov011_02176d14
    arm_func_start func_ov011_02176d14
func_ov011_02176d14: ; 0x02176d14
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r1, r0, #0x100
    mov r2, #0x0
    strh r2, [r1, #0x88]
    strb r2, [r0, #0x18b]
    ldr r0, [r0, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02176d50
    mov r1, #0x0
    str r1, [r0, #0xe4]
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02176d14

    .global func_ov011_02176d50
    arm_func_start func_ov011_02176d50
func_ov011_02176d50: ; 0x02176d50
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x14]
    ldr r0, [r0, #0x0]
    bx lr
    arm_func_end func_ov011_02176d50

    .global func_ov011_02176d64
    arm_func_start func_ov011_02176d64
func_ov011_02176d64: ; 0x02176d64
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    movs r7, r0
    mov r8, r1
    mov r6, r2
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r4, [r8, #0x0]
    ldr r0, [r7, #0x12c]
    ldr r5, [r8, #0x4]
    subs r1, r4, r0
    rsbmi r1, r1, #0x0
    ldr r0, [r7, #0x130]
    mov r1, r1, asr #0x8
    subs r0, r5, r0
    rsbmi r0, r0, #0x0
    mov r0, r0, asr #0x8
    cmp r1, #0x6
    cmplt r0, #0x6
    bge .L_02176dc4
    add r0, r7, #0x100
    ldrsb r0, [r0, #0x8b]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02176dc4:
    ldr r0, [r7, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_0217718c
    ldr r1, [r0, #0x10]
    ldr r0, .L_0217700c
    ldr r1, [r1, #0x5c]
    ldr r9, [r8, #0x0]
    ldr r2, [r1, #0xc]
    ldr r3, [r1, #0x10]
    ldr r1, [r8, #0x4]
    ldr r0, [r0, #0x0]
    mov lr, r1, asr #0x8
    mov r2, r2, asr #0x8
    mov r3, r3, asr #0x8
    mov ip, r9, asr #0x8
    ldr r0, [r0, #0x8]
    mov r1, #0x0
    mov r11, #0x1
    b .L_02176ec8
.L_02176e18:
    ldrsh r8, [r0, #0x8]
    cmp r8, ip
    bge .L_02176e70
    ldrsh r9, [r0, #0xc]
    cmp r9, ip
    ble .L_02176e70
    ldrsh r10, [r0, #0xa]
    cmp r10, lr
    bge .L_02176e70
    ldrsh r10, [r0, #0xe]
    cmp r10, lr
    ble .L_02176e70
    ldr r10, [r7, #0x180]
    tst r10, #0x10
    bne .L_02176ec4
    cmp r8, r2
    subgt ip, r8, #0x8
    movgt r1, r11
    cmp r9, r2
    movlt r1, #0x1
    addlt ip, r9, #0x8
    b .L_02176ec4
.L_02176e70:
    ldrsh r10, [r0, #0xa]
    cmp r3, r10
    blt .L_02176ec4
    ldrsh r9, [r0, #0xe]
    cmp r3, r9
    bgt .L_02176ec4
    cmp lr, r10
    blt .L_02176ec4
    cmp lr, r9
    bgt .L_02176ec4
    cmp r2, ip
    ble .L_02176eb4
    cmp ip, r8
    ldrltsh r8, [r0, #0xc]
    movlt r1, #0x1
    addlt ip, r8, #0x8
    b .L_02176ec4
.L_02176eb4:
    ldrsh r9, [r0, #0xc]
    cmp r2, r9
    movgt r1, #0x1
    subgt ip, r8, #0x8
.L_02176ec4:
    ldr r0, [r0, #0x0]
.L_02176ec8:
    cmp r0, #0x0
    bne .L_02176e18
    ldr r0, [r7, #0x10]
    cmp r1, #0x0
    movne r4, ip, lsl #0x8
    movne r5, lr, lsl #0x8
    cmp r1, #0x0
    mvnne r6, #0x0
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r0, r4
    sub r1, r5, #0x200
    bl func_02083b4c
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r6, #0x0
    bge .L_02176f24
    mov r0, r4
    mov r1, r5
    bl func_020837b0
    mov r6, r0
.L_02176f24:
    ldr r0, .L_0217700c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3c
    add r8, r0, r6, lsl #0x5
    ldrsb r0, [r8, #0x1e]
    bl func_02083acc
    cmp r0, #0x0
    moveq r0, #0x3
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, r4
    mov r1, r5
    bl func_020836b4
    cmp r0, #0x0
    moveq r0, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [r8, #0xc]
    add r0, r1, #0x400
    cmp r4, r0
    movlt r4, r0
    ldr r0, [r8, #0x14]
    add r0, r1, r0
    sub r0, r0, #0x400
    cmp r4, r0
    movgt r4, r0
    add r0, r7, #0x100
    ldrsb r0, [r0, #0x8b]
    cmp r0, #0x0
    bne .L_02176fb8
    mov r0, #0x1
    strb r0, [r7, #0x18b]
    ldr r0, [r7, #0x180]
    tst r0, #0x40
    moveq r0, #0xf0
    streq r0, [r7, #0x184]
    ldreq r0, [r7, #0x180]
    orreq r0, r0, #0x40
    streq r0, [r7, #0x180]
.L_02176fb8:
    str r4, [r7, #0x12c]
    str r5, [r7, #0x130]
    add r0, r7, #0x100
    strh r6, [r0, #0x44]
    ldrsb r3, [r8, #0x1e]
    add r0, r8, #0xc
    add r1, r7, #0x134
    mov r2, #0x10
    strb r3, [r7, #0x146]
    bl func_02051890
    add r1, r7, #0x100
    mvn r0, #0x0
    strh r0, [r1, #0x60]
    ldrsh r2, [r1, #0x60]
    mov r0, #0x0
    strh r2, [r1, #0x7c]
    ldr r1, [r7, #0x180]
    bic r1, r1, #0x84
    orr r1, r1, #0x20
    str r1, [r7, #0x180]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217700c: .word data_ov011_02183a38
    arm_func_end func_ov011_02176d64

    .global func_ov011_02177010
    arm_func_start func_ov011_02177010
func_ov011_02177010: ; 0x02177010
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    mov r4, r1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02176d50
    mov r3, #0x0
    str r3, [r0, #0xe4]
    ldr r0, [r4, #0x0]
    mov r1, #0x8
    str r0, [r5, #0x12c]
    ldr r2, [r4, #0x4]
    add r0, r5, #0x100
    str r2, [r5, #0x130]
    strb r1, [r5, #0x18b]
    strh r3, [r0, #0x88]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_02177010

    .global func_ov011_02177060
    arm_func_start func_ov011_02177060
func_ov011_02177060: ; 0x02177060
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldrb ip, [sp, #0x18]
    mov r6, r0
    mov r7, r1
    mov r5, r2
    mov r4, r3
    cmp ip, #0x0
    beq .L_021770f0
    ldr r1, .L_02177160
    bl func_02074000
    ldr r1, .L_02177164
    mov r0, r6
    ldr r1, [r1, r7, lsl #0x3]
    bl func_020741bc
    ldr r1, .L_02177168
    mov r0, r6
    bl func_020741bc
    ldr r0, .L_0217716c
    ldr r1, .L_02177170
    ldrb r2, [r0, r5]
    mov r0, r6
    ldr r1, [r1, r2, lsl #0x2]
    bl func_020741bc
    ldr r1, .L_02177174
    mov r0, r6
    bl func_020741bc
    ldr r0, .L_02177178
    ldr r1, .L_0217717c
    ldrb r2, [r0, r4]
    mov r0, r6
    ldr r1, [r1, r2, lsl #0x2]
    bl func_020741bc
    ldr r1, .L_02177180
    mov r0, r6
    bl func_020741bc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021770f0:
    ldr r1, .L_02177184
    bl func_02074000
    ldr r1, .L_02177164
    mov r0, r6
    ldr r1, [r1, r7, lsl #0x3]
    bl func_020741bc
    ldr r1, .L_02177188
    mov r0, r6
    bl func_020741bc
    ldr r0, .L_0217716c
    ldr r1, .L_02177170
    ldrb r2, [r0, r5]
    mov r0, r6
    ldr r1, [r1, r2, lsl #0x2]
    bl func_020741bc
    ldr r1, .L_02177174
    mov r0, r6
    bl func_020741bc
    ldr r0, .L_02177178
    ldr r1, .L_0217717c
    ldrb r2, [r0, r4]
    mov r0, r6
    ldr r1, [r1, r2, lsl #0x2]
    bl func_020741bc
    ldr r1, .L_02177180
    mov r0, r6
    bl func_020741bc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02177160: .word data_ov011_021818b0
.L_02177164: .word data_02092d08
.L_02177168: .word data_ov011_021818d0
.L_0217716c: .word data_ov011_021811c8
.L_02177170: .word data_ov011_02181858
.L_02177174: .word data_ov011_021818d4
.L_02177178: .word data_ov011_021811d0
.L_0217717c: .word data_ov011_0218184c
.L_02177180: .word data_ov011_021818d8
.L_02177184: .word data_ov011_021818e0
.L_02177188: .word data_ov011_021818f0
    arm_func_end func_ov011_02177060

    .global func_ov011_0217718c
    arm_func_start func_ov011_0217718c
func_ov011_0217718c: ; 0x0217718c
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x20]
    ldr r0, [r0, #0x1a8]
    bx lr
    arm_func_end func_ov011_0217718c

    .global func_ov011_021771a0
    arm_func_start func_ov011_021771a0
func_ov011_021771a0: ; 0x021771a0
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x5c]
    add r0, r0, #0xc
    bx lr
    arm_func_end func_ov011_021771a0

    .global func_ov011_021771b0
    arm_func_start func_ov011_021771b0
func_ov011_021771b0: ; 0x021771b0
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x0]
    cmp r4, #0x0
    beq .L_021771c8
    mov r1, r4
    bl func_02037c24
.L_021771c8:
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_021771b0

    .global func_ov011_021771d0
    arm_func_start func_ov011_021771d0
func_ov011_021771d0: ; 0x021771d0
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r8, .L_0217743c
    mov r6, #0x100000
    ldr r0, [r8, #0x0]
    rsb r6, r6, #0x0
    ldr r4, [r0, #0x0]
    ldr r7, .L_02177440
    b .L_02177294
.L_021771f0:
    ldrsh r0, [r4, #0x1c]
    ldr r5, [r4, #0x0]
    bl func_02083aec
    cmp r0, #0x0
    bne .L_02177240
    ldr r2, [r4, #0x8]
    mov r1, r4
    mov r0, r2, lsl #0xc
    mov r0, r0, lsr #0xc
    bic r0, r0, #0x1
    and r2, r2, r6
    and r0, r0, r7
    orr r0, r2, r0
    str r0, [r4, #0x8]
    ldr r0, [r8, #0x0]
    bl func_02037c24
    ldr r0, [r8, #0x0]
    mov r1, r4
    add r0, r0, #0x10
    bl func_02037b98
.L_02177240:
    ldrsb r0, [r4, #0x1e]
    cmp r0, #0x2
    bne .L_02177290
    ldr r0, [r4, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    tst r0, #0x8
    bne .L_02177290
    ldrsh r0, [r4, #0x1c]
    bl func_02083b2c
    cmp r0, #0x0
    beq .L_02177290
    ldr r1, [r4, #0x8]
    mov r0, r1, lsl #0xc
    mov r0, r0, lsr #0xc
    orr r0, r0, #0x8
    and r1, r1, r6
    and r0, r0, r7
    orr r0, r1, r0
    str r0, [r4, #0x8]
.L_02177290:
    mov r4, r5
.L_02177294:
    cmp r4, #0x0
    bne .L_021771f0
    ldr r8, .L_0217743c
    mov r6, #0x100000
    ldr r0, [r8, #0x0]
    rsb r6, r6, #0x0
    ldr r4, [r0, #0x10]
    ldr r7, .L_02177440
    b .L_0217735c
.L_021772b8:
    ldrsh r0, [r4, #0x1c]
    ldr r5, [r4, #0x0]
    bl func_02083aec
    cmp r0, #0x0
    beq .L_02177308
    ldr r2, [r4, #0x8]
    mov r1, r4
    mov r0, r2, lsl #0xc
    mov r0, r0, lsr #0xc
    orr r0, r0, #0x1
    and r2, r2, r6
    and r0, r0, r7
    orr r0, r2, r0
    str r0, [r4, #0x8]
    ldr r0, [r8, #0x0]
    add r0, r0, #0x10
    bl func_02037c24
    ldr r0, [r8, #0x0]
    mov r1, r4
    bl func_02037b98
.L_02177308:
    ldrsb r0, [r4, #0x1e]
    cmp r0, #0x2
    bne .L_02177358
    ldr r0, [r4, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    tst r0, #0x8
    bne .L_02177358
    ldrsh r0, [r4, #0x1c]
    bl func_02083b2c
    cmp r0, #0x0
    beq .L_02177358
    ldr r1, [r4, #0x8]
    mov r0, r1, lsl #0xc
    mov r0, r0, lsr #0xc
    orr r0, r0, #0x8
    and r1, r1, r6
    and r0, r0, r7
    orr r0, r1, r0
    str r0, [r4, #0x8]
.L_02177358:
    mov r4, r5
.L_0217735c:
    cmp r4, #0x0
    bne .L_021772b8
    ldr r7, .L_0217743c
    mov r5, #0x100000
    ldr r0, [r7, #0x0]
    rsb r5, r5, #0x0
    ldr r4, [r0, #0x0]
    ldr r6, .L_02177440
    b .L_02177430
.L_02177380:
    ldr r1, [r4, #0x8]
    mov r0, r1, lsl #0x6
    mov r2, r0, lsr #0x1a
    cmp r2, #0x3f
    beq .L_021773cc
    ldr r0, [r7, #0x0]
    add r0, r0, r2, lsl #0x5
    ldr r0, [r0, #0x44]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    tst r0, #0x8
    beq .L_021773cc
    mov r0, r1, lsl #0xc
    mov r0, r0, lsr #0xc
    bic r0, r0, #0x2
    and r1, r1, r5
    and r0, r0, r6
    orr r0, r1, r0
    str r0, [r4, #0x8]
.L_021773cc:
    ldr r1, [r4, #0x8]
    mov r2, r1, lsr #0x1a
    cmp r2, #0x3f
    beq .L_02177414
    ldr r0, [r7, #0x0]
    add r0, r0, r2, lsl #0x5
    ldr r0, [r0, #0x44]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    tst r0, #0x8
    beq .L_02177414
    mov r0, r1, lsl #0xc
    mov r0, r0, lsr #0xc
    bic r0, r0, #0x4
    and r1, r1, r5
    and r0, r0, r6
    orr r0, r1, r0
    str r0, [r4, #0x8]
.L_02177414:
    ldrsb r0, [r4, #0x1e]
    cmp r0, #0xc
    bne .L_0217742c
    ldrsh r0, [r4, #0x1c]
    add r1, r4, #0xc
    bl func_02083760
.L_0217742c:
    ldr r4, [r4, #0x0]
.L_02177430:
    cmp r4, #0x0
    bne .L_02177380
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217743c: .word data_ov011_02183a38
.L_02177440: .word 0xfffff
    arm_func_end func_ov011_021771d0

    .global func_ov011_02177444
    arm_func_start func_ov011_02177444
func_ov011_02177444: ; 0x02177444
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x38
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    ldr r6, [r1, #0x10]
    ldr r1, [r6, #0xd4]
    tst r1, #0x1
    beq .L_02177be8
    bl func_ov011_02177c24
    mov r1, #0xa
    bl func_ov011_02177c00
    cmp r0, #0x0
    bne .L_02177be8
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r4, r0
    bl func_ov011_02177c34
    mov r7, r0, lsl #0x2
    mov r0, r4
    bl func_ov011_02177c48
    and r0, r0, #0xf
    cmp r0, r7
    bne .L_02177740
    ldr r8, [r5, #0x8]
    b .L_02177738
.L_021774c4:
    ldr r0, [r8, #0x40]
    add r1, sp, #0x28
    ldrsb r4, [r0, #0x1e]
    add r0, r0, #0xc
    mov r2, #0x10
    bl func_02051890
    cmp r4, #0xc
    moveq r7, #0x1
    movne r7, #0x0
    cmp r7, #0x0
    add r4, r8, #0x8
    mov r9, #0x0
    beq .L_02177540
    ldr r11, .L_02177bf0
.L_021774fc:
    ldr r10, [r4, #0x0]
    b .L_02177524
.L_02177504:
    mov r0, r4
    mov r1, r10
    bl func_02037c24
    ldr r0, [r11, #0x0]
    mov r1, r10
    add r0, r0, #0x28
    bl func_02037b98
    ldr r10, [r4, #0x0]
.L_02177524:
    cmp r10, #0x0
    bne .L_02177504
    add r9, r9, #0x1
    cmp r9, #0x7
    add r4, r4, #0x8
    blt .L_021774fc
    b .L_0217759c
.L_02177540:
    ldr r10, [r4, #0x0]
    b .L_02177584
.L_02177548:
    ldr r0, [r10, #0x8]
    ldr r11, [r10, #0x0]
    ldr r0, [r0, #0x40]
    ldrsb r0, [r0, #0x1e]
    cmp r0, #0xc
    bne .L_02177580
    mov r0, r4
    mov r1, r10
    bl func_02037c24
    ldr r0, .L_02177bf0
    mov r1, r10
    ldr r0, [r0, #0x0]
    add r0, r0, #0x28
    bl func_02037b98
.L_02177580:
    mov r10, r11
.L_02177584:
    cmp r10, #0x0
    bne .L_02177548
    add r9, r9, #0x1
    cmp r9, #0x7
    add r4, r4, #0x8
    blt .L_02177540
.L_0217759c:
    ldr r9, [r5, #0x8]
    add r11, r8, #0x8
    b .L_0217772c
.L_021775a8:
    cmp r8, r9
    beq .L_02177728
    cmp r7, #0x0
    ldr r1, [r9, #0x40]
    ldrsb r0, [r1, #0x1e]
    bne .L_021775c8
    cmp r0, #0xc
    bne .L_02177728
.L_021775c8:
    add r0, r1, #0xc
    add r1, sp, #0x18
    mov r2, #0x10
    bl func_02051890
    mov r0, #0x0
    ldr r4, [sp, #0x2c]
    ldr r3, [sp, #0x1c]
    mov r1, r0
    sub r2, r3, r4
    str r2, [sp, #0x4]
    mov r2, r0
    str r2, [sp, #0x0]
    ldr ip, [sp, #0x18]
    ldr lr, [sp, #0x28]
    cmp lr, ip
    ble .L_02177618
    ldr r2, [sp, #0x20]
    add r2, ip, r2
    cmp lr, r2
    blt .L_02177638
.L_02177618:
    ldr r2, [sp, #0x30]
    add r2, lr, r2
    cmp r2, ip
    ble .L_02177640
    ldr r10, [sp, #0x20]
    add r10, ip, r10
    cmp r2, r10
    bge .L_02177640
.L_02177638:
    mov r1, #0x1
    b .L_02177654
.L_02177640:
    ldr r0, [sp, #0x20]
    add r0, ip, r0
    cmp lr, r0
    subgt r0, lr, r0
    suble r0, ip, r2
.L_02177654:
    cmp r4, r3
    bgt .L_021776ac
    cmp r1, #0x0
    bne .L_0217766c
    cmp r0, #0x100
    bgt .L_02177728
.L_0217766c:
    ldr r0, .L_02177bf0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x28
    bl func_ov011_02178f1c
    mov r1, r0
    str r9, [r1, #0x8]
    ldr r2, [sp, #0x2c]
    ldr r0, [sp, #0x1c]
    cmp r2, r0
    bne .L_021776a0
    mov r0, r11
    bl func_02037b98
    b .L_02177728
.L_021776a0:
    add r0, r8, #0x10
    bl func_02037b98
    b .L_02177728
.L_021776ac:
    add r2, r5, #0x64
    mov r4, #0x2
    b .L_02177720
.L_021776b8:
    ldr r10, [r2, #0x4]
    ldr r3, [sp, #0x4]
    cmp r10, r3
    bge .L_021776e8
    cmp r1, #0x0
    movne r3, #0x1
    strne r3, [sp, #0x0]
    bne .L_021776e8
    ldr r3, [r2, #0x0]
    cmp r3, r0
    movgt r3, #0x1
    strgt r3, [sp, #0x0]
.L_021776e8:
    ldr r3, [sp, #0x0]
    cmp r3, #0x0
    beq .L_02177718
    ldr r0, .L_02177bf0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x28
    bl func_ov011_02178f1c
    mov r1, r0
    add r0, r11, r4, lsl #0x3
    str r9, [r1, #0x8]
    bl func_02037b98
    b .L_02177728
.L_02177718:
    add r4, r4, #0x1
    add r2, r2, #0x28
.L_02177720:
    cmp r4, #0x7
    blt .L_021776b8
.L_02177728:
    ldr r9, [r9, #0x0]
.L_0217772c:
    cmp r9, #0x0
    bne .L_021775a8
    ldr r8, [r8, #0x0]
.L_02177738:
    cmp r8, #0x0
    bne .L_021774c4
.L_02177740:
    ldr r1, [r5, #0x180]
    mov r0, #0x0
    tst r1, #0x20
    beq .L_021777f8
    add r1, r5, #0x100
    ldrsh r2, [r1, #0x44]
    cmp r2, #0x0
    blt .L_02177780
    ldr r1, .L_02177bf0
    ldr r1, [r1, #0x0]
    add r1, r1, r2, lsl #0x5
    ldr r1, [r1, #0x44]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0xc
    tst r1, #0x1
    moveq r0, #0x1
.L_02177780:
    add r1, r5, #0x100
    ldrsh r2, [r1, #0x60]
    cmp r2, #0x0
    blt .L_021777b4
    ldr r1, .L_02177bf0
    ldr r1, [r1, #0x0]
    add r1, r1, r2, lsl #0x5
    ldr r1, [r1, #0x44]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0xc
    tst r1, #0x1
    moveq r0, #0x1
    b .L_021777e0
.L_021777b4:
    ldrsh r2, [r1, #0x7c]
    cmp r2, #0x0
    blt .L_021777e0
    ldr r1, .L_02177bf0
    ldr r1, [r1, #0x0]
    add r1, r1, r2, lsl #0x5
    ldr r1, [r1, #0x44]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0xc
    tst r1, #0x1
    moveq r0, #0x1
.L_021777e0:
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_021777f8
    mov r0, r5
    bl func_ov011_02178f40
    mov r0, #0x1
.L_021777f8:
    cmp r0, #0x0
    bne .L_02177be8
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0xa
    ldr r7, [r0, #0x10]
    ldr r0, [r7, #0x2c]
    bl func_ov011_02177c00
    cmp r0, #0x0
    bne .L_02177904
    ldr r2, [r7, #0x20]
    ldr r1, [r7, #0x14]
    mov r0, r4
    ldr r8, [r2, #0x1a8]
    ldr r4, [r1, #0x0]
    bl func_ov011_02178224
    cmp r0, #0x0
    bne .L_02177904
    ldr r0, [r8, #0x10]
    ldr r1, [r5, #0x180]
    ldr r0, [r0, #0x5c]
    tst r1, #0x20
    beq .L_02177904
    ldr r3, [r5, #0x150]
    ldr r2, [r0, #0xc]
    cmp r2, r3
    ble .L_02177890
    ldr r1, [r5, #0x158]
    add r1, r3, r1
    cmp r2, r1
    ldrlt r0, [r4, #0xe4]
    biclt r0, r0, #0xc
    strlt r0, [r4, #0xe4]
    blt .L_02177904
.L_02177890:
    ldr r1, [r7, #0x20]
    ldrsb r1, [r1, #0x18]
    cmp r1, #0x10
    beq .L_02177904
    ldr r1, [r4, #0xe4]
    bic r1, r1, #0xc
    str r1, [r4, #0xe4]
    ldr r2, [r0, #0xc]
    ldr r1, [r5, #0x150]
    cmp r2, r1
    bge .L_021778d4
    ldr r1, [r8, #0x10]
    ldr r1, [r1, #0x78]
    tst r1, #0x8
    ldreq r1, [r4, #0xe4]
    orreq r1, r1, #0x4
    streq r1, [r4, #0xe4]
.L_021778d4:
    ldr r2, [r5, #0x150]
    ldr r1, [r5, #0x158]
    ldr r3, [r0, #0xc]
    add r0, r2, r1
    cmp r3, r0
    ble .L_02177904
    ldr r0, [r8, #0x10]
    ldr r0, [r0, #0x78]
    tst r0, #0x4
    ldreq r0, [r4, #0xe4]
    orreq r0, r0, #0x8
    streq r0, [r4, #0xe4]
.L_02177904:
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_0217718c
    bl func_ov011_021771a0
    mov r10, r0
    ldr r9, [r5, #0x8]
    mov r8, #0x0
    add r11, sp, #0x8
    mov r4, #0xcc
    mov r7, #0x64
    b .L_02177a08
.L_02177938:
    strh r8, [r9, #0x44]
    ldr r2, [r9, #0x40]
    ldr r0, [r2, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    tst r0, #0x1
    ldreqsh r0, [r9, #0x44]
    subeq r0, r0, #0x64
    streqh r0, [r9, #0x44]
    beq .L_02177a04
    add r0, r2, #0xc
    mov r1, r11
    mov r2, #0x10
    bl func_02051890
    ldr r2, [sp, #0x8]
    ldr r1, [r10, #0x0]
    cmp r1, r2
    sublt r0, r2, r1
    blt .L_02177998
    ldr r0, [sp, #0x10]
    add r0, r2, r0
    cmp r0, r1
    sublt r0, r1, r0
    movge r0, #0x0
.L_02177998:
    ldr r3, [sp, #0xc]
    ldr r2, [r10, #0x4]
    cmp r2, r3
    sublt r1, r3, r2
    blt .L_021779c0
    ldr r1, [sp, #0x14]
    add r1, r3, r1
    cmp r1, r2
    sublt r1, r2, r1
    movge r1, #0x0
.L_021779c0:
    add r0, r0, r1
    mov r0, r0, asr #0x8
    cmp r0, #0x400
    movgt r0, #0x400
    rsb r0, r0, #0x400
    mul r1, r0, r7
    ldrsh r2, [r9, #0x44]
    mov r0, r1, lsl #0x6
    add r0, r2, r0, asr #0x10
    strh r0, [r9, #0x44]
    ldr r0, [r9, #0x40]
    ldrsb r0, [r0, #0x1e]
    cmp r0, #0xc
    ldreqsh r0, [r9, #0x44]
    smuleqbb r0, r0, r4
    moveq r0, r0, asr #0x8
    streqh r0, [r9, #0x44]
.L_02177a04:
    ldr r9, [r9, #0x0]
.L_02177a08:
    cmp r9, #0x0
    bne .L_02177938
    add r0, r5, #0x100
    ldrsb r2, [r0, #0x8b]
    ldr r1, .L_02177bf4
    mov r0, r5
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r4, r0
    bl func_ov011_02177c24
    mov r1, #0xa
    bl func_ov011_02177c00
    cmp r0, #0x0
    bne .L_02177b98
    mov r0, r4
    bl func_ov011_0217718c
    mov r7, r0
    mov r0, r4
    bl func_ov011_02176d50
    mov r4, r0
    mov r0, r7
    bl func_020839a8
    cmp r0, #0x0
    beq .L_02177b98
    ldr r1, [r7, #0x10]
    ldrsh r3, [r0, #0x4]
    ldr r2, [r1, #0x5c]
    ldrsh r1, [r0, #0x6]
    ldr r7, [r2, #0xc]
    ldr r0, .L_02177bf0
    ldr r2, [r2, #0x10]
    ldr r0, [r0, #0x0]
    mov r8, r7, asr #0x8
    add r7, r3, #0x10
    add r1, r1, #0x10
    mov r9, r1, lsl #0x10
    mov r2, r2, asr #0x8
    mov r3, r8, lsl #0x10
    mov r7, r7, lsl #0x10
    mov r8, r2, lsl #0x10
    ldr r0, [r0, #0x8]
    ldr r1, .L_02177bf8
    b .L_02177b2c
.L_02177ac4:
    ldrsh r2, [r0, #0x10]
    ldrsh r10, [r0, #0x14]
    rsbs r11, r2, r3, asr #0x10
    rsbmi r11, r11, #0x0
    add r10, r10, r7, asr #0x10
    cmp r11, r10
    bgt .L_02177b28
    ldrsh r10, [r0, #0x12]
    rsbs r11, r10, r8, asr #0x10
    ldrsh r10, [r0, #0x16]
    rsbmi r11, r11, #0x0
    add r10, r10, r9, asr #0x10
    cmp r11, r10
    bgt .L_02177b28
    sub r2, r2, r3, asr #0x10
    mov r2, r2, lsl #0x10
    cmp r1, #0x0
    rsblt r10, r1, #0x0
    mov r2, r2, asr #0x10
    movge r10, r1
    cmp r2, #0x0
    rsblt r11, r2, #0x0
    movge r11, r2
    cmp r11, r10
    movlt r1, r2
.L_02177b28:
    ldr r0, [r0, #0x0]
.L_02177b2c:
    cmp r0, #0x0
    bne .L_02177ac4
    ldr r0, .L_02177bf8
    cmp r1, r0
    beq .L_02177b98
    ldr r0, [r4, #0xe4]
    cmp r1, #0x0
    bic r0, r0, #0xc
    str r0, [r4, #0xe4]
    beq .L_02177b70
    ldr r0, [r4, #0xe8]
    cmp r1, #0x0
    orrgt r0, r0, #0x8
    strgt r0, [r4, #0xe8]
    orrle r0, r0, #0x4
    strle r0, [r4, #0xe8]
    b .L_02177b98
.L_02177b70:
    ldr r0, .L_02177bfc
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    tst r0, #0x1
    ldr r0, [r4, #0xe8]
    orrne r0, r0, #0x8
    strne r0, [r4, #0xe8]
    orreq r0, r0, #0x4
    streq r0, [r4, #0xe8]
.L_02177b98:
    ldr r0, [r5, #0x180]
    tst r0, #0x40
    beq .L_02177be8
    ldr r0, [r5, #0x184]
    subs r0, r0, #0x1
    str r0, [r5, #0x184]
    bpl .L_02177be8
    mov r2, #0x0
    str r2, [r5, #0x184]
    ldr r1, [r5, #0x180]
    mov r0, #0x1
    bic r1, r1, #0x40
    str r1, [r5, #0x180]
    ldrb r1, [r6, #0x105]
    strb r1, [r6, #0x10b]
    strb r0, [r6, #0x105]
    strb r2, [r5, #0x18b]
    ldr r0, [r5, #0x180]
    bic r0, r0, #0x20
    str r0, [r5, #0x180]
.L_02177be8:
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02177bf0: .word data_ov011_02183a38
.L_02177bf4: .word data_ov011_02181864
.L_02177bf8: .word 0x7fff
.L_02177bfc: .word data_020a0da8
    arm_func_end func_ov011_02177444

    .global func_ov011_02177c00
    arm_func_start func_ov011_02177c00
func_ov011_02177c00: ; 0x02177c00
    mov r2, r1, asr #0x5
    add r2, r0, r2, lsl #0x2
    bic r0, r1, #0x1f
    sub r1, r1, r0
    ldr r2, [r2, #0x34]
    mov r0, #0x1
    tst r2, r0, lsl r1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_02177c00

    .global func_ov011_02177c24
    arm_func_start func_ov011_02177c24
func_ov011_02177c24: ; 0x02177c24
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x2c]
    bx lr
    arm_func_end func_ov011_02177c24

    .global func_ov011_02177c34
    arm_func_start func_ov011_02177c34
func_ov011_02177c34: ; 0x02177c34
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xd4]
    mov r0, r0, lsr #0x1c
    bx lr
    arm_func_end func_ov011_02177c34

    .global func_ov011_02177c48
    arm_func_start func_ov011_02177c48
func_ov011_02177c48: ; 0x02177c48
    stmdb sp!, {r3, lr}
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x30]
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02177c48

    .global func_ov011_02177c60
    arm_func_start func_ov011_02177c60
func_ov011_02177c60: ; 0x02177c60
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r0, [r8, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r4, r0
    bl func_ov011_02177c24
    mov r1, #0xa
    bl func_ov011_02177c00
    cmp r0, #0x0
    beq .L_02177ca0
    mov r0, r8
    bl func_ov011_02178f40
    b .L_02178218
.L_02177ca0:
    mov r0, r4
    bl func_ov011_0217718c
    mov r0, r4
    bl func_ov011_02176d50
    ldr r1, [r8, #0x180]
    mov r0, r4
    bic r1, r1, #0x1
    str r1, [r8, #0x180]
    bl func_ov011_02177c34
    mov r5, r0
    mov r0, r4
    bl func_ov011_02177c48
    and r0, r0, #0x7
    cmp r5, r0
    bne .L_02178218
    mov r0, r4
    bl func_ov011_02178224
    cmp r0, #0x0
    beq .L_02178218
    mov r0, r4
    bl func_ov011_02178240
    ldrsb r0, [r0, #0x18]
    cmp r0, #0x17
    beq .L_02178218
    mov r5, #0x0
    b .L_021781fc
.L_02177d08:
    mov r0, r4
    bl func_ov011_0217718c
    ldr r0, [r0, #0x10]
    add r0, r0, r5, lsl #0x1
    ldrsh r7, [r0, #0x90]
    cmp r7, #0x0
    blt .L_021781f8
    add r0, r8, #0x100
    ldrsh r1, [r0, #0x44]
    cmp r7, r1
    bne .L_02177d88
    mvn r1, #0x0
    strh r1, [r0, #0x60]
    ldr r1, [r8, #0x12c]
    ldr r0, .L_02178220
    str r1, [r8, #0x148]
    ldr r2, [r8, #0x130]
    add r1, r8, #0x16c
    str r2, [r8, #0x14c]
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    add r0, r0, #0x3c
    add r4, r0, r7, lsl #0x5
    add r0, r4, #0xc
    bl func_02051890
    ldrsb r2, [r4, #0x1e]
    add r0, r8, #0x100
    mov r1, #0x7
    strb r2, [r8, #0x17e]
    strh r7, [r0, #0x7c]
    strb r1, [r8, #0x18b]
    b .L_02178218
.L_02177d88:
    ldr r9, [r8, #0x0]
    mov r6, #0x0
    mov r5, #0x10
    ldr r4, .L_02178220
    b .L_02177dcc
.L_02177d9c:
    mov r0, r8
    mov r1, r9
    bl func_02037c24
    mov r0, r9
    mov r1, r6
    mov r2, r5
    bl func_020517fc
    ldr r0, [r4, #0x0]
    mov r1, r9
    add r0, r0, #0x20
    bl func_02037b98
    ldr r9, [r8, #0x0]
.L_02177dcc:
    cmp r9, #0x0
    bne .L_02177d9c
    add r3, r8, #0x12c
    ldr r2, [r8, #0x8]
    mov r6, #0x0
    b .L_02177e08
.L_02177de4:
    ldrb r0, [r2, #0x46]
    bic r0, r0, #0xf
    strb r0, [r2, #0x46]
    ldr r0, [r2, #0x40]
    ldrsh r1, [r3, #0x18]
    ldrsh r0, [r0, #0x1c]
    cmp r1, r0
    moveq r6, r2
    ldr r2, [r2, #0x0]
.L_02177e08:
    cmp r2, #0x0
    bne .L_02177de4
    ldr r0, [r6, #0x40]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    cmp r6, #0x0
    mov r0, r0, lsl #0xc
    moveq r1, #0x1
    mov r0, r0, lsr #0xc
    tst r0, #0x1
    moveq r1, #0x1
    cmp r1, #0x0
    beq .L_02177e48
    mov r0, r8
    bl func_ov011_02178f40
    b .L_02178204
.L_02177e48:
    ldr r0, .L_02178220
    ldr r0, [r0, #0x0]
    add r0, r0, #0x20
    bl func_ov011_02178f1c
    mov r1, r0
    mov r0, r8
    str r6, [r1, #0x8]
    bl func_02037b54
    ldrb r2, [r6, #0x46]
    ldr r0, .L_02178220
    mov r1, #0x0
    orr r2, r2, #0x8
    strb r2, [r6, #0x46]
    ldr r0, [r0, #0x0]
    mov r2, #0xc00
    add r0, r0, #0x37c
    add r0, r0, #0x27800
    bl func_020517fc
    mov r5, #0x0
.L_02177e94:
    mov r0, #0x18
    ldr r1, .L_02178220
    mul r2, r5, r0
    ldr r0, [r1, #0x0]
    mov r4, #0x0
    add r0, r0, #0x37c
    add r0, r0, #0x27800
    str r0, [sp, #0x0]
    add r3, r0, r2, lsl #0x3
    sub r0, r4, #0x8000
    str r0, [sp, #0x4]
    mov r10, r4
    ldr r2, [r8, #0x8]
    b .L_02178024
.L_02177ecc:
    ldr r0, [r2, #0x40]
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    tst r0, #0x1
    beq .L_02178020
    ldrb r0, [r2, #0x46]
    tst r0, #0xf
    bne .L_02178020
    mov r9, #0x0
    add ip, r2, #0x8
    b .L_02178018
.L_02177efc:
    cmp r9, #0x1
    bne .L_02177f34
    ldr r0, [r2, #0x40]
    mov r1, #0x1
    ldrsb r11, [r0, #0x1e]
    mov r1, r1, lsl r11
    tst r1, #0x3
    beq .L_02177f34
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    and r0, r0, #0x6
    cmp r0, #0x6
    beq .L_02178008
.L_02177f34:
    ldr r0, [r8, #0x180]
    tst r0, #0x2
    bne .L_02177f48
    cmp r9, #0x5
    bge .L_02178020
.L_02177f48:
    ldr lr, [ip, #0x0]
    b .L_02178000
.L_02177f50:
    cmp r9, #0x2
    ldr r11, [lr, #0x8]
    blt .L_02177f94
    ldr r0, [r2, #0x40]
    ldrsb r1, [r0, #0x1e]
    str r0, [sp, #0x8]
    mov r0, #0x1
    mov r0, r0, lsl r1
    tst r0, #0x3
    beq .L_02177f94
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    and r0, r0, #0x6
    cmp r0, #0x6
    beq .L_02177ffc
.L_02177f94:
    ldr r0, [r11, #0x40]
    ldr r1, [r0, #0x8]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0xc
    tst r1, #0x1
    beq .L_02177ffc
    ldrsh r0, [r0, #0x1c]
    ldr r1, [r6, #0x40]
    ldrsh r1, [r1, #0x1c]
    cmp r0, r1
    bne .L_02177ffc
    ldrsh r1, [r2, #0x44]
    ldr r0, [sp, #0x4]
    add r11, r10, #0x1
    cmp r1, r0
    strgt r1, [sp, #0x4]
    ldrb r1, [r2, #0x46]
    add r0, r3, r10, lsl #0x3
    movgt r4, r2
    orr r1, r1, #0x2
    strb r1, [r2, #0x46]
    mov r1, r11, lsl #0x10
    str r2, [r3, r10, lsl #0x3]
    mov r10, r1, asr #0x10
    ldrsh r1, [r2, #0x44]
    strh r1, [r0, #0x4]
.L_02177ffc:
    ldr lr, [lr, #0x0]
.L_02178000:
    cmp lr, #0x0
    bne .L_02177f50
.L_02178008:
    add r0, r9, #0x1
    mov r0, r0, lsl #0x10
    mov r9, r0, asr #0x10
    add ip, ip, #0x8
.L_02178018:
    cmp r9, #0x7
    blt .L_02177efc
.L_02178020:
    ldr r2, [r2, #0x0]
.L_02178024:
    cmp r2, #0x0
    bne .L_02177ecc
    cmp r4, #0x0
    bne .L_0217814c
    ldr r1, [r8, #0x8]
    b .L_02178050
.L_0217803c:
    ldrb r0, [r1, #0x46]
    tst r0, #0x2
    bicne r0, r0, #0x2
    strneb r0, [r1, #0x46]
    ldr r1, [r1, #0x0]
.L_02178050:
    cmp r1, #0x0
    bne .L_0217803c
    ldrb r0, [r6, #0x46]
    mov r9, #0x8000
    rsb r9, r9, #0x0
    orr r0, r0, #0x4
    strb r0, [r6, #0x46]
    mov r11, #0x18
    ldr r6, .L_02178220
    b .L_0217813c
.L_02178078:
    mul r1, r5, r11
    ldr r0, [sp, #0x0]
    mov r2, r9
    mov r3, #0x0
    add r1, r0, r1, lsl #0x3
    b .L_021780c8
.L_02178090:
    ldr r0, [r1, r3, lsl #0x3]
    cmp r0, #0x0
    beq .L_021780d0
    ldrb r10, [r0, #0x46]
    tst r10, #0x4
    bne .L_021780bc
    add r10, r1, r3, lsl #0x3
    ldrsh r10, [r10, #0x4]
    cmp r10, r2
    movgt r4, r0
    movgt r2, r10
.L_021780bc:
    add r0, r3, #0x1
    mov r0, r0, lsl #0x10
    mov r3, r0, asr #0x10
.L_021780c8:
    cmp r3, #0x18
    blt .L_02178090
.L_021780d0:
    ldr r10, [r8, #0x0]
    mov r0, r8
    mov r1, r10
    bl func_02037c24
    mov r0, r10
    mov r1, #0x0
    mov r2, #0x10
    bl func_020517fc
    ldr r0, [r6, #0x0]
    mov r1, r10
    add r0, r0, #0x20
    bl func_02037b98
    cmp r4, #0x0
    beq .L_0217813c
    ldr r0, .L_02178220
    ldr r0, [r0, #0x0]
    add r0, r0, #0x20
    bl func_ov011_02178f1c
    mov r1, r0
    mov r0, r8
    str r4, [r1, #0x8]
    bl func_02037b54
    ldrb r0, [r4, #0x46]
    orr r0, r0, #0x8
    bic r0, r0, #0x1
    strb r0, [r4, #0x46]
    b .L_021781a8
.L_0217813c:
    subs r5, r5, #0x1
    bpl .L_02178078
    mov r4, #0x0
    b .L_021781a8
.L_0217814c:
    ldr r2, [r8, #0x8]
    b .L_02178170
.L_02178154:
    ldrb r0, [r2, #0x46]
    tst r0, #0x2
    orrne r1, r0, #0x1
    andne r0, r1, #0xff
    bicne r0, r0, #0x2
    strneb r0, [r2, #0x46]
    ldr r2, [r2, #0x0]
.L_02178170:
    cmp r2, #0x0
    bne .L_02178154
    ldr r0, .L_02178220
    ldr r0, [r0, #0x0]
    add r0, r0, #0x20
    bl func_ov011_02178f1c
    mov r1, r0
    mov r0, r8
    str r4, [r1, #0x8]
    bl func_02037b54
    ldrb r0, [r4, #0x46]
    orr r0, r0, #0x8
    bic r0, r0, #0x1
    strb r0, [r4, #0x46]
.L_021781a8:
    cmp r4, #0x0
    ldrne r0, [r4, #0x40]
    mov r6, r4
    ldrnesh r0, [r0, #0x1c]
    cmpne r0, r7
    beq .L_021781d8
    add r5, r5, #0x1
    cmp r5, #0x10
    blt .L_02177e94
    mov r0, r8
    bl func_ov011_02178f40
    b .L_02178204
.L_021781d8:
    cmp r4, #0x0
    bne .L_02178204
    ldr r1, [r8, #0x180]
    mov r0, r8
    orr r1, r1, #0x80
    str r1, [r8, #0x180]
    bl func_ov011_02178f40
    b .L_02178204
.L_021781f8:
    add r5, r5, #0x1
.L_021781fc:
    cmp r5, #0x2
    blt .L_02177d08
.L_02178204:
    add r0, r8, #0x100
    mvn r1, #0x0
    strh r1, [r0, #0x60]
    mov r0, #0x2
    strb r0, [r8, #0x18b]
.L_02178218:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02178220: .word data_ov011_02183a38
    arm_func_end func_ov011_02177c60

    .global func_ov011_02178224
    arm_func_start func_ov011_02178224
func_ov011_02178224: ; 0x02178224
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xd4]
    tst r0, #0x2
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_02178224

    .global func_ov011_02178240
    arm_func_start func_ov011_02178240
func_ov011_02178240: ; 0x02178240
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x20]
    bx lr
    arm_func_end func_ov011_02178240

    .global func_ov011_02178250
    arm_func_start func_ov011_02178250
func_ov011_02178250: ; 0x02178250
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, r0
    ldr r2, [r4, #0x0]
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [r2, #0x0]
    ldr r6, [r2, #0x8]
    cmp r1, #0x0
    bne .L_0217827c
    bl func_ov011_02178f40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217827c:
    ldr r0, [r4, #0x10]
    ldr r7, [r1, #0x8]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    str r0, [sp, #0x0]
    bl func_ov011_0217718c
    ldr r1, [r0, #0x10]
    ldr r0, [sp, #0x0]
    ldr r5, [r1, #0x5c]
    bl func_ov011_02178240
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r8, #0x0
    mov r3, r8
    add r2, r6, #0x8
    mov r0, #0x1
    b .L_021782fc
.L_021782c8:
    ldr r9, [r2, #0x0]
    b .L_021782e4
.L_021782d0:
    ldr r1, [r9, #0x8]
    cmp r7, r1
    moveq r8, r0
    beq .L_021782ec
    ldr r9, [r9, #0x0]
.L_021782e4:
    cmp r9, #0x0
    bne .L_021782d0
.L_021782ec:
    cmp r8, #0x0
    bne .L_02178304
    add r3, r3, #0x1
    add r2, r2, #0x8
.L_021782fc:
    cmp r3, #0x7
    blt .L_021782c8
.L_02178304:
    strb r3, [r4, #0x18a]
    add r0, r4, #0x100
    mov r1, #0x0
    strh r1, [r0, #0x88]
    strb r1, [r4, #0x18c]
    ldr r3, [r7, #0x40]
    ldr r6, [r6, #0x40]
    add r7, r4, #0x148
    ldrsh r2, [r3, #0x1c]
    add r0, r3, #0xc
    add r1, r7, #0x8
    strh r2, [r7, #0x18]
    ldrsb r3, [r3, #0x1e]
    mov r2, #0x10
    strb r3, [r7, #0x1a]
    bl func_02051890
    add r8, r4, #0x164
    ldrsh r2, [r6, #0x1c]
    add r0, r6, #0xc
    add r1, r8, #0x8
    strh r2, [r8, #0x18]
    ldrsb r3, [r6, #0x1e]
    mov r2, #0x10
    strb r3, [r8, #0x1a]
    bl func_02051890
    ldr r1, [r7, #0x8]
    ldr r2, [r8, #0x8]
    cmp r2, r1
    blt .L_02178388
    ldr r0, [r7, #0x10]
    add r0, r1, r0
    cmp r2, r0
    ble .L_021783d0
.L_02178388:
    ldr r0, [r8, #0x10]
    add r3, r2, r0
    cmp r3, r1
    blt .L_021783a8
    ldr r0, [r7, #0x10]
    add r0, r1, r0
    cmp r3, r0
    ble .L_021783d0
.L_021783a8:
    cmp r1, r2
    blt .L_021783b8
    cmp r1, r3
    ble .L_021783d0
.L_021783b8:
    ldr r0, [r7, #0x10]
    add r0, r1, r0
    cmp r0, r2
    blt .L_021785cc
    cmp r0, r3
    bgt .L_021785cc
.L_021783d0:
    ldr r0, .L_0217875c
    add lr, r4, #0x164
    add ip, r4, #0x148
    ldr r0, [r0, #0x0]
    ldrsh r3, [lr, #0x18]
    add r8, r0, #0x3c
    ldrsh r2, [ip, #0x18]
    ldr r6, [lr, #0x8]
    ldr r7, [ip, #0x8]
    ldr r1, [lr, #0x10]
    add r11, r8, r2, lsl #0x5
    ldr r0, [ip, #0x10]
    add r2, r6, r1
    add r1, r7, r0
    cmp r6, r7
    add r3, r8, r3, lsl #0x5
    movgt r8, r6
    movle r8, r7
    cmp r2, r1
    movgt r9, r1
    ldr r0, [r5, #0xc]
    sub r10, r8, #0x400
    movle r9, r2
    cmp r0, r10
    blt .L_021785a8
    add r10, r9, #0x400
    cmp r0, r10
    bgt .L_021785a8
    add r8, r4, #0x100
    ldrsb r8, [r8, #0x8a]
    cmp r8, #0x1
    bne .L_021784d8
    ldrsb r0, [lr, #0x1a]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_021784cc
    ldr r0, [r5, #0x10]
    str r0, [ip, #0x4]
    ldr r0, [r3, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    tst r0, #0x2
    addne r0, r2, #0x1000
    strne r0, [ip, #0x0]
    bne .L_021784c0
    tst r0, #0x4
    subne r0, r6, #0x1000
    strne r0, [ip, #0x0]
    bne .L_021784c0
    ldr r0, [r5, #0xc]
    sub r1, r0, r6
    sub r0, r2, r0
    cmp r1, r0
    addgt r0, r2, #0x1000
    strgt r0, [ip, #0x0]
    suble r0, r6, #0x1000
    strle r0, [ip, #0x0]
.L_021784c0:
    mov r0, #0x7
    strb r0, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021784cc:
    mov r0, #0x3
    strb r0, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021784d8:
    ldrsb r5, [ip, #0x1a]
    sub r5, r5, #0x1
    mov r5, r5, lsl #0x18
    mov r5, r5, asr #0x18
    and r5, r5, #0xff
    cmp r5, #0x1
    bhi .L_0217857c
    ldr r3, [r3, #0x8]
    mov r3, r3, lsl #0xc
    mov r5, r3, lsr #0xc
    tst r5, #0x2
    bne .L_02178524
    ldr r3, [r11, #0x8]
    mov r3, r3, lsl #0xc
    mov r3, r3, lsr #0xc
    tst r3, #0x2
    beq .L_02178524
    cmp r6, r7
    bge .L_02178530
.L_02178524:
    sub r0, r7, #0x1000
    str r0, [ip, #0x0]
    b .L_02178570
.L_02178530:
    tst r5, #0x4
    bne .L_02178548
    tst r3, #0x4
    beq .L_02178548
    cmp r2, r1
    ble .L_02178554
.L_02178548:
    add r0, r1, #0x1000
    str r0, [ip, #0x0]
    b .L_02178570
.L_02178554:
    sub r2, r0, r7
    sub r0, r1, r0
    cmp r2, r0
    addgt r0, r1, #0x1000
    strgt r0, [ip, #0x0]
    suble r0, r7, #0x1000
    strle r0, [ip, #0x0]
.L_02178570:
    mov r0, #0x7
    strb r0, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217857c:
    ldr r0, [sp, #0x0]
    bl func_ov011_02177c24
    mov r1, #0xb
    bl func_ov011_02177c00
    cmp r0, #0x0
    moveq r0, #0x4
    streqb r0, [r4, #0x18b]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, r4
    bl func_ov011_02178f40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021785a8:
    ldr r0, [r5, #0x10]
    str r0, [ip, #0x4]
    ldr r0, [r5, #0xc]
    cmp r0, r8
    strlt r8, [ip, #0x0]
    strge r9, [ip, #0x0]
    mov r0, #0x7
    strb r0, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021785cc:
    ldr r1, .L_0217875c
    add r6, r4, #0x164
    add r0, r4, #0x100
    ldr r1, [r1, #0x0]
    ldrsb r7, [r0, #0x8a]
    ldrsh r3, [r6, #0x18]
    add r9, r1, #0x3c
    ldr r2, [r6, #0x8]
    ldr r1, [r6, #0x10]
    ldr r8, [r4, #0x150]
    ldr r0, [r4, #0x158]
    cmp r7, #0x0
    add r3, r9, r3, lsl #0x5
    add r1, r2, r1
    add r0, r8, r0
    bne .L_0217862c
    ldr r3, [r5, #0x10]
    cmp r2, r0
    str r3, [r4, #0x14c]
    subgt r0, r2, #0x1000
    strgt r0, [r4, #0x148]
    addle r0, r1, #0x1000
    strle r0, [r4, #0x148]
    b .L_021786d4
.L_0217862c:
    cmp r7, #0x1
    bne .L_021786c0
    ldrsb r6, [r6, #0x1a]
    sub r6, r6, #0x1
    mov r6, r6, lsl #0x18
    mov r6, r6, asr #0x18
    and r6, r6, #0xff
    cmp r6, #0x1
    bhi .L_021786a8
    ldr r0, [r5, #0x10]
    str r0, [r4, #0x14c]
    ldr r0, [r3, #0x8]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0xc
    ands r0, r0, #0x2
    addne r0, r1, #0x1000
    strne r0, [r4, #0x148]
    bne .L_021786d4
    cmp r0, #0x0
    subne r0, r2, #0x1000
    strne r0, [r4, #0x148]
    bne .L_021786d4
    ldr r0, [r5, #0xc]
    sub r3, r0, r2
    sub r0, r1, r0
    cmp r3, r0
    addgt r0, r1, #0x1000
    strgt r0, [r4, #0x148]
    suble r0, r2, #0x1000
    strle r0, [r4, #0x148]
    b .L_021786d4
.L_021786a8:
    cmp r2, r0
    addgt r0, r2, #0x1000
    strgt r0, [r4, #0x148]
    suble r0, r1, #0x1000
    strle r0, [r4, #0x148]
    b .L_021786d4
.L_021786c0:
    cmp r2, r0
    addgt r0, r2, #0x1000
    strgt r0, [r4, #0x148]
    suble r0, r1, #0x1000
    strle r0, [r4, #0x148]
.L_021786d4:
    mov r0, #0x7
    strb r0, [r4, #0x18b]
    add r0, r4, #0x100
    ldrsb r2, [r0, #0x8a]
    ldr r1, [r5, #0xc]
    ldr r0, [r4, #0x148]
    cmp r2, #0x1
    sub r0, r1, r0
    bne .L_02178710
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    cmp r0, #0x400
    movlt r0, #0x3
    strltb r0, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02178710:
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    cmp r0, #0x1800
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r2, #0x0
    moveq r0, #0x1
    streqb r0, [r4, #0x18b]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [sp, #0x0]
    bl func_ov011_02177c24
    mov r1, #0xb
    bl func_ov011_02177c00
    cmp r0, #0x0
    moveq r0, #0x4
    streqb r0, [r4, #0x18b]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, r4
    bl func_ov011_02178f40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217875c: .word data_ov011_02183a38
    arm_func_end func_ov011_02178250

    .global func_ov011_02178760
    arm_func_start func_ov011_02178760
func_ov011_02178760: ; 0x02178760
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r6, r0
    bl func_ov011_0217718c
    mov r0, r6
    bl func_ov011_02176d50
    mov r4, r0
    mov r0, r6
    bl func_ov011_02178240
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_ov011_02178224
    cmp r0, #0x0
    add r0, r5, #0x100
    ldrh r2, [r0, #0x88]
    beq .L_02178804
    cmp r2, #0x0
    beq .L_021787e8
    add r1, r2, #0x1
    strh r1, [r0, #0x88]
    cmp r2, #0x8
    ldmlsia sp!, {r4, r5, r6, pc}
    ldr r2, [r4, #0xe4]
    mov r1, #0x10
    orr r2, r2, #0x10
    str r2, [r4, #0xe4]
    strh r1, [r0, #0x88]
    ldmia sp!, {r4, r5, r6, pc}
.L_021787e8:
    ldr r1, [r4, #0xe4]
    orr r1, r1, #0x2
    str r1, [r4, #0xe4]
    ldrh r1, [r0, #0x88]
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
    ldmia sp!, {r4, r5, r6, pc}
.L_02178804:
    cmp r2, #0x10
    bne .L_02178828
    ldr r1, [r4, #0xe4]
    bic r1, r1, #0x12
    str r1, [r4, #0xe4]
    ldrh r1, [r0, #0x88]
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
    ldmia sp!, {r4, r5, r6, pc}
.L_02178828:
    cmp r2, #0x11
    bne .L_02178868
    mov r0, r6
    bl func_ov011_02177c24
    mov r1, #0x21
    bl func_ov011_02179130
    cmp r0, #0x0
    add r0, r5, #0x100
    ldrneh r1, [r0, #0x88]
    addne r1, r1, #0x1
    strneh r1, [r0, #0x88]
    moveq r1, #0x0
    streqh r1, [r0, #0x88]
    moveq r0, #0x1
    streqb r0, [r5, #0x18b]
    ldmia sp!, {r4, r5, r6, pc}
.L_02178868:
    add r1, r2, #0x1
    strh r1, [r0, #0x88]
    cmp r2, #0x1e
    bne .L_02178898
    ldr r2, [r4, #0xe4]
    mov r1, #0x0
    bic r2, r2, #0x12
    str r2, [r4, #0xe4]
    strh r1, [r0, #0x88]
    mov r0, #0x1
    strb r0, [r5, #0x18b]
    ldmia sp!, {r4, r5, r6, pc}
.L_02178898:
    ldrh r0, [r0, #0x88]
    cmp r0, #0x14
    ldrhs r0, [r4, #0xe4]
    orrhs r0, r0, #0x2
    strhs r0, [r4, #0xe4]
    add r0, r5, #0x100
    ldrh r0, [r0, #0x88]
    cmp r0, #0x1a
    ldrhs r0, [r4, #0xe4]
    orrhs r0, r0, #0x10
    strhs r0, [r4, #0xe4]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_02178760

    .global func_ov011_021788c8
    arm_func_start func_ov011_021788c8
func_ov011_021788c8: ; 0x021788c8
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r6, r0
    bl func_ov011_0217718c
    mov r0, r6
    bl func_ov011_02176d50
    mov r4, r0
    mov r0, r6
    bl func_ov011_02178240
    ldrb r0, [r0, #0x1ec]
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrb r0, [r5, #0x18c]
    cmp r0, #0x2
    bls .L_0217893c
    mov r0, r6
    bl func_ov011_02178224
    cmp r0, #0x0
    beq .L_0217893c
    mov r0, #0x1
    strb r0, [r5, #0x18b]
    ldr r0, [r4, #0xe4]
    bic r0, r0, #0x10
    str r0, [r4, #0xe4]
    ldmia sp!, {r4, r5, r6, pc}
.L_0217893c:
    ldrb r0, [r5, #0x18c]
    cmp r0, #0x11
    addls pc, pc, r0, lsl #0x2
    b .L_02178b5c
.L_0217894c: ; jump table
    b .L_02178994 ; case 0
    b .L_021789c0 ; case 1
    b .L_021789fc ; case 2
    b .L_02178a74 ; case 3
    b .L_02178a74 ; case 4
    b .L_02178a74 ; case 5
    b .L_02178a74 ; case 6
    b .L_02178a74 ; case 7
    b .L_02178a74 ; case 8
    b .L_02178a80 ; case 9
    b .L_02178ac0 ; case 10
    b .L_02178b30 ; case 11
    b .L_02178b30 ; case 12
    b .L_02178b30 ; case 13
    b .L_02178b30 ; case 14
    b .L_02178b30 ; case 15
    b .L_02178b30 ; case 16
    b .L_02178b3c ; case 17
.L_02178994:
    ldr r0, [r4, #0xe4]
    orr r0, r0, #0x10
    bic r0, r0, #0xc
    str r0, [r4, #0xe4]
    ldr r0, [r5, #0x180]
    orr r0, r0, #0x1
    str r0, [r5, #0x180]
    ldrb r0, [r5, #0x18c]
    add r0, r0, #0x1
    strb r0, [r5, #0x18c]
    b .L_02178b5c
.L_021789c0:
    add r0, r5, #0x100
    ldrh r1, [r0, #0x88]
    cmp r1, #0x8
    bls .L_02178b5c
    ldr r1, [r4, #0xe4]
    bic r1, r1, #0x10
    str r1, [r4, #0xe4]
    ldrb r1, [r5, #0x18c]
    add r1, r1, #0x1
    strb r1, [r5, #0x18c]
    ldrsb r0, [r0, #0x8a]
    cmp r0, #0x2
    moveq r0, #0x1
    streqb r0, [r5, #0x18b]
    b .L_02178b5c
.L_021789fc:
    add r0, r5, #0x100
    ldrsb r1, [r0, #0x8a]
    cmp r1, #0x3
    cmpne r1, #0x5
    bne .L_02178a44
    add r0, r5, #0x100
    ldr r1, [r5, #0x70]
    ldrh r2, [r0, #0x88]
    sub r0, r1, #0x4
    cmp r2, r0
    ble .L_02178b5c
    ldr r0, [r4, #0xe4]
    orr r0, r0, #0x10
    str r0, [r4, #0xe4]
    ldrb r0, [r5, #0x18c]
    add r0, r0, #0x1
    strb r0, [r5, #0x18c]
    b .L_02178b5c
.L_02178a44:
    ldr r1, [r5, #0x6c]
    ldrh r2, [r0, #0x88]
    sub r0, r1, #0x2
    cmp r2, r0
    ble .L_02178b5c
    ldr r0, [r4, #0xe4]
    orr r0, r0, #0x10
    str r0, [r4, #0xe4]
    ldrb r0, [r5, #0x18c]
    add r0, r0, #0x1
    strb r0, [r5, #0x18c]
    b .L_02178b5c
.L_02178a74:
    add r0, r0, #0x1
    strb r0, [r5, #0x18c]
    b .L_02178b5c
.L_02178a80:
    ldr r1, [r4, #0xe4]
    add r0, r5, #0x100
    bic r1, r1, #0x10
    str r1, [r4, #0xe4]
    ldrb r1, [r5, #0x18c]
    add r1, r1, #0x1
    strb r1, [r5, #0x18c]
    ldrsb r0, [r0, #0x8a]
    sub r0, r0, #0x3
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    and r0, r0, #0xff
    cmp r0, #0x1
    movls r0, #0x1
    strlsb r0, [r5, #0x18b]
    b .L_02178b5c
.L_02178ac0:
    add r0, r5, #0x100
    ldrsb r1, [r0, #0x8a]
    cmp r1, #0x5
    bne .L_02178b00
    ldr r1, [r5, #0x98]
    ldrh r2, [r0, #0x88]
    sub r0, r1, #0x4
    cmp r2, r0
    ble .L_02178b5c
    ldr r0, [r4, #0xe4]
    orr r0, r0, #0x10
    str r0, [r4, #0xe4]
    ldrb r0, [r5, #0x18c]
    add r0, r0, #0x1
    strb r0, [r5, #0x18c]
    b .L_02178b5c
.L_02178b00:
    ldr r1, [r5, #0xbc]
    ldrh r2, [r0, #0x88]
    sub r0, r1, #0x2
    cmp r2, r0
    ble .L_02178b5c
    ldr r0, [r4, #0xe4]
    orr r0, r0, #0x10
    str r0, [r4, #0xe4]
    ldrb r0, [r5, #0x18c]
    add r0, r0, #0x1
    strb r0, [r5, #0x18c]
    b .L_02178b5c
.L_02178b30:
    add r0, r0, #0x1
    strb r0, [r5, #0x18c]
    b .L_02178b5c
.L_02178b3c:
    ldr r1, [r4, #0xe4]
    mov r0, #0x1
    bic r1, r1, #0x10
    str r1, [r4, #0xe4]
    ldrb r1, [r5, #0x18c]
    add r1, r1, #0x1
    strb r1, [r5, #0x18c]
    strb r0, [r5, #0x18b]
.L_02178b5c:
    add r0, r5, #0x100
    ldrh r1, [r0, #0x88]
    add r1, r1, #0x1
    strh r1, [r0, #0x88]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_021788c8

    .global func_ov011_02178b70
    arm_func_start func_ov011_02178b70
func_ov011_02178b70: ; 0x02178b70
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, #0x1
    ldr r7, .L_02178bcc
    mov r6, r0
    mov r5, r1
    mov r9, #0x0
    mov r4, r8
    ldr r0, [r6, #0x70]
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0x18]
    tst r5, r0
    movne r0, r4
    bne .L_02178bb4
    ldr r0, [r6, #0x12c]
    tst r5, r0
    movne r0, r9
    moveq r0, r8
.L_02178bb4:
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r7, #0x0]
    blx r0
    b #-0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02178bcc: .word data_020a0e18
    arm_func_end func_ov011_02178b70

    .global func_ov011_02178bd0
    arm_func_start func_ov011_02178bd0
func_ov011_02178bd0: ; 0x02178bd0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r9, r0
    ldr r0, [r9, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r5, r0
    bl func_ov011_0217718c
    mov r6, r0
    mov r0, r5
    bl func_ov011_02176d50
    mov r7, r0
    ldr r1, [r6, #0x10]
    ldr r0, [r7, #0xe4]
    ldr r4, [r1, #0x5c]
    bic r0, r0, #0xc
    str r0, [r7, #0xe4]
    ldr r1, [r4, #0xc]
    ldr r0, [r9, #0x148]
    mov r2, #0x0
    subs r1, r1, r0
    rsbmi r0, r1, #0x0
    movpl r0, r1
    cmp r0, #0x180
    movlt r2, #0x1
    cmp r2, #0x0
    beq .L_02178c60
    add r0, r9, #0x100
    ldrsh r0, [r0, #0x60]
    cmp r0, #0x0
    movge r0, #0x1
    strgeb r0, [r9, #0x18b]
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    mov r0, r9
    bl func_ov011_02178f40
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02178c60:
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    mov r8, #0x0
    cmp r1, #0x8000
    ble .L_02178cc0
    mov r0, r5
    bl func_ov011_02177c24
    mov r1, #0xc
    mov r10, r0
    bl func_ov011_02177c00
    cmp r0, #0x0
    bne .L_02178cc0
    mov r0, r10
    bl func_ov011_02179358
    cmp r0, #0x0
    beq .L_02178cc0
    mov r0, r5
    bl func_ov011_02178240
    bl func_ov006_0215da74
    cmp r0, #0x0
    ldreqb r0, [r9, #0x18f]
    cmpeq r0, #0x0
    moveq r8, #0x1
    streqb r8, [r9, #0x18f]
.L_02178cc0:
    ldr r1, [r4, #0xc]
    ldr r0, [r9, #0x148]
    cmp r1, r0
    ldr r0, [r6, #0x10]
    ldr r0, [r0, #0x78]
    ble .L_02178d5c
    tst r0, #0x4
    addne r0, r1, #0x800
    strne r0, [r9, #0x148]
    cmp r8, #0x0
    beq .L_02178d40
    ldrb r0, [r9, #0x18f]
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_02178d0c
    add r0, r0, #0xfa
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_02178d18
.L_02178d0c:
    ldr r0, [r7, #0xe4]
    orr r0, r0, #0x8
    str r0, [r7, #0xe4]
.L_02178d18:
    ldrb r1, [r9, #0x18f]
    mov r0, r5
    add r1, r1, #0x1
    strb r1, [r9, #0x18f]
    bl func_ov011_02178240
    bl func_ov006_0215da74
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r9, #0x18f]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02178d40:
    mov r0, r7
    mov r1, #0x8
    bl func_ov011_02178b70
    ldr r0, [r7, #0xe4]
    orr r0, r0, #0x8
    str r0, [r7, #0xe4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02178d5c:
    tst r0, #0x8
    subne r0, r1, #0x800
    strne r0, [r9, #0x148]
    cmp r8, #0x0
    beq .L_02178dc4
    ldrb r0, [r9, #0x18f]
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_02178d90
    add r0, r0, #0xfa
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_02178d9c
.L_02178d90:
    ldr r0, [r7, #0xe4]
    orr r0, r0, #0x4
    str r0, [r7, #0xe4]
.L_02178d9c:
    ldrb r1, [r9, #0x18f]
    mov r0, r5
    add r1, r1, #0x1
    strb r1, [r9, #0x18f]
    bl func_ov011_02178240
    bl func_ov006_0215da74
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r9, #0x18f]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_02178dc4:
    mov r0, r7
    mov r1, #0x4
    bl func_ov011_02178b70
    ldr r0, [r7, #0xe4]
    orr r0, r0, #0x4
    str r0, [r7, #0xe4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    arm_func_end func_ov011_02178bd0

    .global func_ov011_02178de0
    arm_func_start func_ov011_02178de0
func_ov011_02178de0: ; 0x02178de0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r0, [r4, #0x10]
    bl func_ov011_02175628
    bl func_ov011_02175628
    bl func_ov011_02175628
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r7, [r1, #0x10]
    bl func_ov011_0217718c
    mov r6, r0
    mov r0, r5
    bl func_ov011_02176d50
    ldr r2, [r7, #0x20]
    ldrb r1, [r2, #0x1ec]
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r5, [r7, #0xd4]
    tst r5, #0x2
    ldrneb r1, [r2, #0xdb]
    cmpne r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x10]
    add r2, r4, #0x100
    ldr r1, [r1, #0x5c]
    ldrh r3, [r2, #0x88]
    ldr ip, [r4, #0x12c]
    ldr r1, [r1, #0xc]
    cmp r3, #0x0
    sub r1, ip, r1
    beq .L_02178e88
    add r1, r3, #0x1
    strh r1, [r2, #0x88]
    cmp r3, #0x2
    ldmloia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, [r0, #0xe4]
    mov r1, #0x0
    bic r3, r3, #0xc
    str r3, [r0, #0xe4]
    strh r1, [r2, #0x88]
    strb r1, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02178e88:
    tst r5, #0x80
    beq .L_02178ed4
    cmp r1, #0x0
    ble .L_02178ebc
    ldr r3, [r0, #0x12c]
    tst r3, #0x4
    bne .L_02178ebc
    ldr r3, [r0, #0xe4]
    orr r3, r3, #0x4
    str r3, [r0, #0xe4]
    ldrh r0, [r2, #0x88]
    add r0, r0, #0x1
    strh r0, [r2, #0x88]
.L_02178ebc:
    cmp r1, #0x0
    addle r0, r4, #0x100
    movle r1, #0x0
    strleh r1, [r0, #0x88]
    strleb r1, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02178ed4:
    cmp r1, #0x0
    bge .L_02178f00
    ldr r3, [r0, #0x12c]
    tst r3, #0x8
    bne .L_02178f00
    ldr r3, [r0, #0xe4]
    orr r3, r3, #0x8
    str r3, [r0, #0xe4]
    ldrh r0, [r2, #0x88]
    add r0, r0, #0x1
    strh r0, [r2, #0x88]
.L_02178f00:
    cmp r1, #0x0
    addge r0, r4, #0x100
    movge r1, #0x0
    strgeh r1, [r0, #0x88]
    strgeb r1, [r4, #0x18b]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov011_02178de0

    .global func_ov011_02178f18
    arm_func_start func_ov011_02178f18
func_ov011_02178f18: ; 0x02178f18
    bx lr
    arm_func_end func_ov011_02178f18

    .global func_ov011_02178f1c
    arm_func_start func_ov011_02178f1c
func_ov011_02178f1c: ; 0x02178f1c
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x0]
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, r4
    bl func_02037c24
    mov r0, r4
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02178f1c

    .global func_ov011_02178f40
    arm_func_start func_ov011_02178f40
func_ov011_02178f40: ; 0x02178f40
    mov r1, #0x0
    strb r1, [r0, #0x18b]
    ldr r1, [r0, #0x180]
    orr r1, r1, #0x4
    bic r1, r1, #0x20
    str r1, [r0, #0x180]
    bx lr
    arm_func_end func_ov011_02178f40

    .global func_ov011_02178f5c
    arm_func_start func_ov011_02178f5c
func_ov011_02178f5c: ; 0x02178f5c
    stmdb sp!, {r3, lr}
    mov r2, #0x0
    str r2, [r0, #0x0]
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    str r2, [r0, #0x14]
    str r2, [r0, #0x18]
    str r2, [r0, #0x1c]
    str r2, [r0, #0x20]
    str r2, [r0, #0x24]
    str r2, [r0, #0x28]
    str r2, [r0, #0x2c]
    str r2, [r0, #0x30]
    add r1, r0, #0x23c
    add ip, r1, #0x400
    str r2, [r0, #0x34]
    add r1, r1, #0xdc00
    mov r3, r2
.L_02178fac:
    add lr, ip, #0x8
    add r2, ip, #0x40
.L_02178fb4:
    str r3, [lr, #0x0]
    str r3, [lr, #0x4]
    add lr, lr, #0x8
    cmp lr, r2
    blo .L_02178fb4
    add ip, ip, #0x48
    cmp ip, r1
    blo .L_02178fac
    add r1, r0, #0x37c
    add r3, r1, #0xec00
    add r1, r1, #0x27800
    mov r2, #0x0
.L_02178fe4:
    str r2, [r3, #0x8]
    add r3, r3, #0xc
    cmp r3, r1
    blo .L_02178fe4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_02178f5c

    .global func_ov011_02178ff8
    arm_func_start func_ov011_02178ff8
func_ov011_02178ff8: ; 0x02178ff8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r1
    mov r6, r2
    mov r8, r0
    ldr r1, .L_021790ec
    ldr r2, .L_021790f0
    mov r0, #0x68
    mov r3, #0x7e
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x68
    mov r5, r0
    bl func_020517fc
    bl func_02020d90
    mov r4, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x90000
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_021790f4
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    cmp r8, #0x0
    ldr r0, [r4, #0x4]
    bne .L_021790a8
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_021790b8
.L_021790a8:
    ldr r2, [r0, #0x0]
    ldr r1, [r8, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_021790b8:
    mov r0, r5
    mov r1, r7
    mov r2, r6
    str r4, [r5, #0x30]
    bl func_ov011_02179648
    ldr r0, .L_021790f8
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    str r0, [r5, #0x38]
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_021790ec: .word data_ov011_0218195c
.L_021790f0: .word data_ov011_021818f4
.L_021790f4: .word func_ov011_02179694
.L_021790f8: .word data_020a0da8
    arm_func_end func_ov011_02178ff8

    .global func_ov011_021790fc
    arm_func_start func_ov011_021790fc
func_ov011_021790fc: ; 0x021790fc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    beq .L_02179124
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x30]
.L_02179124:
    mov r0, r4
    bl func_0201b244
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_021790fc

    .global func_ov011_02179130
    arm_func_start func_ov011_02179130
func_ov011_02179130: ; 0x02179130
    cmp r1, #0x1b
    ble .L_02179198
    sub ip, r1, #0x1b
    add r2, r0, ip, lsl #0x1
    ldrsh r2, [r2, #0x3c]
    cmp r2, #0x0
    movne r0, #0x0
    bxne lr
    ldrb r3, [r0, r1]
    cmp r3, #0x8
    movhs r1, #0x1
    bhs .L_0217917c
    ldr r1, .L_021791a0
    ldr r2, [r0, #0x38]
    ldr r1, [r1, r3, lsl #0x2]
    and r2, r2, #0xff
    cmp r2, r1
    movls r1, #0x1
    movhi r1, #0x0
.L_0217917c:
    cmp r1, #0x0
    movne r0, #0x1
    addeq r0, r0, ip, lsl #0x1
    moveq r1, #0x1e
    streqh r1, [r0, #0x3c]
    moveq r0, #0x0
    bx lr
.L_02179198:
    mov r0, #0x0
    bx lr
.L_021791a0: .word data_ov011_0218190c
    arm_func_end func_ov011_02179130

    .global func_ov011_021791a4
    arm_func_start func_ov011_021791a4
func_ov011_021791a4: ; 0x021791a4
    stmdb sp!, {r4, lr}
    mov lr, #0x0
    mov r4, lr
    ldrsh ip, [r0, #0x8]
    ldr r2, .L_02179204
    b .L_021791dc
.L_021791bc:
    rsb r3, r4, #0x7
    mov r1, r3, lsl #0x1
    ldrsh r1, [r2, r1]
    cmp ip, r1
    andge lr, r3, #0xff
    bge .L_021791e4
    add r1, r4, #0x1
    and r4, r1, #0xff
.L_021791dc:
    cmp r4, #0x8
    blo .L_021791bc
.L_021791e4:
    ldr r1, .L_02179208
    ldr r2, [r0, #0x38]
    ldrb r0, [r1, lr]
    and r1, r2, #0xff
    cmp r1, r0
    movls r0, #0x1
    movhi r0, #0x0
    ldmia sp!, {r4, pc}
.L_02179204: .word data_ov011_02181214
.L_02179208: .word data_ov011_021812c4
    arm_func_end func_ov011_021791a4

    .global func_ov011_0217920c
    arm_func_start func_ov011_0217920c
func_ov011_0217920c: ; 0x0217920c
    ldr r1, [r0, #0x38]
    ldrb r0, [r0, #0x11]
    and r1, r1, #0x3f
    cmp r1, r0
    movlo r0, #0x1
    movhs r0, #0x0
    bx lr
    arm_func_end func_ov011_0217920c

    .global func_ov011_02179228
    arm_func_start func_ov011_02179228
func_ov011_02179228: ; 0x02179228
    ldrb ip, [r0, #0xf]
    ldr r2, .L_02179270
    mov r3, #0x7
.L_02179234:
    ldrb r1, [r2, r3, lsl #0x1]
    cmp ip, r1
    ldrhs r1, .L_02179274
    ldrhsb r1, [r1, r3, lsl #0x1]
    bhs .L_02179254
    sub r1, r3, #0x1
    and r3, r1, #0xff
    b .L_02179234
.L_02179254:
    ldr r0, [r0, #0x38]
    mov r0, r0, lsr #0x1
    and r0, r0, #0xff
    cmp r0, r1
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_02179270: .word data_ov011_021811f4
.L_02179274: .word data_ov011_021811f5
    arm_func_end func_ov011_02179228

    .global func_ov011_02179278
    arm_func_start func_ov011_02179278
func_ov011_02179278: ; 0x02179278
    ldrb r1, [r0, #0x12]
    ldr r0, [r0, #0x38]
    mov r0, r0, lsr #0x3
    cmp r1, #0x1f
    movhi r1, #0x1f
    and r0, r0, #0x1f
    cmp r0, r1
    movhi r0, #0x1
    movls r0, #0x0
    bx lr
    arm_func_end func_ov011_02179278

    .global func_ov011_021792a0
    arm_func_start func_ov011_021792a0
func_ov011_021792a0: ; 0x021792a0
    ldrb ip, [r0, #0xd]
    ldr r2, .L_021792f0
    mov r3, #0x3
.L_021792ac:
    ldrb r1, [r2, r3, lsl #0x1]
    cmp ip, r1
    ldrhs r1, .L_021792f4
    ldrhsb r2, [r1, r3, lsl #0x1]
    bhs .L_021792cc
    sub r1, r3, #0x1
    and r3, r1, #0xff
    b .L_021792ac
.L_021792cc:
    ldr r1, [r0, #0x38]
    ldr r0, .L_021792f8
    mov r1, r1, lsr #0x1
    ldr r0, [r0, r2, lsl #0x2]
    and r1, r1, #0xff
    cmp r1, r0
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_021792f0: .word data_ov011_021811dc
.L_021792f4: .word data_ov011_021811dd
.L_021792f8: .word data_ov011_0218190c
    arm_func_end func_ov011_021792a0

    .global func_ov011_021792fc
    arm_func_start func_ov011_021792fc
func_ov011_021792fc: ; 0x021792fc
    ldrb ip, [r0, #0x10]
    ldr r2, .L_0217934c
    mov r3, #0x3
.L_02179308:
    ldrb r1, [r2, r3, lsl #0x1]
    cmp ip, r1
    ldrhs r1, .L_02179350
    ldrhsb r2, [r1, r3, lsl #0x1]
    bhs .L_02179328
    sub r1, r3, #0x1
    and r3, r1, #0xff
    b .L_02179308
.L_02179328:
    ldr r1, [r0, #0x38]
    ldr r0, .L_02179354
    mov r1, r1, lsr #0x2
    ldr r0, [r0, r2, lsl #0x2]
    and r1, r1, #0xff
    cmp r1, r0
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_0217934c: .word data_ov011_021811ec
.L_02179350: .word data_ov011_021811ed
.L_02179354: .word data_ov011_0218190c
    arm_func_end func_ov011_021792fc

    .global func_ov011_02179358
    arm_func_start func_ov011_02179358
func_ov011_02179358: ; 0x02179358
    ldrb ip, [r0, #0xc]
    ldr r2, .L_021793a0
    mov r3, #0x7
.L_02179364:
    ldrb r1, [r2, r3, lsl #0x1]
    cmp ip, r1
    ldrhs r1, .L_021793a4
    ldrhsb r1, [r1, r3, lsl #0x1]
    bhs .L_02179384
    sub r1, r3, #0x1
    and r3, r1, #0xff
    b .L_02179364
.L_02179384:
    ldr r0, [r0, #0x38]
    mov r0, r0, lsr #0x1
    and r0, r0, #0xff
    cmp r0, r1
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_021793a0: .word data_ov011_02181204
.L_021793a4: .word data_ov011_02181205
    arm_func_end func_ov011_02179358

    .global func_ov011_021793a8
    arm_func_start func_ov011_021793a8
func_ov011_021793a8: ; 0x021793a8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r6, r1
    mov r5, r0
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    ldr r0, .L_02179634
    ldr r0, [r0, #0x0]
    ldrb r1, [r0, #0x414]
    cmp r1, #0x0
    beq .L_021793f8
    ldr r0, .L_02179638
    mov r1, #0x51
    ldr r0, [r0, #0x0]
    bl func_0201a6d8
    mov r4, r0
    movs r0, #0x0
    strne r4, [r0, #0x0]
    b .L_02179408
.L_021793f8:
    mov r1, #0x0
    mov r2, #0x51
    bl func_0201a418
    mov r4, r0
.L_02179408:
    mov r0, r4
    mov r1, #0xff
    mov r2, #0x51
    bl func_0201b28c
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x2c]
    blx r2
    mov r2, #0x0
.L_02179430:
    ldrb r3, [r0, #0x2e]
    ldrb r1, [r5, #0x2e]
    cmp r3, r1
    bhi .L_02179588
    ldrsb r6, [r0, #0x2f]
    cmp r6, #0x0
    blt .L_0217946c
    ldr r1, .L_0217963c
    mov r3, r6, lsr #0x5
    add r1, r1, r3, lsl #0x2
    ldr r1, [r1, #0xa14]
    and r3, r6, #0x1f
    mov r6, #0x1
    tst r1, r6, lsl r3
    beq .L_02179588
.L_0217946c:
    mov r6, #0x1
    mov r8, #0x0
    ldr r11, .L_02179640
    mov r1, r6
    mvn r10, #0x0
    b .L_02179574
.L_02179484:
    mov r3, r8, asr #0x5
    ldr r7, [r0, r3, lsl #0x2]
    sub r3, r8, r3, lsl #0x5
    tst r7, r1, lsl r3
    beq .L_02179570
    cmp r8, #0x3
    addgt r3, r0, r8
    ldrgtb ip, [r3, #0x8]
    addgt r3, r5, r8
    ldrgtb lr, [r3, #0x8]
    bgt .L_021794cc
    tst r8, #0x1
    bne .L_02179570
    bic r7, r8, #0x1
    add r3, r0, r7
    ldrh ip, [r3, #0x8]
    add r3, r5, r7
    ldrh lr, [r3, #0x8]
.L_021794cc:
    ldr r3, [r11, r8, lsl #0x2]
    mov r7, #0x1
    cmp r3, #0x0
    movgt ip, r3
    sub r3, r8, #0xc
    cmp r3, #0x2
    bhi .L_0217951c
    mov r3, #0x0
.L_021794ec:
    ldr r9, .L_02179644
    ldrsb r9, [r9, r3]
    cmp r9, r10
    ble .L_0217951c
    cmp r9, r2
    addle r9, r9, #0x3
    cmple r2, r9
    movle ip, #0x60
    movle r7, #0x0
    ble .L_0217951c
    add r3, r3, #0x1
    b .L_021794ec
.L_0217951c:
    cmp r8, #0x5
    cmpne r8, #0x8
    bne .L_02179538
    cmp r2, #0xd
    blt .L_02179538
    cmp r2, #0x10
    movle r7, #0x0
.L_02179538:
    cmp r7, #0x0
    mov r3, #0x0
    beq .L_0217954c
    cmp lr, ip
    b .L_02179550
.L_0217954c:
    cmp ip, lr
.L_02179550:
    movge r3, #0x1
    cmp r3, #0x0
    ldrnesb r3, [r4, r2]
    addne r3, r3, #0x1
    strneb r3, [r4, r2]
    bne .L_02179570
    mov r6, #0x0
    b .L_0217957c
.L_02179570:
    add r8, r8, #0x1
.L_02179574:
    cmp r8, #0x28
    blt .L_02179484
.L_0217957c:
    cmp r6, #0x0
    mvneq r1, #0x0
    streqb r1, [r4, r2]
.L_02179588:
    add r2, r2, #0x1
    cmp r2, #0x51
    add r0, r0, #0x30
    blt .L_02179430
    mvn r0, #0x0
    mov r5, r0
    mov r2, #0x0
.L_021795a4:
    ldrsb r1, [r4, r2]
    cmp r1, #0x0
    blt .L_021795fc
    cmp r0, #0x0
    bne .L_021795f4
    cmp r5, #0x0
    moveq r0, r1
    moveq r5, r2
    beq .L_021795fc
    cmp r5, #0x4d
    movge r0, r1
    movge r5, r2
    bge .L_021795fc
    cmp r2, #0x4d
    blt .L_021795e8
    cmp r2, #0x50
    ble .L_021795fc
.L_021795e8:
    mov r0, r1
    mov r5, r2
    b .L_021795fc
.L_021795f4:
    mov r0, r1
    mov r5, r2
.L_021795fc:
    add r2, r2, #0x1
    cmp r2, #0x51
    blt .L_021795a4
    mov r0, r4
    cmp r5, #0x0
    movlt r5, #0x0
    bl func_0201a9ec
    cmp r0, #0x0
    bne .L_0217962c
    mov r0, r4
    mov r1, #0x1
    bl func_0201a958
.L_0217962c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02179634: .word data_020a0dd8
.L_02179638: .word data_020a0f60
.L_0217963c: .word data_020b02b8
.L_02179640: .word data_ov011_02181224
.L_02179644: .word data_ov011_021811d8
    arm_func_end func_ov011_021793a8

    .global func_ov011_02179648
    arm_func_start func_ov011_02179648
func_ov011_02179648: ; 0x02179648
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r7, r0
    ldr r0, [r6, #0x4]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r5, r2
    ldr r3, [r3, #0x2c]
    blx r3
    mov r4, r0
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    mov r1, r7
    mov r2, #0x30
    mla r0, r5, r2, r4
    bl func_02051890
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov011_02179648

    .global func_ov011_02179694
    arm_func_start func_ov011_02179694
func_ov011_02179694: ; 0x02179694
    stmdb sp!, {r4, lr}
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    ldr r4, [r0, #0x10]
.L_021796a4:
    add r1, r4, r2, lsl #0x1
    ldrsh r0, [r1, #0x3c]
    add r2, r2, #0x1
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r1, #0x3c]
    cmp r2, #0xd
    blt .L_021796a4
    ldr r0, .L_021796dc
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    str r0, [r4, #0x38]
    ldmia sp!, {r4, pc}
.L_021796dc: .word data_020a0da8
    arm_func_end func_ov011_02179694

    .global func_ov011_021796e0
    arm_func_start func_ov011_021796e0
func_ov011_021796e0: ; 0x021796e0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    ldrb r1, [r10, #0x108]
    cmp r1, #0x1
    bne .L_0217a3fc
    mvn r0, #0x0
    mov r2, #0x0
    strb r0, [r10, #0x38]
    mov r1, r2
.L_02179708:
    add r0, r10, r2, lsl #0x1
    add r2, r2, #0x1
    strh r1, [r0, #0xec]
    cmp r2, #0xc
    blt .L_02179708
    ldr r0, .L_0217a53c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x154]
    cmp r0, #0x7
    cmpne r0, #0x8
    cmpne r0, #0x9
    beq .L_02179868
    ldr r0, [r10, #0x2c]
    bl func_ov011_021791a4
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r10, #0x105]
    bne .L_0217a534
    ldr r0, [r10, #0x1c]
    bl func_ov011_02175628
    ldr r2, [r0, #0x4]
    ldr r0, [r10, #0x2c]
    mov r1, #0x15
    ldr r4, [r2, #0x10]
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_021797a8
    ldr r0, [r10, #0x2c]
    bl func_ov011_0217920c
    cmp r0, #0x0
    beq .L_021797a8
    mov r0, r10
    bl func_ov011_02180910
    cmp r0, #0x0
    beq .L_021797a8
    ldrb r0, [r4, #0x34]
    tst r0, #0x10
    movne r0, #0xb
    strneb r0, [r10, #0x105]
    bne .L_0217a534
.L_021797a8:
    ldr r0, [r10, #0x2c]
    mov r1, #0x13
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_02179868
    ldr r1, [r10, #0x24]
    ldrb r0, [r1, #0x3c]
    cmp r0, #0x2
    movlo r0, #0x0
    blo .L_021797e0
    ldr r0, [r1, #0x2c]
    cmp r0, #0xb4
    movhs r0, #0x1
    movlo r0, #0x0
.L_021797e0:
    cmp r0, #0x0
    beq .L_02179868
    ldr r0, [r1, #0x28]
    tst r0, #0x800000
    beq .L_02179838
    ldr r0, [r1, #0x0]
    ldr r0, [r0, #0x68]
    tst r0, #0x800000
    bne .L_02179838
    ldr r0, [r10, #0x2c]
    mov r1, #0x22
    bl func_ov011_02179130
    cmp r0, #0x0
    beq .L_02179838
    ldrb r0, [r10, #0x83]
    cmp r0, #0x0
    bne .L_02179838
    mov r1, #0x8
    mov r0, r10
    strb r1, [r10, #0x105]
    bl func_ov011_0217e288
    b .L_0217a534
.L_02179838:
    ldr r0, [r10, #0x2c]
    bl func_ov011_021792fc
    cmp r0, #0x0
    beq .L_02179868
    ldrb r0, [r10, #0x84]
    cmp r0, #0x0
    bne .L_02179868
    mov r1, #0x8
    mov r0, r10
    strb r1, [r10, #0x105]
    bl func_ov011_0217e26c
    b .L_0217a534
.L_02179868:
    ldr r0, [r10, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    mov r8, #0x0
    ldr r7, [r0, #0x10]
    add r4, sp, #0x0
    add r6, r7, #0xa8
    mov r5, r8
.L_02179888:
    mov r1, r8, lsl #0x1
    strh r5, [r4, r1]
    ldr r0, [r6, #0x20]
    cmp r0, #0x0
    ldreqsh r0, [r4, r1]
    subeq r0, r0, #0x1000
    streqh r0, [r4, r1]
    beq .L_021798e4
    mov r0, r6
    bl func_ov011_021733dc
    cmp r0, #0x0
    movne r1, r8, lsl #0x1
    ldrnesh r0, [r4, r1]
    subne r0, r0, #0x1000
    strneh r0, [r4, r1]
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x8000
    bgt .L_021798e4
    cmp r0, #0x0
    ldrgesh r0, [r10, #0xf0]
    addge r0, r0, #0x32
    strgeh r0, [r10, #0xf0]
.L_021798e4:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r6, r6, #0x10c
    blt .L_02179888
    ldrb r0, [r10, #0x104]
    ldr r1, [r10, #0xd4]
    mvn r6, #0x0
    cmp r0, #0x2
    mov r5, r1, lsr #0x1c
    ldrb r0, [r10, #0x107]
    bls .L_02179b0c
    add r4, sp, #0x0
    mov r1, r0, lsl #0x1
    ldrsh r0, [r4, r1]
    ldr r11, .L_0217a540
    add r9, r7, #0xa8
    add r0, r0, #0xa
    mov r8, #0x0
    strh r0, [r4, r1]
.L_02179930:
    ldr r0, [r9, #0x20]
    cmp r0, #0x0
    cmpne r8, r5
    beq .L_021799e8
    ldr r0, [r9, #0x24]
    bl func_ov011_0217a590
    cmp r0, #0x0
    movle r1, r8, lsl #0x1
    ldrlesh r0, [r4, r1]
    suble r0, r0, #0x1000
    strleh r0, [r4, r1]
    ble .L_021799b0
    cmp r0, #0x800
    movlt r1, r8, lsl #0x1
    ldrltsh r0, [r4, r1]
    addlt r0, r0, #0x78
    strlth r0, [r4, r1]
    blt .L_021799b0
    cmp r0, #0xc00
    movlt r1, r8, lsl #0x1
    ldrltsh r0, [r4, r1]
    addlt r0, r0, #0x46
    strlth r0, [r4, r1]
    blt .L_021799b0
    mov r1, r8, lsl #0x1
    cmp r0, #0x1000
    ldrltsh r0, [r4, r1]
    addlt r0, r0, #0x1e
    strlth r0, [r4, r1]
    ldrgesh r0, [r4, r1]
    addge r0, r0, #0xa
    strgeh r0, [r4, r1]
.L_021799b0:
    ldr r2, [r9, #0x20]
    mov r1, r8, lsl #0x1
    ldrh r3, [r2, #0x88]
    ldrsh r0, [r4, r1]
    mov r3, r3, lsl #0x1
    ldrsh r3, [r11, r3]
    add r0, r0, r3
    strh r0, [r4, r1]
    ldrh r0, [r2, #0xa0]
    ldrsh r2, [r4, r1]
    mov r0, r0, lsl #0x1
    ldrsh r0, [r11, r0]
    add r0, r2, r0
    strh r0, [r4, r1]
.L_021799e8:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x10c
    blt .L_02179930
    add r0, r10, #0x100
    ldrsb r1, [r0, #0x6]
    cmp r1, #0x0
    blt .L_02179b20
    ldrsb r2, [r7, #0x35]
    cmp r2, r5
    bne .L_02179a88
    ldrsb r0, [r7, #0x36]
    add r8, sp, #0x0
    add r2, r7, #0xa8
    mov r4, r0, lsl #0x1
    ldrsh r3, [r8, r4]
    mov r0, #0x0
    add r3, r3, #0xa
    strh r3, [r8, r4]
    add r3, r1, #0x1
    b .L_02179a7c
.L_02179a3c:
    ldr r1, [r2, #0x20]
    cmp r1, #0x0
    cmpne r0, r5
    beq .L_02179a74
    add r1, r2, #0x100
    ldrsb r1, [r1, #0x6]
    cmp r1, r3
    bne .L_02179a74
    add r2, sp, #0x0
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r1]
    add r0, r0, #0x50
    strh r0, [r2, r1]
    b .L_02179b20
.L_02179a74:
    add r0, r0, #0x1
    add r2, r2, #0x10c
.L_02179a7c:
    cmp r0, #0x4
    blt .L_02179a3c
    b .L_02179b20
.L_02179a88:
    mov r8, r2, lsl #0x1
    add r0, sp, #0x0
    ldrsh r4, [r0, r8]
    add r3, r7, #0xa8
    mov r2, #0x0
    add r4, r4, #0x64
    strh r4, [r0, r8]
    ldrsb r4, [r7, #0x36]
    sub r1, r1, #0x1
    mov r8, r4, lsl #0x1
    ldrsh r4, [r0, r8]
    add r4, r4, #0x32
    strh r4, [r0, r8]
    b .L_02179b00
.L_02179ac0:
    ldr r0, [r3, #0x20]
    cmp r0, #0x0
    cmpne r2, r5
    beq .L_02179af8
    add r0, r3, #0x100
    ldrsb r0, [r0, #0x6]
    cmp r0, r1
    bne .L_02179af8
    add r3, sp, #0x0
    mov r1, r2, lsl #0x1
    ldrsh r0, [r3, r1]
    add r0, r0, #0x32
    strh r0, [r3, r1]
    b .L_02179b20
.L_02179af8:
    add r2, r2, #0x1
    add r3, r3, #0x10c
.L_02179b00:
    cmp r2, #0x4
    blt .L_02179ac0
    b .L_02179b20
.L_02179b0c:
    add r2, sp, #0x0
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r1]
    add r0, r0, #0x64
    strh r0, [r2, r1]
.L_02179b20:
    ldr r1, .L_0217a544
    ldr r0, .L_0217a53c
    add r9, r1, r5
    ldr r2, [r0, #0x0]
    mov r8, #0x8000
    ldrb r3, [r1, #0x2d]
    ldrsb r0, [r9, #0x2e]
    rsb r8, r8, #0x0
    mov r4, #0x0
    add ip, sp, #0x0
    mov lr, #0x10c
.L_02179b4c:
    cmp r5, r4
    mlane r11, r4, lr, r7
    ldrne r11, [r11, #0xc8]
    cmpne r11, #0x0
    beq .L_02179b94
    ldr r11, [r2, #0x154]
    cmp r11, #0x5
    cmpne r3, #0x0
    beq .L_02179b80
    add r11, r1, r4
    ldrsb r11, [r11, #0x2e]
    cmp r0, r11
    beq .L_02179b94
.L_02179b80:
    mov r11, r4, lsl #0x1
    ldrsh r11, [ip, r11]
    cmp r8, r11
    movlt r8, r11
    movlt r6, r4
.L_02179b94:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_02179b4c
    cmp r8, #0x0
    ldrltsh r0, [r10, #0xf0]
    sublt r0, r0, #0x100
    strlth r0, [r10, #0xf0]
    strltb r6, [r10, #0x38]
    blt .L_02179c38
    mvn r0, #0x0
    cmp r6, r0
    cmpne r6, r5
    bne .L_02179c28
    ldr r4, .L_0217a544
    ldr r11, .L_0217a548
.L_02179bd0:
    ldr r0, [r11, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    and r6, r0, #0x3
    mov r0, #0x10c
    mla r0, r6, r0, r7
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    cmpne r5, r6
    beq .L_02179bd0
    ldr r0, .L_0217a53c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x154]
    cmp r0, #0x5
    ldrneb r0, [r4, #0x2d]
    cmpne r0, #0x0
    beq .L_02179c28
    add r0, r4, r6
    ldrsb r1, [r9, #0x2e]
    ldrsb r0, [r0, #0x2e]
    cmp r1, r0
    beq .L_02179bd0
.L_02179c28:
    ldrsh r0, [r10, #0xf0]
    add r0, r0, r8, asr #0x1
    strh r0, [r10, #0xf0]
    strb r6, [r10, #0x38]
.L_02179c38:
    ldr r0, [r10, #0x24]
    bl func_ov011_0217a590
    cmp r0, #0x0
    blt .L_0217a004
    ldr r0, [r10, #0x24]
    bl func_ov011_0217a5a4
    ldrb r2, [r10, #0x104]
    ldr r1, .L_0217a54c
    ldrb r1, [r1, r2]
    cmp r0, r1
    bge .L_0217a004
    ldr r0, [r10, #0x2c]
    mov r1, #0x13
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_02179cb8
    ldr r0, [r10, #0x24]
    ldrb r0, [r0, #0x3c]
    cmp r0, #0x1
    bls .L_02179cb8
    ldr r0, [r10, #0x2c]
    bl func_ov011_021792a0
    cmp r0, #0x0
    beq .L_02179cb8
    ldrb r0, [r10, #0x85]
    cmp r0, #0x0
    bne .L_02179cb8
    ldrsh r1, [r10, #0xfc]
    mov r0, r10
    add r1, r1, #0xc8
    strh r1, [r10, #0xfc]
    bl func_ov011_0217e250
.L_02179cb8:
    ldr r0, [r10, #0x2c]
    mov r1, #0x12
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_02179d54
    ldr r1, [r10, #0x24]
    ldr r0, [r1, #0x28]
    tst r0, #0x1000
    bne .L_02179ce4
    tst r0, #0x2000
    beq .L_02179d54
.L_02179ce4:
    ldrb r0, [r1, #0x36]
    cmp r0, #0x0
    beq .L_02179d54
    ldr r1, [r10, #0xd4]
    mvn r3, #0x80000000
    mov r2, #0x0
.L_02179cfc:
    cmp r2, r1, lsr #0x1c
    beq .L_02179d18
    add r0, r10, r2, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x0
    cmpgt r3, r0
    movgt r3, r0
.L_02179d18:
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_02179cfc
    cmp r3, #0x6000
    ble .L_02179d54
    mov r0, r3, asr #0x8
    sub r3, r0, #0x60
    cmp r3, #0x100
    movgt r3, #0x100
    mov r0, #0x3c
    mul r0, r3, r0
    ldrsh r1, [r10, #0xfa]
    mov r0, r0, lsl #0x8
    add r0, r1, r0, asr #0x10
    strh r0, [r10, #0xfa]
.L_02179d54:
    ldr r0, [r10, #0x1c]
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    ldr r0, [r10, #0xd4]
    ldr r1, [r1, #0x10]
    mov r0, r0, lsr #0x1c
    add r0, r1, r0, lsl #0x2
    mov r3, #0x0
    ldr r2, [r0, #0x98]
    add r4, r1, #0xa8
    mov r0, r3
    sub r1, r3, #0x80000001
.L_02179d84:
    cmp r4, r10
    ldrne r6, [r4, #0x24]
    cmpne r6, #0x0
    beq .L_02179de0
    ldr r5, [r6, #0x24]
    tst r5, #0x4
    ldrne r5, [r6, #0x4]
    cmpne r5, #0x0
    ldrne r7, [r5, #0x24]
    cmpne r7, #0x0
    beq .L_02179de0
    ldrsh r6, [r7, #0x36]
    ldr r5, [r2, #0x4]
    ldrsh r7, [r7, #0x34]
    rsbs r6, r5, r6, lsl #0x8
    ldr r5, [r2, #0x0]
    rsbmi r6, r6, #0x0
    rsbs r5, r5, r7, lsl #0x8
    rsbmi r5, r5, #0x0
    add r5, r5, r6
    cmp r1, r5
    movgt r1, r5
    movgt r3, r4
.L_02179de0:
    add r0, r0, #0x1
    cmp r0, #0x4
    add r4, r4, #0x10c
    blt .L_02179d84
    mvn r0, #0x80000000
    cmp r1, r0
    beq .L_02179e24
    mov r1, r1, asr #0x8
    cmp r1, #0x100
    movgt r1, #0x100
    rsb r1, r1, #0x100
    mov r0, #0x64
    mul r0, r1, r0
    ldrsh r1, [r10, #0xfa]
    add r0, r1, r0, asr #0x8
    strh r0, [r10, #0xfa]
    str r3, [r10, #0xa4]
.L_02179e24:
    ldr r0, [r10, #0x2c]
    mov r1, #0x11
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_02179edc
    ldr r0, [r10, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    tst r1, #0x80
    beq .L_02179edc
    bl func_ov011_0217a5a4
    ldr r2, [r10, #0xd4]
    mvn r4, #0x80000000
    mov r3, #0x0
.L_02179e5c:
    cmp r3, r2, lsr #0x1c
    beq .L_02179e78
    add r1, r10, r3, lsl #0x2
    ldr r1, [r1, #0xdc]
    cmp r1, #0x0
    cmpgt r4, r1
    movgt r4, r1
.L_02179e78:
    add r3, r3, #0x1
    cmp r3, #0x4
    blt .L_02179e5c
    cmp r4, #0x6000
    ble .L_02179ed4
    mov r1, r4, asr #0x8
    sub r4, r1, #0x60
    cmp r4, #0x100
    movgt r4, #0x100
    mov r1, #0x1e
    mul r2, r4, r1
    rsb r0, r0, #0x100
    mul r1, r0, r1
    mov r2, r2, asr #0x10
    ldrsh r3, [r10, #0xfe]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x8
    add r0, r3, r0, asr #0x10
    strh r0, [r10, #0xfe]
    ldrsh r0, [r10, #0xfe]
    add r0, r0, r1, asr #0x10
    strh r0, [r10, #0xfe]
    b .L_02179edc
.L_02179ed4:
    mov r0, r10
    bl func_ov011_0217a5b8
.L_02179edc:
    ldr r0, [r10, #0x2c]
    mov r1, #0x14
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_0217a004
    ldr r0, [r10, #0x1c]
    bl func_ov011_02175628
    ldrsh r1, [r10, #0xfc]
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    ldr r4, [r0, #0x10]
    ldreqsh r0, [r10, #0xfa]
    cmpeq r0, #0x0
    bne .L_0217a004
    ldr r0, [r10, #0xd4]
    ldrsb r2, [r10, #0x38]
    mov r1, r0, lsr #0x1c
    add r0, r4, r1, lsl #0x2
    add r2, r4, r2, lsl #0x2
    ldr r2, [r2, #0x98]
    ldr r0, [r0, #0x98]
    ldr r3, [r2, #0x0]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x4]
    sub r6, r3, r2
    ldr r4, .L_0217a550
    mov r5, #0x0
    b .L_02179ffc
.L_02179f4c:
    mov r2, r5
    b .L_02179f64
.L_02179f54:
    ldrb r3, [r0, #0x15]
    cmp r3, r7
    beq .L_02179f74
    add r2, r2, #0x1
.L_02179f64:
    mov r3, r2, lsl #0x1
    ldrsb r7, [r4, r3]
    cmp r7, #0x0
    bge .L_02179f54
.L_02179f74:
    cmp r7, #0x0
    blt .L_02179ff8
    cmp r6, #0x0
    addgt r3, r0, r1, lsl #0x3
    ldrgt r3, [r3, #0x18]
    cmpgt r3, #0x0
    bgt .L_02179ff8
    cmp r6, #0x0
    addlt r3, r0, r1, lsl #0x3
    ldrlt r3, [r3, #0x18]
    cmplt r3, #0x0
    blt .L_02179ff8
    add r3, r0, r1, lsl #0x3
    add r0, r0, r1, lsl #0x3
    ldr r3, [r3, #0x18]
    ldr r0, [r0, #0x1c]
    cmp r3, #0x0
    rsblt r3, r3, #0x0
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    add r0, r3, r0
    mov r3, r0, asr #0x8
    cmp r3, #0x100
    ldr r0, .L_0217a554
    mov r1, r2, lsl #0x1
    ldrsb r0, [r0, r1]
    movgt r3, #0x100
    ldrsh r1, [r10, #0xf6]
    mul r0, r3, r0
    mov r0, r0, lsl #0x8
    add r0, r1, r0, asr #0x10
    strh r0, [r10, #0xf6]
    b .L_0217a004
.L_02179ff8:
    ldr r0, [r0, #0x0]
.L_02179ffc:
    cmp r0, #0x0
    bne .L_02179f4c
.L_0217a004:
    ldr r0, [r10, #0x24]
    ldrb r4, [r0, #0x36]
    ldrb r5, [r0, #0x37]
    cmp r4, r5
    beq .L_0217a1d0
    ldr r2, [r10, #0xd4]
    ldr r0, [r10, #0x2c]
    mov r1, #0x14
    mov r6, r2, lsr #0x1c
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_0217a104
    ldr r0, [r10, #0x2c]
    bl func_ov011_02179228
    cmp r0, #0x0
    beq .L_0217a104
    ldr r0, [r10, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    sub r1, r5, r4
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x4]
    b .L_0217a0fc
.L_0217a060:
    mov r8, #0x0
    ldr r3, .L_0217a558
    b .L_0217a07c
.L_0217a06c:
    ldrb r7, [r0, #0x15]
    cmp r9, r7
    beq .L_0217a08c
    add r8, r8, #0x1
.L_0217a07c:
    ldrsb r9, [r3, r8]
    add r2, r3, r8
    cmp r9, #0x0
    bge .L_0217a06c
.L_0217a08c:
    cmp r9, #0x0
    blt .L_0217a0f8
    add r3, r0, r6, lsl #0x3
    ldr r7, [r3, #0x18]
    add r3, r0, r6, lsl #0x3
    ldr r3, [r3, #0x1c]
    cmp r7, #0x0
    rsblt r7, r7, #0x0
    cmp r3, #0x0
    rsblt r3, r3, #0x0
    add r3, r7, r3
    mov r7, r3, asr #0x8
    cmp r7, #0x100
    movgt r7, #0x100
    rsb r7, r7, #0x100
    mov r3, #0x14
    mul r3, r7, r3
    ldrsh r7, [r10, #0xf6]
    mov r3, r3, lsl #0x8
    add r3, r7, r3, asr #0x10
    strh r3, [r10, #0xf6]
    ldrsb r2, [r2, #0x2]
    ldrsh r7, [r10, #0xf6]
    mul r3, r2, r1
    mov r2, r3, lsl #0x10
    add r2, r7, r2, asr #0x10
    strh r2, [r10, #0xf6]
.L_0217a0f8:
    ldr r0, [r0, #0x0]
.L_0217a0fc:
    cmp r0, #0x0
    bne .L_0217a060
.L_0217a104:
    ldr r0, [r10, #0x2c]
    mov r1, #0x11
    bl func_ov011_0217a56c
    cmp r0, #0x0
    bne .L_0217a1c4
    ldr r0, [r10, #0x24]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x68]
    tst r0, #0x100
    beq .L_0217a1c4
    ldr r0, [r10, #0x2c]
    bl func_ov011_02179228
    cmp r0, #0x0
    beq .L_0217a1c4
    mvn r1, #0x80000000
    mov r2, #0x0
.L_0217a144:
    cmp r2, r6
    beq .L_0217a160
    add r0, r10, r2, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x0
    cmpgt r1, r0
    movgt r1, r0
.L_0217a160:
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_0217a144
    cmp r1, #0x6000
    ble .L_0217a1bc
    mov r0, r1, asr #0x8
    sub r1, r0, #0x60
    cmp r1, #0x100
    movgt r1, #0x100
    mov r0, #0x32
    mul r3, r1, r0
    sub r1, r5, r4
    mov r0, #0xa
    mul r2, r1, r0
    ldrsh r4, [r10, #0xfe]
    mov r0, r3, lsl #0x8
    mov r1, r2, lsl #0x10
    add r0, r4, r0, asr #0x10
    strh r0, [r10, #0xfe]
    ldrsh r0, [r10, #0xfe]
    add r0, r0, r1, asr #0x10
    strh r0, [r10, #0xfe]
    b .L_0217a1c4
.L_0217a1bc:
    mov r0, r10
    bl func_ov011_0217a5b8
.L_0217a1c4:
    ldr r0, [r10, #0x2c]
    mov r1, #0x11
    bl func_ov011_0217a56c
.L_0217a1d0:
    ldr r0, [r10, #0x20]
    ldrh r1, [r0, #0xa0]
    cmp r1, #0x0
    beq .L_0217a258
    cmp r1, #0x1a
    ldreqsh r0, [r10, #0xf0]
    subeq r0, r0, #0x1000
    streqh r0, [r10, #0xf0]
    cmp r1, #0x19
    bne .L_0217a210
    ldrsh r0, [r10, #0xf8]
    sub r0, r0, #0x1000
    strh r0, [r10, #0xf8]
    ldrsh r0, [r10, #0xfa]
    sub r0, r0, #0x1000
    strh r0, [r10, #0xfa]
.L_0217a210:
    cmp r1, #0x18
    ldreqsh r0, [r10, #0xfc]
    subeq r0, r0, #0x1000
    streqh r0, [r10, #0xfc]
    ldr r1, [r10, #0x24]
    ldr r0, .L_0217a55c
    ldr r1, [r1, #0x28]
    tst r1, r0
    ldrnesh r0, [r10, #0xfa]
    addne r0, r0, #0x50
    strneh r0, [r10, #0xfa]
    ldr r0, [r10, #0x20]
    bl func_ov006_0215922c
    cmp r0, #0x0
    addne r0, r10, #0x100
    ldrnesh r1, [r0, #0x0]
    addne r1, r1, #0x100
    strneh r1, [r0, #0x0]
.L_0217a258:
    ldr r0, [r10, #0x20]
    ldrh r3, [r0, #0x88]
    cmp r3, #0x0
    beq .L_0217a298
    ldrb r1, [r10, #0x104]
    ldr r2, .L_0217a560
    ldr r0, .L_0217a564
    mov r3, r3, lsl #0x1
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r3]
    ldrsh r0, [r0, r1]
    ldrsh r1, [r10, #0xf0]
    smulbb r0, r2, r0
    mov r0, r0, lsl #0x8
    add r0, r1, r0, asr #0x10
    strh r0, [r10, #0xf0]
.L_0217a298:
    ldr r0, .L_0217a53c
    mov r8, #0x100
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x154]
    cmp r0, #0x5
    beq .L_0217a2c0
    ldr r0, .L_0217a544
    ldr r0, [r0, #0x10]
    cmp r0, #0xc
    moveq r8, #0x300
.L_0217a2c0:
    ldr r0, [r10, #0x2c]
    ldr r1, [r10, #0xd4]
    ldrb r9, [r0, #0x13]
    ldr r0, [r10, #0x1c]
    mov r7, r1, lsr #0x1c
    cmp r9, #0x20
    movhi r9, #0x20
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    mov r5, #0x100
    ldr r0, [r0, #0x10]
    mvn r4, #0x0
    ldr r6, [r0, #0x4]
    b .L_0217a370
.L_0217a2f8:
    ldrb r0, [r6, #0x14]
    ldrb r1, [r6, #0x15]
    bl func_ov011_0217f8a4
    cmp r0, r4
    blt .L_0217a36c
    add r1, r6, r7, lsl #0x3
    add r2, r6, r7, lsl #0x3
    ldr r1, [r1, #0x18]
    ldr r2, [r2, #0x1c]
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    cmp r2, #0x0
    rsblt r2, r2, #0x0
    add r1, r1, r2
    mul r2, r0, r8
    mov r0, r2, lsl #0x8
    mov r1, r1, asr #0x8
    cmp r1, #0x100
    movgt r1, r5
    mov r2, r0, asr #0x10
    cmp r8, #0x100
    mulne r0, r2, r9
    movne r0, r0, lsl #0xc
    movne r2, r0, asr #0x10
    mul r0, r2, r1
    ldrsh r1, [r10, #0xf6]
    mov r0, r0, lsl #0x8
    add r0, r1, r0, asr #0x10
    strh r0, [r10, #0xf6]
.L_0217a36c:
    ldr r6, [r6, #0x0]
.L_0217a370:
    cmp r6, #0x0
    bne .L_0217a2f8
    add r0, r10, #0x100
    ldrsb r0, [r0, #0xb]
    mvn r4, #0x0
    mov r3, #0x0
    cmp r0, r4
    beq .L_0217a3a8
    add r2, r10, #0xec
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r1]
    sub r0, r0, #0x1000
    strh r0, [r2, r1]
    strb r4, [r10, #0x10b]
.L_0217a3a8:
    mov r1, #0x0
.L_0217a3ac:
    add r0, r10, r1, lsl #0x1
    ldrsh r0, [r0, #0xec]
    cmp r0, r3
    movgt r4, r1
    add r1, r1, #0x1
    movgt r3, r0
    cmp r1, #0xc
    blt .L_0217a3ac
    cmp r4, #0x0
    movlt r0, #0x0
    strltb r0, [r10, #0x105]
    strgeb r4, [r10, #0x105]
    ldrb r1, [r10, #0x105]
    ldr r0, .L_0217a568
    ldr r1, [r0, r1, lsl #0x2]
    cmp r1, #0x0
    beq .L_0217a534
    mov r0, r10
    blx r1
    b .L_0217a534
.L_0217a3fc:
    cmp r1, #0x0
    beq .L_0217a534
    cmp r1, #0x2
    beq .L_0217a418
    cmp r1, #0x3
    beq .L_0217a4ec
    b .L_0217a534
.L_0217a418:
    ldr r1, [r10, #0x14]
    ldr r2, [r10, #0xd8]
    ldr r1, [r1, #0x0]
    cmp r2, #0x0
    beq .L_0217a4d8
    cmp r2, #0x1
    bne .L_0217a46c
    ldr r0, [r10, #0x20]
    ldrsb r0, [r0, #0x18]
    cmp r0, #0x0
    bne .L_0217a45c
    mov r0, #0x2
    str r0, [r1, #0xe4]
    ldr r0, [r10, #0xd8]
    add r0, r0, #0x1
    str r0, [r10, #0xd8]
    b .L_0217a534
.L_0217a45c:
    cmp r0, #0x3
    addeq r0, r2, #0x1
    streq r0, [r10, #0xd8]
    b .L_0217a534
.L_0217a46c:
    ldr r0, [r1, #0xe4]
    tst r0, #0x2
    beq .L_0217a4cc
    ldr r2, [r10, #0x20]
    ldrsb r0, [r2, #0x18]
    cmp r0, #0x3
    bne .L_0217a534
    ldr r0, [r2, #0x1a8]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x40]
    tst r0, #0x1000
    movne r0, #0x2
    strne r0, [r10, #0xd8]
    ldr r0, [r10, #0xd8]
    cmp r0, #0x7a
    addlt r0, r0, #0x1
    strlt r0, [r10, #0xd8]
    blt .L_0217a534
    ldr r2, [r1, #0xe4]
    mov r0, #0x0
    bic r2, r2, #0x2
    str r2, [r1, #0xe4]
    str r0, [r10, #0xd8]
    b .L_0217a534
.L_0217a4cc:
    mov r0, #0x0
    str r0, [r10, #0xd8]
    b .L_0217a534
.L_0217a4d8:
    bl func_ov011_02173318
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r10, #0xd8]
    b .L_0217a534
.L_0217a4ec:
    ldr r1, [r10, #0x14]
    ldr r0, [r10, #0xd8]
    ldr r1, [r1, #0x0]
    cmp r0, #0x0
    beq .L_0217a514
    cmp r0, #0xa
    ldreq r0, [r1, #0xe4]
    biceq r0, r0, #0x10
    streq r0, [r1, #0xe4]
    b .L_0217a51c
.L_0217a514:
    mov r0, #0x10
    str r0, [r1, #0xe4]
.L_0217a51c:
    ldr r1, [r10, #0xd8]
    add r0, r1, #0x1
    str r0, [r10, #0xd8]
    cmp r1, #0x78
    movge r0, #0x0
    strge r0, [r10, #0xd8]
.L_0217a534:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217a53c: .word data_ov006_02172960
.L_0217a540: .word data_ov011_02181378
.L_0217a544: .word data_020afe90
.L_0217a548: .word data_020a0da8
.L_0217a54c: .word data_ov011_021812cc
.L_0217a550: .word data_ov011_021812e0
.L_0217a554: .word data_ov011_021812e1
.L_0217a558: .word data_ov011_021812d4
.L_0217a55c: .word 0xc0210
.L_0217a560: .word data_ov011_02181324
.L_0217a564: .word data_ov011_02181970
.L_0217a568: .word data_ov011_021812f4
    arm_func_end func_ov011_021796e0

    .global func_ov011_0217a56c
    arm_func_start func_ov011_0217a56c
func_ov011_0217a56c: ; 0x0217a56c
    mov r2, r1, asr #0x5
    add r2, r0, r2, lsl #0x2
    bic r0, r1, #0x1f
    sub r1, r1, r0
    ldr r2, [r2, #0x34]
    mov r0, #0x1
    tst r2, r0, lsl r1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217a56c

    .global func_ov011_0217a590
    arm_func_start func_ov011_0217a590
func_ov011_0217a590: ; 0x0217a590
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x64]
    mvneq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217a590

    .global func_ov011_0217a5a4
    arm_func_start func_ov011_0217a5a4
func_ov011_0217a5a4: ; 0x0217a5a4
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrneh r0, [r0, #0xbc]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217a5a4

    .global func_ov011_0217a5b8
    arm_func_start func_ov011_0217a5b8
func_ov011_0217a5b8: ; 0x0217a5b8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x24]
    bl func_ov011_0217a5a4
    cmp r0, #0x80
    ldrlo r0, [r4, #0x2c]
    ldrlob r1, [r0, #0x15]
    blo .L_0217a5f0
    add r0, r4, #0x100
    ldrsb r0, [r0, #0x6]
    cmp r0, #0x0
    ldr r0, [r4, #0x2c]
    ldreqb r1, [r0, #0x16]
    ldrneb r1, [r0, #0x14]
.L_0217a5f0:
    mov r0, #0x14
    mul r0, r1, r0
    ldrsh r1, [r4, #0xf4]
    add r0, r1, r0, asr #0x8
    strh r0, [r4, #0xf4]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217a5b8

    .global func_ov011_0217a608
    arm_func_start func_ov011_0217a608
func_ov011_0217a608: ; 0x0217a608
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x90
    mov r4, r0
    ldrb r2, [r4, #0x39]
    ldr r1, .L_0217aa50
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldrb r1, [r4, #0x40]
    cmp r1, #0x11
    addls pc, pc, r1, lsl #0x2
    b .L_0217a968
.L_0217a634: ; jump table
    b .L_0217a968 ; case 0
    b .L_0217a67c ; case 1
    b .L_0217a7bc ; case 2
    b .L_0217a7bc ; case 3
    b .L_0217a7bc ; case 4
    b .L_0217a898 ; case 5
    b .L_0217a968 ; case 6
    b .L_0217a968 ; case 7
    b .L_0217a968 ; case 8
    b .L_0217a968 ; case 9
    b .L_0217a968 ; case 10
    b .L_0217a968 ; case 11
    b .L_0217a968 ; case 12
    b .L_0217a968 ; case 13
    b .L_0217a968 ; case 14
    b .L_0217a968 ; case 15
    b .L_0217a8d4 ; case 16
    b .L_0217a8f4 ; case 17
.L_0217a67c:
    ldrb r0, [r4, #0x39]
    cmp r0, #0x5
    bne .L_0217a6dc
    ldr r0, [r4, #0x2c]
    mov r1, #0x1d
    bl func_ov011_02179130
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x40]
    beq .L_0217a968
    ldr r0, [r4, #0x24]
    ldrb r0, [r0, #0x36]
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x40]
    beq .L_0217a968
    ldr r0, [r4, #0x2c]
    mov r1, #0x1a
    bl func_ov011_02179130
    cmp r0, #0x0
    beq .L_0217a6e8
    mov r0, #0x0
    strb r0, [r4, #0x40]
    b .L_0217a968
.L_0217a6dc:
    mov r0, #0x0
    strb r0, [r4, #0x40]
    b .L_0217a968
.L_0217a6e8:
    ldr r0, [r4, #0x2c]
    mov r1, #0x12
    bl func_ov011_0217ab28
    cmp r0, #0x0
    bne .L_0217a7ac
    ldr r0, [r4, #0x24]
    mov r8, #0x0
    ldr r9, [r0, #0x1c]
    add r6, sp, #0x10
    add r5, sp, #0x0
    mov r7, #0x1
    b .L_0217a758
.L_0217a718:
    ldr r10, [r9, #0x8]
    mov r0, r10
    bl func_ov011_02174f4c
    add r1, r0, #0xd
    mov r1, r7, lsl r1
    add r2, r0, #0xb
    orr r1, r1, r7, lsl r2
    add r2, r0, #0xf
    orr r1, r1, r7, lsl r2
    ldr r2, [r10, #0x68]
    ldr r9, [r9, #0x0]
    tst r2, r1
    addeq r1, r8, #0x1
    streq r10, [r6, r8, lsl #0x2]
    streqb r0, [r5, r8]
    andeq r8, r1, #0xff
.L_0217a758:
    cmp r9, #0x0
    bne .L_0217a718
    cmp r8, #0x0
    beq .L_0217a7ac
    ldr r0, .L_0217aa54
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r8
    bl func_0200d338
    add r0, sp, #0x10
    and r6, r1, #0xff
    ldr r5, [r0, r6, lsl #0x2]
    ldr r0, [r5, #0x30]
    ldr r0, [r0, #0x4]
    bl func_02028330
    add r1, sp, #0x0
    ldrb r1, [r1, r6]
    mov r0, r5
    mov r2, #0x0
    bl func_ov011_02174ebc
.L_0217a7ac:
    ldrb r0, [r4, #0x40]
    add r0, r0, #0x1
    strb r0, [r4, #0x40]
    b .L_0217a968
.L_0217a7bc:
    ldrsb r0, [r4, #0x38]
    mov r1, #0x0
    mov r3, r1
    cmp r0, #0x0
    ldrltb r0, [r4, #0x107]
    mov r2, r1
    strltb r0, [r4, #0x38]
    add r0, sp, #0x50
.L_0217a7dc:
    str r2, [r0, r3, lsl #0x2]
    add r3, r3, #0x1
    cmp r3, #0x10
    blt .L_0217a7dc
    ldr r0, [r4, #0x24]
    add r2, sp, #0x50
    ldr r7, [r0, #0x1c]
    mov r5, #0x1
    b .L_0217a824
.L_0217a800:
    ldr r6, [r7, #0x8]
    ldrsb r3, [r4, #0x38]
    ldr r0, [r6, #0x6c]
    ldr r7, [r7, #0x0]
    tst r0, r5, lsl r3
    addne r0, r1, #0x1
    movne r0, r0, lsl #0x10
    strne r6, [r2, r1, lsl #0x2]
    movne r1, r0, asr #0x10
.L_0217a824:
    cmp r7, #0x0
    bne .L_0217a800
    cmp r1, #0x0
    moveq r0, #0x0
    beq .L_0217a84c
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x38]
    bl func_0200d338
    add r0, sp, #0x50
    ldr r0, [r0, r1, lsl #0x2]
.L_0217a84c:
    cmp r0, #0x0
    ldreqb r0, [r4, #0x40]
    addeq r0, r0, #0x1
    streqb r0, [r4, #0x40]
    beq .L_0217a968
    ldrb r2, [r0, #0xc3]
    ldrb r1, [r0, #0xc2]
    ldr r3, [r4, #0x18]
    mov r0, #0x1
    strh r1, [r3, #0xc]
    strh r2, [r3, #0xe]
    strb r0, [r3, #0x10]
    mov r0, #0x4
    strb r0, [r3, #0x11]
    mov r0, #0x0
    strh r0, [r4, #0x3c]
    mov r0, #0x5
    strb r0, [r4, #0x40]
    b .L_0217a968
.L_0217a898:
    ldr r0, [r4, #0x24]
    ldr r5, [r0, #0x1c]
    b .L_0217a8c0
.L_0217a8a4:
    ldr r6, [r5, #0x8]
    ldr r0, [r6, #0x30]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    mov r0, r6
    bl func_ov011_02174f24
    ldr r5, [r5, #0x0]
.L_0217a8c0:
    cmp r5, #0x0
    bne .L_0217a8a4
    mov r0, #0x0
    strb r0, [r4, #0x40]
    b .L_0217a968
.L_0217a8d4:
    ldr r0, [r4, #0x24]
    ldrb r0, [r0, #0x36]
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x40]
    addne r0, r1, #0x1
    strneb r0, [r4, #0x40]
    b .L_0217a968
.L_0217a8f4:
    ldr r6, [r4, #0x24]
    ldr r0, [r4, #0x2c]
    ldrb r1, [r6, #0x39]
    ldr r0, [r0, #0x38]
    mov r5, #0x0
    bl func_0200d338
    ldr r0, [r6, #0x1c]
    b .L_0217a924
.L_0217a914:
    cmp r1, #0x0
    ldreq r5, [r0, #0x8]
    beq .L_0217a92c
    ldr r0, [r0, #0x0]
.L_0217a924:
    cmp r0, #0x0
    bne .L_0217a914
.L_0217a92c:
    cmp r5, #0x0
    beq .L_0217a960
    ldrb r2, [r5, #0xc3]
    ldrb r1, [r5, #0xc2]
    ldr r3, [r4, #0x18]
    mov r0, #0x1
    strh r1, [r3, #0xc]
    strh r2, [r3, #0xe]
    strb r0, [r3, #0x10]
    mov r0, #0x4
    strb r0, [r3, #0x11]
    mov r0, #0x0
    strh r0, [r4, #0x3c]
.L_0217a960:
    mov r0, #0x0
    strb r0, [r4, #0x40]
.L_0217a968:
    mov r0, r4
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    beq .L_0217aa48
    ldr r0, [r4, #0x24]
    ldrsb r5, [r4, #0x3a]
    ldr r0, [r0, #0x0]
    cmp r5, #0xd
    ldr r6, [r0, #0xc]
    blt .L_0217a9bc
    sub r1, r5, #0xd
    mov r1, r1, lsl #0x18
    mov r1, r1, asr #0x18
    and r1, r1, #0xff
    cmp r1, #0x1
    bhi .L_0217a9bc
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    add r0, r5, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r5, r0, asr #0x18
.L_0217a9bc:
    cmp r5, #0x0
    ble .L_0217a9cc
    cmp r5, #0x18
    blt .L_0217a9d4
.L_0217a9cc:
    mov r0, #0x0
    b .L_0217aa04
.L_0217a9d4:
    mov r0, r5
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r6
    bl func_ov011_0217b7cc
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0217aa04
    ldrb r0, [r0, #0x94]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
.L_0217aa04:
    cmp r0, #0x0
    ldrneb r0, [r4, #0x39]
    cmpne r0, #0x9
    movne r0, #0x9
    strneb r0, [r4, #0x39]
    movne r0, #0x0
    strneb r0, [r4, #0x3e]
    bne .L_0217aa48
    ldr r0, [r4, #0x20]
    ldrsh r0, [r0, #0xcc]
    cmp r0, #0x0
    ldrneb r0, [r4, #0x39]
    cmpne r0, #0xa
    movne r0, #0xa
    strneb r0, [r4, #0x39]
    movne r0, #0x0
    strneb r0, [r4, #0x3e]
.L_0217aa48:
    add sp, sp, #0x90
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0217aa50: .word data_ov011_02181980
.L_0217aa54: .word data_020a0da8
    arm_func_end func_ov011_0217a608

    .global func_ov011_0217aa58
    arm_func_start func_ov011_0217aa58
func_ov011_0217aa58: ; 0x0217aa58
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f24
    ldr r1, [r4, #0xd4]
    mov r0, #0x0
    bic r1, r1, #0x1100
    str r1, [r4, #0xd4]
    strb r0, [r4, #0x39]
    strb r0, [r4, #0x3e]
    strb r0, [r4, #0x3a]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217aa58

    .global func_ov011_0217aa8c
    arm_func_start func_ov011_0217aa8c
func_ov011_0217aa8c: ; 0x0217aa8c
    stmdb sp!, {r3, lr}
    ldr ip, [r0, #0x4c]
    mov r3, #0x1
    tst ip, r3, lsl r2
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    strb r3, [r0, #0x39]
    mov r3, #0x0
    strb r3, [r0, #0x3e]
    strb r1, [r0, #0x38]
    strb r2, [r0, #0x3a]
    ldr r0, [r0, #0x24]
    and r1, r2, #0xff
    ldr r0, [r0, #0x0]
    mov r2, r3
    bl func_ov011_02174ebc
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_0217aa8c

    .global func_ov011_0217aad4
    arm_func_start func_ov011_0217aad4
func_ov011_0217aad4: ; 0x0217aad4
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    mov r7, #0x0
    ldr r6, .L_0217ab24
    str r7, [r4, #0x4c]
    mov r5, #0x1
    ldrsb r8, [r6, r7]
    add r0, r6, r7
    cmp r8, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ldrsb r1, [r0, #0x16]
    ldr r0, [r4, #0x2c]
    bl func_ov011_0217ab28
    cmp r0, #0x0
    ldrne r0, [r4, #0x4c]
    add r7, r7, #0x1
    orrne r0, r0, r5, lsl r8
    strne r0, [r4, #0x4c]
    b #-0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217ab24: .word data_ov011_0218140c
    arm_func_end func_ov011_0217aad4

    .global func_ov011_0217ab28
    arm_func_start func_ov011_0217ab28
func_ov011_0217ab28: ; 0x0217ab28
    mov r2, r1, asr #0x5
    add r2, r0, r2, lsl #0x2
    bic r0, r1, #0x1f
    sub r1, r1, r0
    ldr r2, [r2, #0x34]
    mov r0, #0x1
    tst r2, r0, lsl r1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217ab28

    .global func_ov011_0217ab4c
    arm_func_start func_ov011_0217ab4c
func_ov011_0217ab4c: ; 0x0217ab4c
    mov r3, #0x6
    strb r3, [r0, #0x39]
    mov r3, #0x0
    strb r3, [r0, #0x3e]
    strb r1, [r0, #0x38]
    strb r2, [r0, #0x43]
    bx lr
    arm_func_end func_ov011_0217ab4c

    .global func_ov011_0217ab68
    arm_func_start func_ov011_0217ab68
func_ov011_0217ab68: ; 0x0217ab68
    ldrb r0, [r0, #0x39]
    add r0, r0, #0xfa
    and r0, r0, #0xff
    cmp r0, #0x1
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
    arm_func_end func_ov011_0217ab68

    .global func_ov011_0217ab84
    arm_func_start func_ov011_0217ab84
func_ov011_0217ab84: ; 0x0217ab84
    ldr r3, [r0, #0x4c]
    mov r2, #0x1
    tst r3, r2, lsl r1
    mov r3, #0x2
    strb r3, [r0, #0x39]
    mov r2, #0x0
    movne r1, #0x0
    strb r2, [r0, #0x3e]
    strb r1, [r0, #0x3a]
    strb r3, [r0, #0x105]
    ldr r1, [r0, #0xd4]
    orr r1, r1, #0x400
    str r1, [r0, #0xd4]
    bx lr
    arm_func_end func_ov011_0217ab84

    .global func_ov011_0217abbc
    arm_func_start func_ov011_0217abbc
func_ov011_0217abbc: ; 0x0217abbc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldrsb r1, [r4, #0x38]
    cmp r1, #0x0
    bge .L_0217abe4
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r4, #0x105]
    b .L_0217b068
.L_0217abe4:
    ldr r0, [r4, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldrsb r2, [r4, #0x38]
    ldr r1, [r0, #0x10]
    mov r0, #0x10c
    add r3, r1, #0xa8
    mov r1, #0x0
    mla r5, r2, r0, r3
    mov r0, r4
    strb r1, [r4, #0x3a]
    bl func_ov011_0217335c
    cmp r0, #0x0
    beq .L_0217b068
    mov r0, r5
    bl func_ov011_021733dc
    cmp r0, #0x0
    beq .L_0217ac40
    mov r0, r4
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r4, #0x105]
    b .L_0217b068
.L_0217ac40:
    ldr r0, [r4, #0x2c]
    mov r1, #0x6
    bl func_ov011_0217ab28
    cmp r0, #0x0
    ldreq r0, [r5, #0x20]
    ldreqsb r0, [r0, #0x18]
    cmpeq r0, #0x3
    bne .L_0217acb0
    ldrsb r0, [r4, #0x38]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x50
    bgt .L_0217acb0
    ldrb r1, [r4, #0x104]
    ldr r0, [r4, #0x2c]
    bl func_ov011_0217b078
    cmp r0, #0x0
    beq .L_0217acb0
    mov r1, #0x8
    strb r1, [r4, #0x3a]
    ldr r0, [r4, #0x24]
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    bl func_ov011_02174ebc
    ldrb r0, [r4, #0x39]
    add r0, r0, #0x1
    strb r0, [r4, #0x39]
    b .L_0217b068
.L_0217acb0:
    ldr r0, [r4, #0x2c]
    mov r1, #0x8
    bl func_ov011_0217ab28
    cmp r0, #0x0
    bne .L_0217ad54
    ldr r1, [r4, #0x24]
    ldrb r0, [r1, #0x3c]
    cmp r0, #0x2
    ldrhsb r0, [r1, #0x36]
    cmphs r0, #0x1
    blo .L_0217ad54
    ldrb r0, [r4, #0x104]
    sub r0, r0, #0x5
    mov r0, r0, lsl #0x18
    movs r1, r0, asr #0x18
    movmi r1, #0x0
    ldr r0, [r4, #0x2c]
    and r1, r1, #0xff
    bl func_ov011_0217b078
    cmp r0, #0x0
    beq .L_0217ad54
    ldr r0, [r4, #0x24]
    ldr r2, [r0, #0x14]
    b .L_0217ad24
.L_0217ad10:
    ldr r1, [r2, #0x8]
    ldr r0, [r1, #0xa8]
    bic r0, r0, #0x400
    str r0, [r1, #0xa8]
    ldr r2, [r2, #0x0]
.L_0217ad24:
    cmp r2, #0x0
    bne .L_0217ad10
    mov r1, #0xc
    strb r1, [r4, #0x3a]
    ldr r0, [r4, #0x24]
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    bl func_ov011_02174ebc
    ldrb r0, [r4, #0x39]
    add r0, r0, #0x1
    strb r0, [r4, #0x39]
    b .L_0217b068
.L_0217ad54:
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x38]
    tst r0, #0x3
    beq .L_0217ae04
    mov r0, r0, lsr #0x1
    mov r7, #0x0
    ldr r5, .L_0217b070
    mov r6, r7
    and r8, r0, #0xff
.L_0217ad78:
    add r9, r6, r6, lsl #0x1
    ldrsb r0, [r5, r9]
    cmp r0, #0x0
    blt .L_0217ade4
    add r1, r5, r9
    ldrsb r2, [r1, #0x2]
    ldr r0, [r4, #0x2c]
    ldrsb r1, [r1, #0x1]
    add r2, r0, r2
    ldrb r2, [r2, #0x8]
    add r7, r7, r2
    bl func_ov011_0217ab28
    cmp r0, #0x0
    bne .L_0217addc
    cmp r7, r8
    blo .L_0217addc
    ldr r0, .L_0217b070
    ldrsb r0, [r0, r9]
    cmp r0, #0x7f
    moveq r0, #0x10
    streqb r0, [r4, #0x40]
    moveq r0, #0x0
    streqb r0, [r4, #0x3a]
    strneb r0, [r4, #0x3a]
    b .L_0217ade4
.L_0217addc:
    add r6, r6, #0x1
    b .L_0217ad78
.L_0217ade4:
    ldrb r1, [r4, #0x3a]
    cmp r1, #0x0
    beq .L_0217b054
    ldr r0, [r4, #0x24]
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    bl func_ov011_02174ebc
    b .L_0217b054
.L_0217ae04:
    mov r1, #0x0
    str r1, [r4, #0x48]
    ldrb r0, [r4, #0x10a]
    cmp r0, #0xa0
    bls .L_0217ae68
    ldr r0, [r4, #0x24]
    mov r1, #0x2
    bl func_ov011_0217b0a8
    ldr r2, [r4, #0x48]
    mov r1, #0x2
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0c0
    ldr r2, [r4, #0x48]
    mov r1, #0x2
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0d8
    ldr r1, [r4, #0x48]
    mov r2, #0x2
    orr r0, r1, r0
    str r0, [r4, #0x48]
    b .L_0217af04
.L_0217ae68:
    cmp r0, #0x50
    ldr r0, [r4, #0x24]
    bls .L_0217aec0
    mov r1, #0x1
    bl func_ov011_0217b0a8
    ldr r2, [r4, #0x48]
    mov r1, #0x1
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0c0
    ldr r2, [r4, #0x48]
    mov r1, #0x1
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0d8
    ldr r1, [r4, #0x48]
    mov r2, #0x1
    orr r0, r1, r0
    str r0, [r4, #0x48]
    b .L_0217af04
.L_0217aec0:
    bl func_ov011_0217b0a8
    ldr r2, [r4, #0x48]
    mov r1, #0x0
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0c0
    ldr r2, [r4, #0x48]
    mov r1, #0x0
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0d8
    ldr r1, [r4, #0x48]
    mov r2, #0x0
    orr r0, r1, r0
    str r0, [r4, #0x48]
.L_0217af04:
    ldr r0, [r4, #0x48]
    ands r1, r0, #0x7e
    str r1, [r4, #0x48]
    bne .L_0217af98
    sub r5, r2, #0x1
    mvn r6, #0x0
    b .L_0217af74
.L_0217af20:
    ldr r0, [r4, #0x24]
    and r1, r5, #0xff
    bl func_ov011_0217b0a8
    ldr r2, [r4, #0x48]
    and r1, r5, #0xff
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0c0
    ldr r2, [r4, #0x48]
    and r1, r5, #0xff
    orr r0, r2, r0
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bl func_ov011_0217b0d8
    ldr r1, [r4, #0x48]
    orr r0, r1, r0
    ands r1, r0, #0x7e
    str r1, [r4, #0x48]
    bne .L_0217af7c
    sub r5, r5, #0x1
.L_0217af74:
    cmp r5, r6
    bgt .L_0217af20
.L_0217af7c:
    cmp r1, #0x0
    bne .L_0217af98
    mov r0, r4
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r4, #0x105]
    b .L_0217b068
.L_0217af98:
    ldr r0, [r4, #0x2c]
    mov r1, #0x0
    bl func_ov011_0217ab28
    cmp r0, #0x0
    ldrne r0, [r4, #0x48]
    mov r1, #0x1
    bicne r0, r0, #0x2a
    strne r0, [r4, #0x48]
    ldr r0, [r4, #0x2c]
    bl func_ov011_0217ab28
    cmp r0, #0x0
    ldrne r0, [r4, #0x48]
    bicne r0, r0, #0x54
    strne r0, [r4, #0x48]
    ldr r6, [r4, #0x48]
    cmp r6, #0x0
    bne .L_0217aff0
    mov r0, r4
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r4, #0x105]
    b .L_0217b068
.L_0217aff0:
    mov r5, #0x0
    mov r3, r5
    add r0, sp, #0x0
    mov r2, #0x1
.L_0217b000:
    tst r6, r2, lsl r3
    strneb r3, [r0, r5]
    addne r1, r5, #0x1
    add r3, r3, #0x1
    andne r5, r1, #0xff
    cmp r3, #0x18
    blt .L_0217b000
    cmp r5, #0x0
    beq .L_0217b054
    ldr r0, .L_0217b074
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r5
    bl func_0200d338
    add r0, sp, #0x0
    ldr r2, [r4, #0x24]
    ldrb r1, [r0, r1]
    ldr r0, [r2, #0x0]
    mov r2, #0x0
    bl func_ov011_02174ebc
.L_0217b054:
    ldrb r1, [r4, #0x39]
    mov r0, #0x0
    add r1, r1, #0x1
    strb r1, [r4, #0x39]
    strb r0, [r4, #0x3e]
.L_0217b068:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0217b070: .word data_ov011_02181438
.L_0217b074: .word data_020a0da8
    arm_func_end func_ov011_0217abbc

    .global func_ov011_0217b078
    arm_func_start func_ov011_0217b078
func_ov011_0217b078: ; 0x0217b078
    cmp r1, #0x8
    movhs r0, #0x1
    bxhs lr
    ldr r2, .L_0217b0a4
    ldr r3, [r0, #0x38]
    ldr r0, [r2, r1, lsl #0x2]
    and r1, r3, #0xff
    cmp r1, r0
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_0217b0a4: .word data_ov011_0218190c
    arm_func_end func_ov011_0217b078

    .global func_ov011_0217b0a8
    arm_func_start func_ov011_0217b0a8
func_ov011_0217b0a8: ; 0x0217b0a8
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addne r0, r0, r1, lsl #0x2
    ldrne r0, [r0, #0x84]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217b0a8

    .global func_ov011_0217b0c0
    arm_func_start func_ov011_0217b0c0
func_ov011_0217b0c0: ; 0x0217b0c0
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addne r0, r0, r1, lsl #0x2
    ldrne r0, [r0, #0x90]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217b0c0

    .global func_ov011_0217b0d8
    arm_func_start func_ov011_0217b0d8
func_ov011_0217b0d8: ; 0x0217b0d8
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addne r0, r0, r1, lsl #0x2
    ldrne r0, [r0, #0x9c]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217b0d8

    .global func_ov011_0217b0f0
    arm_func_start func_ov011_0217b0f0
func_ov011_0217b0f0: ; 0x0217b0f0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    ldr r0, [r10, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldrsb r2, [r10, #0x38]
    ldr r8, [r0, #0x10]
    ldrb r1, [r10, #0x3a]
    add r3, r8, #0xa8
    mov r0, #0x10c
    mla r5, r2, r0, r3
    cmp r1, #0x8
    bne .L_0217b144
    ldr r0, [r5, #0x20]
    ldrsb r0, [r0, #0x18]
    cmp r0, #0x3
    movne r0, #0x0
    strneb r0, [r10, #0x39]
    strneb r0, [r10, #0x3e]
    bne .L_0217b4e8
.L_0217b144:
    ldr r0, [r10, #0xd4]
    mov r7, #0x0
    tst r0, #0x2
    beq .L_0217b270
    mov r6, r7
    mov r11, r7
    mov r9, r7
    mvn r4, #0x0
.L_0217b164:
    ldr r0, [r10, #0x24]
    mov r1, r9
    bl func_ov011_0217b504
    add r1, sp, #0x4
    str r0, [r1, r9, lsl #0x2]
    ldrsb r2, [r10, #0x38]
    mov r1, #0x1
    orr r7, r7, r0
    mov r1, r1, lsl r2
    orr r1, r1, r1, lsl #0x4
    tst r0, r1
    addeq r0, sp, #0x0
    streqb r4, [r0, r9]
    beq .L_0217b1b4
    ldr r0, [r10, #0x24]
    mov r1, r9
    mov r6, #0x1
    bl func_ov011_0217b51c
    add r1, sp, #0x0
    strb r0, [r1, r9]
.L_0217b1b4:
    add r0, sp, #0x4
    ldr r0, [r0, r9, lsl #0x2]
    tst r0, #0xff
    addeq r0, sp, #0x2
    streqb r4, [r0, r9]
    beq .L_0217b1e4
    ldr r0, [r10, #0x24]
    mov r1, r9
    mov r11, #0x1
    bl func_ov011_0217b51c
    add r1, sp, #0x2
    strb r0, [r1, r9]
.L_0217b1e4:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_0217b164
    cmp r7, #0x0
    mvneq r1, #0x0
    beq .L_0217b328
    cmp r6, #0x0
    mvn r4, #0x0
    beq .L_0217b220
    add r1, sp, #0x0
    add r2, sp, #0x4
    mov r0, r10
    bl func_ov011_0217b534
    mov r4, r0
    b .L_0217b23c
.L_0217b220:
    cmp r11, #0x0
    beq .L_0217b23c
    add r1, sp, #0x2
    add r2, sp, #0x4
    mov r0, r10
    bl func_ov011_0217b534
    mov r4, r0
.L_0217b23c:
    cmp r4, #0x0
    blt .L_0217b324
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    bl func_ov011_02176d14
    strb r4, [r10, #0x3a]
    mov r0, #0x0
    strb r0, [r10, #0x3e]
    ldrb r0, [r10, #0x39]
    mov r1, #0x1
    add r0, r0, #0x1
    strb r0, [r10, #0x39]
    b .L_0217b328
.L_0217b270:
    mov r0, r10
    bl func_ov011_0217c01c
    mov r6, r7
    mov r4, #0x1
    b .L_0217b2f0
.L_0217b284:
    ldr r0, [r10, #0x2c]
    add r1, r6, #0x2
    bl func_ov011_0217ab28
    cmp r0, #0x0
    bne .L_0217b2ec
    cmp r6, #0x0
    beq .L_0217b2c8
    ldr r0, [r10, #0xd4]
    tst r0, #0x2000000
    bne .L_0217b2ec
    ldr r0, [r10, #0x20]
    ldr r0, [r0, #0x1a8]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x5c]
    ldrsh r0, [r0, #0x26]
    cmp r0, #0x0
    blt .L_0217b2ec
.L_0217b2c8:
    ldr r0, [r10, #0x24]
    mov r1, r6
    bl func_ov011_0217b504
    ldrsb r1, [r10, #0x38]
    tst r0, r4, lsl r1
    addne r0, r6, #0x9
    movne r7, r4
    strneb r0, [r10, #0x3a]
    bne .L_0217b2f8
.L_0217b2ec:
    add r6, r6, #0x1
.L_0217b2f0:
    cmp r6, #0x2
    blt .L_0217b284
.L_0217b2f8:
    cmp r7, #0x0
    beq .L_0217b324
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    bl func_ov011_02176d14
    mov r0, #0x3
    strb r0, [r10, #0x39]
    mov r0, #0x0
    strb r0, [r10, #0x3e]
    mov r1, #0x1
    b .L_0217b328
.L_0217b324:
    mov r1, #0x0
.L_0217b328:
    cmp r1, #0x1
    beq .L_0217b4e8
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0217b354
    ldr r0, [r0, #0x180]
    tst r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
.L_0217b354:
    cmp r0, #0x0
    beq .L_0217b410
    mov r0, r10
    bl func_ov011_0217c01c
    cmp r0, #0x0
    beq .L_0217b4e8
    ldr r0, [r10, #0xd4]
    tst r0, #0x2
    beq .L_0217b3e4
    mov r5, #0x0
    mov r4, #0x1
    b .L_0217b3dc
.L_0217b384:
    ldr r0, [r10, #0x24]
    mov r1, r5
    bl func_ov011_0217b504
    ldrsb r1, [r10, #0x38]
    tst r0, r4, lsl r1
    beq .L_0217b3d8
    ldrb r0, [r10, #0x3a]
    cmp r0, #0x0
    ldrneb r0, [r10, #0x39]
    addne r0, r0, #0x1
    moveq r0, #0x7
    strb r0, [r10, #0x39]
    mov r0, #0x0
    strb r0, [r10, #0x3e]
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    cmp r0, #0x0
    ldrne r1, [r0, #0x180]
    bicne r1, r1, #0x4
    strne r1, [r0, #0x180]
    b .L_0217b4e8
.L_0217b3d8:
    add r5, r5, #0x1
.L_0217b3dc:
    cmp r5, #0x2
    blt .L_0217b384
.L_0217b3e4:
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    cmp r0, #0x0
    ldrne r1, [r0, #0x180]
    bicne r1, r1, #0x4
    strne r1, [r0, #0x180]
    mov r0, r10
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r10, #0x105]
    b .L_0217b4e8
.L_0217b410:
    ldr r0, [r5, #0x20]
    ldrsb r0, [r0, #0x18]
    cmp r0, #0x17
    beq .L_0217b4e8
    ldrsb r1, [r10, #0x38]
    add r0, r10, r1, lsl #0x2
    ldr r0, [r0, #0xdc]
    add r1, r8, r1, lsl #0x2
    cmp r0, #0x2800
    ldr r4, [r1, #0x98]
    bge .L_0217b474
    ldrsh r1, [r10, #0xc0]
    ldrsh r0, [r5, #0xc0]
    cmp r1, r0
    bne .L_0217b474
    ldrb r0, [r10, #0x3e]
    cmp r0, #0x2
    bls .L_0217b474
    mov r0, #0x0
    strb r0, [r10, #0x39]
    strb r0, [r10, #0x3e]
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    bl func_ov011_02176d14
    b .L_0217b4e8
.L_0217b474:
    ldrb r0, [r10, #0x3e]
    cmp r0, #0xff
    addlo r0, r0, #0x1
    strlob r0, [r10, #0x3e]
    ldr r0, [r5, #0xd4]
    tst r0, #0x2
    beq .L_0217b4a8
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    mov r1, r4
    mvn r2, #0x0
    bl func_ov011_02176d64
    b .L_0217b4e8
.L_0217b4a8:
    ldrsb r0, [r5, #0xc4]
    bl func_02083acc
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r10, #0x39]
    streqb r0, [r10, #0x3e]
    beq .L_0217b4e8
    ldr r0, [r4, #0x0]
    str r0, [sp, #0xc]
    ldr r0, [r5, #0xb4]
    str r0, [sp, #0x10]
    ldr r0, [r10, #0x24]
    bl func_ov011_0217b4f0
    ldrsh r2, [r5, #0xc0]
    add r1, sp, #0xc
    bl func_ov011_02176d64
.L_0217b4e8:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov011_0217b0f0

    .global func_ov011_0217b4f0
    arm_func_start func_ov011_0217b4f0
func_ov011_0217b4f0: ; 0x0217b4f0
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x8]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217b4f0

    .global func_ov011_0217b504
    arm_func_start func_ov011_0217b504
func_ov011_0217b504: ; 0x0217b504
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addne r0, r0, r1, lsl #0x2
    ldrne r0, [r0, #0x6c]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217b504

    .global func_ov011_0217b51c
    arm_func_start func_ov011_0217b51c
func_ov011_0217b51c: ; 0x0217b51c
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addne r0, r0, r1
    ldrnesb r0, [r0, #0xc0]
    mvneq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217b51c

    .global func_ov011_0217b534
    arm_func_start func_ov011_0217b534
func_ov011_0217b534: ; 0x0217b534
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldr r0, [r7, #0x1c]
    mov r6, r1
    str r2, [sp, #0x0]
    bl func_ov011_02175628
    ldr r3, [r0, #0x4]
    ldr r0, [r7, #0x24]
    mov r4, #0x0
    ldr r2, [r0, #0x0]
    ldrb r1, [r7, #0x104]
    ldr r0, [r7, #0x2c]
    mov r5, r4
    ldr r9, [r3, #0x10]
    ldr r11, [r2, #0xc]
    mvn r8, #0x0
    bl func_ov011_0217b078
    cmp r0, #0x0
    beq .L_0217b5f4
    mov r0, #0x1
    add r1, r9, #0xa8
    mov r2, r4
    mov r9, r0
.L_0217b594:
    cmp r7, r1
    ldrne r3, [r1, #0x24]
    cmpne r3, #0x0
    beq .L_0217b5e4
    ldr ip, [r3, #0x0]
    ldr r3, [r3, #0x4]
    ldr ip, [ip, #0xa8]
    tst ip, #0x80
    bne .L_0217b5c0
    tst ip, #0x100
    beq .L_0217b5c8
.L_0217b5c0:
    orr r5, r5, r0, lsl r2
    and r5, r5, #0xff
.L_0217b5c8:
    cmp r3, #0x0
    beq .L_0217b5e4
    ldr r3, [r3, #0xa8]
    tst r3, #0x100
    movne r3, r9, lsl r2
    orrne r3, r5, r3, lsl #0x4
    andne r5, r3, #0xff
.L_0217b5e4:
    add r2, r2, #0x1
    cmp r2, #0x4
    add r1, r1, #0x10c
    blt .L_0217b594
.L_0217b5f4:
    mov r9, #0x0
    str r9, [sp, #0x4]
.L_0217b5fc:
    ldrsb r0, [r6, r9]
    ldr r1, .L_0217b7c4
    mvn r2, #0x0
    strb r2, [r1, r9]
    cmp r0, #0x0
    blt .L_0217b6b0
    cmp r0, #0x18
    bge .L_0217b6b0
    ldr r1, [r7, #0x4c]
    mov r2, #0x1
    tst r1, r2, lsl r0
    bne .L_0217b6b0
    ldr r1, [sp, #0x0]
    ldr r1, [r1, r9, lsl #0x2]
    tst r5, r1
    beq .L_0217b698
    str r2, [sp, #0x4]
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r11
    bl func_ov011_0217b7cc
    cmp r0, #0x0
    beq .L_0217b6b0
    mov r2, #0x0
    mov r3, r2
    add r1, r0, #0x9c
    ldrb ip, [r0, #0xc]
    mov lr, #0x1
    b .L_0217b688
.L_0217b670:
    ldrb r0, [r1, #0x18]
    add r3, r3, #0x1
    add r1, r1, #0x20
    cmp r0, #0x2
    cmpne r0, #0x4
    moveq r2, lr
.L_0217b688:
    cmp r3, ip
    blt .L_0217b670
    cmp r2, #0x0
    beq .L_0217b6b0
.L_0217b698:
    ldrsb r1, [r6, r9]
    ldr r0, .L_0217b7c4
    add r2, r4, #0x1
    strb r1, [r0, r4]
    mov r0, r2, lsl #0x18
    mov r4, r0, asr #0x18
.L_0217b6b0:
    add r0, r9, #0x1
    and r9, r0, #0xff
    cmp r9, #0x2
    blo .L_0217b5fc
    cmp r4, #0x0
    beq .L_0217b6fc
    cmp r4, #0x1
    ldreq r0, .L_0217b7c4
    ldreqsb r8, [r0, #0x0]
    beq .L_0217b7b8
    ldr r0, .L_0217b7c8
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r4
    bl func_0200d338
    ldr r0, .L_0217b7c4
    ldrsb r8, [r0, r1]
    b .L_0217b7b8
.L_0217b6fc:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_0217b7b8
    ldr r0, [r7, #0x2c]
    mov r1, #0x4
    bl func_ov011_0217ab28
    cmp r0, #0x0
    bne .L_0217b7b8
    ldr r1, [r7, #0x24]
    ldrb r0, [r1, #0x36]
    cmp r0, #0x0
    beq .L_0217b7b8
    ldr r0, [r1, #0x0]
    mov r5, #0x100
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    mov r0, r0, lsl #0x1
    add r0, r0, #0xd
    mov r6, #0x0
    mov r4, r0, lsl #0x18
    mov r9, r6
.L_0217b750:
    add r7, r6, r4, asr #0x18
    mov r0, r7, lsl #0x18
    mov r0, r0, asr #0x18
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r11
    bl func_ov011_0217b7cc
    mov r1, r9
    add r3, r0, #0x9c
    ldrb r2, [r0, #0xc]
    b .L_0217b794
.L_0217b77c:
    ldrb r0, [r3, #0x18]
    cmp r0, #0x4
    ldreqsh r10, [r3, #0x14]
    beq .L_0217b79c
    add r1, r1, #0x1
    add r3, r3, #0x20
.L_0217b794:
    cmp r1, r2
    blt .L_0217b77c
.L_0217b79c:
    cmp r5, r10
    movgt r0, r7, lsl #0x18
    add r6, r6, #0x1
    movgt r5, r10
    movgt r8, r0, asr #0x18
    cmp r6, #0x2
    blt .L_0217b750
.L_0217b7b8:
    mov r0, r8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217b7c4: .word data_ov011_021ac1b8
.L_0217b7c8: .word data_020a0da8
    arm_func_end func_ov011_0217b534

    .global func_ov011_0217b7cc
    arm_func_start func_ov011_0217b7cc
func_ov011_0217b7cc: ; 0x0217b7cc
    cmp r1, #0x0
    movlt r0, #0x0
    bxlt lr
    add r1, r0, r1, lsl #0x2
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    movlt r0, #0x0
    addge r0, r0, r1
    bx lr
    arm_func_end func_ov011_0217b7cc

    .global func_ov011_0217b7f0
    arm_func_start func_ov011_0217b7f0
func_ov011_0217b7f0: ; 0x0217b7f0
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrb r2, [r4, #0x3a]
    mov r1, #0x0
    mov r5, #0x0
    add r0, r2, #0xfd
    and r0, r0, #0xff
    cmp r0, #0x1
    add r0, r2, #0xf9
    ldr r2, [r4, #0xd4]
    and r0, r0, #0xff
    movls r1, #0x1
    cmp r0, #0x1
    movls r5, #0x1
    tst r2, #0x2
    beq .L_0217b88c
    cmp r1, #0x0
    cmpeq r5, #0x0
    beq .L_0217b88c
    ldr r0, [r4, #0x14]
    cmp r1, #0x0
    ldr r6, [r0, #0x0]
    beq .L_0217b86c
    mov r1, #0x200
    tst r2, #0x80
    movne r1, #0x100
    mov r0, r6
    mov r2, #0xd
    bl func_ov011_0217b8a4
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_0217b86c:
    cmp r5, #0x0
    beq .L_0217b88c
    mov r0, r6
    mov r1, #0x2
    mov r2, #0xa
    bl func_ov011_0217b8a4
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_0217b88c:
    mov r1, #0x3
    mov r0, #0x0
    strb r1, [r4, #0x39]
    strb r0, [r4, #0x3f]
    strb r0, [r4, #0x3e]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_0217b7f0

    .global func_ov011_0217b8a4
    arm_func_start func_ov011_0217b8a4
func_ov011_0217b8a4: ; 0x0217b8a4
    stmdb sp!, {r4, lr}
    ldr r3, [r0, #0x130]
    cmp r2, #0x10
    movhs r2, #0xf
    mov ip, #0x0
    sub r3, r3, r2
    mov r4, ip
    and lr, r3, #0xf
    b .L_0217b8e0
.L_0217b8c8:
    add r3, lr, r4
    mov r3, r3, lsl #0x1c
    add r3, r0, r3, lsr #0x1a
    ldr r3, [r3, #0xec]
    add r4, r4, #0x1
    orr ip, ip, r3
.L_0217b8e0:
    cmp r4, r2
    blo .L_0217b8c8
    tst ip, r1
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217b8a4

    .global func_ov011_0217b8f8
    arm_func_start func_ov011_0217b8f8
func_ov011_0217b8f8: ; 0x0217b8f8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r1, #0x1
    mov r5, r0
    bl func_ov011_0217335c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [r5, #0x20]
    ldrb r0, [r1, #0x1ec]
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r5, #0xd4]
    tst r0, #0x2
    ldrneb r0, [r1, #0xdb]
    cmpne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r0, [r5, #0x3e]
    cmp r0, #0x0
    beq .L_0217bafc
    cmp r0, #0x4
    blo .L_0217bb18
    ldrb r8, [r5, #0x3a]
    ldr r0, .L_0217bb28
    mov r1, #0x1
    tst r0, r1, lsl r8
    mov r4, #0x0
    bne .L_0217ba24
    mov r7, r4
    mov r6, r1
    b .L_0217b98c
.L_0217b96c:
    ldrb r8, [r5, #0x3a]
    ldr r0, [r5, #0x24]
    mov r1, r7
    bl func_ov011_0217bfc8
    tst r0, r6, lsl r8
    movne r4, r6
    bne .L_0217b994
    add r7, r7, #0x1
.L_0217b98c:
    cmp r7, #0x4
    blt .L_0217b96c
.L_0217b994:
    cmp r4, #0x0
    mov r4, #0x0
    beq .L_0217ba24
    cmp r8, #0x1
    streqb r4, [r5, #0x41]
    moveq r4, #0x1
    beq .L_0217ba1c
    mov lr, #0x2
    mov ip, r4
    ldr r3, .L_0217bb2c
    mov r2, #0x1
    mov r0, #0xa
    b .L_0217ba0c
.L_0217b9c8:
    mla r7, lr, r0, r3
    mov r6, ip
    b .L_0217b9f0
.L_0217b9d4:
    ldrb r1, [r5, #0x3a]
    cmp r1, r8
    addeq r1, lr, #0x1
    moveq r4, r2
    streqb r1, [r5, #0x41]
    beq .L_0217ba08
    add r6, r6, #0x1
.L_0217b9f0:
    cmp r6, #0x5
    bge .L_0217ba08
    mov r1, r6, lsl #0x1
    ldrsb r8, [r7, r1]
    cmp r8, #0x0
    bge .L_0217b9d4
.L_0217ba08:
    sub lr, lr, #0x1
.L_0217ba0c:
    cmp lr, #0x0
    blt .L_0217ba1c
    cmp r4, #0x0
    beq .L_0217b9c8
.L_0217ba1c:
    cmp r4, #0x0
    moveq r4, #0x0
.L_0217ba24:
    cmp r4, #0x0
    beq .L_0217ba88
    ldr r0, [r5, #0xd4]
    tst r0, #0x400
    bne .L_0217ba88
    ldr r0, [r5, #0x2c]
    mov r1, #0x7
    bl func_ov011_0217ab28
    cmp r0, #0x0
    bne .L_0217ba5c
    ldr r0, [r5, #0x2c]
    ldrb r0, [r0, #0xe]
    cmp r0, #0x0
    bne .L_0217ba68
.L_0217ba5c:
    mov r0, #0x4
    strb r0, [r5, #0x39]
    b .L_0217baf0
.L_0217ba68:
    mov r0, #0x5
    strb r0, [r5, #0x39]
    ldr r0, [r5, #0x24]
    mov r1, #0x1
    bl func_ov011_0217bb30
    mvn r0, #0x0
    strb r0, [r5, #0x50]
    b .L_0217baf0
.L_0217ba88:
    ldrb r0, [r5, #0x3a]
    cmp r0, #0xc
    bne .L_0217badc
    ldr r4, [r5, #0x24]
    mov r3, #0x0
    ldr r2, [r4, #0x14]
    b .L_0217bac8
.L_0217baa4:
    ldr r1, [r4, #0x0]
    ldr r0, [r2, #0x8]
    cmp r1, r0
    streqb r3, [r5, #0x51]
    beq .L_0217bad0
    add r0, r3, #0x1
    mov r0, r0, lsl #0x18
    ldr r2, [r2, #0x0]
    mov r3, r0, asr #0x18
.L_0217bac8:
    cmp r2, #0x0
    bne .L_0217baa4
.L_0217bad0:
    mov r0, #0x8
    strb r0, [r5, #0x39]
    b .L_0217bae4
.L_0217badc:
    mov r0, #0x4
    strb r0, [r5, #0x39]
.L_0217bae4:
    ldr r0, [r5, #0xd4]
    bic r0, r0, #0x400
    str r0, [r5, #0xd4]
.L_0217baf0:
    mov r0, #0x0
    strb r0, [r5, #0x3e]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217bafc:
    ldrb r1, [r5, #0x3a]
    cmp r1, #0x0
    moveq r0, #0x4
    streqb r0, [r5, #0x39]
    beq .L_0217bb18
    mov r0, r5
    bl func_ov011_0217d8d0
.L_0217bb18:
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217bb28: .word 0x7f9980
.L_0217bb2c: .word data_ov011_021813e4
    arm_func_end func_ov011_0217b8f8

    .global func_ov011_0217bb30
    arm_func_start func_ov011_0217bb30
func_ov011_0217bb30: ; 0x0217bb30
    ldr r2, [r0, #0x0]
    cmp r2, #0x0
    bxeq lr
    ldr r0, [r2, #0xa8]
    cmp r1, #0x0
    orrne r0, r0, #0x40
    strne r0, [r2, #0xa8]
    biceq r0, r0, #0x40
    streq r0, [r2, #0xa8]
    bx lr
    arm_func_end func_ov011_0217bb30

    .global func_ov011_0217bb58
    arm_func_start func_ov011_0217bb58
func_ov011_0217bb58: ; 0x0217bb58
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f24
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    bl func_ov011_0217bb30
    mov r0, #0x0
    strb r0, [r4, #0x3a]
    strb r0, [r4, #0x3e]
    strb r0, [r4, #0x39]
    mov r0, #0x1
    strb r0, [r4, #0x105]
    ldr r0, [r4, #0xd4]
    bic r0, r0, #0x1100
    str r0, [r4, #0xd4]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217bb58

    .global func_ov011_0217bbac
    arm_func_start func_ov011_0217bbac
func_ov011_0217bbac: ; 0x0217bbac
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    mov r4, r0
    ldrb r1, [r4, #0x3e]
    mov r5, #0x0
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_0217bf68
.L_0217bbcc: ; jump table
    b .L_0217bbdc ; case 0
    b .L_0217bc88 ; case 1
    b .L_0217bf14 ; case 2
    b .L_0217bf40 ; case 3
.L_0217bbdc:
    ldr r1, [r4, #0x20]
    ldr r0, .L_0217bfbc
    ldr r1, [r1, #0xc4]
    mov r3, #0x1
    orr r2, r1, r0
    mov r6, r5
    add r0, sp, #0xe
    mov r1, r3
.L_0217bbfc:
    tst r2, r1, lsl r3
    streqb r3, [r0, r6]
    add r3, r3, #0x1
    addeq r6, r6, #0x1
    cmp r3, #0x18
    blt .L_0217bbfc
    cmp r6, #0x0
    beq .L_0217bc80
    ldr r0, .L_0217bfc0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r6
    bl func_0200d338
    add r0, sp, #0xe
    ldr r2, [r4, #0x24]
    ldrsb r1, [r0, r1]
    ldr r0, [r2, #0x0]
    mov r2, #0x0
    bl func_ov011_02174ebc
    cmp r0, #0x0
    moveq r5, #0x1
    beq .L_0217bf68
    mov r0, #0x0
    strh r0, [r4, #0x44]
    ldrb r0, [r4, #0x3e]
    add r0, r0, #0x1
    strb r0, [r4, #0x3e]
    ldrb r0, [r4, #0x41]
    cmp r0, #0x1
    movhs r0, #0x1
    strhsb r0, [r4, #0x40]
    b .L_0217bf68
.L_0217bc80:
    mov r5, #0x1
    b .L_0217bf68
.L_0217bc88:
    ldr r0, [r4, #0xd4]
    tst r0, #0x2
    ldr r0, [r4, #0x20]
    ldrneb r0, [r0, #0xf3]
    ldreqb r0, [r0, #0xf4]
    cmp r0, #0x0
    beq .L_0217bef4
    mov r0, r4
    bl func_ov011_0217d068
    cmp r0, #0x0
    bne .L_0217bef4
    ldr r0, [r4, #0x1c]
    bl func_ov011_02175628
    mov r11, #0x1
    mov r10, #0x0
    mov r8, r10
    mov r6, r11
    mov r7, r11
.L_0217bcd0:
    ldr r0, [r4, #0x24]
    mov r1, r8
    bl func_ov011_0217b504
    ldrsb r1, [r4, #0x38]
    tst r0, r7, lsl r1
    beq .L_0217bd54
    ldr r0, [r4, #0x24]
    mov r1, r8
    bl func_ov011_0217b51c
    mov r9, r0
    sub r0, r9, #0x9
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_0217bd1c
    ldr r0, [r4, #0xd4]
    tst r0, #0x2
    bne .L_0217bd54
.L_0217bd1c:
    cmp r9, #0xd
    orr r10, r10, r6, lsl r9
    blt .L_0217bd54
    cmp r9, #0xd
    cmpne r9, #0xe
    beq .L_0217bd54
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    sub r0, r9, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    orr r10, r10, r11, lsl r0
.L_0217bd54:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_0217bcd0
    cmp r10, #0x0
    moveq r0, #0x0
    beq .L_0217bec4
    ldrb r1, [r4, #0x41]
    ldr r0, .L_0217bfc4
    mov r2, #0xa
    mla r0, r1, r2, r0
    add r1, sp, #0x4
    bl func_02051890
    ldr r0, [r4, #0x2c]
    mov r1, #0x64
    ldr r0, [r0, #0x38]
    mvn r9, #0x0
    mov r8, #0x0
    bl func_0200d338
    mov r11, r1, lsl #0x10
    mov r6, r8
.L_0217bda4:
    ldr r0, [r4, #0x24]
    mov r7, #0x0
    mov r1, r6
    bl func_ov011_0217bfc8
    mov r1, r7
    b .L_0217bdfc
.L_0217bdbc:
    mov r3, r1, lsl #0x1
    add r2, sp, #0x4
    ldrsb r3, [r2, r3]
    cmp r3, #0x0
    blt .L_0217bdf8
    cmp r3, #0xd
    bge .L_0217bde4
    mov r2, #0x1
    tst r0, r2, lsl r3
    beq .L_0217bdf8
.L_0217bde4:
    mov r2, #0x1
    tst r10, r2, lsl r3
    strne r1, [sp, #0x0]
    movne r7, r2
    bne .L_0217be04
.L_0217bdf8:
    add r1, r1, #0x1
.L_0217bdfc:
    cmp r1, #0x5
    blt .L_0217bdbc
.L_0217be04:
    cmp r7, #0x0
    beq .L_0217be3c
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    moveq r0, #0x0
    addne r0, r0, r6, lsl #0x1
    ldrneh r0, [r0, #0xb4]
    add r0, r8, r0
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    cmp r8, r11, lsr #0x10
    ldrhi r9, [sp, #0x0]
    strhib r6, [r4, #0x50]
.L_0217be3c:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_0217bda4
    cmp r9, #0x0
    movlt r0, #0x0
    blt .L_0217bec4
    add r0, sp, #0x4
    mov r1, r9, lsl #0x1
    ldrsb r0, [r0, r1]
    strb r0, [r4, #0x3b]
    cmp r0, #0xd
    blt .L_0217bec0
    ldr r0, [r4, #0x24]
    ldrb r0, [r0, #0x36]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0217bec4
    ldr r0, [r4, #0x2c]
    mov r1, #0x1c
    bl func_ov011_02179130
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0217bec4
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0217beb0
    bl func_ov011_02174f4c
.L_0217beb0:
    ldrsb r1, [r4, #0x3b]
    sub r0, r0, #0x3
    add r0, r1, r0, lsl #0x1
    strb r0, [r4, #0x3b]
.L_0217bec0:
    mov r0, #0x1
.L_0217bec4:
    cmp r0, #0x0
    moveq r5, #0x1
    beq .L_0217bf68
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f24
    mov r0, #0x0
    strb r0, [r4, #0x3f]
    ldrb r0, [r4, #0x3e]
    add r0, r0, #0x1
    strb r0, [r4, #0x3e]
    b .L_0217bf68
.L_0217bef4:
    mov r0, r4
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    moveq r0, #0x4
    streqb r0, [r4, #0x39]
    moveq r0, #0x0
    streqb r0, [r4, #0x3e]
    b .L_0217bf68
.L_0217bf14:
    ldrsb r1, [r4, #0x3b]
    bl func_ov011_0217d8d0
    ldrb r0, [r4, #0x41]
    add r0, r0, #0x1
    strb r0, [r4, #0x41]
    ldrsb r0, [r4, #0x3b]
    strb r0, [r4, #0x3a]
    ldrb r0, [r4, #0x3e]
    add r0, r0, #0x1
    strb r0, [r4, #0x3e]
    b .L_0217bf68
.L_0217bf40:
    ldr r0, [r4, #0x2c]
    ldrb r1, [r4, #0x41]
    ldrb r0, [r0, #0xe]
    cmp r1, r0
    cmplo r1, #0x4
    strlob r5, [r4, #0x3e]
    movhs r0, #0x4
    strhsb r0, [r4, #0x39]
    movhs r0, #0x0
    strhsb r0, [r4, #0x3e]
.L_0217bf68:
    ldr r0, [r4, #0x20]
    ldrh r1, [r4, #0x44]
    ldr r0, [r0, #0x1a8]
    cmp r5, #0x0
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x158]
    orr r0, r1, r0
    strh r0, [r4, #0x44]
    bne .L_0217bfa4
    ldr r0, [r4, #0x20]
    ldr r0, [r0, #0x1a8]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x40]
    tst r0, #0x100000
    beq .L_0217bfb4
.L_0217bfa4:
    mov r0, #0x4
    strb r0, [r4, #0x39]
    mov r0, #0x0
    strb r0, [r4, #0x3e]
.L_0217bfb4:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217bfbc: .word 0x7f9980
.L_0217bfc0: .word data_020a0da8
.L_0217bfc4: .word data_ov011_021813e4
    arm_func_end func_ov011_0217bbac

    .global func_ov011_0217bfc8
    arm_func_start func_ov011_0217bfc8
func_ov011_0217bfc8: ; 0x0217bfc8
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    moveq r0, #0x0
    addne r0, r0, r1, lsl #0x1
    ldrneh r0, [r0, #0xac]
    bx lr
    arm_func_end func_ov011_0217bfc8

    .global func_ov011_0217bfe0
    arm_func_start func_ov011_0217bfe0
func_ov011_0217bfe0: ; 0x0217bfe0
    ldr r3, .L_0217c018
    mov ip, #0x0
    ldrsb r2, [r3, ip]
    cmp r2, #0x0
    movlt r0, #0x0
    bxlt lr
    ldr r1, [r0, #0x20]
    ldrsb r1, [r1, #0x18]
    cmp r2, r1
    moveq r0, #0x1
    bxeq lr
    add ip, ip, #0x1
    b #-0x28
    bx lr
.L_0217c018: .word data_ov011_021813cc
    arm_func_end func_ov011_0217bfe0

    .global func_ov011_0217c01c
    arm_func_start func_ov011_0217c01c
func_ov011_0217c01c: ; 0x0217c01c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x14]
    ldr r0, [r5, #0x1c]
    ldr r4, [r1, #0x0]
    bl func_ov011_02175628
    ldr r3, [r0, #0x4]
    ldrb r1, [r5, #0x3e]
    ldr r0, [r5, #0xd4]
    ldr ip, [r3, #0x10]
    ldrsb r2, [r5, #0x38]
    mov r3, r0, lsr #0x1c
    add r3, ip, r3, lsl #0x2
    add r2, ip, r2, lsl #0x2
    ldr ip, [r3, #0x98]
    ldr r3, [r2, #0x98]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_0217c164
.L_0217c068: ; jump table
    b .L_0217c080 ; case 0
    b .L_0217c0dc ; case 1
    b .L_0217c114 ; case 2
    b .L_0217c13c ; case 3
    b .L_0217c13c ; case 4
    b .L_0217c148 ; case 5
.L_0217c080:
    ldr r2, [ip, #0x0]
    ldr r1, [r3, #0x0]
    subs r1, r2, r1
    bpl .L_0217c0a0
    tst r0, #0x80
    bne .L_0217c0ac
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0217c0a0:
    tst r0, #0x80
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_0217c0ac:
    tst r0, #0x2
    ldreqb r0, [r5, #0x3e]
    addeq r0, r0, #0x2
    streqb r0, [r5, #0x3e]
    beq .L_0217c164
    ldr r0, [r5, #0x24]
    bl func_ov011_0217b4f0
    bl func_ov011_02176d14
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217c164
.L_0217c0dc:
    ldr r1, [ip, #0x0]
    ldr r0, [r3, #0x0]
    mov r2, #0xf
    subs r0, r1, r0
    movmi r1, #0x4
    strmi r1, [r4, #0xe4]
    movpl r1, #0x8
    mov r0, r4
    bl func_ov011_0217b8a4
    cmp r0, #0x0
    ldreqb r0, [r5, #0x3e]
    addeq r0, r0, #0x1
    streqb r0, [r5, #0x3e]
    b .L_0217c164
.L_0217c114:
    ldr r1, [ip, #0x0]
    ldr r0, [r3, #0x0]
    subs r0, r1, r0
    movmi r0, #0x4
    movpl r0, #0x8
    str r0, [r4, #0xe4]
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217c164
.L_0217c13c:
    add r0, r1, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217c164
.L_0217c148:
    ldr r1, [r4, #0xe4]
    mov r0, #0x0
    bic r1, r1, #0xc
    str r1, [r4, #0xe4]
    strb r0, [r5, #0x3e]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0217c164:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_0217c01c

    .global func_ov011_0217c16c
    arm_func_start func_ov011_0217c16c
func_ov011_0217c16c: ; 0x0217c16c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldrb r1, [r5, #0x3e]
    cmp r1, #0x0
    beq .L_0217c1ac
    add r0, r1, #0x1
    strb r0, [r5, #0x3e]
    cmp r1, #0x2
    bls .L_0217c2b4
    mov r0, #0x0
    strb r0, [r5, #0x3a]
    strb r0, [r5, #0x3e]
    mov r0, #0x7
    strb r0, [r5, #0x39]
    b .L_0217c2b4
.L_0217c1ac:
    ldrb r0, [r5, #0x43]
    mov r6, #0x0
    cmp r0, #0x0
    beq .L_0217c1d0
    cmp r0, #0x1
    beq .L_0217c204
    cmp r0, #0x2
    beq .L_0217c228
    b .L_0217c238
.L_0217c1d0:
    ldr r0, [r5, #0x24]
    mov r1, r6
    bl func_ov011_0217b0a8
    mov r4, r0
    ldr r0, [r5, #0x24]
    mov r1, #0x1
    bl func_ov011_0217b0a8
    orr r6, r4, r0
    ldr r0, [r5, #0x24]
    mov r1, #0x2
    bl func_ov011_0217b0a8
    orr r6, r6, r0
    b .L_0217c238
.L_0217c204:
    ldr r0, [r5, #0x24]
    mov r1, #0x1
    bl func_ov011_0217b0a8
    mov r4, r0
    ldr r0, [r5, #0x24]
    mov r1, #0x2
    bl func_ov011_0217b0a8
    orr r6, r4, r0
    b .L_0217c238
.L_0217c228:
    ldr r0, [r5, #0x24]
    mov r1, #0x2
    bl func_ov011_0217b0a8
    mov r6, r0
.L_0217c238:
    tst r6, #0x2
    bicne r6, r6, #0x28
    mov ip, #0x1
    mov r4, #0x0
    bic r3, r6, #0x600
    add r0, sp, #0x0
    mov r2, ip
.L_0217c254:
    tst r3, r2, lsl ip
    strneb ip, [r0, r4]
    addne r1, r4, #0x1
    add ip, ip, #0x1
    andne r4, r1, #0xff
    cmp ip, #0x18
    blt .L_0217c254
    cmp r4, #0x0
    beq .L_0217c2a8
    ldr r0, .L_0217c2bc
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r4
    bl func_0200d338
    add r0, sp, #0x0
    ldr r2, [r5, #0x24]
    ldrb r1, [r0, r1]
    ldr r0, [r2, #0x0]
    mov r2, #0x0
    bl func_ov011_02174ebc
.L_0217c2a8:
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
.L_0217c2b4:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_0217c2bc: .word data_020a0da8
    arm_func_end func_ov011_0217c16c

    .global func_ov011_0217c2c0
    arm_func_start func_ov011_0217c2c0
func_ov011_0217c2c0: ; 0x0217c2c0
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, [r9, #0x24]
    mvn r5, #0x0
    ldr r0, [r0, #0x0]
    add r7, r5, #0x8000
    ldr r11, [r0, #0xc]
    mov r4, r5
    mov r6, r5, lsl #0xf
    mov r8, #0x0
    str r7, [sp, #0x8]
.L_0217c2f0:
    ldr r0, [r9, #0x24]
    mov r1, r8
    bl func_ov011_0217b504
    cmp r0, #0x0
    moveq r2, #0x1
    ldrsb r1, [r9, #0x38]
    movne r2, #0x0
    mov r0, #0x1
    tst r2, r0, lsl r1
    bne .L_0217c3a0
    ldr r0, [r9, #0x24]
    mov r1, r8
    bl func_ov011_0217b51c
    str r0, [sp, #0x0]
    cmp r0, #0x0
    ble .L_0217c3a0
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r11
    bl func_ov011_0217b7cc
    mov r3, #0x0
    ldr ip, [sp, #0x8]
    add r2, r0, #0x9c
    ldrb r10, [r0, #0xc]
    mov lr, r3
    b .L_0217c37c
.L_0217c358:
    ldr r1, [r2, #0xc]
    ldrsh r0, [r2, #0x14]
    add r1, r3, r1
    mov r1, r1, lsl #0x10
    cmp ip, r0
    mov r3, r1, asr #0x10
    movgt ip, r0
    add lr, lr, #0x1
    add r2, r2, #0x20
.L_0217c37c:
    cmp lr, r10
    blt .L_0217c358
    cmp r6, r3
    strlt ip, [sp, #0x4]
    movlt r6, r3
    ldrlt r4, [sp, #0x0]
    cmp r7, ip
    ldrgt r5, [sp, #0x0]
    movgt r7, ip
.L_0217c3a0:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_0217c2f0
    ldr r0, [r9, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f24
    cmp r4, #0x0
    cmplt r5, #0x0
    bge .L_0217c3d8
    mov r1, #0x1
    mov r0, r9
    strb r1, [r9, #0x105]
    bl func_ov011_0217aa58
    b .L_0217c500
.L_0217c3d8:
    ldr r0, [r9, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldrsb r1, [r9, #0x38]
    ldr r2, [r0, #0x10]
    mov r0, #0x10c
    add r2, r2, #0xa8
    mla r6, r1, r0, r2
    ldr r0, [r6, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldr r8, [r0, #0xc]
    ldrnesb r0, [r0, #0xc4]
    mvneq r0, #0x0
    cmp r0, #0x0
    bge .L_0217c430
    strb r4, [r9, #0x3a]
    mov r0, #0x2
    strb r0, [r9, #0x39]
    mov r0, #0x0
    strb r0, [r9, #0x3e]
    b .L_0217c500
.L_0217c430:
    cmp r4, #0x0
    ble .L_0217c4f0
    cmp r8, #0x0
    beq .L_0217c4f0
    and r0, r0, #0xff
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r8
    bl func_ov011_0217b7cc
    cmp r0, #0x0
    beq .L_0217c4f0
    ldrb r1, [r0, #0xc]
    cmp r1, #0x0
    beq .L_0217c4d8
    ldr r1, [r6, #0x24]
    ldrsh r2, [r0, #0xb0]
    ldr r0, [r1, #0x0]
    ldrh r0, [r0, #0xbe]
    sub r0, r2, r0
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x4]
    cmp r0, r1, asr #0x10
    mov r0, r1, asr #0x10
    bge .L_0217c4b0
    strb r4, [r9, #0x3a]
    mov r0, #0x2
    strb r0, [r9, #0x39]
    mov r0, #0x0
    strb r0, [r9, #0x3e]
    b .L_0217c500
.L_0217c4b0:
    cmp r0, r7
    ble .L_0217c4f0
    cmp r5, #0x0
    blt .L_0217c4f0
    strb r5, [r9, #0x3a]
    mov r0, #0x2
    strb r0, [r9, #0x39]
    mov r0, #0x0
    strb r0, [r9, #0x3e]
    b .L_0217c500
.L_0217c4d8:
    strb r4, [r9, #0x3a]
    mov r0, #0x2
    strb r0, [r9, #0x39]
    mov r0, #0x0
    strb r0, [r9, #0x3e]
    b .L_0217c500
.L_0217c4f0:
    mov r0, #0x0
    strb r0, [r9, #0x3e]
    mov r0, #0x1
    strb r0, [r9, #0x39]
.L_0217c500:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov011_0217c2c0

    .global func_ov011_0217c508
    arm_func_start func_ov011_0217c508
func_ov011_0217c508: ; 0x0217c508
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldrb r1, [r5, #0x3e]
    cmp r1, #0x11
    addls pc, pc, r1, lsl #0x2
    b .L_0217caa8
.L_0217c524: ; jump table
    b .L_0217c56c ; case 0
    b .L_0217c668 ; case 1
    b .L_0217c668 ; case 2
    b .L_0217c6c8 ; case 3
    b .L_0217c73c ; case 4
    b .L_0217c7f4 ; case 5
    b .L_0217c7f4 ; case 6
    b .L_0217c7f4 ; case 7
    b .L_0217c800 ; case 8
    b .L_0217caa8 ; case 9
    b .L_0217c80c ; case 10
    b .L_0217c8b0 ; case 11
    b .L_0217c8b0 ; case 12
    b .L_0217c930 ; case 13
    b .L_0217c9ac ; case 14
    b .L_0217ca78 ; case 15
    b .L_0217ca78 ; case 16
    b .L_0217ca9c ; case 17
.L_0217c56c:
    ldr r1, [r5, #0x2c]
    ldrb r2, [r5, #0x42]
    ldrb r1, [r1, #0xe]
    cmp r2, r1
    blo .L_0217c590
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r5, #0x105]
    b .L_0217caa8
.L_0217c590:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0xa8]
    orr r0, r0, #0x400
    str r0, [r1, #0xa8]
    strb r4, [r5, #0x47]
    ldr r0, [r5, #0x24]
    add r1, sp, #0x0
    ldr r3, [r0, #0x14]
    b .L_0217c5e0
.L_0217c5bc:
    ldr r2, [r3, #0x8]
    ldr r0, [r2, #0xa8]
    tst r0, #0x400
    bne .L_0217c5dc
    tst r0, #0x800
    addne r0, r4, #0x1
    strne r2, [r1, r4, lsl #0x2]
    andne r4, r0, #0xff
.L_0217c5dc:
    ldr r3, [r3, #0x0]
.L_0217c5e0:
    cmp r3, #0x0
    bne .L_0217c5bc
    cmp r4, #0x0
    beq .L_0217c648
    ldr r0, .L_0217cab0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, r4
    bl func_0200d338
    and r6, r1, #0xff
    add r0, sp, #0x0
    ldr r4, [r0, r6, lsl #0x2]
    mov r1, #0xc
    mov r2, #0x0
    mov r0, r4
    bl func_ov011_02174ebc
    cmp r0, #0x0
    beq .L_0217c648
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldrb r1, [r5, #0x47]
    mov r0, #0x1
    orr r0, r1, r0, lsl r6
    strb r0, [r5, #0x47]
.L_0217c648:
    ldrb r0, [r5, #0x47]
    cmp r0, #0x0
    moveq r0, #0xa
    streqb r0, [r5, #0x3e]
    ldrneb r0, [r5, #0x3e]
    addne r0, r0, #0x1
    strneb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c668:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    ldr r6, [r0, #0x14]
    mov r2, #0x1
    b .L_0217c6b0
.L_0217c67c:
    ldrb r0, [r5, #0x47]
    mov r3, r2, lsl r4
    tst r0, r2, lsl r4
    beq .L_0217c6a8
    ldr r0, [r6, #0x8]
    ldrsb r1, [r5, #0x38]
    ldr r0, [r0, #0x6c]
    tst r0, r2, lsl r1
    ldrneb r0, [r5, #0x47]
    orrne r0, r0, r3, lsl #0x4
    strneb r0, [r5, #0x47]
.L_0217c6a8:
    ldr r6, [r6, #0x0]
    add r4, r4, #0x1
.L_0217c6b0:
    cmp r6, #0x0
    bne .L_0217c67c
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c6c8:
    ldr r0, [r5, #0x24]
    mov r6, #0x0
    ldr r8, [r0, #0x14]
    mov r4, #0x1
    b .L_0217c708
.L_0217c6dc:
    ldrb r0, [r5, #0x47]
    tst r0, r4, lsl r6
    beq .L_0217c700
    ldr r7, [r8, #0x8]
    mov r0, r7
    bl func_ov011_02174f24
    ldr r0, [r7, #0x30]
    ldr r0, [r0, #0x4]
    bl func_020282f4
.L_0217c700:
    ldr r8, [r8, #0x0]
    add r6, r6, #0x1
.L_0217c708:
    cmp r8, #0x0
    bne .L_0217c6dc
    ldrb r0, [r5, #0x47]
    tst r0, #0xf0
    ldrneb r0, [r5, #0x3e]
    addne r0, r0, #0x1
    strneb r0, [r5, #0x3e]
    bne .L_0217caa8
    mov r0, r5
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r5, #0x105]
    b .L_0217caa8
.L_0217c73c:
    ldr r0, [r5, #0x20]
    ldrb r0, [r0, #0xf3]
    cmp r0, #0x0
    beq .L_0217caa8
    ldr r0, [r5, #0x2c]
    ldrb r3, [r5, #0x47]
    ldr r0, [r0, #0x38]
    mov r1, #0x1
    and r2, r0, #0x3
.L_0217c760:
    mov r0, r1, lsl r2
    tst r3, r0, lsl #0x4
    bne .L_0217c784
    add r0, r2, #0x1
    and r2, r0, #0xff
    cmp r2, #0x4
    subhs r0, r2, #0x4
    andhs r2, r0, #0xff
    b .L_0217c760
.L_0217c784:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    ldr r3, [r0, #0x14]
    b .L_0217c7ac
.L_0217c794:
    and r0, r1, #0xff
    cmp r2, r0
    ldreq r4, [r3, #0x8]
    beq .L_0217c7b4
    ldr r3, [r3, #0x0]
    add r1, r1, #0x1
.L_0217c7ac:
    cmp r3, #0x0
    bne .L_0217c794
.L_0217c7b4:
    ldrb r2, [r4, #0xc3]
    ldrb r1, [r4, #0xc2]
    ldr r3, [r5, #0x18]
    mov r0, #0x1
    strh r1, [r3, #0xc]
    strh r2, [r3, #0xe]
    strb r0, [r3, #0x10]
    mov r0, #0x4
    strb r0, [r3, #0x11]
    ldrb r0, [r5, #0x42]
    add r0, r0, #0x1
    strb r0, [r5, #0x42]
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c7f4:
    add r0, r1, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c800:
    mov r0, #0x0
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c80c:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    ldr r2, [r0, #0x14]
    b .L_0217c84c
.L_0217c81c:
    ldrsb r0, [r5, #0x51]
    cmp r0, r1
    bne .L_0217c83c
    ldr r4, [r2, #0x8]
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    bl func_02028330
    b .L_0217c854
.L_0217c83c:
    add r0, r1, #0x1
    mov r0, r0, lsl #0x18
    ldr r2, [r2, #0x0]
    mov r1, r0, asr #0x18
.L_0217c84c:
    cmp r2, #0x0
    bne .L_0217c81c
.L_0217c854:
    mov r0, r4
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    mov r0, r0, lsl #0x1
    add r7, r0, #0xd
    mov r6, #0x0
.L_0217c86c:
    add r1, r4, r6, lsl #0x4
    ldr r0, [r1, #0x44]
    cmp r0, #0x0
    ldrle r0, [r1, #0x48]
    cmple r0, #0x0
    ble .L_0217c894
    mov r0, r4
    mov r2, r6
    add r1, r7, r6
    bl func_ov011_02174ebc
.L_0217c894:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_0217c86c
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c8b0:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    ldr r2, [r0, #0x14]
    b .L_0217c918
.L_0217c8c0:
    ldrsb r0, [r5, #0x51]
    cmp r0, r1
    bne .L_0217c908
    ldr r4, [r2, #0x8]
    mov r3, #0x0
    mov r2, #0x1
.L_0217c8d8:
    add r0, r4, r3, lsl #0x2
    ldrsb r1, [r5, #0x38]
    ldr r0, [r0, #0x6c]
    tst r0, r2, lsl r1
    movne r0, r2, lsl r3
    ldrneb r1, [r5, #0x47]
    add r3, r3, #0x1
    orrne r0, r1, r0, lsl #0x4
    strneb r0, [r5, #0x47]
    cmp r3, #0x2
    blt .L_0217c8d8
    b .L_0217c920
.L_0217c908:
    add r0, r1, #0x1
    mov r0, r0, lsl #0x18
    ldr r2, [r2, #0x0]
    mov r1, r0, asr #0x18
.L_0217c918:
    cmp r2, #0x0
    bne .L_0217c8c0
.L_0217c920:
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c930:
    ldrb r1, [r5, #0x47]
    tst r1, #0xf0
    bne .L_0217c94c
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r5, #0x105]
    b .L_0217caa8
.L_0217c94c:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    ldr r2, [r0, #0x14]
    b .L_0217c994
.L_0217c95c:
    ldrsb r0, [r5, #0x51]
    cmp r0, r1
    bne .L_0217c984
    ldr r4, [r2, #0x8]
    mov r0, r4
    bl func_ov011_02174f24
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x4]
    bl func_020282f4
    b .L_0217c99c
.L_0217c984:
    add r0, r1, #0x1
    mov r0, r0, lsl #0x18
    ldr r2, [r2, #0x0]
    mov r1, r0, asr #0x18
.L_0217c994:
    cmp r2, #0x0
    bne .L_0217c95c
.L_0217c99c:
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217c9ac:
    ldr r0, [r5, #0x20]
    ldrb r0, [r0, #0xf3]
    cmp r0, #0x0
    beq .L_0217caa8
    ldr r0, [r5, #0x2c]
    ldrb r3, [r5, #0x47]
    ldr r0, [r0, #0x38]
    mov r1, #0x1
    and r2, r0, #0x1
.L_0217c9d0:
    mov r0, r1, lsl r2
    tst r3, r0, lsl #0x4
    bne .L_0217c9f4
    add r0, r2, #0x1
    and r2, r0, #0xff
    cmp r2, #0x2
    subhs r0, r2, #0x2
    andhs r2, r0, #0xff
    b .L_0217c9d0
.L_0217c9f4:
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    ldr r3, [r0, #0x14]
    b .L_0217ca24
.L_0217ca04:
    ldrsb r0, [r5, #0x51]
    cmp r0, r1
    ldreq r4, [r3, #0x8]
    beq .L_0217ca2c
    add r0, r1, #0x1
    mov r0, r0, lsl #0x18
    ldr r3, [r3, #0x0]
    mov r1, r0, asr #0x18
.L_0217ca24:
    cmp r3, #0x0
    bne .L_0217ca04
.L_0217ca2c:
    cmp r2, #0x0
    ldrne r0, [r5, #0x14]
    ldrne r1, [r0, #0x0]
    ldrne r0, [r1, #0xe4]
    orrne r0, r0, #0x1
    strne r0, [r1, #0xe4]
    ldrb r2, [r4, #0xc3]
    ldrb r1, [r4, #0xc2]
    ldr r3, [r5, #0x18]
    mov r0, #0x1
    strh r1, [r3, #0xc]
    strh r2, [r3, #0xe]
    strb r0, [r3, #0x10]
    mov r0, #0x4
    strb r0, [r3, #0x11]
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217ca78:
    ldr r0, [r5, #0x14]
    ldr r1, [r0, #0x0]
    ldr r0, [r1, #0xe4]
    bic r0, r0, #0x1
    str r0, [r1, #0xe4]
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    b .L_0217caa8
.L_0217ca9c:
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r5, #0x105]
.L_0217caa8:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217cab0: .word data_020a0da8
    arm_func_end func_ov011_0217c508

    .global func_ov011_0217cab4
    arm_func_start func_ov011_0217cab4
func_ov011_0217cab4: ; 0x0217cab4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    bne .L_0217cadc
    mov r0, r5
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r5, #0x105]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0217cadc:
    ldr r0, [r5, #0x20]
    ldrsb r6, [r0, #0xca]
    ldr r0, [r0, #0x1a8]
    cmp r6, #0xd
    ldr r4, [r0, #0x18]
    blt .L_0217cb28
    sub r0, r6, #0xd
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_0217cb28
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    add r0, r6, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r6, r0, asr #0x18
.L_0217cb28:
    ldrsb r7, [r5, #0x3a]
    cmp r7, #0xd
    blt .L_0217cb68
    sub r0, r7, #0xd
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_0217cb68
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    add r0, r7, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r7, r0, asr #0x18
.L_0217cb68:
    cmp r6, r7
    movne r0, #0x0
    strneb r0, [r5, #0x3e]
    movne r0, #0x4
    strneb r0, [r5, #0x39]
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrsb r0, [r5, #0x38]
    cmp r0, #0x0
    ldrltb r0, [r5, #0x107]
    strltb r0, [r5, #0x38]
    ldr r0, [r5, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldrsb r2, [r5, #0x38]
    ldr r1, [r0, #0x10]
    mov r0, #0x10c
    add r3, r1, #0xa8
    ldr r1, [r5, #0x14]
    mla r7, r2, r0, r3
    ldr r6, [r1, #0x0]
    mov r8, #0x0
.L_0217cbbc:
    add r0, r4, r8, lsl #0x2
    ldr r9, [r0, #0x80]
    cmp r9, #0x0
    beq .L_0217cce8
    mov r0, r9
    bl func_ov006_0216a8f0
    ldrb r1, [r9, #0x1a]
    ldr r0, [r0, #0x10]
    cmp r1, #0x5
    ldr r0, [r0, #0x5c]
    bne .L_0217cc74
    ldrb r1, [r5, #0x3e]
    cmp r1, #0x4
    blo .L_0217cc68
    cmp r1, #0x12
    ldrlo r1, [r6, #0xe8]
    orrlo r1, r1, #0x1
    strlo r1, [r6, #0xe8]
    blo .L_0217cc68
    cmp r1, #0x24
    bhs .L_0217cc30
    ldr r1, [r5, #0xd4]
    tst r1, #0x80
    ldr r1, [r6, #0xe8]
    orrne r1, r1, #0x4
    strne r1, [r6, #0xe8]
    orreq r1, r1, #0x8
    streq r1, [r6, #0xe8]
    b .L_0217cc68
.L_0217cc30:
    cmp r1, #0x34
    ldrlo r1, [r6, #0xe8]
    orrlo r1, r1, #0x2
    strlo r1, [r6, #0xe8]
    blo .L_0217cc68
    cmp r1, #0x3e
    bhs .L_0217cc68
    ldr r1, [r5, #0xd4]
    tst r1, #0x80
    ldr r1, [r6, #0xe8]
    orrne r1, r1, #0x8
    strne r1, [r6, #0xe8]
    orreq r1, r1, #0x4
    streq r1, [r6, #0xe8]
.L_0217cc68:
    ldrb r1, [r5, #0x3e]
    add r1, r1, #0x1
    strb r1, [r5, #0x3e]
.L_0217cc74:
    ldrb r1, [r9, #0x1a]
    cmp r1, #0x11
    bne .L_0217cce8
    ldr r1, [r7, #0x20]
    ldr r2, [r0, #0xc]
    ldr r1, [r1, #0x1a8]
    ldr r0, [r0, #0x10]
    ldr r1, [r1, #0x10]
    ldr r3, [r1, #0x5c]
    ldr r1, [r3, #0x10]
    ldr r3, [r3, #0xc]
    sub r1, r1, #0x1800
    subs r2, r3, r2
    sub r1, r1, r0
    beq .L_0217ccc8
    ldr r0, [r6, #0xe8]
    cmp r2, #0x0
    orrgt r0, r0, #0x4
    strgt r0, [r6, #0xe8]
    orrle r0, r0, #0x8
    strle r0, [r6, #0xe8]
.L_0217ccc8:
    cmp r1, #0x0
    beq .L_0217cce8
    ldr r0, [r6, #0xe8]
    cmp r1, #0x0
    orrgt r0, r0, #0x2
    strgt r0, [r6, #0xe8]
    orrle r0, r0, #0x1
    strle r0, [r6, #0xe8]
.L_0217cce8:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_0217cbbc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    arm_func_end func_ov011_0217cab4

    .global func_ov011_0217ccf8
    arm_func_start func_ov011_0217ccf8
func_ov011_0217ccf8: ; 0x0217ccf8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    bne .L_0217cd20
    mov r0, r5
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r5, #0x105]
    ldmia sp!, {r3, r4, r5, pc}
.L_0217cd20:
    ldrsb r0, [r5, #0x38]
    ldr r1, [r5, #0x14]
    cmp r0, #0x0
    ldrltb r0, [r5, #0x107]
    ldr r4, [r1, #0x0]
    strltb r0, [r5, #0x38]
    ldr r0, [r5, #0x1c]
    bl func_ov011_02175628
    ldr r2, [r0, #0x4]
    ldr r1, [r5, #0xd4]
    ldrsb r0, [r5, #0x38]
    ldr r2, [r2, #0x10]
    mov r1, r1, lsr #0x1c
    add r1, r2, r1, lsl #0x2
    add r0, r2, r0, lsl #0x2
    ldr r5, [r1, #0x98]
    ldr r0, [r0, #0x98]
    ldr r2, [r5, #0x0]
    ldr r3, [r0, #0x0]
    ldr r1, [r0, #0x4]
    ldr r0, [r5, #0x4]
    subs r2, r3, r2
    sub r1, r1, r0
    beq .L_0217cd98
    ldr r0, [r4, #0xe8]
    cmp r2, #0x0
    orrgt r0, r0, #0x4
    strgt r0, [r4, #0xe8]
    orrle r0, r0, #0x8
    strle r0, [r4, #0xe8]
.L_0217cd98:
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xe8]
    cmp r1, #0x0
    orrgt r0, r0, #0x2
    strgt r0, [r4, #0xe8]
    orrle r0, r0, #0x1
    strle r0, [r4, #0xe8]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_0217ccf8

    .global func_ov011_0217cdbc
    arm_func_start func_ov011_0217cdbc
func_ov011_0217cdbc: ; 0x0217cdbc
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x1c]
    ldr r4, [r5, #0x18]
    bl func_ov011_02175628
    ldrsb r1, [r5, #0x38]
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    ldr r2, [r0, #0x10]
    ldrltb r0, [r5, #0x107]
    strltb r0, [r5, #0x38]
    ldrsb r1, [r5, #0x38]
    ldrb r0, [r5, #0x3e]
    add r1, r2, r1, lsl #0x2
    ldr r6, [r1, #0x98]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_0217ce04: ; jump table
    b .L_0217ce14 ; case 0
    b .L_0217ce34 ; case 1
    b .L_0217ce58 ; case 2
    b .L_0217ceac ; case 3
.L_0217ce14:
    ldr r0, [r5, #0x24]
    bl func_ov011_0217b4f0
    mov r1, r6
    bl func_ov011_02177010
    ldrb r0, [r5, #0x3e]
    add r0, r0, #0x1
    strb r0, [r5, #0x3e]
    ldmia sp!, {r4, r5, r6, pc}
.L_0217ce34:
    ldr r0, [r5, #0x24]
    bl func_ov011_0217b4f0
    add r0, r0, #0x100
    ldrsb r0, [r0, #0x8b]
    cmp r0, #0x0
    ldreqb r0, [r5, #0x3e]
    addeq r0, r0, #0x1
    streqb r0, [r5, #0x3e]
    ldmia sp!, {r4, r5, r6, pc}
.L_0217ce58:
    ldr r0, [r5, #0x24]
    mov r2, #0x1
    ldrb ip, [r0, #0x3b]
    ldrb r3, [r0, #0x3a]
    mov r1, #0x4
    ldr r0, .L_0217cecc
    strh r3, [r4, #0xc]
    strh ip, [r4, #0xe]
    strb r2, [r4, #0x10]
    strb r1, [r4, #0x11]
    ldrb r1, [r5, #0x3e]
    add r1, r1, #0x1
    strb r1, [r5, #0x3e]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, #0x78
    bl func_0200d338
    add r0, r1, #0x78
    strb r0, [r5, #0x52]
    ldmia sp!, {r4, r5, r6, pc}
.L_0217ceac:
    mov r0, r5
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    movne r0, #0x0
    strneb r0, [r5, #0x3e]
    movne r0, #0x4
    strneb r0, [r5, #0x39]
    ldmia sp!, {r4, r5, r6, pc}
.L_0217cecc: .word data_020a0da8
    arm_func_end func_ov011_0217cdbc

    .global func_ov011_0217ced0
    arm_func_start func_ov011_0217ced0
func_ov011_0217ced0: ; 0x0217ced0
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0217cfb4
    mov r6, r0
    ldr r2, .L_0217cfb8
    mov r0, #0x14
    mov r3, #0x7a
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x14
    mov r4, r0
    bl func_020517fc
    ldr r1, [r6, #0x14]
    mvn r0, #0x0
    ldr r1, [r1, #0x0]
    str r1, [r4, #0x4]
    strb r0, [r4, #0xe]
    bl func_02020d90
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0217cfbc
    bl func_02028384
    mov r0, #0x94000
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r6, #0x1c]
    ldr r0, [r5, #0x4]
    cmp r1, #0x0
    bne .L_0217cf90
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_0217cfa0
.L_0217cf90:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_0217cfa0:
    ldr r0, [r5, #0x4]
    bl func_020282f4
    str r5, [r6, #0x34]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0217cfb4: .word data_ov011_021819e0
.L_0217cfb8: .word data_ov011_021819c0
.L_0217cfbc: .word func_ov011_0217d0b4
    arm_func_end func_ov011_0217ced0

    .global func_ov011_0217cfc0
    arm_func_start func_ov011_0217cfc0
func_ov011_0217cfc0: ; 0x0217cfc0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    ldr r0, [r0, #0x10]
    ldr r1, [r0, #0x4]
    str r2, [r1, #0xe4]
    bl func_0201b244
    ldr r0, [r4, #0x34]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x34]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217cfc0

    .global func_ov011_0217d008
    arm_func_start func_ov011_0217d008
func_ov011_0217d008: ; 0x0217d008
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x34]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, [r1, #0x4]
    mov r1, #0x0
    ldr r3, [r2, #0x10]
    mvn r2, #0x0
    strb r2, [r3, #0xe]
    strb r1, [r3, #0xf]
    strh r1, [r3, #0xc]
    strb r1, [r3, #0x11]
    strb r1, [r3, #0x10]
    ldr r0, [r0, #0x34]
    ldr r0, [r0, #0x4]
    bl func_02028330
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_0217d008

    .global func_ov011_0217d04c
    arm_func_start func_ov011_0217d04c
func_ov011_0217d04c: ; 0x0217d04c
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x4]
    bl func_020282f4
    ldmia sp!, {r3, pc}
    arm_func_end func_ov011_0217d04c

    .global func_ov011_0217d068
    arm_func_start func_ov011_0217d068
func_ov011_0217d068: ; 0x0217d068
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldrb r0, [r0, #0x12]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217d068

    .global func_ov011_0217d094
    arm_func_start func_ov011_0217d094
func_ov011_0217d094: ; 0x0217d094
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    ldrne r0, [r0, #0x4]
    mvnne r1, #0x0
    ldrne r0, [r0, #0x10]
    strneb r1, [r0, #0xe]
    bx lr
    arm_func_end func_ov011_0217d094

    .global func_ov011_0217d0b0
    arm_func_start func_ov011_0217d0b0
func_ov011_0217d0b0: ; 0x0217d0b0
    bx lr
    arm_func_end func_ov011_0217d0b0

    .global func_ov011_0217d0b4
    arm_func_start func_ov011_0217d0b4
func_ov011_0217d0b4: ; 0x0217d0b4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r5, [r0, #0x10]
    mov r0, r5
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x20]
    ldr r1, [r7, #0x4]
    ldrsb r4, [r0, #0xca]
    ldr r6, [r1, #0x10]
    cmp r4, #0xd
    blt .L_0217d10c
    ldr r0, [r5, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    add r0, r4, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r4, r0, asr #0x18
.L_0217d10c:
    ldrsb r0, [r6, #0xe]
    cmp r0, r4
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    strb r4, [r6, #0xe]
    bl func_ov011_021733b4
    ldr r1, [r5, #0x24]
    cmp r0, #0x0
    ldr r1, [r1, #0x0]
    movlt r0, #0x0
    ldr r1, [r1, #0xc]
    blt .L_0217d150
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    movlt r0, #0x0
    addge r0, r1, r0
.L_0217d150:
    str r0, [r6, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x0
    strh r0, [r6, #0xc]
    strb r0, [r6, #0xf]
    strb r0, [r6, #0x11]
    strb r0, [r6, #0x10]
    ldr r0, [r6, #0x0]
    ldr r2, [r0, #0x0]
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, .L_0217d1e0
    ldr r0, [r7, #0x4]
    ldr r1, [r1, r2, lsl #0x2]
    bl func_02028384
    mov r2, #0x1
    strb r2, [r6, #0x12]
    ldr r1, [r6, #0x0]
    ldr r0, [r1, #0x0]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrsh r0, [r1, #0x16]
    cmp r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldrsh r0, [r1, #0x1a]
    cmp r0, #0x0
    movgt r0, #0x2
    strgtb r0, [r6, #0xf]
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldrsh r0, [r1, #0x18]
    cmp r0, #0x0
    strgtb r2, [r6, #0xf]
    movle r0, #0x0
    strleb r0, [r6, #0xf]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0217d1e0: .word data_ov011_021819b0
    arm_func_end func_ov011_0217d0b4

    .global func_ov011_0217d1e4
    arm_func_start func_ov011_0217d1e4
func_ov011_0217d1e4: ; 0x0217d1e4
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    ldr r0, [r8, #0x4]
    ldr r6, [r1, #0x10]
    ldr r7, [r0, #0x10]
    ldr r0, [r6, #0x20]
    ldrsb r4, [r0, #0xca]
    cmp r4, #0xd
    blt .L_0217d22c
    ldr r0, [r6, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    add r0, r4, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r4, r0, asr #0x18
.L_0217d22c:
    ldr r1, [r7, #0x0]
    mov r0, r6
    add r5, r1, #0x10
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    beq .L_0217d26c
    ldrsb r0, [r7, #0xe]
    cmp r0, r4
    bne .L_0217d26c
    cmp r0, #0xb
    beq .L_0217d26c
    ldrb r0, [r6, #0x107]
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x6000
    bge .L_0217d27c
.L_0217d26c:
    ldr r1, [r5, #0x0]
    mov r0, r8
    bl func_ov011_0217d750
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217d27c:
    ldrsh r0, [r5, #0x6]
    cmp r0, #0x0
    ble .L_0217d320
    ldrh r0, [r7, #0xc]
    cmp r0, #0x0
    bne .L_0217d2c8
    ldr r0, [r6, #0x2c]
    mov r1, #0x1f
    bl func_ov011_02179130
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r7, #0x13]
    bne .L_0217d2c8
    mov r0, #0x0
    strb r0, [r7, #0x13]
    ldr r1, [r5, #0x0]
    mov r0, r8
    bl func_ov011_0217d750
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217d2c8:
    ldrb r0, [r7, #0x13]
    cmp r0, #0x0
    beq .L_0217d2f0
    ldr r3, [r7, #0x4]
    ldr r1, [r5, #0x0]
    ldr r0, .L_0217d34c
    ldr r2, [r3, #0xe4]
    ldr r0, [r0, r1, lsl #0x2]
    orr r0, r2, r0
    str r0, [r3, #0xe4]
.L_0217d2f0:
    ldrsb r0, [r7, #0xf]
    ldrsh r1, [r5, #0x4]
    ldrh r2, [r7, #0xc]
    add r0, r5, r0, lsl #0x1
    ldrsh r0, [r0, #0x6]
    add r0, r1, r0
    cmp r2, r0
    blt .L_0217d33c
    ldr r1, [r5, #0x0]
    mov r0, r8
    bl func_ov011_0217d750
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217d320:
    ldr r3, [r7, #0x4]
    ldr r1, [r5, #0x0]
    ldr r0, .L_0217d34c
    ldr r2, [r3, #0xe4]
    ldr r0, [r0, r1, lsl #0x2]
    orr r0, r2, r0
    str r0, [r3, #0xe4]
.L_0217d33c:
    ldrh r0, [r7, #0xc]
    add r0, r0, #0x1
    strh r0, [r7, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217d34c: .word data_ov011_02181468
    arm_func_end func_ov011_0217d1e4

    .global func_ov011_0217d350
    arm_func_start func_ov011_0217d350
func_ov011_0217d350: ; 0x0217d350
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    ldr r0, [r6, #0x4]
    ldr r4, [r1, #0x10]
    ldr r5, [r0, #0x10]
    ldr r0, [r4, #0x20]
    ldrsb r7, [r0, #0xca]
    cmp r7, #0xd
    blt .L_0217d398
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    add r0, r7, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r7, r0, asr #0x18
.L_0217d398:
    mov r0, r4
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    beq .L_0217d3b4
    ldrsb r0, [r5, #0xe]
    cmp r0, r7
    beq .L_0217d3dc
.L_0217d3b4:
    ldrsb r2, [r5, #0xf]
    cmp r2, #0x0
    movlt r1, #0x0
    ldrge r1, [r5, #0x0]
    movge r0, #0xc
    mlage r0, r2, r0, r1
    ldrge r1, [r0, #0x1c]
    mov r0, r6
    bl func_ov011_0217d750
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0217d3dc:
    ldr r0, [r5, #0x0]
    ldrsb r1, [r5, #0xf]
    add r2, r0, #0x1c
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldrsh r3, [r0, #0x4]
    ldrsh r1, [r0, #0x6]
    ldrh r2, [r5, #0xc]
    sub r1, r3, r1
    sub r1, r1, #0x2
    cmp r2, r1
    bne .L_0217d45c
    ldrb r3, [r4, #0x104]
    ldr r4, [r4, #0x2c]
    add r3, r3, #0x1
    and ip, r3, #0xff
    cmp ip, #0x8
    movhs r3, #0x1
    bhs .L_0217d444
    ldr r3, .L_0217d550
    ldr r4, [r4, #0x38]
    ldr r3, [r3, ip, lsl #0x2]
    and r4, r4, #0xff
    cmp r4, r3
    movls r3, #0x1
    movhi r3, #0x0
.L_0217d444:
    cmp r3, #0x0
    bne .L_0217d45c
    ldr r1, [r0, #0x0]
    mov r0, r6
    bl func_ov011_0217d750
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0217d45c:
    cmp r2, r1
    mov r1, #0x0
    blt .L_0217d52c
    ldrb r2, [r5, #0x10]
    cmp r2, #0x0
    beq .L_0217d4b8
    cmp r2, #0x2
    blo .L_0217d4d4
    ldr r3, [r0, #0x0]
    ldr r2, .L_0217d554
    ldr r4, [r5, #0x4]
    ldr r2, [r2, r3, lsl #0x2]
    ldr r3, [r4, #0xe4]
    mvn r2, r2
    and r2, r3, r2
    str r2, [r4, #0xe4]
    ldrb r2, [r5, #0x10]
    cmp r2, #0x3
    streqb r1, [r5, #0x10]
    ldreqb r2, [r5, #0x11]
    addeq r2, r2, #0x1
    streqb r2, [r5, #0x11]
    b .L_0217d4d4
.L_0217d4b8:
    ldr ip, [r5, #0x4]
    ldr r3, [r0, #0x0]
    ldr r2, .L_0217d554
    ldr r4, [ip, #0xe4]
    ldr r2, [r2, r3, lsl #0x2]
    orr r2, r4, r2
    str r2, [ip, #0xe4]
.L_0217d4d4:
    ldrb r2, [r5, #0x10]
    add r2, r2, #0x1
    strb r2, [r5, #0x10]
    ldrb r3, [r5, #0x11]
    ldrsh r2, [r0, #0xa]
    cmp r3, r2
    blt .L_0217d51c
    mov r2, #0x0
    strb r2, [r5, #0x11]
    strb r2, [r5, #0x10]
    ldrsb r2, [r5, #0xf]
    add r2, r2, #0x1
    strb r2, [r5, #0xf]
    ldr r2, [r5, #0x0]
    ldrsb r3, [r5, #0xf]
    ldrb r2, [r2, #0xd]
    cmp r3, r2
    movge r1, #0x1
.L_0217d51c:
    ldrh r3, [r5, #0xc]
    ldrsh r2, [r0, #0x4]
    cmp r3, r2
    movgt r1, #0x1
.L_0217d52c:
    cmp r1, #0x0
    ldreqh r0, [r5, #0xc]
    addeq r0, r0, #0x1
    streqh r0, [r5, #0xc]
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r0, #0x0]
    mov r0, r6
    bl func_ov011_0217d750
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0217d550: .word data_ov011_0218190c
.L_0217d554: .word data_ov011_02181468
    arm_func_end func_ov011_0217d350

    .global func_ov011_0217d558
    arm_func_start func_ov011_0217d558
func_ov011_0217d558: ; 0x0217d558
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    ldr r0, [r8, #0x4]
    ldr r6, [r1, #0x10]
    ldr r7, [r0, #0x10]
    ldr r0, [r6, #0x20]
    ldrsb r5, [r0, #0xca]
    cmp r5, #0xd
    blt .L_0217d5a0
    ldr r0, [r6, #0x24]
    ldr r0, [r0, #0x0]
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    add r0, r5, r0, lsl #0x1
    mov r0, r0, lsl #0x18
    mov r5, r0, asr #0x18
.L_0217d5a0:
    mov r0, r6
    ldr r4, [r7, #0x0]
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    beq .L_0217d5c0
    ldrsb r0, [r7, #0xe]
    cmp r0, r5
    beq .L_0217d5d0
.L_0217d5c0:
    ldr r1, [r4, #0x10]
    mov r0, r8
    bl func_ov011_0217d750
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217d5d0:
    ldrsh r0, [r4, #0x14]
    cmp r0, #0x4
    bge .L_0217d5e8
    ldrh r0, [r7, #0xc]
    cmp r0, #0x2
    b .L_0217d5f4
.L_0217d5e8:
    ldrh r1, [r7, #0xc]
    sub r0, r0, #0x4
    cmp r1, r0
.L_0217d5f4:
    moveq r0, #0x1
    streqb r0, [r7, #0xf]
    ldrsb r0, [r7, #0xf]
    cmp r0, #0x1
    bne .L_0217d710
    ldr r0, [r6, #0x1c]
    bl func_ov011_02175628
    ldrsb r1, [r6, #0x38]
    ldr r0, [r0, #0x4]
    cmp r1, #0x0
    ldr r5, [r0, #0x10]
    ldrltb r0, [r6, #0x107]
    mov r1, #0x0
    strltb r0, [r6, #0x38]
    ldrsb r2, [r6, #0x38]
    ldr r0, [r6, #0xd4]
    mov r0, r0, lsr #0x1c
    add r2, r5, r2, lsl #0x2
    add r0, r5, r0, lsl #0x2
    ldr r3, [r2, #0x98]
    ldr r2, [r0, #0x98]
    ldr r5, [r3, #0x0]
    ldmia r2, {r0, r2}
    ldr r3, [r3, #0x4]
    sub r0, r5, r0
    str r1, [r7, #0x8]
    subs r1, r3, r2
    rsbmi r2, r1, #0x0
    movpl r2, r1
    cmp r0, #0x0
    rsblt r3, r0, #0x0
    movge r3, r0
    cmp r3, r2
    ble .L_0217d6c4
    ldr r2, [r7, #0x8]
    cmp r0, #0x0
    orrgt r2, r2, #0x4
    orrle r2, r2, #0x8
    str r2, [r7, #0x8]
    movs r2, r1, lsl #0x1
    rsbmi r2, r2, #0x0
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    cmp r0, r2
    bge .L_0217d708
    ldr r0, [r7, #0x8]
    cmp r1, #0x0
    orrgt r0, r0, #0x2
    strgt r0, [r7, #0x8]
    orrle r0, r0, #0x1
    strle r0, [r7, #0x8]
    b .L_0217d708
.L_0217d6c4:
    ldr r2, [r7, #0x8]
    cmp r1, #0x0
    orrgt r2, r2, #0x2
    orrle r2, r2, #0x1
    str r2, [r7, #0x8]
    movs r2, r0, lsl #0x1
    rsbmi r2, r2, #0x0
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    cmp r1, r2
    bge .L_0217d708
    cmp r0, #0x0
    ldr r0, [r7, #0x8]
    orrgt r0, r0, #0x4
    strgt r0, [r7, #0x8]
    orrle r0, r0, #0x8
    strle r0, [r7, #0x8]
.L_0217d708:
    mov r0, #0x2
    strb r0, [r7, #0xf]
.L_0217d710:
    ldr r2, [r7, #0x8]
    cmp r2, #0x0
    ldrne r1, [r7, #0x4]
    ldrne r0, [r1, #0xe4]
    orrne r0, r0, r2
    strne r0, [r1, #0xe4]
    ldrh r1, [r7, #0xc]
    ldrsh r0, [r4, #0x14]
    cmp r1, r0
    addle r0, r1, #0x1
    strleh r0, [r7, #0xc]
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, #0xf
    bl func_ov011_0217d750
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov011_0217d558

    .global func_ov011_0217d750
    arm_func_start func_ov011_0217d750
func_ov011_0217d750: ; 0x0217d750
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x4]
    ldr r2, .L_0217d790
    ldr lr, [r3, #0x10]
    ldr r1, [r2, r1, lsl #0x2]
    ldr ip, [lr, #0x4]
    mvn r2, r1
    ldr r3, [ip, #0xe4]
    mov r1, #0x0
    and r2, r3, r2
    str r2, [ip, #0xe4]
    strb r1, [lr, #0x12]
    ldr r0, [r0, #0x4]
    ldr r1, .L_0217d794
    bl func_02028384
    ldmia sp!, {r3, pc}
.L_0217d790: .word data_ov011_02181468
.L_0217d794: .word func_ov011_0217d0b4
    arm_func_end func_ov011_0217d750

    .global func_ov011_0217d798
    arm_func_start func_ov011_0217d798
func_ov011_0217d798: ; 0x0217d798
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, .L_0217d87c
    mov r6, r0
    ldr r2, .L_0217d880
    mov r0, #0x10
    mov r3, #0x7a
    bl func_0201a21c
    mov r1, #0x0
    mov r2, #0x10
    mov r4, r0
    bl func_020517fc
    ldr r1, [r6, #0x14]
    mov r0, #0x0
    ldr r1, [r1, #0x0]
    str r1, [r4, #0x0]
    ldr r1, [r6, #0x18]
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    bl func_02020d90
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r0, [r5, #0x4]
    ldr r1, .L_0217d884
    bl func_02028384
    mov r0, #0x95000
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r5, #0x4]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    ldr r1, [r6, #0x1c]
    ldr r0, [r5, #0x4]
    cmp r1, #0x0
    bne .L_0217d860
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_0217d870
.L_0217d860:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_0217d870:
    str r5, [r6, #0x30]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0217d87c: .word data_ov011_02181a18
.L_0217d880: .word data_ov011_021819f8
.L_0217d884: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217d798

    .global func_ov011_0217d888
    arm_func_start func_ov011_0217d888
func_ov011_0217d888: ; 0x0217d888
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x30]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x4]
    mov r2, #0x0
    ldr r0, [r0, #0x10]
    ldr r1, [r0, #0x0]
    str r2, [r1, #0xe4]
    bl func_0201b244
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r5, #0x30]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_0217d888

    .global func_ov011_0217d8d0
    arm_func_start func_ov011_0217d8d0
func_ov011_0217d8d0: ; 0x0217d8d0
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r6, [r0, #0x30]
    mov r4, r1
    cmp r6, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, .L_0217d928
    ldr r2, [r6, #0x4]
    ldr r7, [r1, r4, lsl #0x2]
    ldr r5, [r2, #0x10]
    cmp r7, #0x0
    beq .L_0217d91c
    bl func_ov011_0217d094
    ldr r0, [r5, #0x0]
    mov r1, #0x0
    str r1, [r0, #0xe4]
    ldr r0, [r6, #0x4]
    mov r1, r7
    bl func_02028384
    str r4, [r5, #0x8]
.L_0217d91c:
    mov r0, #0x0
    strb r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0217d928: .word data_ov011_02181478
    arm_func_end func_ov011_0217d8d0

    .global func_ov011_0217d92c
    arm_func_start func_ov011_0217d92c
func_ov011_0217d92c: ; 0x0217d92c
    bx lr
    arm_func_end func_ov011_0217d92c

    .global func_ov011_0217d930
    arm_func_start func_ov011_0217d930
func_ov011_0217d930: ; 0x0217d930
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217d954
    cmp r1, #0x4
    beq .L_0217d968
    b .L_0217d98c
.L_0217d954:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x20
    str r0, [r1, #0xe4]
    b .L_0217d98c
.L_0217d968:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217d99c
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x20
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217d98c:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217d99c: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217d930

    .global func_ov011_0217d9a0
    arm_func_start func_ov011_0217d9a0
func_ov011_0217d9a0: ; 0x0217d9a0
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217d9c4
    cmp r1, #0x4
    beq .L_0217d9d8
    b .L_0217d9fc
.L_0217d9c4:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x80
    str r0, [r1, #0xe4]
    b .L_0217d9fc
.L_0217d9d8:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217da0c
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x80
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217d9fc:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217da0c: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217d9a0

    .global func_ov011_0217da10
    arm_func_start func_ov011_0217da10
func_ov011_0217da10: ; 0x0217da10
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r4, [r1, #0x10]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xd4]
    tst r0, #0x80
    movne r3, #0x8
    ldrb r0, [r4, #0xc]
    moveq r3, #0x4
    cmp r0, #0x0
    beq .L_0217da5c
    cmp r0, #0x1
    beq .L_0217da70
    cmp r0, #0x5
    beq .L_0217da84
    b .L_0217dab0
.L_0217da5c:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, r3
    str r0, [r1, #0xe4]
    b .L_0217dab0
.L_0217da70:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x20
    str r0, [r1, #0xe4]
    b .L_0217dab0
.L_0217da84:
    ldr r2, [r4, #0x0]
    orr r0, r3, #0x20
    ldr r1, [r2, #0xe4]
    mvn r0, r0
    and r0, r1, r0
    str r0, [r2, #0xe4]
    ldr r0, [r5, #0x4]
    ldr r1, .L_0217dac0
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217dab0:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.L_0217dac0: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217da10

    .global func_ov011_0217dac4
    arm_func_start func_ov011_0217dac4
func_ov011_0217dac4: ; 0x0217dac4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r4, [r1, #0x10]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xd4]
    tst r0, #0x80
    movne r3, #0x8
    ldrb r0, [r4, #0xc]
    moveq r3, #0x4
    cmp r0, #0x0
    beq .L_0217db10
    cmp r0, #0x1
    beq .L_0217db24
    cmp r0, #0x5
    beq .L_0217db38
    b .L_0217db64
.L_0217db10:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, r3
    str r0, [r1, #0xe4]
    b .L_0217db64
.L_0217db24:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x80
    str r0, [r1, #0xe4]
    b .L_0217db64
.L_0217db38:
    ldr r2, [r4, #0x0]
    orr r0, r3, #0x80
    ldr r1, [r2, #0xe4]
    mvn r0, r0
    and r0, r1, r0
    str r0, [r2, #0xe4]
    ldr r0, [r5, #0x4]
    ldr r1, .L_0217db74
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217db64:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.L_0217db74: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217dac4

    .global func_ov011_0217db78
    arm_func_start func_ov011_0217db78
func_ov011_0217db78: ; 0x0217db78
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217dba4
    cmp r1, #0x1
    beq .L_0217dbb8
    cmp r1, #0x5
    beq .L_0217dbcc
    b .L_0217dbf0
.L_0217dba4:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x1
    str r0, [r1, #0xe4]
    b .L_0217dbf0
.L_0217dbb8:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x20
    str r0, [r1, #0xe4]
    b .L_0217dbf0
.L_0217dbcc:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217dc00
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x21
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217dbf0:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217dc00: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217db78

    .global func_ov011_0217dc04
    arm_func_start func_ov011_0217dc04
func_ov011_0217dc04: ; 0x0217dc04
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217dc30
    cmp r1, #0x1
    beq .L_0217dc44
    cmp r1, #0x5
    beq .L_0217dc58
    b .L_0217dc7c
.L_0217dc30:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x1
    str r0, [r1, #0xe4]
    b .L_0217dc7c
.L_0217dc44:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x80
    str r0, [r1, #0xe4]
    b .L_0217dc7c
.L_0217dc58:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217dc8c
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x81
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217dc7c:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217dc8c: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217dc04

    .global func_ov011_0217dc90
    arm_func_start func_ov011_0217dc90
func_ov011_0217dc90: ; 0x0217dc90
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217dcbc
    cmp r1, #0xa
    beq .L_0217dcd0
    cmp r1, #0xe
    beq .L_0217dce4
    b .L_0217dd08
.L_0217dcbc:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x2
    str r0, [r1, #0xe4]
    b .L_0217dd08
.L_0217dcd0:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x20
    str r0, [r1, #0xe4]
    b .L_0217dd08
.L_0217dce4:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217dd18
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x22
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217dd08:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217dd18: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217dc90

    .global func_ov011_0217dd1c
    arm_func_start func_ov011_0217dd1c
func_ov011_0217dd1c: ; 0x0217dd1c
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217dd48
    cmp r1, #0xa
    beq .L_0217dd5c
    cmp r1, #0xe
    beq .L_0217dd70
    b .L_0217dd94
.L_0217dd48:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x2
    str r0, [r1, #0xe4]
    b .L_0217dd94
.L_0217dd5c:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x80
    str r0, [r1, #0xe4]
    b .L_0217dd94
.L_0217dd70:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217dda4
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x82
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217dd94:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217dda4: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217dd1c

    .global func_ov011_0217dda8
    arm_func_start func_ov011_0217dda8
func_ov011_0217dda8: ; 0x0217dda8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    ldr r4, [r1, #0x10]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr ip, [r4, #0x4]
    ldr r1, [r0, #0x10]
    ldrb r0, [ip, #0x10]
    ldr r1, [r1, #0x24]
    cmp r0, #0x0
    ldr r0, [r1, #0x0]
    ldmneia sp!, {r3, r4, r5, pc}
    ldrb r3, [r0, #0xc3]
    ldrb r1, [r0, #0xc2]
    mov r2, #0x1
    mov r0, #0x4
    strh r1, [ip, #0xc]
    strh r3, [ip, #0xe]
    ldr r3, [r4, #0x4]
    ldr r1, .L_0217de18
    strb r2, [r3, #0x10]
    strb r0, [r3, #0x11]
    ldr r0, [r5, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_0217de18: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217dda8

    .global func_ov011_0217de1c
    arm_func_start func_ov011_0217de1c
func_ov011_0217de1c: ; 0x0217de1c
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217de40
    cmp r1, #0x4
    beq .L_0217de54
    b .L_0217de78
.L_0217de40:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x40
    str r0, [r1, #0xe4]
    b .L_0217de78
.L_0217de54:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217de88
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x40
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217de78:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217de88: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217de1c

    .global func_ov011_0217de8c
    arm_func_start func_ov011_0217de8c
func_ov011_0217de8c: ; 0x0217de8c
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217deb8
    cmp r1, #0x1
    beq .L_0217decc
    cmp r1, #0x5
    beq .L_0217dee0
    b .L_0217df04
.L_0217deb8:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x1
    str r0, [r1, #0xe4]
    b .L_0217df04
.L_0217decc:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x40
    str r0, [r1, #0xe4]
    b .L_0217df04
.L_0217dee0:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217df14
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x41
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217df04:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217df14: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217de8c

    .global func_ov011_0217df18
    arm_func_start func_ov011_0217df18
func_ov011_0217df18: ; 0x0217df18
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x4]
    ldr r4, [r1, #0x10]
    ldrb r1, [r4, #0xc]
    cmp r1, #0x0
    beq .L_0217df3c
    cmp r1, #0x4
    beq .L_0217df50
    b .L_0217df74
.L_0217df3c:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0xe4]
    orr r0, r0, #0x4000
    str r0, [r1, #0xe4]
    b .L_0217df74
.L_0217df50:
    ldr r3, [r4, #0x0]
    ldr r1, .L_0217df84
    ldr r2, [r3, #0xe4]
    bic r2, r2, #0x4000
    str r2, [r3, #0xe4]
    ldr r0, [r0, #0x4]
    bl func_02028384
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_0217df74:
    ldrb r0, [r4, #0xc]
    add r0, r0, #0x1
    strb r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0217df84: .word func_ov011_0217d92c
    arm_func_end func_ov011_0217df18

    .global func_ov011_0217df88
    arm_func_start func_ov011_0217df88
func_ov011_0217df88: ; 0x0217df88
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrb r1, [r8, #0x81]
    cmp r1, #0x0
    beq .L_0217dfcc
    ldr r0, [r8, #0x24]
    ldr r0, [r0, #0x24]
    tst r0, #0x2
    bne .L_0217dfb4
    cmp r1, #0x8
    blo .L_0217e23c
.L_0217dfb4:
    mov r0, #0x1
    strb r0, [r8, #0x105]
    mov r0, #0x0
    strb r0, [r8, #0x81]
    strb r0, [r8, #0x82]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0217dfcc:
    ldr r1, [r8, #0x24]
    ldrb r0, [r1, #0x38]
    cmp r0, #0x1
    movls r0, #0x1
    strlsb r0, [r8, #0x105]
    movls r0, #0x0
    strlsb r0, [r8, #0x81]
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrb r0, [r8, #0x82]
    mov r7, #0x0
    cmp r0, #0x0
    bne .L_0217e074
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    ldrne r1, [r0, #0x60]
    subeq r1, r7, #0x1
    cmp r0, #0x0
    ldrne r0, [r0, #0x64]
    mvneq r0, #0x0
    cmp r0, r1, asr #0x1
    bge .L_0217e034
    ldr r0, [r8, #0x2c]
    bl func_ov011_021792a0
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_0217e074
.L_0217e034:
    ldr r0, [r8, #0x2c]
    bl func_ov011_021792fc
    cmp r0, #0x0
    movne r0, #0x2
    bne .L_0217e074
    ldr r0, [r8, #0x2c]
    mov r1, #0x22
    bl func_ov011_02179130
    cmp r0, #0x0
    beq .L_0217e070
    ldr r0, [r8, #0x24]
    ldr r0, [r0, #0x28]
    tst r0, #0x800000
    movne r0, #0x3
    bne .L_0217e074
.L_0217e070:
    mov r0, #0x0
.L_0217e074:
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0217e204
.L_0217e080: ; jump table
    b .L_0217e090 ; case 0
    b .L_0217e0f8 ; case 1
    b .L_0217e168 ; case 2
    b .L_0217e1bc ; case 3
.L_0217e090:
    ldr r0, [r8, #0x24]
    mov r7, #0x0
    ldr r5, [r0, #0x0]
    ldr r9, .L_0217e24c
    b .L_0217e0ec
.L_0217e0a4:
    ldr r0, [r8, #0x24]
    ldr r4, [r0, #0x14]
    b .L_0217e0e4
.L_0217e0b0:
    ldr r6, [r4, #0x8]
    cmp r5, r6
    beq .L_0217e0e0
    ldr r0, [r6, #0x64]
    cmp r0, #0x0
    ble .L_0217e0e0
    ldr r0, [r9, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    tst r0, #0x1
    movne r7, r6
    bne .L_0217e0ec
.L_0217e0e0:
    ldr r4, [r4, #0x0]
.L_0217e0e4:
    cmp r4, #0x0
    bne .L_0217e0b0
.L_0217e0ec:
    cmp r7, #0x0
    beq .L_0217e0a4
    b .L_0217e204
.L_0217e0f8:
    ldr r0, [r8, #0x24]
    mov r7, #0x0
    mov r2, r7
    ldr r4, [r0, #0x14]
    ldr r3, [r0, #0x0]
    b .L_0217e15c
.L_0217e110:
    ldr r5, [r4, #0x8]
    cmp r3, r5
    beq .L_0217e158
    ldr r6, [r5, #0x64]
    cmp r6, r2
    blt .L_0217e158
    cmp r2, r6
    bne .L_0217e150
    cmp r7, #0x0
    beq .L_0217e150
    ldr r1, [r7, #0x60]
    ldr r0, [r5, #0x60]
    sub r1, r1, r2
    sub r0, r0, r2
    cmp r1, r0
    bgt .L_0217e158
.L_0217e150:
    mov r7, r5
    mov r2, r6
.L_0217e158:
    ldr r4, [r4, #0x0]
.L_0217e15c:
    cmp r4, #0x0
    bne .L_0217e110
    b .L_0217e204
.L_0217e168:
    ldr r0, [r8, #0x24]
    mov r7, #0x0
    sub r3, r7, #0x80
    ldr r4, [r0, #0x0]
    ldr r2, [r0, #0x14]
    b .L_0217e1a8
.L_0217e180:
    ldr r1, [r2, #0x8]
    cmp r4, r1
    beq .L_0217e1a4
    ldr r0, [r1, #0x64]
    cmp r0, #0x0
    ldrgtsb r0, [r1, #0xc6]
    cmpgt r0, r3
    movgt r3, r0
    movgt r7, r1
.L_0217e1a4:
    ldr r2, [r2, #0x0]
.L_0217e1a8:
    cmp r2, #0x0
    bne .L_0217e180
    cmp r3, #0x0
    movlt r7, #0x0
    b .L_0217e204
.L_0217e1bc:
    ldr r0, [r8, #0x24]
    mov r7, #0x0
    ldr r2, [r0, #0x14]
    ldr r3, [r0, #0x0]
    b .L_0217e1fc
.L_0217e1d0:
    ldr r1, [r2, #0x8]
    cmp r3, r1
    beq .L_0217e1f8
    ldr r0, [r1, #0x64]
    cmp r0, #0x0
    blt .L_0217e1f8
    ldr r0, [r1, #0x68]
    tst r0, #0x800000
    movne r7, r1
    bne .L_0217e204
.L_0217e1f8:
    ldr r2, [r2, #0x0]
.L_0217e1fc:
    cmp r2, #0x0
    bne .L_0217e1d0
.L_0217e204:
    mov r0, #0x1
    cmp r7, #0x0
    streqb r0, [r8, #0x105]
    moveq r0, #0x0
    streqb r0, [r8, #0x81]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrb r2, [r7, #0xc3]
    ldrb r1, [r7, #0xc2]
    ldr r3, [r8, #0x18]
    strh r1, [r3, #0xc]
    strh r2, [r3, #0xe]
    strb r0, [r3, #0x10]
    mov r0, #0x4
    strb r0, [r3, #0x11]
.L_0217e23c:
    ldrb r0, [r8, #0x81]
    add r0, r0, #0x1
    strb r0, [r8, #0x81]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0217e24c: .word data_020a0da8
    arm_func_end func_ov011_0217df88

    .global func_ov011_0217e250
    arm_func_start func_ov011_0217e250
func_ov011_0217e250: ; 0x0217e250
    mov r1, #0x0
    strb r1, [r0, #0x81]
    mov r1, #0x1
    strb r1, [r0, #0x82]
    mov r1, #0x1e
    strb r1, [r0, #0x85]
    bx lr
    arm_func_end func_ov011_0217e250

    .global func_ov011_0217e26c
    arm_func_start func_ov011_0217e26c
func_ov011_0217e26c: ; 0x0217e26c
    mov r1, #0x0
    strb r1, [r0, #0x81]
    mov r1, #0x2
    strb r1, [r0, #0x82]
    mov r1, #0x3c
    strb r1, [r0, #0x84]
    bx lr
    arm_func_end func_ov011_0217e26c

    .global func_ov011_0217e288
    arm_func_start func_ov011_0217e288
func_ov011_0217e288: ; 0x0217e288
    mov r1, #0x0
    strb r1, [r0, #0x81]
    mov r1, #0x3
    strb r1, [r0, #0x82]
    mov r1, #0x3c
    strb r1, [r0, #0x83]
    bx lr
    arm_func_end func_ov011_0217e288

    .global func_ov011_0217e2a4
    arm_func_start func_ov011_0217e2a4
func_ov011_0217e2a4: ; 0x0217e2a4
    ldrb r1, [r0, #0x83]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneb r1, [r0, #0x83]
    ldrb r1, [r0, #0x84]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneb r1, [r0, #0x84]
    ldrb r1, [r0, #0x85]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneb r1, [r0, #0x85]
    bx lr
    arm_func_end func_ov011_0217e2a4

    .global func_ov011_0217e2d8
    arm_func_start func_ov011_0217e2d8
func_ov011_0217e2d8: ; 0x0217e2d8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02020d90
    mov r1, #0x96000
    str r1, [sp, #0x0]
    mov r4, r0
    ldr r0, [r4, #0x4]
    add r1, sp, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xa0]
    blx r2
    ldr r0, [r4, #0x4]
    ldr r1, .L_0217e36c
    bl func_02028384
    ldr r0, [r4, #0x4]
    mov r1, #0x80000
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldr r1, [r5, #0x1c]
    ldr r0, [r4, #0x4]
    cmp r1, #0x0
    bne .L_0217e348
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_0217e358
.L_0217e348:
    ldr r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    ldr r2, [r2, #0xd4]
    blx r2
.L_0217e358:
    str r4, [r5, #0x54]
    mov r0, #0x0
    strb r0, [r5, #0x7c]
    strb r0, [r5, #0x7d]
    ldmia sp!, {r3, r4, r5, pc}
.L_0217e36c: .word func_ov011_0217ee38
    arm_func_end func_ov011_0217e2d8

    .global func_ov011_0217e370
    arm_func_start func_ov011_0217e370
func_ov011_0217e370: ; 0x0217e370
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x54]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217e370

    .global func_ov011_0217e39c
    arm_func_start func_ov011_0217e39c
func_ov011_0217e39c: ; 0x0217e39c
    bx lr
    arm_func_end func_ov011_0217e39c

    .global func_ov011_0217e3a0
    arm_func_start func_ov011_0217e3a0
func_ov011_0217e3a0: ; 0x0217e3a0
    mov r1, #0x0
    strb r1, [r0, #0x7c]
    strb r1, [r0, #0x7d]
    bx lr
    arm_func_end func_ov011_0217e3a0

    .global func_ov011_0217e3b0
    arm_func_start func_ov011_0217e3b0
func_ov011_0217e3b0: ; 0x0217e3b0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsb r0, [r4, #0x7e]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrb r1, [r4, #0x104]
    ldr r0, [r4, #0x2c]
    add r1, r1, #0x1
    and r1, r1, #0xff
    bl func_ov011_0217e3f4
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x1e
    streqb r0, [r4, #0x7e]
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217e3b0

    .global func_ov011_0217e3f4
    arm_func_start func_ov011_0217e3f4
func_ov011_0217e3f4: ; 0x0217e3f4
    cmp r1, #0x8
    movhs r0, #0x1
    bxhs lr
    ldr r2, .L_0217e420
    ldr r3, [r0, #0x38]
    ldr r0, [r2, r1, lsl #0x2]
    and r1, r3, #0xff
    cmp r1, r0
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_0217e420: .word data_ov011_0218190c
    arm_func_end func_ov011_0217e3f4

    .global func_ov011_0217e424
    arm_func_start func_ov011_0217e424
func_ov011_0217e424: ; 0x0217e424
    ldrb r0, [r0, #0x7c]
    cmp r0, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov011_0217e424

    .global func_ov011_0217e438
    arm_func_start func_ov011_0217e438
func_ov011_0217e438: ; 0x0217e438
    ldrb r1, [r0, #0x7c]
    cmp r1, #0x0
    ldreqb r0, [r0, #0x7f]
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217e438

    .global func_ov011_0217e454
    arm_func_start func_ov011_0217e454
func_ov011_0217e454: ; 0x0217e454
    ldrb r1, [r0, #0x108]
    ldr r2, [r0, #0x14]
    cmp r1, #0x1
    ldr r3, [r2, #0x0]
    bxne lr
    ldr r1, [r3, #0xe4]
    tst r1, #0x2
    beq .L_0217e494
    ldrb r2, [r0, #0x7d]
    add r1, r2, #0x1
    strb r1, [r0, #0x7d]
    cmp r2, #0x10
    ldrhi r0, [r3, #0xe4]
    bichi r0, r0, #0x2
    strhi r0, [r3, #0xe4]
    bx lr
.L_0217e494:
    mov r1, #0x0
    strb r1, [r0, #0x7d]
    bx lr
    arm_func_end func_ov011_0217e454

    .global func_ov011_0217e4a0
    arm_func_start func_ov011_0217e4a0
func_ov011_0217e4a0: ; 0x0217e4a0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r0, [r5, #0xd4]
    add r7, r5, #0x54
    tst r0, #0x100
    bne .L_0217e994
    add r0, r7, #0x4
    mov r1, #0x0
    mov r2, #0x24
    bl func_020517fc
    mov r3, #0x0
    mvn r2, #0x0
    mov r0, #0xc
.L_0217e4d8:
    mla r1, r3, r0, r7
    add r3, r3, #0x1
    strb r2, [r1, #0xe]
    cmp r3, #0x3
    blt .L_0217e4d8
    ldr r0, [r5, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r2, [r5, #0xd4]
    ldr r1, [r0, #0x10]
    mov r0, r2, lsr #0x1c
    str r0, [sp, #0x4]
    add r9, r1, #0xa8
    mov r8, #0x0
.L_0217e510:
    ldr r0, [sp, #0x4]
    cmp r0, r8
    ldrne r0, [r9, #0x24]
    cmpne r0, #0x0
    beq .L_0217e708
    bl func_ov011_0217e9c4
    cmp r0, #0x0
    bne .L_0217e540
    ldr r0, [r9, #0x24]
    bl func_ov011_0217e9d8
    cmp r0, #0x0
    beq .L_0217e708
.L_0217e540:
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, r8, lsl #0x18
    mvn r6, #0x0
    mov r11, r0, asr #0x18
    add r0, r6, #0x8000
    str r0, [sp, #0x14]
.L_0217e55c:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    ldr r0, [r9, #0x24]
    beq .L_0217e5a4
    bl func_ov011_0217e9d8
    cmp r0, #0x0
    beq .L_0217e6f4
    ldr r0, [r9, #0x24]
    ldr r4, [r0, #0x4]
    cmp r4, #0x0
    ldrnesb r0, [r4, #0xc4]
    ldr r10, [r4, #0xc]
    moveq r0, r6
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r10
    bl func_ov011_0217e9a0
    b .L_0217e5d0
.L_0217e5a4:
    bl func_ov011_0217e9c4
    cmp r0, #0x0
    beq .L_0217e6f4
    ldr r0, [r9, #0x24]
    ldr r4, [r0, #0x0]
    ldr r10, [r4, #0xc]
    bl func_ov011_0217e9ec
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r10
    bl func_ov011_0217e9a0
.L_0217e5d0:
    mov r1, #0x0
    str r1, [sp, #0x8]
    add lr, r0, #0x9c
    ldrb r0, [r0, #0xc]
    mov r2, r1
    add r3, r6, #0x8000
    str r0, [sp, #0x0]
    mov r0, r1
    mov ip, r1
    str r0, [sp, #0x10]
    b .L_0217e694
.L_0217e5fc:
    ldrsh r10, [lr, #0x14]
    ldrh r0, [r4, #0xbe]
    sub r0, r10, r0
    mov r0, r0, lsl #0x10
    cmp r3, r0, asr #0x10
    mov r0, r0, asr #0x10
    movgt r3, r0
    ldr r0, [lr, #0xc]
    ldr r10, [lr, #0x10]
    mov r0, r0, lsl #0x10
    add r0, r2, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r0, asr #0x10
    mov r0, r10, lsl #0x10
    add r0, r1, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    ldrb r0, [lr, #0x1c]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x8]
    ldrb r0, [lr, #0x1b]
    orrne ip, ip, #0x1
    cmp r0, #0x0
    ldrb r0, [lr, #0x18]
    orrne ip, ip, #0x10
    add lr, lr, #0x20
    cmp r0, #0x2
    cmpne r0, #0x4
    add r0, r0, #0xfc
    and r0, r0, #0xff
    orreq ip, ip, #0x2
    cmp r0, #0x1
    ldr r0, [sp, #0x10]
    orrls ip, ip, #0x8
    add r0, r0, #0x1
    and r0, r0, #0xff
    str r0, [sp, #0x10]
.L_0217e694:
    ldr r10, [sp, #0x10]
    ldr r0, [sp, #0x0]
    cmp r10, r0
    blo .L_0217e5fc
    cmp r2, r6, lsl #0xf
    strgtb r11, [r5, #0x6e]
    strgth r3, [r5, #0x6c]
    strgth r2, [r5, #0x68]
    strgth r1, [r5, #0x6a]
    ldr r0, [sp, #0x14]
    strgt ip, [r5, #0x64]
    cmp r3, r0
    strltb r11, [r5, #0x62]
    strlth r3, [r5, #0x60]
    strlth r2, [r5, #0x5c]
    strlth r1, [r5, #0x5e]
    strlt ip, [r5, #0x58]
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    strneb r11, [r5, #0x7a]
    strneh r3, [r5, #0x78]
    strneh r2, [r5, #0x74]
    strneh r1, [r5, #0x76]
    strne ip, [r5, #0x70]
.L_0217e6f4:
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x2
    blt .L_0217e55c
.L_0217e708:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x10c
    blt .L_0217e510
    ldr r0, [r5, #0xd4]
    tst r0, #0x2
    bne .L_0217e740
    ldr r0, [r5, #0x2c]
    mov r1, #0x21
    bl func_ov011_02179130
    cmp r0, #0x0
    movne r0, #0x5
    strneb r0, [r7, #0x28]
    bne .L_0217e994
.L_0217e740:
    mov r0, #0x2
    strb r0, [r7, #0x28]
    ldrsb r0, [r7, #0xe]
    cmp r0, #0x0
    blt .L_0217e764
    ldr r0, [r7, #0x4]
    tst r0, #0x1
    movne r0, #0x3
    strneb r0, [r7, #0x28]
.L_0217e764:
    ldr r1, [r5, #0x24]
    ldr r0, .L_0217e99c
    ldr r1, [r1, #0x28]
    tst r1, r0
    beq .L_0217e994
    ldr r0, [r7, #0x4]
    tst r0, #0x2
    bne .L_0217e994
    ldrb r1, [r5, #0x104]
    ldr r0, [r5, #0x2c]
    bl func_ov011_0217e3f4
    cmp r0, #0x0
    beq .L_0217e994
    ldr r0, [r5, #0x24]
    ldr r9, [r0, #0x0]
    ldr r0, [r9, #0x68]
    tst r0, #0x800
    beq .L_0217e810
    ldr r0, [r5, #0x58]
    tst r0, #0x8
    bne .L_0217e810
    ldr r4, [r9, #0xc]
    mov r0, #0xb
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r4
    bl func_ov011_0217e9a0
    ldrb r1, [r0, #0xc]
    cmp r1, #0x0
    beq .L_0217e810
    ldrsh r1, [r0, #0xb0]
    ldrsh r0, [r5, #0x60]
    cmp r1, r0
    bge .L_0217e810
    mov r0, r5
    bl func_ov011_0217e3a0
    mov r0, r5
    mov r1, #0xb
    bl func_ov011_0217ab84
    ldr r0, [r5, #0xd4]
    orr r0, r0, #0x100
    str r0, [r5, #0xd4]
    b .L_0217e994
.L_0217e810:
    ldr r1, [r5, #0x24]
    ldrb r0, [r1, #0x36]
    cmp r0, #0x0
    beq .L_0217e994
    ldr r0, [r1, #0x28]
    tst r0, #0x10000
    bne .L_0217e834
    tst r0, #0x20000
    beq .L_0217e8fc
.L_0217e834:
    ldr r8, [r1, #0x1c]
    mov r4, #0x1
    mov r6, #0x0
    mov r11, #0x2
    b .L_0217e8f4
.L_0217e848:
    ldr r10, [r8, #0x8]
    mov r7, r6
    ldr r0, [r10, #0x68]
    tst r0, #0x10000
    beq .L_0217e86c
    mov r0, r10
    bl func_ov011_02174f4c
    cmp r0, #0x1
    moveq r7, r4
.L_0217e86c:
    ldr r0, [r10, #0x68]
    tst r0, #0x20000
    beq .L_0217e888
    mov r0, r10
    bl func_ov011_02174f4c
    cmp r0, #0x2
    moveq r7, r11
.L_0217e888:
    cmp r7, #0x0
    beq .L_0217e8f0
    mov r0, r7, lsl #0x18
    ldr r7, [r9, #0xc]
    mov r0, r0, asr #0x18
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r7
    bl func_ov011_0217e9a0
    ldrb r1, [r0, #0xc]
    cmp r1, #0x0
    beq .L_0217e8f0
    ldrsh r1, [r0, #0xb0]
    ldrsh r0, [r5, #0x60]
    cmp r1, r0
    bge .L_0217e8f0
    ldrb r2, [r10, #0xc3]
    ldrb r1, [r10, #0xc2]
    ldr r3, [r5, #0x18]
    mov r0, #0x1
    strh r1, [r3, #0xc]
    strh r2, [r3, #0xe]
    strb r0, [r3, #0x10]
    mov r0, #0x4
    strb r0, [r3, #0x11]
    b .L_0217e994
.L_0217e8f0:
    ldr r8, [r8, #0x0]
.L_0217e8f4:
    cmp r8, #0x0
    bne .L_0217e848
.L_0217e8fc:
    ldr r0, [r9, #0x68]
    tst r0, #0x40
    beq .L_0217e994
    mov r0, r9
    bl func_ov011_02174f4c
    sub r0, r0, #0x3
    mov r0, r0, lsl #0x1
    add r0, r0, #0xd
    and r6, r0, #0xff
    mov r4, #0x0
    b .L_0217e98c
.L_0217e928:
    add r7, r6, r4
    mov r0, r7, lsl #0x18
    ldr r8, [r9, #0xc]
    mov r0, r0, asr #0x18
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r8
    bl func_ov011_0217e9a0
    ldrb r1, [r0, #0xc]
    cmp r1, #0x0
    beq .L_0217e988
    ldrsh r1, [r0, #0xb0]
    ldrsh r0, [r5, #0x60]
    cmp r1, r0
    bge .L_0217e988
    mov r0, r5
    bl func_ov011_0217e3a0
    mov r0, r5
    and r1, r7, #0xff
    bl func_ov011_0217ab84
    ldr r0, [r5, #0xd4]
    orr r0, r0, #0x100
    str r0, [r5, #0xd4]
    b .L_0217e994
.L_0217e988:
    add r4, r4, #0x1
.L_0217e98c:
    cmp r4, #0x2
    blt .L_0217e928
.L_0217e994:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217e99c: .word 0x30840
    arm_func_end func_ov011_0217e4a0

    .global func_ov011_0217e9a0
    arm_func_start func_ov011_0217e9a0
func_ov011_0217e9a0: ; 0x0217e9a0
    cmp r1, #0x0
    movlt r0, #0x0
    bxlt lr
    add r1, r0, r1, lsl #0x2
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    movlt r0, #0x0
    addge r0, r0, r1
    bx lr
    arm_func_end func_ov011_0217e9a0

    .global func_ov011_0217e9c4
    arm_func_start func_ov011_0217e9c4
func_ov011_0217e9c4: ; 0x0217e9c4
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x78]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217e9c4

    .global func_ov011_0217e9d8
    arm_func_start func_ov011_0217e9d8
func_ov011_0217e9d8: ; 0x0217e9d8
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    ldrne r0, [r0, #0x78]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217e9d8

    .global func_ov011_0217e9ec
    arm_func_start func_ov011_0217e9ec
func_ov011_0217e9ec: ; 0x0217e9ec
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrnesb r0, [r0, #0xc4]
    mvneq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217e9ec

    .global func_ov011_0217ea00
    arm_func_start func_ov011_0217ea00
func_ov011_0217ea00: ; 0x0217ea00
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r1, [r10, #0xd4]
    ldr r0, [r0, #0x10]
    mov r6, #0x0
    mov r11, #0x1
    mov r9, r6
    mov r5, r1, lsr #0x1c
    add r7, r0, #0xa8
    mov r8, #0x100
    mov r4, r11
.L_0217ea38:
    cmp r5, r9
    ldrne r0, [r7, #0x24]
    cmpne r0, #0x0
    beq .L_0217eac8
    bl func_ov011_0217e9c4
    cmp r0, #0x0
    beq .L_0217ea88
    ldr r0, [r7, #0x24]
    ldr r2, [r0, #0x0]
    ldr r1, [r2, #0x10]
    ldrb r0, [r1, #0xc]
    cmp r0, #0x0
    beq .L_0217eac8
    ldrsh r1, [r1, #0xb0]
    ldrh r0, [r2, #0xbe]
    mov r6, r4
    subs r0, r1, r0
    bmi .L_0217eac8
    cmp r0, r8
    movlt r8, r0
.L_0217ea88:
    ldr r0, [r7, #0x24]
    bl func_ov011_0217e9d8
    cmp r0, #0x0
    ldrne r0, [r7, #0x24]
    ldrne r2, [r0, #0x4]
    ldrne r1, [r2, #0x10]
    ldrneb r0, [r1, #0xc]
    cmpne r0, #0x0
    beq .L_0217eac8
    ldrsh r1, [r1, #0xb0]
    ldrh r0, [r2, #0xbe]
    mov r6, r11
    subs r0, r1, r0
    bmi .L_0217eac8
    cmp r0, r8
    movlt r8, r0
.L_0217eac8:
    add r9, r9, #0x1
    cmp r9, #0x4
    add r7, r7, #0x10c
    blt .L_0217ea38
    ldr r0, [r10, #0x14]
    cmp r6, #0x0
    ldr r4, [r0, #0x0]
    beq .L_0217eb6c
    mov r0, r10
    bl func_ov011_021733dc
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, #0x2
    str r0, [r4, #0xe4]
    mov r0, #0x0
    str r0, [r4, #0xe8]
    ldr r0, [r10, #0x2c]
    mov r1, #0x23
    bl func_ov011_02179130
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [r10, #0x20]
    ldrsb r0, [r1, #0x18]
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r8, #0xa
    bge .L_0217eb4c
    add r0, r1, #0x100
    ldrsb r0, [r0, #0xe7]
    cmp r0, #0x0
    ldreq r0, [r4, #0xe4]
    orreq r0, r0, #0x40
    streq r0, [r4, #0xe4]
.L_0217eb4c:
    ldr r0, [r10, #0x20]
    add r0, r0, #0x100
    ldrsb r0, [r0, #0xe7]
    cmp r0, #0x0
    ldrne r0, [r4, #0xe4]
    bicne r0, r0, #0x40
    strne r0, [r4, #0xe4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217eb6c:
    mov r0, #0x1
    strb r0, [r10, #0x105]
    mov r0, #0x0
    strb r0, [r10, #0x7c]
    strb r0, [r10, #0x7d]
    str r0, [r4, #0xe4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov011_0217ea00

    .global func_ov011_0217eb88
    arm_func_start func_ov011_0217eb88
func_ov011_0217eb88: ; 0x0217eb88
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x1c]
    bl func_ov011_02175628
    ldrsb r1, [r5, #0x7a]
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0x10]
    cmp r1, #0x0
    movlt r0, #0x1
    strltb r0, [r5, #0x7c]
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0xd4]
    add r1, r4, r1, lsl #0x2
    mov r0, r0, lsr #0x1c
    add r0, r4, r0, lsl #0x2
    ldr r1, [r1, #0x98]
    ldr r0, [r0, #0x98]
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    mov r6, #0x1
    sub r0, r1, r0
    movs r0, r0, asr #0x8
    rsbmi r0, r0, #0x0
    cmp r0, #0x50
    blt .L_0217ec08
    ldr r0, [r5, #0x24]
    bl func_ov011_0217ec64
    cmp r0, #0x0
    blt .L_0217ec08
    ldr r0, [r5, #0x24]
    bl func_ov011_0217ec64
    and r6, r0, #0xff
.L_0217ec08:
    ldrb r1, [r5, #0x7a]
    mov r0, r5
    mov r2, r6
    bl func_ov011_0217aa8c
    cmp r0, #0x0
    moveq r0, #0x1
    streqb r0, [r5, #0x7c]
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0x24]
    bl func_ov011_0217ec78
    ldrsb r1, [r5, #0x7a]
    add r1, r4, r1, lsl #0x2
    ldr r1, [r1, #0x98]
    bl func_ov011_02177010
    ldr r1, [r5, #0xd4]
    mov r0, #0x0
    orr r1, r1, #0x100
    str r1, [r5, #0xd4]
    strb r0, [r5, #0x7c]
    strb r0, [r5, #0x7d]
    mov r0, #0x2
    strb r0, [r5, #0x105]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_0217eb88

    .global func_ov011_0217ec64
    arm_func_start func_ov011_0217ec64
func_ov011_0217ec64: ; 0x0217ec64
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrnesb r0, [r0, #0xc5]
    mvneq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217ec64

    .global func_ov011_0217ec78
    arm_func_start func_ov011_0217ec78
func_ov011_0217ec78: ; 0x0217ec78
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x8]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217ec78

    .global func_ov011_0217ec8c
    arm_func_start func_ov011_0217ec8c
func_ov011_0217ec8c: ; 0x0217ec8c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r0, [r5, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldrsb r1, [r5, #0x38]
    ldr r2, [r0, #0x10]
    mov r0, #0x10c
    add r2, r2, #0xa8
    mla r6, r1, r0, r2
    ldr r0, [r6, #0x24]
    mov r7, #0x0
    ldr r1, [r0, #0x0]
    ldr r8, [r1, #0xc]
    bl func_ov011_0217e9ec
    cmp r0, #0x0
    movle r7, #0x1
    ble .L_0217ecec
    bl func_ov011_021733b4
    mov r1, r0
    mov r0, r8
    bl func_ov011_0217e9a0
    movs r4, r0
    moveq r7, #0x1
.L_0217ecec:
    cmp r7, #0x0
    beq .L_0217ed0c
    mov r0, #0x1
    strb r0, [r5, #0x105]
    mov r0, #0x0
    strb r0, [r5, #0x7c]
    strb r0, [r5, #0x7d]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217ed0c:
    ldrb r0, [r5, #0x7d]
    cmp r0, #0x0
    beq .L_0217ed24
    cmp r0, #0x1
    beq .L_0217ed40
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217ed24:
    ldr r0, [r5, #0x24]
    bl func_ov011_0217ec78
    bl func_ov011_02176d14
    ldrb r0, [r5, #0x7d]
    add r0, r0, #0x1
    strb r0, [r5, #0x7d]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217ed40:
    ldr r0, [r6, #0x24]
    add r1, r4, #0x9c
    ldr r0, [r0, #0x0]
    ldrb r4, [r4, #0xc]
    ldrsh r3, [r0, #0xbe]
    mov r2, #0x0
    b .L_0217ed7c
.L_0217ed5c:
    ldrsh r0, [r1, #0x16]
    sub r0, r0, r3
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    cmp r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    add r2, r2, #0x1
    add r1, r1, #0x20
.L_0217ed7c:
    cmp r2, r4
    blt .L_0217ed5c
    mov r0, #0x1
    strb r0, [r5, #0x105]
    mov r0, #0x0
    strb r0, [r5, #0x7c]
    strb r0, [r5, #0x7d]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    arm_func_end func_ov011_0217ec8c

    .global func_ov011_0217ed9c
    arm_func_start func_ov011_0217ed9c
func_ov011_0217ed9c: ; 0x0217ed9c
    ldrb r1, [r0, #0x7d]
    ldr r2, [r0, #0x14]
    cmp r1, #0x0
    ldr r3, [r2, #0x0]
    beq .L_0217edc4
    cmp r1, #0x1
    beq .L_0217ede0
    cmp r1, #0x2
    beq .L_0217edfc
    bx lr
.L_0217edc4:
    ldr r1, [r3, #0xe4]
    orr r1, r1, #0x2
    str r1, [r3, #0xe4]
    ldrb r1, [r0, #0x7d]
    add r1, r1, #0x1
    strb r1, [r0, #0x7d]
    bx lr
.L_0217ede0:
    ldr r1, [r3, #0xe4]
    orr r1, r1, #0x10
    str r1, [r3, #0xe4]
    ldrb r1, [r0, #0x7d]
    add r1, r1, #0x1
    strb r1, [r0, #0x7d]
    bx lr
.L_0217edfc:
    ldr r1, [r0, #0xd4]
    tst r1, #0x8
    ldrne r1, [r3, #0xe4]
    bicne r1, r1, #0x12
    strne r1, [r3, #0xe4]
    ldr r1, [r0, #0xd4]
    tst r1, #0x2
    bxeq lr
    ldr r2, [r3, #0xe4]
    mov r1, #0x0
    bic r2, r2, #0x12
    str r2, [r3, #0xe4]
    strb r1, [r0, #0x7c]
    strb r1, [r0, #0x7d]
    bx lr
    arm_func_end func_ov011_0217ed9c

    .global func_ov011_0217ee38
    arm_func_start func_ov011_0217ee38
func_ov011_0217ee38: ; 0x0217ee38
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r6, [r0, #0x10]
    ldr r0, [r6, #0xd4]
    tst r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, r6
    bl func_ov011_0217fe50
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r1, #0x0
    strb r1, [r6, #0x7f]
    ldrb r0, [r6, #0x108]
    cmp r0, #0x1
    bne .L_0217efd0
    ldr r0, [r6, #0xd4]
    tst r0, #0x100
    bne .L_0217efd0
    ldrb r0, [r6, #0x105]
    cmp r0, #0x9
    beq .L_0217eea4
    mov r0, r6
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    movne r1, #0x0
    bne .L_0217efd0
.L_0217eea4:
    mov r0, r6
    bl func_ov011_02173318
    cmp r0, #0x0
    movne r1, #0x0
    bne .L_0217efd0
    ldr r0, [r6, #0x20]
    ldr r0, [r0, #0x1a8]
    ldr r1, [r0, #0x10]
    ldr r10, [r1, #0x70]
    ldr r0, [r1, #0x5c]
    cmp r10, #0x0
    moveq r1, #0x0
    beq .L_0217efd0
    ldrsh r7, [r10, #0x0]
    ldr r5, [r0, #0xc]
    ldr r3, [r0, #0x10]
    ldrsh r4, [r10, #0x2]
    add r8, r5, r7, lsl #0x8
    ldr r2, [r6, #0x14]
    add r9, r3, r4, lsl #0x8
    mov r0, #0x0
    ldrsh r4, [r10, #0x4]
    ldrsh r11, [r10, #0x6]
    ldr r7, [r1, #0x34]
    ldr r5, [r2, #0x0]
    bl func_0208369c
    b .L_0217efc4
.L_0217ef10:
    ldr r2, [r0, #0x8]
    ldr r1, [r2, #0x2c]
    tst r1, #0x1
    bne .L_0217efc0
    ldr r2, [r2, #0x10]
    ldr r1, [r2, #0x3c]
    tst r7, r1
    bne .L_0217efc0
    ldr r10, [r2, #0x70]
    ldr r1, [r2, #0x5c]
    cmp r10, #0x0
    beq .L_0217efc0
    ldrsh lr, [r10, #0x4]
    ldrsh ip, [r10, #0x6]
    ldrsh r3, [r10, #0x0]
    ldr r2, [r1, #0xc]
    ldrsh r10, [r10, #0x2]
    add r2, r2, r3, lsl #0x8
    ldr r1, [r1, #0x10]
    subs r2, r8, r2
    add r3, lr, #0x18
    add r10, r1, r10, lsl #0x8
    mov r1, r3, lsl #0x8
    add ip, ip, #0x18
    rsbmi r2, r2, #0x0
    add r1, r1, r4, lsl #0x8
    mov r3, ip, lsl #0x8
    cmp r2, r1
    bgt .L_0217efc0
    subs r2, r9, r10
    rsbmi r2, r2, #0x0
    add r1, r3, r11, lsl #0x8
    cmp r2, r1
    bgt .L_0217efc0
    ldr r0, [r6, #0x24]
    bl func_ov011_0217ec78
    bl func_ov011_02176d14
    mov r0, r6
    bl func_ov011_0217aa58
    mov r0, #0x2
    str r0, [r5, #0xe8]
    mov r1, #0x1
    strb r1, [r6, #0x7f]
    b .L_0217efd0
.L_0217efc0:
    ldr r0, [r0, #0x0]
.L_0217efc4:
    cmp r0, #0x0
    bne .L_0217ef10
    mov r1, #0x0
.L_0217efd0:
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r6, #0x1c]
    bl func_ov011_02175628
    ldrb r1, [r6, #0x108]
    ldr r2, [r0, #0x4]
    ldr r0, [r6, #0xd4]
    cmp r1, #0x1
    mov r5, r0, lsr #0x1c
    ldr r7, [r2, #0x10]
    mov r4, #0x0
    bne .L_0217f228
    tst r0, #0x100
    bne .L_0217f228
    ldrb r0, [r6, #0x105]
    cmp r0, #0x9
    beq .L_0217f024
    mov r0, r6
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    bne .L_0217f228
.L_0217f024:
    mov r0, r6
    bl func_ov011_02173318
    cmp r0, #0x0
    ldreqb r0, [r6, #0x7c]
    cmpeq r0, #0x0
    bne .L_0217f228
    mov r8, #0x0
    strb r8, [r6, #0x7c]
    ldr r0, [r6, #0x2c]
    ldr r0, [r0, #0x34]
    tst r0, #0x2000
    bne .L_0217f08c
    add r9, r7, #0xa8
.L_0217f058:
    cmp r5, r8
    ldrne r0, [r9, #0x24]
    cmpne r0, #0x0
    beq .L_0217f07c
    bl func_ov011_0217e9c4
    orr r4, r4, r0
    ldr r0, [r9, #0x24]
    bl func_ov011_0217e9d8
    orr r4, r4, r0
.L_0217f07c:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x10c
    blt .L_0217f058
.L_0217f08c:
    mov r0, #0x1
    tst r4, r0, lsl r5
    beq .L_0217f0d0
    mov r0, r6
    bl func_ov011_0217e3b0
    cmp r0, #0x0
    beq .L_0217f0d0
    ldr r0, [r6, #0x24]
    bl func_ov011_0217ec78
    bl func_ov011_02176d14
    mov r0, r6
    bl func_ov011_0217aa58
    mov r0, #0x1
    strb r0, [r6, #0x7c]
    mov r0, #0x0
    strb r0, [r6, #0x7d]
    b .L_0217f228
.L_0217f0d0:
    ldrsb r2, [r6, #0x38]
    cmp r2, #0x0
    blt .L_0217f228
    add r1, r7, #0xa8
    mov r0, #0x10c
    mla r4, r2, r0, r1
    mov r0, r4
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    beq .L_0217f228
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0217f11c
    ldr r0, [r0, #0xa8]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    b .L_0217f120
.L_0217f11c:
    mov r0, #0x0
.L_0217f120:
    cmp r0, #0x0
    bne .L_0217f228
    mov r0, r6
    bl func_ov011_0217ab68
    cmp r0, #0x0
    bne .L_0217f228
    mov r0, r6
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    bne .L_0217f228
    ldrb r0, [r6, #0x7c]
    cmp r0, #0x4
    beq .L_0217f228
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0217f178
    ldr r0, [r0, #0xa8]
    tst r0, #0x8
    movne r0, #0x1
    moveq r0, #0x0
    b .L_0217f17c
.L_0217f178:
    mov r0, #0x0
.L_0217f17c:
    cmp r0, #0x0
    bne .L_0217f228
    ldr r0, [r6, #0xd4]
    tst r0, #0x1000
    bne .L_0217f228
    ldrb r1, [r6, #0x104]
    ldr r0, [r6, #0x2c]
    add r1, r1, #0x1
    and r1, r1, #0xff
    bl func_ov011_0217e3f4
    cmp r0, #0x0
    beq .L_0217f228
    ldrsb r3, [r6, #0x38]
    add r0, r7, r5, lsl #0x2
    ldr r0, [r0, #0x98]
    add r1, r7, r3, lsl #0x2
    ldr r1, [r1, #0x98]
    ldr r0, [r0, #0x0]
    ldr r1, [r1, #0x0]
    sub r0, r1, r0
    movs r1, r0, asr #0x8
    rsbmi r0, r1, #0x0
    movpl r0, r1
    cmp r0, #0xa0
    movgt r2, #0x2
    bgt .L_0217f210
    cmp r1, #0x0
    rsblt r0, r1, #0x0
    movge r0, r1
    cmp r0, #0x50
    ble .L_0217f20c
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    cmp r1, #0xa0
    movlt r2, #0x1
    blt .L_0217f210
.L_0217f20c:
    mov r2, #0x0
.L_0217f210:
    mov r0, r6
    and r1, r3, #0xff
    bl func_ov011_0217ab4c
    ldr r0, [r6, #0xd4]
    orr r0, r0, #0x1000
    str r0, [r6, #0xd4]
.L_0217f228:
    ldrb r2, [r6, #0x7c]
    ldr r1, .L_0217f240
    mov r0, r6
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217f240: .word data_ov011_02181a30
    arm_func_end func_ov011_0217ee38

    .global func_ov011_0217f244
    arm_func_start func_ov011_0217f244
func_ov011_0217f244: ; 0x0217f244
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    ldr r6, [r10, #0x4]
    mov r5, #0x0
    mov r4, #0x38
    b .L_0217f28c
.L_0217f260:
    mov r1, r6
    add r0, r10, #0x4
    bl func_02037c24
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_020517fc
    mov r1, r6
    add r0, r10, #0xc
    bl func_02037b98
    ldr r6, [r10, #0x4]
.L_0217f28c:
    cmp r6, #0x0
    bne .L_0217f260
    mov r4, #0x0
    b .L_0217f4dc
.L_0217f29c:
    bl func_0208369c
    mov r11, r0
    mvn r0, #0x0
    str r0, [sp, #0x4]
    b .L_0217f4cc
.L_0217f2b0:
    ldr r5, [r11, #0x8]
    cmp r5, #0x0
    beq .L_0217f4c8
    ldr r0, [r5, #0x2c]
    tst r0, #0x9
    bne .L_0217f4c8
    ldr r9, [r10, #0xc]
    add r0, r10, #0xc
    mov r1, r9
    bl func_02037c24
    add r0, r10, #0x4
    mov r1, r9
    bl func_02037b98
    ldr r0, .L_0217f5a0
    str r5, [r9, #0x8]
    ldrsb r0, [r0, r4]
    strb r0, [r9, #0x14]
    ldr r0, [r5, #0x30]
    ldrb r1, [r0, #0x22]
    strb r1, [r9, #0x15]
    ldrb r0, [r9, #0x14]
    bl func_ov011_0217f8a4
    ldrb r1, [r9, #0x14]
    mov r7, r0
    ldrb r0, [r9, #0x15]
    cmp r1, #0x2
    moveq r5, #0x8
    beq .L_0217f380
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    mov r5, #0x0
    b .L_0217f374
.L_0217f330:
    ldr r2, .L_0217f5a4
    mov r3, #0xa
    mla r3, r5, r3, r2
    mov r6, #0x0
    b .L_0217f358
.L_0217f344:
    cmp r0, r8
    beq .L_0217f380
    add r2, r6, #0x1
    mov r2, r2, lsl #0x18
    mov r6, r2, asr #0x18
.L_0217f358:
    ldrsb r8, [r3, r6]
    ldr r2, [sp, #0x4]
    cmp r8, r2
    bne .L_0217f344
    add r2, r5, #0x1
    mov r2, r2, lsl #0x18
    mov r5, r2, asr #0x18
.L_0217f374:
    cmp r5, #0x8
    blt .L_0217f330
    ldr r5, [sp, #0x4]
.L_0217f380:
    cmp r1, #0x3
    bne .L_0217f3b8
    ldr r0, [r9, #0x8]
    ldr r0, [r0, #0x30]
    ldrsh r0, [r0, #0x20]
    cmp r0, #0x3c
    sublt r0, r7, #0x3c
    movlt r0, r0, lsl #0x10
    movlt r7, r0, asr #0x10
    blt .L_0217f3b8
    cmp r0, #0xb4
    sublt r0, r7, #0x14
    movlt r0, r0, lsl #0x10
    movlt r7, r0, asr #0x10
.L_0217f3b8:
    ldr r0, [r9, #0x8]
    bl func_ov011_0217f5a8
    str r0, [sp, #0x0]
    add r6, r10, #0xa8
    mov r8, #0x0
.L_0217f3cc:
    add r0, r9, r8, lsl #0x1
    strh r7, [r0, #0xc]
    ldr r0, [r6, #0x20]
    cmp r0, #0x0
    beq .L_0217f4b8
    ldr r0, [r0, #0x1a8]
    bl func_ov011_0217f5a8
    ldr r1, [sp, #0x0]
    add r2, r9, r8, lsl #0x3
    ldr r3, [r1, #0x0]
    ldr r1, [r0, #0x0]
    sub r1, r3, r1
    str r1, [r2, #0x18]
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x0]
    ldr r0, [r0, #0x4]
    subs r1, r0, r1
    str r1, [r2, #0x1c]
    add r0, r9, r8, lsl #0x3
    ldr r0, [r0, #0x18]
    rsbmi r1, r1, #0x0
    cmp r0, #0x0
    rsblt r0, r0, #0x0
    add r2, r0, r1
    add r1, r9, r8, lsl #0x1
    cmp r2, #0x400
    movgt r2, #0x400
    ldrsh r0, [r1, #0xc]
    cmp r5, #0x0
    mul r0, r2, r0
    mov r0, r0, asr #0xa
    strh r0, [r1, #0xc]
    bne .L_0217f47c
    ldr r0, [r6, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrneh r0, [r0, #0xbc]
    moveq r0, #0x0
    rsb r0, r0, #0x100
    mov r0, r0, asr #0x1
    add r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    b .L_0217f4a4
.L_0217f47c:
    cmp r5, #0x1
    movne r2, #0x100
    bne .L_0217f4a4
    ldr r0, [r6, #0x24]
    ldrh r0, [r0, #0x34]
    rsb r0, r0, #0x100
    mov r0, r0, asr #0x1
    add r0, r0, #0x100
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
.L_0217f4a4:
    add r1, r9, r8, lsl #0x1
    ldrsh r0, [r1, #0xc]
    mul r0, r2, r0
    mov r0, r0, asr #0x8
    strh r0, [r1, #0xc]
.L_0217f4b8:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r6, r6, #0x10c
    blt .L_0217f3cc
.L_0217f4c8:
    ldr r11, [r11, #0x0]
.L_0217f4cc:
    cmp r11, #0x0
    bne .L_0217f2b0
    add r0, r4, #0x1
    and r4, r0, #0xff
.L_0217f4dc:
    ldr r0, .L_0217f5a0
    ldrsb r0, [r0, r4]
    cmp r0, #0x0
    bge .L_0217f29c
    ldr r4, [r10, #0x4]
    b .L_0217f590
.L_0217f4f4:
    ldr r0, [r4, #0x8]
    bl func_ov011_0217f5a8
    mov r6, r0
    ldr r7, [r10, #0x4]
    mov r5, #0x0
    b .L_0217f584
.L_0217f50c:
    cmp r4, r7
    beq .L_0217f580
    ldr r0, [r7, #0x8]
    bl func_ov011_0217f5a8
    ldr r2, [r0, #0x4]
    ldr r1, [r6, #0x4]
    subs r2, r2, r1
    ldr r1, [r0, #0x0]
    ldr r0, [r6, #0x0]
    rsbmi r2, r2, #0x0
    subs r0, r1, r0
    rsbmi r0, r0, #0x0
    add r0, r0, r2
    cmp r0, #0x8000
    bge .L_0217f580
    mov r1, r5
    rsb r2, r0, #0x8000
.L_0217f550:
    add r0, r4, r1, lsl #0x1
    ldrsh r3, [r0, #0xc]
    add r0, r7, r1, lsl #0x1
    add r1, r1, #0x1
    mul r8, r2, r3
    mov r3, r8, asr #0xe
    ldrsh r9, [r0, #0xc]
    add r3, r8, r3, lsr #0x11
    cmp r1, #0x4
    add r3, r9, r3, asr #0xf
    strh r3, [r0, #0xc]
    blt .L_0217f550
.L_0217f580:
    ldr r7, [r7, #0x0]
.L_0217f584:
    cmp r7, #0x0
    bne .L_0217f50c
    ldr r4, [r4, #0x0]
.L_0217f590:
    cmp r4, #0x0
    bne .L_0217f4f4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0217f5a0: .word data_ov011_021814d8
.L_0217f5a4: .word data_ov011_021814f0
    arm_func_end func_ov011_0217f244

    .global func_ov011_0217f5a8
    arm_func_start func_ov011_0217f5a8
func_ov011_0217f5a8: ; 0x0217f5a8
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x5c]
    add r0, r0, #0xc
    bx lr
    arm_func_end func_ov011_0217f5a8

    .global func_ov011_0217f5b8
    arm_func_start func_ov011_0217f5b8
func_ov011_0217f5b8: ; 0x0217f5b8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldrb r0, [r4, #0x96]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r4, #0x96]
    ldrb r0, [r4, #0x105]
    cmp r0, #0x2
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0x24]
    mov r1, #0x1
    bl func_ov011_0217f784
    tst r0, #0x700
    beq .L_0217f6f4
    ldr r0, [r4, #0x2c]
    mov r1, #0x6
    bl func_ov011_0217f79c
    cmp r0, #0x0
    ldreqb r0, [r4, #0x96]
    cmpeq r0, #0x0
    bne .L_0217f6f4
    mov r0, #0x1e
    strb r0, [r4, #0x96]
    ldr r0, [r4, #0x2c]
    bl func_ov011_02179278
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0x1c]
    bl func_ov011_02175628
    ldr r3, [r0, #0x4]
    ldr r5, [r4, #0xd4]
    mov r1, #0x0
    ldr r3, [r3, #0x10]
    mov r0, r5, lsr #0x1c
    mov r2, r1
    add r8, r3, r0, lsl #0x2
    and ip, r5, #0x80
    b .L_0217f6c0
.L_0217f650:
    cmp r2, r0
    addne r5, r3, r2, lsl #0x2
    ldrne r5, [r5, #0x98]
    cmpne r5, #0x0
    beq .L_0217f6bc
    ldr lr, [r8, #0x98]
    ldr r7, [r5, #0x0]
    ldmia lr, {r6, lr}
    ldr r5, [r5, #0x4]
    cmp ip, #0x0
    sub r6, r7, r6
    sub r5, r5, lr
    beq .L_0217f690
    cmp r6, #0x0
    bgt .L_0217f6bc
    b .L_0217f698
.L_0217f690:
    cmp r5, #0x0
    blt .L_0217f6bc
.L_0217f698:
    cmp r6, #0x0
    rsblt r6, r6, #0x0
    cmp r6, #0xa000
    bge .L_0217f6bc
    cmp r5, #0x0
    rsblt r5, r5, #0x0
    cmp r5, #0x4000
    movlt r1, #0x1
    blt .L_0217f6c8
.L_0217f6bc:
    add r2, r2, #0x1
.L_0217f6c0:
    cmp r2, #0x4
    blt .L_0217f650
.L_0217f6c8:
    cmp r1, #0x0
    beq .L_0217f6f4
    mov r0, r4
    mov r1, #0x8
    bl func_ov011_0217ab84
    mov r0, r4
    bl func_ov011_0217f890
    ldr r0, [r4, #0x24]
    bl func_ov011_0217f7c0
    bl func_ov011_02176d14
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217f6f4:
    ldr r0, [r4, #0x24]
    mov r1, #0x0
    bl func_ov011_0217f784
    tst r0, #0x300
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0x2c]
    mov r1, #0x0
    bl func_ov011_0217f79c
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r0, [r4, #0x104]
    ldr r1, [r4, #0x2c]
    add r0, r0, #0x1
    and r2, r0, #0xff
    cmp r2, #0x8
    movhs r0, #0x1
    bhs .L_0217f754
    ldr r0, .L_0217f780
    ldr r1, [r1, #0x38]
    ldr r0, [r0, r2, lsl #0x2]
    and r1, r1, #0xff
    cmp r1, r0
    movls r0, #0x1
    movhi r0, #0x0
.L_0217f754:
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_ov011_0217ab84
    mov r0, r4
    bl func_ov011_0217f890
    ldr r0, [r4, #0x24]
    bl func_ov011_0217f7c0
    bl func_ov011_02176d14
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217f780: .word data_ov011_0218190c
    arm_func_end func_ov011_0217f5b8

    .global func_ov011_0217f784
    arm_func_start func_ov011_0217f784
func_ov011_0217f784: ; 0x0217f784
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    addne r0, r0, r1, lsl #0x2
    ldrne r0, [r0, #0x7c]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217f784

    .global func_ov011_0217f79c
    arm_func_start func_ov011_0217f79c
func_ov011_0217f79c: ; 0x0217f79c
    mov r2, r1, asr #0x5
    add r2, r0, r2, lsl #0x2
    bic r0, r1, #0x1f
    sub r1, r1, r0
    ldr r2, [r2, #0x34]
    mov r0, #0x1
    tst r2, r0, lsl r1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217f79c

    .global func_ov011_0217f7c0
    arm_func_start func_ov011_0217f7c0
func_ov011_0217f7c0: ; 0x0217f7c0
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x8]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217f7c0

    .global func_ov011_0217f7d4
    arm_func_start func_ov011_0217f7d4
func_ov011_0217f7d4: ; 0x0217f7d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_0217f86c
    ldr r0, [r0, #0x2c]
    tst r0, #0x8
    beq .L_0217f818
    ldr r0, [r4, #0x24]
    bl func_ov011_0217f7c0
    bl func_ov011_02176d14
    mov r0, r4
    bl func_ov011_0217f890
    mov r0, #0x1
    strb r0, [r4, #0x105]
    b .L_0217f86c
.L_0217f818:
    ldr r0, [r4, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    ldr r2, [r0, #0x4]
    b .L_0217f848
.L_0217f830:
    ldr r1, [r4, #0x88]
    ldr r0, [r2, #0x8]
    cmp r1, r0
    moveq r0, #0x0
    beq .L_0217f86c
    ldr r2, [r2, #0x0]
.L_0217f848:
    cmp r2, #0x0
    bne .L_0217f830
    ldr r0, [r4, #0x24]
    bl func_ov011_0217f7c0
    bl func_ov011_02176d14
    mov r0, r4
    bl func_ov011_0217f890
    mov r0, #0x1
    strb r0, [r4, #0x105]
.L_0217f86c:
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrb r2, [r4, #0x94]
    ldr r1, .L_0217f88c
    mov r0, r4
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldmia sp!, {r4, pc}
.L_0217f88c: .word data_ov011_021814e4
    arm_func_end func_ov011_0217f7d4

    .global func_ov011_0217f890
    arm_func_start func_ov011_0217f890
func_ov011_0217f890: ; 0x0217f890
    mov r1, #0x0
    str r1, [r0, #0x88]
    strb r1, [r0, #0x95]
    strb r1, [r0, #0x94]
    bx lr
    arm_func_end func_ov011_0217f890

    .global func_ov011_0217f8a4
    arm_func_start func_ov011_0217f8a4
func_ov011_0217f8a4: ; 0x0217f8a4
    cmp r0, #0x2
    ldreq r0, .L_0217f8f8
    moveq r1, r1, lsl #0x1
    ldreqsh r0, [r0, r1]
    bxeq lr
    mov ip, #0x0
    ldr r2, .L_0217f8fc
    mvn r0, #0x0
    b .L_0217f8e0
.L_0217f8c8:
    cmp r1, r3
    ldreq r0, .L_0217f900
    moveq r1, ip, lsl #0x2
    ldreqsh r0, [r0, r1]
    bxeq lr
    add ip, ip, #0x1
.L_0217f8e0:
    mov r3, ip, lsl #0x2
    ldrsh r3, [r2, r3]
    cmp r3, r0
    bne .L_0217f8c8
    mvn r0, #0x0
    bx lr
.L_0217f8f8: .word data_ov011_021814dc
.L_0217f8fc: .word data_ov011_02181540
.L_0217f900: .word data_ov011_02181542
    arm_func_end func_ov011_0217f8a4

    .global func_ov011_0217f904
    arm_func_start func_ov011_0217f904
func_ov011_0217f904: ; 0x0217f904
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    bl func_ov011_02175628
    ldr r1, [r0, #0x4]
    mov r3, #0x0
    ldr r2, [r1, #0x10]
    ldr r0, [r4, #0xd4]
    mov ip, r3
    mov r1, r0, lsr #0x1c
    ldr r2, [r2, #0x4]
    b .L_0217f94c
.L_0217f934:
    add r0, r2, r1, lsl #0x1
    ldrsh r0, [r0, #0xc]
    cmp r0, ip
    movgt r3, r2
    ldr r2, [r2, #0x0]
    movgt ip, r0
.L_0217f94c:
    cmp r2, #0x0
    bne .L_0217f934
    cmp r3, #0x0
    bne .L_0217f970
    mov r0, r4
    bl func_ov011_0217f890
    mov r0, #0x1
    strb r0, [r4, #0x105]
    ldmia sp!, {r4, pc}
.L_0217f970:
    ldr r1, [r3, #0x8]
    mov r0, #0x1
    str r1, [r4, #0x88]
    strb r0, [r4, #0x94]
    mov r0, #0x0
    strb r0, [r4, #0x95]
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    ldreq r0, .L_0217f9a4
    ldreq r1, [r0, #0x0]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x0]
    ldmia sp!, {r4, pc}
.L_0217f9a4: .word data_ov011_02181a48
    arm_func_end func_ov011_0217f904

    .global func_ov011_0217f9a8
    arm_func_start func_ov011_0217f9a8
func_ov011_0217f9a8: ; 0x0217f9a8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_ov011_0217f904
    ldrb r0, [r5, #0x94]
    cmp r0, #0x1
    bne .L_0217fb98
    ldr r0, [r5, #0x24]
    bl func_ov011_0217f7c0
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0217f9e8
    ldr r0, [r0, #0x180]
    tst r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
.L_0217f9e8:
    cmp r0, #0x0
    beq .L_0217fa58
    ldr r0, [r5, #0x24]
    bl func_ov011_0217f7c0
    cmp r0, #0x0
    ldrne r1, [r0, #0x180]
    bicne r1, r1, #0x4
    strne r1, [r0, #0x180]
    ldr r0, [r5, #0x24]
    bl func_ov011_0217f7c0
    add r1, r5, #0x8c
    bl func_ov011_02177010
    ldr r0, [r5, #0xd4]
    tst r0, #0x2
    beq .L_0217fb98
    ldr r0, [r5, #0x24]
    mov r1, #0x0
    bl func_ov011_0217f784
    cmp r0, #0x0
    bne .L_0217fb98
    ldr r0, [r5, #0x24]
    mov r1, #0x1
    bl func_ov011_0217f784
    cmp r0, #0x0
    bne .L_0217fb98
    mov r0, r5
    bl func_ov011_0217f890
    b .L_0217fb98
.L_0217fa58:
    ldr r0, [r5, #0x88]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x78]
    tst r0, #0x2
    beq .L_0217fb98
    tst r0, #0x400000
    bne .L_0217fb98
    ldr r0, [r5, #0x1c]
    bl func_ov011_02175628
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    ldr r3, [r0, #0x10]
    ldr r4, [r3, #0x4]
    b .L_0217faa8
.L_0217fa90:
    ldr r1, [r5, #0x88]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    moveq r2, r1
    beq .L_0217fab0
    ldr r4, [r4, #0x0]
.L_0217faa8:
    cmp r4, #0x0
    bne .L_0217fa90
.L_0217fab0:
    cmp r2, #0x0
    bne .L_0217facc
    mov r0, r5
    bl func_ov011_0217f890
    mov r0, #0x1
    strb r0, [r5, #0x105]
    b .L_0217fb98
.L_0217facc:
    ldr r1, [r5, #0xd4]
    ldr r0, [r5, #0x88]
    mov r1, r1, lsr #0x1c
    add r1, r3, r1, lsl #0x2
    ldr r6, [r1, #0x98]
    bl func_ov011_0217f5a8
    ldrb r1, [r4, #0x14]
    mov r4, r0
    cmp r1, #0x1
    ldreq r0, [r4, #0x0]
    streq r0, [sp, #0x0]
    ldreq r0, [r4, #0x4]
    streq r0, [sp, #0x4]
    beq .L_0217fb58
    ldr r1, [r4, #0x0]
    ldr r0, [r6, #0x0]
    sub r0, r0, r1
    cmp r0, #0x0
    mov r0, #0x3000
    rsble r0, r0, #0x0
    add r0, r1, r0
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x4]
    str r0, [sp, #0x4]
    ldmia r4, {r0, r1}
    bl func_020837b0
    mov r6, r0
    ldr r0, [sp, #0x0]
    ldr r1, [sp, #0x4]
    bl func_020837b0
    cmp r6, r0
    ldrne r0, [r4, #0x0]
    strne r0, [sp, #0x0]
    ldrne r0, [r4, #0x4]
    strne r0, [sp, #0x4]
.L_0217fb58:
    ldr r0, [r4, #0x0]
    str r0, [r5, #0x8c]
    ldr r0, [r4, #0x4]
    str r0, [r5, #0x90]
    ldr r0, [r5, #0x24]
    bl func_ov011_0217f7c0
    add r1, sp, #0x0
    mvn r2, #0x0
    bl func_ov011_02176d64
    cmp r0, #0x0
    beq .L_0217fb98
    ldr r0, [r5, #0x24]
    bl func_ov011_0217f7c0
    mov r1, r4
    mvn r2, #0x0
    bl func_ov011_02176d64
.L_0217fb98:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_0217f9a8

    .global func_ov011_0217fba0
    arm_func_start func_ov011_0217fba0
func_ov011_0217fba0: ; 0x0217fba0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r2, [r4, #0x95]
    add r1, r2, #0x1
    strb r1, [r4, #0x95]
    cmp r2, #0x78
    ldmloia sp!, {r4, pc}
    bl func_ov011_0217f890
    mov r0, #0x1
    strb r0, [r4, #0x105]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217fba0

    .global func_ov011_0217fbcc
    arm_func_start func_ov011_0217fbcc
func_ov011_0217fbcc: ; 0x0217fbcc
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r2, [r8, #0x14]
    ldr r0, [r8, #0xd4]
    ldr r3, [r8, #0x20]
    mov r7, r1
    tst r0, #0x2
    orrne r0, r0, #0x10
    ldr r1, [r3, #0x1a8]
    ldr r6, [r2, #0x0]
    biceq r0, r0, #0x10
    str r0, [r8, #0xd4]
    ldr r0, [r1, #0x10]
    ldr r0, [r0, #0x78]
    tst r0, #0x2
    ldr r0, [r8, #0xd4]
    beq .L_0217fc48
    bic r0, r0, #0xc
    str r0, [r8, #0xd4]
    tst r0, #0x2
    bne .L_0217fc38
    ldr r0, [r6, #0xe4]
    bic r0, r0, #0x2
    str r0, [r6, #0xe4]
    ldr r0, [r8, #0xd4]
    orr r0, r0, #0x4
    str r0, [r8, #0xd4]
.L_0217fc38:
    ldr r0, [r8, #0xd4]
    orr r0, r0, #0x2
    str r0, [r8, #0xd4]
    b .L_0217fce8
.L_0217fc48:
    bic r0, r0, #0x2
    str r0, [r8, #0xd4]
    ldrb r0, [r8, #0xc5]
    ldr r1, [r1, #0x10]
    tst r0, #0x1
    ldr r4, [r1, #0x5c]
    bne .L_0217fce8
    ldr r1, [r8, #0xb4]
    ldr r0, [r4, #0x10]
    subs r5, r1, r0
    bmi .L_0217fce8
    mov r0, r8
    bl func_ov011_0217e424
    cmp r0, #0x0
    beq .L_0217fca8
    ldr r0, [r8, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x8]
    moveq r0, #0x0
    add r0, r0, #0x100
    ldrsb r0, [r0, #0x8b]
    cmp r0, #0x3
    beq .L_0217fcb4
.L_0217fca8:
    ldr r0, [r6, #0xe4]
    bic r0, r0, #0x2
    str r0, [r6, #0xe4]
.L_0217fcb4:
    ldrsh r0, [r4, #0x26]
    cmp r5, r0, lsl #0x2
    bge .L_0217fce8
    ldr r0, [r8, #0xd4]
    orr r0, r0, #0x8
    str r0, [r8, #0xd4]
    ldrb r1, [r8, #0x104]
    ldr r0, [r8, #0x2c]
    bl func_ov011_0217fe00
    cmp r0, #0x0
    ldrne r0, [r6, #0xe4]
    orrne r0, r0, #0x2
    strne r0, [r6, #0xe4]
.L_0217fce8:
    cmp r7, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r0, [r8, #0x108]
    cmp r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r2, [r8, #0xa0]
    cmp r2, #0x0
    beq .L_0217fd24
    ldr r1, .L_0217fdfc
    mov r0, r8
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    b .L_0217fde8
.L_0217fd24:
    mov r0, r8
    bl func_ov011_02173318
    cmp r0, #0x0
    beq .L_0217fd64
    ldr r0, [r8, #0x20]
    add r0, r0, #0x100
    ldrh r1, [r0, #0x0]
    sub r1, r1, #0x5
    cmp r1, #0x1
    bhi .L_0217fd64
    ldrsh r0, [r0, #0x10]
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r8, #0xa0]
    movne r0, #0x0
    strneb r0, [r8, #0xa1]
.L_0217fd64:
    ldr r0, [r8, #0x20]
    ldrsb r0, [r0, #0x18]
    cmp r0, #0x10
    moveq r0, #0x3
    streqb r0, [r8, #0xa0]
    moveq r0, #0x0
    streqb r0, [r8, #0xa1]
    ldr r0, [r8, #0xd4]
    tst r0, #0x5000000
    beq .L_0217fde8
    ldrb r0, [r8, #0xa2]
    cmp r0, #0x0
    bne .L_0217fde0
    ldrb r1, [r8, #0x104]
    ldr r0, [r8, #0x2c]
    add r1, r1, #0x1
    and r1, r1, #0xff
    bl func_ov011_0217fe00
    cmp r0, #0x0
    moveq r0, #0x5a
    streqb r0, [r8, #0xa2]
    beq .L_0217fde8
    mov r1, #0x4
    mov r0, #0x0
    strb r1, [r8, #0xa0]
    strb r0, [r8, #0xa2]
    strb r0, [r8, #0xa1]
    ldrb r0, [r8, #0xa3]
    bic r0, r0, #0x1
    strb r0, [r8, #0xa3]
    b .L_0217fde8
.L_0217fde0:
    subne r0, r0, #0x1
    strneb r0, [r8, #0xa2]
.L_0217fde8:
    ldrb r0, [r8, #0xa0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0217fdfc: .word data_ov011_021815e0
    arm_func_end func_ov011_0217fbcc

    .global func_ov011_0217fe00
    arm_func_start func_ov011_0217fe00
func_ov011_0217fe00: ; 0x0217fe00
    cmp r1, #0x8
    movhs r0, #0x1
    bxhs lr
    ldr r2, .L_0217fe2c
    ldr r3, [r0, #0x38]
    ldr r0, [r2, r1, lsl #0x2]
    and r1, r3, #0xff
    cmp r1, r0
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_0217fe2c: .word data_ov011_0218190c
    arm_func_end func_ov011_0217fe00

    .global func_ov011_0217fe30
    arm_func_start func_ov011_0217fe30
func_ov011_0217fe30: ; 0x0217fe30
    ldrb r1, [r0, #0xa0]
    add r1, r1, #0xff
    and r1, r1, #0xff
    cmp r1, #0x1
    movhi r1, #0x0
    strhib r1, [r0, #0xa0]
    strhib r1, [r0, #0xa1]
    bx lr
    arm_func_end func_ov011_0217fe30

    .global func_ov011_0217fe50
    arm_func_start func_ov011_0217fe50
func_ov011_0217fe50: ; 0x0217fe50
    ldrb r0, [r0, #0xa0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_0217fe50

    .global func_ov011_0217fe64
    arm_func_start func_ov011_0217fe64
func_ov011_0217fe64: ; 0x0217fe64
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r3, [r5, #0x20]
    ldr r1, [r5, #0x14]
    add r0, r3, #0x100
    ldrsb r0, [r0, #0x15]
    ldr r4, [r1, #0x0]
    cmp r0, #0x0
    movlt r0, #0x0
    strltb r0, [r5, #0xa0]
    strltb r0, [r5, #0xa1]
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r2, [r5, #0xd4]
    tst r2, #0x2
    ldrneb r0, [r5, #0xa1]
    cmpne r0, #0x2
    movne r0, #0x2
    strneb r0, [r5, #0xa0]
    movne r0, #0x0
    strneb r0, [r5, #0xa1]
    ldmneia sp!, {r3, r4, r5, pc}
    ldrb r1, [r5, #0xa1]
    cmp r1, #0x0
    beq .L_0217fed8
    cmp r1, #0x1
    beq .L_0217ff20
    cmp r1, #0x2
    beq .L_0217ff78
    ldmia sp!, {r3, r4, r5, pc}
.L_0217fed8:
    tst r2, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    str r0, [r5, #0x9c]
    ldrb r0, [r5, #0xa1]
    mov r1, #0x24
    add r0, r0, #0x1
    strb r0, [r5, #0xa1]
    ldr r0, [r5, #0x2c]
    bl func_ov011_02179130
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x20
    str r1, [r5, #0x9c]
    ldr r0, [r4, #0xe4]
    orr r0, r0, #0x20
    str r0, [r4, #0xe4]
    ldmia sp!, {r3, r4, r5, pc}
.L_0217ff20:
    ldrb r0, [r3, #0x11d]
    tst r0, #0x4
    addne r0, r1, #0x1
    strneb r0, [r5, #0xa1]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, [r4, #0xe4]
    ldr r1, [r5, #0x9c]
    mov r0, r5
    orr r1, r2, r1
    str r1, [r4, #0xe4]
    bl func_ov011_02173318
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x9c]
    ldr r1, [r4, #0xe4]
    mvn r0, r0
    and r0, r1, r0
    str r0, [r4, #0xe4]
    mov r0, #0x0
    strb r0, [r5, #0xa0]
    strb r0, [r5, #0xa1]
    ldmia sp!, {r3, r4, r5, pc}
.L_0217ff78:
    mov r0, r5
    bl func_ov011_02173318
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x9c]
    ldr r1, [r4, #0xe4]
    mvn r0, r0
    and r0, r1, r0
    str r0, [r4, #0xe4]
    mov r0, #0x0
    strb r0, [r5, #0xa0]
    strb r0, [r5, #0xa1]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_0217fe64

    .global func_ov011_0217ffac
    arm_func_start func_ov011_0217ffac
func_ov011_0217ffac: ; 0x0217ffac
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r1, [r4, #0xa1]
    ldr r0, [r4, #0x14]
    ldr r0, [r0, #0x0]
    cmp r1, #0xe
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r4, pc}
.L_0217ffcc: ; jump table
    b .L_02180008 ; case 0
    b .L_02180008 ; case 1
    b .L_02180008 ; case 2
    b .L_02180008 ; case 3
    b .L_02180014 ; case 4
    b .L_0218008c ; case 5
    b .L_021800c0 ; case 6
    b .L_021800d8 ; case 7
    b .L_021800d8 ; case 8
    b .L_021800d8 ; case 9
    b .L_021800d8 ; case 10
    b .L_021800d8 ; case 11
    b .L_021800d8 ; case 12
    b .L_021800e4 ; case 13
    b .L_02180100 ; case 14
.L_02180008:
    add r0, r1, #0x1
    strb r0, [r4, #0xa1]
    ldmia sp!, {r4, pc}
.L_02180014:
    mov r2, #0x0
    mov r3, r2
    ldr r1, [r4, #0xd4]
    b .L_0218004c
.L_02180024:
    cmp r3, r1, lsr #0x1c
    beq .L_02180048
    add r0, r4, r3, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x0
    blt .L_02180048
    cmp r0, #0x9000
    movlt r2, #0x1
    blt .L_02180054
.L_02180048:
    add r3, r3, #0x1
.L_0218004c:
    cmp r3, #0x4
    blt .L_02180024
.L_02180054:
    cmp r2, #0x0
    beq .L_02180080
    ldrb r1, [r4, #0x104]
    ldr r0, [r4, #0x2c]
    bl func_ov011_0217fe00
    cmp r0, #0x0
    movne r0, #0x5
    strneb r0, [r4, #0xa1]
    moveq r0, #0x6
    streqb r0, [r4, #0xa1]
    ldmia sp!, {r4, pc}
.L_02180080:
    mov r0, #0x6
    strb r0, [r4, #0xa1]
    ldmia sp!, {r4, pc}
.L_0218008c:
    ldr r1, [r4, #0x20]
    ldr r2, [r0, #0xe4]
    ldr r1, [r1, #0x1a8]
    ldr r1, [r1, #0x10]
    ldr r1, [r1, #0x40]
    tst r1, #0x4
    movne r3, #0x8
    moveq r3, #0x4
    orr r2, r2, r3
    mov r1, #0x7
    str r2, [r0, #0xe4]
    strb r1, [r4, #0xa1]
    ldmia sp!, {r4, pc}
.L_021800c0:
    ldr r2, [r0, #0xe4]
    mov r1, #0x7
    orr r2, r2, #0x1
    str r2, [r0, #0xe4]
    strb r1, [r4, #0xa1]
    ldmia sp!, {r4, pc}
.L_021800d8:
    add r0, r1, #0x1
    strb r0, [r4, #0xa1]
    ldmia sp!, {r4, pc}
.L_021800e4:
    ldr r1, [r0, #0xe4]
    bic r1, r1, #0xd
    str r1, [r0, #0xe4]
    ldrb r0, [r4, #0xa1]
    add r0, r0, #0x1
    strb r0, [r4, #0xa1]
    ldmia sp!, {r4, pc}
.L_02180100:
    ldr r0, [r4, #0x20]
    ldrsb r0, [r0, #0x18]
    cmp r0, #0x10
    movne r0, #0x0
    strneb r0, [r4, #0xa0]
    strneb r0, [r4, #0xa1]
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_0217ffac

    .global func_ov011_0218011c
    arm_func_start func_ov011_0218011c
func_ov011_0218011c: ; 0x0218011c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, [r6, #0x20]
    ldr r2, [r6, #0x14]
    ldrb r0, [r0, #0x11d]
    ldr r1, [r6, #0xd4]
    ldr r4, [r2, #0x0]
    tst r0, #0x4
    ldrneb r0, [r6, #0xa1]
    mov r5, r1, lsr #0x1c
    cmpne r0, #0x3
    movne r0, #0x3
    strneb r0, [r6, #0xa1]
    mov r0, r6
    bl func_ov011_02173318
    cmp r0, #0x0
    bne .L_0218017c
    ldr r1, [r4, #0xe4]
    mov r0, #0x0
    bic r1, r1, #0xc
    str r1, [r4, #0xe4]
    strb r0, [r6, #0xa0]
    strb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0218017c:
    ldrb r0, [r6, #0xa1]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0218018c: ; jump table
    b .L_0218019c ; case 0
    b .L_021801f4 ; case 1
    b .L_0218033c ; case 2
    b .L_02180378 ; case 3
.L_0218019c:
    ldr r0, [r6, #0x20]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0x10]
    cmp r0, #0x8
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x0
    str r0, [r6, #0x9c]
    ldr r0, [r6, #0x2c]
    ldr r1, [r0, #0x34]
    tst r1, #0x4000
    movne r0, #0x2
    strneb r0, [r6, #0xa1]
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, #0x25
    bl func_ov011_02179130
    cmp r0, #0x0
    ldrneb r0, [r6, #0xa1]
    addne r0, r0, #0x1
    strneb r0, [r6, #0xa1]
    moveq r0, #0x2
    streqb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021801f4:
    ldr r0, [r6, #0x20]
    ldr r0, [r0, #0x1a8]
    ldr r0, [r0, #0x10]
    ldr r1, [r0, #0x88]
    ldr r0, [r0, #0x8c]
    mov r1, r1, asr #0x8
    mov r0, r0, asr #0x8
    cmp r1, #0x80
    cmplt r0, #0x80
    bge .L_02180234
    mov r0, #0x0
    str r0, [r6, #0x9c]
    ldrb r0, [r6, #0xa1]
    add r0, r0, #0x1
    strb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02180234:
    cmp r1, #0x80
    bge .L_02180254
    mov r0, #0x4
    str r0, [r6, #0x9c]
    ldrb r0, [r6, #0xa1]
    add r0, r0, #0x1
    strb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02180254:
    cmp r0, #0x80
    bge .L_02180274
    mov r0, #0x8
    str r0, [r6, #0x9c]
    ldrb r0, [r6, #0xa1]
    add r0, r0, #0x1
    strb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02180274:
    mov r2, #0x9000
    mvn r4, #0x0
    mov r3, #0x0
.L_02180280:
    cmp r3, r5
    beq .L_021802a8
    add r0, r6, r3, lsl #0x2
    ldr r1, [r0, #0xdc]
    cmp r1, #0x0
    blt .L_021802a8
    cmp r1, r2
    movlt r0, r3, lsl #0x18
    movlt r2, r1
    movlt r4, r0, asr #0x18
.L_021802a8:
    add r3, r3, #0x1
    cmp r3, #0x4
    blt .L_02180280
    cmp r4, #0x0
    blt .L_0218032c
    ldr r0, [r6, #0x1c]
    ldr r0, [r0, #0x4]
    ldr r7, [r0, #0x44]
    cmp r7, #0x0
    moveq r0, #0x0
    beq .L_021802f4
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    bne .L_021802f0
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_021802f0:
    ldr r0, [r7, #0x18]
.L_021802f4:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x10]
    add r1, r0, r4, lsl #0x2
    add r0, r0, r5, lsl #0x2
    ldr r1, [r1, #0x98]
    ldr r0, [r0, #0x98]
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    sub r0, r1, r0
    cmp r0, #0x0
    movgt r0, #0x8
    strgt r0, [r6, #0x9c]
    movle r0, #0x4
    strle r0, [r6, #0x9c]
.L_0218032c:
    ldrb r0, [r6, #0xa1]
    add r0, r0, #0x1
    strb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0218033c:
    ldr r2, [r4, #0xe4]
    ldr r1, [r6, #0x9c]
    mov r0, r6
    orr r1, r2, r1
    str r1, [r4, #0xe4]
    bl func_ov011_02173318
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r4, #0xe4]
    mov r0, #0x0
    bic r1, r1, #0xc
    str r1, [r4, #0xe4]
    strb r0, [r6, #0xa0]
    strb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02180378:
    mov r0, r6
    bl func_ov011_02173318
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r4, #0xe4]
    mov r0, #0x0
    bic r1, r1, #0xc
    str r1, [r4, #0xe4]
    strb r0, [r6, #0xa0]
    strb r0, [r6, #0xa1]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    arm_func_end func_ov011_0218011c

    .global func_ov011_021803a4
    arm_func_start func_ov011_021803a4
func_ov011_021803a4: ; 0x021803a4
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r2, [r6, #0x20]
    ldr r1, [r6, #0x14]
    ldr r0, [r2, #0x1a8]
    ldr r5, [r1, #0x0]
    ldr r1, [r0, #0x10]
    ldr r0, [r1, #0x78]
    tst r0, #0x400000
    beq .L_021803e8
    ldr r1, [r5, #0xe4]
    mov r0, #0x0
    bic r1, r1, #0x1c
    str r1, [r5, #0xe4]
    strb r0, [r6, #0xa0]
    strb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
.L_021803e8:
    ldrsb r0, [r2, #0x18]
    cmp r0, #0x10
    bne .L_02180414
    ldr r1, [r5, #0xe4]
    mov r0, #0x3
    bic r1, r1, #0x1c
    str r1, [r5, #0xe4]
    strb r0, [r6, #0xa0]
    mov r0, #0x0
    strb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
.L_02180414:
    ldr r0, [r6, #0xd4]
    ldr r4, [r1, #0x5c]
    tst r0, #0xf000000
    bne .L_02180440
    ldr r1, [r5, #0xe4]
    mov r0, #0x0
    bic r1, r1, #0x1c
    str r1, [r5, #0xe4]
    strb r0, [r6, #0xa0]
    strb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
.L_02180440:
    ldrb r0, [r6, #0xa3]
    tst r0, #0x1
    ldrne r0, [r5, #0xe4]
    orrne r0, r0, #0x4
    strne r0, [r5, #0xe4]
    ldrb r0, [r6, #0xa3]
    tst r0, #0x1
    ldrne r0, [r5, #0xe4]
    orrne r0, r0, #0x8
    strne r0, [r5, #0xe4]
    ldrb r0, [r6, #0xa1]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_02180478: ; jump table
    b .L_02180494 ; case 0
    ldmia sp!, {r4, r5, r6, pc} ; case 1
    b .L_0218053c ; case 2
    b .L_021805b4 ; case 3
    b .L_021805b4 ; case 4
    b .L_021805b4 ; case 5
    b .L_021805c0 ; case 6
.L_02180494:
    mov r0, #0x8
    mvn r5, #0x80000000
    bl func_0208369c
    b .L_021804f0
.L_021804a4:
    ldr r1, [r0, #0x8]
    ldr r2, [r1, #0x10]
    ldr r1, [r2, #0x44]
    tst r1, #0x1
    beq .L_021804ec
    ldr r1, [r2, #0x5c]
    ldr r3, [r4, #0xc]
    ldr ip, [r1, #0xc]
    ldr r2, [r1, #0x10]
    ldr r1, [r4, #0x10]
    sub r3, ip, r3
    subs r1, r2, r1
    rsbmi r1, r1, #0x0
    cmp r3, #0x0
    rsblt r3, r3, #0x0
    add r1, r3, r1
    cmp r5, r1
    movgt r5, r1
.L_021804ec:
    ldr r0, [r0, #0x0]
.L_021804f0:
    cmp r0, #0x0
    bne .L_021804a4
    mvn r0, #0x80000000
    cmp r5, r0
    ldrb r0, [r6, #0xa3]
    orr r0, r0, #0x1
    strb r0, [r6, #0xa3]
    ldr r0, [r6, #0x20]
    ldrb r1, [r0, #0xd9]
    ldrb r0, [r0, #0xd8]
    cmp r1, r0
    movlo r0, #0x1
    movhs r0, #0x0
    cmp r0, #0x0
    movne r0, #0x2
    strneb r0, [r6, #0xa1]
    moveq r0, #0x1
    streqb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
.L_0218053c:
    mov r0, r6
    bl func_ov011_0217bfe0
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0xd4]
    tst r0, #0x2
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq .L_0218056c
    tst r0, #0x4000000
    bne .L_0218057c
.L_0218056c:
    cmp r1, #0x0
    bne .L_021805a8
    tst r0, #0x1000000
    beq .L_021805a8
.L_0218057c:
    mov r0, r6
    bl func_ov011_02173318
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0xe4]
    orr r0, r0, #0x10
    str r0, [r5, #0xe4]
    ldrb r0, [r6, #0xa1]
    add r0, r0, #0x1
    strb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
.L_021805a8:
    mov r0, #0x1
    strb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
.L_021805b4:
    add r0, r0, #0x1
    strb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
.L_021805c0:
    ldr r0, [r5, #0xe4]
    bic r0, r0, #0x10
    str r0, [r5, #0xe4]
    ldr r0, [r6, #0x20]
    ldr r0, [r0, #0x1a8]
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x5c]
    ldrsh r0, [r0, #0x26]
    cmp r0, #0x0
    movge r0, #0x2
    strgeb r0, [r6, #0xa1]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_021803a4

    .global func_ov011_021805f0
    arm_func_start func_ov011_021805f0
func_ov011_021805f0: ; 0x021805f0
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x24]
    ldr r1, [r3, #0x28]
    tst r1, #0x80
    beq .L_02180624
    ldr r1, [r3, #0x0]
    cmp r1, #0x0
    ldrneh r1, [r1, #0xbc]
    moveq r1, #0x0
    cmp r1, #0x100
    moveq r1, #0x1
    movne r1, #0x0
    b .L_02180648
.L_02180624:
    tst r1, #0x100
    beq .L_02180644
    ldrb r2, [r3, #0x36]
    ldrb r1, [r3, #0x37]
    cmp r2, r1
    moveq r1, #0x1
    movne r1, #0x0
    b .L_02180648
.L_02180644:
    mov r1, #0x1
.L_02180648:
    cmp r1, #0x0
    beq .L_02180668
    mov r1, #0x0
    strb r1, [r0, #0xad]
    strb r1, [r0, #0xac]
    mov r1, #0x1
    strb r1, [r0, #0x105]
    ldmia sp!, {r3, pc}
.L_02180668:
    ldrb r2, [r0, #0xac]
    ldr r1, .L_0218067c
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldmia sp!, {r3, pc}
.L_0218067c: .word data_ov011_021815fc
    arm_func_end func_ov011_021805f0

    .global func_ov011_02180680
    arm_func_start func_ov011_02180680
func_ov011_02180680: ; 0x02180680
    mov r1, #0x0
    strb r1, [r0, #0xad]
    strb r1, [r0, #0xac]
    bx lr
    arm_func_end func_ov011_02180680

    .global func_ov011_02180690
    arm_func_start func_ov011_02180690
func_ov011_02180690: ; 0x02180690
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrb r1, [r4, #0xad]
    cmp r1, #0x0
    beq .L_0218074c
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    ldr r5, [r0, #0xc]
    cmp r5, #0x0
    bne .L_021806d0
    mov r0, #0x0
    strb r0, [r4, #0xad]
    strb r0, [r4, #0xac]
    mov r0, #0x1
    strb r0, [r4, #0x105]
    ldmia sp!, {r3, r4, r5, pc}
.L_021806d0:
    mov r0, #0xb
    bl func_ov011_021733b4
    cmp r0, #0x0
    movlt r0, #0x0
    blt .L_021806f8
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    movlt r0, #0x0
    addge r0, r5, r0
.L_021806f8:
    cmp r0, #0x0
    bne .L_02180718
    mov r0, #0x0
    strb r0, [r4, #0xad]
    strb r0, [r4, #0xac]
    mov r0, #0x1
    strb r0, [r4, #0x105]
    ldmia sp!, {r3, r4, r5, pc}
.L_02180718:
    ldr r0, [r0, #0x0]
    cmp r0, #0x1
    moveq r0, #0x2
    streqb r0, [r4, #0xac]
    beq .L_02180740
    mov r2, #0x1
    mov r0, r4
    mov r1, #0xb
    strb r2, [r4, #0xac]
    bl func_ov011_0217d8d0
.L_02180740:
    mov r0, #0x0
    strb r0, [r4, #0xad]
    ldmia sp!, {r3, r4, r5, pc}
.L_0218074c:
    mov r1, #0x0
    bl func_ov011_0217335c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xd4]
    tst r0, #0x2
    ldrneb r0, [r4, #0xad]
    addne r0, r0, #0x1
    strneb r0, [r4, #0xad]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_02180690

    .global func_ov011_02180774
    arm_func_start func_ov011_02180774
func_ov011_02180774: ; 0x02180774
    ldrb r1, [r0, #0xad]
    cmp r1, #0x4
    bls .L_021807a8
    ldr r1, [r0, #0x20]
    ldrsb r1, [r1, #0x18]
    cmp r1, #0xc
    bxeq lr
    mov r1, #0x0
    strb r1, [r0, #0xad]
    strb r1, [r0, #0xac]
    mov r1, #0x1
    strb r1, [r0, #0x105]
    bx lr
.L_021807a8:
    add r1, r1, #0x1
    strb r1, [r0, #0xad]
    bx lr
    arm_func_end func_ov011_02180774

    .global func_ov011_021807b4
    arm_func_start func_ov011_021807b4
func_ov011_021807b4: ; 0x021807b4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r0, [r5, #0x107]
    mov r4, #0x0
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xdc]
    cmp r0, #0x8000
    movlt r4, #0x1
    mov r0, r5
    bl func_ov011_0217e438
    cmp r0, #0x0
    movne r4, #0x1
    cmp r4, #0x0
    ldreq r0, [r5, #0x14]
    moveq r1, #0x4000
    ldreq r0, [r0, #0x0]
    streq r1, [r0, #0xe8]
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    strb r0, [r5, #0xad]
    strb r0, [r5, #0xac]
    mov r0, #0x1
    strb r0, [r5, #0x105]
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_021807b4

    .global func_ov011_02180814
    arm_func_start func_ov011_02180814
func_ov011_02180814: ; 0x02180814
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x2c]
    ldr r1, [r5, #0x14]
    ldrsh r0, [r0, #0xa]
    ldr r4, [r1, #0x0]
    cmp r0, #0x1000
    movgt r0, #0x1000
    rsb r0, r0, #0x1000
    mov r0, r0, lsl #0xa
    mov r2, r0, asr #0x10
    cmp r2, #0x0
    movle r2, #0x1
    cmp r2, #0x40
    ldr r0, [r5, #0xd4]
    movge r2, #0x40
    tst r0, #0x2
    ldrne r0, [r4, #0xe4]
    orrne r0, r0, #0x2
    strne r0, [r4, #0xe4]
    ldrb r1, [r5, #0xc8]
    add r0, r1, #0x1
    strb r0, [r5, #0xc8]
    cmp r1, r2
    blt .L_021808a4
    ldrsb r0, [r5, #0xc9]
    cmp r0, #0x0
    ldr r0, [r4, #0xe8]
    orrne r0, r0, #0x8
    orreq r0, r0, #0x4
    str r0, [r4, #0xe8]
    ldrsb r1, [r5, #0xc9]
    mov r0, #0x0
    rsb r1, r1, #0x1
    strb r1, [r5, #0xc9]
    strb r0, [r5, #0xc8]
.L_021808a4:
    mov r0, r5
    mov r6, #0x0
    bl func_ov011_0217e438
    cmp r0, #0x0
    ldr r0, [r5, #0x20]
    movne r6, #0x1
    bl func_ov006_0215922c
    cmp r0, #0x0
    moveq r6, #0x1
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, #0x0
    strb r0, [r5, #0xc9]
    strb r0, [r5, #0xc8]
    mov r0, #0x1
    strb r0, [r5, #0x105]
    ldr r0, [r4, #0xe4]
    bic r0, r0, #0x2
    str r0, [r4, #0xe4]
    ldmia sp!, {r4, r5, r6, pc}
    arm_func_end func_ov011_02180814

    .global func_ov011_021808f4
    arm_func_start func_ov011_021808f4
func_ov011_021808f4: ; 0x021808f4
    stmdb sp!, {r3, lr}
    ldrb r2, [r0, #0xd2]
    ldr r1, .L_0218090c
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldmia sp!, {r3, pc}
.L_0218090c: .word data_ov011_021815f4
    arm_func_end func_ov011_021808f4

    .global func_ov011_02180910
    arm_func_start func_ov011_02180910
func_ov011_02180910: ; 0x02180910
    ldrh r0, [r0, #0xd0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    arm_func_end func_ov011_02180910

    .global func_ov011_02180924
    arm_func_start func_ov011_02180924
func_ov011_02180924: ; 0x02180924
    ldrh r1, [r0, #0xd0]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xd0]
    bx lr
    arm_func_end func_ov011_02180924

    .global func_ov011_02180938
    arm_func_start func_ov011_02180938
func_ov011_02180938: ; 0x02180938
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldr r0, [r7, #0x20]
    ldr r0, [r0, #0x1a8]
    bl func_ov011_02180a74
    ldr r1, [r7, #0x1c]
    mov r5, #0x0
    ldr r1, [r1, #0x4]
    mov r4, r0
    ldr r8, [r1, #0x44]
    sub r6, r5, #0x80000001
    cmp r8, #0x0
    moveq r0, r5
    beq .L_02180994
    ldr r0, [r8, #0x18]
    cmp r0, #0x0
    bne .L_02180990
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
.L_02180990:
    ldr r0, [r8, #0x18]
.L_02180994:
    ldr r0, [r0, #0x4]
    mov r11, #0x0
    ldr r0, [r0, #0x10]
    ldr ip, [r0, #0x14]
    mov r0, #0x1
    b .L_02180a30
.L_021809ac:
    ldr lr, [ip, #0x8]
    cmp lr, #0x0
    beq .L_02180a2c
    ldrsb r1, [lr, #0x39]
    cmp r1, #0x2
    cmpne r1, #0x8
    cmpne r1, #0x9
    bne .L_02180a2c
    ldr r1, [lr, #0x10]
    ldr r8, [r4, #0x0]
    ldr r3, [r1, #0x5c]
    ldr r1, [r4, #0x4]
    ldr r9, [r3, #0xc]
    ldr r2, [r3, #0x10]
    subs r10, r9, r8
    rsbmi r10, r10, #0x0
    subs r1, r2, r1
    rsbmi r1, r1, #0x0
    add r1, r10, r1
    cmp r1, r6
    bge .L_02180a2c
    mov r6, r1
    cmp r8, r9
    movgt r1, r0
    movle r1, r11
    mov r1, r1, lsl #0x1
    sub r1, r1, #0x1
    add r1, r9, r1, lsl #0xc
    str r1, [sp, #0x0]
    ldr r1, [r3, #0x10]
    mov r5, lr
    str r1, [sp, #0x4]
.L_02180a2c:
    ldr ip, [ip, #0x0]
.L_02180a30:
    cmp ip, #0x0
    bne .L_021809ac
    mov r0, #0x1
    cmp r5, #0x0
    streqb r0, [r7, #0x105]
    beq .L_02180a6c
    str r5, [r7, #0xcc]
    strb r0, [r7, #0xd2]
    mov r0, #0x0
    strb r0, [r7, #0xd3]
    ldr r0, [r7, #0x24]
    bl func_ov011_02180a84
    add r1, sp, #0x0
    mvn r2, #0x0
    bl func_ov011_02176d64
.L_02180a6c:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    arm_func_end func_ov011_02180938

    .global func_ov011_02180a74
    arm_func_start func_ov011_02180a74
func_ov011_02180a74: ; 0x02180a74
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0x5c]
    add r0, r0, #0xc
    bx lr
    arm_func_end func_ov011_02180a74

    .global func_ov011_02180a84
    arm_func_start func_ov011_02180a84
func_ov011_02180a84: ; 0x02180a84
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x8]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_02180a84

    .global func_ov011_02180a98
    arm_func_start func_ov011_02180a98
func_ov011_02180a98: ; 0x02180a98
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrb r0, [r4, #0xd3]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_02180ab0: ; jump table
    b .L_02180ac0 ; case 0
    b .L_02180b2c ; case 1
    b .L_02180b5c ; case 2
    b .L_02180b80 ; case 3
.L_02180ac0:
    ldr r0, [r4, #0x24]
    bl func_ov011_02180a84
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02180ae4
    ldr r0, [r0, #0x180]
    tst r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
.L_02180ae4:
    cmp r0, #0x0
    ldrneb r0, [r4, #0xd3]
    addne r0, r0, #0x1
    strneb r0, [r4, #0xd3]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x24]
    bl func_ov011_02180a84
    add r0, r0, #0x100
    ldrsb r0, [r0, #0x8b]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    str r0, [r4, #0xcc]
    strb r0, [r4, #0xd2]
    strb r0, [r4, #0xd3]
    mov r0, #0x1
    strb r0, [r4, #0x105]
    ldmia sp!, {r3, r4, r5, pc}
.L_02180b2c:
    ldr r0, [r4, #0x24]
    bl func_ov011_02180a84
    mov r5, r0
    ldr r0, [r4, #0xcc]
    bl func_ov011_02180a74
    mov r1, r0
    mov r0, r5
    bl func_ov011_02177010
    ldrb r0, [r4, #0xd3]
    add r0, r0, #0x1
    strb r0, [r4, #0xd3]
    ldmia sp!, {r3, r4, r5, pc}
.L_02180b5c:
    ldr r0, [r4, #0x24]
    bl func_ov011_02180a84
    add r0, r0, #0x100
    ldrsb r0, [r0, #0x8b]
    cmp r0, #0x0
    ldreqb r0, [r4, #0xd3]
    addeq r0, r0, #0x1
    streqb r0, [r4, #0xd3]
    ldmia sp!, {r3, r4, r5, pc}
.L_02180b80:
    mov r1, #0x0
    str r1, [r4, #0xcc]
    strb r1, [r4, #0xd2]
    ldr r0, .L_02180bc4
    strb r1, [r4, #0xd3]
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    bl func_02031070
    mov r1, #0x5a
    bl func_0200d338
    add r0, r1, #0xe
    add r2, r0, #0x100
    mov r0, r4
    mov r1, #0x1
    strh r2, [r4, #0xd0]
    bl func_ov011_0217ab84
    ldmia sp!, {r3, r4, r5, pc}
.L_02180bc4: .word data_020a0da8
    arm_func_end func_ov011_02180a98

    .global func_ov011_02180bc8
    arm_func_start func_ov011_02180bc8
func_ov011_02180bc8: ; 0x02180bc8
    stmdb sp!, {r3, lr}
    ldrb r2, [r0, #0xa8]
    ldr r1, .L_02180be0
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    ldmia sp!, {r3, pc}
.L_02180be0: .word data_ov011_02181608
    arm_func_end func_ov011_02180bc8

    .global func_ov011_02180be4
    arm_func_start func_ov011_02180be4
func_ov011_02180be4: ; 0x02180be4
    mov r1, #0x0
    str r1, [r0, #0xa4]
    strb r1, [r0, #0xa9]
    strb r1, [r0, #0xa8]
    bx lr
    arm_func_end func_ov011_02180be4

    .global func_ov011_02180bf8
    arm_func_start func_ov011_02180bf8
func_ov011_02180bf8: ; 0x02180bf8
    ldr r1, [r0, #0xa4]
    cmp r1, #0x0
    movne r1, #0x1
    moveq r1, #0x3
    strb r1, [r0, #0xa8]
    bx lr
    arm_func_end func_ov011_02180bf8

    .global func_ov011_02180c10
    arm_func_start func_ov011_02180c10
func_ov011_02180c10: ; 0x02180c10
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0xa4]
    mov r2, #0x0
    cmp r0, #0x0
    moveq r2, #0x1
    beq .L_02180c5c
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    moveq r2, #0x1
    beq .L_02180c5c
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    moveq r2, #0x1
    beq .L_02180c5c
    ldr r0, [r1, #0x24]
    cmp r0, #0x0
    moveq r2, #0x1
.L_02180c5c:
    cmp r2, #0x0
    beq .L_02180c78
    mov r1, #0x1
    mov r0, r4
    strb r1, [r4, #0x105]
    bl func_ov011_02180be4
    b .L_02180cb4
.L_02180c78:
    ldr r0, [r1, #0x24]
    ldrsh r0, [r0, #0x34]
    mov r0, r0, lsl #0x8
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x24]
    ldrsh r0, [r0, #0x36]
    mov r0, r0, lsl #0x8
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x24]
    bl func_ov011_02180cbc
    add r1, sp, #0x0
    mvn r2, #0x0
    bl func_ov011_02176d64
    mov r0, #0x2
    strb r0, [r4, #0xa8]
.L_02180cb4:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02180c10

    .global func_ov011_02180cbc
    arm_func_start func_ov011_02180cbc
func_ov011_02180cbc: ; 0x02180cbc
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x8]
    moveq r0, #0x0
    bx lr
    arm_func_end func_ov011_02180cbc

    .global func_ov011_02180cd0
    arm_func_start func_ov011_02180cd0
func_ov011_02180cd0: ; 0x02180cd0
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0xa4]
    ldr r0, [r0, #0x24]
    ldr r4, [r0, #0x4]
    cmp r4, #0x0
    ldrne r0, [r4, #0x24]
    cmpne r0, #0x0
    beq .L_02180d20
    cmp r4, #0x0
    beq .L_02180d14
    ldr r0, [r4, #0xa8]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    b .L_02180d18
.L_02180d14:
    mov r0, #0x0
.L_02180d18:
    cmp r0, #0x0
    beq .L_02180d34
.L_02180d20:
    mov r1, #0x1
    mov r0, r5
    strb r1, [r5, #0x105]
    bl func_ov011_02180be4
    b .L_02180d94
.L_02180d34:
    ldr r0, [r5, #0x24]
    bl func_ov011_02180cbc
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02180d58
    ldr r0, [r0, #0x180]
    tst r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
.L_02180d58:
    cmp r0, #0x0
    beq .L_02180d94
    ldr r0, [r4, #0x24]
    ldrsh r0, [r0, #0x34]
    mov r0, r0, lsl #0x8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x24]
    ldrsh r0, [r0, #0x36]
    mov r0, r0, lsl #0x8
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x24]
    bl func_ov011_02180cbc
    add r1, sp, #0x0
    mvn r2, #0x0
    bl func_ov011_02176d64
.L_02180d94:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
    arm_func_end func_ov011_02180cd0

    .global func_ov011_02180d9c
    arm_func_start func_ov011_02180d9c
func_ov011_02180d9c: ; 0x02180d9c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    ldr r2, [r10, #0x24]
    ldr r1, [r2, #0x28]
    tst r1, #0x1000
    bne .L_02180dd0
    tst r1, #0x2000
    bne .L_02180dd0
    mov r1, #0x1
    strb r1, [r10, #0x105]
    bl func_ov011_02180be4
    b .L_0218101c
.L_02180dd0:
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0x4]
    mov r5, r0
    str r0, [sp, #0x0]
    mov r11, r0
    ldr r4, [r2, #0x1c]
    b .L_02180f04
.L_02180df0:
    ldr r9, [r4, #0x8]
    ldr r0, [r9, #0x68]
    tst r0, #0x1000
    bne .L_02180e08
    tst r0, #0x2000
    beq .L_02180eac
.L_02180e08:
    mov r0, r9
    ldr r6, [r9, #0xc]
    bl func_ov011_02174f4c
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x18
    movs r0, r0, asr #0x18
    movmi r0, #0x0
    bmi .L_02180e3c
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    movlt r0, #0x0
    addge r0, r6, r0
.L_02180e3c:
    mov r7, #0x0
    mov r6, r7
    mov r2, r7
    ldrb r1, [r0, #0xc]
    b .L_02180e74
.L_02180e50:
    add r3, r0, r2, lsl #0x5
    ldr r3, [r3, #0xa8]
    cmp r3, #0x0
    addlt r6, r6, r3
    add r3, r0, r2, lsl #0x5
    ldr r3, [r3, #0xac]
    add r2, r2, #0x1
    cmp r3, #0x0
    addlt r7, r7, r3
.L_02180e74:
    cmp r2, r1
    blt .L_02180e50
    mvn r0, #0x0
    mul r1, r6, r0
    mul r0, r7, r0
    mov r7, r0
    ldr r0, [sp, #0x0]
    mov r6, r1
    cmp r1, r0
    strgt r9, [sp, #0x8]
    strgt r1, [sp, #0x0]
    cmp r7, r11
    strgt r9, [sp, #0x4]
    movgt r11, r7
.L_02180eac:
    mov r0, r9
    bl func_ov011_02174f4c
    cmp r0, #0x1
    bne .L_02180ec8
    ldr r0, [r9, #0x68]
    tst r0, #0x40000
    bne .L_02180ee4
.L_02180ec8:
    mov r0, r9
    bl func_ov011_02174f4c
    cmp r0, #0x2
    bne .L_02180f00
    ldr r0, [r9, #0x68]
    tst r0, #0x80000
    beq .L_02180f00
.L_02180ee4:
    cmp r5, #0x0
    beq .L_02180efc
    cmp r7, #0x0
    cmpeq r6, #0x0
    movne r5, r9
    b .L_02180f00
.L_02180efc:
    mov r5, r9
.L_02180f00:
    ldr r4, [r4, #0x0]
.L_02180f04:
    cmp r4, #0x0
    bne .L_02180df0
    mov r1, #0x0
    strh r1, [sp, #0x12]
    ldr r3, [r10, #0x24]
    ldrsh r2, [sp, #0xc]
    ldr r0, [r3, #0x0]
    cmp r0, #0x0
    ldrneh r0, [r0, #0xbc]
    moveq r0, r1
    mov r0, r0, lsl #0x7
    add r0, r2, r0, asr #0x8
    strh r0, [sp, #0xc]
    ldrb r4, [r3, #0x37]
    ldrb r2, [r3, #0x36]
    mov r0, #0x60
    cmp r4, #0x10
    movhs r4, #0x10
    sub r2, r4, r2
    mul r0, r2, r0
    ldrsh r3, [sp, #0xe]
    ldr r2, .L_02181024
    ldrsh r4, [sp, #0x10]
    add r0, r3, r0, asr #0x4
    strh r0, [sp, #0xe]
    ldr r0, [r10, #0x20]
    ldrh r3, [r0, #0xa0]
    mov r0, #0x0
    mov r3, r3, lsl #0x1
    ldrsh r2, [r2, r3]
    add r3, sp, #0xc
    add r2, r4, r2
    strh r2, [sp, #0x10]
.L_02180f88:
    mov r2, r0, lsl #0x1
    ldrsh r2, [r3, r2]
    cmp r1, r2
    movlt r8, r0
    add r0, r0, #0x1
    movlt r1, r2
    cmp r0, #0x3
    blt .L_02180f88
    cmp r8, #0x0
    beq .L_02180fcc
    cmp r8, #0x1
    beq .L_02180fc4
    cmp r8, #0x2
    streq r5, [sp, #0x8]
    b .L_02180fcc
.L_02180fc4:
    ldr r0, [sp, #0x4]
    str r0, [sp, #0x8]
.L_02180fcc:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_02180fec
    mov r1, #0x1
    mov r0, r10
    strb r1, [r10, #0x105]
    bl func_ov011_02180be4
    b .L_0218101c
.L_02180fec:
    ldrb r2, [r0, #0xc3]
    ldrb r1, [r0, #0xc2]
    ldr r3, [r10, #0x18]
    mov r0, #0x1
    strh r1, [r3, #0xc]
    strh r2, [r3, #0xe]
    strb r0, [r3, #0x10]
    mov r0, #0x4
    strb r0, [r3, #0x11]
    strb r0, [r10, #0xa8]
    mov r0, #0x0
    strb r0, [r10, #0xa9]
.L_0218101c:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02181024: .word data_ov011_0218161c
    arm_func_end func_ov011_02180d9c

    .global func_ov011_02181028
    arm_func_start func_ov011_02181028
func_ov011_02181028: ; 0x02181028
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrb r0, [r4, #0xa9]
    cmp r0, #0x0
    beq .L_02181098
    ldr r0, [r4, #0x24]
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    ldrne r0, [r1, #0x24]
    cmpne r0, #0x0
    beq .L_021810a0
    ldrsh r0, [r0, #0x34]
    mov r0, r0, lsl #0x8
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x24]
    ldrsh r0, [r0, #0x36]
    mov r0, r0, lsl #0x8
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x24]
    bl func_ov011_02180cbc
    add r1, sp, #0x0
    mvn r2, #0x0
    bl func_ov011_02176d64
    mov r0, #0x2
    strb r0, [r4, #0xa8]
    str r4, [r4, #0xa4]
    b .L_021810a0
.L_02181098:
    add r0, r0, #0x1
    strb r0, [r4, #0xa9]
.L_021810a0:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
    arm_func_end func_ov011_02181028

    .section .rodata, 4, 1, 4
data_ov011_021810a8:
    .byte 0x08, 0x11, 0x12, 0x13, 0x15, 0xff, 0x00, 0x00
data_ov011_021810b0:
    .byte 0x00, 0x01, 0xff, 0x00, 0xff, 0x00, 0x01, 0x00, 0x01, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov011_021810c0:
    .byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
    .byte 0x09, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x00, 0x00
    .byte 0x13, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff
data_ov011_021810ec:
    .byte 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x15, 0x17, 0x18
    .byte 0x19, 0x1a, 0x1b, 0xff
data_ov011_02181100:
    .byte 0xff, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e
    .byte 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16
data_ov011_02181118:
    .byte 0x08, 0x01, 0x0e, 0x0f
data_ov011_0218111c:
    .byte 0x09, 0x04, 0x12, 0x13
data_ov011_02181120:
    .byte 0x0b, 0x06, 0x10, 0x11
data_ov011_02181124:
    .byte 0x07, 0x00, 0x0c, 0x0d
data_ov011_02181128:
    .byte 0x0a, 0x05, 0x14, 0x15
data_ov011_0218112c:
    .byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
data_ov011_02181134:
    .byte 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0xff, 0x0c, 0x0d, 0x0e, 0x0f, 0x10
    .byte 0x11, 0x12, 0x13, 0x14, 0x15, 0xff
data_ov011_0218114a:
    .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0xff, 0xff, 0x08, 0x09, 0x00, 0x00, 0x01, 0x02
    .byte 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0xff, 0xff, 0x09, 0x0a, 0x00, 0x00
data_ov011_02181166:
    .byte 0x00, 0x00, 0x03, 0x05, 0x04, 0x06, 0x05, 0x07, 0x06, 0x03, 0x07, 0x06, 0x03, 0x03, 0x04, 0x04
    .byte 0x02, 0x02, 0x02, 0x04, 0x04, 0x04, 0x02, 0x03, 0x05, 0x05, 0x02, 0x0a, 0x08, 0x08, 0x08, 0x08
    .byte 0x02, 0x02, 0x02, 0x08, 0x05, 0x05, 0x04, 0x04, 0x03, 0x03, 0x03, 0x03, 0x03, 0x04, 0x0a, 0x08
    .byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x07, 0x05, 0x06, 0x03, 0x04, 0x03, 0x04, 0x03, 0x03, 0x04, 0x04
    .byte 0x05, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov011_021811bc:
    .byte 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0e, 0x0f, 0x11, 0x23, 0x24, 0xff, 0x00
data_ov011_021811c8:
    .byte 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x02, 0x02
data_ov011_021811d0:
    .byte 0x00, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02
data_ov011_021811d8:
    .byte 0x11, 0x21, 0xff, 0x00
data_ov011_021811dc:
    .byte 0x02
data_ov011_021811dd:
    .byte 0x00, 0x04, 0x02, 0x06, 0x04, 0x08, 0x07, 0x04, 0x0c, 0x08, 0x26, 0x10, 0x66, 0x20, 0xe6
data_ov011_021811ec:
    .byte 0x00
data_ov011_021811ed:
    .byte 0x00, 0x04, 0x02, 0x08, 0x04, 0x10, 0x07
data_ov011_021811f4:
    .byte 0x04
data_ov011_021811f5:
    .byte 0x0c, 0x10, 0x26, 0x20, 0x4c, 0x40, 0x66, 0x60, 0x80, 0x80, 0xa6, 0xa0, 0xcc, 0xc0, 0xf3
data_ov011_02181204:
    .byte 0x02
data_ov011_02181205:
    .byte 0x0c, 0x04, 0x26, 0x08, 0x4c, 0x10, 0x66, 0x12, 0x80, 0x14, 0xa6, 0x16, 0xcc, 0x18, 0xf3
data_ov011_02181214:
    .byte 0x80, 0x00, 0x00, 0x01, 0x80, 0x01, 0x00, 0x02, 0x80, 0x02, 0x00, 0x03, 0x80, 0x03, 0x00, 0x04
data_ov011_02181224:
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x08, 0x00, 0x00, 0x00
    .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x23, 0x00, 0x00, 0x00
    .byte 0x23, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
    .byte 0x19, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
    .byte 0x14, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00
    .byte 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
    .byte 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
    .byte 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
data_ov011_021812c4:
    .byte 0x0c, 0x19, 0x26, 0x33, 0x40, 0x4c, 0x66, 0x80
data_ov011_021812cc:
    .byte 0x4c, 0x4c, 0x4c, 0x73, 0x73, 0x73, 0x99, 0x99
data_ov011_021812d4:
    .byte 0x18, 0x01, 0x1a, 0x03, 0x1c, 0x05, 0x1e, 0x0a, 0x2a, 0x14, 0xff, 0xff
data_ov011_021812e0:
    .byte 0x08
data_ov011_021812e1:
    .byte 0x1e, 0x0a, 0x1e, 0x0c, 0x1e, 0x0e, 0x1e, 0x10, 0x1e, 0x12, 0x1e, 0x14, 0x3c, 0x16, 0x64, 0xff
    .byte 0xff, 0x00, 0x00
data_ov011_021812f4:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word func_ov011_0217aa58
    .word func_ov011_0217e3a0
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov011_0217f890
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov011_02180be4
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov011_02180680
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov011_02181324:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00
    .byte 0x14, 0x00, 0x64, 0x00, 0x78, 0x00, 0x32, 0x00, 0x90, 0x01, 0x2c, 0x01, 0xc8, 0x00, 0xc8, 0x00
    .byte 0x14, 0x00, 0x50, 0x00, 0x00, 0xf0, 0xec, 0xff, 0xe2, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0xec, 0xff, 0xce, 0xff, 0xce, 0xff, 0x00, 0x00, 0xec, 0xff
    .byte 0x00, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x90, 0x01, 0x90, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
data_ov011_02181378:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0xf0, 0x00, 0x00, 0x9c, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0xf0, 0x2c, 0x01, 0x14, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00
    .byte 0x50, 0x00, 0x14, 0x00, 0x64, 0x00, 0x2c, 0x01, 0x64, 0x00, 0x64, 0x00, 0x00, 0x00, 0x50, 0x00
    .byte 0x96, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
data_ov011_021813cc:
    .byte 0x09, 0x0a, 0x0b, 0x0c, 0x1a, 0xff, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
    .byte 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
data_ov011_021813e4:
    .byte 0x03, 0x0a, 0x05, 0x0a, 0x02, 0x08, 0x04, 0x06, 0x06, 0x06, 0x02, 0x0a, 0x04, 0x08, 0x06, 0x08
    .byte 0x0d, 0x06, 0x0e, 0x06, 0x04, 0x0a, 0x06, 0x0a, 0x0d, 0x08, 0x0e, 0x08, 0xff, 0xff, 0x09, 0x0a
    .byte 0x0a, 0x0a, 0x0d, 0x08, 0x0e, 0x08, 0xff, 0xff
data_ov011_0218140c:
    .byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x01, 0x02, 0x07, 0x08, 0x0b, 0x0d, 0x0e, 0x0f, 0x10, 0x11
    .byte 0x12, 0x13, 0x14, 0x15, 0x16, 0xff, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x02, 0x03, 0x05, 0x06
    .byte 0x11, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0xff
data_ov011_02181438:
    .word data_020f0001
    .byte 0x01, 0x10, 0x03, 0x00, 0x11, 0x04, 0x01, 0x12, 0x05, 0x00, 0x13, 0x06
    .byte 0x01, 0x14, 0x01, 0x02, 0x15, 0x01, 0x03, 0x16, 0x07, 0x05, 0x17, 0x08, 0x06, 0x18, 0x0b, 0x11
    .byte 0x19, 0x0d, 0x04, 0x1a, 0x0e, 0x04, 0x1a, 0x7f, 0x12, 0x1b, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00
data_ov011_02181468:
    .byte 0x20, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
data_ov011_02181478:
    .word func_ov011_0217d92c
    .word func_ov011_0217d930
    .word func_ov011_0217d9a0
    .word func_ov011_0217da10
    .word func_ov011_0217dac4
    .word func_ov011_0217db78
    .word func_ov011_0217dc04
    .word func_ov011_0217dc90
    .word func_ov011_0217dd1c
    .word func_ov011_0217d930
    .word func_ov011_0217d9a0
    .word func_ov011_0217df18
    .word func_ov011_0217dda8
    .word func_ov011_0217de1c
    .word func_ov011_0217de8c
    .word func_ov011_0217de1c
    .word func_ov011_0217de8c
    .word func_ov011_0217de1c
    .word func_ov011_0217de8c
    .word func_ov011_0217de1c
    .word func_ov011_0217de8c
    .word func_ov011_0217de1c
    .word func_ov011_0217de8c
    .byte 0x00, 0x00, 0x00, 0x00
data_ov011_021814d8:
    .byte 0x01, 0x02, 0x03, 0xff
data_ov011_021814dc:
    .byte 0x14, 0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00
data_ov011_021814e4:
    .word func_ov011_0217f904
    .word func_ov011_0217f9a8
    .word func_ov011_0217fba0
data_ov011_021814f0:
    .byte 0x08, 0x0a, 0x0c, 0x0e, 0x10, 0x14, 0x16, 0xff, 0x00, 0x00, 0x18, 0x1a, 0x1c, 0x1e, 0xff, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x22, 0x24, 0x26, 0x28, 0x2a, 0xff, 0x00, 0x00, 0x00, 0x2c, 0x2e
    .byte 0x30, 0x32, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x36, 0x38, 0x3a, 0x3b, 0x3c, 0xff, 0x00
    .byte 0x00, 0x00, 0x3d, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa0, 0xa2, 0xa4, 0xa6
    .byte 0xa8, 0xaa, 0xac, 0xae, 0xb0, 0xff, 0xc0, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov011_02181540:
    .byte 0x08, 0x00
data_ov011_02181542:
    .byte 0x0a, 0x00, 0x0a, 0x00, 0x0a, 0x00, 0x0c, 0x00, 0x0a, 0x00, 0x0e, 0x00, 0x0a, 0x00, 0x10, 0x00
    .byte 0x0a, 0x00, 0x12, 0x00, 0x0a, 0x00, 0x14, 0x00, 0x14, 0x00, 0x16, 0x00, 0x1e, 0x00, 0x18, 0x00
    .byte 0x0f, 0x00, 0x1a, 0x00, 0x1e, 0x00, 0x1c, 0x00, 0x32, 0x00, 0x1e, 0x00, 0x50, 0x00, 0x20, 0x00
    .byte 0x1e, 0x00, 0x22, 0x00, 0x1e, 0x00, 0x24, 0x00, 0x0f, 0x00, 0x26, 0x00, 0x28, 0x00, 0x28, 0x00
    .byte 0x23, 0x00, 0x2a, 0x00, 0x64, 0x00, 0x2c, 0x00, 0xf1, 0xff, 0x2e, 0x00, 0xce, 0xff, 0x30, 0x00
    .byte 0xe2, 0xff, 0x32, 0x00, 0xec, 0xff, 0x34, 0x00, 0x28, 0x00, 0x36, 0x00, 0x14, 0x00, 0x38, 0x00
    .byte 0x1e, 0x00, 0x3a, 0x00, 0xd8, 0xff, 0x3b, 0x00, 0xec, 0xff, 0x3c, 0x00, 0xe2, 0xff, 0x3d, 0x00
    .byte 0xe2, 0xff, 0xa0, 0x00, 0x64, 0x00, 0xa2, 0x00, 0x78, 0x00, 0xa4, 0x00, 0x64, 0x00, 0xa6, 0x00
    .byte 0x78, 0x00, 0xa8, 0x00, 0x64, 0x00, 0xaa, 0x00, 0x78, 0x00, 0xac, 0x00, 0xc8, 0x00, 0xae, 0x00
    .byte 0xc8, 0x00, 0xb0, 0x00, 0x2c, 0x01, 0xc0, 0x00, 0x90, 0x01, 0xff, 0xff, 0xff, 0xff
data_ov011_021815e0:
    .byte 0x00, 0x00, 0x00, 0x00
    .word func_ov011_0217fe64
    .word func_ov011_0218011c
    .word func_ov011_0217ffac
    .word func_ov011_021803a4
data_ov011_021815f4:
    .word func_ov011_02180938
    .word func_ov011_02180a98
data_ov011_021815fc:
    .word func_ov011_02180690
    .word func_ov011_02180774
    .word func_ov011_021807b4
data_ov011_02181608:
    .word func_ov011_02180bf8
    .word func_ov011_02180c10
    .word func_ov011_02180cd0
    .word func_ov011_02180d9c
    .word func_ov011_02181028
data_ov011_0218161c:
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x40, 0x00, 0x20, 0x00, 0x18, 0x00, 0x18, 0x00, 0x80, 0x00
    .byte 0x48, 0x00, 0x40, 0x00, 0x60, 0x00, 0x80, 0x00, 0x50, 0x00, 0x50, 0x00, 0x40, 0x00, 0x50, 0x00
    .byte 0x60, 0x00, 0x20, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .section .init, 4, 1, 4
    .global __sinit_ov011_02181670
    arm_func_start __sinit_ov011_02181670
__sinit_ov011_02181670: ; 0x02181670
    ldr ip, .L_0218167c
    ldr r0, .L_02181680
    bx ip
.L_0218167c: .word func_ov011_021742b8
.L_02181680: .word data_ov011_02181a60
    arm_func_end __sinit_ov011_02181670

    .global __sinit_ov011_02181684
    arm_func_start __sinit_ov011_02181684
__sinit_ov011_02181684: ; 0x02181684
    ldr ip, .L_02181690
    ldr r0, .L_02181694
    bx ip
.L_02181690: .word func_ov011_02178f5c
.L_02181694: .word data_ov011_02183a3c
    arm_func_end __sinit_ov011_02181684

    .section .ctor, 4, 1, 4
.p__sinit_ov011_02181670:
    .word __sinit_ov011_02181670
.p__sinit_ov011_02181684:
    .word __sinit_ov011_02181684
    .section .data, 4, 1, 4
data_ov011_021816c0:
    .byte 0x03, 0x00, 0x00, 0x00
    .word data_ov011_021817ac
data_ov011_021816c8:
    .word func_ov011_02173f44
    .word func_ov011_021796e0
    .word func_ov011_0217a608
    .word func_ov011_0217e39c
    .word func_ov011_02173f44
    .word func_ov011_0217f7d4
    .word func_ov011_02173f44
    .word func_ov011_02180bc8
    .word func_ov011_0217df88
    .word func_ov011_021805f0
    .word func_ov011_02180814
    .word func_ov011_021808f4
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov011_02181700:
    .word func_ov011_021742a4
    .word func_ov011_02174218
    .word func_ov011_02174020
    .word func_0201c8a0
    .word func_02028e6c
    .word func_ov011_02174234
    .word func_ov011_02174210
    .word func_ov011_02174208
    .word func_ov011_02174200
    .word func_ov011_021741f0
    .word func_ov011_021741e4
    .word func_ov011_021741d4
    .word func_ov011_021741cc
    .word func_ov011_021741c4
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data_ov011_02181740:
    .word func_ov011_021741b0
    .word func_ov011_021740e0
    .word func_ov011_02172e38
    .word func_ov011_02172e90
    .word func_ov011_02174008
    .word func_ov011_02174004
    .word func_ov011_02173ff8
    .word func_ov011_02173fd4
    .word func_ov011_02173f8c
    .word func_ov011_02173fb0
    .word func_02026f90
    .word func_02026fb0
    .word func_02026fb4
    .word func_ov011_02174034
    .word func_ov011_021740c8
    .word func_ov011_021740b0
    .word func_ov011_02174098
    .word func_02020e90
    .word func_02020e94
    .word func_ov011_0217404c
    .word func_ov011_02174070
    .word func_02020f20
    .word func_ov011_021740fc
data_ov011_0218179c:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x5f, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x00
data_ov011_021817ac:
    .byte 0x63, 0x68, 0x72, 0x2f, 0x61, 0x69, 0x2f, 0x61, 0x69, 0x5f, 0x70, 0x61, 0x72, 0x61, 0x6d, 0x2e
    .byte 0x62, 0x69, 0x6e, 0x00
data_ov011_021817c0:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00, 0x00, 0x00
data_ov011_021817d0:
    .word data_ov011_021817d8
    .word data_ov011_021817e0
data_ov011_021817d8:
    .byte 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov011_021817e0:
    .byte 0x63, 0x68, 0x72, 0x2f, 0x61, 0x69, 0x2f, 0x00
data_ov011_021817e8:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x44, 0x65, 0x63, 0x6b, 0x5f, 0x43, 0x72, 0x65
    .byte 0x61, 0x74, 0x65, 0x00
data_ov011_021817fc:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x44, 0x65, 0x63, 0x6b, 0x5f, 0x43, 0x61, 0x6c
    .byte 0x6c, 0x42, 0x61, 0x63, 0x6b, 0x43, 0x6f, 0x62, 0x6a, 0x57, 0x6f, 0x72, 0x6b, 0x43, 0x72, 0x65
    .byte 0x61, 0x74, 0x65, 0x00
data_ov011_02181820:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x5f, 0x44, 0x65, 0x63, 0x6b, 0x2e, 0x63, 0x70
    .byte 0x70, 0x00, 0x00, 0x00
data_ov011_02181834:
    .byte 0x68, 0x00, 0x00, 0x00
data_ov011_02181838:
    .byte 0x66, 0x00, 0x00, 0x00
data_ov011_0218183c:
    .byte 0x73, 0x00, 0x00, 0x00
data_ov011_02181840:
    .byte 0x6e, 0x00, 0x00, 0x00
data_ov011_02181844:
    .byte 0x6c, 0x00, 0x00, 0x00
data_ov011_02181848:
    .byte 0x6d, 0x00, 0x00, 0x00
data_ov011_0218184c:
    .word data_ov011_02181834
    .word data_ov011_02181848
    .word data_ov011_02181844
data_ov011_02181858:
    .word data_ov011_02181838
    .word data_ov011_02181840
    .word data_ov011_0218183c
data_ov011_02181864:
    .word func_ov011_02178f18
    .word func_ov011_02177c60
    .word func_ov011_02178250
    .word func_ov011_02178760
    .word func_ov011_021788c8
    .word func_ov011_021788c8
    .word func_ov011_021788c8
    .word func_ov011_02178bd0
    .word func_ov011_02178de0
data_ov011_02181888:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x4d, 0x6f, 0x76, 0x65, 0x5f, 0x43, 0x72, 0x65
    .byte 0x61, 0x74, 0x65, 0x00
data_ov011_0218189c:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x5f, 0x4d, 0x6f, 0x76, 0x65, 0x2e, 0x63, 0x70
    .byte 0x70, 0x00, 0x00, 0x00
data_ov011_021818b0:
    .byte 0x2e, 0x2e, 0x5c, 0x64, 0x61, 0x74, 0x61, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x5c, 0x5f, 0x64
    .byte 0x61, 0x74, 0x61, 0x5c, 0x5f, 0x61, 0x69, 0x5c, 0x6d, 0x6f, 0x76, 0x65, 0x5c, 0x00, 0x00, 0x00
data_ov011_021818d0:
    .byte 0x5c, 0x00, 0x00, 0x00
data_ov011_021818d4:
    .byte 0x5f, 0x00, 0x00, 0x00
data_ov011_021818d8:
    .byte 0x2e, 0x62, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00
data_ov011_021818e0:
    .byte 0x63, 0x68, 0x72, 0x2f, 0x61, 0x69, 0x2f, 0x6d, 0x6f, 0x76, 0x65, 0x2f, 0x00, 0x00, 0x00, 0x00
data_ov011_021818f0:
    .byte 0x2f, 0x00, 0x00, 0x00
data_ov011_021818f4:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x53, 0x74, 0x61, 0x74, 0x65, 0x5f, 0x43, 0x72
    .byte 0x65, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov011_0218190c:
    .byte 0x40, 0x00, 0x00, 0x00, 0x4c, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
    .byte 0xa6, 0x00, 0x00, 0x00, 0xb3, 0x00, 0x00, 0x00, 0xd9, 0x00, 0x00, 0x00, 0xf3, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x80, 0x03, 0x18, 0x08, 0x05, 0xc0
    .byte 0x10, 0x20, 0x03, 0x08, 0x20, 0x60, 0x60, 0x30, 0x20, 0x20, 0x20, 0x08, 0x08, 0x10, 0x08, 0x10
    .byte 0x10, 0x10, 0x08, 0x08, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x02, 0x04, 0x04, 0x04, 0x07, 0xff
data_ov011_0218195c:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x5f, 0x53, 0x74, 0x61, 0x74, 0x65, 0x2e, 0x63
    .byte 0x70, 0x70, 0x00, 0x00
data_ov011_02181970:
    .byte 0x00, 0x00, 0x60, 0x00, 0x60, 0x00, 0x80, 0x00, 0xc0, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01
data_ov011_02181980:
    .word func_ov011_0217abbc
    .word func_ov011_0217b0f0
    .word func_ov011_0217b7f0
    .word func_ov011_0217b8f8
    .word func_ov011_0217bb58
    .word func_ov011_0217bbac
    .word func_ov011_0217c16c
    .word func_ov011_0217c2c0
    .word func_ov011_0217c508
    .word func_ov011_0217cab4
    .word func_ov011_0217ccf8
    .word func_ov011_0217cdbc
data_ov011_021819b0:
    .word func_ov011_0217d0b0
    .word func_ov011_0217d1e4
    .word func_ov011_0217d350
    .word func_ov011_0217d558
data_ov011_021819c0:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x4f, 0x62, 0x6a, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x42, 0x72, 0x61, 0x6e, 0x63, 0x68, 0x4e, 0x6f, 0x64, 0x65, 0x00, 0x00, 0x00, 0x00
data_ov011_021819e0:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x5f, 0x4a, 0x6f, 0x62, 0x41, 0x74, 0x6b, 0x42
    .byte 0x72, 0x68, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov011_021819f8:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x4f, 0x62, 0x6a, 0x5f, 0x43, 0x72, 0x65, 0x61
    .byte 0x74, 0x65, 0x43, 0x6f, 0x6d, 0x6d, 0x61, 0x6e, 0x64, 0x4e, 0x6f, 0x64, 0x65, 0x00, 0x00, 0x00
data_ov011_02181a18:
    .byte 0x42, 0x61, 0x74, 0x74, 0x6c, 0x65, 0x41, 0x49, 0x5f, 0x4a, 0x6f, 0x62, 0x41, 0x74, 0x6b, 0x43
    .byte 0x6d, 0x64, 0x2e, 0x63, 0x70, 0x70, 0x00, 0x00
data_ov011_02181a30:
    .word func_ov011_0217e454
    .word func_ov011_0217e4a0
    .word func_ov011_0217ea00
    .word func_ov011_0217eb88
    .word func_ov011_0217ec8c
    .word func_ov011_0217ed9c
data_ov011_02181a48:
    .byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .section .bss, 4, 1, 4
data_ov011_02181a60: .space 0x1fd8
data_ov011_02183a38: .space 0x4
data_ov011_02183a3c: .space 0xffc1
data_ov011_021939fd: .space 0x164
data_ov011_02193b61: .space 0x20
data_ov011_02193b81: .space 0x8117
data_ov011_0219bc98: .space 0x154
data_ov011_0219bdec: .space 0x288
data_ov011_0219c074: .space 0xda8
data_ov011_0219ce1c: .space 0x178
data_ov011_0219cf94: .space 0x28
data_ov011_0219cfbc: .space 0x188
data_ov011_0219d144: .space 0x68
data_ov011_0219d1ac: .space 0x2f8
data_ov011_0219d4a4: .space 0x4c
data_ov011_0219d4f0: .space 0x128
data_ov011_0219d618: .space 0x5c10
data_ov011_021a3228: .space 0x20
data_ov011_021a3248: .space 0x288
data_ov011_021a34d0: .space 0x160
data_ov011_021a3630: .space 0x8
data_ov011_021a3638: .space 0x4f00
data_ov011_021a8538: .space 0x17ec
data_ov011_021a9d24: .space 0x3b4
data_ov011_021aa0d8: .space 0x20e0
data_ov011_021ac1b8: .space 0x8
