-- -----------------------------------------------------------
--!@FILE: 	RoundBufferV5.vhd
--!@AUTHOR: Jonathan Hendriks
--!@DATE: 	21st of January 2019
-- -----------------------------------------------------------
--!@DESCRIPTION:
--!
-- -----------------------------------------------------------
--!@VERSION:
--!
-- -----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity RoundBufferV6 is
--	generic(
--		NBRWINDOWS : integer := 16
--	);
	port(
	--	nrst : 			in	std_Logic;
		ClockBus:		in T_ClockBus;
		Timecounter:	in std_logic_vector(63 downto 0);
		Timestamp:		in T_timestamp;
		--GrayTimeCnt:	in std_logic_vector(63 downto 0);

		trigger : 		in std_logic_vector(3 downto 0);

		WR_R:		out std_logic_vector(1 downto 0);
		WR_C:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master

		--Output For control
		RBNbrOfPackets: out std_logic_vector(7 downto 0);
		-- RBNbrOfPackets:
		--CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master

		-- FIFO out for Reading RDAD
		RDAD_ReadEn  :in  std_logic;
		RDAD_DataOut : out std_logic_vector(8 downto 0);
		RDAD_Empty	: out std_logic;

		-- FIFO for FiFoManager
		AXI_ReadEn:	in	std_logic;
		AXI_Time_DataOut : out std_logic_vector(63 downto 0);
		AXI_WdoAddr_DataOut : out std_logic_vector(8 downto 0);
		AXI_TrigInfo_DataOut : out std_logic_vector(11 downto 0);
		AXI_Spare_DataOut :	out std_logic_vector(10 downto 0);
		AXI_Empty	: out std_logic;

		-- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic;
	    --signals for the HMB roundbuffer
	    hmb_trigger : std_logic;
        delay_trigger:    in std_logic_vector(3 downto 0);
        sstin_updateBit:   in std_logic_vector(2 downto 0); 
	    -- Signal for trigger the acquisition for debugging
	    address_is_zero_out : out std_logic
	    
	    
	);
end RoundBufferV6;

architecture implementation of RoundBufferV6 is



--component DummyTrigger is

--    port (

--  clk :            in  std_logic;
--  RST :             in  std_logic;
--  start_reg:	    in 	std_logic; 
--  Timestamp:        in T_timestamp;

--  trigger :         out std_logic

--);

--end component DummyTrigger;



--component circularBuffer is

--    port (
    
--  clk :            in  std_logic;
--  RST :             in  std_logic;  
--  trigger :         in std_logic;
--  full_fifo :        in std_logic;          
--   mode:     in std_logic; 
-- -- ptr_window :      out std_logic_vector(8 downto 0);
-- -- sstin :           out std_logic;
----   wr:     out unsigned(8 downto 0);
--  enable_write :    out std_logic;
--  TriggerInfo : out std_logic_vector(11 downto 0);
--   -- enable_write_fifo :    out std_logic;

----  counter :          out std_logic_vector(2 downto 0);        
  
--  RD_add:           out std_logic_vector(8 downto 0);
--  --  RD_add_fifo:           out std_logic_vector(8 downto 0);

            
--  WR_RS:            out std_logic_vector(1 downto 0);

--  WR_CS:            out std_logic_vector(5 downto 0);
--  delay_trigger:    in std_logic_vector(3 downto 0);
--    sstin :        in std_logic_vector(2 downto 0)

  

--);
--end component circularBuffer;


component HMB_roundBuffer is


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
  sstin_cntr:            in std_logic_vector(2 downto 0);
  sstin_updateBit:   in std_logic_vector(2 downto 0) -- To control the cycle number where the address are updated
  
  

   
);

