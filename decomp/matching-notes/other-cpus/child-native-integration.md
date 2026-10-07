# Canonical child ARM9 native integration

The optional child stage strictly initializes and natively links the actual
embedded ARM9, validates all 35,092 original relocation slots, and recompresses
its payload into the exact original layout. It runs alongside the independent
paired ARM7 stage. The source-enabled pipeline has 21 stages and 20 disjoint
writes. Root and worker reproduce the exact 67,108,864-byte parent ROM and the
2,141,384-byte child. Independent gpt-6.1-sol review reports No flags for source `320ea2a` and
exported proof/trail `8b7cc6a`. Acceptance is recorded in
[accepted-review.json](child-native-integration-proof/accepted-review.json).

The new `child_native_baseline.py` owns extraction, strict initialization,
reference-object linking, three initialized images and BSS boundaries, original
relocations and exact encoding. Its immutable live operation supplies only the
compressed ARM9 slice. A saved JSON report cannot recreate that operation or
authorize packing. The standalone packer rejects the real passed report and
creates no ROM.

All 20 extents validate before any write. Child ARM9 occupies parent
`[0x23f800,0x41d074)` and child ARM7 occupies `[0x41d200,0x4458b0)`.
The packer checks the whole child after both child writes. Header, filesystem
tables, assets, padding, signature and the 396-byte gap remain exact.

The parent production analyzer pin stays `22258743…`. Child analysis uses the
separately approved CLI `3f18db59…`. The clean upstream codec is separately
approved as `5c04f266…`. Follow [the tool capsule](child-tool-approval/README.md)
to reproduce its source/build identity. The existing ARM7 approval and its
16 source artifacts remain unchanged.

## Run the integrated proof

Run the normal source verification command from the repository root, retaining
its ROM, DSD, LLVM, source manifest, compiler and runner arguments. Add the
paired ARM7 arguments and these four required child arguments:

```sh
--arm7-native-manifest decomp/matching-notes/other-cpus/arm7-physical-baseline/approval.json \
--arm7-native-producer "$ARM7_PRODUCER" \
--child-analyzer "$CHILD_ANALYZER" \
--child-analyzer-approval decomp/matching-notes/other-cpus/child-tool-approval/analyzer-approval.json \
--child-encoder "$CHILD_CODEC" \
--child-codec-approval decomp/matching-notes/other-cpus/child-tool-approval/codec-approval.json
```

The default source path retains 19 stages, paired ARM7 has 20, and adding child
has 21. Reference-only paths have 15, 16 and 17 stages respectively. A selected
child path requires both tool approvals and the independent ARM7 operation.

## Evidence and limits

[Root proof](child-native-integration-proof/root-proof.json) binds the actual
root and worker reports, zero-skip 257-test log, source comparison and standalone
rejection. The actual build retains 302 artifacts, including 59 child files.
Its initial source inventory has 80 hashes: 73 prior hashes remain unchanged,
two verifier/packer scripts intentionally change, and five child inputs are new.
The child operation separately binds 46 consumed input and tool pins.

Nine public tests cover live authority, stage selection, write bounds, mutation,
atomic snapshot merging and initial child source capture. A separate real child
operation rejects 21 late artifact/report mutations. The implementation rejects
conflicting snapshot unions before updating anything, so a later child digest
cannot replace an earlier parent expectation.

All 87,493 original parent ARM9 slots and 35,092 original child ARM9 slots pass
with zero failed or unresolved slots. Matching-source credit remains seven
parent functions and 304 bytes. Child ARM9 and ARM7 source credit remain zero,
global coverage is unknown, and T10 stays open. The child ELF entry is a payload
comparison convention distinct from the original ROM entry; bootability and
emulator smoke are unproved. Original ARM7 functions, executability and
relocations remain unknown.
