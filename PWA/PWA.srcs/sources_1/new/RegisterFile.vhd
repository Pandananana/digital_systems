----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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

entity RegisterFile is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RW : in STD_LOGIC;
           DA,AA,BA : in STD_LOGIC_VECTOR (3 downto 0);
           D_Data : in STD_LOGIC_VECTOR (7 downto 0);
           A_Data,B_Data : out STD_LOGIC_VECTOR (7 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

begin


end Behavioral;
