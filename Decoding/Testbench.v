`timescale 1ns / 10ps // Typical timescale

module Testbench;

    wire [2:0] opcode;
    wire [4:0] rs, rt, rd;
    wire [15:0] immediate;
    wire RegWrite;
    wire ALUSrc;
    wire [1:0] ALUOp;
    wire [31:0] result;
    wire [31:0] readData1, readData2;

    Decode dec_unit (.instruction(instruction), .opcode(opcode), .rs(rs), .rt(rt), .rd(rd), .immediate(immediate));
    ControlUnit ctrl_unit (.opcode(opcode), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .ALUOp(ALUOp));
    ALU alu_unit (.A(readData1), .B(readData2), .ALUOp(ALUOp), .result(result));
    RegisterFile reg_file (.readReg1(rs), .readReg2(rt), .writeReg(rd), .writeData(result), .RegWrite(RegWrite), .readData1(readData1), .readData2(readData2));

    // Test Stimulus
    reg [31:0] instruction;
    reg clk;

    initial begin
        registers[1] = 32'd5;     // Initialize register 1 
        registers[2] = 32'd10;    // Initialize register 2
        clk = 0; 
        instruction = 0; // Reset
        #100; // Initial delay 

        #110; // Some delay

        instruction = 32'b001000_00001_00010_0000000000001010; // ADDI R2, R1, 10
        #20;  
        // Test Case 1: ADD R1, R2, R3
        instruction = 'b000000_00010_00011_00001_000000000100; 
        #20;

        instruction = 32'b001000_00001_00101_0000000000001010; // ADDI R5, R1, 10 
        #20;

            $display("After instruction: Contents of Registers:");
            $display("  Register 1: %d", reg_file.registers[1]);
            $display("  Register 2: %d", reg_file.registers[2]);
            $display("  Register 3: %d", reg_file.registers[3]);



        #200;
        $finish;
    end

    // Clock generation
    always #10 clk = ~clk;

    always @(posedge clk) begin
        $display("Instruction: %b, Opcode: %b, Results: %b", instruction, opcode, result); 
        $display("After ADD: Register 3 = %d", reg_file.registers[3]); 
        $display("After ADDI: Register 2 = %d", reg_file.registers[2]);

    end

endmodule
