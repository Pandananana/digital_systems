----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2023 09:38:13 PM
-- Design Name: 
-- Module Name: TB_SignExtender - Behavioral
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

entity TB_SignExtender is
--  Port ( );
end TB_SignExtender;

architecture Behavioral of TB_SignExtender is
    component SignExtender is
        Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
               Extended_8 : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal IR :  STD_LOGIC_VECTOR (15 downto 0);
    signal Extended_8 :  STD_LOGIC_VECTOR (7 downto 0);

begin
    UUT: SignExtender port map (
        IR,Extended_8
    );

    IR <= "1111111111111010";


end Behavioral;