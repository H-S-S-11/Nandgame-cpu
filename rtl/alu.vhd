--The alu performs one or more operations on
--2 16 bit inputs x and y
--6 flags select the operation
--zx: Use 0 for X
--nx: Invert X
--zy: Use 0 for Y
--ny: Invert Y
--f selects an operation:
--0: output is X AND Y 
--1: output is X + Y

--no: Invert output

library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity alu is
port(
	zx: in std_logic;
    nx: in std_logic;
    zy: in std_logic;
    ny: in std_logic;
    f: in std_logic;
    no: in std_logic;
    
    x: in std_logic_vector(15 downto 0);
    y: in std_logic_vector(15 downto 0);
    
    q: out std_logic_vector(15 downto 0)
    );
end alu;

architecture rtl of alu is
	
    component unary_alu is
	port(
	z: in std_logic;
	n: in std_logic;
	x: in std_logic_vector(15 downto 0);

	q: out std_logic_vector(15 downto 0)
    );
	end component;
    
    
    component add_16 is
	port(
	a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    input_c: in std_logic;
    
    s: out std_logic_vector(15 downto 0);
    output_c: out std_logic);
	end component;
    
    signal x_alu_result: std_logic_vector(15 downto 0);
    signal y_alu_result: std_logic_vector(15 downto 0);
    signal add_result: std_logic_vector(15 downto 0);
    signal add_carry: std_logic;
    signal f_result: std_logic_vector(15 downto 0);
    
begin

x_alu: unary_alu
port map(
z => zx,
n => nx,
x => x,
q => x_alu_result);

y_alu: unary_alu
port map(
z => zy,
n => ny,
x => y,
q => y_alu_result);

adder: add_16
port map(
a => x_alu_result,
b => y_alu_result,
input_c => '0',
s => add_result,
output_c => add_carry);

f_result <= add_result when f='1' else
			(x_alu_result and y_alu_result);
            
q <= (not f_result) when no='1' else
	  f_result;


end rtl;
