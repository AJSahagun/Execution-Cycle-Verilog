module memory (
    input [15:0] address,
    input [7:0] write_data,
    input write_enable,
    output [7:0] read_data
);
    reg [7:0] mem [0:65535]; // 2^16 addresses

    always @(posedge write_enable) begin
        mem[address] <= write_data;
    end

    assign read_data = mem[address];
endmodule