`timescale 1ns/1ps
`include "Fetch.v"

module Fetch_tb;

    // Parameters
    parameter CLK_PERIOD = 10;  // Clock period in nanoseconds
    
    // Inputs
    reg reset;
    reg clk;
    
    // Outputs
    wire [31:0] instruction;
    wire [31:0] pc_next;
    wire [31:0] pc_current;
    
    // Instantiate the Fetch module
    Fetch uut (
        .reset(reset),
        .clk(clk),
        .instruction(instruction),
        .pc_next(pc_next),
        .pc_current(pc_current)
    );
    
    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial reset
    initial begin
        reset = 1;
        clk = 0;
        #20;  // Wait for some time
        reset = 0;
    end

    // Stimulus
    initial begin
        #10;  // Wait for initial reset to complete
        // Perform test here

        $dumpfile("Fetch_tb.vcd");
        $dumpvars(0, Fetch_tb);
        // For example, toggle reset and clock, and check outputs
        // Example:
        $display("PC Current: %h, PC Next: %h, Instruction: %h", pc_current, pc_next, instruction);
        #10;
        reset = 1;
        #10;
        reset = 0;
        #100; // Wait for some time
        $finish;  // Finish simulation
    end
    
endmodule