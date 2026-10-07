# Direct MW ARM7 object link trial

Pinned LLD 23.1.2 accepted the actual MWCC `-O4,p` ELF object from the [bounded C trial](arm7-leaf-c-trial.md). It placed the object's 20-byte `.text` at `0x037fcf18` in autoload0 for both the parent and `ChildRom/JSS2Child.srl`. The linked ELF's six load segments reconstruct each original 165,552-byte ARM7 image exactly. The image SHA256 is `0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`; the two BSS sections remain separate at 6,504 and 14,920 bytes.

This is a private physical-link feasibility result. It grants zero ARM7 source credit. The original function extent, ABI, source identity, relocation contract, runtime behavior, and external store address ownership remain unproved. T10 remains open.

## Link boundary

The proof uses the actual MW object SHA256 `03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf`, not a copy of its compiled bytes in `.incbin`. It consumes the object's `.text` directly in one `.arm7.autoload0` output section. The original 66,120-byte opaque autoload0 section is replaced with a 20,248-byte opaque prefix, the 20-byte object input, and a 45,852-byte opaque suffix. A BSS-only object replaces the 14,920-byte BSS section formerly supplied by the whole opaque object. The remaining startup, table, and autoload1 opaque objects are unchanged.

The linker script pins `__leaf_start = 0x037fcf18`, `__leaf_end = 0x037fcf2c`, the 20-byte difference, and the original autoload0 size. The positive link exits zero for both program identities. Its map names `compiled.o:(.text)` at `0x037fcf18`, and its symbol table places the trial symbol there with size 20. The linked ELF keeps the original six load-segment VMA, LMA, file and memory sizes, flags, and order. The autoload0 output **section** has flags 6 (`ALLOC|EXECINSTR`) because it now contains `.text`; its **load segment** retains flags 4. This section-flag difference is confined to the proof. The production opaque-baseline validator still expects flags 2 for that section and was not changed.

The verifier reads the original images from the ROM for both identities, hashes the pinned tools and all consumed inputs before and after the experiment, and reconstructs each image from ELF load-segment payloads. It checks that every nonleaf autoload0 byte, the other initialized regions, all six segments, and both BSS extents match the accepted physical baseline. A mutated load-segment offset was rejected by the verifier. An actual 36-byte MW baseline object, SHA256 `182ebed8e905dd0b2b1eb363d0efefa7864e03ded84db7c1804110c1eea52bff`, fails the LLD leaf-end, leaf-size, and autoload0-size assertions; it also overlaps the fixed BSS and next load address.

[proof.json](arm7-leaf-link-proof/proof.json) records the input, tool, object, linker-script, ELF, map, and log hashes; exact link argv; section and segment layouts; symbols; and negative stderr. The binary objects, original ROM, linked ELFs, maps, and full logs remain in `/private/tmp/jus-arm7-leaf-link-worker-proof/actual-04` and are not committed. To reproduce in a fresh private directory with the same pinned inputs, run:

```sh
python3 decomp/matching-notes/other-cpus/arm7-leaf-link-proof/run.py /private/tmp/NEW_EMPTY_ARM7_LINK_PROOF
```

The input MW object has no relocation sections or entries. A successful direct-object link therefore proves object acceptance and exact section placement under this LLD and linker script, but does not test relocation handling for future MW objects. It does not establish the original link contract or convert the C hypothesis into approved source.
