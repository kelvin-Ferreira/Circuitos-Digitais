library ieee;
use ieee.std_logic_1164.all;

ENTITY Controller IS
    PORT(P, S1, S0 : IN BIT;
		R1, G1, Y1, R2, G2, Y2, n1,n0 : OUT BIT);
END;

ARCHITECTURE behav OF Controller IS
BEGIN
    R1 <= NOT(S1);
	 R2 <= S1;
	 G1 <= S1 AND NOT(S0);
	 G2 <= NOT(S1) AND NOT(S0);
	 Y1 <= S1 AND S0;
	 Y2 <= NOT(S1) AND S0;
	 n1 <= (NOT(P) AND S1) OR (P AND NOT(S1) AND S0) OR (S1 AND NOT(S0));
	 n0 <= (NOT(P) AND S0) OR (P AND NOT(S0));
END;