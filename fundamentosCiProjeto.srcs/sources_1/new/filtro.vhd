library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity filtro is
  Port (
    clk : in std_logic;
    X1paralelo : in std_logic_vector(7 downto 0);
    X2paralelo : in std_logic_vector(7 downto 0)
  );
end filtro;

architecture Behavioral of filtro is
  signal Resultado: std_logic_vector(15 downto 0):= "0000000000000000";
  signal a11 : std_logic_vector(7 downto 0) := "00000001"; -- Coeficiente a11
  signal a12 : std_logic_vector(7 downto 0) := "00000010"; -- Coeficiente a12
  signal a21 : std_logic_vector(7 downto 0) := "00000011"; -- Coeficiente a21
  signal a22 : std_logic_vector(7 downto 0) := "00000100"; -- Coeficiente a22
  constant um_sobre_raiz_de_2 : real := 1.0 / sqrt(2.0);

  signal produto_intermediario1 : std_logic_vector(15 downto 0) := (others => '0');
  signal produto_intermediario2 : std_logic_vector(15 downto 0) := (others => '0');
  signal resultado_interno : std_logic_vector(15 downto 0) := (others => '0');
    
begin

  process(clk)
  begin
    -- Calculando o produto matricial
    produto_intermediario1 <= (others => '0');
    produto_intermediario2 <= (others => '0');
    
    produto_intermediario1 <= a11 * X1paralelo + a12 * X2paralelo;
    produto_intermediario2 <= a21 * X1paralelo + a22 * X2paralelo;

    resultado_interno <= produto_intermediario1(15 downto 0) + produto_intermediario2(15 downto 0);
  end process;

  Resultado <= resultado_interno;

end Behavioral;
