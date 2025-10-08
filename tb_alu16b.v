`timescale 1ns / 1ps

module tb_alu16b;

	// Inputs
	reg rst_n;
	reg clk;
	reg [7:0] opcode;
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] z;

	// Instantiate the Unit Under Test (UUT)
	alu16b uut (
		.rst_n(rst_n), 
		.clk(clk), 
		.opcode(opcode), 
		.a(a), 
		.b(b), 
		.z(z)
	);
	
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		rst_n = 0;
		clk = 0;
		opcode = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst_n=1'b1;
		
		a=8'd5;
		b=8'd3;
		
		@(posedge clk);
		opcode=8'h80;

	end
      
endmodule

