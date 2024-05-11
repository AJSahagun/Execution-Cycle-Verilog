module Decode(
    input [31:0] instruction, 
    output reg [2:0] ALUop,
    output reg reg_write, mem_write, mem_read, mem_to_reg, branch,
    output reg is_rtype, is_itype_load, is_itype_store, is_branch 
);

wire [6:0] opcode = instruction[6:0];
wire [2:0] funct3 = instruction[14:12];

// Initialization
initial begin
    ALUop = 3'b000; 
    reg_write = 0;
    mem_write = 0;
    mem_read = 0;
    mem_to_reg = 0;
    branch = 0;
    is_rtype = 0;
    is_itype_load = 0;
    is_itype_store = 0;
    is_branch = 0;
end

always @(*) begin
 
    ALUop = 3'b000;       
    reg_write = 0;
    mem_write = 0;
    mem_read = 0;
    mem_to_reg = 0;
    branch = 0;
    is_rtype = 0;
    is_itype_load = 0;
    is_itype_store = 0;
    is_branch = 0;

    case (opcode)
        7'b0110011: begin // R-type
            ALUop = funct3;
            reg_write = 1;
            is_rtype = 1;
        end
        7'b0010011: begin // I-type (addi, lw)
            ALUop = 3'b000; 
            reg_write = 1;
            mem_read = (funct3 == 3'b010);
            mem_to_reg = (funct3 == 3'b010);
            is_itype_load = (funct3 == 3'b010); 
        end 
        
    endcase
end
endmodule
