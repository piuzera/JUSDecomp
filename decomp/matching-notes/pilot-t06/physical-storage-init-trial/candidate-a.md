# Candidate A: physical record and original counter view

Design only, frozen against publisher `a7bb98ca941d525df862e9bfb0fc4be235f49014`. No implementation file, compiler invocation, shared metadata edit, or trial release is included.

## Usage, caller first

The proposed public interface is `replay(fresh_output) -> TrialReceipt`. The capsule owns the one source, recipe, original symbol bindings, owner-ROM identity and external tool pins. There is no model selector, flags override, reference-cache selector or promotion option. Existing output is rejected before writes. A repeat requires another fresh output path with identical frozen inputs.

Three real caller usages constrain the signature. These are observed-use sketches, not new caller implementations:

- Main `02021080` supplies already allocated, zero-guarded 20-byte storage, original key `data_0209d544` and label `data_0209d5a4`. The caller subsequently replaces its table pointer and registers retained storage.
- Main `0206c40c` supplies already allocated, zero-guarded 40-byte storage, key `data_0209e280` and label `data_0209e26c`. This initializer accesses only the first 20 bytes; the caller initializes remaining fields.
- Ov012 `021b0868` forwards incoming storage/key/label unchanged. Its wrapper supplies no allocator or ownership promise. The call to main is grounded by original RELA and ROM instruction decoding, not numeric aliasing.

Zero label means retain the key as the label field and second helper input. It does not make null key/storage valid. Return is exactly incoming storage. No caller changes are proposed.

## Problem

Task36 establishes 84 ARM instruction bytes plus an 8-byte pool, full 92 bytes, with four named RELA records. That grounds a physical initializer on supplied storage, not an original C++ class. This experiment asks whether one ordinary C model can reproduce the whole original TU and, conditionally, prove actual native object consumption and full ROM agreement through unchanged existing APIs. A measured miss ends this model without tuning.

## Shape

The following declarations are a sketch only. The function body is not implemented.

```c
/* Header-free C type/signature sketch; not an implementation file. */
typedef unsigned int Word32;
typedef unsigned short Half16;
typedef struct Storage20 {
    const unsigned char *table; /* +00: address, no C++ vtable class type */
    Word32 zero_word;           /* +04 */
    const char *key;            /* +08 */
    const char *label;          /* +0c */
    Half16 key_code;            /* +10 */
    Half16 label_code;          /* +12 */
} Storage20;
typedef struct OriginalCounterPrefix {
    unsigned char unknown_prefix[0x30c];
    Word32 count_30c;
} OriginalCounterPrefix;
extern const unsigned char data_02098708[];
extern OriginalCounterPrefix data_020a0c34;
extern Word32 func_020326b0(const char *input); /* opaque implementation */
Storage20 *func_0202c4ac(Storage20 *storage, const char *key, const char *label);
/* Body not implemented. */
```

The type view owns no storage. Both original data names are undefined external symbols in this TU. The prefix struct expresses only the observed counter at `+30c`, not the original global's recovered size/type. A `.c` TU gives exact original C linkage names. No aliases, `restrict`, packing, semantic argument reordering, register/volatile hints, inline assembly, lifetime machinery or new null guards are proposed.

Body pseudocode, not source implementation: write original table, zero word, key and selected label-or-key; call opaque helper using the current stored key and write the low halfword; read the current stored label after that call, call helper again and write its low halfword; increment the original unsigned 32-bit counter through the prefix view; return original storage. The field read after the first opaque call preserves observed access order without asserting helper purity or alias restrictions. Unsigned word arithmetic expresses modulo `2^32`.

Fix the ABI/layout gate before implementing: pointer/word/halfword widths 4/4/2; record size 20; member offsets 0/4/8/12/16/18; counter offset `0x30c`. Callers supply ordinary 4-byte-aligned storage with at least 20 writable bytes and valid zero-terminated strings. This explicit model precondition adds no runtime guard. Header-free compile-time typedef width/size/offset checks use the existing technique in `decomp/src/main/common_effect_construct.cpp:11` and `class/single_member.cpp:15`. They emit no initialized bytes or additional function. Checked offsets and widths place word and halfword accesses at aligned offsets. No complete original global layout is claimed.

