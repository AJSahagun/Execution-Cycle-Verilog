module ALU(input [31:0] A, B, input [2:0] ALUop, output reg [31:0] result, output reg zero);
    always @(*) begin
        result = 32'b0;        
        zero = 0;             

        case (ALUop)
            3'b000: result = A + B; 
            3'b001: result = A - B; 
            3'b010: result = A & B; 
            3'b011: result = A | B; 
            3'b100: result = A < B; 
            default: result = 32'b0; 
        endcase

        zero = (result == 0); 
    end
endmodule
