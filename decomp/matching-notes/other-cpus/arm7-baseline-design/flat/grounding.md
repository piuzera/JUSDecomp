# Grounding and current caller flow

This candidate follows the earlier
[analyzer architecture grounding](../../arm7-observation-design/grounding.md),
but does not extend function analysis. New physical-view facts below come from
exact tool commit `67e9a8bc65fba0e5cdc3ab784c77de28253ee3dc` in
`/private/tmp/jus-arm7-analysis-design-bounded`. The existing graph index did
not contain the new `Arm7View`/module-input types, so these files were read
directly. References are source locations at that commit, not proposed API.

## Checked physical inputs

`lib/src/rom/arm7.rs:73` declares the sidecar layout: complete program identity,
fixed CPU/ISA/processor, header and full image identity, base/entry, parameter
identity, ordered regions and table identity. `Arm7Layout::checked` at line 198
checks fixed ARM7/ARMv4T/ARM7TDMI, hashes the actual parent and selected program,
and selects the child by exact NitroFS path (lines 199–210). Header values and
hash are checked at lines 213–222; full stored image at 232–241.

The same boundary checks startup and parameters at 242–270, entry inside
startup at 272–274, contiguous stored order and nonoverlapping runtime/BSS
ranges at 277–308, and the exact original table and its records at 310–332.
Only after all checks does it create borrowed region views at 335–351.

The returned `Arm7View` at 116 retains identity, startup, autoloads and table.
Its getters at 123–140 expose those checked values, but there is no retained
full-image/header/entry/parameter envelope. This is a concrete loss of already
validated physical authority. The proposed envelope retains it in the existing
checked domain object, without creating a mutable second layout authority.

`lib/src/rom/arm7_modules.rs:47` derives module inputs from the checked view in
loader order, excluding the table. Each input at line 38 retains complete
physical identity, initialized bytes and BSS bounds. It deliberately lacks
the full stored image/entry/header/table envelope needed by either baseline
candidate. Its fixed target getter at 96 and bounded decoder at 103 do not
infer original executable ranges or functions.

## Current consumed-sidecar caller

`lib/examples/arm7_observation_probe.rs:32` reads the layout sidecar and line 34
hashes the bytes against the expected pin before parsing. At lines 44–45 it
iterates layouts and calls `layout.checked(&parent)`. Lines 72–73 recheck inputs
and line 80 records the consumed layout digest. Thus the probe already owns a
strict shell-level digest check, but the checked view itself does not retain
that pin or the full envelope. The baseline input boundary must bind these
together; a caller-supplied digest beside an unrelated view is insufficient.

`lib/src/analysis/arm7_observation.rs:127` accepts checked module inputs and
explicit selected spans. Its report retains unproved executability. Neither
the observation sidecar nor displayed instructions establish full functions.
The opaque baseline does not consume those observations or derive mapping
symbols, function symbols, relocation claims or executable flags from them.

## Proposed caller flow and owners

Thin CLI reads parent bytes, exact selector, pinned sidecar and locked tools.
`PinnedArm7Input::load` hashes the consumed sidecar, selects exactly one layout,
and invokes the existing actual-byte checker. The checker creates the retained
immutable envelope. `FlatArm7Baseline::build` then owns all native artifact,
reconstruction, independent physical-layout, freshness and receipt checks.
Public operations are load/build; callers do not coordinate an exposed chain
of object creation, linking and optional checks. See the
[module map](03-module-map.md) and [type sketch](02-shape.rs.txt).

## Existing native-link boundary

At root design base `146ce2b`, `tools/scripts/native_link.py:157` translates
ARM9 MW LCF layout; line 211 introduces 32-byte output alignment and line 212
SUBALIGN(4). Its entry and ISA are explicitly ARM9-specific: attributes source
at 327 uses ARMv5TE, clang at 330 uses `-march=armv5te`, and lld at 336 uses
`ARM9_TEXT_START` and overlapping-overlay options. Actual input/tool provenance
at 342–349 is a useful reporting precedent, but calling this adapter unchanged
would apply the wrong ISA/entry/layout assumptions. The new candidate's bounded
data-only native backend is separate and still requires actual synthetic proof.

## Public metadata cross-check

The consumed [checked-layout sidecar](../../arm7-checked-layouts.json) at this
design base hashes to
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
Its two complete identities are parent and exact `ChildRom/JSS2Child.srl`.
Both store 165,552 ARM7 bytes with image SHA256
`0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`,
but their selected program/header/image offsets differ. Original entry/base
is `0x02380000`; 432 + 66,120 + 98,976 initialized bytes and the 24-byte table
exactly cover the stored image. BSS is 14,920 + 6,504 = 21,424 bytes outside it.
These facts are physical accounting, not code/function/ownership recovery.

See [checked view](../../arm7-checked-view.md),
[module inputs](../../arm7-module-input.md), and
[observation contract](../../arm7-observation.md) for existing scope and evidence.
