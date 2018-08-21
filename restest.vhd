--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:10:12 08/15/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Solchu/My Documents/Projects/Calc4Bits/restest.vhd
-- Project Name:  Calc4Bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: res_sig_mag
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
 
ENTITY restest IS
END restest;
 
ARCHITECTURE behavior OF restest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT res_sig_mag
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         resta : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal resta : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: res_sig_mag PORT MAP (
          a => a,
          b => b,
          resta => resta
        );


   -- Stimulus process
   stim_proc: process
   begin	
	
	wait for 1 ns;

	--hago un doble loop de valores de a y b
	for avar in -7 to 7 loop
		--convierto el valor de avar en sig-mag
		if avar < 0 then
			a <= '1'& std_logic_vector(to_unsigned(abs(avar),3));
		else 
			a <= '0'& std_logic_vector(to_unsigned(avar,3));
		end if;
		
		for bvar in -7 to 7 loop
			--convierto el valor de bvar en sig-mag
			if bvar < 0 then
				b <= '1'& std_logic_vector(to_unsigned(abs(bvar),3));
			else 
				b <= '0'& std_logic_vector(to_unsigned(bvar,3));
			end if;
		
			--espero que ocurra la magia (?)
			wait for 1 ns;
			
			--primero chequeo que la magnitud de la resta este bien
			assert resta(3 downto 0) = std_logic_vector(to_unsigned(abs(avar-bvar),4)) report "la resta dio mal" severity failure;
			
			--despues chequeo que el signo de la resta este bien
			--notar que no chequeo el 0!
			if avar-bvar < 0 then
				assert resta(4) = '1' report "el bit de signo negativo esta mal" severity failure;
			elsif avar-bvar > 0 then
				assert resta(4) = '0' report "el bit de signo positivo esta mal" severity failure;
			end if;

		end loop;
	
	end loop;
	
	--aca respiramos nuevamente
	assert false report "todo bien :D" severity failure;    

   end process;

END;
