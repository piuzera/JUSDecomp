# Actual ELF and byte acceptance contract

Candidate only. The next implementation starts with public invented fixtures
and real pinned clang/lld execution. No proposed layout has passed a native
link in this design task.

## Fixed physical layout

| Section identity | Runtime VMA | Initial-load LMA | Stored offset | Initialized size | BSS size |
|---|---:|---:|---:|---:|---:|
| Startup | 0x02380000 | 0x02380000 | 0x00000 | 432 | 0 |
| Autoload(0) | 0x037f8000 | 0x023801b0 | 0x001b0 | 66,120 | 14,920 |
| Autoload(1) | 0x027e0000 | 0x023903f8 | 0x103f8 | 98,976 | 6,504 |
| Original loader table | 0x023a8698 | 0x023a8698 | 0x28698 | 24 | 0 |

All numbers come from checked views, never these example constants at runtime.
Initialized region sizes total 165,528; the table makes the stored image
165,552. BSS totals 21,424 and contributes no stored bytes. Its ranges are
0x03808248..0x0380bc90 and 0x027f82a0..0x027f9c08.

Create one opaque object per original region and a separate table object.
Each region object has an allocated PROGBITS payload and a NOBITS BSS input
only when BSS is nonempty. No SHF_EXECINSTR or STT_FUNC declarations occur.
Generated bookkeeping labels/mapping symbols, if present, are artifact facts,
never original function/mode evidence. The assembler target is independently
fixed ARMv4T/ARM7TDMI, using candidate flags `--target=arm-none-eabi
-mcpu=arm7tdmi -c`; inspect generated attributes in the fixture. This does not
identify the original compiler/SDK/ABI. EABI attributes/flags of generated
artifacts are recorded separately from unknown original ABI.

The linker script explicitly assigns every section's VMA and AT(LMA), exact
input filename/section, alignment and size assertion. ELF sections and PHDRS
are ordered by runtime VMA, independently of original autoload/storage order.
Retain loader order in identities and reconstruction. Never use wildcard
selection that can silently take replacement objects. Entry is the retained
checked header value represented by a generated absolute bookkeeping symbol,
not a manufactured original function.

Use four initialized PT_LOAD segments with `p_memsz == p_filesz == payload
size`, exact VMA and LMA recorded in `p_paddr`, plus one separate zero-file-size
PT_LOAD for each nonempty BSS region. BSS has `p_vaddr == p_paddr == checked
bss.start`, `p_filesz == 0`, and `p_memsz == checked BSS size`. Its separate
segment prevents appending BSS memory length to an autoload's packed-source
LMA range, where it could cover the following payload. Startup has no BSS
segment. Explicit segment association prevents inheritance of the previous
section's LMA delta. Headers and nonallocated attributes are outside payload
segments. Opaque initialized segments use generated PF_R, BSS uses PF_R|PF_W;
these packaging permissions are not original memory-permission evidence.

