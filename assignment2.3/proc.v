`timescale 1ns / 1ps
module proc(rst_n,clk,start,adr,rd,wr,d,q);

  input rst_n;  //ad,wr,rd,d,q
  input clk;
  input start;
  output [5:0] adr;
  output rd,wr;
  output [7:0] d;
  output [7:0] q;
  
  wire wadd;
  wire wpass;
  wire wldAc;
  wire wldIr;
  wire wldPc;
  wire wincPc;
  wire wirOnAdr;
  wire wpcOnAdr;
  wire wMemrd;
  wire wMemwr;
  wire clkb;
  wire [1:0] bl8;
  wire [7:0] bl5;
  wire [5:0] bl6;
  wire [7:0] bl7;
  
  not (clkb, clk);
  
  assign adr=bl6;
  assign rd=wMemrd;
  assign wr=wMemwr;
  assign d=bl5;
  assign q=bl7; 
  
  
  
  
  sram8b64w
   MEM(
    .d(bl5),
    .adr(bl6),
    .wr(wMemwr),
    .rd(wMemrd),
    .q(bl7));
    
  datapath
    DP(
     .rst_n(rst_n),
     .clk(clkb),
     .add(wadd),
     .pass(wpass),
     .ldAc(wldAc),
     .ldIr(wldIr),
     .ldPc(wldPc),
     .incPc(wincPc),
     .irOnAdr(wirOnAdr),
     .pcOnAdr(wpcOnAdr),
     .opcode(bl8),
     .dataBusIn(bl5),
     .dataBusOut(bl5),
     .adrBus(bl6));
     
  controller
    CTR(
      .rst_n(rst_n),
      .clk(clk),
      .add(wadd),
      .pass(wpass),
      .ldAc(wldAc),
      .ldIr(wldIr),
      .ldPc(wldPc),
      .incPc(wincPc),
      .irOnAdr(wirOnAdr),
      .pcOnAdr(wpcOnAdr),
      .start(start),
      .opcode1(bl8[1]),
      .opcode0(bl8[0]),
      .wrMem(wMemwr),
      .rdMem(wMemrd));
      
  tribufs
    TRI(
      .a(bl7),
      .en(wMemrd),
      .z(bl5));

endmodule
