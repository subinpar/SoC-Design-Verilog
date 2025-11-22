`timescale 1ns / 1ps

module tb_proc;

	// Inputs
	reg rst_n;
	reg clk;
	reg start;

	// Outputs
	wire [5:0] adr;
	wire rd;
	wire wr;
	wire [7:0] d;
	wire [7:0] q;

	// Instantiate the Unit Under Test (UUT)
	proc uut (
		.rst_n(rst_n),
		.clk(clk),
		.start(start),
		.adr(adr),
		.rd(rd),
		.wr(wr),
		.d(d),
		.q(q)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0;
		clk = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#10 rst_n=1;
		#10 start =1; #10 start =0;
       
		

	end
      initial begin
			forever #5 clk=~clk;
			end
endmodule
