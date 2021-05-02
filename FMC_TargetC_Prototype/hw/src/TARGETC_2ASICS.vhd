----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2021 10:17:06 AM
-- Design Name: 
-- Module Name: TARGETC_2ASICS - Behavioral
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

--! Use standard Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Custom Library for TARGETC
use work.TARGETC_pkg.all;
--! Custom Library for AXI Lite interface
use work.AXI_Lite_pkg.all;


entity TARGETC_2ASICS is

port (

--- PORTS FOR TARGETC_A
		SW_nRST_A:	out std_logic;
		--! @name Reference Clock
		RefCLK_i1 :		in std_logic;	--! Clock for the TARGETC PLL

		--! @name Ports of Axi Slave Bus Interface TC_AXI
		axi_aclk		: in std_logic;
		axi_aresetn	: in std_logic;
		tcA_axi_awaddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		tcA_axi_awprot	: in std_logic_vector(2 downto 0);
		tcA_axi_awvalid	: in std_logic;
		tcA_axi_awready	: out std_logic;
		tcA_axi_wdata	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		tcA_axi_wstrb	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		tcA_axi_wvalid	: in std_logic;
		tcA_axi_wready	: out std_logic;
		tcA_axi_bresp	: out std_logic_vector(1 downto 0);
		tcA_axi_bvalid	: out std_logic;
		tcA_axi_bready	: in std_logic;
		tcA_axi_araddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		tcA_axi_arprot	: in std_logic_vector(2 downto 0);
		tcA_axi_arvalid	: in std_logic;
		tcA_axi_arready	: out std_logic;
		tcA_axi_rdata	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		tcA_axi_rresp	: out std_logic_vector(1 downto 0);
		tcA_axi_rvalid	: out std_logic;
		tcA_axi_rready	: in std_logic;

		-- TARGET C I/Os
		SIN : 			out	STD_LOGIC;		--! SIN, Serial Input, Pin#35
		SCLK :	 		out	STD_LOGIC;		--! Pin#36
		
		PCLK_A :	 		out	STD_LOGIC;		-- Pin#37
		SHOUT_A:			in 	std_logic;		-- Pin#38

		HSCLK_P_A:		out std_logic;		-- Pin#44
		HSCLK_N_A:		out std_logic;		-- Pin#43

		WR_RS_S0_A:		out	std_logic;		--Pin
		WR_RS_S1_A:		out	std_logic;

      		WL_CLK_P:       out std_logic;
      		WL_CLK_N:       out std_logic;


		WR_CS_S0_A:		out	std_logic;
		WR_CS_S1_A:		out	std_logic;
		WR_CS_S2_A:		out	std_logic;
		WR_CS_S3_A:		out	std_logic;
		WR_CS_S4_A:		out	std_logic;
		WR_CS_S5_A:		out	std_logic;

		GCC_RESET_A:		out	std_logic;		-- Pin#56

		RDAD_CLK_A:		out	std_logic;		-- Pin#61
		RDAD_SIN_A:		out	std_logic;		-- Pin#62
		RDAD_DIR_A:		out	std_logic;		-- Pin#63

		SAMPLESEL_ANY_A:	out	std_logic;		-- Pin#66

		DO_A: 			in 	std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

		SS_INCR_A:		out	std_logic;		-- Pin#79

		DOE_A:			out	std_logic;		-- Pin#80

		DONE_A:			in	std_logic;		-- Pin#94

		SS_RESET_A:		out	std_logic;		-- Pin#95

		REGCLR_A: 		out	std_logic;		-- Pin#99

		--mDOE:			in	std_logic;		-- Pin#100

		SS_LD_SIN_A:		out	std_logic;		-- Pin#103
		SS_LD_DIR_A:		out	std_logic;		-- Pin#104

		RAMP_A:			out	std_logic;		-- Pin#108


        SSTIN :         out std_logic;

		MONTIMING_P_A:	in	std_logic;		-- Pin#118
		MONTIMING_N_A:	in	std_logic;		-- Pin#117

		Cnt_AXIS_DATA_A:	in	std_logic_vector(9 downto 0);
		CNT_CLR_A:		out std_logic;

		-- DATA TO STREAM
		TestStream_A : 		out std_logic;
		FIFOvalid_A:			out std_logic;
		FIFOdata_A:			out std_logic_vector(31 downto 0);
		StreamReady_A:		in	std_logic;

		-- Trigger
		TrigA_A :			in std_logic;
		TrigB_A :			in std_logic;
		TrigC_A :			in std_logic;
		TrigD_A :			in std_logic;

        -- window storage master control
        WS_masterctrl_in_A :  in std_logic;
        WS_masterctrl_out_A : out std_logic;
        
		-- Interrupt SIGNALS
		SSVALID_INTR_A:	out	std_logic;

-------------------------------------------------------------------
-------------------------------------------------------------------


--- PORTS FOR TARGETC_B
		SW_nRST_B:	out std_logic;
		--! @name Reference Clock
--		RefCLK_i1_B :		in std_logic;	--! Clock for the TARGETC PLL

		--! @name Ports of Axi Slave Bus Interface TC_AXI
		tcB_axi_aclk		: in std_logic;
		tcB_axi_aresetn	: in std_logic;
		tcB_axi_awaddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		tcB_axi_awprot	: in std_logic_vector(2 downto 0);
		tcB_axi_awvalid	: in std_logic;
		tcB_axi_awready	: out std_logic;
		tcB_axi_wdata	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		tcB_axi_wstrb	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		tcB_axi_wvalid : in std_logic;
		tcB_axi_wready	: out std_logic;
		tcB_axi_bresp	: out std_logic_vector(1 downto 0);
		tcB_axi_bvalid : out std_logic;
		tcB_axi_bready	: in std_logic;
		tcB_axi_araddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		tcB_axi_arprot	: in std_logic_vector(2 downto 0);
		tcB_axi_arvalid	: in std_logic;
		tcB_axi_arready	: out std_logic;
		tcB_axi_rdata	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		tcB_axi_rresp	: out std_logic_vector(1 downto 0);
		tcB_axi_rvalid	: out std_logic;
		tcB_axi_rready: in std_logic;

		-- TARGET C I/Os
--		SIN_B : 			out	STD_LOGIC;		--! SIN, Serial Input, Pin#35
--		SCLK_B:	 		out	STD_LOGIC;		--! Pin#36
		PCLK_B :	 		out	STD_LOGIC;		-- Pin#37
		SHOUT_B:			in 	std_logic;		-- Pin#38

		HSCLK_P_B:		out std_logic;		-- Pin#44
		HSCLK_N_B:		out std_logic;		-- Pin#43

		WR_RS_S0_B:		out	std_logic;		--Pin
		WR_RS_S1_B:		out	std_logic;

		WR_CS_S0_B:		out	std_logic;
		WR_CS_S1_B:		out	std_logic;
		WR_CS_S2_B:		out	std_logic;
		WR_CS_S3_B:		out	std_logic;
		WR_CS_S4_B:		out	std_logic;
		WR_CS_S5_B:		out	std_logic;

		GCC_RESET_B:		out	std_logic;		-- Pin#56

		RDAD_CLK_B:		out	std_logic;		-- Pin#61
		RDAD_SIN_B:		out	std_logic;		-- Pin#62
		RDAD_DIR_B:		out	std_logic;		-- Pin#63

		SAMPLESEL_ANY_B:	out	std_logic;		-- Pin#66

		DO_B: 			in 	std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

		SS_INCR_B:		out	std_logic;		-- Pin#79

		DOE_B:			out	std_logic;		-- Pin#80

		DONE_B:			in	std_logic;		-- Pin#94

		SS_RESET_B:		out	std_logic;		-- Pin#95

		REGCLR_B: 		out	std_logic;		-- Pin#99

		--mDOE:			in	std_logic;		-- Pin#100

		SS_LD_SIN_B:		out	std_logic;		-- Pin#103
		SS_LD_DIR_B:		out	std_logic;		-- Pin#104

		RAMP_B:			out	std_logic;		-- Pin#108


		MONTIMING_P_B:	in	std_logic;		-- Pin#118
		MONTIMING_N_B:	in	std_logic;		-- Pin#117

		Cnt_AXIS_DATA_B:	in	std_logic_vector(9 downto 0);
		CNT_CLR_B:		out std_logic;

		-- DATA TO STREAM
		TestStream_B : 		out std_logic;
		FIFOvalid_B:			out std_logic;
		FIFOdata_B:			out std_logic_vector(31 downto 0);
		StreamReady_B:		in	std_logic;

		-- Trigger
		TrigA_B :			in std_logic;
		TrigB_B :			in std_logic;
		TrigC_B :			in std_logic;
		TrigD_B :			in std_logic;

        -- window storage master control
        WS_masterctrl_in_B :  in std_logic;
        WS_masterctrl_out_B : out std_logic;
        
		-- Interrupt SIGNALS
		SSVALID_INTR_B:	out	std_logic

 





);


