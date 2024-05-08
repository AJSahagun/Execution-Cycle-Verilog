`include "ALU.v"
`include "Memory.v"
`include "RegisterFile.v"
`include "SignExtend.v"
`include "Memory.v"

module store(
    input clk,
    input reset,
    input [31:0] instruction,
    input [31:0] Read_data1,
    input [31:0] Read_data2,
    output reg [31:0] ALU_result,
    output reg MemWrite,
    output reg [31:0] Write_data
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
    ALU alu_inst(
        .a(Read_data1),
        .b(Sign_extended),
        .alu_control(3'b010), // Addition operation
        .result(ALU_output),
        .zero(ALU_zero)
    );

    // Control logic for store operation
    always @(*) begin
        ALU_result = ALU_output;
        MemWrite = 1'b1; // Enable memory write
        Write_data = Read_data2; // Data to be stored

    end

endmodule