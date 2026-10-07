# Cross-object branch target normalization

Runtime TU splitting exposed three Thumb calls whose destination address remained
correct while their execution state changed from ARM to Thumb. The defined
`.L_0200cf14` label remained NOTYPE in the earlier main gap; its branch references
were in a different selected gap. Per-object normalization saw the references but
could not type their separate definition for LLVM interworking.

The fix resolves the LCF inventory and source overrides first, snapshots the actual
selected raw bytes, then collects undefined global/weak PC24 and THM_PC22 branch
symbols from those bytes. It resolves them against selected global/weak definitions.
A matching NOTYPE definition receives FUNC and its mapping-derived ARM/Thumb mode.
Unselected reference files and replaced reference bytes do not contribute evidence.
Same-named local symbols are never typed by this global inventory. Multiple
selected definitions or missing executable ARM/Thumb mapping for a NOTYPE label
are rejected before normalized objects are written. Missing selected definitions
are also rejected. Existing within-object normalization and input hash records
retain their previous behavior.

The implementation changes symbol and relocation metadata only. The proof checks
that every allocated initialized section in all 19 selected raw inputs is unchanged
in its normalized copy. The normalizer never substitutes reference instruction
bytes into compiled source.

## Verification

Six required public tests failed before implementation. Actual native links reached
the correct numeric destination in the wrong mode for both Thumb-to-ARM and
ARM-to-Thumb split cases. Ambiguous definitions, absent mappings and source-override
inventory cases also exposed the missing behavior. All 19 native-link tests now
pass, including weak symbols, local name collisions, selected definition overrides,
unselected invalid references and raw instruction preservation. The branch's full
matching suite runs 182 cases successfully, with four unrelated optional skips.

A disposable proof worktree combined fix `bcdbbf9` with runtime candidate `74fcffb`.
Only that worktree activated the candidate main TU. The complete runtime source
pipeline passed **all 19 stages**: both source-object checks, actual link selection
and map ownership, all 17 modules, symbols, direct payload comparison, all **87,493**
original relocation slots, freshness and exact whole-ROM reconstruction.

The proof credits 56 source bytes there: existing game trampoline 24, runtime SDK
lookup 32; 44 instruction bytes and 12 literal bytes. Primary fix-tree canonical
source registration is unchanged. Production integration and the combined runtime/C++
proof remain separate. The SDK identity and exact original compiler provenance do
not gain new evidence from this linker change.

[proof.json](proof.json) records tool/input/report hashes, all stage statuses,
unchanged raw initialized sections and the corrected final call destinations and
modes. The three original failing calls now reach ARM `0x0200cf14` in ARM state.
The original ROM, objects and linked payloads remain private.

## Reproduce

Create a disposable worktree containing the fix and runtime candidate, then activate
the saved candidate declaration only there. Use the pinned tools and private owner
ROM paths recorded in `proof.json`; output directories must be fresh.

```sh
git worktree add --detach /private/tmp/jus-cross-runtime-reproduce bcdbbf9
cd /private/tmp/jus-cross-runtime-reproduce
git cherry-pick 74fcffb
cp decomp/matching-notes/pilot-t06/runtime/candidate-main-delinks.txt decomp/arm9/delinks.txt
python3 tools/scripts/verify.py \
  --rom /Users/djdjo/Documents/mine/rom/jus.nds \
  --output build/runtime-fixed-reproduced \
  --dsd /private/tmp/jus-track-a/tools/dsd/dsd-macos-arm64 \
  --lld /opt/homebrew/bin/ld.lld \
  --clang /opt/homebrew/opt/llvm/bin/clang \
  --source-manifest decomp/matching-notes/pilot-t06/runtime/candidate-source-manifest.json \
  --source-compiler /private/tmp/jus-track-a/tools/mwccarm/2.0/base/mwccarm.exe \
  --compiler-runner /private/tmp/jus-track-a/tools/wibo/wibo-macos
python3 -m unittest discover -s tests/matching -p test_native_link.py -v
```
