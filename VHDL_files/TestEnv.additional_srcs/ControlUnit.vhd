library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity ControlUnit is
    port(
        instruction : in std_logic_vector(15 downto 0);
        regDst : out std_logic;
        extOp : out std_logic;
        aluSrc : out std_logic;
        branch : out std_logic;
        jump : out std_logic;
        aluOp : out std_logic_vector(2 downto 0);
        memWrite : out std_logic;
        memToReg : out std_logic;
        regWrite : out std_logic
    );
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

process (instruction(15 downto 13))
begin
    case instruction(15 downto 13) is
    --R type
    when "000" =>
        regDst <= '1';
        regWrite <= '1';
        aluSrc <= '0';
        extOp <= '0';
        aluOp <= instruction(2 downto 0); 
        memWrite <= '0';
        memToReg <= '0';
        branch <= '0';
        jump <= '0';  
    --addi
    when "001" =>
        regDst <= '0';
        regWrite <= '1';
        aluSrc <= '1';
        extOp <= '0';
        aluOp <= instruction(15 downto 13); 
        memWrite <= '0';
        memToReg <= '0';
        branch <= '0';
        jump <= '0'; 
    -- beq 
    when "010" =>
        regDst <= '0';
        regWrite <= '0';
        aluSrc <= '0';
        extOp <= '0';
        aluOp <= instruction(15 downto 13); 
        memWrite <= '0';
        memToReg <= '0';
        branch <= '1';
        jump <= '0';  
    --jump
    when "111" => 
        regDst <= '0';
        regWrite <= '0';
        aluSrc <= '0';
        extOp <= '0';
        aluOp <= "000"; 
        memWrite <= '0';
        memToReg <= '0';
        branch <= '0';
        jump <= '1'; 
     when others =>
        regDst <= '1';
        regWrite <= '1';
        aluSrc <= '0';
        extOp <= '0';
        aluOp <= instruction(2 downto 0); 
        memWrite <= '0';
        memToReg <= '0';
        branch <= '0';
        jump <= '0'; 
    end case;
end process;


end Behavioral;
