`include "ALU.v"
`include "RegisterFile.v"
`include "SignExtend.v"

module store(
    input clk,
    input reset,
    input [31:0] instruction,
    input wire [31:0] Read_data1,
    input wire [31:0] Read_data2,
    // input [4:0] Read_register1,
    // input [4:0] Read_register2,
    // input [4:0] Write_register,
    // input [31:0] Write_data,
    output reg [31:0] address,
    output reg [31:0] write_data,
    output reg write_enable
);

    wire [31:0] Sign_extended;
    wire [31:0] ALU_output;
    wire ALU_zero;

    // Sign extend module instantiation
    sign_extend SE (
        .in(instruction[15:0]),
        .out(Sign_extended)
    );

    // ALU module instantiation
    ALU alu (
        .a(Read_data1),
        .b(Sign_extended),
        .alu_control(3'b010), // Addition operation
        .result(ALU_output),
        .zero(ALU_zero)
    );

    RegisterFile registerfile (
        // .reset(reset),
        // .clk(clk),
        // .RegWrite(RegWrite),
        // .Read_register1(Read_register1),
        // .Read_register2(Read_register2),
        // .Write_register(Write_register),
        // .Write_data(Write_data),
        .Read_data1(Read_data2),
        .Read_data2(Read_data2)
    );

    // Control logic for store operation
    always @(*) begin
        address = ALU_output;
        write_data = Read_data2; // Data to be stored
        write_enable = 1'b1;
    end


endmodule