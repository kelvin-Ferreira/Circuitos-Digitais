library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux3x1_16bits IS
    PORT(sc0, sc1 : IN BIT;
		Ac : IN BIT_VECTOR(15 DOWNTO 0);
		Bc : IN BIT_VECTOR(15 DOWNTO 0);
		Cc : IN BIT_VECTOR(15 DOWNTO 0);
		d : OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF Mux3x1_16bits IS
    COMPONENT Mux3x1_d is
        PORT(I0_comp, I1_comp, I2_comp, s0_comp, s1_comp : IN BIT;
        d_comp : OUT BIT);
    END COMPONENT;
BEGIN
	U1: Mux3x1_d PORT MAP(I0_comp => Ac(0), I1_comp => Bc(0), I2_comp => Cc(0), s0_comp => sc0, s1_comp => sc1, d_comp => d(0)); 
	U2: Mux3x1_d PORT MAP(I0_comp => Ac(1), I1_comp => Bc(1), I2_comp => Cc(1), s0_comp => sc0, s1_comp => sc1, d_comp => d(1));
	U3: Mux3x1_d PORT MAP(I0_comp => Ac(2), I1_comp => Bc(2), I2_comp => Cc(2), s0_comp => sc0, s1_comp => sc1, d_comp => d(2));
	U4: Mux3x1_d PORT MAP(I0_comp => Ac(3), I1_comp => Bc(3), I2_comp => Cc(3), s0_comp => sc0, s1_comp => sc1, d_comp => d(3));
	U5: Mux3x1_d PORT MAP(I0_comp => Ac(4), I1_comp => Bc(4), I2_comp => Cc(4), s0_comp => sc0, s1_comp => sc1, d_comp => d(4));
	U6: Mux3x1_d PORT MAP(I0_comp => Ac(5), I1_comp => Bc(5), I2_comp => Cc(5), s0_comp => sc0, s1_comp => sc1, d_comp => d(5));
	U7: Mux3x1_d PORT MAP(I0_comp => Ac(6), I1_comp => Bc(6), I2_comp => Cc(6), s0_comp => sc0, s1_comp => sc1, d_comp => d(6));
	U8: Mux3x1_d PORT MAP(I0_comp => Ac(7), I1_comp => Bc(7), I2_comp => Cc(7), s0_comp => sc0, s1_comp => sc1, d_comp => d(7));
	U9: Mux3x1_d PORT MAP(I0_comp => Ac(8), I1_comp => Bc(8), I2_comp => Cc(8), s0_comp => sc0, s1_comp => sc1, d_comp => d(8));
	U10: Mux3x1_d PORT MAP(I0_comp => Ac(9), I1_comp => Bc(9), I2_comp => Cc(9), s0_comp => sc0, s1_comp => sc1, d_comp => d(9));
	U11: Mux3x1_d PORT MAP(I0_comp => Ac(10), I1_comp => Bc(10), I2_comp => Cc(10), s0_comp => sc0, s1_comp => sc1, d_comp => d(10));
	U12: Mux3x1_d PORT MAP(I0_comp => Ac(11), I1_comp => Bc(11), I2_comp => Cc(11), s0_comp => sc0, s1_comp => sc1, d_comp => d(11));
	U13: Mux3x1_d PORT MAP(I0_comp => Ac(12), I1_comp => Bc(12), I2_comp => Cc(12), s0_comp => sc0, s1_comp => sc1, d_comp => d(12));
	U14: Mux3x1_d PORT MAP(I0_comp => Ac(13), I1_comp => Bc(13), I2_comp => Cc(13), s0_comp => sc0, s1_comp => sc1, d_comp => d(13));
	U15: Mux3x1_d PORT MAP(I0_comp => Ac(14), I1_comp => Bc(14), I2_comp => Cc(14), s0_comp => sc0, s1_comp => sc1, d_comp => d(14));
	U16: Mux3x1_d PORT MAP(I0_comp => Ac(15), I1_comp => Bc(15), I2_comp => Cc(15), s0_comp => sc0, s1_comp => sc1, d_comp => d(15));

END;
