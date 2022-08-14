`timescale 1ps/1ps

module full_subtractor (
    d,
    bo,
    a,
    b,
    bi
);

    input a,b,bi;
    output d,bo;

    assign d = a^b^bi;
    assign bo = ((~a)&b)|(~(a^b)&bi);

endmodule