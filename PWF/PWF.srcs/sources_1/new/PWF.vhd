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
        LED : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        Cathode : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        Anode : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
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
    SIGNAL D_word_sig : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL MMR_sig : STD_LOGIC;
    SIGNAL ZFILL_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);

    -- Clock Scaling
    SIGNAL SCLK : STD_LOGIC := '0';
    SIGNAL DCLK : STD_LOGIC;
    
    -- Inverted Clock
    SIGNAL inv_Reset : STD_LOGIC;

    COMPONENT PortReg8X8 IS
        PORT (
            Reset : IN STD_LOGIC;
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
            Data_outM : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
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
            an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- Common Anodes
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
            CLK, FCLK : IN STD_LOGIC;
            Adress_In : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            Adress_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            Instruction_In : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            Constant_Out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            V, C, N, Z : IN STD_LOGIC;
            DX, AX, BX, FS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            MB, MD, RW, MM, MW : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT DivClk is
        port ( Reset: in STD_LOGIC;     -- Global Reset (BTN1)
               Clk: in STD_LOGIC;     -- Master Clock (50 MHz)
               TimeP: in integer;     -- Time periode of the divided clock (50e6)
               Clk1: out STD_LOGIC);   -- Divided clock1 (1 Hz)
    end COMPONENT;

    SIGNAL counter : INTEGER RANGE 0 TO 1 := 0;

BEGIN

    ClockDiv : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            counter <= counter + 1;
            IF counter = 1 THEN
                counter <= 0;
                sclk <= NOT sclk;
            END IF;
        END IF;
    END PROCESS;
    
    DP_Data_in_sig <= MPC_Instruction_In_sig(7 downto 0);

    MuxM : MUX2x1x8
    PORT MAP(
        R => DP_Address_out_sig,
        S => MPC_Address_Out_sig,
        MUX_Select => MM_sig,
        Y => PR_Address_In_sig
    );

    ZeroFiller : ZeroFiller2
    PORT MAP(
        X => DP_Data_out_sig,
        Y => ZFILL_OUT
    );

    RAM : Ram256X16
    PORT MAP(
        clk         =>   clk,
        Reset       =>   inv_Reset,
        Data_in     =>   ZFILL_OUT,    
        Adress_in   =>   PR_Address_In_sig,
        MW          =>   MW_sig,
        Data_outM   =>   Data_outM_sig
    );

    Port_Register : PortReg8X8
    PORT MAP(
        Reset => inv_Reset,
        clk => sclk,
        MW => MW_sig,
        Data_in => DP_Data_out_sig,
        Adress_in => PR_Address_In_sig,
        SW => SW,
        BTNC => BTNC,
        BTNU => BTNU,
        BTNL => BTNL,
        BTNR => BTNR,
        BTND => BTND,
        MMR => MMR_sig,
        D_word => D_word_sig,
        Data_outR => Data_outR_sig,
        LED => LED
    );

    MuxMR : MUX2x1x16
    PORT MAP(
        R               => Data_outM_sig,
        S               => Data_outR_sig,
        MUX_Select      => MMR_sig,        
        Y               => MPC_Instruction_In_sig
    );

    SevenSeg : SevenSeg4
    PORT MAP(
        inv_Reset, DCLK, D_word_sig, Cathode, Anode
    );

    DataPathComp : DataPath
    PORT MAP(
        Reset           => inv_Reset,    
        CLK             => sCLK,    
        RW              => RW_sig,
        DA              => DX_sig,
        AA              => AX_sig,
        BA              => BX_sig,
        ConstantIn      => Cconstant_in_sig,        
        MB              => MB_sig,
        FS3             => FS_sig(3),    
        FS2             => FS_sig(2),    
        FS1             => FS_sig(1),    
        FS0             => FS_sig(0),    
        DataIn          => DP_Data_in_sig,    
        MD              => MD_sig,
        Address_Out     => DP_Address_out_sig,            
        Data_Out        => DP_Data_Out_sig,        
        V               => V_sig,
        C               => C_sig,
        N               => N_sig,
        Z               => Z_sig
    );

    MPC : MicroprogramController
    PORT MAP(
        RESET           =>  inv_Reset,     
        CLK             =>  sCLK, 
        FCLK            =>  CLK,
        Adress_In       =>  DP_Address_out_sig,         
        Adress_out      =>  MPC_Address_Out_sig,         
        Instruction_In  =>  MPC_Instruction_In_sig,             
        Constant_Out    =>  Cconstant_in_sig,             
        V               =>  V_sig, 
        C               =>  C_sig, 
        N               =>  N_sig, 
        Z               =>  Z_sig, 
        DX              =>  DX_sig, 
        AX              =>  AX_sig, 
        BX              =>  BX_sig, 
        FS              =>  FS_sig, 
        MB              =>  MB_sig,
        MD              =>  MD_sig,
        RW              =>  RW_sig,
        MM              =>  MM_sig,
        MW              =>  MW_sig
    );

    DisplayClock : DivClk
    port map (
        inv_Reset,Clk,100e3,DCLK
    );
    
    inv_Reset <= NOT Reset;

END Behavioral;