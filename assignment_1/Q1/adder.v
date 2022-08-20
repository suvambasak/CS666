`timescale 1ps/1ps
`include "full_adder.v"

module adder (final_sum, final_carry_out, overflow, data0, data1, mode);
    output [7:0] final_sum;
    output final_carry_out, overflow;

    wire [6:0] c;
    reg carry_in=1'b0;

    genvar   i;

    input [7:0] data0, data1;
    input mode;

    always @(mode) begin
        if(mode==1'b1) begin
            carry_in=1'b0;
        end else begin
            carry_in=1'b1;
        end 
    end


    full_adder add1 (final_sum[0],c[0],data0[0],data1[0],carry_in,mode);
    
    generate
        for (i=1;i<=6;i=i+1) begin
           full_adder add (final_sum[i],c[i],data0[i],data1[i],c[i-1],mode); 
        end
    endgenerate

    full_adder add8 (final_sum[7],final_carry_out,data0[7],data1[7],c[6],mode);

    assign overflow = final_carry_out^c[6];

endmodule