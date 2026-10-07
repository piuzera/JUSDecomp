# Private arena rubric

Score each criterion 0..3. Zero means the design misses or contradicts it;
one means it mentions the requirement; two means its signatures and control
flow support it; three means it also supplies executable falsifying cases.

1. Accepts only immutable checked ARM7 physical inputs, retains full
   program/CPU/region identity, and derives fixed V4T internally.
2. Uses a checked initialized span/mode with complete instruction consumption;
   distinguishes bounded observations from discovered functions and BSS.
3. Models direct control-flow destinations with separate mapped/executable/
   mode-known authority, preserving unresolved targets without inventing facts.
4. Prevents later reparse/defs/uses/output from reverting to V5TE, while proving
   existing ARM9 behavior is unchanged and avoiding invented config metadata.
5. Exposes a small caller interface, at most three files to trace the bounded
   operation, with meaningful TDD fixtures for actual ISA/address/identity risks.

Required alternatives: shared existing Function analyzer policy versus a
separate bounded ARM7 observation analyzer. No full-ROM source or ARM7 linker
baseline claim is earned by either design.
