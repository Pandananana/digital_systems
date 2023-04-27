----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2023 02:49:50 PM
-- Design Name: 
-- Module Name: TB_MUX2x1x8 - Behavioral
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

entity TB_MUX2x1x8 is
--  Port ( );
end TB_MUX2x1x8;

architecture Behavioral of TB_MUX2x1x8 is
component MUX2x1x8 IS
    PORT (
        R, S : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        MUX_Select : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END component;


    signal R, S : STD_LOGIC_VECTOR (7 DOWNTO 0);
    signal MUX_Select : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR (7 DOWNTO 0);

begin
    UUT: MUX2x1x8 port map (R,S,MUX_Select,Y);

    stimulus : PROCESS
    BEGIN
        R <= x"00";
        S <= x"00";
        MUX_Select <= '1';
        wait for 10 ns;
        S <= x"01";
        wait for 10 ns;
        S <= x"02";
        wait for 10 ns;
        S <= x"03";
        wait for 10 ns;
        S <= x"04";
        wait for 10 ns;
        S <= x"05";
        wait for 10 ns;
        S <= x"06";




        WAIT;
    END PROCESS;

end Behavioral;
