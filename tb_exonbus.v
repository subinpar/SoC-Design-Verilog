`timescale 1ns / 1ps

module tb_exonbus;

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
		#10 rst_n = 1;                // 10ns 후 리셋 해제
		#10 inData = 8'b10101010;     // 20ns: 입력 데이터 설정
		#10 eni = 1;                  // 30ns: 입력 버퍼 on → zbus에 데이터 전달
		#10 lda = 1;                  // 40ns: 레지스터 A load
		#10 lda = 0; eni = 0;         // 50ns: load 완료 후 해제

	end
      
endmodule

