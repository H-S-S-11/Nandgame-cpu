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
rom(1)<=x"0005";
rom(2)<=x"8890"; --copy a to d
rom(3)<=x"0000";
rom(4)<=x"8288"; --copy d to ram
rom(5)<=x"0003";
rom(6)<=x"8890";
rom(7)<=x"0001";
rom(8)<=x"8288";
rom(9)<=x"0000";
rom(10)<=x"8890";
rom(11)<=x"0002";
rom(12)<=x"8288";
rom(13)<=x"0001";
rom(14)<=x"8890";
rom(15)<=x"0003";
rom(16)<=x"8288";
rom(17)<=x"0064"; --store 100
rom(18)<=x"8890"; --copy a to d
rom(19)<=x"0004"; 
rom(20)<=x"8288"; --copy d to ram
rom(21)<=x"0003";
rom(22)<=x"9890"; --copy ram to d
rom(23)<=x"0000";
rom(24)<=x"94d0"; --d-ram to d
rom(25)<=x"0017"; --store 23
rom(26)<=x"8284"; --jump if d>0
rom(27)<=x"0064"; --store 100
rom(28)<=x"8282"; --jump if d=0
rom(29)<=x"0003";
rom(30)<=x"9890"; --copy ram to d
rom(31)<=x"0001";
rom(32)<=x"94d0"; --d-ram to d
rom(33)<=x"001f"; --store 31
rom(34)<=x"8284"; --jump if d>0
rom(35)<=x"0064"; --store 100
rom(36)<=x"8282"; --jump if d=0
rom(37)<=x"0003";
rom(38)<=x"9dc8"; --inc ram to ram
rom(39)<=x"9890"; --copy ram to d
rom(40)<=x"0004";
rom(41)<=x"94d0"; --d-ram to d
rom(42)<=x"0015"; --store 21
rom(43)<=x"8281"; --jump if d<0
rom(44)<=x"0002";
rom(45)<=x"9890"; --copy ram to d
rom(46)<=x"82a0"; --copy d to a
rom(47)<=x"00a0"; --store 160
rom(48)<=x"8287"; --jump

rom(100)<=x"0003";
rom(101)<=x"9890"; --copy ram to d
rom(102)<=x"0002";
rom(103)<=x"9088"; --d+ram to ram
rom(104)<=x"0025"; --store 37
rom(105)<=x"8287"; --jump

rom(150)<=x"0000";
rom(151)<=x"0000";



--end of program

end mem_array;



