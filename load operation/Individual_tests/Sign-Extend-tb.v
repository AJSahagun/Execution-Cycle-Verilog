`include "../Sign-Extend.v"

module tb_sign_extender;

  // Inputs
  reg [15:0] imm;

  // Outputs
  wire [31:0] ext_imm;

  // Instantiate sign_extender module
  sign_extender extender (
      .imm(imm),
      .ext_imm(ext_imm)
  );

  // Test cases
  initial begin
    // Test case 1: Positive immediate (sign bit is 0)
    imm = 16'h00FF;  // Positive value (all bits are 0)
    #10;  // Wait for some simulation time

    if (ext_imm == 32'h000000FF) begin
      $display("Test case 1 (Positive immediate) passed");
    end else begin
      $display("Test case 1 (Positive immediate) failed. Expected: 0x000000FF, Got: 0x%H", ext_imm);
    end

    // Test case 2: Negative immediate (sign bit is 1)
    imm = 16'hFFFF;  // Negative value (all bits are 1)
    #10;  // Wait for some simulation time

    if (ext_imm == 32'hFFFFffff) begin
      $display("Test case 2 (Negative immediate) passed");
    end else begin
      $display("Test case 2 (Negative immediate) failed. Expected: 0xFFFFFFFF, Got: 0x%H", ext_imm);
    end

    // Add more test cases here for various immediate values (positive, negative, mixed)

    #100;  // Run for some more cycles
    $finish;
  end

endmodule
