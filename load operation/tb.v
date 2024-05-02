
`include "Load.v"

`timescale 1ns / 1ps

module tb_load_operation();

    // Inputs
    reg [31:0] instruction;
    reg [31:0] data_in;
    reg [31:0] address;
    reg [15:0] imm;
    reg clk;
    reg reset;

    // Outputs
    wire [31:0] data_out;

    // Instantiate the load operation module
    load_operation uut(
        .instruction(instruction),
        .data_in(data_in),
        .address(address),
        .imm(imm),
        .clk(clk),
        .reset(reset),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initialize and test
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        instruction = 32'h8C090001; // Example load word instruction
        data_in = 32'h12345678; // Example data input
        address = 32'h00000004; // Example address
        imm = 16'h0001; // Example immediate value
        #10 reset = 0;

        // Simulate
        #100;

        // Check the data_out value here
        // Example check:
        // Expected data_out = data_in + imm = 32'h12345679
        if (data_out == 32'h12345679)
            $display("Test Passed: Correct data_out value.");
        else
            $display("Test Failed: Incorrect data_out value. Expected 32'h12345679, got %h", data_out);

        // End simulation
        $finish;
    end

endmodule
