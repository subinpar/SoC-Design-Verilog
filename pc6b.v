`timescale 1ns / 1ps

module pc6b(rst_n, clk, inc, ld, d, q);

input rst_n;
input clk;
input inc;
input ld;
input [5:0] d;
output [5:0] q;

reg [5:0] qtmp;

assign q=qtmp;

always @(posedge clk, negedge rst_n)
begin
	if(!rst_n) qtmp <= 6'b000000;
	else if (inc) qtmp <= qtmp + 1;
	else if (ld) qtmp <= d;
end	

endmodule
