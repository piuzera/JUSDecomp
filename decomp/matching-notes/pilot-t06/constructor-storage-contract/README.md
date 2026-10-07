# Original constructor storage contract

`func_0202c4ac` has 84 ARM instruction bytes at `0202c4ac..0202c4ff` and two literal words at `0202c500` and `0202c504`. Its original DSD symbol and raw ELF extent are **92 bytes**, ending before `0202c508`. The Atlas catalog's 84-byte size excludes the pool. This capsule adds machine evidence to T06. It supplies no reconstructed source or trial release. ARM9 source credit remains 304 bytes, ARM7 source credit remains zero, and global readiness remains unknown.

The [contract](contract.json) pins the owner ROM, 56 repository inputs, the DSD tool, all researched function payloads, the original RELA records, and caller contexts. The replay starts from the ROM and produces fresh extraction and original objects. It does not require the old private linked ELF, saved disassembly, analysis catalog, or main checkout.

## Storage and normal return

Incoming `r0` supplies writable storage, `r1` supplies a zero-terminated key, and `r2` supplies an optional zero-terminated label. These register roles and the Common Effect 40-byte allocation were already established in [initializer-context-audit.md](../initializer-context-audit.md). The following full write sequence, minimum extent, pool accounting, counter update, and other caller contexts are the additional contract.

| Instruction | Storage write | Width | Value |
| --- | --- | --- | --- |
| `0202c4b8` | `+0` | 4 | Existing table address `02098708` |
| `0202c4c0` | `+4`, `+8` | 4 each | Zero, incoming key |
| `0202c4cc` | `+c` | 4 | Incoming label when nonzero, otherwise key |
| `0202c4d8` | `+10` | 2 | Low 16 bits returned by `020326b0(key)` |
| `0202c4e4` | `+12` | 2 | Low 16 bits returned by `020326b0(selected label)` |

The highest storage write ends at `+14`, so this routine requires at least 20 writable bytes. It does not establish the complete size of an enclosing object. It allocates nothing and has no null storage or null key guard. The label fallback avoids a null label only when the key itself is valid. At normal return, `r0` is exactly the incoming storage. The routine saves and restores `r4`, consumes eight stack bytes temporarily, and returns through the saved caller address.

The two direct calls are at `0202c4d4` and `0202c4e0`, both targeting the same 44-byte original helper `020326b0`. That helper reads signed bytes until zero and updates a 16-bit accumulator. It has no calls and no null input guard. This supports string consumption without claiming an SDK hash identity or source type. After the helper calls, the routine reads the word at `020a0c34+30c = 020a0f40`, adds one modulo `2^32`, and writes it back at `0202c4f8`. On the observed normal return path, `r1` holds `020a0c34`, `r2` holds the incremented word, and `r3` still holds `02098708`. These machine outputs are not additional source-language return values.

| Address | Original relocation | Symbol | Addend |
| --- | --- | --- | --- |
| `0202c4d4` | `R_ARM_PC24`, 1 | `func_020326b0` | -8 |
| `0202c4e0` | `R_ARM_PC24`, 1 | `func_020326b0` | -8 |
| `0202c500` | `R_ARM_ABS32`, 2 | `data_02098708` | 0 |
| `0202c504` | `R_ARM_ABS32`, 2 | `data_020a0c34` | 0 |

The raw relocatable 92-byte payload hashes to `99a2e3de6812ecf0366223735c539fbfad732b6b63c7eab8708047d4c361660b`. The original ROM's loaded payload hashes to `3b9caafec617800aa88608cf74a33b764525fa947907e2654a85867ede6a55ba`. RELA branch addends and unresolved literal words explain their different hashes.

## Actual callers

The eight main catalog caller functions and the 21 mixed query references remain different counts. Fresh original RELA records plus direct ROM instruction decoding prove **13 direct call sites in 11 functions**, comprising nine main calls in eight functions and four ov012 calls in three functions. This is the direct reference inventory of the original 15 objects for 17 ARM9 modules. It does not include an exhaustive dynamic or indirect caller set.

