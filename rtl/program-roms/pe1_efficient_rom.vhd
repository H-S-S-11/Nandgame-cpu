--the ROM
--put program in here

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

rom(0)<=x"0000"; --store 0 in RAM(0)
rom(1)<=x"8a88";
rom(2)<=x"0001"; --store 0 in RAM(1)
rom(3)<=x"8a88";
rom(4)<=x"0002"; --store 0 in RAM(2)
rom(5)<=x"8a88";
rom(6)<=x"0003"; --store 0 in RAM(3)
rom(7)<=x"8a88";

rom(8)<=x"0000"; --test_num loop 1 start
rom(9)<=x"9890"; --copy RAM to data
rom(10)<=x"0001"; --access RAM(1)
rom(11)<=x"9088"; --data+RAM to RAM
rom(12)<=x"0003"; 
rom(13)<=x"8090"; --data+3 to data
rom(14)<=x"0000";
rom(15)<=x"8288"; --copy data to RAM
rom(16)<=x"0064";  
rom(17)<=x"84d0"; --data - a to data
rom(18)<=x"0008"; --load a reg with jump address (8)
rom(19)<=x"8281"; --jump if d<0

rom(20)<=x"0000";
rom(21)<=x"8a88"; --store 0 in RAM(0)

rom(22)<=x"0003"; --test_num loop 2 start
rom(23)<=x"9dc8"; --increment RAM
rom(24)<=x"0000";
rom(25)<=x"9890"; --copy RAM(0) to data
rom(26)<=x"0005";
rom(27)<=x"8090"; --data + 5 to data
rom(28)<=x"0002";
rom(29)<=x"9088"; --data + RAM(2) to RAM(2)

rom(30)<=x"0000";
rom(31)<=x"8288"; --copy data to RAM(0)
rom(32)<=x"005f"; --load 95 to a
rom(33)<=x"84d0"; --data - a to data
rom(34)<=x"0004";
rom(35)<=x"8288"; --copy data to RAM(4)
rom(36)<=x"0003";
rom(37)<=x"9890"; --copy RAM(3) to data
rom(38)<=x"0002"; --load 2 to a
rom(39)<=x"84d0"; --data - a to data

rom(40)<=x"0004"; 
rom(41)<=x"9010"; --data & RAM(4) to data
rom(42)<=x"0016"; --load a reg with jump address (22)
rom(43)<=x"8281"; --jump if d<0
rom(44)<=x"0003"; 
rom(45)<=x"8a88"; --store 0 in RAM(3)
rom(46)<=x"0000";
rom(47)<=x"9890"; --copy RAM(0) to data
rom(48)<=x"0005";
rom(49)<=x"8090"; --data+5 to data

rom(50)<=x"0000";
rom(51)<=x"8288"; --copy data to RAM(0)
rom(52)<=x"005f"; --load 95 to a
rom(53)<=x"84d0"; --data - a to data
rom(54)<=x"0016"; --load a reg with jump address (22)
rom(55)<=x"8281"; --jump if d<0

rom(56)<=x"0001";
rom(57)<=x"9890"; --copy RAM(1) to data
rom(58)<=x"0002"; 
rom(59)<=x"90a0"; --data+RAM(2) to a

rom(60)<=x"0000"; --end of program
rom(61)<=x"0000";



--end of program

end mem_array;



