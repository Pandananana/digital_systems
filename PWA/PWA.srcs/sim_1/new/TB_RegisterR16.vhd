----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2023 05:27:49 PM
-- Design Name: 
-- Module Name: TB_RegisterR16 - Behavioral
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

ENTITY TB_RegisterR16 IS
    --  Port ( );
END TB_RegisterR16;

ARCHITECTURE Behavioral OF TB_RegisterR16 IS
    COMPONENT RegisterR16 IS
        PORT (
            RESET : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            LOAD : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            D_Data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            R0, R1, R2, R3, R4, R5, R6, R7 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            R8, R9, R10, R11, R12, R13, R14, R15 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    SIGNAL RESET : STD_LOGIC;
    SIGNAL CLK : STD_LOGIC;
    SIGNAL LOAD : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL D_Data : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL R8, R9, R10, R11, R12, R13, R14, R15 : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL counter : integer;

    CONSTANT Clk50_period : TIME := 10 ns;
BEGIN
    UUT : RegisterR16 PORT MAP(
        RESET, CLK, LOAD, D_Data,
        R0, R1, R2, R3, R4, R5, R6, R7,
        R8, R9, R10, R11, R12, R13, R14, R15
    );

    -- Clock process definitions
    Clk50_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR Clk50_period/2;
        CLK <= '1';
        WAIT FOR Clk50_period/2;
    END PROCESS;
    
    stim_proc : PROCESS
    BEGIN
        Reset <= '0';
        Load <= "0000000000000000";
        D_Data <= "11110000";
        counter <= 0;
        
        for i in 0 to 255 loop
            wait for Clk50_period;
            counter <= counter + 1;
        end loop;
        
        wait;
    END PROCESS;
END Behavioral;