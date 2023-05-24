LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY RegD IS
PORT(D3, D2, D1, D0, clk : IN BIT;
Q3, Q2, Q1, Q0 : OUT BIT);
END;

ARCHITECTURE behav OF RegD IS
    COMPONENT FlipFlopD is
        PORT(D, clk_comp : IN BIT; 
         Q, nQ : OUT BIT);
    END COMPONENT;

    BEGIN
    U1: FlipFlopD PORT MAP(D => D3, clk_comp => clk, Q => Q3, nQ => '0'); 
    U2: FlipFlopD PORT MAP(D => D2, clk_comp => clk, Q => Q2, nQ => '0'); 
    U3: FlipFlopD PORT MAP(D => D1, clk_comp => clk, Q => Q1, nQ => '0'); 
	U4: FlipFlopD PORT MAP(D => D0, clk_comp => clk, Q => Q0, nQ => '0'); 
END;