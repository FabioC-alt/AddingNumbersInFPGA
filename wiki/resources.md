# Resources 
The necessary resource are divided into two categories, the IP libraries and the `.xdc` files, introduced in the [Blinking Led Tutorial of the dspsandbox's repo ](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/wiki/LED-blink).


## The `.xdc` file

The `.xdc` file is a constraints file for the Red Pitaya 125-14 FPGA board, Constraints files, often written in XDC format, are used to specify the physical constraints and properties of the design, such as pin assignments, I/O standards, and timing constraints.

Here's a breakdown of the sections in this constraints file:
    ADC (Analog-to-Digital Converter)
        Pin assignments for ADC data lines and clock signals.
        Specifies I/O standards and pin locations for ADC data and clock signals.

    DAC (Digital-to-Analog Converter)
        Pin assignments and I/O standards for DAC data and control lines.
        Includes properties for driving strength and slew rates.

    PWM DAC (Pulse Width Modulation DAC)
        Constraints for PWM DAC outputs, including pin assignments and I/O standards.

    XADC (Xilinx Analog-to-Digital Converter)
        Pin assignments and I/O standards for XADC input channels.

    Expansion Connector
        Pin assignments and I/O standards for expansion connectors on the board.

    LED
        Pin assignments and I/O standards for LED outputs on the board.

    Clock Constraints
        Defines clock period and input delay constraints for clock signals.

The file provided by [dspsandbox](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/blob/main/sdc/redpitaya-125-14.xdc) a simplified version of the official constraints file for ease of use, allowing developers to map FPGA pins to physical pins on the board and set up necessary electrical and timing properties. The commented-out sections (#) are placeholders where specific properties can be uncommented and customized according to the needs of the FPGA design.
The original file can be found [here](https://github.com/pavel-demin/red-pitaya-notes/blob/master/cfg/ports.xdc).

## The IP Libraries
IP libraries, or Intellectual Property libraries, in FPGA design refer to pre-designed and pre-tested blocks of functionality that can be integrated into FPGA designs to simplify and accelerate development. These IP blocks can handle common functions such as communication protocols, data processing, and mathematical operations, reducing the need to design these components from scratch.

The one provided by [dspsandbox](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/blob/main/sdc/redpitaya-125-14.xdc) are three:

- [RedPitaya Clock](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/tree/main/ip/Redpitaya-125-14-clk)
- [RedPitaya ADC](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/tree/main/ip/Redpitaya-125-14-adc)
- [RedPitaya DAC](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/tree/main/ip/Redpitaya-125-14-dac)

but for these tutorials the one necessary is the RedPitaya Clock.

### Why?

The custom clock module is introduced because the RedPitaya is not fully compatible with the default clock of the Zynq board so it needs to use an other module in order to work on the Vivado environment


### Table of Contents

- [Introduction](introduction.md)
- [Resources](resources.md)
  - [.xdc File](wiki/resources.md#xdc-file)
  - [IP Libraries](wiki/resources.md#ip-libraries)
- [Important Blocks to Know](wiki/important-blocks-to-know.md)
  - [AXI GPIO](wiki/important-blocks-to-know.md#axi-gpio)
  - [DMA](wiki/important-blocks-to-know.md#dma)
  - [Custom Blocks](wiki/important-blocks-to-know.md#custom-blocks)
- [Tutorial](wiki/tutorial.md)
  - [Adding Two Numbers](wiki/tutorial.md#adding-two-numbers)
  - [Adding Negative Numbers](wiki/tutorial.md#adding-negative-numbers)
  - [Adding Arrays of Numbers](wiki/tutorial.md#adding-arrays-of-numbers)

➡️ [Go to the Next Page](../tutorials/IntroductionToTutorials.md)

