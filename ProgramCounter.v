module ProgramCounter(
  input wire clk,        // clock
  input wire write_en,   // write enabled
  input wire reset,     // reseting pc
  input wire load,       // for branch instructions
  input wire [31:0] new_pc, // pc value of branch instruction
  output reg [31:0] pc_address   // current pc
);

  initial begin
    pc_address <= 32'h0000_0000;
  end

  // runs when clk is high
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      pc_address <= 32'h0000_0000;
    end 
    //   if write_en is high also
    else if (write_en) begin
      if (load) begin
        // Load new PC value for branch instructions
        pc_address <= new_pc;
      end 
    end
  end

endmodule
