`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:13:13 10/06/2025
// Design Name:   TOP
// Module Name:   /home/ise/project3/tb_ADD.v
// Project Name:  project3
// Target Device:  
// Tool versions:  
// Description:   Testbench for TOP module including ADD
////////////////////////////////////////////////////////////////////////////////

module tb_ADD;

	// Inputs
	reg CLK;
	reg RESET;
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire [7:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	TOP uut (
		.CLK(CLK),
		.RESET(RESET),
		.A(A), 
		.B(B), 
		.OUT(OUT)
	);


	initial begin
		CLK = 0;
		forever #5 CLK = ~CLK;   
	end
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		RESET = 1;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		RESET = 0;   
		#10;
		A = 8'd1;  B = 8'd2;   #10;
		A = 8'd3;  B = 8'd4;   #10;
		A = 8'd5;  B = 8'd6;   #10;
		A = 8'd7;  B = 8'd8;   #10;



	end
      
endmodule
