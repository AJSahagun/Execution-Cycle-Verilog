module alu(
    input [31:0] a,
    input [31:0] b,
    input [2:0] alu_control,
    output reg [31:0] result,
    output zero
);
    always @(*) begin
        case (alu_control)
            3'b000: result = a & b;            // AND
            3'b001: result = a | b;            // OR
            3'b010: result = a + b;            // ADD
            3'b110: result = a - b;            // SUBTRACT
            3'b111: result = (a < b) ? 32'b1 : 32'b0; // SLT
            default: result = 32'b0;           // Default case
        endcase
    end 

    assign zero = (result == 0); // Check if result is zero
endmodule