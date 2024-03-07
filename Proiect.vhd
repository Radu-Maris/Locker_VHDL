library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Locker is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           buton : in  STD_LOGIC;
           anod : out  STD_LOGIC_VECTOR(3 downto 0);
           catod : out  STD_LOGIC_VECTOR(6 downto 0);
			  selectare: in STD_LOGIC;
			  LIBER_OCUPAT: inout STD_LOGIC:='0'
			  );
end Locker;

architecture Arch_Lock of Locker is

component counter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           buton : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR(3 downto 0));
end component counter;

component SSD is
    Port ( CLK : in STD_LOGIC;
			  digit0 : in  STD_LOGIC_VECTOR(3 downto 0);
           digit1 : in  STD_LOGIC_VECTOR(3 downto 0);
           digit2 : in  STD_LOGIC_VECTOR(3 downto 0);
           digit3 : in  STD_LOGIC_VECTOR(3 downto 0);
           ANOD : out   STD_LOGIC_VECTOR(3 downto 0);
           CATOD : out  STD_LOGIC_VECTOR(6 downto 0));
end component SSD;

component memorie_ram is
Port ( clk : in STD_LOGIC;
		adresa_ram : in STD_LOGIC_VECTOR (3 downto 0);
		we : in STD_LOGIC;
		date_in : in STD_LOGIC_VECTOR (3 downto 0);
		date_out : out STD_LOGIC_VECTOR (3 downto 0));
end component memorie_ram;

component debouncer is
    Port ( b : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           b_o : out  STD_LOGIC);
end component debouncer;

component divizor is
Port ( 	clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			clk_divizat : out STD_LOGIC);
end component divizor;

component Codificare is
	Port ( 	rst : in  STD_LOGIC;
           clk_div : in  STD_LOGIC;
			  v: in STD_LOGIC; 
			  y: inout STD_LOGIC_VECTOR(3 downto 0);
			  LIBER_OCUPAT: inout STD_LOGIC:='0';
			  g,h,j: inout STD_LOGIC_VECTOR(3 downto 0)
			  );
end component Codificare;

signal y: std_logic_vector(3 downto 0);
signal x,v: std_logic;
signal clk_div: std_logic;
signal g,h,j: STD_LOGIC_VECTOR(3 downto 0);

begin

	R1: debouncer port map (buton,clk,x);	
	R2: debouncer port map (selectare,clk,v);
	R3: divizor port map(clk,rst,clk_div);
	R4: counter port map (rst,x,up_down,buton,y);
	R5: Codificare port map(rst,clk_div,v,y,LIBER_OCUPAT,g,h,j);
	R6: SSD port map (clk,g,h,j,y,anod,catod);
	

end Arch_Lock;

