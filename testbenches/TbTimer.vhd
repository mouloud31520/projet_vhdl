library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TbTimer is
end entity TbTimer;

architecture rtl of TbTimer is
    constant CLK_PER : time := 20 ns;
    signal Clk : std_logic;
    signal SRst: std_logic;
    signal TimerOverflow : std_logic;
    signal TimerCounter : std_logic_vector(3 downto 0);
    signal Prescaler : std_logic_vector (3 downto 0);
    signal Autoreload: std_logic_vector (3 downto 0);
begin
    
    pClk: process
    begin
        Clk <= '1';
        wait for CLK_PER / 2;
        Clk <= '0';
        wait for CLK_PER / 2;
    end process pClk;
    
    pRst: process
    begin
        SRst <= '1';
        wait for 30 ns;
        SRst <= '0';
        wait ; --for 1 ms;
    end process pRst;
    
    

    timer_inst : entity work.timer
    generic map (
        P => 4
    )
    port map(
        Clock   => Clk,
        Enable  => '1',
        Reset   => Srst,
        Prescaler   => Prescaler, --prescaler == (PSC + 1) 
        Autoreload  => Autoreload, --autoreload == (ARR + 1) 
        coUEV   => TimerOverflow, --counter overflow update event
        tim_counter => TimerCounter
    );


    Prescaler <= x"4"; -- PSC = (Prescaler - 1) => Prescaler = PSC + 1 
    -- donc là on divise par 5 pas par 4
    Autoreload <= x"3"; -- ARR = (Autoreload - 1) => Autoreload = ARR + 1 


end architecture rtl;