
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
set_property port_width 9 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/cnt_average[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/trigger[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/trigger[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/trigger[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/trigger[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_R[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_R[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe3]
set_property port_width 6 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WR_C[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][15]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][16]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][17]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][18]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][19]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][20]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][21]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][22]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][23]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][24]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][25]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][26]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][27]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][28]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][29]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][30]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TC_Delay_RB][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][15]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][16]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][17]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][18]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][19]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][20]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][21]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][22]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][23]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][24]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][25]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][26]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][27]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][28]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][29]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][30]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[pedestalTriggerAvg][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe6]
set_property port_width 9 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/RD_add[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 2 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/TriggerInfo[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/TriggerInfo[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe8]
set_property port_width 3 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/Timestamp[samplecnt][0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/Timestamp[samplecnt][1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/Timestamp[samplecnt][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/delay_trigger[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/ClockBus[SSTIN]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[TriggerModePed]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CtrlBus_IxSL[WindowStorage]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/circBuffer/enable_write]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/RDAD_ReadEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/trigger]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/pedestalTrigger_inst/trigger_ped]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
