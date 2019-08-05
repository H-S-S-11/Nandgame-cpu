-- Testbench for unary alu
library IEEE;
--library work;
use IEEE.std_logic_1164.all;
--use work.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is


component control_unit is
port(
	instruction: in std_logic_vector(15 downto 0);
    cl: in std_logic;
    
    a_reg: out std_logic_vector(15 downto 0);
    jump: out std_logic
    );
end component;

signal i_in, a_out: std_logic_vector(15 downto 0);
signal j_out: std_logic;
signal cl_in: std_logic;

begin

Design_Under_Test: control_unit
port map(
instruction=>i_in,
a_reg=>a_out,
jump=>j_out,
cl=>cl_in
);

	process
	begin
    
    cl_in<='0';
    
    i_in<=x"0002";
    wait for 1 ns;
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    
    i_in<=x"8890";    
    wait for 1 ns;
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    
    i_in<=x"80a0";
    wait for 1 ns;
    
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    i_in<=x"80a0";
    wait for 1 ns;
    
    
    cl_in<='1';
    wait for 1 ns;
    cl_in<='0';
    wait for 1 ns;
    
    wait for 1 ns;
    
    
       
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
