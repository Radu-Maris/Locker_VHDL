library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter is
    Port ( rst: in STD_LOGIC;
           clk : in STD_LOGIC;
           up_down : in STD_LOGIC;
           buton : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR(3 downto 0));
end counter;

architecture count_arch of counter is

signal count : std_logic_vector(3 downto 0):="0000";

begin

	process(rst,clk,buton,up_down)
	begin
		if(rst = '1') then count <= "0000";
		elsif clk'event and clk = '1' and buton = '1' then
			if up_down = '1' then 
				count <= count - 1;
			else
				count <= count + 1;
			end if;
		end if;
		
		end process;
		o <= count;
		
end count_arch;

