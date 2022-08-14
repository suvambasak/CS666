`timescale 1ps/1ps
`include "half_adder.v"

module half_adder_test;

    // input
    reg a;
    reg b;

    // output
    wire s;
    wire c;

    // instantiate
    half_adder uut (
        .s(s),
        .c(c),
        .a(a),
        .b(b)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,half_adder_test);
        a = 1'b0;
        b = 1'b0;
        #2 a=1'b0; b=1'b1;
        #2 a=1'b1; b=1'b0;
        #2 a=1'b1; b=1'b1;
    end

    initial $monitor("time=%g,s=%b,c=%b,a=%b,b=%b",$time,s,c,a,b);
    initial #10 $finish;
endmodule
