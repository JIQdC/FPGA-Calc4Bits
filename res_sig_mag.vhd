----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:21:48 08/15/2018 
-- Design Name: 
-- Module Name:    res_sig_mag - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity res_sig_mag is
	port(
		a: in std_logic_vector(3 downto 0);
		b: in std_logic_vector(3 downto 0);
		resta: out std_logic_vector(4 downto 0)
	);
end res_sig_mag;

architecture Behavioral of res_sig_mag is
	signal a_ext, b_ext, res_ext: unsigned(3 downto 0);
	signal aux: std_logic_vector(3 downto 0);

begin
	aux <= (not (b(3)) & b (2 downto 0));
	--instancio la suma
	sum_sig_mag_unit: entity work.sum_sig_mag(Behavioral)
		--mapeo entradas con las entradas de la resta, negando la segunda, salida al resultado de la resta
		port map(a => a, b => aux, suma => resta);
	
end Behavioral;

