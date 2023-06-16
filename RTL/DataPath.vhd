library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY DataPath IS
    PORT(CLKd, S1, S0, E1, E2 : IN BIT;
        n, ty : IN BIT_VECTOR(15 DOWNTO 0);
        P : OUT BIT;
        Ds1, Ds2 : OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF DataPath IS
	
	CONSTANT Y1 : BIT := '0';
	CONSTANT Y2 : BIT := '1';
	CONSTANT Z0: BIT_VECTOR(15 DOWNTO 0) := (others => '0');
	SIGNAL Z1, Z2: BIT;
	SIGNAL Z3, Z4, Z5, Z6, Z7 : BIT_VECTOR(15 DOWNTO 0);
	SIGNAL Z8, Z9, Z13, Z14: BIT;
	SIGNAL Z10, Z11, Z12: BIT_VECTOR(15 DOWNTO 0);
	
    COMPONENT Mux2x1_16bits is
        PORT(sc0 : IN BIT;
		    Ac : IN BIT_VECTOR(15 DOWNTO 0);
		    Bc : IN BIT_VECTOR(15 DOWNTO 0);
		    d : OUT BIT_VECTOR(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT Sum16b is
        PORT(sub : IN BIT; 
		    A16 : IN BIT_VECTOR(15 DOWNTO 0);
		    B16 : IN BIT_VECTOR(15 DOWNTO 0);
          S16: OUT BIT_VECTOR(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT contadorCres is
        PORT(clk: IN BIT; 
            reset: IN BIT;
            tc: IN BIT;
            C: OUT BIT_VECTOR(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT comp16b is
        PORT(clkcp : IN BIT;
				An : IN BIT_VECTOR(15 DOWNTO 0);
				Bn : IN BIT_VECTOR(15 DOWNTO 0);
            Pn: OUT BIT);
    END COMPONENT;

    COMPONENT Reg16b is
        PORT(clk_R, ld: IN BIT;
		    D: IN BIT_VECTOR(15 DOWNTO 0);
		    Q: OUT BIT_VECTOR(15 DOWNTO 0));
    END COMPONENT;
	 
	 COMPONENT Porta_OR is
        PORT(J, K : IN BIT;   
			 L : OUT BIT);
    END COMPONENT;
    
BEGIN
	U0: Porta_OR PORT MAP(J => NOT(S1), K => S0, L => Z1);
	U1: Porta_OR PORT MAP(J => S1, K => S0, L => Z2);
	U2: Mux2x1_16bits PORT MAP(sc0 => Z1, Ac => Z0, Bc => ty, d => Z3);
	U3: Mux2x1_16bits PORT MAP(sc0 => NOT(S0), Ac => Z0, Bc => n, d => Z4);
	U4: Mux2x1_16bits PORT MAP(sc0 => Z2, Ac => Z0, Bc => ty, d => Z5);
	U5: Sum16b PORT MAP(sub => Y1, A16 => Z3, B16 => Z4, S16 => Z6);
	U6: Sum16b PORT MAP(sub => Y1, A16 => Z5, B16 => Z4, S16 => Z7);
	U7: Porta_OR PORT MAP(J => E1, K => E2, L => Z8);
	U8: comp16b PORT MAP(clkcp => CLKd, An => Z0, Bn => Z11, Pn => Z9);
	U9: comp16b PORT MAP(clkcp => CLKd, An => Z0, Bn => Z12, Pn => Z13);
	U10: Porta_OR PORT MAP(J => Z9, K => Z13, L => P);
	U11: Porta_OR PORT MAP(J => Z9, K => Z13, L => Z14);
	U12: contadorCres PORT MAP(clk => CLKd, reset => Z14, tc => Z8, C => Z10);
	U13: Sum16b PORT MAP(sub => Y2, A16 => Z6, B16 => Z10, S16 => Z11);
	U14: Sum16b PORT MAP(sub => Y2, A16 => Z7, B16 => Z10, S16 => Z12);
	U15: Reg16b PORT MAP(CLK_R => CLKd, ld => Z8, D => Z11, Q => Ds1);
	U16: Reg16b PORT MAP(CLK_R => CLKd, ld => Z8, D => Z12, Q => Ds2);
	
END;