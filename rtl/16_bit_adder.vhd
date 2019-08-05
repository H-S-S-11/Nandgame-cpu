--a 16 bit adder
library IEEE;
library work;
use IEEE.std_logic_1164.all;
use work.all;

entity add_16 is
port(
	a: in std_logic_vector(15 downto 0);
    b: in std_logic_vector(15 downto 0);
    input_c: in std_logic;
    
    s: out std_logic_vector(15 downto 0);
    output_c: out std_logic);
end add_16;    

    
architecture add of add_16 is
		

    component full_adder is
    port(
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;

        h: out std_logic;
        l: out std_logic
    );
    end component;
	
    signal internal_carry: std_logic_vector(14 downto 0);

	begin
    
    add0: full_adder
    port map(
    a => a(0),
    b => b(0),
    c => input_c,
    h => internal_carry(0),
    l=>	s(0));
    
    add1: full_adder
    port map(
    a => a(1),
    b => b(1),
    c => internal_carry(0),
    h => internal_carry(1),
    l=>	s(1));
    
    add2: full_adder
    port map(
    a => a(2),
    b => b(2),
    c => internal_carry(1),
    h => internal_carry(2),
    l=>	s(2));
    
    add3: full_adder
    port map(
    a => a(3),
    b => b(3),
    c => internal_carry(2),
    h => internal_carry(3),
    l=>	s(3));
    
    add4: full_adder
    port map(
    a => a(4),
    b => b(4),
    c => internal_carry(3),
    h => internal_carry(4),
    l=>	s(4));
    
    add5: full_adder
    port map(
    a => a(5),
    b => b(5),
    c => internal_carry(4),
    h => internal_carry(5),
    l=>	s(5));
    
    add6: full_adder
    port map(
    a => a(6),
    b => b(6),
    c => internal_carry(5),
    h => internal_carry(6),
    l=>	s(6));
    
    add7: full_adder
    port map(
    a => a(7),
    b => b(7),
    c => internal_carry(6),
    h => internal_carry(7),
    l=>	s(7));
    
    add8: full_adder
    port map(
    a => a(8),
    b => b(8),
    c => internal_carry(7),
    h => internal_carry(8),
    l=>	s(8));
    
    add9: full_adder
    port map(
    a => a(9),
    b => b(9),
    c => internal_carry(8),
    h => internal_carry(9),
    l=>	s(9));
    
    add10: full_adder
    port map(
    a => a(10),
    b => b(10),
    c => internal_carry(9),
    h => internal_carry(10),
    l=>	s(10));
    
    add11: full_adder
    port map(
    a => a(11),
    b => b(11),
    c => internal_carry(10),
    h => internal_carry(11),
    l=>	s(11));
    
    add12: full_adder
    port map(
    a => a(12),
    b => b(12),
    c => internal_carry(11),
    h => internal_carry(12),
    l=>	s(12));
    
    add13: full_adder
    port map(
    a => a(13),
    b => b(13),
    c => internal_carry(12),
    h => internal_carry(13),
    l=>	s(13));
    
    add14: full_adder
    port map(
    a => a(14),
    b => b(14),
    c => internal_carry(13),
    h => internal_carry(14),
    l=>	s(14));
    
    add15: full_adder
    port map(
    a => a(15),
    b => b(15),
    c => internal_carry(14),
    h => output_c,
    l=>	s(15));
     
    
    
        
end add;