// `include "ALU.v"
`include "Memory.v"

module memory_tb;
    // reg [31:0] a, b;
    // reg [2:0] alu_control;
    // wire [31:0] result;
    // wire zero;
    reg [31:0] address; 
    reg [31:0] write_data;
    reg clk;
    reg write_enable;
    wire [31:0] mem_read_data;

    // ALU alu (
    //     .a(a), 
    //     .b(b), 
    //     .alu_control(alu_control), 
    //     .result(result), 
    //     .zero(zero));

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
        write_data = 8'h56;
        write_enable = 0;
        address = 55;
        #20

        write_enable = 1;
        #20;

        write_enable = 0;
        address = 66;
        write_data = 8'h36;
        #20

        write_enable = 1;
        #20 

        write_enable = 0;
        #20

        address = 55;
        #20
        
        $finish();
    end

    always #10 clk = ~clk; //clock generation
endmodule