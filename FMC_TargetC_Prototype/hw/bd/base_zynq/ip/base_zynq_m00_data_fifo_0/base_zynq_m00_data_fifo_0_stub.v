// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri May 21 17:41:11 2021
// Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_m00_data_fifo_0/base_zynq_m00_data_fifo_0_stub.v
// Design      : base_zynq_m00_data_fifo_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_data_fifo_v2_0_3_top,Vivado 2020.1" *)
module base_zynq_m00_data_fifo_0(s_axis_aresetn, s_axis_aclk, s_axis_tvalid, 
  s_axis_tready, s_axis_tdata, s_axis_tstrb, s_axis_tlast, s_axis_tid, m_axis_tvalid, 
  m_axis_tready, m_axis_tdata, m_axis_tstrb, m_axis_tlast, m_axis_tid, axis_wr_data_count, 
  axis_rd_data_count)
/* synthesis syn_black_box black_box_pad_pin="s_axis_aresetn,s_axis_aclk,s_axis_tvalid,s_axis_tready,s_axis_tdata[31:0],s_axis_tstrb[3:0],s_axis_tlast,s_axis_tid[1:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[31:0],m_axis_tstrb[3:0],m_axis_tlast,m_axis_tid[1:0],axis_wr_data_count[31:0],axis_rd_data_count[31:0]" */;
  input s_axis_aresetn;
  input s_axis_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input [3:0]s_axis_tstrb;
  input s_axis_tlast;
  input [1:0]s_axis_tid;
  output m_axis_tvalid;
  input m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tstrb;
  output m_axis_tlast;
  output [1:0]m_axis_tid;
  output [31:0]axis_wr_data_count;
  output [31:0]axis_rd_data_count;
endmodule
