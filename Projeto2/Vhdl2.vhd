library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY SHIFT IS
	PORT(
		x, y, z: IN  BIT;
		D, P   : IN  std_logic_vector(15 DOWNTO 0);
		Q      : OUT std_logic_vector(15 DOWNTO 0)
	);
END ENTITY SHIFT;

ARCHITECTURE behav OF SHIFT IS
BEGIN
	PROCESS (D, x, y, z)
		VARIABLE INT : integer range 0 to 65535;
	BEGIN
		INT := to_integer(unsigned(P));
		IF (x = '0' AND y = '1' AND z = '1') THEN 
			Q <= std_logic_vector(shift_left(unsigned(D), INT));
		ELSIF (x = '1' AND y = '0' AND z = '0') THEN
			Q <= std_logic_vector(shift_right(unsigned(D), INT));
		ELSE 
			Q <= D;
		END IF;
	END PROCESS;
END ARCHITECTURE behav;
