----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2023 12:00:40 PM
-- Design Name: 
-- Module Name: TB_RAM - Behavioral
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

ENTITY TB_RAM IS
    --  Port ( );
END TB_RAM;

ARCHITECTURE Behavioral OF TB_RAM IS

    COMPONENT Ram256X16 IS
        PORT (
            clk : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Data_in : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Adress_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            MW : IN STD_LOGIC;
            Data_outM : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    SIGNAL clk : STD_LOGIC;
    SIGNAL Reset : STD_LOGIC;
    SIGNAL Data_in : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Adress_in : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL MW : STD_LOGIC;
    SIGNAL Data_outM : STD_LOGIC_VECTOR (15 DOWNTO 0);

    CONSTANT Clk50_period : TIME := 10 ns;

BEGIN

    UUT : Ram256X16 port map (
        clk,Reset,Data_in,Adress_in,MW,Data_outM
    );

    Clk50_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR Clk50_period/2;
        CLK <= '1';
        WAIT FOR Clk50_period/2;
    END PROCESS;

    stimulus : PROCESS
    BEGIN
        Reset <= '1';
        MW <= '0';
        Data_in <= (others=>'1');
        Adress_in <= "00000000";
        WAIT FOR Clk50_period*2;
        Reset <= '0';
        WAIT FOR Clk50_period*2;
        Adress_in <= "00000001";
        WAIT FOR Clk50_period*2;
        Adress_in <= "00000010";
        WAIT FOR Clk50_period*2;
        Adress_in <= "00000011";




        WAIT;
    END PROCESS;

END Behavioral;