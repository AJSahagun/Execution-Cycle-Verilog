`include "Memory.v"
`timescale 1ps/1ps

module memory_tb;
    reg [31:0] address; 
    reg [31:0] write_data;
    reg clk;
    reg write_enable;
    wire [31:0] mem_read_data;

    memory mem (
        .clk(clk),
        .address(address), 
        .write_data(write_data), 
        .write_enable(write_enable), 
        .mem_read_data(mem_read_data));

    initial begin
        $dumpfile("Memory_tb.vcd");
        $dumpvars(0, memory_tb);

        clk = 0;
        write_data = 0;
        write_enable = 0;
        address = 32'h55;
        #20

        write_enable = 0;
        
        #20;

        write_enable = 0;
        address = 32'h66;
        write_data = 8'h36;

        #20

        write_enable = 1;
        #20 

        write_enable = 0;
        address = 32'h77;
        write_data = 8'h37;
        #20

        write_enable = 1;

        #20
        
        $finish();
    end

    always #10 clk = ~clk; //clock generation

endmodule