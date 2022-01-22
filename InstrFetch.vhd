library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstrFetch is
    port(
        branchAddress : in std_logic_vector(15 downto 0);
        jumpAddress : in std_logic_vector(15 downto 0);
        enPc : in std_logic;
        clk : in std_logic;
        jump : in std_logic;
        pcSrc : in std_logic;
        instruction : out std_logic_vector(15 downto 0);
        pcNext : out std_logic_vector(15 downto 0)     
    );
end InstrFetch;

architecture Behavioral of InstrFetch is

signal pc : std_logic_vector(15 downto 0) := X"0000";
signal pcNext1 : std_logic_vector(15 downto 0);
signal outMux1,outMux2 : std_logic_vector(15 downto 0);

type rom_array is array (0 to 255) of std_logic_vector(15 downto 0);

signal rom : rom_array := (
                        X"0010",
                        X"0020",
                        X"0030",
                        X"2906",
                        X"4D03",
                        X"2D81",
                        X"0591",
                        X"E004",
                        X"0010",
                        X"0020",
                        X"0030",
                        others => X"0000"
                        );

begin

process (clk,enPc)
begin
    if clk = '1' and clk'event then
        if enPc = '1' then
            pc <= outMux2;
        end if;
    end if;
end process;

pcNext1 <= pc + 1;
pcNext <= pcNext1;

process (pcSrc)
begin
    if pcSrc = '0' then
        outMux1 <= pcNext1;
    else
        outMux1 <= branchAddress;
    end if;
end process;

process (jump)
begin
    if jump = '0' then
        outMux2 <= outMux1;
    else
        outMux2 <= jumpAddress;
    end if;    
end process;

instruction <= rom(conv_integer(pc));


end Behavioral;
