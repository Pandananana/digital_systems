----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2023 11:00:19 AM
-- Design Name: 
-- Module Name: MUX4x1 - Behavioral
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

ENTITY MUX4x1 IS
    PORT (
        IN1 : IN STD_LOGIC;
        IN2 : IN STD_LOGIC;
        IN3 : IN STD_LOGIC;
        IN4 : IN STD_LOGIC;
        SEL1 : IN STD_LOGIC;
        SEL2 : IN STD_LOGIC;
        O : OUT STD_LOGIC);
END MUX4x1;

ARCHITECTURE Behavioral OF MUX4x1 IS
    COMPONENT MUX2x1
        PORT (
            IN1, IN2, SEL : IN STD_LOGIC;
            O : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL O1, O2 : STD_LOGIC;
BEGIN
    U1 : MUX2x1 PORT MAP(IN1, IN2, SEL1, O1);
    U2 : MUX2x1 PORT MAP(IN3, IN4, SEL1, O2);
    U3 : MUX2x1 PORT MAP(O1, O2, SEL2, O);
END Behavioral;