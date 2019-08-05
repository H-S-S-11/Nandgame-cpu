--the ROM and Program Counter
--put program in here

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

architecture mem_array of program_engine is

type sixteen_bit_memory_block is array(65535 downto 0) of std_logic_vector(15 downto 0);
signal rom: sixteen_bit_memory_block;
signal address: integer range 0 to 65535;

component counter is
port(
	x: in std_logic_vector(15 downto 0);
    st: in std_logic;
    cl: in std_logic;
    sync_reset: in std_logic;
    
    q: out std_logic_vector(15 downto 0)    
    );
end component;

begin

count1: counter
port map(
x=>jump_address,
st=>jump,
cl=>cl,
sync_reset=>counter_reset,
q=>pc
);

address<=to_integer(unsigned(pc));
instruction<=rom(address);

--put program here

rom(0)<=x"0000";
rom(1)<=x"0001";

--end of program

end mem_array;



