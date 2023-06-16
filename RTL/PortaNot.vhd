entity Porta_NOT is
    port (
        X : in bit;   
        Y    : out bit   
    );
end Porta_NOT;

architecture Behav of Porta_NOT is
begin
    Y <= not(X);   
end Behav;