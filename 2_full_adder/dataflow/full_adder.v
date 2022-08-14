`timescale 1ps/1ps

module full_adder (
    output s,co,
    input a,b,c
);
    assign s = a^b^c;
    assign co = (a&b)|(b&c)|(a&c);
endmodule