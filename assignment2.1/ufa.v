`timescale 1ns / 1ps

module ufa(rst_n, clk, en,rd, multiplicant, multiplier, result);

input rst_n;
input clk;
input en;
input rd;
input [2:0] multiplicant;
input [2:0] multiplier;
output [5:0] result;

wire [5:0] in_s;
wire [5:0] adr_s;

assign in_s={multiplicant, multiplier};

reg6b U_REG(
	.q(adr_s),
	.rst_n(rst_n),
	.clk(clk),
	.en(en),
	.d(in_s));
	
rom U_ROM(
	.data(result),
	.adr(adr_s),
	.en(en),
	.rd(rd));


endmodule
