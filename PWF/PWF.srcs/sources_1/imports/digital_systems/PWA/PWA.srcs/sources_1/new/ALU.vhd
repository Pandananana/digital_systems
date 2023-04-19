----------------------------------------------------------------------------------
-- Company: 
-- Engineer: LARS
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           J_Select : in STD_LOGIC_VECTOR (3 downto 0);
           V,C : out STD_LOGIC;
           J : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

component Full_adder_8bit is
    Port ( y : in STD_LOGIC_VECTOR (7 downto 0);
           ci : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           co : out STD_LOGIC;
           V: out STD_LOGIC);
end component;

signal           y_sig: STD_LOGIC_VECTOR (7 downto 0);
signal           ci_sig :  STD_LOGIC;
signal           x_sig :  STD_LOGIC_VECTOR (7 downto 0);
signal           sum_sig :  STD_LOGIC_VECTOR (7 downto 0);


begin
    Adder: Full_adder_8bit port map(y_sig,ci_sig,x_sig,sum_sig,C,V);
    
            J <= A when J_select = "0000" else
                 sum_sig when J_select = "0001" else
                 sum_sig when J_select = "0010" else
                 sum_sig when J_select = "0011" else
                 sum_sig when J_select = "0100" else
                 sum_sig when J_select = "0101" else
                 sum_sig when J_select = "0110" else
                 A when J_select = "0111" else
                 A or B when J_select = "1000" else
                 A and B when J_select = "1001" else
                 A xor B when J_select = "1010" else
                 (not A) when J_select = "1011" else
                 "00000000";
                 
            y_sig <= A;
            
            ci_sig <= '0' when J_select = "0000" else
                 '1' when J_select = "0001" else
                 '0' when J_select = "0010" else
                 '1' when J_select = "0011" else
                 '0' when J_select = "0100" else
                 '1' when J_select = "0101" else
                 '0';
                 
             x_sig <= "00000000" when J_select = "0000" else
                  "00000000" when J_select = "0001" else
                  B when J_select = "0010" else
                  B when J_select = "0011" else
                  (not B) when J_select = "0100" else
                  (not B) when J_select = "0101" else
                  "11111111" when J_select = "0110" else
                  "00000000";    
                
                 
                 
                 
            
            
                 

end Behavioral;