end TARGETC_2ASICS;

architecture Behavioral of TARGETC_2ASICS is

component TC_ClockManagementV3 is
port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		AXI_Clk:		in	std_logic;


		PLL_LOCKED:		out	std_logic;

		ClockBus:		out T_ClockBus;

		Timecounter:	out std_logic_vector(63 downto 0);
		Timestamp:		out T_timestamp;


		WL_CLK_P:		out std_logic;		-- Pin#57
		WL_CLK_N:		out std_logic		-- Pin#58


	);
	end component;



component TARGETC_System is
port (


		SW_nRST:	out std_logic;
		--! @name Reference Clock
		RefCLK_i1 :		in std_logic;	--! Clock for the TARGETC PLL

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

		RDAD_CLK:		out	std_logic;		-- Pin#61
		RDAD_SIN:		out	std_logic;		-- Pin#62
		RDAD_DIR:		out	std_logic;		-- Pin#63

		SAMPLESEL_ANY:	out	std_logic;		-- Pin#66

		DO: 			in 	std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

		SS_INCR:		out	std_logic;		-- Pin#79

		DOE:			out	std_logic;		-- Pin#80

		DONE:			in	std_logic;		-- Pin#94

		SS_RESET:		out	std_logic;		-- Pin#95

		REGCLR: 		out	std_logic;		-- Pin#99

		--mDOE:			in	std_logic;		-- Pin#100

		SS_LD_SIN:		out	std_logic;		-- Pin#103
		SS_LD_DIR:		out	std_logic;		-- Pin#104

		RAMP:			out	std_logic;		-- Pin#108

--		SSTIN_P:		out std_logic;		-- Pin#125
--		SSTIN_N:		out std_logic;		-- Pin#126
        SSTIN :         out std_logic;

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
        WS_masterctrl_out : out std_logic;
        
		-- Interrupt SIGNALS
		SSVALID_INTR:	out	std_logic;

     -- FROM CLK MANAGEMENT

	    PLL_LOCKED:		in	std_logic;

		ClockBus:		in T_ClockBus;

		Timecounter:	in std_logic_vector(63 downto 0);
		Timestamp:		in T_timestamp



		);
	end component TARGETC_System;

	signal PLL_locked_intl : std_logic;
    signal ClockBus_intl: T_ClockBus;
	signal timeCounter_intl : std_logic_vector(63 downto 0);
	signal timeStamp_intl : T_timestamp;




