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
           CLK : in STD_LOGIC;
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
signal PS :  STD_LOGIC_VECTOR(1 downto 0);
signal Offset : STD_LOGIC_VECTOR(7 downto 0); -- Extended_8 i IR
signal PC : STD_LOGIC_VECTOR(7 downto 0);
-- InstructionRegister signals
signal IL : STD_LOGIC;
signal IR : STD_LOGIC_VECTOR(15 downto 0);
-- Instruction Decoder/Controller
signal state, nextstate : statetype;
signal opcode : STD_LOGIC_VECTOR(6 DOWNTO 0);
signal dx_sig, bx_sig, ax_sig : STD_LOGIC_VECTOR(2 DOWNTO 0);

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
    end componenet;
    
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

    

end Behavioral;
