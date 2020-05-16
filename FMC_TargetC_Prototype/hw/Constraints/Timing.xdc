
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
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list base_zynq_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 9 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 12 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DO[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/WL_CNT_INTL[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 9 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_Addr_s[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 26 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[15]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[16]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[17]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[18]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[19]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[20]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[21]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[22]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[23]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[24]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/readCounter[25]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 9 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DataOut[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[15]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[16]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[17]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[18]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[19]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[20]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[21]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[22]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[23]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[24]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[25]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[26]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[27]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[28]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[29]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[30]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSCnt[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/GCC_RESET]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RAMP]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RAMP_CNT]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_CLK]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_DIR]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RDAD_SIN]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SS_INCR]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/HSCLK]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SS_RESET]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SSvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/DIG_WriteEn]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
