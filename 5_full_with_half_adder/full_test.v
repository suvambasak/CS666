`timescale 1ps/1ps
`include "full.v"


module full_test;

    reg a;
    reg b;
    reg ci;

    wire s;
    wire co;

    full_adder uut(
        .s(s),
        .co(co),
        .a(a),
        .b(b),
        .ci(ci)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,full_test);

        a = 1'b0;
        b = 1'b0;
        ci = 1'b0;
    end

    always #4 a=a+1'b1;
    always #2 b=b+1'b1;
    always #1 ci=ci+1'b1;

    initial $monitor($time,"a=%b,b=%b,ci=%b | s=%b,co=%b,",a,b,ci,s,co);
    initial #100 $finish;

endmodule