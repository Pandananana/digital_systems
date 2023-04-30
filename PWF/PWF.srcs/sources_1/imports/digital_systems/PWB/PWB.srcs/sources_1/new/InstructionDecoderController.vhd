----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 10:26:10 AM
-- Design Name: 
-- Module Name: InstructionDecoderController - Behavioral
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

ENTITY InstructionDecoderController IS
    PORT (
        RESET : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        IR : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        V, C, N, Z : IN STD_LOGIC;
        PS : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        IL : OUT STD_LOGIC;
        DX, AX, BX, FS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        MB, MD, RW, MM, MW : OUT STD_LOGIC);
END InstructionDecoderController;

ARCHITECTURE Behavioral OF InstructionDecoderController IS

    TYPE statetype IS (ex0, ex1, ex2, ex3, ex4, inf, rst);
    SIGNAL state, nextstate : statetype;
    SIGNAL opcode : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL dx_sig, bx_sig, ax_sig : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN


    Control_state : PROCESS (RESET, CLK)
    BEGIN
        IF RESET = '1' THEN
            state <= rst;
        ELSIF CLK'event AND CLK = '1' THEN
            state <= Nextstate;
        END IF;
    END PROCESS;

    Control_logic : PROCESS (state, IR, N, Z)
    BEGIN
        CASE state IS
            when RST =>
                IL <= '0';
                PS <= "00";
                DX <= "0000"; 
                AX <= "0000"; 
                BX <= "0000";
                MB <= '0';
                FS <= "0000";
                MD <= '0';
                RW <= '0';
                MM <= '0';
                MW <= '0';
                opcode <= (others=>'0');
                dx_sig <= (others=>'0');
                bx_sig <= (others=>'0');
                ax_sig <= (others=>'0');
                NextState <= INF;
                

            WHEN inf =>
                IL <= '1';
                PS <= "00";
                DX <= '-' & dx_sig;
                AX <= '-' & ax_sig;
                BX <= '-' & bx_sig;
                MB <= '-';
                FS <= "----";
                    MD <= '-';
                RW <= '0';
                MM <= '1';
                MW <= '0';
                opcode <= IR(15 DOWNTO 9);
                dx_sig <= IR(8 DOWNTO 6);
                ax_sig <= IR(5 DOWNTO 3);
                bx_sig <= IR(2 DOWNTO 0);
                nextstate <= ex0;

            WHEN ex0 =>
                CASE opcode IS
                    WHEN "0000000" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0000001" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0001";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0000010" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '0' & bx_sig;
                        MB <= '0';
                        FS <= "0010";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0000101" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '0' & bx_sig;
                        MB <= '0';
                        FS <= "0101";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0000110" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0110";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0001000" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '0' & bx_sig;
                        MB <= '0';
                        FS <= "1000";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0001001" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '0' & bx_sig;
                        MB <= '0';
                        FS <= "1001";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0001010" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '0' & bx_sig;
                        MB <= '0';
                        FS <= "1010";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0001011" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "1011";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0001100" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '-' & ax_sig;
                        BX <= '0' & bx_sig;
                        MB <= '0';
                        FS <= "1100";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0010000" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "----";
                            MD <= '1';
                        RW <= '1';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0100000" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '-' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '0' & bx_sig;
                        MB <= '0';
                        FS <= "----";
                            MD <= '-';
                        RW <= '0';
                        MM <= '0';
                        MW <= '1';
                        nextstate <= inf;
                    WHEN "1001100" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '-' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '1';
                        FS <= "1100";
                        MD <= '0';
                        RW <= '1';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "1000010" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '1';
                        FS <= "0010";
                        MD <= '0';
                        RW <= '1';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "1100000" =>
                        IF Z = '1' THEN
                            PS <= "10";
                        ELSE
                            PS <= "01";
                        END IF;
                        IL <= '0';
                        DX <= '-' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '-';
                        RW <= '0';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "1100001" =>
                        IF N = '1' THEN
                            PS <= "10";
                        ELSE
                            PS <= "01";
                        END IF;
                        IL <= '0';
                        DX <= '-' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '-';
                        RW <= '0';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "1110000" =>
                        IL <= '0';
                        PS <= "11";
                        DX <= '-' & dx_sig;
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '-';
                        RW <= '0';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0010001" =>
                        IL <= '0';
                        PS <= "00";
                        DX <= "1000";
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '1';
                        RW <= '1';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= ex1;
                    WHEN "0001101" =>
                        IF Z = '1' THEN
                            PS <= "01";
                            nextstate <= inf;
                        ELSE
                            PS <= "00";
                            nextstate <= ex1;
                        END IF;
                        IL <= '0';
                        DX <= "1000";
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                    WHEN "0001110" =>
                        IF Z = '1' THEN
                            PS <= "01";
                            nextstate <= inf;
                        ELSE
                            PS <= "00";
                            nextstate <= ex1;
                        END IF;
                        IL <= '0';
                        DX <= "1000";
                        AX <= '0' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                    WHEN OTHERS =>
                        nextstate <= inf;

                END CASE;

            WHEN ex1 =>
                CASE opcode IS
                    WHEN "0010001" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= "1000";
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '1';
                        RW <= '1';
                        MM <= '0';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN "0001101" =>
                        IF Z = '1' THEN
                            PS <= "01";
                            nextstate <= inf;
                        ELSE
                            PS <= "00";
                            nextstate <= ex2;
                        END IF;
                        IL <= '0';
                        DX <= "1001";
                        AX <= '-' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '1';
                        FS <= "1100";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                    WHEN "0001110" =>
                        IF Z = '1' THEN
                            PS <= "01";
                            nextstate <= inf;
                        ELSE
                            PS <= "00";
                            nextstate <= ex2;
                        END IF;
                        IL <= '0';
                        DX <= "1001";
                        AX <= '-' & ax_sig;
                        BX <= '-' & bx_sig;
                        MB <= '1';
                        FS <= "1100";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                    WHEN OTHERS =>
                        nextstate <= inf;
                END CASE;

            WHEN ex2 =>
                CASE opcode IS
                    WHEN "0001101" =>
                        IL <= '0';
                        PS <= "00";
                        DX <= "1000";
                        AX <= '-' & ax_sig;
                        BX <= "1000";
                        MB <= '0';
                        FS <= "1101";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= ex3;
                    WHEN "0001110" =>
                        IL <= '0';
                        PS <= "00";
                        DX <= "1000";
                        AX <= '-' & ax_sig;
                        BX <= "1000";
                        MB <= '0';
                        FS <= "1110";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= ex3;
                    WHEN OTHERS =>
                        nextstate <= inf;
                END CASE;

            WHEN ex3 =>
                CASE opcode IS
                    WHEN "0001101" =>
                        IF Z = '1' THEN
                            nextstate <= ex4;
                        ELSE
                            nextstate <= ex2;
                        END IF;
                        PS <= "00";
                        IL <= '0';
                        DX <= "1001";
                        AX <= "1001";
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0110";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                    WHEN "0001110" =>
                        IF Z = '1' THEN
                            nextstate <= ex4;
                        ELSE
                            nextstate <= ex2;
                        END IF;
                        PS <= "00";
                        IL <= '0';
                        DX <= "1001";
                        AX <= "1001";
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0110";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                    WHEN OTHERS =>
                        nextstate <= inf;
                END CASE;

            WHEN ex4 =>
                CASE opcode IS
                    WHEN "0001101" | "0001110" =>
                        IL <= '0';
                        PS <= "01";
                        DX <= '0' & dx_sig;
                        AX <= "1000";
                        BX <= '-' & bx_sig;
                        MB <= '-';
                        FS <= "0000";
                        MD <= '0';
                        RW <= '1';
                        MM <= '-';
                        MW <= '0';
                        nextstate <= inf;
                    WHEN OTHERS =>
                        nextstate <= inf;
                END CASE;
        END CASE;
    END PROCESS;
END Behavioral;