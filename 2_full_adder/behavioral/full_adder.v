`timescale 1ps/1ps

module full_adder (
    output reg s,co,
    input a,b,c
);
    always @(*) begin
       s = a^b^c;
       co = (a&b)|(b&c)|(a&c);
    end
endmodule