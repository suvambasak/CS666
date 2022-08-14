`timescale 1ps/1ps

module half_adder (
    s,
    c,
    a,
    b
);

    input a,b;
    output s,c;

    xor(s,a,b);
    and(c,a,b);
    
endmodule