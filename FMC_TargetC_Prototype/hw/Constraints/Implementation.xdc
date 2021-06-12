# ----------------------------------------------------------------------------
# IMPLEMENTATION Constraint File
# ----------------------------------------------------------------------------

#set_property DONT_TOUCH true [get_cells base_zynq_i/TARGETC_0/U0/TC_Control_inst/axi_rdata*]
#set_property DONT_TOUCH true [get_cells base_zynq_i/TARGETC_0/U0/TC_SerialRegCtrl_inst/axi_rdata*]
#set_property DONT_TOUCH true [get_cells base_zynq_i/FifoManager_0/U0/FSM_sequential_fifo_wr_stm*]
#set_property DONT_TOUCH true [get_cells base_zynq_i/TARGETC_IP_Prototype_0/U0/TC_RoundBuffer/WDOCONTROL/flg_TE_i*]

#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGETC_0/U0/TC_Control_inst/axi_rdata*]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGETC_0/U0/TC_Control_inst/data0*]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/TARGETC_0/U0/TC_SerialRegCtrl_inst/axi_rdata*]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets base_zynq_i/FifoManager_0/U0/FSM_sequential_fifo_wr_stm*]











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
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 9 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/RDAD_DataOut[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 9 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/WdoNumber_mult[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/WDOSTORE/Wdo1[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 6 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_CS[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_CS[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_CS[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_CS[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_CS[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_CS[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_RS[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/WR_RS[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[11]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[12]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[13]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[14]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[15]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[16]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[17]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[18]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[19]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[20]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[21]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[22]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[23]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[24]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[25]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[26]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[27]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[28]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[29]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[30]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/HMBroundBuff/rd_add_intl[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 2 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_RS_S_intl[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_RS_S_intl[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 6 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_CS_S_intl[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_CS_S_intl[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_CS_S_intl[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_CS_S_intl[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_CS_S_intl[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/WR_CS_S_intl[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list base_zynq_i/axi_dma_0_s2mm_introut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CPU_CONTROLLER_inst/ClockBus[SSTIN]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_ClockMgmt_inst/nrst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RoundBuffer/CPU_CONTROLLER_inst/nrst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_ClockMgmt_inst/SSTIN_intl]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0_WS_masterctrl_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/WS_master_ctrl]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
