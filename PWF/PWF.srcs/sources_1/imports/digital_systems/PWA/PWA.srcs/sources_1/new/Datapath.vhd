----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 10:22:25 AM
-- Design Name: 
-- Module Name: Top - Behavioral
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

ENTITY Datapath IS
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
END Datapath;

ARCHITECTURE Behavioral OF Datapath IS
    COMPONENT FunctionUnit IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            FS3, FS2, FS1, FS0 : IN STD_LOGIC;
            V, C, N, Z : OUT STD_LOGIC;
            F : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT RegisterFile IS
        PORT (
            RESET : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            RW : IN STD_LOGIC;
            DA, AA, BA : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            D_Data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            A_Data, B_Data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT MUX2x1x8 IS
        PORT (
            R, S : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            MUX_Select : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    signal D_Data_sig   : std_logic_vector(7 downto 0);
    signal A_Data_sig   : std_logic_vector(7 downto 0);
    signal B_Data_sig   : std_logic_vector(7 downto 0);
    signal MUXB_sig     : std_logic_vector(7 downto 0);
    signal F_sig        : std_logic_vector(7 downto 0);

BEGIN
    RegFile: RegisterFile
        port map (
            Reset,Clk,RW,DA,AA,BA,D_Data_sig,A_Data_sig,B_Data_sig
        );
    
    MUXB: MUX2x1x8
        port map (
            B_Data_sig,ConstantIn,MB,MUXB_sig
        );

    FU: FunctionUnit
        port map (
            A_Data_sig,MUXB_sig,FS3,FS2,FS1,FS0,V,C,N,Z,F_sig
        );
    
    MUXD: MUX2x1x8
        port map (
            F_sig,DataIn,MD,D_Data_sig
        );
    
    Address_Out <= A_data_sig;
    Data_Out    <= MUXB_sig;

END Behavioral;