end component HMB_roundBuffer;



	component WindowBrainV2 is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
		nCLR :			in	std_Logic;
	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		--Window Part
		CPUBus :		in	std_logic_vector(10 downto 0);

		-- wr1_en:			out	std_logic;
		-- wr2_en:			out	std_logic;

		--CurAddr:		in 	std_logic_vector(7 downto 0);
		--RealAddrBit:		in 	std_logic;
		--OldAddr:		in	std_logic_vector(7 downto 0);
		--OldAddrBit:		in std_logic;

		PREVBus_IN :	in	std_logic;
		PREVBus_OUT :	out	std_logic;
		NEXTBus_IN :	in	std_logic;
		NEXTBus_OUT :	out	std_logic;

		NextAddr : 		out std_logic;
		PrevAddr :		out std_logic
		-- NextAddr : 		inout 	std_logic_vector(7 downto 0);
		-- PrevAddr :		inout 	std_logic_vector(7 downto 0)
		);

	end component WindowBrainV2;


	component WindowStoreV4 is
--		Generic(
--			NBRWINDOWS : integer := 16
--		);
		Port (
		nrst : 			in	std_Logic;
		ClockBus:		in T_ClockBus;

		ValidData:		in	std_logic;

		-- Overwatch of Transmission
		NbrOfPackets:	out	std_logic_vector(7 downto 0);
		Reg_Clr:		in	std_logic;

		CPUBus:			in 	std_logic_vector(10 downto 0);
		CPUTime:		in	T_timestamp;
		TriggerInfo:	in 	std_logic_vector(11 downto 0);
--		trigger:        in  std_logic_vector(3 downto 0);
		-- Control Signals

		-- FIFO out for Reading RDAD
	    RDAD_ReadEn  :in  std_logic;
	    RDAD_DataOut : out std_logic_vector(8 downto 0);
	    RDAD_Empty	: out std_logic;

      CtrlBus_IxSL:    in     T_CtrlBus_IxSL;
      RDAD_Data_trig : in std_logic_vector(8 downto 0);
      RDAD_WriteEn_trig: in std_logic;

		-- FIFO for FiFoManager
		AXI_ReadEn:	in	std_logic;
		AXI_Time_DataOut : out std_logic_vector(63 downto 0);
		AXI_WdoAddr_DataOut : out std_logic_vector(8 downto 0);
		AXI_TrigInfo_DataOut : out std_logic_vector(11 downto 0);
		AXI_Spare_DataOut :	out std_logic_vector(10 downto 0);
	    AXI_Empty	: out std_logic
		);
	end component;


	--component CPU_CONTROLLER is
	component CPU_CONTROLLERV3 is
--				Generic(
--			NBRWINDOWS : integer := 16
--		);
		Port (
		nrst : 			in	STD_Logic;

		ClockBus:		in T_ClockBus;
		--Timecounter:	in std_logic_vector(63 downto 0);
		Timestamp:		in T_timestamp;
		trigger : 		in std_logic_vector(3 downto 0);

		-- Interface to WindowCPU
		CPUBus:			out	std_logic_vector(10 downto 0);
		CPUTime:		out	T_Timestamp;
	--	TriggerInfo :	out std_logic_vector(11 downto 0);

		WR_RS_S:		out std_logic_vector(1 downto 0);
		WR_CS_S:		out std_logic_vector(5 downto 0);

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL;

		ValidReal:		out std_logic;
		ValidData:		out std_logic;
		--CurAddr:		out	std_logic_vector(7 downto 0);
		--RealAddrBit:	out std_logic_vector(NBRWINDOWS-1 downto 0);
		--OldAddr:		out	std_logic_vector(7 downto 0);
		--OldAddrBit:		out std_logic_vector(NBRWINDOWS-1 downto 0);

		NextAddr_in : 	in std_logic_vector(7 downto 0);
		PrevAddr_in :	in std_logic_vector(7 downto 0);
		NextValid_in : 	in std_logic;
		PrevValid_in :	in std_logic;

	    -- FIFO IN for Digiting
	    DIG_Full	: out	std_logic;
	    DIG_DataIn	: in	std_logic_vector(8 downto 0);
	    DIG_WriteEn	: in	std_logic
		);

	--end component CPU_CONTROLLER;
