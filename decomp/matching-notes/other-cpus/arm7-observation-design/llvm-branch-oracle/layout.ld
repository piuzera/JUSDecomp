ENTRY(_start)
SECTIONS { . = 0x02380000; .text : { *(.text) } target = 0x037f8468; back_target = 0x01380000; }
