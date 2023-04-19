----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: MUX2x1x8 - Behavioral
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

ENTITY MUX2x1x8 IS
    PORT (
        R, S : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        MUX_Select : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END MUX2x1x8;

ARCHITECTURE Behavioral OF MUX2x1x8 IS
    COMPONENT MUX2x1 IS
        PORT (
            IN1 : IN STD_LOGIC;
            IN2 : IN STD_LOGIC;
            SEL : IN STD_LOGIC;
            O : OUT STD_LOGIC);
    END COMPONENT;

BEGIN
    MUX2x1x8_gen : FOR i IN 0 TO 7 GENERATE
        MUX2x1_gen : MUX2x1
            PORT MAP(R(i), S(i), MUX_Select, Y(i));
        END GENERATE;
END Behavioral;