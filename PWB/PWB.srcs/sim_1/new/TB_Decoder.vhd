----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 03:03:55 PM
-- Design Name: 
-- Module Name: TB_Decoder - Behavioral
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

ENTITY TB_Decoder IS
    --  Port ( );
END TB_Decoder;

ARCHITECTURE Behavioral OF TB_Decoder IS
    COMPONENT InstructionDecoderController IS
        PORT (
            RESET : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            IR : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            V, C, N, Z : IN STD_LOGIC;
            PS : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
            IL : OUT STD_LOGIC;
            DX, AX, BX, FS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            MB, MD, RW, MM, MW : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL RESET : STD_LOGIC;
    SIGNAL CLK : STD_LOGIC;
    SIGNAL IR : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL V, C, N, Z : STD_LOGIC;
    SIGNAL PS : STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL IL : STD_LOGIC;
    SIGNAL DX, AX, BX, FS : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL MB, MD, RW, MM, MW : STD_LOGIC;
    CONSTANT Clk50_period : TIME := 10 ns;
BEGIN
    UUT : InstructionDecoderController PORT MAP(
        RESET, CLK, IR, V, C, N, Z, PS, IL, DX, AX, BX, FS, MB, MD, RW, MM, MW
    );
    Clk50_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR Clk50_period/2;
        CLK <= '1';
        WAIT FOR Clk50_period/2;
    END PROCESS;

    stim_proc : PROCESS
    BEGIN

        WAIT;
    END PROCESS;
END Behavioral;