module Adder(
  input [31:0] pc_out,  // Current PC Address input
  output reg [31:0] adder_out  // New Incremented Adress Output
);

  // Perform addition and store the result in the sum register
  always @(pc_out) begin
    adder_out = pc_out + 32'h0000_0004; // Add 4 bit
  end

endmodule