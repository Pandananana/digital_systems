----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: MUX16x1x8 - Behavioral
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

ENTITY MUX16x1x8 IS
	PORT (
		R0, R1, R2, R3, R4, R5, R6, R7 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		R8, R9, R10, R11, R12, R13, R14, R15 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		D_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Y_Data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END MUX16x1x8;

ARCHITECTURE Behavioral OF MUX16x1x8 IS
	COMPONENT MUX16x1 IS
		PORT (
			IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8 : IN STD_LOGIC;
			IN9, IN10, IN11, IN12, IN13, IN14, IN15, IN16 : IN STD_LOGIC;
			SEL1, SEL2, SEL3, SEL4 : IN STD_LOGIC;
			O : OUT STD_LOGIC);
	END COMPONENT;

BEGIN
	MUX16x1x8_gen : FOR i IN 0 TO 7 GENERATE
		MUX16x1_gen : COMPONENT MUX16x1
			PORT MAP(
				R0(i), R1(i), R2(i), R3(i), R4(i), R5(i), R6(i), R7(i), 
				R8(i), R9(i), R10(i), R11(i), R12(i), R13(i), R14(i), R15(i),
				D_Select(0), D_Select(1), D_Select(2), D_Select(3), Y_Data(i));
		END GENERATE;
END Behavioral;