//following this format for operation
//operation register_destination, register_1, register_2

// ADD $t5, $t1, $t2

`include "ALU.v"

module read_register(
    input wire [2:0] ALU_operation,
    input wire [4:0] rs_address, rt_address, out_address,//three 5-bit registers in an operation $t1, $t2, $t5
    input wire clk, //clock input
    input wire reset_input,//reset input
    input wire write_enabled, //write data to registers, boolean
    input wire [31:0] rs_data, rt_data, //$t1, $t2
    output reg [31:0] out_data); //output $t5

    wire [31:0] out; //dito ilalagay yung output


    ALU alu_module(
        .ALUop(ALU_operation),
        .A(rs_data),
        .B(rt_data),
        .result(out)
    );

//update clock here, always means occurring palagi
always @(posedge clk or negedge reset_input) begin
    if (!reset_input && !write_enabled) begin
        out_data <= 0; //initial value ng output
    end else if(reset_input && write_enabled) begin
            out_data <= alu_module.result; //the added value na nasa $t1, ililipat kay $t5
        end
    end


endmodule