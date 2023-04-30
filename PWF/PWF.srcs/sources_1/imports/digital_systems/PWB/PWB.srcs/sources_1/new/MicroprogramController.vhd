----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 10:26:10 AM
-- Design Name: 
-- Module Name: MicroprogramController - Behavioral
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

entity MicroprogramController is
    Port ( RESET : in STD_LOGIC;
           CLK, FCLK : in STD_LOGIC;
           Adress_In : in STD_LOGIC_VECTOR (7 downto 0);
           Adress_out : out STD_LOGIC_VECTOR (7 downto 0);
           Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
           Constant_Out : out STD_LOGIC_VECTOR (7 downto 0);
           V,C,N,Z : in STD_LOGIC;
           DX,AX,BX,FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB,MD,RW,MM,MW : out STD_LOGIC);
end MicroprogramController;

architecture Behavioral of MicroprogramController is

-- ProgramCounter signals
signal PS_sig :  STD_LOGIC_VECTOR(1 downto 0);
signal Offset_sig : STD_LOGIC_VECTOR(7 downto 0); -- Extended_8 i IR
-- InstructionRegister signals
signal IL_sig : STD_LOGIC;
signal IR_sig : STD_LOGIC_VECTOR(15 downto 0);
-- Instruction Decoder/Controller
-- TYPE statetype IS (ex0, ex1, ex2, ex3, ex4, inf);
-- signal state_sig, nextstate_sig : statetype;
-- signal opcode_sig : STD_LOGIC_VECTOR(6 DOWNTO 0);
-- signal dx_sig, bx_sig, ax_sig : STD_LOGIC_VECTOR(2 DOWNTO 0);

    component ProgramCounter is
        Port ( RESET : in STD_LOGIC;
               CLK : in STD_LOGIC;
               Adress_In : in STD_LOGIC_VECTOR (7 downto 0);
               PS : in STD_LOGIC_VECTOR (1 downto 0);
               Offset : in STD_LOGIC_VECTOR (7 downto 0);
               PC : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component InstructionRegister is
        Port ( RESET : in STD_LOGIC;
               CLK : in STD_LOGIC;
               Instruction_in : in STD_LOGIC_VECTOR (15 downto 0);
               IL : in STD_LOGIC;
               IR : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component SignExtender is
        Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
               Extended_8 : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component ZeroFiller is
        Port ( IR : in STD_LOGIC_VECTOR (15 downto 0);
               ZeroFilled_8 : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component InstructionDecoderController IS
        PORT (
            RESET : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            IR : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            V, C, N, Z : IN STD_LOGIC;
            PS : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
            IL : OUT STD_LOGIC;
            DX, AX, BX, FS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            MB, MD, RW, MM, MW : OUT STD_LOGIC);
    END component;    
begin

    InstReg: InstructionRegister
        port map (
            RESET, FCLK, Instruction_in, IL_sig, IR_sig
        );
    InstDecCont: InstructionDecoderController
        port map (
            RESET, CLK, IR_sig, V, C, N, Z, PS_sig, IL_sig, DX, AX, BX, FS, MB, MD, RW, MM, MW
        );
    ProgCount: ProgramCounter
        port map (
            RESET, CLK, Adress_In, PS_sig, offset_sig, Adress_out
        );
    SigExt: SignExtender
        port map (
            IR_sig, Offset_sig
        );
    ZerFil: ZeroFiller
        port map (
            IR_sig, Constant_Out
        );
        
end Behavioral;
