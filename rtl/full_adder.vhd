-- a full adder
library IEEE; 
use IEEE.std_logic_1164.all;


entity full_adder is
port(
	a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    
    h: out std_logic;
    l: out std_logic
);
end full_adder;

architecture addition of full_adder is
	
    signal a_b_lsb: std_logic;
    
    begin
    
    a_b_lsb <= a xor b;
    l <= a_b_lsb xor c;
    h <= (a and b) or (a_b_lsb and c);
    
end addition;
    