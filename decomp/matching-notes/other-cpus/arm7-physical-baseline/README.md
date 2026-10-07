# Reproduce the opaque ARM7 physical baseline

This candidate builds three opaque initialized ARM7 regions and the original
24-byte autoload table with pinned native LLVM. It verifies the resulting ELF
and reconstructs the original stored image from the actual linked sections.
The parent and `ChildRom/JSS2Child.srl` each reproduce all 165,552 bytes exactly.
Both retain their complete program identity and consumed sidecar digest.

The proof covers physical payload, VMA, LMA, BSS, entry, header, parameters,
and table preservation. Original functions, relocations, and executable
classification remain unknown. Source credit is zero. The ELF is a layout
artifact; it is not claimed bootable. T10 remains open, and production pins are
unchanged.

## Build the candidate

Start in a fresh isolated DSD checkout at exact base
`d38bad627b7074eb4b39a0901fe8e9a36a34756b`. Apply this directory's `source.patch`.
Its resulting Git tree must equal `42448bc68cd596f36c3c56147988d28b36802ba4`.
The worker source commit is `7b3513f05adc88a1cca8b0365d3a3607a50a1b25`.

```sh
	git apply --check /path/to/arm7-physical-baseline/source.patch
	git apply /path/to/arm7-physical-baseline/source.patch
	dsd_source=$(pwd)
	export CARGO_HOME="$dsd_source/target/physical-baseline/cargo-home"
	export CARGO_TARGET_DIR="$dsd_source/target/physical-baseline/cargo-target"
	python3 dependency-patches/unarm-1.9.2/prepare.py
	python3 dependency-patches/unarm-1.9.2/prepare.py --check-only
	python3 dependency-patches/unarm-1.9.2/test_prepare.py
	cargo fetch --locked
	cargo test --locked --offline -p ds-decomp --lib --tests --examples
	cargo clippy --locked --offline -p ds-decomp --all-targets -- -D warnings -A clippy::chunks_exact_to_as_chunks
	export RUSTFLAGS="--remap-path-prefix=$dsd_source=/dsd-source --remap-path-prefix=$CARGO_HOME=/cargo-home"
	cargo build --locked --offline --release -p ds-decomp --example arm7_physical_baseline
	cargo build --locked --offline --release -p ds-decomp-cli
```

The dependency preparation fix at this base rejects ignored build scripts and
other unpinned source inputs. It verifies 47 patched unarm files without
changing registry source or a global Cargo cache. This patch adds no dependency
or analyzer change. The immutable checked view now retains the entry and
physical envelope through a private field and an immutable crate-private getter.

## Run the physical proof

Use the unchanged private original parent ROM as `$original_parent`. Set
`$layout_sidecar` to the published `arm7-checked-layouts.json` one directory
above this package. Set `$native_pins` to this package's `native-pins.json`.
Select a new output path whose parent directory exists.

```sh
	"$CARGO_TARGET_DIR/release/examples/arm7_physical_baseline" \
		"$original_parent" \
		"$layout_sidecar" \
		8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc \
		"$native_pins" \
		a7a90669d34d6990bcff4105320dc267ebd70add7926838576e11e472262b504 \
		"$new_private_output" > "$private_report"
```

The example reads each pinned sidecar exactly once and constructs all checked
views before creating output. Duplicate selected program identities reject.
A valid child view builds its own report; identical ARM7 bytes do not merge
parent and child ownership. The example rehashes original files and its own
executable after both native builds. It prints successful JSON only after
those checks pass.

The single library operation is `build(&Arm7View, &NativePins, &Path)`.
It requires an empty private output directory. Its result has private fields,
serialization, and no deserialization or public constructor. All region
selection comes from the checked view. There is no second layout input.

## Read the evidence

`actual-proof.json` contains only public identity, layout, count, and hash
metadata from the fresh private proof. `public-native-proof.json` records the
same runner on the invented test fixture. All binary artifacts stay private.
`verification.json` pins source, dependencies, tool binaries, consumed sidecars,
and normalized public logs. `independent-worker-readback.json` checks emitted
files against direct original NDS header and FAT79 slices, independently of
the Rust report. The checked raw-header hash covers 16,384 bytes.

