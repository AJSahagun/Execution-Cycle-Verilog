module ALU(
    input [2:0] ALUop, 
    input [31:0] A, B, 
    output reg [31:0] result, 
    output reg zero);
    
  always @(*) begin
    case (ALUop)
      3'b000: begin
        result = A + B;  // ADD
        zero = (A == B); // Set zero flag if A equals B
      end
      3'b001: result = A - B;  // SUB
      3'b010: result = A & B;  // AND
      3'b011: result = A | B;  // OR
      3'b100: result = A < B;  // SLT (set if less than)
      default: result = 32'b0; 
    endcase
    if (ALUop != 3'b000) zero = (result == 0); 
  end
endmodule
