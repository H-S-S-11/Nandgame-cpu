--address_int register, data register and 64*2K of RAM
--the _dereference suffix is used with the meaning of a * in C
--0x7fff is the 7 seg display
library IEEE;
library work;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.all;

entity memory is
port(
	a: in std_logic;
    d: in std_logic;
    a_dereference: in std_logic;
    j: in std_logic;
    x: in std_logic_vector(15 downto 0);
    cl: in std_logic;

	a_reg: out std_logic_vector(15 downto 0);
    d_reg: out std_logic_vector(15 downto 0);
    a_data: out std_logic_vector(15 downto 0);
    j_reg: out std_logic_vector(15 downto 0);
    seven_seg: out std_logic_vector(15 downto 0)
    
);
end memory;

architecture combined_memory of memory is

type fifteen_bit_memory_block is array(32767 downto 0) of std_logic_vector(15 downto 0);
signal memory: fifteen_bit_memory_block;
signal address: std_logic_vector(15 downto 0);
signal address_int: integer range 0 to 32767;

begin

address_int<=to_integer(unsigned(address));
a_data<=memory(address_int);
a_reg<=address;
seven_seg<=memory(32767);

process(cl)
begin
if (cl'event and (cl='1')) then 
	if (a='1') then
    	address<=X;
	end if;
    if (d='1') then
    	d_reg<=X;
	end if;
    if (a_dereference='1') then
    	memory(address_int)<=X;
    end if;
    if (j='1') then
        j_reg<=X;
    end if;
end if;

end process;

end combined_memory;