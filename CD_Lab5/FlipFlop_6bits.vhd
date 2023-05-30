LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY FlipFlop6b IS
	PORT(clk_comp: IN BIT;
		D6: IN BIT_VECTOR(5 DOWNTO 0);
		Q6: OUT BIT_VECTOR(5 DOWNTO 0));
END;

ARCHITECTURE behav OF FlipFlop6b IS
BEGIN
	PROCESS (D6, clk_comp)
	BEGIN
		IF (clk_comp'EVENT AND clk_comp = '1') THEN 
			Q6 <= D6;
		END IF;
	END PROCESS ;
END;