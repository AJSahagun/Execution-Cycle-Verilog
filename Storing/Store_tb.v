`timescale 1ps/1ps
`include "Store.v"

module store_tb();

    reg clk;
    reg reset;
    reg [31:0] instruction;
    reg [31:0] Read_data1;
    reg [31:0] Read_data2;
    wire [31:0] address;
    wire write_enable;
    wire [31:0] write_data;

    store DUT (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .Read_data1(Read_data1),
        .Read_data2(Read_data2),
        .address(address),
        .write_enable(write_enable),
        .write_data(write_data)
    );

always #5 clk = ~clk; // Toggle every 5 time units 

    // Generate a clock signal
    initial begin
        clk = 0; 
        reset = 1; // Apply initial reset
        #5 reset = 0;
    end


    initial begin
        #10 reset  = 1; 

        $dumpfile("Store_tb.vcd");
        $dumpvars(0, store_tb);

        #10
        instruction = 32'b101011_00100_01001_0000000000000100;
            Read_data1  = 32'h00000000; 
            Read_data2  = 32'h12345678;
       
        #10 instruction = 32'b101011_00100_01010_0000000000100000;
            Read_data1  = 32'h0000001C; 
            Read_data2  = 32'hABCDEF01;

        #20 $finish;  // End the simulation
    end

    // Monitor signals for display
    initial begin
        $monitor("Time=%3d | address=%h | write_enable=%b | write_data=%h", 
                 $time, address, write_enable, write_data);
    end

endmodule