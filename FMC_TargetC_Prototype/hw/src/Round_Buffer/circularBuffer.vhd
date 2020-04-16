---------------------------------------------------------------------------------
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
 use work.TARGETC_pkg.all; --not used in simulations

entity circularBuffer is

 
    port (
    
  clk :            in  std_logic;
  RST :             in  std_logic;  
  trigger :         in std_logic;
  full_fifo :        in std_logic;          
  windowStorage:             in std_logic;
  enable_write :    out std_logic;
--    enable_write_fifo :    out std_logic;

  RD_add:           out std_logic_vector(8 downto 0);
--  RD_add_fifo:   out std_logic_vector(8 downto 0);
  WR_RS:            out std_logic_vector(1 downto 0);
  WR_CS:            out std_logic_vector(5 downto 0);
  delay_trigger:    in std_logic_vector(3 downto 0);
  Timestamp:        in T_timestamp  -- not used in simulations
  -- Control Signal
 --  CtrlBus_IxSL:    in     T_CtrlBus_IxSL
   
);

end circularBuffer;
 
architecture structure of circularBuffer is
 

COMPONENT rb_output_windowNumber
  PORT (
    clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

signal ptr_window_i : std_logic_vector(8 downto 0);
signal counter_i: std_logic_vector(2 downto 0);
signal sstin_i : std_logic;
signal window2read: std_logic_vector(8 downto 0);
signal wr_i: unsigned(8 downto 0);
signal ptr_window_trans_i: std_logic_vector(8 downto 0);
signal fifo_wr_en : std_logic;
signal fifo_rd_en : std_logic;
signal fifo_full : std_logic;
signal fifo_empty: std_logic;
signal flag_number: std_logic_vector(3 downto 0);
signal fifo_in: std_logic_vector(14 downto 0);
signal fifo_out_i: std_logic_vector(14 downto 0);
signal fifo_out: std_logic_vector(14 downto 0);
type stmachine is (start, wr_add ,hit0,hit1, hit2, hit3, hit4, hit5, hit6,hit7,hit8, hit9, hit10, hit11, hit12, hit13,hit14);
signal stm_circularBuffer: stmachine;
signal saved_i: std_logic_vector(8 downto 0);
signal delay_window: std_logic_vector(8 downto 0);
signal  delay_flag : std_logic_vector(3 downto 0);
signal fifo_wr_en_delay: std_logic;
signal fifo_wr_en_delay2: std_logic;
signal current_subBuffer: std_logic_vector(14 downto 0) ;
signal first_round_of_subbuffer: std_logic;
signal jump_wr: std_logic_vector(6 downto 0) ;
signal ptr_window_inter: std_logic_vector(8 downto 0);
signal long_pulse_rst: std_logic;
type stmachine_comp is ( A, B, C, D);

type stmachine_2windows is (retrieve,enable_rd, delay, decide, one_window, two_windowsA, delay2,  two_windowsB, delay3,delay4);
signal stm_2windows : stmachine_2windows:= enable_rd;
signal enable_write_i: std_logic;
signal cnt_wr_en : std_logic_vector(3 downto 0);
signal cnt_long_pulse : std_logic_vector(3 downto 0);
signal long_pulse_sig: std_logic;
signal trigger_intl: std_logic;
signal rd_add_i:std_logic_vector(8 downto 0);
signal enable_write_cntr_intl: std_logic_vector(8 downto 0);
signal enable_write_intl: std_logic;
signal reg3: std_logic;
signal reg4: std_logic;
signal edge_det_write_enable_intl: std_logic;
signal twoWindows: std_logic; -- signal for debugging, =1 when there are two windows to digitize
signal starting_run : std_logic; -- this is to distinguish between the first run of the buffer, 
                                  -- so the first window after turning on the board is never 511 but zero after 
                                  -- correcting for the electronics delay

signal jump_ptr_correction: std_logic;
signal jump_flag:std_logic;
signal intra_buffer_flag_w0:  std_logic;
signal first_round_of_subbuffer_delay: std_logic;
attribute mark_debug : string;
type longPulse_type is(
   IDLE,
   LONGPULSE
);

signal longpulse_stm : longpulse_type := IDLE;
attribute mark_debug of window2read: signal is "true";
attribute mark_debug of trigger: signal is "true";
attribute mark_debug of WR_CS: signal is "true";
attribute mark_debug of WR_RS: signal is "true";
attribute mark_debug of wr_i: signal is "true";
attribute mark_debug of ptr_window_i: signal is "true";
attribute fsm_encoding : string;
attribute fsm_encoding of stm_circularBuffer   : signal is "sequential"; 
begin
  
  ----------------------------------
  -- State machine for handling the trigger and to generate the 
  -- wr/read addresses (signals WR_CS, WR_RS, RD_add and enable_write). 
  
  -- The ptr_window_i counter is running over the number of winwows 
  -- increasing +4 (for a 2-write-address subbuffer).
  
  -- Signal wr_i is ptr_window divided by two (one-bit shift)
  -- to get the real address WR_CS and WR_RS for the TARGETC. This operation
  -- is done in the first state, then, the wr_i is just increased by 1.

  
  -- Signal ptr_sub_i is the current subbuffer window. Uncomment lines were ptr_sub_i appeared
  -- to follow the signal 
  
  -- The first 15 states are for raising flags and to get wr from
  -- the pointer_window_i signal 
  
  
  -- window2read could be modified to get the right window according to the trigger delay
  ----------------------------------
 
 p_sm:  process(clk,RST, windowStorage,trigger_intl, full_fifo,Timestamp.samplecnt)
variable flag_number_v: std_logic_vector(3 downto 0);
variable current_subBuffer_v: std_logic_vector(14 downto 0) ;
  begin 
 if (RST = '0') or (windowStorage='0') then
      stm_circularBuffer <= start;
      ptr_window_i  <= (others=> '0');
      window2read <= (others=> '0');
      wr_i <= (others=> '0');
      fifo_wr_en <= '0';
      flag_number <= "0000";
      current_subBuffer<= (others=>'0');
      first_round_of_subbuffer <= '1';
      jump_wr<=(others=>'0');
      starting_run<='1';
      
         
   else 
       if rising_edge(clk) then
       case stm_circularBuffer is
       when start =>
            if (windowStorage = '1') and (Timestamp.samplecnt="011") then
          --  if (windowStorage = '1') and (counter_i="011") then
 
                stm_circularBuffer <= hit0;
            else
                stm_circularBuffer<= start;
            end if;
          
 ---------------------------------
 -- If a pulse is detected at this point, and taking in account the delay (~8 ns) the pulse ocurred and was sampled in the previous window
 ---------------------------------    
       when hit0 =>      
           if unsigned(ptr_window_i) /= 0 then
               wr_i <= shift_right(unsigned(ptr_window_i), 1 );  -- Dividing by 2, beacause every WR address in TARGETC corresponds to 2 windows.
           else 
               wr_i <= unsigned(ptr_window_i);
           end if;
           
             if trigger_intl = '1' then
                 flag_number<= "0000";
                 if unsigned(ptr_window_i) /= 0 then   
                     window2read <= std_logic_vector(unsigned(ptr_window_i));
                 else
                     wr_i <= unsigned(ptr_window_i);
                 end if;    
                 fifo_wr_en<='1';   
                 if  unsigned(delay_trigger)> 0 then 
                      current_subBuffer(0) <='0';
                      if first_round_of_subbuffer = '1' then
                         jump_wr(0)<= '0';
                      else 
                         jump_wr(0)<= '1';
                      end if;
 
                 else
                      current_subBuffer(0)<='1';
                  --    jump_wr(0)<= '1';
 
                 end if;   
               
               else
 --                 flag0 <= false;
                  fifo_wr_en<='0';  
               end if;
 --          else
 --              wr_i <= unsigned(ptr_window_i);
                             
 --              if trigger_intl = '1' then
                  
 -- --               flag0 <= true;
 --                flag_number<= "0000";
 --                window2read <= std_logic_vector(ptr_window_i);
 --                fifo_wr_en<='1';   
                   
 --              else
 ----                 flag0 <= false;
 --                 fifo_wr_en<='0';  
 --              end if;
               
   --        end if;
 
           stm_circularBuffer <= hit1;
           
                
           
           
 
      when hit1 =>      
            if trigger_intl = '1' then
 --              flag1 <= true;
               flag_number<= "0001";
 
              window2read <= std_logic_vector(ptr_window_i);
              fifo_wr_en<='1';   
              
              if  unsigned(delay_trigger)> 1 then 
                   current_subBuffer(1) <='0';
                  if first_round_of_subbuffer = '1' then
                         jump_wr(1)<= '0';
                      else 
                         jump_wr(1)<= '1';
                      end if;
 
                --   jump_wr(1)<= '0';
              else
                   current_subBuffer(1)<='1';
 --                  jump_wr(1)<= '1';
              end if;   
            
            else
 --              flag1 <= false;        
               fifo_wr_en<='0';    
                 -- window2read <= (others=>'X') ;         
           end if;
            stm_circularBuffer <= hit2;
  
        
       when hit2 =>      
             if trigger_intl = '1' then
 --               flag2 <= true;
                flag_number<= "0010";
 
               window2read <= std_logic_vector(ptr_window_i);
               fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 2 then 
                   current_subBuffer(2) <='0';
                  if first_round_of_subbuffer = '1' then
                          jump_wr(2)<= '0';
                       else 
                          jump_wr(2)<= '1';
                       end if;  
 --                  jump_wr(2)<= '0';
               else
                  current_subBuffer(2)<='1';
 --                 jump_wr(2)<= '1';
               end if;   
             
               else
 --               flag2 <= false;          
                fifo_wr_en<='0';  
                 -- window2read <= (others=>'X') ;         
            end if;
         stm_circularBuffer <= hit3;
             
 ---------------------------------
         -- If a pulse is detected at this point, and taking in account the delay (~8 ns) the pulse ocurred and was sampled in the previous window
   ---------------------------------               
        when hit3 =>      
              if trigger_intl = '1' then
 --                flag3 <= true;
                 flag_number<= "0011";
 
               window2read <= std_logic_vector(ptr_window_i);
               fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 3 then 
                   current_subBuffer(3) <='0';
                  if first_round_of_subbuffer = '1' then
                          jump_wr(3)<= '0';
                       else 
                          jump_wr(3)<= '1';
                       end if;
 
 
               --    jump_wr(3)<= '0';
               else
                  current_subBuffer(3)<='1';
     --             jump_wr(3)<= '1';
               end if;   
              else
 --                flag3 <= false;          
                 fifo_wr_en<='0';  
                 -- window2read <= (others=>'X') ;         
             end if;
            stm_circularBuffer <= hit4;
                      
        
         when hit4 =>      
               if trigger_intl = '1' then
 --                 flag4 <= true;
                 flag_number<= "0100";
 
                window2read <= std_logic_vector(unsigned(ptr_window_i) + 1);
                fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 4 then 
                    current_subBuffer(4) <='0';
                  if first_round_of_subbuffer = '1' then
                           jump_wr(4)<= '0';
                        else 
                           jump_wr(4)<= '1';
                        end if;
       
       
 --                   jump_wr(4)<= '0';
                else
                   current_subBuffer(4)<='1';
 --                  jump_wr(4)<= '1';
                end if;   
               else
 --                 flag4 <= false;          
                 fifo_wr_en<='0';  
                 -- window2read <= (others=>'X') ;         
              end if;
            stm_circularBuffer <= hit5;
         
         when hit5 =>      
            if trigger_intl = '1' then
 --              flag5 <= true;
                 flag_number<= "0101";
 
                window2read <= std_logic_vector(unsigned(ptr_window_i) + 1);
                fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 5 then 
                    current_subBuffer(5) <='0';
                  if first_round_of_subbuffer = '1' then
                           jump_wr(5)<= '0';
                        else 
                           jump_wr(5)<= '1';
                        end if;
 
 --                   jump_wr(5)<= '0';
                else
                   current_subBuffer(5)<='1';
 --                  jump_wr(5)<= '1';
                end if;   
            else
 --              flag5 <= false;          
         fifo_wr_en<='0';          -- window2read <= (others=>'X') ;         
            end if;
              stm_circularBuffer <= hit6;
 
    
         when hit6 => 
      --      if flag
            
            
            ptr_window_inter<= ptr_window_i;
            if trigger_intl = '1' then
 --              flag6 <= true;
                 flag_number<= "0110";
               
                window2read <= std_logic_vector(unsigned(ptr_window_i) + 1);
                fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 6 then 
                    current_subBuffer(6) <='0';
                  if first_round_of_subbuffer = '1' then
                           jump_wr(6)<= '0';
                        else 
                           jump_wr(6)<= '1';
                        end if;
   
 --                   jump_wr(6)<= '0';
                else
                   current_subBuffer(6)<='1';
 --                  jump_wr(6)<= '1';
                end if;   
           else
 --              flag6 <= false;          
         fifo_wr_en<='0';  
                 -- window2read <= (others=>'X') ;         
            end if;
              stm_circularBuffer <= hit7;
              
              
              
        
        when hit7 =>      
         -- In this state, WR and ptr_window are updated,
         --- we have to know if the past states trigger detections
         -- correspond to the first round of the subBuffer, if the 
         -- difference between the delay and the flag is negative (jump_wr)
         -- in order to update WR. 
         -- Suppose the difference is negative, so the trigger  not ocurred in the
         -- current subBuffer, and could correspond to a previous subBuffer
         -- or to the same subBuffer but WR+1
 --       -- if first_round_of_subbuffer ='1' then
 --              if unsigned(ptr_window_i) /=  0 then
 --                  wr_i <= shift_right(unsigned(ptr_window_i), 1  ) +1;
 --              else
 --                  wr_i <= unsigned(ptr_window_i )  + 1 ;
 --              end if;
               
 --                if trigger_intl = '1' then
 --                    flag_number<= "0111";
                    
 --                   window2read <= std_logic_vector(unsigned(ptr_window_i) + 1);
 --                   fifo_wr_en<='1';   
 --                  if  unsigned(delay_trigger)> 7 then 
 --                       current_subBuffer(7) <='0';
 --                   else
 --                      current_subBuffer(7)<='1';
 --                   end if;   
 --               else
 ----                   flag7 <= false;
 --                    fifo_wr_en<='0';  
 --                    -- window2read <= (others=>'X') ;         
 --                end if;
 --                stm_circularBuffer <= hit8;
 --                jump_wr<=(others=>'0');
 
               
 --        else
               if unsigned(jump_wr) > 0 then
                   wr_i <= shift_right(unsigned(ptr_window_i), 1  ) +2;
                   ptr_window_i <=  std_logic_vector(unsigned(ptr_window_inter)+4);
              --     window2read <= std_logic_vector(unsigned(ptr_window_i) + 2);
                   jump_ptr_correction <= '1';  -- refer to the currrent window in case after delay correction, the pulse ocurred in this window
                   jump_wr<=(others=>'0');
                   stm_circularBuffer <= hit0;
                   fifo_wr_en<='0'; 
                   first_round_of_subbuffer <= '1';
  
               else
                   if unsigned(ptr_window_i) /=  0 then
                        wr_i <= shift_right(unsigned(ptr_window_i), 1  ) +1;
                   else
                        wr_i <= unsigned(ptr_window_i )  + 1 ;
                   end if;     
                      if trigger_intl = '1' then
 --                              flag7 <= true;
                                flag_number<= "0111";
                               
                               window2read <= std_logic_vector(unsigned(ptr_window_i) + 1);
                               fifo_wr_en<='1';   
                              if  unsigned(delay_trigger)> 7 then 
                                   current_subBuffer(7) <='0';
                               else
                                  current_subBuffer(7)<='1';
                               end if;   
                           else
 --                              flag7 <= false;
                                fifo_wr_en<='0';  
                                -- window2read <= (others=>'X') ;         
                            end if;
                            stm_circularBuffer <= hit8;
                   
  --              end if;
        end if;           
                                    
 --            if trigger_intl = '1' then
 --               flag7 <= true;
 --                flag_number<= "0111";
                
 --               window2read <= std_logic_vector(unsigned(ptr_window_i) + 1);
 --               fifo_wr_en<='1';   
 --              if  unsigned(delay_trigger)> 7 then 
 --                   current_subBuffer(7) <='0';
 --               else
 --                  current_subBuffer(7)<='1';
 --               end if;   
 --           else
 --               flag7 <= false;
 --                fifo_wr_en<='0';  
 --                -- window2read <= (others=>'X') ;         
 --            end if;
 --            stm_circularBuffer <= hit8;
   
        when hit8 =>      
              if trigger_intl = '1' then
 --                flag8<= true; 
                 flag_number<= "1000";
                 
               window2read <= std_logic_vector(unsigned(ptr_window_i) +2); 
               fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 8 then 
                   current_subBuffer(8) <='0';
               else
                  current_subBuffer(8)<='1';
               end if;       
             else
 --                flag8<= false;          
                 -- window2read <= (others=>'X') ;         
             fifo_wr_en<='0';  
             end if;
              stm_circularBuffer <= hit9;
            
         when hit9 =>      
               starting_run<='0'; -- At this point the delay_flag_and_window has updated the flag_number
 
               jump_ptr_correction<= '0';
 
               if trigger_intl = '1' then
 --                 flag9 <= true;
                 flag_number<= "1001";
                  
              window2read <= std_logic_vector(unsigned(ptr_window_i)+2); 
                 fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 9 then 
                     current_subBuffer(9) <='0';
                 else
                    current_subBuffer(9)<='1';
                 end if;              
               else
 --                 flag9 <= false;                   
                 fifo_wr_en<='0';       
                 -- window2read <= (others=>'X') ;
              
              end if;
           stm_circularBuffer <= hit10;
           
          when hit10 =>      
                if trigger_intl = '1' then
 --                  flag10 <= true;
                 flag_number<= "1010";
                   
                   window2read <= std_logic_vector(unsigned(ptr_window_i)+2); 
                 fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 10 then 
                     current_subBuffer(10) <='0';
                 else
                    current_subBuffer(10)<='1';
                 end if;   
                 
                else
 --                  flag10<= false;          
                 -- window2read <= (others=>'X') ;         
               fifo_wr_en<='0';  
               end if;
              stm_circularBuffer <= hit11;
                       
           when hit11 =>      
                 if trigger_intl = '1' then
 --                   flag11 <= true;
                 flag_number<= "1011";
                    
                    window2read <= std_logic_vector(unsigned(ptr_window_i)+2);    
                 fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 11 then 
                     current_subBuffer(11) <='0';
                 else
                    current_subBuffer(11)<='1';
                 end if;   
                    else
 --                   flag11 <= false; 
                -- window2read <= (others=>'X') ;         
          fifo_wr_en<='0';  
                end if;
              stm_circularBuffer <= hit12;
  
           
           when hit12 =>      
              if trigger_intl = '1' then
                  flag_number<= "1100";
                  window2read <= std_logic_vector(unsigned(ptr_window_i)+3); 
                  fifo_wr_en<='1';   
                  if  unsigned(delay_trigger)> 12 then 
                     current_subBuffer(12) <='0';
                 else
                    current_subBuffer(12)<='1';
                 end if;   
             else
                    fifo_wr_en<='0';  
             end if;
            
              stm_circularBuffer <= hit13;
   
           when hit13 =>      
              if trigger_intl = '1' then
                 flag_number<= "1101";
                  window2read <= std_logic_vector(unsigned(ptr_window_i)+3); 
                 fifo_wr_en<='1';   
                 
                 if  unsigned(delay_trigger)> 13 then 
                     current_subBuffer(13) <='0';
                 else
                    current_subBuffer(13)<='1';
                 end if;   
              else
                 fifo_wr_en<='0';   
              end if;
                stm_circularBuffer <= hit14;             
 
           when hit14 => 
              ptr_window_trans_i <= ptr_window_i;
              if trigger_intl = '1' then
              flag_number<= "1110";
                 
             window2read <= std_logic_vector(unsigned(ptr_window_i)+3); 
                 fifo_wr_en<='1';   
               if  unsigned(delay_trigger)> 14 then 
                     current_subBuffer(14) <='0';
                 else
                    current_subBuffer(14)<='1';
                 end if;   
              else
                 fifo_wr_en<='0';   
       
              end if;
                stm_circularBuffer <= wr_add;
                  
           when wr_add =>
           
 
           if trigger_intl = '1' then
                flag_number<= "1111";
                window2read <= std_logic_vector(unsigned(ptr_window_i)+3) ; 
                fifo_wr_en<='1';   
                flag_number_v :=flag_number;
                if full_fifo = '0' then
                      if wr_i /= 255 then  
                                 ptr_window_i <= std_logic_vector(unsigned(ptr_window_trans_i) + 4);   -- To next subBuffer              
                                  wr_i <= unsigned(wr_i+1);
                                  first_round_of_subbuffer <= '1';
                      else
                           wr_i <= (others => '0');
                      end if;
                      current_subBuffer<= (others=>'0');
      
                    stm_circularBuffer<= hit0;
                else 
                    stm_circularBuffer<= hit0;
                end if;
                              
            else  
                          fifo_wr_en<='0';   
              if  unsigned(current_subBuffer) > 0 then
                  if full_fifo = '0' then
 
                      ptr_window_i <= std_logic_vector(unsigned(ptr_window_trans_i) + 4);
                      if wr_i /= 255 then  
                          if  unsigned(current_subBuffer) > 0 then           -- To next subBuffer 
                                 ptr_window_i <= std_logic_vector(unsigned(ptr_window_trans_i) + 4);                 
         
                                wr_i <= unsigned(wr_i+1); 
                                first_round_of_subbuffer <= '1';
                                long_pulse_rst<='1';
                               else
                                wr_i <= unsigned(wr_i-1);
                                ptr_window_i <= std_logic_vector(unsigned(ptr_window_trans_i) );                 
                                first_round_of_subbuffer <= '0';
 
                           end if;          
                    
                      else
                                wr_i <= (others => '0');
                      end if;
 
            
                      stm_circularBuffer<= hit0;
                       current_subBuffer<= (others=>'0');
                  else   
                      stm_circularBuffer<= hit0;  
                       current_subBuffer<= (others=>'0');               
                  end if;
              else  --- NO HIT 
                  current_subBuffer<= (others=>'0');
                  stm_circularBuffer<= hit0;
                  wr_i <= unsigned(wr_i-1);  -- If no hit is detected, the wr pointer goes back to the initial value for the current subBuffer, at this point (the end of wr), 
                                             -- wr - 1 means going back four windows, a subBuffer, so, 
                                             -- the current subBuffer will be overwritted
                 first_round_of_subbuffer <= '0';
 
 
              end if;             
            stm_circularBuffer <= hit0;
         end if;       
            end case;
    end if;
       
 end if;
 
 end process p_sm;
 WR_RS <= std_logic_vector(wr_i(1 downto 0));
 
 WR_CS <= std_logic_vector(wr_i(7 downto 2));
 
 p_first_round_of_subbuffer_delay : process(clk,RST, first_round_of_subbuffer)
 begin
 if RST = '0' then
     first_round_of_subbuffer_delay <= '0';
 else
     if rising_edge(clk) then
 
    first_round_of_subbuffer_delay<= first_round_of_subbuffer;
    --first_round_of_subbuffer_delay2<= first_round_of_subbuffer_delay;
 
   -- fifo_wr_en_delay2 <= fifo_wr_en_delay;
 
     end if;
 end if;
 end process;
 
-- window2read2 <= window2read & first_round_of_subbuffer;
 
-- WR_window <= ptr_window_i;
-- ----------------------------------
-- -- Dummy SSTIN signal for simulations
-- ----------------------------------
 
-- p_counter: process(clk, RST)
-- begin
-- if RST = '0' then
--     counter_i <= (others=> '0');
  
-- else
--     if rising_edge(clk) then
--         if counter_i < "111" then
--            counter_i <= std_logic_vector(unsigned(counter_i) + 1);
--         else 
--            counter_i <= "000";
 
--         end if;
--     end if;
--  end if;
 
-- end process p_counter;
 
-- ----------------------------------
-- -- Dummy signal for simulations
-- ----------------------------------
-- p_sstin: process(clk,RST)
 
-- begin
-- if RST = '0' then
--     sstin_i <= '0';
-- else
--     if rising_edge(clk) then
--         case counter_i is 
--         when "000" =>
--             sstin_i <= '1';
--         when "001" =>
--             sstin_i <= '1';
--         when "010" =>
--             sstin_i <= '1';
--         when "011" =>
--             sstin_i <= '0';
--         when "110" => 
--            sstin_i <= '0';
--         when "111"=> 
--            sstin_i <= '1';   
--         when others =>
--             sstin_i <= '0';
--         end case;
      
--      end if;
     
--  end if;
  
 
-- end process p_sstin;
 
 ----------------------------------
 -- Long pulses handling
 ----------------------------------
 long_pulses_stm:    process(clk,trigger, RST)
        
              
         begin
             if RST = '0' then
                 long_pulse_sig <= '0';
                 cnt_wr_en <= (others=>'0'); 
       --          trigger_intl<='0';
             else
                 if rising_edge(clk) then 
                             case longpulse_stm is
                                  when IDLE =>            
                                 if trigger= '1' then           
                                     if cnt_wr_en < "0001" then  --- After x windows (cnt_wr_en < x) the pulse is considered 'long'.
                                         long_pulse_sig<= '0';
                                         cnt_wr_en <= std_logic_vector(unsigned(cnt_wr_en) + 1);
                                         trigger_intl<=trigger;
                                         longpulse_stm <= IDLE;
                                     else
                                         long_pulse_sig<='1';
                                         cnt_wr_en <= (others=>'0');
                                         longpulse_stm <= longpulse;  -- if the writeEn stays high for more than x clk periods the long_pulse signal goes high
                                         trigger_intl<= '0';
 
                                     end if;    
                                else
                                    long_pulse_sig <= '0';
                                    cnt_wr_en <= (others=>'0');
                                    longpulse_stm <= IDLE;
                                    trigger_intl<=trigger;
                                                 
                                end if;
                              when longpulse=>
                                 if trigger= '1' then           
                                     long_pulse_sig<= '1';
 
                                      longpulse_stm <= longpulse; 
                                      trigger_intl<='0';
 
                                 else
                                     long_pulse_sig<= '0';
                                     longpulse_stm <= IDLE;
                                     trigger_intl<=trigger;
 
                                 end if;
                             end case;        
                         
                         end if;
                     end if;
     end process;
 
 ----------------------------------
 -- Trigger Delay introduced by electronics 
 -- For a 4-window subBuffer, a maximum delay of 16 cycles is allowed, as the data is overwritted every 16 cycles
 ----------------------------------
 
 p_delayed_flag_and_window : process(clk,RST, delay_trigger,window2read, flag_number)
 
 
 variable delay_flag_v : std_logic_vector(3 downto 0);
 begin
 
 if RST = '0' then
     delay_flag_v := (others=> '0');
     delay_window <= (others=> '0');
     delay_flag <= (others=> '0');
     jump_flag <= '0';
     intra_buffer_flag_w0 <='0'; 
 
 
 else
     if rising_edge(clk) then 
            
             if (delay_trigger <= flag_number)  then 
                 delay_flag_v := std_logic_vector(unsigned(flag_number) - unsigned(delay_trigger)); -- same subbuffer
                 delay_window <= window2read(8 downto 2) & delay_flag_v(3 downto 2); -- window corrected, SubBuffer number + local window. Local window is the internal number for each subBUffer, from 0 to 3.                
                 jump_flag <= '0';
                 intra_buffer_flag_w0 <='0'; 
             else
                 if ( (starting_run = '1') and (  (window2read = "000000000") or (window2read = "000000001")  ) )then
                     delay_flag_v:= x"0";
                     delay_window <= "000000000";
                     jump_flag <= '0';
                     intra_buffer_flag_w0 <='0'; 
 
                 elsif ( (window2read = "000000000")  or (window2read= "000000001") )  and (starting_run = '0')  then -- INterbuffer case in order to avoid going back to window 512
                     delay_flag_v:= std_logic_vector( 16 + unsigned(flag_number) - unsigned(delay_trigger)); -- delay_flag could take only values in the range 8-16
                     delay_window <= "0000000"  & "1" & delay_flag_v(2); -- In this case, delay_window could take only two values= 2 or 3   
                     jump_flag <= '0';
                     intra_buffer_flag_w0 <='1'; 
                     
                 elsif (first_round_of_subbuffer_delay = '0') then 
                    delay_flag_v:= std_logic_vector( 16 + unsigned(flag_number) - unsigned(delay_trigger)); -- previous subbuffer
                    delay_window <= std_logic_vector(unsigned(window2read(8 downto 2) )) & delay_flag_v(3 downto 2) ; -- When the trigger happened in the previous subBuffer, the subBUffer number, window2read(8 downto 2), is decreased by 1.
                    jump_flag <= '0';
                    intra_buffer_flag_w0 <='1';                       
                                             
                 elsif (jump_ptr_correction = '1') and  (flag_number < "1000")  then
                     delay_flag_v:= std_logic_vector( 16 + unsigned(flag_number) - unsigned(delay_trigger)); -- previous subbuffer
                     delay_window <= std_logic_vector(unsigned(window2read(8 downto 2) ) -1) & std_logic_vector(unsigned(delay_flag_v(3 downto 2)) -2) ; -- THE NUMBER TWO SHOULD BE VARIABLE AND NOT HARDCODED
                     intra_buffer_flag_w0 <='0'; 
                     jump_flag <='1';
 
                 else
                     delay_flag_v:= std_logic_vector( 16 + unsigned(flag_number) - unsigned(delay_trigger)); -- previous subbuffer
                     delay_window <= std_logic_vector(unsigned(window2read(8 downto 2) ) -1) & delay_flag_v(3 downto 2) ; -- When the trigger happened in the previous subBuffer, the subBUffer number, window2read(8 downto 2), is decreased by 1.
                     jump_flag <= '0';
                     intra_buffer_flag_w0 <='0'; 
                 end if;
         end if;
         
         delay_flag <= delay_flag_v;
 
 -- THIS CASE WAS REPLACED BY SLICING THE  delay_flag_v VARIABLE       
 --        case delay_flag is
 --               when "0000" | "0001" | "0010" | "0011" =>
 --                   local_window <= "00" ; 
 --               when "0100" | "0101" | "0110" | "0111" =>
 --                   local_window <= "01" ;
 --               when "1000" | "1001" | "1010" | "1011" =>
 --                   local_window <= "10" ;
 --               when "1100" | "1101" | "1110" | "1111" =>
 --                   local_window <= "11" ;
 --               when others =>
 --                   local_window<= "UU" ;
 --          end case;
          
    end if;
 end if;    
     end process;
     
 fifo_in<= intra_buffer_flag_w0 & jump_flag & delay_window & delay_flag;
 
 
 
 
 p_delay_fifo_wr_cycle: process(clk,RST, fifo_wr_en)
 begin
 if RST = '0' then
     fifo_wr_en_delay <= '0';
 else
     if rising_edge(clk) then
 
     fifo_wr_en_delay<= fifo_wr_en;
    fifo_wr_en_delay2 <= fifo_wr_en_delay;
 
     end if;
 end if;
 end process;
 
 
 
 
 
 ----------------------------------
 -- FIFO after RB
 ----------------------------------
 rb_output_windowNumber_inst : rb_output_windowNumber
   PORT MAP (
     clk => clk,
     din => fifo_in,
     wr_en => fifo_wr_en_delay2,
     rd_en => fifo_rd_en,
     dout => fifo_out,
     full => fifo_full,
     empty => fifo_empty
   );
 
 
 
 ----------------------------------
 -- One-cycle high for the enable_write 
 --- The enable_write is high only once independent of the lenght of the trigger
 ----------------------------------
 
 p_enableWrite : process(clk,RST)
 begin
 if RST = '0' then
       saved_i <= (others=> '0');
       enable_write_intl <= '0';
 
 else
 
     if rising_edge(clk) then     
 --        if rd_add_i = "000000000" then
 --            enable_write_intl <= enable_write_i;
 --        else
             if rd_add_i /= saved_i then
                  enable_write_intl <= '1';
                  saved_i <= rd_add_i;
             else
                  enable_write_intl <= '0';
       --      end if;
         end if;
      end if;   
 end if;
 
 end process p_enableWrite;
 enable_write <= enable_write_intl;
 
 ----------------------------------
 -- one or two windows decision
 ----------------------------------
 p_2window_decision: process(clk,RST)
 
 begin
 if RST = '0' then
     rd_add_i <= (others=> '0');
     enable_write_i <= '0';
     fifo_rd_en <= '0';
     fifo_out_i <= (others=> '0');
     twoWindows <= '0';
 else    
     if rising_edge(clk) then 
         case stm_2windows is
             when enable_rd =>
                 enable_write_i <= '0';
                 if fifo_empty = '0' then
                       fifo_rd_en <= '1';
                       stm_2windows <=delay;
                 else 
                     stm_2windows <= enable_rd;
                 end if;
              
             when delay=>
                  fifo_rd_en <= '0';
                 enable_write_i <= '0';
                   stm_2windows <=retrieve ;
            when retrieve =>
             fifo_out_i <= fifo_out;
             stm_2windows <=decide;
           
             when decide =>
                   fifo_rd_en <= '0';                
                 case fifo_out_i(3 downto 0) is -- flag numbers
                     when "0011" | "0111" |"1011"| "1111" => -- FIX '0000' case not handled 
                     stm_2windows <= two_windowsA;
                     twoWindows<= '1';
                     when others =>
                     stm_2windows <= one_window;
                 end case;
                 enable_write_i <= '0';
                 
             when two_windowsA=>
                 rd_add_i <=   fifo_out_i(12 downto 4);
                 enable_write_i <= '1';
                 twoWindows<='0';
                 stm_2windows <= delay2;
           
             when delay2=>
                      fifo_rd_en <= '0';
                     enable_write_i <= '0';
                       stm_2windows <=delay4 ;
             when delay4 =>
                  fifo_rd_en <= '0';
                  enable_write_i <= '0';
                   stm_2windows <= two_windowsB;
                   
             when two_windowsB=>
                     if (fifo_out_i(13) = '1') and (fifo_out_i(3 downto 0) ="1111") then
                         rd_add_i <=std_logic_vector(unsigned(fifo_out_i(12 downto 4)) +3);  -- special case for jump subBuffer 
 --                    elsif  (fifo_out_i(14)= '1') and (fifo_out_i(12 downto 4)= "00000011" ) then
                       elsif  (fifo_out_i(14) = '1') and (fifo_out_i(3 downto 0) = "0111") then
                         rd_add_i <=std_logic_vector(unsigned(fifo_out_i(12 downto 4)) -2); -- special case for firs wr address handling to avoid going to window 512
                      elsif  (fifo_out_i(14) = '1') and (fifo_out_i(3 downto 0) = "1111") then
                         rd_add_i <=std_logic_vector(unsigned(fifo_out_i(12 downto 4)) -3); -- special case for firs wr address handling to avoid going to window 512
                     else
                         rd_add_i <=std_logic_vector(unsigned(fifo_out_i(12 downto 4)) +1); 
                     end if;
                     
                     enable_write_i <= '1';
                     stm_2windows <= enable_rd;
                     
 
             
 
             when one_window=>
                 rd_add_i <= fifo_out_i(12 downto 4);
                 enable_write_i <= '1';
                 stm_2windows <= delay3;
             when delay3 =>
                  enable_write_i <= '0';
                  fifo_rd_en <= '0';
                  stm_2windows <= enable_rd;
 
            end case;
     end if;
 end if;
 end process;
 
 
 
 RD_add <= rd_add_i;
-- For simulation purposes:

--p_edge_detector_write_enable :  process(clk, enable_write_intl)
--begin
--        if rising_edge (clk) then
--            reg3 <= enable_write_intl;
--            reg4 <= reg3;
            
--        end if;
   
--end process p_edge_detector_write_enable;    

--edge_det_write_enable_intl <= not(reg3) and  (reg4);


--p_enable_write_cntr: process(clk,RST, edge_det_write_enable_intl)

--begin

--if RST = '0' then
--    enable_write_cntr_intl <= (others =>'0');
--else    
--    if rising_edge(clk) then 
--        if edge_det_write_enable_intl = '1' then
--            if enable_write_cntr_intl <"111111111" then
--                enable_write_cntr_intl <= std_logic_vector(unsigned(enable_write_cntr_intl) + 1);
--            else
--                enable_write_cntr_intl <= (others=> '0'); 
--            end if;
----        else
----           enable_write_cntr_intl <= enable_write_cntr_intl;
--        end if;
--    end if;
--end if;        
--end process;
----enable_write_cntr <= enable_write_cntr_intl;
end architecture;

