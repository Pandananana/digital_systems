----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 09:37:53 AM
-- Design Name: 
-- Module Name: TB_InstructionDecoderController - Behavioral
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
USE IEEE.Numeric_Std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY TB_InstructionDecoderController IS
    --  Port ( );
END TB_InstructionDecoderController;

ARCHITECTURE Behavioral OF TB_InstructionDecoderController IS
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
    SIGNAL FS_vector : STD_LOGIC_VECTOR(3 DOWNTO 0);

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
        reset <= '0';
        v <= '0';
        c <= '0';
        n <= '0';
        z <= '0';
        IR <= (OTHERS => '0');
        IR(8 downto 0) <= (OTHERS => '1');
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0000001";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0000010";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0000101";
        wait for 2*Clk50_period;
        
        IR(15 downto 9) <= "0000110";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001000";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001001";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001010";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001011";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001100";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0010000";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0100000";
        wait for 2*Clk50_period;
        
        IR(15 downto 9) <= "1001100";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "1000010";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "1100000";
        wait for 2*Clk50_period;
        Z <= '1';

        IR(15 downto 9) <= "1100000";
        wait for 2*Clk50_period;
        Z <= '0';

        IR(15 downto 9) <= "1100001";
        N <= '1';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "1100001";
        N <= '0';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "1110000";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0010001";
        wait for 2*Clk50_period;
        
        IR(15 downto 9) <= "0010001";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001101";
        Z <= '0';
        wait for Clk50_period;

        IR(15 downto 9) <= "0001101";
        Z <= '0';
        wait for Clk50_period;

        IR(15 downto 9) <= "0001101";
        Z <= '0';
        wait for Clk50_period;

        IR(15 downto 9) <= "0001101";
        Z <= '1';
        wait for Clk50_period;

        IR(15 downto 9) <= "0001101";
        wait for Clk50_period;

        IR(15 downto 9) <= "0001101";
        Z <= '0';
        wait for Clk50_period;

        IR(15 downto 9) <= "0001101";
        Z <= '1';
        wait for Clk50_period;
        
        IR(15 downto 9) <= "0001101";
        wait for Clk50_period;

        IR(15 downto 9) <= "0001110";
        Z <= '0';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001110";
        Z <= '1';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001110";
        Z <= '0';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001110";
        Z <= '1';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001110";
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001110";
        Z <= '0';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001110";
        Z <= '1';
        wait for 2*Clk50_period;

        IR(15 downto 9) <= "0001110";
        wait for 2*Clk50_period;

        WAIT;
    END PROCESS;

END Behavioral;