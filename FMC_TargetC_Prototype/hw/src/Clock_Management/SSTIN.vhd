library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;

library unisim;
use unisim.vcomponents.all;

entity sstin_signal is

	port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK


		Timecounter:	out std_logic_vector(63 downto 0);
--		Timestamp:		out T_timestamp;
        graycnt:      out  std_logic_vector(59 downto 0);
        samplecnt:     out std_logic_vector(2 downto 0);
        WL_CLK_P:       out std_logic;
		WL_CLK_N:       out std_logic;
		SSTIN:            out std_logic



	);
end sstin_signal;

architecture arch_imp of sstin_signal is

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
	
	
	
	
	-- --------------------------------------------------------------------------------
	-- Signal Declaration

	signal SSTIN_intl:		std_logic;
	signal Timecounter_intl : std_logic_vector(63 downto 0);
	signal GrayCounter_intl : std_logic_vector(59 downto 0);
	attribute mark_debug : string;
    attribute mark_debug of SSTIN_intl: signal is "true";
--    attribute mark_debug of nrst: signal is "true";
--    attribute mark_debug of clk1: signal is "true";
--	attribute mark_debug of Timecounter_intl: signal is "true";


begin
	

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
	graycnt <= GrayCounter_intl;
	samplecnt <= Timecounter_intl(2 downto 0);

	TimeCounter <= Timecounter_intl;


	SSTIN	<= not Timecounter_intl(2);

	


	OBUFDF_WL_CLK : OBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		O	=> WL_CLK_P,
		OB	=> WL_CLK_N,

		I	=> clk1
	);

	
	

end arch_imp;
