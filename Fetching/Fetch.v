`include "Adder.v"
`include "ProgramCounter.v"
`include "InstructionMemory.v"

module Fetch(
    input reset, clk,
    output [31:0] instruction, pc_next, pc_current
);
    wire [31:0] new_pc, pc_address;

    ProgramCounter PC(clk, reset, new_pc, pc_address); // Program Counter
    Adder PCAdder(pc_address, new_pc); // Add 4 bit
    InstructionMemory IM(pc_address, clk, instruction); // Get Instruction address
    
    assign pc_current = pc_address;
    assign pc_next = new_pc;

endmodule
