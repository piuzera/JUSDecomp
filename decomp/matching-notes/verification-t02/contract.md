# Strict native baseline verification contract

`tools/scripts/verify.py` requires intake, tool versions, configuration, extraction,
delinking, linker-script generation, native linking, actual link-input provenance,
dsd module checking, dsd symbol checking, direct ROM comparison, relocation
validation, and freshness checks. Missing, skipped, failed, or unresolved evidence
cannot produce a passing report.

The ROM SHA-1 and SHA-256 must match the pinned manifest before extraction.
Tool hashes and versions must match the lock file. Source, tool, and ROM hashes
must stay unchanged throughout the run. Output starts in a new directory;
generated link artifacts cannot be symlinks or predate the run.

The declared target set is ARM9 main, ITCM, DTCM, and overlays 0 through 13.
All 17 initialized payloads, load addresses, and BSS extents match the original
ROM. Overlays 9 and 13 remain separate targets despite identical zero payloads.
The current baseline has 15 binary-backed reference objects and zero
reconstructed source coverage. ARM7, the embedded Download Play program, and
full-ROM packing remain unfinished.

`native-link/link-inputs.json` records the actual lld command and each input
hash. The verifier checks those inputs against the generated LCF, fresh original
objects, normalized objects, and attributes object. The raw native `linked.elf`
is the relocation-check input. The separate `dsd-check.elf` changes diagnostic
metadata for dsd's old symbol checker.

## Relocation scope

`relocation_check.py` supports the original dsd ELF32 ARM RELA forms `ABS32`,
`PC24` direct B or BL, and Thumb1 `PC22` BL or BLX. It preserves signed addends
and matches relocation sections through `sh_info`. Branch checks require the
original destination, module identity, and ARM or Thumb mode. A different
destination fails even when its code is identical.

The checker validates ELF table links, entry sizes, and file-backed extents.
Unsupported forms, veneers, and REL entries remain unresolved. Placement is
bounded to one original gap object per module. More objects require evidence
for each object's section placement and currently remain unresolved.

The canonical result validates 87,493 slots: 32,552 `ABS32`, 31,038 `PC24`, and
23,903 `PC22`. Zero slots fail or remain unresolved. Exact pinned totals and type
counts are required; a partial passing result cannot satisfy verification.

One original source mapping needs the enclosing function's mode. At
`0x0215573e` in overlay 7, a stale `$d` literal-pool marker covers a valid Thumb
call inside `func_ov007_021553a0`. The checker uses the confirmed function mode
only for missing or data mappings and records every use in
`source_mode_fallbacks`. Explicit ARM or Thumb conflicts still reject.

## Regression coverage

The suite rejects a skipped linker, failed subprocess, missing module, stale
output, wrong ROM, changed input or tool hash, altered actual link inputs,
wrong relocation destination, wrong call mode, and same-address overlay
confusion. It also rejects malformed ELF tables and unsupported multiple-object
placement. Synthetic ARM-to-Thumb and Thumb-to-ARM cases cover direct
interworking. Fixtures contain no game payloads.
