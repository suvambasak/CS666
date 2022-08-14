`timescale 1ps/1ps
`include "adder.v"

module adder_test;
    reg[3:0] a;
    reg[3:0] b;
    reg ci;

    wire[3:0] s;
    wire co;

    adder uut(
        .s(s),
        .co(co),
        .a(a),
        .b(b),
        .ci(ci)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,adder_test);
        
        a = 4'b0000;
        b = 4'b0000;
        ci = 0;
    end

    always #1 b = b+1'b1;
    always #2 a = a+1'b1;

    initial $monitor($time,"a=%b,b=%b,ci=%b | s=%b,co=%b,",a,b,ci,s,co);
    initial #100 $finish;

endmodule