end component CPU_CONTROLLERV3;

	component BIT_SELECTOR is
			Port (
			nrst :		in 	std_logic;
			nclr :		in	std_logic;
			clk : 		in 	std_logic;
			data : 		in 	std_logic_vector(255 downto 0);
			valid : 	out std_logic;
			addr :		out	std_logic_vector(7 downto 0)
			);
	end component BIT_SELECTOR;
    
    component nextAddressCnt is
     
     Port ( 
               clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               usrRst : in STD_LOGIC;
               Ctrl : in STD_LOGIC;
               nextAddress : out STD_LOGIC_vector(7 downto 0);
               nextAddressValid : out STD_LOGIC;
               address_is_zero : out std_logic

               );
 
     end component nextAddressCnt;
     
      component SyncBit is 
           generic (
              SYNC_STAGES_G  : integer := 2;
              CLK_POL_G      : std_logic := '1';
              RST_POL_G      : std_logic := '1';
              INIT_STATE_G   : std_logic := '0';
              GATE_DELAY_G   : time := 1 ns
           );
           port ( 
              -- Clock and reset
              clk         : in  std_logic;
              rst         : in  std_logic := '0';
              -- Incoming bit, asynchronous
              asyncBit    : in  std_logic;
              -- Outgoing bit, synced to clk
              syncBit     : out std_logic
           ); 
        end component;
        
        component pedestalTrigger is 
            Port ( 
                        clk : in STD_LOGIC;
                       rst : in STD_LOGIC;
                       trigger : out STD_LOGIC;
                       mode : in STD_LOGIC;
                       pedestals: in std_logic;
                       average: in std_logic_vector(31 downto 0);
                       wr_rs:  in std_logic_vector(1 downto 0); -- To synchronize WR and start at window 0
                       sstin : in std_logic_vector(2 downto 0)
                       );

               end component; 
        
        
     
	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal TriggerInfo_i:		std_logic_vector(11 downto 0);
	signal Bus_intl :			std_logic_vector(10 downto 0);
	

--	signal PREVBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);
--	signal NEXTBus_intl :		std_logic_vector(NBRWINDOWS-1 downto 0);
--	signal PREVBus_intl_Delay :		std_logic_vector(NBRWINDOWS-1 downto 0);
--	signal NEXTBus_intl_Delay :		std_logic_vector(NBRWINDOWS-1 downto 0);

