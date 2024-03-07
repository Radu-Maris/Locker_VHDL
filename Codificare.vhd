----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:05:00 05/13/2022 
-- Design Name: 
-- Module Name:    Codificare - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Codificare is
	
	Port ( 	rst : in  STD_LOGIC;
           clk_div : in  STD_LOGIC;
			  v: in STD_LOGIC; 
			  y: inout STD_LOGIC_VECTOR(3 downto 0);
			  LIBER_OCUPAT: inout STD_LOGIC:='0';
			  g,h,j: inout STD_LOGIC_VECTOR(3 downto 0)
			  );
	
end Codificare;

architecture Behavioral of Codificare is

shared variable a,b,c,q,w,e: STD_LOGIC_VECTOR(3 downto 0):="0000";

begin

	process(clk_div,rst,v,LIBER_OCUPAT)
	variable cnt: std_logic_vector(2 downto 0):="000";
   begin
	g<=e;
	h<=q;
	j<=w;
	if rst = '1' then 
		if LIBER_OCUPAT='0' then
			cnt:="000";
			a:="0000";b:="0000";c:="0000";e:="0000";q:="0000";w:="0000";
		else 
			cnt:="011";
			e:="0000";q:="0000";w:="0000";
		end if;
	else
		if clk_div'event and clk_div = '1' and v='1' then
			case(cnt) is
			when "000" => e:=y; a:=e; 
			when "001" => q:=y; b:=q;
			when "010" => w:=y; c:=w;
			when "011" => LIBER_OCUPAT<='1';e:="0000";q:="0000";w:="0000";
			when "100" => e:=y;
			when "101" => q:=y;
			when "110" => w:=y;
			when others => if(a=e and b=q and c=w)then LIBER_OCUPAT<='0'; else  cnt:="011"; end if; e:="0000";q:="0000";w:="0000";
			end case;
			cnt:=cnt+1;
		end if;
	end if;
	end process;

end Behavioral;

