-- Testbench for unary alu
library IEEE;
--library work;
use IEEE.std_logic_1164.all;
--use work.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is


component condition is
port(	
    input: in std_logic_vector(15 downto 0);
    
    less_than: in std_logic;
    equal: in std_logic;
    greater_than: in std_logic;
    
    q: out std_logic
    );
end component;

signal x_in: std_logic_vector(15 downto 0);
signal lt_in, eq_in, gt_in: std_logic;
signal q_out: std_logic;
--signal cl_in: std_logic;

begin

Design_Under_Test: condition
port map(
input=>x_in,
less_than=>lt_in,
equal=>eq_in,
greater_than=>gt_in,
q=>q_out
);

	process
	begin
    
    lt_in<='0';
    eq_in<='1';
    gt_in<='0';
    
    x_in<=x"0000";
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    eq_in<='0';
    wait for 1 ns;
    
    lt_in<='1';
	wait for 1 ns;
    x_in<=x"ffff";    
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    lt_in<='0';
    wait for 1 ns;
    
    gt_in<='1';
    wait for 1 ns;
    
    x_in<=x"0001";
    wait for 1 ns;
    
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    
    wait for 1 ns;
    
    
   
    
    
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
