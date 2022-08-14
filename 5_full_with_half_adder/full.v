`timescale 1ps/1ps
`include "half.v"

module full_adder (s,co,a,b,ci);

    input a,b,ci;
    output s,co;

    wire t,k;

    half v1(t,c,a,b);
    half v2(s,k,t,ci);
    or(co,k,c);
endmodule