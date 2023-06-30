library ieee;
use ieee.std_logic_1164.all;

ENTITY AL IS
    PORT(x, y, z : IN BIT;
	 A : IN BIT_VECTOR(5 DOWNTO 0); 
	 B : IN BIT_VECTOR(5 DOWNTO 0);
     Icin : OUT BIT;
	 IA : OUT BIT_VECTOR(5 DOWNTO 0);
     IB : OUT BIT_VECTOR(5 DOWNTO 0));
END;

ARCHITECTURE behav OF AL IS
BEGIN
    Icin = (NOT(x) AND NOT(y) AND z) OR (NOT(x) AND y AND NOT(z));
    IA = (A AND(NOT(x AND y AND z) OR NOT(x AND y AND NOT(z)) OR NOT(x AND NOT(Y) AND NOT(z)) OR NOT(x AND NOT(Y) AND z))) OR (NOT(A) AND (x AND y AND z)) OR ((A OR B) AND (x AND y AND NOT(z))) OR ((A OR B) AND (x AND z AND NOT(y))) OR (A AND B AND x AND NOT(y) AND NOT(z))
    IB = (B AND (NOT(x) AND NOT(y) AND NOT(z))) OR (NOT(B) AND (NOT(x) AND NOT(y) AND z))
END;
