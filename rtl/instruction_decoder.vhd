--converts a 16 bit instruction to either a data word
--or computation flags (each zx etc for an alu)

library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity decoder is
port(
	instruction: in std_logic_vector(15 downto 0);
    
    computation_instruction: out std_logic;
    
    sm: out std_logic; --source
    s_pc: out std_logic; --to take source from pc instead of a or ram
    
    zx: out std_logic; --flags for alu
    nx: out std_logic;
    zy: out std_logic;
    ny: out std_logic;
    f:	out std_logic;
    no:	out std_logic;
    
    a:	out std_logic; --flags for memory
    d:	out std_logic;
    a_dereference: out std_logic;
    j: out std_logic;
    
    greater_than: out std_logic; --flags for condition
    equal: out std_logic;
    less_than: out std_logic;
    
	word: out std_logic_vector(15 downto 0)
    );
end decoder;

architecture sel of decoder is

begin

computation_instruction <= instruction(15);

word <= instruction when computation_instruction = '0' else
		x"0000";

sm <= (computation_instruction and instruction(12));
s_pc <=(computation_instruction and instruction(13));

zx <= (computation_instruction and instruction(11));
nx <= (computation_instruction and instruction(10));
zy <= (computation_instruction and instruction(9));
ny <= (computation_instruction and instruction(8));
f <= (computation_instruction and instruction(7));
no <= (computation_instruction and instruction(6));

a <= ((computation_instruction and instruction(5)) or (not computation_instruction));
d <= (computation_instruction and instruction(4));
a_dereference <= (computation_instruction and instruction(3));
j <= (computation_instruction and instruction(14));

greater_than <= (computation_instruction and instruction(2));
equal <= (computation_instruction and instruction(1));
less_than <= (computation_instruction and instruction(0));

end sel;