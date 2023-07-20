LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY Reg16b IS
	PORT(clk_R, ld: IN BIT;
		D: IN BIT_VECTOR(15 DOWNTO 0);
		Q: OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF Reg16b IS

SIGNAL Qn: BIT_VECTOR(15 DOWNTO 0);

COMPONENT FlipFlop16b is
	PORT(clk_comp: IN BIT;
			D16: IN BIT_VECTOR(15 DOWNTO 0);
			Q16: OUT BIT_VECTOR(15 DOWNTO 0));
END COMPONENT;
BEGIN
U: FlipFlop16b PORT MAP(clk_comp => clk_R, D16 => D, Q16 => Qn); 

PROCESS(clk_R, ld, Qn)
	BEGIN
		IF(ld'EVENT AND ld = '1') THEN 
			Q <= Qn;
		END IF;
END PROCESS;
END behav;
