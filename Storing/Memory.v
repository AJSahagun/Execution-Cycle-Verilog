// `include "Store.v"

module memory (
    input [31:0] address, // from ALU, memory address
    input [31:0] write_data, // from register, memory address contents
    input write_enable,
    input clk, // All synchronous elements, includin memories, should have a clock signal
    output [31:0] mem_read_data //Output of Memory Address contents
);

    reg [31:0] mem [0:255]; // 256 words of 32-bit memory

    always @(posedge clk) begin
        if(write_enable == 1'b1)begin
            mem[address] <= write_data;
        end
    end

    assign mem_read_data = mem[address];
    
endmodule