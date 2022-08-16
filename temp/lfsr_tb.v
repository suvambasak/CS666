
`timescale 1ns / 1ps
// `include "dflip.v"
`include "lfsr.v"
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/31/2016 06:22:54 PM
// Design Name:
// Module Name: enable_sr_tb
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


module lfsr_tb();

    reg [15:0]seed;
    reg clk,reset;
    wire out;
   
    parameter PERIOD = 5;
    always #PERIOD clk=~clk;
    always #6 $display("out=%b",out);
   
lfsr uut (
.seed(seed),
.clk(clk),
.reset(reset),
.out(out)
);


   //Generate error checking and have pass or fail condition
   initial
   begin
    reset=1'b0;
    seed=16'b1000100010001111;
    
    #1000
    reset=1'b1;
end

endmodule