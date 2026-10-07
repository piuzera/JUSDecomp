# Native ARM9 baseline contract

`tools/scripts/native_link.py` adapts the pinned dsd 0.12.0 reference objects and
linker script to LLVM lld 23.1.2. The linked ELF emits all 17 original module
payloads. This remains a binary-backed baseline with zero reconstructed source.

## Object and layout adaptations

The adapter operates on private copies. It repairs the ELF local/global symbol
partition and updates RELA symbol indices. Mapping symbols establish ARM and
Thumb function modes. Interior call targets need function types for interworking.
ARM `PC24` relocations become `CALL` or `JUMP24` according to the instruction.
RELA addends stay unchanged. An empty ARMv5TE attributes object enables the
correct instruction encoding.

The supported input is the dsd baseline grammar and its three relocation types.
Unsupported relocation kinds, addends, or PC24 opcodes fail explicitly.
The translated layout preserves `AFTER` dependencies, BSS extents, constructor
zeros, and zero alignment padding. Overlays have distinct load-file offsets even
when their RAM addresses overlap. BSS remains part of section extents but is
excluded from emitted initialized module bytes.

## Symbol checker metadata view

dsd 0.12.0 recognizes uppercase module section names and expects even Thumb
function addresses. Its [module parser](https://github.com/AetiasHax/ds-decomp/blob/v0.12.0/cli/src/config/module.rs)
and [symbol importer](https://github.com/AetiasHax/ds-decomp/blob/v0.12.0/cli/src/config/symbol.rs)
define that contract. Native ELF uses a low address bit to encode Thumb functions.

The adapter preserves `linked.elf` for native ELF consumers. `dsd-check.elf` is a
separate diagnostic view that renames known module sections and clears function
address mode bits. No module bytes or section addresses change. Data-symbol bits
remain intact. The view is never a native link input.

## Verified result

[native-results.json](native-results.json) records actual tool exits and hashes.
[native-modules.json](native-modules.json) records each original-ROM comparison,
load address, and BSS extent. The module check passes all 17 targets, including
the two empty overlays. The diagnostic-view symbol check also exits 0.

ARM7, Download Play programs, and full-ROM packing remain separate unfinished
tasks. The original Metrowerks linker is unavailable. This result proves the
authorized native replacement against original ROM modules.
