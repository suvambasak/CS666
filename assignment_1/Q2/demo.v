`timescale 1ps/1ps
`include "d_flipflop.v"


module demo (
    output reg[3:0] op,
    input clk,
    input rstn,
    input [3:0] load_val
);


    d_flipflop d1(op[0],load_val[0],clk,rstn);
    d_flipflop d2(op[1],load_val[1],clk,rstn);
    d_flipflop d3(op[2],load_val[2],clk,rstn);
    d_flipflop d4(op[3],load_val[3],clk,rstn);
    
endmodule