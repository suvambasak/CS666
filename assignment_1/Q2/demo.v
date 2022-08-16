`timescale 1ps/1ps
`include "d_flipflop.v"


module demo (
    output [2:0] op,
    input clk,
    input rstn,
    input [2:0] load_val
);

    // d_flipflop d1(op[0],load_val[0],clk,rstn);
    // d_flipflop d2(op[1],load_val[1],clk,rstn);
    // d_flipflop d3(op[2],load_val[2],clk,rstn);
    // d_flipflop d4(op[3],load_val[3],clk,rstn);

    // wire[3:0] t = 4'b1100;
    // wire[2:0] t = load_val;

    // reg [3:0] t;
    // reg [2:0] r;
    // reg [2:0] p;
    // reg flag = 1'b1;

    // always @(posedge clk) begin
    //     if (flag) begin
    //         r=load_val;
    //         flag=1'b0;    
    //     end else begin
    //         r[0]=load_val[0];
    //         r[1]=~load_val[1];
    //         r[2]=load_val[2];
    //     end
        
    // end

    // d_flipflop d1(op[0],r[0],clk,rstn);
    // d_flipflop d2(op[1],r[1],clk,rstn);
    // d_flipflop d3(op[2],r[2],clk,rstn);

    // d_flipflop d1(op[0],load_val[0],clk,rstn);
    // d_flipflop d2(op[1],load_val[1],clk,rstn);
    // d_flipflop d3(op[2],load_val[2],clk,rstn);
    
    // assign load_val[0]=op[1]^op[2];




    // initial $display("r=%b",r);
    
endmodule