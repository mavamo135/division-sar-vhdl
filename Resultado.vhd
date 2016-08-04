library	IEEE;
use IEEE.std_logic_1164.all;

entity Resultado is
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	LDR : in  std_logic;
	P   : in  std_logic_vector(29 downto 0);
	R   : out std_logic_vector(29 downto 0)
	);
end Resultado;

architecture Registro of Resultado is

signal Qn, Qp : std_logic_vector(29 downto 0);

begin
	
	Combinacional: process(Qp,LDR,P)
	begin
		if (LDR='0') then
			Qn <= Qp;
		else
			Qn <= P;
		end if;
		R <= Qp;
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