library ieee;
use ieee.std_logic_1164.all;

ENTITY calc IS
    PORT(clk, e, func : IN BIT;
	 A : IN BIT_VECTOR(5 DOWNTO 0); 
	 B : IN BIT_VECTOR(5 DOWNTO 0);
	 S : OUT BIT_VECTOR(5 DOWNTO 0));
END;

ARCHITECTURE behav OF calc IS
    SIGNAL Z :BIT_VECTOR(5 DOWNTO 0);  
    
    COMPONENT sum6b IS
        PORT(A5, A4, A3, A2, A1, A0, B5, B4, B3, B2, B1, B0, sub : IN BIT; 
             S5, S4, S3, S2, S1, S0 : OUT BIT);
    END COMPONENT;

    COMPONENT reg6b is
        PORT(clk_R, ld: IN BIT;
	     D: IN BIT_VECTOR(5 DOWNTO 0);
	     Q: OUT BIT_VECTOR(5 DOWNTO 0));
    END COMPONENT;

BEGIN
	U1: Sum6b PORT MAP(A5 => A(5), A4 => A(4), A3 => A(3), A2 => A(2),
			   A1 => A(1), A0 => A(0), B5 => B(5), B4 => B(4),
			   B3 => B(3), B2 => B(2), B1 => B(1), B0 => B(0), 
			   sub => func, S5 => Z(5), S4 => Z(4), S3 => Z(3),
			   S2 => Z(2), S1 => Z(1), S0 => Z(0));
	U2: reg6b PORT MAP(clk_R => clk, ld => e, D => Z, Q => S);
END;
