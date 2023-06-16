entity Porta_AND is
    port (
        F, G : in bit;   
        H    : out bit   
    );
end Porta_AND;

architecture Behav of Porta_AND is
begin
    H <= F and G;   
end Behav;