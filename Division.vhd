library	IEEE;
use IEEE.std_logic_1164.all;

entity Division is
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	STA : in  std_logic;
	X   : in  std_logic_vector(59 downto 0);
	Y   : in  std_logic_vector(29 downto 0);
	EOA : out std_logic;
	R   : out std_logic_vector(29 downto 0)
	);
end Division;

architecture Iterativa of Division is

signal G, E : std_logic;
signal S    : std_logic_vector(29 downto 0);
signal A    : std_logic_vector(59 downto 0);

component Comparador
	port(
	A : in  std_logic_vector(59 downto 0);
	X : in  std_logic_vector(59 downto 0);
	G : out std_logic;
	E : out std_logic
	);
end component;

component SAR
	port(
	RST : in  std_logic;
	CLK : in  std_logic;		 
	G   : in  std_logic;
	E   : in  std_logic;
	STA : in  std_logic;
	EOA : out std_logic;
	S   : out std_logic_vector(29 downto 0);
	R   : out std_logic_vector(29 downto 0)
	);
end component;

component Multiplicador_nm_uu
	generic(
	n : integer := 29;
	m : integer := 29
	);
	port(
	X : in  std_logic_vector(n-1   downto 0);
	A : in  std_logic_vector(m-1   downto 0);
	R : out std_logic_vector(m+n-1 downto 0)
	);
end component;

begin
	
	Modulo_1: Comparador port map(A,X,G,E);
	Modulo_2: SAR        port map(RST,CLK,G,E,STA,EOA,S,R);
	
	Modulo_3: Multiplicador_nm_uu generic map(30,30) port map(S,Y,A);
	
end Iterativa;