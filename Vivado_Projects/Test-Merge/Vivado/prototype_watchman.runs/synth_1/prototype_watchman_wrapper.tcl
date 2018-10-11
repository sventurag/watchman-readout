# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.cache/wt [current_project]
set_property parent.project_path /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:microzed_7010:part0:1.1 [current_project]
set_property ip_repo_paths {
  /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/ip_repo/ten_reg_map_1.0
  /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/ip_repo/simple_reg_1.0
  /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/ip_repo/AXIS_Test_Component
} [current_project]
set_property ip_output_repo /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/hdl/prototype_watchman_wrapper.vhd
add_files /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/prototype_watchman.bd
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_processing_system7_0_1/prototype_watchman_processing_system7_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_rst_ps7_0_100M_1/prototype_watchman_rst_ps7_0_100M_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_rst_ps7_0_100M_1/prototype_watchman_rst_ps7_0_100M_1.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_rst_ps7_0_100M_1/prototype_watchman_rst_ps7_0_100M_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_dma_0_0/prototype_watchman_axi_dma_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_dma_0_0/prototype_watchman_axi_dma_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_dma_0_0/prototype_watchman_axi_dma_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/bd_0/ip/ip_5/bd_a35b_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/bd_0/ip/ip_9/bd_a35b_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/bd_0/ip/ip_6/bd_a35b_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/bd_0/ip/ip_7/bd_a35b_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/bd_0/ip/ip_8/bd_a35b_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/bd_0/ip/ip_1/bd_a35b_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/bd_0/ip/ip_1/bd_a35b_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_axi_smc_0/ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_auto_pc_1/prototype_watchman_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_xbar_0/prototype_watchman_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/ip/prototype_watchman_auto_pc_0/prototype_watchman_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/idlab-52/Desktop/GitVivado/Ky/WATCHMAN/Vivado_Projects/Test-Merge/Test_merge/prototype_watchman.srcs/sources_1/bd/prototype_watchman/prototype_watchman_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top prototype_watchman_wrapper -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef prototype_watchman_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file prototype_watchman_wrapper_utilization_synth.rpt -pb prototype_watchman_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
