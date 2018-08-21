----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:21 08/14/2018 
-- Design Name: 
-- Module Name:    sum_sig_mag - Behavioral 
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

entity sum_sig_mag is
	port(
		a: in std_logic_vector(3 downto 0);
		b: in std_logic_vector(3 downto 0);
		suma: out std_logic_vector(4 downto 0)
	);
end sum_sig_mag;

architecture Behavioral of sum_sig_mag is
	signal a_ext, b_ext, sum_ext: unsigned(3 downto 0);

begin
	process(a,b,a_ext,b_ext,sum_ext)
	begin
		a_ext <= unsigned('0' & std_logic_vector(a(2 downto 0)));
		b_ext <= unsigned('0' & std_logic_vector(b(2 downto 0)));
		--si el bit de signo es igual, sumo normalmente y copio bit de signo
		if (a(3)=b(3)) then
			sum_ext <= a_ext + b_ext;
			suma <= (a(3) & std_logic_vector(sum_ext));
		--si el bit de signo es distinto, resto el mayor al menor, y el bit de signo del resultado
		--es el mayor de los dos operandos
		elsif(a_ext > b_ext) then
			sum_ext <= a_ext - b_ext;
			suma <= (a(3) & std_logic_vector(sum_ext));
		else
			sum_ext <= b_ext - a_ext;
			suma <= (b(3) & std_logic_vector(sum_ext));
		end if;
	end process;

end Behavioral;

