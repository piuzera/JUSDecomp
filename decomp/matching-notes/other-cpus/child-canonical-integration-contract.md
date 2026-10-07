# Child ARM9 canonical verification contract

This design adds a fresh child ARM9 reference build and exact encoding to the
canonical parent ROM proof. The parent packer writes the compressed ARM9 slice
from the newly encoded child and the child ARM7 slice from its independent native
producer. Child source bytes and source functions remain zero. T10 remains open.

The inspected JUS base is `a3e3dd6116a09523b87e9df6820f75699c0c6868`.
ARM7 integration is a prerequisite. Its supplied interface was inspected at
`80209c7f90fab21238639ebadf17e05dde98ca73`, without assuming acceptance.
That checkout's `arm7_native_baseline.py` SHA256 is
`d92a2436ca05ad6d38a79c75c17374354aeea56177155555abf58424ff4dcaf7`;
its `rom_roundtrip.py` SHA256 is
`eed2dc2614c5ba9ba5ac8eca26c50feca371fc5202e4c195d22ee9050e6fbb01`.

## One fresh canonical stage

Add one bounded helper, `tools/scripts/child_native_baseline.py`. Its build
operation runs inside the verifier's new `child-arm9/` directory. The proposed
call accepts the original parent, the existing verified tool pins, the approved
codec pin, the repository root, and the current build ID and start time. It
returns an immutable live operation with a report and a recheck method, following
the ARM7 integration's existing ownership model. A loaded JSON report cannot
substitute for this operation.

The canonical stage is `child_arm9_native_roundtrip`. When child verification is
selected, its stage is mandatory before `freshness`, the module checkpoint, and
parent ROM packing. The final stage sequence retains mandatory `rom_roundtrip`
and `rom_freshness`. No successful child bypass is available in that mode.
The helper returns outer `status: passed` only after the following checks pass;
it retains the codec's separate `binary_roundtrip_verified` result unchanged.
`record_stage` currently rejects that codec status as a direct stage result.

1. Revalidate the pinned original parent and its exact NitroFS mapping. Require
   `ChildRom/JSS2Child.srl`, file ID 79, its FAT extent, and its whole-program
   hash. Generate the executable row from the actual parent with
   `verify_other_executables`. Select exactly the full child identity plus ARM9,
   never the first ARM9 row in a saved ledger. Extract the selected child bytes
   to a fresh contained file and bind its digest to the original parent slice.
2. Run the approved repaired DSD CLI's extraction and strict `init` in this fresh
   directory. Record actual commands, tool hashes, exit codes, logs, generated
   config, symbols, sections, relocations, and delink layout. Retain strict call
   validation. The known generated `delinks_path` correction changes only that
   exact path, records both config digests, and rejects a missing expected field.
3. Run `delink`, `lcf`, and the existing native linker with the independently
   pinned clang and lld. Select the three original gap objects exclusively.
   `verify_link_record(child_build, tools)` verifies actual argv, LCF, script,
   original and normalized objects, attributes, and selected inputs. Also bind
   `link.map` to its actual `-Map` argument and digest in this reference-only
   path. Every artifact belongs to the current build and passes containment,
   symlink, freshness, required-file, and unchanged-input checks.
   Require exactly the original three gap objects and their independently proved
   raw digests from `child-arm9-native-baseline.json`, before normalization.
4. Run DSD module checks on the freshly emitted images and symbol checks on the
   diagnostic `dsd-check.elf`. Independently check the canonical `linked.elf`
   sections, initialized prefixes, emitted-image metadata, and original BSS
   boundaries for all three modules. Use `verify_extracted_arm9_modules` for
   original expanded-byte comparison. It permits only the known four-byte
   compression pointer normalization in main. Parent `direct_comparison` cannot
   check compressed child intervals directly.
