
module RegisterFile(
	input reset,
	input clk,
	input [31:0] Read_register1,
	input [31:0] Read_register2,
	output reg [31:0] Read_data1,
	output reg [31:0] Read_data2
	);

	reg [31:0] RF_data[31:1]; //array that stores 31 registers
	
	integer i;
	always @(posedge reset or posedge clk)
		if (reset) begin
			
			RF_data [1] = 32'h11111111;
			RF_data [2] = 32'h22222222;
			RF_data [3] = 32'h33333333;
			RF_data [4] = 32'h44444444;
			RF_data [5] = 32'h55555555;
			RF_data [6] = 32'h66666666;
			RF_data [7] = 32'h77777777;
			RF_data [8] = 32'h88888888;
			RF_data [9] = 32'h99999999;
			RF_data [10] = 32'hAAAAAAAA;
			RF_data [11] = 32'hBBBBBBBB;
			RF_data [12] = 32'hCCCCCCCC;
			RF_data [13] = 32'hDDDDDDDD;
			RF_data [14] = 32'hEEEEEEEE;
			RF_data [15] = 32'hFFFFFFFF;
			RF_data [16] = 32'h11111111;
			RF_data [17] = 32'h22222222;
			RF_data [18] = 32'h33333333;
			RF_data [19] = 32'h44444444;
			RF_data [20] = 32'h55555555;
			RF_data [21] = 32'h66666666;
			RF_data [22] = 32'h77777777;
			RF_data [23] = 32'h88888888;
			RF_data [24] = 32'h99999999;
			RF_data [25] = 32'hAAAAAAAA;
			RF_data [26] = 32'hBBBBBBBB;
			RF_data [27] = 32'hCCCCCCCC;
			RF_data [28] = 32'hDDDDDDDD;
			RF_data [29] = 32'hEEEEEEEE;
			RF_data [30] = 32'hFFFFFFFF;
			RF_data [31] = 32'h00000000;

		end else begin 
			Read_data1 <= (Read_register1 == 32'h00000000)? 32'h00000000: RF_data[Read_register1];
			Read_data2 <= (Read_register2 == 32'h00000000)? 32'h00000000: RF_data[Read_register2];
		end


endmodule