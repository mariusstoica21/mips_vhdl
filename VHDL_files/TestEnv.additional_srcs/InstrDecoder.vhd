library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_lOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity InstrDecoder is
    port(
        instruction : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        enWr : in std_logic;
        writeData : in std_logic_vector(15 downto 0);
        regWrite : in std_logic;
        regDst : in std_logic;
        extOp : in std_logic;
        rd1 : out std_logic_vector(15 downto 0);
        rd2 : out std_logic_vector(15 downto 0);
        extImm : out std_logic_vector(15 downto 0);
        func : out std_logic_vector(2 downto 0);
        sa : out std_logic
    );
end InstrDecoder;

architecture Behavioral of InstrDecoder is


signal ra1,ra2 : std_logic_vector(2 downto 0); 
signal writeAddress : std_logic_vector(2 downto 0);

type ram_array is array (0 to 7) of std_logic_vector(15 downto 0);


signal ram : ram_array := (
                others => X"0000"
                );
            
begin

ra1 <= instruction(12 downto 10);
ra2 <= instruction(9 downto 7);

process (regDst)
begin
    if regDst = '0' then
        writeAddress <= ra2;
    else
        writeAddress <= instruction(6 downto 4);
    end if;
end process;


process (clk,regWrite,enWr)
begin
    if clk = '1' and clk'event then
        if regWrite = '1' then
            if enWr = '1' then
                ram(conv_integer(writeAddress)) <= writeData;
            end if;
        end if;
    end if;
end process;

process (extOp)
begin
    if extOp = '0' then
        extImm <= X"00" & '0' & instruction(6 downto 0);
    else
        extImm <= X"FF" & '1' & instruction(6 downto 0);
    end if;
end process;


rd1 <= ram(conv_integer(ra1));
rd2 <= ram(conv_integer(ra2));


func <= instruction(2 downto 0);
sa <= instruction(3);


end Behavioral;
