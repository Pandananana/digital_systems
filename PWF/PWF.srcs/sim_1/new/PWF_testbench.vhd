----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2023 10:38:45
-- Design Name: 
-- Module Name: PWF_testbench - Behavioral
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
use std.env.finish;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWF_testbench is
--  Port ( );
end PWF_testbench;

architecture Behavioral of PWF_testbench is

component PWF IS
    PORT (
        CLK, RESET : IN STD_LOGIC;
        SW : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        BTNC, BTNU, BTNL, BTNR, BTND : IN STD_LOGIC;
        BTN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        LED : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        Cathode : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        Anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END component;

        SIGNAL CLK, RESET : STD_LOGIC;
        SIGNAL SW : STD_LOGIC_VECTOR (7 DOWNTO 0);
        SIGNAL BTNC, BTNU, BTNL, BTNR, BTND : STD_LOGIC;
        SIGNAL BTN : STD_LOGIC_VECTOR (7 DOWNTO 0);
        SIGNAL LED :  STD_LOGIC_VECTOR (7 DOWNTO 0);
        SIGNAL Cathode :  STD_LOGIC_VECTOR (6 DOWNTO 0);
        SIGNAL Anode :  STD_LOGIC_VECTOR (3 DOWNTO 0);

CONSTANT Clk50_period : TIME := 10 ns;

begin

UUT : PWF PORT MAP(
        CLK, RESET,SW,BTNC, BTNU, BTNL, BTNR, BTND,BTN,LED,Cathode,Anode
    );

Clk50_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR Clk50_period/2;
        CLK <= '1';
        WAIT FOR Clk50_period/2;
    END PROCESS;
    
stimulus : PROCESS
    BEGIN
        Reset <= '1';
        WAIT FOR clk50_period;
        Reset <= '0';
        WAIT FOR 100 ns;
        
        finish;
    end process;
end Behavioral;
