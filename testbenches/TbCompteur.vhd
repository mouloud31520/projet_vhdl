library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TbCompteur is
end entity TbCompteur;

architecture rtl of TbCompteur is
    constant CLK_PER : time := 20 ns;
    signal Clk : std_logic;
    signal arst_n: std_logic;
    signal Dsig: std_logic;
    signal Compteur : std_logic_vector(7 downto 0);
begin
    
    pArst_n: process
    begin
        arst_n <= '0';
        wait for 30 ns;
        arst_n <= '1';
        wait for 1 ms;
    end process pArst_n;
    
    pClk: process
    begin
        Clk <= '1';
        wait for CLK_PER / 2;
        Clk <= '0';
        wait for CLK_PER / 2;
    end process pClk;


    pDsig: process
    begin
        Dsig <= '1';
        wait for 65 ns;
        Dsig <= '0';
        wait for 40 ns;
    end process pDsig;

    compteur_inst : entity work.compteur
    generic map (
        N => 8
    )
    port map (
        clk => Clk,
        mode => "110",
        counter_input => Dsig,
        en => '1', --toujours enable
        arst_n => arst_n,--reset asynchrone pas utilise
        SRst => '0',
        counter_output=> Compteur


    );

end architecture rtl;