-- Testbench for unary alu
library IEEE;
--library work;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
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
    
    --variable cycles: integer range 0 to 5000;
    
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
    
    --run prog
    --cycles :=0;
    while (not (pc_out=x"00a0")) loop
      cl_in<='1';
      wait for 1 ns;
      cl_in<='0';
      wait for 1 ns;
      --report "loop";
      --cycles := cycles + 1;
    end loop;

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
