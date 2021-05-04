-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:TARGETC_2ASICS:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY base_zynq_TARGETC_2ASICS_0_0 IS
  PORT (
    SW_nRST_A : OUT STD_LOGIC;
    RefCLK_i1 : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    tcA_axi_aclk : IN STD_LOGIC;
    tcA_axi_aresetn : IN STD_LOGIC;
    tcA_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcA_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    tcA_axi_awvalid : IN STD_LOGIC;
    tcA_axi_awready : OUT STD_LOGIC;
    tcA_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcA_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    tcA_axi_wvalid : IN STD_LOGIC;
    tcA_axi_wready : OUT STD_LOGIC;
    tcA_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    tcA_axi_bvalid : OUT STD_LOGIC;
    tcA_axi_bready : IN STD_LOGIC;
    tcA_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcA_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    tcA_axi_arvalid : IN STD_LOGIC;
    tcA_axi_arready : OUT STD_LOGIC;
    tcA_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcA_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    tcA_axi_rvalid : OUT STD_LOGIC;
    tcA_axi_rready : IN STD_LOGIC;
    SIN : OUT STD_LOGIC;
    SCLK : OUT STD_LOGIC;
    PCLK_A : OUT STD_LOGIC;
    SHOUT_A : IN STD_LOGIC;
    HSCLK_P_A : OUT STD_LOGIC;
    HSCLK_N_A : OUT STD_LOGIC;
    WR_RS_S0_A : OUT STD_LOGIC;
    WR_RS_S1_A : OUT STD_LOGIC;
    WL_CLK_P : OUT STD_LOGIC;
    WL_CLK_N : OUT STD_LOGIC;
    WR_CS_S0_A : OUT STD_LOGIC;
    WR_CS_S1_A : OUT STD_LOGIC;
    WR_CS_S2_A : OUT STD_LOGIC;
    WR_CS_S3_A : OUT STD_LOGIC;
    WR_CS_S4_A : OUT STD_LOGIC;
    WR_CS_S5_A : OUT STD_LOGIC;
    GCC_RESET_A : OUT STD_LOGIC;
    RDAD_CLK_A : OUT STD_LOGIC;
    RDAD_SIN_A : OUT STD_LOGIC;
    RDAD_DIR_A : OUT STD_LOGIC;
    SAMPLESEL_ANY_A : OUT STD_LOGIC;
    DO_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    SS_INCR_A : OUT STD_LOGIC;
    DOE_A : OUT STD_LOGIC;
    DONE_A : IN STD_LOGIC;
    SS_RESET_A : OUT STD_LOGIC;
    REGCLR_A : OUT STD_LOGIC;
    SS_LD_SIN_A : OUT STD_LOGIC;
    SS_LD_DIR_A : OUT STD_LOGIC;
    RAMP_A : OUT STD_LOGIC;
    SSTIN : OUT STD_LOGIC;
    MONTIMING_P_A : IN STD_LOGIC;
    MONTIMING_N_A : IN STD_LOGIC;
    Cnt_AXIS_DATA_A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    CNT_CLR_A : OUT STD_LOGIC;
    TestStream_A : OUT STD_LOGIC;
    FIFOvalid_A : OUT STD_LOGIC;
    FIFOdata_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    StreamReady_A : IN STD_LOGIC;
    TrigA_A : IN STD_LOGIC;
    TrigB_A : IN STD_LOGIC;
    TrigC_A : IN STD_LOGIC;
    TrigD_A : IN STD_LOGIC;
    WS_masterctrl_in_A : IN STD_LOGIC;
    WS_masterctrl_out_A : OUT STD_LOGIC;
    SSVALID_INTR_A : OUT STD_LOGIC;
    SW_nRST_B : OUT STD_LOGIC;
    tcB_axi_aclk : IN STD_LOGIC;
    tcB_axi_aresetn : IN STD_LOGIC;
    tcB_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcB_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    tcB_axi_awvalid : IN STD_LOGIC;
    tcB_axi_awready : OUT STD_LOGIC;
    tcB_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcB_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    tcB_axi_wvalid : IN STD_LOGIC;
    tcB_axi_wready : OUT STD_LOGIC;
    tcB_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    tcB_axi_bvalid : OUT STD_LOGIC;
    tcB_axi_bready : IN STD_LOGIC;
    tcB_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcB_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    tcB_axi_arvalid : IN STD_LOGIC;
    tcB_axi_arready : OUT STD_LOGIC;
    tcB_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    tcB_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    tcB_axi_rvalid : OUT STD_LOGIC;
    tcB_axi_rready : IN STD_LOGIC;
    PCLK_B : OUT STD_LOGIC;
    SHOUT_B : IN STD_LOGIC;
    HSCLK_P_B : OUT STD_LOGIC;
    HSCLK_N_B : OUT STD_LOGIC;
    WR_RS_S0_B : OUT STD_LOGIC;
    WR_RS_S1_B : OUT STD_LOGIC;
    WR_CS_S0_B : OUT STD_LOGIC;
    WR_CS_S1_B : OUT STD_LOGIC;
    WR_CS_S2_B : OUT STD_LOGIC;
    WR_CS_S3_B : OUT STD_LOGIC;
    WR_CS_S4_B : OUT STD_LOGIC;
    WR_CS_S5_B : OUT STD_LOGIC;
    GCC_RESET_B : OUT STD_LOGIC;
    RDAD_CLK_B : OUT STD_LOGIC;
    RDAD_SIN_B : OUT STD_LOGIC;
    RDAD_DIR_B : OUT STD_LOGIC;
    SAMPLESEL_ANY_B : OUT STD_LOGIC;
    DO_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    SS_INCR_B : OUT STD_LOGIC;
    DOE_B : OUT STD_LOGIC;
    DONE_B : IN STD_LOGIC;
    SS_RESET_B : OUT STD_LOGIC;
    REGCLR_B : OUT STD_LOGIC;
    SS_LD_SIN_B : OUT STD_LOGIC;
    SS_LD_DIR_B : OUT STD_LOGIC;
    RAMP_B : OUT STD_LOGIC;
    MONTIMING_P_B : IN STD_LOGIC;
    MONTIMING_N_B : IN STD_LOGIC;
    Cnt_AXIS_DATA_B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    CNT_CLR_B : OUT STD_LOGIC;
    TestStream_B : OUT STD_LOGIC;
    FIFOvalid_B : OUT STD_LOGIC;
    FIFOdata_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    StreamReady_B : IN STD_LOGIC;
    TrigA_B : IN STD_LOGIC;
    TrigB_B : IN STD_LOGIC;
    TrigC_B : IN STD_LOGIC;
    TrigD_B : IN STD_LOGIC;
    WS_masterctrl_in_B : IN STD_LOGIC;
    WS_masterctrl_out_B : OUT STD_LOGIC;
    SSVALID_INTR_B : OUT STD_LOGIC
  );
