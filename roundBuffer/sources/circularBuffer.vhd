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
          ptr_sub_sstin : out std_logic_vector(8 downto 0);

          ptr_int : out std_logic;
          sstin :  out std_logic;
          counter :  out std_logic_vector(2 downto 0)
   --       WR_RS: out std_logic_vector(6 downto 0);
   --       WR_CS: out std_logic_vector(2 downto 0);
    --      RD_add : out std_logic_vector(8 downto 0)
  );
end circular_buffer;
 
architecture rtl of circular_buffer is
 
  signal ptr_sub_i : std_logic_vector(8 downto 0);
  signal ptr_sub_sstin_i : std_logic_vector(8 downto 0);
  signal ptr_int_i : std_logic;
  signal counter_i: std_logic_vector(2 downto 0);
  signal counter2_i: std_logic_vector(2 downto 0);
 
 -- signal counter_copy_i: std_logic_vector(2 downto 0);

  signal sstin_i : std_logic;
 type stmachine is (start, wr_add ,hit, next_sub, next_int,latency);
 


  signal stm: stmachine;
  
  begin
  
  p_sm:  process(clk,RST, trigger, full_fifo)
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

                  stm <= next_sub;

            --      stm <= latency;            
                  
              end if;
          else
               stm <= next_int;

          end if;
          
        when next_sub =>
        ptr_sub_i <= std_logic_vector(unsigned(ptr_sub_i) + 1);
        ptr_int_i <= '0';
        stm <= wr_add;
        
        when next_int =>
             ptr_int_i <= '0';
             stm <= latency;
        when latency =>
              stm <= wr_add;

             
            end case;
   end if;
      
end if;


 end process p_sm;
ptr_sub <= ptr_sub_i;
ptr_int <= ptr_int_i;

-------------------

p_counter: process(clk, RST)
begin
if RST = '0' then
    counter_i <= (others=> '0');
 
else
    if rising_edge(clk) then
        if counter_i < "111" then
           counter_i <= std_logic_vector(unsigned(counter_i) + 1);
        else 
           counter_i <= "000";

        end if;
    end if;
 end if;

end process p_counter;

counter <= counter_i;
counter2_i <= counter_i;

----------------------------------

p_sstin: process(clk,RST)

begin
if RST = '0' then
    sstin_i <= '0';
else
    if rising_edge(clk) then
        case counter_i is 
        when "000" =>
            sstin_i <= '0';
            ptr_sub_sstin_i <= ptr_sub_i;
        when "001" =>
            sstin_i <= '0';
        when "010" =>
            sstin_i <= '0';
        when "011" =>
            sstin_i <= '0';        
        when others =>
            sstin_i <= '1';
        end case;
     
     end if;
    
 end if;
 

end process p_sstin;

sstin <= sstin_i;
ptr_sub_sstin <= ptr_sub_sstin_i;

 
 
end architecture;