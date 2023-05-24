LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY contadorCres IS
PORT(
clk: IN BIT; --entrada de clock
reset: IN BIT;
Q: OUT INTEGER RANGE 15 DOWNTO 0); --saída de dados
END contadorCres;

ARCHITECTURE comportamento OF contadorCres IS
BEGIN PROCESS(clk,reset)
VARIABLE qv: INTEGER RANGE 15 DOWNTO 0; --variável para a saida
BEGIN
IF(reset = '1') THEN
qv := 0;
ELSIF(clk ' event and clk = '1') THEN
IF(qv >= 15) THEN
qv := 0;
ELSE
qv := qv+1;
END IF;
END if;
Q <= qv;
END PROCESS;
END;
