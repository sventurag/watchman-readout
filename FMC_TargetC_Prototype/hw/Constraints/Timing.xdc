
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























create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list base_zynq_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe0]
set_property port_width 6 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_CS[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_CS[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_CS[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_CS[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_CS[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_CS[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 9 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_RS[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/WR_RS[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 9 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_DataOut[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 6 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_R[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_R[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/enable_write]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_ReadEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_WrEn_s]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_ClockMgmt_inst/SSTIN_intl]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/trigger_intl]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/windowStorage]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
