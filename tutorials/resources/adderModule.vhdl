library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adderModule is
  Port (
    clk : in STD_LOGIC;
    inAValue : in STD_LOGIC_VECTOR(15 downto 0);
    inBValue : in STD_LOGIC_VECTOR(15 downto 0);
    outValue : out STD_LOGIC_VECTOR(31 downto 0)
  );
end adderModule;

architecture Behavioral of adderModule is
  signal signed_inA : signed(15 downto 0);
  signal signed_inB : signed(15 downto 0);
  signal signed_out : signed(31 downto 0);
begin

  process(clk)
  begin
    if rising_edge(clk) then
      signed_inA <= signed(inAValue);
      signed_inB <= signed(inBValue);
      signed_out <= resize(signed_inA, 31) + resize(signed_inB, 31);
      outValue <= std_logic_vector(signed_out);
    end if;
  end process;

end Behavioral;
