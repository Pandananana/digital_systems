----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2023 05:22:55 PM
-- Design Name: 
-- Module Name: TB_Shifter - Behavioral
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

entity TB_Shifter is
--  Port ( );
end TB_Shifter;

architecture Behavioral of TB_Shifter is
    component Shifter IS
    PORT (
        B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        H_Select : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        h : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END component;
    SIGNAL B :  STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL H_Select :  STD_LOGIC_VECTOR (1 DOWNTO 0);
    SIGNAL h :  STD_LOGIC_VECTOR (7 DOWNTO 0);

begin
    UUT: Shifter port map(
       B,H_Select,h 
    );
    B <= "11111111";

    stim_proc : process
    begin
        H_Select <="00";
        wait for 10 ns;
        H_Select <="01";
        wait for 10 ns;
        H_Select <="10";
        wait for 10 ns;
        H_Select <="11";
        wait;
    end process;
end Behavioral;
