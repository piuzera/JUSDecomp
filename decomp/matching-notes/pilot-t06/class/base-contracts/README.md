# Observed CommonEffect base contracts

These notes describe original ARM9/main code reached by the existing pilot.
They add no source targets or source credit. The accepted canonical source
remains 304 bytes: 260 instruction bytes and 44 literal bytes across seven
functions. All seven source hashes match the independently reproduced canonical
clone report at producer `4d84b69`.

Graph discovery located the original identities. Its ASM function nodes have no
call edges, and snippets extend into adjacent functions, so the analysis used
explicit original `arm_func_end`/`thumb_func_end` boundaries and authoritative
DSD extents. [evidence.json](evidence.json) records 25 examined function extents,
modes and hashes. Each extent matches the original extraction and baseline ELF.
The ELF `.arm9` section also contains zero-filled BSS; its first 656,832 bytes
match the original initialized ARM9 payload, with 706,400 additional BSS bytes.
No original instruction bytes or extracted payloads are published here.

## Three base entry points

`func_02015d0c(self, incoming_r1, incoming_r2)` calls `func_02024024` before
overwriting the object's vptr with `data_0209c30c`. It clears byte `self+0x78`
and increments the word at `data_020a0c34+0x4c`. It calls virtual slot `+0x0c`
on the object currently stored at `self+0x14`, replaces that word with the object
at `data_020a0c34+0x48`, then calls the new object's slot `+0x08`. It explicitly
returns the original `self`. Neither virtual result determines that return.

The incoming `r1` is preserved by `func_02021848` and invoked as an address with
`r0=self`; its result is stored at `self+0x64`. For this pilot the address is
`func_02024a30`. The matched derived constructor forwards that token unchanged
and supplies zero in `r2`. These observations establish the callback use at this
seam, not its original C++ type or a general third-argument contract.

`func_02015dd4(destination, original)` calls `func_020240a4` with those inputs,
installs `data_0209c30c`, copies byte `original+0x78` to `destination+0x78` and
increments the same global `+0x4c` word. It explicitly returns `destination`,
ignoring the lower copy routine's return value. The matched clone separately
copies the derived halfword at `+0x80` and installs `data_0209e114`.

`func_02015ed8(self)` decrements the global `+0x4c` word, calls
`func_0201cf24(self+0x6c)`, then `func_02021f3c(self)` and explicitly returns
the original `self`. It has no direct vptr write and no direct call to release
the allocation containing `self`.

## Observed physical storage

Offsets below are ARM memory offsets, not recovered C++ member declarations.
The table records writes and operations seen in the bounded base call chain.

| Offset | Constructor behavior | Copy behavior | Destruction behavior |
| --- | --- | --- | --- |
| `+0x00` | Successive vptr address writes | Same layered vptr writes | Three lower vptr address writes |
| `+0x10` | Cleared by `0202f378` | Word copied by `0202f450` | No operation established here |
| `+0x14` | Input/default object, then replaced by global `+0x48`; slot `+8` calls | Word copied from original, then slot `+8` | Slot `+0x0c` if nonzero |
| `+0x18` | Cleared | Cleared | Slot `+4` if nonzero |
| `+0x1c` | Cleared before lower registration helpers | Cleared, then populated by lower copy calls | Traverse nodes and call `(node-0x20)` object's slot `+0x0c` |
| `+0x28` | Halfword cleared; helper effects remain possible | Halfword copied, low-byte bit `0x10` cleared | No direct destruction write established |
| `+0x29` | Bit `0x04` set by `02024024` | No separate final write established | No direct destruction write established |
| `+0x2c` | Cleared before later helper effects | Cleared before later helper effects | Slot `+8` if nonzero |
| `+0x30` | Address `data_020a11b8` installed | Original object's slot `+0x18` result stored | Slot `+4` unless null or `data_020a11b8` |
| `+0x34` | Global `+0x24c` word stored | Original word copied | Dereferenced for unregister call with `self+0x20` |
| `+0x38` | Cleared | Cleared | If nonzero, `0201b484` then allocation release dispatch |
| `+0x3c` | Word loaded through `self+0x34`, offset `+0x254` | Original word copied | No further operation established here |
| `+0x40` | Address `func_0202836c` installed | Original word copied | No further operation established here |
| `+0x44,+0x48,+0x4c` | Cleared by `02021848` | Cleared before lower copy calls | No direct disposal of these words established |
| `+0x50` | `0x30` allocation, conditionally initialized by `02029f94` | Original object's slot `+0x10` result stored | Object's slot `+0x0c`, without a null check |
| `+0x54,+0x58` | Cleared | Words copied | No direct disposal established here |
| `+0x5c` | Cleared before later helper effects | Populated through original collection virtual calls | Traverse nodes and call `(node-0x48)` object's slot `+4` when adjusted pointer is nonzero |
| `+0x60` | Cleared | Cleared before later helper effects | No direct disposal established here |
| `+0x64` | Incoming callback result stored | Original object's slot `+0x54` result, with destination argument | Slot `+4` unless null or global `+0x3b8` sentinel |
| `+0x68` | Global `+0x234` word stored | Initially global word; selected virtual results can replace it | No direct disposal established here |
| `+0x6c..+0x77` | Initialized 12-byte descriptor with new 4-byte allocation | Fresh descriptor and allocation, rather than copying its bytes | Stored allocation pointer passed to release dispatcher |
| `+0x78` | Byte cleared by `02015d0c` | Original byte copied by `02015dd4` | No direct read or clear established here |
| `+0x80` | Derived constructor clears halfword | Derived clone copies halfword | Matched destructor entries do not directly access it |

