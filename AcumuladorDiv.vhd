library	IEEE;
use IEEE.std_logic_1164.all;

entity AcumuladorDiv is
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	LDA : in  std_logic;
	P   : in  std_logic_vector(29 downto 0);
	S   : out std_logic_vector(29 downto 0)
	);
end AcumuladorDiv;

architecture Registro of AcumuladorDiv is

signal Qn, Qp : std_logic_vector(29 downto 0);

begin
	
	Combinacional: process(Qp,LDA,P)
	begin
		if (LDA='0') then
			Qn <= "100000000000000000000000000000";
		else
			Qn <= P;
		end if;
		S <= Qp;
	end process Combinacional;
	
	Secuencial: process(RST,CLK)
	begin
		if (RST='1') then
			Qp <= (others => '0');
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
		end if;
	end process Secuencial;
	
end Registro;