The actual ELF has four initialized `PT_LOAD` segments and two BSS segments,
sorted by VMA. Loader order remains startup, autoload 0, autoload 1, then table.
Autoload LMAs are the original staged-image addresses, while VMAs are their
runtime destinations. BSS uses `SHT_NOBITS`, zero `p_filesz`, and the exact
`p_memsz`; its 21,424 bytes are excluded from the reconstructed stored image.
No ELF padding enters that image.

Normal LLVM section and overlap checks stay enabled. The reader verifies
ELF32 little-endian ARM, the generated ABI flags and ARMv4T attributes,
section and program tables, exact payloads, VMA/LMA membership, BSS, and the
single generated `STT_NOTYPE` absolute entry anchor. It rejects function
symbols, named undefined symbols, and relocation sections. An empty default
`.text` section has no payload or executable credit.

The test-first logs retain the missing-API red, actual ELF attribute and
function-symbol reds, malformed directory and missing entry-anchor reds,
and provenance reds. A pinned public compiler wrapper changes an `.incbin`
input after compilation: the original implementation accepted it, and the
creation-time snapshot now rejects it. Other negatives cover ELF bytes,
entry, tables, sections, segment attributes, BSS, omitted or swapped objects,
wrong tools, changed sidecars, duplicate identities, and changed original files.
The final suite passes all 80 tests, including the existing 63.

Independent review also replaced the linked ELF after validation and changed
the reconstructed image before inventory. Both counterexamples were red.
The corrected inventory retains hashes from the validated ELF buffer and
reconstructed bytes, then checks each file against those immutable snapshots.
A first-program output changed during the second build also rejects before
the example prints success. The superseded producer's success is excluded
from this package's proof metadata.

`legacy-init-proof.json` records fresh strict parent and child ARM9 init with
the candidate CLI. All 51 parent and nine child symbol, relocation, and delink
metadata hashes match the prior accepted reference. The 410 parent and 16
child extracted input files are unchanged. The full ARM9/ROM gate and independent
physical integration review remain the integration owner's next checks.

Startup dependencies on external RAM, original symbol boundaries, original
relocations, ARM7 source, and full executable coverage remain unresolved.

## Independent root checkpoint

The root applied the durable patch to exact `d38bad6` with strict whitespace
checks and reproduced tree `42448bc6`, then built at source `7b3513f`.
All 80 Rust tests and strict clippy passed. Both release hashes match the
worker. `root-proof.json` records the source, tools and evidence hashes.

`root-actual-proof.json` comes from a fresh run on both real programs.
`root-readback.json` independently binds their original headers and the exact
child FAT entry. Reading only actual ELF load segments in stored LMA order
reconstructs both complete 165,552-byte images exactly. The root's native LLVM
readback is in `logs/root-readelf.log`; it reports ARMv4T attributes, six load
segments and both separate BSS extents. BSS contributes no stored bytes.

Fresh strict ARM9 init retains all 51 parent and nine child metadata files
byte-for-byte. Experimental JUS producer `741b44d` passes every stage of the
19-stage ARM9/source/whole-ROM compatibility pipeline. It checks all 17 ARM9
modules and 87,493 original relocation slots, preserves 304 matching source
bytes, and reproduces the exact 67,108,864-byte original ROM. Of 72 source
hashes, 71 are unchanged; the sole intentional delta is that isolated
producer's toolchain lock. Canonical production pins remain unchanged.

That compatibility pipeline preserves ARM7 from the original template.
It does not consume these native ARM7 outputs. Canonical consumption is a
separate, still-pending integration scope. Original ARM7 functions,
executability and relocations remain unknown; source credit is zero.
Independent gpt-6.1-sol review of `a3e3dd6` found no flags for the native
producer, proof bundle and trail. See `accepted-review.json`. Canonical
integration remains a separate pending scope.
