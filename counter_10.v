`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:57 10/06/2025 
// Design Name: 
// Module Name:    counter_10 
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

module counter_10(clk, rstn, cnt);
	input clk,rstn;
	output [3:0] cnt;
	reg [3:0] cnt;
	
	always @(posedge clk or negedge rstn) begin
		if (!rstn) cnt <=4'h0;
		else if(cnt != 4'h9) cnt<=cnt+1;
		else cnt<=4'h0;
	end


endmodule
