LIBRARY ieee;
USE ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

ENTITY contadorCres IS
	PORT(
		clk: IN BIT; --entrada de clock
		reset: IN BIT;
		tc: IN BIT;
		C: OUT std_logic_vector(15 DOWNTO 0)); --saída de dados
END contadorCres;

ARCHITECTURE behav OF contadorCres IS
	BEGIN PROCESS(clk,reset,tc)
		VARIABLE qv: INTEGER RANGE 65535 DOWNTO 0; --variável para a saida
		BEGIN
			IF(reset = '1') THEN
				qv := 0;
			ELSIF(clk ' event and clk = '1' and tc = '1') THEN
				IF(qv >= 65535) THEN
					qv := qv;
				ELSE
					qv := qv+1;
				END IF;
			END IF;
			C <= std_logic_vector(to_unsigned(qv, C'length));
	END PROCESS;
END;