----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 06:10:44 PM
-- Design Name: 
-- Module Name: Decoder2x4 - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Decoder2x4 IS
    PORT (
        A : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        E : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END Decoder2x4;

ARCHITECTURE Behavioral OF Decoder2x4 IS

BEGIN

Y(3)<= A(0) AND A(1) AND E;
Y(2)<= NOT A(0) AND A(1) AND E;
Y(1)<= A(0) AND NOT A(1) AND E;
Y(0)<= NOT A(0) AND NOT A(1) AND E;

END Behavioral;