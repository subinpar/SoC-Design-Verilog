`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:15 10/05/2025 
// Design Name: 
// Module Name:    stage1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module stage1(a,b,c,clk,ff1);
input a,b,c,clk;
output ff1;

reg ff1;

always @ (posedge clk)
	ff1<=(a&b)^c;


endmodule
