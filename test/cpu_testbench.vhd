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
  j_reg: out std_logic_vector(15 downto 0);
  pc_reset: in std_logic;
  
  --for memory mapped io outside the core. io is mapped at 0x4000 and above
  io_store_o: out std_logic;
  io_address_o: out std_logic_vector(13 downto 0);
  alu_o: out std_logic_vector(15 downto 0);
  io_data_i: in std_logic_vector(15 downto 0)
);
end component;

signal pc_out, j_reg_out, alu_o, io_data_i: std_logic_vector(15 downto 0);
signal io_address_o: std_logic_vector(13 downto 0);
signal reset_in, io_store_o: std_logic;
signal cl_in: std_logic;

begin

Design_Under_Test: cpu
port map(
cl=>cl_in,
pc=>pc_out,
j_reg=>j_reg_out,
pc_reset=>reset_in,

io_store_o=>io_store_o,
io_address_o=>io_address_o,
alu_o=>alu_o,
io_data_i=>io_data_i
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
