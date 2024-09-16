`timescale 1us/1us

module adderModule (
  input clk, 
  input signed[15:0] inAValue,
  input signed[15:0] inBValue,
  output reg signed[31:0] outValue
);

always @(posedge clk) begin
  outValue <= inAValue + inBValue;
end

endmodule