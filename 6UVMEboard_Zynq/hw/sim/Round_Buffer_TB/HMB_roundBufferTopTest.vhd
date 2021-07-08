----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2021 10:48:28 AM
-- Design Name: 
-- Module Name: HMB_roundBufferTopTest - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HMB_roundBufferTopTest is

    port (
    
  clk :            in  std_logic;
  RST :             in  std_logic;  
  trigger :         in std_logic;
  full_fifo :        in std_logic;          
  mode:             in std_logic;
  enable_write :    out std_logic;
  TriggerInfo :    out std_logic_vector(11 downto 0);
  RD_add:           out std_logic_vector(8 downto 0);
  WR_RS:            out std_logic_vector(1 downto 0);
  WR_CS:            out std_logic_vector(5 downto 0);
  delay_trigger:    in std_logic_vector(3 downto 0);
  sstin_updateBit:   in std_logic_vector(2 downto 0) -- To control the cycle number where the address are updated


   
);

end HMB_roundBufferTopTest;

architecture structure of HMB_roundBufferTopTest is

component HMB_roundBuffer

port (
	  
	  clk :            in  std_logic;
	  RST :             in  std_logic;  
	  trigger :         in std_logic;
	  full_fifo :        in std_logic;          
	  mode:             in std_logic;
	  enable_write :    out std_logic;
	  TriggerInfo :    out std_logic_vector(11 downto 0);
	  RD_add:           out std_logic_vector(8 downto 0);
	  WR_RS:            out std_logic_vector(1 downto 0);
	  WR_CS:            out std_logic_vector(5 downto 0);
	  delay_trigger:    in std_logic_vector(3 downto 0);
	  sstin_updateBit:   in std_logic_vector(2 downto 0); -- To control the cycle number where the address are updated
	  sstin_cntr:            in std_logic_vector(2 downto 0)
	
   
);

end component HMB_roundBuffer;


component counter
generic(
        NBITS: integer := 3
        );
port (
        CLK:    in std_logic;
        RST:    in std_logic;
        Q:      out std_logic_vector (NBITS-1 downto 0)
        );
    
end component;

signal sstin_cntr_intl: std_logic_vector(2 downto 0);
signal rst_intl: std_logic;
signal clk_intl: std_logic;


begin


sstinCnt: counter
generic map(NBITS=> 3)
 port map (
        CLK =>  clk_intl,
        RST =>  rst_intl,
        Q   =>  sstin_cntr_intl
        
        );
        
        
 clk_intl  <=  CLK;
 rst_intl  <=  RST;      
  
 HMB_RoundBuff: HMB_roundBuffer
 
 port map(

  clk            => 	 clk, 
  RST            => 	 RST, 
  trigger        => 	 trigger, 
  full_fifo      => 	 full_fifo, 
  mode           => 	 mode, 
  enable_write   => 	 enable_write, 
  TriggerInfo    => 	 TriggerInfo , 
  RD_add         => 	 RD_add, 
  WR_RS          => 	 WR_RS, 
  WR_CS          => 	 WR_CS, 
  delay_trigger  => 	 delay_trigger, 
  sstin_updateBit=> 	 sstin_updateBit, 
  sstin_cntr     => 	 sstin_cntr_intl
	
  );







end structure;
