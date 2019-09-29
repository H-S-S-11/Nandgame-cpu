--address register, data register and 64*2K of RAM
--the _data suffix is used like a * dereference
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
    j_reg: out std_logic_vector(15 downto 0)
    
);
end memory;

architecture combined_memory of memory is

type sixteen_bit_memory_block is array(65535 downto 0) of std_logic_vector(15 downto 0);
signal memory: sixteen_bit_memory_block;
signal address: integer range 0 to 65535;

begin

address<=to_integer(unsigned(a_reg));
a_data<=memory(address);

process(cl)
begin
if (cl'event and (cl='1')) then 
	if (a='1') then
    	a_reg<=X;
	end if;
    if (d='1') then
    	d_reg<=X;
	end if;
    if (a_dereference='1') then
    	memory(address)<=X;
    end if;
    if (j='1') then
        j_reg<=X;
    end if;
end if;

end process;

end combined_memory;