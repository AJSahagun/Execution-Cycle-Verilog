`include "ALU.v"
`include "Memory.v"
`include "RegisterFile.v"
`include "SignExtend.v"

module store_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [31:0] instruction;
    reg [31:0] Read_data1;
    reg [31:0] Read_data2;

    // Outputs
    wire [31:0] ALU_result;
    wire MemWrite;
    wire [31:0] Write_data;

    
    store store_inst (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .Read_data1(Read_data1),
        .Read_data2(Read_data2),
        .ALU_result(ALU_result),
        .MemWrite(MemWrite),
        .Write_data(Write_data)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end

    
    initial begin
        clk = 0;
        reset = 1;
        instruction = 32'h00010000; 
        Read_data1 = 32'h0000000A; 
        Read_data2 = 32'h0000000B; 

        #10 reset = 0;

 
        #50 $stop; // Stop simulation after 50 time units
    end

endmodule
