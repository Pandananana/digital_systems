----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2023 11:04:24 AM
-- Design Name: 
-- Module Name: TB_NegZero - Behavioral
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

ENTITY TB_NegZero IS
    --  Port ( );
END TB_NegZero;

ARCHITECTURE Behavioral OF TB_NegZero IS
    COMPONENT NegZero IS
        PORT (
            MUXF : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            N, Z : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL MUXF : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL N, Z : STD_LOGIC;

BEGIN
    UUT : NegZero PORT MAP(
        MUXF, N, Z
    );

    stim_proc : PROCESS
    BEGIN
        MUXF <= "00000000";
        WAIT FOR 20 ns;
        MUXF <= "10000001";
        wait for 20 ns;
        MUXF <= "00000000";
        WAIT;
    END PROCESS;

END Behavioral;