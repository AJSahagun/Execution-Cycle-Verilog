`timescale 1ps/1ps
module memory (
    input clk, // Clock signal
    input write_enable, // Write enable signal
    input [31:0] address, // Memory address input
    input [31:0] write_data, // Data to be written to memory
    output [31:0] mem_read_data // Data read from memory
);

    reg [31:0] mem [0:255]; // 256 words of 32-bit memory
    reg [31:0] address_reg; // address register

    always @(posedge clk) begin
        if(write_enable) begin
            mem[address] <= write_data; // Non-blocking assignment for write operation
        end else begin
            address_reg <= address;
        end
        
        $display ("Time=%3d | mem[%h]=%h | write_data=%h", $time, address, mem[address], write_data);
    end

    assign mem_read_data = mem[address_reg]; // Always update mem_read_data with the data at the specified address

endmodule
