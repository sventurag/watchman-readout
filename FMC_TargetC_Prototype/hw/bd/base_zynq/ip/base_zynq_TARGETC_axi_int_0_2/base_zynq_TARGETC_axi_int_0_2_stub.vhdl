-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Mon May 31 18:21:38 2021
-- Host        : idlab2 running 64-bit Ubuntu 20.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top base_zynq_TARGETC_axi_int_0_2 -prefix
--               base_zynq_TARGETC_axi_int_0_2_ base_zynq_TARGETC_axi_int_0_1_stub.vhdl
-- Design      : base_zynq_TARGETC_axi_int_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity base_zynq_TARGETC_axi_int_0_2 is
  Port ( 
    SW_nRST : in STD_LOGIC;
    TestStream : in STD_LOGIC;
    FIFOvalid : in STD_LOGIC;
    FIFOdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady : out STD_LOGIC;
    Cnt_AXIS_DATA : out STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR : in STD_LOGIC;
    TID : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_TVALID : out STD_LOGIC;
    M_AXIS_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_TDEST : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXIS_TLAST : out STD_LOGIC;
    M_AXIS_TID : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_TREADY : in STD_LOGIC
  );

end base_zynq_TARGETC_axi_int_0_2;

architecture stub of base_zynq_TARGETC_axi_int_0_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SW_nRST,TestStream,FIFOvalid,FIFOdata[31:0],StreamReady,Cnt_AXIS_DATA[9:0],CNT_CLR,TID[1:0],M_AXIS_ACLK,M_AXIS_ARESETN,M_AXIS_TVALID,M_AXIS_TDATA[31:0],M_AXIS_TSTRB[3:0],M_AXIS_TDEST[9:0],M_AXIS_TLAST,M_AXIS_TID[1:0],M_AXIS_TREADY";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "axistream,Vivado 2020.2";
begin
end;
