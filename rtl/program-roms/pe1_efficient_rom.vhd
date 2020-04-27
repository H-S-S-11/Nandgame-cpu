--the ROM
--put program in here
--uses j extension

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

rom(8)<=x"000a"; --store 10 in jump reg
rom(9)<=x"c880"; 
rom(10)<=x"0000"; --test_num loop 1 start
rom(11)<=x"9890"; --copy RAM to data 
rom(12)<=x"0001"; --access RAM(1)
rom(13)<=x"9088"; --data+RAM to RAM
rom(14)<=x"0003"; 
rom(15)<=x"8090"; --data+3 to data
rom(16)<=x"0000";
rom(17)<=x"8288"; --copy data to RAM
rom(18)<=x"0064";  
rom(19)<=x"84d1"; --data - a to data, jump if <0

rom(20)<=x"0000";
rom(21)<=x"8a88"; --store 0 in RAM(0)

rom(22)<=x"0018"; --store 24 in jump reg
rom(23)<=x"c880";
rom(24)<=x"0003"; --test_num loop 2 start
rom(25)<=x"9dc8"; --increment RAM(3)
rom(26)<=x"0000";
rom(27)<=x"9890"; --copy RAM(0) to data
rom(28)<=x"0005";
rom(29)<=x"8090"; --data + 5 to data
rom(30)<=x"0002";
rom(31)<=x"9088"; --data + RAM(2) to RAM(2)

rom(32)<=x"0000";
rom(33)<=x"8288"; --copy data to RAM(0)
rom(34)<=x"005f"; --load 95 to a
rom(35)<=x"84d0"; --data - a to data
rom(36)<=x"0004";
rom(37)<=x"8288"; --copy data to RAM(4)
rom(38)<=x"0003";
rom(39)<=x"9890"; --copy RAM(3) to data
rom(40)<=x"0002"; --load 2 to a
rom(41)<=x"84d0"; --data - a to data

rom(42)<=x"0004"; 
rom(43)<=x"9011"; --data & RAM(4) to data, jump if <0

rom(44)<=x"0003"; 
rom(45)<=x"8a88"; --store 0 in RAM(3)
rom(46)<=x"0000";
rom(47)<=x"9890"; --copy RAM(0) to data
rom(48)<=x"0005";
rom(49)<=x"8090"; --data+5 to data

rom(50)<=x"0000";
rom(51)<=x"8288"; --copy data to RAM(0)
rom(52)<=x"005f"; --load 95 to a
rom(53)<=x"84d1"; --data - a to data, jump if d<0


rom(54)<=x"0001";
rom(55)<=x"9890"; --copy RAM(1) to data
rom(56)<=x"0002"; 
rom(57)<=x"90a0"; --data+RAM(2) to a

rom(58)<=x"c880"; --a to j
rom(59)<=x"8890"; --a to data
rom(60)<=x"7fff";
rom(61)<=x"8288"; --data to sevenseg
rom(62)<=x"0000"; --end of program



--end of program

end mem_array;



