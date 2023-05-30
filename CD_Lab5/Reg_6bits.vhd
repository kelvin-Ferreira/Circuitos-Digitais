LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY Reg6b IS
	PORT(clk_R, ld: IN BIT;
		D: IN BIT_VECTOR(5 DOWNTO 0);
		Q: OUT BIT_VECTOR(5 DOWNTO 0));
END;

ARCHITECTURE behav OF Reg6b IS

SIGNAL Qn: BIT_VECTOR(5 DOWNTO 0);

COMPONENT FlipFlop6b is
	PORT(clk_comp: IN BIT;
			D6: IN BIT_VECTOR(5 DOWNTO 0);
			Q6: OUT BIT_VECTOR(5 DOWNTO 0));
END COMPONENT;
BEGIN
U: FlipFlop6b PORT MAP(D6 => D, clk_comp => clk_R, Q6 => Qn); 

PROCESS(clk_R, ld, Qn)
	BEGIN
		IF(ld = '1') THEN 
			Q <= Qn;
		END IF;
END PROCESS;
END behav;