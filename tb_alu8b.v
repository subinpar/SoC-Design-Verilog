`timescale 1ns / 1ps

module tb_alu8b;

	// Inputs
	reg rst_n;
	reg clk;
	reg [7:0] opcode;
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] z;

	// Instantiate the Unit Under Test (UUT)
	alu8b uut (
		.rst_n(rst_n), 
		.clk(clk), 
		.opcode(opcode), 
		.a(a), 
		.b(b), 
		.z(z)
	);
	
	initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

	initial begin
		// Initialize Inputs
		rst_n = 0;
		clk = 0;
		opcode = 0;
		a = 0;
		b = 0;

		#20 
		rst_n = 1;


		@(negedge clk);
		a = 8'd15;
		b = 8'd7;

   
		opcode = 8'h63;  
		@(posedge clk);

    
		opcode = 8'h79; 
		@(posedge clk);

   
		@(negedge clk);
		a = 8'd1;
		opcode = 8'h8A; 
		@(posedge clk);

		#20;
  end
endmodule
 