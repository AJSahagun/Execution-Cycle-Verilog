module ALU (
    input wire [31:0] A, B,
    input wire [15:0] immediate,
    input wire [1:0] ALUOp,
    output reg [31:0] result
);

always @(*) begin
    case (ALUOp)
        2'b00: result = A + B;  // Add
        2'b01: result = A - B;  // Subtract
        2'b10:  result = A + immediate;
        default: result = 32'b0; // Invalid
        $display("ALU: A = %d, B = %d, immediate = %d, ALUOp = %b, result = %d",
        A, B, immediate, ALUOp, result);
    endcase
end 
endmodule
