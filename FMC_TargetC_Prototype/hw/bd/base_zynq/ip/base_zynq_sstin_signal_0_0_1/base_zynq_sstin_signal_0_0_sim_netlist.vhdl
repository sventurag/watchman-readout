-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri May 21 19:57:41 2021
-- Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_sstin_signal_0_0_1/base_zynq_sstin_signal_0_0_sim_netlist.vhdl
-- Design      : base_zynq_sstin_signal_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_sstin_signal_0_0_GRAY_ENCODER is
  port (
    graycnt : out STD_LOGIC_VECTOR ( 58 downto 0 );
    Timecounter : in STD_LOGIC_VECTOR ( 59 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_sstin_signal_0_0_GRAY_ENCODER : entity is "GRAY_ENCODER";
end base_zynq_sstin_signal_0_0_GRAY_ENCODER;

architecture STRUCTURE of base_zynq_sstin_signal_0_0_GRAY_ENCODER is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \graycnt[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \graycnt[10]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \graycnt[11]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \graycnt[12]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \graycnt[13]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \graycnt[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \graycnt[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \graycnt[16]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \graycnt[17]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \graycnt[18]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \graycnt[19]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \graycnt[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \graycnt[20]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \graycnt[21]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \graycnt[22]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \graycnt[23]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \graycnt[24]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \graycnt[25]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \graycnt[26]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \graycnt[27]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \graycnt[28]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \graycnt[29]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \graycnt[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \graycnt[30]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \graycnt[31]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \graycnt[32]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \graycnt[33]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \graycnt[34]_INST_0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \graycnt[35]_INST_0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \graycnt[36]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \graycnt[37]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \graycnt[38]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \graycnt[39]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \graycnt[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \graycnt[40]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \graycnt[41]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \graycnt[42]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \graycnt[43]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \graycnt[44]_INST_0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \graycnt[45]_INST_0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \graycnt[46]_INST_0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \graycnt[47]_INST_0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \graycnt[48]_INST_0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \graycnt[49]_INST_0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \graycnt[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \graycnt[50]_INST_0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \graycnt[51]_INST_0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \graycnt[52]_INST_0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \graycnt[53]_INST_0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \graycnt[54]_INST_0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \graycnt[55]_INST_0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \graycnt[56]_INST_0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \graycnt[57]_INST_0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \graycnt[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \graycnt[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \graycnt[7]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \graycnt[8]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \graycnt[9]_INST_0\ : label is "soft_lutpair4";
begin
\graycnt[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(0),
      I1 => Timecounter(1),
      O => graycnt(0)
    );
\graycnt[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(10),
      I1 => Timecounter(11),
      O => graycnt(10)
    );
\graycnt[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(11),
      I1 => Timecounter(12),
      O => graycnt(11)
    );
\graycnt[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(12),
      I1 => Timecounter(13),
      O => graycnt(12)
    );
\graycnt[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(13),
      I1 => Timecounter(14),
      O => graycnt(13)
    );
\graycnt[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(14),
      I1 => Timecounter(15),
      O => graycnt(14)
    );
\graycnt[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(15),
      I1 => Timecounter(16),
      O => graycnt(15)
    );
\graycnt[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(16),
      I1 => Timecounter(17),
      O => graycnt(16)
    );
\graycnt[17]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(17),
      I1 => Timecounter(18),
      O => graycnt(17)
    );
\graycnt[18]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(18),
      I1 => Timecounter(19),
      O => graycnt(18)
    );
\graycnt[19]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(19),
      I1 => Timecounter(20),
      O => graycnt(19)
    );
\graycnt[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(1),
      I1 => Timecounter(2),
      O => graycnt(1)
    );
\graycnt[20]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(20),
      I1 => Timecounter(21),
      O => graycnt(20)
    );
\graycnt[21]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(21),
      I1 => Timecounter(22),
      O => graycnt(21)
    );
\graycnt[22]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(22),
      I1 => Timecounter(23),
      O => graycnt(22)
    );
\graycnt[23]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(23),
      I1 => Timecounter(24),
      O => graycnt(23)
    );
\graycnt[24]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(24),
      I1 => Timecounter(25),
      O => graycnt(24)
    );
\graycnt[25]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(25),
      I1 => Timecounter(26),
      O => graycnt(25)
    );
\graycnt[26]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(26),
      I1 => Timecounter(27),
      O => graycnt(26)
    );
\graycnt[27]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(27),
      I1 => Timecounter(28),
      O => graycnt(27)
    );
