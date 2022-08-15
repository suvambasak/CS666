`timescale 1ps/1ps
`include "full_adder.v"

module adder (final_sum, final_carry_out, overflow, data0, data1, mode);
    output [7:0] final_sum;
    output final_carry_out, overflow;

    wire [6:0] c;
    reg carry_in=1'b0;

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
    full_adder add2 (final_sum[1],c[1],data0[1],data1[1],c[0],mode);
    full_adder add3 (final_sum[2],c[2],data0[2],data1[2],c[1],mode);
    full_adder add4 (final_sum[3],c[3],data0[3],data1[3],c[2],mode);
    full_adder add5 (final_sum[4],c[4],data0[4],data1[4],c[3],mode);
    full_adder add6 (final_sum[5],c[5],data0[5],data1[5],c[4],mode);
    full_adder add7 (final_sum[6],c[6],data0[6],data1[6],c[5],mode);
    full_adder add8 (final_sum[7],final_carry_out,data0[7],data1[7],c[6],mode);

    assign overflow = final_carry_out^c[6];

endmodule