5. Check live original relocations from the three fresh unnormalized reference
   objects against canonical `linked.elf`. Require all 35,092 slots, no failure,
   no unresolved slot, and no source-mode fallback. The pinned type counts are
   type 1: 10,755, type 2: 20,440, and type 10: 3,897. Module totals are ARM9:
   34,992, ITCM: 78, and DTCM: 22. Never use normalized objects or the diagnostic
   ELF as the original relocation authority.
6. Call existing `repack_child_arm9` with the exact fresh executable row and the
   three actual native files. Require its encoded ARM9 and whole-child checks.
   Re-read the output inside the build, compare its size and digest to immutable
   expected values, and retain those validated values before publication. Include
   the original child, encoder, helper sources, approval inputs, all child
   artifacts, and the rebuilt child in the canonical freshness inventories.

The child live operation rechecks the captured report before opening artifacts,
then rechecks current program identity, inputs, tools, commands, reference
   objects, ELF geometry, original relocation result, and encoded output. It returns
one payload buffer with full program and CPU identity, absolute ROM offset,
program start and end, validated source-file digest and slice offset, linked ELF
path and digest, and `source_bytes: 0`. Recheck again before parent publication.
Do not compute expected hashes from potentially mutated output files.

## Disjoint physical writes

The original child occupies parent `[0x23b800, 0x4464c8)` and has 2,141,384 bytes.
Its original SHA256 is
`1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986`.
Derive each write from that program's checked header and current original FAT
mapping, then compare with these pinned extents.

| Producer | Child-local stored extent | Parent ROM extent | Bytes |
| --- | --- | --- | ---: |
| Fresh child ARM9 link plus codec | `[0x4000, 0x1e1874)` | `[0x23f800, 0x41d074)` | 1,955,956 |
| Independent child ARM7 native producer | `[0x1e1a00, 0x20a0b0)` | `[0x41d200, 0x4458b0)` | 165,552 |

The gap between the executable writes is 396 bytes. Preserve that gap, the
header, both filesystem tables, padding, assets, and signature from the original
template. Child FNT is nine bytes at `0x20a200`; FAT is empty at `0x20a400`.
Keep the child ARM7 producer's own program identity even though its image equals
the parent ARM7 image.

Extend the existing parent packer by one child live-operation argument. Keep one
occupied-extent list for all 17 parent ARM9 writes, the child ARM9 slice, and both
ARM7 writes. Write the child ARM9 slice before the ARM7 writes. Reject duplicate,
overlapping, header-crossing, or out-of-program writes. Never write the complete
rebuilt child into the parent and then overwrite its ARM7 subrange.
After both child writes, require the exact whole-child hash. Existing parent
header, FNT, FAT, raw NitroFS, padding, byte equality, and whole-ROM hash checks
remain valid and unchanged. The expected parent SHA256 is
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.

## Existing encoder interface and pins

`child_compression_probe.rs` consumes input path, fresh output path, and decimal
compression-start offset. It writes raw BLZ bytes, checks decompression against
its input, and emits no metadata. The packer creates temporary `expanded.bin`
and `encoded.bin`, invokes the encoder with start `16384`, and deletes both
temporary files. Its retained output is `output.path`, a complete rebuilt child.
Its report includes `output.bytes`, `output.sha256`, `stored_arm9_sha256`, and
`stored_arm9_bytes`. Read the retained child's validated header range to obtain
the compressed payload. Neither codec nor child-packer API needs expansion.

The packer joins main 2,624,320 bytes, ITCM 3,968 bytes, DTCM 96 bytes, and the
original 24-byte autoload table. It clears the compression pointer at expanded
offset `0xbb8`, encodes, then restores the generated value `0x021dd874` in the
uncompressed prefix. Require original stored ARM9 SHA256
`af35ea24071b08f50eef9d28cf5ed4686b0110679b5389ac43ce8254d6e13fc7`.
These expanded modules do not have separate direct stored-ROM write ranges.

