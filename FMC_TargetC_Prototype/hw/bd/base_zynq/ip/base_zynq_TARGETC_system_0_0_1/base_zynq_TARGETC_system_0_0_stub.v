// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon May 24 01:13:27 2021
// Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_TARGETC_system_0_0_1/base_zynq_TARGETC_system_0_0_stub.v
// Design      : base_zynq_TARGETC_system_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "TARGETC_system,Vivado 2020.1" *)
module base_zynq_TARGETC_system_0_0(SW_nRST, aresetn, RefCLK_i1, tc_axi_aclk, 
  tc_axi_aresetn, tc_axi_awaddr, tc_axi_awprot, tc_axi_awvalid, tc_axi_awready, tc_axi_wdata, 
  tc_axi_wstrb, tc_axi_wvalid, tc_axi_wready, tc_axi_bresp, tc_axi_bvalid, tc_axi_bready, 
  tc_axi_araddr, tc_axi_arprot, tc_axi_arvalid, tc_axi_arready, tc_axi_rdata, tc_axi_rresp, 
  tc_axi_rvalid, tc_axi_rready, SIN, SCLK, PCLK, SHOUT, HSCLK_P, HSCLK_N, WR_RS_S0, WR_RS_S1, WR_CS_S0, 
  WR_CS_S1, WR_CS_S2, WR_CS_S3, WR_CS_S4, WR_CS_S5, GCC_RESET, RDAD_CLK, RDAD_SIN, RDAD_DIR, 
  SAMPLESEL_ANY, D_Out, SS_INCR, DONE, SS_RESET, SS_LD_SIN, SS_LD_DIR, RAMP, MONTIMING_P, 
  MONTIMING_N, Cnt_AXIS_DATA, CNT_CLR, TestStream, FIFOvalid, FIFOdata, StreamReady, TrigA, TrigB, 
  TrigC, TrigD, WS_masterctrl_in, SSVALID_INTR, SSTIN, Timecounter, graycnt, samplecnt)
/* synthesis syn_black_box black_box_pad_pin="SW_nRST,aresetn,RefCLK_i1,tc_axi_aclk,tc_axi_aresetn,tc_axi_awaddr[31:0],tc_axi_awprot[2:0],tc_axi_awvalid,tc_axi_awready,tc_axi_wdata[31:0],tc_axi_wstrb[3:0],tc_axi_wvalid,tc_axi_wready,tc_axi_bresp[1:0],tc_axi_bvalid,tc_axi_bready,tc_axi_araddr[31:0],tc_axi_arprot[2:0],tc_axi_arvalid,tc_axi_arready,tc_axi_rdata[31:0],tc_axi_rresp[1:0],tc_axi_rvalid,tc_axi_rready,SIN,SCLK,PCLK,SHOUT,HSCLK_P,HSCLK_N,WR_RS_S0,WR_RS_S1,WR_CS_S0,WR_CS_S1,WR_CS_S2,WR_CS_S3,WR_CS_S4,WR_CS_S5,GCC_RESET,RDAD_CLK,RDAD_SIN,RDAD_DIR,SAMPLESEL_ANY,D_Out[15:0],SS_INCR,DONE,SS_RESET,SS_LD_SIN,SS_LD_DIR,RAMP,MONTIMING_P,MONTIMING_N,Cnt_AXIS_DATA[9:0],CNT_CLR,TestStream,FIFOvalid,FIFOdata[31:0],StreamReady,TrigA,TrigB,TrigC,TrigD,WS_masterctrl_in,SSVALID_INTR,SSTIN,Timecounter[63:0],graycnt[59:0],samplecnt[2:0]" */;
  output SW_nRST;
  input aresetn;
  input RefCLK_i1;
  input tc_axi_aclk;
  input tc_axi_aresetn;
  input [31:0]tc_axi_awaddr;
  input [2:0]tc_axi_awprot;
  input tc_axi_awvalid;
  output tc_axi_awready;
  input [31:0]tc_axi_wdata;
  input [3:0]tc_axi_wstrb;
  input tc_axi_wvalid;
  output tc_axi_wready;
  output [1:0]tc_axi_bresp;
  output tc_axi_bvalid;
  input tc_axi_bready;
  input [31:0]tc_axi_araddr;
  input [2:0]tc_axi_arprot;
  input tc_axi_arvalid;
  output tc_axi_arready;
  output [31:0]tc_axi_rdata;
  output [1:0]tc_axi_rresp;
  output tc_axi_rvalid;
  input tc_axi_rready;
  output SIN;
  output SCLK;
  output PCLK;
  input SHOUT;
  output HSCLK_P;
  output HSCLK_N;
  output WR_RS_S0;
  output WR_RS_S1;
  output WR_CS_S0;
  output WR_CS_S1;
  output WR_CS_S2;
  output WR_CS_S3;
  output WR_CS_S4;
  output WR_CS_S5;
  output GCC_RESET;
  output RDAD_CLK;
  output RDAD_SIN;
  output RDAD_DIR;
  output SAMPLESEL_ANY;
  input [15:0]D_Out;
  output SS_INCR;
  input DONE;
  output SS_RESET;
  output SS_LD_SIN;
  output SS_LD_DIR;
  output RAMP;
  input MONTIMING_P;
  input MONTIMING_N;
  input [9:0]Cnt_AXIS_DATA;
  output CNT_CLR;
  output TestStream;
  output FIFOvalid;
  output [31:0]FIFOdata;
  input StreamReady;
  input TrigA;
  input TrigB;
  input TrigC;
  input TrigD;
  input WS_masterctrl_in;
  output SSVALID_INTR;
  input SSTIN;
  input [63:0]Timecounter;
  input [59:0]graycnt;
  input [2:0]samplecnt;
endmodule
