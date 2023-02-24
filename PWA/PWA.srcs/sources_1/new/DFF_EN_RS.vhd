----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2023 04:20:01 PM
-- Design Name: 
-- Module Name: DFF_EN_RS - Behavioral
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

ENTITY DFF_EN_RS IS
    PORT (
        D : IN STD_LOGIC;
        Reset : IN STD_LOGIC;
        Load : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END DFF_EN_RS;

ARCHITECTURE Behavioral OF DFF_EN_RS IS

BEGIN
    PROCESS (Clk, Reset, Load) IS
    BEGIN
        IF reset = '1' THEN
            Q <= '0';
        ELSIF rising_edge(clk) THEN
            IF Load = '1' THEN
                Q <= D;
            END IF;
        END IF;
    END PROCESS;
END Behavioral;