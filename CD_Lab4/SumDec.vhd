LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY contadorDec IS
	PORT(
		clk: IN BIT; --entrada de clock
		reset: IN BIT;
		tc: OUT BIT;
		Q: OUT INTEGER RANGE 15 DOWNTO 0); --saída de dados
END contadorDec;

ARCHITECTURE behav OF contadorDec IS
	BEGIN PROCESS(clk,reset)
		VARIABLE qv: INTEGER RANGE 15 DOWNTO 0; --variável para a saida
		BEGIN
			IF(reset = '1') THEN
				qv := 15;
				tc <= '0';
			ELSIF(clk ' event and clk = '1') THEN
				IF(qv <= 0) THEN
					tc <= '1';
					qv := 15;
				ELSE
					tc <= '0';
					qv := qv-1;
				END IF;
			END IF;
			Q <= qv;
	END PROCESS;
END;

