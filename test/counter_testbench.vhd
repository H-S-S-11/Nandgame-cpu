-- Testbench for 
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

component counter is
port(
	x: in std_logic_vector(15 downto 0);
    st: in std_logic;
    cl: in std_logic;
    
    q: out std_logic_vector(15 downto 0)    
    );
end component;

signal x_in, q_out: std_logic_vector(15 downto 0);
signal st_in, cl_in: std_logic;

begin

Design_Under_Test: counter
port map(
x => x_in,
st => st_in,
cl => cl_in,
q => q_out);

	process
	begin
    
    x_in <= x"0000";
    cl_in<='0';
    st_in<='1';
    wait for 1 ns;
    
    cl_in<='1';
    st_in<='0';
    wait for 1 ns;
    
    clk_loop: for k in 0 to 100 loop
      cl_in<='0';
      wait for 1 ns;
      cl_in<='1';
      wait for 1 ns;
      cl_in<='0';
      wait for 1 ns;
    end loop clk_loop;
    
    st_in<='1';
    x_in <= x"0F00";
    cl_in<='1';
    wait for 1 ns;
    
    
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
