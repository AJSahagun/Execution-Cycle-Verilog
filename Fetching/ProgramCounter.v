module ProgramCounter(
  input wire clk,
  input wire reset,
  input wire [31:0] new_pc,
  output reg [31:0] pc_address
);

  initial begin
    pc_address <= 32'h0000_0000;
  end

  always @(posedge clk) begin
    if (reset == 1) begin
      pc_address <= 32'h0000_0000;
    end 
    else begin
      pc_address <= new_pc;
    end
  end

endmodule
