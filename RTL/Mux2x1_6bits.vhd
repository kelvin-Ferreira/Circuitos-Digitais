library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux2x1_16bits IS
    PORT(sc0 : IN BIT;
		Ac : IN BIT_VECTOR(15 DOWNTO 0);
		Bc : IN BIT_VECTOR(15 DOWNTO 0);
		d : OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF Mux2x1_16bits IS
    COMPONENT Mux2x1_d is
        PORT(I0_comp,I1_comp,s0_comp : IN BIT;
        d_comp : OUT BIT);
    END COMPONENT;
BEGIN
	U1: Mux2x1_d PORT MAP(I0_comp => Ac(0), I1_comp => Bc(0), s0_comp => sc0, d_comp => d(0)); 
	U2: Mux2x1_d PORT MAP(I0_comp => Ac(1), I1_comp => Bc(1), s0_comp => sc0, d_comp => d(1));
	U3: Mux2x1_d PORT MAP(I0_comp => Ac(2), I1_comp => Bc(2), s0_comp => sc0, d_comp => d(2));
	U4: Mux2x1_d PORT MAP(I0_comp => Ac(3), I1_comp => Bc(3), s0_comp => sc0, d_comp => d(3));
	U5: Mux2x1_d PORT MAP(I0_comp => Ac(4), I1_comp => Bc(4), s0_comp => sc0, d_comp => d(4));
	U6: Mux2x1_d PORT MAP(I0_comp => Ac(5), I1_comp => Bc(5), s0_comp => sc0, d_comp => d(5));
	U7: Mux2x1_d PORT MAP(I0_comp => Ac(6), I1_comp => Bc(6), s0_comp => sc0, d_comp => d(6));
	U8: Mux2x1_d PORT MAP(I0_comp => Ac(7), I1_comp => Bc(7), s0_comp => sc0, d_comp => d(7));
	U9: Mux2x1_d PORT MAP(I0_comp => Ac(8), I1_comp => Bc(8), s0_comp => sc0, d_comp => d(8));
	U10: Mux2x1_d PORT MAP(I0_comp => Ac(9), I1_comp => Bc(9), s0_comp => sc0, d_comp => d(9));
	U11: Mux2x1_d PORT MAP(I0_comp => Ac(10), I1_comp => Bc(10), s0_comp => sc0, d_comp => d(10));
	U12: Mux2x1_d PORT MAP(I0_comp => Ac(11), I1_comp => Bc(11), s0_comp => sc0, d_comp => d(11));
	U13: Mux2x1_d PORT MAP(I0_comp => Ac(12), I1_comp => Bc(12), s0_comp => sc0, d_comp => d(12));
	U14: Mux2x1_d PORT MAP(I0_comp => Ac(13), I1_comp => Bc(13), s0_comp => sc0, d_comp => d(13));
	U15: Mux2x1_d PORT MAP(I0_comp => Ac(14), I1_comp => Bc(14), s0_comp => sc0, d_comp => d(14));
	U16: Mux2x1_d PORT MAP(I0_comp => Ac(15), I1_comp => Bc(15), s0_comp => sc0, d_comp => d(15));

END;