END base_zynq_TARGETC_2ASICS_0_0;

ARCHITECTURE base_zynq_TARGETC_2ASICS_0_0_arch OF base_zynq_TARGETC_2ASICS_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF base_zynq_TARGETC_2ASICS_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT TARGETC_2ASICS IS
    PORT (
      SW_nRST_A : OUT STD_LOGIC;
      RefCLK_i1 : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      tcA_axi_aclk : IN STD_LOGIC;
      tcA_axi_aresetn : IN STD_LOGIC;
      tcA_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcA_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      tcA_axi_awvalid : IN STD_LOGIC;
      tcA_axi_awready : OUT STD_LOGIC;
      tcA_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcA_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      tcA_axi_wvalid : IN STD_LOGIC;
      tcA_axi_wready : OUT STD_LOGIC;
      tcA_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      tcA_axi_bvalid : OUT STD_LOGIC;
      tcA_axi_bready : IN STD_LOGIC;
      tcA_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcA_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      tcA_axi_arvalid : IN STD_LOGIC;
      tcA_axi_arready : OUT STD_LOGIC;
      tcA_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcA_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      tcA_axi_rvalid : OUT STD_LOGIC;
      tcA_axi_rready : IN STD_LOGIC;
      SIN : OUT STD_LOGIC;
      SCLK : OUT STD_LOGIC;
      PCLK_A : OUT STD_LOGIC;
      SHOUT_A : IN STD_LOGIC;
      HSCLK_P_A : OUT STD_LOGIC;
      HSCLK_N_A : OUT STD_LOGIC;
      WR_RS_S0_A : OUT STD_LOGIC;
      WR_RS_S1_A : OUT STD_LOGIC;
      WL_CLK_P : OUT STD_LOGIC;
      WL_CLK_N : OUT STD_LOGIC;
      WR_CS_S0_A : OUT STD_LOGIC;
      WR_CS_S1_A : OUT STD_LOGIC;
      WR_CS_S2_A : OUT STD_LOGIC;
      WR_CS_S3_A : OUT STD_LOGIC;
      WR_CS_S4_A : OUT STD_LOGIC;
      WR_CS_S5_A : OUT STD_LOGIC;
      GCC_RESET_A : OUT STD_LOGIC;
      RDAD_CLK_A : OUT STD_LOGIC;
      RDAD_SIN_A : OUT STD_LOGIC;
      RDAD_DIR_A : OUT STD_LOGIC;
      SAMPLESEL_ANY_A : OUT STD_LOGIC;
      DO_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      SS_INCR_A : OUT STD_LOGIC;
      DOE_A : OUT STD_LOGIC;
      DONE_A : IN STD_LOGIC;
      SS_RESET_A : OUT STD_LOGIC;
      REGCLR_A : OUT STD_LOGIC;
      SS_LD_SIN_A : OUT STD_LOGIC;
      SS_LD_DIR_A : OUT STD_LOGIC;
      RAMP_A : OUT STD_LOGIC;
      SSTIN : OUT STD_LOGIC;
      MONTIMING_P_A : IN STD_LOGIC;
      MONTIMING_N_A : IN STD_LOGIC;
      Cnt_AXIS_DATA_A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      CNT_CLR_A : OUT STD_LOGIC;
      TestStream_A : OUT STD_LOGIC;
      FIFOvalid_A : OUT STD_LOGIC;
      FIFOdata_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      StreamReady_A : IN STD_LOGIC;
      TrigA_A : IN STD_LOGIC;
      TrigB_A : IN STD_LOGIC;
      TrigC_A : IN STD_LOGIC;
      TrigD_A : IN STD_LOGIC;
      WS_masterctrl_in_A : IN STD_LOGIC;
      WS_masterctrl_out_A : OUT STD_LOGIC;
      SSVALID_INTR_A : OUT STD_LOGIC;
      SW_nRST_B : OUT STD_LOGIC;
      tcB_axi_aclk : IN STD_LOGIC;
      tcB_axi_aresetn : IN STD_LOGIC;
      tcB_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcB_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      tcB_axi_awvalid : IN STD_LOGIC;
      tcB_axi_awready : OUT STD_LOGIC;
      tcB_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcB_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      tcB_axi_wvalid : IN STD_LOGIC;
      tcB_axi_wready : OUT STD_LOGIC;
      tcB_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      tcB_axi_bvalid : OUT STD_LOGIC;
      tcB_axi_bready : IN STD_LOGIC;
      tcB_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcB_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      tcB_axi_arvalid : IN STD_LOGIC;
      tcB_axi_arready : OUT STD_LOGIC;
      tcB_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      tcB_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      tcB_axi_rvalid : OUT STD_LOGIC;
      tcB_axi_rready : IN STD_LOGIC;
      PCLK_B : OUT STD_LOGIC;
      SHOUT_B : IN STD_LOGIC;
      HSCLK_P_B : OUT STD_LOGIC;
      HSCLK_N_B : OUT STD_LOGIC;
      WR_RS_S0_B : OUT STD_LOGIC;
      WR_RS_S1_B : OUT STD_LOGIC;
      WR_CS_S0_B : OUT STD_LOGIC;
      WR_CS_S1_B : OUT STD_LOGIC;
      WR_CS_S2_B : OUT STD_LOGIC;
      WR_CS_S3_B : OUT STD_LOGIC;
      WR_CS_S4_B : OUT STD_LOGIC;
      WR_CS_S5_B : OUT STD_LOGIC;
      GCC_RESET_B : OUT STD_LOGIC;
      RDAD_CLK_B : OUT STD_LOGIC;
      RDAD_SIN_B : OUT STD_LOGIC;
      RDAD_DIR_B : OUT STD_LOGIC;
      SAMPLESEL_ANY_B : OUT STD_LOGIC;
      DO_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      SS_INCR_B : OUT STD_LOGIC;
      DOE_B : OUT STD_LOGIC;
      DONE_B : IN STD_LOGIC;
      SS_RESET_B : OUT STD_LOGIC;
      REGCLR_B : OUT STD_LOGIC;
      SS_LD_SIN_B : OUT STD_LOGIC;
      SS_LD_DIR_B : OUT STD_LOGIC;
      RAMP_B : OUT STD_LOGIC;
      MONTIMING_P_B : IN STD_LOGIC;
      MONTIMING_N_B : IN STD_LOGIC;
      Cnt_AXIS_DATA_B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      CNT_CLR_B : OUT STD_LOGIC;
      TestStream_B : OUT STD_LOGIC;
      FIFOvalid_B : OUT STD_LOGIC;
      FIFOdata_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      StreamReady_B : IN STD_LOGIC;
      TrigA_B : IN STD_LOGIC;
      TrigB_B : IN STD_LOGIC;
      TrigC_B : IN STD_LOGIC;
      TrigD_B : IN STD_LOGIC;
      WS_masterctrl_in_B : IN STD_LOGIC;
      WS_masterctrl_out_B : OUT STD_LOGIC;
      SSVALID_INTR_B : OUT STD_LOGIC
    );
  END COMPONENT TARGETC_2ASICS;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF base_zynq_TARGETC_2ASICS_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi AWPROT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF tcB_axi_awaddr: SIGNAL IS "XIL_INTERFACENAME tcB_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 125000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, NUM_READ_THR" & 
"EADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcB_axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF tcB_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME tcB_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 tcB_axi_aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF tcB_axi_aclk: SIGNAL IS "XIL_INTERFACENAME tcB_axi_aclk, ASSOCIATED_BUSIF tcB_axi, ASSOCIATED_RESET tcB_axi_aresetn, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF tcB_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 tcB_axi_aclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF WL_CLK_N: SIGNAL IS "XIL_INTERFACENAME WL_CLK_N, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_TARGETC_2ASICS_0_0_WL_CLK_N, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF WL_CLK_N: SIGNAL IS "xilinx.com:signal:clock:1.0 WL_CLK_N CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF WL_CLK_P: SIGNAL IS "XIL_INTERFACENAME WL_CLK_P, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_TARGETC_2ASICS_0_0_WL_CLK_P, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF WL_CLK_P: SIGNAL IS "xilinx.com:signal:clock:1.0 WL_CLK_P CLK";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi AWPROT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF tcA_axi_awaddr: SIGNAL IS "XIL_INTERFACENAME tcA_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 125000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, NUM_READ_THR" & 
"EADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 tcA_axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF tcA_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME tcA_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 tcA_axi_aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF tcA_axi_aclk: SIGNAL IS "XIL_INTERFACENAME tcA_axi_aclk, ASSOCIATED_BUSIF tcA_axi, ASSOCIATED_RESET tcA_axi_aresetn, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF tcA_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 tcA_axi_aclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aresetn: SIGNAL IS "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 aresetn RST";
BEGIN
  U0 : TARGETC_2ASICS
    PORT MAP (
      SW_nRST_A => SW_nRST_A,
      RefCLK_i1 => RefCLK_i1,
      aresetn => aresetn,
      tcA_axi_aclk => tcA_axi_aclk,
      tcA_axi_aresetn => tcA_axi_aresetn,
      tcA_axi_awaddr => tcA_axi_awaddr,
      tcA_axi_awprot => tcA_axi_awprot,
      tcA_axi_awvalid => tcA_axi_awvalid,
      tcA_axi_awready => tcA_axi_awready,
      tcA_axi_wdata => tcA_axi_wdata,
      tcA_axi_wstrb => tcA_axi_wstrb,
      tcA_axi_wvalid => tcA_axi_wvalid,
      tcA_axi_wready => tcA_axi_wready,
      tcA_axi_bresp => tcA_axi_bresp,
      tcA_axi_bvalid => tcA_axi_bvalid,
      tcA_axi_bready => tcA_axi_bready,
      tcA_axi_araddr => tcA_axi_araddr,
      tcA_axi_arprot => tcA_axi_arprot,
      tcA_axi_arvalid => tcA_axi_arvalid,
      tcA_axi_arready => tcA_axi_arready,
      tcA_axi_rdata => tcA_axi_rdata,
      tcA_axi_rresp => tcA_axi_rresp,
      tcA_axi_rvalid => tcA_axi_rvalid,
      tcA_axi_rready => tcA_axi_rready,
      SIN => SIN,
      SCLK => SCLK,
      PCLK_A => PCLK_A,
      SHOUT_A => SHOUT_A,
      HSCLK_P_A => HSCLK_P_A,
      HSCLK_N_A => HSCLK_N_A,
      WR_RS_S0_A => WR_RS_S0_A,
      WR_RS_S1_A => WR_RS_S1_A,
      WL_CLK_P => WL_CLK_P,
      WL_CLK_N => WL_CLK_N,
      WR_CS_S0_A => WR_CS_S0_A,
      WR_CS_S1_A => WR_CS_S1_A,
      WR_CS_S2_A => WR_CS_S2_A,
      WR_CS_S3_A => WR_CS_S3_A,
      WR_CS_S4_A => WR_CS_S4_A,
      WR_CS_S5_A => WR_CS_S5_A,
      GCC_RESET_A => GCC_RESET_A,
      RDAD_CLK_A => RDAD_CLK_A,
      RDAD_SIN_A => RDAD_SIN_A,
      RDAD_DIR_A => RDAD_DIR_A,
      SAMPLESEL_ANY_A => SAMPLESEL_ANY_A,
      DO_A => DO_A,
      SS_INCR_A => SS_INCR_A,
      DOE_A => DOE_A,
      DONE_A => DONE_A,
      SS_RESET_A => SS_RESET_A,
      REGCLR_A => REGCLR_A,
      SS_LD_SIN_A => SS_LD_SIN_A,
      SS_LD_DIR_A => SS_LD_DIR_A,
      RAMP_A => RAMP_A,
      SSTIN => SSTIN,
      MONTIMING_P_A => MONTIMING_P_A,
      MONTIMING_N_A => MONTIMING_N_A,
      Cnt_AXIS_DATA_A => Cnt_AXIS_DATA_A,
      CNT_CLR_A => CNT_CLR_A,
      TestStream_A => TestStream_A,
      FIFOvalid_A => FIFOvalid_A,
      FIFOdata_A => FIFOdata_A,
      StreamReady_A => StreamReady_A,
      TrigA_A => TrigA_A,
      TrigB_A => TrigB_A,
      TrigC_A => TrigC_A,
      TrigD_A => TrigD_A,
      WS_masterctrl_in_A => WS_masterctrl_in_A,
      WS_masterctrl_out_A => WS_masterctrl_out_A,
      SSVALID_INTR_A => SSVALID_INTR_A,
      SW_nRST_B => SW_nRST_B,
      tcB_axi_aclk => tcB_axi_aclk,
      tcB_axi_aresetn => tcB_axi_aresetn,
      tcB_axi_awaddr => tcB_axi_awaddr,
      tcB_axi_awprot => tcB_axi_awprot,
      tcB_axi_awvalid => tcB_axi_awvalid,
      tcB_axi_awready => tcB_axi_awready,
      tcB_axi_wdata => tcB_axi_wdata,
      tcB_axi_wstrb => tcB_axi_wstrb,
      tcB_axi_wvalid => tcB_axi_wvalid,
      tcB_axi_wready => tcB_axi_wready,
      tcB_axi_bresp => tcB_axi_bresp,
      tcB_axi_bvalid => tcB_axi_bvalid,
      tcB_axi_bready => tcB_axi_bready,
      tcB_axi_araddr => tcB_axi_araddr,
      tcB_axi_arprot => tcB_axi_arprot,
      tcB_axi_arvalid => tcB_axi_arvalid,
      tcB_axi_arready => tcB_axi_arready,
      tcB_axi_rdata => tcB_axi_rdata,
      tcB_axi_rresp => tcB_axi_rresp,
      tcB_axi_rvalid => tcB_axi_rvalid,
      tcB_axi_rready => tcB_axi_rready,
      PCLK_B => PCLK_B,
      SHOUT_B => SHOUT_B,
      HSCLK_P_B => HSCLK_P_B,
      HSCLK_N_B => HSCLK_N_B,
      WR_RS_S0_B => WR_RS_S0_B,
      WR_RS_S1_B => WR_RS_S1_B,
      WR_CS_S0_B => WR_CS_S0_B,
      WR_CS_S1_B => WR_CS_S1_B,
      WR_CS_S2_B => WR_CS_S2_B,
      WR_CS_S3_B => WR_CS_S3_B,
      WR_CS_S4_B => WR_CS_S4_B,
      WR_CS_S5_B => WR_CS_S5_B,
      GCC_RESET_B => GCC_RESET_B,
      RDAD_CLK_B => RDAD_CLK_B,
      RDAD_SIN_B => RDAD_SIN_B,
      RDAD_DIR_B => RDAD_DIR_B,
      SAMPLESEL_ANY_B => SAMPLESEL_ANY_B,
      DO_B => DO_B,
      SS_INCR_B => SS_INCR_B,
      DOE_B => DOE_B,
      DONE_B => DONE_B,
      SS_RESET_B => SS_RESET_B,
      REGCLR_B => REGCLR_B,
      SS_LD_SIN_B => SS_LD_SIN_B,
      SS_LD_DIR_B => SS_LD_DIR_B,
      RAMP_B => RAMP_B,
      MONTIMING_P_B => MONTIMING_P_B,
      MONTIMING_N_B => MONTIMING_N_B,
      Cnt_AXIS_DATA_B => Cnt_AXIS_DATA_B,
      CNT_CLR_B => CNT_CLR_B,
      TestStream_B => TestStream_B,
      FIFOvalid_B => FIFOvalid_B,
      FIFOdata_B => FIFOdata_B,
      StreamReady_B => StreamReady_B,
      TrigA_B => TrigA_B,
      TrigB_B => TrigB_B,
      TrigC_B => TrigC_B,
      TrigD_B => TrigD_B,
      WS_masterctrl_in_B => WS_masterctrl_in_B,
      WS_masterctrl_out_B => WS_masterctrl_out_B,
      SSVALID_INTR_B => SSVALID_INTR_B
    );
END base_zynq_TARGETC_2ASICS_0_0_arch;
