--A Unary ALU modifies a single input X. Two flags select which operations to apply.
--If z (zero) is 1, then 0 is output instead of the input
--If n (negate) is 1, then the input is inverted
--The order is significant, so if both are 1, the output will be the inversion of 0.

library work;
library IEEE;
use work.all;
use IEEE.std_logic_1164.all;

entity unary_alu is
port(
	z: in std_logic;
	n: in std_logic;
	x: in std_logic_vector(15 downto 0);

	q: out std_logic_vector(15 downto 0)
    );
end unary_alu;

architecture rtl of unary_alu is

signal z_result: std_logic_vector(15 downto 0);

begin

z_result <= x"0000" when z='1' else
            x;
        
q <= not z_result when n='1' else
     z_result;

end rtl;