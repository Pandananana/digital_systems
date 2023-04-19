----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: NegZero - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NegZero is
    Port ( MUXF : in STD_LOGIC_VECTOR (7 downto 0);
           N,Z : out STD_LOGIC);
end NegZero;

architecture Behavioral of NegZero is

begin
    Z <= NOT (MUXF(7) OR MUXF(6) OR MUXF(5) OR MUXF(4) OR MUXF(3) OR MUXF(2) OR MUXF(1) OR MUXF(0));
    N <= MUXF(7);

end Behavioral;
