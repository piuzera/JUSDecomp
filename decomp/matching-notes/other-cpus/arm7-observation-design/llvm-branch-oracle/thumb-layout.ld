ENTRY(_start)
SECTIONS { .text 0x02380000 : { *(.text) } .short_target 0x02380802 : { *(.short_target) } .conditional_target 0x02380104 : { *(.conditional_target) } .long_target 0x02780006 : { *(.long_target) } }
