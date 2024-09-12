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

- [Introduction](wiki/introduction.md)
- [Resources](wiki/resources.md)
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