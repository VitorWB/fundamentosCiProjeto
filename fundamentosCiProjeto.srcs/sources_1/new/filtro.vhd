library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity filtro is
  Port ( 
    --clk : in std_logic;
    --gambiarra : in std_logic
    X1paralelo : in std_logic_vector(7 downto 0);
    X2paralelo : in std_logic_vector(7 downto 0)
  );
end filtro;

architecture Behavioral of filtro is


    
begin

    --SP1 : entity work.SP port map(clk, entrada, X1paralelo, X2paralelo);
    --SP1 : entity work.SP port map(X1paralelo, X2paralelo);

end Behavioral;