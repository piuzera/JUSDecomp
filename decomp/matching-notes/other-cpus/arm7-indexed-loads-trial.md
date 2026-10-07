# Bounded ARM7 indexed-load trials

Two frozen plain C word-load hypotheses each compile to their exact twenty-byte original ARM selection. Directly linking their real objects with the five unchanged accepted initializer/callee objects reproduces both complete original ARM7 images. This is a finite compiler and link correspondence, with source credit 0, canonical 304 unchanged, and T06 and T10 open.

## Original bytes before source

An independent original-only read checks the parent header, original FNT path `ChildRom/JSS2Child.srl`, FAT 79, both full program identities, both 165552-byte ARM7 images, module parameters, loader table, and initialized-region hashes. The new package owns [checked-layouts.json](arm7-indexed-loads-proof/checked-layouts.json), SHA256 `8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`. Both original ARM7 images have SHA256 `0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`. Their equal image hashes do not merge the parent and FAT 79 child identities.

The two finite selections were already observed separately in the [accepted initializer grounding](arm7-arena-init-trial.md). This trial independently re-reads their raw words and LLVM ARMv4T interpretations before creating either source model. The [first readback](arm7-indexed-loads-proof/first-original-read.json) retains both identities and exact coordinates.

| Selection | Stored image offset | Original five words | SHA256 |
| --- | ---: | --- | --- |
| Lower `[0x037fd004,0x037fd018)` | 20916 | `e1a00100 e2800627 e2800aff e5900da0 e12fff1e` | `d714db36568f87382608e68dc45eb84a63bfe2d98e3869d5c1562567987e0c6e` |
| Upper `[0x037fd018,0x037fd02c)` | 20936 | `e1a00100 e2800627 e2800aff e5900dc4 e12fff1e` | `b9133a64c254987fd068341728344b7bc29c68411d2334e0744eab80a9dac262` |

Each sequence shifts `r0` left 2, adds `0x02700000`, adds `0x000ff000`, loads one word through the resulting address plus `0xda0` or `0xdc4`, then executes `BX lr`. The resulting addresses are `0x027ffda0 + (r0 << 2)` and `0x027ffdc4 + (r0 << 2)` under ARM32 word arithmetic. The tables differ by `0x24`. Neither selected sequence contains a call or literal pool. Their BX destinations remain unknown.

The read establishes no index bound, table extent, memory contents or lifetime, original type, function name, function extent, return ABI, SDK version, or source ownership. The initialized-byte accessor rejects BSS reads; table RAM is not recovered from ROM. The inherited initializer's BSS guard value, NE branch feasibility, `call_returned` continuations, final BX and startup BX remain unknown.

## Two frozen models and actual objects

The models were frozen and root plus independent precompile checked before either compiler run. Each uses unsigned index/address arithmetic and a single volatile unsigned-word load, with no array extent, storage definition, lifetime workaround, assembly, or asserted bounds.

| Source and hypothetical signature | Source SHA256 |
| --- | --- |
| [low_load_trial.c](arm7-indexed-loads-proof/low_load_trial.c), `unsigned int arm7_low_load_trial(unsigned int index)` | `2c264ddcef93585dbd3f0e938feef537eece386c50f899bf9db1b5aa0df92de1` |
| [high_load_trial.c](arm7-indexed-loads-proof/high_load_trial.c), `unsigned int arm7_high_load_trial(unsigned int index)` | `e6a1f9bb097ff25b1e91c9e14040a90cbebeeb1a0d14248124d116c05a4e0ce8` |

Their bodies return a volatile unsigned word at `(index << 2) + 0x027ffda0u` and `(index << 2) + 0x027ffdc4u`. Volatility, unsigned return/index types, and C ownership remain hypotheses about the original code. The pinned ARM32 compiler provides the word-size context for the trial.

Exactly one current build 82/O4s candidate was attempted per model. The unchanged recipe is `-proc arm7tdmi -nothumb -interworking -nostdinc -O4,s -c`. Exact compiler, Wibo, LLVM and DLL pins and actual argv are retained in [first-compiles.json](arm7-indexed-loads-proof/first-compiles.json) and the owned [recipes](arm7-indexed-loads-proof/recipes.json). No source, declaration, flag or basename variation was attempted.

| Actual object | Bytes | Object SHA256 |
| --- | ---: | --- |
| Lower load | 512 | `f60e827b92c5839f179a1bf32ec1f9a21ec4355f69b4ec31b5b20412e82aea94` |
| Upper load | 512 | `b39081472756bbcee780f3658dd8363f4da07a5bc4f86d3aa3aac3504a8e49c8` |

Each actual object is ELF32 little-endian ARM, flags `0x02100000`, with one global twenty-byte function and matching twenty-byte `.text`, `$a` at 0 only, no data pool and no relocations. All five instruction words and complete text hashes match the independently read originals above. Actual ELF and LLVM readbacks are in the capsule.

## Fixed seven-object native integration

