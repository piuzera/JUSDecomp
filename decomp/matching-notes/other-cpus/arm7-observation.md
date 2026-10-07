# Bounded ARM7 control-flow observations

The checked ARM7 inputs now support an atomic observation call that preserves
full program identity and fixed V4T policy. Source commit
`67e9a8bc65fba0e5cdc3ab784c77de28253ee3dc`, parent `bee60e2`, changes six tool
files. It adds a separate observer and probe, exports the observer, and shares
public synthetic fixture setup between the old and new tests. ARM9 analysis,
configuration and dependencies are unchanged.

This establishes selected instruction and transfer observations. It does not
establish functions, executability, reachability, original relocations,
ARM7 linkage or matching source. T10 remains open and ARM7 source credit is zero.

## Verified behavior

`observe(source, selection, checked_modules)` validates exact program/CPU
context, source membership and nonoverlapping physical ownership before
complete explicit-mode decoding. It records every selected instruction and
classifies direct destinations as initialized, BSS or unresolved bytes.
Instruction boundaries distinguish starts, interiors and outside-selection
addresses. B and BL share one classifier; conditional call continuations
require the call was taken and returned. Indirect BX, PC writes and exceptions
retain unknown destinations and modes. No transfer recursively decodes bytes.
Stored assembly and JSON preserve immutable policy and never reparse under V5TE.

The separate [design record](arm7-observation-design/synthesis.md) compares two
whole-shape candidates and records the selected boundary and rejected migration.
Executable declarations and arbitrary exchange facts were deferred because no
current caller has evidence to supply them.

## Decoder defects found by tests

The locked unarm 1.9.2 ARM B/BL field truncates a scaled 26-bit displacement as
24 bits. A B from 02380000 to 037f8468 was reported as 027f8468. Combined Thumb BL
also applies PC4 before signed extension at its positive limit, turning
source+00400000 into source-00400000. Short and conditional Thumb B were already
correct; those forms are not confirmed dependency defects.

The observer derives every direct ARM/Thumb destination from validated raw
encoding fields, signs the payload before scaling and pipeline bias, and
formats the corrected operand once. Combined Thumb BL reads its prefix only
inside the completely decoded selected span. The locked dependency and legacy
ARM9 consumers are unchanged. Follow-up `jus-bjry.16` owns the shared repair.
[Independent LLVM oracle](arm7-observation-design/llvm-branch-oracle/README.md)
confirms four ARM and three Thumb targets using synthetic source only.

## Independent root proof

The root applied [arm7-observation.patch](arm7-observation.patch) to a separate
checkout. Patch SHA256 is
`5777c649dad7e92d01091ad1019ce7a1286da57aedd3556f1df3737e49abaad4`.
Its staged tree exactly matches the worker's
`b07ef5a47ab21137a7e1890ed2d9d3e98557796d`.
All 55 Rust tests pass, including 14 new observer cases and the existing ARM9
V5TE/BLX compatibility case. Clippy passes with only the named allowance for
`chunks_exact_to_as_chunks` at two unchanged ARM9 sites under Rust 1.98.
No new observer code uses that pattern.

Root and worker independently build identical native release artifacts:

| Artifact | SHA256 |
|---|---|
| Observer probe | `222350b406018ed60e784deb0c1cbab9760a164b867deab369b98599ad4cf0bb` |
| CLI | `96cb02ec18210b5eeb701f26f7050ddb3f274257085dd680decacad5c305b73c` |

Both real checked programs produce four pinned spans, eight instructions and
ten transfer observations. Root and worker report JSON values are identical.
Wrong layout and span pins independently reject with exit 1 and zero stdout;
inputs remain unchanged. [Root proof](arm7-observation-root-proof.json) and
[root observations](arm7-observation-root-report.json) retain the actual facts.

Fresh parent and child initialization retains all 51 and 9 symbol/relocation/
delink metadata files byte for byte against the accepted adapter proof.
An isolated experimental JUS pin also passes all 19 verifier stages, all 17
ARM9 modules/BSS, all 87,493 original relocation slots, 72 source hashes and
209 artifact hashes. The whole 67,108,864-byte ROM is exact. Accepted matching
source remains seven functions / 304 bytes. The experimental pin is isolated in
producer `73eee8d` on `track-a/arm7-observation-proof`; it is never merged into
the canonical production lock. Full [compatibility report](arm7-observation-root-arm9-compatibility.json).

## Reproduction

Apply this patch after the checked-view and module-input patches to obtain
exact source tree `b07ef5a`. Do not edit the global Cargo cache. Sequential gates:

```sh
cargo test -p ds-decomp
cargo clippy -p ds-decomp --all-targets -- -D warnings -A clippy::chunks_exact_to_as_chunks
cargo build -p ds-decomp --release --example arm7_observation_probe
cargo build -p ds-decomp-cli --release
```

The native probe takes five arguments: private parent ROM, layout JSON,
independently pinned layout SHA256, explicit-span JSON and its pinned SHA256.
Use [arm7-checked-layouts.json](arm7-checked-layouts.json) with SHA256
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`, and
[arm7-module-input-spans.json](arm7-module-input-spans.json) with SHA256
`8182526973c7187937cea858e9337e7842e31f0045691118c65ba3fbbbdb2d62`.
The four spans are explicit ARM observations, not complete function extents;
autoload1 instruction mode remains unestablished.

The worker/root build reports and RED logs retain the initial missing behavior
and both arithmetic refutations. Public files contain synthetic/reconstructed
source and metadata only. Original ROMs and compiled binaries remain private.
