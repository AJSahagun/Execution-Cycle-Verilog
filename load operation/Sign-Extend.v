module sign_extender(
    input [15:0] imm,
    output [31:0] ext_imm
);
    assign ext_imm = {{16{imm[15]}}, imm};  // Sign-extend the 16-bit immediate
endmodule
