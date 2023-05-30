library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux2x1_6bits IS
    PORT(Bc0, Bc1, Bc2, Bc3, Bc4, Bc5, Sc0 : IN BIT; 
    d0, d1, d2, d3, d4, d5 : OUT BIT);
END;

ARCHITECTURE behav OF Mux2x1_6bits IS
    COMPONENT Mux2x1_d is
        PORT(I0_comp,I1_comp,s0_comp : IN BIT;
        d_comp : OUT BIT);
    END COMPONENT;
BEGIN
    U1: Mux2x1_d PORT MAP(I0_comp => Bc0, I1_comp => NOT(Bc0), s0_comp => sc0, d_comp => d0); 
    U2: Mux2x1_d PORT MAP(I0_comp => Bc1, I1_comp => NOT(Bc1), s0_comp => sc0, d_comp => d1); 
    U3: Mux2x1_d PORT MAP(I0_comp => Bc2, I1_comp => NOT(Bc2), s0_comp => sc0, d_comp => d2);
	 U4: Mux2x1_d PORT MAP(I0_comp => Bc3, I1_comp => NOT(Bc3), s0_comp => sc0, d_comp => d3);
    U5: Mux2x1_d PORT MAP(I0_comp => Bc4, I1_comp => NOT(Bc4), s0_comp => sc0, d_comp => d4);
    U6: Mux2x1_d PORT MAP(I0_comp => Bc5, I1_comp => NOT(Bc5), s0_comp => sc0, d_comp => d5);
END;