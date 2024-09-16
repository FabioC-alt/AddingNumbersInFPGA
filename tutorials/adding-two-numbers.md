# Adding two numbers

In this tutorial we'll see first how to compose the FPGA design to add to two number, then the necessary instructions to control the FPGA from Jupyter Notebook. In the second section we'll see how to make sums with negative numbers. This is possible thanks to the fact that the FPGA does not have any notion of negative numbers, so it is possible to interpreate a binary number as negative with the rigth operations.

## FPGA Design
The block we need to import are:

- Zynq Processing System
- Processor System Reset
- 2xAxi GPIO modules

![Image Alt Text](./images/AddingTwonumberStartingDesign.png)

The first step is to tap the "*Run Block Automation*" tab. The Run Block Automation dialog box lets you provide input about basic features that the microprocessor system requires.

Now we need to add the adder module. Before adding it to the project let's how it is structured the VHDL file:

```
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
      signed_out <= signed_inA + signed_inB;
      outValue <= std_logic_vector(signed_out);
    end if;
  end process;

end Behavioral;

```

First the libraries are stated: 
```
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
```
- `library IEEE`: This declares that you're using the IEEE library, which contains commonly used packages in digital design.

- `IEEE.STD_LOGIC_1164.ALL`: This imports the STD_LOGIC_1164 package, which defines types like STD_LOGIC and STD_LOGIC_VECTOR. These types are widely used for representing digital signals.
- `IEEE.NUMERIC_STD.ALL`: This imports the numeric_std package, which provides standard arithmetic operations on signed and unsigned numbers. This is preferred over STD_LOGIC_ARITH and STD_LOGIC_UNSIGNED since it's the IEEE standard.

**entity module**: state which are the inputs and the outputs for the module

**architecture Behavioral of adderModule**: defines the internal behavior of the adderModule. The architecture name is Behavioral, indicating that this code defines the functionality without specifying the low-level hardware implementation.

**process(clk)**: A process block is a sequential part of the architecture that will be triggered by changes in the clk signal. In this case, the block runs on every rising edge of the clock. rising_edge(clk) checks if there is a rising edge (transition from 0 to 1) on the clock signal clk. This is how the process is synchronized with the clock.

To add this file to the project you can either create a new VHDL file(*Add Source -> Add or create design sources -> Create file*) or import this [file](/tutorials/resources/adderModule.vhdl) (*Add Source -> Add or create design sources -> Add file*)