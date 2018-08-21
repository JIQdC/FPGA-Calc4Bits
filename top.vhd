----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:19 08/14/2018 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
	port(
		sw: in std_logic_vector(7 downto 0); 			--switches de entrada
		pb: in std_logic_vector(2 downto 0);			--push buttons selectores
		sig: out std_logic;									--bit de signo
		seg: out std_logic_vector(7 downto 0);			--salida al 7seg
		p: out std_logic_vector(3 downto 0);			--selector de posicion del 7seg
		leds: out std_logic_vector(6 downto 0)			--leds de overflow
		);
end top;

architecture Behavioral of top is
	signal rsum, rres, rmult: std_logic_vector(4 downto 0);		--resultado de las operaciones en mag-sig
	signal hex: std_logic_vector(3 downto 0);							--mag del resultado de la operacion
	signal ov: std_logic;													--bit de overflow

begin
	--instancio la suma
	sum_sig_mag_unit: entity work.sum_sig_mag(Behavioral)
		--mapeo entradas a los switches, salida a la senal rsum
		port map(a => sw(7 downto 4), b => sw(3 downto 0), suma => rsum);
		
	--instancio la resta
	res_sig_mag_unit: entity work.res_sig_mag(Behavioral)
		--mapeo entradas a los switches, salida a la senal rres
		port map(a => sw(7 downto 4), b => sw(3 downto 0), resta => rres);
		
	--instancio la multiplicacion
	mult_sig_mag_unit: entity work.mult_sig_mag(Behavioral)
		--mapeo entradas a los switches, salida a la senal rmult, overflow al bit de overflow
		port map(a => sw(7 downto 4), b => sw(3 downto 0), mult => rmult, over => ov);
	
	--instancio el selector de signo
	sign_select_unit: entity work.sign_select(Behavioral)
		--entradas son los bit de signo de los resultados de las operaciones y la senal de selector, la salida es el led de signo
		port map(sum => rsum(4), res => rres(4), mult => rmult(4), sel => pb, sign => sig);
		
	--instancio el selector de magnitud
	mag_select_unit: entity work.mag_select(Behavioral)
		--entradas son las magnitudes de los resultados de las operaciones y la senal de selector, la salida es la senal hex
		port map(sum => rsum(3 downto 0), res => rres(3 downto 0), mult => rmult(3 downto 0), sel => pb, mag => hex);
		
	--instancio el prendeluces
	prende_leds_unit: entity work.prende_leds(Behavioral)
		--entrada es el bit de overflow y la senal de seleccion, salida son los leds de overflow
		port map(flag => ov, sel => pb, leds => leds);
		
	--instancio el conversor de hex a 7seg
	hex_to_ssg_unit: entity work.hex_to_ssg(Behavioral)
		--entrada es la senal hex, salida es la senal que va al sseg y el selector de posicion
		port map(hex => hex, sseg => seg, pos => p);

end Behavioral;

