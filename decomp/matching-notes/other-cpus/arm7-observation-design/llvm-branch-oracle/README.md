# Independent LLVM branch oracle

These synthetic ARMv4T programs establish instruction encodings and linked
branch addresses independently of the locked unarm decoder. The actual LLVM
23.1.2 disassembly confirms four ARM and three Thumb targets. This earns no
original-game source credit or hardware/reachability claim.

Reproduce with the pinned native tools and a private output directory:

```sh
llvm-mc --triple=armv4t-none-eabi --filetype=obj branches.s -o branches.o
ld.lld -T layout.ld branches.o -o branches.elf
llvm-objdump -d branches.elf
llvm-mc --triple=armv4t-none-eabi --filetype=obj thumb.s -o thumb.o
ld.lld -T thumb-layout.ld thumb.o -o thumb.elf
llvm-objdump -d thumb.elf
```

The reports retain actual disassembly and tool hashes. The initial Thumb
absolute-symbol setup failed at assembly; the retained source uses ordinary
Thumb section symbols with their addresses assigned by the linker. No ROM
inputs or binary artifacts are published.
