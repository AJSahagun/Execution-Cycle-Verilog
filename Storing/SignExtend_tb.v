`include "ALU.v"

module signextend_tb;

    reg [31:0] a, b;
    reg [2:0] alu_control;
    wire [31:0] result;
    wire zero;

    ALU alu (.a(a), .b(b), .alu_control(alu_control), .result(result), .zero(zero));

    initial begin
        $dumpfile("SignExtend_tb.vcd");
        $dumpvars(0, signextend_tb);

        a = 32'h00008000;
        b = 16'h8000;
        alu_control = 3'b010;

        #10;

        $display("result = %h, zero = %b", result, zero);
    end
endmodule