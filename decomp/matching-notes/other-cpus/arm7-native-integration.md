# Optional native ARM7 payload integration

The option requires a freshly executed, independently approved physical ARM7
producer. It accepts no prebuilt payload directory or detached success report.
The [approval template](arm7-native-approval.pending.json) is deliberately
pending and rejects. The independently reviewed producer now has an
[approved capsule](arm7-physical-baseline/approval.json), including the ELF
snapshot fix and reviewed source/native-tool pins. That approval covers the
producer; canonical integration acceptance remains separate.

The existing verifier arguments remain. To enable native ARM7 integration add:

```sh
--arm7-native-manifest "$APPROVED_REPO_LOCAL_MANIFEST" \
--arm7-native-producer "$PINNED_PHYSICAL_PRODUCER"
```

Both arguments are required together. The approval declares schema version 1,
status `approved`, producer SHA256, reviewed 40-digit source commit/tree,
nonempty repository-relative `source_artifacts` hash map, and repository-relative
layout/native-pins files with SHA256. These durable artifacts record independent
source-origin acceptance; an adjacent unbuilt Rust checkout is not needed.
The native-pins sidecar supplies absolute clang/lld paths, exact hashes and
versions. Production ARM9 tool pins are unchanged.

One `arm7_native_baselines` stage runs before freshness, bringing an enabled
source pipeline to 20 stages while leaving the default 19 unchanged. The helper
captures the actual executable/cwd/argv/stdout/stderr/exit and requires exactly
parent plus `ChildRom/JSS2Child.srl` in reviewed layout order. Artifacts are new,
contained, nonsymlinked and exhaustively digest-checked against the directly
captured receipt. Native commands, link inputs, map, physical segment metadata
and zero-credit scope must match their declarations. Input/tool snapshots are
rechecked before consumption. Compiler/tool symlinks are pinned by their actual
bytes; artifact symlinks are rejected.

The helper returns a live operation with an immutable private copy of that
actual execution. Its `report` property yields a separate JSON audit copy.
Canonical verification passes the live operation separately through packing;
the audit report must exactly equal its captured record. Deserialized or
rewritten reports cannot supply that operation. Standalone `rom_roundtrip.py
--build-report` rejects ARM7 reports and requires rerunning the verifier.
Rechecks also compare receipt to captured stdout and rebuild the complete
expected input-pin inventory from the unchanged approved manifest/native pins.

The approved builder owns ELF validation and reconstruction. Its accepted
implementation must bind the validated ELF byte-buffer hash through publication;
the wrapper does not implement a second ELF parser. The packer hashes and uses
the exact read image buffer, writes parent ARM7 at its checked header offset,
and writes child ARM7 at the original exact FNT/FAT child interval plus that
child's header offset. Both appear as explicit native write records despite
equal images. No BSS bytes are inserted. Existing original-header, whole-child
and whole-ROM equality checks remain required.

Public invented-ROM tests execute a real fixture producer to prove orchestration
and failure handling, not native ELF correctness. The integration grants no
source bytes or functions. ARM9 17-module/87,493-relocation/304-byte source
contracts and global unknown scope remain separate. Independent root proof at `cef286f` passes all 20 stages and all 248 tests
with zero skips. Both native ARM7 artifacts are consumed beside the 17 ARM9
payloads, yielding 19 writes and 243 actual artifact hashes. The ROM remains
exactly 67,108,864 bytes with the original hash. Source stays seven functions
and 304 ARM9 bytes; global source coverage remains unknown. Independent
gpt-6.1-sol review of `e38bf84` reports No flags. See the
[proof](arm7-native-integration-proof/root-proof.json) and
[review](arm7-native-integration-proof/accepted-review.json). T10 remains open.
