# Separate child analyzer and codec approval

This capsule pins two tool roles for a fresh child ARM9 operation. The analyzer
uses the independently accepted `7b3513f` source and CLI hash `3f18db59…`.
Its source artifacts are the immutable accepted ARM7 physical-source capsule.
This child role does not alter that capsule or the parent's canonical DSD pin.

The codec is newly built from exact upstream commit
`9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe`, tree
`1d0ccf3e5ccc8f6530fb6181dd526b698eeb99bc`, and the unchanged published
`child_compression_probe.rs`. No analyzer repair or compressor change is applied.
The original Cargo.lock is retained as `Cargo.lock.original`. Root's native
codec SHA256 is `5c04f2668aec35d969036499fd7065ea8c9fe9c6bda457b7042f74f4ff7b6064`.
An artifact from another host may differ and requires its own approval.

Set `CODEC_SOURCE` to a fresh upstream checkout, `JUS_ROOT` to this repository,
and `CODEC_CACHE` to a task-specific Cargo home and target directory. Check out
the exact upstream commit, then copy the example to
`lib/examples/t10_compression_probe.rs`. Keep the original workspace manifests
and lock unchanged. Root's commands are:

```sh
export CARGO_HOME="$CODEC_CACHE/cargo-home"
export CARGO_TARGET_DIR="$CODEC_CACHE/target"
export RUSTFLAGS="--remap-path-prefix=$CODEC_SOURCE=/codec-source --remap-path-prefix=$CARGO_HOME=/cargo-home"
cargo metadata --locked --offline --format-version 1
cargo test --locked --offline -p ds-decomp --example t10_compression_probe
cargo build --locked --offline --profile release-fast -p ds-decomp --example t10_compression_probe
```

Offline mode requires the locked crates already in this task's Cargo cache.
`source-audit.json` records every upstream tracked file and the added example.
It also records the complete resolved dependency closure of the example's
package: 116 registry packages and 6,352 files. Root checks each compressed
crate against Cargo.lock, derives its expected inventory from the verified tar
members, and compares every actual unpacked file. It rejects additional files
apart from Cargo's `.cargo-ok` and `.cargo-checksum.json` metadata. This includes
build scripts and ignored files. Unused CLI-only git dependencies are outside
the example's dependency closure. All tracked upstream bytes equal the exact
commit; the example is the sole added source file. No dependency is patched.

`root-build.json`, `tests.log` and `build.log` record the fresh build and one
invented compress/decompress fixture. The original codec proof remains separate
historical evidence. This new identity removes dependence on that proof's
subsequently edited local source checkout.

Independent gpt-6.1-sol review of `4e9f6b7` reports No flags. A separate
clean build reproduces the root binary exactly; pre/post-build source audits
match all 113 local files and 116 registry packages. Both role manifests are
approved. `accepted-review.json` binds the independent evidence. The pending
status in `root-build.json` records its state before that review.
Tool approval supplies no native-link, canonical pipeline, source-function or
T10 completion claim. Child source credit remains zero.
