`timescale 1ps/1ps
`include "full_subtractor.v"

module full_subtractor_test;

    // input
    reg a;
    reg b;
    reg bi;

    // output
    wire d;
    wire bo;

    // instantiate
    full_subtractor uut (
        .d(d),
        .bo(bo),
        .a(a),
        .b(b),
        .bi(bi)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,full_subtractor_test);
        
        a = 1'b0;
        b = 1'b0;
        bi = 1'b0;
    end
    
    always #4 a=a+1'b1;
    always #2 b=b+1'b1;
    always #1 bi=bi+1'b1;
    

    initial $monitor("d=%b,bo=%b,a=%b,b=%b,bi=%b",d,bo,a,b,bi);
    initial #20 $finish;
endmodule