Proposed Python signature: `replay(fresh_output: Path) -> TrialReceipt`, body not implemented. Receipt exposes outcome `exact_and_rom`, `measured_rejection` or `blocked`; model/recipe/reference/compiled digests; actual verifier report; whole-TU section/function/RELA and byte differences; optional native/ROM evidence; added canonical source bytes fixed at 0. A miss has no native success receipt. Provenance, control or unsupported-format failure is blocked, never passed. A completed experiment does not imply object acceptance.

## One frozen recipe

MW `2.0/base`, build 114, CPU `arm946e`, exact flags `['-Cpp_exceptions', 'off', '-nostdinc', '-O2']`, ordinary C via `.c`, empty headers/includes/forced headers, pinned compiler defaults, little endian, ARM mode, pointer bits 32. The same CPU/flag recipe is present in main class/constructor and external-constructor capsules; the C language and exact numeric C symbol binding are the new model, not recovery of original source language. Compiler SHA256 `7150fa4fe4cb6db6867ac530ec1a0754f6ca4df92868d963a7875196f9222880`; Wibo SHA256 `2b3000ef6a7a490c24ccd71967735ae0005e218922e51806cca1b8d77fd3cf7c`. Bind actual existing package `.exe/.dll` inventory and three runtime DLL pins before release. Do not add `-nothumb`, interworking or another optimization choice after a miss.

## Tiny module map

| Owner | Knowledge |
| --- | --- |
| New capsule `physical_initializer.c` | Physical fields, exact original bindings, one released body. |
| New capsule recipe/dependency JSON | One model/recipe, original 92-byte identity, finite source/tool/helper/metadata pins and external input locators. |
| New capsule `replay.py` | Freshness, actual red controls, isolated research-root derivation, unchanged verifier call and receipt. One public entry point. |
| Existing source/link/verify helpers | Strict object comparison, diagnostics, actual selection/ownership and whole-ROM readback. Unchanged. |

This boundary hides integration decisions behind one operation. It adds no registry or wrapper per stage. Each replay owns its output tree; parallel runs cannot share writable state.

## Actual API trace

Discovery in graph project `JUSDecomp-verification` found all six requested existing functions. Snippets for `compare_objects`, `build_sources` and `prepare_source_config` were checked against actual publisher files. The initial wrong-project query is not evidence of missing graph coverage. No `matched_sources` or `source_matrix` API exists in the inspected publisher; the real recipe/diagnostics engine is `compiler_experiments`.