\graycnt[28]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(28),
      I1 => Timecounter(29),
      O => graycnt(28)
    );
\graycnt[29]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(29),
      I1 => Timecounter(30),
      O => graycnt(29)
    );
\graycnt[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(2),
      I1 => Timecounter(3),
      O => graycnt(2)
    );
\graycnt[30]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(30),
      I1 => Timecounter(31),
      O => graycnt(30)
    );
\graycnt[31]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(31),
      I1 => Timecounter(32),
      O => graycnt(31)
    );
\graycnt[32]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(32),
      I1 => Timecounter(33),
      O => graycnt(32)
    );
\graycnt[33]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(33),
      I1 => Timecounter(34),
      O => graycnt(33)
    );
\graycnt[34]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(34),
      I1 => Timecounter(35),
      O => graycnt(34)
    );
\graycnt[35]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(35),
      I1 => Timecounter(36),
      O => graycnt(35)
    );
\graycnt[36]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(36),
      I1 => Timecounter(37),
      O => graycnt(36)
    );
\graycnt[37]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(37),
      I1 => Timecounter(38),
      O => graycnt(37)
    );
\graycnt[38]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(38),
      I1 => Timecounter(39),
      O => graycnt(38)
    );
\graycnt[39]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(39),
      I1 => Timecounter(40),
      O => graycnt(39)
    );
\graycnt[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(3),
      I1 => Timecounter(4),
      O => graycnt(3)
    );
\graycnt[40]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(40),
      I1 => Timecounter(41),
      O => graycnt(40)
    );
\graycnt[41]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(41),
      I1 => Timecounter(42),
      O => graycnt(41)
    );
\graycnt[42]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(42),
      I1 => Timecounter(43),
      O => graycnt(42)
    );
\graycnt[43]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(43),
      I1 => Timecounter(44),
      O => graycnt(43)
    );
\graycnt[44]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(44),
      I1 => Timecounter(45),
      O => graycnt(44)
    );
\graycnt[45]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(45),
      I1 => Timecounter(46),
      O => graycnt(45)
    );
\graycnt[46]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(46),
      I1 => Timecounter(47),
      O => graycnt(46)
    );
\graycnt[47]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(47),
      I1 => Timecounter(48),
      O => graycnt(47)
    );
\graycnt[48]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(48),
      I1 => Timecounter(49),
      O => graycnt(48)
    );
\graycnt[49]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(49),
      I1 => Timecounter(50),
      O => graycnt(49)
    );
\graycnt[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(4),
      I1 => Timecounter(5),
      O => graycnt(4)
    );
\graycnt[50]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(50),
      I1 => Timecounter(51),
      O => graycnt(50)
    );
\graycnt[51]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(51),
      I1 => Timecounter(52),
      O => graycnt(51)
    );
\graycnt[52]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(52),
      I1 => Timecounter(53),
      O => graycnt(52)
    );
\graycnt[53]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(53),
      I1 => Timecounter(54),
      O => graycnt(53)
    );
\graycnt[54]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(54),
      I1 => Timecounter(55),
      O => graycnt(54)
    );
\graycnt[55]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(55),
      I1 => Timecounter(56),
      O => graycnt(55)
    );
\graycnt[56]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(56),
      I1 => Timecounter(57),
      O => graycnt(56)
    );
\graycnt[57]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(57),
      I1 => Timecounter(58),
      O => graycnt(57)
    );
\graycnt[58]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(58),
      I1 => Timecounter(59),
      O => graycnt(58)
    );
\graycnt[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(5),
      I1 => Timecounter(6),
      O => graycnt(5)
    );
\graycnt[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(6),
      I1 => Timecounter(7),
      O => graycnt(6)
    );
\graycnt[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(7),
      I1 => Timecounter(8),
      O => graycnt(7)
    );
\graycnt[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(8),
      I1 => Timecounter(9),
      O => graycnt(8)
    );
