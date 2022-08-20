`timescale 1ps/1ps
`include "d_flipflop.v"

module lfsr (state,seed,clk,reset);
    output [15:0] state;
    input [15:0] seed;
    input clk, reset;

    reg [15:0] current,next;
    wire w1,w2,w3,w4;

    reg flag=1'b1;

    genvar i;

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


    generate
        for(i=0;i<16;i=i+1) begin
            d_flipflop d(state[i],current[i],clk,reset);
        end
    endgenerate
    
endmodule