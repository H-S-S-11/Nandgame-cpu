-- Testbench for unary alu
library IEEE;
library work;
use IEEE.std_logic_1164.all;
use work.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is


component memory is
port(
	a: in std_logic;
    d: in std_logic;
    a_flag: in std_logic;
    x: in std_logic_vector(15 downto 0);
    cl: in std_logic;

	a_reg: out std_logic_vector(15 downto 0);
    d_reg: out std_logic_vector(15 downto 0);
    a_data: out std_logic_vector(15 downto 0)
    
);
end component;

signal x_in, a_out, d_out, ram_out: std_logic_vector(15 downto 0);
signal a_in, d_in, a_flag_in, cl_in: std_logic;

begin

Design_Under_Test: memory
port map(
x => x_in,
a => a_in,
cl => cl_in,
d => d_in,
a_flag =>a_flag_in,
a_reg=>a_out,
d_reg=>d_out,
a_data=>ram_out);

	process
	begin
    
    
    x_in <= x"0001";
    cl_in<='0';
    a_in<='1';
    d_in<='0';
    a_flag_in<='0';
    wait for 1 ns;
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    x_in <= x"0002";
    a_in<='0';
    d_in<='1';
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    x_in <= x"0003";
    d_in<='0';
    a_flag_in<='1';
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    x_in <= x"0000";
    cl_in<='0';
    a_flag_in<='0';
    a_in<='1';
    wait for 1 ns;
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
