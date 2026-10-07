# Fixed seven-object indexed-load proof

Extend accepted .33's two implementation files and closed contract. `loads.py` owns finite original/object/native checks; `reproduce.py` keeps the one `replay(new_private_directory) -> receipt_path` interface. No generic registry, relocation protocol, new layer, or recipe search is needed.

The fixed native order is lower_store, upper_store, lower_getter, upper_getter, lower_load, upper_load, initializer. The preceding five accepted sources, symbols, object hashes and mixed recipes are unchanged. Upper_store alone retains build 114/O4p. The other six use build 82/O4s. The two new unchanged frozen sources produce actual objects f60e827b… and b3908147…, each 20 ARM bytes, no pool or relocation. Preserve each source basename and function name.

The package owns seven C files, the checked layout, original manifest, fixed seven-role contract, the same two recipes and all helpers. External replay inputs are only ROM and pinned tools. Preserve immutable FiveBindings unchanged: subpriv027f9c08, shared WRAM0380bc90, IRQ400, SYS400, guard03808430. Inspect all actual input hashes and all five native bindings.

Autoload0 has original opaque prefix 20228, seven contiguous actual compiler inputs totaling 460 bytes at[cf04,d0d0), and original opaque suffix 45432. The previous opaque40-byte bridge at[d004,d02c) is replaced solely by direct lower_load.o(.text) and upper_load.o(.text) selectors. No bridge object or incbin supplies either candidate. Other initialized regions and 21424 BSS remain inherited checked layout. Six actual native PT_LOADs retain original entry, allocated identity/flags/payload and truthful section/file-offset correspondence.

Reuse .33 actual ARM object/RELA/native parsing. New load rows require exact20-byte functions/text, ARM$a0/no pool/no relocation and original bytes; other roles retain their existing requirements. The initializer still has twelve actual PC24/-8 records, guard ABS32/0, and explicit .exceptix metadata discard. Read all twelve final BL words and actual resolved callee definitions. Positive actual map/function/boundary/bytes checks cover all seven inputs and both complete original165552-byte images. Original instruction ownership remains finite and source credit 0.

Meaningful negative controls use actual artifacts and unchanged input bytes:

- Seven individual input omissions must return actual LLD failure and retain selected input hashes/argv.
- Swap only the equal-sized lower/upper load selectors. Native linking should succeed, then strict roles reject actual lower-load function/map atd018 and upper-load atd004. Read the actual linked load words/bytes and both real function/map placements. The initializer's twelve final BL targets remain unchanged because it calls the original four accepted callees. This is a load-placement control, not a new runtime-state claim.
- Preserve .33's actual equal-store selector swap: successful native artifact, six changed store BL targets and strict actual role/map rejection.
- Guard+4 changes only ARM7-image byte 21116; inspect all five supplied bindings before strict original rejection.
- Wrong initializer placement+4 fails actual link bounds/size checks.
- Negative-only malformed first PT_LOAD file offset+4 rejects actual section/segment inconsistency.

Tests are written and observed red before new implementation. They consume fresh real compiler/native artifacts rather than hidden fixtures and check exact new object/text hashes, seven native roles/map/functions/bytes, final calls, both complete images, seven omissions, both successful swap outputs and rejected contract, guard/placement/malformed. Publish own replay receipts/readbacks and exact commands; commit new scope only, then check Git-owned artifact pins. No old-capsule edits, object patches, source/flag variations, ABI/names/function-extent claims or credit. Canonical304 and T06/T10 open remain unchanged.
