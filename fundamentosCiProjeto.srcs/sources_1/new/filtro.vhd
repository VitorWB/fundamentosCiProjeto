library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity filtro is
  Port ( 
    clk : in std_logic;
    entrada : in std_logic
  );
end filtro;

architecture Behavioral of filtro is

    signal X1paralelo : std_logic_vector(7 downto 0);
    signal X2paralelo : std_logic_vector(7 downto 0);
    
begin

    --SP1 : entity work.SP port map(clk, entrada, X1paralelo, X2paralelo);
    SP1 : entity work.SP port map(
      clk => clk,
      entrada => entrada,
      X1paralelo => X1paralelo,
      X2paralelo => X2paralelo
    );
end Behavioral;