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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionDecoderController is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           IR : in STD_LOGIC_VECTOR (15 downto 0);
           V,C,N,Z : in STD_LOGIC;
           PS : out STD_LOGIC_VECTOR (1 downto 0);
           IL : out STD_LOGIC;
           DX,AX,BX,FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB,MD,RW,MM,MW : out STD_LOGIC);
end InstructionDecoderController;

architecture Behavioral of InstructionDecoderController is

type statetype is (ex0,ex1,ex2,ex3,ex4,inf);
signal state, nextstate: statetype;
signal opcode: std_logic_vector(6 downto 0);
signal dx_sig,bx_sig,ax_sig: std_logic_vector(2 downto 0); 



begin

opcode <= IR(15 downto 9);
dx_sig <= IR(8 downto 6);
bx_sig <= IR(5 downto 3);
ax_sig <= IR(2 downto 0);

Control_state: process (RESET, CLK)
begin 
    if RESET = '1' then state <= inf;
    elsif CLK'event and CLK = '1' then 
        state <= Nextstate;
       end if;
 end process;
 

Control_logic: process(state,IR,V,C,N,Z)
begin
    case state is 
        when inf => 
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
            nextstate <= ex0;
        
        when ex0 => 
            case opcode is
                when "0000000" => 
                    
                when "0000001" =>
                when "0000010" =>
                when "0000101" =>
                when "0000110" =>
                when "0001000" =>
                when "0001001" =>
                when "0001010" =>
                when "0001011" =>
                when "0001100" =>
                when "0010000" =>
                when "0100000" =>
                when "1001100" =>
                when "1000010" =>
                when "1100000" =>
                when "1100001" =>
                when "1110000" =>
                when "0010001" =>
                when "0001101" =>
                when "0001110" =>
                
        when ex1 =>
            case opcode is
                when "0010001" => 
                when "0001101" => 
                when "0001110" => 
                 
        when ex2 =>
            case opcode is
                when "0001101" => 
                when "0001110" => 
                        
        when ex3 =>
            case opcode is
                when "0001101" => 
                when "0001110" => 
                        
        when ex4 =>
            case opcode is
                when "0001101" =>
                when "0001110" =>
        
       
            


end Behavioral;
