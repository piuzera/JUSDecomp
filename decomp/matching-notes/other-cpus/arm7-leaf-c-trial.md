# Bounded ARM7 store C trial

The plain C hypothesis in [store_trial.c](arm7-leaf-c-trial-proof/store_trial.c)
compiles to the exact 20 original bytes at `[0x037fcf18,0x037fcf2c)` in both
the parent and `ChildRom/JSS2Child.srl` programs. The established ARM7 recipe
with `-O4,p` produces the match. The same source under the baseline recipe
produces a 36-byte body with stack spills and does not match.

This is an exact bounded trial, with zero source credit. It does not establish
the original symbol, full ABI, source ownership, function extent, compiler,
runtime execution, or original link contract. The canonical source count remains
304, ARM7 source credit remains zero, and T10 stays open.

## Why only this candidate was tried

The preceding [branch grounding](arm7-branch-literal-grounding.md) found three
call frontiers. Read-only [triage](arm7-leaf-c-trial-proof/triage.json) selected
only `0x037fcf18` for this trial. Its checked 32-byte observation has a five-node
root-relative path ending at `BX lr`; instructions beginning at `0x037fcf2c`
are not reached by that selected path. A separately checked predecessor at
`0x037fcf14` is `BX lr`, and the selected caller has a direct BL to `0x037fcf18`.
The other two triaged targets retain unresolved branches and are not C trials.

These observations justify testing a 20-byte candidate, while unseen incoming
branches and shared tails remain unexcluded. The candidate is not an approved
original function boundary. Triage source revision is
`71e766e562c78d4b0ec404b3b4edbe242a8d1b0f`, tree
`75215439eec429f6dd82df8a9f49bba054a16839`, with frozen reachable producer SHA256
`28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff`.
The supplied triage metadata SHA256 is
`bc8ee39a731209b5a6158f6b2099d3c6ee5ff5a50579938dae9d5d272e374f42`.
The [packaged triage inputs](arm7-leaf-c-trial-proof/triage/) retain all five exact
probe reports and their five matching request sidecars. The trial script reads
them beside its own committed triage metadata, rechecking every report hash and
request digest. Their names and pins remain in
[trial-proof.json](arm7-leaf-c-trial-proof/trial-proof.json).

## Source hypothesis and original register facts

The entire header-free hypothesis is:

```c
void arm7_store_trial(unsigned int index, unsigned int value)
{
    *(volatile unsigned int *)(0x027ffdc4u + (index << 2)) = value;
}
```

`arm7_store_trial` is an invented trial name. Unsigned 32-bit integers, a
32-bit pointer, the volatile word store, and a void return are explicit C
hypotheses. Unsigned integer address arithmetic preserves the observed shift
and addition without introducing an array or an array-extent claim. The source
uses no headers, assembly, register bindings, or source-symbol substitution.
Its SHA256 is
`a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb`.

At the observed caller, `0x037fd050` copies the prior call's `r0` to `r1`,
`0x037fd054` sets `r0` to 1, and `0x037fd058` calls `0x037fcf18`. The candidate
shifts `r0` by two and stores `r1` as a word. It uses no stack, call, or literal
pool in the selected 20 bytes. The caller then overwrites `r0` at `0x037fd05c`,
so this caller does not prove the candidate's return type. The original value
supplied through `r1` still depends on the prior callee's return state.

## Original bytes and external store dependency

The original ROM SHA256 remains
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.
The separate child identity retains that parent-ROM digest, `nitro_fs` path
`ChildRom/JSS2Child.srl`, and program SHA256
`1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986`.
Independent FNT traversal confirms FAT file 79 at `[0x23b800,0x4464c8)`.
Each original header, image digest, module parameters, and loader table is
checked against [arm7-checked-layouts.json](arm7-checked-layouts.json), SHA256
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.

The candidate starts at stored ARM7 image offset `0x50c8`. Both original
20-byte reads have SHA256
`1286c0f7baaf3678f915ee9ef9830ab1a2243c5ea8d41e2a75c0b14fa35eaebe`.
The two exact program identities remain separate in the proof. LLVM ARMv4T
disassembly of the original words agrees with the optimized trial:

| Address | Original word | Instruction |
| --- | --- | --- |
| `0x037fcf18` | `0xe1a00100` | `lsl r0, r0, #2` |
| `0x037fcf1c` | `0xe2800627` | `add r0, r0, #0x02700000` |
| `0x037fcf20` | `0xe2800aff` | `add r0, r0, #0x000ff000` |
| `0x037fcf24` | `0xe5801dc4` | `str r1, [r0, #0xdc4]` |
| `0x037fcf28` | `0xe12fff1e` | `bx lr` |

Under the caller's index-1 assumption, the effective store address is
`0x027ffdc4 + (1 << 2) = 0x027ffdc8`. It lies outside every checked ARM7
startup/autoload initialized and BSS range. In particular, autoload1 initialized
bytes end at `0x027f82a0` and its BSS ends at `0x027f9c08`. This is an external,
unmapped dependency under the checked module layout. No original ROM value,
BSS ownership, runtime device meaning, or safe memory access is assigned to it,
and its contents were not read. Other index values also require their own runtime
address interpretation.

