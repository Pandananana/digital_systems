----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 09:58:18 AM
-- Design Name: 
-- Module Name: TB_Datapath - Behavioral
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

ENTITY TB_Datapath IS
    --  Port ( );
END TB_Datapath;

ARCHITECTURE Behavioral OF TB_Datapath IS
    COMPONENT Datapath IS
        PORT (
            Reset : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            RW : IN STD_LOGIC;
            DA, AA, BA : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            ConstantIn : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            MB : IN STD_LOGIC;
            FS3, FS2, FS1, FS0 : IN STD_LOGIC;
            DataIn : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            MD : IN STD_LOGIC;
            Address_Out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            Data_Out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            V, C, N, Z : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL Reset : STD_LOGIC;
    SIGNAL CLK : STD_LOGIC;
    SIGNAL RW : STD_LOGIC;
    SIGNAL DA, AA, BA : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL ConstantIn : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL MB : STD_LOGIC;
    SIGNAL FS3, FS2, FS1, FS0 : STD_LOGIC;
    SIGNAL DataIn : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL MD : STD_LOGIC;
    SIGNAL Address_Out : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL Data_Out : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL V, C, N, Z : STD_LOGIC;

    CONSTANT Clk50_period : TIME := 10 ns;
    signal FS_vector : std_logic_vector(3 downto 0);

BEGIN
    UUT : Datapath PORT MAP(
        Reset, CLK, RW, DA, AA, BA, ConstantIn, MB, FS_vector(3), FS_vector(2), FS_vector(1), FS_vector(0), DataIn, MD,
        Address_Out, Data_Out, V, C, N, Z
    );

    Clk50_process : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR Clk50_period/2;
        CLK <= '1';
        WAIT FOR Clk50_period/2;
    END PROCESS;

    stim_proc : PROCESS
    BEGIN
        FS_vector <= "0000";
        Reset <= '0';
        RW <= '0';
        DA <= (others =>'0');
        AA <= (others =>'0');
        BA <= "0001";
        ConstantIn <= (others =>'0');
        MB <= '0';
        DataIn <= (others =>'0');
        MD <= '0';

        wait for Clk50_period;
        Reset <= '1';
        wait for Clk50_period;
        Reset <= '0';
        wait for Clk50_period;

        DataIn <= "00011100";
        MD <= '1';
        DA <= "0000";
        wait for Clk50_period;
        RW <= '1';
        wait for 2*Clk50_period;
        RW <= '0';
        MD <= '0';

        DataIn <= "00001111";
        MD <= '1';
        DA <= "0001";
        wait for Clk50_period;
        RW <= '1';
        wait for 2*Clk50_period;
        RW <= '0';
        MD <= '0';
        
        DataIn <= "01111000";
        MD <= '1';
        DA <= "0010";
        wait for Clk50_period;
        RW <= '1';
        wait for 2*Clk50_period;
        RW <= '0';
        MD <= '0';
        
        wait for 5*Clk50_period;


        -- Testing all operations
        FS_vector <= "0000";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "0001";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        
        FS_vector <= "0010";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "0010";
        DA <= "0011";
        BA <= "0010";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        BA <= "0001";

        FS_vector <= "0011";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        
        FS_vector <= "0100";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "0101";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        
        FS_vector <= "0110";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "0111";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        
        FS_vector <= "1000";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "1001";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        
        FS_vector <= "1010";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "1011";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        
        FS_vector <= "1100";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "1101";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        
        FS_vector <= "1110";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;

        FS_vector <= "1111";
        DA <= "0011";
        wait for Clk50_period;
        RW <= '1';
        wait for Clk50_period;
        RW <= '0';
        wait for Clk50_period;
        













        WAIT;
    END PROCESS;

END Behavioral;