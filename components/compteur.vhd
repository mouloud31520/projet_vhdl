library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
 
entity compteur is 
    generic ( N : integer);
    port (
            clk     : in std_logic; --horloge
            mode    : in std_logic_vector (2 downto 0); -- (UP/DOWN - discret INPUT - CLOCK = > 0 - 0 - 0)  = > compteur up - source clk => 101 + compteur up source counter_input => 110
            counter_input : in std_logic; -- autre siganl dont on doit compter les fronts montants (un cycle d'horlode de ratrd du a l'addition)
            en      : in std_logic; --enable counting or decounting
            arst_n  : in std_logic; --reset asynchrone et inverse (1 => pas de reset)
            SRst    : in std_logic; --reset synchrone
            counter_output   : out std_logic_vector (N-1 downto 0)
        );
end entity compteur;
 
architecture rtl of compteur is
-- on decl  are les variables d e l'architecture avant le premier begin
 
signal count            : std_logic_vector (N-1 downto 0) := (others => '0');
--signal countM           : std_logic_vector (N-1 downto 0);
signal counter_input_d  : std_logic := '0'; --creer un signal *_d (pour "delay", retard) pour memmoriser l'etat precedent




begin

  
    
    pCompteur : process(clk)
        variable counter_input_re : std_logic := '0'; --creer une variable *_re (rising edge) 
        begin 
            
            if arst_n = '0' then --signal reset asynchrone actif
               count <= (others => '0');
            
            elsif rising_edge(clk) then
            
                if SRst = '1' then
                    count <= (others => '0');
            
                elsif en = '1' and mode = "101" then        
                    count <= count +1;
            
                elsif en = '1' and mode = "110" then
                    counter_input_d <= counter_input;
                    counter_input_re := counter_input and ( not counter_input_d);
                    if (counter_input_re = '1') then
                        count <= count+ 1 ;
                    end if;
                    
                end if;
            end if;
        end process pCompteur;


--    pMode : process(counter_input,clk)
--    begin
--        
--        if rising_edge(clk) then
--            counter_input_d <= counter_input;
--            if en = '1' and mode = "110" then
--                counter_input_re <= counter_input and ( not counter_input_d);
--                if (counter_input_re = '1') then
--                    countM <= countM + 1;
--                end if;
--            end if;
--        end if;
--
--    end process pMode; 
    

    
    --counter_output <= count when mode = "101" else countM when mode = "110";   
    counter_output <= count;
end architecture rtl;


