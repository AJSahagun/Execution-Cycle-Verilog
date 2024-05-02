`include "ALU.v"
`include "Memory.v"
`include "RegFile.v"
`include "Sign-Extend.v"

module load_operation(
    input clk,
    input reset,
    input [31:0] address,
    input [15:0] imm,
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output [31:0] reg_data1,
    output [31:0] reg_data2
);

    reg mem_read;
    wire [31:0] ext_imm;
    wire [31:0] result;
    wire zero;

    register_file reg_file(
        .clk(clk),
        .reset(reset),
        .reg_write(1'b0),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );

    data_memory mem(
        .clk(clk),
        .mem_read(mem_read),
        .address(address),
        .read_data(result)
    );

    sign_extender sign_ext(
        .imm(imm),
        .ext_imm(ext_imm)
    );

    alu alu_unit(
        .a(reg_data1),
        .b(ext_imm),
        .alu_control(3'b010),
        .result(result),
        .zero(zero)
    );

    always @(posedge clk) begin
        if (reset) begin
            mem_read <= 0;
        end else begin
            // Set mem_read high during load operation
            mem_read <= (address != 32'd0); // Assuming address 0 is not used for load
        end
    end

endmodule