\graycnt[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Timecounter(9),
      I1 => Timecounter(10),
      O => graycnt(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_sstin_signal_0_0_counter is
  port (
    Timecounter : out STD_LOGIC_VECTOR ( 63 downto 0 );
    SSTIN : out STD_LOGIC;
    clk1 : in STD_LOGIC;
    nrst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_sstin_signal_0_0_counter : entity is "counter";
end base_zynq_sstin_signal_0_0_counter;

architecture STRUCTURE of base_zynq_sstin_signal_0_0_counter is
  signal \^timecounter\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[63]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[27]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[31]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[35]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[39]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[43]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[47]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[51]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[55]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[59]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[63]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[63]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[63]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[63]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[63]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[63]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[63]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_cnt_reg[63]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \cnt_reg[11]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[15]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[19]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[23]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[27]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[31]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[35]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[39]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[3]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[43]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[47]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[51]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[55]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[59]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[63]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_reg[7]_i_1\ : label is 11;
begin
  Timecounter(63 downto 0) <= \^timecounter\(63 downto 0);
SSTIN_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^timecounter\(2),
      O => SSTIN
    );
\cnt[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^timecounter\(0),
      O => \cnt[3]_i_2_n_0\
    );
\cnt[63]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => nrst,
      O => \cnt[63]_i_2_n_0\
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[3]_i_1_n_7\,
      Q => \^timecounter\(0)
    );
\cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[11]_i_1_n_5\,
      Q => \^timecounter\(10)
    );
\cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[11]_i_1_n_4\,
      Q => \^timecounter\(11)
    );
\cnt_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[7]_i_1_n_0\,
      CO(3) => \cnt_reg[11]_i_1_n_0\,
      CO(2) => \cnt_reg[11]_i_1_n_1\,
      CO(1) => \cnt_reg[11]_i_1_n_2\,
      CO(0) => \cnt_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[11]_i_1_n_4\,
      O(2) => \cnt_reg[11]_i_1_n_5\,
      O(1) => \cnt_reg[11]_i_1_n_6\,
      O(0) => \cnt_reg[11]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(11 downto 8)
    );
\cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[15]_i_1_n_7\,
      Q => \^timecounter\(12)
    );
\cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[15]_i_1_n_6\,
      Q => \^timecounter\(13)
    );
\cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[15]_i_1_n_5\,
      Q => \^timecounter\(14)
    );
\cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[15]_i_1_n_4\,
      Q => \^timecounter\(15)
    );
\cnt_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[11]_i_1_n_0\,
      CO(3) => \cnt_reg[15]_i_1_n_0\,
      CO(2) => \cnt_reg[15]_i_1_n_1\,
      CO(1) => \cnt_reg[15]_i_1_n_2\,
      CO(0) => \cnt_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[15]_i_1_n_4\,
      O(2) => \cnt_reg[15]_i_1_n_5\,
      O(1) => \cnt_reg[15]_i_1_n_6\,
      O(0) => \cnt_reg[15]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(15 downto 12)
    );
\cnt_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[19]_i_1_n_7\,
      Q => \^timecounter\(16)
    );
\cnt_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[19]_i_1_n_6\,
      Q => \^timecounter\(17)
    );
\cnt_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[19]_i_1_n_5\,
      Q => \^timecounter\(18)
    );
\cnt_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[19]_i_1_n_4\,
      Q => \^timecounter\(19)
    );
\cnt_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[15]_i_1_n_0\,
      CO(3) => \cnt_reg[19]_i_1_n_0\,
      CO(2) => \cnt_reg[19]_i_1_n_1\,
      CO(1) => \cnt_reg[19]_i_1_n_2\,
      CO(0) => \cnt_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[19]_i_1_n_4\,
      O(2) => \cnt_reg[19]_i_1_n_5\,
      O(1) => \cnt_reg[19]_i_1_n_6\,
      O(0) => \cnt_reg[19]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(19 downto 16)
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[3]_i_1_n_6\,
      Q => \^timecounter\(1)
    );
\cnt_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[23]_i_1_n_7\,
      Q => \^timecounter\(20)
    );
\cnt_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[23]_i_1_n_6\,
      Q => \^timecounter\(21)
    );
\cnt_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[23]_i_1_n_5\,
      Q => \^timecounter\(22)
    );
\cnt_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[23]_i_1_n_4\,
      Q => \^timecounter\(23)
    );
