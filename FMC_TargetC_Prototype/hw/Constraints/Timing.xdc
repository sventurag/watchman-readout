# ----------------------------------------------------------------------------
# TIMING Constraint File
# ----------------------------------------------------------------------------



            


#set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks -of_objects [get_pins base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_ClockMgmt_inst/TC_CLK_MNG_inst/CLKOUT1]]
#set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks -of_objects [get_pins base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_ClockMgmt_inst/TC_CLK_MNG_inst/CLKOUT0]]


set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[0].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[1].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[2].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[3].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[4].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[5].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[6].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[7].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[8].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[9].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[10].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[11].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[12].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[13].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[14].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[15].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[16].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[17].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[18].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[19].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[20].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[21].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[22].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[23].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[24].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[25].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[26].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[27].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[28].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[29].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[30].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[31].DFF_A/Q_reg/CLR}]



#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[0].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[1].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[2].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[3].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[4].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[5].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[6].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[7].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[8].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[9].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[10].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[11].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[12].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[13].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[14].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[15].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[16].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[17].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[18].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[19].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[20].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[21].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[22].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[23].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[24].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[25].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[26].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[27].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[28].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[29].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[30].DFF_B/Q_reg/CLR}]
#set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_FSTWINDOWS/DFF_GEN[31].DFF_B/Q_reg/CLR}]
#
#


set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_Delay_UpdateWR/DFF_GEN[29].DFF_A/Q_reg/CLR}]
set_false_path -from [get_pins {base_zynq_i/rst_ps7_0_50M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N/C}] -to [get_pins {base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_Control_inst/BUF_Delay_UpdateWR/DFF_GEN[6].DFF_A/Q_reg/CLR}]
