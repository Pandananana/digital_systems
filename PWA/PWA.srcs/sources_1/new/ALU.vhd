----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           J_Select : in STD_LOGIC_VECTOR (3 downto 0);
           V,C : out STD_LOGIC;
           J : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
begin

    process(A,B,J_select) is
    begin
        case J_select is
            when "0000" =>
                J <= A;
            when "0001" =>
                J <= std_logic_vector(unsigned(A) + 1);
            when "0010" =>
                J <= A OR B;
            when "0011" =>
                J <= A OR B OR "1";
            when "0100" =>
                J <= A OR (not B);
            when "0101" =>
                J <= A OR (not B) OR "1";
            when "0110" =>
                J <= A OR (not B) OR "1";
            when "0111" =>
                J <= A;            
            when "1000" =>
                J <= A OR B;
            when "1001" =>
                J <= A AND B;
            when "1010" =>
                J <= A;
            when "1011" =>
                J <= A;
            when "1100" =>
                J <= A;
            when "1101" =>
                J <= A;
            when "1110" =>
                J <= A;
            when "1111" =>
                J <= A;              

end Behavioral;
