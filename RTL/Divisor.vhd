library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divisor is
    port (
        CLK : in std_logic;
        Enable : in std_logic;
        Dividend : in std_logic_vector(15 downto 0);
        Quotient : out std_logic_vector(15 downto 0);
        Remainder : out std_logic_vector(16 downto 0)
    );
end entity Divisor;

architecture Behavioral of Divisor is
    signal dividend_reg : std_logic_vector(15 downto 0);
    signal quotient_reg : std_logic_vector(15 downto 0);
    signal remainder_reg : std_logic_vector(16 downto 0);
    constant divisor : std_logic_vector(15 downto 0) := "0000000000000010";  -- Divisor fixo (25)
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if Enable = '1' then
                if signed(remainder_reg) >= signed(divisor) then
                    remainder_reg <= std_logic_vector(unsigned(remainder_reg) - unsigned(divisor));
                    quotient_reg <= quotient_reg(14 downto 0) & '1';
                else
                    quotient_reg <= quotient_reg(14 downto 0) & '0';
                end if;
                
                dividend_reg <= Dividend;
                remainder_reg <= '0' & remainder_reg(15 downto 1) & dividend_reg(15);
            end if;
        end if;
    end process;

    Quotient <= quotient_reg;
    Remainder <= remainder_reg;
end architecture Behavioral;