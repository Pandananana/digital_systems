----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2023 17:51:31
-- Design Name: 
-- Module Name: PortReg8X8 - Behavioral
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

ENTITY PortReg8X8 IS
    PORT (
        Reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        MW : IN STD_LOGIC;
        Data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        Adress_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        SW : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        BTNC : IN STD_LOGIC;
        BTNU : IN STD_LOGIC;
        BTNL : IN STD_LOGIC;
        BTNR : IN STD_LOGIC;
        BTND : IN STD_LOGIC;
        MMR : OUT STD_LOGIC;
        D_word : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        Data_outR : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        LED : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END PortReg8X8;

ARCHITECTURE Behavioral OF PortReg8x8 IS
    COMPONENT DFF_EN_RS IS
        PORT (
            D : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Load : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL MR0, MR1, MR2, MR3, MR4, MR5, MR6, MR7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL load : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    MMR_set : PROCESS (Adress_in, MW) IS
    BEGIN
        IF Adress_in >= x"f8" AND MW = '0' THEN
            MMR <= '1';
        ELSE
            MMR <= '0';
        END IF;
    END PROCESS;

    READ_WRITE : PROCESS (clk, reset) IS
    BEGIN
        IF reset = '1' THEN
            MR0 <= (OTHERS => '0');
            MR1 <= (OTHERS => '0');
            MR2 <= (OTHERS => '0');
        ELSIF rising_edge(CLK) THEN
            D_word <= MR1 & MR0;
            LED <= MR2;
            IF MW = '1' THEN
                CASE Adress_in IS
                    WHEN "11111000" =>
                        MR0 <= Data_in;
                    WHEN "11111001" =>
                        MR1 <= Data_in;
                    WHEN "11111010" =>
                        MR2 <= Data_in;
                    WHEN OTHERS => NULL;
                END CASE;
            ELSIF MW = '0' THEN
                CASE Adress_in IS
                    WHEN "11111000" =>
                        Data_outR <= X"00" & MR0;
                    WHEN "11111001" =>
                        Data_outR <= X"00" & MR1;
                    WHEN "11111010" =>
                        Data_outR <= X"00" & MR2;
                    WHEN "11111011" =>
                        Data_outR <= X"00" & MR3;
                    WHEN "11111100" =>
                        Data_outR <= X"00" & MR4;
                    WHEN "11111101" =>
                        Data_outR <= X"00" & MR5;
                    WHEN "11111110" =>
                        Data_outR <= X"00" & MR6;
                    WHEN "11111111" =>
                        Data_outR <= X"00" & MR7;
                    WHEN OTHERS => NULL;
                END CASE;
            END IF;
            IF BTNR = '1' THEN
                MR3 <= SW;
            END IF;
            IF BTNL = '1' THEN
                MR4 <= SW;
            END IF;
            IF BTND = '1' THEN
                MR5 <= SW;
            END IF;
            IF BTNU = '1' THEN
                MR6 <= SW;
            END IF;
            IF BTNC = '1' THEN
                MR7 <= SW;
            END IF;
        END IF;
    END PROCESS;
    
END Behavioral;