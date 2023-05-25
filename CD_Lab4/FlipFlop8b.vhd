LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY FlipFlop8b IS
	PORT(clk_comp: IN BIT;
		D8: IN INTEGER RANGE 255 DOWNTO 0;
		Q8: OUT INTEGER RANGE 255 DOWNTO 0);
END;

ARCHITECTURE behav OF FlipFlop8b IS
BEGIN
	PROCESS (D8, clk_comp)
	BEGIN
		IF (clk_comp'EVENT AND clk_comp = '1') THEN 
			Q8 <= D8;
		END IF;
	END PROCESS ;
END;