library ieee;
use ieee.std_logic_1164.all;

ENTITY comp16b IS
    PORT( An : IN BIT_VECTOR(15 DOWNTO 0);
		Bn : IN BIT_VECTOR(15 DOWNTO 0);
      P: OUT BIT);
END;

architecture Behav of Comp16b is
begin
    process(An, Bn)
    begin
        if An = Bn then
            P <= '1';
        else
            P <= '0';
        end if;
    end process;
end architecture Behav;