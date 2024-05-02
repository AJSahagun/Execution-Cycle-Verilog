module sign_extender(
    input [15:0] imm,
    output reg [31:0] ext_imm
);
    // Sign extend the 16-bit immediate value
    always @* begin
        ext_imm = {{16{imm[15]}}, imm};
    end
endmodule