## Exactly two established recipes

The pinned compiler is
`/private/tmp/jus-track-a/tools/mwccarm/2.0/base/mwccarm.exe`, SHA256
`7150fa4fe4cb6db6867ac530ec1a0754f6ca4df92868d963a7875196f9222880`.
The pinned runner is `/private/tmp/jus-track-a/tools/wibo/wibo-macos`, SHA256
`2b3000ef6a7a490c24ccd71967735ae0005e218922e51806cca1b8d77fd3cf7c`.
The proof also pins the three adjacent compiler DLLs and rechecks all inputs
after compiling. Frozen tools and DSD source/cache were read only.

Both recipes use `-proc arm7tdmi -nothumb -interworking -nostdinc -c`, as in the
established [CPU-policy probe](cpu-policy-probes.json). The second recipe adds
only `-O4,p`, already used by the [compiler experiments](../compiler-t04/README.md).
That optimization flag is a justified existing trial setting, not evidence of
the original ARM7 compiler flags. No further flags or source variants were tried.
The script uses fresh private outputs and retains the exact argv for each recipe.

| Recipe | Actual function bytes | Byte comparison | Object SHA256 |
| --- | ---: | --- | --- |
| baseline | 36 | mismatch | `182ebed8e905dd0b2b1eb363d0efefa7864e03ded84db7c1804110c1eea52bff` |
| baseline plus `-O4,p` | 20 | exact in both programs | `03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf` |

The baseline text SHA256 is
`5f8e8cf1dcfb58428f87657c0d7ccf4c75a4aa2dae28e442b0178a04cf22c353`.
It pushes `r0` through `r3`, reloads `r1` and `r0` from the stack, performs the
same shift/add/add/store sequence, adjusts `sp` by 16, and executes `BX lr`.
The stack operations change the complete body and its extent. Its indexed byte
comparison differs at all positions, including its 16 extra bytes.

The optimized body has no register or constant difference from the original
five words. It uses `r0` for the shifted address, `r1` for the stored word, the
same two ADD immediates and STR offset, and `lr` for the final exchange. Its
compiled code SHA256 equals the original 20-byte digest above. Fresh reruns of
both recipes reproduced the same complete object hashes.

## Actual ELF readback and reproducible proof

Both objects are actual ELF32 little-endian ARM relocatables, with numeric ELF
flags `0x02100000`. Each has one global `FUNC` symbol named `arm7_store_trial`
at offset 0 in `.text`, with section flags `ALLOC|EXECINSTR` and alignment 4.
The sizes are 36 and 20 bytes. The local `$a` mapping symbol identifies ARM
mode; neither object has a `$t` or `$d` mapping. Function bytes consume the
entire `.text` section. Both objects have zero relocation sections and entries.
The optimized text contains exactly the five instruction words above, with no
additional pool bytes. These properties describe the compiled trial objects,
not an original ARM7 symbol table or link contract.

[reproduce.py](arm7-leaf-c-trial-proof/reproduce.py) independently parses each
actual ELF header, section table, symbol, mapping, and relocation state. It also
runs native LLVM `llvm-readobj` and `llvm-mc --disassemble --triple=armv4t-none-eabi`.
The committed [trial proof](arm7-leaf-c-trial-proof/trial-proof.json) retains
source/tool/DLL pins, full identities, checked original reads, exact recipes,
object and compiled-byte pins, symbols/sections/modes, relocations, mismatches,
triage receipt hashes, and the zero-credit claims.

The proof script was run from its published package against fresh private
directory `/private/tmp/jus-arm7-leaf-worker-proof/reproduced-closed`. That
directory retains the objects and compiler logs. The script consumes its own
published C source and packaged triage metadata, reports, and requests. No
private triage directory is required. The committed original and compiled LLVM outputs
and ELF readbacks are metadata only. No object, extracted binary, ROM, canonical
source change, or build output is committed. Scoped attributes preserve literal
LLVM/readback LF bytes. Reproduction accepts a new output directory:

```sh
python3 decomp/matching-notes/other-cpus/arm7-leaf-c-trial-proof/reproduce.py \
  /private/tmp/jus-arm7-leaf-independent-reproduction
```

The pinned compiler, runner, adjacent DLLs, original ROM, checked layout, and
native LLVM tools remain external read-only prerequisites at the recorded paths.
All trial source and triage provenance inputs are present in the published package.

## Remaining promotion barriers

The byte match proves that this source and pinned recipe can reproduce the
candidate bytes. It does not identify the original source or compiler. Original
entry/extent ownership, unseen incoming control flow, the full ABI and return
type, and original symbol/link metadata still need independent evidence.

The store's external address contract is also unresolved. Its interpretation
requires runtime memory ownership beyond the checked ARM7 modules, and the
stored value requires the preceding callee's ABI and return-state evidence.
`BX lr` still needs register and mode assumptions to describe a runtime return.
No approved source adapter or canonical ARM7 source path exists for this trial.
Those gates remain open despite the exact bytes; this C file grants zero source
credit and does not complete T10 or the ARM7 binary baseline.
