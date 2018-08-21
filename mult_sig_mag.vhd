----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:02 08/15/2018 
-- Design Name: 
-- Module Name:    mult_sig_mag - Behavioral 
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

entity mult_sig_mag is
	port(
		a: in std_logic_vector(3 downto 0);
		b: in std_logic_vector(3 downto 0);
		mult: out std_logic_vector(4 downto 0);
		over: out std_logic
	);
end mult_sig_mag;

architecture Behavioral of mult_sig_mag is
	signal a_ext, b_ext: unsigned(2 downto 0);
	signal mult_ext: unsigned(5 downto 0);

begin
	a_ext <= unsigned(std_logic_vector(a(2 downto 0)));
	b_ext <= unsigned(std_logic_vector(b(2 downto 0)));
	
	--hago overflow cuando la multiplicacion se pasa de 15
	over <=  '1' when ((a_ext * b_ext)>15) else
				'0';
	
	--en todos los casos la multiplicacion siempre multiplica las magnitudes
	mult_ext<= a_ext * b_ext;
	
	--y el signo es XOR de los signos de los operandos
	mult <=  (a(3) xor b(3)) & std_logic_vector(mult_ext(3 downto 0));
	
end Behavioral;

