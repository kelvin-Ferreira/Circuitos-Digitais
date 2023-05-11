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
        PORT(I0_comp,I1_comp,s0_comp : IN BIT; -- component: Mux2x1
        d_comp : OUT BIT);
    END COMPONENT;
BEGIN
    U1: Mux2x1_d PORT MAP(I0_comp => I0, I1_comp => I1, s0_comp => s0, d_comp => Z1); -- Mux 1: i0 or i1
    U2: Mux2x1_d PORT MAP(I0_comp => I2, I1_comp => I3, s0_comp => s0, d_comp => Z2); -- Mux 2: i2 or i3
    U3: Mux2x1_d PORT MAP(I0_comp => Z1, I1_comp => Z2, s0_comp => s1, d_comp => d); -- Mux 3: output
END;