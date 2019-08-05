-- Testbench for unary alu
library IEEE;
--library work;
use IEEE.std_logic_1164.all;
--use work.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is


component decoder is
port(
	instruction: in std_logic_vector(15 downto 0);
    
    computation_instruction: out std_logic;
    
    sm: out std_logic; --source
    
    zx: out std_logic; --flags for alu
    nx: out std_logic;
    zy: out std_logic;
    ny: out std_logic;
    f:	out std_logic;
    no:	out std_logic;
    
    a:	out std_logic; --flags for memory
    d:	out std_logic;
    a_dereference: out std_logic;
    
    greater_than: out std_logic; --flags for condition
    equal: out std_logic;
    less_than: out std_logic;
    
	word: out std_logic_vector(15 downto 0)
    );
end component;


signal instruction_in, word_out: std_logic_vector(15 downto 0);
signal comp_instr_out, sm_out, zx_out, nx_out: std_logic;
signal zy_out, ny_out, f_out, no_out, a_out, d_out: std_logic;
signal a_deref_out, greater_out, equal_out, less_out: std_logic;
--signal cl_in: std_logic;

begin

Design_Under_Test: decoder
port map(

instruction=>instruction_in,
    
computation_instruction=>comp_instr_out,
    
sm=> sm_out,
    
zx=> zx_out, --flags for alu
nx=>nx_out,
zy=>zy_out,
ny=>ny_out,
f=>f_out,
no=>no_out,
    
a=>a_out, --flags for memory
d=>d_out,
a_dereference=>a_deref_out,
    
greater_than=>greater_out, --flags for condition
equal=>equal_out,
less_than=>less_out,
    
word=>word_out

);

	process
	begin
    
    
    instruction_in <= x"EFE0";
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    
    instruction_in <= x"E018";
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    
    instruction_in <= x"FC27";
    wait for 1 ns;
    
    --cl_in<='1';
    --wait for 1 ns;
    --cl_in<='0';
    --wait for 1 ns;
    
    
    instruction_in <= x"04D2";
    wait for 1 ns;
    
    
   
    
    
      

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
