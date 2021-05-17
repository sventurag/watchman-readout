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
		AXI_Clk:		in	std_logic;


		PLL_LOCKED:		out	std_logic;

		ClockBus:		out T_ClockBus;

		Timecounter:	in std_logic_vector(63 downto 0);
		Timestamp:		out T_timestamp;
		graycnt:        in std_logic_vector(59 downto 0);
		samplecnt:      in std_logic_vector(2 downto 0);

		SSTIN:            in std_logic



	);
end TC_ClockManagementV3;

architecture arch_imp of TC_ClockManagementV3 is

	-- --------------------------------------------------------------------------------
	-- Component Declaration

--	component counter is
--	generic(
--		NBITS : integer := 8
--	);
--	port(
--		CLK : in  std_logic;
--		RST : in  std_logic;
--		Q : out std_logic_vector(NBITS-1 downto 0)
--	);
--	end component counter;

--	component GRAY_ENCODER is
--		generic(
--			NBITS : integer := 8
--		);
--		Port (
--		GRAY_OUT :	out 	std_logic_vector(NBITS-1 downto 0);
--		BIN_IN:		in	std_logic_vector(NBITS-1 downto 0)
--		);
--	end component GRAY_ENCODER;
	
	
	
	
	-- --------------------------------------------------------------------------------
	-- Signal Declaration

	signal locked_intl :	std_logic;
	signal SSTIN_intl:		std_logic;
	signal Timecounter_intl : std_logic_vector(63 downto 0);
	signal GrayCounter_intl : std_logic_vector(59 downto 0);
	attribute mark_debug : string;
    attribute mark_debug of SSTIN_intl: signal is "true";

	

begin

--	rst <= not nrst;

	locked_intl <= 	'1';
	

--	TimeCnt_inst : counter
--	generic map(
--		NBITS => 64
--	)
--	port map(
--		CLK 	=> clk1,
--		RST => nrst, 
--		Q 	=> Timecounter_intl
--	);

--	GrayTime :  GRAY_ENCODER
--		generic map(
--			NBITS => 60
--		)
--		Port map(
--			GRAY_OUT => GrayCounter_intl,
--			BIN_IN	=> Timecounter_intl(63 downto 4)
--		);

--	-- Timestamp
	Timestamp.graycnt <= graycnt;
	Timestamp.samplecnt <= samplecnt;

--	TimeCounter <= Timecounter_intl;


--	SSTIN_intl	<= not Timecounter_intl(2);

	


--	OBUFDF_WL_CLK : OBUFDS
--	generic map(
--		IOSTANDARD  => "LVDS_25"
--	)
--	port map(
--		O	=> WL_CLK_P,
--		OB	=> WL_CLK_N,

--		I	=> clk1
--	);

	
	-- CLOCK BUS OUTPUTS
	
    
        ClockBus.SCLK     <= clk1;
        ClockBus.HSCLK    <= clk1;
        ClockBus.WL_CLK    <= clk1;
        ClockBus.RDAD_CLK<= clk1;
        
        ClockBus.CLK125MHz    <= clk1;
        ClockBus.SSTIN    <= SSTIN;
        ClockBus.AXI_CLK <= AXI_CLK;

	
		PLL_LOCKED <= locked_intl; -- signal to use in TARGETC_Control.vhd for registers


end arch_imp;