begin


TC_Clock: TC_ClockManagementV3 
Port Map (

		nrst      =>         axi_aresetn,
		clk1      =>		    RefCLK_i1,
		AXI_Clk   =>          axi_aclk,


		PLL_LOCKED=>		PLL_locked_intl,

		ClockBus=>		 ClockBus_Intl,

		Timecounter   =>      timeCounter_intl,
		Timestamp     =>      timeStamp_Intl,


		WL_CLK_P=>            WL_CLK_P,		
		WL_CLK_N =>		WL_CLK_N


	);


TC_TARGETC_A: TARGETC_System

port Map (


		SW_nRST    => SW_nRST_A,
		--! @name Reference Clock
		RefCLK_i1  =>     RefCLK_i1 ,	--! Clock for the TARGETC PLL

	    	tc_axi_aclk   	 => axi_aclk,      
		tc_axi_aresetn   => axi_aresetn,
		tc_axi_awaddr    => tcA_axi_awaddr,
		tc_axi_awprot    =>tcA_axi_awprot,  
		tc_axi_awvalid   =>tcA_axi_awvalid,   
		tc_axi_wdata     =>tcA_axi_wdata,   
		tc_axi_wstrb     =>tcA_axi_wstrb,   
		tc_axi_wvalid    =>tcA_axi_wvalid,  
		tc_axi_bready    =>tcA_axi_bready, 
		tc_axi_araddr    =>tcA_axi_araddr,  
		tc_axi_arprot    =>tcA_axi_arprot,  
		tc_axi_arvalid   =>tcA_axi_arvalid,   
		tc_axi_rready    =>tcA_axi_rready , 
                                                       
		tc_axi_awready   =>tcA_axi_awready,   
		tc_axi_wready    =>tcA_axi_wready,  
		tc_axi_bresp     =>tcA_axi_bresp,   
		tc_axi_bvalid    =>tcA_axi_bvalid,  
		tc_axi_arready   =>tcA_axi_arready,   
		tc_axi_rdata     =>tcA_axi_rdata,   
		tc_axi_rresp     =>tcA_axi_rresp,   
		tc_axi_rvalid    =>tcA_axi_rvalid,  
--		tc_axi_intr      =>tcA_axi_intr,    
        
		-- TARGET C I/Os
		SIN  		        =>  SIN,	
		SCLK 	 		=>  SCLK,	
		PCLK 	 		=>  PCLK_A,
		SHOUT			=>  SHOUT_A,

		HSCLK_P			=>      HSCLK_P_A,
		HSCLK_N			=>      HSCLK_N_A,

		WR_RS_S0		=> 	WR_RS_S0_A,
		WR_RS_S1		=>   	WR_RS_S1_A,

		WR_CS_S0		=> 	WR_CS_S0_A, 
		WR_CS_S1 		=>	WR_CS_S1_A,
		WR_CS_S2 		=>	WR_CS_S2_A,
		WR_CS_S3 		=>	WR_CS_S3_A,
		WR_CS_S4 		=>	WR_CS_S4_A,
		WR_CS_S5 		=>	WR_CS_S5_A,

		GCC_RESET		=>   	GCC_RESET_A,	

		RDAD_CLK 		=>	RDAD_CLK_A,
		RDAD_SIN 		=>	RDAD_SIN_A,
		RDAD_DIR 		=>	RDAD_DIR_A,

		SAMPLESEL_ANY	 	=>	SAMPLESEL_ANY_A,

		DO 	                => 	DO_A,

		SS_INCR		 	=>  	SS_INCR_A, 

		DOE		 	=> 	DOE_A,

		DONE		 	=> 	DONE_A,

		SS_RESET	 	=> 	SS_RESET_A,

		REGCLR		 	=>      REGCLR_A,

		--mDOE:		=>	

		SS_LD_SIN	 	=> 	SS_LD_SIN_A,
		SS_LD_DIR	 	=> 	SS_LD_DIR_A,

		RAMP		 	=> 	RAMP_A,

        	SSTIN 			=> 	SSTIN,

		MONTIMING_P		=> 	MONTIMING_P_A,
		MONTIMING_N		=> 	MONTIMING_N_A,

		Cnt_AXIS_DATA		=> 	Cnt_AXIS_DATA_A,
		CNT_CLR			=>      CNT_CLR_A,

		-- DATA TO STREA=>M
		TestStream   		=>	TestStream_A,
		FIFOvalid    	  	=>	FIFOvalid_A,
		FIFOdata     	  	=>	FIFOdata_A,
		StreamReady  	  	  =>   StreamReady_A,

		-- Trigger
		TrigA 	     	  	  =>	TrigA_A,
		TrigB 	     	  	  =>	TrigB_A,
		TrigC 	     	  	  =>	TrigC_A,
		TrigD 	     	  	  =>	TrigD_A,

        -- window storage ma 	st	er=> control
       		 WS_masterctrl_in     	  	  =>    WS_masterctrl_in_A,
       		 WS_masterctrl_out    	  	  =>    WS_masterctrl_out_A,
        
		-- Interrupt 	 SIG=>NALS
		SSVALID_INTR 		    =>   SSVALID_INTR_A,

     -- FROM CLK MANAGEMENT

	    	PLL_LOCKED		 	=>     PLL_locked_intl,

		ClockBus	 	=>     ClockBus_Intl,

		Timecounter 		    =>   timeCounter_intl,
		Timestamp			=> timeStamp_intl

		);


