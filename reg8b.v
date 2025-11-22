`timescale 1ns / 1ps

module reg8b(rst_n, clk, en, d, q);

input rst_n;
input clk;
input en;
input [7:0] d;
output [7:0] q;

reg [7:0] qtmp;

assign q=qtmp;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		qtmp<=8'b00000000;
	else if(en)
		qtmp<=d;
	end	


endmodule
