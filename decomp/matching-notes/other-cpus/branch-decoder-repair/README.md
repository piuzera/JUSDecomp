# Shared branch decoder repair

Experimental DSD producer `d38bad627b7074eb4b39a0901fe8e9a36a34756b`
repairs the shared `unarm 1.9.2` decoder. ARM B/BL and immediate BLX now
sign-extend scaled displacement before adding PC+8. Combined Thumb BL/BLX
sign-extends before restoring PC+4. Parser applies word alignment for immediate
Thumb BLX using the first halfword's source address; ordinary BL is unchanged.
The bounded ARM7 observer's local normalization remains in place.

Direct original-parser tests failed before the repair. An additional
halfword-aligned BLX counterexample failed after the signed fix and drove the
separate alignment correction. Root independently rebuilt all 32 public
synthetic LLVM cases and reproduced 532 upstream tests, 63 DSD tests and ten
preparation tests with no failures or skips. Existing baseline clippy allowance
is confined to its prior ARM9 sites.

Independent review found that ignored untracked Cargo source escaped the first
preparation inventory. An actual ignored `disasm/build.rs` passed the old
check and Cargo compiled it. The corrected recipe inspects all untracked files;
only root `target/` generated output is allowed. Ignored build scripts, Cargo
configuration, other source and nested target directories reject. The original
counterexample now rejects. See the preserved RED/GREEN proofs in
[the dependency bundle](unarm-1.9.2/README.md).

Root applied the published patch and obtained exactly producer tree
`7ab1b0b019f91be6d8ef9941beca8fd9d6d5952f`. Its separately prepared dependency
matches the pinned upstream source, corrected source inventory and MIT notice.
The independently built release CLI matches the worker exactly, SHA256
`ddae743f29432dc5d057292fd1f25dde716e352c2da133f9bb7abe68dc6213b3`.
The actual build uses the documented source/Cargo-home path remapping.

The fresh isolated compatibility producer
[`17e244a`](https://github.com/drj613/JUSDecomp/tree/17e244a8c0504809858d80f772a8b6fb991aaf85)
passes all 19 stages, all 17 ARM9 modules/BSS, all 87,493 original relocation
slots and the exact 67,108,864-byte ROM. Fresh parent/child initialization
matches all 51/nine prior metadata files byte-for-byte. The report records 209
artifact hashes and 72 source-input hashes: 71 match the prior observer proof;
the sole deliberate change is the isolated experimental tool lock. Canonical
production pins and reconstructed game source remain unchanged at seven
functions and 304 bytes.

## Reproduce

Start with the accepted ARM7 observer DSD source `67e9a8b` and apply
`dsd-branch-dependency-repair.patch`. The complete source patch SHA256 is
`1f39c170f15b960076a2e30025bff38ba5ffd0889f5b8d345dd5f82d5f6f8124`.
Run the resulting workspace's pinned preparation and offline build commands
in [its README](unarm-1.9.2/README.md). The exact upstream patch SHA256 is
`7bc3175645cba29e54f5d7f13fa6174dafbb44dd6f9aae0ebe4afba23b2da44f`.
No global registry source or upstream repository publication is required.

To rebuild the public synthetic oracle using the recorded native LLVM tools:

```sh
python3 root-oracle/reproduce.py unarm-1.9.2/oracle /private/tmp/fresh-branch-oracle
```

Run the existing whole-ROM verifier from the isolated compatibility producer
with the freshly built, pinned CLI and a new output directory. The canonical
verifier has no alternate-lock argument, so use that producer's experimental
lock. Preserve original ROM/object/ELF outputs privately.

The authoritative [root proof](root-proof.json),
[full compatibility report](root-arm9-compatibility.json),
[metadata comparison](root-metadata.json) and
[source hash comparison](root-source-hashes.json) include actual commands,
inputs and result hashes. Independent gpt-6.1-sol review of checkpoint `a86f78b` reports
[No flags](review.json). This repair earns no ARM7 source, function, executability or
original-relocation credit. T10 remains open, and the native physical baseline
is a separate scope.
