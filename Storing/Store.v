`include "ALU.v"
`include "RegisterFile.v"
`include "SignExtend.v"
`include "Memory.v"

module store(
    input clk, reset,
    input [15:0] instruction,  // 16-bit instruction input
    input wire [31:0] Read_register1, // 32-bit value from register file (base address)
    input wire [31:0] Read_register2, // 32-bit value from register file (data to be stored)
    input wire write_enable // Control signal to enable memory write
);

    wire [31:0] Read_data1;
    wire [31:0] Read_data2; // Source data to be stored
    wire [31:0] Sign_extended; // Sign-extended immediate value
    wire [31:0] ALU_output; // Calculated memory address
    wire ALU_zero; // Zero flag from ALU 

    // Register File instance
    RegisterFile RF (
        .clk(clk),
        .reset(reset),
        .Read_register1(Read_register1),
        .Read_register2(Read_register2),
        .Read_data1(Read_data1), // Base address
        .Read_data2(Read_data2) // Data to be stored
    );

    // Sign Extension instance
    sign_extend SE (
        .in(instruction), // Lower bits of instruction (immediate value)
        .out(Sign_extended) // Sign-extended immediate value
    );

    // ALU instance
    ALU alu (
        .a(Read_data1), // Base address
        .b(Sign_extended), // Sign-extended immediate value
        .alu_control(3'b010), // Control signal for addition
        .result(ALU_output), // Calculated memory address
        .zero(ALU_zero) // Zero flag
    );

    // Memory instance
    memory MEM (
        .write_data(Read_data2), // Data to be stored
        .address(ALU_output), // Calculated memory address
        .write_enable(write_enable), // Control signal to enable write
        .clk(clk)
    );

endmodule