library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux2x1_d IS
    PORT(I0,I1,s0 : IN BIT; 
    d : OUT BIT);
END;

ARCHITECTURE behav OF Mux2x1_d IS
BEGIN
    d <= (I0 AND NOT(s0)) OR (I1 AND s0);
END;
