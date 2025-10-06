`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:20 10/06/2025 
// Design Name: 
// Module Name:    ADD 
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
module ADD(A,B,SUM);

input [7:0] A,B;
output [7:0] SUM;
	assign SUM=A+B;

endmodule

module TOP(CLK,RESET,A,B,OUT);
input CLK,RESET;
input [7:0] A,B;
output [7:0] OUT;
reg [7:0] OUT;
wire [7:0] SUM;
ADD U0(.A(A),.B(B),.SUM(SUM));
		
always @(posedge CLK or posedge RESET) begin
			if (RESET) OUT<=8'b0;
			else 			OUT<=SUM;
		end
endmodule
