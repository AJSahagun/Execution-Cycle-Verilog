`include "Register-Write.v"

module read_register_tb;

    // Inputs
    reg [4:0] rs_address, rt_address, out_address;
    reg clk, reset_input, write_enabled;
    reg [31:0] rs_data, rt_data;
    reg [2:0] ALU_operation;

    reg [31:0] output_storage; //buffer kailangan!!!

    //output
    wire [31:0] out_data;

    // Instantiate the mojol
    read_register dut (
      .rs_address(rs_address),
      .rd_address(rd_address),
      .out_address(out_address),
      .clk(clk),
      .reset_input(reset_input),
      .write_enabled(write_enabled),
      .rs_data(rs_data),
      .rt_data(rt_data),
      .ALU_operation(ALU_operation),
      .out_data(out_data)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, read_register_tb);

        // Initialize inputs
        clk = 0;
        reset_input = 0;
        write_enabled = 0;
        rs_address = 5'b00001;
        rt_address = 5'b00010;
        out_address = 5'b00011;
        rs_data = 32'b00000000000000000000000000011111; // value is 31
        rt_data = 32'b00000000000000000000000000101111; // value is 47  //out should be 31 + 47 = 78
        ALU_operation = 3'b000; // Adder operation

        // Wait for 10 clock cycles
        #100;// timescale directive, timescale = 1ns/1ps

        $display("Before");
        $display("rs_data output: %d", rs_data);
        $display("rt_data output: %d", rt_data);
        $display("out_data output: %d", out_data);

        // Write data to the register
        reset_input = 1; //reset muna yung input para sure na walang extras
        write_enabled = 1;
        output_storage = 32'b00000000000000000000000001001110; //78
        
        // Wait for 10 clock cycles
        #100;

        // Stop writing data to the register
        write_enabled = 0;
        reset_input = 0; //the input is now not reset kasi may value na

        $display("AFTER");
        $display("rs_data output: %d", rs_data);
        $display("rt_data output: %d", rt_data);
        $display("out_data output: %d", out_data);

        if (out_data == output_storage) begin
            $display("Test passed");
        end else begin
            
            $display("Test failed");
        end

        // Wait for 10 clock cycles
        #100;

        $finish;
    end
endmodule