| Caller function | Actual call sites | Storage, key and label at the call |
| --- | --- | --- |
| main `02011e7c` | `02011e84` | Incoming `r0/r1/r2`; no allocation here. Final table `02099c4c`. |
| main `02011edc` | `02011ee4` | Incoming `r0/r1/r2`; no allocation here. Final table `020985b8`. |
| main `02012e94` | `02012e9c` | Incoming `r0/r1/r2`; no allocation here. Final table `02097b38`. |
| main `02013038` | `02013040` | Incoming `r0/r1/r2`; no allocation here. Final table `02097a90`. |
| main `02020f7c` | `02021080`, `0202140c` | Separate 20-byte allocations through `0201a228`, each guarded against zero. Keys `2DPos` and `Color`; labels `2D位置` and `色`. Manager receives the retained pointer, including zero. |
| main `020216e8` | `020216f0` | Incoming `r0/r1/r2`; no allocation here. Its main parent allocates 104 bytes on the observed paths. Embedded records start at `+14`, `+30`, `+4c`; self pointers occupy `+2c`, `+48`, `+64`. |
| main `0206c244` | `0206c40c` | Previously settled 40-byte allocation through `0201a21c`, zero guard, key `EffectFlags`, Japanese label, intermediate and final table writes. |
| main `0207a52c` | `0207a534` | Incoming `r0/r1/r2`; no allocation here. Final table `020979e8`. |
| ov012 `021b0660` | `021b06a2`, `021b0742` | First allocates 20 bytes through `0201a21c`, guards zero and saves the pointer in parent `+20`. Second allocates 104 bytes, guards zero, builds the embedded records, then passes the retained pointer to manager virtual `+3c`. Exact ov012 key and label literals are in JSON. |
| ov012 `021b0860` | `021b0868` | Incoming `r0/r1/r2`; no allocation here. Final table `02099c4c`. |
| ov012 `021b08ac` | `021b08b4` | Incoming `r0/r1/r2`; no allocation here. Final table `020985b8`. Its observed wrapper `021b0880` forwards incoming storage unchanged. |

Every simple forwarding wrapper retains storage in `r4`, overwrites `+0` after the call, and returns that retained storage. Their local code establishes no allocation provenance or ownership. The JSON records full original extents and hashes, including caller literal pools, rather than treating catalog code-only sizes as complete ELF extents.

The ov012 evidence uses ROM overlay-table record 12, load base `021ac1c0`, NitroFS file ID 12, FAT range `001e6e00..0020fd60`, and uncompressed flags zero. The original Thumb BLX bytes at `021b06a2` and `021b0742` decode to main `0202c4ac`; their relocations are `R_ARM_THM_PC22`, 10, addend -4. The two ARM BL sites have `R_ARM_PC24`, 1, addend -8. Region identity comes from the ROM header, overlay table and FAT, not numeric address equality.

## Reproduce

From this repository, use the owner ROM and the DSD 0.12.0 macOS ARM64 asset pinned in [toolchain.lock.json](../../../toolchain.lock.json). Choose an output directory that does not exist.

```sh
python3 decomp/matching-notes/pilot-t06/constructor-storage-contract/check_original.py \
  --rom /path/to/jus.nds \
  --dsd /path/to/dsd-macos-arm64 \
  --output /tmp/jus-constructor-readback
```

The replay verifies the source and tool pins before creating output. It reuses unchanged `verify.prepare_config` and `verify.expected_modules` to copy and prepare original metadata, strips source selections as that existing helper prescribes, runs only DSD extraction and original delinking, and reads ELF through unchanged `native_link.Elf32`. No compiler or linker runs. It compares fresh main and ov012 extraction with direct original ROM slices, all researched full function payloads, all four outgoing constructor relocations, all 13 incoming relocations, both helper call destinations, the 21 constructor instruction words, and both literal values. It also binds every one of the 15 original objects by inventory digest. The output contains DSD logs and `readback.json`.

The author's fresh replay passed with 15 original objects, 13 direct sites and 11 caller functions. The root independently extracted and delinked the ROM, read the 92-byte extent and four outgoing records, and decoded every main and ov012 call from actual original bytes. Saved Atlas state and findings were consulted first and contained no finding for `0202c4ac`; those historical observations are discovery aids, not runtime inputs to the replay.

The first committed checker at `5e9c3cb` incorrectly allowed optimized Python to run with its assertion gates disabled. The corrected checker rejects `-O` and `-OO` before imports or output creation. [integrity-controls.json](integrity-controls.json) preserves the original false-pass readback and records both optimized invocations exiting 1 without creating their output directories, followed by a fresh normal replay passing all gates. Its finite helper closure is unchanged. `verify.py` and `native_link.py` import only standard-library modules at module scope; `verify.load_script` is never called by the two preparation helpers used here. The existing 56 input pins therefore cover all consumed repository dependencies. Python and its standard library remain explicit external runtime inputs.

## Remaining gate

This contract supports preallocated storage and a key plus optional label at the machine boundary. It does not identify the original C++ class, mangled constructor binding, ownership, or allocator failure policy. The caller's zero guard supplies no throwing or nothrow guarantee. No new evidence releases another compiler trial. The next safe action is to record a bounded source design that explicitly resolves or excludes those unresolved bindings, and obtain the separate trial release before implementing it. T06 stays open.

## Acceptance evidence

Fresh root and independent replays passed. Root raw ELF and ROM readers and the independent execution trace are retained beside the contract. The accepted package has 27 strict published artifact pins. All 56 runtime repository pins also match the existing 119-input catalog. Nine have identical Git and working bytes; 47 are the existing LF blobs consumed as CRLF under unchanged attributes. The earlier owned conversion record remains unchanged and is pinned by this acceptance.

After committing, verify published pins and the existing checkout-byte relation:

```sh
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/pilot-t06/constructor-storage-contract/acceptance.json
ROM_TRIAL_TEST_ROOT=/private/tmp/UNUSED_CONSTRUCTOR_READBACK PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-arena-rom-proof -p 'test_*.py' -k test_declared_checkout -v
```
