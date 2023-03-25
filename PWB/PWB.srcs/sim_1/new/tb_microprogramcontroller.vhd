library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MicroprogramController_tb is
end;

architecture bench of MicroprogramController_tb is

  component MicroprogramController
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

  signal RESET: STD_LOGIC;
  signal CLK: STD_LOGIC;
  signal Adress_In: STD_LOGIC_VECTOR (7 downto 0);
  signal Adress_out: STD_LOGIC_VECTOR (7 downto 0);
  signal Instruction_In: STD_LOGIC_VECTOR (15 downto 0);
  signal Constant_Out: STD_LOGIC_VECTOR (7 downto 0);
  signal V,C,N,Z: STD_LOGIC;
  signal DX,AX,BX,FS: STD_LOGIC_VECTOR (3 downto 0);
  signal MB,MD,RW,MM,MW: STD_LOGIC;
  constant clk_period: time:=10ns;
  signal end_test: std_logic:='1';
  

begin

  uut: MicroprogramController port map ( RESET          => RESET,
                                         CLK            => CLK,
                                         Adress_In      => Adress_In,
                                         Adress_out     => Adress_out,
                                         Instruction_In => Instruction_In,
                                         Constant_Out   => Constant_Out,
                                         V              => V,
                                         C              => C,
                                         N              => N,
                                         Z              => Z,
                                         DX             => DX,
                                         AX             => AX,
                                         BX             => BX,
                                         FS             => FS,
                                         MB             => MB,
                                         MD             => MD,
                                         RW             => RW,
                                         MM             => MM,
                                         MW             => MW );

  clock: process
  begin
  
        while end_test='1'loop
        CLK<='1';
        WAIT FOR clk_period*0.5;
        CLK<='0';
        WAIT FOR clk_period*0.5;
        end loop;
    wait;
  end process;
  
  stimulus: process
    begin 
    Reset<='1';
    wait for clk_period;
    Reset<='0';
    wait for clk_period;
    
    V<='-';C<='-';N<='-';Z<='-';Adress_In<=(others => '0');
    
    Instruction_In <= (OTHERS => '-');
            Instruction_In(8 downto 0) <= (OTHERS => '1');
            wait for 2*clk_period;
    
            -------------------------------------------------
            Instruction_In(15 downto 9) <= "0000000";
            wait for 3*clk_period;
            
            Instruction_In(15 downto 9) <= "0001000";
            wait for 2*clk_period;
            
            Instruction_In(15 downto 9) <= "0000000";
            wait for 2*clk_period;
                        
            Instruction_In(15 downto 9) <= "0010001";
            wait for 2*clk_period;
    
            Instruction_In(15 downto 9) <= "0001101";
            wait for 2*clk_period;
                        
            Instruction_In(15 downto 9) <= "0001101";
            wait for 2*clk_period;
                        
            Instruction_In(15 downto 9) <= "0001110";
            wait for 2*clk_period;
                                    
            Instruction_In(15 downto 9) <= "0001110";
            wait for 2*clk_period;

    wait;
  end process;


end;