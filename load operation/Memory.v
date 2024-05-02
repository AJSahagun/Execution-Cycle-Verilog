module data_memory(
    input clk,
    input mem_read,
    input [31:0] address,
    output reg [31:0] read_data
);
    reg [31:0] memory [255:0];  // Example small memory

    // Read from memory
    always @(posedge clk) begin
        if (mem_read) begin
            read_data <= memory[address[7:0]];  // Assume word aligned addresses
        end
    end
endmodule
