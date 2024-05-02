module InstructionMemory (
    input wire [31:0] pc_address,        // pc address input (32-bit)
    input wire clk,                       // clock
    input wire reset,                     // Reset
    input wire [31:0] instructions_in,    // Instructions input
    input wire load_instructions,        // Load instructions control signal
    output reg [31:0] instruction         // output instruction (32 bits)
);

parameter MEM_SIZE = 1024;               // default memory size

// define memory for storing instructions
reg [31:0] memory [0:(MEM_SIZE-1)] = '{default: 32'hDEADBEEF}; // Initialize memory with default instructions

// Load instructions into memory when load_instructions signal is high
always @(posedge clk) begin
    if (load_instructions)
        memory[pc_address] <= instructions_in;
end

// output instruction based on PC address
always @(posedge clk or posedge reset) begin
    if (reset)
        instruction <= memory[0]; // Reset to default instruction at address 0
    else if (pc_address < MEM_SIZE)
        instruction <= memory[pc_address];
    else
        instruction <= 32'hDEADBEEF; // Output default instruction for out-of-bounds addresses
end

endmodule
