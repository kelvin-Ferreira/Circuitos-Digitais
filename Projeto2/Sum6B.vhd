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

    COMPONENT Sum is
        PORT(A, B, ci : IN BIT; 
        co, SM : OUT BIT);
    END COMPONENT;

BEGIN
    
	U1: Sum PORT MAP(A => A16(0), B => B16(0), ci => sub, co => coa(0), SM => S16(0));
	U2: Sum PORT MAP(A => A16(1), B => B16(1), ci => coa(0), co => coa(1), SM => S16(1));
	U3: Sum PORT MAP(A => A16(2), B => B16(2), ci => coa(1), co => coa(2), SM => S16(2));
	U4: Sum PORT MAP(A => A16(3), B => B16(3), ci => coa(2), co => coa(3), SM => S16(3));
	U5: Sum PORT MAP(A => A16(4), B => B16(4), ci => coa(3), co => coa(4), SM => S16(4));
	U6: Sum PORT MAP(A => A16(5), B => B16(5), ci => coa(4), co => coa(5), SM => S16(5));
	U7: Sum PORT MAP(A => A16(6), B => B16(6), ci => coa(5), co => coa(6), SM => S16(6));
	U8: Sum PORT MAP(A => A16(7), B => B16(7), ci => coa(6), co => coa(7), SM => S16(7));
	U9: Sum PORT MAP(A => A16(8), B => B16(8), ci => coa(7), co => coa(8), SM => S16(8));
	U10: Sum PORT MAP(A => A16(9), B => B16(9), ci => coa(8), co => coa(9), SM => S16(9));
	U11: Sum PORT MAP(A => A16(10), B => B16(10), ci => coa(9), co => coa(10), SM => S16(10));
	U12: Sum PORT MAP(A => A16(11), B => B16(11), ci => coa(10), co => coa(11), SM => S16(11));
	U13: Sum PORT MAP(A => A16(12), B => B16(12), ci => coa(11), co => coa(12), SM => S16(12));
	U14: Sum PORT MAP(A => A16(13), B => B16(13), ci => coa(12), co => coa(13), SM => S16(13));
	U15: Sum PORT MAP(A => A16(14), B => B16(14), ci => coa(13), co => coa(14), SM => S16(14));
	U16: Sum PORT MAP(A => A16(15), B => B16(15), ci => coa(14), co => coa(15), SM => S16(15));

END;