// ALU.v
module ALU (
    input [31:0] operand1, operand2,
    input [3:0] ALU_control,
    output reg [31:0] result
);

always @(*)
begin
    case (ALU_control)
        4'b0000: result = operand1 + operand2; // Addition
        // Other ALU operations can be added here
        default: result = 0;
    endcase
end

endmodule
