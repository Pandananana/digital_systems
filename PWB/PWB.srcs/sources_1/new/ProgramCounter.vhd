----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 10:26:10 AM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramCounter is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Adress_In : in STD_LOGIC_VECTOR (7 downto 0);
           PS : in STD_LOGIC_VECTOR (1 downto 0);
           Offset : in STD_LOGIC_VECTOR (7 downto 0);
           PC : out STD_LOGIC_VECTOR (7 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

    signal PCSig : STD_LOGIC_VECTOR (7 downto 0);

begin

    process_PC : process(RESET,CLK,PS)
    begin
        PC <= PCSig;
            if RESET = '1' then
                PC <= x"00";
            elsif rising_edge(CLK) then
                if PS = "01" then
                    PCSig <= PCSig + 1;
                elsif PS = "10" then
                    PCSig <= PCSig + Offset;
                elsif PS = "11" then
                    PCSig <= Adress_In;           
                else
                    NULL;
                end if;
            end if;
        end process;

end Behavioral;
