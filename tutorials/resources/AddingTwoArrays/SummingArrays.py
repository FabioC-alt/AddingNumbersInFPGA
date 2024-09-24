import pynq
import numpy as np

class SummingArrays:
    def __init__(self, bitfile):
        self.overlay = pynq.Overlay(bitfile)
        self.overlay.download()
    
    def process_arrays(self, array0, array1):
        # Check if arrays are the same length
        if len(array0) != len(array1):
            raise ValueError("Input arrays must have the same length")
        
        # Reset the PL
        pynq.PL.reset()
        
        # Allocate buffers
        samples = len(array0)
        input_buffer = pynq.allocate(shape=(samples,), dtype=np.int16)
        output_buffer_1 = pynq.allocate(shape=(samples,), dtype=np.int16)
        output_buffer_2 = pynq.allocate(shape=(samples,), dtype=np.int16)
        
        # Load data into buffers
        np.copyto(output_buffer_1, array0)
        np.copyto(output_buffer_2, array1)
        
        # Transfer data
        self.overlay.axi_dma_0.sendchannel.transfer(output_buffer_1)
        self.overlay.axi_dma_1.sendchannel.transfer(output_buffer_2)
        self.overlay.axi_dma_0.recvchannel.transfer(input_buffer)
        
        # Write to GPIO
        val1 = 1
        val2 = samples
        self.overlay.axi_gpio_0.channel1.write(val=val1, mask=0x1)
        self.overlay.axi_gpio_0.channel2.write(val=val2, mask=0xFFFFFFFF)
        
        # Return the result
        return input_buffer

# Example usage:
# summing_arrays = SummingArrays("summingArrays.bit")
# try:
#     result = summing_arrays.process_arrays(array0, array1)
#     print(result)
# except ValueError as e:
#     print(e)
