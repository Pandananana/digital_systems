----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2023 19:56:57
-- Design Name: 
-- Module Name: PWF - Behavioral
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

ENTITY PWF IS
    PORT (
        CLK, RESET : IN STD_LOGIC;
        SW : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        BTNC, BTNU, BTNL, BTNR, BTND : IN STD_LOGIC;
        BTN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        LED : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        Cathode : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        Anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END PWF;

ARCHITECTURE Behavioral OF PWF IS

    -- Datapath Signals
    SIGNAL DP_Address_out_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL DP_Data_out_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL DP_Data_in_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Cconstant_in_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL V_sig : STD_LOGIC;
    SIGNAL C_sig : STD_LOGIC;
    SIGNAL N_sig : STD_LOGIC;
    SIGNAL Z_sig : STD_LOGIC;

    -- Microprogram Controller Signals
    SIGNAL MPC_Address_in_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MPC_Address_Out_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MPC_Instruction_In_sig : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MW_sig : STD_LOGIC;
    SIGNAL MM_sig : STD_LOGIC;
    SIGNAL MD_sig : STD_LOGIC;
    SIGNAL MB_sig : STD_LOGIC;
    SIGNAL FS_sig : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL RW_sig : STD_LOGIC;
    SIGNAL AX_sig : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL BX_sig : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL DX_sig : STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Port Register Signals
    SIGNAL PR_Address_In_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Data_outR_sig : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL Data_outM_sig : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL D_word_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MMR_sig : STD_LOGIC;
    SIGNAL ZFILL_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
    COMPONENT PortReg8X8 IS
        PORT (
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

    COMPONENT MUX2x1x16 IS
        PORT (
            R, S : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            MUX_Select : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    COMPONENT MUX2x1x8 IS
        PORT (
            R, S : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            MUX_Select : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT Ram256X16 IS
        PORT (
            clk : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Data_in : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Adress_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            MW : IN STD_LOGIC;
            Data_outM : IN STD_LOGIC_VECTOR (15 DOWNTO 0)); -- STEMMER IKKE OVERENS MED RAMBLOCK
    END COMPONENT;

    COMPONENT ZeroFiller2 IS
        PORT (
            X : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            Y : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;

    COMPONENT SevenSeg4 IS
        PORT (
            Rst, Clk : IN STD_LOGIC;
            Data : IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- Binary data
            cat : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Common cathodes
            an : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); -- Common Anodes
    END COMPONENT;

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

    COMPONENT MicroprogramController IS
        PORT (
            RESET : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            Adress_In : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            Adress_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            Instruction_In : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Constant_Out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            V, C, N, Z : IN STD_LOGIC;
            DX, AX, BX, FS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            MB, MD, RW, MM, MW : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    MuxM : MUX2x1x8
    PORT MAP(
        DP_Address_out_sig, MPC_Address_Out_sig, MM_sig, PR_Address_In_sig
    );

    ZeroFiller : ZeroFiller2
    PORT MAP(
        DP_Data_out_sig, ZFILL_OUT
    );

    RAM : Ram256X16
    PORT MAP(
        clk, Reset, ZFILL_OUT, PR_Address_In_sig, MW_sig, Data_outM_sig
    );

    Port_Register : PortReg8X8
    PORT MAP(
        clk, MW_sig, DP_Data_out_sig, PR_Address_In_sig, SW, BTNC, BTNU, BTNL, BTNR, BTND, MMR_sig, D_word_sig, Data_outR_sig, LED
    );

    MuxMR : MUX2x1x16
    PORT MAP(
        Data_outM_sig, Data_outR_sig, MMR_sig, MPC_Instruction_In_sig
    );

    SevenSeg : SevenSeg4
    PORT MAP(
        Reset, Clk, D_word_sig, Cathode, Anode
    );

    DataPathComp : DataPath
    PORT MAP(
        Reset, CLK, RW_sig, DX_sig, AX_sig, BX_sig, Cconstant_in_sig, MB_sig, FS_sig(3), FS_sig(2), FS_sig(1), FS_sig(0), 
        DP_Data_in_sig, MD_sig, DP_Address_out_sig, DP_Data_Out_sig, V_sig, C_sig, N_sig, Z_sig
    );

    MPC : MicroprogramController
    PORT MAP(
        RESET, CLK, MPC_Address_in_sig, MPC_Address_Out_sig, MPC_Instruction_In_sig, Cconstant_in_sig,
        V_sig, C_sig, N_sig, Z_sig, DX_sig, AX_sig, BX_sig, FS_sig, MB_sig, MD_sig, RW_sig, MM_sig, MW_sig
    );

END Behavioral;