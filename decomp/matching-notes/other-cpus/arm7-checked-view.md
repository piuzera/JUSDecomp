# Checked ARM7 physical views

This candidate adds `ds_decomp::rom::arm7::Arm7Layout::checked(parent_rom)`.
It returns immutable startup, ordered autoload, and table views only after all
identity and layout checks pass. T10 remains open. This does not establish
an ARM7 linked baseline, function analysis, instruction modes, original
relocations, or source matching. Source credit is zero.

The sidecar [arm7-checked-layouts.json](arm7-checked-layouts.json) identifies the
parent and `ChildRom/JSS2Child.srl` separately. The probe requires the exact
sidecar SHA256 before deserialization:
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
A rolling inventory document is derivation context, not runtime authority.
Required `arm7`, `armv4t`, and `arm7tdmi` fields are declarations; this patch
does not enable ARMv4T parsing or prove compiler configuration.

For each program, the view verifies the parent/program hash, exact ds-rom ARM7
header tuple, full 16,384-byte `raw::Header` hash, stored image hash,
20-byte loader parameter block hash and values, ordered 12-byte table records,
and every region hash. It requires contiguous physical coverage ending at the
image boundary, word alignment, checked arithmetic, and nonoverlapping
initialized-plus-BSS runtime extents. NitroFS selection uses ds-rom's existing
FNT/FAT and program parser with bounded preflight and requires an exact file.
Directory aliases, malformed extents, decoder errors, duplicate decoded
sibling names, and directory cycles reject before a view is returned. Overlay
counts and extents are checked before ds-rom parsing; every FNT file ID must
be outside its reserved overlay range.

The actual proof [arm7-checked-view-proof.json](arm7-checked-view-proof.json)
checks both program instances against the private original, with unchanged
inputs. Each has 432 startup bytes, 66,120 and 98,976 autoload bytes, 14,920 and
6,504 BSS bytes, and a 24-byte table. The identical ARM7 payload cannot authorize
a different program identity. Published files contain metadata and invented
fixtures only.

## Reproduce

The candidate source revision is `0ef447312649db7412ddd98fe0b2b23beb5bd196`, based
on the independently reproduced child-SWI repair
`78630f8f54835e0e627cd4e45a9626d88c307f8b` (tree
`5b6bef54e46e46e08d3243f56c2cb419bbd209d9`). The durable
[arm7-checked-view.patch](arm7-checked-view.patch) applies to that exact base.
For a fresh upstream checkout, first apply `dsd-child-swi.patch` to upstream
`9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe`, then this patch. The proof records
candidate tree, lock, patch, native probe, and native dsd hashes; production
pins are unchanged. Only direct membership of already locked sha2 0.10.9, encoding_rs 0.8.35,
and example-only serde_json 1.0.149 changes in Cargo.lock.

From the isolated source checkout, with `JUS_NOTES` pointing to this directory
and `PRIVATE_ROM` pointing to the private original:

```sh
git apply --check "$JUS_NOTES/arm7-checked-view.patch"
git apply "$JUS_NOTES/arm7-checked-view.patch"
export CARGO_TARGET_DIR="$PWD/target-arm7-view"
cargo test --locked --offline -p ds-decomp --lib --test arm7_checked_view
cargo clippy --locked --offline -p ds-decomp --lib \
  --test arm7_checked_view --example arm7_checked_probe -- \
  -D warnings -A clippy::chunks_exact_to_as_chunks
cargo build --locked --offline --profile release-fast \
  -p ds-decomp --example arm7_checked_probe
cargo build --locked --offline --profile release-fast -p ds-decomp-cli
"$CARGO_TARGET_DIR/release-fast/examples/arm7_checked_probe" \
  "$PRIVATE_ROM" "$JUS_NOTES/arm7-checked-layouts.json" \
  8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc
```

There are 24 public fixture tests plus 5 existing library tests. Red runs
preceded the view API, exact-file repair, and separate header/parameter hash
pins. Review regressions first reproduced a reserved-overlay ID panic,
malformed-name acceptance, and a valid Shift-JIS decoded alias. The reviewer
control now exits 0; both defect reproducers exit 1 with `Error: NitroFs`.
A single valid Shift-JIS name remains selectable. A wrong sidecar digest exits 1 with `layout sidecar hash mismatch`.
Clippy's allowed lint covers existing `ctor.rs` and `functions.rs` patterns
flagged by the recorded Rust 1.98.1 toolchain. No existing analyzer code changes.

## Remaining work

The smallest next step is a separately tested adapter from checked program
views to ARM7 module identity and per-module ARMv4T policy. Known ARM seeds at
startup and autoload0 address `0x037f8468` do not establish function extents or
code/data boundaries. Autoload1 entrypoints and modes remain unresolved.
Startup reads from external RAM sources `0x023fe940` (352 bytes) and
`0x023fe904` (32 bytes); their contents and executable status remain unresolved.
An honest ARM7 baseline still requires original symbol/relocation analysis,
configuration and delink integration, actual linking, and independent checks.

## Independent integration verification

The independent rebuild matches both recorded native tool hashes and the exact
patched source tree. All 29 Rust tests and the documented clippy command pass.
The preserved reviewer control exits 0; the reserved-overlay and decoded-name
mutations each exit 1 with `Error: NitroFs`. Both actual program views match the
worker result, with unchanged input hashes and zero source credit.

[root-build](arm7-checked-view-root-build.json),
[root-proof](arm7-checked-view-root-proof.json), and
[root-tests](arm7-checked-view-root-tests.log) record the independent checks.
The exact patch path has a Git whitespace attribute for literal blank context
lines; applied Rust source still passes strict whitespace checking.
