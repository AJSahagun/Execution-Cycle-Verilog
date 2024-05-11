/**module memory (
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

endmodule*/

module memory (
    input clk, // Clock signal
    input write_enable, // Write enable signal
    input [31:0] address, // Memory address input
    input [31:0] write_data, // Data to be written to memory
    output reg [31:0] mem_read_data // Data read from memory
);

    reg [31:0] mem [0:255]; // 256 words of 32-bit memory

    always @(posedge clk) begin
        if(write_enable) begin
            mem[address] <= write_data; // Non-blocking assignment for write operation
        end
        mem_read_data <= mem[address]; // Always update mem_read_data with the data at the specified address
        $display ("Time=%3d | mem[%h]=%h | write_data=%h", $time, address, mem[address], write_data);
    end

endmodule
