# T05 donor search: zero accepted matches

The pinned corpus produced **zero accepted source matches and zero promotions**.
Five unchanged utility sources in two licensed families were compiled in four
ARM946E contexts with the pinned Metrowerks package. Their 64 function records
were searched against 14,962 sized ARM9 JUS function records. The matcher keeps
868 unresolved leads: 704 unbound relocation-field collisions and 164 structural
similarities. Every lead has fewer than 16 bytes of mapped instructions and is
ambiguous across multiple game functions. No raw or target-bound match survived.

[donors.json](../../donors.json) pins revisions, each selected source and its
license, broader header context, exact consumed headers for each compilation,
compiler package/DLL hashes, runner, tools, CPU, flags and ABI assumptions.
[report.json](report.json) records the real commands, dependency proofs, function
hashes/ranges/relocation metadata, all leads and extraction limitations. There
are no donor source imports, automatic names, or source-coverage changes.

## Corpus and permission

| Family | Exact revision | Selected unchanged files | Permission evidence |
| --- | --- | --- | --- |
| musl strings | `9b2d8a1646391d5217f9a358555aebcaab5b8aaf` | `src/string/memcmp.c`, `strcmp.c`, `strncmp.c` | [Pinned COPYRIGHT](https://git.musl-libc.org/cgit/musl/tree/COPYRIGHT?id=9b2d8a1646391d5217f9a358555aebcaab5b8aaf) applies MIT terms to these original files without individual notices |
| zlib checksums | `cacf7f1d4e3d44d871b605da3b647f07d718623f` (1.2.11) | `adler32.c`, `crc32.c` | Each file's notice refers to the retained [pinned zlib.h license](https://github.com/madler/zlib/blob/cacf7f1d4e3d44d871b605da3b647f07d718623f/zlib.h) |

The private checkouts retain their original notices. The public `context/string.h`
is independently authored, provides only the declarations needed by the three
musl sources, and checks 32-bit `size_t`. No source is admitted without a reviewed
license record and matching license-file hash. Source, license, header and tool
pins are checked again after the experiment.

These families supply byte comparisons and checksums that are useful search
shapes; they are not assertions about the original game's source. The selected
musl revision and zlib 1.2.11 postdate JUS. Their absence from this bounded search
does not establish that JUS contains no library code.

## Evidence boundaries

The native JUS ELF has no emitted relocation sections. The matcher first validates
all **87,493** authoritative original slots against the actual linked ELF:
31,038 PC24, 32,552 ABS32 and 23,903 THM_PC22. It then uses the original 15
whole-module delink objects for relocation provenance and the final ELF for
instruction bytes and runtime destinations. Module and section identity remain
part of every target; equal overlay addresses are not interchangeable.

Mapping symbols distinguish instructions from literal pools. Raw matching keeps
both. Relocation normalization masks displacement/pointer fields while retaining
addends, ARM/Thumb mode, call/branch distinctions and BL/BLX interworking semantics.
A normalized collision becomes a target-bound candidate only with an explicit
reviewed donor-symbol correspondence to the complete JUS destination identity.
The current correspondence map is empty. Structural comparison uses instruction
mnemonics and retains literal-pool checks; it remains uncertain. Tiny and ambiguous
matches remain in totals rather than disappearing from the report. A candidate
is a discovery lead, never a source-build gate or permission to rename a symbol.

Two target functions retain unresolved relocation-destination extraction metadata:
`main:.text:0x0200ee68` and `main:.text:0x0200f57c` (`__FindExceptionTable`). The
original relocation validator passes those slots; the narrower donor extractor
cannot assign their special destinations and grants them no match confidence.
The full target report preserves those findings.

A separate inspected lead, `ov008:.text:0x0214d154`, Thumb, 60 bytes, generates
256 words with eight right-shift/XOR steps per word and the standard reflected CRC
polynomial `0xedb88320`. This supports a CRC-table-generator hypothesis. It does
not establish zlib provenance, a reviewed function name, or a source match.

## DSD signature results

Pinned dsd 0.12.0 `sig list` exposes `FS_LoadOverlay` and `FS_UnloadOverlay`.
Applying both to the verified configuration with `--all --dry` exits zero but
reports no match for either. Generating signatures from each of the five compiled
ARM donor functions with `sig new-elf` exits one with “branch outside of program”.
Generating a signature from the existing CRC-table-generator lead succeeds;
dry applying that generated signature to the same configuration still reports
no match. These are recorded tool limitations, not successful donor searches.
All signature YAML and full logs remain private; the report records commands,
exit statuses and log/signature hashes.

A bounded investigation of the pinned [new-elf implementation](https://github.com/AetiasHax/ds-decomp/blob/v0.12.0/cli/src/cmd/sig/new_elf.rs)
found that it indexes section contents using the symbol address. A separate linked
nonzero-VMA donor probe consequently panicked, so linked images are not used to
claim that the failed raw-object signatures succeeded. No dsd binary or original
reference bytes were changed. The independently implemented staged search above
ran against actual artifacts despite the signature CLI limitations.

## Effort and benefit

The report measures machine build, validation/search and total wall time. It is
agent experiment time, not measured human analyst effort. This leg's research and
implementation window began at 2026-10-05 04:03:02 UTC; the publication checkpoint
is recorded in `effort.json`. Individual leads were not manually promoted or
assigned names. All 868 still require correspondence or stronger evidence; the
measured accepted-source benefit is zero. The reusable benefit is a reproducible
licensed corpus, explicit collision evidence and checked matcher boundaries.

## Reproduce

Run from a checkout that includes the committed T13 `header_dependencies.py`.
Use the tool paths whose hashes match `decomp/donors.json` and a complete private
passed verification directory with original whole-module `delinks/` and raw
`native-link/linked.elf`. No ROM, extracted binary, object, disassembly, or generated
signature should be committed.

```sh
git clone https://git.musl-libc.org/git/musl build/donor-research/musl
git -C build/donor-research/musl checkout 9b2d8a1646391d5217f9a358555aebcaab5b8aaf
git clone https://github.com/madler/zlib.git build/donor-research/zlib
git -C build/donor-research/zlib checkout cacf7f1d4e3d44d871b605da3b647f07d718623f
python3 tools/scripts/donor_matcher.py \
  --target-dir /private/tmp/jus-track-a/build/verify-t04-t08-final-source \
  --tools-root /private/tmp/jus-track-a/tools \
  --objdump /opt/homebrew/opt/llvm/bin/llvm-objdump \
  --output build/donor-t05-reproduced
python3 -m unittest discover -s tests/matching -p test_donor_matcher.py -v
```

`--output` must be fresh. `--header-helper` can select the identical committed
helper from another worktree while an isolated branch awaits integration; its
manifest hash is still enforced. Each build runs `-M` preflight and `-MD`
compilation, compares exact ordered dependencies, and checks before/after hashes.
The compiler uses `-nostdinc -I-` and ordered structured `-i` paths; no ambient
headers or guessed dependencies are accepted. Public invented fixtures cover
mode conflicts, altered destinations/addends, literal pools, data as code,
tiny collisions, ambiguous overlays, unlicensed inputs, source/header mutation,
BL/BLX preservation and duplicate `.text` sections with distinct RELA `sh_info`.

Root repeated the final search after the invalid Thumb BLX regression fix at
`dd8a4fd`. `source-report.json` records the fresh 19-stage exact JUS ROM proof;
`tests.log` records 174 passing tests without skips. Counts remain unchanged.
