module Adder(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] result
);
    assign result = a + b;  // Simple addition
endmodule
