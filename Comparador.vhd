library	IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Comparador is
	port(
	A : in  std_logic_vector(59 downto 0);
	X : in  std_logic_vector(59 downto 0);
	G : out std_logic;
	E : out std_logic
	);
end Comparador;

architecture Aritmetica of Comparador is
begin
	process(A,X)
	begin
		if (A>X) then
			G <= '1';
			E <= '0';
		elsif (A=X) then
			G <= '0';
			E <= '1';
		else
			G <= '0';
			E <= '0';
		end if;
	end process;
end Aritmetica;
