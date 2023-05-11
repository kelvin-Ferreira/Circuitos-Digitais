library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux2x1_d IS
    PORT(I0_comp,I1_comp,s0_comp : IN BIT; 
    d_comp : OUT BIT);
END;

ARCHITECTURE behav OF Mux2x1_d IS
BEGIN
    d_comp <= (I0_comp AND NOT(s0_comp)) OR (I1_comp AND s0_comp);
END;