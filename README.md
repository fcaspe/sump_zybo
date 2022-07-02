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


## Compiling the SUMP Client ( tested on Ubuntu 20.04 )

I use [OpenBench LogicSniffer](https://github.com/jawi/ols). The built versions do not work with my PC, so I compile them from scratch.



    ## Install requirements
    sudo apt-get install default-jdk default-jre
    sudo apt install maven

    ## Export JAVA_HOME before compiling
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

    ## Clone the repo and build
    git clone https://github.com/jawi/ols
    cd ols
    mvn clean install


Binaries will be at `ols.distribution/target/ols-0.9.8-SNAPSHOT-full/ols-0.9.8-SNAPSHOT/'