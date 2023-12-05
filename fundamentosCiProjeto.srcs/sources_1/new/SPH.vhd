library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity SPH is
  Port (
    clk : in std_logic;
    entradaH : in std_logic;
    rst : in std_logic
  );
end SPH;

architecture Behavioral of SPH is
    
    signal primeira_vez_alto : std_logic := '0';
    signal conth1 : natural := 0; 
    signal conth2 : natural := 0;  
    signal H1paralelo : std_logic_vector(7 downto 0) := (others => '0');
    signal H2paralelo : std_logic_vector(7 downto 0) := (others => '0');
    
begin

    filtro2 : entity work.filtroHG port map(clk, H1paralelo, H2paralelo, rst);

process(clk)
  begin  
    if rising_edge(clk) then    
        if entradaH = '1' and primeira_vez_alto = '0' then
            primeira_vez_alto <= '1';  -- Sinal "entradaH" ficou alto pela primeira vez
        end if;
    
        if primeira_vez_alto = '1' then
            if conth1 <= 7 then
                H1paralelo(conth1) <= entradaH;
            else
                H2paralelo(conth2) <= entradaH;
                conth2 <= conth2 + 1;
            end if;
            
            conth1 <= conth1 + 1;         
        end if;
    end if;
    
  end process;    
end Behavioral;
