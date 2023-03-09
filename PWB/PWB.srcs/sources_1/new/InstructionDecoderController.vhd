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
                when "0000001" =>
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
                when "0000010" =>
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
                when "0000101" =>
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
                when "0000110" =>
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
                when "0001000" =>
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
                when "0001001" =>
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
                when "0001010" =>
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
                when "0001011" =>
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
                when "0001100" =>
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
                when "0010000" =>
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
                when "0100000" =>
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
                when "1001100" =>
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
                when "1000010" =>
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
                when "1100000" =>
                    if Z = '1' then     
                        PS <= "10";
                    else
                        PS <= "01";
                    end if;
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
                when "1100001" =>
                    if N = '1' then     
                        PS <= "10";
                    else
                        PS <= "01";
                    end if;
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
                when "1110000" =>
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
                when "0010001" =>
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
                when "0001101" =>
                    if Z = '1' then     
                        PS <= "01";
                        nextstate <= inf;
                    else
                        PS <= "00";
                        nextstate <= ex1;
                    end if;
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
                when "0001110" =>
                    if Z = '1' then     
                        PS <= "01";
                        nextstate <= inf;
                    else
                        PS <= "00";
                        nextstate <= ex1;
                    end if;
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
