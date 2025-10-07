`timescale 1ns / 1ps

module alu8b(
  input rst_n,
  input clk,
  input [7:0] opcode,
  input [7:0] a,
  input [7:0] b,
  output [7:0] z
);

  wire [2:0] op_sel;
  wire mux_sel;
  wire [1:0] shift_mode;
  wire [7:0] ra_s;
  wire ra_en;
  wire rb_en;

  reg [7:0] mux_s;
  reg [7:0] op_s;
  reg [7:0] shift_s;

  assign op_sel = opcode[2:0];
  assign mux_sel = opcode[3];
  assign shift_mode = opcode[5:4];
  assign ra_en = opcode[6];
  assign rb_en = opcode[7];

  
  always @(b, mux_sel, ra_s) begin
    case (mux_sel)
      1'b0: mux_s = b;
      1'b1: mux_s = ra_s;
      default: mux_s = 8'h00;
    endcase
  end

  always @(a, mux_s, op_sel) begin
    case (op_sel)
      3'b000: op_s = a;
      3'b001: op_s = mux_s;
      3'b010: op_s = a + mux_s;
      3'b011: op_s = a - mux_s;
      3'b100: op_s = mux_s - a;
      3'b101: op_s = a & mux_s;
      3'b110: op_s = a | mux_s;
      3'b111: op_s = a ^ mux_s;
      default: op_s = 8'h00;
    endcase
  end

  always @(op_s, shift_mode) begin
    case (shift_mode)
      2'b00: shift_s = op_s;
      2'b01: shift_s = {1'b0, op_s[7:1]};  
      2'b10: shift_s = {op_s[5:0], 2'b00}; 
      2'b11: shift_s = {op_s[6:0], 1'b0}; 
      default: shift_s = op_s;
    endcase
  end


  reg8b U_RA(.q(ra_s), .rst_n(rst_n), .clk(clk), .en(ra_en), .d(shift_s));
  reg8b U_RB(.q(z),    .rst_n(rst_n), .clk(clk), .en(rb_en), .d(shift_s));

endmodule

module reg8b(
  output reg [7:0] q,
  input rst_n,
  input clk,
  input en,
  input [7:0] d
);
  always @(negedge rst_n or posedge clk) begin
    if (!rst_n)
      q <= 8'b0000_0000;
    else if (en)
      q <= d;
  end
endmodule
