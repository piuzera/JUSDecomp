# Initializer: external native constructor diagnostic

This diagnostic restores the original label-before-key argument load order, but accepts no source. Both requested contexts emit the same 604-byte initializer, against the original 596 bytes, with 107 masked differing byte positions. The strict raw-object gate rejects the extent before it reaches the unresolved constructor identity. No symbol binding, alias, patch, section removal, link, canonical activation, or source credit is performed. Base: `a89e7ccd48dfbc2738181dbb5c94c4d36dd66273`.

`external_constructor.cpp` starts from the closest [resource_view.cpp](../initializer-virtual-view/resource_view.cpp). It declares an external native constructor on the existing physical `Flags` record, defines only an ordinary inline placement `operator new` returning supplied storage, and replaces the direct call with placement construction. The argument identities/order, allocation, physical assertions, resource virtual view, and all later field/vptr stores remain intact. The constructor has no body. `Flags` is an experimental physical view name, not evidence of the original C++ class, type, ownership, or ABI.

Exactly two contexts ran: `-O2` and `-O2,p`. Both raw object hashes are `d730f56d3e0343ced55e646826d8d3d8c2b77e585a96529dc40427b87e59fc6f`. Only `.text` and original function `func_0206c244` are emitted; the placement helper emits no separate body/data/RTTI. The native constructor remains undefined as `_ZN5FlagsC1EPKcS1_`.

## Distinct compiler-lowering observations

The native constructor call loads label `data_0209e26c` into `r2` before key `data_0209e280` into `r1`. Their pool identities also occur in that original order. The previous direct-call/member-bridge forms reversed both. This is a concrete source-shape finding; it does not establish the original source-language constructor identity.

Despite the existing outer non-null branch, placement construction adds another compare at TU `+0x1c0` and another conditional branch at `+0x1cc`, skipping the constructor when its storage is zero. The constructor call moves from original offset `456` / `0x1c8` to compiled offset `464` / `0x1d0`. The later pool moves by eight bytes. The post-call stores use the same register roles as the original: `r1` holds the intermediate vptr and `r0` holds zero. The original sequence at `+0x1cc..+0x1e4` is byte-identical to the candidate sequence at `+0x1d4..+0x1ec`. The diagnostic still fails its complete extent and masked comparison.

| Compared call record | Offset | Relocation type | Addend | Actual symbol |
| --- | --- | --- | --- | --- |
| Intended original flags call | 456 | PC24 (1) | -8 | `func_0202c4ac` |
| Emitted external native constructor | 464 | PC24 (1) | -8 | `_ZN5FlagsC1EPKcS1_` |

Each object has 31 relocation records, with the same ordered type/addend pairs as the original. Offsets differ, and the constructor identity differs. The label/key pool offsets are original `580`/`584`, compiled `588`/`592`. [report.json](report.json) records every original and compiled relocation, offset/type/addend comparison, exact masked positions, hashes, and strict failure. The intended-call association is an annotation of the diagnostic source shape only. It is never substituted into a relocation or used to pass the gate.

The original complete TU hash is `d60cee80415aa0f15843da8b1fdcc7a51b5265fc57e58f9634cce02d8508a4c9`. Toolchain context remains package `2.0/base` (`3.0 build 114`), pinned Wibo runner/runtime libraries, CPU `arm946e`, ARM/little-endian/32-bit ABI, `-Cpp_exceptions off`, and header-free `-nostdinc`. All pins and actual commands are in the report. The diagnostic concludes after the requested two contexts. No full-ROM claim is possible while the complete object differs.

## Actual-tool tests and reproduction

Four tests first failed because the diagnostic source was absent. The first source run then exposed two incorrect test assumptions: the real extent was 604, and the first original-reference rejection was the extent check. The tests now record those specific facts. All four pass with actual pinned tools: shifted physical storage fails the compiler's layout guards; no extra function/helper is emitted; private class-name and label mutations fail strict relocation identity comparison; and the untouched original-reference gate rejects the 604-byte object. Source mutations use private copies only.

```sh
JUS_INIT_MWCC=/absolute/path/mwccarm.exe \
JUS_INIT_WIBO=/absolute/path/wibo-macos \
JUS_INIT_REFERENCE=/private/path/delinks/src/main/common_effect_init.o \
python3 -m unittest discover -s tests/matching -p test_initializer_external_constructor.py -v
```

Reproduce only the two saved contexts in a fresh ignored output directory:

```sh
python3 decomp/matching-notes/pilot-t06/initializer-external-constructor/reproduce.py \
  --compiler /absolute/path/mwccarm.exe --runner /absolute/path/wibo-macos \
  --reference-dir /private/path/delinks --output build/external-constructor-rerun
```

[contexts.json](contexts.json) pins the source and contexts; [verification.json](verification.json) records zero acceptance and the tests. Original/compiled objects remain private under ignored `build/`. Public files contain reconstructed diagnostic source and metadata only.
