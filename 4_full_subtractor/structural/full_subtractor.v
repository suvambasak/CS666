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

    wire abar,v1bar,v2,v3,v1;

    not g4(abar,a);
    not g3(v1bar,v1);
    xor g1(v1,a,b);
    xor g2(d,v1,bi);
    and g5(v2,abar,b);
    and g6(v3,v1bar,bi);
    or g7(bo,v2,v3);

endmodule