1. `verify.expected_modules(regions)` at `verify.py:181` supplies 17 modules. `verify.prepare_config(root, output, expected)` at279 copies original ARM9 metadata, fixes output paths and strips source selections. DSD `rom extract` and `delink` produce 15 original objects. Recheck original ROM header/main identity, task36 inventory digest,92-byte payload and both pool words directly. No saved private ELF is authoritative.
2. A new private research-root snapshot alone receives a complete `src/main/physical_initializer.c` declaration with `.text start:0x0202c4ac end:0x0202c508` and the released source at `decomp/src/main/physical_initializer.c`. `verify.prepare_source_config(root, output, manifest)` at308 requires that complete declaration in the research root's `decomp/arm9/delinks.txt`, matching source/object path identity and module `main`; it copies original config to `candidate-config`, appends that block and selects `candidate-delinks`. A free-floating capsule source cannot use this API. Publisher metadata stays read-only.
3. `source_build.build_sources(manifest, root, output, reference_dir, compiler, runner)` at217 validates TU compiler/ABI/header context, removes inherited MWC/MWARM environment, compiles one fresh object, records actual command/hash, rejects missing/symlink output and mutation, then calls `compare_objects(reference, compiled, functions)` at183. Rejection returns failed/unresolved, zero accepted units and no selected objects. The new capsule does not change this API.
4. `compare_objects` checks complete allocated sections/type/flags/size, defined functions/extent/mode, and exact named RELA before masking relocated fields. Require sole ARM `func_0202c4ac` at TU offset0, full extent92 including pool, original full section inventory, no additional allocated state/functions. RELA offsets `0x28`/`0x34` are PC24 type1 to `func_020326b0`, addend-8; offsets `0x54`/`0x58` are ABS32 type2 to `data_02098708`/`data_020a0c34`, addend0. The fresh original delinked TU is section-inventory authority. No section deletion or comparison relaxation.
5. Public replay invokes unchanged `verify.verify(rom, output, dsd, lld, clang, root=research_root, source_manifest=research_manifest, source_compiler=compiler, compiler_runner=runner)` at386. Its source-build stage performs step3 once. On rejection, `record_stage` retains the builder result in the stage report, raises and stops before linking. Read that result and use `compiler_experiments.mismatch_offsets(reference, compiled)` at74 plus `summarize_object(path)` at57 for diagnostics only. Their failures become a concrete seam blocker; retain raw whole ELF inventory with existing `native_link.Elf32` rather than accepting unsupported sections. Byte offsets alone omit missing/extra sections, so preserve both inventories too.
6. Only strict acceptance supplies `source-objects.json` to the native-link CLI. `native_link.prepare_objects(lcf, reference_dir, object_dir, overrides)` at221 selects the actual accepted compiled path, rejects unused/ambiguous overrides, applies unchanged ELF normalization and records raw/normalized hashes. `verify.verify_link_record(output, tools, source_build)` at205 checks actual linker argv, source path/digests, map, selected source set and every actual input. `source_accounting.verify_source_ownership(source_build, link_inputs, lcf, link_map_path, linked_elf, config_dir)` at123 proves placement and ownership. Direct linked target readback must retain original numeric identity/address and loaded 92-byte SHA256 `3b9caafec617800aa88608cf74a33b764525fa947907e2654a85867ede6a55ba`.
7. That path continues to existing DSD module/symbol checks, direct original ROM/module comparison, `relocation_check.validate_relocations(reference_objects, linked_elf)` at88, freshness, and `rom_roundtrip.roundtrip_rom(original_rom, build_dir, regions, verified_build, output_rom, arm7_operation=None, child_operation=None)` at318. `verify` requires whole-ROM hash and complete stage order. ARM7/child remain preserved original bytes. Research report coverage fields stay raw evidence and grant no canonical source credit or manifest change.

`compiler_experiments.run_experiments(manifest, root, reference_dir, tool_root, runner, output)` at106 is real, but would compile again and expose an unnecessary matrix. Reuse its pin validators and diagnostics only. `verify` already performs one source-build followed by stop-or-continue. A separate `build_sources` trial followed by `verify` would duplicate compilation, so it is not the selected flow.

## Real controls before the target body

After root records release, run this finite control set on a fresh original 92-byte delinked TU before writing the target body or invoking its compiler. Mutate private copies of actual artifacts, preserve originals, record hashes/exceptions/exits and zero source credit. These are planned controls, not claims of tests already run. The replay itself rejects optimized Python before imports, following accepted task36.

| Actual artifact/control | Required result |
| --- | --- |
| Original TU versus exact copy | Strict comparator passes as an original-object positive control, not compiled-source acceptance. |
| Change function extent92 to84, or ARM mapping/mode to Thumb | Function gate rejects. |
| Flip a nonrelocated instruction bit | Initialized-byte gate rejects; masking cannot hide it. |
| Remove/change a pool ABS32 record or symbol, or truncate pool extent | Relocation/function/section gate rejects. An unresolved ABS32 placeholder-byte change is expected to remain masked and is not a negative control. |
| Change helper destination symbol or addend-8 | Named RELA gate rejects before masking. |
| Add nonempty allocated `.bss` or extra initialized section to actual copied ELF | Whole-section gate rejects without deleting the section. |
| Real existing `compiler-t04/clear_record.c` with deliberately wrong digest passed to `compiler_experiments.validate_unit(unit, root)` | Source pin rejects before compiler subprocess; target body is still absent. |
| Wrong expected compiler/runner/runtime DLL digest against real files | Existing pin validator and fixed boundary closure reject before compiler. |
| Wrong observed tuple 20/offset 18/pointer 4 in fixed manifest boundary | Machine-layout boundary rejects before implementation; emitted model's typedef checks independently enforce real frozen tuple during its single compile. |
| Existing output; Python `-O`/`-OO` | Boundary rejects without modifying/creating output or running tools. |

