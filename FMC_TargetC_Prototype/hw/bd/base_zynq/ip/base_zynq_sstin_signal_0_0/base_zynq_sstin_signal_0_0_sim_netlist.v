// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Wed May 19 13:04:07 2021
// Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_sstin_signal_0_0/base_zynq_sstin_signal_0_0_sim_netlist.v
// Design      : base_zynq_sstin_signal_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "base_zynq_sstin_signal_0_0,sstin_signal,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "sstin_signal,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module base_zynq_sstin_signal_0_0
   (nrst,
    clk1,
    Timecounter,
    graycnt,
    samplecnt,
    WL_CLK_P,
    WL_CLK_N,
    SSTIN);
  input nrst;
  input clk1;
  output [63:0]Timecounter;
  output [59:0]graycnt;
  output [2:0]samplecnt;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 WL_CLK_P CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME WL_CLK_P, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_sstin_signal_0_0_WL_CLK_P, INSERT_VIP 0" *) output WL_CLK_P;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 WL_CLK_N CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME WL_CLK_N, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_sstin_signal_0_0_WL_CLK_N, INSERT_VIP 0" *) output WL_CLK_N;
  output SSTIN;

  wire SSTIN;
  wire [63:3]\^Timecounter ;
  (* IOSTANDARD = "LVDS_25" *) (* SLEW = "SLOW" *) wire WL_CLK_N;
  (* IOSTANDARD = "LVDS_25" *) (* SLEW = "SLOW" *) wire WL_CLK_P;
  (* IOSTANDARD = "LVDS_25" *) (* SLEW = "SLOW" *) wire clk1;
  wire [58:0]\^graycnt ;
  wire nrst;
  wire [2:0]samplecnt;

  assign Timecounter[63:3] = \^Timecounter [63:3];
  assign Timecounter[2:0] = samplecnt;
  assign graycnt[59] = \^Timecounter [63];
  assign graycnt[58:0] = \^graycnt [58:0];
  base_zynq_sstin_signal_0_0_sstin_signal U0
       (.SSTIN(SSTIN),
        .Timecounter({\^Timecounter [62:3],samplecnt}),
        .WL_CLK_N(WL_CLK_N),
        .WL_CLK_P(WL_CLK_P),
        .clk1(clk1),
        .graycnt({\^Timecounter [63],\^graycnt }),
        .nrst(nrst));
endmodule

