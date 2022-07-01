# sump_zybo
Michael Poppitz's [SUMP](https://www.sump.org/projects/analyzer/fpga/) logic analyzer port for Digilent Zybo Z7.

The classic logic analyzer written in VHDL, with wide PC client support, bumped-up to run on the Digilent Zybo-Z7-10. 
With not much effort it should be portable to other Digilent boards based on Xilinx's 7-Series FPGAs.

## Specs for this version

- Supports 16 channels instead of 32 (due to lack of I/O ports on the Zybo-Z7).
- Added run-length encoding.
- External clock support.
- 64KWord buffer size (using internal BRAM).


Synthesis tested on Vivado 2018.3 and Vivado 2020.1


## Synthesis

Clone repo and open Vivado on repo's directory. Then execute the TCL script:

`
source sump_zybo.tcl
`

It will create the project, and then synthesize the bitstream.