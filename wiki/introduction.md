# Introduction
During my time at Fermilab, I discovered the most important ingredient for enjoying each task and accelerating the learning curve: guidance. Without it, we often find ourselves lost in a maze of trial and error, the worst place to be. These dead ends neither teach us valuable lessons nor help us make progress.

That's why I created this guide: to assist anyone facing similar tasks who may not know where to begin.

In this tutorial, we will follow these steps:

1. **Theoretical Foundations**: We'll start by introducing some fundamental blocks that are almost always present in any FPGA design, regardless of the model or manufacturer.
2. **Required Resources**: Next, we’ll discuss the resources needed to understand and apply these concepts, specifically tailored for the RedPitaya 125-14 FPGA.
3. **Practical Tutorials**: Finally, we’ll walk through three tutorials:
   - Adding two numbers
   - Adding negative numbers
   - Adding arrays of numbers

**Premises** \
Before starting, it is highly suggested to first follow [this tutorial](https://github.com/dspsandbox/FPGA-Notes-for-Scientists) to get a foundational understanding. It will make the following steps much easier to grasp.  
In that tutorial, you will find the IP libraries necessary for this guide, the `.xdc` file required for hardware mapping of the RedPitaya, and the board presets to upload in Vivado.


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
  - [Adding Negative Numbers](/tutorials/adding-negative-numbers.md)
  - [Adding Arrays of Numbers](/tutorials/adding-arrays-of-numbers.md)

➡️ [Go to the Next Page](/wiki/resources.md)