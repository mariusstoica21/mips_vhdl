library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity SSD is
    port(
        digit : in std_logic_vector (15 downto 0);
        clk : in std_logic;
        cat : out std_logic_vector(6 downto 0);
        an : out std_logic_vector (3 downto 0)
    );
end SSD;

architecture Behavioral of SSD is

signal count : std_logic_vector(15 downto 0);
signal out_mux : std_logic_vector(3 downto 0);

begin

process (clk,count)
begin
    if clk = '1' and clk'event then
        if count = X"FFFF" then
            count <= X"0000";
        else
            count <= count + 1;
        end if;
    end if;
end process;

process (count)
begin
    case count(15 downto 14) is
        when "00" =>  out_mux <= digit(3 downto 0);
        when "01" =>  out_mux <= digit(7 downto 4);
        when "10" =>  out_mux <= digit(11 downto 8);
        when others =>  out_mux <= digit(15 downto 12);
    end case;
end process;

process (count)
begin
    case count(15 downto 14) is
        when "00" =>  an <= "1110";
        when "01" =>  an <= "1101";
        when "10" =>  an <= "1011";
        when others =>  an <= "0111";
    end case;
end process;

process (out_mux)
begin
    case out_mux is
    when "0000" => cat <= "1000000";
    when "0001" => cat <= "1111001";
    when "0010" => cat <= "0100100";
    when "0011" => cat <= "0110000";
    when "0100" => cat <= "0011001";
    when "0101" => cat <= "0010010";
    when "0110" => cat <= "0000010";
    when "0111" => cat <= "1111000";
    when "1000" => cat <= "0000000";
    when "1001" => cat <= "0010000";
    when "1010" => cat <= "0001000";
    when "1011" => cat <= "0000011";
    when "1100" => cat <= "1000110";
    when "1101" => cat <= "0100001";
    when "1110" => cat <= "0000110";
    when others => cat <= "0001110";
    end case;
end process;



end Behavioral;
