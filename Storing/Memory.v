module memory (
    input clk, // All synchronous elements, includin memories, should have a clock signal
    input write_enable,
    input [31:0] address, // from ALU, memory address
    input [31:0] write_data, // from register, memory address contents
    output reg [31:0] mem_read_data //Output of Memory Address contents
);

    reg [31:0] mem [0:255]; // 256 words of 32-bit memory


    always @(posedge clk) begin
        if(write_data && write_enable) begin
            mem[address] = write_data;
        end else begin
            mem_read_data = mem[address];
        end
        $display ("Time=%3d | mem[%h]=%h | write_data=%h", $time, address, mem[address], write_data);
    end

endmodule