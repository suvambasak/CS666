`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 14.08.2022 13:06:41
// Design Name:
// Module Name: dflip
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


module dflip(d,clk,reset,Q);
input d,clk,reset;
output reg Q;

always@(posedge clk & !reset)
    Q<=d;

endmodule