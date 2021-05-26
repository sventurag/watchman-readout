------------------------------------------------------

--! @file 	TARGETC_2ASICs_TOPLEVEL for HMB

--!
--! @author	Jonathan Hendriks, Salvador Ventura
--! @date	14th November 2018
--! @version 0.0
-------------------------------------------------------
--! @brief Top level for TARGETC Prototype IP component
--! Detailed description here, if any.
-------------------------------------------------------

--! Use standard Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Custom Library for TARGETC
use work.TARGETC_pkg.all;
--! Custom Library for AXI Lite interface
use work.AXI_Lite_pkg.all;


-------------------------------------------------------
--! Entity declaration for TARGETC_IP_Prototype .
-------------------------------------------------------
entity TARGETC_system is
	-- Generic Parameters :

	-- Port Parameters :
	port (


		SW_nRST:	out std_logic;
		aresetn : in std_logic;

		--! @name Reference Clock
		RefCLK_i1 :		in std_logic;	--! Clock for the TARGETC PLL
--		RefCLK_i2 :		in std_logic;	--! Clock for the TARGETC PLL

		--! @name Ports of Axi Slave Bus Interface TC_AXI
		tc_axi_aclk		: in std_logic;
		tc_axi_aresetn	: in std_logic;
		tc_axi_awaddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		tc_axi_awprot	: in std_logic_vector(2 downto 0);
		tc_axi_awvalid	: in std_logic;
		tc_axi_awready	: out std_logic;
		tc_axi_wdata	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		tc_axi_wstrb	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		tc_axi_wvalid	: in std_logic;
		tc_axi_wready	: out std_logic;
		tc_axi_bresp	: out std_logic_vector(1 downto 0);
		tc_axi_bvalid	: out std_logic;
		tc_axi_bready	: in std_logic;
		tc_axi_araddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		tc_axi_arprot	: in std_logic_vector(2 downto 0);
		tc_axi_arvalid	: in std_logic;
		tc_axi_arready	: out std_logic;
		tc_axi_rdata	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		tc_axi_rresp	: out std_logic_vector(1 downto 0);
		tc_axi_rvalid	: out std_logic;
		tc_axi_rready	: in std_logic;

		-- TARGET C I/Os
		SIN : 			out	STD_LOGIC;		--! SIN, Serial Input, Pin#35
		SCLK :	 		out	STD_LOGIC;		--! Pin#36
		PCLK :	 		out	STD_LOGIC;		-- Pin#37
		SHOUT:			in 	std_logic;		-- Pin#38

		HSCLK_P:		out std_logic;		-- Pin#44
		HSCLK_N:		out std_logic;		-- Pin#43

		WR_RS_S0:		out	std_logic;		--Pin
		WR_RS_S1:		out	std_logic;

		WR_CS_S0:		out	std_logic;
		WR_CS_S1:		out	std_logic;
		WR_CS_S2:		out	std_logic;
		WR_CS_S3:		out	std_logic;
		WR_CS_S4:		out	std_logic;
		WR_CS_S5:		out	std_logic;

		GCC_RESET:		out	std_logic;		-- Pin#56

		RDADCLK:		out	std_logic;		-- Pin#61
		RDAD_SIN:		out	std_logic;		-- Pin#62
		RDAD_DIR:		out	std_logic;		-- Pin#63

		SAMPLESEL_ANY:	out	std_logic;		-- Pin#66

		D_Out: 			in 	std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

		SS_INCR:		out	std_logic;		-- Pin#79

--		DOE:			out	std_logic;		-- Pin#80

		DONE:			in	std_logic;		-- Pin#94

		SS_RESET:		out	std_logic;		-- Pin#95

--		REGCLR: 		out	std_logic;		-- Pin#99

		--mDOE:			in	std_logic;		-- Pin#100

		SS_LD_SIN:		out	std_logic;		-- Pin#103
		SS_LD_DIR:		out	std_logic;		-- Pin#104

		RAMP:			out	std_logic;		-- Pin#108

--		SSTIN_P:		out std_logic;		-- Pin#125
--		SSTIN_N:		out std_logic;		-- Pin#126
--        SSTIN :         out std_logic;

		MONTIMING_P:	in	std_logic;		-- Pin#118
		MONTIMING_N:	in	std_logic;		-- Pin#117

		Cnt_AXIS_DATA:	in	std_logic_vector(9 downto 0);
		CNT_CLR:		out std_logic;

		-- DATA TO STREAM
		TestStream : 		out std_logic;
		FIFOvalid:			out std_logic;
		FIFOdata:			out std_logic_vector(31 downto 0);
		StreamReady:		in	std_logic;

		-- Trigger
		TrigA :			in std_logic;
		TrigB :			in std_logic;
		TrigC :			in std_logic;
		TrigD :			in std_logic;

        -- window storage master control
        WS_masterctrl_in :  in std_logic;
--        WS_masterctrl_out : out std_logic;
        
		-- Interrupt SIGNALS
		SSVALID_INTR:	out	std_logic;

     -- FROM CLK MANAGEMENT
	SSTIN 		: 	in std_logic;
--	    PLL_LOCKED:		in	std_logic;
--
--		ClockBus:		in T_ClockBus;
--
		Timecounter:	in std_logic_vector(63 downto 0);
		--Timestamp:		in T_timestamp
        graycnt:        std_logic_vector(59 downto 0);
        samplecnt:      std_logic_vector(2 downto 0)

		
	);
	
	
	     
	      
	      
