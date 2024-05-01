module ControlUnit(input [6:0] opcode, output reg reg_write, mem_write, mem_read, mem_to_reg, branch);
  always @(*) begin
    case (opcode)
      7'b0110011: begin  // R-Type
        reg_write = 1;
      end
      default: begin 
        reg_write = 0; 
      end
    endcase
  end
endmodule
