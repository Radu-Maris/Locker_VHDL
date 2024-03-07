library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer is
    Port ( b : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           b_o : out  STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
	signal q1,q2,q3:std_logic;
	
begin
	process(clk)
	begin
		if rising_edge(clk) then
			q1 <= b;
			q2 <= q1;
			q3 <= q2;
		end if;
	end process;
	
	b_o <= q1 and q2 and q3;
end Behavioral;

