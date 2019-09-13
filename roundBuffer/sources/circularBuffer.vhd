----------------------------------------------------------------------------------
-- Company: IDLAB, Hawaii
-- Engineer: Salvador Ventura
-- 
-- Create Date: 09/11/2019
-- Design Name: 
-- Module Name: circularBuffer - 
-- Project Name: WATCHMAN
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
library ieee;
use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 
entity circular_buffer is

  port (
          clk : in  std_logic;
          RST : in  std_logic;  -- next address = 0
          trigger : in std_logic;
          full_fifo : in std_logic;
          
          ptr_sub : out std_logic_vector(8 downto 0);
          ptr_int : out std_logic
   
   --       WR_RS: out std_logic_vector(6 downto 0);
   --       WR_CS: out std_logic_vector(2 downto 0);
    --      RD_add : out std_logic_vector(8 downto 0)
  );
end circular_buffer;
 
architecture rtl of circular_buffer is
 
  signal ptr_sub_i : std_logic_vector(8 downto 0);
  signal ptr_int_i : std_logic;
  
 type stmachine is (start, wr_add, hit);

  signal stm: stmachine;
  
  begin
  
  p_sm:  process(clk)
  begin 
 if RST = '0' then
      stm <= start;
      ptr_sub_i  <= (others=> '0');
      ptr_int_i <= '0';
 --     ptr_ <= (others=> '0');           
  else 
      if rising_edge(clk) then
      case stm is
      when start =>
          stm <= wr_add;
      
      when wr_add =>
          ptr_int_i <= '1';
          stm <= hit;

      when hit =>
          if trigger = '1' then
              if full_fifo = '1' then 
                 stm <= hit;
              else
                  ptr_sub_i <= std_logic_vector(unsigned(ptr_sub_i) + 1);
                  ptr_int_i <= '0';
                  stm <= wr_add;            
                  
              end if;
          else
               ptr_int_i <= '0';
               stm <= wr_add;

             
          end if;

            
            end case;
   end if;
      
end if;

ptr_sub <= ptr_sub_i;
ptr_int <= ptr_int_i;

 end process p_sm;
 
 
end architecture;