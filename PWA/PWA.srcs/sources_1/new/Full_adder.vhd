----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2023 19:32:07
-- Design Name: 
-- Module Name: Full_adder - Behavioral
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

entity Full_adder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC ;
           ci : in STD_LOGIC;
           so : out STD_LOGIC;
           co : out STD_LOGIC);
end Full_adder;


architecture Behavioral of Full_adder is
   component Half_adder is
     Port ( x,y : in STD_LOGIC;
           S,C : out STD_LOGIC);
    end component;
    signal Gi,Pi,Li: std_logic;
    
    begin
    unit1: Half_adder port map(x,y,Pi,Gi);
    unit2: Half_adder port map(Pi,ci,so,Li);
    co <= Gi or Li; 
    


end Behavioral;
