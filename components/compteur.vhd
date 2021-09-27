library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
 
entity compteur is 
    generic ( N : integer);
    port (
        clk, en, arst_n, SRst: in std_logic;
        q   : out std_logic_vector (N-1 downto 0)
        );
end entity compteur;
 
architecture rtl of compteur is
-- on decl  are les variables d e l'architecture avant le premier begin
 
signal Q1   : std_logic_vector (n-1 downto 0);
 
 
begin
 
    pcompteur : process(clk, arst_n)
    begin 
         if arst_n = '0' then 
            Q1 <= (others => '0');
         elsif rising_edge(clk) then
            if SRst = '1' then
                Q1 <= (others => '0');
            elsif en = '1' then  -- on rising_edge == Clk'event and Clk
                Q1 <= Q1 + 1;
            end if;
         end if;
         
    end process pcompteur;
 
    q<=Q1;  
 
end architecture rtl;