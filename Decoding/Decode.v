module Decode (
    input wire [31:0] instruction, // 32-bit instruction
    output reg [2:0] opcode,       // Operation code
    output reg [4:0] rs, rt, rd,  // Source, target, destination registers
    output reg [15:0] immediate   // Immediate value 
);

always @(*) begin
    case (instruction[31:26]) 
        6'b000000:  begin // ADD
            opcode = 3'b001;
            rs = instruction[25:21];
            rt = instruction[20:16];
            rd = instruction[15:11];
            immediate = 0; 
        end
        6'b001000: begin // ADDI
            opcode = 3'b010;
            rs = instruction[25:21];
            rt = instruction[20:16];
            immediate = instruction[15:0]; 
        end

        6'b000010: begin // SUB
            opcode = 3'b011;  
            rs = instruction[25:21];
            rt = instruction[20:16];
            rd = instruction[15:11];
            immediate = 0; 
        end
            $display("Decode: opcode = %b, rs = %d, rt = %d, rd = %d, immediate = %d", 
             opcode, rs, rt, rd, immediate); 
    endcase
end

endmodule
