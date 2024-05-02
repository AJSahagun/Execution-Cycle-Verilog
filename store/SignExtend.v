
module sign_extend (
    input [15:0] in,
    output [31:0] out
);
    assign out = {{16{in[15]}}, in};
endmodule

module ALU (
    input [31:0] a, b,
    input [2:0] alu_control,
    output reg [31:0] result,
    output zero
);
    wire [31:0] b_ext;

    sign_extend se (.in(b[15:0]), .out(b_ext));

    always @(*) begin
        case (alu_control)
            3'b000: result = a & b_ext;
            3'b001: result = a | b_ext;
            3'b010: result = a + b_ext;
            3'b011: result = a - b_ext;
            3'b100: result = a < b_ext;
            default: result = 32'b0;
        endcase
    end

    assign zero = (result == 0); 
endmodule