end TARGETC_system;

-------------------------------------------------------
--! @brief architecture definition of TARGETC_IP_Prototype
architecture arch_imp of TARGETC_system is

	-------------------------------------------------------
	-- Component Declaration
--	-------------------------------------------------------

--	--! Clock Management for the different CLK needed inside the ASIC
	component TC_ClockManagementV3 is
	port (
	-- TARGET C Ports for control and function
--		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		axi_clk:		in	std_logic;
		SSTIN:          in  std_logic;
		PLL_LOCKED:		out	std_logic;
		ClockBus:		out T_ClockBus;
        
		Timecounter:	in std_logic_vector(63 downto 0);
		graycnt:        in std_logic_vector(59 downto 0);
		samplecnt:      in std_logic_vector(2 downto 0);
		Timestamp:		out T_timestamp

	);
	end component TC_ClockManagementV3;

	--! Communication with PS side through AXI Lite and Control Signals
	component TC_Control is
	port (
	-- TARGET C Ports for control and functi

		AxiBusIn:		in AXI_Lite_Inputs;
		AxiBusOut:		out AXI_Lite_Outputs;

		ClockBus:		in T_ClockBus;
        WS_master_ctrl:   in std_logic;
		CtrlBus_OxMS:		out T_CtrlBus_OxMS;
		CtrlBus_IxMS:		in 	T_CtrlBus_IxMS
	);
	end component TC_Control;

	--! Register Communication between FPGA and ASIC
	component TARGETX_DAC_CONTROL is
		generic (
			constant REGISTER_WIDTH : integer := 19-- needs to change, change the name of the file to TargetX DAC control this is actually 19 now
		 );
		Port (
				CLK : 				in  STD_LOGIC;
				PCLK_LATCH_PERIOD:	in	STD_LOGIC_VECTOR(15 downto 0);
				PCLK_TRANSITION_PERIOD:	in	STD_LOGIC_VECTOR(15 downto 0);

				LOAD_PERIOD : 		in  STD_LOGIC_VECTOR(15 downto 0);
				LATCH_PERIOD : 		in  STD_LOGIC_VECTOR(15 downto 0);
				-- UPDATE : 			in  STD_LOGIC;
				-- REG_DATA_IN : 		in  STD_LOGIC_VECTOR(18 downto 0);
				-- REG_DATA_OUT : 		out std_logic_vector(18 downto 0);
		       	-- busy		: 		out std_logic;

	            CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	    		--CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
				TC_BUS: 		out std_logic_vector(18 downto 0);
				BUSY:			out std_logic;

				SIN : out  STD_LOGIC;
		       	SCLK : out  STD_LOGIC;
		       	PCLK : out  STD_LOGIC;
		       	SHOUT: in	STD_LOGIC);
	end component TARGETX_DAC_CONTROL;

	component WR_ADDRESS is