\cnt_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[19]_i_1_n_0\,
      CO(3) => \cnt_reg[23]_i_1_n_0\,
      CO(2) => \cnt_reg[23]_i_1_n_1\,
      CO(1) => \cnt_reg[23]_i_1_n_2\,
      CO(0) => \cnt_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[23]_i_1_n_4\,
      O(2) => \cnt_reg[23]_i_1_n_5\,
      O(1) => \cnt_reg[23]_i_1_n_6\,
      O(0) => \cnt_reg[23]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(23 downto 20)
    );
\cnt_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[27]_i_1_n_7\,
      Q => \^timecounter\(24)
    );
\cnt_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[27]_i_1_n_6\,
      Q => \^timecounter\(25)
    );
\cnt_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[27]_i_1_n_5\,
      Q => \^timecounter\(26)
    );
\cnt_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[27]_i_1_n_4\,
      Q => \^timecounter\(27)
    );
\cnt_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[23]_i_1_n_0\,
      CO(3) => \cnt_reg[27]_i_1_n_0\,
      CO(2) => \cnt_reg[27]_i_1_n_1\,
      CO(1) => \cnt_reg[27]_i_1_n_2\,
      CO(0) => \cnt_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[27]_i_1_n_4\,
      O(2) => \cnt_reg[27]_i_1_n_5\,
      O(1) => \cnt_reg[27]_i_1_n_6\,
      O(0) => \cnt_reg[27]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(27 downto 24)
    );
\cnt_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[31]_i_1_n_7\,
      Q => \^timecounter\(28)
    );
\cnt_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[31]_i_1_n_6\,
      Q => \^timecounter\(29)
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[3]_i_1_n_5\,
      Q => \^timecounter\(2)
    );
\cnt_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[31]_i_1_n_5\,
      Q => \^timecounter\(30)
    );
\cnt_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[31]_i_1_n_4\,
      Q => \^timecounter\(31)
    );
\cnt_reg[31]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[27]_i_1_n_0\,
      CO(3) => \cnt_reg[31]_i_1_n_0\,
      CO(2) => \cnt_reg[31]_i_1_n_1\,
      CO(1) => \cnt_reg[31]_i_1_n_2\,
      CO(0) => \cnt_reg[31]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[31]_i_1_n_4\,
      O(2) => \cnt_reg[31]_i_1_n_5\,
      O(1) => \cnt_reg[31]_i_1_n_6\,
      O(0) => \cnt_reg[31]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(31 downto 28)
    );
\cnt_reg[32]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[35]_i_1_n_7\,
      Q => \^timecounter\(32)
    );
\cnt_reg[33]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[35]_i_1_n_6\,
      Q => \^timecounter\(33)
    );
\cnt_reg[34]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[35]_i_1_n_5\,
      Q => \^timecounter\(34)
    );
\cnt_reg[35]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[35]_i_1_n_4\,
      Q => \^timecounter\(35)
    );
\cnt_reg[35]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[31]_i_1_n_0\,
      CO(3) => \cnt_reg[35]_i_1_n_0\,
      CO(2) => \cnt_reg[35]_i_1_n_1\,
      CO(1) => \cnt_reg[35]_i_1_n_2\,
      CO(0) => \cnt_reg[35]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[35]_i_1_n_4\,
      O(2) => \cnt_reg[35]_i_1_n_5\,
      O(1) => \cnt_reg[35]_i_1_n_6\,
      O(0) => \cnt_reg[35]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(35 downto 32)
    );
\cnt_reg[36]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[39]_i_1_n_7\,
      Q => \^timecounter\(36)
    );
\cnt_reg[37]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[39]_i_1_n_6\,
      Q => \^timecounter\(37)
    );
\cnt_reg[38]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[39]_i_1_n_5\,
      Q => \^timecounter\(38)
    );
\cnt_reg[39]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[39]_i_1_n_4\,
      Q => \^timecounter\(39)
    );
\cnt_reg[39]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[35]_i_1_n_0\,
      CO(3) => \cnt_reg[39]_i_1_n_0\,
      CO(2) => \cnt_reg[39]_i_1_n_1\,
      CO(1) => \cnt_reg[39]_i_1_n_2\,
      CO(0) => \cnt_reg[39]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[39]_i_1_n_4\,
      O(2) => \cnt_reg[39]_i_1_n_5\,
      O(1) => \cnt_reg[39]_i_1_n_6\,
      O(0) => \cnt_reg[39]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(39 downto 36)
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[3]_i_1_n_4\,
      Q => \^timecounter\(3)
    );
