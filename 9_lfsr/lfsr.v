`timescale 1ps/1ps
`include "d_flipflop.v"


module lfsr (
    output [2:0] op,
    input clk,
    input rstn,
    input [2:0] load_val
);
    reg [2:0] r,current;
    reg [2:0] p,next;
    reg flag = 1'b1;
    wire taps;

    always @(posedge clk,negedge rstn) begin
        if(~rstn) begin 
            current=4'b0000;
        end else begin

            if (flag) begin
                current=load_val;
                flag=1'b0;    
            end else begin
                current=next;
            end
            
        end
    end

    always @(taps, current) begin
        next = {taps,current[2:1]};
    end

    assign taps = current[0]^current[1]; 
    

    d_flipflop d1(op[0],current[0],clk,rstn);
    d_flipflop d2(op[1],current[1],clk,rstn);
    d_flipflop d3(op[2],current[2],clk,rstn);

    
endmodule