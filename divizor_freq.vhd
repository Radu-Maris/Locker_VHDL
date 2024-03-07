library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divizor is
Port ( 	clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			clk_divizat : out STD_LOGIC);
end divizor;

architecture Behavioral of divizor is

signal counter:integer:=0;
signal semnal_divizat:std_logic:='0';

begin
	process(clk,reset)
	begin
	if reset='1' then counter<=0;
	elsif clk='1' and clk'event then
		if counter=8000000 then
			counter<=0;
			semnal_divizat<=not(semnal_divizat);
		else
			counter<=counter+1;
		end if;
	end if;
end process;

clk_divizat<=semnal_divizat;
end Behavioral;