`timescale 1ns / 1ps

module tb_alu1bit;

	// Inputs
	reg reset;
	reg a;
	reg b;
	reg aen;
	reg binv;
	reg cin;

	// Outputs
	wire cout;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	alu1bit uut (
		.reset(reset), 
		.a(a), 
		.b(b), 
		.aen(aen), 
		.binv(binv), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		a = 0;
		b = 0;
		aen = 0;
		binv = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		aen = 1; a = 0; b = 0; cin = 0; binv = 0; #10; // 0+0+0
		a   = 1; b = 0; cin = 0; binv = 0; #10; // 1+0+0
		a   = 1; b = 1; cin = 0; binv = 0; #10; // 1+1+0
		a   = 1; b = 1; cin = 1; binv = 0; #10; // 1+1+1
		binv = 1; a = 1; b = 0; cin = 0; #10;     // b 반전 확인
		reset = 1; #10;                           // reset 테스트
		reset = 0; #10;


	end
      
endmodule

