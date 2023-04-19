

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Full_adder_8bit is
    Port ( y : in STD_LOGIC_VECTOR (7 downto 0);
           ci : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           co : out STD_LOGIC;
           V: out STD_LOGIC);
           
end Full_adder_8bit;

architecture Behavioral of Full_adder_8bit is
    component Full_adder is
      Port ( x : in STD_LOGIC;
           y : in STD_LOGIC ;
           ci : in STD_LOGIC;
           so : out STD_LOGIC;
           co : out STD_LOGIC);
    end component;
    
    component Half_adder is
         Port ( x,y : in STD_LOGIC;
               S,C : out STD_LOGIC);
    end component;    
    signal cc: std_logic_vector(7 downto 0);
    signal co_sig: std_logic;

begin

Gen_add: for i in 0 to 7 generate

Low_bit: if i=0 generate

        U0: Full_adder port map (x(i),y(i),ci,sum(i),cc(0));
        
        end generate Low_bit;

upper_bits: if (i>0 and i<7) generate
        ux: Full_adder port map (x(i),y(i),cc(i-1),sum(i),cc(i));
        end generate upper_bits; 
        
msb: if i=7 generate
    Umsb: Full_adder port map (x(i),y(i),cc(i-1),sum(i),co_sig);
    end generate msb;

end generate Gen_add;

V <= cc(6) xor co_sig;
co <= co_sig;


end Behavioral;















