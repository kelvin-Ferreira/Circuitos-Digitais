LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY contadorCres IS
	PORT(
		clk: IN BIT; --entrada de clock
		reset: IN BIT;
		tc: OUT BIT;
		Q: OUT INTEGER RANGE 15 DOWNTO 0); --saída de dados
END contadorCres;

ARCHITECTURE behav OF contadorCres IS
	BEGIN PROCESS(clk,reset)
		VARIABLE qv: INTEGER RANGE 15 DOWNTO 0; --variável para a saida
		BEGIN
			IF(reset = '1') THEN
				qv := 0;
				tc <= '0';
			ELSIF(clk ' event and clk = '1') THEN
				IF(qv >= 15) THEN
					tc <= '1';
					qv := 0;
				ELSE
					tc <= '0';
					qv := qv+1;
				END IF;
			END IF;
			Q <= qv;
	END PROCESS;
END;

