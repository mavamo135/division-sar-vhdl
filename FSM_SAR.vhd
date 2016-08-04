library	IEEE;
use IEEE.std_logic_1164.all;

entity FSM_SAR is
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
end FSM_SAR;

architecture Control of FSM_SAR is

signal Qn, Qp : std_logic_vector(1 downto 0);

begin
	
	Combinacional: process(Qp,STA,Z)
	begin
		case Qp is
			when "00" =>
			if (STA='0') then
				Qn <= Qp;
			else
				Qn <= "01";
			end if;
			LDA <= '0';
			LDR <= '0';
			OPS <= '0';
			EOA <= '1';
			when "01" =>
			if (Z='0') then
				Qn <= Qp;
			else
				Qn <= "10";
			end if;
			LDA <= '1';
			LDR <= '0';
			OPS <= '1';
			EOA <= '0';
			when others =>
			Qn  <= "00";
			LDA <= '0';
			LDR <= '1';
			OPS <= '0';
			EOA <= '0';
		end case;
	end process Combinacional;

	Secuencial: process(RST,CLK)
	begin
		if (RST='1') then
			Qp <= (others => '0');
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
		end if;
	end process Secuencial;

end Control;