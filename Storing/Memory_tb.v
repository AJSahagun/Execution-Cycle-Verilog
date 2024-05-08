`include "ALU.v"
`include "Memory.v"

module memory_tb;
    reg [31:0] a, b;
    reg [2:0] alu_control;
    wire [31:0] result;
    wire zero;
    reg [15:0] address; 
    reg [7:0] write_data;
    reg write_enable;
    wire [7:0] read_data;

    ALU alu (
        .a(a), 
        .b(b), 
        .alu_control(alu_control), 
        .result(result), 
        .zero(zero));

    memory mem (
        .address(address), 
        .write_data(write_data), 
        .write_enable(write_enable), 
        .read_data(read_data));

    initial begin
        $dumpfile("Memory_tb.vcd");
        $dumpvars(0, memory_tb);

        a = 32'h00008000; 
        b = 16'h8000; 
        alu_control = 3'b010;

        // tb of store
        address = 16'h0000; 
        write_data = 8'hFF;
        write_enable = 1'b1;

        #10;

        $display("result = %h, zero = %b", result, zero);
        $display("read_data = %h", read_data);
    end
endmodule