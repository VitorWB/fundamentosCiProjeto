library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity teste is
end teste;

architecture Behavioral of teste is

  signal clk, entrada : std_logic := '0';
  constant clk_period : time := 1 ns;

begin

    filtro1 : entity work.filtro port map(clk, entrada);
    SP2 : entity work.SP port map(clk, entrada);

    process
        begin
          clk <= '0';
          wait for clk_period/2;
          clk <= '1';
          wait for clk_period/2;
          clk <= '0';
          wait for clk_period/2;
          clk <= '1';
          wait for clk_period/2;
          clk <= '0';
          wait for clk_period/2;
          clk <= '1';
          wait for clk_period/2;
          clk <= '0';
          wait for clk_period/2;
          clk <= '1';
          wait for clk_period/2;
          clk <= '0';
          wait for clk_period/2;
          clk <= '1';
          wait for clk_period/2;
          wait for clk_period/2;
          clk <= '0';
          wait for clk_period/2;
          clk <= '1';
          wait for clk_period/2;
          -- ... continue com a sequência de pulsos de clock conforme necessário
          wait;
    end process;

  process
  begin
    wait for 5 * clk_period;
    entrada <= '1';  -- Altera o valor de entrada após 5 pulsos do clock
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '0';  
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '1';
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '1';
    
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '0';  
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '0';
    wait for clk_period;
    entrada <= '1';
    wait for clk_period;
    entrada <= '1';
    wait for clk_period;
    entrada <= '0';
    wait;
  end process;

end Behavioral;