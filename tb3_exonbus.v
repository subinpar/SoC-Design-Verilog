`timescale 1ns / 1ps

module tb3_exonbus;

	// Inputs
	reg rst_n;
	reg clk;
	reg ena;
	reg enb;
	reg enc;
	reg eni;
	reg lda;
	reg ldb;
	reg ldc;
	reg [7:0] inData;

	// Outputs
	wire [7:0] rega;
	wire [7:0] regb;
	wire [7:0] regc;
	wire [7:0] zbus;

	// Instantiate the Unit Under Test (UUT)
	exonbus uut (
		.rst_n(rst_n), 
		.clk(clk), 
		.ena(ena), 
		.enb(enb), 
		.enc(enc), 
		.eni(eni), 
		.lda(lda), 
		.ldb(ldb), 
		.ldc(ldc), 
		.inData(inData), 
		.rega(rega), 
		.regb(regb), 
		.regc(regc), 
		.zbus(zbus)
	);
	
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		rst_n = 0;
		clk = 0;
		ena = 0;
		enb = 0;
		enc = 0;
		eni = 0;
		lda = 0;
		ldb = 0;
		ldc = 0;
		inData = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst_n=1;
		
		// 입력 → A 저장 //
		#10 inData =  8'b10101010;    
		#10 eni = 1;
		#10 lda = 1;
		#10 lda = 0; eni = 0;

		// A → B, C 동시에 이동 //
		#10 ena = 1;                 // regA → bus
		#10 ldb = 1; ldc = 1;        // bus → regB, regC 동시에 로드
		#10 ena = 0; ldb = 0; ldc = 0;

	end
      
endmodule

