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

-- Description: This module controls the writting process in TargetC in function of 
-- a trigger. The main part is done by a state machine with two types of states:
-- hit and wr_add. All the states monitor the trigger signal but the wr_add also
-- contains the logic for moving to the next address. The addresses corresponds to 
-- the number of windows considering 2-windows subbuffers.
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
     --     ptr_sub_sstin : out std_logic_vector(8 downto 0);

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
signal flag : boolean;
signal flag1 : boolean;
signal flag2 : boolean;
signal flag3 : boolean;
signal flag4 : boolean;
signal flag5 : boolean;
signal flag6 : boolean;
signal flag7 : boolean;
signal flag8 : boolean;
signal flag9 : boolean;
signal flag10 : boolean;
signal flag11 : boolean;
signal flag12 : boolean;
signal flag13 : boolean;
signal flag14 : boolean;
signal flag15 : boolean;


signal flag_full: std_logic;
signal window2read: std_logic_vector(8 downto 0);



 type stmachine is ( wr_add ,hit, hit2, hit3, hit4, hit5, hit6,hit7,hit8, hit9, hit10, hit11, hit12, hit13,hit14, hit15);
 


  signal stm: stmachine;
  
  begin
  
  p_sm:  process(clk,RST, trigger, full_fifo)
  begin 
 if RST = '0' then
      stm <= hit;
      ptr_sub_i  <= (others=> '0');
      ptr_int_i <= 'X';
      flag_full <= '0';
      window2read <= (others=> 'X');
      
 --     ptr_ <= (others=> '0');           
  else 
      if rising_edge(clk) then
      case stm is
--      when start =>
--          stm <= hit;
      
    
      when hit =>      

          if trigger = '1' then
             flag1 <= true;
             window2read <= std_logic_vector(unsigned(ptr_sub_i) + 0) ;

          else
             flag1 <= false;
             window2read <= (others=>'X') ;         
          end if;
          
          stm <= hit2;

     when hit2 =>      
           if trigger = '1' then
              flag2 <= true;
              window2read <= std_logic_vector(unsigned(ptr_sub_i) + 0) ;

           else
              flag2 <= false;          
                window2read <= (others=>'X') ;         
          end if;
           stm <= hit3;
         
      when hit3 =>      
            if trigger = '1' then
               flag3 <= true;
               window2read <= std_logic_vector(unsigned(ptr_sub_i) + 0) ;

            else
               flag3 <= false;          
                window2read <= (others=>'X') ;         
           end if;
        stm <= hit4;
            
           
       when hit4 =>      
             if trigger = '1' then
                flag4 <= true;
                window2read <= std_logic_vector(unsigned(ptr_sub_i) + 0) ;

             else
                flag4 <= false;          
                window2read <= (others=>'X') ;         
            end if;
           stm <= hit5;
                     
       
        when hit5 =>      
              if trigger = '1' then
                 flag5 <= true;
                 window2read <= std_logic_vector(unsigned(ptr_sub_i) + 1) ;
              else
                 flag5 <= false;          
                window2read <= (others=>'X') ;         
             end if;
           stm <= hit6;
        
        when hit6 =>      
           if trigger = '1' then
              flag6 <= true;
              window2read <= std_logic_vector(unsigned(ptr_sub_i) + 1) ;
           else
              flag6 <= false;          
                window2read <= (others=>'X') ;         
           end if;
             stm <= hit7;

   
        when hit7 =>      
           if trigger = '1' then
              flag7 <= true;
              window2read <= std_logic_vector(unsigned(ptr_sub_i) + 1) ;
          else
              flag7 <= false;          
                window2read <= (others=>'X') ;         
           end if;
             stm <= hit8;
       
   when hit8 =>      
  
            if trigger = '1' then
               flag8 <= true;
              window2read <= std_logic_vector(unsigned(ptr_sub_i) + 1) ;
           else
               flag8 <= false;
                window2read <= (others=>'X') ;         
            end if;
            stm <= hit9;
  
       when hit9 =>      
             if trigger = '1' then
                flag9<= true;
              window2read <= std_logic_vector(unsigned(ptr_sub_i) + 2) ;
            else
                flag9<= false;          
                window2read <= (others=>'X') ;         
            end if;
             stm <= hit10;
           
        when hit10 =>      
              if trigger = '1' then
                 flag10 <= true;
             window2read <= std_logic_vector(unsigned(ptr_sub_i) + 2) ;
              else
                 flag10 <= false;          
                window2read <= (others=>'X') ;         
             end if;
          stm <= hit11;
              
             
         when hit11 =>      
               if trigger = '1' then
                  flag11 <= true;
                  window2read <= std_logic_vector(unsigned(ptr_sub_i) + 2) ;
               else
                  flag11<= false;          
                window2read <= (others=>'X') ;         

              end if;
             stm <= hit12;
                       
         
          when hit12 =>      
                if trigger = '1' then
                   flag12 <= true;
                   window2read <= std_logic_vector(unsigned(ptr_sub_i) + 2) ;      
                   else
                   flag12 <= false; 
               window2read <= (others=>'X') ;         
         
               end if;
             stm <= hit13;
          
          when hit13 =>      
             if trigger = '1' then
                flag13 <= true;
             window2read <= std_logic_vector(unsigned(ptr_sub_i) + 3) ;
             else
                flag13 <= false;
                window2read <= (others=>'X') ;         
          
             end if;
               stm <= hit14;
  
     
          when hit14 =>      
             if trigger = '1' then
                flag14 <= true;
             window2read <= std_logic_vector(unsigned(ptr_sub_i) + 3) ;
             else
                flag14 <= false; 
                window2read <= (others=>'X') ;         
             end if;
               stm <= hit15;             

     
          when hit15 =>      
             if trigger = '1' then
                flag15 <= true;
             window2read <= std_logic_vector(unsigned(ptr_sub_i) + 3) ;
             else
                flag15 <= false;          
             end if;
               stm <= wr_add;             
             
          when wr_add =>
          if trigger = '1' then
               window2read <= std_logic_vector(unsigned(ptr_sub_i) + 3) ;  
               if full_fifo = '0' then

                   ptr_sub_i <= std_logic_vector(unsigned(ptr_sub_i) + 4);
                   ptr_int_i <= sstin_i;
                   stm<= hit;
               else 

                   ptr_int_i <= 'X';
                   stm<= hit;

               end if;    
           
           
           else  
           
             if flag1 or flag2 or flag3 or flag4 or flag5 or flag6  or flag7 or flag8 or flag9 or flag10 or flag11 or flag12 or flag13  or flag14 or flag15 = true then
                 if full_fifo = '0' then

                     ptr_sub_i <= std_logic_vector(unsigned(ptr_sub_i) + 4);
                     ptr_int_i <= sstin_i;
                     stm<= hit;
                 else 
  
                     ptr_int_i <= 'X';
                     stm<= hit;
  
                 
                 end if;
             else 
                 ptr_int_i <= 'X';
                 stm<= hit;
  
             end if;    
             
           
           stm <= hit;

        end if;
        
        
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
        when "001" =>
            sstin_i <= '0';
        when "010" =>
            sstin_i <= '0';
        when "011" =>
            sstin_i <= '1';
        when "110" => 
           sstin_i <= '1';
        when "111"=> 
           sstin_i <= '0';   
        when others =>
            sstin_i <= '1';
        end case;
     
     end if;
    
 end if;
 

end process p_sstin;

sstin <= sstin_i;

 
 
end architecture;