// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon May  3 11:04:45 2021
// Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_TARGETC_2ASICS_0_0/base_zynq_TARGETC_2ASICS_0_0_stub.v
// Design      : base_zynq_TARGETC_2ASICS_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "TARGETC_2ASICS,Vivado 2020.1" *)
module base_zynq_TARGETC_2ASICS_0_0(SW_nRST_A, RefCLK_i1, aresetn, tcA_axi_aclk, 
  tcA_axi_aresetn, tcA_axi_awaddr, tcA_axi_awprot, tcA_axi_awvalid, tcA_axi_awready, 
  tcA_axi_wdata, tcA_axi_wstrb, tcA_axi_wvalid, tcA_axi_wready, tcA_axi_bresp, 
  tcA_axi_bvalid, tcA_axi_bready, tcA_axi_araddr, tcA_axi_arprot, tcA_axi_arvalid, 
  tcA_axi_arready, tcA_axi_rdata, tcA_axi_rresp, tcA_axi_rvalid, tcA_axi_rready, SIN, SCLK, 
  PCLK_A, SHOUT_A, HSCLK_P_A, HSCLK_N_A, WR_RS_S0_A, WR_RS_S1_A, WL_CLK_P, WL_CLK_N, WR_CS_S0_A, 
  WR_CS_S1_A, WR_CS_S2_A, WR_CS_S3_A, WR_CS_S4_A, WR_CS_S5_A, GCC_RESET_A, RDAD_CLK_A, 
  RDAD_SIN_A, RDAD_DIR_A, SAMPLESEL_ANY_A, DO_A, SS_INCR_A, DOE_A, DONE_A, SS_RESET_A, REGCLR_A, 
  SS_LD_SIN_A, SS_LD_DIR_A, RAMP_A, SSTIN, MONTIMING_P_A, MONTIMING_N_A, Cnt_AXIS_DATA_A, 
  CNT_CLR_A, TestStream_A, FIFOvalid_A, FIFOdata_A, StreamReady_A, TrigA_A, TrigB_A, TrigC_A, 
  TrigD_A, WS_masterctrl_in_A, WS_masterctrl_out_A, SSVALID_INTR_A, SW_nRST_B, tcB_axi_aclk, 
  tcB_axi_aresetn, tcB_axi_awaddr, tcB_axi_awprot, tcB_axi_awvalid, tcB_axi_awready, 
  tcB_axi_wdata, tcB_axi_wstrb, tcB_axi_wvalid, tcB_axi_wready, tcB_axi_bresp, 
  tcB_axi_bvalid, tcB_axi_bready, tcB_axi_araddr, tcB_axi_arprot, tcB_axi_arvalid, 
  tcB_axi_arready, tcB_axi_rdata, tcB_axi_rresp, tcB_axi_rvalid, tcB_axi_rready, PCLK_B, 
  SHOUT_B, HSCLK_P_B, HSCLK_N_B, WR_RS_S0_B, WR_RS_S1_B, WR_CS_S0_B, WR_CS_S1_B, WR_CS_S2_B, 
  WR_CS_S3_B, WR_CS_S4_B, WR_CS_S5_B, GCC_RESET_B, RDAD_CLK_B, RDAD_SIN_B, RDAD_DIR_B, 
  SAMPLESEL_ANY_B, DO_B, SS_INCR_B, DOE_B, DONE_B, SS_RESET_B, REGCLR_B, SS_LD_SIN_B, SS_LD_DIR_B, 
  RAMP_B, MONTIMING_P_B, MONTIMING_N_B, Cnt_AXIS_DATA_B, CNT_CLR_B, TestStream_B, FIFOvalid_B, 
  FIFOdata_B, StreamReady_B, TrigA_B, TrigB_B, TrigC_B, TrigD_B, WS_masterctrl_in_B, 
  WS_masterctrl_out_B, SSVALID_INTR_B)
