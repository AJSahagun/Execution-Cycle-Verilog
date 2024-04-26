module InstructionMemory (
    input wire [31:0] pc_address,  // pc address input (32-bit)
    output reg [31:0] instruction   // output instruction (32 bits)
);

parameter MEM_SIZE = 1024; // default memory size

// define memory for storing instructions
reg [31:0] memory [0:(MEM_SIZE-1)];

// output default instruction for out-of-bounds addresses
reg [31:0] default_instruction = 32'hDEADBEEF;

// initial memory contents (can be initialized externally)
initial begin
    // initialize memory with default instruction
    for (int i = 0; i < MEM_SIZE; i = i + 1) begin
        memory[i] = 32'hDEADBEEF; // Default instruction
    end
end

// output instruction based on PC address
always @(posedge clk or posedge reset) begin
    begin
        if (pc_address < MEM_SIZE)
            instruction <= memory[pc_address];
        else
            instruction <= default_instruction;
    end
end

endmodule