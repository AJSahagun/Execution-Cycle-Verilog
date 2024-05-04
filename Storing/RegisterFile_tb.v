`include "RegisterFile.v"

module RegisterFile_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Inputs
    reg reset, clk, RegWrite;
    reg [4:0] Read_register1, Read_register2, Write_register;
    reg [31:0] Write_data;

    // Outputs
    wire [31:0] Read_data1, Read_data2;

    // Instantiate the module under test
    RegisterFile uut (
        .reset(reset),
        .clk(clk),
        .RegWrite(RegWrite),
        .Read_register1(Read_register1),
        .Read_register2(Read_register2),
        .Write_register(Write_register),
        .Write_data(Write_data),
        .Read_data1(Read_data1),
        .Read_data2(Read_data2)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Test stimuli
    initial begin
        $dumpfile("RegisterFile_tb.vcd");
        $dumpvars(0, RegisterFile_tb);

        // Initialize inputs
        reset = 1;
        clk = 0;
        RegWrite = 0;
        Read_register1 = 0;
        Read_register2 = 0;
        Write_register = 0;
        Write_data = 0;

        #20 reset = 0; // De-assert reset

        // Write data to register 5
        #30;
        RegWrite = 1;
        Write_register = 5;
        Write_data = 32'hABCDEFF;
        #20;
        // Read from register 5
        Read_register1 = 5;
        Read_register2 = 0;
        #20;
        // Write data to register 10
        #30;
        Write_register = 10;
        Write_data = 32'h12345678;
        #20;
        // Read from register 10 and 5
        Read_register1 = 10;
        Read_register2 = 5;
        #20;
        // Write data to register 15
        #30;
        Write_register = 15;
        Write_data = 32'h87654321;
        #20;
        // Read from register 15 and 10
        Read_register1 = 15;
        Read_register2 = 10;
        #20;
        // Write data to register 20
        #30;
        Write_register = 20;
        Write_data = 32'hABCDEF01;
        #20;
        // Read from register 20 and 15
        Read_register1 = 20;
        Read_register2 = 15;
        #20;

        $finish;
    end

endmodule
