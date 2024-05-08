`include "Store.v"

module memory (
    input [31:0] address, // from ALU
    input [31:0] write_data, // from register
    input write_enable,
    output [31:0] mem_read_data
);

    reg [7:0] mem [0:1024]; // size of the memory array, 2^10

    store dut (
        .address(address),
        .write_data(write_data),
        .write_enable(write_enable)
    );

    always @(posedge write_enable) begin
        mem[address] <= write_data;
    end

    assign mem_read_data = mem[address];
    
endmodule