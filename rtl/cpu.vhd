--the cpu comes together!

library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity cpu is
port(
	cl: in std_logic;
    pc: out std_logic_vector(15 downto 0);
    j_reg: out std_logic_vector(15 downto 0);
    d_reg_o: out std_logic_vector(15 downto 0);
    pc_reset: in std_logic
);
end cpu;

architecture structure of cpu is

signal jump: std_logic;
signal instruction: std_logic_vector(15 downto 0);
signal j_reg_wire: std_logic_vector(15 downto 0);
signal pc_wire: std_logic_vector(15 downto 0);


component program_engine is
port(
	jump_address: in std_logic_vector(15 downto 0);
    jump: in std_logic;
    cl: in std_logic;
	counter_reset: in std_logic;
    pc: out std_logic_vector(15 downto 0);
    instruction: out std_logic_vector(15 downto 0)
);
end component;

component control_unit is
port(
	instruction: in std_logic_vector(15 downto 0);
    pc: in std_logic_vector(15 downto 0);
    cl: in std_logic;
    
    j_reg: out std_logic_vector(15 downto 0);
    d_reg_o: out std_logic_vector(15 downto 0);
    jump: out std_logic
    );
end component;    
    
begin



pe1: program_engine
port map(
jump_address=>j_reg_wire,
jump=>jump,
cl=>cl,
counter_reset=>pc_reset,
pc=>pc_wire,
instruction=>instruction
);
    
cu1: control_unit
port map(
instruction=>instruction,
pc=>pc_wire,
cl=>cl,
j_reg=>j_reg_wire,
d_reg_o=>d_reg_o,
jump=>jump
);

j_reg<=j_reg_wire;
pc<=pc_wire;

end structure;    
    
    
