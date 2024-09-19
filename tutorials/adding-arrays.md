# Adding Arrays

In this section, we'll explore how to sum corresponding elements of arrays. This is a fundamental operation that you'll often encounter when working with arrays or lists in various programming languages. Let's dive into the concept and see how it's implemented step by step.

## FPGA Design

First, create a new project and import the constraints of the FPGA. 
Import the following blocks:
- Processor System Reset
- Axi Gpio
- 2 x Axi DMA 
- Zynq Processing System

![](/tutorials/resources/AddingTwoArrays/addingArraysInitialDesign.png)

Now we need to add the custom IP to control the RedPitaya clock, you can find it [here](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/tree/main/ip), along with the ADC and DAC.

To import them go to the *Project Manager -> Settings -> IP Repository* and use the "+" tab to add a new repo folder. Now add the RedPitaya clk block and press "*Ctrl+K*" on the input port to the block to create an external connection for the block.

![](/tutorials/resources/AddingTwoArrays/AxiGpioPortsConnections.png)

Now run the *Run Block Automation* tab.

Next, we need to configure the DMA (Direct Memory Access) controllers. Our aim is to minimize the number of DMAs we use. However, it's important to note that each DMA controller is limited to two channels: 
- One channel for reading 
- One channel for writing

With this in mind, we'll strategically plan our design to use as few DMAs as possible while ensuring efficient data transfer.

We'll use one DMA to send and receive the data from the FPGA and one only to send the second array.

Configure the first DMA as follow:
![](/tutorials/resources/AddingTwoArrays/receiveAndSendDma.png)

Here the configured channels are both the reading and writing ones, instead in the second only the writing channel need to be configured.

And the second one like this:
![](/tutorials/resources/AddingTwoArrays/sendOnlyDma.png)

Now let's configure the Axi GPIO module, in this project in order to synchronize the DMAs a trigger is needed along with the number of samples which is necessary to communicate to the FPGA the length of the array, to perfom this tasks the Axi GPIO needs to be configured as follow:

![](/tutorials/resources/AddingTwoArrays/summingArraysAxiGpio.png)

The first channel has only 1-bit wire (0 or 1), and it will be the trigger, while the second will be the sample number channel.

Now it run the tab "*Run Connection Automation*" and delete the Axi-GPIO unnecessary connections, in the end the design should look like this:

![](/tutorials/resources/AddingTwoArrays/tabRunAutomation.png)

Now we need to add the [*stream_control*]() file and the [*stream_adder*]() file.


### Table of Contents

- [Introduction](introduction.md)
- [Resources](resources.md)
  - [.xdc File](resources.md#the-xdc-file)
  - [IP Libraries](resources.md#the-ip-libraries)
- [Important Blocks to Know](important-blocks-to-know.md)
  - [AXI GPIO](/wiki/important-blocks-to-know.md#axi-gpio)
  - [DMA](/wiki/important-blocks-to-know.md#dma)
  - [Zynq Processing System](/wiki/important-blocks-to-know.md#zynq-processing-system) 
  - [Custom Blocks](important-blocks-to-know.md#custom-blocks)
- [Tutorial](/tutorials/Introduction-to-tutorials.md)
  - [Adding Two Numbers](/tutorials/adding-two-numbers.md)
  - [Adding Negative Numbers](/tutorials/adding-two-numbers.md#adding-negative-numbers)
  - [Adding Arrays of Numbers](/tutorials/adding-arrays.md)