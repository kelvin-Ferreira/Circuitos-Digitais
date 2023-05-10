library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux4x1 IS
    PORT(I0,I1,I2,I3,s0,s1 : IN BIT; 
        d : OUT BIT);
END;

ARCHITECTURE behav OF Mux4x1 IS
    SIGNAL Z1: BIT;
    SIGNAL Z2: BIT;
    COMPONENT Mux2x1_d is
        PORT(N0,N1,P : IN BIT;
        M : OUT BIT);
    END COMPONENT;
BEGIN
    U1: Mux2x1_d PORT MAP(N0 => I0, N1 => I1, P => s0, M => Z1);
    U2: Mux2x1_d PORT MAP(N0 => I2, N1 => I3, P => s0, M => Z2);
    U3: Mux2x1_d PORT MAP(N0 => Z1, N1 => Z2, P => s1, M => d);
END;
