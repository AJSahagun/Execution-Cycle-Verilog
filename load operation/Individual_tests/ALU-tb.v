`include "../ALU.v"

module tb_alu();

    // Inputs
    reg [31:0] a, b;
    reg [2:0] alu_control;

    // Outputs
    wire [31:0] result;
    wire zero;

    // Instantiate the ALU module
    alu uut(
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    // Test cases
    initial begin
        // Test addition operation
        a = 32'h00000001;
        b = 32'h00000002;
        alu_control = 3'b010; // ADD
        #10;
        $display("Result of addition (1 + 2): %h", result);
        
        // Test subtraction operation
        a = 32'h00000005;
        b = 32'h00000003;
        alu_control = 3'b110; // SUB
        #10;
        $display("Result of subtraction (5 - 3): %h", result);
        
        // Test zero flag
        a = 32'h00000000;
        b = 32'h00000000;
        alu_control = 3'b010; // ADD
        #10;
        $display("Result of addition (0 + 0): %h, Zero flag: %b", result, zero);
        
        // Add more test cases for other operations if needed
        
        // Finish simulation
        $finish;
    end

endmodule