Lower initialization and copy helpers can perform additional writes through
virtual calls. This is therefore a list of established operations, not an
exhaustive claim about final field values or original member types.

## Descriptor allocation and storage release

`func_0201cf08` initializes the descriptor at `self+0x6c`: word `+0` is zero,
word `+4` is zero, halfword `+8` is zero, and halfword `+0x0a` is one.
`func_02010970(descriptor, 4)` then stores four at descriptor `+4`, allocates
`4 * halfword(+0x0a)` bytes through `func_0201a228`, and stores its result at
descriptor `+0`. This proves the 4-byte request and physical layout; it does not
establish container names or all descriptor invariants. `02010970` leaves the
allocator result in `r0`; its callers here ignore that result.

`func_0201cf24(descriptor)` passes the stored pointer to `func_0201a9ec`. That
dispatcher returns one after its pooled-release path through `0201b120`, or
zero when that path does not handle the pointer. On zero, `0201cf24` calls
`func_0201a958(pointer, 1)`. The latter reads the allocation header at
`pointer-0x20`, optionally invokes its callback, zeroes the allocation's first
word, adjusts allocator accounting and unlinks its header before `0201a31c`.
`0201cf24` returns the descriptor address, regardless of those callee results;
it does not explicitly clear the descriptor's pointer.

The matched deleting wrapper `func_0206cfa4` first calls `02015ed8(self)` and
then separately calls `func_0201b244(self)`. `0201b244` uses the same
`0201a9ec`/conditional `0201a958(pointer,1)` dispatch for the containing
allocation. The wrapper ignores both results and returns its saved `self`
address. That machine return does not establish a usable object after release
or an original C++ return type. The nondeleting entry `func_0206d010` performs
only the base destruction call and returns its saved pointer.

## Vptr transitions and balanced operations

Construction writes the following addresses at `self+0`, in order:
`02094370` in the lower `0201453c` helper, then `02094f78`, `020990e0`,
`0209c1e0`, `0209c0b4`, `0209c30c`, and finally derived `0209e114`.
The copy chain has the same observed writes before the clone's derived write.
Destruction through `02015ed8` writes `0209c1e0` in `02021f3c`, `020990e0`
in `02027450`, then `02094f78` in `0202f5b4`; no additional terminal vptr
write is established in that call chain.

The global words at `data_020a0c34+0x4c`, `+0xc4` and `+0x2a4` each have
observed constructor/copy increments and destructor decrements at successive
layers. Their semantic names and cross-thread behavior remain unknown.
The `+0x14` object receives slot `+8` on lower initialization/copy, slot
`+0x0c` before replacement in `02015d0c`, another slot `+8` on replacement,
and slot `+0x0c` during lower destruction. This is consistent with a
retain/release protocol. It remains an interpretation: the dynamic target
identities and their bodies have not been resolved here.

`02021f3c` and `02027450` perform the field and collection disposal calls
listed above. The former excludes the global `+0x3b8` sentinel at `+0x64`;
the latter excludes static `data_020a11b8` at `+0x30`. `02027450` also calls
virtual slot `+0x5c` through its newly installed vptr, then unregisters
`self+0x20` through `02037c24` before lower destruction. The extra calls in
`0201b484` concern the `+0x38` allocation's internal chain; they do not delete
the outer `self` allocation.

## Required inputs and unresolved semantics

Every entry assumes writable, suitably aligned incoming storage and valid
reachable objects. Several virtual calls are unconditional: construction's
old and replacement `+0x14`, copy's original `+0x14`, `+0x50` and `+0x64`,
and destruction's `+0x50`. Their lack of checks does not prove a global
nonzero invariant. Release dispatch likewise assumes a pointer valid for its
allocator protocol; no safe null-release behavior is established here.
Collection traversals assume valid links and embedded-object offsets.

Original class names, member types, smart-pointer ownership, collection element
types, dynamic disposal targets, exception safety and callback C++ types remain
unresolved. No constructors or destructors in this analysis are promoted to
new source. The virtual configuration candidate's unproven nonzero invariant
and incoming saved-register failure paths remain blocked; this analysis neither
reopens that candidate nor invents a precondition.

## Independent verification

Root hashes all 25 function extents directly from the pinned original ROM.
The reviewer also verifies the baseline ELF/extraction, zero BSS extent,
metadata and canonical source pins, and the bounded original call chains.
[Root verification](root-verification.json) records these checks. The notes
add zero source bytes and leave native ownership types and T06 unresolved.
