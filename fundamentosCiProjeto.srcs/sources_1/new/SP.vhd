library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity SP is
Port ( 
    clk : in std_logic;
    entrada : in std_logic
    --X1paralelo : out std_logic_vector(7 downto 0);
    --X2paralelo : out std_logic_vector(7 downto 0)
  );
end SP;

architecture Behavioral of SP is

 signal primeira_vez_alto : std_logic := '0';
 signal contx1 : natural := 0; 
 signal contx2 : natural := 0; 
 
 signal X1paralelo : std_logic_vector(7 downto 0) := (others => '0');
 signal X2paralelo : std_logic_vector(7 downto 0) := (others => '0');
  
begin
 process(clk)
  begin
    if rising_edge(clk) then    
        if entrada = '1' and primeira_vez_alto = '0' then
            primeira_vez_alto <= '1';  -- Sinal "entrada" ficou alto pela primeira vez
            --report "Sinal 'entrada' ficou alto pela primeira vez, comece a salvar no buffer.";
        end if;
    
        if primeira_vez_alto = '1' then
            if contx1 <= 7 then
                X1paralelo(contx1) <= entrada;
            else
                X2paralelo(contx2) <= entrada;
                contx2 <= contx2 + 1;
            end if;
            
            contx1 <= contx1 + 1;         
        end if;
    end if;
  end process;


end Behavioral;