library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity TestEnv is
    port(
        clk : in std_logic;
        btn : in std_logic_vector(4 downto 0);
        sw : in std_logic_vector(15 downto 0);
        cat : out std_logic_vector(6 downto 0);
        an : out std_logic_vector(3 downto 0);
        led : out std_logic_vector(15 downto 0)
    );
end TestEnv;

architecture Behavioral of TestEnv is

signal enBtn1,enBtn2,enBtn3 : std_logic;
signal digit : std_logic_vector(15 downto 0);
signal instruction : std_logic_vector(15 downto 0);
signal pcNext : std_logic_vector(15 downto 0);
signal branchAddress : std_logic_vector(15 downto 0);
signal jumpAddress : std_logic_vector(15 downto 0);
signal rd1,rd2,writeData : std_logic_vector(15 downto 0);
signal extImm : std_logic_vector(15 downto 0);
signal func : std_logic_vector(2 downto 0);
signal sa : std_logic;
signal aluSrc : std_logic;
signal aluOp : std_logic_vector(2 downto 0);
signal aluRes : std_logic_vector(15 downto 0);
signal zero : std_logic;
signal regDst,extOp,branch,jump,memToReg,memWrite,regWrite : std_logic;
signal pcSrc : std_logic;
signal aluRes1, memData : std_logic_vector(15 downto 0);


component MPG
    Port(
        btn : in std_logic;
        clk : in std_logic;
        enable : out std_logic
    );
end component;

component SSD
    port(
        digit : in std_logic_vector (15 downto 0);
        clk : in std_logic;
        cat : out std_logic_vector(6 downto 0);
        an : out std_logic_vector (3 downto 0)
    );
end component;

component InstrFetch
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
end component;

component InstrDecoder
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
end component;

component ExecUnit
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
end component;

component ControlUnit
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
end component;

component MEM
    port(
        aluRes : in std_logic_vector(15 downto 0);
        rd2 : in std_logic_vector(15 downto 0);
        clk : in std_logic;
        memWrite : in std_logic;
        memData : out std_logic_vector(15 downto 0);
        aluRes1 : out std_logic_vector(15 downto 0)  
    );
end component;

begin

MPG1 : MPG port map (
        btn => btn(2),
        clk => clk,
        enable => enBtn1
);

MPG2 : MPG port map (
        btn => btn(3),
        clk => clk,
        enable => enBtn2
);

MPG3 : MPG port map (
        btn => btn(4),
        clk => clk,
        enable => enBtn3
);

SSD1 : SSD port map (
        digit => digit,
        clk => clk,
        cat => cat,
        an => an
);

IF1 : InstrFetch port map (
        branchAddress => branchAddress,
        jumpAddress => jumpAddress,
        enPc => enBtn1,
        clk => clk,
        jump => jump,
        pcSrc => pcSrc,
        instruction => instruction,
        pcNext => pcNext
);

ID1 : InstrDecoder port map (
        instruction => instruction,
        clk => clk,
        enWr => enBtn1,
        writeData => writeData,
        regWrite => regWrite,
        regDst => regDst,
        extOp => extOp,
        rd1 => rd1,
        rd2 => rd2,
        extImm => extImm,
        func => func,
        sa => sa
        );
        
EX1 : ExecUnit port map (
        pcNext => pcNext,
        rd1 => rd1,
        rd2 => rd2,
        extImm => extImm,
        func => func,
        sa => sa,
        aluSrc => aluSrc,
        aluOp => aluOp,
        branchAddress => branchAddress,
        aluRes => aluRes,
        zero => zero
);

CU1 : ControlUnit port map(
        instruction => instruction,
        regDst => regDst,
        extOp => extOp,
        aluSrc => aluSrc,
        branch => branch,
        jump => jump,
        aluOp => aluOp,
        memWrite => memWrite,
        memToReg => memToReg,
        regWrite => regWrite
);

MEM1 : MEM port map(
        aluRes => aluRes,
        rd2 => rd2,
        clk => clk,
        memWrite => memWrite,
        memData => memData,
        aluRes1 => aluRes1
);

pcSrc <= branch and zero;
jumpAddress <= "000" & instruction(12 downto 0);

process (memToReg)
begin
    if memToReg = '0' then
        writeData <= aluRes;
    else
        writeData <= memData;
    end if;
end process;

process (sw(7 downto 5))
begin
    case sw(7 downto 5) is
        when "000" => digit <= instruction;
        when "001" => digit <= pcNext;
        when "010" => digit <= rd1;
        when "011" => digit <= rd2;
        when "100" => digit <= extImm;
        when "101" => digit <= aluRes;
        when "110" => digit <= branchAddress;
        when others => digit <= writeData;
    end case;
end process;




end Behavioral;
