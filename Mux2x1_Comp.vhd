library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux2x1_c IS
    PORT(I0,I1,s0 : IN BIT; 
    d : OUT BIT);
END;

ARCHITECTURE behav OF Mux2x1_c IS
BEGIN
    WITH s0 SELECT
        d <= I0 WHEN '0',
        I1 WHEN '1';
END;