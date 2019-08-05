-- Testbench for unary alu
library IEEE;
--library work;
use IEEE.std_logic_1164.all;
--use work.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

component cpu is
port(
	cl: in std_logic;
    pc: out std_logic_vector(15 downto 0);
    a_reg: out std_logic_vector(15 downto 0);
    pc_reset: in std_logic
);
end component;

signal pc_out, a_reg_out: std_logic_vector(15 downto 0);
signal reset_in: std_logic;
signal cl_in: std_logic;

begin

Design_Under_Test: cpu
port map(
cl=>cl_in,
pc=>pc_out,
a_reg=>a_reg_out,
pc_reset=>reset_in
);

	process
	begin
    
    cl_in<='0';
    wait for 1 ns;
    
    reset_in<='1';
    wait for 1 ns;   
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    reset_in<='0';
    wait for 1 ns;
    
    --start prog
    
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
          
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;  

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
