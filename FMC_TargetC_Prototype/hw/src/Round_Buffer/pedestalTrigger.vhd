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
 --  DECISION_0,
   WAIT_0,
   RUN_NUMBER
--   COUNTING_LOOPS,
--   TRIGGER_HIGH_1,
--   TRIGGER_LOW_1,
--   DECISION_1
--   CNT_INTRA_BUFFER,
--   CNT_INTER_BUFFER
   
);

signal stm_trigger : stm_trigger_type := IDLE;
signal cnt_start_i: std_logic_vector(8 downto 0);
signal cnt_intraBuffer_i: std_logic_vector(8 downto 0);
signal cnt_interBuffer_i: std_logic_vector(8 downto 0);
signal cnt_intratrigger : std_logic_vector(13 downto 0);

signal cnt_i : std_logic_vector(8 downto 0);


signal cnt_wait0_i: std_logic_vector(3 downto 0);
signal cnt_countingLoops_i: std_logic_vector(3 downto 0);
signal trigger_i  : std_logic;
signal reg1: std_logic;
signal reg2: std_logic;
signal edge_det_i : std_logic;
signal cnt_average: std_logic_vector(31 downto 0);
signal cnt_run: std_logic_vector(1 downto 0);
signal  wait_number_i: std_logic_vector(3 downto 0);
signal cnt_between_runs_i:  std_logic_vector(26 downto 0);
begin

p_edge_detector :  process(clk)
begin
        if rising_edge (clk) then
            reg1 <= pedestals;
            reg2 <= reg1;
        end if;
   
   
end process p_edge_detector;

edge_det_i <= reg1  and not (reg2);

p_sm:  process(clk,rst, windowStorage,sstin,pedestals, cnt_run)
  begin 
  
 if (rst = '0') or (windowStorage='0') then
      stm_trigger <= IDLE;
      cnt_start_i <= (others=> '0');
      cnt_i <= (others=> '0');
      cnt_intratrigger<= "10011011111010";
      cnt_wait0_i <= (others=> '0');
      cnt_countingLoops_i <= (others=> '0');
            cnt_run <= (others=> '0');
            wait_number_i <=  (others=> '0');
    cnt_between_runs_i<= (others=> '0');
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
               if cnt_between_runs_i < x"3FFFFF" then
                     cnt_between_runs_i <= std_logic_vector(unsigned(cnt_between_runs_i) + 1);
                       stm_trigger<= START;
               else
                      
                        if cnt_average <=average then 
                            if (windowStorage = '1') and (sstin="111")  and (wr_rs="00")  then                  
                                      stm_trigger <= CNT_START;
                                       cnt_intratrigger<= "10011011111101";
                                          cnt_between_runs_i<= (others=> '0');
                               else
                                      stm_trigger<= START;
                                 end if;
                         else
                                cnt_start_i <= (others=> '0');
                                 stm_trigger<= IDLE;
                          end if;       
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
	                   if (cnt_intratrigger > "00000000000000" ) then
						  cnt_intratrigger <= std_logic_vector(unsigned(cnt_intratrigger) -1 );
						  stm_trigger <= TRIGGER_LOW_0;
					   else
						  stm_trigger <= RUN_NUMBER;
					   end if;

      when WAIT_0 =>
                        if cnt_wait0_i <= wait_number_i  then
                           cnt_wait0_i <= std_logic_vector(unsigned(cnt_wait0_i) + 1);
                           stm_trigger<= WAIT_0;   
                        else                    
                           stm_trigger <= RUN_NUMBER;
                           cnt_wait0_i<= (others=>'0') ; 
                        end if;
 
         when RUN_NUMBER =>
                        case cnt_run is
                        when "00" =>
                                    if (cnt_i < "001111111") then 
                                       cnt_i <= std_logic_vector(unsigned(cnt_i) + 1);
                                       cnt_intratrigger <= "10011011111101";
                                       stm_trigger <= TRIGGER_HIGH_0;
                                   else
                                         cnt_run <=  std_logic_vector(unsigned(cnt_run) + 1);
                                       stm_trigger <= WAIT_0;
                                       cnt_intratrigger <= "10011011111101";
                                       wait_number_i<="0001";
                                   end if;					  
			           when "01" =>         
                                  if  (cnt_i  < "011111111" ) then
                                   cnt_i <= std_logic_vector(unsigned(cnt_i) + 1);
                                      cnt_intratrigger <= "10011011111101";
                                      stm_trigger <= TRIGGER_HIGH_0;
                                  else
                                     stm_trigger <= WAIT_0;
                                     cnt_run <=  std_logic_vector(unsigned(cnt_run) + 1);
                                     cnt_intratrigger <= "10011011110101";
                                     wait_number_i<="0001";

                                   end if;
                      
                      when "10" =>         
 					  if   (cnt_i  < "101111111" ) then
 					       cnt_i <= std_logic_vector(unsigned(cnt_i) + 1);
                           cnt_intratrigger <= "10011011110101";
                           stm_trigger <= TRIGGER_HIGH_0;
                       else
                          stm_trigger <= WAIT_0;
                           cnt_run <=  std_logic_vector(unsigned(cnt_run) + 1);
                           cnt_intratrigger <= "10011011110101";
                             wait_number_i<="0001";

                        end if;                      
                     
                     when "11" =>         
                       if   (cnt_i  <"111111111" ) then
                            cnt_i <= std_logic_vector(unsigned(cnt_i) + 1);
                             cnt_intratrigger <= "10011011110101";
                             stm_trigger <= TRIGGER_HIGH_0;
                         else
                           cnt_i<= (others=>'0') ; 
                            stm_trigger <= START;
                              cnt_average<=  std_logic_vector(unsigned(cnt_average) + 1);
                           cnt_run <=  std_logic_vector(unsigned(cnt_run) + 1);

                          end if;          
                  when others=> null;
                  end case;

         end case;     
              
     end if;
end if;
          
end process;



trigger<= trigger_i;

end Behavioral;