--	signal NextAddrBus : 		std_logic_vector(NBRWINDOWS-1 downto 0);
--	signal PrevAddrBus :		std_logic_vector(NBRWINDOWS-1 downto 0);

	signal NextValid_s, PrevValid_s : std_logic;
	signal NextAddr_s,PrevAddr_s : std_logic_vector(7 downto 0);

	-- signal NextAddrBus : 		std_logic_vector(7 downto 0);
	-- signal PrevAddrBus :		std_logic_vector(7 downto 0);

	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal OldWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);
    signal WR_C_sig:      std_logic_vector(5 downto 0):=(others=>'0');
    signal WR_R_sig:      std_logic_vector(1 downto 0):=(others=>'0');
	--signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;
	--
	-- signal wr1_en_bus :				std_logic_vector(NBRWINDOWS-1 downto 0);
	-- signal wr2_en_bus :				std_logic_vector(NBRWINDOWS-1 downto 0);
	--
	-- signal wr1_en_single :				std_logic;
	-- signal wr2_en_single :				std_logic;

	signal Trig_intl, Last_intl, Te_intl, LE_intl, TrigDly_intl : std_logic;

	--signal RealAddrBit_s:		std_logic_vector(NBRWINDOWS-1 downto 0);  COMMENTED ON MAY 2019
	--signal OldAddrBit_s:		std_logic_vector(NBRWINDOWS-1 downto 0);  COMMENTED ON MAY 2019

	signal clr_intl : std_logic;
	signal ValidData_s, ValidReal_s, ValidData_dly, ValidData_delay: std_logic;
	signal time_intl:			T_timestamp;
    signal nrst : std_logic;
    
    signal dummytrigger_s : std_logic;

    signal RDAD_Data_s : std_logic_vector(8 downto 0);
    signal RDAD_Data_fifo_s : std_logic_vector(8 downto 0);
    
    signal RDAD_Full_s:  std_logic;

    signal RDAD_WrEn_s : std_logic;
    signal RDAD_WrEn_fifo_s : std_logic;
    signal WR_RS_S_trig:		std_logic_vector(1 downto 0):=(others=>'0');
    signal WR_CS_S_trig:        std_logic_vector(5 downto 0):=(others=>'0');
    signal WR_RS_S_user:		std_logic_vector(1 downto 0):=(others=>'0');
    signal WR_CS_S_user:        std_logic_vector(5 downto 0):=(others=>'0');
    signal trigger_s:        std_logic;
    signal delay_trigger_intl: std_logic_vector(3 downto 0);
    signal flag_edge : std_logic;
    signal CPUMODE_edge: std_logic;
    	type WR_update is (
        IDLE,
        CPUMODE_edge_detected
    );
    signal wr_update_st : WR_update;
    
        type SSTIN_synch_st is (
    USERMODE,
    TRIGGERMODE,
    SSTIN_SYNC,
    EVALUATE
);

signal sstin_sync_st : SSTIN_synch_st:=USERMODE;
signal trigger_ped : std_logic;
signal trigger_intl : std_logic;
--signal Bus_intl_dly :			std_logic_vector(10 downto 0);
--signal Bus_intl_delay :			std_logic_vector(10 downto 0);
--signal read_enable_dly: std_logic;
--signal read_enable_delay: std_logic;
--signal windowstorage_dly : std_logic;
--signal windowstorage_delay: std_logic;
--signal axireadenable_dly : std_logic;
--signal axireadenable_delay: std_logic;
--signal TrigInfo_dly:std_logic_vector(11 downto 0);
--signal TrigInfo_delay:std_logic_vector(11 downto 0);




    signal CPUMode_delayed: std_logic;
    signal reg3: std_logic;
    signal reg4: std_logic;    

    

--    signal windowStorage_s : std_logic;
    
	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
--	attribute DONT_TOUCH of GEN_CPU: label is "TRUE";
--	attribute DONT_TOUCH of CPU0: label is "TRUE";
--	attribute DONT_TOUCH of CPULast: label is "TRUE";
--	attribute DONT_TOUCH of CPU_CONTROLLER_inst: label is "TRUE";
--	attribute DONT_TOUCH of WDOTRIGGER: label is "TRUE";
--	attribute DONT_TOUCH of WDOSTORE: label is "TRUE";

--	attribute DONT_TOUCH of PREVBus_intl: signal is "TRUE";
--	attribute DONT_TOUCH of NEXTBus_intl: signal is "TRUE";

	attribute DONT_TOUCH of CurWindowCnt: signal is "TRUE";
	attribute DONT_TOUCH of OldWindowCnt: signal is "TRUE";

--	attribute DONT_TOUCH of NextAddrBus: signal is "TRUE";
--	attribute DONT_TOUCH of PrevAddrBus: signal is "TRUE";

	-- attribute DONT_TOUCH of wr1_en_bus: signal is "TRUE";
	-- attribute DONT_TOUCH of wr2_en_bus: signal is "TRUE";
	-- attribute DONT_TOUCH of wr1_en_single: signal is "TRUE";
	-- attribute DONT_TOUCH of wr2_en_single: signal is "TRUE";

	attribute DONT_TOUCH of NextAddr_s : signal is "TRUE";
	attribute DONT_TOUCH of PrevAddr_s : signal is "TRUE";
	attribute DONT_TOUCH of NextValid_s : signal is "TRUE";
	attribute DONT_TOUCH of PrevValid_s : signal is "TRUE";
