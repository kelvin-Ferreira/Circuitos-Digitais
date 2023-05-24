LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY latchD IS
PORT(D, c : IN BIT;
 Q, nQ : OUT BIT);
END;
ARCHITECTURE behav OF latchD IS
BEGIN
    PROCESS (D, c)
    BEGIN
        IF (c = '1') THEN 
        Q <= D;
        nQ <= NOT(D);
        END IF;
    END PROCESS ;
END;
