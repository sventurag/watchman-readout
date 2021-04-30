library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;

library unisim;
use unisim.vcomponents.all;

entity TC_ClockManagementV3 is

	port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		clk2:			in 	std_logic;	-- Clock for the TARGETC SCLK
		AXI_Clk:		in	std_logic;


		PLL_LOCKED:		out	std_logic;

		ClockBus:		out T_ClockBus;

		Timecounter:	out std_logic_vector(63 downto 0);
		Timestamp:		out T_timestamp;

		HSCLKdif:		in std_logic;		-- Pin#43 to Pin#44


		WL_CLK_P:		out std_logic;		-- Pin#57
		WL_CLK_N:		out std_logic		-- Pin#58

--		SSTIN_P:		out std_logic;		-- Pin#125
--		SSTIN_N:		out std_logic		-- Pin#126

	);
end TC_ClockManagementV3;

architecture arch_imp of TC_ClockManagementV3 is

	-- --------------------------------------------------------------------------------
	-- Component Declaration

	component counter is
	generic(
		NBITS : integer := 8
	);
	port(
		CLK : in  std_logic;
		RST : in  std_logic;
		Q : out std_logic_vector(NBITS-1 downto 0)
	);
	end component counter;

	component GRAY_ENCODER is
		generic(
			NBITS : integer := 8
		);
		Port (
		GRAY_OUT :	out 	std_logic_vector(NBITS-1 downto 0);
		BIN_IN:		in	std_logic_vector(NBITS-1 downto 0)
		);
	end component GRAY_ENCODER;
	
	
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
	
	
	-- --------------------------------------------------------------------------------
	-- Signal Declaration

	signal locked_WL:	std_logic;
	signal locked_general,locked_general2, locked_general_sync125MHz, locked_general_sync100MHz:	std_logic;
	signal locked_intl, locked_intl125MHz, locked_intl100MHz:	std_logic;
    signal nrst_125MHz: std_logic;
	-- Internal Clock signals (intl)

	signal SCLKraw :		std_logic;
	signal HSCLKraw :		std_logic;
	signal RDAD_CLKraw :	std_logic;
	--signal CLK500MHzraw :	std_logic;
	--signal CLK500MHzraw2 :	std_logic;
	signal CLK100MHzraw :	std_logic;
	signal CLK150MHzraw :	std_logic;
	signal CLK200MHzraw :	std_logic;
	signal CLK125MHzraw :	std_logic;

	signal sstin_bufg : std_logic;
	signal CLK100MHz_bufg :	std_logic;
	signal CLK125MHz_bufg :	std_logic;


	signal SSTIN_intl:		std_logic;
	signal SCLK_intl :		std_logic;
	signal HSCLK_intl :		std_logic;
	signal RDAD_CLK_intl :	std_logic;
--	signal CLK500MHz_intl :	std_logic;
	signal CLK125MHz_intl :	std_logic;
	signal WL_CLK_intl :		std_logic;


	signal WL_CLK_100MHz_bufg : std_logic;
	signal WL_CLK_150MHz_bufg : std_logic;
	signal WL_CLK_200MHz_bufg : std_logic;
	signal WL_CLK_125MHz_bufg : std_logic;
	signal WL_CLK_300MHz_bufg : std_logic;

	signal rst :		std_logic;
	signal Timecounter_intl : std_logic_vector(63 downto 0);
	signal GrayCounter_intl : std_logic_vector(59 downto 0);
	signal clkFbOut_WL, clkFbOut : std_logic;
	signal clkFbIn_WL, clkFbIn : std_logic;
	signal axi_clk_intl:std_logic;
	
	attribute mark_debug : string;
    attribute mark_debug of SSTIN_intl: signal is "true";

	

begin

	rst <= not nrst;

	locked_intl <= 	'1';
	

	TimeCnt_inst : counter
	generic map(
		NBITS => 64
	)
	port map(
		CLK 	=> clk1,
		RST => nrst, 
		Q 	=> Timecounter_intl
	);

	GrayTime :  GRAY_ENCODER
		generic map(
			NBITS => 60
		)
		Port map(
			GRAY_OUT => GrayCounter_intl,
			BIN_IN	=> Timecounter_intl(63 downto 4)
		);

	-- Timestamp
	Timestamp.graycnt <= GrayCounter_intl;
	Timestamp.samplecnt <= Timecounter_intl(2 downto 0);

	TimeCounter <= Timecounter_intl;


	SSTIN_intl	<= not Timecounter_intl(2);

	


	OBUFDF_WL_CLK : OBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		O	=> WL_CLK_P,
		OB	=> WL_CLK_N,

		I	=> clk1
	);

	
	-- CLOCK BUS OUTPUTS
	
    
        ClockBus.SCLK     <= clk1;
        ClockBus.HSCLK    <= clk1;
        ClockBus.WL_CLK    <= clk1;
        ClockBus.RDAD_CLK<= clk1;
        
        ClockBus.CLK125MHz    <= clk1;
        ClockBus.SSTIN    <= SSTIN_intl;
        ClockBus.AXI_CLK <= AXI_CLK;

	
		PLL_LOCKED <= locked_intl; -- signal to use in TARGETC_Control.vhd for registers


end arch_imp;
