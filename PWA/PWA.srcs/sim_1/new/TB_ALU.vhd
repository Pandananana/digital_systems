----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 09:30:12 AM
-- Design Name: 
-- Module Name: TB_ALU - Behavioral
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

ENTITY TB_ALU IS
    --  Port ( );
END TB_ALU;

ARCHITECTURE Behavioral OF TB_ALU IS
    COMPONENT ALU IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            J_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            V, C : OUT STD_LOGIC;
            J : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    SIGNAL A, B : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL J_Select : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL V, C : STD_LOGIC;
    SIGNAL J : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
    UUT : ALU port map (
        A, B,J_Select,V, C,J
    );

    sim : process
    begin
        A <= "00011100";
        B <= "00001111";
        wait for 10 ns;
        J_Select <= "0000";
        wait for 10 ns;
        J_Select <= "0001";
        wait for 10 ns;
        J_Select <= "0010";
        wait for 10 ns;
        J_Select <= "0011";
        wait for 10 ns;
        J_Select <= "0100";
        wait for 10 ns;
        J_Select <= "0101";
        wait for 10 ns;
        J_Select <= "0110";
        wait for 10 ns;
        J_Select <= "0111";
        wait for 10 ns;
        J_Select <= "1000";
        wait for 10 ns;
        J_Select <= "1001";
        wait for 10 ns;
        J_Select <= "1010";
        wait for 10 ns;
        J_Select <= "1011";
        wait for 10 ns;
        
        -- Overflow test
        A <= "01111000";
        J_Select <= "0010";
        
        


        wait;
        
    end process;


END Behavioral;