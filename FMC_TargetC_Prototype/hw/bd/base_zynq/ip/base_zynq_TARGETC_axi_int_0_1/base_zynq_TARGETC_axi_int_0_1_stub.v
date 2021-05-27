// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue May 25 11:51:05 2021
// Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top base_zynq_TARGETC_axi_int_0_1 -prefix
//               base_zynq_TARGETC_axi_int_0_1_ base_zynq_TARGETC_axi_int_0_1_stub.v
// Design      : base_zynq_TARGETC_axi_int_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axistream,Vivado 2020.1" *)
module base_zynq_TARGETC_axi_int_0_1(SW_nRST, TestStream, FIFOvalid, FIFOdata, 
  StreamReady, Cnt_AXIS_DATA, CNT_CLR, TID, M_AXIS_ACLK, M_AXIS_ARESETN, M_AXIS_TVALID, 
  M_AXIS_TDATA, M_AXIS_TSTRB, M_AXIS_TDEST, M_AXIS_TLAST, M_AXIS_TID, M_AXIS_TREADY)
/* synthesis syn_black_box black_box_pad_pin="SW_nRST,TestStream,FIFOvalid,FIFOdata[31:0],StreamReady,Cnt_AXIS_DATA[9:0],CNT_CLR,TID[1:0],M_AXIS_ACLK,M_AXIS_ARESETN,M_AXIS_TVALID,M_AXIS_TDATA[31:0],M_AXIS_TSTRB[3:0],M_AXIS_TDEST[9:0],M_AXIS_TLAST,M_AXIS_TID[1:0],M_AXIS_TREADY" */;
  input SW_nRST;
  input TestStream;
  input FIFOvalid;
  input [31:0]FIFOdata;
  output StreamReady;
  output [9:0]Cnt_AXIS_DATA;
  input CNT_CLR;
  input [1:0]TID;
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output M_AXIS_TVALID;
  output [31:0]M_AXIS_TDATA;
  output [3:0]M_AXIS_TSTRB;
  output [9:0]M_AXIS_TDEST;
  output M_AXIS_TLAST;
  output [1:0]M_AXIS_TID;
  input M_AXIS_TREADY;
endmodule
