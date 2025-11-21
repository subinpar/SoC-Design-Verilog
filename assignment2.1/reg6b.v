`timescale 1ns / 1ps

module reg6b(rst_n, clk, en, d, q);

input rst_n;
input clk;
input en;
input [5:0] d;
output [5:0] q;
reg [5:0] qtmp;

always @(posedge clk, negedge rst_n)
	begin
	if(!rst_n)
		qtmp<=6'b000000;
	else if(en)
		qtmp<=d;
	end

	assign q=qtmp;

endmodule
