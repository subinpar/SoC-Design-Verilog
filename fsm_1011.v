`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:50:14 10/06/2025 
// Design Name: 
// Module Name:    fsm_1011 
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
module fsm_1011(
   input clk, rstn,
	input din,
	output y
);
	reg [1:0] state, nstate;
	parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
	
	always @(state or din) begin
		case(state)
			S0: nstate=din ? S1:S0;
			S1: nstate=din ? S1:S2;
			S2: nstate=din ? S3:S0;
			S3: nstate=din ? S1:S2;
		endcase
	end
	
	always @(posedge clk or negedge rstn) begin
		if (!rstn) state<=S0;
		else		  state<=nstate;
	end
	
	assign y = (state==S3)&& din;

endmodule