(* ORIG_REF_NAME = "GRAY_ENCODER" *) 
module base_zynq_sstin_signal_0_0_GRAY_ENCODER
   (graycnt,
    Timecounter);
  output [58:0]graycnt;
  input [59:0]Timecounter;

  wire [59:0]Timecounter;
  wire [58:0]graycnt;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[0]_INST_0 
       (.I0(Timecounter[0]),
        .I1(Timecounter[1]),
        .O(graycnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[10]_INST_0 
       (.I0(Timecounter[10]),
        .I1(Timecounter[11]),
        .O(graycnt[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[11]_INST_0 
       (.I0(Timecounter[11]),
        .I1(Timecounter[12]),
        .O(graycnt[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[12]_INST_0 
       (.I0(Timecounter[12]),
        .I1(Timecounter[13]),
        .O(graycnt[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[13]_INST_0 
       (.I0(Timecounter[13]),
        .I1(Timecounter[14]),
        .O(graycnt[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[14]_INST_0 
       (.I0(Timecounter[14]),
        .I1(Timecounter[15]),
        .O(graycnt[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[15]_INST_0 
       (.I0(Timecounter[15]),
        .I1(Timecounter[16]),
        .O(graycnt[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[16]_INST_0 
       (.I0(Timecounter[16]),
        .I1(Timecounter[17]),
        .O(graycnt[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[17]_INST_0 
       (.I0(Timecounter[17]),
        .I1(Timecounter[18]),
        .O(graycnt[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[18]_INST_0 
       (.I0(Timecounter[18]),
        .I1(Timecounter[19]),
        .O(graycnt[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[19]_INST_0 
       (.I0(Timecounter[19]),
        .I1(Timecounter[20]),
        .O(graycnt[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[1]_INST_0 
       (.I0(Timecounter[1]),
        .I1(Timecounter[2]),
        .O(graycnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[20]_INST_0 
       (.I0(Timecounter[20]),
        .I1(Timecounter[21]),
        .O(graycnt[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[21]_INST_0 
       (.I0(Timecounter[21]),
        .I1(Timecounter[22]),
        .O(graycnt[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[22]_INST_0 
       (.I0(Timecounter[22]),
        .I1(Timecounter[23]),
        .O(graycnt[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[23]_INST_0 
       (.I0(Timecounter[23]),
        .I1(Timecounter[24]),
        .O(graycnt[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[24]_INST_0 
       (.I0(Timecounter[24]),
        .I1(Timecounter[25]),
        .O(graycnt[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[25]_INST_0 
       (.I0(Timecounter[25]),
        .I1(Timecounter[26]),
        .O(graycnt[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[26]_INST_0 
       (.I0(Timecounter[26]),
        .I1(Timecounter[27]),
        .O(graycnt[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[27]_INST_0 
       (.I0(Timecounter[27]),
        .I1(Timecounter[28]),
        .O(graycnt[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[28]_INST_0 
       (.I0(Timecounter[28]),
        .I1(Timecounter[29]),
        .O(graycnt[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[29]_INST_0 
       (.I0(Timecounter[29]),
        .I1(Timecounter[30]),
        .O(graycnt[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[2]_INST_0 
       (.I0(Timecounter[2]),
        .I1(Timecounter[3]),
        .O(graycnt[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[30]_INST_0 
       (.I0(Timecounter[30]),
        .I1(Timecounter[31]),
        .O(graycnt[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[31]_INST_0 
       (.I0(Timecounter[31]),
        .I1(Timecounter[32]),
        .O(graycnt[31]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[32]_INST_0 
       (.I0(Timecounter[32]),
        .I1(Timecounter[33]),
        .O(graycnt[32]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[33]_INST_0 
       (.I0(Timecounter[33]),
        .I1(Timecounter[34]),
        .O(graycnt[33]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[34]_INST_0 
       (.I0(Timecounter[34]),
        .I1(Timecounter[35]),
        .O(graycnt[34]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[35]_INST_0 
       (.I0(Timecounter[35]),
        .I1(Timecounter[36]),
        .O(graycnt[35]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[36]_INST_0 
       (.I0(Timecounter[36]),
        .I1(Timecounter[37]),
        .O(graycnt[36]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[37]_INST_0 
       (.I0(Timecounter[37]),
        .I1(Timecounter[38]),
        .O(graycnt[37]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[38]_INST_0 
       (.I0(Timecounter[38]),
        .I1(Timecounter[39]),
        .O(graycnt[38]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[39]_INST_0 
       (.I0(Timecounter[39]),
        .I1(Timecounter[40]),
        .O(graycnt[39]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[3]_INST_0 
       (.I0(Timecounter[3]),
        .I1(Timecounter[4]),
        .O(graycnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[40]_INST_0 
       (.I0(Timecounter[40]),
        .I1(Timecounter[41]),
        .O(graycnt[40]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[41]_INST_0 
       (.I0(Timecounter[41]),
        .I1(Timecounter[42]),
        .O(graycnt[41]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[42]_INST_0 
       (.I0(Timecounter[42]),
        .I1(Timecounter[43]),
        .O(graycnt[42]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[43]_INST_0 
       (.I0(Timecounter[43]),
        .I1(Timecounter[44]),
        .O(graycnt[43]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[44]_INST_0 
       (.I0(Timecounter[44]),
        .I1(Timecounter[45]),
        .O(graycnt[44]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[45]_INST_0 
       (.I0(Timecounter[45]),
        .I1(Timecounter[46]),
        .O(graycnt[45]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[46]_INST_0 
       (.I0(Timecounter[46]),
        .I1(Timecounter[47]),
        .O(graycnt[46]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[47]_INST_0 
       (.I0(Timecounter[47]),
        .I1(Timecounter[48]),
        .O(graycnt[47]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[48]_INST_0 
       (.I0(Timecounter[48]),
        .I1(Timecounter[49]),
        .O(graycnt[48]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[49]_INST_0 
       (.I0(Timecounter[49]),
        .I1(Timecounter[50]),
        .O(graycnt[49]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[4]_INST_0 
       (.I0(Timecounter[4]),
        .I1(Timecounter[5]),
        .O(graycnt[4]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[50]_INST_0 
       (.I0(Timecounter[50]),
        .I1(Timecounter[51]),
        .O(graycnt[50]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[51]_INST_0 
       (.I0(Timecounter[51]),
        .I1(Timecounter[52]),
        .O(graycnt[51]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[52]_INST_0 
       (.I0(Timecounter[52]),
        .I1(Timecounter[53]),
        .O(graycnt[52]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[53]_INST_0 
       (.I0(Timecounter[53]),
        .I1(Timecounter[54]),
        .O(graycnt[53]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[54]_INST_0 
       (.I0(Timecounter[54]),
        .I1(Timecounter[55]),
        .O(graycnt[54]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[55]_INST_0 
       (.I0(Timecounter[55]),
        .I1(Timecounter[56]),
        .O(graycnt[55]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[56]_INST_0 
       (.I0(Timecounter[56]),
        .I1(Timecounter[57]),
        .O(graycnt[56]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[57]_INST_0 
       (.I0(Timecounter[57]),
        .I1(Timecounter[58]),
        .O(graycnt[57]));
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[58]_INST_0 
       (.I0(Timecounter[58]),
        .I1(Timecounter[59]),
        .O(graycnt[58]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[5]_INST_0 
       (.I0(Timecounter[5]),
        .I1(Timecounter[6]),
        .O(graycnt[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[6]_INST_0 
       (.I0(Timecounter[6]),
        .I1(Timecounter[7]),
        .O(graycnt[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[7]_INST_0 
       (.I0(Timecounter[7]),
        .I1(Timecounter[8]),
        .O(graycnt[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[8]_INST_0 
       (.I0(Timecounter[8]),
        .I1(Timecounter[9]),
        .O(graycnt[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \graycnt[9]_INST_0 
       (.I0(Timecounter[9]),
        .I1(Timecounter[10]),
        .O(graycnt[9]));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module base_zynq_sstin_signal_0_0_counter
   (Timecounter,
    SSTIN,
    clk1,
    nrst);
  output [63:0]Timecounter;
  output SSTIN;
  input clk1;
  input nrst;

  wire SSTIN;
  wire [63:0]Timecounter;
  wire clk1;
  wire \cnt[3]_i_2_n_0 ;
  wire \cnt[63]_i_2_n_0 ;
  wire \cnt_reg[11]_i_1_n_0 ;
  wire \cnt_reg[11]_i_1_n_1 ;
  wire \cnt_reg[11]_i_1_n_2 ;
  wire \cnt_reg[11]_i_1_n_3 ;
  wire \cnt_reg[11]_i_1_n_4 ;
  wire \cnt_reg[11]_i_1_n_5 ;
  wire \cnt_reg[11]_i_1_n_6 ;
  wire \cnt_reg[11]_i_1_n_7 ;
  wire \cnt_reg[15]_i_1_n_0 ;
  wire \cnt_reg[15]_i_1_n_1 ;
  wire \cnt_reg[15]_i_1_n_2 ;
  wire \cnt_reg[15]_i_1_n_3 ;
  wire \cnt_reg[15]_i_1_n_4 ;
  wire \cnt_reg[15]_i_1_n_5 ;
  wire \cnt_reg[15]_i_1_n_6 ;
  wire \cnt_reg[15]_i_1_n_7 ;
  wire \cnt_reg[19]_i_1_n_0 ;
  wire \cnt_reg[19]_i_1_n_1 ;
  wire \cnt_reg[19]_i_1_n_2 ;
  wire \cnt_reg[19]_i_1_n_3 ;
  wire \cnt_reg[19]_i_1_n_4 ;
  wire \cnt_reg[19]_i_1_n_5 ;
  wire \cnt_reg[19]_i_1_n_6 ;
  wire \cnt_reg[19]_i_1_n_7 ;
  wire \cnt_reg[23]_i_1_n_0 ;
  wire \cnt_reg[23]_i_1_n_1 ;
  wire \cnt_reg[23]_i_1_n_2 ;
  wire \cnt_reg[23]_i_1_n_3 ;
  wire \cnt_reg[23]_i_1_n_4 ;
  wire \cnt_reg[23]_i_1_n_5 ;
  wire \cnt_reg[23]_i_1_n_6 ;
  wire \cnt_reg[23]_i_1_n_7 ;
  wire \cnt_reg[27]_i_1_n_0 ;
  wire \cnt_reg[27]_i_1_n_1 ;
  wire \cnt_reg[27]_i_1_n_2 ;
  wire \cnt_reg[27]_i_1_n_3 ;
  wire \cnt_reg[27]_i_1_n_4 ;
  wire \cnt_reg[27]_i_1_n_5 ;
  wire \cnt_reg[27]_i_1_n_6 ;
  wire \cnt_reg[27]_i_1_n_7 ;
  wire \cnt_reg[31]_i_1_n_0 ;
  wire \cnt_reg[31]_i_1_n_1 ;
  wire \cnt_reg[31]_i_1_n_2 ;
  wire \cnt_reg[31]_i_1_n_3 ;
  wire \cnt_reg[31]_i_1_n_4 ;
  wire \cnt_reg[31]_i_1_n_5 ;
  wire \cnt_reg[31]_i_1_n_6 ;
  wire \cnt_reg[31]_i_1_n_7 ;
  wire \cnt_reg[35]_i_1_n_0 ;
  wire \cnt_reg[35]_i_1_n_1 ;
  wire \cnt_reg[35]_i_1_n_2 ;
  wire \cnt_reg[35]_i_1_n_3 ;
  wire \cnt_reg[35]_i_1_n_4 ;
  wire \cnt_reg[35]_i_1_n_5 ;
  wire \cnt_reg[35]_i_1_n_6 ;
  wire \cnt_reg[35]_i_1_n_7 ;
  wire \cnt_reg[39]_i_1_n_0 ;
  wire \cnt_reg[39]_i_1_n_1 ;
  wire \cnt_reg[39]_i_1_n_2 ;
  wire \cnt_reg[39]_i_1_n_3 ;
  wire \cnt_reg[39]_i_1_n_4 ;
  wire \cnt_reg[39]_i_1_n_5 ;
  wire \cnt_reg[39]_i_1_n_6 ;
  wire \cnt_reg[39]_i_1_n_7 ;
  wire \cnt_reg[3]_i_1_n_0 ;
  wire \cnt_reg[3]_i_1_n_1 ;
  wire \cnt_reg[3]_i_1_n_2 ;
  wire \cnt_reg[3]_i_1_n_3 ;
  wire \cnt_reg[3]_i_1_n_4 ;
  wire \cnt_reg[3]_i_1_n_5 ;
  wire \cnt_reg[3]_i_1_n_6 ;
  wire \cnt_reg[3]_i_1_n_7 ;
  wire \cnt_reg[43]_i_1_n_0 ;
  wire \cnt_reg[43]_i_1_n_1 ;
  wire \cnt_reg[43]_i_1_n_2 ;
  wire \cnt_reg[43]_i_1_n_3 ;
  wire \cnt_reg[43]_i_1_n_4 ;
  wire \cnt_reg[43]_i_1_n_5 ;
  wire \cnt_reg[43]_i_1_n_6 ;
  wire \cnt_reg[43]_i_1_n_7 ;
  wire \cnt_reg[47]_i_1_n_0 ;
  wire \cnt_reg[47]_i_1_n_1 ;
  wire \cnt_reg[47]_i_1_n_2 ;
  wire \cnt_reg[47]_i_1_n_3 ;
  wire \cnt_reg[47]_i_1_n_4 ;
  wire \cnt_reg[47]_i_1_n_5 ;
  wire \cnt_reg[47]_i_1_n_6 ;
  wire \cnt_reg[47]_i_1_n_7 ;
  wire \cnt_reg[51]_i_1_n_0 ;
  wire \cnt_reg[51]_i_1_n_1 ;
  wire \cnt_reg[51]_i_1_n_2 ;
  wire \cnt_reg[51]_i_1_n_3 ;
  wire \cnt_reg[51]_i_1_n_4 ;
  wire \cnt_reg[51]_i_1_n_5 ;
  wire \cnt_reg[51]_i_1_n_6 ;
  wire \cnt_reg[51]_i_1_n_7 ;
  wire \cnt_reg[55]_i_1_n_0 ;
  wire \cnt_reg[55]_i_1_n_1 ;
  wire \cnt_reg[55]_i_1_n_2 ;
  wire \cnt_reg[55]_i_1_n_3 ;
  wire \cnt_reg[55]_i_1_n_4 ;
  wire \cnt_reg[55]_i_1_n_5 ;
  wire \cnt_reg[55]_i_1_n_6 ;
  wire \cnt_reg[55]_i_1_n_7 ;
  wire \cnt_reg[59]_i_1_n_0 ;
  wire \cnt_reg[59]_i_1_n_1 ;
  wire \cnt_reg[59]_i_1_n_2 ;
  wire \cnt_reg[59]_i_1_n_3 ;
  wire \cnt_reg[59]_i_1_n_4 ;
  wire \cnt_reg[59]_i_1_n_5 ;
  wire \cnt_reg[59]_i_1_n_6 ;
  wire \cnt_reg[59]_i_1_n_7 ;
  wire \cnt_reg[63]_i_1_n_1 ;
  wire \cnt_reg[63]_i_1_n_2 ;
  wire \cnt_reg[63]_i_1_n_3 ;
  wire \cnt_reg[63]_i_1_n_4 ;
  wire \cnt_reg[63]_i_1_n_5 ;
  wire \cnt_reg[63]_i_1_n_6 ;
  wire \cnt_reg[63]_i_1_n_7 ;
  wire \cnt_reg[7]_i_1_n_0 ;
  wire \cnt_reg[7]_i_1_n_1 ;
  wire \cnt_reg[7]_i_1_n_2 ;
  wire \cnt_reg[7]_i_1_n_3 ;
  wire \cnt_reg[7]_i_1_n_4 ;
  wire \cnt_reg[7]_i_1_n_5 ;
  wire \cnt_reg[7]_i_1_n_6 ;
  wire \cnt_reg[7]_i_1_n_7 ;
  wire nrst;
  wire [3:3]\NLW_cnt_reg[63]_i_1_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    SSTIN_INST_0
       (.I0(Timecounter[2]),
        .O(SSTIN));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[3]_i_2 
       (.I0(Timecounter[0]),
        .O(\cnt[3]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[63]_i_2 
       (.I0(nrst),
        .O(\cnt[63]_i_2_n_0 ));
  FDCE \cnt_reg[0] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[3]_i_1_n_7 ),
        .Q(Timecounter[0]));
  FDCE \cnt_reg[10] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[11]_i_1_n_5 ),
        .Q(Timecounter[10]));
  FDCE \cnt_reg[11] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[11]_i_1_n_4 ),
        .Q(Timecounter[11]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[11]_i_1 
       (.CI(\cnt_reg[7]_i_1_n_0 ),
        .CO({\cnt_reg[11]_i_1_n_0 ,\cnt_reg[11]_i_1_n_1 ,\cnt_reg[11]_i_1_n_2 ,\cnt_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[11]_i_1_n_4 ,\cnt_reg[11]_i_1_n_5 ,\cnt_reg[11]_i_1_n_6 ,\cnt_reg[11]_i_1_n_7 }),
        .S(Timecounter[11:8]));
  FDCE \cnt_reg[12] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[15]_i_1_n_7 ),
        .Q(Timecounter[12]));
  FDCE \cnt_reg[13] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[15]_i_1_n_6 ),
        .Q(Timecounter[13]));
  FDCE \cnt_reg[14] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[15]_i_1_n_5 ),
        .Q(Timecounter[14]));
  FDCE \cnt_reg[15] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[15]_i_1_n_4 ),
        .Q(Timecounter[15]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[15]_i_1 
       (.CI(\cnt_reg[11]_i_1_n_0 ),
        .CO({\cnt_reg[15]_i_1_n_0 ,\cnt_reg[15]_i_1_n_1 ,\cnt_reg[15]_i_1_n_2 ,\cnt_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[15]_i_1_n_4 ,\cnt_reg[15]_i_1_n_5 ,\cnt_reg[15]_i_1_n_6 ,\cnt_reg[15]_i_1_n_7 }),
        .S(Timecounter[15:12]));
  FDCE \cnt_reg[16] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[19]_i_1_n_7 ),
        .Q(Timecounter[16]));
  FDCE \cnt_reg[17] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[19]_i_1_n_6 ),
        .Q(Timecounter[17]));
  FDCE \cnt_reg[18] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[19]_i_1_n_5 ),
        .Q(Timecounter[18]));
  FDCE \cnt_reg[19] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[19]_i_1_n_4 ),
        .Q(Timecounter[19]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[19]_i_1 
       (.CI(\cnt_reg[15]_i_1_n_0 ),
        .CO({\cnt_reg[19]_i_1_n_0 ,\cnt_reg[19]_i_1_n_1 ,\cnt_reg[19]_i_1_n_2 ,\cnt_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[19]_i_1_n_4 ,\cnt_reg[19]_i_1_n_5 ,\cnt_reg[19]_i_1_n_6 ,\cnt_reg[19]_i_1_n_7 }),
        .S(Timecounter[19:16]));
  FDCE \cnt_reg[1] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[3]_i_1_n_6 ),
        .Q(Timecounter[1]));
  FDCE \cnt_reg[20] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[23]_i_1_n_7 ),
        .Q(Timecounter[20]));
  FDCE \cnt_reg[21] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[23]_i_1_n_6 ),
        .Q(Timecounter[21]));
  FDCE \cnt_reg[22] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[23]_i_1_n_5 ),
        .Q(Timecounter[22]));
  FDCE \cnt_reg[23] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[23]_i_1_n_4 ),
        .Q(Timecounter[23]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[23]_i_1 
       (.CI(\cnt_reg[19]_i_1_n_0 ),
        .CO({\cnt_reg[23]_i_1_n_0 ,\cnt_reg[23]_i_1_n_1 ,\cnt_reg[23]_i_1_n_2 ,\cnt_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[23]_i_1_n_4 ,\cnt_reg[23]_i_1_n_5 ,\cnt_reg[23]_i_1_n_6 ,\cnt_reg[23]_i_1_n_7 }),
        .S(Timecounter[23:20]));
  FDCE \cnt_reg[24] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[27]_i_1_n_7 ),
        .Q(Timecounter[24]));
  FDCE \cnt_reg[25] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[27]_i_1_n_6 ),
        .Q(Timecounter[25]));
  FDCE \cnt_reg[26] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[27]_i_1_n_5 ),
        .Q(Timecounter[26]));
  FDCE \cnt_reg[27] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[27]_i_1_n_4 ),
        .Q(Timecounter[27]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[27]_i_1 
       (.CI(\cnt_reg[23]_i_1_n_0 ),
        .CO({\cnt_reg[27]_i_1_n_0 ,\cnt_reg[27]_i_1_n_1 ,\cnt_reg[27]_i_1_n_2 ,\cnt_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[27]_i_1_n_4 ,\cnt_reg[27]_i_1_n_5 ,\cnt_reg[27]_i_1_n_6 ,\cnt_reg[27]_i_1_n_7 }),
        .S(Timecounter[27:24]));
  FDCE \cnt_reg[28] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[31]_i_1_n_7 ),
        .Q(Timecounter[28]));
  FDCE \cnt_reg[29] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[31]_i_1_n_6 ),
        .Q(Timecounter[29]));
  FDCE \cnt_reg[2] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[3]_i_1_n_5 ),
        .Q(Timecounter[2]));
  FDCE \cnt_reg[30] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[31]_i_1_n_5 ),
        .Q(Timecounter[30]));
  FDCE \cnt_reg[31] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[31]_i_1_n_4 ),
        .Q(Timecounter[31]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[31]_i_1 
       (.CI(\cnt_reg[27]_i_1_n_0 ),
        .CO({\cnt_reg[31]_i_1_n_0 ,\cnt_reg[31]_i_1_n_1 ,\cnt_reg[31]_i_1_n_2 ,\cnt_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[31]_i_1_n_4 ,\cnt_reg[31]_i_1_n_5 ,\cnt_reg[31]_i_1_n_6 ,\cnt_reg[31]_i_1_n_7 }),
        .S(Timecounter[31:28]));
  FDCE \cnt_reg[32] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[35]_i_1_n_7 ),
        .Q(Timecounter[32]));
  FDCE \cnt_reg[33] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[35]_i_1_n_6 ),
        .Q(Timecounter[33]));
  FDCE \cnt_reg[34] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[35]_i_1_n_5 ),
        .Q(Timecounter[34]));
  FDCE \cnt_reg[35] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[35]_i_1_n_4 ),
        .Q(Timecounter[35]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[35]_i_1 
       (.CI(\cnt_reg[31]_i_1_n_0 ),
        .CO({\cnt_reg[35]_i_1_n_0 ,\cnt_reg[35]_i_1_n_1 ,\cnt_reg[35]_i_1_n_2 ,\cnt_reg[35]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[35]_i_1_n_4 ,\cnt_reg[35]_i_1_n_5 ,\cnt_reg[35]_i_1_n_6 ,\cnt_reg[35]_i_1_n_7 }),
        .S(Timecounter[35:32]));
  FDCE \cnt_reg[36] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[39]_i_1_n_7 ),
        .Q(Timecounter[36]));
  FDCE \cnt_reg[37] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[39]_i_1_n_6 ),
        .Q(Timecounter[37]));
  FDCE \cnt_reg[38] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[39]_i_1_n_5 ),
        .Q(Timecounter[38]));
  FDCE \cnt_reg[39] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[39]_i_1_n_4 ),
        .Q(Timecounter[39]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[39]_i_1 
       (.CI(\cnt_reg[35]_i_1_n_0 ),
        .CO({\cnt_reg[39]_i_1_n_0 ,\cnt_reg[39]_i_1_n_1 ,\cnt_reg[39]_i_1_n_2 ,\cnt_reg[39]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[39]_i_1_n_4 ,\cnt_reg[39]_i_1_n_5 ,\cnt_reg[39]_i_1_n_6 ,\cnt_reg[39]_i_1_n_7 }),
        .S(Timecounter[39:36]));
  FDCE \cnt_reg[3] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[3]_i_1_n_4 ),
        .Q(Timecounter[3]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\cnt_reg[3]_i_1_n_0 ,\cnt_reg[3]_i_1_n_1 ,\cnt_reg[3]_i_1_n_2 ,\cnt_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cnt_reg[3]_i_1_n_4 ,\cnt_reg[3]_i_1_n_5 ,\cnt_reg[3]_i_1_n_6 ,\cnt_reg[3]_i_1_n_7 }),
        .S({Timecounter[3:1],\cnt[3]_i_2_n_0 }));
  FDCE \cnt_reg[40] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[43]_i_1_n_7 ),
        .Q(Timecounter[40]));
  FDCE \cnt_reg[41] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[43]_i_1_n_6 ),
        .Q(Timecounter[41]));
  FDCE \cnt_reg[42] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[43]_i_1_n_5 ),
        .Q(Timecounter[42]));
  FDCE \cnt_reg[43] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[43]_i_1_n_4 ),
        .Q(Timecounter[43]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[43]_i_1 
       (.CI(\cnt_reg[39]_i_1_n_0 ),
        .CO({\cnt_reg[43]_i_1_n_0 ,\cnt_reg[43]_i_1_n_1 ,\cnt_reg[43]_i_1_n_2 ,\cnt_reg[43]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[43]_i_1_n_4 ,\cnt_reg[43]_i_1_n_5 ,\cnt_reg[43]_i_1_n_6 ,\cnt_reg[43]_i_1_n_7 }),
        .S(Timecounter[43:40]));
  FDCE \cnt_reg[44] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[47]_i_1_n_7 ),
        .Q(Timecounter[44]));
  FDCE \cnt_reg[45] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[47]_i_1_n_6 ),
        .Q(Timecounter[45]));
  FDCE \cnt_reg[46] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[47]_i_1_n_5 ),
        .Q(Timecounter[46]));
  FDCE \cnt_reg[47] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[47]_i_1_n_4 ),
        .Q(Timecounter[47]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[47]_i_1 
       (.CI(\cnt_reg[43]_i_1_n_0 ),
        .CO({\cnt_reg[47]_i_1_n_0 ,\cnt_reg[47]_i_1_n_1 ,\cnt_reg[47]_i_1_n_2 ,\cnt_reg[47]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[47]_i_1_n_4 ,\cnt_reg[47]_i_1_n_5 ,\cnt_reg[47]_i_1_n_6 ,\cnt_reg[47]_i_1_n_7 }),
        .S(Timecounter[47:44]));
  FDCE \cnt_reg[48] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[51]_i_1_n_7 ),
        .Q(Timecounter[48]));
  FDCE \cnt_reg[49] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[51]_i_1_n_6 ),
        .Q(Timecounter[49]));
  FDCE \cnt_reg[4] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[7]_i_1_n_7 ),
        .Q(Timecounter[4]));
  FDCE \cnt_reg[50] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[51]_i_1_n_5 ),
        .Q(Timecounter[50]));
  FDCE \cnt_reg[51] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[51]_i_1_n_4 ),
        .Q(Timecounter[51]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[51]_i_1 
       (.CI(\cnt_reg[47]_i_1_n_0 ),
        .CO({\cnt_reg[51]_i_1_n_0 ,\cnt_reg[51]_i_1_n_1 ,\cnt_reg[51]_i_1_n_2 ,\cnt_reg[51]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[51]_i_1_n_4 ,\cnt_reg[51]_i_1_n_5 ,\cnt_reg[51]_i_1_n_6 ,\cnt_reg[51]_i_1_n_7 }),
        .S(Timecounter[51:48]));
  FDCE \cnt_reg[52] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[55]_i_1_n_7 ),
        .Q(Timecounter[52]));
  FDCE \cnt_reg[53] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[55]_i_1_n_6 ),
        .Q(Timecounter[53]));
  FDCE \cnt_reg[54] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[55]_i_1_n_5 ),
        .Q(Timecounter[54]));
  FDCE \cnt_reg[55] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[55]_i_1_n_4 ),
        .Q(Timecounter[55]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[55]_i_1 
       (.CI(\cnt_reg[51]_i_1_n_0 ),
        .CO({\cnt_reg[55]_i_1_n_0 ,\cnt_reg[55]_i_1_n_1 ,\cnt_reg[55]_i_1_n_2 ,\cnt_reg[55]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[55]_i_1_n_4 ,\cnt_reg[55]_i_1_n_5 ,\cnt_reg[55]_i_1_n_6 ,\cnt_reg[55]_i_1_n_7 }),
        .S(Timecounter[55:52]));
  FDCE \cnt_reg[56] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[59]_i_1_n_7 ),
        .Q(Timecounter[56]));
  FDCE \cnt_reg[57] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[59]_i_1_n_6 ),
        .Q(Timecounter[57]));
  FDCE \cnt_reg[58] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[59]_i_1_n_5 ),
        .Q(Timecounter[58]));
  FDCE \cnt_reg[59] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[59]_i_1_n_4 ),
        .Q(Timecounter[59]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[59]_i_1 
       (.CI(\cnt_reg[55]_i_1_n_0 ),
        .CO({\cnt_reg[59]_i_1_n_0 ,\cnt_reg[59]_i_1_n_1 ,\cnt_reg[59]_i_1_n_2 ,\cnt_reg[59]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[59]_i_1_n_4 ,\cnt_reg[59]_i_1_n_5 ,\cnt_reg[59]_i_1_n_6 ,\cnt_reg[59]_i_1_n_7 }),
        .S(Timecounter[59:56]));
  FDCE \cnt_reg[5] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[7]_i_1_n_6 ),
        .Q(Timecounter[5]));
  FDCE \cnt_reg[60] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[63]_i_1_n_7 ),
        .Q(Timecounter[60]));
  FDCE \cnt_reg[61] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[63]_i_1_n_6 ),
        .Q(Timecounter[61]));
  FDCE \cnt_reg[62] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[63]_i_1_n_5 ),
        .Q(Timecounter[62]));
  FDCE \cnt_reg[63] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[63]_i_1_n_4 ),
        .Q(Timecounter[63]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[63]_i_1 
       (.CI(\cnt_reg[59]_i_1_n_0 ),
        .CO({\NLW_cnt_reg[63]_i_1_CO_UNCONNECTED [3],\cnt_reg[63]_i_1_n_1 ,\cnt_reg[63]_i_1_n_2 ,\cnt_reg[63]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[63]_i_1_n_4 ,\cnt_reg[63]_i_1_n_5 ,\cnt_reg[63]_i_1_n_6 ,\cnt_reg[63]_i_1_n_7 }),
        .S(Timecounter[63:60]));
  FDCE \cnt_reg[6] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[7]_i_1_n_5 ),
        .Q(Timecounter[6]));
  FDCE \cnt_reg[7] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[7]_i_1_n_4 ),
        .Q(Timecounter[7]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_reg[7]_i_1 
       (.CI(\cnt_reg[3]_i_1_n_0 ),
        .CO({\cnt_reg[7]_i_1_n_0 ,\cnt_reg[7]_i_1_n_1 ,\cnt_reg[7]_i_1_n_2 ,\cnt_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[7]_i_1_n_4 ,\cnt_reg[7]_i_1_n_5 ,\cnt_reg[7]_i_1_n_6 ,\cnt_reg[7]_i_1_n_7 }),
        .S(Timecounter[7:4]));
  FDCE \cnt_reg[8] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[11]_i_1_n_7 ),
        .Q(Timecounter[8]));
  FDCE \cnt_reg[9] 
       (.C(clk1),
        .CE(1'b1),
        .CLR(\cnt[63]_i_2_n_0 ),
        .D(\cnt_reg[11]_i_1_n_6 ),
        .Q(Timecounter[9]));
endmodule

(* ORIG_REF_NAME = "sstin_signal" *) 
module base_zynq_sstin_signal_0_0_sstin_signal
   (graycnt,
    Timecounter,
    WL_CLK_P,
    WL_CLK_N,
    SSTIN,
    clk1,
    nrst);
  output [59:0]graycnt;
  output [62:0]Timecounter;
  output WL_CLK_P;
  output WL_CLK_N;
  output SSTIN;
  input clk1;
  input nrst;

  wire SSTIN;
  (* MARK_DEBUG *) wire SSTIN_intl;
  wire [62:0]Timecounter;
  wire WL_CLK_N;
  wire WL_CLK_P;
  wire clk1;
  wire [59:0]graycnt;
  wire nrst;

  base_zynq_sstin_signal_0_0_GRAY_ENCODER GrayTime
       (.Timecounter({graycnt[59],Timecounter[62:4]}),
        .graycnt(graycnt[58:0]));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS OBUFDF_WL_CLK
       (.I(clk1),
        .O(WL_CLK_P),
        .OB(WL_CLK_N));
  base_zynq_sstin_signal_0_0_counter TimeCnt_inst
       (.SSTIN(SSTIN),
        .Timecounter({graycnt[59],Timecounter}),
        .clk1(clk1),
        .nrst(nrst));
  LUT1 #(
    .INIT(2'h2)) 
    U0i_0
       (.I0(1'b0),
        .O(SSTIN_intl));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
