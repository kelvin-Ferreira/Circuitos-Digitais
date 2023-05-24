LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY Reg32 IS
PORT(D31, D30, D29, D28, D27, D26, D25, D24,
D23, D22, D21, D20, D19, D18, D17, D16,
D15, D14, D13, D12, D11, D10, D9, D8, D7, 
D6, D5, D4, D3, D2, D1, D0, clk : IN BIT;
Q31, Q30, Q29, Q28, Q27, Q26, Q25, Q24,
Q23, Q22, Q21, Q20, Q19, Q18, Q17, Q16,
Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, 
Q6, Q5, Q4, Q3, Q2, Q1, Q0 : OUT BIT);
END;

ARCHITECTURE behav OF Reg32 IS
    COMPONENT FlipFlopD is
        PORT(D, clk_comp : IN BIT; 
         Q, nQ : OUT BIT);
    END COMPONENT;

    BEGIN
    U1: FlipFlopD PORT MAP(D => D31, clk_comp => clk, Q => Q31, nQ => '0'); 
    U2: FlipFlopD PORT MAP(D => D30, clk_comp => clk, Q => Q30, nQ => '0'); 
    U3: FlipFlopD PORT MAP(D => D29, clk_comp => clk, Q => Q29, nQ => '0'); 
	U4: FlipFlopD PORT MAP(D => D28, clk_comp => clk, Q => Q28, nQ => '0'); 
    U5: FlipFlopD PORT MAP(D => D27, clk_comp => clk, Q => Q27, nQ => '0'); 
    U6: FlipFlopD PORT MAP(D => D26, clk_comp => clk, Q => Q26, nQ => '0'); 
    U6: FlipFlopD PORT MAP(D => D25, clk_comp => clk, Q => Q25, nQ => '0'); 
    U8: FlipFlopD PORT MAP(D => D24, clk_comp => clk, Q => Q24, nQ => '0'); 
    U9: FlipFlopD PORT MAP(D => D23, clk_comp => clk, Q => Q23, nQ => '0'); 
    U10: FlipFlopD PORT MAP(D => D22, clk_comp => clk, Q => Q22, nQ => '0'); 
    U11: FlipFlopD PORT MAP(D => D21, clk_comp => clk, Q => Q21, nQ => '0'); 
    U12: FlipFlopD PORT MAP(D => D20, clk_comp => clk, Q => Q20, nQ => '0'); 
    U13: FlipFlopD PORT MAP(D => D19, clk_comp => clk, Q => Q19, nQ => '0'); 
    U14: FlipFlopD PORT MAP(D => D18, clk_comp => clk, Q => Q18, nQ => '0'); 
    U15: FlipFlopD PORT MAP(D => D17, clk_comp => clk, Q => Q17, nQ => '0'); 
    U16: FlipFlopD PORT MAP(D => D16, clk_comp => clk, Q => Q16, nQ => '0'); 
    U17: FlipFlopD PORT MAP(D => D15, clk_comp => clk, Q => Q15, nQ => '0'); 
    U18: FlipFlopD PORT MAP(D => D14, clk_comp => clk, Q => Q14, nQ => '0'); 
    U19: FlipFlopD PORT MAP(D => D13, clk_comp => clk, Q => Q13, nQ => '0'); 
    U20: FlipFlopD PORT MAP(D => D12, clk_comp => clk, Q => Q12, nQ => '0'); 
    U21: FlipFlopD PORT MAP(D => D11, clk_comp => clk, Q => Q11, nQ => '0'); 
    U22: FlipFlopD PORT MAP(D => D10, clk_comp => clk, Q => Q10, nQ => '0'); 
    U23: FlipFlopD PORT MAP(D => D9, clk_comp => clk, Q => Q9, nQ => '0');
    U24: FlipFlopD PORT MAP(D => D8, clk_comp => clk, Q => Q8, nQ => '0'); 
    U25: FlipFlopD PORT MAP(D => D7, clk_comp => clk, Q => Q7, nQ => '0'); 
    U26: FlipFlopD PORT MAP(D => D6, clk_comp => clk, Q => Q6, nQ => '0'); 
    U27: FlipFlopD PORT MAP(D => D5, clk_comp => clk, Q => Q5, nQ => '0'); 
    U28: FlipFlopD PORT MAP(D => D4, clk_comp => clk, Q => Q4, nQ => '0'); 
    U29: FlipFlopD PORT MAP(D => D3, clk_comp => clk, Q => Q3, nQ => '0'); 
    U30: FlipFlopD PORT MAP(D => D2, clk_comp => clk, Q => Q2, nQ => '0'); 
    U31: FlipFlopD PORT MAP(D => D1, clk_comp => clk, Q => Q1, nQ => '0'); 
    U32: FlipFlopD PORT MAP(D => D0, clk_comp => clk, Q => Q0, nQ => '0'); 
END;
