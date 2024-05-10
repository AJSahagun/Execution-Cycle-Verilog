`include "ALU.v"
`include "RegisterFile.v"
`include "SignExtend.v"
`include "Memory.v"

module store(
    input clk, reset,
    input [15:0] instruction,
    input wire [31:0] Read_data2, // Source


);

    RegisterFile uut (
        

    );


endmodule