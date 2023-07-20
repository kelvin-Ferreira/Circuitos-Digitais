library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Reg16x16 is
    Port (
        CLK       : IN STD_LOGIC;
        DATA_IN   : IN STD_LOGIC_VECTOR(15 downto 0);
        W_addr    : IN STD_LOGIC_VECTOR(3 downto 0);
        Rp_addr   : IN STD_LOGIC_VECTOR(3 downto 0);
        Rq_addr   : IN STD_LOGIC_VECTOR(3 downto 0);
        W_enable  : IN STD_LOGIC;
        Rp_rd     : IN STD_LOGIC;
        Rq_rd     : IN STD_LOGIC;
        DATA1_OUT : OUT STD_LOGIC_VECTOR(15 downto 0);
        DATA2_OUT : OUT STD_LOGIC_VECTOR(15 downto 0)
    );
end Reg16x16;

architecture Behav OF Reg16x16 is
    type reg_array is array (0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
    signal REG : reg_array;


    signal read_data_Rp : STD_LOGIC_VECTOR(15 downto 0);
    signal read_data_Rq : STD_LOGIC_VECTOR(15 downto 0);

begin

    process (CLK)
    begin
        if rising_edge(CLK) then
            if W_enable = '1' then
                REG(TO_INTEGER(unsigned(W_addr))) <= DATA_IN;
            end if;

            if Rp_rd = '1' then
                
                read_data_Rp <= REG(TO_INTEGER(unsigned(Rp_addr)));
                
                DATA1_OUT <= read_data_Rp;
            end if;

            if Rq_rd = '1' then
                
                read_data_Rq <= REG(TO_INTEGER(unsigned(Rq_addr)));
                
                DATA2_OUT <= read_data_Rq;
            end if;
        end if;
    end process;

end Behav;
