library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity InitCounter is
    port(
        enBtn : in std_logic;
        clk : in std_logic;
        counter : out std_logic_vector(2 downto 0)
    );
end InitCounter;

architecture Behavioral of InitCounter is

begin


process (clk,enBtn)
begin
    if clk = '1' and clk'event then
        if enBtn = '1' then
            counter <= "000";
        end if;
    end if;
end process;

end Behavioral;
