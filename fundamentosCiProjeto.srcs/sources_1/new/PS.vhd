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

signal saida1: std_logic_vector(7 downto 0);
signal saida2: std_logic_vector(7 downto 0);

begin

    process(clk)
        begin
            saida1 <= Y1;
            saida2 <= Y2;
        end process;

end Behavioral;
