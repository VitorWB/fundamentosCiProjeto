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

    signal a11 : std_logic_vector(7 downto 0) := "00000001"; -- Coeficiente a11
    signal a12 : std_logic_vector(7 downto 0) := "00000010"; -- Coeficiente a12
    signal a21 : std_logic_vector(7 downto 0) := "00000011"; -- Coeficiente a21
    signal a22 : std_logic_vector(7 downto 0) := "00000100"; -- Coeficiente a22
    --constant um_sobre_raiz_de_2 : real := 1.0 / sqrt(2.0);
    
    signal Y1SemRaiz : std_logic_vector(15 downto 0) := (others => '0');
    signal Y2SemRaiz : std_logic_vector(15 downto 0) := (others => '0');
    
begin

    process(clk)
        begin
            --Y1SemRaiz <= (others => '0');
            --Y2SemRaiz <= (others => '0');
            
            Y1SemRaiz <= a11 * X1paralelo + a12 * X2paralelo;
            Y2SemRaiz <= a21 * X1paralelo + a22 * X2paralelo;
        end process;

end Behavioral;