The [agreed design](arm7-indexed-loads-proof/design.md) extends the accepted initializer producer with the two load roles. There are two implementation files: [reproduce.py](arm7-indexed-loads-proof/reproduce.py) compiles the pinned sources and orchestrates replay; [loads.py](arm7-indexed-loads-proof/loads.py) checks the finite original, object, and native artifacts. The [contract](arm7-indexed-loads-proof/contract.json) fixes role order, every source/object hash, recipe, VMA, size, symbol, and relocation.

The ordered roles are lower store, upper store, lower getter, upper getter, lower load, upper load, initializer. The prior five sources, basenames, function names, object pins and recipe choices remain exact accepted copies. Upper store alone retains build 114/O4p. The other six use build 82/O4s. This package owns all seven C inputs, the layout, contract, manifest, both recipes and helpers; it imports no earlier private checkout, object or report.

Native autoload0 consists of opaque original prefix 20228, seven direct actual compiler objects totaling 460 bytes at `[0x037fcf04,0x037fd0d0)`, and opaque original suffix 45432. The former forty-byte bridge at `[d004,d02c)` is supplied solely by `lower_load.o(.text)` and `upper_load.o(.text)`. No bridge object or candidate incbin is present. Original other initialized ranges and both BSS ranges remain separate.

The initializer's twelve actual `R_ARM_PC24` records with addend -8, guard `R_ARM_ABS32` with addend 0, and separate twelve-byte `.exceptix` own-function relocation are unchanged. The native script explicitly discards `.exceptix` metadata and directly links all seven MW objects. The checker reads every actual input hash, numeric map placement, function symbol, boundary, linked instruction and pool byte, final initializer BL word, allocated section and load record. Finite explanatory relocation arithmetic never emits or patches an input object.

All five actual absolute hypothesis bindings remain SUBPRIV=`0x027f9c08`, shared WRAM=`0x0380bc90`, IRQ=`0x400`, SYS=`0x400`, guard=`0x03808430`. All supplied values are checked in actual native output. Their original ownership and lifetime remain unproved.

Own positive native ELF SHA256 is `75ae967dce740ec4e0131c6e5af8e0cd709c04c73f2af9fd6c305230ef81ac4e` for each identity. Both reconstructed 165552-byte ARM7 images equal the complete original SHA256 `0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`. The six actual PT_LOADs retain the finite checked entry, allocated section identities/flags/payloads and 21424 bytes of separate BSS. Native section/file-offset correspondence is checked directly; native ELF offsets are not inferred from original physical loader offsets. All noncandidate bytes remain exact.

Actual controls in both identities pass:

- All seven individual input omissions return LLD 1, with exact selected input pins and argv retained.
- Swapping the two equal-sized load selectors returns LLD 0. Actual lower-load function and map move to `d018`, upper-load to `d004`; fixed-slot LDR words become `e5900dc4` and `e5900da0`. All twelve actual initializer BL targets stay unchanged. Strict readback rejects the reversed lower-load role placement.
- The inherited equal-store swap returns LLD 0. Actual store function/map placements reverse, six store-call targets change, and strict role readback rejects.
- Guard+4 returns LLD 0. All five supplied bindings are checked; strict original-image comparison rejects its only changed stored image byte 21116.
- Initializer placement+4 returns LLD 1 through actual section and boundary checks.
- A negative-only malformed first PT_LOAD file offset+4 rejects section/segment inconsistency.

Swap controls retain actual successful linked artifacts and read their real words, functions and maps before rejection. They stop at strict map placement failure and do not claim full swap-image comparisons.

## Replay and published evidence

Run from the repository root with a new private directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-indexed-loads-proof/reproduce.py NEW_PRIVATE_DIRECTORY
```

The command prints and returns `NEW_PRIVATE_DIRECTORY/trial-proof.json`. Receipt keys are `candidates`, `originals`, and `programs`. Each program has `positive`, `wrong_guard`, `wrong_callee` for store swap, `swapped_loads`, `omitted` with seven roles, `wrong_placement`, and `malformed_load`. Failed runs create no completed receipt. The committed [trial-proof.json](arm7-indexed-loads-proof/trial-proof.json) records own actual results.

Run the tests from the repository root:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-indexed-loads-proof -p 'test_*.py' -v
```

The six tests consume fresh actual compiler/native artifacts without a hidden fixture. They were observed red before implementation and now pass. They check both originals, seven roles/maps/functions/bytes and input omissions, real load-swap words/maps with unchanged calls, real store-swap changed calls, guard, placement and malformed output. The [evidence manifest](arm7-indexed-loads-proof/evidence-pins.json) pins Git-owned public inputs and artifacts. External read-only inputs are only original ROM and pinned tools. No ROM, extracted binary, compiled object, native ELF or cache is committed.

This closes the finite two-load compiler and collective native-link trial. Original source ownership, original ABI and runtime feasibility remain the next evidence barrier. No original source bytes, names, types, function extents, or SDK identity are promoted.
