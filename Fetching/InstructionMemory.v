module InstructionMemory (
    input wire [31:0] pc_address,
    input wire clk,
    output reg [31:0] instruction 
);

parameter MEM_SIZE = 1024; // default memory size

// define memory for storing instructions
reg [31:0] memory [0:(MEM_SIZE)];

// output default instruction for out-of-bounds addresses
reg [31:0] default_instruction = 32'hDEADBEEF;
integer i;

initial begin
    for (i = 0; i < MEM_SIZE; i = i + 1) begin
        memory[i] = 32'hDEADBEEF;
    end
end

always @(posedge clk) begin
    begin
        if (pc_address < MEM_SIZE)
            instruction <= memory[pc_address];
        else
            instruction <= default_instruction;
    end
end

endmodule