`timescale 1ps/1ps
`include "d_flipflop.v"

module lfsr (state,seed,clk,reset);
    output [15:0] state;
    input [15:0] seed;
    input clk, reset;

    reg [10:0] r1,c1;
    reg [1:0] r2,r4,c2,c4;
    reg r3,c3;
    wire w1,w2,w3,w4;

    reg flag=1'b1;

    always @(posedge clk, negedge reset) begin

        if (~reset) begin 
            r1=11'b00000000000;
            r2=2'b00;
            r3=1'b0;
            r4=2'b00;
        end else begin 
            if(flag) begin
                r1=seed[10:0];
                r2=seed[12:11];
                r3=seed[13];
                r4=seed[15:14];

                flag=1'b0;
            end else begin 
                r1=c1;
                r2=c2;
                r3=c3;
                r4=c4;
            end
        end
    end

    always @(w1, r1) begin
        c1 = {w1,r1[10:1]};
    end

    always @(w2, r2) begin
        c2 = {w2,r2[1]};
    end

    always @(w3, r3) begin
        c3 = w3;
    end

    always @(w4, r4) begin
        c4 = {w4,r4[1]};
    end



    assign w1 = r1[0]^r2[0];
    assign w2 = r1[0]^r3;
    assign w3 = r1[0]^r4[0];
    assign w4 = r1[0];


    d_flipflop d1(state[0],r1[0],clk,reset);
    d_flipflop d2(state[1],r1[1],clk,reset);
    d_flipflop d3(state[2],r1[2],clk,reset);
    d_flipflop d4(state[3],r1[3],clk,reset);
    d_flipflop d5(state[4],r1[4],clk,reset);
    d_flipflop d6(state[5],r1[5],clk,reset);
    d_flipflop d7(state[6],r1[6],clk,reset);
    d_flipflop d8(state[7],r1[7],clk,reset);
    d_flipflop d9(state[8],r1[8],clk,reset);
    d_flipflop d10(state[9],r1[9],clk,reset);
    d_flipflop d11(state[10],r1[10],clk,reset);

    d_flipflop d12(state[11],r2[0],clk,reset);
    d_flipflop d13(state[12],r2[1],clk,reset);
    
    d_flipflop d14(state[13],r3,clk,reset);
    
    d_flipflop d15(state[14],r4[0],clk,reset);
    d_flipflop d16(state[15],r4[1],clk,reset);
    
endmodule