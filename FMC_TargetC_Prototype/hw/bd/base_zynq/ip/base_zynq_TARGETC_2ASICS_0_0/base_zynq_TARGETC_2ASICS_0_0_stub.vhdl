-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Sun May  2 11:02:56 2021
-- Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_TARGETC_2ASICS_0_0/base_zynq_TARGETC_2ASICS_0_0_stub.vhdl
-- Design      : base_zynq_TARGETC_2ASICS_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity base_zynq_TARGETC_2ASICS_0_0 is
  Port ( 
    SW_nRST_A : out STD_LOGIC;
    RefCLK_i1 : in STD_LOGIC;
    axi_aclk : in STD_LOGIC;
    axi_aresetn : in STD_LOGIC;
    tcA_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tcA_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tcA_axi_awvalid : in STD_LOGIC;
    tcA_axi_awready : out STD_LOGIC;
    tcA_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tcA_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    tcA_axi_wvalid : in STD_LOGIC;
    tcA_axi_wready : out STD_LOGIC;
    tcA_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tcA_axi_bvalid : out STD_LOGIC;
    tcA_axi_bready : in STD_LOGIC;
    tcA_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tcA_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tcA_axi_arvalid : in STD_LOGIC;
    tcA_axi_arready : out STD_LOGIC;
    tcA_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tcA_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tcA_axi_rvalid : out STD_LOGIC;
    tcA_axi_rready : in STD_LOGIC;
    SIN : out STD_LOGIC;
    SCLK : out STD_LOGIC;
    PCLK_A : out STD_LOGIC;
    SHOUT_A : in STD_LOGIC;
    HSCLK_P_A : out STD_LOGIC;
    HSCLK_N_A : out STD_LOGIC;
    WR_RS_S0_A : out STD_LOGIC;
    WR_RS_S1_A : out STD_LOGIC;
    WL_CLK_P : out STD_LOGIC;
    WL_CLK_N : out STD_LOGIC;
    WR_CS_S0_A : out STD_LOGIC;
    WR_CS_S1_A : out STD_LOGIC;
    WR_CS_S2_A : out STD_LOGIC;
    WR_CS_S3_A : out STD_LOGIC;
    WR_CS_S4_A : out STD_LOGIC;
    WR_CS_S5_A : out STD_LOGIC;
    GCC_RESET_A : out STD_LOGIC;
    RDAD_CLK_A : out STD_LOGIC;
    RDAD_SIN_A : out STD_LOGIC;
    RDAD_DIR_A : out STD_LOGIC;
    SAMPLESEL_ANY_A : out STD_LOGIC;
    DO_A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SS_INCR_A : out STD_LOGIC;
    DOE_A : out STD_LOGIC;
    DONE_A : in STD_LOGIC;
    SS_RESET_A : out STD_LOGIC;
    REGCLR_A : out STD_LOGIC;
    SS_LD_SIN_A : out STD_LOGIC;
    SS_LD_DIR_A : out STD_LOGIC;
    RAMP_A : out STD_LOGIC;
    SSTIN : out STD_LOGIC;
    MONTIMING_P_A : in STD_LOGIC;
    MONTIMING_N_A : in STD_LOGIC;
    Cnt_AXIS_DATA_A : in STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR_A : out STD_LOGIC;
    TestStream_A : out STD_LOGIC;
    FIFOvalid_A : out STD_LOGIC;
    FIFOdata_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady_A : in STD_LOGIC;
    TrigA_A : in STD_LOGIC;
    TrigB_A : in STD_LOGIC;
    TrigC_A : in STD_LOGIC;
    TrigD_A : in STD_LOGIC;
    WS_masterctrl_in_A : in STD_LOGIC;
    WS_masterctrl_out_A : out STD_LOGIC;
    SSVALID_INTR_A : out STD_LOGIC;
    SW_nRST_B : out STD_LOGIC;
    tcB_axi_aclk : in STD_LOGIC;
    tcB_axi_aresetn : in STD_LOGIC;
    tcB_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tcB_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tcB_axi_awvalid : in STD_LOGIC;
    tcB_axi_awready : out STD_LOGIC;
    tcB_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tcB_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    tcB_axi_wvalid : in STD_LOGIC;
    tcB_axi_wready : out STD_LOGIC;
    tcB_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tcB_axi_bvalid : out STD_LOGIC;
    tcB_axi_bready : in STD_LOGIC;
    tcB_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tcB_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tcB_axi_arvalid : in STD_LOGIC;
    tcB_axi_arready : out STD_LOGIC;
    tcB_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tcB_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tcB_axi_rvalid : out STD_LOGIC;
    tcB_axi_rready : in STD_LOGIC;
    PCLK_B : out STD_LOGIC;
    SHOUT_B : in STD_LOGIC;
    HSCLK_P_B : out STD_LOGIC;
    HSCLK_N_B : out STD_LOGIC;
    WR_RS_S0_B : out STD_LOGIC;
    WR_RS_S1_B : out STD_LOGIC;
    WR_CS_S0_B : out STD_LOGIC;
    WR_CS_S1_B : out STD_LOGIC;
    WR_CS_S2_B : out STD_LOGIC;
    WR_CS_S3_B : out STD_LOGIC;
    WR_CS_S4_B : out STD_LOGIC;
    WR_CS_S5_B : out STD_LOGIC;
    GCC_RESET_B : out STD_LOGIC;
    RDAD_CLK_B : out STD_LOGIC;
    RDAD_SIN_B : out STD_LOGIC;
    RDAD_DIR_B : out STD_LOGIC;
    SAMPLESEL_ANY_B : out STD_LOGIC;
    DO_B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SS_INCR_B : out STD_LOGIC;
    DOE_B : out STD_LOGIC;
    DONE_B : in STD_LOGIC;
    SS_RESET_B : out STD_LOGIC;
    REGCLR_B : out STD_LOGIC;
    SS_LD_SIN_B : out STD_LOGIC;
    SS_LD_DIR_B : out STD_LOGIC;
    RAMP_B : out STD_LOGIC;
    MONTIMING_P_B : in STD_LOGIC;
    MONTIMING_N_B : in STD_LOGIC;
    Cnt_AXIS_DATA_B : in STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR_B : out STD_LOGIC;
    TestStream_B : out STD_LOGIC;
    FIFOvalid_B : out STD_LOGIC;
    FIFOdata_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady_B : in STD_LOGIC;
    TrigA_B : in STD_LOGIC;
    TrigB_B : in STD_LOGIC;
    TrigC_B : in STD_LOGIC;
    TrigD_B : in STD_LOGIC;
    WS_masterctrl_in_B : in STD_LOGIC;
    WS_masterctrl_out_B : out STD_LOGIC;
    SSVALID_INTR_B : out STD_LOGIC
  );

