library ieee;
use ieee.std_logic_1164.all;

ENTITY Sum6b IS
    PORT(sub : IN BIT; 
		A6 : IN BIT_VECTOR(5 DOWNTO 0);
		B6 : IN BIT_VECTOR(5 DOWNTO 0);
      S6: OUT BIT_VECTOR(5 DOWNTO 0));
END;

ARCHITECTURE behav OF Sum6b IS
	 SIGNAL coa : BIT_VECTOR(5 DOWNTO 0);
    SIGNAL Ba : BIT_VECTOR(5 DOWNTO 0);
	 
    COMPONENT Mux2x1_6bits IS
        PORT(sc0 : IN BIT;
			Ac : IN BIT_VECTOR(5 DOWNTO 0);
			Bc : IN BIT_VECTOR; 
			d : OUT BIT_VECTOR(5 DOWNTO 0));
    END COMPONENT;

    COMPONENT Sum is
        PORT(A, B, ci : IN BIT; 
        co, S : OUT BIT);
    END COMPONENT;

BEGIN
    
	U0: Mux2x1_6bits PORT MAP(sc0 => sub ,Ac => B6, Bc => NOT(B6), d => Ba);
	U1: Sum PORT MAP(A => A6(0), B => Ba(0), ci => sub, co => coa(0), S => S6(0));
	U2: Sum PORT MAP(A => A6(1), B => Ba(1), ci => coa(0), co => coa(1), S => S6(1));
	U3: Sum PORT MAP(A => A6(2), B => Ba(2), ci => coa(1), co => coa(2), S => S6(2));
	U4: Sum PORT MAP(A => A6(3), B => Ba(3), ci => coa(2), co => coa(3), S => S6(3));
	U5: Sum PORT MAP(A => A6(4), B => Ba(4), ci => coa(3), co => coa(4), S => S6(4));
	U6: Sum PORT MAP(A => A6(5), B => Ba(5), ci => coa(4), co => coa(5), S => S6(5));

END;
