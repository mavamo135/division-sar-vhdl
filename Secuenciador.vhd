library	IEEE;
use IEEE.std_logic_1164.all;

entity Secuenciador is
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	OPS : in  std_logic;
	K   : out std_logic_vector(29 downto 0);
	Z   : out std_logic
	);
end Secuenciador;

architecture Registro of Secuenciador is

signal Qn, Qp : std_logic_vector(29 downto 0);

begin
	
	Combinacional: process(Qp,OPS)
	begin
		if (OPS='0') then
			Qn <= "100000000000000000000000000000";
		else
			Qn <= '0' & Qp(29 downto 1);
		end if;
		K <= Qp;
		Z <= Qp(0);
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