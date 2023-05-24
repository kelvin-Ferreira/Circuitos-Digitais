LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY FlipFlopD IS
PORT(D, clk : IN BIT;
Q, nQ : OUT BIT);
END;
ARCHITECTURE behav OF FlipFlopD IS
BEGIN
PROCESS (D, clk)
BEGIN
IF (clk'EVENT AND clk = '1') THEN 
Q <= D;
nQ <= NOT(D);
END IF;
END PROCESS ;
END;