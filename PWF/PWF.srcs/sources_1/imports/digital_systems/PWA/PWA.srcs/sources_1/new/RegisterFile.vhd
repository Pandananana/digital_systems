----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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

entity RegisterFile is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RW : in STD_LOGIC;
           DA,AA,BA : in STD_LOGIC_VECTOR (3 downto 0);
           D_Data : in STD_LOGIC_VECTOR (7 downto 0);
           A_Data,B_Data : out STD_LOGIC_VECTOR (7 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
    component DestinationDecoder IS
    PORT (
        WRITE : IN STD_LOGIC;
        DA : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        LOAD : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    end component;

    component RegisterR16 IS
    PORT (
        RESET : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        LOAD : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        D_Data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        R0, R1, R2, R3, R4, R5, R6, R7 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        R8, R9, R10, R11, R12, R13, R14, R15 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END component;

    component MUX16x1x8 IS
	PORT (
		R0, R1, R2, R3, R4, R5, R6, R7 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		R8, R9, R10, R11, R12, R13, R14, R15 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		D_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Y_Data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END component;



    signal LoadSig : STD_LOGIC_VECTOR (15 downto 0);
    signal muxbus : STD_LOGIC_VECTOR (127 downto 0);

begin
    U1 : DestinationDecoder PORT MAP(RW, DA, LoadSig);
    U2 : RegisterR16 PORT MAP(Reset, CLK, LoadSig, D_Data, 
    muxbus(7 downto 0), muxbus(15 downto 8), muxbus(23 downto 16),
    muxbus(31 downto 24), muxbus(39 downto 32), muxbus(47 downto 40),
    muxbus(55 downto 48), muxbus(63 downto 56), muxbus(71 downto 64),
    muxbus(79 downto 72), muxbus(87 downto 80), muxbus(95 downto 88),
    muxbus(103 downto 96), muxbus(111 downto 104), muxbus(119 downto 112),
    muxbus(127 downto 120));

    muxA : MUX16x1x8 PORT MAP(muxbus(7 downto 0), muxbus(15 downto 8), muxbus(23 downto 16),
    muxbus(31 downto 24), muxbus(39 downto 32), muxbus(47 downto 40),
    muxbus(55 downto 48), muxbus(63 downto 56), muxbus(71 downto 64),
    muxbus(79 downto 72), muxbus(87 downto 80), muxbus(95 downto 88),
    muxbus(103 downto 96), muxbus(111 downto 104), muxbus(119 downto 112),
    muxbus(127 downto 120), AA, A_data);

    muxB : MUX16x1x8 PORT MAP(muxbus(7 downto 0), muxbus(15 downto 8), muxbus(23 downto 16),
    muxbus(31 downto 24), muxbus(39 downto 32), muxbus(47 downto 40),
    muxbus(55 downto 48), muxbus(63 downto 56), muxbus(71 downto 64),
    muxbus(79 downto 72), muxbus(87 downto 80), muxbus(95 downto 88),
    muxbus(103 downto 96), muxbus(111 downto 104), muxbus(119 downto 112),
    muxbus(127 downto 120), BA, B_data);



end Behavioral;
