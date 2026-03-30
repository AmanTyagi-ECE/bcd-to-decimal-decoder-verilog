`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 13:59:01
// Design Name: 
// Module Name: tb_sn74144
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_sn74144;
    reg clk;
    reg clear;
    reg scei, pcei;
    reg latch_strobe;
    reg bi, rbi;
    reg dp_in;
    wire rbo;
    wire max_count;
    wire [3:0] q;
    wire a,b,c,d,e,f,g;
    wire dp;

    sn74144 uut(
        .clk(clk),
        .clear(clear),
        .scei(scei),
        .pcei(pcei),
        .latch_strobe(latch_strobe),
        .bi(bi),
        .rbi(rbi),
        .dp_in(dp_in),
        .rbo(rbo),
        .max_count(max_count),
        .q(q),
        .a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),
        .dp(dp)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;   
    end

    initial begin
        clear = 1'b0;
        scei = 1'b0;
        pcei = 1'b0;
        latch_strobe = 1'b0;
        bi = 1'b0;
        rbi = 1'b1;
        dp_in =1'b0;

        #10 clear = 1'b1; 
        repeat(12) #10;

        #20 latch_strobe = 1'b1;
        repeat(5) #10;

        #20 latch_strobe = 1'b0; 
        #20 bi = 1'b1;
        #20 bi = 1'b0;
        #20 clear = 1'b0;
        #10 clear = 1'b1;
        rbi = 1'b0;    
        #20 rbi = 1'b1;
        dp_in = 1'b1;
        #20 dp_in = 1'b0;
        #200 $stop;
    end
endmodule
