----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2023 17:51:31
-- Design Name: 
-- Module Name: PortReg8X8 - Behavioral
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

entity PortReg8X8 is
    Port ( clk : in STD_LOGIC;
           MW : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (7 downto 0);
           Adress_in : in STD_LOGIC_VECTOR (7 downto 0);
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTND : in STD_LOGIC;
           MMR : out STD_LOGIC;
           D_word : out STD_LOGIC_VECTOR (15 downto 0);
           Data_outR : out STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end PortReg8X8;

ARCHITECTURE Behavioral OF PortReg8x8 IS
    COMPONENT DFF_EN_RS IS
        PORT (
            D : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Load : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;
    
    signal MR0, MR1, MR2, MR3, MR4, MR5, MR6, MR7 : std_logic_vector(7 downto 0);
    signal load : std_logic_vector(2 downto 0);
    
    
BEGIN

    ---- Register 8x8 ----

    load <= "001" when Adress_in = "11111000" else
            "010" when Adress_in = "11111001" else
            "100" when Adress_in = "11111010" else
            "000";

    MR0_gen : FOR i IN 0 TO 7 GENERATE
        UMR0_gen : component DFF_EN_RS
        PORT MAP(Data_in(i), '0', load(0), Clk, MR0(i));
    END GENERATE;

    MR1_gen : FOR i IN 0 TO 7 GENERATE
        UMR1_gen : component DFF_EN_RS
        PORT MAP(Data_in(i), '0', load(1), Clk, MR1(i));
    END GENERATE;

    MR2_gen : FOR i IN 0 TO 7 GENERATE
        UMR2_gen : component DFF_EN_RS
        PORT MAP(Data_in(i), '0', load(2), Clk, MR2(i));
    END GENERATE;

    MR3_gen : FOR i IN 0 TO 7 GENERATE
        UMR3_gen : component DFF_EN_RS
        PORT MAP(SW(i), '0', BTNR, Clk, MR3(i));
    END GENERATE;

    MR4_gen : FOR i IN 0 TO 7 GENERATE
        UMR4_gen : component DFF_EN_RS
        PORT MAP(SW(i), '0', BTNL, Clk, MR4(i));
    END GENERATE;

    MR5_gen : FOR i IN 0 TO 7 GENERATE
        UMR5_gen : component DFF_EN_RS
        PORT MAP(SW(i), '0', BTND, Clk, MR5(i));
    END GENERATE;

    MR6_gen : FOR i IN 0 TO 7 GENERATE
        UMR6_gen : component DFF_EN_RS
        PORT MAP(SW(i), '0', BTNU, Clk, MR6(i));
    END GENERATE;

    MR7_gen : FOR i IN 0 TO 7 GENERATE
        UMR7_gen : component DFF_EN_RS
        PORT MAP(SW(i), '0', BTNC, Clk, MR7(i));
    END GENERATE;


    ---- Write and read
    MR_Process: process (clk)
    begin
        if rising_edge(CLK) then
            if MW='1' then
                case Adress_in is
                    when "11111000" =>
                        MR0 <= Data_in;

                    when "11111001" =>
                        MR1 <= Data_in;

                    when "11111010" =>
                        MR2 <= Data_in;
                
                    when others =>
                        null;
                end case;
            else
                MMR <= '1';
                case Adress_in is
                    when "11111000" =>
                        Data_outR <= "00000000" & MR0;

                    when "11111001" =>
                        Data_outR <= "00000000" & MR1;

                    when "11111010" =>
                        Data_outR <= "00000000" & MR2;

                    when "11111011" =>
                        Data_outR <= "00000000" & MR3;

                    when "11111100" =>
                        Data_outR <= "00000000" & MR4;

                    when "11111101" =>
                        Data_outR <= "00000000" & MR5;
                    
                    when "11111110" =>
                        Data_outR <= "00000000" & MR6;

                    when "11111111" =>
                        Data_outR <= "00000000" & MR7;
                
                    when others =>
                        MMR <= '0';
                end case;
            end if;
        end if;
    end process;


end Behavioral;
