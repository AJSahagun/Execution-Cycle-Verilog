module Decode(
    input [31:0] instruction, 
    output reg [2:0] ALUop,
    output reg reg_write, mem_write, mem_read, mem_to_reg, branch 
);

wire [6:0] opcode = instruction[6:0];
wire [2:0] funct3 = instruction[14:12];


reg is_rtype, is_itype_load, is_itype_store, is_branch; 

always @(*) begin
    case (opcode)
        7'b0110011: begin
            ALUop = funct3;
            reg_write = 1;
            is_rtype = 1;   
            is_itype_load = 0;
            is_itype_store = 0;
            is_branch = 0;
        end
        7'b0010011: begin // I-type (addi, lw) 
            ALUop = 3'b000;   
            reg_write = 1;
            mem_read = (funct3 == 3'b010); 
            mem_write = 0;
            mem_to_reg = (funct3 == 3'b010); 
            branch = 0; 
            is_rtype = 0; 
            is_itype_load = (funct3 == 3'b010);
            is_itype_store = 0; 
            is_branch = 0; 
        end
        default: begin 
        end
    endcase
end
endmodule
