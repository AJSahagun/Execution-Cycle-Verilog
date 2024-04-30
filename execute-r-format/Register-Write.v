//following this format for operation
//op register_destination, register_1, register_2

// ADD $reg1, $reg2 #assembly style

// ADD $t5, $t1, $t2
module read_register(
    input wire [3:0] ALU_operation,
    input wire [4:0] rs_address, rd_address, //Two 5-bit registers in an operation $t1, $t2
    input wire clk, //clock input
    input wire reset_input,//reset input
    input wire write_enabled, //write data to registers, boolean
    input wire [31:0] rs_data, rd_data, //$t1, $t2
    output reg [31:0] out_data); //output $t5

//update clock here, always means occurring palagi
always @(posedge clk or negedge reset_input) begin
    if (!reset_input) begin
        out_data <= 0; //initial value ng output, none blocking operator (RO)
    end else begin
        if (write_enabled) begin
            out_data <= rs_data; //the added value na nasa $t1, ililipat kay $t5
        end
    end
end

endmodule
