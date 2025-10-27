`timescale 1ns / 1ps

module tb_acc_reg;

  // Inputs
  reg clk;
  reg accce;
  reg [15:0] alu;

  // Outputs
  wire [15:0] acc;
  wire acc15;
  wire accz;

  // DUT
  acc_reg uut (
    .clk(clk),
    .accce(accce),
    .alu(alu),
    .acc(acc),
    .acc15(acc15),
    .accz(accz)
  );

  // clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // stimulus
  initial begin
    accce = 0; alu = 16'h0000; #100;

    // 1) accce 활성화 후 ALU 값 저장
    alu = 16'h0003; accce = 1; #10;
    accce = 0; #10;

    // 2) 또 다른 값 입력
    alu = 16'h8001; accce = 1; #10;
    accce = 0; #10;

  end

endmodule
