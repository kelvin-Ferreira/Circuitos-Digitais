LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY DataP IS
	PORT(clk, Ew, Er, Iw1, Iw0, Ir1, Ir0: IN BIT;
		DataW: IN INTEGER RANGE 255 DOWNTO 0;
		DataR: OUT INTEGER RANGE 255 DOWNTO 0);
END;

ARCHITECTURE behav OF DataP IS

SIGNAL dw3, dw2, dw1, dw0: BIT;
SIGNAL dr3, dr2, dr1, dr0: BIT;
SIGNAL Data3: INTEGER RANGE 255 DOWNTO 0;
SIGNAL Data2: INTEGER RANGE 255 DOWNTO 0;
SIGNAL Data1: INTEGER RANGE 255 DOWNTO 0;
SIGNAL Data0: INTEGER RANGE 255 DOWNTO 0;

COMPONENT Reg8b is
	PORT(clk_R, ld: IN BIT;
		D: IN INTEGER RANGE 255 DOWNTO 0; 
		Q: OUT INTEGER RANGE 255 DOWNTO 0);
END COMPONENT;

COMPONENT decode is
	PORT(i1, i0, E: IN BIT;
		d0,d1,d2,d3 : OUT BIT);
END COMPONENT;

BEGIN
	U1: decode PORT MAP(i1 => Iw1, i0 => Iw0, E => Ew, d3 => dw3, d2 => dw2, d1 => dw1, d0 => dw0); 
	U2: decode PORT MAP(i1 => Ir1, i0 => Ir0, E => Er, d3 => dr3, d2 => dr2, d1 => dr1, d0 => dr0); 
	U3: Reg8b PORT MAP(clk_R => clk, D => DataW, ld => dw3, Q => Data3); 
	U4: Reg8b PORT MAP(clk_R => clk, D => DataW, ld => dw2, Q => Data2); 
	U5: Reg8b PORT MAP(clk_R => clk, D => DataW, ld => dw1, Q => Data1); 
	U6: Reg8b PORT MAP(clk_R => clk, D => DataW, ld => dw0, Q => Data0);

PROCESS(Er, dr3, dr2, dr1, dr0, Data3, Data2, Data1, Data0)
	BEGIN
		IF(Er = '1') THEN 
			IF(dr3 = '1') THEN
				DataR <= Data3;
			ELSIF(dr2 = '1') THEN
				DataR <= Data2;
			ELSIF(dr1 = '1') THEN
				DataR <= Data1;	
			ELSIF(dr0 = '1') THEN
				DataR <= Data0;
			END IF;
		END IF;
END PROCESS;	

END;