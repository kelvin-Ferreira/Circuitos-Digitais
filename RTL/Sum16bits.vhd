library ieee;
use ieee.std_logic_1164.all;

ENTITY Sum16b IS
    PORT(sub : IN BIT; 
		A16 : IN BIT_VECTOR(15 DOWNTO 0);
		B16 : IN BIT_VECTOR(15 DOWNTO 0);
      S16: OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF Sum16b IS
	 SIGNAL co : BIT_VECTOR(15 DOWNTO 0);
    SIGNAL Ba : BIT_VECTOR(15 DOWNTO 0);
	 
    COMPONENT Mux2x1_16bits IS
        PORT(Ac : IN BIT_VECTOR(15 DOWNTO 0);
			Bc : IN BIT_VECTOR; 
			d : OUT BIT_VECTOR(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT Sum is
        PORT(A, B, ci : IN BIT; 
        co, S : OUT BIT);
    END COMPONENT;

BEGIN
    
	U0: Mux2x1_16bits PORT MAP(Ac => B16, Bc => NOT(B16), d => Ba);
	U1: Sum PORT MAP(A => A16(0), B => Ba(0), ci => sub, co => co(0), S => S16(0));
	U2: Sum PORT MAP(A => A16(1), B => Ba(1), ci => sub, co => co(1), S => S16(1));
	U3: Sum PORT MAP(A => A16(2), B => Ba(2), ci => sub, co => co(2), S => S16(2));
	U4: Sum PORT MAP(A => A16(3), B => Ba(3), ci => sub, co => co(3), S => S16(3));
	U5: Sum PORT MAP(A => A16(4), B => Ba(4), ci => sub, co => co(4), S => S16(4));
	U6: Sum PORT MAP(A => A16(5), B => Ba(5), ci => sub, co => co(5), S => S16(5));
	U7: Sum PORT MAP(A => A16(6), B => Ba(6), ci => sub, co => co(6), S => S16(6));
	U8: Sum PORT MAP(A => A16(7), B => Ba(7), ci => sub, co => co(7), S => S16(7));
	U9: Sum PORT MAP(A => A16(8), B => Ba(8), ci => sub, co => co(8), S => S16(8));
	U10: Sum PORT MAP(A => A16(9), B => Ba(9), ci => sub, co => co(9), S => S16(9));
	U11: Sum PORT MAP(A => A16(10), B => Ba(10), ci => sub, co => co(10), S => S16(10));
	U12: Sum PORT MAP(A => A16(11), B => Ba(11), ci => sub, co => co(11), S => S16(11));
	U13: Sum PORT MAP(A => A16(12), B => Ba(12), ci => sub, co => co(12), S => S16(12));
	U14: Sum PORT MAP(A => A16(13), B => Ba(13), ci => sub, co => co(13), S => S16(13));
	U15: Sum PORT MAP(A => A16(14), B => Ba(14), ci => sub, co => co(14), S => S16(14));
	U16: Sum PORT MAP(A => A16(15), B => Ba(15), ci => sub, co => co(15), S => S16(15));

END;