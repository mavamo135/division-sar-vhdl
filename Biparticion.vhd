library	IEEE;
use IEEE.std_logic_1164.all;

entity Biparticion is
	port(
	G   : in  std_logic;
	E   : in  std_logic;
	K   : in  std_logic_vector(29 downto 0);
	A   : in  std_logic_vector(29 downto 0);
	P   : out std_logic_vector(29 downto 0)
	);
end Biparticion;

architecture Sucesivas of Biparticion is

signal KS, GV, EV : std_logic_vector(29 downto 0);

begin
	
	KS <= '0' & K(29 downto 1);
	GV <= (others => G);
	EV <= (others => E);
	
	P  <= ((KS AND NOT(EV)) OR A) AND (NOT(K) OR NOT(GV) OR EV);
	
end Sucesivas;