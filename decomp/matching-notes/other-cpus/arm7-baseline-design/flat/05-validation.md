# Validation plan

This is a design contract. None of the proposed native baseline commands or
new tests have run. Implementation starts with public invented fixtures and
observed failing tests; private original-byte proof follows only after those
contracts pass.

## Retained authority and input boundary

Use an invented parent/header/image with startup, two autoloads, parameter words
and a loader table. Test that `Arm7Layout::checked` retains the checked full
image, original entry, header identity, parameter extent and physical layout.
Existing region/table getters must describe the same authority. There are no
mutable envelope setters or public constructors for successful baseline receipts.

- Change the expected sidecar digest, actual consumed sidecar, selector or
  selected program hash: reject before native work. Missing and duplicate
  selector matches reject; a same-payload child does not become the parent.
- Mutate header entry, image bytes, parameter words, table records, region
  order/bounds/runtime placement or BSS: the existing physical checker rejects.
  Preserve actual values in successful evidence rather than a mutable wire copy.
- Mutate or discard the parsed sidecar after construction: the retained view
  and consumed digest remain authoritative. A later sidecar reread cannot
  silently replace the input's envelope.
- Use nonzero BSS in a synthetic fixture: reconstructed stored image excludes
  those bytes, while the retained BSS ranges remain in the report.

## Actual native backend, before private ROM

Run pinned clang, objcopy and lld on invented bytes. A mocked stage runner can
exercise reporting failures but cannot establish backend compatibility.

Require ELF32 little-endian ARM, entry zero, exactly one `.arm7_stored` payload
with SHT_PROGBITS/flags zero/storage address zero/alignment four, its exact
input length, and checked ARMv4T attributes. The reconstructed image must come
from that linked section. Verify no allocated or executable payload, STT_FUNC,
`$a`/`$t`/`$d` symbols, or relocation sections were introduced. Permit storage
boundary NOTYPE symbols and ordinary ELF transport metadata without giving
them original-program identity.

The attributes input may have an empty default `.text`. Preserve the raw
compiler object; a cleaned input is allowed only after proving removed default
sections have zero size. Reject any nonempty unexpected section. Record both
hashes and the cleaning command. No meaningful section flattening or removal
is allowed. Whether this backend contract is achievable is an explicit first
probe question, rather than an assumed property of LLVM.

## Failure gates and provenance

Each case must emit a failed diagnostic report and no success receipt:

- Pre-existing output directory, absent tool, wrong tool hash/version, skipped
  linker, nonzero stage exit or missing required output.
- A section byte mutation, truncation, unexpected payload, changed flags,
  executable/function/mapping metadata, nonzero entry or wrong architecture
  attribute in the linked ELF.
- Producer source, staged link input or tool mutation between pin checks and final publication, including
  replacement of a symlink's executable target. Capture actual commands and
  input object hashes, rather than reconstructing an intended command later.
- A reconstruction path that bypasses the ELF. A test must change the linked
  payload while leaving original input intact and observe failure, preventing
  a direct original-slice copy from masquerading as linker output.

Original inputs to the library are immutable consumed byte snapshots. Their
hashes bind the artifact to those exact bytes; the library has no source-file
paths and cannot promise that a caller's files remain unchanged after loading.
If the canonical shell requires that stronger file-freshness assertion, it
must reread its paths before accepting the library receipt. Such a shell check
does not replace the build's staged-input and output checks.

Assert reports distinguish `native_runtime_placement=false` from independently
checked runtime metadata. The flat ELF cannot detect an independently changed
runtime description on its own; that is why consumed-sidecar and checked-view
validation is mandatory. Do not rename that independent gate as an ELF VMA or
BSS placement proof.

## Private original integration

After backend and input contracts pass, run parent and exact
`ChildRom/JSS2Child.srl` as separate fresh builds with separate complete program
identities. Each must reconstruct exactly 165,552 bytes from its own ELF:
165,528 initialized region bytes followed by the original 24-byte table.
Independently verify three physical regions and 21,424 BSS bytes, original
header/entry/parameters, actual consumed sidecar hash and complete tool inputs.
Identical payload hashes never collapse the two program identities.

All reports retain zero source/function/relocation/executability credit.
Absence of relocations in the new transport object says nothing about original
ARM7 relocation inventory. Nothing in these tests establishes a function extent
or original code classification. Existing eight-byte observations are not
inputs to executable section flags.

If the retained-view change is selected, rerun its current public checked-view,
module-input and observation tests and the fresh canonical ARM9 19-stage proof.
The existing 304 verified ARM9 source bytes must retain their exact evidence;
this candidate adds none. Root owns integration and canonical proof publication.
