----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: DestinationDecoder - Behavioral
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

ENTITY DestinationDecoder IS
    PORT (
        WRITE : IN STD_LOGIC;
        DA : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        LOAD : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END DestinationDecoder;

ARCHITECTURE Behavioral OF DestinationDecoder IS
    COMPONENT Decoder2x4 IS
        PORT (
            A : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            E : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;
    SIGNAL Y_signal : STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN

    U1 : Decoder2x4 PORT MAP(DA(3 downto 2), WRITE, Y_signal);
    U2 : FOR i IN 0 TO 3 GENERATE
        U2_gen : COMPONENT Decoder2x4
            PORT MAP(DA(1 downto 0), Y_signal(i), LOAD((i * 4 + 3) DOWNTO (i * 4)));
    END GENERATE;

END Behavioral;