\cnt_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_reg[3]_i_1_n_0\,
      CO(2) => \cnt_reg[3]_i_1_n_1\,
      CO(1) => \cnt_reg[3]_i_1_n_2\,
      CO(0) => \cnt_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \cnt_reg[3]_i_1_n_4\,
      O(2) => \cnt_reg[3]_i_1_n_5\,
      O(1) => \cnt_reg[3]_i_1_n_6\,
      O(0) => \cnt_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^timecounter\(3 downto 1),
      S(0) => \cnt[3]_i_2_n_0\
    );
\cnt_reg[40]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[43]_i_1_n_7\,
      Q => \^timecounter\(40)
    );
\cnt_reg[41]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[43]_i_1_n_6\,
      Q => \^timecounter\(41)
    );
\cnt_reg[42]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[43]_i_1_n_5\,
      Q => \^timecounter\(42)
    );
\cnt_reg[43]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[43]_i_1_n_4\,
      Q => \^timecounter\(43)
    );
\cnt_reg[43]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[39]_i_1_n_0\,
      CO(3) => \cnt_reg[43]_i_1_n_0\,
      CO(2) => \cnt_reg[43]_i_1_n_1\,
      CO(1) => \cnt_reg[43]_i_1_n_2\,
      CO(0) => \cnt_reg[43]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[43]_i_1_n_4\,
      O(2) => \cnt_reg[43]_i_1_n_5\,
      O(1) => \cnt_reg[43]_i_1_n_6\,
      O(0) => \cnt_reg[43]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(43 downto 40)
    );
\cnt_reg[44]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[47]_i_1_n_7\,
      Q => \^timecounter\(44)
    );
\cnt_reg[45]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[47]_i_1_n_6\,
      Q => \^timecounter\(45)
    );
\cnt_reg[46]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[47]_i_1_n_5\,
      Q => \^timecounter\(46)
    );
\cnt_reg[47]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[47]_i_1_n_4\,
      Q => \^timecounter\(47)
    );
\cnt_reg[47]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[43]_i_1_n_0\,
      CO(3) => \cnt_reg[47]_i_1_n_0\,
      CO(2) => \cnt_reg[47]_i_1_n_1\,
      CO(1) => \cnt_reg[47]_i_1_n_2\,
      CO(0) => \cnt_reg[47]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[47]_i_1_n_4\,
      O(2) => \cnt_reg[47]_i_1_n_5\,
      O(1) => \cnt_reg[47]_i_1_n_6\,
      O(0) => \cnt_reg[47]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(47 downto 44)
    );
\cnt_reg[48]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[51]_i_1_n_7\,
      Q => \^timecounter\(48)
    );
\cnt_reg[49]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[51]_i_1_n_6\,
      Q => \^timecounter\(49)
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[7]_i_1_n_7\,
      Q => \^timecounter\(4)
    );
\cnt_reg[50]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[51]_i_1_n_5\,
      Q => \^timecounter\(50)
    );
\cnt_reg[51]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[51]_i_1_n_4\,
      Q => \^timecounter\(51)
    );
\cnt_reg[51]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[47]_i_1_n_0\,
      CO(3) => \cnt_reg[51]_i_1_n_0\,
      CO(2) => \cnt_reg[51]_i_1_n_1\,
      CO(1) => \cnt_reg[51]_i_1_n_2\,
      CO(0) => \cnt_reg[51]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[51]_i_1_n_4\,
      O(2) => \cnt_reg[51]_i_1_n_5\,
      O(1) => \cnt_reg[51]_i_1_n_6\,
      O(0) => \cnt_reg[51]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(51 downto 48)
    );
\cnt_reg[52]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[55]_i_1_n_7\,
      Q => \^timecounter\(52)
    );
\cnt_reg[53]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[55]_i_1_n_6\,
      Q => \^timecounter\(53)
    );
\cnt_reg[54]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[55]_i_1_n_5\,
      Q => \^timecounter\(54)
    );
\cnt_reg[55]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[55]_i_1_n_4\,
      Q => \^timecounter\(55)
    );
