`include "Load.v"

module load_operation_tb;

    // Inputs
    reg clk;
    reg reset;
    reg mem_read;
    reg [31:0] address;
    reg [4:0] read_reg1;
    reg [4:0] read_reg2;
    reg [4:0] write_reg;
    reg [31:0] write_data;
    reg [15:0] imm;

    // Outputs
    wire [31:0] reg_data1;
    wire [31:0] reg_data2;
    wire [31:0] ext_imm;
    wire [31:0] result;
    wire zero;

    // Instantiate the modules
    register_file reg_file(
        .clk(clk),
        .reset(reset),
        .reg_write(1'b0),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );

    data_memory mem(
        .clk(clk),
        .mem_read(mem_read),
        .address(address),
        .read_data(result)
    );

    sign_extender sign_ext(
        .imm(imm),
        .ext_imm(ext_imm)
    );

    alu alu_unit(
        .a(reg_data1),
        .b(ext_imm),
        .alu_control(3'b010),
        .result(result),
        .zero(zero)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial stimulus
    initial begin
        $dumpfile("load_operation_tb.vcd");
        $dumpvars(0, load_operation_tb);

        // Print start message
        $display("Starting Load Operation Testbench...");

        // Reset
        reset = 1;
        clk = 0;
        mem_read = 0;
        address = 0;
        read_reg1 = 5'd0;
        read_reg2 = 5'd0;
        write_reg = 5'd0;
        write_data = 32'd0;
        imm = 16'd0;
        #10 reset = 0;

        // Load operation test
        address = 32'd100; // Assuming the memory address to load from
        mem_read = 1;
        #20;
        mem_read = 0;
        #20;

        // Print completion message
        $display("Load Operation Testbench Completed.");

        // Finish simulation
        $dumpfile(0); // Close VCD file
        $finish;
    end

endmodule
