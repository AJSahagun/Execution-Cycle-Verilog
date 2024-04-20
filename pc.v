module pc(
  input wire clk,        // clock
  input wire write_en,   // write enabled
  input wire reset,     // reseting pc
  input wire load,       // for branch instructionss
  input wire [31:0] new_pc, // pc value of branch instruction
  output reg [31:0] pc   // current pc
);

  initial begin
    pc <= 32'h0000_0000;
  end

  // runs when clk is high
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      pc <= 32'h0000_0000;
    end 
    //   if write_en is high also
    else if (write_en) begin
      if (load) begin
        // Load new PC value for branch instructions
        pc <= new_pc;
      end 
      else begin
        // increment by 4
        pc <= pc + 32'd4;
      end
    end
  end

endmodule