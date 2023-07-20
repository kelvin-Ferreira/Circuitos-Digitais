library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY AL IS
    PORT(x, y, z : IN STD_logic;
		A : IN std_logic_vector(15 DOWNTO 0); 
		B : IN std_logic_vector(15 DOWNTO 0);
		Icin : OUT STD_logic;
		IA : OUT std_logic_vector(15 DOWNTO 0);
		IB : OUT std_logic_vector(15 DOWNTO 0));
END;

ARCHITECTURE behav OF AL IS
BEGIN
		
	  Icin <= (NOT(x) AND y AND NOT(z));
	  IA <= A;
	  IB(0) <= (B(0) AND NOT x AND NOT y AND z) OR (NOT B(0) AND NOT x AND y AND NOT z);
	  IB(1) <= (B(1) AND NOT x AND NOT y AND z) OR (NOT B(1) AND NOT x AND y AND NOT z);
	  IB(2) <= (B(2) AND NOT x AND NOT y AND z) OR (NOT B(2) AND NOT x AND y AND NOT z);
	  IB(3) <= (B(3) AND NOT x AND NOT y AND z) OR (NOT B(3) AND NOT x AND y AND NOT z);
	  IB(4) <= (B(4) AND NOT x AND NOT y AND z) OR (NOT B(4) AND NOT x AND y AND NOT z);
	  IB(5) <= (B(5) AND NOT x AND NOT y AND z) OR (NOT B(5) AND NOT x AND y AND NOT z);
	  IB(6) <= (B(6) AND NOT x AND NOT y AND z) OR (NOT B(6) AND NOT x AND y AND NOT z);
	  IB(7) <= (B(7) AND NOT x AND NOT y AND z) OR (NOT B(7) AND NOT x AND y AND NOT z);
	  IB(8) <= (B(8) AND NOT x AND NOT y AND z) OR (NOT B(8) AND NOT x AND y AND NOT z);
	  IB(9) <= (B(9) AND NOT x AND NOT y AND z) OR (NOT B(9) AND NOT x AND y AND NOT z);
	  IB(10) <= (B(10) AND NOT x AND NOT y AND z) OR (NOT B(10) AND NOT x AND y AND NOT z);
	  IB(11) <= (B(11) AND NOT x AND NOT y AND z) OR (NOT B(11) AND NOT x AND y AND NOT z);
	  IB(12) <= (B(12) AND NOT x AND NOT y AND z) OR (NOT B(12) AND NOT x AND y AND NOT z);
	  IB(13) <= (B(13) AND NOT x AND NOT y AND z) OR (NOT B(13) AND NOT x AND y AND NOT z);
	  IB(14) <= (B(14) AND NOT x AND NOT y AND z) OR (NOT B(14) AND NOT x AND y AND NOT z);
	  IB(15) <= (B(15) AND NOT x AND NOT y AND z) OR (NOT B(15) AND NOT x AND y AND NOT z);
END;

