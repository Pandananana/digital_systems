----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 10:26:10 AM
-- Design Name: 
-- Module Name: ZeroFiller - Behavioral
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

entity ZeroFiller2 is
    Port (  X : in STD_LOGIC_VECTOR (7 downto 0);
            Y : out STD_LOGIC_VECTOR (15 downto 0));
end ZeroFiller2;

architecture Behavioral of ZeroFiller2 is

begin
    Y <= "00000000" & X;

end Behavioral;
