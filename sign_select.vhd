----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:27:31 08/15/2018 
-- Design Name: 
-- Module Name:    sign_select - Behavioral 
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

entity sign_select is
	port(
		sel: in std_logic_vector(2 downto 0);
		sum, res, mult: in std_logic;
		sign: out std_logic
		);
end sign_select;

architecture Behavioral of sign_select is
begin
	with sel select
		sign <=  sum when "001",
					res when "010",
					mult when "100",
					'0' when others;
end Behavioral;

