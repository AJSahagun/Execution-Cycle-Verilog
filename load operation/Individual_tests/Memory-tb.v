`include "../Memory.v"

`timescale 1ns / 1ps

module tb_data_memory();

    reg clk;
    reg mem_read;
    reg [31:0] address;
    wire [31:0] read_data;

    data_memory dm(
        .clk(clk),
        .mem_read(mem_read),
        .address(address),
        .read_data(read_data)
    );

    // Clock generation
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        mem_read = 0; // Initially, set mem_read to 0 to avoid immediate read operation
        #10;

        // Set initial memory value to test reading
        dm.memory[8] = 32'h12345678;

        // Now perform the read operation
        mem_read = 1; // Enable memory read
        address = 32'h8; // Set the address to read from
        #10;

        // Print values for comparison
        $display("Expected Data: %h, Actual Data: %h", dm.memory[8], read_data);

        // Check read_data here
        if (read_data == dm.memory[8])
            $display("Data Memory Read Test Passed");
        else
            $display("Data Memory Read Test Failed");

        $finish;
    end

endmodule