begin



--inst_DummyTriger: DummyTrigger

--    port map (

--  clk =>            ClockBus.Clk125MHz ,
--  RST =>            nrst,
--  start_reg=>     CtrlBus_IxSL.WindowStorage,
--  Timestamp=>        Timestamp,
 
--  trigger =>       dummytrigger_s   

--);



--circBuffer: circularBuffer 

--    port map(
    
--  clk    =>          ClockBus.CLK125MHz  ,
--  RST    =>             nrst,  
--  trigger   =>        trigger_intl ,
--  full_fifo   =>      RDAD_Full_s  ,    
--  mode =>     CtrlBus_IxSL.WindowStorage,       
--  enable_write  =>   RDAD_WrEn_s ,  -- For fifo to pass RD_ADD
--  TriggerInfo => TriggerInfo_i,
-- --   enable_write_fifo  =>   RDAD_WrEn_fifo_s ,  -- For fifo to pass RD_ADD

--  RD_add    =>          RDAD_Data_s ,
-- --   RD_add_fifo    =>          RDAD_Data_fifo_s ,

--  WR_RS    =>           WR_RS_S_trig,
--  WR_CS   =>            WR_CS_S_trig,
--  delay_trigger => delay_trigger_intl,
--  sstin =>         Timestamp.samplecnt
-- -- ptr_window   =>         ,
--  -- sstin =>           out std_logic,
-- --   wr=>     out unsigned(8 downto 0);
-- --  counter   =>          out std_logic_vector(2 downto 0),
--);



HMBroundBuff : HMB_roundBuffer

    port map (
    
  clk =>          ClockBus.CLK125MHz  ,
  RST  =>             nrst,  
  trigger    =>        hmb_trigger ,
  full_fifo  =>      RDAD_Full_s  ,         
  mode=>     CtrlBus_IxSL.WindowStorage,  
  enable_write =>   RDAD_WrEn_s ,  -- For fifo to pass RD_ADD
  TriggerInfo => TriggerInfo_i,
  RD_add  =>          RDAD_Data_s ,
  WR_RS =>           WR_RS_S_trig,
  WR_CS =>            WR_CS_S_trig,
  sstin_cntr =>          Timestamp.samplecnt,
  delay_trigger => delay_trigger,
  sstin_updateBit => sstin_updateBit

   
);






SyncBitNrst: SyncBit
       generic map (
          SYNC_STAGES_G  => 2,
          CLK_POL_G      => '1',
          RST_POL_G      => '1',
          INIT_STATE_G   => '0',
          GATE_DELAY_G   => 1 ns
       )
       
       port map ( 
          -- Clock and reset
          clk  => ClockBus.CLK125MHz,
          rst   => '0',
          -- Incoming bit, asynchronous
          asyncBit =>  CtrlBus_IxSL.SW_nRST,
          -- Outgoing bit, synced to clk
          syncBit   => nrst
       ); 
--nrst <= CtrlBus_IxSL.SW_nRST;



	-- wr1_en_single <= wr1_en_bus(to_integer(unsigned(OldWindowCnt)));
	-- wr2_en_single <= wr2_en_bus(to_integer(unsigned(OldWindowCnt)));

	--CPU_CONTROLLER_inst : CPU_CONTROLLER
	CPU_CONTROLLER_inst : CPU_CONTROLLERV3