--		generic(
--			NBRWINDOWS : integer := 128
--		);
		port(
			--nrst : 			in	std_Logic;
			ClockBus:		in T_ClockBus;
			Timecounter:	in std_logic_vector(63 downto 0);
			Timestamp:		in T_timestamp;
			--GrayTimeCnt:	in std_logic_vector(63 downto 0);

			trigger : 		in std_logic_vector(3 downto 0);

			WR_R:		out std_logic_vector(1 downto 0);
			WR_C:		out std_logic_vector(5 downto 0);

			CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
			--CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master

			RBNbrOfPackets: out std_logic_vector(7 downto 0);

			RDAD_ReadEn  :in  std_logic;
			RDAD_DataOut : out std_logic_vector(8 downto 0);
			RDAD_Empty	: out std_logic;

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
		   
	    -- Signal for trigger the acquisition for debugging
		    address_is_zero_out : out std_logic
		 
		);
	end component WR_ADDRESS;
	

	component TARGETC_RDAD_WL_SMPL is
		Port (
		--CLK : 			in  STD_LOGIC;
		--RST : 			in	STD_Logic;

		DISCH_PERIOD :	in	std_logic_vector(15 downto 0);
		INCR_WAIT_PERIOD:	in std_logic_vector(15 downto 0);

		ClockBus:		in T_ClockBus;
		--TimeCounter:	in std_logic_vector(63 downto 0);

		RDADCLK:		out	std_logic;		-- Pin#61
		RDAD_SIN:		out	std_logic;		-- Pin#62
		RDAD_DIR:		out	std_logic;		-- Pin#63

		-- Fifo from storage
		RDAD_ReadEn  :	out	std_logic;
		RDAD_DataOut : 	in	std_logic_vector(8 downto 0);
		--RDAD_CLK     :	out	std_logic;	-- RDAD CLK
		RDAD_Empty	: 	in 	std_logic;

		-- FIFO IN for Digiting
		DIG_Full	: in	std_logic;
		DIG_DataIn	: out	std_logic_vector(8 downto 0);
		DIG_WriteEn	: out	std_logic;

		RAMP:			out	std_logic;
		GCC_RESET:		out	std_logic;

		HSCLK : 			out  STD_LOGIC;

		D_Out : 			in std_logic_vector(15 downto 0);
		SS_INCR:		out std_logic;
		SS_RESET:		out std_logic;

		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
		--CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
		WindowBusy:		out std_logic;
		RAMP_CNT:		out std_logic;
		DO_BUS:			out eDO_BUS_TYPE;
		SSvalid:		out std_logic;

		--Channels
		CH0 :			out	std_logic_vector(11 downto 0);
		CH1 :			out	std_logic_vector(11 downto 0);
		CH2 :			out	std_logic_vector(11 downto 0);
		CH3 :			out	std_logic_vector(11 downto 0);

		CH4 :			out	std_logic_vector(11 downto 0);
		CH5 :			out	std_logic_vector(11 downto 0);
		CH6 :			out	std_logic_vector(11 downto 0);
		CH7 :			out	std_logic_vector(11 downto 0);

		CH8 :			out	std_logic_vector(11 downto 0);
		CH9 :			out	std_logic_vector(11 downto 0);
		CH10 :			out	std_logic_vector(11 downto 0);
		CH11 :			out	std_logic_vector(11 downto 0);

		CH12 :			out	std_logic_vector(11 downto 0);
		CH13 :			out	std_logic_vector(11 downto 0);
		CH14 :			out	std_logic_vector(11 downto 0);
		CH15 :			out	std_logic_vector(11 downto 0);

		--Request and Acknowledge -
		Handshake_IxSEND:	in 	T_Handshake_IxSEND;
		Handshake_Data:		out T_Handshake_SS_FIFO;
		Handshake_OxSEND:	out T_Handshake_OxSEND
	);
	end component TARGETC_RDAD_WL_SMPL;

	component FifoManagerV4 is
		generic (
			C_M_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
			CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
			--CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
			FIFOBusy:		out std_logic;

			ClockBus:		in T_ClockBus;

			--Request and Acknowledge - READOUT
			Handshake_IxRECV:	in 	T_Handshake_IxRECV;
			Handshake_Data:		in T_Handshake_SS_FIFO;
			Handshake_OxRECV:	out T_Handshake_OxRECV;

			--Header Information from FIFO
			FIFO_ReadEn:	out	std_logic;
			FIFO_Time : 	in 	std_logic_vector(63 downto 0);
			FIFO_WdoAddr : 	in 	std_logic_vector(8 downto 0);
			FIFO_TrigInfo : in 	std_logic_vector(11 downto 0);
			FIFO_Spare :	in 	std_logic_vector(10 downto 0);
			FIFO_Empty	: 	in 	std_logic;

			--Channels
			CH0 :			in	std_logic_vector(11 downto 0);
			CH1 :			in	std_logic_vector(11 downto 0);
			CH2 :			in	std_logic_vector(11 downto 0);
			CH3 :			in	std_logic_vector(11 downto 0);

			CH4 :			in	std_logic_vector(11 downto 0);
			CH5 :			in	std_logic_vector(11 downto 0);
			CH6 :			in	std_logic_vector(11 downto 0);
			CH7 :			in	std_logic_vector(11 downto 0);

			CH8 :			in	std_logic_vector(11 downto 0);
			CH9 :			in	std_logic_vector(11 downto 0);
			CH10 :			in	std_logic_vector(11 downto 0);
			CH11 :			in	std_logic_vector(11 downto 0);

			CH12 :			in	std_logic_vector(11 downto 0);
			CH13 :			in	std_logic_vector(11 downto 0);
			CH14 :			in	std_logic_vector(11 downto 0);
			CH15 :			in	std_logic_vector(11 downto 0);

			-- DATA TO STREAM
			FIFOvalid:			out std_logic;
			FIFOdata:			out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
			StreamReady:		in	std_logic
		);
	end component FifoManagerV4;
	--! Input LVDS_25 Buffer to single ended signal
	component IBUFDS is
	generic(
		IOSTANDARD : string := "LVDS_25");
	port(
		O : 		out std_logic ;
		I : 		in std_logic ;
		IB : 		in std_logic
		);
	end component;


	
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
               
	component OBUFDS is
	generic(
		CAPACITANCE : string     := "DONT_CARE";
		IOSTANDARD  : string     := "DEFAULT"
	);

	port(
		O  : out std_ulogic;
		OB : out std_ulogic;

		I : in std_ulogic
	);
	end component OBUFDS;


	-------------------------------------------------------
	-- Signal Declaration
	-------------------------------------------------------
    
	signal ClockBus_intl:	T_ClockBus;	--! internal clock signal
	signal SSTIN_intl : std_logic;
	signal CtrlBusIn_intl:		T_CtrlBus_IxMS_Intl;
	signal CtrlBusOut_intl:		T_CtrlBus_OxMS_Intl;
    signal PLL_LOCKED_intl:  std_logic;
	signal WR_CS_S_intl:	std_logic_vector(5 downto 0);
	signal WR_RS_S_intl:	std_logic_vector(1 downto 0);

	signal hsclk_dif :		std_logic;

	-- Dummy Signals
	signal tc_axi_intr:		std_logic;

	signal RDAD_ReadEn_intl  :  std_logic;
	signal RDAD_DataOut_intl : std_logic_vector(8 downto 0);
    signal RDAD_Empty_intl     :  std_logic;

    signal DIG_DataIn_intl	: std_logic_vector(8 downto 0);
    signal DIG_WriteEn_intl	: std_logic;
    signal DIG_Full_intl	: std_logic;

    signal timecounter_intl : std_logic_vector(63 downto 0);
	signal GrayTimeCnt_intl:	std_logic_vector(63 downto 0);
	signal timestamp_intl:		T_timestamp;

	signal nTrigA, nTrigB, nTrigC, nTrigD : std_logic;

	signal trigger_intl : std_logic_vector(3 downto 0);
	signal TriggerInfor_intl : std_logic_vector(11 downto 0);

	signal 	FIFO_ReadEn_intl : std_logic;
	signal 	FIFO_Time_intl : std_logic_Vector(63 downto 0);
	signal 	FIFO_WdoAddr_intl : std_logic_vector(8 downto 0);
	signal 	FIFO_TrigInfo_intl: std_logic_vector(11 downto 0);
	signal 	FIFO_Spare_intl:	std_logic_vector(10 downto 0);
	signal 	FIFO_Empty_intl:	std_logic;

	signal Handshake_IxSEND_intl : T_Handshake_IxSEND;
	signal Handshake_SS_FIFO: T_Handshake_SS_FIFO;
	signal Handshake_OxSEND_intl : T_Handshake_OxSEND;

	signal CH0_intl : std_logic_vector(11 downto 0);
	signal CH1_intl : std_logic_vector(11 downto 0);
	signal CH2_intl : std_logic_vector(11 downto 0);
	signal CH3_intl : std_logic_vector(11 downto 0);

	signal CH4_intl : std_logic_vector(11 downto 0);
	signal CH5_intl : std_logic_vector(11 downto 0);
	signal CH6_intl : std_logic_vector(11 downto 0);
	signal CH7_intl : std_logic_vector(11 downto 0);

	signal CH8_intl : std_logic_vector(11 downto 0);
	signal CH9_intl : std_logic_vector(11 downto 0);
	signal CH10_intl : std_logic_vector(11 downto 0);
	signal CH11_intl : std_logic_vector(11 downto 0);

	signal CH12_intl : std_logic_vector(11 downto 0);
	signal CH13_intl : std_logic_vector(11 downto 0);
	signal CH14_intl : std_logic_vector(11 downto 0);
	signal CH15_intl : std_logic_vector(11 downto 0);

	--DEBUG Signals
	signal MONTIMING_s : std_logic;
    signal MONTIMING_inverted : std_logic;
	signal Debug_intl : std_logic_vector(7 downto 0);
	signal Debug_RoundBuffer : std_logic_vector(7 downto 0);
    -- Signal for trigger the acquisition for debugging
    
    signal address_is_zero_intl :  std_logic;
    signal cnt_clr_intl :  std_logic;
    signal WS_master_ctrl_intl:  std_logic;
	-- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
	attribute DONT_TOUCH : string;
	attribute DONT_TOUCH of TC_WR_ADDRESS: label is "TRUE";
	
	attribute mark_debug : string; 
    attribute mark_debug of WR_CS_S_intl: signal is "true";
    attribute mark_debug of WR_RS_S_intl: signal is "true";
