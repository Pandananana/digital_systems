----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2023 11:38:18 AM
-- Design Name: 
-- Module Name: TB_MUX4x1 - Behavioral
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

ENTITY TB_MUX4x1 IS
    -- Port ( IN1 : in STD_LOGIC;
    --        IN2 : in STD_LOGIC;
    --        IN3 : in STD_LOGIC;
    --        IN4 : in STD_LOGIC;
    --        SEL1 : in STD_LOGIC;
    --        SEL2 : in STD_LOGIC;
    --        O : in STD_LOGIC);
END TB_MUX4x1;

ARCHITECTURE Behavioral OF TB_MUX4x1 IS
    COMPONENT MUX4x1
        PORT (
            IN1, IN2, IN3, IN4, SEL1, SEL2 : IN STD_LOGIC;
            O : OUT STD_LOGIC);
    END COMPONENT;

    signal I : std_logic_vector (3 downto 0);

BEGIN
END Behavioral;