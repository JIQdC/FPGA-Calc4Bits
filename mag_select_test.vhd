--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:56:29 08/21/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Solchu/My Documents/Projects/Calc4Bits/mag_select_test.vhd
-- Project Name:  Calc4Bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mag_select
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mag_select_test IS
END mag_select_test;
 
ARCHITECTURE behavior OF mag_select_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mag_select
    PORT(
         sel : IN  std_logic_vector(2 downto 0);
         sum : IN  std_logic_vector(3 downto 0);
         res : IN  std_logic_vector(3 downto 0);
         mult : IN  std_logic_vector(3 downto 0);
         mag : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal sum : std_logic_vector(3 downto 0) := (others => '0');
   signal res : std_logic_vector(3 downto 0) := (others => '0');
   signal mult : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal mag : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mag_select PORT MAP (
          sel => sel,
          sum => sum,
          res => res,
          mult => mult,
          mag => mag
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		--fijo valores aleatorios a las magnitudes
		sum <= "1010";
		res <= "1100";
		mult <= "0101";
		
		--fijo la senal de seleccion para que muestre la multiplicacion
		sel <= "100";
      wait for 1ns;
		--me fijo que la magnitud sea la de la multiplicacion
		assert mag = "0101" report "no selecciona la mult" severity failure;
		
		--fijo la senal de seleccion para que muestre la suma
		sel <= "001";
      wait for 1ns;
		--me fijo que la magnitud sea la de la suma
		assert mag = "1010" report "no selecciona la suma" severity failure;
		
		--fijo la senal de seleccion para que muestre la resta
		sel <= "010";
      wait for 1ns;
		--me fijo que la magnitud sea la de la resta
		assert mag = "1100" report "no selecciona la resta" severity failure;
		
		--fijo senal de seleccion nula
		sel <= "000";
		wait for 1ns;
		--me fijo que la magnitud sea nula
		assert mag = "0000" report "no muestra cero cuando no hay botones" severity failure;
		
		--fijo senal de seleccion con mas de un boton
		sel<= "110";
		--me fijo que la magnitud sea nula
		assert mag = "0000" report "no muestra cero cuando hay mas de un boton" severity failure;
		
		assert false report "todo bien :D" severity failure;
		
   end process;

END;
