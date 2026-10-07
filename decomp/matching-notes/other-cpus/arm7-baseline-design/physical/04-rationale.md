# Native physical sections from immutable checked views

## Problem

The existing ARM7 view establishes original program identity, ordered stored
payloads, runtime destinations and BSS arithmetic. ARM9's native LCF path
assumes V5TE, ARM9 entry symbols and padded LMAs. We need native physical
payload/layout evidence before original ARM7 function and relocation metadata
exist, without making those assumptions or laundering a byte copy into source
coverage.

## Usage (caller's view)

The three caller examples in `01-usage.md` define `02-shape.txt`. One
`build(&checked_view, &native_pins, empty_output)` operation hides generated
opaque inputs, tool pin validation, section/segment layout, native execution,
actual ELF validation, byte reconstruction and freshness. The example performs
checked program selection and final original-file freshness before serializing
metadata. Callers never supply a second layout or an ARM9 config.

## Shape

Retain the already checked envelope privately in Arm7View. Add one native
physical-baseline module with a private fixed-format ELF32 reader and one
metadata-only example using the existing serde_json dev dependency. The checked
view owns immutable truth; the runner owns LLVM artifact representation. No
unchecked JSON capsule crosses that boundary. Per boundary-discipline, only
checked views enter the operation; actual external tools/artifacts are checked
at their own boundary. Per single-source-of-truth, layout derives from the view
rather than another metadata copy supplied by the caller.

The interface is deep: three arguments and one typed success result replace
caller orchestration of ELF address policy, BSS, original table bytes, linker
inputs, reconstruction and provenance. Its longest meaningful path is caller,
native runner, existing checked view. Private ELF parsing remains bounded to
the fixed objects/sections/segments we generate, per laziness-protocol; it is
not a new general ELF service.

Three initialized sections retain independent runtime VMAs and initial-load
LMAs; table and BSS are separate. PHDRS follows runtime order, reconstruction
follows checked stored order. Original absolute words/branches remain opaque
unchanged bytes. No invented original symbols/relocations or executable section
classification is necessary.

## Synthesis decision

This is the physical-section candidate for the parent's arena comparison.
No winner or cross-judge verdict is asserted. The candidate changed from an
exporter/Python sketch to direct Rust ownership after inspection confirmed the
library can retain checked metadata and already has hashing/serialization.
The Python capsule boundary hid less of the identity/metadata policy and added
an independently mutable representation. This design removes it.

## Tradeoffs accepted

- We accept a small private ELF32 reader in exchange for no new dependency and
  one authoritative checked-view/native-verification ownership boundary.
- We accept generated data-only objects and no original relocation model in
  exchange for exact physical byte/layout evidence now; source and full ARM7
  analyzer/linkage completion remain unresolved.
- We accept separate BSS PT_LOAD segments and an ELF that is not claimed bootable
  in exchange for unambiguous packed payload versus runtime zero-fill evidence.
- We accept native file padding and generated attributes as artifact metadata
  in exchange for reconstructing stored bytes from validated sections rather
  than pretending the ELF file itself is an NDS payload.

## Alternatives considered

A flat stored-image ELF hides native wrapping and hashing but leaves callers to
validate runtime region/BSS assignment outside the native result. It gives the
smallest stored-byte proof, but not this complete physical-section contract.

A checked Rust exporter plus Python native runner could reuse the current
Python ELF reader. It exposes a new mutable capsule and makes ownership,
metadata freshness and original-program binding cross two implementations.
That is more public coordination for this bounded input than a direct runner.

Extending ARM9 native_link.py/Module/Config would reuse linking but imports
ARM9 defaults and demands nonexistent ARM7 original symbols/function/section/
relocation data. The interface would expose analyzer decisions this task cannot
settle. It loses on both truthful scope and implementation size.

## Open questions and risks

Will pinned clang/lld produce the exact sorted PHDRs, explicit LMAs and isolated
zero-file-size BSS described in the public fixture? This is the first native
red/green check, not a reason to claim it already works. Can the private bounded
ELF parser prove V4T attributes without accepting undocumented emitted forms?
If not, reject the candidate artifact and narrow the supported form explicitly.
Which final tool revision includes the separately isolated dependency repair
jus-bjry.16? Pin the independently reviewed combined candidate only after that
repair is settled; do not silently substitute a source revision or upgrade
production pins. None of these needs an owner interview.

## Next implementation step

Write the public invented checked-view/native-layout fixture and red immutable-
envelope/actual-ELF mutation tests, then retain checked metadata and implement
the single native operation against that fixture before using private bytes.
