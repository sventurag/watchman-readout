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
set_property port_width 12 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[0]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[1]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[2]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[3]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[4]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[5]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[6]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[7]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[8]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[9]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[10]} {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/CH0[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list base_zynq_i/axi_dma_0_s2mm_introut]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/RAMP_intl_i_1_n_0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SS[valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_RDAD_WL_SS/SS_INCR_intl]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
