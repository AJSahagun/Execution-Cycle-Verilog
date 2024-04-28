module ControlUnit (
    input wire [2:0] opcode,
    output reg RegWrite,  // Enable register write-back
    output reg ALUSrc,    // Select ALU operand (immediate or register)
    output reg [1:0] ALUOp // ALU operation control
);

always @(*) begin
    case (opcode)
        3'b001: begin // ADD
            RegWrite = 1;
            ALUSrc = 0; 
            ALUOp = 2'b00; 
        end 
        3'b010: begin // ADDI
            RegWrite = 1;
            ALUSrc = 1;
            ALUOp = 2'b00; 
        end
        3'b011: begin // SUB
            RegWrite = 1;
            ALUSrc = 0;  
            ALUOp = 2'b01;
        end
            $display("Control: RegWrite = %b, ALUSrc = %b, ALUOp = %b",
             RegWrite, ALUSrc, ALUOp)
   endcase
end
endmodule
