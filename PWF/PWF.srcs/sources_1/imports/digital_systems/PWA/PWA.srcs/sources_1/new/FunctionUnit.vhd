----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 11:02:41 AM
-- Design Name: 
-- Module Name: FunctionUnit - Behavioral
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

ENTITY FunctionUnit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        FS3, FS2, FS1, FS0 : IN STD_LOGIC;
        V, C, N, Z : OUT STD_LOGIC;
        F : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END FunctionUnit;

ARCHITECTURE Behavioral OF FunctionUnit IS
    COMPONENT ALU IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            J_Select : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            V, C : OUT STD_LOGIC;
            J : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT Shifter IS
        PORT (
            B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            H_Select : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
            h : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT MUX2x1x8 IS
        PORT (
            R, S : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            MUX_Select : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT FunctionSelect IS
        PORT (
            FS3, FS2 : IN STD_LOGIC;
            MF : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT NegZero IS
        PORT (
            MUXF : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            N, Z : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL J_sig : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL H_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MUXF_sig : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL MF_sig : STD_LOGIC;

BEGIN
    ALU_comp: ALU
        port map (
            A => A,
            B => B,
            J_Select(0) => FS0,
            J_Select(1) => FS1,
            J_Select(2) => FS2,
            J_Select(3) => FS3,
            V => V,
            C => C,
            J => J_sig
        );

    Shifter_comp: Shifter
        port map (
            B => B,
            H_Select(0) => FS0,
            H_Select(1) => FS1,
            h => H_sig            
        );

    Fsel_comp: FunctionSelect
        port map (
            FS3,FS2,MF_sig           
        );
    
    MUXF: MUX2x1x8
        port map (
            J_sig,H_sig,MF_sig,MUXF_sig
        );
    
    NegZero_comp: NegZero
        port map (
            MUXF_sig,N,Z            
        );
    
    F <= MUXF_sig;

END Behavioral;