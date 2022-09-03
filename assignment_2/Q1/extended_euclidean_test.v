`timescale 1ps/1ps
`include "extended_euclidean.v"

module extended_euclidean_test;
    reg[7:0] prime, a;
    reg clk;

    wire[7:0] a_inverse;

    extended_euclidean uut (
        .a_inverse(a_inverse),
        .prime(prime),
        .a(a),
        .clk(clk)
    );

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0,extended_euclidean_test);

        clk=1'b0;

        prime=8'b00000101;
        a=8'b00000011;

        // prime=8'b00001101;
        // a=8'b00001011;
    end


    initial $monitor(" clk=%b, prime=%b, a=%b | a_inverse=%b ", clk, prime, a, a_inverse);
    always #1 clk=!clk;
    initial #30 $finish;


endmodule