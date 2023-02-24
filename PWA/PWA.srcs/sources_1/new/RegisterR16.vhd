----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: RegisterR16 - Behavioral
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

ENTITY RegisterR16 IS
    PORT (
        RESET : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        LOAD : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        D_Data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        R0, R1, R2, R3, R4, R5, R6, R7 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        R8, R9, R10, R11, R12, R13, R14, R15 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END RegisterR16;

ARCHITECTURE Behavioral OF RegisterR16 IS
    COMPONENT DFF_EN_RS IS
        PORT (
            D : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Load : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;
BEGIN

    R0_gen : FOR i IN 0 TO 7 GENERATE
        UR0_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(0), Clk, R0(i));
    END GENERATE;

    R1_gen : FOR i IN 0 TO 7 GENERATE
        UR1_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(1), Clk, R1(i));
    END GENERATE;

    R2_gen : FOR i IN 0 TO 7 GENERATE
        UR2_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(2), Clk, R2(i));
    END GENERATE;

    R3_gen : FOR i IN 0 TO 7 GENERATE
        UR3_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(3), Clk, R3(i));
    END GENERATE;

    R4_gen : FOR i IN 0 TO 7 GENERATE
        UR4_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(4), Clk, R4(i));
    END GENERATE;

    R5_gen : FOR i IN 0 TO 7 GENERATE
        UR5_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(5), Clk, R5(i));
    END GENERATE;

    R6_gen : FOR i IN 0 TO 7 GENERATE
        UR6_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(6), Clk, R6(i));
    END GENERATE;

    R7_gen : FOR i IN 0 TO 7 GENERATE
        UR7_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(7), Clk, R7(i));
    END GENERATE;

    R8_gen : FOR i IN 0 TO 7 GENERATE
        UR8_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(8), Clk, R8(i));
    END GENERATE;

    R9_gen : FOR i IN 0 TO 7 GENERATE
        UR9_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(9), Clk, R9(i));
    END GENERATE;

    R10_gen : FOR i IN 0 TO 7 GENERATE
        UR10_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(10), Clk, R10(i));
    END GENERATE;

    R11_gen : FOR i IN 0 TO 7 GENERATE
        UR11_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(11), Clk, R11(i));
    END GENERATE;

    R12_gen : FOR i IN 0 TO 7 GENERATE
        UR12_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(12), Clk, R12(i));
    END GENERATE;

    R13_gen : FOR i IN 0 TO 7 GENERATE
        UR13_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(13), Clk, R13(i));
    END GENERATE;

    R14_gen : FOR i IN 0 TO 7 GENERATE
        UR14_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(14), Clk, R14(i));
    END GENERATE;

    R15_gen : FOR i IN 0 TO 7 GENERATE
        UR15_gen : component DFF_EN_RS
        PORT MAP(D_data(i), Reset, Load(15), Clk, R15(i));
    END GENERATE;

END Behavioral;