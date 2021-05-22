// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri May 21 18:48:58 2021
// Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_sstin_signal_0_0/base_zynq_sstin_signal_0_0_stub.v
// Design      : base_zynq_sstin_signal_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "sstin_signal,Vivado 2020.1" *)
module base_zynq_sstin_signal_0_0(nrst, clk1, Timecounter, graycnt, samplecnt, 
  WL_CLK_P, WL_CLK_N, SSTIN)
/* synthesis syn_black_box black_box_pad_pin="nrst,clk1,Timecounter[63:0],graycnt[59:0],samplecnt[2:0],WL_CLK_P,WL_CLK_N,SSTIN" */;
  input nrst;
  input clk1;
  output [63:0]Timecounter;
  output [59:0]graycnt;
  output [2:0]samplecnt;
  output WL_CLK_P;
  output WL_CLK_N;
  output SSTIN;
endmodule
