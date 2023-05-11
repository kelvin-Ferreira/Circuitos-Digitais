library ieee;
use ieee.std_logic_1164.all;

ENTITY Decode_Comp IS
	PORT(A,B,C,D,E: IN BIT; --Bit & enable
		S0,S1,S2,S3,S4,S5,S6 : OUT BIT); -- Led 0 to 6
END;

ARCHITECTURE behav OF Decode_Comp IS
	SIGNAL out_aux: BIT_VECTOR(6 DOWNTO 0);
	SIGNAL in_aux : BIT_VECTOR(4 DOWNTO 0);
BEGIN
	in_aux <= E & A & B & C & D ;
	WITH in_aux SELECT
		out_aux <= "1000000" WHEN "10000", -- Enable_on & 0
					  "1111001" WHEN "10001", -- Enable_on & 1
					  "0100100" WHEN "10010", -- Enable_on & 2
					  "0110000" WHEN "10011", -- Enable_on & 3
				     "0011001" WHEN "10100", -- Enable_on & 4
				     "0010010" WHEN "10101", -- Enable_on & 5
					  "0000010" WHEN "10110", -- Enable_on & 6
					  "1111000" WHEN "10111", -- Enable_on & 7
					  "0000000" WHEN "11000", -- Enable_on & 8
					  "0010000" WHEN "11001", -- Enable_on & 9
					  "1111111" WHEN OTHERS;  -- Enable_off or n>9

		S0 <= out_aux(0); -- Led0
		S1 <= out_aux(1); -- Led1
		S2 <= out_aux(2); -- Led2
		S3 <= out_aux(3); -- Led3
		S4 <= out_aux(4); -- Led4
		S5 <= out_aux(5); -- Led5
		S6 <= out_aux(6); -- Led6

END;
