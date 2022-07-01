#*****************************************************************************************
# Vivado (TM) v2018.3 (64-bit)
#
# sump_zybo.tcl: Tcl script for re-creating project 'sump_zybo'
#
# Generated by Vivado on Fri Jul 01 20:26:34 BST 2022
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "sump_zybo"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "sump_zybo.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/../../Proyectos/FPGA/sump_zybo"]"

# Create project
create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part xc7z010clg400-1

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part" -value "digilentinc.com:zybo-z7-10:part0:1.1" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "dsa.accelerator_binary_content" -value "bitstream" -objects $obj
set_property -name "dsa.accelerator_binary_format" -value "xclbin2" -objects $obj
set_property -name "dsa.board_id" -value "zybo-z7-10" -objects $obj
set_property -name "dsa.description" -value "Vivado generated DSA" -objects $obj
set_property -name "dsa.dr_bd_base_address" -value "0" -objects $obj
set_property -name "dsa.emu_dir" -value "emu" -objects $obj
set_property -name "dsa.flash_interface_type" -value "bpix16" -objects $obj
set_property -name "dsa.flash_offset_address" -value "0" -objects $obj
set_property -name "dsa.flash_size" -value "1024" -objects $obj
set_property -name "dsa.host_architecture" -value "x86_64" -objects $obj
set_property -name "dsa.host_interface" -value "pcie" -objects $obj
set_property -name "dsa.num_compute_units" -value "60" -objects $obj
set_property -name "dsa.platform_state" -value "pre_synth" -objects $obj
set_property -name "dsa.vendor" -value "xilinx" -objects $obj
set_property -name "dsa.version" -value "0.0" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "2" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "2" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "2" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "2" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "2" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "2" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "2" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "48" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "./sources/sump/controller.vhd"] \
 [file normalize "./sources/sump/core.vhd"] \
 [file normalize "./sources/sump/decoder.vhd"] \
 [file normalize "./sources/sump/demux.vhd"] \
 [file normalize "./sources/sump/eia232.vhd"] \
 [file normalize "./sources/sump/filter.vhd"] \
 [file normalize "./sources/sump/flags.vhd"] \
 [file normalize "./sources/sump/la.vhd"] \
 [file normalize "./sources/sump/prescaler.vhd"] \
 [file normalize "./sources/sump/receiver.vhd"] \
 [file normalize "./sources/sump/rle_enc.vhd"] \
 [file normalize "./sources/sump/sampler.vhd"] \
 [file normalize "./sources/sump/stage.vhd"] \
 [file normalize "./sources/sump/sync.vhd"] \
 [file normalize "./sources/sump/transmitter.vhd"] \
 [file normalize "./sources/sump/trigger.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Add local files from the original project (-no_copy_sources specified)
set files [list \
 [file normalize "./sources/ip/clk_wiz_0/clk_wiz_0.xci" ]\
 [file normalize "./sources/sump/bytewrite_ram_1b.vhd" ]\
 [file normalize "./sources/sump/clock_divider.vhd" ]\
 [file normalize "./sources/sump/debug_line_divider.vhd" ]\
 [file normalize "./sources/sump/sram.vhd" ]\
 [file normalize "./sources/sump/la_zybo_z7.vhd" ]\
 [file normalize "./sources/test/test_core_rle_simple.vhd" ]\
]
set added_files [add_files -fileset sources_1 $files]

# Set 'sources_1' fileset file properties for remote files
set file "./sources/sump/controller.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/core.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/decoder.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/demux.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/eia232.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/filter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/flags.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/la.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/prescaler.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/receiver.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/rle_enc.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/sampler.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/stage.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/sync.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/transmitter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/trigger.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset file properties for local files
set file "./sources/ip/clk_wiz_0/clk_wiz_0.xci"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "./sources/sump/bytewrite_ram_1b.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/clock_divider.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/debug_line_divider.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/sram.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/sump/la_zybo_z7.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "./sources/test/test_core_rle_simple.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "la_zybo_z7" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties

set file "./sources/constrs/zybo_z7.xdc"
set file [file normalize $file]
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property -name "target_constrs_file" -value "./sources/constrs/zybo_z7.xdc" -objects $obj
set_property -name "target_ucf" -value "./sources/constrs/zybo_z7.xdc" -objects $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
set files [list \
 [file normalize "./sources/test/test_core_simple.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_1' fileset file properties for remote files
set file "./sources/test/test_core_simple.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sim_1' fileset file properties for local files
# None

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "test_core_rle_simple" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'sim_2' fileset (if not found)
if {[string equal [get_filesets -quiet sim_2] ""]} {
  create_fileset -simset sim_2
}

# Set 'sim_2' fileset object
set obj [get_filesets sim_2]
# Add local files from the original project (-no_copy_sources specified)
set files [list \
 [file normalize "./sources/test/test_core_ext_clock.vhd" ]\
]
set added_files [add_files -fileset sim_2 $files]

# Set 'sim_2' fileset file properties for remote files
# None

# Set 'sim_2' fileset file properties for local files
set file "./sources/test/test_core_ext_clock.vhd"
set file_obj [get_files -of_objects [get_filesets sim_2] [list "$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

# Set 'sim_2' fileset properties
set obj [get_filesets sim_2]
set_property -name "top" -value "test_core_ext_clock" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Execute for bitstream generation
launch_runs impl_1 -to_step write_bitstream -jobs 8