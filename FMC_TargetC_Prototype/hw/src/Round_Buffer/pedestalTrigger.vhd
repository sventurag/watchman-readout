----------------------------------------------------------------------------------
-- Company: IDLAB	
-- Engineer: Salvador Ventura
-- 
-- Create Date: 05/20/2020 10:02:21 PM
-- Design Name:  
-- Module Name: pedestalTrigger - Behavioral
-- Project Name: WATCHMAN
-- Target Devices: MicroZed board
-- Tool Versions: 
-- Description:  Trigger signal to get pedestal arrays
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
 use ieee.numeric_std.all;

entity pedestalTrigger is
    Port ( 
    		clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           trigger : out STD_LOGIC;
           windowstorage : in STD_LOGIC;
           pedestals: in std_logic;
           average :  in std_logic_vector(31 downto 0);
           wr_rs:  in std_logic_vector(1 downto 0); -- To synchronize WR and start at window 0
           sstin : in std_logic_vector(2 downto 0)
           );
end pedestalTrigger;

architecture Behavioral of pedestalTrigger is
type stm_trigger_type is(
   IDLE,
   START,
   CNT_START,
   TRIGGER_HIGH_0,
   TRIGGER_LOW_0,
   DECISION_0,
   WAIT_0,
   COUNTING_LOOPS,
   TRIGGER_HIGH_1,
   TRIGGER_LOW_1,
   DECISION_1
--   CNT_INTRA_BUFFER,
--   CNT_INTER_BUFFER
   
);

signal stm_trigger : stm_trigger_type := IDLE;
signal cnt_start_i: std_logic_vector(8 downto 0);
signal cnt_intraBuffer_i: std_logic_vector(8 downto 0);
signal cnt_interBuffer_i: std_logic_vector(8 downto 0);
signal cnt_intratrigger : std_logic_vector(12 downto 0);
signal cnt_intratrigger_1 : std_logic_vector(12 downto 0);

signal cnt_i : std_logic_vector(6 downto 0);


signal cnt_wait0_i: std_logic_vector(3 downto 0);
signal cnt_countingLoops_i: std_logic_vector(3 downto 0);
signal trigger_i  : std_logic;
signal reg1: std_logic;
signal reg2: std_logic;
signal edge_det_i : std_logic;
signal cnt_average: std_logic_vector(8 downto 0);

begin

p_edge_detector :  process(clk)
begin
        if rising_edge (clk) then
            reg1 <= pedestals;
            reg2 <= reg1;
        end if;
   
   
end process p_edge_detector;

edge_det_i <= reg1  and not (reg2);

p_sm:  process(clk,rst, windowStorage,sstin,pedestals)
  begin 
  
 if (rst = '0') or (windowStorage='0') then
      stm_trigger <= IDLE;
      cnt_start_i <= (others=> '0');
      cnt_i <= (others=> '0');
      cnt_intratrigger<= (others=> '0');
      cnt_intratrigger_1<= (others=> '0');
      cnt_wait0_i <= (others=> '0');
      cnt_countingLoops_i <= (others=> '0');
      trigger_i<='0';
      cnt_average<= (others =>'0');
  else 
      if rising_edge(clk) then
          case stm_trigger is
              when IDLE =>
                   --if (windowStorage = '1') and (Timestamp.samplecnt="111") then
                   if ( edge_det_i= '1')   then 
                       cnt_average<= (others =>'0');                 
                       stm_trigger <= START;
                   else
                       stm_trigger<= IDLE;
                   end if;
               
               when START =>
                if cnt_average <=average then
                    if (windowStorage = '1') and (sstin="111")  and (wr_rs="00")  then                  
                              stm_trigger <= CNT_START;
                       else
                              stm_trigger<= START;
                         end if;
                 else
                        cnt_start_i <= (others=> '0');
                         stm_trigger<= IDLE;
                  end if;       
        
                     
              when CNT_START =>
                	   if cnt_start_i <  "000000011" then
                   		   	cnt_start_i <= std_logic_vector(unsigned(cnt_start_i) + 1);
           	  	     	   stm_trigger <= CNT_START;           
                 	  else 
                   		   cnt_start_i <= "000000000";
                   		   stm_trigger <= TRIGGER_HIGH_0;
          			 end if;
              when TRIGGER_HIGH_0 =>           
                      trigger_i <= '1';
                      stm_trigger<= TRIGGER_LOW_0;
                      
              when TRIGGER_LOW_0 =>
					   trigger_i <= '0';
					   if cnt_intratrigger <= "1001101111100" then --4988 
						  cnt_intratrigger <= std_logic_vector(unsigned(cnt_intratrigger) + 1);
						  stm_trigger <= TRIGGER_LOW_0;
					   else
						   cnt_intratrigger <= (others=> '0');
						  stm_trigger <= DECISION_0;
					   end if;
               
             when DECISION_0 =>
					   if cnt_i < "1111111" then -- 127
						  cnt_i <= std_logic_vector(unsigned(cnt_i) + 1);
						  stm_trigger <= TRIGGER_HIGH_0;
					   else 
						  cnt_i<= (others=> '0');
						  stm_trigger <= WAIT_0;
					   end if;
                  
              when WAIT_0 =>
					   if cnt_wait0_i <= "0001" then
						  cnt_wait0_i <= std_logic_vector(unsigned(cnt_wait0_i) + 1);
						  stm_trigger<= WAIT_0;   
					   else                    
						  stm_trigger <= COUNTING_LOOPS;
						  cnt_wait0_i<= (others=>'0') ; 
					   end if;
              
              when COUNTING_LOOPS =>
					   if cnt_countingLoops_i <  "0010" then
							   cnt_countingLoops_i  <= std_logic_vector(unsigned(cnt_countingLoops_i) + 1);
							  stm_trigger <= TRIGGER_HIGH_0;
					   else
						   		cnt_countingLoops_i <=(others=>'0');
						   		stm_trigger <= TRIGGER_HIGH_1;
						        cnt_wait0_i<= (others=>'0') ; 

					   end if;
              when TRIGGER_HIGH_1 =>           
                  trigger_i <= '1';
                  stm_trigger<= TRIGGER_LOW_1;
        
              when TRIGGER_LOW_1 =>
               trigger_i <= '0';
               if cnt_intratrigger_1<= "1001110010100" then  -- 5012
                  cnt_intratrigger_1 <= std_logic_vector(unsigned(cnt_intratrigger_1) + 1);
                  stm_trigger <= TRIGGER_LOW_1;
               else 
                  cnt_intratrigger_1 <= (others=>'0');
                  stm_trigger <= DECISION_1;
               end if;
               
               when DECISION_1 =>
               trigger_i<= '0';
              if cnt_i < "1111111" then -- 127
               cnt_i <= std_logic_vector(unsigned(cnt_i) + 1);
                      stm_trigger <= TRIGGER_HIGH_1;
              else
                   cnt_i <= (others=>'0'); 
                   cnt_average <= std_logic_vector(unsigned(cnt_average) + 1);                     
                       stm_trigger <= START;
                       
                       
               end if;
         end case;     
              
     end if;
end if;
          
end process;
         
trigger<= trigger_i;

end Behavioral;
