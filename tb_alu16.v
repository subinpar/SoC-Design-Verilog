`timescale 1ns / 1ps

module tb_alu16;

	// Inputs
	reg reset;
	reg [15:0] a;
	reg [15:0] b;
	reg [1:0] alufs;

	// Outputs
	wire [15:0] alu;

	// Instantiate the Unit Under Test (UUT)
	alu16 uut (
		.reset(reset), 
		.a(a), 
		.b(b), 
		.alufs(alufs), 
		.alu(alu)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		a = 0;
		b = 0;
		alufs = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      a = 4'b0101;    // 5
      b = 4'b0011;    // 3
      alufs = 2'b10;  // a + b
      #10;

     
      a = 4'b1000;    // 8
      b = 4'b0011;    // 3
      alufs = 2'b11;  // a - b
      #10;
		
      reset = 1; #10;
      reset = 0; #10;


	end
      
endmodule

