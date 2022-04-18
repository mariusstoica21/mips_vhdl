library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity MEM is
    port(
        aluRes : in std_logic_vector(15 downto 0);
        rd2 : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        memWrite : in std_logic;
        memData : out std_logic_vector(15 downto 0);
        aluRes1 : out std_logic_vector(15 downto 0)  
    );
end MEM;

architecture Behavioral of MEM is

type ram_array is array (0 to 31) of std_logic_vector(15 downto 0);

signal ram : ram_array := (
        others => X"0000"
);

begin

process (clk,memWrite)
begin
    if clk = '1' and clk'event then
        if memWrite = '1' then
            ram(conv_integer(aluRes)) <= rd2;
        end if;
    end if;
end process;

memData <= ram(conv_integer(aluRes));
aluRes1 <= aluRes;


end Behavioral;
