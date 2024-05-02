`include "ALU.v"
`include "Control.v"
`include "Memory.v"
`include "RegFile.v"
`include "Sign-Extend.v"

module load_operation(
    input [31:0] instruction,
    input [31:0] data_in,
    input [31:0] address,
    input [15:0] imm,
    input clk,
    input reset,
    output reg [31:0] data_out
);
    reg [31:0] alu_result;
    reg reg_write, mem_to_reg, mem_read, alu_src;
    reg [2:0] alu_control;
    reg [31:0] reg_data1, reg_data2;

    // Control Unit instantiation
    control_unit control_inst(
        .opcode(instruction[31:26]),
        .reg_write(reg_write),
        .mem_to_reg(mem_to_reg),
        .mem_read(mem_read),
        .alu_src(alu_src),
        .alu_control(alu_control)
    );

    // Register File instantiation
    register_file reg_file_inst(
        .clk(clk),
        .reset(reset),
        .reg_write(reg_write),
        .read_reg1(instruction[25:21]),
        .read_reg2(instruction[20:16]),
        .write_reg(instruction[15:11]),
        .write_data(data_in),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );

    // ALU instantiation
    alu alu_inst(
        .a(reg_data1),
        .b(imm),
        .alu_control(alu_control),
        .result(alu_result),
        .zero()
    );

    // Data Memory instantiation
    data_memory memory_inst(
        .clk(clk),
        .mem_read(mem_read),
        .address(address),
        .read_data(data_out)
    );

    always @(posedge clk) begin
        if (reset) begin
            // Initialize registers on reset
            reg_write <= 0;
            mem_to_reg <= 0;
            mem_read <= 0;
            alu_src <= 0;
            alu_control <= 0;
        end else begin
            // Update control signals
            reg_write <= control_inst.reg_write;
            mem_to_reg <= control_inst.mem_to_reg;
            mem_read <= control_inst.mem_read;
            alu_src <= control_inst.alu_src;
            alu_control <= control_inst.alu_control;
        end
    end

endmodule
