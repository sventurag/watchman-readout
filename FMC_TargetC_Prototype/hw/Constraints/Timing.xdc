# ----------------------------------------------------------------------------
# TIMING Constraint File
# ----------------------------------------------------------------------------




set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks -of_objects [get_pins base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_ClockMgmt_inst/TC_CLK_MNG_inst/CLKOUT1]]

set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks -of_objects [get_pins base_zynq_i/TARGET_C_TopLevel_Sy_0/U0/TC_ClockMgmt_inst/TC_CLK_MNG_inst/CLKOUT0]]
