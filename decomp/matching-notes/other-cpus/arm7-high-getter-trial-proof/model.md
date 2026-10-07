# Frozen high-getter C hypothesis before compilation

The sole model is `high_getter_trial.c`, SHA256
`342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e`.
Unsigned int and int are the compiler's ARM32 word types. External byte-object
addresses represent hypothetical linker absolute values, rather than reads of
memory at those addresses. Address-to-signed-int conversion is an explicit
implementation-defined target hypothesis. All subtraction operates on unsigned
32-bit words to preserve modulo arithmetic and avoid signed-overflow undefined
behavior. The model does not compare unrelated C pointers.

The ID1 result is fixed 0x027ff000; ID7 is fixed 0x03800000. ID8 first computes
0x0380ff80 minus the signed IRQ-size word converted to unsigned. It initializes
low to0x03800000, raises low when the unsigned WRAM lower bound exceeds it, then
reads a signed system-size address word. A zero system size returns low; a
negative word returns low minus its unsigned representation; a positive word
returns the IRQ lower bound minus the unsigned system size. All other IDs
return zero. No source name, parameter/return ABI, original declaration kind,
linker ownership, SDK version, or original function extent is established.
