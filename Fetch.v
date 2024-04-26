`timescale 1ns/1ps

module Fetch(
    input reset, clk, write_en, load,
    output [31:0] instruction, pc_next, pc_current
);
    wire [31:0] adder_out, new_pc, pc_address;

    Adder PCAdder(pc_address, adder_out); // Add 4 bit
    ProgramCounter PC(clk, write_en, reset, load, new_pc, pc_address); // Program Counter
    InstructionMemory IM(pc_address, instruction); // Get Instruction address
    
    assign pc_current = pc_address;
    assign pc_next = adder_out;

endmodule

