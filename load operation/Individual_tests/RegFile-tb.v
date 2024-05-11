`include "../RegFile.v"

module tb_register_file;

  // Inputs
  reg logic clk;
  reg logic reset;
  reg logic reg_write;
  reg [4:0] read_reg1, read_reg2;
  reg [4:0] write_reg;
  reg [31:0] write_data;

  // Outputs
  wire [31:0] reg_data1, reg_data2;

  // Instantiate register module
  register_file regfile (
      .clk(clk),
      .reset(reset),
      .reg_write(reg_write),
      .read_reg1(read_reg1),
      .read_reg2(read_reg2),
      .write_reg(write_reg),
      .write_data(write_data),
      .reg_data1(reg_data1),
      .reg_data2(reg_data2)
  );

  // Clock generation
  initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
  end

  // Test cases
  initial begin
    // Reset the registers
    reset = 1'b1;
    #20;  // Wait for some clock cycles

    reset = 1'b0;  // De-assert reset

    // Test case 1: Write to register 2
    write_reg = 5'd2;
    write_data = 32'hDEADBEEF;
    reg_write = 1'b1;
    read_reg1 = 5'd0;  // Read from register 0 (should be 0)
    read_reg2 = 5'd2;  // Read from register 2 (written value)
    #20;  // Wait for clock cycles

    $display("Test case 1 (Write) - Writing data %h to register %d", write_data, write_reg);
    $display("Read data from register %d: %h", read_reg2, reg_data2);

    // Test case 2: Read from register 0 (should still be 0)
    write_reg = 5'd5;  // Write to a different register
    write_data = 32'hCAFEBABE;
    read_reg1 = 5'd0;
    read_reg2 = 5'd2;
    #20;  // Wait for clock cycles

    $display("Test case 2 (Read from register 0) - Reading data from register %d: %h", read_reg1, reg_data1);
    $display("Read data from register %d: %h", read_reg2, reg_data2);

    // Add more test cases here for reading from different registers and writing multiple values

    #100;  // Run for some more cycles
    $finish;
  end

endmodule
