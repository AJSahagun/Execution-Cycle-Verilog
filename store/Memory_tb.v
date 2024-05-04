`include "memory.v"

module memory_tb;
    reg [15:0] address;
    reg [7:0] write_data;
    reg write_enable;
    wire [7:0] read_data;

    memory mem (.address(address), .write_data(write_data), .write_enable(write_enable), .read_data(read_data));

    initial begin
        $dumpfile("Memory_tb.vcd");
        $dumpvars(0, memory_tb);

        // Write to memory
        address = 16'h0000;
        write_data = 8'hAA;
        write_enable = 1'b1;
        #10;

        // Read from memory
        write_enable = 1'b0;
        #10;

        $display("read_data = %h", read_data); // Should print aa

        // Write to another address
        address = 16'h0001;
        write_data = 8'hBB;
        write_enable = 1'b1;
        #10;

        // Read from the first address
        address = 16'h0000;
        write_enable = 1'b0;
        #10;

        $display("read_data = %h", read_data); // Should still print aa

        // Read from the second address
        address = 16'h0001;
        #10;

        $display("read_data = %h", read_data); // Should print bb
    end
endmodule