The independent codec proof pins unchanged ds-rom 0.8.0 source
`3bfef542191764df2afa39254bbf18f68c621d22`, crate checksum
`1198474d0a87563e36273f87278d1fddf595e88f8c4c5fe4c51ca28e264409e1`,
example source SHA256
`9baf8ab864540b9eaca6b7916f57074459ce89b5b95bb98d62bfa2c3180783c6`,
and original Cargo.lock SHA256
`836cf74bb237bf4ca61295c586af6a09564fb8e2620405ff8b863639c97907e2`.
Its release-fast macOS ARM64 codec SHA256 is
`99f89606cc359780861c44416cf7b6bae8fc2af1afa8a29e9ecb94914d1c3c51`.
The recorded build context is repaired DSD
`78630f8f54835e0e627cd4e45a9626d88c307f8b`, upstream parent
`9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe`, rustc 1.98.1.
Approve this codec's actual binary and complete consumed source context
independently. A rebuilt codec requires its own reviewed digest and build
evidence. A new analyzer pin does not implicitly approve a codec rebuilt there.

## Limits and concrete integration prerequisites

The prior native child proof used repaired CLI SHA256
`d1117b6126a27c3c1f8d429840c61671f492d7bcb22bedc84e42ed8509a5041f`.
Frozen base `a3e3dd6` still locks the original unrepaired release. Canonical child
strict initialization needs the independently accepted repaired analyzer pin
from the pending ARM7 integration, followed by a new child run with that exact
pin. Historical reports do not authorize copied build outputs. The saved
`residual-executables.json` also contains obsolete capability statuses.

The native child ELF's actual `e_entry` is `0x02000000`, set by
`--entry=ARM9_TEXT_START`. The original ROM header entry is `0x02000850`.
Preserve and validate the ROM header entry independently. This ELF proves linked
payload and BSS layout, not bootability. Original compiler, ABI, SDK match,
source functions, broader executable discovery, and child source completeness
remain unresolved. Preserve the current parent source accounting rules.

The remaining implementation is the bounded fresh child helper, a reviewed
codec approval, its mandatory canonical stage and freshness inventory, and the
one disjoint child ARM9 write. No encoder change or generic ROM builder is
needed. The generic builder's empty-FNT panic and layout rewriting remain
outside this contract.

## Source grounding

Graph lookup did not contain these current JUS Python functions, so references
below use exact frozen files. Compressor lookup succeeded in `ds-rom-t10-0.8.0`.

- `tools/scripts/child_rom_roundtrip.py:12-17,26-43,44-109` owns encoding and
  original-byte equality, and explicitly delegates native provenance to callers.
- `tools/scripts/other_executables.py:203-236,245-270` checks actual parent,
  NitroFS child identity, and the bounded compression-pointer comparison.
- `tools/scripts/native_link.py:261-301,323-364` emits actual ELF prefixes,
  separate diagnostic metadata, ARMv5TE attributes, and actual link inputs.
- `tools/scripts/verify.py:75-113,123-139,185-256,327-363,528-553` owns strict
  stage order, live provenance, original relocation totals, direct comparison,
  final freshness, and source credit after full verification.
- Supplied ARM7 integration at `80209c7`: `arm7_native_baseline.py:13-29,119-214,
  217-326` captures the live operation and derives checked payloads;
  `rom_roundtrip.py:117-155,211-280,283-310` enforces disjoint ARM7 writes and
  rechecks producer evidence before publication.
- ds-rom 0.8.0 `src/compress/lz77.rs:121-132` returns encoded bytes with footer;
  `src/rom/arm9.rs:472-490` updates the generated compression pointer.
- `decomp/matching-notes/other-cpus/child-baseline.md:25-65`,
  `child-arm9-root-baseline.json`, `child-codec-root-build.json`, and
  `child-rom-root-roundtrip.json` record independent producer results and pins.
- `decomp/matching-notes/other-cpus/child-roundtrip.md:40-52` records generic
  builder obstructions and independent codec and whole-child proof.

This document records a proposed integration. It runs no new builds, tests,
ROM packing, or emulator checks and changes no production pins.
