-- Testbench for unary alu
library IEEE;
--library work;
use IEEE.std_logic_1164.all;
--use work.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is


component alu is
port(
	zx: in std_logic;
    nx: in std_logic;
    zy: in std_logic;
    ny: in std_logic;
    f: in std_logic;
    no: in std_logic;
    
    x: in std_logic_vector(15 downto 0);
    y: in std_logic_vector(15 downto 0);
    
    q: out std_logic_vector(15 downto 0)
    );
end component;

signal x_in, y_in, q_out: std_logic_vector(15 downto 0);
signal zx_in, nx_in, zy_in, ny_in, f_in, no_in: std_logic;
--signal cl_in: std_logic;

begin

Design_Under_Test: alu
port map(
zx => zx_in,
nx => nx_in,
zy => zy_in,
ny => ny_in,
f => f_in,
no => no_in,

x => x_in,
y => y_in,
q=>q_out);

	process
	begin
    
    
    x_in <= x"0F0F";
    y_in <= x"F0F0";
    
    zx_in <='0';
    nx_in <='0';
    zy_in <='0';
    ny_in <='0';
    f_in <='0';
    no_in <='0';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    x_in <= x"0F0F";
    y_in <= x"F0F0";
    
    zx_in <='1';
    nx_in <='0';
    zy_in <='0';
    ny_in <='0';
    f_in <='1';
    no_in <='1';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    x_in <= x"0F0F";
    y_in <= x"F0F0";
    
    zx_in <='1';
    nx_in <='1';
    zy_in <='1';
    ny_in <='0';
    f_in <='1';
    no_in <='0';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    x_in <= x"0F0F";
    y_in <= x"00F2";
    
    zx_in <='0';
    nx_in <='0';
    zy_in <='0';
    ny_in <='0';
    f_in <='1';
    no_in <='0';
    wait for 1 ns;
    
    x_in <= x"0FF0";
    y_in <= x"F0F0";
    
    zx_in <='0';
    nx_in <='1';
    zy_in <='1';
    ny_in <='1';
    f_in <='1';
    no_in <='1';
    wait for 1 ns;
    
    x_in <= x"0F0F";
    y_in <= x"F0F0";
    
    zx_in <='0';
    nx_in <='0';
    zy_in <='1';
    ny_in <='1';
    f_in <='1';
    no_in <='0';
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
