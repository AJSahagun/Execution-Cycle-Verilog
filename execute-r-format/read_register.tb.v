// read_register_tb.v
`include "RegisterFile.v"
`include "ALU.v"

module read_register_tb;

    // Inputs
    reg clk, reset_input, write_enabled;
    reg [4:0] rs_address, rt_address, rd_address;
    reg [31:0] rs_data, rt_data;
    reg [3:0] ALU_operation;
    wire [31:0] out_data;

    // Instantiate the Register File
    RegisterFile reg_file (
        .clk(clk),
        .reset(reset_input),
        .rs_address(rs_address),
        .rt_address(rt_address),
        .rd_address(rd_address),
        .rs_data(rs_data),
        .rt_data(rt_data),
        .write_enable(write_enabled),
        .rs_out(out_data),
        .rt_out()
    );

    // Instantiate the ALU
    ALU alu (
        .operand1(reg_file.rs_out),
        .operand2(reg_file.rt_out),
        .ALU_control(ALU_operation),
        .result(out_data)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset_input = 0;
        write_enabled = 0;
        rs_address = 5'b00001;
        rt_address = 5'b00010;
        rd_address = 5'b00011;
        rs_data = 32'b00000000000000000000000000000001; // value is 1
        rt_data = 32'b00000000000000000000000000000010; // value is 2
        ALU_operation = 4'b0000; // Adder operation

        // Wait for 10 clock cycles
        #100;// timescale directive, timescale = 1ns/1ps

        // Write data to the register
        write_enabled = 1;
        rt_data = 32'b00000000000000000000000000000011;

        // Wait for 10 clock cycles
        #100;

        // Stop writing data to the register
        write_enabled = 0;

        if (out_data == 32'b00000000000000000000000000000011) begin
            $display("Test passed");
        end else begin
            $display("Test failed");
        end

        // Wait for 10 clock cycles
        #100;
    end
endmodule