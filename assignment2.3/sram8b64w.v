`timescale 1ns / 1ps

module sram8b64w(adr,rd,wr,d,q);
  input [5:0] adr;
  input rd;
  input wr;
  input [7:0] d;
  output [7:0] q;
  
  reg [7:0] q;
  
  reg [7:0] RAM_DATA [0:63];
  
  initial
    begin
      RAM_DATA[0]=8'b00000001; //Add #1
      RAM_DATA[1]=8'b00000010; //Add #1
      RAM_DATA[2]=8'b00000011; //Add #1
      RAM_DATA[3]=8'b00000100; //Add #1
      RAM_DATA[4]=8'b00000101; //Add #1
      RAM_DATA[5]=8'b00000110; //Add #1
      RAM_DATA[6]=8'b00000111; //Add #1
      RAM_DATA[7]=8'b00001000; //Add #1
      RAM_DATA[8]=8'b00001001; //Add #1
      RAM_DATA[9]=8'b00001010; //Add #1
      RAM_DATA[10]=8'b10111110; //Add #1
      RAM_DATA[11]=8'b11111111; //Add #1
      RAM_DATA[63]=8'b11111111; //Add #1
    end
  always@(d,adr,rd,wr)
    begin
    if(rd)
      q=RAM_DATA[adr];
    else if(wr)
      RAM_DATA[adr]=d;
    else
      q=8'bzzzzzzzz;
  end
endmodule
