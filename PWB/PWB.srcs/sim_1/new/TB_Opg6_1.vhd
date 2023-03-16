----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 12:42:44 PM
-- Design Name: 
-- Module Name: TB_Opg6_1 - Behavioral
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

ENTITY TB_Opg6_1 IS
    --  Port ( );
END TB_Opg6_1;

ARCHITECTURE Behavioral OF TB_Opg6_1 IS
    COMPONENT Opg6_1 IS
        PORT (
            Reset : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            ID : IN STD_LOGIC;
            IL : OUT STD_LOGIC;
            PS : OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
    END COMPONENT;

    SIGNAL Reset : STD_LOGIC;
    SIGNAL Clk : STD_LOGIC;
    SIGNAL ID : STD_LOGIC;
    SIGNAL IL : STD_LOGIC;
    SIGNAL PS : STD_LOGIC_VECTOR (1 DOWNTO 0);

    CONSTANT Clk50_period : TIME := 10 ns;
    SIGNAL FS_vector : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    UUT : Opg6_1 port map(
        Reset,Clk,ID,IL,PS
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
        reset <= '1';
        Id <= '0';
        wait for 2*Clk50_period;
        reset <= '0';
        wait for 2*Clk50_period;
        Id <= '1';
        wait for 2*Clk50_period;


        WAIT;
    END PROCESS;
END Behavioral;