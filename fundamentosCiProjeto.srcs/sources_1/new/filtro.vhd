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
    constant um_sobre_raiz_de_2: std_logic_vector(15 downto 0) := "1011010100000100";
    
    signal Y1SemRaiz : std_logic_vector(15 downto 0) := (others => '0');
    signal Y2SemRaiz : std_logic_vector(15 downto 0) := (others => '0');
    signal Y1ComRaiz: std_logic_vector(31 downto 0) := (others => '0');
    signal Y2ComRaiz: std_logic_vector(31 downto 0) := (others => '0');
    signal Y1: std_logic_vector(7 downto 0) := (others => '0');
    signal Y2: std_logic_vector(7 downto 0) := (others => '0');
    
begin
    PS1 : entity work.PS port map(clk, Y1, Y2);

    process(clk)
        begin
            Y1SemRaiz <= a11 * X1paralelo + a12 * X2paralelo;
            Y2SemRaiz <= a21 * X1paralelo + a22 * X2paralelo;
            Y1ComRaiz <= Y1SemRaiz * um_sobre_raiz_de_2;
            Y2ComRaiz <= Y2SemRaiz * um_sobre_raiz_de_2;
            Y1 <= Y1ComRaiz(23 downto 16);
            Y2 <= Y2ComRaiz(23 downto 16);
        end process;

end Behavioral;