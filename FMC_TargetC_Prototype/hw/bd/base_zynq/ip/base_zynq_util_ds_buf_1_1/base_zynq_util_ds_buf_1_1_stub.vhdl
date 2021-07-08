-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Wed Jul  7 10:44:36 2021
-- Host        : idlab2 running 64-bit Ubuntu 20.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home2/salvador/github/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_util_ds_buf_1_1/base_zynq_util_ds_buf_1_1_stub.vhdl
-- Design      : base_zynq_util_ds_buf_1_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity base_zynq_util_ds_buf_1_1 is
  Port ( 
    OBUF_IN : in STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_N : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end base_zynq_util_ds_buf_1_1;

architecture stub of base_zynq_util_ds_buf_1_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "OBUF_IN[0:0],OBUF_DS_P[0:0],OBUF_DS_N[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "util_ds_buf,Vivado 2020.2";
begin
end;
