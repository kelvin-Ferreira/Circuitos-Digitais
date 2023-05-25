LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY FlipFlopD IS
	PORT(D, clk_comp : IN BIT;
		Q, nQ : OUT BIT);
END;

ARCHITECTURE behav OF FlipFlopD IS
BEGIN
	PROCESS (D, clk_comp)
	BEGIN
		IF (clk_comp'EVENT AND clk_comp = '1') THEN 
			Q <= D;
			nQ <= NOT(D);
		END IF;
	END PROCESS ;
END;