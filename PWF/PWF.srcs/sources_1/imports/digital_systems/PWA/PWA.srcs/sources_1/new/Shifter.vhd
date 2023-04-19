----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: Shifter - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Shifter IS
    PORT (
        B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        H_Select : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        h : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END Shifter;

ARCHITECTURE Behavioral OF Shifter IS

BEGIN
    h <= B                  WHEN H_Select = "00" ELSE
        '0' & B(7 DOWNTO 1) WHEN H_Select = "01" ELSE
        B(6 DOWNTO 0) & '0' WHEN H_Select = "10" ELSE
        B;

END Behavioral;