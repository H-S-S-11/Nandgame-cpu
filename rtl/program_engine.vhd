--the Program engine which interfaces with the ROM

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.all;

entity program_engine is
port(
	jump_address: in std_logic_vector(15 downto 0);
    jump: in std_logic;
    cl: in std_logic;
    counter_reset: in std_logic;
    pc: out std_logic_vector(15 downto 0);
    instruction: out std_logic_vector(15 downto 0)
);
end program_engine;

architecture pe of program_engine is

signal pc_wire: std_logic_vector(15 downto 0);


component counter is
port(
	x: in std_logic_vector(15 downto 0);
    st: in std_logic;
    cl: in std_logic;
    sync_reset: in std_logic;
    
    q: out std_logic_vector(15 downto 0)    
    );
end component;

component rom is
port(
	pc: in std_logic_vector(15 downto 0);
    instruction: out std_logic_vector(15 downto 0)
);
end component;

begin

pc<=pc_wire;

count1: counter
port map(
x=>jump_address,
st=>jump,
cl=>cl,
sync_reset=>counter_reset,
q=>pc_wire
);

rom1: rom
port map(
pc=>pc_wire,
instruction=>instruction
);


end pe;



