// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Fri Jul  2 11:36:52 2021
// Host        : flacaVivado running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top base_zynq_util_ds_buf_0_1 -prefix
//               base_zynq_util_ds_buf_0_1_ base_zynq_util_ds_buf_0_1_stub.v
// Design      : base_zynq_util_ds_buf_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "util_ds_buf,Vivado 2020.2" *)
module base_zynq_util_ds_buf_0_1(OBUF_IN, OBUF_DS_P, OBUF_DS_N)
/* synthesis syn_black_box black_box_pad_pin="OBUF_IN[0:0],OBUF_DS_P[0:0],OBUF_DS_N[0:0]" */;
  input [0:0]OBUF_IN;
  output [0:0]OBUF_DS_P;
  output [0:0]OBUF_DS_N;
endmodule
