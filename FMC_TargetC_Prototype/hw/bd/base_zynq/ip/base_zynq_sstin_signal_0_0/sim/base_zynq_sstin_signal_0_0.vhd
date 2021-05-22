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

-- IP VLNV: xilinx.com:module_ref:sstin_signal:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY base_zynq_sstin_signal_0_0 IS
  PORT (
    nrst : IN STD_LOGIC;
    clk1 : IN STD_LOGIC;
    Timecounter : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    graycnt : OUT STD_LOGIC_VECTOR(59 DOWNTO 0);
    samplecnt : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    WL_CLK_P : OUT STD_LOGIC;
    WL_CLK_N : OUT STD_LOGIC;
    SSTIN : OUT STD_LOGIC
  );
END base_zynq_sstin_signal_0_0;

ARCHITECTURE base_zynq_sstin_signal_0_0_arch OF base_zynq_sstin_signal_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF base_zynq_sstin_signal_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT sstin_signal IS
    PORT (
      nrst : IN STD_LOGIC;
      clk1 : IN STD_LOGIC;
      Timecounter : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      graycnt : OUT STD_LOGIC_VECTOR(59 DOWNTO 0);
      samplecnt : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      WL_CLK_P : OUT STD_LOGIC;
      WL_CLK_N : OUT STD_LOGIC;
      SSTIN : OUT STD_LOGIC
    );
  END COMPONENT sstin_signal;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF base_zynq_sstin_signal_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF WL_CLK_N: SIGNAL IS "XIL_INTERFACENAME WL_CLK_N, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_sstin_signal_0_0_WL_CLK_N, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF WL_CLK_N: SIGNAL IS "xilinx.com:signal:clock:1.0 WL_CLK_N CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF WL_CLK_P: SIGNAL IS "XIL_INTERFACENAME WL_CLK_P, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_sstin_signal_0_0_WL_CLK_P, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF WL_CLK_P: SIGNAL IS "xilinx.com:signal:clock:1.0 WL_CLK_P CLK";
BEGIN
  U0 : sstin_signal
    PORT MAP (
      nrst => nrst,
      clk1 => clk1,
      Timecounter => Timecounter,
      graycnt => graycnt,
      samplecnt => samplecnt,
      WL_CLK_P => WL_CLK_P,
      WL_CLK_N => WL_CLK_N,
      SSTIN => SSTIN
    );
END base_zynq_sstin_signal_0_0_arch;