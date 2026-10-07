# Experimental checked ARM7 module inputs

The candidate adapter preserves complete program/CPU/region identity and
observes explicitly selected initialized spans under fixed ARMv4T policy.
It establishes no ARM7 linked baseline or source coverage. T10 remains open.
The approved interface and deferred integration seams are in
`arm7-module-input-design.md`; measured hashes are in
`arm7-module-input-proof.json`.

## Reproduce the candidate

Apply the durable patch to exact checked-view source
`0ef447312649db7412ddd98fe0b2b23beb5bd196`. The resulting source commit is
`bee60e2ee89308616933a391c387928e2dfb5c07`, tree
`9bdb5141422bace5f700c2d4e82bcd716fa8b04c`. Patch SHA256 is
`0001c73030992c6e8b41f23b32795736c9ee9cabfe19b81a630764b630f7da32`.
No tool binary is committed or promoted to a production pin.

```sh
git checkout --detach 0ef447312649db7412ddd98fe0b2b23beb5bd196
git apply --check "$NOTES/arm7-module-input.patch"
git apply "$NOTES/arm7-module-input.patch"
git diff --check
cargo test --locked --offline -p ds-decomp --lib \
  --test arm7_checked_view --test arm7_module_inputs
cargo clippy --locked --offline -p ds-decomp --lib \
  --test arm7_checked_view --test arm7_module_inputs \
  --example arm7_module_probe -- \
  -D warnings -A clippy::chunks_exact_to_as_chunks
cargo build --locked --offline --profile release-fast \
  -p ds-decomp --example arm7_module_probe
cargo build --locked --offline --profile release-fast -p ds-decomp-cli
```

Use an isolated source checkout, `NOTES` pointing to this note directory, and
an ignored `CARGO_TARGET_DIR` for native artifacts. Offline commands require
the unchanged locked dependencies to be cached. The clippy exception covers
existing constructor/function code. Measured native builds used Darwin arm64,
rustc 1.98.1 and cargo 1.98.1; independent build hashes can depend on local paths.

All 41 public tests pass: five existing library, 24 checked-view and 12
adapter/ISA tests. The test-first failures established the missing V4T feature
and missing adapter before implementation. Tests distinguish actual locked
unarm 1.9.2 V4T/V5TE opcodes, preserve the explicit legacy V5TE function path,
and check exact address/byte consumption for combined Thumb BL followed by BX.
A lone or trailing BL prefix, an unmatched suffix, or an illegal instruction
rejects atomically with no successful partial observations.

## Private artifact checks

Set `PRIVATE_ROM` to the original private parent ROM; no ROM path or bytes are
included in this record. The probe checks both independently pinned sidecars,
uses the existing checked-view extraction for parent and exact NitroFS child,
and rereads every input before emitting metadata.

```sh
"$CARGO_TARGET_DIR/release-fast/examples/arm7_module_probe" \
  "$PRIVATE_ROM" "$NOTES/arm7-checked-layouts.json" \
  8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc \
  "$NOTES/arm7-module-input-spans.json" \
  8182526973c7187937cea858e9337e7842e31f0045691118c65ba3fbbbdb2d62 \
  > "$PRIVATE_BUILD/arm7-module-input-proof.json"
```

Both programs preserve three physical input hashes/ranges: 165,528 initialized
bytes, 21,424 BSS bytes and a separate 24-byte loader table each. Identical
payloads retain distinct parent/child identities. Per program, explicit ARM
spans `0x02380000..0x02380008` and `0x037f8468..0x037f8470` each decode two
instructions. The public output contains identities, ranges, policy, counts
and hashes only. These observations do not classify the rest of either region
or infer any function extent; autoload1 mode/entry remains unresolved.

Fresh candidate CLI extraction and strict ARM9 initialization were also run
for both original programs. `PRIVATE_CHILD` is the original
`ChildRom/JSS2Child.srl`, independently checked against its pinned hash. Run
the following commands once per program with distinct empty output folders:

```sh
"$CARGO_TARGET_DIR/release-fast/dsd" rom extract \
  -r "$PRIVATE_PROGRAM" -o "$PRIVATE_BUILD/extract"
"$CARGO_TARGET_DIR/release-fast/dsd" init \
  -r "$PRIVATE_BUILD/extract/config.yaml" \
  -o "$PRIVATE_BUILD/analysis" -b "$PRIVATE_BUILD/objects"
```

The measured runs use neither unknown-call relaxation nor skipped relocation
analysis. Every symbols/relocations/delinks file matches the independently
reproduced earlier tool proof: 51 files across 17 parent ARM9 modules, nine
files across three child ARM9 modules. Generated `config.yaml` is excluded
because output/build paths differ. The proof records all compared hashes and
four successful stage exits, and unchanged original ARM9 source hashes.

## Remaining work

Analyzer integration still needs grounded section/function boundaries,
ARM7-valid branch target policy, and program-scoped original symbols and
relocations. Startup RAM sources `0x023fe940` and `0x023fe904`, original
compiler/SDK/ABI, autoload-wide modes and linking remain unresolved. This
candidate changes no production pins and earns zero ARM7 source bytes.

## Independent integration verification

The root source tree, probe and CLI hashes match the candidate. All 41 Rust
tests and the documented clippy command pass. Both actual program views and
four explicit spans match the worker result; both sidecar-pin mutations reject
with zero output. Fresh strict initialization reproduces all 51 parent and
nine child metadata files, with unchanged original inputs.

The new CLI also passes all 19 stages of the existing 304-byte ARM9 source
and exact whole-ROM pipeline using an isolated experimental pin at producer
`b23ecb1`, preserved on branch `track-a/arm7-adapter-proof`. This proves ARM9
compatibility; it establishes no ARM7 linked baseline. Canonical production
pins remain unchanged.

[Root build](arm7-module-input-root-build.json),
[root observations](arm7-module-input-root-proof.json),
[root tests](arm7-module-input-root-tests.log), and
[ARM9 compatibility](arm7-module-input-root-arm9-compatibility.json) record
the independent checks. The durable patch has an exact-path whitespace
attribute for literal diff context; applied Rust source remains strictly
checked. ARM7 source credit remains zero.
