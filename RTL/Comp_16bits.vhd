library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY comp16b IS
    PORT( clkcp : IN BIT;
			 An : IN std_logic_vector(15 DOWNTO 0);
          Bn : IN std_logic_vector(15 DOWNTO 0);
          Pn : OUT BIT
    );
END;

architecture Behav of Comp16b is
begin
    process(An, Bn, clkcp)
    begin
        IF(clkcp'EVENT AND clkcp = '1' ) THEN
			if An = Bn then
            Pn <= '1';
			else
            Pn <= '0';
			end if;
		  end if;
    end process;
end architecture Behav;