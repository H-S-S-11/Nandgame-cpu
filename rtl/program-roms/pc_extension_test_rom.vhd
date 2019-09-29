--the ROM
--put program in here
--this program demonstrates the ability to read the pc
--this code will no longer work with the j extension

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.all;

entity rom is
port(
	pc: in std_logic_vector(15 downto 0);
    instruction: out std_logic_vector(15 downto 0)
);
end rom;

architecture mem_array of rom is

type sixteen_bit_memory_block is array(65535 downto 0) of std_logic_vector(15 downto 0);
signal rom: sixteen_bit_memory_block;
signal address: integer range 0 to 65535;


begin

address<=to_integer(unsigned(pc));
instruction<=rom(address);

--put program here

rom(0)<=x"0012"; --store 18 in d
rom(1)<=x"8890";
rom(2)<=x"a0a0"; --store pc+d in a
rom(3)<=x"add7"; --store pc+1 in d, jump
rom(4)<=x"0fff";
rom(20)<=x"82a0"; --store d in a
rom(21)<=x"82a7"; --jump

--end of program

end mem_array;