--    attribute mark_debug of tc_axi_aclk: signal is "true";
--    attribute mark_debug of RefCLK_i1: signal is "true";
    attribute mark_debug of SSTIN_intl: signal is "true";


begin
		 CtrlBusIn_intl.PLL_LOCKED <=PLL_LOCKED_intl;	
		 SSTIN_intl <= SSTIN;	

    TC_Clk_management:  TC_ClockManagementV3
    port map(
    
         
--		nrst      		=>  	aresetn,
		clk1			=> 	RefCLK_i1,
		
		axi_clk 		=> 	tc_axi_aclk,
		SSTIN          	=> 	SSTIN_intl,
		PLL_LOCKED		=> 	PLL_LOCKED_intl,
		ClockBus		=> 	ClockBus_intl,
		Timecounter	=> Timecounter,
		graycnt        => graycnt,
		samplecnt        => samplecnt,
		Timestamp	    =>Timestamp_intl
    
    
    );
     
	TC_Control_inst : TC_Control  
	port map(
		AxiBusIn.ACLK		=> tc_axi_aclk,
		AxiBusIn.ARESETN	=> tc_axi_aresetn,
		AxiBusIn.AWADDR		=> tc_axi_awaddr,
		AxiBusIn.AWPROT		=> tc_axi_awprot,
		AxiBusIn.AWVALID	=> tc_axi_awvalid,
		AxiBusIn.WDATA		=> tc_axi_wdata,
		AxiBusIn.WSTRB		=> tc_axi_wstrb,
		AxiBusIn.WVALID		=> tc_axi_wvalid,
		AxiBusIn.BREADY		=> tc_axi_bready,
		AxiBusIn.ARADDR		=> tc_axi_araddr,
		AxiBusIn.ARPROT		=> tc_axi_arprot,
		AxiBusIn.ARVALID	=> tc_axi_arvalid,
		AxiBusIn.RREADY		=> tc_axi_rready,

		AxiBusOut.AWREADY	=> tc_axi_awready,
		AxiBusOut.WREADY	=> tc_axi_wready,
		AxiBusOut.BRESP		=> tc_axi_bresp,
		AxiBusOut.BVALID	=> tc_axi_bvalid,
		AxiBusOut.ARREADY	=> tc_axi_arready,
		AxiBusOut.RDATA		=> tc_axi_rdata,
		AxiBusOut.RRESP		=> tc_axi_rresp,
		AxiBusOut.RVALID	=> tc_axi_rvalid,
		AxiBusOut.intr		=> tc_axi_intr,
        
		ClockBus			=> ClockBus_intl,

        WS_master_ctrl      => WS_masterctrl_in,
		CtrlBus_OxMS			=> CtrlBusOut_intl,
		CtrlBus_IxMS			=> CtrlBusIn_intl
	);

