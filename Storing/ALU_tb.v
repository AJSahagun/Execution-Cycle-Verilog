`timescale 1ns/1ns
`include "ALU.v"

module alu_tb ();
    
    //inputs and outputs(reg/wire)
    reg [31:0] a, b;
    reg [2:0] alu_control;

    wire [31:0] result;
    wire zero;

    //unit under test alu
    ALU uut(
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    //Test
    initial begin
        $dumpfile("ALU_tb.vcd"); //output file that holds the waveform
        $dumpvars(0, alu_tb); //variables dumped at time 0
        //Test operations here
        //Test For AND Waves
        a = 1;
        b = 1;
        alu_control = 3'b000; // AND
        #20;

        a = 1;
        b = 0;
        alu_control = 3'b000; // AND
        #20;
        $display("Result of AND (1,0): %d", result);

        a = 1;
        b = 1;
        alu_control = 3'b001; // OR
        #20;

        a = 1;
        b = 0;
        alu_control = 3'b001; // OR
        #20;
        $display("Result of OR (1,0): %d", result);

        a = 1;
        b = 1;
        alu_control = 3'b010; // ADD
        #20;

        a = 1;
        b = 0;
        alu_control = 3'b010; // ADD
        #20;
        $display("Result of ADD (1,0): %d", result);

        a = 1;
        b = 1;
        alu_control = 3'b011; // SUB
        #20;

        a = 1;
        b = 0;
        alu_control = 3'b011; // SUB
        #20;
        $display("Result of SUB (1,0): %d", result);

        a = 1;
        b = 1;
        alu_control = 3'b100; // SLT
        #20;

        a = 1;
        b = 0;
        alu_control = 3'b100; // SLT
        #20;
        $display("Result of SLT (1,0): %d", result);
    end

endmodule