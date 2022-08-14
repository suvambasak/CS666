`timescale 1ps/1ps
`include "full_adder.v"

module adder (s,co,a,b,ci);
    output [3:0]s;
    output co;

    wire [2:0] c;

    input [3:0] a,b;
    input ci;

    full_adder add1(s[0],c[0],a[0],b[0],ci);
    full_adder add2(s[1],c[1],a[1],b[1],c[0]);
    full_adder add3(s[2],c[2],a[2],b[2],c[1]);
    full_adder add4(s[3],co,a[3],b[3],c[2]);

endmodule