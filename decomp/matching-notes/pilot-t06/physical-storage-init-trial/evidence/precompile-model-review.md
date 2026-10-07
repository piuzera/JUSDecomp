# Task 37 precompile model review

Reviewed by gpt-6-astra. No concrete model or scope flags in the inspected body and recipe.

Inspected hashes:

- `physical_initializer.c`: `0a631f087499a0c0bd495d34bce990205b2e85e1c267e4380fe1127f9a6ae770`.
- `recipe.json`: `36afdf86371b5262a6d54471d246f5cac066293c6c7c524f914c15dea9f07055`.
- `design-release.md`: `8a9d5ba7473e938029fd8a2b78c53df811b8973dcb05bcdf1072f12e9bb380aa`.

The body implements the released physical view. Its word/halfword/pointer/record checks require 4/2/4/20 bytes. Member offsets are 4, 8, 12, 16 and 18 after the first pointer member; the counter is at original base plus `0x30c`. It writes the original dispatch address, zero, key and selected label, then stores the low halfwords from two separately sequenced opaque calls. The second call reads `storage->label` after the first call and first halfword store. It increments the unsigned counter and returns the original storage pointer. There is no allocation, null recovery, alias symbol, register/volatile hint, inline assembly or original-class claim.

The implementation spellings are within the reviewed synthesis:

- `unsigned long` is explicitly constrained to four bytes. It gives the required unsigned 32-bit counter arithmetic without asserting an original source typedef. Acceptance still depends on the emitted whole object, not this reasoning alone.
- The dispatch member is `void *`, used only to retain the original numeric symbol address. Its pointed-to type is not inspected or used to imply a C++ vtable definition.
- `extern unsigned char data_02098708` plus `&data_02098708` takes the external symbol's address without defining or loading an object. It introduces no replacement storage or interior alias.
- `extern CounterPrefix data_020a0c34` remains an undefined original external symbol with a local partial physical view. It adds no definition or original global-size/ownership claim.

The recipe fixes one ordinary C TU, ARM946E, MW2.0/base build114 with the reviewed compiler/Wibo identities, `-Cpp_exceptions off -nostdinc -O2`, empty header/include inputs, the 92-byte complete declaration, and the original loaded-byte identity. No second recipe or model is present. These first implementation choices are not post-result tuning. Freeze the inspected source hash before the trial; a compiler rejection or strict mismatch must remain that model's result.

I read the current original-artifact and publication-boundary tests, including the changing post-write mutation controls, only as implementation context. They are not frozen final test evidence and I did not run them. I did not compile this source or validate emitted layout, instructions, ELF sections, function extent, relocations, native consumption, or ROM equality. In particular, compiler acceptance of the offset-check idiom remains for the single authorized compiler invocation to establish. The original-TU/red prerequisites and all release gates remain binding.

## Subsequent recipe snapshot correction

The review above read recipe `36afdf86371b5262a6d54471d246f5cac066293c6c7c524f914c15dea9f07055`. It did not review a final frozen recipe under a later hash. The worker was still finalizing external tool locators.

Root subsequently reported recipe `2e6917ddd6034dccc757807592525453bd86f5444e3270f2e368aedb5923d012`. I read its content, then observed the file change again before my hash assertion. Exact reconstruction against the original hash proves the intermediate semantic JSON delta was confined to two external path strings: `ld.lld` became resolved generic `lld`, and Clang became its resolved `clang-23` path. CPU, flags, source manifest, compiler/Wibo identities, package inventory, complete declaration and original-byte target remained unchanged.

The LLD path change was a real setup defect, not harmless pin formatting: executable basename selects the linker driver behavior. Actual `/private/tmp/jus-37-trial-01/verify/report.json` reports `lld: pinned tool version mismatch`, with only `intake` passed and `tool_versions` failed. There is no `source_build` stage. This run is blocked setup, not a source-model mismatch or a target compiler attempt.

The current snapshot I read and hashed is `f37d79d0b0e3cb466dd3b8909d53164fbc0fecee561c7367697e2727e5d053dd`, retained verbatim in `observed-current-recipe.json` beside this review. It restores `/opt/homebrew/bin/ld.lld`, retains resolved `/opt/homebrew/Cellar/llvm/23.1.2/bin/clang-23`, and has an additional trailing newline compared with the first JSON serialization. Both current locators resolve to the same tool files as the original recipe. Their byte hashes are respectively `3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54` and `d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5`.

Source remains `0a631f087499a0c0bd495d34bce990205b2e85e1c267e4380fe1127f9a6ae770`. The corrected snapshot introduces no source-model, MW optimization, CPU, ABI or binding change. It is a tool-invocation correction before target compilation. I have not run the corrected pipeline or established that this file will remain the final frozen recipe; root must bind the actual released invocation to its recorded snapshot. The original review's timing and hash remain historical facts, not retroactive final-freeze evidence.
