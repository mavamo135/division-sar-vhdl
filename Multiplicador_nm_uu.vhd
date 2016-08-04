library	IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Multiplicador_nm_uu is
	generic(
	n : integer := 29;
	m : integer := 29
	);
	port(
	X : in  std_logic_vector(n-1   downto 0);
	A : in  std_logic_vector(m-1   downto 0);
	R : out std_logic_vector(m+n-1 downto 0)
	);
end Multiplicador_nm_uu;

architecture Aritmetica of Multiplicador_nm_uu is
begin
	process(X,A)
	variable Q : unsigned(n+m-1 downto 0);
	begin
		Q := unsigned(X) * unsigned(A);
		R <= std_logic_vector(Q);
	end process;
end Aritmetica;