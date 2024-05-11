`include "Adder.v"
`include "ShiftLeft2.v"
`include "SignExtend.v"
`include "ALU.v"
module BranchTargetCalculator(
    input wire [31:0] pc,            // Current program counter
    input wire [31:0] A, B,          // Operands for comparison
    input wire [15:0] branch_offset, // Branch offset from instruction
    output wire [31:0] branch_target, // Calculated branch target address
    output wire zero                  // Zero flag indicating whether the two operands are equal
);
    wire [31:0] sign_extended_offset;
    wire [31:0] shifted_offset;

    // Instantiate the sign extend module
    SignExtend sign_extender(
        .in(branch_offset),
        .out(sign_extended_offset)
    );

    // Instantiate the shift left module
    ShiftLeft2 shifter(
        .in(sign_extended_offset),
        .out(shifted_offset)
    );

    // Instantiate the adder module
    Adder adder(
        .a(pc),
        .b(shifted_offset),
        .result(branch_target)
    );

    // Instantiate the ALU module for equality comparison
    ALU alu (
        .ALUop(3'b000), // For equality comparison
        .A(A),
        .B(B),
        .result(),
        .zero(zero)
    );
endmodule