TC_TARGETC_B: TARGETC_System

port Map (


		SW_nRST    => SW_nRST_B,
		--! @name Reference Clock
		RefCLK_i1  =>     RefCLK_i1 ,	--! Clock for the TARGETC PLL

	    	tc_axi_aclk   	 => axi_aclk,      
		tc_axi_aresetn   => axi_aresetn,
		tc_axi_awaddr    => tcB_axi_awaddr,
		tc_axi_awprot    =>tcB_axi_awprot,  
		tc_axi_awvalid   =>tcB_axi_awvalid,   
		tc_axi_wdata     =>tcB_axi_wdata,   
		tc_axi_wstrb     =>tcB_axi_wstrb,   
		tc_axi_wvalid    =>tcB_axi_wvalid,  
		tc_axi_bready    =>tcB_axi_bready, 
		tc_axi_araddr    =>tcB_axi_araddr,  
		tc_axi_arprot    =>tcB_axi_arprot,  
		tc_axi_arvalid   =>tcB_axi_arvalid,   
		tc_axi_rready    =>tcB_axi_rready , 
                                                       
		tc_axi_awready   =>tcB_axi_awready,   
		tc_axi_wready    =>tcB_axi_wready,  
		tc_axi_bresp     =>tcB_axi_bresp,   
		tc_axi_bvalid    =>tcB_axi_bvalid,  
		tc_axi_arready   =>tcB_axi_arready,   
		tc_axi_rdata     =>tcB_axi_rdata,   
		tc_axi_rresp     =>tcB_axi_rresp,   
		tc_axi_rvalid    =>tcB_axi_rvalid,  
--		tc_axi_intr      =>tcA_axi_intr,    
        
		-- TARGET C I/Os
--		SIN  		        =>  SIN,	
--		SCLK 	 		=>  SCLK,	
		PCLK 	 		=>  PCLK_B,
		SHOUT			=>  SHOUT_B,

		HSCLK_P			=>      HSCLK_P_B,
		HSCLK_N			=>      HSCLK_N_B,

		WR_RS_S0		=> 	WR_RS_S0_B,
		WR_RS_S1		=>   	WR_RS_S1_B,

		WR_CS_S0		=> 	WR_CS_S0_B, 
		WR_CS_S1 		=>	WR_CS_S1_B,
		WR_CS_S2 		=>	WR_CS_S2_B,
		WR_CS_S3 		=>	WR_CS_S3_B,
		WR_CS_S4 		=>	WR_CS_S4_B,
		WR_CS_S5 		=>	WR_CS_S5_B,

		GCC_RESET		=>   	GCC_RESET_B,	

		RDAD_CLK 		=>	RDAD_CLK_B,
		RDAD_SIN 		=>	RDAD_SIN_B,
		RDAD_DIR 		=>	RDAD_DIR_B,

		SAMPLESEL_ANY	 	=>	SAMPLESEL_ANY_B,

		DO 	                => 	DO_B,

		SS_INCR		 	=>  	SS_INCR_B, 

		DOE		 	=> 	DOE_B,

		DONE		 	=> 	DONE_B,

		SS_RESET	 	=> 	SS_RESET_B,

		REGCLR		 	=>      REGCLR_B,

		--mDOE:		=>	

		SS_LD_SIN	 	=> 	SS_LD_SIN_B,
		SS_LD_DIR	 	=> 	SS_LD_DIR_B,

		RAMP		 	=> 	RAMP_B,

      --  	SSTIN 			=> 	,

		MONTIMING_P		=> 	MONTIMING_P_B,
		MONTIMING_N		=> 	MONTIMING_N_B,

		Cnt_AXIS_DATA		=> 	Cnt_AXIS_DATA_B,
		CNT_CLR			=>      CNT_CLR_B,

		-- DATA TO STREA=>M
		TestStream   		=>	TestStream_B,
		FIFOvalid    	  	=>	FIFOvalid_B,
		FIFOdata     	  	=>	FIFOdata_B,
		StreamReady  	  	  =>   StreamReady_B,

		-- Trigger
		TrigA 	     	  	  =>	TrigA_B,
		TrigB 	     	  	  =>	TrigB_B,
		TrigC 	     	  	  =>	TrigC_B,
		TrigD 	     	  	  =>	TrigD_B,

        -- window storage ma 	st	er=> control
       		 WS_masterctrl_in     	  	  =>    WS_masterctrl_in_B,
       		 WS_masterctrl_out    	  	  =>    WS_masterctrl_out_B,
        
		-- Interrupt 	 SIG=>NALS
		SSVALID_INTR 		    =>   SSVALID_INTR_B,

     -- FROM CLK MANAGEMENT

	    	PLL_LOCKED		 	=>     PLL_locked_intl,

		ClockBus	 	=>     ClockBus_Intl,

		Timecounter 		    =>   timeCounter_intl,
		Timestamp			=> timeStamp_intl

		);





end Behavioral;
