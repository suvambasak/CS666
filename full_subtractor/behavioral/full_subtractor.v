`timescale 1ps/1ps

module full_subtractor (
    d,
    bo,
    a,
    b,
    bi
);

    input a,b,bi;
    output reg d,bo;

    always @(*) begin
       d = a^b^bi;
       bo = ((~a)&b)|(~(a^b)&bi);
    end
    
endmodule