-- Testbench for 
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

component add_16 is
port(
	a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    input_c: in std_logic;
    
    s: out std_logic_vector(15 downto 0);
    output_c: out std_logic);
end component;    

signal a_in, b_in, s_out: std_logic_vector(15 downto 0);
signal input_c_in, output_c_out: std_logic;

begin

Design_Under_Test: add_16
port map(
a => a_in,
b => b_in,
input_c => input_c_in,
s => s_out,
output_c => output_c_out);

	process
	begin
    
    a_in <= x"00FF";
    b_in <= x"FF00";
    input_c_in <='1';
    wait for 1 ns;
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