--       WS_masterctrl_out <= CtrlBusOut_intl.WindowStorage; 


	TC_SerialRegCtrl_inst : TARGETX_DAC_CONTROL
		generic map(
		REGISTER_WIDTH =>19
		)
		Port map(
		CLK 		=> ClockBus_intl.SCLK,
		PCLK_LATCH_PERIOD 		=> x"0005",	--With SCLK (brut) 50 MHz, 20ns * 5 = 100ns High period
		PCLK_TRANSITION_PERIOD 	=> x"0003",
		LOAD_PERIOD 	=> (others => '0'),
		LATCH_PERIOD 	=> (others => '0'),
		-- UPDATE 			=> CtrlBusOut_intl.WRITEREG,
		-- REG_DATA_IN 	=> CtrlBusOut_intl.TC_BUS,
		-- REG_DATA_OUT 	=> CtrlBusIn_intl.TC_BUS,
		-- busy		 	=> CtrlBusIn_intl.BUSY,
		CtrlBus_IxSL			=> CtrlBusOut_intl,
		--CtrlBus_OxSL			=> CtrlBusIn_intl,
		TC_BUS				=> CtrlBusIn_intl.TC_BUS,
		BUSY				=> CtrlBusIn_intl.BUSY,

		SIN 	=> SIN,
		SCLK 	=> SCLK,
		PCLK 	=> PCLK,
		SHOUT	=> SHOUT
	);

	TC_WR_ADDRESS : WR_ADDRESS
