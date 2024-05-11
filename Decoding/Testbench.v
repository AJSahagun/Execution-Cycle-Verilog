module Testbench;
    reg clk;
    reg [31:0] instruction_mem [0:1023]; 
    reg [31:0] current_index; 

    // Signals for connecting to the Decode module
    wire [2:0] ALUop;
    wire reg_write, mem_write, mem_read, mem_to_reg, branch;
    wire is_rtype, is_itype_load, is_itype_store, is_branch;  
    

    // Instantiate the Decode module
    Decode dut (
        .instruction(instruction_mem[current_index]),
        .ALUop(ALUop),
        .reg_write(reg_write),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .is_rtype(is_rtype),
        .is_itype_load(is_itype_load),
        .is_itype_store(is_itype_store),
        .is_branch(is_branch)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, Testbench);
        $dumpvars(0, dut); 

        current_index = 0;
        clk = 0;

        // Initialize instructions
        instruction_mem[0] = 32'b0110011_00000_00001_000_00000_1000011;  // R-Type ADD
        instruction_mem[1] = 32'b0010011_00010_00010_000_00010_1000011;  // I-Type LW
        instruction_mem[2] = 32'b0100011_00010_00011_00000010;  // I-Type Store (sw x11, 2(x10))
        instruction_mem[3] = 32'b1100011_00000_00000_00000001; // Branch BEQ



        // Cycling through instructions repeatedly
        forever begin
            #10; 
            current_index = current_index + 1;
            if (current_index == 4) current_index = 0; // Reset index to cycle 
            clk = ~clk;
        end
    end

endmodule
