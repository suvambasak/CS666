`timescale 1ps/1ps
`include "full_adder.v"


module full_adder_test;
    reg i0,i1,carry_in,mode;
    wire sum,carry_out;

    full_adder uut(
        .sum(sum),
        .carry_out(carry_out),
        .i0(i0),
        .i1(i1),
        .carry_in(carry_in),
        .mode(mode)
    );


    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,full_adder_test);

        i0=1'b0;
        i1=1'b0;
        carry_in=1'b0;
        mode=1'b1;
    end

    always #1 i0=i0+1'b1;
    always #2 i1=i1+1'b1;

    initial $monitor($time,"i0=%b,i1=%b | sum=%b, carry_out=%b",i0,i1,sum,carry_out);
    initial #10 $finish;

endmodule