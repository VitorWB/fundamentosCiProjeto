library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity PS is
    Port ( 
     clk : in std_logic;
     Y1 : in std_logic_vector(7 downto 0);
     Y2 : in std_logic_vector(7 downto 0)
    );
end PS;

architecture Behavioral of PS is

signal saidaLogica: std_logic_vector(15 downto 0) := (others => '0');
signal saidaPronta: std_logic := '0';
signal saida: std_logic := '0';
signal cont : natural := 15; 

begin

    process
        begin
        wait for 18 ns;
        saidaLogica <= Y1 & Y2;
        saidaPronta <= '1';
    end process;
    
    process(clk)
        begin
        if rising_edge(clk) then
            if saidaPronta = '1' then
                if cont >= 0 then
                    saida <= saidaLogica(cont);
                    cont <= cont - 1;
                end if;
            end if;
        end if;
    end process;
        

end Behavioral;
