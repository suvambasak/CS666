`timescale 1ps/1ps

module half_subtractor (
    d,
    bo,
    a,
    b
);

    input a,b;
    output d,bo;

    wire abar;

    xor(d,a,b);
    not(abar,a);
    and(bo,abar,b); 
    
endmodule