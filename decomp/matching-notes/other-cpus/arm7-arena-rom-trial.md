# Seven-object ARM7 whole-ROM research trial

The live research replay packed seventeen freshly verified parent ARM9 buffers, one genuinely rechecked child-native ARM9 slice, and two ARM7 buffers reconstructed from fresh accepted seven-object native links. All twenty disjoint writes passed the unchanged whole-ROM checks. The 67108864-byte result matches the original SHA256 `a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.

Each ARM7 buffer contains 165552 initialized bytes derived from actual PT_LOAD contents. Six loads account separately for 21424 BSS bytes. Seven real MW objects contribute 460 distinct candidate bytes, or 920 bytes across the two physical program images. The two parent/child identities and header/FAT offsets remain separate.

The two-file producer uses unchanged canonical helpers and genuine approved live operations. It first runs the source-enabled 19-stage parent verifier and preserves its report and rebuilt ROM. A separate module checkpoint uses its actual sixteen stages through source ownership, two actual approved builders and freshness. A sealed research owner runs the existing seven-object replay and checks its complete output inventory, original mappings, actual compiler argv, ELF flags, functions, maps, inputs, twelve resolved calls and five data bindings. A separate seven-stage experimental report requires that live trial before packing. A simple ROM overlay would omit these real build and consumption gates.

The approved ARM7 consumer remains opaque-only. No approval, canonical CLI, source counter, old capsule, C model or compiler recipe changed. Canonical source credit remains 304 bytes, ARM7 credit zero and global coverage unknown. Original symbols, ABI, ownership and SDK version remain unproved. T06 and T10 remain open; this is no execution or boot claim.

Run from the repository root with the recorded read-only ROM and tools available. Both directory names must be new:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-arena-rom-proof/reproduce.py /private/tmp/NEW_REPLAY_DIRECTORY
ROM_TRIAL_TEST_ROOT=/private/tmp/NEW_TEST_DIRECTORY PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-arena-rom-proof -p 'test_*.py' -v
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/other-cpus/arm7-arena-rom-proof/acceptance.json
```

Replay returns `NEW_REPLAY_DIRECTORY/trial-proof.json`. Its `research_pack.writes` records actual origins, including child slice/image/ELF pins and ARM7 ELF hashes with references to checked native readbacks. `research_pack.trial.programs`, `parent_outputs`, `input_sha256`, `artifact_hashes`, `trial_artifact_sha256`, `stages` and `source_credit` carry the remaining readbacks. The initial parent outputs remain under `parent/`; binaries and ROM data stay private.

The dependency catalog owns 119 Git-relative repository inputs, including the immutable approval closure, accepted seven-object runtime inputs and existing `.gitattributes`. Eighteen tool paths and the original ROM are the external inputs. Replay never reads the saved worker result or an earlier private checkout/report/object. New implementation pins are read from the package itself. The last command checks raw-equal published artifact pins against Git HEAD and working bytes after commit.

Forty-seven existing ARM9 text inputs have LF Git blobs and CRLF consumed checkout bytes, as required by unchanged Git attributes. `checkout-eol.json` records both hashes for each input. The focused test below checks all 119 working pins, the exact 47 differing Git blobs, their actual attributes and the LF-to-CRLF relation. Canonical files and attributes were not renormalized. The earlier gate failure remains recorded in commit `bbfae51`; the provenance correction keeps raw consumed-input pins separate from strict published-artifact pins.

```sh
ROM_TRIAL_TEST_ROOT=/private/tmp/UNUSED_CHECKOUT_READBACK PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-arena-rom-proof -p 'test_*.py' -k test_declared_checkout -v
```

Actual controls cover changed or missing source/object/command/map/ELF/receipt inputs, a privately consumed tool copy, stale/symlink/escaped outputs, wrong ELF flags and original mappings, duplicate or out-of-program writes, a non-target ROM change, missing trial authority and late mutations. A reproduced final-publication bug allowed the ROM, checkpoint or receipt to change at receipt close. The fixed replay exclusively publishes the receipt, then rechecks the complete captured output map, ROM and exact receipt bytes before returning. Optimized Python is rejected before the inherited assertion-based readers run. Test-first logs and the compact measured worker result are in the proof package.

Root and independent fresh checkouts reproduced the original whole ROM. The independent suite passed all twelve tests in 173.405 seconds. `root-review.json`, `root-readback.json` and `independent-review.json` record the measured checks; the root reader accepts a fresh output directory; the independent script preserves its actual review paths. Root also ran the real final-receipt ROM mutation against the fixed replay and confirmed rejection. The historical successful mutated-ROM receipt is retained separately as the pre-fix refutation. The trail review used a manually selected bounded excerpt, rather than the complete transcript.

Run the root byte reader on a successful fresh replay:

```sh
python3 decomp/matching-notes/other-cpus/arm7-arena-rom-proof/root-readback.py /private/tmp/NEW_REPLAY_DIRECTORY /private/tmp/NEW_READBACK.json decomp/matching-notes/other-cpus/arm7-checked-layouts.json
```
