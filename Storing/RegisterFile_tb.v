`include "RegisterFile.v"
`timescale 1ps/1ps

module RegisterFile_tb();

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Inputs
    reg reset, clk;
    reg [31:0] Read_register1, Read_register2;

    // Outputs
    wire [31:0] Read_data1, Read_data2;

    // Instantiate the module under test
    RegisterFile uut (
        .reset(reset),
        .clk(clk),
        .Read_register1(Read_register1),
        .Read_register2(Read_register2),
        .Read_data1(Read_data1),
        .Read_data2(Read_data2)
    );

    // Clock generation
    always #(CLK_PERIOD) clk = ~clk;

    // Test stimuli
    initial begin
        $dumpfile("RegisterFile_tb.vcd");
        $dumpvars(0, RegisterFile_tb);

        // Initialize inputs
        reset = 1;
        clk = 0;
        Read_register1 = 5'b00000;
        Read_register2 = 5'b00000;

        #20 
        reset = 0; // De-assert reset

        #20

        // Read from register 5
        Read_register1 = 5'b00101;
        Read_register2 = 5'b00000;

        #20
        // Read from register 10 and 5
        Read_register1 = 5'b01010;
        Read_register2 = 5'b00101;

        #20
   
      
        // Read from register 15 and 10
        Read_register1 = 5'b01111;
        Read_register2 = 5'b01010;

        #20
        
        // Read from register 20 and 15
        Read_register1 = 5'b10100;
        Read_register2 = 5'b01111;
        #20


        $finish;
    end

endmodule
