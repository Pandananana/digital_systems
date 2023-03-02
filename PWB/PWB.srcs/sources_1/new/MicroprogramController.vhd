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
           MB.MD,RW,MM,MW : out STD_LOGIC);
end MicroprogramController;

architecture Behavioral of MicroprogramController is

begin


end Behavioral;
