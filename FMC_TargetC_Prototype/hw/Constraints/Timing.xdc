
# ----------------------------------------------------------------------------
# TIMING Constraint File
# ----------------------------------------------------------------------------


set_property async_reg true [get_cells -hierarchical *cdc_reg*]
set_false_path -from [get_clocks *] -to [get_cells -hierarchical *cdc_reg*]

set_property async_reg true [get_cells -hierarchical *DFF_AB*]
#set_false_path -from [get_clocks *] -to [get_cells -hierarchical *DFF_AB*]

set_property async_reg true [get_cells -hierarchical *DFF_B*]
set_false_path -from [get_clocks *] -to [get_pins -hierarchical -filter Name=~*DFF_AB/Q_reg/D]

#set_property DRIVE 16 [get_ports BB3]
#set_property SLEW FAST [get_ports BB3]
set_property DIFF_TERM TRUE [get_ports MONTIMING_N]
set_property DIFF_TERM TRUE [get_ports MONTIMING_P]

































connect_debug_port u_ila_0/probe8 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/Timestamp[samplecnt][0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/Timestamp[samplecnt][1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/Timestamp[samplecnt][2]}]]

connect_debug_port u_ila_0/probe3 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[8]}]]


