library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity MPG is
    Port(
        btn : in std_logic;
        clk : in std_logic;
        enable : out std_logic
    );
end MPG;

architecture Behavioral of MPG is

signal count : std_logic_vector(17 downto 0) := X"0000" & "00";
signal q1,q2,q3 : std_logic := '0';
signal en : std_logic := '0';

begin

--counter
process (clk,count)
begin
    if clk = '1' and clk'event then
        if count = X"FFFF" & "11" then
            count <= X"0000" & "00";
            en <= '1';
        else
            count <= count + 1;
        end if; 
    end if;
end process;

process (clk,en)
begin
    if clk = '1' and clk'event then
        if en = '1' then
            q1 <= btn;
        end if;
    end if;
end process;

process (clk)
begin
    if clk = '1' and clk'event then
        q2 <= q1;
    end if;
end process;

process (clk)
begin
    if clk = '1' and clk'event then
        q3 <= q2;
    end if;
end process;

enable <= q2 and (not q3);

end Behavioral;