--		generic map(
--			NBRWINDOWS => 256
--		)
		port map(
			--nrst 		=> CtrlBusOut_intl.SW_nRST,
			ClockBus	=> 	ClockBus_intl,
			Timecounter	=> timecounter_intl,
			TimeStamp => TimeStamp_intl,
			--GrayTimeCnt => GrayTimeCnt_intl,

			trigger		=> trigger_intl,

			WR_R		=> WR_RS_S_intl,
			WR_C	=> WR_CS_S_intl,

			CtrlBus_IxSL		=> CtrlBusOut_intl,
			--CtrlBus_OxSL		=> CtrlBusIn_intl,
			RBNbrOfPackets	=> CtrlBusIn_intl.RBNbrOfPackets,

			RDAD_ReadEn  => RDAD_ReadEn_intl,
			RDAD_DataOut => RDAD_DataOut_intl,
			RDAD_Empty	=> RDAD_Empty_intl,

			-- FIFO <-> AXI Connection
			AXI_ReadEn				=> FIFO_ReadEn_intl,
			AXI_Time_DataOut		=> FIFO_Time_intl,
			AXI_WdoAddr_DataOut		=> FIFO_WdoAddr_intl,
			AXI_TrigInfo_DataOut	=> FIFO_TrigInfo_intl,
			AXI_Spare_DataOut 		=> FIFO_Spare_intl,
			AXI_Empty				=> FIFO_Empty_intl,

			-- FIFO IN for Digiting
			DIG_Full	=> DIG_Full_intl,
			DIG_DataIn	=> DIG_DataIn_intl,
			DIG_WriteEn	=> DIG_WriteEn_intl,
			
	  -- Signal for trigger the acquisition for debugging
            address_is_zero_out => address_is_zero_intl
		);

	TC_RDAD_WL_SS :	 TARGETC_RDAD_WL_SMPL
	Port map(
		--RST 	=> CtrlBusOut_intl.SW_nRST,

		DISCH_PERIOD	=> x"0064",
		INCR_WAIT_PERIOD => x"0032",

		ClockBus	=> ClockBus_intl,
		--TimeCounter	=> timecounter_intl,
		RDADCLK		=> RDADCLK,
		RDAD_SIN		=> RDAD_SIN,
		RDAD_DIR		=> RDAD_DIR,

		-- Fifo from storage
		RDAD_ReadEn	=> RDAD_ReadEn_intl,
		RDAD_DataOut => RDAD_DataOut_intl,
		RDAD_Empty	=> RDAD_Empty_intl,

		-- FIFO IN for Digiting
		DIG_Full	=> DIG_Full_intl,
		DIG_DataIn		=> DIG_DataIn_intl,
		DIG_WriteEn	=> DIG_WriteEn_intl,

		RAMP			=> RAMP,
		GCC_RESET		=> GCC_RESET,

		HSCLK		=> HSCLK_dif,

		-- Data Readout
		D_Out 		=> D_Out,
		SS_INCR	=> SS_INCR,
		SS_RESET => SS_RESET,

		CtrlBus_IxSL		=> CtrlBusOut_intl,
		--CtrlBus_OxSL		=> CtrlBusIn_intl,
		WindowBusy	=> CtrlBusIn_intl.WindowBusy,
		RAMP_CNT	=> CtrlBusIn_intl.RAMP_CNT,
		DO_BUS		=> CtrlBusIn_intl.DO_BUS,
		SSvalid		=> CtrlBusIn_intl.SSvalid,
		--Channels
		CH0 	=> CH0_intl,
		CH1 	=> CH1_intl,
		CH2 	=> CH2_intl,
		CH3 	=> CH3_intl,

		CH4 	=> CH4_intl,
		CH5 	=> CH5_intl,
		CH6 	=> CH6_intl,
		CH7 	=> CH7_intl,

		CH8 	=> CH8_intl,
		CH9 	=> CH9_intl,
		CH10 	=> CH10_intl,
		CH11 	=> CH11_intl,

		CH12 	=> CH12_intl,
		CH13 	=> CH13_intl,
		CH14 	=> CH14_intl,
		CH15 	=> CH15_intl,

		Handshake_IxSEND	=> Handshake_IxSEND_intl,
		Handshake_Data 		=> Handshake_SS_FIFO,
		Handshake_OxSEND	=> Handshake_OxSEND_intl
	);

	FIFOMANAGER : FifoManagerV4
		generic map(
			C_M_AXIS_TDATA_WIDTH =>  32
		)
		port map(
			CtrlBus_IxSL		=> CtrlBusOut_intl,
			--CtrlBus_OxSL		=> CtrlBusIn_intl,
			FIFOBusy => 	CtrlBusIn_intl.FIFOBusy,

			ClockBus	 => ClockBus_intl,

			--Request and Acknowledge - READOUT
			Handshake_IxRECV=> Handshake_OxSEND_intl,
			Handshake_Data 		=> Handshake_SS_FIFO,
			Handshake_OxRECV=> Handshake_IxSEND_intl,

			--Header Information from FIFO
			FIFO_ReadEn			=> FIFO_ReadEn_intl,
			FIFO_Time			=> FIFO_Time_intl,
			FIFO_WdoAddr		=> FIFO_WdoAddr_intl,
			FIFO_TrigInfo		=> FIFO_TrigInfo_intl,
			FIFO_Spare	 		=> FIFO_Spare_intl,
			FIFO_Empty			=> FIFO_Empty_intl,

			--Channels
			CH0 	=> CH0_intl,
			CH1 	=> CH1_intl,
			CH2 	=> CH2_intl,
			CH3 	=> CH3_intl,

			CH4 	=> CH4_intl,
			CH5 	=> CH5_intl,
			CH6 	=> CH6_intl,
			CH7 	=> CH7_intl,

			CH8 	=> CH8_intl,
			CH9 	=> CH9_intl,
			CH10 	=> CH10_intl,
			CH11 	=> CH11_intl,

			CH12 	=> CH12_intl,
			CH13 	=> CH13_intl,
			CH14 	=> CH14_intl,
			CH15 	=> CH15_intl,


			-- DATA TO STREAM
			FIFOvalid	=> FIFOValid,
			FIFOdata	=> FIFOdata,
			StreamReady	=> StreamReady
		);

	SAMPLESEL_ANY <= CtrlBusOut_intl.SmplSl_Any;
