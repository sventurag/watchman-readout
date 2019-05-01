--  8-bit address generator
-- A counter generates a 8-bit signal, nextAddress(7 downto 0) for cpuControllerV3
-- each new address must be delivered after a rising edge of a Ctrl signal

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nextAddressCnt is 
	generic(
		NBITS : integer:=8
	);
	port(
		CLK : in  std_logic;
		RST : in  std_logic;  -- next address = 0
		Ctrl : in std_logic;  -- the rising edge of this signal is used as a condition to generate/output the next address
		nextAddress : out std_logic_vector(NBITS-1 downto 0);
	    nextAddressValid: out std_logic
	);

end nextAddressCnt;

architecture archi of nextAddressCnt is  

	signal cnt: std_logic_vector(NBITS-1 downto 0);
	signal reg1: std_logic ;
	signal reg2: std_logic ;
    signal edge_det: std_logic ;

begin

p_edge_detector :  process(clk)
begin
        if rising_edge (clk) then
            reg1 <= Ctrl;
            reg2 <= reg1;
        end if;
   
end process p_edge_detector;    

edge_det <= reg1 and not (reg2);


p_counter:	process (CLK, RST) 
	begin  
		if RST = '0' then
			cnt <= (others => '0');
			nextAddressValid <= '1';
	
		else
			if rising_edge(clk) then  
			    if edge_det = '1' then
					   cnt <= std_logic_vector(unsigned(cnt) + 1);
					   nextAddressValid<= '1';
				end if;
			end if;
		end if;     
	end process p_counter; 

	nextAddress <= cnt;
        
    
end archi;