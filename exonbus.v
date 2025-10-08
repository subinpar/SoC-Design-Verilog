`timescale 1ns / 1ps

module exonbus(rst_n, clk, ena, enb, enc, eni, lda, ldb, ldc, inData, rega, regb, regc, zbus);

input rst_n;
input clk;
input ena;
input enb;
input enc;
input eni;
input lda;
input ldb;
input ldc;
input [7:0] inData;
output [7:0] rega;
output [7:0] regb;
output [7:0] regc;
output [7:0] zbus;
wire [7:0] tbus, qa, qb, qc;

assign zbus=tbus;
assign rega=qa;
assign regb=qb;
assign regc=qc;

tribufs U_IN(.a(inData),.en(eni),.z(tbus));
tribufs U_TA(.a(qa),.en(ena),.z(tbus));
tribufs U_TB(.a(qb),.en(enb),.z(tbus));
tribufs U_TC(.a(qc),.en(enc),.z(tbus));

reg8b U_RA(.rst_n(rst_n),.clk(clk),.en(lda),.in(tbus),.out(qa));
reg8b U_RB(.rst_n(rst_n),.clk(clk),.en(ldb),.in(tbus),.out(qb));
reg8b U_RC(.rst_n(rst_n),.clk(clk),.en(ldc),.in(tbus),.out(qc));

endmodule

module tribufs(a,en,z);
	input [7:0] a;
	input en;
	output [7:0] z;
	
	reg [7:0] z;
	
	always @(a,en)
		begin
		case(en)
			1'b0 : z = 8'bZZZZZZZZ;
			1'b1 : z = a;
			default : ;
		endcase
		end
endmodule	

module reg8b(rst_n, clk, en, in, out);

input rst_n,clk,en;
input [7:0] in;
output [7:0] out;
reg [7:0] out;

always @(negedge rst_n, posedge clk) begin
if(!rst_n) out <= 8'b0000_0000;
else if(en) out <= in;
end
endmodule	