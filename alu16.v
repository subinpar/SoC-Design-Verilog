`timescale 1ns / 1ps

module alu16(reset, a, b, alufs, alu);

	input reset;
	input [1:0] alufs;
	input [15:0] a,b;
	output [15:0] alu;
	wire [14:0] c;
	wire aen,binv,c0;
	
	assign aen=alufs[1];
	assign binv=alufs[1:0]==2'b11;
	assign c0=alufs[0];
	
	//only 4bit
	alu1bit b00(.reset(reset),.a(a[0]),.b(b[0]),.aen(aen),.binv(binv),.cin(c0),.cout(c[0]),.sum(alu[0]));
	alu1bit b01(.reset(reset),.a(a[1]),.b(b[1]),.aen(aen),.binv(binv),.cin(c[0]),.cout(c[1]),.sum(alu[1]));
	alu1bit b02(.reset(reset),.a(a[2]),.b(b[2]),.aen(aen),.binv(binv),.cin(c[1]),.cout(c[2]),.sum(alu[2]));
	alu1bit b03(.reset(reset),.a(a[3]),.b(b[3]),.aen(aen),.binv(binv),.cin(c[2]),.cout(c[3]),.sum(alu[3]));
	
endmodule
