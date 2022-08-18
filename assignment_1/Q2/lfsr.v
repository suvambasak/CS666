`timescale 1ps/1ps
`include "d_flipflop.v"

module lfsr (state,seed,clk,reset);
    output [15:0] state;
    input [15:0] seed;
    input clk, reset;

    reg [15:0] current,next;
    wire w1,w2,w3,w4;

    reg flag=1'b1;

    always @(posedge clk, negedge reset) begin

        if (~reset) begin 
            current=16'b0000000000000000;
        end else begin 
            if(flag) begin
                current=seed;

                flag=1'b0;
            end else begin 
                current=next;
            end
        end
    end

    always @(w1, current) begin
        next[10:0] = {w1,current[10:1]};
    end

    always @(w2, current) begin
        next[12:11] = {w2,current[12]};
    end

    always @(w3, current) begin
        next[13] = w3;
    end

    always @(w4, current) begin
        next[15:14] = {w4,current[15]};
    end



    assign w1 = current[0]^current[11];
    assign w2 = current[0]^current[13];
    assign w3 = current[0]^current[14];
    assign w4 = current[0];


    d_flipflop d1(state[0],current[0],clk,reset);
    d_flipflop d2(state[1],current[1],clk,reset);
    d_flipflop d3(state[2],current[2],clk,reset);
    d_flipflop d4(state[3],current[3],clk,reset);
    d_flipflop d5(state[4],current[4],clk,reset);
    d_flipflop d6(state[5],current[5],clk,reset);
    d_flipflop d7(state[6],current[6],clk,reset);
    d_flipflop d8(state[7],current[7],clk,reset);
    d_flipflop d9(state[8],current[8],clk,reset);
    d_flipflop d10(state[9],current[9],clk,reset);
    d_flipflop d11(state[10],current[10],clk,reset);
    d_flipflop d12(state[11],current[11],clk,reset);
    d_flipflop d13(state[12],current[12],clk,reset);
    d_flipflop d14(state[13],current[13],clk,reset);
    d_flipflop d15(state[14],current[14],clk,reset);
    d_flipflop d16(state[15],current[15],clk,reset);
    
endmodule