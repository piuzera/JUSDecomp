# Flat stored-image ARM7 candidate

Design only. This candidate produces an opaque ARM ELF storage container through
the native LLVM tools, reconstructs the original stored ARM7 image from that
linked ELF, and separately verifies its checked physical layout. It does not
place ARM7 runtime sections in the ELF. Parent and NitroFS child executions
retain separate identities even when their ARM7 image hashes are equal.

## Caller usage

The proposed command accepts the original parent ROM, an exact program selector,
a pinned sidecar file, explicit native tools and a fresh private output path:

```sh
arm7-flat-baseline \
  --parent-rom "$PRIVATE_PARENT" --program parent \
  --layout decomp/matching-notes/other-cpus/arm7-checked-layouts.json \
  --layout-sha256 8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc \
  --tool-lock "$REVIEWED_NATIVE_TOOL_LOCK" \
  --clang "$PINNED_CLANG" --lld "$PINNED_LLD" --objcopy "$PINNED_OBJCOPY" \
  --output "$PRIVATE_BUILD/parent-flat"
```

For the child, change only the exact selector and private output directory:

```sh
arm7-flat-baseline \
  --parent-rom "$PRIVATE_PARENT" --program-nitrofs ChildRom/JSS2Child.srl \
  --layout decomp/matching-notes/other-cpus/arm7-checked-layouts.json \
  --layout-sha256 8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc \
  --tool-lock "$REVIEWED_NATIVE_TOOL_LOCK" \
  --clang "$PINNED_CLANG" --lld "$PINNED_LLD" --objcopy "$PINNED_OBJCOPY" \
  --output "$PRIVATE_BUILD/child-flat"
```

The lock must pin the actual three LLVM executables, including objcopy; an
unrecorded PATH default is not accepted. Existing output directories reject,
including an earlier successful run. Failure writes a diagnostic report in the
new output directory and never publishes a successful artifact receipt.

The library usage has two operations. The first consumes the raw sidecar once,
checks its hash and exact selector, and constructs a checked physical view with
its retained immutable envelope. The second owns the complete fresh tool run:

```rust
// Sketch only: these interfaces are not implemented.
let parent_input = PinnedArm7Input::load(
    parent_rom_bytes, ProgramSelector::Parent, sidecar_bytes, expected_sidecar_sha256
)?;
let parent = FlatArm7Baseline::build(&parent_input, &native_tools, parent_output)?;

let child_input = PinnedArm7Input::load(
    parent_rom_bytes,
    ProgramSelector::NitroFs { path: "ChildRom/JSS2Child.srl".into() },
    sidecar_bytes, expected_sidecar_sha256
)?;
let child = FlatArm7Baseline::build(&child_input, &native_tools, child_output)?;
assert_ne!(parent.identity(), child.identity());

// A verifier accepts the receipt only with its narrow storage-container scope.
assert!(parent.report().native_link_completed());
assert!(parent.report().stored_image_equal());
assert_eq!(parent.report().coverage(), OpaqueCoverage::ZERO);
assert_eq!(parent.report().runtime_layout_authority(), LayoutAuthority::CheckedEnvelope);
```

The outputs are `stored-image.elf`, `arm7-stored.bin`, `report.json` and private
stage evidence. Each original program image is 165,552 bytes with SHA256
`0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`.
The reconstructed bytes must come from the actual linked ELF section; copying
the ROM slice directly to the purported reconstructed output cannot pass.

The report labels its artifact `opaque_stored_image`, ELF coordinates
`stored_offsets`, ELF entry `0`, and runtime-placement authority
`checked_envelope_only`. The original checked header entry remains separately
recorded. Native runtime placement is not claimed. Source/function/relocation
and executable-classification credit are all zero; the existing 304-byte ARM9
source proof receives no new credit or changed scope from this operation.

See [shape](02-shape.rs.txt), [caller/module flow](03-module-map.md),
[rationale](04-rationale.md), [validation](05-validation.md) and
[grounding](grounding.md). Candidate selection remains with the parent arena.