--			Generic map(
----				NBRWINDOWS => 256
--			)
			Port map(
			nrst			=> nrst,
			ClockBus		=> ClockBus,
			--timecounter		=> timecounter,
			timestamp  => timestamp,
			trigger 	=> trigger,

			CPUBus		=> Bus_intl,
			CPUTime		=> Time_intl,
--			TriggerInfo	=> TrigInfo_intl,

			WR_RS_S			=> WR_RS_S_user,
			WR_CS_S			=> WR_CS_S_user,

			CtrlBus_IxSL => CtrlBus_IxSL,
			ValidReal 	=> ValidReal_s,
			ValidData	=> ValidData_s,
			--CurAddr			=> CurWindowCnt,
		--	RealAddrBit		=> RealAddrBit_s,
			--OldAddr			=> OldWindowCnt,
			--OldAddrBit		=> OldAddrBit_s,

			-- NextAddr_in		=> NextAddrBus,
			--PrevAddr_in		=> PrevAddrBus,
			NextAddr_in		=> NextAddr_s,
			PrevAddr_in		=> PrevAddr_s,
			NextValid_in	=> NextValid_s,
			PrevValid_in	=> PrevValid_s,

			-- FIFO IN for Digiting
			DIG_Full		=> DIG_Full,
			DIG_DataIn		=> DIG_DataIn,
			DIG_WriteEn		=> DIG_WriteEn
			);




	WDOSTORE : WindowStoreV4
--		Generic map(
----		NBRWINDOWS => NBRWINDOWS
--		)
		Port map(
		nrst			=> nrst,
		ClockBus	=> ClockBus,
		ValidData	=> ValidData_s,

		CPUBus		=> Bus_intl,
		CPUTime		=> Time_intl,
		TriggerInfo	=> TriggerInfo_i,
	--	trigger=>       trigger,

		  -- Control Signals

		-- Overwatch
		--NbrOfPackets	=> CtrlBus_OxSL.RBNbrOfPackets,
		NbrOfPackets	=> RBNbrOfPackets,
		Reg_Clr			=> CtrlBus_IxSL.WindowStorage,

		-- FIFO out for Reading RDAD
		RDAD_ReadEn  => RDAD_ReadEn,
		RDAD_DataOut => RDAD_DataOut,
		RDAD_Empty	=> 	RDAD_Empty,
        
        
        CtrlBus_IxSL => CtrlBus_IxSL ,
        RDAD_Data_trig => RDAD_Data_s,
        RDAD_WriteEn_trig =>RDAD_WrEn_s,
        
        
        
		AXI_ReadEn			=> AXI_ReadEn,
		AXI_Time_DataOut	=> AXI_Time_DataOut,
		AXI_WdoAddr_DataOut	=> AXI_WdoAddr_DataOut,
		AXI_TrigInfo_DataOut	=> AXI_TrigInfo_DataOut,
		AXI_Spare_DataOut 		=> AXI_Spare_DataOut,
		AXI_Empty	=> AXI_Empty
		);

 nextAddressCnt_inst : nextAddressCnt
        Port map(
        clk => ClockBus.CLK125MHz,
        rst => nrst,   
        usrRst => CtrlBus_IxSL.WindowStorage,                   
        Ctrl => ValidReal_s,
        nextAddress => NextAddr_s,
        nextAddressValid => NextValid_s,
        address_is_zero => address_is_zero_out

        ); 
        
 pedestalTrigger_inst : pedestalTrigger
     Port map ( 
                clk => ClockBus.CLK125MHz,
               rst => nrst ,
               trigger => trigger_ped,
               mode => CtrlBus_IxSL.WindowStorage,
               pedestals =>CtrlBus_IxSL.TriggerModePed,
               average => CtrlBus_IxSL.pedestalTriggerAvg,
               wr_rs =>  WR_RS_S_trig, -- To synchronize WR and start at window 0
               sstin => Timestamp.samplecnt
               );


     edge_detect_cpu: process(ClockBus.CLK125MHz,nrst,CtrlBus_IxSL.CPUMode)
    begin
        if rising_edge(ClockBus.CLK125MHz) then
         reg3<= CtrlBus_IxSL.CPUMode;
         reg4<= reg3;
        end if;
    end process edge_detect_cpu;
        
    CPUMODE_edge <= (reg3) xor (reg4);  


	
