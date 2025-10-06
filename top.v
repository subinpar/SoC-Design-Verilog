`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:47 10/05/2025 
// Design Name: 
// Module Name:    top 
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
module top(t1,t2,t3,clk,rst,ff2);
input t1,t2,t3,clk,rst;
output ff2;

wire go;

stage1 u1(.a(t1),.b(t2),.c(t3),.clk(clk),.ff1(go));
stage2 u2(.ff1(go),.a(t1),.clk(clk),.rst(rst),.ff2(ff2));

endmodule
