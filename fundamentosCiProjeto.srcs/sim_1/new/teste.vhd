library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;

entity teste is
end teste;

architecture Behavioral of teste is

  signal clk, entrada, rst : std_logic := '0';
  signal entradaH : std_logic := '0';
  constant clk_period : time := 1 ns;
  
begin

    SP2 : entity work.SP port map(clk, entrada, rst);
    SPH2 : entity work.SPH port map(clk, entradaH, rst);

  process
  begin
    while true loop
      clk <= not clk;
      wait for clk_period/2;
    end loop;
  end process;

  process
  begin
    wait for 5 * clk_period;
    entrada <= '1';  -- Altera o valor de entrada após 5 pulsos do clock
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
    entrada <= '0';
    wait for clk_period;
    entrada <= '1';  
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
    wait;
  end process;
  
  
  -- entrada de H
  
  
    process
  begin
    wait for 5 * clk_period;
      entradaH <= '1';  -- Altera o valor de entrada após 5 pulsos do clock
      wait for clk_period;
      entradaH <= '1';
      wait for clk_period;
      entradaH <= '0';  
      wait for clk_period;
      entradaH <= '1';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
      
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '1';  
      wait for clk_period;
      entradaH <= '1';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
      wait for clk_period;
      entradaH <= '0';
    wait;
  end process;

end Behavioral;