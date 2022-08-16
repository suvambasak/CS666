`timescale 1ns / 1ps
`include "dflip.v"
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 14.08.2022 15:39:15
// Design Name:
// Module Name: lfsr
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


module lfsr(seed,clk,reset,out);
input [15:0]seed;
input clk,reset;
output wire out;
wire [0:14]qd;
parameter n=14;

genvar i;
  generate
  for(i=0; i<=n; i=i+1)
     dflip D(.d(seed[i]),.clk(clk),.reset(reset),.Q(qd[i]));
  endgenerate

dflip D_last(.d(seed[15]),.clk(clk),.reset(reset),.Q(out));

assign seed[1]=qd[0];
assign seed[2]=qd[1]^out;
assign seed[3]=qd[2]^out;
assign seed[4]=qd[3];
assign seed[5]=qd[4]^out;
assign seed[6]=qd[5];
assign seed[7]=qd[6];
assign seed[8]=qd[7];
assign seed[9]=qd[7];
assign seed[10]=qd[9];
assign seed[11]=qd[10];
assign seed[12]=qd[11];
assign seed[13]=qd[12];
assign seed[14]=qd[13];
assign seed[15]=qd[14];
assign seed[0]=out;


endmodule