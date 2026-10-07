# Deleting-destructor entry

`func_0206cfa4` now matches its complete 28-byte ARM9/main TU under pinned
Metrowerks `2.0/base` with `-O2`. The source preserves the original entry name
and both call identities. It emits one `.text` section, one function and two
`R_ARM_PC24` relocations: offset 8 to `func_02015ed8`, then offset 16 to
`func_0201b244`, both with addend -8. No aliases, vtables, helpers, literals,
data or BSS are introduced.

The source uses a forward-declared `CommonEffectAbi` and asserts the pointer
width. It introduces no member layout or competing class definition. The
existing nondeleting entry's TU still enforces the established layout facts.
Both calls consume the pointer, and this entry ignores their return values.
The `void` declarations describe that caller interface; their original callee
C++ types remain unknown. The entry returns the original pointer value after
both calls, without dereferencing it or promising that its allocation survives.
This reproduces the observed ABI and does not recover native ownership rules.

Tests first failed because the published entry had no source. One source body
then passed the real compiler checks. The default optimizer context fails the
extent check; the selected `-O2` context is specific to this TU. Redirecting the
second call to `func_0201b268` fails relocation identity checks, leaves the
reference hash unchanged, changes the compiled object hash and publishes zero
source overrides. These rejected trials also exercise atomic rejection of the
four-unit source manifest. Their public records are in `proof.json`.

The fresh canonical verifier passed all 19 stages at source commit `dc472a0`:
four raw source objects, actual linked-input provenance, both dsd checks, all
17 module bytes and BSS layouts, all 87,493 original relocation destinations,
source ownership, freshness and whole-ROM equality. The rebuilt 67,108,864-byte
ROM has SHA-256
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.
The candidate's total credit is 104 source bytes across four functions,
separated into 92 instruction bytes and 12 literal bytes. This entry adds
28 instruction bytes. ARM7 and preserved assets receive no source credit;
the global percentage remains unknown.

The matching suite passes 206 tests, with six unrelated private-input checks
skipped. The two new lifecycle tests run against the real pinned compiler when
`JUS_CLASS_MWCC` and `JUS_CLASS_WIBO` are set. Use the normal `verify.py` CLI with
this candidate's `decomp/source-manifest.json` and a fresh output directory to
repeat the full proof. Private raw reports, objects and ROM output remain under
ignored `build/verify-t06-deleting`; `proof.json` commits metadata only.

Measured work comprised two bounded compiler contexts, one source-body revision
and one successful fresh full-pipeline attempt. The recorded verifier runtime
is measured; total human effort was not independently timed. Constructor,
factory, clone, initializer and virtual object-configuration method source remain fallback.
Base member types, callback interfaces, native virtual-class ownership and
T07 runtime behavior checks remain unresolved. T06 is not complete.

Independent root reproduction at producer `c7c61f2` passes all 19 stages
with the same 104 source bytes. The [root report](root-canonical-report.json)
records every live artifact and source hash; the [root test log](root-tests.log)
records 206 passing tests without skips using the pinned compiler and all
private reference inputs. Independent review also reruns both rejected
compiler trials against the actual original reference.
