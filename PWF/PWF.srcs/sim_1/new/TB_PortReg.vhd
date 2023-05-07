----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2023 07:43:35 PM
-- Design Name: 
-- Module Name: TB_PortReg - Behavioral
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

ENTITY TB_PortReg IS
    --  Port ( );
END TB_PortReg;

ARCHITECTURE Behavioral OF TB_PortReg IS
    COMPONENT PortReg8X8 IS
        PORT (
            reset : in std_logic;
            clk : IN STD_LOGIC;
            MW : IN STD_LOGIC;
            Data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            Adress_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            SW : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            BTNC : IN STD_LOGIC;
            BTNU : IN STD_LOGIC;
            BTNL : IN STD_LOGIC;
            BTNR : IN STD_LOGIC;
            BTND : IN STD_LOGIC;
            MMR : OUT STD_LOGIC;
            D_word : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            Data_outR : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
            LED : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    SIGNAL reset : std_logic;
    SIGNAL clk : STD_LOGIC;
    SIGNAL MW : STD_LOGIC;
    SIGNAL Data_in : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL Adress_in : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL SW : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL BTNC : STD_LOGIC;
    SIGNAL BTNU : STD_LOGIC;
    SIGNAL BTNL : STD_LOGIC;
    SIGNAL BTNR : STD_LOGIC;
    SIGNAL BTND : STD_LOGIC;
    SIGNAL MMR : STD_LOGIC;
    SIGNAL D_word : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL Data_outR : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL LED : STD_LOGIC_VECTOR (7 DOWNTO 0);

    CONSTANT Clk50_period : TIME := 10 ns;

BEGIN

    UUT : PortReg8X8 PORT MAP(
        reset, clk, MW, Data_in, Adress_in, SW, BTNC, BTNU, BTNL, BTNR, BTND, MMR, D_word, Data_outR, LED
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
        reset <= '1';
        SW <= (others=>'0');
        BTNR <= '0';
        BTNL <= '0';
        BTND <= '0';
        BTNU <= '0';
        BTNC <= '0';
        wait for Clk50_period*2;
        reset <= '0';

        Adress_in <= "11111000";
        Data_in <= x"FF";
        MW <= '1';

        WAIT FOR Clk50_period*2;
        Data_in <= x"01";
        Adress_in <= "11111001";

        WAIT FOR Clk50_period*2;
        Data_in <= x"02";
        Adress_in <= "11111010";

        WAIT FOR Clk50_period*2;
        MW <= '0';
        Adress_in <= "11111000";
        SW <= x"03";
        BTNR <= '1';
        
        WAIT FOR Clk50_period*2;
        BTNR <= '0';
        SW <= x"04";
        BTNL <= '1';
        
        WAIT FOR Clk50_period*2;
        BTNL <= '0';
        SW <= x"05";
        BTND <= '1';
        
        WAIT FOR Clk50_period*2;
        BTND <= '0';
        SW <= x"06";
        BTNU <= '1';
        
        WAIT FOR Clk50_period*2;
        BTNU <= '0';
        SW <= x"07";
        BTNC <= '1';
        

        WAIT FOR Clk50_period*2;
        BTNC <= '0';
        Adress_in <= "11111000";

        WAIT FOR Clk50_period*2;
        Adress_in <= "11111001";

        WAIT FOR Clk50_period*2;
        Adress_in <= "11111010";

        WAIT FOR Clk50_period*2;
        Adress_in <= "11111011";

        WAIT FOR Clk50_period*2;
        Adress_in <= "11111100";

        WAIT FOR Clk50_period*2;
        Adress_in <= "11111101";

        WAIT FOR Clk50_period*2;
        Adress_in <= "11111110";

        WAIT FOR Clk50_period*2;
        Adress_in <= "11111111";

        WAIT FOR Clk50_period*2;

        WAIT;
    END PROCESS;

END Behavioral;