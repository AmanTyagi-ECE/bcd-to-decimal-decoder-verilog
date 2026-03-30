`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2025 13:50:17
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input wire clk,
    output reg slow_clk = 1'b0
); 
    reg [25:0] count = 26'b0;
    always @(posedge clk) begin 
        if (count == 49_999_999) begin
            slow_clk <= ~slow_clk;
            count <= 26'b0;
        end
        else begin
            count <= count + 1;
        end
    end

endmodule

