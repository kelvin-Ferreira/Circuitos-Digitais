library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY DataPath IS
    PORT(CLKr, S2_ALU, S1_ALU, S0_ALU, RF_q, RF_p, W_wr, S1_RF, S0_RF : IN STD_LOGIC;
        R_data, RF_W_data: IN std_logic_vector(15 DOWNTO 0);
		  RF_W_addr, RF_p_addr, RF_q_addr : IN std_logic_vector(3 DOWNTO 0);
        Rp_zero : OUT STD_LOGIC;
        W_data : OUT std_logic_vector(15 DOWNTO 0));
END;

ARCHITECTURE behav OF DataPath IS
	
	CONSTANT Z0 : STD_LOGIC := '1';
	CONSTANT Z10: std_logic_vector(15 DOWNTO 0) := (others => '0');
	SIGNAL Z1, Z2, Z3, Z4: std_logic_vector(15 DOWNTO 0);
	
    COMPONENT Mux3x1_16bits is
        PORT(sc0, sc1 : IN STD_LOGIC;
		Ac : IN std_logic_vector(15 DOWNTO 0);
		Bc : IN std_logic_vector(15 DOWNTO 0);
		Cc : IN std_logic_vector(15 DOWNTO 0);
		d : OUT std_logic_vector(15 DOWNTO 0));
    END COMPONENT;

    COMPONENT comp16b is
        PORT(clkcp : IN std_LOGIC;
				An : IN std_logic_vector(15 DOWNTO 0);
				Bn : IN std_logic_vector(15 DOWNTO 0);
            Pn: OUT std_LOGIC);
    END COMPONENT;
	 
	 COMPONENT ALU_16b IS
		 PORT(clk, e, xn, yn, zn: IN STD_LOGIC;
		 An: in std_logic_vector(15 DOWNTO 0); 
		 Bn : in std_logic_vector(15 DOWNTO 0);
		 S : OUT std_logic_vector(15 DOWNTO 0));
	 END COMPONENT;
	
	COMPONENT Reg16x16 IS
    PORT (
        CLK       : IN STD_LOGIC;
        DATA_IN   : IN std_logic_vector(15 downto 0);
        W_addr    : IN STD_LOGIC_VECTOR(3 downto 0);
        Rp_addr   : IN STD_LOGIC_VECTOR(3 downto 0);
        Rq_addr   : IN STD_LOGIC_VECTOR(3 downto 0);
        W_enable  : IN STD_LOGIC;
        Rp_rd     : IN STD_LOGIC;
        Rq_rd     : IN STD_LOGIC;
        DATA1_OUT : OUT STD_LOGIC_VECTOR(15 downto 0);
        DATA2_OUT : OUT STD_LOGIC_VECTOR(15 downto 0)
    );
	 END COMPONENT Reg16x16;
BEGIN
	
	U1: Reg16x16 PORT MAP(CLK => CLKr, DATA_IN => Z4, W_Addr => RF_W_addr, Rp_addr => RF_p_addr, Rq_addr => RF_q_addr,
									W_Enable => W_wr, Rp_rd => RF_p, Rq_rd => RF_q, DATA1_OUT => Z1, DATA2_OUT => Z2);
	U2: ALU_16b PORT MAP(clk => CLKr, e => Z0, xn => S2_ALU, yn => S1_ALU, zn => S0_ALU, An => Z1, Bn => Z2, S => Z3);
	U3: comp16b PORT MAP(clkcp => CLKr, An => Z1, Bn => Z10, Pn => Rp_zero);
	U4: mux3x1_16bits PORT MAP(Sc0 => S0_RF, Sc1 => S1_RF, Ac => RF_W_data, Bc => R_data, Cc => Z3, d => Z4);
	W_data <= z1;
END;