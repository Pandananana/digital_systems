----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 06:56:09 PM
-- Design Name: 
-- Module Name: TB_DestinationDecoder - Behavioral
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

ENTITY TB_DestinationDecoder IS
    --  Port ( );
END TB_DestinationDecoder;

ARCHITECTURE Behavioral OF TB_DestinationDecoder IS
    COMPONENT DestinationDecoder IS
        PORT (
            WRITE : IN STD_LOGIC;
            DA : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            LOAD : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    SIGNAL WRITE : STD_LOGIC;
    SIGNAL DA : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL LOAD : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
    UUT : DestinationDecoder PORT MAP(
        WRITE, DA, LOAD
    );

    stim_proc : PROCESS
    BEGIN

        WRITE <= '1';

        DA <= "0000";
        WAIT FOR 10 ns;
        DA <= "0001";
        WAIT FOR 10 ns;
        DA <= "0010";
        WAIT FOR 10 ns;
        DA <= "0011";
        WAIT FOR 10 ns;
        DA <= "0100";
        WAIT FOR 10 ns;
        DA <= "0101";
        WAIT FOR 10 ns;
        DA <= "0110";
        WAIT FOR 10 ns;
        DA <= "0111";
        WAIT FOR 10 ns;
        DA <= "1000";
        WAIT FOR 10 ns;
        DA <= "1001";
        WAIT FOR 10 ns;
        DA <= "1010";
        WAIT FOR 10 ns;
        DA <= "1011";
        WAIT FOR 10 ns;
        DA <= "1100";
        WAIT FOR 10 ns;
        DA <= "1101";
        WAIT FOR 10 ns;
        DA <= "1110";
        WAIT FOR 10 ns;
        DA <= "1111";

        WAIT;
    END PROCESS;
END Behavioral;