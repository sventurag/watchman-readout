// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon May 31 19:24:34 2021
// Host        : flacaVivado running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top base_zynq_xbar_7 -prefix
//               base_zynq_xbar_7_ base_zynq_xbar_7_stub.v
// Design      : base_zynq_xbar_7
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_switch_v1_1_22_axis_switch,Vivado 2020.2" *)
module base_zynq_xbar_7(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, s_axis_tstrb, s_axis_tlast, s_axis_tid, m_axis_tvalid, m_axis_tready, 
  m_axis_tdata, m_axis_tstrb, m_axis_tlast, m_axis_tid, s_req_suppress, s_decode_err)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid[1:0],s_axis_tready[1:0],s_axis_tdata[63:0],s_axis_tstrb[7:0],s_axis_tlast[1:0],s_axis_tid[3:0],m_axis_tvalid[0:0],m_axis_tready[0:0],m_axis_tdata[31:0],m_axis_tstrb[3:0],m_axis_tlast[0:0],m_axis_tid[1:0],s_req_suppress[1:0],s_decode_err[1:0]" */;
  input aclk;
  input aresetn;
  input [1:0]s_axis_tvalid;
  output [1:0]s_axis_tready;
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input [1:0]s_axis_tlast;
  input [3:0]s_axis_tid;
  output [0:0]m_axis_tvalid;
  input [0:0]m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tstrb;
  output [0:0]m_axis_tlast;
  output [1:0]m_axis_tid;
  input [1:0]s_req_suppress;
  output [1:0]s_decode_err;
endmodule
