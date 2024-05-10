`timescale 1ns / 1ps

module BranchTargetCalculator_tb;

    reg [31:0] pc;              // Test input for current program counter
    reg [31:0] A, B;            // Test inputs for operands to be compared
    reg [15:0] branch_offset;   // Test input for branch offset
    wire [31:0] branch_target;  // Output for branch target address
    wire zero;                  // Output for zero flag indicating whether the two operands are equal

    // Instantiate the BranchTargetCalculator
    BranchTargetCalculator uut(
        .pc(pc),
        .A(A),
        .B(B),
        .branch_offset(branch_offset),
        .branch_target(branch_target),
        .zero(zero)
    );

    // Test stimulus
    initial begin
    $dumpfile("waveform.vcd"); // Specifies the VCD file name
    $dumpvars(0, BranchTargetCalculator_tb); // Dumps all variables in the test bench

        // Initialize inputs
        pc = 32'h0000_0000;
        A = 32'h0000_0000;
        B = 32'h0000_0000;
        branch_offset = 16'h0000;
        #10;  // Wait 10 ns

        // Test 1: No offset, A equals B
        A = 32'h0000_0001;
        B = 32'h0000_0001;
        $display("Test 1: PC = %h, A = %h, B = %h, Offset = %h, Expected Branch Target = %h, Actual = %h, Expected Zero = 1, Actual = %b",
                 pc, A, B, branch_offset, pc, branch_target, zero);

        // Test 2: Positive offset, A not equals B
        pc = 32'h0000_0100;            // Example PC address
        A = 32'h0000_0001;
        B = 32'h0000_0002;
        branch_offset = 16'h0004;      // Branch offset (word aligned would mean 16 bytes ahead)
        #10;  // Wait 10 ns
        $display("Test 2: PC = %h, A = %h, B = %h, Offset = %h, Expected Branch Target = %h, Actual = %h, Expected Zero = 0, Actual = %b",
                 pc, A, B, branch_offset, pc + (16'h0004 << 2), branch_target, zero);

        // Test 3: Negative offset, A equals B
        pc = 32'h0000_0200;            // Example PC address
        A = 32'h0000_0002;
        B = 32'h0000_0002;
        branch_offset = 16'hFFFC;      // -4 in two's complement, word aligned means 16 bytes back
        #10;  // Wait 10 ns
        $display("Test 3: PC = %h, A = %h, B = %h, Offset = %h, Expected Branch Target = %h, Actual = %h, Expected Zero = 1, Actual = %b",
                 pc, A, B, branch_offset, pc - 16, branch_target, zero);

        // Test 4: Boundary test, A not equals B
        pc = 32'hFFFF_FFFC;            // High boundary PC address
        A = 32'h0000_0001;
        B = 32'h0000_0002;
        branch_offset = 16'h0002;      // Offset
        #10;  // Wait 10 ns
        $display("Test 4: PC = %h, A = %h, B = %h, Offset = %h, Expected Branch Target = %h, Actual = %h, Expected Zero = 0, Actual = %b",
                 pc, A, B, branch_offset, pc + (16'h0002 << 2), branch_target, zero);

        $finish;  // End simulation
    end

endmodule
