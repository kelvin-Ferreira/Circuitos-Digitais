library ieee;
use ieee.std_logic_1164.all;

ENTITY ALU_16b IS
    PORT(clk, e, xn, yn, zn: IN BIT;
	 An: in std_logic_vector(15 DOWNTO 0); 
	 Bn : in std_logic_vector(15 DOWNTO 0);
	 S : OUT std_logic_vector(15 DOWNTO 0));
END;

ARCHITECTURE behav OF ALU_16b IS

    CONSTANT M : BIT := '0';
    SIGNAL Z0, Z4 : BIT;
    SIGNAL Z1 :std_logic_vector(15 DOWNTO 0);
    SIGNAL Z2 :std_logic_vector(15 DOWNTO 0);
    SIGNAL Z3 :std_logic_vector(15 DOWNTO 0);
	 SIGNAL Z5 :std_logic_vector(15 DOWNTO 0);

    COMPONENT Sum16b IS
        PORT(sub : IN BIT; 
		      A16 : IN std_logic_vector(15 DOWNTO 0);
		      B16 : IN std_logic_vector(15 DOWNTO 0);
            S16: OUT std_logic_vector(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT Reg16b is
        PORT(clk_R, ld: IN BIT;
	     D: IN std_logic_vector(15 DOWNTO 0);
	     Q: OUT std_logic_vector(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT AL is
      PORT(x, y, z : IN BIT;
	        A : IN std_logic_vector(15 DOWNTO 0); 
	        B : IN std_logic_vector(15 DOWNTO 0);
           Icin : OUT BIT;
      	  IA : OUT std_logic_vector(15 DOWNTO 0);
           IB : OUT std_logic_vector(15 DOWNTO 0));
     END COMPONENT;
	  
	  COMPONENT SHIFT is
	  PORT(x, y, z: IN BIT;
		D, P: IN std_logic_vector(15 DOWNTO 0);
		Q: OUT std_logic_vector(15 DOWNTO 0));
	  END COMPONENT;

BEGIN
	U1: AL PORT MAP(x => xn, y => yn, z => zn, A => An, B => Bn, Icin => Z4, IA => Z1, IB => Z2);
	U2: SHIFT PORT MAP(x => xn, y => yn, z => zn, D => Z1, P => Bn, Q => Z5);
	U3: Sum16b PORT MAP(A16 => Z5, B16 => Z2, sub => Z4, S16 => Z3);
	U4: reg16b PORT MAP(clk_R => clk, ld => e, D => Z3, Q => S);
END;