\cnt_reg[55]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[51]_i_1_n_0\,
      CO(3) => \cnt_reg[55]_i_1_n_0\,
      CO(2) => \cnt_reg[55]_i_1_n_1\,
      CO(1) => \cnt_reg[55]_i_1_n_2\,
      CO(0) => \cnt_reg[55]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[55]_i_1_n_4\,
      O(2) => \cnt_reg[55]_i_1_n_5\,
      O(1) => \cnt_reg[55]_i_1_n_6\,
      O(0) => \cnt_reg[55]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(55 downto 52)
    );
\cnt_reg[56]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[59]_i_1_n_7\,
      Q => \^timecounter\(56)
    );
\cnt_reg[57]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[59]_i_1_n_6\,
      Q => \^timecounter\(57)
    );
\cnt_reg[58]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[59]_i_1_n_5\,
      Q => \^timecounter\(58)
    );
\cnt_reg[59]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[59]_i_1_n_4\,
      Q => \^timecounter\(59)
    );
\cnt_reg[59]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[55]_i_1_n_0\,
      CO(3) => \cnt_reg[59]_i_1_n_0\,
      CO(2) => \cnt_reg[59]_i_1_n_1\,
      CO(1) => \cnt_reg[59]_i_1_n_2\,
      CO(0) => \cnt_reg[59]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[59]_i_1_n_4\,
      O(2) => \cnt_reg[59]_i_1_n_5\,
      O(1) => \cnt_reg[59]_i_1_n_6\,
      O(0) => \cnt_reg[59]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(59 downto 56)
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[7]_i_1_n_6\,
      Q => \^timecounter\(5)
    );
\cnt_reg[60]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[63]_i_1_n_7\,
      Q => \^timecounter\(60)
    );
\cnt_reg[61]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[63]_i_1_n_6\,
      Q => \^timecounter\(61)
    );
\cnt_reg[62]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[63]_i_1_n_5\,
      Q => \^timecounter\(62)
    );
\cnt_reg[63]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[63]_i_1_n_4\,
      Q => \^timecounter\(63)
    );
\cnt_reg[63]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[59]_i_1_n_0\,
      CO(3) => \NLW_cnt_reg[63]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \cnt_reg[63]_i_1_n_1\,
      CO(1) => \cnt_reg[63]_i_1_n_2\,
      CO(0) => \cnt_reg[63]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[63]_i_1_n_4\,
      O(2) => \cnt_reg[63]_i_1_n_5\,
      O(1) => \cnt_reg[63]_i_1_n_6\,
      O(0) => \cnt_reg[63]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(63 downto 60)
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[7]_i_1_n_5\,
      Q => \^timecounter\(6)
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[7]_i_1_n_4\,
      Q => \^timecounter\(7)
    );
\cnt_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[3]_i_1_n_0\,
      CO(3) => \cnt_reg[7]_i_1_n_0\,
      CO(2) => \cnt_reg[7]_i_1_n_1\,
      CO(1) => \cnt_reg[7]_i_1_n_2\,
      CO(0) => \cnt_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[7]_i_1_n_4\,
      O(2) => \cnt_reg[7]_i_1_n_5\,
      O(1) => \cnt_reg[7]_i_1_n_6\,
      O(0) => \cnt_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^timecounter\(7 downto 4)
    );
\cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[11]_i_1_n_7\,
      Q => \^timecounter\(8)
    );
\cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk1,
      CE => '1',
      CLR => \cnt[63]_i_2_n_0\,
      D => \cnt_reg[11]_i_1_n_6\,
      Q => \^timecounter\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_sstin_signal_0_0_sstin_signal is
  port (
    graycnt : out STD_LOGIC_VECTOR ( 59 downto 0 );
    Timecounter : out STD_LOGIC_VECTOR ( 62 downto 0 );
    WL_CLK_P : out STD_LOGIC;
    WL_CLK_N : out STD_LOGIC;
    SSTIN : out STD_LOGIC;
    clk1 : in STD_LOGIC;
    nrst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of base_zynq_sstin_signal_0_0_sstin_signal : entity is "sstin_signal";
end base_zynq_sstin_signal_0_0_sstin_signal;

architecture STRUCTURE of base_zynq_sstin_signal_0_0_sstin_signal is
  signal SSTIN_intl : STD_LOGIC;
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of SSTIN_intl : signal is std.standard.true;
  signal \^timecounter\ : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal \^graycnt\ : STD_LOGIC_VECTOR ( 59 downto 0 );
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of OBUFDF_WL_CLK : label is "DONT_CARE";
  attribute box_type : string;
  attribute box_type of OBUFDF_WL_CLK : label is "PRIMITIVE";
begin
  Timecounter(62 downto 0) <= \^timecounter\(62 downto 0);
  graycnt(59 downto 0) <= \^graycnt\(59 downto 0);
GrayTime: entity work.base_zynq_sstin_signal_0_0_GRAY_ENCODER
     port map (
      Timecounter(59) => \^graycnt\(59),
      Timecounter(58 downto 0) => \^timecounter\(62 downto 4),
      graycnt(58 downto 0) => \^graycnt\(58 downto 0)
    );
OBUFDF_WL_CLK: unisim.vcomponents.OBUFDS
     port map (
      I => clk1,
      O => WL_CLK_P,
      OB => WL_CLK_N
    );
TimeCnt_inst: entity work.base_zynq_sstin_signal_0_0_counter
     port map (
      SSTIN => SSTIN,
      Timecounter(63) => \^graycnt\(59),
      Timecounter(62 downto 0) => \^timecounter\(62 downto 0),
      clk1 => clk1,
      nrst => nrst
    );
U0i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => SSTIN_intl
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_sstin_signal_0_0 is
  port (
    nrst : in STD_LOGIC;
    clk1 : in STD_LOGIC;
    Timecounter : out STD_LOGIC_VECTOR ( 63 downto 0 );
    graycnt : out STD_LOGIC_VECTOR ( 59 downto 0 );
    samplecnt : out STD_LOGIC_VECTOR ( 2 downto 0 );
    WL_CLK_P : out STD_LOGIC;
    WL_CLK_N : out STD_LOGIC;
    SSTIN : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of base_zynq_sstin_signal_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of base_zynq_sstin_signal_0_0 : entity is "base_zynq_sstin_signal_0_0,sstin_signal,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of base_zynq_sstin_signal_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of base_zynq_sstin_signal_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of base_zynq_sstin_signal_0_0 : entity is "sstin_signal,Vivado 2020.1";
end base_zynq_sstin_signal_0_0;

architecture STRUCTURE of base_zynq_sstin_signal_0_0 is
  signal \^timecounter\ : STD_LOGIC_VECTOR ( 63 downto 3 );
  signal \^graycnt\ : STD_LOGIC_VECTOR ( 58 downto 0 );
  signal \^samplecnt\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of WL_CLK_N : signal is "xilinx.com:signal:clock:1.0 WL_CLK_N CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of WL_CLK_N : signal is "XIL_INTERFACENAME WL_CLK_N, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_sstin_signal_0_0_WL_CLK_N, INSERT_VIP 0";
  attribute x_interface_info of WL_CLK_P : signal is "xilinx.com:signal:clock:1.0 WL_CLK_P CLK";
  attribute x_interface_parameter of WL_CLK_P : signal is "XIL_INTERFACENAME WL_CLK_P, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_sstin_signal_0_0_WL_CLK_P, INSERT_VIP 0";
begin
  Timecounter(63 downto 3) <= \^timecounter\(63 downto 3);
  Timecounter(2 downto 0) <= \^samplecnt\(2 downto 0);
  graycnt(59) <= \^timecounter\(63);
  graycnt(58 downto 0) <= \^graycnt\(58 downto 0);
  samplecnt(2 downto 0) <= \^samplecnt\(2 downto 0);
U0: entity work.base_zynq_sstin_signal_0_0_sstin_signal
     port map (
      SSTIN => SSTIN,
      Timecounter(62 downto 3) => \^timecounter\(62 downto 3),
      Timecounter(2 downto 0) => \^samplecnt\(2 downto 0),
      WL_CLK_N => WL_CLK_N,
      WL_CLK_P => WL_CLK_P,
      clk1 => clk1,
      graycnt(59) => \^timecounter\(63),
      graycnt(58 downto 0) => \^graycnt\(58 downto 0),
      nrst => nrst
    );
end STRUCTURE;
