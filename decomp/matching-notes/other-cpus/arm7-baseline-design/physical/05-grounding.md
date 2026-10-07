# Source grounding and candidate limits

JUS design base is 146ce2b42db93a507158a5bcd30d15177272aca4. Checked tool
source is 67e9a8bc65fba0e5cdc3ab784c77de28253ee3dc. Graph discovery in
`ds-decomp-t10-pin` found no ARM7 view/adapter nodes; exact current files were
read as the required fallback. The earlier pinned Function graph/flow confirms
that this design must not enter ARM9 analysis, but that parser is unchanged.

## Checked input ownership

| Exact checked-source location | Grounded behavior | Design consequence |
|---|---|---|
| lib/src/rom/arm7.rs:48, ProgramIdentity | Parent hash, parent/NitroFS selector, selected program hash | Preserve full context even when image bytes match |
| lib/src/rom/arm7.rs:63, Arm7Region | Original stored extent, runtime base, BSS and hash | Derive both addresses from checked descriptions; no invented section classification |
| lib/src/rom/arm7.rs:90, Arm7RegionView | Private cloned description/byte borrow/checked BSS; readonly accessors | Source payloads and allocation truth remain immutable |
| lib/src/rom/arm7.rs:116, Arm7View | Identity, startup, autoload views and table; checked envelope absent | Retain header/entry/image/params/table metadata privately in checked() before native build |
| lib/src/rom/arm7.rs:198, Arm7Layout::checked | ARM7/V4T/ARM7TDMI policy, parent/program hashing and exact selection | Native build takes only checked view, never caller CPU/settings |
| lib/src/rom/arm7.rs:213..241 | Exact header ARM7 offset/size/base/entry, header and image hashes, ds-rom full_data equality | These checked values must be retained, not recovered from later mutable layout |
| lib/src/rom/arm7.rs:250..273 | Startup parameter hash/tuple and entry bounds | Preserve original parameter bytes and header entry; no function declaration |
| lib/src/rom/arm7.rs:277..333 | Ordered regions, alignment/overflow/nonoverlap, complete stored coverage and exact table record tuples | No gaps/omissions/order substitutions or serialized BSS |
| lib/src/rom/arm7.rs:335..351 | Clones checked region metadata, computes BSS, constructs view while dropping envelope | Minimal construction-site extension only |
| lib/src/rom/arm7_modules.rs:47..58 | Physical inputs in loader order; table excluded | Keep table separate and retain original region index |
| lib/Cargo.toml:12..30 | sha2/serde/bytemuck present; serde_json is dev-only; no library ELF reader crate | Private bounded ELF32 reader, metadata example with existing dev dependency |

## Existing JUS native boundary

`tools/scripts/native_link.py:21` has a Python Elf32 section/symbol reader but
no full program-header validation; reusing it would require a new trust boundary
and new parsing regardless. At :212 the LCF translator aligns successive LMAs
to 32 bytes. At :328..330 it emits ARMv5TE attributes/flags; :336 uses the ARM9
entry symbol and disables section checks. These are concrete reasons for a
separate physical operation, not a generic rewrite of the working ARM9 path.

`decomp/toolchain.lock.json` pins native clang and lld 23.1.2. Their hashes are
respectively d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5
and 3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54.
Reuse those exact binaries only after independently checking their paths,
hashes and versions. Its ARM9 attribute flags are not an ARM7 policy. No
production lock changes are included in this design.

## Existing acceptance and new claim boundary

`arm7-observation-root-proof.json` independently accepts exact source 67e9a8b:
55 public tests, both checked program views, four eight-byte observations and
unchanged strict parent/child ARM9 metadata. That proof explicitly says source
zero, linked ARM7 baseline false and executability unknown. It is input
confidence, not execution evidence for this new native operation.

The pinned `arm7-checked-layouts.json` records the parent/child complete
identities and per-program header hashes. Both ARM7 images share size 165,552
and SHA256 0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139.
Consume and pin exact sidecar bytes independently rather than hardcoding a
rolling documentation file's hash. Parent and child require separate fresh
results; shared image bytes do not authorize cross-program artifact reuse.

No original bytes, objects or ROM paths are published. The design's numeric
layout is metadata. All opaque payload/object/ELF/image outputs remain private
and ignored. No native physical baseline was run in this candidate task.
Original symbols/relocations/function extents, code/data split, source/SDK/ABI,
startup external RAM and ARM7 source completion remain unresolved.

## Red-flag screening

One public operation hides native execution and layout validation; callers do
not coordinate extraction/link/repack phases. The immutable Rust view is the
single ownership source; no unchecked serialized capsule is accepted. Native
ELF details stay private behind typed success; report serialization is output
only. The operation owns physical layout knowledge rather than scattering
steps across process adapters. No pass-through ARM9 config facade is added.
The parent still needs to compare this full physical candidate with its other
candidate; this screening is not independent technical acceptance.
