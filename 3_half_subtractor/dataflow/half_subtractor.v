`timescale 1ps/1ps

module half_subtractor (
    d,
    bo,
    a,
    b
);

    input a,b;
    output d,bo;

    assign d = a^b;
    assign bo = (~a)&b; 
    
endmodule