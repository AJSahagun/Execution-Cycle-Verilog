`include "ALU.v"
`include "RegisterFile.v"
`include "SignExtend.v"
`include "Memory.v"

module store(
    input clk, reset,
    input [15:0] instruction,
    input wire [31:0] Read_register1,
	input wire [31:0] Read_register2,
    input wire write_enable
);

    wire [31:0] Read_data1;
    wire [31:0] Read_data2; // Source
    wire [31:0] Sign_extended;
    wire [31:0] ALU_output;
    wire zero;

    RegisterFile RF (
        .clk(clk),
        .reset(reset),
        .Read_register1(Read_register1),
        .Read_register2(Read_register2),
        .Read_data1(Read_data1),
        .Read_data2(Read_data2)
    );

    sign_extend SE (
        .in(instruction),
        .out(Sign_extended)
    );

    ALU alu (
        .a(Read_data1),
        .b(Sign_extended),
        .alu_control(3'b010),
        .result(ALU_output),
        .zero(ALU_zero)
    );

    memory MEM (
        .write_data(Read_data2),
        .address(ALU_output),
        .write_enable(write_enable),
        .clk(clk)
    );

endmodule