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

module reg6b(rst_n, clk, en, d, q);

input rst_n;
input clk;
input en;
input [5:0] d;
output [5:0] q;
reg [5:0] qtmp;

always @(posedge clk, negedge rst_n)
	begin
	if(!rst_n)
		qtmp<=6'b000000;
	else if(en)
		qtmp<=d;
	end

	assign q=qtmp;

endmodule

module rom(en, rd, adr, data);
input en;
input rd;
input [5:0] adr;
output [5:0] data;

reg [5:0] ROM_DATA [0:63];
reg [5:0] tmp;

initial 
	begin
		ROM_DATA[0]=6'b000000;
		ROM_DATA[1]=6'b000000;
		ROM_DATA[2]=6'b000000;
		ROM_DATA[3]=6'b000000;
		ROM_DATA[4]=6'b000000;
		ROM_DATA[5]=6'b000000;
		ROM_DATA[6]=6'b000000;
		ROM_DATA[7]=6'b000000;
		ROM_DATA[8]=6'b000000;
		ROM_DATA[9]=6'b000000;
		ROM_DATA[10]=6'b000000;
		ROM_DATA[11]=6'b000000;
		
		ROM_DATA[12]=6'b000000;
		ROM_DATA[13]=6'b000000;
		ROM_DATA[14]=6'b000000;
		ROM_DATA[15]=6'b000000;
		
		ROM_DATA[16]=6'b000010;
		ROM_DATA[17]=6'b000011;
		ROM_DATA[18]=6'b000100;
		ROM_DATA[19]=6'b000101;
		ROM_DATA[20]=6'b000110;
		ROM_DATA[21]=6'b000111;
		ROM_DATA[22]=6'b001000;
		ROM_DATA[23]=6'b001001;
		
		ROM_DATA[24]=6'b000000;
		ROM_DATA[25]=6'b000000;
		ROM_DATA[26]=6'b000000;
		ROM_DATA[27]=6'b000000;
		ROM_DATA[28]=6'b000000;
		ROM_DATA[29]=6'b000000;
		ROM_DATA[30]=6'b000000;
		ROM_DATA[31]=6'b000000;
		
		ROM_DATA[32]=6'b000000;
		ROM_DATA[33]=6'b000000;
		ROM_DATA[34]=6'b000000;
		ROM_DATA[35]=6'b000000;
		ROM_DATA[36]=6'b000000;
		ROM_DATA[37]=6'b000000;
		ROM_DATA[38]=6'b000000;
		ROM_DATA[39]=6'b000000;
		
		ROM_DATA[40]=6'b000000;
		ROM_DATA[41]=6'b000000;
		ROM_DATA[42]=6'b000000;
		ROM_DATA[43]=6'b000000;
		ROM_DATA[44]=6'b000000;
		ROM_DATA[45]=6'b000000;
		ROM_DATA[46]=6'b000000;
		ROM_DATA[47]=6'b000000;

		ROM_DATA[48]=6'b000000;
		ROM_DATA[49]=6'b000000;
		ROM_DATA[50]=6'b000000;
		ROM_DATA[51]=6'b000000;
		ROM_DATA[52]=6'b000000;
		ROM_DATA[53]=6'b000000;
		ROM_DATA[54]=6'b000000;
		
	ROM_DATA[55]=6'b000000;
		ROM_DATA[56]=6'b000000;
		ROM_DATA[57]=6'b000000;
		ROM_DATA[58]=6'b000000;
		ROM_DATA[59]=6'b000000;
		ROM_DATA[60]=6'b000000;
		ROM_DATA[61]=6'b000000;
		ROM_DATA[62]=6'b000000;
		ROM_DATA[63]=6'b000000;
	end
	
	always @(adr, en, rd)
		begin
		if(en&&rd)
			tmp=ROM_DATA[adr];
		else
			tmp=6'bzzzzzz;
		end

	assign data=tmp;

endmodule

