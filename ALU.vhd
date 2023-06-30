library ieee;

use ieee.std_logic_1164.all;



ENTITY ALU IS

    PORT(clk, e, xn, yn, zn: IN BIT;

	 An: IN BIT_VECTOR(5 DOWNTO 0); 

	 Bn : IN BIT_VECTOR(5 DOWNTO 0);

	 S : OUT BIT_VECTOR(5 DOWNTO 0));

END;



ARCHITECTURE behav OF ALU IS

    CONSTANT M : BIT := '0';
    SIGNAL Z0, Z4 : BIT;
    SIGNAL Z1 :BIT_VECTOR(5 DOWNTO 0);
    SIGNAL Z2 :BIT_VECTOR(5 DOWNTO 0);
    SIGNAL Z3 :BIT_VECTOR(5 DOWNTO 0);
    

    COMPONENT sum6b IS

        PORT(sub : IN BIT; 
		      A6 : IN BIT_VECTOR(15 DOWNTO 0);
		      B6 : IN BIT_VECTOR(15 DOWNTO 0);
          S6: OUT BIT_VECTOR(15 DOWNTO 0));

    END COMPONENT;



    COMPONENT reg6b is

        PORT(clk_R, ld: IN BIT;

	     D: IN BIT_VECTOR(5 DOWNTO 0);

	     Q: OUT BIT_VECTOR(5 DOWNTO 0));

    END COMPONENT;

    COMPONENT AL is
      PORT(x, y, z : IN BIT;
	        A : IN BIT_VECTOR(5 DOWNTO 0); 
	        B : IN BIT_VECTOR(5 DOWNTO 0);
          Icin : OUT BIT;
      	  IA : OUT BIT_VECTOR(5 DOWNTO 0);
          IB : OUT BIT_VECTOR(5 DOWNTO 0));
     END COMPONENT;



BEGIN

	U1: AL PORT MAP(x => xn, y => yn, z => zn, A => An, B => Bn, Icin => Z4, IA => Z1, IB => Z2);
	U2: Sum6b PORT MAP(A6 => Z1, B6 => Z2, sub => Z4, S6 => Z3);
	U3: reg6b PORT MAP(clk_R => clk, ld => e, D => Z3, Q => S);

END;
