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

signal comp_instruction_wire: std_logic;

begin

comp_instruction_wire <= instruction(15);
computation_instruction <= comp_instruction_wire;

word <= instruction when comp_instruction_wire = '0' else
		x"0000";

sm <= (comp_instruction_wire and instruction(12));
s_pc <=(comp_instruction_wire and instruction(13));

zx <= (comp_instruction_wire and instruction(11));
nx <= (comp_instruction_wire and instruction(10));
zy <= (comp_instruction_wire and instruction(9));
ny <= (comp_instruction_wire and instruction(8));
f <= (comp_instruction_wire and instruction(7));
no <= (comp_instruction_wire and instruction(6));

a <= ((comp_instruction_wire and instruction(5)) or (not comp_instruction_wire));
d <= (comp_instruction_wire and instruction(4));
a_dereference <= (comp_instruction_wire and instruction(3));
j <= (comp_instruction_wire and instruction(14));

greater_than <= (comp_instruction_wire and instruction(2));
equal <= (comp_instruction_wire and instruction(1));
less_than <= (comp_instruction_wire and instruction(0));

end sel;