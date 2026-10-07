# ARM7 payload integration grounding

Read-only preparation at JUSDecomp `691e5781368306b8ec577d484dd9a84bfb951086`.
No integration code or tests were added. The physical native baseline is still
awaiting acceptance; this document does not accept its proof or grant source
credit. The JUSDecomp graph returned no verifier/repacker nodes, so exact source
reads supplied this trace. There is no `tools/scripts/repack_rom.py` at this
commit: the canonical packer is `rom_roundtrip.py`.

## Existing control and provenance flow

`verify.verify` (`tools/scripts/verify.py:366`) rejects an existing output,
creates one build ID/start timestamp, and snapshots producer/config/metadata
files at 380–404. Intake at 413–423 binds the original ROM. Tool checks at
425–469 bind actual executable hashes and versions, including compiler DLLs
when source is enabled. Source contexts include declared headers/forced headers
and include-directory files (`source_context_files:54`).

Extraction/delink, optional source compilation and native ARM9 linking run at
475–498. `verify_link_record:185` rechecks actual lld/clang, LCF/script, selected
object provenance, exact argv/input hashes and source link map. ARM9 module and
symbol checks, direct ELF/bytes/layout comparison and independent original
relocation checks run at 501–518. `require_relocation_result:249` demands the
full pinned count/type inventory; the accepted original count is 87,493.
Source ownership at 523–526 is a separate gate.

`freshness:528` rechecks source/tool/config/ROM snapshots and hashes only the
listed fresh output directories. `verified_module_checkpoint:89` requires exact
module-stage order, deep-copies the report and creates a passed checkpoint.
That checkpoint permits packing before the final whole-ROM stages have run.
`roundtrip_rom` is called at 545–546; `require_rom_freshness:97` then rechecks
all input snapshots and recorded artifacts, requires a contained nonsymlink
fresh ROM, and binds its expected original hash. Final success and source
coverage are published only at 549–553.

The source-enabled sequence is exactly 19 stages; baseline-only has 15.
`require_stage_sequence:75` rejects extra stages as well as missing, skipped or
failed ones. An optional ARM7 stage therefore needs an explicit required
sequence variant, including the module checkpoint and packer's recheck. It
cannot simply be appended or silently ignored.

## Current writes and preservation

`rom_roundtrip._layout:56` independently validates original ARM9 header,
autoload/table and overlay/FAT placements. `rebuild_rom:117` copies the original
ROM and writes all 17 ARM9 payload extents from actual native files. It has no
ARM7 or child-payload argument. ARM7 and every non-overlay NitroFS file remain
the original bytes in that initial copy.

`verify_repacked_rom:137` separately checks header, compression, overlay tables,
FNT/FAT and ARM9 payloads. It checks parent ARM7 at 171–173, all non-overlay FAT
assets (including the whole child) at 174–178, then all ROM bytes at 179–180.
Thus successful equality currently proves preservation, not native ARM7 input
participation.

`_verify_build:190` requires live checkpoint/artifact evidence, fresh contained
paths, original-ROM provenance and current ARM9 link records. It recomputes
direct comparison, source-object checks and source ownership at 214–244.
`roundtrip_rom:251` runs those checks before and after constructing the ROM,
rejects an existing output, rereads the original, writes exclusively, and checks
the reread output. These are the ownership points for additional live ARM7
artifact evidence; accepting a detached JSON status is insufficient.

The child-specific `child_rom_roundtrip.repack_child_arm9:12` is an independent
experimental ARM9 writer. It requires original child/header/hash identity,
assembles native expanded ARM9 images, freshly invokes the pinned encoder,
checks inputs before publishing, and writes the original child layout
(lines 26–108). It preserves ARM7 and explicitly leaves native-link provenance
to its caller. Canonical `verify.py` does not call it. Adding child ARM7 alone
requires no encoder or child ARM9 activation: its compressed ARM9 stays intact.

`other_executables._nitrofs:76` already resolves exact FNT paths to
`(file_id, start, end)`. `verify_other_executables:203` cross-checks these with the
inventory, verifies the whole child identity, and returns zero-credit residual
metadata. There is no Python child ARM7 write API. A bounded splice can reuse
that checked locator; no generic ROM builder or invented Config/Module is
needed. The documented generic child builder loses exact layout and fails on
the empty child filesystem; see [child roundtrip](child-roundtrip.md).

## Smallest proposed optional contract

Keep the existing default pipeline unchanged. After native-baseline acceptance,
an explicit ARM7 option supplies the approved physical-baseline producer and
independently pinned layout/native-tool sidecars. Run it once into a new child
directory of the canonical output, require exactly parent plus
`ChildRom/JSS2Child.srl`, and accept neither a prebuilt payload directory nor a
no-link mode. Add one required `arm7_native_baselines` stage before freshness
in that option's exact sequence; all original 19 source-enabled stages retain
their order and gates. The selected sequence has 20 stages, rather than making
a false unchanged-stage-count claim.

The stage must bind actual invocation/stdout/stderr/exit, parent ROM, consumed
sidecar bytes, reviewed producer executable/source-lock provenance and actual
clang/lld pins to the current build. Add those files to input snapshots and
the native ARM7 subtree to artifact hashes. Capture the receipt directly from
that successful fresh invocation, rather than loading a detached report. At
repack, recheck every actual artifact against that receipt and current build.
The accepted producer already establishes ELF/layout/image validation; the
consumer preserves that proof by verifying its exact artifact digests.

