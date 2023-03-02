----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 10:26:10 AM
-- Design Name: 
-- Module Name: SignExtender - Behavioral
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

entity SignExtender is
    Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
           Extended_8 : out STD_LOGIC_VECTOR (7 downto 0));
end SignExtender;

architecture Behavioral of SignExtender is

begin
    Extended_8(0) <= IR(0);
    Extended_8(1) <= IR(1);
    Extended_8(2) <= IR(2);
    Extended_8(3) <= IR(6); 
    Extended_8(4) <= IR(7);
    Extended_8(5) <= IR(8);
    Extended_8(6) <= IR(8);
    Extended_8(7) <= IR(8); 
end Behavioral;
