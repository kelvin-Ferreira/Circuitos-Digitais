library ieee;
use ieee.std_logic_1164.all;

ENTITY Sum16b IS
    PORT(sub : IN BIT; 
		A16 : IN BIT_VECTOR(15 DOWNTO 0);
		B16 : IN BIT_VECTOR(15 DOWNTO 0);
      S16: OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF Sum16b IS
	 SIGNAL coa : BIT_VECTOR(15 DOWNTO 0);
    SIGNAL Ba : BIT_VECTOR(15 DOWNTO 0);
	 
    COMPONENT Mux2x1_16bits IS
        PORT(sc0 : IN BIT;
			Ac : IN BIT_VECTOR(15 DOWNTO 0);
			Bc : IN BIT_VECTOR; 
			d : OUT BIT_VECTOR(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT Sum is
        PORT(A, B, ci : IN BIT; 
        co, S : OUT BIT);
    END COMPONENT;

BEGIN
    
	U0: Mux2x1_16bits PORT MAP(sc0 => sub ,Ac => B16, Bc => NOT(B16), d => Ba);
	U1: Sum PORT MAP(A => A16(0), B => Ba(0), ci => sub, co => coa(0), S => S16(0));
	U2: Sum PORT MAP(A => A16(1), B => Ba(1), ci => coa(0), co => coa(1), S => S16(1));
	U3: Sum PORT MAP(A => A16(2), B => Ba(2), ci => coa(1), co => coa(2), S => S16(2));
	U4: Sum PORT MAP(A => A16(3), B => Ba(3), ci => coa(2), co => coa(3), S => S16(3));
	U5: Sum PORT MAP(A => A16(4), B => Ba(4), ci => coa(3), co => coa(4), S => S16(4));
	U6: Sum PORT MAP(A => A16(5), B => Ba(5), ci => coa(4), co => coa(5), S => S16(5));
	U7: Sum PORT MAP(A => A16(6), B => Ba(6), ci => coa(5), co => coa(6), S => S16(6));
	U8: Sum PORT MAP(A => A16(7), B => Ba(7), ci => coa(6), co => coa(7), S => S16(7));
	U9: Sum PORT MAP(A => A16(8), B => Ba(8), ci => coa(7), co => coa(8), S => S16(8));
	U10: Sum PORT MAP(A => A16(9), B => Ba(9), ci => coa(8), co => coa(9), S => S16(9));
	U11: Sum PORT MAP(A => A16(10), B => Ba(10), ci => coa(9), co => coa(10), S => S16(10));
	U12: Sum PORT MAP(A => A16(11), B => Ba(11), ci => coa(10), co => coa(11), S => S16(11));
	U13: Sum PORT MAP(A => A16(12), B => Ba(12), ci => coa(11), co => coa(12), S => S16(12));
	U14: Sum PORT MAP(A => A16(13), B => Ba(13), ci => coa(12), co => coa(13), S => S16(13));
	U15: Sum PORT MAP(A => A16(14), B => Ba(14), ci => coa(13), co => coa(14), S => S16(14));
	U16: Sum PORT MAP(A => A16(15), B => Ba(15), ci => coa(14), co => coa(15), S => S16(15));


END;