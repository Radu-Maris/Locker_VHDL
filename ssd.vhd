library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity SSD is
    Port ( CLK : in STD_LOGIC;
			  digit0 : in STD_LOGIC_VECTOR(3 downto 0);
           digit1 : in STD_LOGIC_VECTOR(3 downto 0);
           digit2 : in STD_LOGIC_VECTOR(3 downto 0);
           digit3 : in STD_LOGIC_VECTOR(3 downto 0);
           ANOD : out STD_LOGIC_VECTOR(3 downto 0);
           CATOD : out STD_LOGIC_VECTOR(6 downto 0)
	);
end SSD;

architecture ssd_arch of SSD is

signal numar: std_logic_vector(15 downto 0);
signal hex: std_logic_vector (3 downto 0);

begin
	process(CLK)
	begin
		if CLK = '1' and CLK'event then
			numar <= numar+1;
		end if;	
	end process;
	
	--mux4:1
	process(numar,digit0,digit1,digit2,digit3)
	begin
		case (numar(15 downto 14)) is
			when "00" => hex <= digit0;
			when "01" => hex <= digit1;
			when "10" => hex <= digit2;
			when others => hex <= digit3;
		end case;
	end process;
	
	--anod
	process(numar)
	begin
		case (numar(15 downto 14)) is
			when "00" => anod <= "1110";
			when "01" => anod <= "1101";
			when "10" => anod <= "1011";
			when others => anod <= "0111";
		end case;
	end process;
	
	--decoder
	process(hex)
	begin
		case hex is
			when "0000" => catod <= "0000001";
			when "0001" => catod <= "1001111";
			when "0010" => catod <= "0010010";
			when "0011" => catod <= "0000110";
			
			when "0100" => catod <= "1001100";
			when "0101" => catod <= "0100100";
			when "0110" => catod <= "0100000";
			when "0111" => catod <= "0001111";
	
			when "1000" => catod <= "0000000";
			when "1001" => catod <= "0000100";
			when "1010" => catod <= "0001000";
			when "1011" => catod <= "1100000";

			when "1100" => catod <= "0110001";
			when "1101" => catod <= "1000010";
			when "1110" => catod <= "0110000";
			when others => catod <= "0111000";
		end case;
	end process;
end ssd_arch;

