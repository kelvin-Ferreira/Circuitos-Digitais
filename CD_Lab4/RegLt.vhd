LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY RegD IS
	PORT(D3, D2, D1, D0, clk : IN BIT;
			Q3, Q2, Q1, Q0 : OUT BIT);
END;

ARCHITECTURE behav OF RegD IS
COMPONENT latchD is
  PORT(D, c : IN BIT; 
		Q, nQ : OUT BIT);
END COMPONENT;

BEGIN
	 U1: latchD PORT MAP(D => D3, c => clk, Q => Q3); 
	 U2: latchD PORT MAP(D => D2, c => clk, Q => Q2); 
	 U3: latchD PORT MAP(D => D1, c => clk, Q => Q1); 
	 U4: latchD PORT MAP(D => D0, c => clk, Q => Q0); 
END;