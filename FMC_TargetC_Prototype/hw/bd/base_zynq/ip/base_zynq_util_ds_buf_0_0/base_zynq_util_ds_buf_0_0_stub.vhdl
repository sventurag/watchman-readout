-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Wed Feb 17 14:14:28 2021
-- Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top base_zynq_util_ds_buf_0_0 -prefix
--               base_zynq_util_ds_buf_0_0_ base_zynq_util_ds_buf_0_0_stub.vhdl
-- Design      : base_zynq_util_ds_buf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity base_zynq_util_ds_buf_0_0 is
  Port ( 
    OBUF_IN : in STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_N : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end base_zynq_util_ds_buf_0_0;

architecture stub of base_zynq_util_ds_buf_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "OBUF_IN[0:0],OBUF_DS_P[0:0],OBUF_DS_N[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "util_ds_buf,Vivado 2020.1";
begin
end;
