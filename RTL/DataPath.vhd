library ieee;
use ieee.std_logic_1164.all;

ENTITY DataPath IS
    PORT(CLK, n1, n0 : IN BIT;
        N, ty : IN BIT_VECTOR(15 DOWNTO 0);
        P : OUT BIT;
        Ds1, Ds2 : OUT BIT_VECTOR(15 DOWNTO 0));
END;

ARCHITECTURE behav OF DataPath IS
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
            C: OUT INTEGER RANGE 65535 DOWNTO 0);
    END COMPONENT;

    COMPONENT comp16b is
        PORT( An : IN BIT_VECTOR(15 DOWNTO 0);
		    Bn : IN BIT_VECTOR(15 DOWNTO 0);
            P: OUT BIT);
    END COMPONENT;

    COMPONENT Reg16b is
        PORT(clk_R, ld: IN BIT;
		    D: IN BIT_VECTOR(15 DOWNTO 0);
		    Q: OUT BIT_VECTOR(15 DOWNTO 0));
    END COMPONENT;
    
BEGIN

END;