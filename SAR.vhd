library	IEEE;
use IEEE.std_logic_1164.all;

entity SAR is
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
end SAR;

architecture Aproximacion of SAR is

signal LDA, LDR, OPS : std_logic;
signal K, P, A       : std_logic_vector(29 downto 0);
signal Z             : std_logic;

component FSM_SAR
	port(
	RST : in  std_logic;
	CLK : in  std_logic;		 
	STA : in  std_logic;
	Z   : in  std_logic;
	LDA : out std_logic;
	LDR : out std_logic;
	OPS : out std_logic;
	EOA : out std_logic
	);
end component;

component Secuenciador
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	OPS : in  std_logic;
	K   : out std_logic_vector(29 downto 0);
	Z   : out std_logic
	);
end component;

component Biparticion
	port(
	G   : in  std_logic;
	E   : in  std_logic;
	K   : in  std_logic_vector(29 downto 0);
	A   : in  std_logic_vector(29 downto 0);
	P   : out std_logic_vector(29 downto 0)
	);
end component;

component AcumuladorDiv
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	LDA : in  std_logic;
	P   : in  std_logic_vector(29 downto 0);
	S   : out std_logic_vector(29 downto 0)
	);
end component;

component Resultado
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	LDR : in  std_logic;
	P   : in  std_logic_vector(29 downto 0);
	R   : out std_logic_vector(29 downto 0)
	);
end component;

begin
	
	Modulo_1: FSM_SAR      port map(RST,CLK,STA,Z,LDA,LDR,OPS,EOA);
	Modulo_2: Secuenciador port map(RST,CLK,OPS,K,Z);
	Modulo_3: Biparticion  port map(G,E,K,A,P);
	Modulo_4: AcumuladorDiv   port map(RST,CLK,LDA,P,A);
	Modulo_5: Resultado    port map(RST,CLK,LDR,P,R);
	
	S <= A;
	
end Aproximacion;