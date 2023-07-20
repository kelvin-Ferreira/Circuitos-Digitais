LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY FlipFlop16b IS
	PORT(clk_comp: IN BIT;
		D16: IN BIT_VECTOR(15 DOWNTO 0);
		Q16: OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF FlipFlop16b IS
BEGIN
	PROCESS (D16, clk_comp)
	BEGIN
		IF (clk_comp'EVENT AND clk_comp = '1') THEN 
			Q16 <= D16;
		END IF;
	END PROCESS ;
END;
