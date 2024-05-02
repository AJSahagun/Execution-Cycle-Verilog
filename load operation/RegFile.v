module register_file(
    input clk,
    input reset,
    input reg_write,
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output [31:0] reg_data1,
    output [31:0] reg_data2
);

    // Declare the register array
    reg [31:0] registers [31:0];
    integer i;

    // Always block for handling write operations
    always @(posedge clk) begin
        if (reset) begin
            // Initialize registers on reset
            
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 0;
            end
        end
        else if (reg_write && write_reg != 0) begin
            // Write data to register, except register 0
            registers[write_reg] <= write_data;
        end
    end

    // Continuous assignments for reading registers
    assign reg_data1 = (read_reg1 == 0) ? 0 : registers[read_reg1];
    assign reg_data2 = (read_reg2 == 0) ? 0 : registers[read_reg2];

endmodule
