`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:16 10/05/2025
// Design Name:   top
// Module Name:   /home/ise/project1/tb_top.v
// Project Name:  project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top;

	// Inputs
	reg t1;
	reg t2;
	reg t3;
	reg clk;
	reg rst;

	// Outputs
	wire ff2;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.t1(t1), 
		.t2(t2), 
		.t3(t3), 
		.clk(clk), 
		.rst(rst), 
		.ff2(ff2)
	);

	initial begin
		// Initialize Inputs
		t1 = 0;
		t2 = 0;
		t3 = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst=1;
		clk=0;
		t1=1;
		t2=0;
		t3=1;

	end
      
	initial clk=0;
	always #10 clk=~clk;
	
endmodule

