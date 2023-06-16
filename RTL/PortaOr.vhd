entity Porta_OR is
    port (J, K : in bit;   
       L : out bit);
end Porta_OR;

architecture Behav of Porta_OR is
begin
    L <= J or K;   
end Behav;