Validate PT_LOAD ascending VMA order, file/memory size relationships and
alignment congruence. Those are ELF constraints, including zero-file-size
BSS. [ELF program header specification](https://refspecs.linuxfoundation.org/elf/gabi4%2B/ch5.pheader.html)

LLD documents explicit AT(LMA) and NOLOAD/SHT_NOBITS behavior. Its live
reference is newer than our pinned 23.1.2, so actual fixture output, not the
current reference alone, settles pinned behavior and `--nmagic`/alignment
flags. Do not disable section-overlap checks. [LLD linker-script reference](https://lld.llvm.org/ELF/linker_script.html)

## Independent actual artifact validation

The private bounded ELF32 reader validates checked arithmetic for every table,
count, string offset and byte slice. Accept ELF32 little endian, ARM machine,
ET_REL objects and ET_EXEC final artifact only; reject unsupported extended
numbering. Check expected section types, names, addresses, sizes, alignment,
flags, uniqueness and file ranges. Reject unexpected nonempty allocated
sections, relocations, named undefined linkage, function symbols or executable
flags. Empty linker-generated sections may be enumerated explicitly and never
count as payload. Canonical null/section symbols and generated nonfunction
bookkeeping symbols are allowed. Parse attributes sufficiently to prove generated V4T and
reject a V5TE/default substitution; do not add a general ELF dependency.

Verify each initialized section belongs to exactly its declared PT_LOAD,
section and segment byte ranges agree, VMA/PADDR equal the derived addresses,
file payloads do not overlap, initialized physical load extents exactly tile
base..base+stored_size, and BSS segments contain no serialized bytes. PT_LOAD
must be ascending VMA; do not require physical-address order. Any legitimate
ELF file padding remains outside the reconstructed image. Never infer LMA
from sh_addr or confuse it with the NDS program file offset.

Reconstruct using actual linked section contents and checked stored extents.
Every initialized region and table must be read from that ELF. No template
copy, skipped native object, copied prior report or BSS zero-fill substitutes
for these reads. Require each stored offset exactly once, no gaps/overlaps and
no trailing bytes. Compare each byte/hash to checked source slices, the full
image hash, original parameter bytes and ordered table tuple/hash. Record that
objects contain no modeled relocations while original relocation inventory
remains unknown; those are different statements.

## Test-first public matrix

1. Invent a valid two-autoload NDS fixture with unrelated VMA order and loader
   order, distinct initialized bytes, nonempty BSS and a separate table.
   Real pinned LLVM output passes exact section/PHDR/image checks; no ROM is
   required. Include a small/alignment-sensitive case to expose inferred LMA
   padding and a valid empty-startup-BSS case.
2. Before retaining metadata, a test requiring immutable checked entry/header/
   parameter/image/table metadata cannot compile. After implementation, mutate
   the original public Arm7Layout after checked() and prove the view/runner
   keeps the originally checked values and rejects a different program view.
3. Reject wrong full parent/program/header/image/parameter/table pins and
   altered records/extents/order using the real existing checked() path.
   Equal payloads with different child paths/program identities remain distinct.
4. Mutate an actual native ELF section VMA, PHDR PADDR, entry, size, section type,
   flags, table bytes or segment membership; each fails the relevant check.
   Include truncated/overflowing ELF tables, duplicate names, overlapping file
   extents, filesz>memsz and invalid/noncongruent segment alignment.
5. A script/ELF that appends BSS to autoload0's initialized segment, serializes
   BSS or changes its runtime extent rejects. Swapping equal-sized region input
   files, omitting one linked object, adding another allocated section, adding
   an undefined/relocation/function symbol or supplying V5TE attributes rejects.
6. Wrong native tool hash/version, failed assembler/linker, stale output, changed
   input/artifact or a copied passed report grants no verified result. The
   emitted artifact vector must hash actual selected object/script/map/ELF/image.

## Fresh private acceptance

Use the exact pinned parent ROM and both reviewed layouts, consume the layout
file's independently pinned bytes, and execute the freshly built example with
reviewed binary/source/tree hashes and exact clang/lld pins. Each program must
produce its own fresh proof retaining full parent/selector/program identity.
Both reconstructed images must be exactly 165,552 bytes with SHA256
0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139;
all three payload hashes/BSS extents and table/header/parameter/entry metadata
must match checked values. Root independently applies/builds/tests candidate
source and reruns these artifacts before accepting any pin or integration.

Keep existing 55 checked-view/decoder/observer tests and strict parent/child
ARM9 initialization metadata comparisons unchanged. New files/module export
must not change the existing analyzer, mode policy or source accounting.
Metadata reports require `source_bytes=0`, `functions=unknown`,
`executability=unknown`, `original_relocations=unknown`,
`arm7_source_complete=false`, `t10_complete=false` and `bootable_elf=false`.
A physical baseline may pass while these fields remain unresolved.
