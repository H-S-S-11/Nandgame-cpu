-- Testbench for unary alu
library IEEE;
--library work;
use IEEE.std_logic_1164.all;
--use work.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is


component unary_alu is
port(
	z: in std_logic;
	n: in std_logic;
	x: in std_logic_vector(15 downto 0);

	q: out std_logic_vector(15 downto 0)
    );
end component;

signal x_in, q_out: std_logic_vector(15 downto 0);
signal z_in, n_in: std_logic;
--signal cl_in: std_logic;

begin

Design_Under_Test: unary_alu
port map(
z => z_in,
n => n_in,
x => x_in,
q=>q_out);

	process
	begin
    
    
    x_in <= x"0F0F";
    z_in <='0';
    n_in <='0';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    z_in<='0';
    n_in<='1';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    z_in<='1';
    n_in<='0';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    z_in<='1';
    n_in<='1';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
