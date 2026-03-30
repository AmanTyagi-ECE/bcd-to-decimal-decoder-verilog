`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 13:49:13
// Design Name: 
// Module Name: sn74144
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


module sn74144( 
    input clk, 
    input clear, 
    input scei, pcei, 
    input latch_strobe, 
    input bi, 
    input rbi, 
    input dp_in, 
     
    output reg rbo, 
    output reg max_count, 
    output reg [3:0] q, 
    output reg a, b, c, d, e, f, g, 
    output reg dp 
); 
 
     
    wire slow_clk; 
    clk_divider u1( 
        .clk(clk), 
        .slow_clk(slow_clk) 
    );   
     
    reg [3:0] count; 
     
    always @(posedge slow_clk or negedge clear) begin 
        if (clear == 1'b0) begin  
            count <= 4'd0; 
        end else if (scei == 1'b0 && pcei == 1'b0) begin  
            if (count == 4'd9) 
                count <= 4'd0; 
            else 
                count <= count + 1; 
        end 
    end 
 
    always @(posedge clk) begin 
        if (latch_strobe == 1'b0) begin  
            q <= count; 
        end 
    end 
     
    always @(q, scei, pcei) begin 
        if (q == 4'd9 && scei == 1'b0 && pcei == 1'b0) 
            max_count = 1'b1; 
        else 
            max_count = 1'b0; 
    end 
 
    always @(q, rbi) begin 
        if (q == 4'd0 && rbi == 1'b0)  
            rbo = 1'b0; 
        else 
            rbo = 1'b1; 
    end 
     
    always @(q, bi, rbi) begin 
        if (bi == 1'b1 || (q == 4'd0 && rbi == 1'b0)) begin 
            {a,b,c,d,e,f,g} = 7'b1111111; 
        end else begin                                 
            case(q) 
                4'd0: {a,b,c,d,e,f,g} = 7'b0000001; 
                4'd1: {a,b,c,d,e,f,g} = 7'b1001111; 
                4'd2: {a,b,c,d,e,f,g} = 7'b0010010; 
                4'd3: {a,b,c,d,e,f,g} = 7'b0000110; 
                4'd4: {a,b,c,d,e,f,g} = 7'b1001100; 
                4'd5: {a,b,c,d,e,f,g} = 7'b0100100; 
                4'd6: {a,b,c,d,e,f,g} = 7'b0100000; 
                4'd7: {a,b,c,d,e,f,g} = 7'b0001111; 
                4'd8: {a,b,c,d,e,f,g} = 7'b0000000; 
                4'd9: {a,b,c,d,e,f,g} = 7'b0000100; 
                default: {a,b,c,d,e,f,g} = 7'b1111111; 
            endcase 
        end 
    end 
 
    always @(bi, dp_in) begin 
        if (bi == 1'b1) 
            dp = 1'b0; 
        else 
            dp = dp_in; 
    end 
endmodule 