module RegisterFile (
    input wire [4:0] readReg1, readReg2, writeReg, 
    input wire [31:0] writeData,
    input wire RegWrite, clk, // Add a clock
    output wire [31:0] readData1, readData2
);

reg [31:0] registers [31:0]; // 32 registers

initial begin
    registers[1] = 32'd5;   // Initialize register 1 with value 5
    registers[2] = 32'd10;  // Initialize register 2 with value 10
end

always @(*) begin  // Reading is always combinatorial
    readData1 = registers[readReg1];
    readData2 = registers[readReg2];
end

always @(posedge clk) begin // Writing on the positive clock edge
    if (RegWrite) begin
        $display("RegisterFile:  Writing to register %d, data = %d", writeReg, writeData);
        registers[writeReg] = writeData;
    end
end

endmodule