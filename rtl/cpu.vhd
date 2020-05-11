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
    seven_seg_o: out std_logic_vector(15 downto 0);
    pc_reset: in std_logic;

    --for memory mapped io outside the core. io is mapped at 0x4000 and above
    io_store_o: out std_logic;
    io_address_o: out std_logic_vector(13 downto 0);
    alu_o: out std_logic_vector(15 downto 0);
    io_data_i: in std_logic_vector(15 downto 0)
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
    seven_seg_o: out std_logic_vector(15 downto 0);
    jump: out std_logic;

    --for memory mapped io outside the core. io is mapped at 0x4000 and above
    io_store_o: out std_logic;
    io_address_o: out std_logic_vector(13 downto 0);
    alu_o: out std_logic_vector(15 downto 0);
    io_data_i: in std_logic_vector(15 downto 0)
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
seven_seg_o=>seven_seg_o,
jump=>jump,

--for memory mapped io
io_store_o=>io_store_o,
io_address_o=>io_address_o,
alu_o=>alu_o,
io_data_i=>io_data_i
);

j_reg<=j_reg_wire;
pc<=pc_wire;

end structure;    
    
    
