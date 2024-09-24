# Adding Arrays

In this section, we'll explore how to sum corresponding elements of arrays. This is a fundamental operation that you'll often encounter when working with arrays or lists in various programming languages. Let's dive into the concept and see how it's implemented step by step.

## FPGA Design

First, create a new project and import the constraints of the FPGA. 
Import the following blocks:
- Processor System Reset
- Axi Gpio
- 2 x Axi DMA 
- Zynq Processing System

![](/tutorials/images/AddingTwoArrays/addingArraysInitialDesign.png)

Now we need to add the custom IP to control the RedPitaya clock, you can find it [here](https://github.com/dspsandbox/FPGA-Notes-for-Scientists/tree/main/ip), along with the ADC and DAC.

To import them go to the *Project Manager -> Settings -> IP Repository* and use the "+" tab to add a new repo folder. Now add the RedPitaya clk block and press "*Ctrl+K*" on the input port to the block to create an external connection for the block.

![](/tutorials/images/AddingTwoArrays/AxiGpioPortsConnections.png)

Now run the *Run Block Automation* tab.

Next, we need to configure the DMA (Direct Memory Access) controllers. Our aim is to minimize the number of DMAs we use. However, it's important to note that each DMA controller is limited to two channels: 
- One channel for reading 
- One channel for writing

With this in mind, we'll strategically plan our design to use as few DMAs as possible while ensuring efficient data transfer.

We'll use one DMA to send and receive the data from the FPGA and one only to send the second array.

Configure the first DMA as follow:
![](/tutorials/images/AddingTwoArrays//receiveAndSendDma.png)

Here the configured channels are both the reading and writing ones, instead in the second only the writing channel need to be configured.

And the second one like this:
![](/tutorials/images/AddingTwoArrays/sendOnlyDma.png)

Now let's configure the Axi GPIO module, in this project in order to synchronize the DMAs a trigger is needed along with the number of samples which is necessary to communicate to the FPGA the length of the array, to perfom this tasks the Axi GPIO needs to be configured as follow:

![](/tutorials/images/AddingTwoArrays/summingArraysAxiGpio.png)

The first channel has only 1-bit wire (0 or 1), and it will be the trigger, while the second will be the sample number channel.


The HP0 interface on the Zynq7 needs to be set on. To turn it on double-click on the block and select the *PS-PL Configuration*

![](/tutorials/images/AddingTwoArrays/PS-PLConfig.png)

Now connect the clock and the reset connections:

![](/tutorials/images/AddingTwoArrays/runClockAndReset.png)


Now it run the tab "*Run Connection Automation*" and uncheck the Axi-GPIO connections, in the end the design should look like this:

![](/tutorials/images/AddingTwoArrays/runAfterConnection.png)

Now we need to add the [*stream_control*](/tutorials/resources/AddingTwoArrays/stream_ctrl.vhd) file and the [*stream_adder*](/tutorials/resources/AddingTwoArrays/stream_adder.vhd) file. And the final design should look like this:

![](/tutorials/images/AddingTwoArrays/finalDesign.png)

By design this tutorial uses 16-bit width value, but feel free to play with the numbers.

The bit file of this project can be found [here](/tutorials/resources/AddingTwoArrays/summingArrays.bit) along withe the tcl and hwh.

To make it easier to manage this project I wrote a python library that can be found [here](/tutorials/resources/AddingTwoArrays/SummingArrays.py), so you only need to write:

```
import pynq
from SummingArrays import SummingArrays
import numpy as np

# Create an instance of the SummingArrays class
summing_arrays = SummingArrays("summingArrays.bit")

# Example arrays
array0 = np.array([1, 2, 3, 4], dtype=np.int16)
array1 = np.array([5, 6, 7, 8], dtype=np.int16)

# Call the process_arrays method on the instance

result = summing_arrays.process_arrays(array0,array1)
print(result)

```

and the output should be this: \
``[ 6  8 10 12]``


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