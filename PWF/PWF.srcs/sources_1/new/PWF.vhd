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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWF is
    Port ( CLK : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTN : in STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0);
           sevenseg_out : out STD_LOGIC_VECTOR (7 downto 0));
end PWF;

architecture Behavioral of PWF is

signal Adress_in_sig :  STD_LOGIC_VECTOR(7 downto 0);
signal Adress_out_sig :  STD_LOGIC_VECTOR(7 downto 0);
signal Data_out_sig :  STD_LOGIC_VECTOR(7 downto 0);
signal Data_in_sig :  STD_LOGIC_VECTOR(7 downto 0);
signal Data_outR_sig :  STD_LOGIC_VECTOR(15 downto 0);
signal Data_outM_sig :  STD_LOGIC_VECTOR(15 downto 0);
signal Instruction_in_sig :  STD_LOGIC_VECTOR(15 downto 0);
signal Adress_sig :  STD_LOGIC_VECTOR(7 downto 0);
signal D_word_sig :  STD_LOGIC_VECTOR(7 downto 0);
signal MMR_sig :  STD_LOGIC;

signal MW_sig :  STD_LOGIC;
signal MM_sig :  STD_LOGIC;
signal MD_sig :  STD_LOGIC;
signal MB_sig :  STD_LOGIC;

signal FS_sig:  STD_LOGIC_VECTOR(3 downto 0);
signal RW_sig :  STD_LOGIC_VECTOR(1 downto 0);

signal AX_sig :  STD_LOGIC_VECTOR(3 downto 0);
signal BX_sig :  STD_LOGIC_VECTOR(3 downto 0);
signal DX_sig :  STD_LOGIC_VECTOR(3 downto 0);

signal Cconstant_in_sig :  STD_LOGIC_VECTOR(7 downto 0);

signal V_sig :  STD_LOGIC_VECTOR(1 downto 0);
signal C_sig :  STD_LOGIC_VECTOR(1 downto 0);
signal N_sig :  STD_LOGIC_VECTOR(1 downto 0);
signal Z_sig :  STD_LOGIC_VECTOR(1 downto 0);

component PortReg8X8 is
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
end component;

component MUX2x1x16 IS
    PORT (
        R, S : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        MUX_Select : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
END component;

component MUX2x1x8 IS
    PORT (
        R, S : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        MUX_Select : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END component;

component Ram256X16 is
    Port ( clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (15 downto 0);
           Adress_in : in STD_LOGIC_VECTOR (7 downto 0);
           MW : in STD_LOGIC_VECTOR (1 downto 0);
           Data_outM : in STD_LOGIC);
end component;

component ZeroFiller2 is
    Port ( Y : in STD_LOGIC_VECTOR (15 downto 0);
           ZeroFilled_8 : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component SevenSeg4 is
    Port ( Rst,Clk: in  std_logic;    
	        Data :   in  std_logic_vector (15 downto 0); -- Binary data
           cat :    out std_logic_vector(6 downto 0);  -- Common cathodes
           an :     out std_logic_vector(3 downto 0)); -- Common Anodes
end component;





component Datapath IS
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
END component;


component MicroprogramController is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Adress_In : in STD_LOGIC_VECTOR (7 downto 0);
           Adress_out : out STD_LOGIC_VECTOR (7 downto 0);
           Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
           Constant_Out : out STD_LOGIC_VECTOR (7 downto 0);
           V,C,N,Z : in STD_LOGIC;
           DX,AX,BX,FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB,MD,RW,MM,MW : out STD_LOGIC);
end component;

begin

MuxM: MUX2x1x8
        port map (
            Adress_out_sig,Adress_in_sig,MM_sig,Adress_sig
        );

MuxMR: MUX2x1x16
        port map (
            Data_outM_sig,Data_outR_sig,MMR_sig,Instruction_in_sig
        );
        
        
MuxM: PortReg8X8
                port map (
                    MW_sig,
                );

MuxM: MUX2x1x8
        port map (
            Adress_out_sig,Adress_in_sig,MM_sig,Adress_sig
        );


MuxM: MUX2x1x8
        port map (
            Adress_out_sig,Adress_in_sig,MM_sig,Adress_sig
        );


MuxM: MUX2x1x8
        port map (
            Adress_out_sig,Adress_in_sig,MM_sig,Adress_sig
        );
        
        
        
 MuxM: MUX2x1x8
                port map (
                    Adress_out_sig,Adress_in_sig,MM_sig,Adress_sig
                );       
        

MuxM: MUX2x1x8
        port map (
            Adress_out_sig,Adress_in_sig,MM_sig,Adress_sig
        );

end Behavioral;









