----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2023 11:00:19 AM
-- Design Name: 
-- Module Name: MUX16x1 - Behavioral
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

ENTITY MUX16x1 IS
    PORT (
        IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8 : IN STD_LOGIC;
        IN9, IN10, IN11, IN12, IN13, IN14, IN15, IN16 : IN STD_LOGIC;
        SEL1, SEL2, SEL3, SEL4 : IN STD_LOGIC;
        O : OUT STD_LOGIC);
END MUX16x1;

ARCHITECTURE Behavioral OF MUX16x1 IS
    COMPONENT MUX4x1
        PORT (
            IN1 : IN STD_LOGIC;
            IN2 : IN STD_LOGIC;
            IN3 : IN STD_LOGIC;
            IN4 : IN STD_LOGIC;
            SEL1 : IN STD_LOGIC;
            SEL2 : IN STD_LOGIC;
            O : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL O1, O2, O3, O4 : STD_LOGIC;
BEGIN
    U1 : MUX4x1 PORT MAP(IN1, IN2, IN3, IN4, SEL1, SEL2, O1);
    U2 : MUX4x1 PORT MAP(IN5, IN6, IN7, IN8, SEL1, SEL2, O2);
    U3 : MUX4x1 PORT MAP(IN9, IN10, IN11, IN12, SEL1, SEL2, O3);
    U4 : MUX4x1 PORT MAP(IN13, IN14, IN15, IN16, SEL1, SEL2, O4);

    U5 : MUX4x1 PORT MAP(O1, O2, O3, O4, SEL3, SEL4, O);
END Behavioral;