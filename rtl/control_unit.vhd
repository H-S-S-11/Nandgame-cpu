--decodes and executes an instruction


library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity control_unit is
port(
	instruction: in std_logic_vector(15 downto 0);
    pc: in std_logic_vector(15 downto 0);
    cl: in std_logic;
    
    j_reg: out std_logic_vector(15 downto 0);
    jump: out std_logic
    );
end control_unit;
    
architecture cu of control_unit is

	component condition is
	port(	
      input: in std_logic_vector(15 downto 0);

      less_than: in std_logic;
      equal: in std_logic;
      greater_than: in std_logic;

      q: out std_logic
    );
	end component;
    
    component decoder is
    port(
        instruction: in std_logic_vector(15 downto 0);

        computation_instruction: out std_logic;

        sm: out std_logic; --source
        s_pc: out std_logic; --take source from pc

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
    end component;
    
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
    
    component memory is
    port(
        a: in std_logic;
        d: in std_logic;
        a_dereference: in std_logic; --a is for address
        j: in std_logic;
        x: in std_logic_vector(15 downto 0);
        cl: in std_logic;

        a_reg: out std_logic_vector(15 downto 0);
        d_reg: out std_logic_vector(15 downto 0);
        a_data: out std_logic_vector(15 downto 0);
        j_reg: out std_logic_vector(15 downto 0)

    );
    end component;

--decoder outputs-----
signal computation_instruction: std_logic;
signal sm: std_logic; --source
signal s_pc: std_logic;

signal zx: std_logic; --flags for alu
signal nx: std_logic;
signal zy: std_logic;
signal ny: std_logic;
signal f: std_logic;
signal no: std_logic;

signal a: std_logic; --flags for memory
signal d: std_logic;
signal a_dereference: std_logic;
signal j: std_logic;

signal greater_than: std_logic; --flags for condition
signal equal: std_logic;
signal less_than: std_logic;

signal word: std_logic_vector(15 downto 0);
---------------------------------------------

signal alu_result: std_logic_vector(15 downto 0);

--memory outputs
signal d_reg: std_logic_vector(15 downto 0);
signal a_data: std_logic_vector(15 downto 0);
signal a_reg: std_logic_vector(15 downto 0);
---------------------
signal memory_input: std_logic_vector(15 downto 0);
signal alu_y_in: std_logic_vector(15 downto 0);

begin

instruction_decoder: decoder
port map(
instruction=>instruction,
computation_instruction=>computation_instruction,
sm=>sm,
s_pc=>s_pc,
zx=>zx,
nx=>nx,
zy=>zy,
ny=>ny,
f=>f,
no=>no,
a=>a,
d=>d,
a_dereference=>a_dereference,
j=>j,
greater_than=>greater_than,
equal=>equal,
less_than=>less_than,
word=>word
);

alu1: alu
port map(
zx=>zx,
nx=>nx,
zy=>zy,
ny=>ny,
f=>f,
no=>no,
x=>d_reg,
y=>alu_y_in,
q=>alu_result
);

condition1: condition
port map(
input=>alu_result,
greater_than=>greater_than,
equal=>equal,
less_than=>less_than,
q=>jump
);

combined_memory: memory
port map(
a=>a,
d=>d,
a_dereference=>a_dereference,
j=>j,
x=>memory_input,
cl=>cl,
a_reg=>a_reg,
d_reg=>d_reg,
a_data=>a_data,
j_reg=>j_reg
);

alu_y_in <= pc when (s_pc='1') else
            a_reg when (sm='0') else
			a_data when (sm='1');

memory_input <= word when (computation_instruction='0') else
				alu_result when (computation_instruction='1');

end cu;