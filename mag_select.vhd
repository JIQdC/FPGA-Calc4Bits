----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:32:32 08/15/2018 
-- Design Name: 
-- Module Name:    mag_select - Behavioral 
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

entity mag_select is
	port(
		sel: in std_logic_vector(2 downto 0);
		sum, res, mult: in std_logic_vector(3 downto 0);
		mag: out std_logic_vector(3 downto 0)
		);
end mag_select;

architecture Behavioral of mag_select is

begin
	with sel select
		mag <=  sum when "001",
					res when "010",
					mult when "100",
					"0000" when others;
					
end Behavioral;