/* synthesis syn_black_box black_box_pad_pin="SW_nRST_A,RefCLK_i1,aresetn,tcA_axi_aclk,tcA_axi_aresetn,tcA_axi_awaddr[31:0],tcA_axi_awprot[2:0],tcA_axi_awvalid,tcA_axi_awready,tcA_axi_wdata[31:0],tcA_axi_wstrb[3:0],tcA_axi_wvalid,tcA_axi_wready,tcA_axi_bresp[1:0],tcA_axi_bvalid,tcA_axi_bready,tcA_axi_araddr[31:0],tcA_axi_arprot[2:0],tcA_axi_arvalid,tcA_axi_arready,tcA_axi_rdata[31:0],tcA_axi_rresp[1:0],tcA_axi_rvalid,tcA_axi_rready,SIN,SCLK,PCLK_A,SHOUT_A,HSCLK_P_A,HSCLK_N_A,WR_RS_S0_A,WR_RS_S1_A,WL_CLK_P,WL_CLK_N,WR_CS_S0_A,WR_CS_S1_A,WR_CS_S2_A,WR_CS_S3_A,WR_CS_S4_A,WR_CS_S5_A,GCC_RESET_A,RDAD_CLK_A,RDAD_SIN_A,RDAD_DIR_A,SAMPLESEL_ANY_A,DO_A[15:0],SS_INCR_A,DOE_A,DONE_A,SS_RESET_A,REGCLR_A,SS_LD_SIN_A,SS_LD_DIR_A,RAMP_A,SSTIN,MONTIMING_P_A,MONTIMING_N_A,Cnt_AXIS_DATA_A[9:0],CNT_CLR_A,TestStream_A,FIFOvalid_A,FIFOdata_A[31:0],StreamReady_A,TrigA_A,TrigB_A,TrigC_A,TrigD_A,WS_masterctrl_in_A,WS_masterctrl_out_A,SSVALID_INTR_A,SW_nRST_B,tcB_axi_aclk,tcB_axi_aresetn,tcB_axi_awaddr[31:0],tcB_axi_awprot[2:0],tcB_axi_awvalid,tcB_axi_awready,tcB_axi_wdata[31:0],tcB_axi_wstrb[3:0],tcB_axi_wvalid,tcB_axi_wready,tcB_axi_bresp[1:0],tcB_axi_bvalid,tcB_axi_bready,tcB_axi_araddr[31:0],tcB_axi_arprot[2:0],tcB_axi_arvalid,tcB_axi_arready,tcB_axi_rdata[31:0],tcB_axi_rresp[1:0],tcB_axi_rvalid,tcB_axi_rready,PCLK_B,SHOUT_B,HSCLK_P_B,HSCLK_N_B,WR_RS_S0_B,WR_RS_S1_B,WR_CS_S0_B,WR_CS_S1_B,WR_CS_S2_B,WR_CS_S3_B,WR_CS_S4_B,WR_CS_S5_B,GCC_RESET_B,RDAD_CLK_B,RDAD_SIN_B,RDAD_DIR_B,SAMPLESEL_ANY_B,DO_B[15:0],SS_INCR_B,DOE_B,DONE_B,SS_RESET_B,REGCLR_B,SS_LD_SIN_B,SS_LD_DIR_B,RAMP_B,MONTIMING_P_B,MONTIMING_N_B,Cnt_AXIS_DATA_B[9:0],CNT_CLR_B,TestStream_B,FIFOvalid_B,FIFOdata_B[31:0],StreamReady_B,TrigA_B,TrigB_B,TrigC_B,TrigD_B,WS_masterctrl_in_B,WS_masterctrl_out_B,SSVALID_INTR_B" */;
  output SW_nRST_A;
  input RefCLK_i1;
  input aresetn;
  input tcA_axi_aclk;
  input tcA_axi_aresetn;
  input [31:0]tcA_axi_awaddr;
  input [2:0]tcA_axi_awprot;
  input tcA_axi_awvalid;
  output tcA_axi_awready;
  input [31:0]tcA_axi_wdata;
  input [3:0]tcA_axi_wstrb;
  input tcA_axi_wvalid;
  output tcA_axi_wready;
  output [1:0]tcA_axi_bresp;
  output tcA_axi_bvalid;
  input tcA_axi_bready;
  input [31:0]tcA_axi_araddr;
  input [2:0]tcA_axi_arprot;
  input tcA_axi_arvalid;
  output tcA_axi_arready;
  output [31:0]tcA_axi_rdata;
  output [1:0]tcA_axi_rresp;
  output tcA_axi_rvalid;
  input tcA_axi_rready;
  output SIN;
  output SCLK;
  output PCLK_A;
  input SHOUT_A;
  output HSCLK_P_A;
  output HSCLK_N_A;
  output WR_RS_S0_A;
  output WR_RS_S1_A;
  output WL_CLK_P;
  output WL_CLK_N;
  output WR_CS_S0_A;
  output WR_CS_S1_A;
  output WR_CS_S2_A;
  output WR_CS_S3_A;
  output WR_CS_S4_A;
  output WR_CS_S5_A;
  output GCC_RESET_A;
  output RDAD_CLK_A;
  output RDAD_SIN_A;
  output RDAD_DIR_A;
  output SAMPLESEL_ANY_A;
  input [15:0]DO_A;
  output SS_INCR_A;
  output DOE_A;
  input DONE_A;
  output SS_RESET_A;
  output REGCLR_A;
  output SS_LD_SIN_A;
  output SS_LD_DIR_A;
  output RAMP_A;
  output SSTIN;
  input MONTIMING_P_A;
  input MONTIMING_N_A;
  input [9:0]Cnt_AXIS_DATA_A;
  output CNT_CLR_A;
  output TestStream_A;
  output FIFOvalid_A;
  output [31:0]FIFOdata_A;
  input StreamReady_A;
  input TrigA_A;
  input TrigB_A;
  input TrigC_A;
  input TrigD_A;
  input WS_masterctrl_in_A;
  output WS_masterctrl_out_A;
  output SSVALID_INTR_A;
  output SW_nRST_B;
  input tcB_axi_aclk;
  input tcB_axi_aresetn;
  input [31:0]tcB_axi_awaddr;
  input [2:0]tcB_axi_awprot;
  input tcB_axi_awvalid;
  output tcB_axi_awready;
  input [31:0]tcB_axi_wdata;
  input [3:0]tcB_axi_wstrb;
  input tcB_axi_wvalid;
  output tcB_axi_wready;
  output [1:0]tcB_axi_bresp;
  output tcB_axi_bvalid;
  input tcB_axi_bready;
  input [31:0]tcB_axi_araddr;
  input [2:0]tcB_axi_arprot;
  input tcB_axi_arvalid;
  output tcB_axi_arready;
  output [31:0]tcB_axi_rdata;
  output [1:0]tcB_axi_rresp;
  output tcB_axi_rvalid;
  input tcB_axi_rready;
  output PCLK_B;
  input SHOUT_B;
  output HSCLK_P_B;
  output HSCLK_N_B;
  output WR_RS_S0_B;
  output WR_RS_S1_B;
  output WR_CS_S0_B;
  output WR_CS_S1_B;
  output WR_CS_S2_B;
  output WR_CS_S3_B;
  output WR_CS_S4_B;
  output WR_CS_S5_B;
  output GCC_RESET_B;
  output RDAD_CLK_B;
  output RDAD_SIN_B;
  output RDAD_DIR_B;
  output SAMPLESEL_ANY_B;
  input [15:0]DO_B;
  output SS_INCR_B;
  output DOE_B;
  input DONE_B;
  output SS_RESET_B;
  output REGCLR_B;
  output SS_LD_SIN_B;
  output SS_LD_DIR_B;
  output RAMP_B;
  input MONTIMING_P_B;
  input MONTIMING_N_B;
  input [9:0]Cnt_AXIS_DATA_B;
  output CNT_CLR_B;
  output TestStream_B;
  output FIFOvalid_B;
  output [31:0]FIFOdata_B;
  input StreamReady_B;
  input TrigA_B;
  input TrigB_B;
  input TrigC_B;
  input TrigD_B;
  input WS_masterctrl_in_B;
  output WS_masterctrl_out_B;
  output SSVALID_INTR_B;
endmodule