--	REGCLR <= CtrlBusOut_intl.REGCLR;

	WR_RS_S0	<= WR_RS_S_intl(0);
	WR_RS_S1	<= WR_RS_S_intl(1);

	WR_CS_S0	<= WR_CS_S_intl(0);
	WR_CS_S1	<= WR_CS_S_intl(1);
	WR_CS_S2	<= WR_CS_S_intl(2);
	WR_CS_S3	<= WR_CS_S_intl(3);
	WR_CS_S4	<= WR_CS_S_intl(4);
	WR_CS_S5	<= WR_CS_S_intl(5);

	SS_LD_SIN <= '0';
	SS_LD_DIR <= '0';



	CtrlBusIn_intl.Cnt_AXIS <= Cnt_AXIS_DATA;

	cnt_clr_intl <= CtrlBusOut_intl.WindowStorage;
	
SyncBitCNT_CLR: SyncBit
       generic map (
          SYNC_STAGES_G  => 2,
          CLK_POL_G      => '1',
          RST_POL_G      => '1',
          INIT_STATE_G   => '0',
          GATE_DELAY_G   => 1 ns
       )
       
       port map ( 
          -- Clock and reset
          clk  => tc_axi_aclk,
          rst   => tc_axi_aresetn,
          -- Incoming bit, asynchronous
          asyncBit =>  cnt_clr_intl,
          -- Outgoing bit, synced to clk
          syncBit   => CNT_CLR
       );     

    
    
    
	--NbrWindow	<= CtrlBusOut_intl.NBRWINDOW;
	SW_nRST <= CtrlBusOut_intl.SW_nRST;

	-- Interrupt Interface
	SSVALID_INTR <= CtrlBusIn_intl.SSVALID when CtrlBusOut_intl.SAMPLEMODE = '0' else '0';

	-- Timing Buffer
	IBUFDS_MonTiming : IBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		I	=> MONTIMING_P,
		IB	=> MONTIMING_N,

		O	=> MONTIMING_s
	);
-- MONTIMING INVERTED ON THE TARGETC, changed in firmware on 08/15/2019
    MONTIMING_inverted <= not MONTIMING_s;


	-- Trigger signal to RoundBuffer
	nTrigA <= not TrigA;
	nTrigB <= not TrigB;	-- Signal are inverted Pulse is negative and not positiv
	nTrigC <= not TrigC;
	nTrigD <= not TrigD;

	--Trigger_intl <= nTrigD & nTrigC & nTrigB & nTrigA;
	Trigger_intl <= TrigD & TrigC & TrigB & TrigA;  --FOR POSITIVE PULSES

	TestStream <= CtrlBusOut_intl.TestStream;



	
--ClockBus_intl.SSTIN <= SSTIN;



	OBUFDF_HSCLK : OBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		O	=> HSCLK_P,
		OB	=> HSCLK_N,

		I	=> HSCLK_dif
	);
	


end arch_imp;
