library ieee;
use ieee.std_logic_1164.all;

ENTITY Sum6b IS
    PORT(A5, A4, A3, A2, A1, A0, B5, B4, B3, B2, B1, B0, sub : IN BIT; 
        S5, S4, S3, S2, S1, S0 : OUT BIT);
END;

ARCHITECTURE behav OF Sum6b IS
	SIGNAL co5, co4, co3, co2, co1, co0: BIT
	SIGNAL cob5, cob4, cob3, cob2, cob1, cob0: BIT
	SIGNAL Z5, Z4, Z3, Z2, Z1, Z0: BIT
	
    COMPONENT Mux2x1_d is
        PORT(I0_comp,I1_comp,s0_comp : IN BIT; 
        d_comp : OUT BIT);
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
   U6: Sum PORT MAP(A <= A5, B <= B5, ci <= co4, co <= co5, S <= S5); 
	U5: Sum PORT MAP(A <= A4, B <= B4, ci <= co3, co <= co4, S <= S4); 
	U4: Sum PORT MAP(A <= A3, B <= B3, ci <= co2, co <= co3, S <= S3); 
	U3: Sum PORT MAP(A <= A2, B <= B2, ci <= co1, co <= co2, S <= S2); 
	U2: Sum PORT MAP(A <= A1, B <= B1, ci <= co0, co <= co1, S <= S1); 
	U1: hSum PORT MAP(A <= A0, B <= B0, co <= co0, S <= S0);
	
	U12: Sum PORT MAP(A <= A5, NOT(B) <= B5, ci <= cob4, co <= cob5, S <= Z5); 
	U11: Sum PORT MAP(A <= A4, NOT(B) <= B4, ci <= cob3, co <= cob4, S <= Z4); 
	U10: Sum PORT MAP(A <= A3, NOT(B) <= B3, ci <= cob2, co <= cob3, S <= Z3); 
	U9: Sum PORT MAP(A <= A2, NOT(B) <= B2, ci <= cob1, co <= cob2, S <= Z2); 
	U8: Sum PORT MAP(A <= A1, NOT(B) <= B1, ci <= cob0, co <= cob1, S <= Z1); 
	U7: hSum PORT MAP(A <= A0, NOT(B) <= B0, co <= cob0, S <= Z0);
	
	U18: Sum PORT MAP(A <= A5, '1' <= B5, ci <= cob4, co <= cob5, S <= Z5); 
	U17: Sum PORT MAP(A <= A4, '1' <= B4, ci <= cob3, co <= cob4, S <= Z4); 
	U16: Sum PORT MAP(A <= A3, '1' <= B3, ci <= cob2, co <= cob3, S <= Z3); 
	U15: Sum PORT MAP(A <= A2, '1' <= B2, ci <= cob1, co <= cob2, S <= Z2); 
	U14: Sum PORT MAP(A <= A1, '1' <= B1, ci <= cob0, co <= cob1, S <= Z1); 
	U13: hSum PORT MAP(A <= A0, '1' <= B0, co <= cob0, S <= Z0);
END;
