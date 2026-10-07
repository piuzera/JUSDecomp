# Original Metrowerks baseline reproduction

The public `mwccarm.zip` asset in the current
[decomp.me compiler recipes](https://github.com/decompme/compilers/blob/main/values.yaml)
provides `1.2/sp2p3/mwldarm.exe`. The lock file records the archive hash, compiler
hashes, and Wibo runner pin. This discovery followed the initial T01 run, which
had no local Metrowerks tools.

[The actual report](report.json) records the command, inputs, exit statuses, and
all 17 module comparisons. The linker reports version 2.0 build 76. Wibo 1.2.0
runs its Windows executable on macOS through Rosetta 2.

The run uses the original LCF and whole-module reference objects. All payloads,
module addresses, and section/BSS boundary symbols match the verified native
baseline. Both dsd checks exit 0. The original ELF has the metadata dsd expects,
so its symbol check uses the raw ELF.

The output argument is `-o final_link.o` from the directory containing
`arm9.lcf` and `objects.txt`. Metrowerks resolves the LCF's `build/` payload paths
relative to the ELF's directory. `-o build/final_link.o` incorrectly adds another
`build/` level and fails. The report preserves this failed attempt and correction.

This supplemental binary baseline earns zero source coverage. The strict source
pipeline continues to use LLVM lld and checks each compiler promotion separately.
