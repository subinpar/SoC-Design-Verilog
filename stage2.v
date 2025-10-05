`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:37 10/05/2025 
// Design Name: 
// Module Name:    stage2 
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
module stage2(ff1,a,clk,rst,ff2);
input ff1,a,clk,rst;
output ff2;

reg ff2;

always @(posedge clk or negedge rst) begin 
	if(!rst) ff2<=0;
	else if (a) ff2<=ff1;
end

endmodule