Conditional post-match controls need no additional compile: replace the selected compiled path/digest with reference input in a copy of the real link receipt, or mutate actual normalized input after recording it. `verify_link_record`/`require_source_input` must reject. Linked-image or rebuilt-ROM mutation must fail actual direct-comparison/freshness gates. Object names and self-reported statuses cannot substitute for consumption proof.

## Finite dependency ownership

Freeze the one source/recipe/replay/control helpers and accepted task36 records; all consumed helper files; original 52 ARM9 metadata files; ROM/toolchain/executable-region/reference-relocation manifests. External tools are pinned MW package/DLLs, Wibo, DSD, LLD and existing attributes-only Clang. Python/standard library and executable host environment are explicit external inputs. No network or untracked cached extraction is required.

Conditional helper closure includes `verify.py`, `baseline_intake.py`, `source_build.py`, `header_dependencies.py`, `native_link.py`, `relocation_check.py`, `source_accounting.py`, `rom_roundtrip.py`, and `compiler_experiments.py` for diagnostics/pin checks. Enumerate actual transitive repository imports from those helpers and add any actually consumed finite helper before freezing. Pin original repository bytes separately from derived research config/source copies. Root owns strict committed-HEAD verification and explicit 47 LF-to-CRLF ownership. Changed model/context/tool/source blocks this experiment.

The research root is an isolated tracked snapshot/worktree under fresh output with no shared `.beads` state. Its complete DSD block and source manifest are research inputs, visibly derived and hashed. It supplies the git commit evidence required by `verify`; replay separately binds that root to the accepted publisher base and exact derivation. No canonical approval, source selection or counter is written.

## Rationale and alternatives

The physical record keeps offsets/widths in one place; the prefix view retains the original global relocation while exposing only the observed counter word. Header-free typedef checks make layout failures concrete without linked data. One replay boundary hides integration knowledge without exposing temporal stages, addressing architect's information-leakage and shallow-module flags.

A byte-addressed `void *` receiver with typed accesses at numeric offsets is structurally distinct. It relies less on compiler record layout, but exposes alignment/casts/aliasing at every access. I reject it here because task36 already grounds the simple 20-byte physical record and the existing compiler recipe supports typedef offset checks. This remains a meaningful competing candidate shape, not a second trial here.

An allocating C++ constructor or static instance would hide lifetime/allocation but import ungrounded class/mangling/ownership/failure claims. Reject it. A helper per field or generic recipe registry adds public coordination without domain depth. Reject it. A separate object trial followed by a full verifier compile repeats work; the unchanged verifier already gives the needed conditional path.

Tradeoffs accepted: local prefix view plus explicit checks for readable counter access; one C recipe may miss for a finite interpretable outcome; a private derived metadata copy is necessary to leave canonical selection untouched. None implies recovered C++ source. Risk resolution is automatic stop on unsupported format/layout/strict mismatch, rather than an unrequested human question or a flag/model sweep.

## Phase and synthesis status

Ground complete: accepted 36 and real API trace. Sketch complete: candidate A only. Agree pending root/cross-judge comparison with candidate B. Implement remains gated on recorded release. Scrap condition fixed: any byte/extent/RELA/section mismatch ends the model; unsupported integration names a blocker.

Root owns synthesis decision after both candidates freeze. First implementation step after release is original-TU positive/red controls, then the single body and frozen recipe. No implementation has begun. All owned reads completed; no background writer or extra agent was launched for this design.
