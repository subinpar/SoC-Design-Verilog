`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:01:44 10/06/2025
// Design Name:   fsm_1011
// Module Name:   /home/ise/project2/tb_fsm1011.v
// Project Name:  project2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm_1011
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_fsm1011;

	// Inputs
	reg clk;
	reg rstn;
	reg din;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	fsm_1011 uut (
		.clk(clk), 
		.rstn(rstn), 
		.din(din), 
		.y(y)
	);

always #5 clk = ~clk;  // 10ns period clock
	initial begin
		
		clk = 0;
		rstn = 0;
		din = 0;

		#100;
		
		rstn = 1;

		// Test pattern 1: 1 0 1 1  → should detect 1011 once
		#10 din = 1;
		#10 din = 0;
		#10 din = 1;
		#10 din = 1;

		// Test pattern 2: 1011011 → overlapping check
		#20 din = 0;
		#10 din = 1;
		#10 din = 0;
		#10 din = 1;
		#10 din = 1;
		#10 din = 0;
		#10 din = 1;
		#10 din = 1;

		// Finish simulation
		#50 $stop;
	end

endmodule