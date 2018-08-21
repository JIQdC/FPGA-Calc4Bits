--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:15:31 08/21/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Solchu/My Documents/Projects/Calc4Bits/sign_select_test.vhd
-- Project Name:  Calc4Bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sign_select
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
USE ieee.numeric_std.ALL;
 
ENTITY sign_select_test IS
END sign_select_test;
 
ARCHITECTURE behavior OF sign_select_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sign_select
    PORT(
         sel : IN  std_logic_vector(2 downto 0);
         sum : IN  std_logic;
         res : IN  std_logic;
         mult : IN  std_logic;
         sign : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal sum : std_logic := '0';
   signal res : std_logic := '0';
   signal mult : std_logic := '0';

 	--Outputs
   signal sign : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sign_select PORT MAP (
          sel => sel,
          sum => sum,
          res => res,
          mult => mult,
          sign => sign
        );


   -- Stimulus process
   stim_proc: process
   begin	
	
		wait for 1ns;
		
		--fijo la senal de seleccion para que muestre la suma
		sel <= "001";
		--asigno un valor
		sum <= '0';
		res <= not(sum);
		mult <= not(sum);
		wait for 2ns;
		--me fijo que el signo seleccionado sea correcto
		assert sign = '0' report "no selecciona la suma sig '0'" severity failure;
		--asigno un valor
		sum <= '1';
		res <= not(sum);
		mult <= not(sum);
		wait for 2ns;
		--me fijo que el signo seleccionado sea correcto
		assert sign = '1' report "no selecciona la suma sig '1'" severity failure;
		
		--fijo la senal de seleccion para que muestre la multiplicacion
		sel <= "100";
      wait for 1ns;
		--asigno un valor
		mult <= '0';
		res <= not(mult);
		sum <= not(mult);
		wait for 2ns;
		--me fijo que el signo seleccionado sea correcto
		assert sign = '0' report "no selecciona la mult sig '0'" severity failure;
		--asigno un valor
		mult <= '1';
		res <= not(mult);
		sum <= not(mult);
		wait for 2ns;
		--me fijo que el signo seleccionado sea correcto
		assert sign = '1' report "no selecciona la mult sig '1'" severity failure;
		
		--fijo la senal de seleccion para que muestre la resta
		sel <= "010";
      wait for 1ns;
		--asigno un valor
		res <= '0';
		mult <= not(res);
		sum <= not(res);
		wait for 2ns;
		--me fijo que el signo seleccionado sea correcto
		assert sign = '0' report "no selecciona la res sig '0'" severity failure;
		--asigno un valor
		res <= '1';
		mult <= not(res);
		sum <= not(res);
		wait for 2ns;
		--me fijo que el signo seleccionado sea correcto
		assert sign = '1' report "no selecciona la res sig '1'" severity failure;

		--fijo senal de seleccion nula
		sel <= "000";
		wait for 1ns;
		--me fijo que el signo sea '0'
		assert sign = '0' report "no muestra '0' cuando no hay botones" severity failure;
		
		--fijo senal de seleccion con mas de un boton
		sel<= "110";
		--me fijo que el signo sea '0'
		assert sign = '0' report "no muestra '0' cuando hay mas de un boton" severity failure;
		
		assert false report "todo bien :D" severity failure;
 
   end process;

END;
