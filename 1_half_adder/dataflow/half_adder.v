`timescale 1ps/1ps

module half_adder (
    s,
    c,
    a,
    b
);

    input a,b;
    output s,c;

    assign s=a^b;
    assign c=a&b;
    
endmodule