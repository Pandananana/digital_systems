----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2023 10:50:30 AM
-- Design Name: 
-- Module Name: MUX_2x1 - Behavioral
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

entity MUX2x1 is
    Port ( IN1 : in STD_LOGIC;
           IN2 : in STD_LOGIC;
           SEL : in STD_LOGIC;
           O : out STD_LOGIC);
end MUX2x1;

architecture Behavioral of MUX2x1 is

begin
    O <= (IN2 AND SEL) OR (IN1 AND (NOT SEL));

end Behavioral;
