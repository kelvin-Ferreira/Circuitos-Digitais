LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY Reg8b IS
	PORT(clk_R, ld: IN BIT;
		D: IN INTEGER RANGE 255 DOWNTO 0;
		Q: OUT INTEGER RANGE 255 DOWNTO 0);
END;

ARCHITECTURE behav OF Reg8b IS

SIGNAL Qn: INTEGER RANGE 255 DOWNTO 0;

COMPONENT FlipFlop8b is
	PORT(clk_comp: IN BIT;
			D8: IN INTEGER RANGE 255 DOWNTO 0; 
			Q8: OUT INTEGER RANGE 255 DOWNTO 0);
END COMPONENT;
BEGIN
U: FlipFlop8b PORT MAP(D8 => D, clk_comp => clk_R, Q8 => Qn); 

PROCESS(clk_R, ld, Qn)
	BEGIN
		IF(ld = '1') THEN 
			Q <= Qn;
		END IF;
END PROCESS;
END behav;
			