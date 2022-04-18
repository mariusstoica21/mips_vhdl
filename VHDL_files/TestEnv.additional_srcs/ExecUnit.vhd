library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ExecUnit is
    port(
        pcNext : in std_logic_vector(15 downto 0);
        rd1 : in std_logic_vector(15 downto 0);
        rd2 : in std_logic_vector(15 downto 0);
        extImm : in std_logic_vector(15 downto 0);
        func : in std_logic_vector(2 downto 0);
        sa : in std_logic;
        aluSrc : in std_logic;
        aluOp : in std_logic_vector(2 downto 0);
        branchAddress : out std_logic_vector(15 downto 0);
        aluRes : out std_logic_vector(15 downto 0);
        zero : out std_logic
    );
end ExecUnit;

architecture Behavioral of ExecUnit is

signal aluCtrl : std_logic_vector(3 downto 0);
signal input2 : std_logic_vector(15 downto 0);
signal aluRes1 : std_logic_vector(15 downto 0) := X"0000";

begin

process (aluOp)
begin
    case aluOp is
        when "000" => aluCtrl <= '0' & func;
        when "001" => aluCtrl <= "1000";
        when "010" => aluCtrl <= "1001";
        when "011" => aluCtrl <= "1010";
        when "100" => aluCtrl <= "1011";
        when "101" => aluCtrl <= "1100";
        when "110" => aluCtrl <= "1101";
        when others => aluCtrl <= "1110";
    end case;
end process;

process (aluSrc)
begin
    if aluSrc = '0' then
        input2 <= rd2;
    else
        input2 <= extImm;
    end if;
end process;

process (aluCtrl)
begin
    case aluCtrl is
        when "0000" => aluRes1 <= rd1 and input2;
        when "1000" => aluRes1 <= rd1 + input2; 
        when others => aluRes1 <= rd1 - input2;  
    end case;
end process;

process (aluRes1)
begin
    if aluRes1 = X"0000" then
        zero <= '1';
    else
        zero <= '0';    
    end if;
end process;

aluRes <= aluRes1;
branchAddress <= pcNext + extImm;

end Behavioral;
