`include "Register-Write.v"

module read_register_tb;

    // Inputs
    reg [4:0] rs_address, rd_address;
    reg clk, reset_input, write_enabled;
    reg [31:0] rs_data, rd_data;
    reg [3:0] ALU_operation;
    wire [31:0] out_data;

    // Instantiate the mojol
    read_register dut (
      .rs_address(rs_address),
      .rd_address(rd_address),
      .clk(clk),
      .reset_input(reset_input),
      .write_enabled(write_enabled),
      .rs_data(rs_data),
      .rd_data(rd_data),
      .ALU_operation(ALU_operation),
      .out_data(out_data)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset_input = 0;
        write_enabled = 0;
        rs_address = 5'b00001;
        rd_address = 5'b00010;
        rs_data = 32'b00000000000000000000000000000001; // value is 1
        rd_data = 32'b00000000000000000000000000000010; // value is 2
        ALU_operation = 4'b0000; // Adder operation

        // Wait for 10 clock cycles
        #100;// timescale directive, timescale = 1ns/1ps

        // Write data to the register
        write_enabled = 1;
        rs_data = 32'b00000000000000000000000000000011;

        // Wait for 10 clock cycles
        #100;

        // Stop writing data to the register
        write_enabled = 0;

        if (out_data == 32'b00000000000000000000000000000011) begin
            $display("Test passed");
        end else begin
            $display("Test failed");
        end

        // Wait for 10 clock cycles
        #100;
    end
endmodule