
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
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list base_zynq_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 12 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 9 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/inst_DummyTriger/cnt_i[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/GCC_RESET]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/HSCLK]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RAMP]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SS_INCR]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/trigger]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
