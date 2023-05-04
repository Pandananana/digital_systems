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
    Port ( Reset : in std_logic;
           clk : in STD_LOGIC;
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


    MMR_set: process(Adress_in,MW) is
    begin
        if Adress_in >= x"f8" and MW = '0' then
            MMR <= '1';
        else
            MMR <= '0';
        end if;
    end process;
        
    write: process(clk, reset) is
    begin
        if reset = '1' then 
            MR0 <= (others=>'0');
            MR1 <= (others=>'0');
            MR2 <= (others=>'0');
        elsif rising_edge(CLK) then
        D_word <= MR0 & MR1;
        LED <= MR2;
            if MW = '1' then
                case Adress_in is
                    when "11111000" =>
                        MR0 <= Data_in;
                    when "11111001" =>
                        MR1 <= Data_in;
                    when "11111010" =>
                        MR2 <= Data_in;
                    when others => NULL;
                end case;
            elsif MW = '0' then
                case Adress_in is
                      when "11111000" =>
                        Data_outR <= X"00" & MR0;
                      when "11111001" =>
                        Data_outR <= X"00" & MR1;
                      when "11111010" =>
                        Data_outR <= X"00" & MR2;
                      when "11111011" =>
                        Data_outR <= X"00" & MR3;
                      when "11111100" =>
                        Data_outR <= X"00" & MR4;
                      when "11111101" =>
                        Data_outR <= X"00" & MR5;
                      when "11111110" =>
                        Data_outR <= X"00" & MR6;
                      when "11111111" =>
                        Data_outR <= X"00" & MR7;
                      when others => NULL;
                    end case;  
                end if;
                if BTNR = '1' then
                    MR3 <= SW;
                end if;
                if BTNL = '1' then
                                    MR4 <= SW;
                                end if;
                 if BTND = '1' then
                                                    MR5 <= SW;
                                                end if;
                if BTNU = '1' then
                                                                    MR6 <= SW;
                                                                end if;
                if BTNC = '1' then
                                                                                    MR7 <= SW;
                                                                                end if;
                
            end if;
            
       end process;
            







    ---- Register 8x8 ----

    load <= "001" when Adress_in = "11111000" and MW = '1' else
        "010" when Adress_in = "11111001" and MW = '1' else
        "100" when Adress_in = "11111010" and MW = '1' else
        "000";

    MR0_gen : FOR i IN 0 TO 7 GENERATE
        UMR0_gen : component DFF_EN_RS
        PORT MAP(Data_in(i), Reset, load(0), Clk, MR0(i));
    END GENERATE;

    MR1_gen : FOR i IN 0 TO 7 GENERATE
        UMR1_gen : component DFF_EN_RS
        PORT MAP(Data_in(i), Reset, load(1), Clk, MR1(i));
    END GENERATE;

    MR2_gen : FOR i IN 0 TO 7 GENERATE
        UMR2_gen : component DFF_EN_RS
        PORT MAP(Data_in(i), Reset, load(2), Clk, MR2(i));
    END GENERATE;

    MR3_gen : FOR i IN 0 TO 7 GENERATE
        UMR3_gen : component DFF_EN_RS
        PORT MAP(SW(i), Reset, BTNR, Clk, MR3(i));
    END GENERATE;

    MR4_gen : FOR i IN 0 TO 7 GENERATE
        UMR4_gen : component DFF_EN_RS
        PORT MAP(SW(i), Reset, BTNL, Clk, MR4(i));
    END GENERATE;

    MR5_gen : FOR i IN 0 TO 7 GENERATE
        UMR5_gen : component DFF_EN_RS
        PORT MAP(SW(i), Reset, BTND, Clk, MR5(i));
    END GENERATE;

    MR6_gen : FOR i IN 0 TO 7 GENERATE
        UMR6_gen : component DFF_EN_RS
        PORT MAP(SW(i), Reset, BTNU, Clk, MR6(i));
    END GENERATE;

    MR7_gen : FOR i IN 0 TO 7 GENERATE
        UMR7_gen : component DFF_EN_RS
        PORT MAP(SW(i), Reset, BTNC, Clk, MR7(i));
    END GENERATE;


    ---- Write and read
    MR_Process: process (reset,clk)
    begin
        if reset = '1' then
            MMR <= '0';
            D_word <= (others=>'0');
            LED <= (others=>'0');
            Data_outR <= (others=>'0');
        elsif rising_edge(CLK) then
            if MW='0' then
                MMR <= '1';
                case Adress_in is
                    when "11111000" =>
                        Data_outR <= "00000000" & MR0;
                        D_word <= MR1 & MR0;

                    when "11111001" =>
                        Data_outR <= "00000000" & MR1;
                        D_word <= MR1 & MR0;

                    when "11111010" =>
                        Data_outR <= "00000000" & MR2;
                        LED <= MR2;

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
