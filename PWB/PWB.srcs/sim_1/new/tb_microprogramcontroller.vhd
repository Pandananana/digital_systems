LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;

ENTITY MicroprogramController_tb IS
END;

ARCHITECTURE bench OF MicroprogramController_tb IS

	COMPONENT MicroprogramController
		PORT (
			RESET : IN STD_LOGIC;
			CLK : IN STD_LOGIC;
			Adress_In : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Adress_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			Instruction_In : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			Constant_Out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			V, C, N, Z : IN STD_LOGIC;
			DX, AX, BX, FS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			MB, MD, RW, MM, MW : OUT STD_LOGIC);

	END COMPONENT;

	SIGNAL RESET : STD_LOGIC;
	SIGNAL CLK : STD_LOGIC;
	SIGNAL Adress_In : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL Adress_out : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL Instruction_In : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL Constant_Out : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL V, C, N, Z : STD_LOGIC;
	SIGNAL DX, AX, BX, FS : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL MB, MD, RW, MM, MW : STD_LOGIC;
	CONSTANT clk_period : TIME := 10 ns;
	SIGNAL end_test : STD_LOGIC := '1';
BEGIN

	uut : MicroprogramController PORT MAP(
		RESET => RESET,
		CLK => CLK,
		Adress_In => Adress_In,
		Adress_out => Adress_out,
		Instruction_In => Instruction_In,
		Constant_Out => Constant_Out,
		V => V,
		C => C,
		N => N,
		Z => Z,
		DX => DX,
		AX => AX,
		BX => BX,
		FS => FS,
		MB => MB,
		MD => MD,
		RW => RW,
		MM => MM,
		MW => MW);

	clock : PROCESS
	BEGIN

		WHILE end_test = '1'LOOP
			CLK <= '1';
			WAIT FOR clk_period * 0.5;
			CLK <= '0';
			WAIT FOR clk_period * 0.5;
		END LOOP;
		WAIT;
	END PROCESS;

	stimulus : PROCESS
	BEGIN
		Reset <= '1';
		V <= '-';
		C <= '-';
		N <= '-';
		Z <= '-';
		Adress_In <= (OTHERS => '0');
		Instruction_In <= (others => '0');
		WAIT FOR clk_period;
		Reset <= '0';

		Instruction_In(15 DOWNTO 9) <= "0001000";
		Instruction_In(8 DOWNTO 0) <= (OTHERS => '1');
		WAIT FOR 2*clk_period;
		
		Instruction_In(15 DOWNTO 9) <= "0010001";
		WAIT FOR 3 * clk_period;

		Instruction_In(15 DOWNTO 9) <= "0001101";
		Z <= '0';
		WAIT FOR 4 * clk_period;
		Z <= '1';
		wait for 3 * clk_period;
		Z <= '0';
		
		Instruction_In(15 DOWNTO 9) <= "0001110";
		Z <= '0';
		WAIT FOR 4 * clk_period;
		Z <= '1';
		wait for 3 * clk_period;
		Z <= '0';


		WAIT;
	END PROCESS;
END;