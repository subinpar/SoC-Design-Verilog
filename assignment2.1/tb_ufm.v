`timescale 1ns / 1ps

module tb_ufm;

    reg rst_n;
    reg clk;
    reg en;
    reg rd;
    reg [2:0] multiplicant;
    reg [2:0] multiplier;
    wire [5:0] result;

    ufm uut (
        .rst_n(rst_n),
        .clk(clk),
        .en(en),
        .rd(rd),
        .multiplicant(multiplicant),
        .multiplier(multiplier),
        .result(result)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        en = 0;
        rd = 0;
        multiplicant = 0;
        multiplier = 0;

        #10;
        rst_n = 1;
        en = 1;
        rd = 1;

        repeat(3) begin

            repeat(8) begin
                #10 multiplicant = multiplicant + 1;
            end
            multiplicant = 0;
            multiplier = multiplier + 1;
        end
        #50;
    end
endmodule
