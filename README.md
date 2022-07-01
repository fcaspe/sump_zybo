# sump_zybo
The SUMP logic analyzer for Zybo Z7

The classic logic analyzer written in VHDL, with wide PC client support, bumped-up to run on the Digilent Zybo-Z7-10.

## Specs for this version

- Supports 16 channels instead of 32 (due to lack of I/O ports).
- Added run-length encoding.
- External clock support.
- 64KWord buffer size (using internal BRAM).


Synthesis tested on Vivado 2018.3 and Vivado 2020.1

