----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 12:34:08 PM
-- Design Name: 
-- Module Name: Opg6_1 - Behavioral
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

ENTITY Opg6_1 IS
    PORT (
        Reset : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        ID : IN STD_LOGIC;
        IL : OUT STD_LOGIC;
        PS : OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END Opg6_1;

ARCHITECTURE Behavioral OF Opg6_1 IS
    TYPE statetype IS (ex0, ex1, inf);
    SIGNAL state, nextstate : statetype;
BEGIN

    Control_state : PROCESS (Reset, CLK)
    BEGIN
        IF RESET = '1' THEN
            state <= inf;
        ELSIF CLK'event AND CLK = '1' THEN
            state <= Nextstate;
        END IF;
    END PROCESS;

    Control_logic : PROCESS (state, ID)
    BEGIN
        CASE state IS
            WHEN inf =>
                IL <= '1';
                PS <= "00";
                Nextstate <= ex0;

            WHEN ex0 =>
                IL <= '0';
                IF ID = '0' THEN
                    Nextstate <= inf;
                    PS <= "01";
                ELSE
                    Nextstate <= ex1;
                    PS <= "00";
                END IF;

            WHEN ex1 =>
                IL <= '0';
                PS <= "01";
                Nextstate <= inf;

        END CASE;
    END PROCESS;

END Behavioral;