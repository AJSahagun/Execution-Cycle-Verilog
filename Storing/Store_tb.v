`timescale 1ps/1ps
`include "Store2.v"

module store_tb();

    reg clk, reset;
    reg [15:0] instruction;
    reg [31:0] Read_register1, Read_register2;
    reg write_enable;

    store dut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .Read_register1(Read_register1),
        .Read_register2(Read_register2),
        .write_enable(write_enable)
    );


always #10 clk = ~clk; // Toggle every 5 time units

    initial begin
        $dumpfile("Store_tb.vcd");
        $dumpvars(0, store_tb);
        
        clk = 0;
        reset = 1; // Apply initial reset
        instruction = 0;
        Read_register1 = 5'b00000;
        Read_register2 = 5'b00000;
        write_enable = 0;

        #10 reset = 0;

        // Test case 1
        #20 
        
        write_enable = 0;
        instruction = 16'b1010101010101010;
        Read_register1  = 5'b00000;
        Read_register2  = 5'b01011;

        #30

        write_enable = 1;

        #30

        // Test case 2
        write_enable = 0;
        instruction = 16'b1100110011001100;
        Read_register1  = 5'b00011;
        Read_register2  = 5'b10001;

        #30

        write_enable = 1;

        #30

        $finish;  

    end

    // Monitor signals for display
    initial begin
        $monitor("Time=%3d | instruction=%h | Read_register1=%h | Read_register2=%h | write_enable=%b",
                 $time, instruction, Read_register1, Read_register2, write_enable);
    end

endmodule