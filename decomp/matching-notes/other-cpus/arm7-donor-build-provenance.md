# Pinned ARM7 donor build provenance

The pinned Pokémon reconstruction selects compiler directory `1.2/sp2p3` and
optimization `-O4,s` for `arm7/lib/src/OS_arena.c`. These are two concrete
differences from the JUS low-getter trials' compiler build 114 and `-O4,p`.
They justify one controlled recipe comparison with the unchanged first candidate.
They do not identify the original JUS compiler, SDK, source, or settings.

All donor references below use `pret/pokediamond` commit
`38f3650189f8989aed91618745aa74029fa60247`. This is build provenance for that
community reconstruction. ARM7 source credit remains zero, canonical 304 stays
unchanged, and T10 remains open. No C compilation or link ran in this research.

## Effective declaration for this file

The ARM7 makefile enumerates `lib/src` C files and maps them to
`build/lib/src/*.o`. Its SDK-object pattern overrides the default compiler
selector for `build/lib/src/OS_arena.o`:

```make
$(BUILD_DIR)/lib/src/%.o: MWCCVERSION = 1.2/sp2p3
```

The compiler command uses a recursively expanded path, so the override selects
`../tools/mwccarm/1.2/sp2p3/mwccarm.exe`. This is a compiler-directory declaration;
the donor repository supplies no executable hash here.
[Object enumeration](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L49-L60),
[compiler selector and command](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L68-L84),
[SDK override and C rule](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L160-L177).

The shared ARM7 C flags are:

```text
-O4,s -proc arm7tdmi -fp soft -lang c99 -Cpp_exceptions off -i ../include -ir ../include-mw -ir lib/include -interworking -DFS_IMPLEMENT -enum int -W all
```

The makefile exports `MWCIncludes=lib/include` and a tools-relative license path.
Its SDK-object override changes the compiler selector; it contains no separate
`OS_arena.c` optimization override.
[Flags](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L92-L94),
[environment](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L114-L115).

`OS_GetInitArenaLo` carries `ARM_FUNC`; the included compatibility header defines
that annotation as `_Pragma("thumb off")`. ARM mode is therefore explicit in the
source annotation, even though the ARM7 C-flags line has no `-nothumb` option.
[Getter annotation](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c#L77),
[mode definition](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/include-mw/function_target.h#L4-L5).

The top-level makefile's `2.0/sp1` selector and `-O4,p` flags belong to its ARM9
build context. It launches a separate ARM7 submake; its explicit forwarded
variables describe the game/build variant. They do not replace the ARM7 SDK
pattern above under the declared default configuration. Command-line overrides
could change a particular invocation; no historical build invocation is claimed.
[Top-level options](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/Makefile#L79-L106),
[ARM7 submake](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/Makefile#L211-L212),
[forwarded variables](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/config.mk#L45).
The installation instructions separately name `1.2/sp2p3` among the required
matching compilers and explain that those executables are not distributed there.
[Pinned installation instructions](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/INSTALL.md#L1-L5).

## Actual local identities and verification

Read-only `-version` invocations through the pinned Wibo runner distinguish the
local directory labels from the executables:

| Local compiler path under `/private/tmp/jus-track-a/tools/mwccarm/` | Actual reported version | SHA256 |
| --- | --- | --- |
| `1.2/sp2p3/mwccarm.exe` | 2.0 build 82, build 0082 | `a0db9f5dd49ceb619dbc64993660b39f96cca10821a698a9859824e2d4ae2a81` |
| `2.0/base/mwccarm.exe` | 3.0 build 114, build 0114 | `7150fa4fe4cb6db6867ac530ec1a0754f6ca4df92868d963a7875196f9222880` |

The local build-82 executable is available for a trial. Its matching directory
label does not prove it is the donor's undistributed binary. Both executable
digests, adjacent DLLs, runner, and fetched primary-source bytes stayed unchanged.
[Audit record](arm7-donor-build-provenance-proof/primary-audit.json).

Each fetched primary file was checked against the Git blob ID returned for the
pinned commit. A private makefile copied seven exact assignment/override lines
and used two print-only targets: the SDK object resolved to `1.2/sp2p3`, while an
ordinary ARM7 object retained `2.0/base`; both retained `-O4,s`. This checked
GNU make's target-specific expansion without running the original makefile,
whose parse-time expressions can create directories and invoke tool work.
It was not a donor build. Private inputs and readbacks remain at
`/private/tmp/jus-arm7-donor-build-provenance-proof/`; the public audit retains
their pins and results without copying donor source or executables.

## One bounded next comparison

Reuse the unchanged original [low-getter candidate](arm7-low-getter-trial-proof/low_getter_trial.c),
SHA256 `fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537`,
with its existing basename and hypothesis symbols. Change only the compiler to
the pinned local build 82 and optimization to `-O4,s`; retain the existing
`-proc arm7tdmi -nothumb -interworking -nostdinc -c` options. Record the complete
argv and inspect the actual ELF instructions, pool, symbols, ARM mode, and
relocations against both original program identities. Stop at a mismatch.

This would be a single provenance-selected recipe comparison, not a full donor
build: it deliberately preserves the header-free candidate's other options
instead of importing donor headers, defines, or additional flags. The three
completed source variants produced the same object and eight-byte scheduling
difference; these newly grounded compiler/optimization declarations supply a
different question. No exact-match prediction, flag sweep, source rewrite, native
link, original JUS compiler identification, or source promotion follows here.
