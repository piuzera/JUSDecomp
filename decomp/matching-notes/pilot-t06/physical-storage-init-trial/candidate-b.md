# Candidate B: fixed offsets into caller-owned storage

## Usage (caller's view)

After the separately recorded trial release, the capsule exposes one operation:

```python
from pathlib import Path
from reproduce import replay

receipt_path = replay(Path('/private/tmp/t06-storage-own-replay'))
```

The CLI calls the same `replay(Path(argv[1]))`; an acceptance test calls it with a new temporary directory and reads the resulting receipt, raw object, DSD reference object, linker map, linked ELF, module image and ROM. The directory must be absent. A strict miss returns a measured rejection receipt and ends this one model/recipe trial. A successful receipt requires the complete fresh native and ROM checks. Callers supply neither storage offsets nor compiler/link options.

## Problem and observed contract

Accepted .36 fixes the original ARM9/main `func_0202c4ac` to one 92-byte extent: 84 instruction bytes, an 8-byte pool, and exactly four RELAs. Incoming `r0` is writable preallocated storage, `r1` is key, `r2` is optional label. The machine writes words at `+0` (address of `data_02098708`), `+4` (zero), `+8` (key), `+0xc` (label if nonzero, else key), then halfwords at `+0x10` and `+0x12` from two ordered opaque `func_020326b0` calls. It increments the unsigned word at `data_020a0c34+0x30c` modulo 2^32 and returns incoming storage. The highest write ends at `+0x14`; the trial assumes at least 20 writable bytes and 4-byte alignment for word/pointer accesses. This is a physical C model, with no allocation, null-failure policy, original C++ type, or original source-ownership claim.

The accepted original raw object is `_dsd_gap@main_5.o`; the target begins at section offset 181420 inside that larger object. Directly comparing or replacing that whole gap object with one 92-byte compiled TU would discard unrelated code. The native route is therefore conditional on a fresh **research-only DSD complete-TU split**, not on slicing or rewriting the old object after extraction.

## Shape: source and types

The frozen source model is one ordinary C function with a byte-addressed view of the incoming storage. It declares only the observed numeric external symbols. Its ordered operations use fixed typed accesses at the six offsets above, call the same opaque helper first with key and then with the selected label, update the unsigned counter, and return the incoming pointer. No aggregate record type or global view models unknown object fields. The source filename is `decomp/src/main/arena_storage_init_trial.c`, the research DSD TU identity is `src/main/arena_storage_init_trial.o`, and the emitted function label is `func_0202c4ac`. These labels are link identities only. The trial declarations are 32-bit word/16-bit halfword, pointer-sized key/label, opaque helper result used only in its low 16 bits, and symbols `func_020326b0`, `data_02098708`, `data_020a0c34`; they do not assert original language types. The C body remains unwritten until release.

```c
/* Planned trial-only declaration; implementation intentionally absent. */
void *func_0202c4ac(void *storage, const char *key, const char *optional_label);
```

The one existing Main recipe is MW `2.0/base` (build114, executable SHA-256 `7150fa4f…9222880`) under Wibo SHA-256 `2b3000ef…77fd3cf7`, with `-proc arm946e -Cpp_exceptions off -nostdinc -O2`. No headers, register hints, volatile hints, inline assembly, aliases, static storage, ordinary `new`, or second compiler context enter the model. The original numeric relocations remain:

| Target-relative offset | Type | Symbol | Addend |
| ---: | --- | --- | ---: |
| 40, 52 | `R_ARM_PC24` | `func_020326b0` | -8 |
| 84 | `R_ARM_ABS32` | `data_02098708` | 0 |
| 88 | `R_ARM_ABS32` | `data_020a0c34` | 0 |

The existing source shell uses these private types and signatures; none is a public stage API:

```python
@dataclass(frozen=True)
class _ReferenceTU:
    path: Path                 # Fresh DSD output, not a saved gap-object slice.
    sha256: str
    object_name: str           # src/main/arena_storage_init_trial.o

@dataclass(frozen=True)
class _TrialInputs:
    source: Path               # Package-owned, frozen after design release.
    reference: _ReferenceTU
    compiler: Path
    runner: Path
    original_rom: Path

def replay(fresh_output: Path) -> Path:
    """Own pins, reference extraction, one compile, strict gate, conditional native proof."""
    raise NotImplementedError

def _extract_reference(output: Path) -> _ReferenceTU:
    """Use pinned original ROM and unchanged DSD in an isolated research root.

    Add one complete `.text start:0x0202c4ac end:0x0202c508` TU declaration
    to copied research metadata, leaving published delinks/config untouched.
    Require the fresh raw reference TU to contain only the target's 92-byte
    initialized extent, one ARM function and the four original RELAs.
    A failed split is a named blocker before source compilation.
    """
    raise NotImplementedError

def _one_compiler_trial(inputs: _TrialInputs, output: Path) -> dict:
    """Run one build114/-O2 C model and unchanged strict whole-TU comparator."""
    raise NotImplementedError

def _native_if_exact(inputs: _TrialInputs, trial: dict, output: Path) -> dict:
    """Only an exact raw-object match may enter isolated unchanged native APIs."""
    raise NotImplementedError
```

