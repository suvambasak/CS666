`timescale 1ps/1ps

module half_subtractor (
    d,
    bo,
    a,
    b
);

    input a,b;
    output reg d,bo;

    always @(*) begin
        d = a^b;
        bo = (~a)&b; 
    end
endmodule