end base_zynq_TARGETC_2ASICS_0_0;

architecture stub of base_zynq_TARGETC_2ASICS_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SW_nRST_A,RefCLK_i1,axi_aclk,axi_aresetn,tcA_axi_awaddr[31:0],tcA_axi_awprot[2:0],tcA_axi_awvalid,tcA_axi_awready,tcA_axi_wdata[31:0],tcA_axi_wstrb[3:0],tcA_axi_wvalid,tcA_axi_wready,tcA_axi_bresp[1:0],tcA_axi_bvalid,tcA_axi_bready,tcA_axi_araddr[31:0],tcA_axi_arprot[2:0],tcA_axi_arvalid,tcA_axi_arready,tcA_axi_rdata[31:0],tcA_axi_rresp[1:0],tcA_axi_rvalid,tcA_axi_rready,SIN,SCLK,PCLK_A,SHOUT_A,HSCLK_P_A,HSCLK_N_A,WR_RS_S0_A,WR_RS_S1_A,WL_CLK_P,WL_CLK_N,WR_CS_S0_A,WR_CS_S1_A,WR_CS_S2_A,WR_CS_S3_A,WR_CS_S4_A,WR_CS_S5_A,GCC_RESET_A,RDAD_CLK_A,RDAD_SIN_A,RDAD_DIR_A,SAMPLESEL_ANY_A,DO_A[15:0],SS_INCR_A,DOE_A,DONE_A,SS_RESET_A,REGCLR_A,SS_LD_SIN_A,SS_LD_DIR_A,RAMP_A,SSTIN,MONTIMING_P_A,MONTIMING_N_A,Cnt_AXIS_DATA_A[9:0],CNT_CLR_A,TestStream_A,FIFOvalid_A,FIFOdata_A[31:0],StreamReady_A,TrigA_A,TrigB_A,TrigC_A,TrigD_A,WS_masterctrl_in_A,WS_masterctrl_out_A,SSVALID_INTR_A,SW_nRST_B,tcB_axi_aclk,tcB_axi_aresetn,tcB_axi_awaddr[31:0],tcB_axi_awprot[2:0],tcB_axi_awvalid,tcB_axi_awready,tcB_axi_wdata[31:0],tcB_axi_wstrb[3:0],tcB_axi_wvalid,tcB_axi_wready,tcB_axi_bresp[1:0],tcB_axi_bvalid,tcB_axi_bready,tcB_axi_araddr[31:0],tcB_axi_arprot[2:0],tcB_axi_arvalid,tcB_axi_arready,tcB_axi_rdata[31:0],tcB_axi_rresp[1:0],tcB_axi_rvalid,tcB_axi_rready,PCLK_B,SHOUT_B,HSCLK_P_B,HSCLK_N_B,WR_RS_S0_B,WR_RS_S1_B,WR_CS_S0_B,WR_CS_S1_B,WR_CS_S2_B,WR_CS_S3_B,WR_CS_S4_B,WR_CS_S5_B,GCC_RESET_B,RDAD_CLK_B,RDAD_SIN_B,RDAD_DIR_B,SAMPLESEL_ANY_B,DO_B[15:0],SS_INCR_B,DOE_B,DONE_B,SS_RESET_B,REGCLR_B,SS_LD_SIN_B,SS_LD_DIR_B,RAMP_B,MONTIMING_P_B,MONTIMING_N_B,Cnt_AXIS_DATA_B[9:0],CNT_CLR_B,TestStream_B,FIFOvalid_B,FIFOdata_B[31:0],StreamReady_B,TrigA_B,TrigB_B,TrigC_B,TrigD_B,WS_masterctrl_in_B,WS_masterctrl_out_B,SSVALID_INTR_B";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "TARGETC_2ASICS,Vivado 2020.1";
begin
end;
