----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:01 08/15/2018 
-- Design Name: 
-- Module Name:    prende_leds - Behavioral 
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

entity prende_leds is
	port(
		flag: in std_logic;
		sel: in std_logic_vector(2 downto 0);
		leds: out std_logic_vector(6 downto 0)
		);
end prende_leds;

architecture Behavioral of prende_leds is
begin
	leds  <= "1111111" when (flag='1' and sel="100") else
				"0000000";

end Behavioral;

