library ieee;
use ieee.std_logic_1164.all;

ENTITY Sum IS
    PORT(A, B, ci : IN BIT; 
    co, S : OUT BIT);
END;

ARCHITECTURE behav OF Sum IS
BEGIN
    co <= (A AND B) OR (A AND ci) OR (B AND ci) OR (A AND B AND ci);
    S <= (A AND NOT(B) AND NOT(ci)) OR (NOT(A) AND B AND NOT(ci)) OR (NOT(A) AND NOT(B) AND ci) OR (A AND B AND ci);
END;