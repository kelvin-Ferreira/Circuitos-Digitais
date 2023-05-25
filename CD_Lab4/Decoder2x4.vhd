library ieee;
use ieee.std_logic_1164.all;

ENTITY Decode IS
	PORT(i1,i0, E: IN BIT;
		d0,d1,d2,d3 : OUT BIT);
END;

ARCHITECTURE behav OF Decode IS
BEGIN
	d0 <= E AND NOT(i1) AND NOT(i0);
	d1 <= E AND NOT(i1) AND i0;
	d2 <= E AND i1 AND NOT(i0);
	d3 <= E AND i1 AND i0;
END;