----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2023 05:03:02 PM
-- Design Name: 
-- Module Name: TB_InstReg - Behavioral
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

entity TB_InstReg is
--  Port ( );
end TB_InstReg;

architecture Behavioral of TB_InstReg is

component InstructionRegister is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
           IL : in STD_LOGIC;
           IR : out STD_LOGIC_VECTOR (15 downto 0));
end component;

           signal RESET : STD_LOGIC;
           signal CLK : STD_LOGIC;
           signal Instruction_in : STD_LOGIC_VECTOR (15 downto 0);
           signal IL : STD_LOGIC;
           signal IR : STD_LOGIC_VECTOR (15 downto 0);
           CONSTANT Clk50_period : TIME := 10 ns;
           
begin

UUT : InstructionRegister port map
(RESET, CLK, Instruction_in, IL, IR);

Clk50_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR Clk50_period/2;
        CLK <= '1';
        WAIT FOR Clk50_period/2;
    END PROCESS;

tim_proc : PROCESS
        BEGIN
            Instruction_in <= "0001000001110110";
            IL <= '0';
            wait for 10ns;
            IL <= '1';
            
            WAIT;
        END PROCESS;
end Behavioral;
