`include "SignExtend.v"

module sign_extend_tb;
    reg [15:0] in;
    wire [31:0] out;

    sign_extend se (.in(in), .out(out));

    initial begin
        $dumpfile("SignExtend_tb.vcd");
        $dumpvars(0, sign_extend_tb);

        // Test positive number
        in = 16'h0001; // 1
        #10;
        $display("out = %h", out); // Should print 00000001

        // Test negative number
        in = 16'hFFFF; // -1
        #10;
        $display("out = %h", out); // Should print FFFFFFFF
    end
endmodule