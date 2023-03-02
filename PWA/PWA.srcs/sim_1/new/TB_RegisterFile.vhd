----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2023 06:02:38 PM
-- Design Name: 
-- Module Name: TB_RegisterFile - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_RegisterFile is
--  Port ( );
end TB_RegisterFile;

architecture Behavioral of TB_RegisterFile is

    component RegisterFile is
        Port ( RESET : in STD_LOGIC;
               CLK : in STD_LOGIC;
               RW : in STD_LOGIC;
               DA,AA,BA : in STD_LOGIC_VECTOR (3 downto 0);
               D_Data : in STD_LOGIC_VECTOR (7 downto 0);
               A_Data,B_Data : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal RESET : STD_LOGIC;
    signal CLK : STD_LOGIC;
    signal RW : STD_LOGIC;
    signal DA,AA,BA : STD_LOGIC_VECTOR (3 downto 0);
    signal D_Data : STD_LOGIC_VECTOR (7 downto 0);
    signal A_Data,B_Data : STD_LOGIC_VECTOR (7 downto 0);

    CONSTANT Clk50_period : TIME := 10 ns;
begin
    
    uut : RegisterFile PORT MAP(
        RESET, CLK, RW, DA ,AA, BA, D_Data, A_Data, B_Data
    );


    Clk50_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR Clk50_period/2;
        CLK <= '1';
        WAIT FOR Clk50_period/2;
    END PROCESS;


    sim : process
    begin
        RESET <= '0';
        RW <= '1';
        DA <= "0011";
        AA <= "0011";
        BA <= "0100";
        D_Data <= "11111111";
        wait;
    end process;


end Behavioral;
