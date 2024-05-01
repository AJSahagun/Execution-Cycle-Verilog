module RegisterFile(
    input [4:0] rs1_addr, rs2_addr, rd_addr,  
    input [31:0] write_data, 
    input clk, reg_write,
    output [31:0] rs1_data, rs2_data 
);

  reg [31:0] registers [31:0]; 

  always @(posedge clk) begin
    if (reg_write) 
      registers[rd_addr] <= write_data;
  end

  assign rs1_data = registers[rs1_addr];
  assign rs2_data = registers[rs2_addr];
endmodule
