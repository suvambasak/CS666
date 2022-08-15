`timescale 1ps/1ps
`include "dff.v"

module dff_test;
    reg d;
    reg clk;
    reg clear;

    wire q;
    wire qbar;

    dff uut(
        .q(q),
        .qbar(qbar),
        .d(d),
        .clk(clk),
        .clear(clear)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,dff_test);

        d=1'b0;
        clk=1'b0;
        clear=1'b1;
    end

    always #10 d=d+1'b1;
    initial #90 clear=1'b0;
    always #3 clk=!clk;

    initial $monitor($time," d=%b, clk=%b, clear=%b | q=%b, qbar=%b",d,clk,clear,q,qbar);
    initial #100 $finish;

endmodule