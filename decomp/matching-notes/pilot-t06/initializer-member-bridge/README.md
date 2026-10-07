# Initializer: trivial flags member bridge

This bounded shape accepts no source for original `func_0206c244`. Exactly three requested compiler contexts produce an object identical to the previous closest declaration-only resource-view candidate. The approach is finished without expanded contexts, canonical changes, or source credit. Production coverage remains 304 bytes. Base: `d2b9705a29f9a77fd6fca251cf80abd84e0290ed`.

`member_bridge.cpp` starts from [resource_view.cpp](../initializer-virtual-view/resource_view.cpp). It adds only a trivial inline ordinary `Flags::Construct(key, label)` member that calls original `func_0202c4ac(this, key, label)`, then replaces the caller's direct call with that member call. It leaves the two original string identities and semantic argument order, fields, all intermediate/final vptr writes, resource virtual view, and remaining initializer statements intact. It introduces no constructor lifetime, placement new, inheritance, symbol alias, register/volatile hint, or section removal. The physical member view does not identify the original C++ type or ownership.

| Saved context | Complete original-object gate | Emitted target extent |
| --- | --- | --- |
| `-O2` | Failed: two swapped relocation identities | 596 bytes |
| `-O2,p` | Same failure | 596 bytes |
| `-O2 -inline all` | Same failure | 596 bytes |

All three raw compiled objects have SHA256 `59f122ce4465797a7872bdf98b77d9ea461ab91af553e12dcd6e41d0110577a7`. Their `.text` SHA256 is `4f8d63ade9c3acc4da74234ba5ca6a768774f0baaa4754e1ad840fa2a5f271d6`. They emit only `.text`, containing only `func_0206c244`; the bridge emits no extra function, data, RTTI, or helper section. Both complete object hashes and relocation records match the prior `resource_view` results under `-O2` and `-O2,p`, as recorded in [report.json](report.json).

Masked differences from the original remain at TU byte offsets `449` and `453`, in the instructions at original `0206c404` and `0206c408`. The original loads label `r2` before key `r1`; this candidate retains key `r1` before label `r2`. ABS32 pool slots at offsets `580` and `584` remain reversed: original label `data_0209e26c`, then key `data_0209e280`; candidate key, then label. Equal call-time argument values do not satisfy the exact object gate. The [completed view experiment](../initializer-virtual-view/README.md) records the settled resource receiver improvement and remaining discrepancy.

The complete private reference TU SHA256 remains `d60cee80415aa0f15843da8b1fdcc7a51b5265fc57e58f9634cce02d8508a4c9`. The pinned package is `2.0/base`, compiler `3.0 build 114`, CPU `arm946e`, ARM/little-endian/32-bit ABI, `-Cpp_exceptions off`, and header-free `-nostdinc`. Compiler, runner, runtime libraries, implementation, source, reference, and compiled-object hashes plus actual commands and strict failures are recorded in the report. Every allocated section and relocation participates in the gate. No full ROM run was attempted because all three objects fail before linking.

The three new tests first failed with the candidate absent. They now pass with actual pinned tools: shifted physical flags storage fails the compiler's extent/offset guards; changed key, archive table, and callee identities fail strict relocation comparison; and the baseline contains only the original 596-byte function without an emitted member bridge. Mutations use private source copies. No production mutation knobs are present.

```sh
JUS_INIT_MWCC=/absolute/path/mwccarm.exe \
JUS_INIT_WIBO=/absolute/path/wibo-macos \
python3 -m unittest discover -s tests/matching -p test_initializer_member_bridge.py -v
```

Reproduce the three strict trials against the pinned complete original reference TU in a fresh ignored output directory:

```sh
python3 decomp/matching-notes/pilot-t06/initializer-member-bridge/reproduce.py \
  --compiler /absolute/path/mwccarm.exe --runner /absolute/path/wibo-macos \
  --reference-dir /private/path/delinks --output build/member-bridge-rerun
```

The reference directory must contain `src/main/common_effect_init.o` with the saved hash. [contexts.json](contexts.json) pins the candidate and all three contexts. [verification.json](verification.json) records zero acceptance and the test result. Original and compiled objects stay private under ignored `build/`; public evidence contains metadata and reconstructed source only.

## Independent verification

The reviewer reran all three saved contexts with the pinned real tools and
reproduced the identical prior near-miss object and strict rejection. All
three new actual-tool tests run; the complete root suite passes 225 tests
without skips. [Root verification](root-verification.json) and
[root tests](root-tests.log) record the result. Canonical source stays at
304 bytes; no initializer source or ROM claim is added.
