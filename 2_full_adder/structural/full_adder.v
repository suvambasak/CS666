`timescale 1ps/1ps

module full_adder (
    output s,co,
    input a,b,c
);
    wire t1,t2,k;

    xor g1(s,a,b,c);
    xor g2(k,a,b);

    and (t1,a,b);
    and (t2,k,c);

    or (co,t1,t2);
endmodule