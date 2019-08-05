--checks the input against the condition flags greater than, less than, equal
--(to zero)


library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity condition is
port(	
    input: in std_logic_vector(15 downto 0);
    
    less_than: in std_logic;
    equal: in std_logic;
    greater_than: in std_logic;
    
    q: out std_logic
    );
end condition;

architecture sens of condition is


begin


condition_check: process(input, less_than, equal, greater_than)

variable less_than_true: boolean;
variable equal_true: boolean;
variable intermediate_1: boolean;
variable greater_than_true: boolean;


begin
	
   	less_than_true := (less_than='1' and input(15)='1');    	
    equal_true := (equal='1' and input=x"0000");
    
    intermediate_1 := (greater_than='1' and input(15)='0');
	greater_than_true :=  (intermediate_1 and not (input=x"0000"));
    
	if equal_true or greater_than_true or less_than_true then
		q<='1';
    else
    	q<='0';
	end if;

end process;

end sens;
