----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2023 09:03:13 PM
-- Design Name: 
-- Module Name: TB_Full_adder_8bit - Behavioral
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

ENTITY TB_Full_adder_8bit IS
    --  Port ( );
END TB_Full_adder_8bit;

ARCHITECTURE Behavioral OF TB_Full_adder_8bit IS
    COMPONENT Full_adder_8bit IS
        PORT (
            y : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            ci : IN STD_LOGIC;
            x : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            sum : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            co : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL y : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL ci : STD_LOGIC;
    SIGNAL x : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL sum : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL co : STD_LOGIC;

BEGIN
    UUT : Full_adder_8bit PORT MAP(
        y, ci, x, sum, co
    );

    stim_proc : PROCESS
    BEGIN
        ci <= '0';
        y <= "00000000";
        x <= "11111111";
        wait for 10 ns;
        y <= "01001010";
        x <= "00000011";
        wait for 10 ns;
        y <= "01010101";
        x <= "10101010";
        wait for 10 ns;
        y <= "01010101";
        x <= "11110001";

        WAIT;
    END PROCESS;

END Behavioral;