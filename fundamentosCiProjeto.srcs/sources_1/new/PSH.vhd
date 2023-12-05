library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity PSH is
    Port (
         clk : in std_logic;
         G1 : in std_logic_vector(7 downto 0);
         G2 : in std_logic_vector(7 downto 0)
        );
end PSH;

architecture Behavioral of PSH is

    signal saidaLogicaG: std_logic_vector(15 downto 0) := (others => '0');
    signal saidaProntaG: std_logic := '0';
    signal saidaG: std_logic := '0';
    signal cont : natural := 15; 

begin

    process
        begin
        wait for 18 ns;
        saidaLogicaG <= G1 & G2;
        saidaProntaG <= '1';
    end process;
    
        process(clk)
        begin
        if rising_edge(clk) then
            if saidaProntaG = '1' then
                if cont >= 0 then
                    saidaG <= saidaLogicaG(cont);
                    cont <= cont - 1;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
