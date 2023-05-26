library ieee;
use ieee.std_logic_1164.all;

ENTITY Sum6b IS
    PORT(A5, A4, A3, A2, A1, A0, B5, B4, B3, B2, B1, B0, sub : IN BIT; 
        S5, S4, S3, S2, S1, S0 : OUT BIT);
END;

ARCHITECTURE behav OF Sum6b IS

    COMPONENT Mux2x1_d is
        PORT(I0_comp,I1_comp,s0_comp : IN BIT; 
        d_comp : OUT BIT);
    END COMPONENT;

    COMPONENT hSum is
        PORT(A, B : IN BIT; 
        co, S : OUT BIT);
    END COMPONENT;

    COMPONENT Sum is
        PORT(A, B, ci : IN BIT; 
        co, S : OUT BIT);
    END COMPONENT;

BEGIN
   
END;
