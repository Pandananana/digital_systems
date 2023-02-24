----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2023 03:41:13 PM
-- Design Name: 
-- Module Name: TB_MUX16x1x8 - Behavioral
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

ENTITY TB_MUX16x1x8 IS
    --  Port ( );
END TB_MUX16x1x8;

ARCHITECTURE Behavioral OF TB_MUX16x1x8 IS
    COMPONENT MUX16x1x8 IS
        PORT (
            R0, R1, R2, R3, R4, R5, R6, R7 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            R8, R9, R10, R11, R12, R13, R14, R15 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            D_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            Y_Data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    SIGNAL R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL R8, R9, R10, R11, R12, R13, R14, R15 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL D_Select : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL Y_Data : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
    UUT : MUX16x1x8 PORT MAP(
        R0, R1, R2, R3, R4, R5, R6, R7,
        R8, R9, R10, R11, R12, R13, R14, R15,
        D_Select, Y_Data
    );

    R0  <= "00000000";
    R1  <= "00000001";
    R2  <= "00000010";
    R3  <= "00000011";

    R4  <= "00000100";
    R5  <= "00000101";
    R6  <= "00000110";
    R7  <= "00000111";
    
    R8  <= "00001000";
    R9  <= "00001001";
    R10 <= "00001010";
    R11 <= "00001011";
    
    R12 <= "00001100";
    R13 <= "00001101";
    R14 <= "00001110";
    R15 <= "00001111";

    D_Select <= "1111";

END Behavioral;