Pass two validated payload receipts to the existing packer as an optional
argument. Each receipt needs complete program identity/CPU/selector; parent,
program and header hashes; stored-image offset/size/hash; original entry;
parameter/table/region/VMA/LMA/BSS metadata; contained ELF/image/report and
actual link-input artifact paths/hashes; reviewed producer/tool/input pins;
current canonical build ID/start; and evidence of the fresh pinned invocation.
No arbitrary address/path-to-bytes map is accepted.

For parent, derive the write interval from the original header and checked
envelope. For child, resolve the exact path from original FNT/FAT, validate
the full selected child and its own header, then write at
`child_start + image_offset_in_child`. Check unchanged sizes, containing bounds
and nonoverlap with ARM9 writes and metadata. A temporary child copy with only
that ARM7 replacement must retain the original whole-child hash before being
placed back into its unchanged FAT extent. The parent ARM7 and child ARM7 each
consume their own reconstructed artifacts despite equal payload hashes.
Hash the exact reconstructed byte buffer that will be spliced and compare it
to the fresh receipt before use; hashing a path then rereading unchecked bytes
would leave a consumption race.

Keep existing whole-ROM equality checks unchanged. Add two write records with
complete program identities, native artifact paths/hashes and actual offsets;
recheck receipts/artifacts before publishing and during final ROM freshness.
Child ARM9 compression, headers, filesystem tables, assets and padding remain
the original template bytes. No BSS bytes enter either stored image.

Do not pass these opaque objects through ARM9 LCF normalization, source object
overrides, source ownership or the 87,493-slot checker. Source accounting at
`source_accounting.summarize_coverage:281` remains ARM9-specific, with global
percent `None` and unresolved ARM7/embedded source scope at 408. Keep 304 matched
ARM9 source bytes and report ARM7 native binary preservation separately, with
functions/executability/original-relocations unknown and zero source credit.

## Existing native interface and acceptance conditions

The tentative writer was inspected in
`/private/tmp/jus-arm7-physical-baseline-dsd` during this pass; it is not accepted
production API. `build(view,pins,out)` uses the checked envelope and returns
serializable identity/layout, invocation, selected-input, segment and artifact
metadata. The example `lib/examples/arm7_physical_baseline.rs:14` already hashes
both consumed sidecars, checks original inputs and its producer binary after
building, and reports their digests (20–61). It does not independently supply
the canonical build ID/timestamps or require exactly the canonical two-program
set; canonical integration must supply those constraints.

No new public Rust revalidation API is required under this contract. The pinned
builder runs freshly, owns the controlled empty output, validates ELF/layout,
reconstructs its image, and emits the directly captured receipt. Canonical
checks bind its actual executable/cwd/argv/exit, exact program set, current
build, contained paths and every artifact digest. A second ELF validator would
duplicate a proof already made by that accepted execution. Detached report or
prebuilt-output acceptance is explicitly outside this contract.

The producer must bind the digest of the exact ELF byte buffer read for
validation and reconstruction, then require the file to retain that digest
through receipt publication. Hashing the ELF only later is insufficient:
validate E0, replace it with E1, then hash E1 can pair image(E0) with an invalid
ELF(E1) in an apparently self-consistent receipt. The writer is fixing that
real race with TDD; this document does not claim the fix has passed. Repair the
producer snapshot rather than adding a modeled consumer validator. Bind input
snapshots and image/output digests with the same authority discipline.

Acceptance of the physical baseline, producer/source closure and those exact
snapshot guarantees remain prerequisites. Under them, digest checks preserve
the established proof; no counterexample requiring a second public validator
was identified. A caller that cannot ensure fresh pinned execution must not
use this optional integration mode.

## Proposed public negative tests

- Missing, old, symlinked, truncated, corrupt or replaced image/ELF/input/map;
  changed ELF payload with unchanged original ROM must reject ELF participation.
- Swap parent and child receipts/directories while keeping identical image
  hashes; require exact program context and contained current-build artifacts.
- Alter parent or child header/entry/image offset, original child hash, exact
  selector, FNT/FAT identity, consumed sidecar or declared layout/BSS/table.
- Missing one program, duplicate program, extra selector or reused producer
  output; skipped/failed builder or a copied success report cannot pass.
- Mutate producer/source lock, native tool, sidecar, staged link input or output
  during build/repack; rechecks must fail before successful publication.
- Replace the ELF after its validated read but before later artifact hashing:
  the producer's validated-buffer digest must reject publication. Replace an
  image between a path hash and its consumed read: the packer's exact-buffer
  check must reject. These test the snapshot boundaries, not duplicate parsing.
- Assert both native payload paths appear in writes, ELF-derived bytes reach
  their exact original intervals, and ARM9 17-module/87,493-slot/304-byte source
  results remain unchanged. Optional-stage checks reject extra or skipped
  stages; the existing default 19-stage sequence still passes unchanged.

These are proposed tests only. This pass ran no compiler, native baseline,
ROM repack, emulator or new source proof.
