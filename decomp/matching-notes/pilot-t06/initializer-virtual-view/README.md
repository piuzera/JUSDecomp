# Initializer: declaration-only virtual view and physical flags construction

`func_0206c244` at main `0x0206c244` remains an original reference function. These 60 strict object trials accepted no source. They do not change the canonical source manifest, delink metadata, coverage, or ROM. The experiment starts from `b7a3edc`, which preserves the previous ordinary function-pointer dispatch attempt. Root's separately verified constructor milestone remains authoritative.

The complete original TU is 596 bytes (532 instruction bytes and 64 pool bytes), ending at `0x0206c498`. Its SHA256 is pinned in each context manifest. The target publication is [targets.json](../targets.json); the observed calls, fields, and uncertainties are recorded in [common-effect-contracts](../common-effect-contracts/README.md). Original instructions and extracted objects remain private.

## Settled receiver improvement

`resource_view.cpp` declares a resource ABI view with five reserved virtual slots followed by the observed slot `+0x14`, and physically guards the resource field `+0x38`. It does not instantiate this view, define any view methods, declare inheritance, or emit RTTI, helpers, or data. The original external symbol `func_02035e88` returns a pointer with this candidate ABI view. This is a compiler-lowering experiment, not recovery of the original resource class or a proof of its complete method signature. Registers not explicitly prepared at the call may still carry arguments consumed by the callee.

At `-O2`, the declaration-only call reproduces the original vptr load at TU `+0x64` / main `0x0206c2a8`: receiver `r0`, vptr temporary `r1`, then slot `+0x14`. The preceding attempt used a different receiver register. The current object contains only `.text` and only `func_0206c244`, with its original 596-byte extent.

Three saved source forms preserve this improvement:

| Form | Flags-constructor address argument view |
| --- | --- |
| `resource_view.cpp` | `Flags*`, `const char*`, `const char*` |
| `word_addresses.cpp` | `Flags*`, 32-bit address words |
| `opaque_addresses.cpp` | `void*`, `const void*`, `const void*` |

All forms retain the same original symbol identities, semantic argument order, and both intermediate/final vptr stores. Each was compiled under 14 saved contexts: default, `-O1`, `-O2`, `-O2,p`, `-O3,p`, `-O4,p`, and `-O4,s`, each with default or explicit interworking settings. All 42 trials fail the complete-object gate. Thirty have the closest 596-byte output described below. Six fail function extent/identity checks and six fail initialized bytes with an otherwise matching relocation inventory.

## Remaining constructor argument and pool order

The closest declaration-only-view objects differ at masked TU byte offsets `449` and `453`. These belong to the instructions starting at TU `+0x1c0` and `+0x1c4`, main `0x0206c404` and `0x0206c408`. The original loads label argument `r2` before key argument `r1`; the candidates load key `r1` before label `r2`.

The corresponding pool relocations are also reversed:

| TU pool offset | Original ABS32 target | Closest candidate target |
| --- | --- | --- |
| `580` / `0x244` | `data_0209e26c` (label) | `data_0209e280` (key) |
| `584` / `0x248` | `data_0209e280` (key) | `data_0209e26c` (label) |

Both pass the same semantic arguments to original `func_0202c4ac`: storage in `r0`, key in `r1`, label in `r2`. Equal call-time values do not satisfy the exact object gate. Relocation destinations remain compared; this report does not mask their disagreement.

## Bounded physical constructor hypothesis

After completing the 42-trial view sweep, `flags_constructor.cpp` tests an inline constructor on the explicit physical `Flags` record. Header-free placement construction wraps original `func_0202c4ac(this, key, label)`, preserves the original string identities, writes the original intermediate vptr, initializes the four words and the `+0x24` word, and writes the original final vptr. It introduces no inheritance or inferred ownership. It adds no safety guard to the original non-null allocation branch.

The 14 original contexts and four additional documented contexts (`-inline all`, `-inline on,level=8`, `-inline all,level=8,bottomup`, and `-ipa file -inline all`, all with `-O2`) accept no object:

- Eleven emit an additional allocated `.text` containing `Flags`' constructor. At `-O2`, the initializer is 548 bytes and the separate constructor is 72 bytes. The strict gate rejects duplicate allocated `.text` sections; no helper is discarded.
- Seven inline the constructor, emit only the initializer, and produce 600 bytes against the original 596. They retain key-before-label pool order and additional instruction/load differences.

This concludes the chosen constructor shape. An exact source needs a grounded source shape or compiler context that reproduces the original argument lowering without instruction patches, register/volatile hints, semantic argument reordering, symbol substitutions, or removal of emitted sections. This experiment supplies none. No full ROM run was attempted because every source object failed the preceding gate.

## Verification and reproduction

The pinned compiler is package `2.0/base` (`3.0 build 114`), with its binary/runtime-library hashes taken from `decomp/toolchain.lock.json`; the pinned runner is Wibo `1.2.0` under the existing macOS compatibility path. CPU is `arm946e`, ARM/little-endian/32-bit ABI, `-Cpp_exceptions off`, and `-nostdinc`. All four saved sources are header-free, with empty header/include sets. Each report records the actual compiler commands, source/tool/reference hashes, section/function metadata, relocation identities, strict failures, and masked mismatch positions. Context manifests pin source contents before and after compilation.

Run the focused actual-tool tests:

```sh
JUS_INIT_MWCC=/absolute/path/mwccarm.exe \
JUS_INIT_WIBO=/absolute/path/wibo-macos \
python3 -m unittest discover -s tests/matching -p test_initializer_virtual_view.py -v
```

The six tests include actual compiler rejection of shifted physical layouts; an extra reserved slot rejected by initialized-byte comparison; changed table/call/key/constructor destinations rejected by relocation comparison; and rejection of an emitted extra constructor without discarding its section. Tests mutate private source copies. The view tests first failed because their candidate was absent; the constructor tests first failed for the same reason. All six now pass with the actual pinned tools. The full matching suite passes 220 tests with 11 unrelated optional-tool tests skipped; the six new tests all ran.

Use a private complete reference TU generated with dsd's saved delink entry and matching hash. Run each sweep into a fresh ignored directory:

```sh
python3 decomp/matching-notes/pilot-t06/initializer-virtual-view/reproduce.py \
  --compiler /absolute/path/mwccarm.exe --runner /absolute/path/wibo-macos \
  --reference-dir /private/path/delinks --output build/initializer-view-rerun
```

Add `--contexts decomp/matching-notes/pilot-t06/initializer-virtual-view/constructor-contexts.json` for the 14 constructor contexts or `constructor-inline-contexts.json` for the four additional contexts, each with a fresh output directory. The reference directory must contain `src/main/common_effect_init.o` matching the saved reference SHA256.

The three `*-report.json` files record all 60 completed strict trials. `verification.json` also records the four preliminary `-O2` inspections and the first constructor sweep's reporting abort after one successful compile: the reporter initially assumed unique section names, then gained a metadata-only fallback retaining the complete rejected inventory. That aborted reporter run is recorded separately from the 60 completed matrix trials. No tool/source binaries or original byte payloads are published.

## Independent integration verification

The independent reviewer verified all 60 private object hashes and reran
every strict comparison, reproducing all recorded rejections. Mismatch
positions and rejected extra sections agree with the reports. All six new
real-tool tests ran, and the complete root suite passes 222 tests without
skips. [Root verification](root-verification.json) and
[root tests](root-tests.log) record this result. Canonical source coverage
remains seven functions and 304 bytes; this initializer stays in fallback.
