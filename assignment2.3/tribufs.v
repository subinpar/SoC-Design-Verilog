`timescale 1ns / 1ps

module tribufs(a,en,z);
  input [7:0] a;
  input en;
  output [7:0] z;
  
  reg [7:0] z;
  
  always@(a,en)
    begin
    case (en)
      1'b0:z=8'bzzzzzzzz;
      1'b1: z=a;
      default : ;
    endcase
    end
endmodule
