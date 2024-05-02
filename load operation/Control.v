module control_unit(
    input [5:0] opcode,
    output reg reg_write, mem_to_reg, mem_read, alu_src,
    output reg [2:0] alu_control
);
    // Define control signals based on opcode
    always @* begin
        case (opcode)
            6'b100011: begin  // lw opcode
                reg_write = 1;
                mem_to_reg = 1;
                mem_read = 1;
                alu_src = 1;
                alu_control = 3'b010;  // ADD
            end
            // Add more cases here for other opcodes
            default: begin
                // Set default values
                reg_write = 0;
                mem_to_reg = 0;
                mem_read = 0;
                alu_src = 0;
                alu_control = 3'b000;  // Default ALU operation
            end
        endcase
    end
endmodule
