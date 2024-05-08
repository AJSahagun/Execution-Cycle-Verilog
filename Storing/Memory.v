`include "RegFile.v"
`include "ALU.v"

module memory (
    input [31:0] address,
    input [31:0] Write_data,
    input write_enable,
    output [31:0] Read_data2
);
    RegFile dut (.Read_data2(Read_data2), .Write_data(Write_data));
    ALU dut (.result)

    reg [7:0] mem [0:1024]; // size of the memory array, 2^10


    always @(posedge write_enable) begin
        mem[address] <= write_data;
    end

    assign read_data = mem[address];
endmodule 