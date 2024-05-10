module Testbench;
    reg clk;
    reg [31:0] instruction_mem [0:1023]; 
    reg [31:0] current_index; 

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0, Testbench); 
        $dumpvars(0, Decode); 
        current_index = 0;

        clk = 0;

        instruction_mem[0] = 32'b0010011_00000_00001_000_00000_1000011; // Load lw instruction
        instruction_mem[0] = 32'b0010011_00000_00001_000_00000_1000011; // lw rt, offset(rs)
        instruction_mem[1] = 32'b0010011_00010_00010_000_00010_1000011; // lw to a different register
        instruction_mem[2] = 32'b0010011_00011_00011_000_00100_1000011; // lw with a different offset
        instruction_mem[3] = 32'b0010011_00100_00100_000_00110_1000011;

  
        forever begin
            #10; // Adjust delay as needed
            current_index = current_index + 1;
            clk = ~clk;
        end 

    end

  
endmodule