## Module map and traced existing route

`reproduce.py` owns the sole public replay, fixed recipe/dependency pins, fresh directories and terminal receipt. `physical.py` owns the accepted original contract, isolated complete-TU extraction and exact gate, then the conditional live native/ROM readback. The future C file and finite metadata manifest are package inputs, not another behavior layer. No source model or generated reference object is part of this design-only artifact.

The current publisher APIs were inspected through the code graph and checked against `/private/tmp/jus-track-a-publish/tools/scripts`:

1. `verify.prepare_config(root, output, expected)` copies the isolated ARM9 metadata and validates the expected 17-module layout, while deliberately stripping TU declarations from its whole-module reference config. After DSD extracts the original ROM and delinks that reference config, `verify.prepare_source_config(root, output, manifest)` copies it into `candidate-config` and appends the single complete declaration from the isolated root. It requires a complete DSD TU block in `root/decomp/arm9/delinks.txt`, a `decomp/src/...` relative source path and the matching `src/... .o` identity. The unchanged DSD `source_delink` on `candidate-config` must freshly emit the separate 92-byte reference TU in `candidate-delinks` before any compile. The published metadata remains untouched; a source TU cannot be manufactured by slicing an ELF.
2. `compiler_experiments.run_experiments(manifest, root, reference_dir, tool_root, runner, output)` can take a singleton unit, compiler and context. It invokes `source_build.compare_objects(reference, compiled, ["func_0202c4ac"])`. That comparator requires equal allocated-section inventories, full function names/extents/modes, exact relocation identities/offsets/types/symbols/addends and initialized bytes with only actual relocation slots masked. The trial pins the newly extracted reference digest before compiling. A missing/extra BSS, pool/extent difference, unexpected helper/section or byte difference is a terminal nonmatch; `mismatch_offsets` is diagnostic only.
3. If the raw whole-TU comparison passes, `verify.verify(rom, fresh_output, dsd, lld, clang, root=isolated_research_root, source_manifest=singleton_research_manifest, source_compiler=build114, compiler_runner=wibo)` reruns the same fixed source and unchanged source/native/ROM gates in that research root. `source_build.build_sources(...)` checks the raw object; `native_link.prepare_objects(lcf, reference_dir, object_dir, overrides)` selects the compiled override only by its unique LCF basename and records both raw and canonical-normalized hashes. `verify_source_ownership(...)` binds that selected object to the map and linked ELF; direct module comparison and `rom_roundtrip.roundtrip_rom(...)` check all 17 module payloads and the 67,108,864-byte ROM against the original. The existing normalizer may adjust ELF metadata as it always does; this design supplies no custom instruction patch or section deletion. Record actual raw object, selected input, map extent/symbol, linked target bytes and final ROM hash.

The split itself is the concrete seam risk. If unchanged DSD/config APIs do not emit a complete 92-byte TU while preserving the rest of main, `compare_objects` against `_dsd_gap@main_5.o` is invalid and the native override would remove unrelated bytes. Stop and report this blocker; do not synthesize a sliced reference ELF, weaken comparison, or replace the whole gap object.

## Rationale and alternatives

The byte-addressed storage view makes only the six observed writes visible in C. It hides no unknown tail behind a guessed record or class, and one replay hides extraction, raw ELF comparison and conditional native proof from callers. The design accepts alignment and effective-type assumptions for this physical C trial in exchange for a small source shape; they are checked against actual emitted code, not promoted to original ABI facts. It accepts a research-only complete-TU metadata copy to use existing strict gates without touching canonical files. The reference contract stays independent of the candidate source, so a source change cannot rewrite its own oracle.

An explicit 20-byte C record plus a named global view is the structurally distinct alternative. It gives field names and compile-time `offsetof` checks, but those names and the record boundary imply more type knowledge than the physical evidence grants. It can be a viable competing sketch; this candidate chooses fixed offset accesses because the caller already supplies opaque storage. Replacing the entire original DSD gap object with the small compiled object is rejected: `prepare_objects` overrides by whole LCF basename, so it would remove unrelated code. A custom per-function comparison against the gap object is rejected because it bypasses the unchanged whole-TU gate. A compiler matrix is rejected because this scope freezes one model and one build114/-O2 context.

## Evidence gate, tradeoff and next step

Before source implementation, write a failing actual-artifact test for the isolated DSD split and singleton strict comparison. Controls must demonstrate rejection for source/tool pin changes, wrong 92-byte extent, extra allocated section, wrong pool/bytes and each of the four RELA identities/addends. A passed raw comparison alone is not promotion: native proof must check the actual override/map/symbol/function and every full module/ROM result. Publication uses a fresh output, pinned owner ROM/tools/repository inputs, root and independent replay and strict committed Git plus established LF/CRLF input ownership. Canonical 304 bytes, ARM7 source zero, global readiness unknown and T06/T10 open remain recorded.

After root synthesis and release, first prove the fresh research-only DSD split with tests. If it fails, publish the exact gap-object/reference mismatch and stop this experiment before writing or compiling the C source.
