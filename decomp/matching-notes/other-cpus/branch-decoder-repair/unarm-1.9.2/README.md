# Pinned unarm 1.9.2 branch repair

This workspace uses `source.patch` for the exact unarm 1.9.2 upstream commit
recorded in `manifest.json`. It fixes direct ARM B/BL and immediate BLX
displacement sign extension, combined Thumb BL/BLX sign extension at the
positive boundary, and Thumb immediate BLX PC alignment. The existing DSD
ARM7 observer normalization remains in place.

The ARM YAML definitions signed a scaled displacement as 24 bits and included
PC+8 before sign extension. The corrected definitions sign the 26-bit scaled
displacement before adding 8; the committed ARM accessors are regenerated with
`cargo run -p unarm-generator --locked --offline`. The generator itself does
not need a change. The Thumb high-half argument already contains PC+4, so the
combiner removes that bias before signing the 23-bit combined displacement,
then restores it. Parser applies Align(PC,4) only to immediate Thumb BLX. The
address-free half-instruction combiner retains its existing API; it cannot
apply address-dependent BLX alignment on its own.

The 32 synthetic oracle instructions under `oracle/` include positive and
negative ARM displacement extremes, ARM BLX H=0/H=1, combined Thumb positive
and negative boundaries, short and conditional Thumb branches, and BLX/BL at
both word- and halfword-aligned addresses. Expected destinations come from
pinned LLVM disassembly, independently of unarm. V4T still rejects immediate
ARM and Thumb BLX. These checks establish these instruction forms, not an
exhaustive ARM architecture conformance claim.

## Prepare and build

Run these commands from the DSD workspace. Python 3.11 or newer, Git and the
pinned Rust toolchain are required. Preparation fetches the public upstream
repository into the ignored `local-deps/unarm` path. It verifies the exact
commit, all 46 upstream files, the patch, all 47 patched files, package/version,
and the MIT license. It scans all untracked files regardless of Git ignore
rules. Only the added pinned regression test and generated output under the
checkout's root `target/` directory are permitted. The pinned manifests and
source do not load inputs from that output directory. Ignored build scripts,
`.cargo` configuration, other source files and nested `target/` directories
are rejected. It never resets an existing checkout. No registry source is
edited.

```sh
python3 dependency-patches/unarm-1.9.2/prepare.py
python3 dependency-patches/unarm-1.9.2/prepare.py --check-only
python3 dependency-patches/unarm-1.9.2/test_prepare.py
```

The ten real-Git preparation tests include ignored `disasm/build.rs`, ignored
`.cargo/config.toml`, ignored extra source and nested output directories. After
dependency setup, this probe additionally creates an ignored build script in a
separate private copy of the actual pinned upstream source. Cargo metadata
identifies the script as a build target, while preparation rejects it. The
script is never executed.

```sh
python3 dependency-patches/unarm-1.9.2/proofs/ignored-build-probe.py
```

Use a private Cargo home for dependency setup; fetch is the network setup step.
Once setup completes, all checks and builds below use the existing lockfile
and offline resolution. This workspace's only lockfile change removes the
registry source and checksum for the patched, still-version-1.9.2 unarm entry.

```sh
dsd_source=$(pwd)
task_cargo_home="$dsd_source/target/branch-repair/cargo-home"
export CARGO_HOME="$task_cargo_home"
export CARGO_TARGET_DIR="$dsd_source/target/branch-repair/cargo-target"
cargo fetch --locked
cargo tree -i unarm --locked --offline
cargo test -p ds-decomp --locked --offline
cargo clippy -p ds-decomp --all-targets --locked --offline -- -D warnings -A clippy::chunks_exact_to_as_chunks
```

The clippy allowance is the existing baseline allowance in `ctor.rs` and
`functions.rs`; it does not suppress new branch-repair diagnostics.

For native release comparison, use the same logical source prefixes for each
isolated checkout and private Cargo home. Keep the Cargo-home remapping last
because its physical path is nested within the workspace path.

```sh
export CARGO_TARGET_DIR="$dsd_source/target/branch-repair/release-target"
export RUSTFLAGS="--remap-path-prefix=$dsd_source=/dsd-source --remap-path-prefix=$task_cargo_home=/cargo-home"
cargo build -p ds-decomp-cli --release --locked --offline
```

`verification.json` records the worker's actual tool hashes, test outcomes,
release command and fresh legacy parent/child initialization comparison. Root
independently runs the full 19-stage ARM9/ROM compatibility gate before
promotion. No ARM7 source, linking, function declarations or executability
claims are introduced. Existing reconstructed game source credit stays 304
bytes.

`LICENSE.unarm` preserves the upstream MIT notice. The exact original runtime
source files match the registry crate's 11 runtime files, recorded in
`registry-source-equivalence.json`; Cargo's packaged manifest normalization
is not used as the source identity.
