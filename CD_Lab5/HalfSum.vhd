library ieee;
use ieee.std_logic_1164.all;

ENTITY hSum IS
    PORT(A, B : IN BIT; 
    co, S : OUT BIT);
END;

ARCHITECTURE behav OF hSum IS
BEGIN
    co <= A AND B;
    S <= (A AND NOT(B)) OR (NOT(A) AND B);
END;