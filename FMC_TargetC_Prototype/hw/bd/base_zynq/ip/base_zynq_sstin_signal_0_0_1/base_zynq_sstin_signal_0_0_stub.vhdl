-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Wed May 26 14:35:33 2021
-- Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_sstin_signal_0_0_1/base_zynq_sstin_signal_0_0_stub.vhdl
-- Design      : base_zynq_sstin_signal_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity base_zynq_sstin_signal_0_0 is
  Port ( 
    nrst : in STD_LOGIC;
    clk1 : in STD_LOGIC;
    Timecounter : out STD_LOGIC_VECTOR ( 63 downto 0 );
    graycnt : out STD_LOGIC_VECTOR ( 59 downto 0 );
    samplecnt : out STD_LOGIC_VECTOR ( 2 downto 0 );
    WL_CLK_P : out STD_LOGIC;
    WL_CLK_N : out STD_LOGIC;
    SSTIN : out STD_LOGIC
  );

end base_zynq_sstin_signal_0_0;

architecture stub of base_zynq_sstin_signal_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "nrst,clk1,Timecounter[63:0],graycnt[59:0],samplecnt[2:0],WL_CLK_P,WL_CLK_N,SSTIN";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "sstin_signal,Vivado 2020.1";
begin
end;
