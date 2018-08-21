----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:28 08/14/2018 
-- Design Name: 
-- Module Name:    hex_to_ssg - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_to_ssg is
	port(
		hex: in std_logic_vector(3 downto 0);
		sseg: out std_logic_vector(7 downto 0);
		pos: out std_logic_vector(3 downto 0)
	);
end hex_to_ssg;

architecture Behavioral of hex_to_ssg is
begin
	pos <= "1110";
	with hex select
		sseg <=  "00000011" when "0000",
					"10011111" when "0001",
					"00100101" when "0010",
					"00001101" when "0011",
					"10011001" when "0100",
					"01001001" when "0101",
					"01000001" when "0110",
					"00011111" when "0111",
					"00000001" when "1000",
					"00011001" when "1001",
					"00010001" when "1010",
					"11000001" when "1011",
					"01100011" when "1100",
					"10000101" when "1101",
					"01100001" when "1110",
					"01110001" when others;
end Behavioral;

