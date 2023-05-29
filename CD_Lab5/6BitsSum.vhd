library ieee;
use ieee.std_logic_1164.all;

ENTITY Sum6b IS
    PORT(A5, A4, A3, A2, A1, A0, B5, B4, B3, B2, B1, B0, sub : IN BIT; 
        S5, S4, S3, S2, S1, S0 : OUT BIT);
END;

ARCHITECTURE behav OF Sum6b IS
	SIGNAL co5, co4, co3, co2, co1, co0: BIT
    SIGNAL Ba5, Ba4, Ba3, Ba2, Ba1, Ba0: BIT
	
    COMPONENT Mux2x1_6bits is
        PORT(Bc0, Bc1, Bc2, Bc3, Bc4, Bc5, Sc0 : IN BIT; 
    d0, d1, d2, d3, d4, d5 : OUT BIT);
    END COMPONENT;

    COMPONENT hSum is
        PORT(A, B : IN BIT; 
        co, S : OUT BIT);
    END COMPONENT;

    COMPONENT Sum is
        PORT(A, B, ci : IN BIT; 
        co, S : OUT BIT);
    END COMPONENT;

BEGIN
    
    U0: Mux2x1_6bits PORT MAP(Bc0 <= B0, Bc1 <= B1, Bc2 <= B2, Bc3 <= B3,
        Bc4 <= B4, Bc5 <= B5, Sc0 <= sub, d0 <= Ba0, d1 <= Ba1, d2 <= Ba2,
        d3 <= Ba3, d4 <= Ba4, d5 <= Ba5); 
    U6: Sum PORT MAP(A <= A5, B <= Ba5, ci <= co4  OR sub, co <= co5, S <= S5); 
	U5: Sum PORT MAP(A <= A4, B <= Ba4, ci <= co3 OR sub, co <= co4, S <= S4); 
	U4: Sum PORT MAP(A <= A3, B <= Ba3, ci <= co2 OR sub, co <= co3, S <= S3); 
	U3: Sum PORT MAP(A <= A2, B <= Ba2, ci <= co1 OR sub, co <= co2, S <= S2); 
	U2: Sum PORT MAP(A <= A1, B <= Ba1, ci <= co0 OR sub, co <= co1, S <= S1); 
	U1: hSum PORT MAP(A <= A0, B <= Ba0, co <= co0, S <= S0);
END;

PROCESS()
        BEGIN