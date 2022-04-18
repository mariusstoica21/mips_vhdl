library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity UART_TX is
    port(
        txData : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        txEn : in std_logic;
        rst : in std_logic;
        baudEn : in std_logic;
        tx : out std_logic;
        txRdy : out std_logic
        );
end UART_TX;

architecture Behavioral of UART_TX is

type state_type is (idle,start,bitt,stop);
signal state : state_type;


signal txEnOut : std_logic;
signal count : std_logic_vector (2 downto 0);

begin


process(clk,txEn,baudEn)
begin
    if clk = '1' and clk'event then
        if txEn = '0' and baudEn = '0' then
            txEnOut <= txEnOut;
        elsif txEn = '1' and baudEn = '0' then
            txEnOut <= '1';
        elsif txEn = '0' and baudEn = '1' then
            txEnOut <= '0';
        end if;       
    end if;
end process;

process (clk,rst)
begin
    if rst = '1' then
        state <= idle;
        tx <= '1';
        txRdy <= '1';
    else
        if clk = '1' and clk'event and baudEn = '1' then
            case state is
                when idle => 
                    if txEnOut = '1' then
                        state <= start;   
                    end if;
                    tx <= '1';
                    txRdy <= '1';
                    count <= "000";
                when start =>
                    tx <= '0';
                    txRdy <= '0';
                    state <= bitt;
                when bitt => 
                    if count = "111" then
                        state <= stop;
                    else
                        count <= count + 1;  
                    end if;
                    tx <= txData(conv_integer(count));
                    txRdy <= '0';
                when stop =>
                    tx <= '1';
                    txRdy <= '0'; 
                    state <= idle;
            end case;   
        end if;
    end if; 
end process;



end Behavioral;
