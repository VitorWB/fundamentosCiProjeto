library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity filtroHG is
    Port ( 
    clk : in std_logic;
    H1paralelo : in std_logic_vector(7 downto 0);
    H2paralelo : in std_logic_vector(7 downto 0);
    rst : in std_logic
  );
end filtroHG;

architecture Behavioral of filtroHG is

    signal b11 : std_logic_vector(7 downto 0) := "00000001"; -- Coeficiente b11
    signal b12 : std_logic_vector(7 downto 0) := "00000010"; -- Coeficiente b12
    signal b21 : std_logic_vector(7 downto 0) := "00000011"; -- Coeficiente b21
    signal b22 : std_logic_vector(7 downto 0) := "00000100"; -- Coeficiente b22
    constant um_sobre_raiz_de_2: std_logic_vector(15 downto 0) := "1011010100000100";
    
    signal G1SemRaiz : std_logic_vector(15 downto 0) := (others => '0');
    signal G2SemRaiz : std_logic_vector(15 downto 0) := (others => '0');
    
    signal G1ComRaiz: std_logic_vector(31 downto 0) := (others => '0');
    signal G2ComRaiz: std_logic_vector(31 downto 0) := (others => '0');
    
    signal G1: std_logic_vector(7 downto 0) := (others => '0');
    signal G2: std_logic_vector(7 downto 0) := (others => '0');

begin
    PSH1 : entity work.PSH port map(clk, G1, G2);
    
    process(clk, rst)
        begin
            if rst = '1' then
                b11 <= "00000000";
                b12 <= "00000000";
                b21 <= "00000000";
                b22 <= "00000000";
            end if;
        
            G1SemRaiz <= b11 * H1paralelo + b12 * H2paralelo;
            G2SemRaiz <= b21 * H1paralelo + b22 * H2paralelo;
            
            G1ComRaiz <= G1SemRaiz * um_sobre_raiz_de_2;
            G2ComRaiz <= G2SemRaiz * um_sobre_raiz_de_2;
            
            G1 <= G1ComRaiz(23 downto 16);
            G2 <= G2ComRaiz(23 downto 16);
            
        end process;

end Behavioral;