edge_flag:	process(ClockBus.CLK125MHz, nrst)
        begin
            if nrst = '0' then
              flag_edge <= '0';

            
            else
                if rising_edge(ClockBus.Clk125MHz) then
                   if CPUMODE_edge = '1' then
                      flag_edge <= '1';
                  else
                       flag_edge <= '0';
                  end if;
                end if;
            end if;
           end process; 
           

WR_update_inst: process(ClockBus.CLK125MHz, nrst,TimeStamp.samplecnt,CPUMODE_edge)               
        begin
      if nrst = '0' then
        WR_R_sig  <=  (others=> '0');
        WR_C_sig <=  (others=>'0');
      else    
          if rising_edge(ClockBus.Clk125MHz) then
               case sstin_sync_st is
               
                    when USERMODE =>
                       if CPUMODE_edge = '0' then                          
                          WR_R_sig  <=  WR_RS_S_user;
                          WR_C_sig <=  WR_CS_S_user;
                          sstin_sync_st <= USERMODE;
                      else
                          sstin_sync_st <= SSTIN_SYNC;
                      end if;
                      
                    when TRIGGERMODE =>
                         if CPUMODE_edge = '0' then
                             WR_R_sig  <=  WR_RS_S_trig;
                             WR_C_sig <=  WR_CS_S_trig; 
                             
                             sstin_sync_st <= TRIGGERMODE;                        
                        else                         
                            sstin_sync_st <= SSTIN_SYNC;
                         end if;
                         
                    when SSTIN_SYNC =>         
                         if TimeStamp.samplecnt= "110" then
                            sstin_sync_st <= EVALUATE;
                         else
                            sstin_sync_st <= SSTIN_SYNC;
                         end if;
                         
                    when EVALUATE =>                               
                         if  (CtrlBus_IxSL.CPUMode = '0') then 
                              sstin_sync_st <= USERMODE;
                         else
                              sstin_sync_st <= TRIGGERMODE;
                         end if;

                    end case;    
	      end if;
	   end if;
	end process;
	
WR_R <= WR_R_sig ;
WR_C <= WR_C_sig ;
	
--dly_wdoNumber: process(ClockBus.CLK125MHz, nrst,TimeStamp.samplecnt,CPUMODE_edge)  
--    begin
--  if nrst = '0' then
--    Bus_intl_dly  <=  (others=> '0');
--    ValidData_dly  <= '0';
--    read_enable_dly<= '0';
--    windowstorage_dly <= '0';
--     axireadenable_dly<='0';
--     TrigInfo_dly <=(others=> '0');
    
--  else
--            if rising_edge(ClockBus.Clk125MHz) then
--                 Bus_intl_dly<=    Bus_intl;
--                 ValidData_dly<= ValidData_s;
--                 read_enable_dly<= RDAD_ReadEn;
--                 windowstorage_dly <= CtrlBus_IxSL.WindowStorage;
--                 axireadenable_dly <= AXI_ReadEn;
--                 TrigInfo_dly<= TrigInfo_intl;
----                  WR_R_sig  <=  WR_RS_S_user;
----                 WR_C_sig <=  WR_CS_S_user;
                 
--            end if;
--  end if;         
--  end process;
  
--  Bus_intl_delay <=Bus_intl_dly;
--  ValidData_delay  <= ValidData_dly;
--  read_enable_delay<= read_enable_dly;
--  windowstorage_delay <= windowstorage_dly;
--   axireadenable_delay<=axireadenable_dly;

trigger_s <= '0' when trigger= "0000" else '1';

trigger_intl <= trigger_s or trigger_ped;

delay_trigger_intl <= CtrlBus_IxSL.TC_Delay_RB(3 downto 0);
--TrigInfo_dly<=TrigInfo_dly;





end implementation;
