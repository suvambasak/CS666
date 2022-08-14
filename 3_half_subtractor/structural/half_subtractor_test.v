`timescale 1ps/1ps
`include "half_subtractor.v"

module half_adder_test;

    // input
    reg a;
    reg b;

    // output
    wire d;
    wire bo;

    // instantiate
    half_subtractor uut (
        .d(d),
        .bo(bo),
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

    initial $monitor("time=%g,d=%b,bo=%b,a=%b,b=%b",$time,d,bo,a,b);
    initial #10 $finish;
endmodule
