library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux2x1_4bits IS
    PORT(A0,A1,A2,A3,B0,B1,B2,B3,s0 : IN BIT; 
    d0,d1,d2,d3 : OUT BIT);
END;

ARCHITECTURE behav OF Mux2x1_4bits IS
    COMPONENT Mux2x1_d is
        PORT(I0_comp,I1_comp,s0_comp : IN BIT; -- componente: mux 2x1
        d_comp : OUT BIT);
    END COMPONENT;
BEGIN
    U1: Mux2x1_d PORT MAP(I0_comp => A0, I1_comp => B0, s0_comp => s0, d_comp => d0); -- Bit 1
    U2: Mux2x1_d PORT MAP(I0_comp => A1, I1_comp => B1, s0_comp => s0, d_comp => d1); -- Bit 2
    U3: Mux2x1_d PORT MAP(I0_comp => A2, I1_comp => B2, s0_comp => s0, d_comp => d2); -- Bit 3
	 U4: Mux2x1_d PORT MAP(I0_comp => A3, I1_comp => B3, s0_comp => s0, d_comp => d3); -- Bit 4
END;