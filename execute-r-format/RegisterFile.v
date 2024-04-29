// RegisterFile.v
module RegisterFile (
    input clk, reset,
    input [4:0] rs_address, rt_address, rd_address,
    input [31:0] rs_data, rt_data,
    input write_enable,
    output reg [31:0] rs_out, rt_out
);

reg [31:0] registers [0:31];
integer i;

// Initialize registers during reset
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        for (i = 0; i < 32; i=i+1)
            registers[i] <= 0;
    end
end

// Write operation
always @(posedge clk)
begin
    if (write_enable)
        registers[rd_address] <= rt_data;
end

// Output assignment
always @*
begin
    rs_out = registers[rs_address];
    rt_out = registers[rt_address];
end

endmodule
