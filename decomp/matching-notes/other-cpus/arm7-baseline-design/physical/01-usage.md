# Native ARM7 opaque physical baseline

Candidate design only. Link three original opaque initialized payloads at
checked runtime and initial-load addresses, represent BSS separately, then
reconstruct the contiguous stored ARM7 image from actual linked ELF bytes.
This establishes physical payload/layout preservation only. It grants zero
source, function, executable-classification or original-relocation credit and
makes no bootable-ELF or full ARM7 baseline claim.

## Parent program

The Rust caller starts with a checked view, not an unchecked layout or a JSON
export. The operation verifies pinned native tools, constructs opaque inputs,
links them, checks the actual ELF and returns success only after exact byte
reconstruction and artifact freshness checks. Use a new empty private folder.

```rust
use ds_decomp::rom::arm7_physical_baseline::{build, NativePins};

let view = reviewed_parent_layout.checked(&actual_parent_bytes)?;
let result = build(&view, &independently_pinned_native_tools, empty_parent_output)?;
write_public_metadata(&result); // no payload bytes or private paths
```

Checked entry/header/image/parameter/table metadata must be retained privately
by Arm7View before this interface is implemented. The runner never accepts a
second mutable layout, ISA, entrypoint, module list or linker script override.
The expected tool hashes come from independent reviewed pins, not a hash the
runner discovers and decides to trust.

## Exact embedded child

```rust
let child_view = reviewed_child_layout.checked(&actual_parent_bytes)?;
let child = build(&child_view, &native_pins, empty_child_output)?;
assert_eq!(child.identity(), child_view.identity());
assert_eq!(child.source_bytes(), 0);
```

Existing checked ds-rom/NitroFS extraction selects exactly
`ChildRom/JSS2Child.srl`. Full parent/selector/program identity belongs to every
result even though the parent's ARM7 payload is identical. A separately
provided child blob or matching image hash cannot replace checked selection.

## Experimental CLI and later verifier

```sh
# Proposed example, not an implemented command. Every pin is independently reviewed.
arm7_physical_baseline "$PRIVATE_ROM" "$LAYOUTS" "$LAYOUTS_SHA"   "$NATIVE_PINS" "$NATIVE_PINS_SHA" "$EMPTY_PRIVATE_OUTPUT" > "$PUBLIC_REPORT"
```

The example checks both sidecar hashes, builds each requested checked program,
and calls the same library operation once per program. It retains original
input bytes immutably during the run and rehashes input files before emitting
one aggregate success report. Source/tree/example-binary hashes are producer
provenance; original program and image hashes are separate input identity.
Python integration can execute the pinned example and require fresh artifacts
and unchanged inputs. Python never upgrades serialized layout/capsule metadata
into a checked Rust view or implements a second NDS/NitroFS parser.

The current whole-ROM proof continues to describe original ARM7 fallback until
a separate reviewed integration replaces it with these verified linked
payloads. A saved report alone grants no status. Repeating the command uses
fresh output folders. Failure publishes no successful partial result. T10
remains open after this bounded baseline.
