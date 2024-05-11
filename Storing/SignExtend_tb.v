`timescale 1ps/1ps
`include "SignExtend.v"
module signextend_tb;

  // Inputs
  reg [15:0] in;

  // Outputs
  wire [31:0] out;

  // Instantiate the sign_extend module
  sign_extend dut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test cases with positive and negative values
    $display("Testing sign_extend module");
    $monitor("in = %b, out = %b", in, out);

    // Positive test case
    in = 16'b0000_0000_1111_1111;  // Positive value (all bits 0)

    #10;  // Wait for 10ns for signal propagation

    // Negative test case
    in = 16'b1000_0000_0000_0000;  // Negative value (sign bit 1)


    #10;

    $finish;
  end

endmodule
