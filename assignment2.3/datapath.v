`timescale 1ns / 1ps

module datapath(rst_n,clk,pass,add,ldAc,ldIr,incPc,ldPc,irOnAdr,pcOnAdr,dataBusIn,dataBusOut,adrBus,opcode);
  input rst_n;
  input clk;
  input pass;
  input add;
  input ldAc;
  input ldIr;
  input incPc;
  input ldPc;
  input irOnAdr;
  input pcOnAdr;
  input [7:0] dataBusIn;
  output [7:0] dataBusOut;
  output [5:0] adrBus;
  output [1:0] opcode;
  
  reg[5:0] adrBus;
  wire [7:0] actmp;
  wire [7:0] irtmp;
  wire [5:0] pctmp;
  reg [7:0] alutmp;
  
  assign opcode=irtmp[7:6];
  assign dataBusOut=alutmp;
  
  always@(actmp,irtmp,pass,add)
    begin
     if(add) alutmp=actmp+{2'b00, irtmp[5:0]};
     else if(pass) alutmp=actmp;
     else alutmp=8'bzzzzzzzz;
    end
    
  always@(irOnAdr,pcOnAdr,irtmp,pctmp)
    begin
      if(irOnAdr) adrBus=irtmp[5:0];
      else if(pcOnAdr) adrBus=pctmp;
      else adrBus=6'bzzzzzz;
    end
    
  reg8b AC(
  .rst_n(rst_n),
  .clk(clk),
  .en(ldAc),
  .d(dataBusIn),
  .q(actmp));
  
  reg8b IR(
  .rst_n(rst_n),
  .clk(clk),
  .en(ldIr),
  .d(dataBusIn),
  .q(irtmp));
  
  pc6b PC(
  .rst_n(rst_n),
  .clk(clk),
  .inc(incPc),
  .ld(ldPc),
  .d(irtmp[5:0]),
  .q(pctmp));


endmodule

module reg8b(rst_n,clk,en,d,q);
  input rst_n,clk,en;
  input [7:0] d;
  output [7:0] q;
  reg [7:0] q;
  
  always@(negedge rst_n, posedge clk) begin
  if(!rst_n)q<=8'b0000_0000;
  else if(en)q<=d;
  end  
endmodule

module pc6b(rst_n,clk,inc,ld,d,q);
  input rst_n;
  input clk;
  input inc;
  input ld;
  input [5:0] d;
  output [5:0] q;
  
  reg [5:0] qtmp;
  
  assign q=qtmp;
  
  always@(posedge clk, negedge rst_n)
  begin
    if(!rst_n) qtmp<=6'b000000;
    else if(inc) qtmp<=qtmp+1;
    else if(ld) qtmp<=d;
  end
  
endmodule

