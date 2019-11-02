--a 16 bit counter
library IEEE;
library work;
use IEEE.std_logic_1164.all;
use work.all;

entity counter is
port(
	x: in std_logic_vector(15 downto 0);
    st: in std_logic;
    cl: in std_logic;
    sync_reset: in std_logic;
    
    q: out std_logic_vector(15 downto 0)    
    );
end counter;

architecture count_arch of counter is


component add_16 is
port(
	a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    input_c: in std_logic;
    
    s: out std_logic_vector(15 downto 0);
    output_c: out std_logic);
end component;

signal plus_one: std_logic_vector(15 downto 0);

begin
	increment: add_16
    port map(
    a => q,
    b => x"0001",
    input_c => '0',
    s => plus_one);

	
	process(cl)
    begin
    if (cl'event and (cl='1')) then
        if sync_reset = '1' then
         	q <= x"0000";
        elsif st = '1' then
        	q <= x;
         else
    		q <= plus_one;
         end if;
    end if;
    end process;


end count_arch;