`timescale 1ps/1ps
`include "d_flipflop.v"

module lfsr (state,seed,clk,reset);
    output [3:0] state;
    input [3:0] seed;
    input clk, reset;


    d_flipflop d1(state[0],seed[0],clk,reset);
    d_flipflop d2(state[1],seed[1],clk,reset);
    d_flipflop d3(state[2],seed[2],clk,reset);
    d_flipflop d4(state[3],seed[3],clk,reset);

    assign seed[0]=state[3];
    assign seed[1]=state[0];
    assign seed[2]=state[1];
    assign seed[3]=state[2];
    
endmodule