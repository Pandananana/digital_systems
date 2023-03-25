----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 10:26:10 AM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ProgramCounter IS
    PORT (
        RESET : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        Adress_In : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        PS : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        Offset : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        PC : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END ProgramCounter;

ARCHITECTURE Behavioral OF ProgramCounter IS

BEGIN
    process_PC : PROCESS (RESET, CLK)

        VARIABLE PC_var : STD_LOGIC_VECTOR (7 DOWNTO 0);

    BEGIN
        IF RESET = '1' THEN
            PC_var := x"00";
        ELSIF rising_edge(CLK) THEN
            IF PS = "01" THEN
                PC_var := PC_var + 1;
            ELSIF PS = "10" THEN
                PC_var := PC_var + Offset;
            ELSIF PS = "11" THEN
                PC_var := Adress_In;
            END IF;
        END IF;
        PC <= PC_var;
    END PROCESS;

END Behavioral;