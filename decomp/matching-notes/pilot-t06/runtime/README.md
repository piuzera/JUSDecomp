# Runtime pilot: exception-table bounds

This source remains an **unpromoted candidate**. Its object matches, but the first
complete link fails a distinct cross-object metadata check. Production keeps the
existing trampoline manifest and gains **zero runtime source bytes**.

The ordinary C candidate for `__FindExceptionTable` covers the published ARM9/main
range `0x0200f57c..0x0200f59c`: 24 instruction bytes and eight literal-pool bytes.
It sets the two observed context fields at offsets 12 and 16 to the linker-provided
exception-table bounds, preserves the preceding words, and returns one. No original
instruction array, assembly implementation or instruction patch is used.

The identity is backed by the unique exact ARM recognizer in pinned
[ds-decomp exception.rs](https://github.com/AetiasHax/ds-decomp/blob/9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe/lib/src/analysis/exception.rs).
This evidence supports the lookup identity and literal offsets; it does not identify
the original compiler release. The eight-target pilot list was published before
source work. The C++ class portion remains unresolved and gains no credit here.

## Metadata preflight

Pinned dsd `fix find-exceptix --dry` was run against an isolated copy before source
was written. It found no exception records and no exceptix entries. Both canonical
relocations and original raw ELF already contained the two ABS32 slots, with zero
addends, to `__exception_table_start__` and `__exception_table_end__`.
Applying the fix to a second private copy produced 30 line-ending-only changes and
**zero semantic changes**. No canonical symbols or relocations were changed, no
new slots were added, and the original inventory remains **87,493** slots.
[metadata-fix.json](metadata-fix.json) records commands and log hashes.

A fresh reference-only pipeline passed all 17 module checks, symbols, direct
ROM comparisons, every relocation, and the complete ROM roundtrip before the
source experiment. The two table bounds both resolve to `0x0208c5e4`, the existing
empty `.exceptix` boundary. Distinct relocation identities are retained even
though these numeric addresses coincide.

## Source and compiler evidence

The source models only the observed 20-byte context prefix. Three words remain
unnamed and unchanged; the two trailing fields are pointers. Compile-time checks
require four-byte words, four-byte pointers and a 20-byte prefix. A native
64-bit compile is intentionally rejected by those checks. ARM32 compilation passes.
No base-class layout or unrelated runtime context field is inferred.

The bounded experiment used the already-pinned `mwccarm/2.0/base` package,
reported version 3.0 build 114, through Wibo 1.2.0. Seven initial contexts were tried:
default optimization, O0, O1, O2,p, O3,p, O4,p and O4,s. Default and O0 produced
different function extents. The remaining contexts matched the loads, stores and
pool identities but emitted a different return instruction. The compiler's own
`-help all` documents `-[no]interworking`. Enabling it made all five optimized
contexts pass the complete source-object comparison, including both relocations.

The selected TU context is `-Cpp_exceptions off -nostdinc -interworking -O2,p`
with `-proc arm946e`. No includes are consumed. The global compiler binary remains
unchanged, so no per-TU tool-selection extension is needed. These five equivalent
matches establish a usable context, not unique original compiler provenance.
[compiler-trials.json](compiler-trials.json) pins the source, tool hashes, ABI,
flags, commands and object checks. Raw reference and compiled objects stay private.

Tests use invented public ELF fields to show that equal pool words cannot hide a
changed endpoint symbol and that a changed nonrelocated return constant is not
masked. A real private-tool test compiles the unchanged source and two ordinary C
mutants. Changing the return value fails the byte check; changing the end symbol
fails the relocation check. The original reference object's hash remains unchanged.

## Link boundary evidence

The first source pipeline passed both TU object gates and selected the compiled
runtime object as an actual linker input. Its full 32-byte runtime region matched.
The ARM9 checksum nevertheless rejected five distant differing bytes. Independent
relocation validation identified exactly three Thumb calls at `0x02066762`,
`0x020667c0` and `0x02066806` that reached `0x0200cf14` in Thumb state instead of
ARM state. The defined `.L_0200cf14` label and its branch references were separated
into different raw delink objects by the new TU boundary. Per-object normalization
missed the definition's function type. The strict pipeline awarded zero source
credit to that failed run. This evidence requires a checked cross-object metadata
fix; changing runtime instructions would not resolve it.

[pipeline-proof.json](pipeline-proof.json) preserves the successful reference
pipeline, failed source pipeline and independent three-slot relocation failures.
The candidate manifest and exact TU declaration are saved alongside it. The
coordinating agent encountered model capacity before the shared-linker fix could
be assigned. Worker scope excludes edits to that shared implementation; no parent
model retry or speculative promotion was made. A resume must fix and test the
cross-object metadata propagation, then run the complete source pipeline again.
The C++ family remains open independently. Source-object matching alone never
grants source credit.

## Reproduce

Use a disposable worktree to activate the candidate metadata, with the pinned
public tools and the private owner ROM. These candidate declarations must stay
outside the production manifest until the complete source pipeline passes:

```sh
git worktree add --detach /private/tmp/jus-runtime-reproduce HEAD
cd /private/tmp/jus-runtime-reproduce
cp decomp/matching-notes/pilot-t06/runtime/candidate-main-delinks.txt decomp/arm9/delinks.txt
python3 tools/scripts/verify.py \
  --rom /Users/djdjo/Documents/mine/rom/jus.nds \
  --output build/runtime-reference-reproduced \
  --dsd /private/tmp/jus-track-a/tools/dsd/dsd-macos-arm64 \
  --lld /opt/homebrew/bin/ld.lld \
  --clang /opt/homebrew/opt/llvm/bin/clang
python3 tools/scripts/verify.py \
  --rom /Users/djdjo/Documents/mine/rom/jus.nds \
  --output build/runtime-source-reproduced \
  --dsd /private/tmp/jus-track-a/tools/dsd/dsd-macos-arm64 \
  --lld /opt/homebrew/bin/ld.lld \
  --clang /opt/homebrew/opt/llvm/bin/clang \
  --source-manifest decomp/matching-notes/pilot-t06/runtime/candidate-source-manifest.json \
  --source-compiler /private/tmp/jus-track-a/tools/mwccarm/2.0/base/mwccarm.exe \
  --compiler-runner /private/tmp/jus-track-a/tools/wibo/wibo-macos
python3 -m unittest discover -s tests/matching -p test_exception_table.py -v
```

Outputs must be fresh and ignored. Set `JUS_RUNTIME_COMPILER`,
`JUS_RUNTIME_RUNNER` and `JUS_RUNTIME_REFERENCE` to the pinned compiler/runner
and the generated `candidate-delinks/src/runtime/find_exception_table.o` to run
the real source-mutant regression as well.
