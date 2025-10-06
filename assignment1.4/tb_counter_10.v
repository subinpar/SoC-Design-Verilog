`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:18 10/06/2025
// Design Name:   counter_10
// Module Name:   /home/ise/project4/tb_counter_10.v
// Project Name:  project4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_counter_10;

	// Inputs
	reg clk;
	reg rstn;

	// Outputs
	wire [3:0] cnt;

	// Instantiate the Unit Under Test (UUT)
	counter_10 uut (
		.clk(clk), 
		.rstn(rstn), 
		.cnt(cnt)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;   
	end

	
	initial begin
		rstn = 0;        
		#20;            
		rstn = 1;        

		#300;            
		
	end

	
      
endmodule
